Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F854B6C0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D711291E;
	Tue, 14 Jun 2022 16:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8094411291E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:51:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id eo8so4278637edb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CjRQ5iWj+9ifJwDfCV+Phd9FA1H4aI0FGZRmxi9NFo=;
 b=YMJzH7gv1/G4Qbu9ByTLjyzbjaocjwFamqPn5wR+nsoJDKS6NfWAdiIbagrCTaPJt5
 nPvMbAWdPsnY1sdV1hYCD9U3uQdkRRvdozpCCnzYEJ2TyFmCXt+2gN2Jjn2O4Hh4G3Nk
 kv9L0NnilDV4RRiQ0JQMlfumwTZv1DxrFiDm2lkn3ZPm2dRyAIHl/1x5zP0W6jDIXvje
 TbJQHPXaJdGTwskwUmjQZ7ZRFfmNP+pxhCgGisAPwz4PFIeZ+AtFd/b9kSfGkFrRdjwu
 fsvM2CHXXzaWybdYIihDWt1obRbi7mz7pqH8Ws2g12R/8F/iESF2qKMvRwtCWcsqhNvG
 nFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CjRQ5iWj+9ifJwDfCV+Phd9FA1H4aI0FGZRmxi9NFo=;
 b=PMRDN+XZtJec8+Jo6IT0AaT+YmY027jb109mLNG2qIrOewvpFpPS6yibPnU7RbSWu9
 uF8vrgf4JF1qlO/TfuF+rGkqugttyBsgGbEjJWs+tJYLdn/0/E/3bTfZPjoiD+eTLfwl
 I9m0gNmZenRoqkGeLdAA7q7HVgRjbAZPuOraUduHP4InKwR0eSWX6mmdK1FLaQ1l3tFF
 xBGox3xvZbvcIxm5iKS6JnnFPF/jWYIIykf3CECFvzcawoSTqSBfAQmW4V0kNl8ePpsu
 aY5ADtmCWZBhy3XNvYouQtjE7Fy1WUBWs+TmkOjk/zsO2TAR5ajO2knYM+Ap5RYHkCOm
 zdBA==
X-Gm-Message-State: AOAM532432t93dPMx6PZPAdtprjy/PllUJssglulgmwhahs9aktJBcQX
 2+xWnqkr4TCQteLWwrLLY+pmyb5y+cGac/f4AA48cw==
X-Google-Smtp-Source: ABdhPJw141rPEFCoikT7ErpjjaeVSQnc5tMKJIINtuWWnmbbMMBU9bTaSGTkXU+9FQMB4xk7UZ3j+alUhDg35LYNvyM=
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr7239387edc.86.1655225509955; Tue, 14
 Jun 2022 09:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-27-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-27-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:51:34 +0100
Message-ID: <CAPY8ntCE5b1hitR03Uhsk22idn1pQrb41F7Akt8J8JFKT1c3GA@mail.gmail.com>
Subject: Re: [PATCH 26/64] drm/vc4: dpi: Switch to DRM-managed encoder
 initialization
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
> The current code will call drm_encoder_cleanup() when the device is
> unbound. However, by then, there might still be some references held to
> that encoder, including by the userspace that might still have the DRM
> device open.
>
> Let's switch to a DRM-managed initialization to clean up after ourselves
> only once the DRM device has been last closed.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index 4e24dbad77f2..8a50de2c40d9 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -296,35 +296,25 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 return ret;
>
> -       drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
> +       ret = drmm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
> +       if (ret)
> +               return ret;
> +
>         drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
>
>         ret = vc4_dpi_init_bridge(dpi);
>         if (ret)
> -               goto err_destroy_encoder;
> +               return ret;
>
>         dev_set_drvdata(dev, dpi);
>
>         vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
>
>         return 0;
> -
> -err_destroy_encoder:
> -       drm_encoder_cleanup(&dpi->encoder.base);
> -       return ret;
> -}
> -
> -static void vc4_dpi_unbind(struct device *dev, struct device *master,
> -                          void *data)
> -{
> -       struct vc4_dpi *dpi = dev_get_drvdata(dev);
> -
> -       drm_encoder_cleanup(&dpi->encoder.base);
>  }
>
>  static const struct component_ops vc4_dpi_ops = {
>         .bind   = vc4_dpi_bind,
> -       .unbind = vc4_dpi_unbind,
>  };
>
>  static int vc4_dpi_dev_probe(struct platform_device *pdev)
> --
> 2.36.1
>
