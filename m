Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBADF96641F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 16:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52C010EAA8;
	Fri, 30 Aug 2024 14:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gzJnppul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1F10EAA8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 14:26:17 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-456855afe0fso8019041cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725027976; x=1725632776; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=164jGs/89Um/AnOtSvrzje4FuBBYrC6pESzJaoUHWtE=;
 b=gzJnppulpsOnUu+6dt22t+JDQ8HuZd4/VdvLrIWbdevrI18DTvH/hrSqNgHpyryJDd
 oHlMiEvxNdfl9QLZx5bITOu6ubcM02Njyfh3YCs3b9mZoEAoVkyGLtCFt6w/YlyS98pP
 wJI8VThhdnLn1e/G0RTLdYLttJK+NPj06UGD+QZ0QWYrnoLR0aTZltE5fTxOflAO1ofE
 meiPYKW4JVnWp8jiSUEgmWQRyXg8HkWzH8EvnEW+xxnUBiQhUATm1o2zWPxSqfYLZztE
 oBZpvhy8ISPWpkmQCUk4ULQyfLQzWD4NaIQDYsf1AjMG2kTGOqurcDurb6GukGzr6Bhy
 YFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725027976; x=1725632776;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=164jGs/89Um/AnOtSvrzje4FuBBYrC6pESzJaoUHWtE=;
 b=XPauOfHBUJxCmonnnlOWfq3MSA1h/+9ywaZ2dunFsJQP8z9myBOZ8PnlHnsQSGt+If
 vxdqJfGunz894n035Hq0a+M4T3DV9s2cCqZ/qBbHUalHB9SU/9wlgbuXlOQEFfMbNZjn
 wEUtdEzXCpugy5CRsYfLc/zR72rpAhGmA54xq43ulOy9/EpLM9xXdciGrmDSM4PeU/+s
 g7OhhghlXPdnRs1PNbDeOKpBm6pjwsJOE2YKB6CTqMIahyoIEdSN6bVpReop6LEpCU79
 1xW50nEWEjg7UtAt+HKGMvw+mzuxgZJZRk2BoFma0ZAphm6mLusSivO5z/jMdkJEcEX0
 ilew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUELsDxiLI5QuOzZmH5N3eK+LqhPZ9nk2blnLkkQSBYooziuCY+HxDgPSgdyzbNHXalDtu9F9KeXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzElIjS9LMkPT64NfMiXIQxMyGg7vneeZYXRanELiRpIi6ZYl40
 7UFCmJPSdT6jlmTQzNuemNRrA00h9iVG90e8B6z4ONn4plV1mAKU
X-Google-Smtp-Source: AGHT+IGtqcgwB7aiUspmKw2bWDAFI8RK/cwOxSXe7Pj969PwCKlkOWWz/klTvLJp/wHKXlKwMNZbew==
X-Received: by 2002:ac8:7c92:0:b0:456:81d1:dfe5 with SMTP id
 d75a77b69052e-45681d1e484mr48660541cf.40.1725027975851; 
 Fri, 30 Aug 2024 07:26:15 -0700 (PDT)
Received: from VM-Arch (ip-185-104-139-72.ptr.icomera.net. [185.104.139.72])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45682c865fcsm13994151cf.17.2024.08.30.07.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 07:26:15 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:26:11 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@gmail.com, conor+dt@kernel.org, daniel@ffwll.ch, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mehdi.djait@bootlin.com, 
 mripard@kernel.org, robh@kernel.org, tzimmermann@suse.de
