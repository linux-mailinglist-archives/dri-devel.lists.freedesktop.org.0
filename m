Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113ED7576AE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A73710E2FB;
	Tue, 18 Jul 2023 08:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5C210E2FB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:35:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51e5d9e20ecso7716068a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689669346; x=1692261346;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPA/0/bMErGzGSP9Uu0FVnDmHWcLXb0AhZJtimU+3Rc=;
 b=oFFFi76Hosn/R51q8+bDeW/Dp2ft8ETvdCubBlRkXvxmmIcX/X43jccv7mFGbCnUEY
 2jMKEfcRmn16hYDXn5iedl4LZ2VfKIR9YPr1EqyfVYOb7NEPjJz4dCdYJzPXVISWwy9f
 DwfyrOvQrfdTW098yg/r17WEqC42ebfv90yNFUJJ2NLCzmGszvLahaxV8FoDfha1lTkW
 ZXoav+GOw+/eivA6rSL7naf11Ep6CVt1juD0xDL/4wrjLc25ToonbLByqlKMFv6TpytO
 aLrLhH0+xs3wv3qAVvYOONCVeBwazEYJY8S7RDTHbn635UNGWKXtYDNjJscygTebAX1E
 MPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689669346; x=1692261346;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pPA/0/bMErGzGSP9Uu0FVnDmHWcLXb0AhZJtimU+3Rc=;
 b=QdPyWQ/033eako1SbWc26y6KxJkH1eF/HFUgDHPUpMXk5pTeERWMpGqRWblzdiikUP
 +4wUjWkJ6qa/XtE6c7DknFcdWwPMh7J//0MbMzWVdxosumjK30PtFXilkeVuvMk8Ax4q
 NzQuIOFmbEnAO35yxDvVVQAjvsB4+zyoS/L6SO6ZrHJEirUvk7TYewCRO2nhIkvJBP/X
 9F8aRynQVIGhODFURnQAVM+v+2YzwXuTGpVzBJeSazvO/afAgRvEjMA4GGo40fXmUuKo
 cYdtic3iYG0Y+6jp+dCv8cC9d4LHWBHNgRubJO6UZPj4wjK56ic3BbnMuabw3eJww/np
 Zu4w==
X-Gm-Message-State: ABy/qLZHTUoXIAaeC0MVZjiNLBsNFCsCIDpP/YvFBcXDbv3HYIEjh3+m
 ZE1r6Y5tj/jLyiYIyHd/11feHQ==
X-Google-Smtp-Source: APBJJlGqI70kSAAlvFY0/UIHZBEMsBig7IxJgLXduoq5QSICwAsb1Z1wY5uiILWLTGiVME+H4tHzKA==
X-Received: by 2002:a05:6402:2d4:b0:521:812a:7f27 with SMTP id
 b20-20020a05640202d400b00521812a7f27mr7042615edx.25.1689669345994; 
 Tue, 18 Jul 2023 01:35:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 s10-20020aa7cb0a000000b0051bfc7763c2sm860581edt.25.2023.07.18.01.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 01:35:45 -0700 (PDT)
Message-ID: <02704840-ce8b-4f41-f8bf-3f200ca95a10@linaro.org>
Date: Tue, 18 Jul 2023 10:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] TinyDRM display driver for Philips PCD8544 display
 controller
To: Viktar Simanenka <viteosen@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230718080727.323426-1-viteosen@gmail.com>
Content-Language: en-US
In-Reply-To: <20230718080727.323426-1-viteosen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 18/07/2023 10:07, Viktar Simanenka wrote:
> Support for common monochrome LCD displays based on PCD8544 (such as Nokia 5110/3310 LCD) SPI controlled displays.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Viktar Simanenka <viteosen@gmail.com>
> ---
>  .../bindings/display/philips,pcd8544.yaml     |  92 ++++

Bindings are always separate patches.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

>  drivers/gpu/drm/tiny/Kconfig                  |  11 +
>  drivers/gpu/drm/tiny/pcd8544.c                | 506 ++++++++++++++++++
>  3 files changed, 609 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/philips,pcd8544.yaml
>  create mode 100644 drivers/gpu/drm/tiny/pcd8544.c
> 
> diff --git a/Documentation/devicetree/bindings/display/philips,pcd8544.yaml b/Documentation/devicetree/bindings/display/philips,pcd8544.yaml
> new file mode 100644
> index 000000000000..d56a0c747812
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/philips,pcd8544.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/philips,pcd8544.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Philips PCD8544 LCD Display Controller
> +
> +maintainers:
> +  - Viktar Simanenka <viteosen@gmail.com>
> +
> +description: |
> +  Philips PCD8544 LCD Display Controller with SPI control bus.
> +  This is a driver for monochrome 84x48 LCD displays,

LCD Display controller is a driver? Are you sure? Or maybe you are
describing Linux driver? If so, drop references to drivers and describe
the hardware.

> +  such as Nokia 5110/3310 LCDs. May contain backlight LED.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: philips,pcd8544
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: Display data/command selection (D/CX)
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Display hardware reset line (RST)
> +
> +  inverted:
> +    maxItems: 1
> +    description: Invert display colors

Missing vendor prefix, ref/type, incorrect maxItems (???).

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.

> +
> +  voltage_op:

No underscores in names.

> +    maxItems: 1
> +    description: Set operation voltage (contrast)

What? Sorry, I don't understand.

> +
> +  bias:
> +    maxItems: 1
> +    description: Bias voltage level
> +
> +  temperature_coeff:
> +    maxItems: 1
> +    description: Temperature coefficient

You just copied the property name into description. Very helpful.

