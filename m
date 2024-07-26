Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C6793DA9A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 00:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8664C10E2BF;
	Fri, 26 Jul 2024 22:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Ac8iGGH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr
 [80.12.242.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD05A10E2BF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 22:12:06 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id XTAQsjdCkkc2vXTAQs9rLV; Sat, 27 Jul 2024 00:12:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1722031924;
 bh=fqthNsWy0oH2Iy/PS67VSQTwdel4fdgwtHMQu+8NrBE=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Ac8iGGH/X4G8xAezKh9iyzgS3yqpgtHDctEn2nwG4hZHl4z64/jLsMWakClqt9hJR
 YoeQEY5COqLGx3qOeRtrInaGO3kvvUVvs+JyyVjw7AL4YLUQr2TG9ReisOAg8jZWRv
 8cqHMtrRTS0QguWmPZ6O+JyuPiMesS2xldgRY/dDJuhIRbfrNlUGbdxXv+pT5FYfqo
 eLCXzprqtCwXGqCYlgqMdwia23UuhO8mGR8QyxQ8EocjegdtFLtAjSkmAechDE1jWi
 38854Vwg2TgYlk5aQ67RnM7wj/0ESw5RFKcA7DrCJ4lThbfmoVepI3hjm0PFoj912p
 DJkwYT1G9tsrQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 27 Jul 2024 00:12:04 +0200
X-ME-IP: 90.11.132.44
Message-ID: <0c759c38-eebb-4889-b748-3fd5925d0690@wanadoo.fr>
Date: Sat, 27 Jul 2024 00:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/tiny: Add driver for Sharp Memory LCD
To: lanzano.alex@gmail.com
Cc: airlied@gmail.com, christophe.jaillet@wanadoo.fr, conor+dt@kernel.org,
 daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mehdi.djait@bootlin.com, mripard@kernel.org, robh@kernel.org,
 tzimmermann@suse.de
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240726194456.1336484-1-lanzano.alex@gmail.com>
 <20240726194456.1336484-3-lanzano.alex@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240726194456.1336484-3-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 26/07/2024 à 21:44, Alex Lanzano a écrit :
> Add support for the monochrome Sharp Memory LCDs.
> 
> Signed-off-by: Alex Lanzano <lanzano.alex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Co-developed-by: Mehdi Djait <mehdi.djait-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Mehdi Djait <mehdi.djait-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> ---
>   MAINTAINERS                         |   7 +
>   drivers/gpu/drm/tiny/Kconfig        |  20 +
>   drivers/gpu/drm/tiny/Makefile       |   1 +
>   drivers/gpu/drm/tiny/sharp-memory.c | 726 ++++++++++++++++++++++++++++
>   4 files changed, 754 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
> 

Hi,

below some other tiny comments, hoping it helps.

Also "./scripts/checkpatch.pl --strict" gives some hints, should some be 
of interest.

> +static int sharp_memory_probe(struct spi_device *spi)
> +{
> +	int ret;
> +	struct device *dev;
> +	struct sharp_memory_device *smd;
> +	enum sharp_memory_model model;
> +	struct drm_device *drm;
> +	const char *vcom_mode_str;
> +
> +	ret = spi_setup(spi);
> +	if (ret < 0)
> +		return dev_err_probe(&spi->dev, ret, "Failed to setup spi device\n");
> +
> +	dev = &spi->dev;

6 times below, &spi->dev could be replaced by dev, to slightly simplify 
things.

> +	if (!dev->coherent_dma_mask) {
> +		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to set dma mask\n");
> +	}
> +
> +	smd = devm_drm_dev_alloc(&spi->dev, &sharp_memory_drm_driver,
> +				 struct sharp_memory_device, drm);

Missing error handling.

> +
> +	spi_set_drvdata(spi, smd);
> +
> +	smd->spi = spi;
> +	drm = &smd->drm;
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
> +
> +	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> +	if (smd->enable_gpio == NULL)

Nitpick: if (!smd->enable_gpio)

> +		dev_warn(&spi->dev, "Enable gpio not defined\n");
> +
> +	/*
> +	 * VCOM is a signal that prevents DC bias from being built up in
> +	 * the panel resulting in pixels being forever stuck in one state.
> +	 *
> +	 * This driver supports three different methods to generate this
> +	 * signal depending on EXTMODE pin:
> +	 *
> +	 * software (EXTMODE = L) - This mode uses a kthread to
> +	 * periodically send a "maintain display" message to the display,
> +	 * toggling the vcom bit on and off with each message
> +	 *
> +	 * external (EXTMODE = H) - This mode relies on an external
> +	 * clock to generate the signal on the EXTCOMM pin
> +	 *
> +	 * pwm (EXTMODE = H) - This mode uses a pwm device to generate
> +	 * the signal on the EXTCOMM pin
> +	 *
> +	 */
> +	smd->vcom = 0;

Nitpick: devm_drm_dev_alloc() already zeroes the allocated memory. So 
this is useless. Unless you think it gives some useful hint, it could be 
removed.

> +	if (device_property_read_string(&spi->dev, "vcom-mode", &vcom_mode_str))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Unable to find vcom-mode node in device tree\n");
> +
> +	if (!strcmp("software", vcom_mode_str)) {
> +		smd->vcom_mode = SHARP_MEMORY_SOFTWARE_VCOM;

...

> +	smd->pitch = (SHARP_ADDR_PERIOD + smd->mode->hdisplay + SHARP_DUMMY_PERIOD) / 8;
> +	smd->tx_buffer_size = (SHARP_MODE_PERIOD +
> +			       (SHARP_ADDR_PERIOD + (smd->mode->hdisplay) + SHARP_DUMMY_PERIOD) *
> +			       smd->mode->vdisplay) / 8;
> +
> +	smd->tx_buffer = devm_kzalloc(&spi->dev, smd->tx_buffer_size, GFP_KERNEL);
> +	if (!smd->tx_buffer)
> +		return dev_err_probe(&spi->dev, -ENOMEM, "Unable to alloc tx buffer\n");

There is no need to log a message for memory allocation failure.
return -ENOMEM; should be just fine IMHO.

> +
> +	mutex_init(&smd->tx_mutex);
> +
> +	drm->mode_config.min_width = smd->mode->hdisplay;
> +	drm->mode_config.max_width = smd->mode->hdisplay;
> +	drm->mode_config.min_height = smd->mode->vdisplay;
> +	drm->mode_config.max_height = smd->mode->vdisplay;
> +
> +	ret = sharp_memory_pipe_init(drm, smd,
> +				     sharp_memory_formats,

Nitpick: you could save 1 LoC if this is put at the end of the previous 
line.

> +				     ARRAY_SIZE(sharp_memory_formats),
> +				     NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize display pipeline.\n");
> +
> +	drm_plane_enable_fb_damage_clips(&smd->plane);
> +	drm_mode_config_reset(drm);
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register drm device.\n");
> +
> +	drm_fbdev_dma_setup(drm, 0);
> +
> +	return 0;
> +}

...

CJ


