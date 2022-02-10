Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21EC4B07DD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D644510E75D;
	Thu, 10 Feb 2022 08:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61B910E757
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1644480693; x=1676016693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxwlpMor//gWyfrKqUosYwhSlC3K9cpcg5I1mRkNgBA=;
 b=nnrr5uiaoeMkXZiEORO/ZC4pdEtWIb99AexeaQJ7TbDIwo5h+6CzfqYP
 Rfls+wC63Gg//M6Azip9BDSy1eG6RpYKQi8iW1aNjSfoPC3INy65rlbxJ
 QbP7StubeqMqtB17twfIcXIf4PuYjjJh8BGJ24DoAaEUmH2x6r0P7xsJI
 UPm+wkbu7Was+T0L36WyX8ir9dxFxn1tcKc14Iu+AGcqA0pk5kwlLjJ7S
 tmvKQVS80b3LF+aWfYsaTyGqWXgbQONBodo3A+BZnQKA6Gp+3ni9TAo95
 GmTt8wRYonY4ducOxEY0imNW375iFRBF3GH19LvYl8EGmLWpdA7pI0Dv/ Q==;
X-IronPort-AV: E=Sophos;i="5.88,358,1635199200"; d="scan'208";a="22005705"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 10 Feb 2022 09:11:30 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 10 Feb 2022 09:11:30 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 10 Feb 2022 09:11:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1644480690; x=1676016690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxwlpMor//gWyfrKqUosYwhSlC3K9cpcg5I1mRkNgBA=;
 b=pUD2W9KZbrVkexw76vwAQ9hTSK798St0HaiRt1LTmGMGvHKUG9I5tqN3
 yVwJzPJvXWMkSn4CrDvVbhQgrbhAo+bnOIGzh0Sw4BvzEcmJvqKzpVFP6
 7XS8gQf09/Xpyqdz+1qa2YBHltER00su6mvoubZpq1Xn7bi6B0oQIwOZ7
 Rb8slwK6c4zbI+sdQjyWgZraqdSg3o4Iw4rToWQE5Edx2WP2ImTULaC6w
 e5m3cuz44Dt0TbWVKsvZiPuhoib6sHnpFWc7xq3XW05q4RLP7sFhzB8E7
 EIlHi0PD2cARc4WavJf/XYHGc897pTD/+yasHrXmXkAnprY1DdEwO9fSk Q==;
X-IronPort-AV: E=Sophos;i="5.88,358,1635199200"; d="scan'208";a="22005704"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Feb 2022 09:11:30 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 00B9B280065;
 Thu, 10 Feb 2022 09:11:29 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: (EXT) [PATCH] drm: mxsfb: Simplify LCDIF clock handling
Date: Thu, 10 Feb 2022 09:11:27 +0100
Message-ID: <7286643.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220206185555.275768-1-marex@denx.de>
References: <20220206185555.275768-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

I like the overall idea. Thanks for the effort.

Am Sonntag, 6. Februar 2022, 19:55:55 CET schrieb Marek Vasut:
> The current clock handling in the LCDIF driver is a convoluted mess.
> Implement runtime PM ops which turn the clock ON and OFF and let the
> pm_runtime_get_sync()/pm_runtime_put_sync() calls in .atomic_enable
> and .atomic_disable callbacks turn the clock ON and OFF at the right
> time.

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 85 ++++++++++++++++++-------------
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 18 ++-----
>  2 files changed, 54 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c index 375f26d4a4172..4ff3c6195dd0c
> 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -72,18 +72,6 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  	},
>  };
> 
> -void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb)
> -{
> -	if (mxsfb->clk_axi)
> -		clk_prepare_enable(mxsfb->clk_axi);
> -}
> -
> -void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb)
> -{
> -	if (mxsfb->clk_axi)
> -		clk_disable_unprepare(mxsfb->clk_axi);
> -}
> -

The declarations for mxsfb_enable_axi_clk() and mxsfb_disable_axi_clk() are 
still in drivers/gpu/drm/mxsfb/mxsfb_drv.h. Please remove them as well.
You will then notice that they are still used at some places.

