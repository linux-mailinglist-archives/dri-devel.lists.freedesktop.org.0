Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF5895AEA2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1851E10E798;
	Thu, 22 Aug 2024 07:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CihiEMBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC86610E716
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 05:32:32 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3db2315d7ceso256317b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 22:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724304752; x=1724909552; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UrNcon8FxQ69dF6b3a0HOOhGowvaUdP7iX4oRD7w0ns=;
 b=CihiEMBlj7DXr7Eedbg7XqcKU3ttpNneyBvt9bcz84jIoKDDH09Z6+Q+4WYIpIwZu7
 NbiyIkyHmH+5EVDe/uDKX0/odtwevZiQCUZEIUZmNectktrXMRKAum7OYOr+CzdAF7rA
 SLXk8lZKtbqNQR16z7uE5FcCPnbHHXNxuva0rPRAHkpZDrW3PZ4z1L7mjU+LQcos7r/0
 pqcSrTdcrV9AD+OkkT71Eb8bYB7BO6b5IGYFgkcgjutiFH3is05IYQOjR3oaXK8fVMFe
 sreOBtR1aZ5HVqX6ObH692dTuXqUh22G+XZFdBljqEb2os7bNlGCbKYXcfOYqHRMe1jN
 FvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724304752; x=1724909552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UrNcon8FxQ69dF6b3a0HOOhGowvaUdP7iX4oRD7w0ns=;
 b=ebiY6KL8nxnJG/k+mfXxXto0iQBPL42gpa+yzC1TYFSu3opbYsKCWVBOApgwBlYmeV
 CWAycOvXMzjXZpv6rPIrYgSfzamHVv8dI5QdXv2o/VYwAC1mhRdbtlAHA3sy3r5JuN/f
 c6w9IflCaouqH3GdwcxfK0D0IW9YcRCAmt8/Z3m7XUeybm+1niQ/PVUbi61Q6+JH3dU8
 5JtgT0BLFKqZbMKysipdZ88fcR0lpRtmBNpC4OS16ZQgeFYaDlpj7du4KgW4OECKv97H
 SiZxBhvyBgdTY98QfPIbr8AJG+XqEaRYQ64Gg5KLkv0F+LkfXGd65DbnzjrjO/ANoGAA
 cflA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+oihcQ34FU26Ab6JTFeJKEKKPit1KRu0OnAXgOnocM+VukP+2+w83ZbrHP31ESvHRCLrNBMZnP6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuPWzoPYiDGBQagIWhQ9m7dZsaAEX9OJ1EFeYMp0iCHvpJ2r22
 iumPOfE1GSOJkIEWIENake+tcEzhzLb4Vdb5j4pwJdszLQ5bxiKDCOX8C++A+dlPT6XlOOhL7mT
 1tPljcjn8Ear4o50oPpNnfPPhf6I=
X-Google-Smtp-Source: AGHT+IF8wUe9zW9RcIEjiBnPyx9kIJJy5aif9535MDtTffLfG4WtqgzHMWlBveNmITDMjDwayfjZPgCEac3kl0Nqkbg=
X-Received: by 2002:a05:6870:3924:b0:260:f5ab:62ff with SMTP id
 586e51a60fabf-2738bebec4emr4674262fac.44.1724304751615; Wed, 21 Aug 2024
 22:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
In-Reply-To: <20240820125840.9032-1-rongqianfeng@vivo.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 22 Aug 2024 11:02:16 +0530
Message-ID: <CANAwSgR8i2BbNkQtDXTWi+kOfWtxwHe9E=sLa_8ZSU2bvTO-Yg@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:15:39 +0000
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

Hi Rong,

