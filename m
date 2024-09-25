Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C40D98676D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 22:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B0410E498;
	Wed, 25 Sep 2024 20:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="lMYX3sNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832B510E498
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 20:10:37 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-20551eeba95so1559115ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 13:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1727295037; x=1727899837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0Q4FugCe7sn8SMQy2y1X+wwncOJwqePtQZMDheIXf4=;
 b=lMYX3sNyyyVz1tvAmfJPpA7P+zwzOpfka+54CF9O8AibWDlgWbbI4dwieYgf0Jx5ef
 sz5Lkc68ba29mcbFaiEn/rjZSOc45mLn5oisBMh1s45TluRcWO7FKzaPPE2zZn4aD5R/
 SBRFanm8105EHS07PbekiSha4PvsvDZsSh6e1Jy2eryyyuKrMbLFXiCuItbCArdcwotD
 1H2/7z6JlLgbEeNdpQB/jwauEotKBHxjfFHrhXcrO+DPvciU8ywzf7jGZ4zRUXN6Hj0k
 JtiF/Pj0tFxW2whmqdUNBYje3WH5ec0wWltK+j2v8qj3keHZNNm42Jz0Xig0dqD1YqzE
 HwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727295037; x=1727899837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0Q4FugCe7sn8SMQy2y1X+wwncOJwqePtQZMDheIXf4=;
 b=vk/M7Cl96mpODRq2w5UkfhSFmW42Ld/wlbLvgPbgLaAJOCgb8Os13eiK4iiIHVYsU1
 aDDKkpIdUb0bQxnxEmh6DOk+rY1MDKM2uthSbk0dFNUD5NsnoBsRxSwgQI6bNwCWPV88
 tBQqaVlLz3+FAbPDyHBJY76gM0abMOjkCrsXQViVu/nZ7sYKtp3bgk8Id+/SGPd5vA7k
 G2Y7vIjCIDiXm+uxVJObFmLPvd7vsVa1HA4XvP0jgtrDBKME7urpqdO1U6UksZUnP/u8
 so+N12WrX9gbT3q7nlZy7vWAOPy7H7CMMKefoHGdCDGgQKvtLUgypVnagH2WZRmtW3GZ
 Soyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJmjUuaz/GRJZN3vkAKX5ds41WULv1SMhbOm/aEebGw7CFAW2uR2OEpRVFFRmLcWGBhBroM0GnkBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8q7dc7joHjaP4EX9FtRF9hKTSSnPe7EDt10r6+RTazvgQjYw4
 TnY6505zHaXoJ+wVSBCw0e/mp/M7llelHIiGpSMbI4ClB7F+L/P/PZ8i9JlzxL917Ybty1jMbAz
 auOAGNXnexqPaQOn+ueCs1K+ZB54=
X-Google-Smtp-Source: AGHT+IGCOWvHWEUBxGxHoNzs8SQWmesgz6UsMD49z3Jmcc4GwM6UD45zyniAE253U3751P7pVRLYxBPXbonaOjby/mw=
X-Received: by 2002:a17:902:d4c6:b0:205:7e3f:9e31 with SMTP id
 d9443c01a7336-20afc6429a0mr39006245ad.60.1727295036833; Wed, 25 Sep 2024
 13:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <bd0b8d63-f543-480e-85b4-2b8cec178c38@linaro.org>
 <20240910151600.18659-1-abelova@astralinux.ru>
In-Reply-To: <20240910151600.18659-1-abelova@astralinux.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 22:10:25 +0200
Message-ID: <CAFBinCCVL5idjip8NtDTimid+H0xmoMT1807SBj0-dFaH+hbkQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: switch to a managed drm device
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anastasia,

thank you for picking this up and apologies for my late reply.

