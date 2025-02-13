Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200EBA33443
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C94F10E9BA;
	Thu, 13 Feb 2025 00:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KoLf/yaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF6410E9B6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:51:03 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54508b026d1so188414e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739407861; x=1740012661; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rqigqz7VsvHvjDZLKrzENnpIDRVXNd7wQyN9hE5QEH0=;
 b=KoLf/yaL1FflJHcsnSzHG/QV0ydQh+uovGSyBdBKtUn675R7zzChUg2HXfKut4dWbH
 ddFspO1wgfzyPXoZ2koeBkMOSdkhVB8DLjJX2xN96CVFxdRsAAXnTNDNEzlBCYyXKEm+
 736kq3KlnEsRH16FuvH/1EzLAx58J/OlB1tFO0sRpCZwjUZwNno6H2TGqFl9dC6VrTsq
 ZYFc15Q2FZykrSPoceLzuIzWJTo8f7eIO1M0xDOSjp2LIP/jXqKoic3ZH0CesHj08hft
 IudumX68QyHADINyFpoRhxpbvu4Q7XevqLhQD+/lgCT9ObA8o0omtwhGhOHQ6ZHlAgoT
 6bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739407861; x=1740012661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rqigqz7VsvHvjDZLKrzENnpIDRVXNd7wQyN9hE5QEH0=;
 b=A1OwhI7F0pufxjTUiYx/duuWuJnGTPIkClU+VlPuKwvM4rThtXu0ZTKhgN6AuLAtgp
 akg9GgB94o2O0mcB6VEYNleWsq1nz5gBxwX1stAD3uzbO/ziP24e+/ZZ+a5CmrOoO56V
 JKT31UtsN3KrFgxgD3slzBC82Dy324U1WfHCWlwsHDfc/2CfNB5i44i5lo6XNaZPwvmh
 2xuqWcDO/hm4bntrxtTPykwFnMAQtTNlyPmpSnOKoos9n/SutmHB3zDa/cLdnJWg4YsZ
 BxAFkA35MtQBjCLTr8JDLCN6xctTWySxDfRDzbvwFoXXhA44t+6WxF/ikpMe54+hRGm+
 fGEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOLe0w+E8DSYJoXeHj7p0oZ7LFXwfSSqfYfUHozRv4X01DRL0X4uJnP7byYHWTUZPEl3wBBS/wkdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWLJFtgRNyVUoJbQGInDohZwPfoCXBy5YmQr7b35e92zqEuXXQ
 C9GckzxHABq0qtYrsKCzp45MkUSUEqp/KCzvFvijCK0PhIoh7q7+BBgXiftP2eI=
X-Gm-Gg: ASbGnct2+5oBRYLkLxLK9iasgPrLP57MBqSIx15Hzur2IYWuTTOZV0fz7OIMYDeBqNy
 +dndVjB/s+Q1KurhWNJL916LEcfBoLZPowszPXn7jZ2DmPYSfthz7/yTrEavD/Q09et+zLLDKe4
 towIj7soJdPsECx4wsdrLnXnzEFDGki2sh5wtNCinNdGgLFCJoqvJ0TxVY8I79NIxTT3XB8app0
 qnz8Vl/BHTkwci2R25rwS4xu1gU0Kg95poUET7K7fykcNyQQSQvTsATMBPhoQajLzzAAq3azNtq
 QVnC2miDMoYYpZpqeZygidZAmkNIoxZtfzZHUEq73PI3W5NRWVycVJ55w7zhtYrstDT6VVk=
X-Google-Smtp-Source: AGHT+IFjkw30z40D63ZpFBNnhdaR0NzBABs0fEXk4IhCsjkAw9hFFstUmVaf2lYdSRmrdWFFEbfsiQ==
X-Received: by 2002:a05:6512:2031:b0:545:a2f:22bd with SMTP id
 2adb3069b0e04-545181859d6mr1559896e87.48.1739407861367; 
 Wed, 12 Feb 2025 16:51:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10cb54sm19680e87.163.2025.02.12.16.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 16:51:00 -0800 (PST)
Date: Thu, 13 Feb 2025 02:50:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 7/7] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
Message-ID: <zbbksbprvvwkjsmhuxac7ugshfjbnnp4hxxwxmmnosjzcebb3l@ppyn2cijj6bi>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-8-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-8-shiyongbang@huawei.com>
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