On Tue, 20 Aug 2024 at 18:30, Rong Qianfeng <rongqianfeng@vivo.com> wrote:
>
> Replace devm_clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled() that also disables and unprepares it on
> driver detach.
>
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 13 +++----------
>  drivers/gpu/drm/sun4i/sun6i_drc.c         | 15 ++++-----------
>  drivers/gpu/drm/sun4i/sun8i_mixer.c       | 13 +++----------
>  3 files changed, 10 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index ab6c0c6cd0e2..057dceaf079e 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -284,16 +284,11 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>                 return PTR_ERR(fsl_dev->regmap);
>         }
>
> -       fsl_dev->clk = devm_clk_get(dev, "dcu");
> +       fsl_dev->clk = devm_clk_get_enabled(dev, "dcu");
>         if (IS_ERR(fsl_dev->clk)) {
>                 dev_err(dev, "failed to get dcu clock\n");
>                 return PTR_ERR(fsl_dev->clk);

You can use dev_err_probe it will be fine in all cases for clocks.to
get enabled.
         return dev_err_probe(dev, PTR_ERR(fsl_dev->clk),
                                "failed to get duc clock\n");

Thanks
-Anand
>         }
> -       ret = clk_prepare_enable(fsl_dev->clk);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to enable dcu clk\n");
> -               return ret;
> -       }
>
>         pix_clk_in = devm_clk_get(dev, "pix");
>         if (IS_ERR(pix_clk_in)) {
> @@ -311,8 +306,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>                         div_ratio_shift, 8, CLK_DIVIDER_ROUND_CLOSEST, NULL);
>         if (IS_ERR(fsl_dev->pix_clk)) {
>                 dev_err(dev, "failed to register pix clk\n");
> -               ret = PTR_ERR(fsl_dev->pix_clk);
> -               goto disable_clk;
> +               return PTR_ERR(fsl_dev->pix_clk);
>         }
>
>         fsl_dev->tcon = fsl_tcon_init(dev);
> @@ -341,8 +335,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>         drm_dev_put(drm);
>  unregister_pix_clk:
>         clk_unregister(fsl_dev->pix_clk);
> -disable_clk:
> -       clk_disable_unprepare(fsl_dev->clk);
> +
>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
> index 0d342f43fa93..f263ad282828 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
> @@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct device *master,
>                 return ret;
>         }
>
> -       drc->bus_clk = devm_clk_get(dev, "ahb");
> +       drc->bus_clk = devm_clk_get_enabled(dev, "ahb");
>         if (IS_ERR(drc->bus_clk)) {
>                 dev_err(dev, "Couldn't get our bus clock\n");
>                 ret = PTR_ERR(drc->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(drc->bus_clk);
>
> -       drc->mod_clk = devm_clk_get(dev, "mod");
> +       drc->mod_clk = devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(drc->mod_clk)) {
>                 dev_err(dev, "Couldn't get our mod clock\n");
>                 ret = PTR_ERR(drc->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         ret = clk_set_rate_exclusive(drc->mod_clk, 300000000);
>         if (ret) {
>                 dev_err(dev, "Couldn't set the module clock frequency\n");
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
> -       clk_prepare_enable(drc->mod_clk);
> -
>         return 0;
>
> -err_disable_bus_clk:
> -       clk_disable_unprepare(drc->bus_clk);
>  err_assert_reset:
>         reset_control_assert(drc->reset);
>         return ret;
> @@ -80,8 +75,6 @@ static void sun6i_drc_unbind(struct device *dev, struct device *master,
>         struct sun6i_drc *drc = dev_get_drvdata(dev);
>
>         clk_rate_exclusive_put(drc->mod_clk);
> -       clk_disable_unprepare(drc->mod_clk);
> -       clk_disable_unprepare(drc->bus_clk);
>         reset_control_assert(drc->reset);
>  }
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index bd0fe2c6624e..ebf00676a76d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -507,19 +507,18 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>                 return ret;
>         }
>
> -       mixer->bus_clk = devm_clk_get(dev, "bus");
> +       mixer->bus_clk = devm_clk_get_enabled(dev, "bus");
>         if (IS_ERR(mixer->bus_clk)) {
>                 dev_err(dev, "Couldn't get the mixer bus clock\n");
>                 ret = PTR_ERR(mixer->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(mixer->bus_clk);
>
> -       mixer->mod_clk = devm_clk_get(dev, "mod");
> +       mixer->mod_clk = devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(mixer->mod_clk)) {
>                 dev_err(dev, "Couldn't get the mixer module clock\n");
>                 ret = PTR_ERR(mixer->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         /*
> @@ -530,8 +529,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>         if (mixer->cfg->mod_rate)
>                 clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
>
> -       clk_prepare_enable(mixer->mod_clk);
> -
>         list_add_tail(&mixer->engine.list, &drv->engine_list);
>
>         base = sun8i_blender_base(mixer);
> @@ -592,8 +589,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>
>         return 0;
>
> -err_disable_bus_clk:
> -       clk_disable_unprepare(mixer->bus_clk);
>  err_assert_reset:
>         reset_control_assert(mixer->reset);
>         return ret;
> @@ -606,8 +601,6 @@ static void sun8i_mixer_unbind(struct device *dev, struct device *master,
>
>         list_del(&mixer->engine.list);
>
> -       clk_disable_unprepare(mixer->mod_clk);
> -       clk_disable_unprepare(mixer->bus_clk);
>         reset_control_assert(mixer->reset);
>  }
>
> --
> 2.39.0
>
>
