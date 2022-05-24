Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F565331C9
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C86C10E239;
	Tue, 24 May 2022 19:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5441610E239
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 19:35:09 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gh17so24362594ejc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 12:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5KRQHImvI/tYSdBDQbI9GMJc2P/tsNajyqMmtD5wxo=;
 b=XE0CIXorHdxCgnuHgrTrqm4dq2TJ2M+FH4GWF8HkROFgbaeiBVLPYR7CyGfdj28odV
 QTk2uqI5KeXZ4M1G1nH//7iKOGE+BJmEaELazHotLhs4c65EO0JnIiIjVp5DXa1xO9gc
 DTZy1O06USE5xoZY3C1QoR7qK/9CcOks1vdjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5KRQHImvI/tYSdBDQbI9GMJc2P/tsNajyqMmtD5wxo=;
 b=2O9wfFXXbD2rOi307eJnUf74PZqsefHQ7iBYgXB7PQCSM2VLkGyKfq16gLkt9+RzNC
 jB9RD6ltlOZZSfWr8pDuwmnv/PtJ5hWOnn0LRZJQSeawB+KqIZ7saKIfJFB5sGtTXLn9
 6d6bgIsotBvfebzIcOJvu1BdKhPc4QIxVa6uHquaTUGozfv0ElRJ+CBCnoLco9v5Kxnl
 B7YsUDCSXg5t6sVLliK2nGuKOO/trNCeL41PP+jDDvXKXaEw7u5aFTjBV7mOlnD0CYVj
 FbPLAPySU3K2uBUMUhGXUesW8DUUjL7+2L3x9uKLiZK5B4clkLqG2MP31/1c+Yc5z3DA
 8PNA==
X-Gm-Message-State: AOAM5305Xi1Nlnx8FBi7OyHj8N+eg2Qb6p3ftbAcaAwMEtado46Dhidx
 vCSHli7vEJI3PLGuPOIBZWtyhMmlTpz8zBacwb0=
X-Google-Smtp-Source: ABdhPJwf3+QamTlfQnJHF2he5kktTzrMBVgifyfct7kU3ZIYC54rLnubdtCK3shrmokl3Xkatdr9AA==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id
 o17-20020a170906775100b006ce0e3c81a6mr24791153ejn.278.1653420907486; 
 Tue, 24 May 2022 12:35:07 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 c18-20020a1709063f1200b006fe8b456672sm7099233ejj.3.2022.05.24.12.35.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 12:35:06 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so2026631wmr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 12:35:05 -0700 (PDT)
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr5160653wmr.15.1653420905484; Tue, 24
 May 2022 12:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220523060658.737-1-gaochao49@huawei.com>
 <20220524024551.539-1-gaochao49@huawei.com>
In-Reply-To: <20220524024551.539-1-gaochao49@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 May 2022 12:34:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8==K6fA+CkmTcdLndB31vZHxsN7aBqRQocHM_rSr2iw@mail.gmail.com>
Message-ID: <CAD=FV=X8==K6fA+CkmTcdLndB31vZHxsN7aBqRQocHM_rSr2iw@mail.gmail.com>
Subject: Re: [PATCH v2 -next] drm/panel: Fix build error when
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m
To: gaochao <gaochao49@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, zhengbin13@huawei.com,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 23, 2022 at 7:46 PM gaochao <gaochao49@huawei.com> wrote:
>
> From: Gao Chao <gaochao49@huawei.com>
>
> If CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m,
> bulding fails:
>
> drivers/gpu/drm/panel/panel-samsung-atna33xc20.o: In function `atana33xc20_probe':
> panel-samsung-atna33xc20.c:(.text+0x744): undefined reference to
>  `drm_panel_dp_aux_backlight'
> make: *** [vmlinux] Error 1
>
> Let CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 select DRM_DISPLAY_DP_HELPER and
> CONFIG_DRM_DISPLAY_HELPER to fix this error.
>
> Fixes: 32ce3b320343 ("drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Gao Chao <gaochao49@huawei.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v1->v2: fix Signed-off-by name
> ---
>  drivers/gpu/drm/panel/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

The patch this is "fixing" is in mainline so theoretically this should
land in drm-misc-fixes, but it gets messy because it would need to be
adapted because commit 1e0f66420b13 ("drm/display: Introduce a DRM
display-helper module") isn't in mainline. Since this doesn't feel
urgent, I'm landing this in drm-misc/drm-misc-next.

a67664860f78 drm/panel: Fix build error when
CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m

-Doug