On Tue, Sep 10, 2024 at 5:17=E2=80=AFPM Anastasia Belova <abelova@astralinu=
x.ru> wrote:
[...]
> @@ -215,7 +210,7 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
>         regs =3D devm_platform_ioremap_resource_byname(pdev, "vpu");
>         if (IS_ERR(regs)) {
>                 ret =3D PTR_ERR(regs);
> -               goto free_drm;
> +               goto remove_encoders;
can't we just return PTR_ERR(regs) here since all resources above are
now automatically free (as they are devm_* managed)?

>         }
>
>         priv->io_base =3D regs;
> @@ -223,13 +218,13 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>         res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi")=
;
>         if (!res) {
>                 ret =3D -EINVAL;
> -               goto free_drm;
> +               goto remove_encoders;
same here, can't we just return -EINVAL directly?

>         }
>         /* Simply ioremap since it may be a shared register zone */
>         regs =3D devm_ioremap(dev, res->start, resource_size(res));
>         if (!regs) {
>                 ret =3D -EADDRNOTAVAIL;
> -               goto free_drm;
> +               goto remove_encoders;
also just return -EADDRNOTAVAIL directly

>         }
>
>         priv->hhi =3D devm_regmap_init_mmio(dev, regs,
> @@ -237,18 +232,18 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>         if (IS_ERR(priv->hhi)) {
>                 dev_err(&pdev->dev, "Couldn't create the HHI regmap\n");
>                 ret =3D PTR_ERR(priv->hhi);
either return PTR_ERR(priv->hhi) here or convert the dev_err to
dev_err_probe and return it's value

> -               goto free_drm;
> +               goto remove_encoders;
>         }
>
>         priv->canvas =3D meson_canvas_get(dev);
>         if (IS_ERR(priv->canvas)) {
>                 ret =3D PTR_ERR(priv->canvas);
> -               goto free_drm;
> +               goto remove_encoders;
return PTR_ERR(priv->canvas);

>         }
>
>         ret =3D meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
>         if (ret)
> -               goto free_drm;
> +               goto remove_encoders;
meson_canvas_alloc() is the first non devm_* managed allocation.
so this is the last time we can simply "return ret;", starting with
the next error case we need goto for cleaning up resources.

>         ret =3D meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
>         if (ret)
>                 goto free_canvas_osd1;
(starting from here the goto free_... is needed and this one is
actually already correct)

> @@ -261,7 +256,7 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
>
>         priv->vsync_irq =3D platform_get_irq(pdev, 0);
>
> -       ret =3D drm_vblank_init(drm, 1);
> +       ret =3D drm_vblank_init(&priv->drm, 1);
>         if (ret)
>                 goto free_canvas_vd1_2;
>
> @@ -284,10 +279,10 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>         ret =3D drmm_mode_config_init(drm);
>         if (ret)
>                 goto free_canvas_vd1_2;
> -       drm->mode_config.max_width =3D 3840;
> -       drm->mode_config.max_height =3D 2160;
> -       drm->mode_config.funcs =3D &meson_mode_config_funcs;
> -       drm->mode_config.helper_private =3D &meson_mode_config_helpers;
> +       priv->drm.mode_config.max_width =3D 3840;
> +       priv->drm.mode_config.max_height =3D 2160;
> +       priv->drm.mode_config.funcs =3D &meson_mode_config_funcs;
> +       priv->drm.mode_config.helper_private =3D &meson_mode_config_helpe=
rs;
>
>         /* Hardware Initialization */
>
> @@ -308,9 +303,9 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
>                 goto exit_afbcd;
>
>         if (has_components) {
> -               ret =3D component_bind_all(dev, drm);
> +               ret =3D component_bind_all(dev, &priv->drm);
>                 if (ret) {
> -                       dev_err(drm->dev, "Couldn't bind all components\n=
");
> +                       dev_err(priv->drm.dev, "Couldn't bind all compone=
nts\n");
>                         /* Do not try to unbind */
>                         has_components =3D false;
>                         goto exit_afbcd;
just below this we have:
    ret =3D meson_encoder_hdmi_probe(priv);
    if (ret)
        goto exit_afbcd;
I think this is the place where we need to call component_unbind_all,
so we need some kind of "goto unbind_components;" here.
All other "goto exit_afbcd;" below will need to be converted to "goto
unbind_components;" (or whichever name you choose) as well.

Also the ordering where component_unbind_all() is incorrect. It's been
incorrect even before your patch - but maybe now is the right time to
clean it up?

I had to double check because I was surprised about the calls to
meson_encoder_{cvbs,dsi,hdmi}_remove(priv);
It turns out that it's safe to call these three functions at any time
because they only ever do something if their _probe() counterpart has
been called.



Best regards,
Martin
