Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8771854B579
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0E510FFEF;
	Tue, 14 Jun 2022 16:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A605F10FFEF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:11:26 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id me5so18183601ejb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CeoLx7VfaW7v2qJ02+sYigXPi07kR4ZJyts6WoBHx98=;
 b=jcaoNxaxy6TUsIIAaR+i45ajFrpk8/lAguAC7gY3JzqkozGTTV8U4jkDIewpygviBW
 gMfuIOy/iM1n6IRcOXRZCaDY1V7JRGo27s0lZM+GKegjOBEOyDvgr2VOcYfZkPuW7ym1
 SR3mcbp1+eobPYj93myKunpKsQ60cI7OC45xMb/SwmhQlRM2R9rm8fbm6jGiVAhkyMG4
 vwUgD78Nke6zJR/BoDYoC1Fon6msvxVHhio0jecOQ/brivi5g5peTny1G7GxgltdY4kk
 OCJXRxZ0I8M76YokJofxktlj9L/GfRG80rxtqgRDcKt96DuQgAIS8p0oGRcJ9hiDZbSt
 x2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CeoLx7VfaW7v2qJ02+sYigXPi07kR4ZJyts6WoBHx98=;
 b=Evawarz4ZF32Yr11BrFnCxZZmm+btt631dVwKtlG8bKsw3ZROHDhUYJ1hfazsejoJb
 XcsgRu8KPyHwbnP1+rVyff0CCnju1Wc7efYIhmyh0pZT3RKEFgvj2J3hstfWaNODk/HE
 hBZKlA3nvMvhKAkG26KgTUGmnfwxVRU8mf4uaV/PvuzEOv+DshVEJ3MVL/pStUte/xdW
 jmUKY8udKa6JPM63iutHmpwL7DxZy33MOZBjFyQYdsidXlxf8iDKsMFWED0JasYCL+CS
 TOJvRsixOoxGidwSTXGNYYi0KhYLOzkh9IdqCxpsbAPOVZIr+MyMGp+wlPmhl5KQYSN4
 vnPA==
X-Gm-Message-State: AJIora8NzB6A2hw6lmOXvyBmzso7jHmRcTUPTKaxiIKbGR6toyOsaScx
 zDWpXilnRjf77lCdqbKkG7QlOiQ9TYRZEczGqxVraBwMdjDKqmzQ
X-Google-Smtp-Source: AGRyM1tFOW43b4HSlcbmOf7F5dXbXHHIyHWIGSPV6IRzw33G3lcM3oejg3DkikTl2Smuke2MUyMOa/YQK06hRyN5Pxg=
X-Received: by 2002:a17:906:5055:b0:6ff:1dfb:1e2c with SMTP id
 e21-20020a170906505500b006ff1dfb1e2cmr5002677ejk.200.1655223085064; Tue, 14
 Jun 2022 09:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-23-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-23-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:11:09 +0100
Message-ID: <CAPY8ntCYTVdeqRaWQEmt-W=spNNGjJ+SmGRuNiH_Zho_w0Ag2w@mail.gmail.com>
Subject: Re: [PATCH 22/64] drm/vc4: dpi: Switch to drmm_kzalloc
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Our internal structure that stores the DRM entities structure is allocated
> through a device-managed kzalloc.
>
> This means that this will eventually be freed whenever the device is
> removed. In our case, the most like source of removal is that the main
> device is going to be unbound, and component_unbind_all() is being run.
>
> However, it occurs while the DRM device is still registered, which will
> create dangling pointers, eventually resulting in use-after-free.
>
> Switch to a DRM-managed allocation to keep our structure until the DRM
> driver doesn't need it anymore.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index c88e8e397730..d1eaafb43bd1 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -244,9 +244,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>         struct vc4_dpi *dpi;
>         int ret;
>
> -       dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
> +       dpi = drmm_kzalloc(drm, sizeof(*dpi), GFP_KERNEL);
>         if (!dpi)
>                 return -ENOMEM;
> +
>         dpi->encoder.type = VC4_ENCODER_TYPE_DPI;
>         dpi->pdev = pdev;
>         dpi->regs = vc4_ioremap_regs(pdev, 0);
> --
> 2.36.1
>
