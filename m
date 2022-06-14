Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331054B567
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74E510FF2E;
	Tue, 14 Jun 2022 16:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9903510FF2E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:07:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id kq6so18089177ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dwjdjEcTxUiVOSF8t6mrkTHl7tGytj3+qOVw3HSoz6w=;
 b=NuX6paFejjqWOKVNkFD/v3FI9lE+5SPucC8lPw0dveegjA4rqkea1NPfCQhdhgGoM5
 BlSp25vtCwm4f7e7/i+iQ916kbuQzo6LEL/WImnZsdQhm+Yj6u9216M+9kbX6cJwfP9U
 lCwLELJHwy/5U8AygAOvTZBlrf+RT/ngy/dDodGnPEfhtyGfCM3JVy5fGaY6Mpj6f+4Y
 zijegXCmpUCMXE1Qm00keT4lCzwGeYxKPi3uk1pZoy6/yb/h/NRWY5tDfPtVoBIrliOw
 tWh6z0f1gugOZJGgHwI6E2YJ/n0nA81x+MUjwBXXtsmX6CFnCld3x3wy8UiIHyQpBOeQ
 3Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dwjdjEcTxUiVOSF8t6mrkTHl7tGytj3+qOVw3HSoz6w=;
 b=T8MPAmMLji5bZtly3aiOleeEXl58Rc/uqU6Fi7OeB0phtyStWUHgNMX2DNC40bzLTO
 LUmmkG/9wdvtc+mtmHU78yVAght3Rm8tXzd1q/My/o/LE+rWDp07XiyhhWzl09tV8i/T
 QbMyG7psnIHczAcI/h5+y8aWydfX3uHuGiw5MBoFhguXVEBNsLIWaYc6pkbN+U/zSzbQ
 ENKNBgBAKhoMgevjtDwfJABcc3w1cYyej0Nz0p3Pv0Ul9dx6FuDt1CR3O9DJQCxBgYgX
 VieAb0DkHUz+iKOqhPXGNS71BnHnM8JxzJoS3Do9M2cVeheRlTbycsTYIj91U0SLz6sR
 fZcA==
X-Gm-Message-State: AOAM533ik4HJCi8hSRQef20V61I/qcwqu5ZHTV4tzoqSTA9OtW6/7Pwx
 7fW0evffnfKc2uS7mpTwYWUJ1h2MUkvYlmwVrP3KFg==
X-Google-Smtp-Source: ABdhPJwiRq4dOjabAOAHl7/CYDBAeoet81OtuHNwkfiy+Zcx5KQ93FgYnP7xB0I3HWyBavSRp5As+EKaCWFeUbLYLO0=
X-Received: by 2002:a17:907:1ca8:b0:70c:68ce:dade with SMTP id
 nb40-20020a1709071ca800b0070c68cedademr4928849ejc.723.1655222854129; Tue, 14
 Jun 2022 09:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-22-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-22-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:07:18 +0100
