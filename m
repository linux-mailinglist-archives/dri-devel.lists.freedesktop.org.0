Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C246AFFF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 02:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1006573814;
	Tue,  7 Dec 2021 01:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F86732D8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 01:44:17 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id f9so36483166ybq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 17:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JrU3KhtTgg381kj17PJrqccz0ypSCPSlO0sRdaZRzPg=;
 b=Nug4pPs9k6ecc/x/AL5gLUAspwxwOHkJOqReCL5hPRhvzCKYIhF0gWoHfIXobPwrMt
 igNZY/6Lkg4pIH8gm0d+8x6cx/y/V3NOBd9Cc48Prd/joFqf7+AJ36vvzlo5wCfca+jO
 u6wtbs4t3E9qqM6LZfN0LoWp5fGGSXGlx5Mog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JrU3KhtTgg381kj17PJrqccz0ypSCPSlO0sRdaZRzPg=;
 b=0HeOD8wIqTIPC9nypue/Z6wkq+tXEOlchzf/KUpRRCs9vG/67pMFv/jRgCeHG6pWy7
 er1XGqk8PLiKceXP4fxtYI4Fn4RAnD3avBl9x6IelFpKSrYyXfj+MGoEvULkQRtD2bjY
 +rMXy21XA7XCCiCdD1eVNa47m8YQRJCfq1lRHimoGyQBo6On1LuyUNKZ69rWYMhwC/IC
 Dcp+z9t4UZJH9oEcFwecG5ounefTyMqWiqulIFGzPQqxCn0Za5zVy9VtyS4ed0zLjn/C
 54jtwiAP8ZaLd3Ma1kEJesKoKKAk3GAn6nDeSIiO7ySGXxI2rX5dVbDLnrRgky5hc42n
 K1qA==
X-Gm-Message-State: AOAM533Lt8B6GF5iu9g4/65isV/o/n4zePNwGejfvJ72WmArZc4QVPrQ
 Zz0bNH8rB/mWEUakiStywmIckrx9BHEut0V+HOwxEw==
X-Google-Smtp-Source: ABdhPJxSgV6Tsffy+vfKun4mMv3o3NKstkB0DXF9fTRCw88ysIZ8VhEzI6QFuoT8dOek5FGvtAL6j+2jHDmTby4u5II=
X-Received: by 2002:a25:aea4:: with SMTP id b36mr49161795ybj.182.1638841456597; 
 Mon, 06 Dec 2021 17:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20211206162907.1.I1f5d1eba741e4663050ec1b8e39a753f6e42e38b@changeid>
In-Reply-To: <20211206162907.1.I1f5d1eba741e4663050ec1b8e39a753f6e42e38b@changeid>
From: Philip Chen <philipchen@chromium.org>
Date: Mon, 6 Dec 2021 17:44:05 -0800
Message-ID: <CA+cxXhkmsUMCCJrvbz76nx-ctzSZhg0BFb50qD3nzUon3-Gp+w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Add backpointer to drm_device
 in drm_dp_aux
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Mon, Dec 6, 2021 at 4:29 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> When we added the support for the AUX channel in commit 13afcdd7277e
> ("drm/bridge: parade-ps8640: Add support for AUX channel") we forgot
> to set "drm_dev" to avoid the warning splat at the beginning of
> drm_dp_aux_register(). Since everything was working I guess I never
> noticed the splat when testing against mainline. In any case, it's
> easy to fix. This is basically just like commit 6cba3fe43341 ("drm/dp:
> Add backpointer to drm_device in drm_dp_aux") but just for the
> parade-ps8640.
>
> Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX channel")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 26898042ba3d..818704bf5e86 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -449,6 +449,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
>         if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
>                 return -EINVAL;
>
> +       ps_bridge->aux.drm_dev = bridge->dev;
>         ret = drm_dp_aux_register(&ps_bridge->aux);
>         if (ret) {
>                 dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
> --
> 2.34.1.400.ga245620fadb-goog
>

Signed-off-by: Philip Chen <philipchen@chromium.org>
