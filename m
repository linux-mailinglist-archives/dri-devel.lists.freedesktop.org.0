Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD4D1D8633
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 20:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3654F6E478;
	Mon, 18 May 2020 18:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806936E478
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 18:23:58 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id 14so2237666uaq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=66BENZkKJdscrKXw0ODwzFcr1IXdRBxhdFQSFMOWssw=;
 b=BbisGLjf3FNDMjbQcmYHxKKASqShM9Q38fh+ZAm2fNnRRbEZE92f5+zgkfkWsT6lzP
 Y6UYWsK2IzFEBWi0s8uR39LnFO7d6cgo+9iao9K8JC9jHGO0f5tSauFodWvkfSjYOpST
 bff0D8UDAWveJEHNLUFT1N2rh+cvyKIZNzXVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66BENZkKJdscrKXw0ODwzFcr1IXdRBxhdFQSFMOWssw=;
 b=W2hQMNHeZ4IK8UphCz/QYbGoWwc6Vn5LjORRal2IAhXMEeYkd5R8ebvaw4l2qKzpIj
 689FOXFZ2OWEyEvLK7sBz1TztU0LMVow196fPVDRCRFpE5vxkTfFZMirVqflCk4KjXAc
 bGbW0biq2KVeBLllQdlvaQdNB8mpdMTZly2kHGkdGYyNX1Fs3FUTF94jTZ6JihD02R5B
 KAEH0iYaNgbBX8jrwsFJRA0iay5z6c9qZBv8qTfl20U6O8Pom7qUA3qkWVcH10ASgjTh
 1jgX6rAztBq16985TWcTHcnubc75iQtVF+/XoOGICxxef7akMZmH3ISXPzqf1jKMWsSi
 Qhtw==
X-Gm-Message-State: AOAM530oFinwf5aYkGpShyUfGb/TtKHbEmLU4w6WFkISahm23njRiA+u
 F63XEQgTqneCqpdj3Yx6EiPyM99Mjm8=
X-Google-Smtp-Source: ABdhPJyBxkEwo/KIUDrYDdRRMQOXE2cThw4gslzZPNryPm6Fq8k1VeDSJ6sd9c5/Zq4NPgIWUywYuw==
X-Received: by 2002:a9f:2642:: with SMTP id 60mr12811966uag.68.1589826236941; 
 Mon, 18 May 2020 11:23:56 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id d34sm3100992uad.14.2020.05.18.11.23.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 11:23:56 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id 1so6192064vsl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:23:55 -0700 (PDT)
X-Received: by 2002:a67:e952:: with SMTP id p18mr5212098vso.73.1589826235405; 
 Mon, 18 May 2020 11:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
 <CAF6AEGs0qpzgGW8rYdmFqKW=QBbRxxzCWjO0LXsbm6hA0AJNyQ@mail.gmail.com>
In-Reply-To: <CAF6AEGs0qpzgGW8rYdmFqKW=QBbRxxzCWjO0LXsbm6hA0AJNyQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 May 2020 11:23:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQ2HtnWFyhachm9QyhkXVhMzRoiR=rWbmukmVYciL3Gw@mail.gmail.com>
Message-ID: <CAD=FV=WQ2HtnWFyhachm9QyhkXVhMzRoiR=rWbmukmVYciL3Gw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock
 choice
To: Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sam,

On Fri, May 15, 2020 at 2:49 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 4, 2020 at 9:32 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > If the rate in our table is _equal_ to the rate we want then it's OK
> > to pick it.  It doesn't need to be greater than the one we want.
> >
> > Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

...and I think this is the last of the patches I stupidly didn't CC
you on that's ready to go.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