On Mon, Feb 10, 2025 at 10:49:59PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> To realize HPD feature, we have getting hpd status function, registering
> irq function, interrupt handler function, and hpd event process function.
> And also we use pci_alloc_irq_vectors() to get our msi irq, because we have
> two interrupts now.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - optimizing the description in commit message, suggested by Dmitry Baryshkov.
>   - add mdelay(100) comments, suggested by Dmitry Baryshkov.
>   - deleting display enable in hpd event, suggested by Dmitry Baryshkov.
> ---
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 33 ++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    | 13 ++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  2 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 57 +++++++++++++-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 78 +++++++++++++++----
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   | 14 ++++
>  7 files changed, 181 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> index c5feef8dc27d..08f9e1caf7fc 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> @@ -16,5 +16,6 @@
>  #define HIBMC_DP_SYNC_EN_MASK		0x3
>  #define HIBMC_DP_LINK_RATE_CAL		27
>  #define HIBMC_DP_SYNC_DELAY(lanes)	((lanes) == 0x2 ? 86 : 46)
> +#define HIBMC_DP_INT_ENABLE		0xc
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 5e889c377117..0b6ce48c5d8f 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -181,6 +181,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	/* int init */
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
> +	writel(HIBMC_DP_INT_ENABLE, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	/* rst */
>  	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>  	/* clock enable */
> @@ -284,3 +285,35 @@ void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
>  	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
>  	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
>  }
> +
> +enum hibmc_dp_hpd_status hibmc_dp_get_hpd_status(const struct hibmc_dp *dp)
> +{
> +	enum hibmc_dp_hpd_status status;
> +	u32 val;
> +
> +	/* spec said the HPD signal needs to be pulled up for
> +	 * more than 100 ms to enter the plug status
> +	 */
> +	mdelay(100);

Please check that your code doesn't break with CONFIG_DEBUG_ATOMIC_SLEEP=y

Having a 100msec delay in the ISR handler is a really sad idea. Don't
you have HPD debouncing handled in the hardware?

> +
> +	val = readl(dp->dp_dev->base + HIBMC_DP_HPD_STATUS);
> +	val = (val & HIBMC_DP_CFG_SINK_HPD_STATE_MACHINE) >> 4;
> +
> +	switch (val) {
> +	case 0: /* 0: IDLE */
> +	case 3: /* 3: DONE */
> +		status = HIBMC_DP_HPD_OUT;
> +		break;
> +	case 1: /* 1: PLUG */
> +		status = HIBMC_DP_HPD_IN;
> +		break;
> +	case 4: /* 4: ASSERT_LENGHT */
> +		status = HIBMC_DP_HPD_DETECTING;
> +		break;
> +	default: /* unknown status */
> +		status = HIBMC_DP_HPD_DET_FAIL;
> +		break;
> +	}

Is there a way to detect a short pulse on the HPD line aka attention?
You have defined HIBMC_DP_HPD_SHORT below, but it is not being assigned
at all.

> +
> +	return status;
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 823544b8008b..df7b692b1998 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -41,6 +41,17 @@ struct hibmc_dp_cbar_cfg {
>  	enum hibmc_dp_cbar_pattern pattern;
>  };
>  
> +enum hibmc_dp_hpd_status {
> +	HIBMC_DP_HPD_DETECTING,
> +	HIBMC_DP_HPD_IN,
> +	HIBMC_DP_HPD_OUT,
> +	HIBMC_DP_HPD_SHORT, /* Short hpd (irq_hpd) */
> +	HIBMC_DP_HPD_DET_FAIL,
> +	HIBMC_DP_HPD_IN_SIMULATE,
> +	HIBMC_DP_HPD_OUT_SIMULATE,
> +	HIBMC_DP_HPD_SHORT_SIMULATE,
> +};
> +
>  struct hibmc_dp {
>  	struct hibmc_dp_dev *dp_dev;
>  	struct drm_device *drm_dev;
> @@ -49,6 +60,7 @@ struct hibmc_dp {
>  	void __iomem *mmio;
>  	struct drm_dp_aux aux;
>  	struct hibmc_dp_cbar_cfg cfg;
> +	u32 hpd_status;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> @@ -58,5 +70,6 @@ int hibmc_dp_get_dpcd(struct hibmc_dp *dp);
>  u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
>  u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
>  void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
> +enum hibmc_dp_hpd_status hibmc_dp_get_hpd_status(const struct hibmc_dp *dp);
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> index c43ad6b30c2c..6c4ba0412b15 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> @@ -12,6 +12,7 @@
>  #define HIBMC_DP_AUX_RD_DATA0			0x64
>  #define HIBMC_DP_AUX_REQ			0x74
>  #define HIBMC_DP_AUX_STATUS			0x78
> +#define HIBMC_DP_HPD_STATUS			0x98
>  #define HIBMC_DP_PHYIF_CTRL0			0xa0
>  #define HIBMC_DP_VIDEO_CTRL			0x100
>  #define HIBMC_DP_VIDEO_CONFIG0			0x104
> @@ -75,5 +76,6 @@
>  #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
>  #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
>  #define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION	GENMASK(31, 20)
> +#define HIBMC_DP_CFG_SINK_HPD_STATE_MACHINE	GENMASK(7, 4)
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index 1f8f7b74f5b4..057dd3caa043 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -11,8 +11,12 @@
>  #include <drm/drm_edid.h>
>  
>  #include "hibmc_drm_drv.h"
> +#include "hibmc_drm_regs.h"
>  #include "dp/dp_hw.h"
>  
> +#define DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
> +#define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> +
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>  	.get_modes = drm_connector_helper_get_modes,
>  	.detect_ctx = drm_connector_helper_detect_from_ddc,
> @@ -81,6 +85,53 @@ static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
>  	.atomic_disable = hibmc_dp_encoder_disable,
>  };
>  
> +static int hibmc_dp_cfg(struct hibmc_dp *dp)
> +{
> +	int ret;
> +
> +	ret = hibmc_dp_hw_init(dp);
> +	if (ret)
> +		return ret;
> +
> +	hibmc_dp_display_en(dp, false);

Does this enable video signal? You should only enable AUX and perform
link training at this point.

> +
> +	return 0;
> +}
> +
> +irqreturn_t hibmc_dp_hpd_event_isr(int irq, void *arg)
> +{
> +	struct drm_device *dev = (struct drm_device *)arg;
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	enum hibmc_dp_hpd_status status;
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return -ENODEV;
> +
> +	status  = hibmc_dp_get_hpd_status(&priv->dp);
> +	if (status == HIBMC_DP_HPD_IN) {
> +		if (!(priv->dp.hpd_status & DP_MASKED_SINK_HPD_PLUG_INT))
> +			goto err;
> +		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
> +		hibmc_dp_cfg(&priv->dp);
> +		drm_kms_helper_connector_hotplug_event(&priv->dp.connector);
> +	} else if (status == HIBMC_DP_HPD_OUT) {
> +		if (!(priv->dp.hpd_status & DP_MASKED_SINK_HPD_UNPLUG_INT))
> +			goto err;
> +		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
> +		drm_kms_helper_connector_hotplug_event(&priv->dp.connector);

This looks like a hand-coded drm_connector_helper_hpd_irq_event()

> +	} else {
> +		drm_warn(&priv->dev, "HPD unknown isr occur, status: %d\n", status);
> +	}
> +
> +err:
> +	priv->dp.hpd_status = 0;
> +
> +	drm_dev_exit(idx);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  int hibmc_dp_init(struct hibmc_drm_private *priv)
>  {
>  	struct drm_device *dev = &priv->dev;
> @@ -93,14 +144,12 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
>  	dp->mmio = priv->mmio;
>  	dp->drm_dev = dev;
>  
> -	ret = hibmc_dp_hw_init(&priv->dp);
> +	ret = hibmc_dp_cfg(dp);
>  	if (ret) {
> -		drm_err(dev, "hibmc dp hw init failed: %d\n", ret);
> +		drm_err(dev, "hibmc dp cfg failed: %d\n", ret);
>  		return ret;
>  	}
>  
> -	hibmc_dp_display_en(&priv->dp, false);
> -
>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index bade693d9730..199acb3e7a73 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -29,9 +29,13 @@
>  #include "hibmc_drm_regs.h"
>  
>  #define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
> +#define HIBMC_DP_INTSTAT		0x1e0724
> +#define HIBMC_DP_INTCLR			0x1e0728

Why are those defined outside of hibmc_drm_regs.h?

>  
>  DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  
> +static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", "hpd" };
> +
>  static irqreturn_t hibmc_interrupt(int irq, void *arg)
>  {
>  	struct drm_device *dev = (struct drm_device *)arg;
> @@ -49,6 +53,22 @@ static irqreturn_t hibmc_interrupt(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t hibmc_dp_interrupt(int irq, void *arg)
> +{
> +	struct drm_device *dev = (struct drm_device *)arg;
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	u32 status;
> +
> +	status = readl(priv->mmio + HIBMC_DP_INTSTAT);
> +	if (status) {
> +		priv->dp.hpd_status = status;
> +		writel(status, priv->mmio + HIBMC_DP_INTCLR);
> +		return IRQ_WAKE_THREAD;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			     struct drm_mode_create_dumb *args)
>  {
> @@ -248,15 +268,52 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
>  	return 0;
>  }
>  
> -static int hibmc_unload(struct drm_device *dev)
> +static void hibmc_unload(struct drm_device *dev)
> +{
> +	drm_atomic_helper_shutdown(dev);
> +
> +	pci_disable_msi(to_pci_dev(dev->dev));
> +}
> +
> +static int hibmc_msi_init(struct drm_device *dev)
>  {
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +	int ret;
>  
> -	drm_atomic_helper_shutdown(dev);
> +	ret = pci_alloc_irq_vectors(pdev, HIBMC_MIN_VECTORS,
> +				    HIBMC_MAX_VECTORS, PCI_IRQ_MSI);
> +	if (ret < 0) {
> +		drm_err(dev, "enabling MSI failed: %d\n", ret);
> +		return ret;
> +	}
>  
> -	free_irq(pdev->irq, dev);
> +	priv->valid_irq_num = ret;
>  
> -	pci_disable_msi(to_pci_dev(dev->dev));
> +	priv->irqs = drmm_kcalloc(dev, priv->valid_irq_num,
> +				  sizeof(struct hibmc_irq), GFP_KERNEL);

Why do you need an extra pointer?  You know that there are no more than
HIBMC_MAX_VECTORS, so you can have this data as a part of your private
structure.

> +	if (!priv->irqs)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < priv->valid_irq_num; i++) {
> +		snprintf(priv->irqs[i].name, sizeof(priv->irqs[i].name) - 1, "%s-%s-%s",
> +			 dev->driver->name, pci_name(pdev), g_irqs_names_map[i]);
> +
> +		priv->irqs[i].irq_num = pci_irq_vector(pdev, i);
> +
> +		if (i)
> +			/* PCI devices require shared interrupts. */
> +			ret = devm_request_threaded_irq(&pdev->dev, priv->irqs[i].irq_num,
> +							hibmc_dp_interrupt, hibmc_dp_hpd_event_isr,
> +							IRQF_SHARED, priv->irqs[i].name, dev);
> +		else
> +			ret = devm_request_irq(&pdev->dev, priv->irqs[i].irq_num, hibmc_interrupt,
> +					       IRQF_SHARED, priv->irqs[i].name, dev);

This feels like "too many changes". You have MSI-related changes, devm_,
your HPD interrupt. Please split this patch into logical parts.

> +		if (ret) {
> +			drm_err(dev, "install irq failed: %d\n", ret);
> +			return ret;
> +		}
> +	}
>  
>  	return 0;
>  }
> @@ -288,15 +345,10 @@ static int hibmc_load(struct drm_device *dev)
>  		goto err;
>  	}
>  
> -	ret = pci_enable_msi(pdev);
> +	ret = hibmc_msi_init(dev);
>  	if (ret) {
> -		drm_warn(dev, "enabling MSI failed: %d\n", ret);
> -	} else {
> -		/* PCI devices require shared interrupts. */
> -		ret = request_irq(pdev->irq, hibmc_interrupt, IRQF_SHARED,
> -				  dev->driver->name, dev);
> -		if (ret)
> -			drm_warn(dev, "install irq failed: %d\n", ret);
> +		drm_err(dev, "hibmc msi init failed, ret:%d\n", ret);
> +		goto err;
>  	}
>  
>  	/* reset all the states of crtc/plane/encoder/connector */
> @@ -372,7 +424,7 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
>  
>  static void hibmc_pci_shutdown(struct pci_dev *pdev)
>  {
> -	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
> +	hibmc_pci_remove(pdev);
>  }
>  
>  static const struct pci_device_id hibmc_pci_table[] = {
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index bc89e4b9f4e3..764e211a8779 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -22,6 +22,14 @@
>  
>  #include "dp/dp_hw.h"
>  
> +#define HIBMC_MIN_VECTORS	1
> +#define HIBMC_MAX_VECTORS	2
> +
> +struct hibmc_irq {
> +	s32 irq_num;
> +	char name[32];
> +};
> +
>  struct hibmc_vdac {
>  	struct drm_device *dev;
>  	struct drm_encoder encoder;
> @@ -40,6 +48,10 @@ struct hibmc_drm_private {
>  	struct drm_crtc crtc;
>  	struct hibmc_vdac vdac;
>  	struct hibmc_dp dp;
> +
> +	/* irqs */
> +	struct hibmc_irq *irqs;
> +	u32 valid_irq_num;
>  };
>  
>  static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
> @@ -71,4 +83,6 @@ int hibmc_dp_init(struct hibmc_drm_private *priv);
>  
>  void hibmc_debugfs_init(struct drm_connector *connector, struct dentry *root);
>  
> +irqreturn_t hibmc_dp_hpd_event_isr(int irq, void *arg);
> +
>  #endif
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
