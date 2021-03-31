Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7805A3504E0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 18:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A266EB10;
	Wed, 31 Mar 2021 16:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A436EB11
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 16:43:19 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 7so19961861qka.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VO+UUFNdki+F7xgaS2mK6aIBg7EST205oZYqbmljPz0=;
 b=hJ5Ug+Pyr8mj+ETexnOPGtlGqIF72PVbEoX6nARIHgLbRfNVoOsorpNYDzXcrvjHZ0
 HWDL2DOKo3VlO7/+6109vHwy15UC6IiiknGKCjWPkF1RwpL6wyPoFUsQo5DDz/fHwhLp
 r/Ur43R+d5yVjMN6SXQZRnBeyt4M9Z/8sgRk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VO+UUFNdki+F7xgaS2mK6aIBg7EST205oZYqbmljPz0=;
 b=CmGp5OJWvqSN5CWbss7SvcSId7BPyWXiWwZ+prvhQRN4W5ConAjd7yz6Wz6eHTbnJT
 OJBkb0LGpZo5mZEZk8UnyCMZcim+DJL5zP3hIo6dAd6gbLArPCe/+fnNLGs0Zs9AYQdW
 3tqderGic7WDvvKl6S4rcOSt3xIBdcRJLaKrcjPW6Zo0oTPMrZ2uCZBGdrKGxbqoDvqs
 vyfZVcnRhqG2jsZr4ihgb04kBWm8JYL1ximMGr3hGL1cB/uDaVP+IkksqO9bX+Dt2n1j
 PI5CvzZa6F8yY6LvArg4qX+32u24sMOjge3QgzvV4U9FT8utdtn0G3NjflFcQEmqrARq
 FZ7Q==
X-Gm-Message-State: AOAM53194t/3g9Zbd6pi2vlFTXwisu3zdsEXTVVNBXTRX97poMnC1+X/
 uY+5bRo9sYQ/6U2RPcAYleiGT2oI05yfOA==
X-Google-Smtp-Source: ABdhPJzuDkQGbIMRYWfGBcaEqw7wNlKVN9Q2/45tnBv0bLwk9RY9HXszMtNoKdM3UGFc4wvBVYULuA==
X-Received: by 2002:ae9:edc1:: with SMTP id c184mr3868473qkg.453.1617208998329; 
 Wed, 31 Mar 2021 09:43:18 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id p66sm1855069qka.108.2021.03.31.09.43.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 09:43:17 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id a143so21835835ybg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:43:17 -0700 (PDT)
X-Received: by 2002:a25:8712:: with SMTP id a18mr162712ybl.79.1617208996943;
 Wed, 31 Mar 2021 09:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025417eucas1p29eca41bbcfc2550902cee87fd44b98e4@eucas1p2.samsung.com>
 <20210329195255.v2.5.I1a9275ffbde1d33ad7a3af819f5fbc0941b7ee02@changeid>
 <00fc2110-d30a-d8f2-b22b-a5c73b54127d@samsung.com>
In-Reply-To: <00fc2110-d30a-d8f2-b22b-a5c73b54127d@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 09:43:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9uMpPbXxoNd2DpvtX=nEb1RFdbZ5bV8ZGhNpOVMJtOg@mail.gmail.com>
Message-ID: <CAD=FV=V9uMpPbXxoNd2DpvtX=nEb1RFdbZ5bV8ZGhNpOVMJtOg@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/bridge: ti-sn65dsi86: Move MIPI detach() /
 unregister() to detach()
To: Andrzej Hajda <a.hajda@samsung.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 2:53 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> > The register() / attach() for MIPI happen in the bridge's
> > attach(). That means that the inverse belongs in the bridge's
> > detach().
>
>
> As I commented in previous patch, it would be better to fix mipi/bridge
> registration order in host and this driver.
>
> Have you considered this?

Fair enough. How about I drop this patch at the moment? My series
already has enough stuff in it right now and I don't believe anything
in the series depends on this patch.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
