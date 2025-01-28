Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D867CA20CC3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 16:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CB810E684;
	Tue, 28 Jan 2025 15:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NwQ7dXMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9807610E684
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:17:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-540215984f0so5853867e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 07:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738077454; x=1738682254; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3k9xmSB3vztANhnudpYYJcySI+GfOUJ6DdM4mJFQHZE=;
 b=NwQ7dXMxNc+c0vikKcKdbwpeKBd6iAcQpBsNRYNzmRyoxlSHQnRFS/yuwId5+FTt12
 0vos6N2ZnRLHuy6048qgBYeTGtoEihbpV+iZUOoIYPWuNgzG3zC4C/IAkhMFjtlfTwSY
 OYjad127IqyQzB4VrOqJoZ2tGwLeNq6xx+j7tWE6mGH4XDvDwB41AUMAMygtIcfCpaie
 qqFbu0KbYI+eQlNcOcVkumBXKrTcaKN2tRDyXEMfXwZhs3dLopt6y2GV2oQXmQHaMTAI
 q2TcljknD4HuI4nPMV6Of7yCuQCJgE5Kh7XH5Cc54VDGSL0FGrsycLuKNOwhLWzSXVTm
 pbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738077454; x=1738682254;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3k9xmSB3vztANhnudpYYJcySI+GfOUJ6DdM4mJFQHZE=;
 b=PRTpe+r8ExHDl9sC93Yi7QM3TMlZwYiiPjkijydM4ki3hOwqexgFyrbzlZzWPBYHWE
 v55zMoRW85YEpSk1DE6JBMqf5QCduIvyxtiJHfBGWjY7A30jCrjAfV2VV1rWxP2hg72w
 VNNC1MwQMhw6ZMd5O0iC7BI10cs2ix6vulpMSKR36LQyhfU/WPcPM97BsIwYY2y0wq/Y
 wdA/F+yOfpCaoybzCWJiVuF6KjTHPT7BWmsKjoZq4pzxdpNZw+znMigfNrrlYo6xvtHB
 LZJZvkBp6mv5gMasnE+DVedjKs9rrSz+Ax12kon7Wff8J8s0dQc6+V9EGoghkqDHFPHs
 Dv8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjp7JVezDlwPuf2N1yjUUqmpFNeEUouuNWbW6I8+CTyDrnBDLWv9OwxaMRtrTHecMZ1RhjdESZmSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5k/8BArMpp2D8/c+9+A4rvqCQoByM1cMjleCfdf1DKwtTzLoV
 2VOJcgC7JBEmF2bJNMP2BA6YjTXA8pPdL2/Z+y7sZrV0kHMXdRKBhm8FVyEh0cA=
X-Gm-Gg: ASbGncvMqgKTQw1Lvv7QAVPVD3SktkUhRkHQ8ZiD/+Z9qbRlgglYUlLyaVI5mPQjxik
 5jLjgOa/KKQYhJ0dRvPxWV0SsBFHwnn2lcD2+PiKU/5+F0rkJOMgwz+K8wjwdtlUeIqZ/iqqJQ5
 6Qa/d5VdmKJqUq5kkAAhI+CqwLxU+rIe089uc5JxlC+T77wMp5lA8JscgSr/UHkJX5bFfHCnxvU
 XAXKQes+/nEmyJcMDWy04wz8iZFoTvYrT1RTOLpuZbVcQ8FOaPxiQfBH+nNlCpG7o7ThJfTaj3m
 rbyD0+Ud1hOetTn2/klRJtfP/H574603Fnz6d3OBEdugrWCSNRfpoEq0aTZbX5lM8LBMHV4=
X-Google-Smtp-Source: AGHT+IH4UrEDOJkOYaE+64I5o9fwWd5qV092PCBuD/MBfvkaNl+YbgSX45B96vFshHlLQdtQSuWElw==
X-Received: by 2002:a05:6512:2394:b0:542:2972:4e1e with SMTP id
 2adb3069b0e04-5439c2471f0mr16857641e87.12.1738077453757; 
 Tue, 28 Jan 2025 07:17:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c836852csm1656415e87.127.2025.01.28.07.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 07:17:32 -0800 (PST)
