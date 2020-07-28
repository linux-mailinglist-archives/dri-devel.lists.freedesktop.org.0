Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17C230A54
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 14:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1228C6E1E0;
	Tue, 28 Jul 2020 12:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632A66E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 12:37:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l2so7576582wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/0hxasPjkT/YyjIyd6ev9IMJ4snCTb42IQ0PCBN6d94=;
 b=iO9VZXjU6hvp1uQ1auh+fWeL1JrNYy54Zd0p/aR+tl4Zw+1vkVUCMGJ2EEt34v4/GK
 sIkwuGq/jSrCK83Sbv43vRDsgjQ9gEwwgmDRWmipeTCJGP4a3I1qxoG07O2Ocg/arG4e
 kvHyW09rpYG266Cs/RQCI+4WsO9xRxbtU3iIca1CNvglmjtdxC+rYaDWPjlqty6R/6LC
 2z6oZ2FcwVozKFXn8wMeekl3xQ6dX71pTKDDoj/DWzvCcEv+7dOkqCcPcpqYLs4ftpAp
 iFF3P3BvnXcU48OmPgZaIVrjtebfsFh7J8KS1gL9mMLGzaUL0rzfCsfn8yJmnmA9Pyin
 Qhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/0hxasPjkT/YyjIyd6ev9IMJ4snCTb42IQ0PCBN6d94=;
 b=V35A43J4xxvX4yFX/zznsTmYKyHpyC2b+c5m2Ypceq4vfyE1fUzj6OKIE/xCEhlqgp
 zzHq/z2k5grg7vBVpsH6Cp9k19hRh+6VoMDadybv9HfTk7xMwyiMcdxOmQDzDfOICHJa
 h2vzhwRaoKkhNQHNOinLw281g8ZgQxRvl75eU2sAhBuI8/LjHXVNUZVSyFVHzSG+90XF
 i1mW8Oz4qIsDTH/uFF9aKzTh+OW9FilYy1ilsCSO3tHXQmIx/+chfxqPxdoTo9+dUC5j
 MXvphqd9slMqfnCU4IBkSwopg/ZmJZCI3u/j/C0PhQp7hLS6MXQ9FDl68u7wSuoKxC5c
 p5RA==
X-Gm-Message-State: AOAM530Qu0AHFeiHFheywLiWvMMxVJoS2wz5Q+LKn3bRQxCS3WIrQf8J
 LPazL2I/rNjToqaQSVYftWxJ0LTW1hOsJPt6X8UsnDGZVeE=
X-Google-Smtp-Source: ABdhPJz5r1LeMnmIuvcgOziDFvfrRYb+Jc5FtZPjzhagrB6X5cXvMh2ad7Kr51ppE5WkzKsKl4nb7vypV+jB19aV45Y=
X-Received: by 2002:adf:fe50:: with SMTP id m16mr7426770wrs.27.1595939856030; 
 Tue, 28 Jul 2020 05:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <ece0d45f529cce9fb64100ddee726b81f7aa247a.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <ece0d45f529cce9fb64100ddee726b81f7aa247a.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 13:37:20 +0100
