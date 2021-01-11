Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF22F1ABE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835B66E110;
	Mon, 11 Jan 2021 16:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBB66E110
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:18:24 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id z9so61932qtn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xhOQxNsV2il5IcGG2+Pj+mgc5E5N2v3HzSDbkiCiFrg=;
 b=KMn8a/l2uWt00jFzBeo+h32jG1PlJ+l6d2C+46a7JdaMn0O9w2kIh3Vnq84V3CCiYP
 FzQoblPAzRiCDHBIQES204zMoXppyb9Cz+W0kiN31qx+i0G1ir9pyyY0Zbmx9odzIp6v
 9fTRujY4s/JEgS9ppFtmnzkDfA7y2BuQddLlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xhOQxNsV2il5IcGG2+Pj+mgc5E5N2v3HzSDbkiCiFrg=;
 b=AXR4Q0WA4IyThG9j1G6S0bDaKSw5J85Cv42sLRAJXe0SVJBmnh3kN3Tf7YA7K82TTb
 zDrxoKOSkb4dUuya/7mhNWfkM52ZDCrGuu0wGRrH9eGGGbZo+nBdYat8HijJDVIzlv6Z
 swloBLuCXZWcsIdvYJlOUwtRZIfoo3f1/U2RVCe8C3zaPMFXw6kqRwNelomWgDksXfqN
 2VbbMzioWbtE5EZogN2PGfVvZmy/AdrxJ9MFVw31WX8O54g7/arMPLg+BnsfMr9tEPjt
 8+PS/ugjcywXnrICl7KxeVS4aT0qGLoRQ4pdAP67AxxEuN07bZVR9tJtqYhhIrjQGsp3
 tWgA==
X-Gm-Message-State: AOAM533is8u8PccIUfjN5/kh50Sz4auq3BWE4W+eMyjwvyiGKSaga3m0
 Q9RawR9lrokQVttvZxYfVtLIuZpip98tzw==
X-Google-Smtp-Source: ABdhPJy8rJAsidecygc3AfqhVTfMzL4iHFzEhRAJjKvoX94D6vPKrXUh5cIINZ19+atv35yObrXs6Q==
X-Received: by 2002:ac8:7a95:: with SMTP id x21mr307335qtr.307.1610381902525; 
 Mon, 11 Jan 2021 08:18:22 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id i129sm106902qkd.114.2021.01.11.08.18.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 08:18:20 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id f13so304210ybk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:18:20 -0800 (PST)
X-Received: by 2002:a25:d3c8:: with SMTP id e191mr751769ybf.234.1610381899962; 
 Mon, 11 Jan 2021 08:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20210109130951.3448435-1-heiko@sntech.de>
In-Reply-To: <20210109130951.3448435-1-heiko@sntech.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jan 2021 08:18:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W461Qh8zDYL8aHKfcLp-1uZzgZRJ9HgpJ2Opmckf2mjA@mail.gmail.com>
Message-ID: <CAD=FV=W461Qh8zDYL8aHKfcLp-1uZzgZRJ9HgpJ2Opmckf2mjA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: add bus-format and
 connector-type to Innolux n116bge
To: Heiko Stuebner <heiko@sntech.de>
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
Cc: David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jan 9, 2021 at 5:10 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>
> The Innolux n116bge panel has an eDP connector and 3*6 bits bus format.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 ++
>  1 file changed, 2 insertions(+)

This looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