You clearly did not test it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - dc-gpios
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    display@0 {
> +        compatible = "philips,pcd8544";
> +        spi-max-frequency = <8000000>;
> +        reg = <0>;
> +
> +        dc-gpios = <&pio 0 3 0>; /* DC=PA3 */
> +        reset-gpios = <&pio 0 1 0>; /* RESET=PA1 */

Use proper defines for flags.

> +        backlight = <&display_backlight>;
> +        write-only;

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +
> +        /* Default values: */
> +        inverted = <0>;
> +        voltage_op = <0>;
> +        bias = <4>;
> +        temperature_coeff = <0>;

What? Your code is confusing.

> +
> +        width-mm = <35>;
> +        height-mm = <28>;
> +
> +        panel-timing {
> +            hactive = <84>;
> +            vactive = <48>;
> +            hback-porch = <0>;
> +            vback-porch = <0>;
> +
> +            clock-frequency = <0>;
> +            hfront-porch = <0>;
> +            hsync-len = <0>;
> +            vfront-porch = <0>;
> +            vsync-len = <0>;
> +        };
> +    };
> +

...

> +
> +static int pcd8544_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct pcd8544_device *pcd8544_dev;
> +	struct drm_device *drm;
> +	int ret;
> +	static const uint64_t modifiers[] = {
> +		DRM_FORMAT_MOD_LINEAR,
> +		DRM_FORMAT_MOD_INVALID
> +	};

Missing blank line.

> +	pcd8544_dev = devm_drm_dev_alloc(dev, &pcd8544_driver, struct pcd8544_device, drm);
> +

Drop blank line.

> +	if (IS_ERR(pcd8544_dev))
> +		return PTR_ERR(pcd8544_dev);
> +
> +	pcd8544_dev->spi = spi;
> +
> +	pcd8544_dev->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pcd8544_dev->reset))
> +		return dev_err_probe(dev, PTR_ERR(pcd8544_dev->reset), "Failed to get GPIO 'reset'\n");

You start in reset mode? Didn't you just confure values? 1 is reset.

> +
> +	pcd8544_dev->dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(pcd8544_dev->dc))
> +		return dev_err_probe(dev, PTR_ERR(pcd8544_dev->dc), "Failed to get GPIO 'dc'\n");
> +
> +	pcd8544_dev->backlight = devm_of_find_backlight(dev);
> +	if (IS_ERR(pcd8544_dev->backlight))
> +		return PTR_ERR(pcd8544_dev->backlight);
> +
> +	if (device_property_read_u32(dev, "inverted", &pcd8544_dev->inverted))
> +		pcd8544_dev->inverted = 0;
> +	if (device_property_read_u32(dev, "temperature_coeff", &pcd8544_dev->temperature_coeff))
> +		pcd8544_dev->temperature_coeff = 0;
> +	if (device_property_read_u32(dev, "bias", &pcd8544_dev->bias))
> +		pcd8544_dev->bias = 4;
> +	if (device_property_read_u32(dev, "voltage_op", &pcd8544_dev->voltage_op))
> +		pcd8544_dev->voltage_op = 0;
> +
> +	if (!dev->coherent_dma_mask) {
> +		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +		if (ret) {
> +			dev_warn(dev, "Failed to set dma mask %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	drm_mode_copy(&pcd8544_dev->mode, &pcd8544_mode);
> +	pcd8544_dev->width = pcd8544_mode.hdisplay;
> +	pcd8544_dev->height = pcd8544_mode.vdisplay;
> +	pcd8544_dev->tx_buflen = pcd8544_dev->width * DIV_ROUND_UP(pcd8544_dev->height, 8);
> +	pcd8544_dev->tx_buf = devm_kzalloc(dev, pcd8544_dev->tx_buflen, GFP_KERNEL);
> +	if (!pcd8544_dev->tx_buf)
> +		return -ENOMEM;
> +
> +	drm = &pcd8544_dev->drm;
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(&pcd8544_dev->connector, &pcd8544_connector_hfuncs);
> +	ret = drm_connector_init(drm, &pcd8544_dev->connector, &pcd8544_connector_funcs, DRM_MODE_CONNECTOR_SPI);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.funcs = &pcd8544_mode_config_funcs;
> +	drm->mode_config.min_width = pcd8544_dev->mode.hdisplay;
> +	drm->mode_config.max_width = pcd8544_dev->mode.hdisplay;
> +	drm->mode_config.min_height = pcd8544_dev->mode.vdisplay;
> +	drm->mode_config.max_height = pcd8544_dev->mode.vdisplay;
> +
> +	ret = drm_simple_display_pipe_init(drm, &pcd8544_dev->pipe, &pcd8544_pipe_funcs,
> +					pcd8544_formats, ARRAY_SIZE(pcd8544_formats),
> +					modifiers, &pcd8544_dev->connector);
> +	if (ret)
> +		return ret;
> +
> +	drm_plane_enable_fb_damage_clips(&pcd8544_dev->pipe.plane);
> +
> +	spi_set_drvdata(spi, drm);
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		return ret;
> +
> +	drm_dbg(drm, "SPI speed: %uMHz\n", spi->max_speed_hz / 1000000);
> +
> +	drm_fbdev_generic_setup(drm, 0);
> +
> +	return 0;
> +}
> +
> +static void pcd8544_remove(struct spi_device *spi)
> +{
> +	struct drm_device *drm = spi_get_drvdata(spi);
> +
> +	drm_dev_unplug(drm);
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static void pcd8544_shutdown(struct spi_device *spi)
> +{
> +	drm_atomic_helper_shutdown(spi_get_drvdata(spi));
> +}
> +
> +static struct spi_driver pcd8544_spi_driver = {
> +	.driver = {
> +		.name = "pcd8544",
> +		.owner = THIS_MODULE,

Drop. And run coccinelle, smatch and sparse.



Best regards,
Krzysztof