Message-ID: <CAPY8ntBXOZicEb7TDkgeLVbAyraFYZPFpHyv7igN7MMRftoOGQ@mail.gmail.com>
Subject: Re: [PATCH 21/64] drm/vc4: dpi: Embed DRM structures into the private
 structure
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
> The VC4 DPI driver private structure contains only a pointer to the
> encoder it implements. This makes the overall structure somewhat
> inconsistent with the rest of the driver, and complicates its
> initialisation without any apparent gain.
>
> Let's embed the drm_encoder structure (through the vc4_encoder one) into
> struct vc4_dpi to fix both issues.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 49 ++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index f2b46c524919..c88e8e397730 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -83,10 +83,10 @@
>
>  /* General DPI hardware state. */
>  struct vc4_dpi {
> +       struct vc4_encoder encoder;
> +
>         struct platform_device *pdev;
>
> -       struct drm_encoder *encoder;
> -
>         void __iomem *regs;
>
>         struct clk *pixel_clock;
> @@ -95,21 +95,15 @@ struct vc4_dpi {
>         struct debugfs_regset32 regset;
>  };
>
> +static inline struct vc4_dpi *
> +to_vc4_dpi(struct drm_encoder *encoder)
> +{
> +       return container_of(encoder, struct vc4_dpi, encoder.base);
> +}
> +
>  #define DPI_READ(offset) readl(dpi->regs + (offset))
>  #define DPI_WRITE(offset, val) writel(val, dpi->regs + (offset))
>
> -/* VC4 DPI encoder KMS struct */
> -struct vc4_dpi_encoder {
> -       struct vc4_encoder base;
> -       struct vc4_dpi *dpi;
> -};
> -
> -static inline struct vc4_dpi_encoder *
> -to_vc4_dpi_encoder(struct drm_encoder *encoder)
> -{
> -       return container_of(encoder, struct vc4_dpi_encoder, base.base);
> -}
> -
>  static const struct debugfs_reg32 dpi_regs[] = {
>         VC4_REG32(DPI_C),
>         VC4_REG32(DPI_ID),
> @@ -117,8 +111,7 @@ static const struct debugfs_reg32 dpi_regs[] = {
>
>  static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
>  {
> -       struct vc4_dpi_encoder *vc4_encoder = to_vc4_dpi_encoder(encoder);
> -       struct vc4_dpi *dpi = vc4_encoder->dpi;
> +       struct vc4_dpi *dpi = to_vc4_dpi(encoder);
>
>         clk_disable_unprepare(dpi->pixel_clock);
>  }
> @@ -127,8 +120,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>  {
>         struct drm_device *dev = encoder->dev;
>         struct drm_display_mode *mode = &encoder->crtc->mode;
> -       struct vc4_dpi_encoder *vc4_encoder = to_vc4_dpi_encoder(encoder);
> -       struct vc4_dpi *dpi = vc4_encoder->dpi;
> +       struct vc4_dpi *dpi = to_vc4_dpi(encoder);
>         struct drm_connector_list_iter conn_iter;
>         struct drm_connector *connector = NULL, *connector_scan;
>         u32 dpi_c = DPI_ENABLE | DPI_OUTPUT_ENABLE_MODE;
> @@ -242,7 +234,7 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
>                         return PTR_ERR(bridge);
>         }
>
> -       return drm_bridge_attach(dpi->encoder, bridge, NULL, 0);
> +       return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
>  }
>
>  static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
> @@ -250,21 +242,12 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct vc4_dpi *dpi;
> -       struct vc4_dpi_encoder *vc4_dpi_encoder;
>         int ret;
>
>         dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
>         if (!dpi)
>                 return -ENOMEM;
> -
> -       vc4_dpi_encoder = devm_kzalloc(dev, sizeof(*vc4_dpi_encoder),
> -                                      GFP_KERNEL);
> -       if (!vc4_dpi_encoder)
> -               return -ENOMEM;
> -       vc4_dpi_encoder->base.type = VC4_ENCODER_TYPE_DPI;
> -       vc4_dpi_encoder->dpi = dpi;
> -       dpi->encoder = &vc4_dpi_encoder->base.base;
> -
> +       dpi->encoder.type = VC4_ENCODER_TYPE_DPI;
>         dpi->pdev = pdev;
>         dpi->regs = vc4_ioremap_regs(pdev, 0);
>         if (IS_ERR(dpi->regs))
> @@ -298,8 +281,8 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 DRM_ERROR("Failed to turn on core clock: %d\n", ret);
>
> -       drm_simple_encoder_init(drm, dpi->encoder, DRM_MODE_ENCODER_DPI);
> -       drm_encoder_helper_add(dpi->encoder, &vc4_dpi_encoder_helper_funcs);
> +       drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
> +       drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
>
>         ret = vc4_dpi_init_bridge(dpi);
>         if (ret)
> @@ -312,7 +295,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>         return 0;
>
>  err_destroy_encoder:
> -       drm_encoder_cleanup(dpi->encoder);
> +       drm_encoder_cleanup(&dpi->encoder.base);
>         clk_disable_unprepare(dpi->core_clock);
>         return ret;
>  }
> @@ -324,7 +307,7 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
>
>         drm_of_panel_bridge_remove(dev->of_node, 0, 0);
>
> -       drm_encoder_cleanup(dpi->encoder);
> +       drm_encoder_cleanup(&dpi->encoder.base);
>
>         clk_disable_unprepare(dpi->core_clock);
>  }
> --
> 2.36.1
>