Subject: Re: [RESEND PATCH v4 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <xjimc7o6lgaivockfugwfmdsae6fm7hz2cd4nvvwkuavabjjkd@kvo4alvvoqzl>
References: <20240819214943.1610691-1-lanzano.alex@gmail.com>
 <20240819214943.1610691-3-lanzano.alex@gmail.com>
 <3c8359ae-9a12-41c8-9799-86de9024fcd4@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c8359ae-9a12-41c8-9799-86de9024fcd4@wanadoo.fr>
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

On Tue, Aug 20, 2024 at 08:53:07AM GMT, Christophe JAILLET wrote:
> Le 19/08/2024 à 23:49, Alex Lanzano a écrit :
> > Add support for the monochrome Sharp Memory LCDs.
> 
> Hi,
> 
> a few nitpick below, should thre be a v5.
> 
> ...
> 
> > +struct sharp_memory_device {
> > +	struct drm_device drm;
> > +	struct spi_device *spi;
> > +
> > +	const struct drm_display_mode *mode;
> > +
> > +	struct drm_crtc crtc;
> > +	struct drm_plane plane;
> > +	struct drm_encoder encoder;
> > +	struct drm_connector connector;
> > +
> > +	struct gpio_desc *enable_gpio;
> > +
> > +	struct task_struct *sw_vcom_signal;
> > +	struct pwm_device *pwm_vcom_signal;
> > +
> > +	enum sharp_memory_vcom_mode vcom_mode;
> > +	u8 vcom;
> > +
> > +	u32 pitch;
> > +	u32 tx_buffer_size;
> > +	u8 *tx_buffer;
> > +
> > +	/* When vcom_mode == "software" a kthread is used to
> > +	 * periodically send a 'maintain display' message over
> > +	 * spi. This mutex ensures tx_buffer access and spi bus
> > +	 * usage is synchronized in this case
> 
> This comment could take only 3 lines and still be with < 80 lines.
> A dot could also be added at the end of the 2nd sentence.
> 
> > +	 */
> > +	struct mutex tx_mutex;
> > +};
> 
> ...
> 
> > +static int sharp_memory_probe(struct spi_device *spi)
> > +{
> > +	int ret;
> > +	struct device *dev;
> > +	struct sharp_memory_device *smd;
> > +	struct drm_device *drm;
> > +	const char *vcom_mode_str;
> > +
> > +	ret = spi_setup(spi);
> > +	if (ret < 0)
> > +		return dev_err_probe(&spi->dev, ret, "Failed to setup spi device\n");
> > +
> > +	dev = &spi->dev;
> 
> If done earlier (when dev is declared?), it could already be used in the
> dev_err_probe() just above?
> 
> > +	if (!dev->coherent_dma_mask) {
> > +		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "Failed to set dma mask\n");
> > +	}
> > +
> > +	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
> > +				 struct sharp_memory_device, drm);
> > +	if (!smd)
> > +		return -ENOMEM;
> > +
> > +	spi_set_drvdata(spi, smd);
> > +
> > +	smd->spi = spi;
> > +	drm = &smd->drm;
> > +	ret = drmm_mode_config_init(drm);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
> > +
> > +	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> > +	if (!smd->enable_gpio)
> > +		dev_warn(dev, "Enable gpio not defined\n");
> > +
> > +	/*
> > +	 * VCOM is a signal that prevents DC bias from being built up in
> > +	 * the panel resulting in pixels being forever stuck in one state.
> > +	 *
> > +	 * This driver supports three different methods to generate this
> > +	 * signal depending on EXTMODE pin:
> > +	 *
> > +	 * software (EXTMODE = L) - This mode uses a kthread to
> > +	 * periodically send a "maintain display" message to the display,
> > +	 * toggling the vcom bit on and off with each message
> > +	 *
> > +	 * external (EXTMODE = H) - This mode relies on an external
> > +	 * clock to generate the signal on the EXTCOMM pin
> > +	 *
> > +	 * pwm (EXTMODE = H) - This mode uses a pwm device to generate
> > +	 * the signal on the EXTCOMM pin
> > +	 *
> > +	 */
> > +	if (device_property_read_string(&spi->dev, "sharp,vcom-mode", &vcom_mode_str))
> 
> just dev?
> 
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "Unable to find sharp,vcom-mode node in device tree\n");
> > +
> > +	if (!strcmp("software", vcom_mode_str)) {
> > +		smd->vcom_mode = SHARP_MEMORY_SOFTWARE_VCOM;
> > +
> > +	} else if (!strcmp("external", vcom_mode_str)) {
> > +		smd->vcom_mode = SHARP_MEMORY_EXTERNAL_VCOM;
> > +
> > +	} else if (!strcmp("pwm", vcom_mode_str)) {
> > +		smd->vcom_mode = SHARP_MEMORY_PWM_VCOM;
> > +		ret = sharp_memory_init_pwm_vcom_signal(smd);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret,
> > +					     "Failed to initialize external COM signal\n");
> > +	} else {
> > +		return dev_err_probe(dev, -EINVAL, "Invalid value set for vcom-mode\n");
> > +	}
> > +
> > +	drm->mode_config.funcs = &sharp_memory_mode_config_funcs;
> > +	smd->mode = spi_get_device_match_data(spi);
> > +
> > +	smd->pitch = (SHARP_ADDR_PERIOD + smd->mode->hdisplay + SHARP_DUMMY_PERIOD) / 8;
> > +	smd->tx_buffer_size = (SHARP_MODE_PERIOD +
> > +			       (SHARP_ADDR_PERIOD + (smd->mode->hdisplay) + SHARP_DUMMY_PERIOD) *
> > +			       smd->mode->vdisplay) / 8;
> > +
> > +	smd->tx_buffer = devm_kzalloc(&spi->dev, smd->tx_buffer_size, GFP_KERNEL);
> 
> Just dev?
> 
> > +	if (!smd->tx_buffer)
> > +		return -ENOMEM;
> > +
> > +	mutex_init(&smd->tx_mutex);
> > +
> > +	drm->mode_config.min_width = smd->mode->hdisplay;
> > +	drm->mode_config.max_width = smd->mode->hdisplay;
> > +	drm->mode_config.min_height = smd->mode->vdisplay;
> > +	drm->mode_config.max_height = smd->mode->vdisplay;
> > +
> > +	ret = sharp_memory_pipe_init(drm, smd, sharp_memory_formats,
> > +				     ARRAY_SIZE(sharp_memory_formats),
> > +				     NULL);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to initialize display pipeline.\n");
> > +
> > +	drm_plane_enable_fb_damage_clips(&smd->plane);
> > +	drm_mode_config_reset(drm);
> > +
> > +	ret = drm_dev_register(drm, 0);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to register drm device.\n");
> > +
> > +	drm_fbdev_dma_setup(drm, 0);
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> CJ
> 

Thank you for the review! Will address in v5