Date: Tue, 28 Jan 2025 17:17:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 drm-dp 4/4] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
Message-ID: <doiwtmo6thazhha4kv7wsio3pidvwvk35gc4anjcsacfddunbg@tcbqs2pxdxb6>
References: <20250127032024.1542219-1-shiyongbang@huawei.com>
 <20250127032024.1542219-5-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127032024.1542219-5-shiyongbang@huawei.com>
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

On Mon, Jan 27, 2025 at 11:20:24AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> This is a series of functions about getting dp connector status
> function, registering irq function, interrupt handler function, and
> hpd event process function to realize DP HPD feature.

Please follow the Documentation/process/submit-checklist.rst. Start with
the problem description, then describe what is being done.

Also, does it make sense to implement the enable_hpd() and disable_hpd()
callbacks for your connector?

> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 30 +++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  2 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 61 ++++++++++++++-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 78 +++++++++++++++----
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   | 14 ++++
>  7 files changed, 171 insertions(+), 17 deletions(-)
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
> index 9c8b91ff0e3b..1797b40e54fc 100644
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
> @@ -284,3 +285,32 @@ void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
>  	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
>  	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
>  }
> +
> +enum hibmc_dp_hpd_status hibmc_dp_get_hpd_status(const struct hibmc_dp *dp)
> +{
> +	enum hibmc_dp_hpd_status status;
> +	u32 val;
> +
> +	mdelay(100);


why?

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
> +
> +	return status;
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index f2f59f2feb3c..6f1da7a0b9e7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -61,6 +61,7 @@ struct hibmc_dp {
>  	struct drm_dp_aux aux;
>  	struct hibmc_dp_cbar_cfg cfg;
>  	bool is_inited;
> +	u32 hpd_status;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> @@ -70,5 +71,6 @@ int hibmc_dp_get_dpcd(struct hibmc_dp *dp);
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
> index cc1f9ee0656f..e4aee75e12e8 100644
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
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct hibmc_dp *dp = to_hibmc_dp(connector);
> @@ -106,6 +110,57 @@ static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
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
> +
> +	return 0;
> +}
> +
> +irqreturn_t hibmc_dp_hpd_event_isr(int irq, void *arg)
> +{
> +	struct drm_device *dev = (struct drm_device *)arg;
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	enum hibmc_dp_hpd_status status;
> +	struct drm_display_mode *mode;
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
> +		mode = &priv->crtc.state->adjusted_mode;
> +		hibmc_dp_prepare(&priv->dp, mode);
> +		hibmc_dp_display_en(&priv->dp, true);

No, please don't enable the display without the framework telling you to
do so.

> +	} else if (status == HIBMC_DP_HPD_OUT) {
> +		if (!(priv->dp.hpd_status & DP_MASKED_SINK_HPD_UNPLUG_INT))
> +			goto err;
> +		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
> +		hibmc_dp_display_en(&priv->dp, false);
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
> @@ -118,14 +173,12 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
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
> index 3d4d5185c523..42323ff89309 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -29,9 +29,13 @@
>  #include "hibmc_drm_regs.h"
>  
>  #define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
> +#define HIBMC_DP_INTSTAT		0x1e0724
> +#define HIBMC_DP_INTCLR			0x1e0728
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
> @@ -375,7 +427,7 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
>  
>  static void hibmc_pci_shutdown(struct pci_dev *pdev)
>  {
> -	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
> +	hibmc_pci_remove(pdev);
>  }
>  
>  static const struct pci_device_id hibmc_pci_table[] = {
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index ff61efb8a2ab..3bc4194689cb 100644
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
>  void hibmc_debugfs_register(struct hibmc_drm_private *priv);
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