>  static struct drm_framebuffer *
>  mxsfb_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  		const struct drm_mode_fb_cmd2 *mode_cmd)
> @@ -224,33 +212,31 @@ static int mxsfb_load(struct drm_device *drm,
>  	if (IS_ERR(mxsfb->clk))
>  		return PTR_ERR(mxsfb->clk);
> 
> -	mxsfb->clk_axi = devm_clk_get(drm->dev, "axi");
> +	mxsfb->clk_axi = devm_clk_get_optional(drm->dev, "axi");
>  	if (IS_ERR(mxsfb->clk_axi))
> -		mxsfb->clk_axi = NULL;
> +		return PTR_ERR(mxsfb->clk_axi);
> 
> -	mxsfb->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
> +	mxsfb->clk_disp_axi = devm_clk_get_optional(drm->dev, "disp_axi");
>  	if (IS_ERR(mxsfb->clk_disp_axi))
> -		mxsfb->clk_disp_axi = NULL;
> +		return PTR_ERR(mxsfb->clk_disp_axi);
> 
>  	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
> 
> -	pm_runtime_enable(drm->dev);
> -
>  	/* Modeset init */
>  	drm_mode_config_init(drm);
> 
>  	ret = mxsfb_kms_init(mxsfb);
>  	if (ret < 0) {
>  		dev_err(drm->dev, "Failed to initialize KMS 
pipeline\n");
> -		goto err_vblank;
> +		return ret;
>  	}
> 
>  	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
>  	if (ret < 0) {
>  		dev_err(drm->dev, "Failed to initialise vblank\n");
> -		goto err_vblank;
> +		return ret;
>  	}
> 
>  	/* Start with vertical blanking interrupt reporting disabled. */
> @@ -260,7 +246,7 @@ static int mxsfb_load(struct drm_device *drm,
>  	if (ret) {
>  		if (ret != -EPROBE_DEFER)
>  			dev_err(drm->dev, "Cannot connect bridge: 
%d\n", ret);
> -		goto err_vblank;
> +		return ret;
>  	}
> 
>  	drm->mode_config.min_width	= MXSFB_MIN_XRES;
> @@ -277,13 +263,10 @@ static int mxsfb_load(struct drm_device *drm,
>  		goto err_vblank;

You are still using err_vblank here which gets removed below.

Alexander

>  	mxsfb->irq = ret;
> 
> -	pm_runtime_get_sync(drm->dev);
>  	ret = mxsfb_irq_install(drm, mxsfb->irq);
> -	pm_runtime_put_sync(drm->dev);
> -
>  	if (ret < 0) {
>  		dev_err(drm->dev, "Failed to install IRQ handler\n");
> -		goto err_vblank;
> +		return ret;
>  	}
> 
>  	drm_kms_helper_poll_init(drm);
> @@ -292,12 +275,9 @@ static int mxsfb_load(struct drm_device *drm,
> 
>  	drm_helper_hpd_irq_event(drm);
> 
> -	return 0;
> -
> -err_vblank:
> -	pm_runtime_disable(drm->dev);
> +	pm_runtime_enable(drm->dev);
> 
> -	return ret;
> +	return 0;
>  }
> 
>  static void mxsfb_unload(struct drm_device *drm)
> @@ -305,9 +285,7 @@ static void mxsfb_unload(struct drm_device *drm)
>  	drm_kms_helper_poll_fini(drm);
>  	drm_mode_config_cleanup(drm);
> 
> -	pm_runtime_get_sync(drm->dev);
>  	mxsfb_irq_uninstall(drm);
> -	pm_runtime_put_sync(drm->dev);
> 
>  	drm->dev_private = NULL;
> 
> @@ -388,23 +366,60 @@ static void mxsfb_shutdown(struct platform_device
> *pdev) drm_atomic_helper_shutdown(drm);
>  }
> 
> -#ifdef CONFIG_PM_SLEEP
> +static int mxsfb_rpm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> +
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_disable_unprepare(mxsfb->clk);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_disable_unprepare(mxsfb->clk_disp_axi);
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_disable_unprepare(mxsfb->clk_axi);
> +
> +	return 0;
> +}
> +
> +static int mxsfb_rpm_resume(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> +
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_prepare_enable(mxsfb->clk_axi);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_prepare_enable(mxsfb->clk_disp_axi);
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_prepare_enable(mxsfb->clk);
> +
> +	return 0;
> +}
> +
>  static int mxsfb_suspend(struct device *dev)
>  {
>  	struct drm_device *drm = dev_get_drvdata(dev);
> +	int ret;
> 
> -	return drm_mode_config_helper_suspend(drm);
> +	ret = drm_mode_config_helper_suspend(drm);
> +	if (ret)
> +		return ret;
> +
> +	return mxsfb_rpm_suspend(dev);
>  }
> 
>  static int mxsfb_resume(struct device *dev)
>  {
>  	struct drm_device *drm = dev_get_drvdata(dev);
> 
> +	mxsfb_rpm_resume(dev);
> +
>  	return drm_mode_config_helper_resume(drm);
>  }
> -#endif
> 
>  static const struct dev_pm_ops mxsfb_pm_ops = {
> +	.runtime_suspend = mxsfb_rpm_suspend,
> +	.runtime_resume = mxsfb_rpm_resume,
>  	SET_SYSTEM_SLEEP_PM_OPS(mxsfb_suspend, mxsfb_resume)
>  };
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c index 0655582ae8ed6..03743a84c8e79
> 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -100,10 +100,6 @@ static void mxsfb_enable_controller(struct
> mxsfb_drm_private *mxsfb) {
>  	u32 reg;
> 
> -	if (mxsfb->clk_disp_axi)
> -		clk_prepare_enable(mxsfb->clk_disp_axi);
> -	clk_prepare_enable(mxsfb->clk);
> -
>  	/* Increase number of outstanding requests on all supported IPs */
>  	if (mxsfb->devdata->has_ctrl2) {
>  		reg = readl(mxsfb->base + LCDC_V4_CTRL2);
> @@ -168,10 +164,6 @@ static void mxsfb_disable_controller(struct
> mxsfb_drm_private *mxsfb) reg = readl(mxsfb->base + LCDC_VDCTRL4);
>  	reg &= ~VDCTRL4_SYNC_SIGNALS_ON;
>  	writel(reg, mxsfb->base + LCDC_VDCTRL4);
> -
> -	clk_disable_unprepare(mxsfb->clk);
> -	if (mxsfb->clk_disp_axi)
> -		clk_disable_unprepare(mxsfb->clk_disp_axi);
>  }
> 
>  /*
> @@ -352,9 +344,6 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc
> *crtc, dma_addr_t paddr;
> 
>  	pm_runtime_get_sync(drm->dev);
> -	mxsfb_enable_axi_clk(mxsfb);
> -
> -	drm_crtc_vblank_on(crtc);
> 
>  	/* If there is a bridge attached to the LCDIF, use its bus format 
*/
>  	if (mxsfb->bridge) {
> @@ -388,6 +377,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc
> *crtc, }
> 
>  	mxsfb_enable_controller(mxsfb);
> +
> +	drm_crtc_vblank_on(crtc);
>  }
> 
>  static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -397,6 +388,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc
> *crtc, struct drm_device *drm = mxsfb->drm;
>  	struct drm_pending_vblank_event *event;
> 
> +	drm_crtc_vblank_off(crtc);
> +
>  	mxsfb_disable_controller(mxsfb);
> 
>  	spin_lock_irq(&drm->event_lock);
> @@ -407,9 +400,6 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc
> *crtc, }
>  	spin_unlock_irq(&drm->event_lock);
> 
> -	drm_crtc_vblank_off(crtc);
> -
> -	mxsfb_disable_axi_clk(mxsfb);
>  	pm_runtime_put_sync(drm->dev);
>  }