Message-ID: <CAPY8ntDsKQBzqA3HUvn3qva4+zggLaLsmr=DL2FyRrRHAL=T_Q@mail.gmail.com>
Subject: Re: [PATCH v4 50/78] drm/vc4: hdmi: Introduce resource init and
 variant
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI controllers found in the BCM2711 has a pretty different clock and
> registers areas than found in the older BCM283x SoCs.
>
> Let's create a variant structure to store the various adjustments we'll
> need later on, and a function to get the resources needed for one
> particular version.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 61 +++++++++++++++++++++++------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++-
>  2 files changed, 51 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index ec7710dfd04e..ac021e07a8cb 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1179,28 +1179,12 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
>  };
>  #endif
>
> -static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
> +static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>  {
> -#ifdef CONFIG_DRM_VC4_HDMI_CEC
> -       struct cec_connector_info conn_info;
> -#endif
> -       struct platform_device *pdev = to_platform_device(dev);
> -       struct drm_device *drm = dev_get_drvdata(master);
> -       struct vc4_hdmi *vc4_hdmi;
> -       struct drm_encoder *encoder;
> -       struct device_node *ddc_node;
> -       u32 value;
> +       struct platform_device *pdev = vc4_hdmi->pdev;
> +       struct device *dev = &pdev->dev;
>         int ret;
>
> -       vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
> -       if (!vc4_hdmi)
> -               return -ENOMEM;
> -
> -       dev_set_drvdata(dev, vc4_hdmi);
> -       encoder = &vc4_hdmi->encoder.base.base;
> -       vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
> -       vc4_hdmi->pdev = pdev;
> -
>         vc4_hdmi->hdmicore_regs = vc4_ioremap_regs(pdev, 0);
>         if (IS_ERR(vc4_hdmi->hdmicore_regs))
>                 return PTR_ERR(vc4_hdmi->hdmicore_regs);
> @@ -1212,6 +1196,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         vc4_hdmi->hdmi_regset.base = vc4_hdmi->hdmicore_regs;
>         vc4_hdmi->hdmi_regset.regs = hdmi_regs;
>         vc4_hdmi->hdmi_regset.nregs = ARRAY_SIZE(hdmi_regs);
> +
>         vc4_hdmi->hd_regset.base = vc4_hdmi->hd_regs;
>         vc4_hdmi->hd_regset.regs = hd_regs;
>         vc4_hdmi->hd_regset.nregs = ARRAY_SIZE(hd_regs);
> @@ -1223,12 +1208,44 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>                         DRM_ERROR("Failed to get pixel clock\n");
>                 return ret;
>         }
> +
>         vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
>         if (IS_ERR(vc4_hdmi->hsm_clock)) {
>                 DRM_ERROR("Failed to get HDMI state machine clock\n");
>                 return PTR_ERR(vc4_hdmi->hsm_clock);
>         }
>
> +       return 0;
> +}
> +
> +static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
> +{
> +#ifdef CONFIG_DRM_VC4_HDMI_CEC
> +       struct cec_connector_info conn_info;
> +#endif
> +       const struct vc4_hdmi_variant *variant = of_device_get_match_data(dev);
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct drm_device *drm = dev_get_drvdata(master);
> +       struct vc4_hdmi *vc4_hdmi;
> +       struct drm_encoder *encoder;
> +       struct device_node *ddc_node;
> +       u32 value;
> +       int ret;
> +
> +       vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
> +       if (!vc4_hdmi)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(dev, vc4_hdmi);
> +       encoder = &vc4_hdmi->encoder.base.base;
> +       vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
> +       vc4_hdmi->pdev = pdev;
> +       vc4_hdmi->variant = variant;
> +
> +       ret = variant->init_resources(vc4_hdmi);
> +       if (ret)
> +               return ret;
> +
>         ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
>         if (!ddc_node) {
>                 DRM_ERROR("Failed to find ddc node in device tree\n");
> @@ -1404,8 +1421,12 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct vc4_hdmi_variant bcm2835_variant = {
> +       .init_resources         = vc4_hdmi_init_resources,
> +};
> +
>  static const struct of_device_id vc4_hdmi_dt_match[] = {
> -       { .compatible = "brcm,bcm2835-hdmi" },
> +       { .compatible = "brcm,bcm2835-hdmi", .data = &bcm2835_variant },
>         {}
>  };
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 674541493909..0eaf979fe811 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -21,6 +21,15 @@ to_vc4_hdmi_encoder(struct drm_encoder *encoder)
>         return container_of(encoder, struct vc4_hdmi_encoder, base.base);
>  }
>
> +struct vc4_hdmi;
> +
> +struct vc4_hdmi_variant {
> +       /* Callback to get the resources (memory region, interrupts,
> +        * clocks, etc) for that variant.
> +        */
> +       int (*init_resources)(struct vc4_hdmi *vc4_hdmi);
> +};
> +
>  /* HDMI audio information */
>  struct vc4_hdmi_audio {
>         struct snd_soc_card card;
> @@ -39,6 +48,7 @@ struct vc4_hdmi {
>         struct vc4_hdmi_audio audio;
>
>         struct platform_device *pdev;
> +       const struct vc4_hdmi_variant *variant;
>
>         struct vc4_hdmi_encoder encoder;
>         struct drm_connector connector;
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
