Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779654B417
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666E1121CC;
	Tue, 14 Jun 2022 15:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A423112242
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 15:02:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bg6so17861812ejb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qEvV+K7h78IrrWm/FN3c6DSIfPA/kja7ITdLuhhXDM=;
 b=s9dTt3YLQTi/1onCJ4FhWhz4svH+4PynCdcqNNR9nIBlfLE3vVJzs/VxvxaD5C5NBv
 fyAEdItFnfO2BfHgng53YIGfwxZ14VcW/LZJSszrRxd+87ZWZBz9ImRrDfivizIMy/gr
 cmN+Ua2coRFWparoOH7rWptQmLcoUQmdfgnAJYUA8+jpODXsRBVEfezy2M49ZC1Gi6bS
 OnD0i9fXopufIM5/uLJi1g6dgvcRaeQ2+lvFcrVbZEFzevkV/uiItBIbUbSJF+Q7+RGj
 1TF2mBcNdkkQiLytLK0RZYvUCPhI1ve1xfSmtmUUy4TAbJQ5TUxmVj8mZ7PsVvujQVWI
 RxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qEvV+K7h78IrrWm/FN3c6DSIfPA/kja7ITdLuhhXDM=;
 b=ZkFOmcVwygDA/J+WYJDxt8VYYGOOidhZRfBcf2b2OnMfdlRqdq3s8bAvrVp4zKG8qH
 B5Xz65ArD/s1sgup9rG+ozEXYaa1H50+KIQuTOT/8OlsTyhkhbv3SwqauCPe9PvrXUmR
 ZtgdZSF6vvmU5X/jxjYzHPuC6E65t/ji1tCqroGNqO8UjeLotlrO0n5MjiQAb6me01IJ
 o4wfgo0Dp0LWeA3x59vZcN48NRCUKo1in7PGMjIbLvHLBSfyjlBtZCM3x2RY1PQm8uKX
 gC22gGNSe+H24Kix9YLJGEdV3pODGEKq6zzJ0psXfShPgyG71zUq2VBxtAfpETmYmOn0
 rX3A==
X-Gm-Message-State: AJIora+xlgHfeVeq/6QArNufYbrr3tPYhgFo4AFM0ZQTRSXXHrHbWZzK
 3Mh4E9Xtg1JWF4+OEBe5f02c1qNJaaDWf6yMDopocQ==
X-Google-Smtp-Source: AGRyM1sNdVzjpM8114hd5xbyXM7o2F4RbqxzGa5CkA5O5FXGNZg37zJPZMw8ocJAxo8tXJqg+QnfJ4bEpnS0DnARWyw=
X-Received: by 2002:a17:906:5055:b0:6ff:1dfb:1e2c with SMTP id
 e21-20020a170906505500b006ff1dfb1e2cmr4722393ejk.200.1655218945863; Tue, 14
 Jun 2022 08:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-13-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-13-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 16:02:10 +0100
Message-ID: <CAPY8ntCUQjr_K-d7eOv_3Z+h362MFo9z9Q-6MBfMv==tDeKV6A@mail.gmail.com>
Subject: Re: [PATCH 12/64] drm/vc4: Call component_unbind_all()
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
> While we were using the component framework to deal with all the DRM
> subdevices, we were not calling component_unbind_all().
>
> This leads to none of the subdevices freeing up their resources as part of
> their unbind() or device managed hooks.
>
> Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 14 ++++++++++++--
>  drivers/gpu/drm/vc4/vc4_drv.h |  1 +
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 162bc18e7497..031f2cdd658d 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -209,6 +209,13 @@ static void vc4_match_add_drivers(struct device *dev,
>         }
>  }
>
> +static void vc4_component_unbind_all(void *ptr)
> +{
> +       struct vc4_dev *vc4 = ptr;
> +
> +       component_unbind_all(vc4->dev, &vc4->base);
> +}
> +
>  static int vc4_drm_bind(struct device *dev)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
> @@ -230,6 +237,7 @@ static int vc4_drm_bind(struct device *dev)
>         vc4 = devm_drm_dev_alloc(dev, &vc4_drm_driver, struct vc4_dev, base);
>         if (IS_ERR(vc4))
>                 return PTR_ERR(vc4);
> +       vc4->dev = dev;
>
>         drm = &vc4->base;
>         platform_set_drvdata(pdev, drm);
> @@ -276,6 +284,10 @@ static int vc4_drm_bind(struct device *dev)
>         if (ret)
>                 return ret;
>
> +       ret = devm_add_action_or_reset(dev, vc4_component_unbind_all, vc4);
> +       if (ret)
> +               return ret;
> +
>         ret = vc4_plane_create_additional_planes(drm);
>         if (ret)
>                 goto unbind_all;
> @@ -296,8 +308,6 @@ static int vc4_drm_bind(struct device *dev)
>         return 0;
>
>  unbind_all:
> -       component_unbind_all(dev, drm);
> -
>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 15e0c2ac3940..aa4c5910ea05 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -73,6 +73,7 @@ struct vc4_perfmon {
>
>  struct vc4_dev {
>         struct drm_device base;
> +       struct device *dev;
>
>         unsigned int irq;
>
> --
> 2.36.1
>
