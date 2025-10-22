Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEB5BFC501
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A1710E799;
	Wed, 22 Oct 2025 13:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="iAjzbENW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F114F10E799
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:55:27 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MDtFbw281139;
 Wed, 22 Oct 2025 08:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1761141315;
 bh=KRk0qaCDATGfJuje+GUpPYzA+/Ljos4ngAQuB0Hz3ds=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=iAjzbENWL7IhE/83/SbVtC4UAa9z3N37BVFp7XmprTWi544PUt/ISsvtRdlYr/Ys/
 5NbJBcm1RKgxhzs9wJmvSLipRI8VIpSdb8GqAxgJ0NmbgBvQniegGiNHrizPpwiPxM
 nul5XAEpAm14pq8wvUNn+nqSm3ZWL4uUDlZA9hf0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MDtEbb1971353
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 22 Oct 2025 08:55:14 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 22
 Oct 2025 08:55:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 08:55:14 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MDtBeB1292249;
 Wed, 22 Oct 2025 08:55:11 -0500
Message-ID: <348086ac-b5bc-4ca9-9e5b-82106d319eeb@ti.com>
Date: Wed, 22 Oct 2025 19:25:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tidss: Add some support for splash-screen
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-kernel@vger.kernel.org>
References: <20250908-tidss-splash-v2-1-e388b0581dfa@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250908-tidss-splash-v2-1-e388b0581dfa@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 08/09/25 14:43, Tomi Valkeinen wrote:
> Currently when the driver's probe is called, we do a full DSS reset. If
> the bootloader has set up a splash-screen, the reset will disable the
> video output, and after that it may still take time until the display is
> usable (all the kernel modules have been loaded) and even more time
> until the userspace is able to use the display.
> 
> If fbdev is enabled, in a perfect case tidss would take over the fb
> memory set up by the bootloader, and use that memory for tidss's fbdev,
> thus retaining the splash-screen. However, we're not there yet.
> 
> As a partial solution, this patch changes the driver so that the driver
> will not reset (or change) the DSS registers until tidss_runtime_get()
> is called when the display is being set up (because of fbdev modesetting
> or modesetting from the userspace).
> 
> This is achieved in two parts:
> 
> 1. Probe
> 
> At probe time, in dispc_init_hw(), we check if the DSS is idle
> (videoports disabled). If yes, do a reset and continue as before. If
> not, we know that there's a splash-screen, and we set the
> 'tidss->boot_enabled_vp_mask' field to reflect the enabled VPs.
> 
> We then enable the corresponding VP clocks (to ensure they stay on), set
> the IRQENABLE to 0 to make sure we won't get any interrupts, and then
> exit leaving the fclk and VP clocks enabled, and the runtime PM status
> active.
> 
> 2. Runtime get
> 
> Later, when the tidss_runtime_get() is called the first time, we check
> the 'boot_enabled_vp_mask'. If set, we know that we have the
> splash-screen showing on the screen, and thus the clocks are enabled and
> runtime PM status is active. This indicates that
> pm_runtime_resume_and_get() call just before in tidss_runtime_get() did
> not cause a runtime_resume callback to get called, so we need to do that
> manually.
> 
> We call dispc_splash_fini() which essentially returns the DSS into the
> state where it would be in a non-splash-screen case: dispc_splash_fini()
> will do a DSS reset, manually call the runtime_resume callback, and then
> call clk_disable_unprepare() and pm_runtime_put_noidle() to counter the
> actions at probe time.
> 
> Finally 'boot_enabled_vp_mask' is set to zero to mark that we're no
> longer in the "splash-screen mode".
> 
> A note about fbdev emulation:
> 
> If fbdev emulation is enabled in the DRM, tidss will set up an fbdev.
> This will cause a modeset, and the blank framebuffer from tidss's fbdev
> will be shown instead of the splash-screen.
> 
> I see two improvements to this: either we should memcpy the pixel data
> from the bootloader's splash-screen to the new fbdev buffer, or the
> fbdev could use the splash-screen directly as its buffer. I have done
> some hacks for the former, but I'm not sure how to implement either of
> these properly.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> ---
> Changes in v2:
> - Rebased to latest drm-misc-next, and fixed the issues with the new
>    register access macros
> - Clarified the patch description a bit
> - Dropped the second patch "drm/tidss: Remove early fb", as it's already
>    in upstream
> - Link to v1: https://lore.kernel.org/r/20250416-tidss-splash-v1-0-4ff396eb5008@ideasonboard.com
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 127 ++++++++++++++++++++++++++++++++----
>   drivers/gpu/drm/tidss/tidss_dispc.h |   5 ++
>   drivers/gpu/drm/tidss/tidss_drv.c   |  29 +++++++-
>   drivers/gpu/drm/tidss/tidss_drv.h   |   2 +
>   4 files changed, 148 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 7c8c15a5c39b..1bf208cb227b 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2800,6 +2800,11 @@ void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
>   	dispc_vp_set_color_mgmt(dispc, hw_videoport, state, newmodeset);
>   }
>   
> +static bool dispc_is_idle(struct dispc_device *dispc)
> +{
> +	return REG_GET(dispc, DSS_SYSSTATUS, DSS_SYSSTATUS_DISPC_IDLE_STATUS);
> +}
> +
>   int dispc_runtime_suspend(struct dispc_device *dispc)
>   {
>   	dev_dbg(dispc->dev, "suspend\n");
> @@ -2940,7 +2945,7 @@ static int dispc_softreset(struct dispc_device *dispc)
>   	return 0;
>   }
>   
> -static int dispc_init_hw(struct dispc_device *dispc)
> +int dispc_init_hw(struct dispc_device *dispc)
>   {
>   	struct device *dev = dispc->dev;
>   	int ret;
> @@ -2957,15 +2962,70 @@ static int dispc_init_hw(struct dispc_device *dispc)
>   		goto err_runtime_suspend;
>   	}
>   
> -	ret = dispc_softreset(dispc);
> -	if (ret)
> -		goto err_clk_disable;
> +	dispc->tidss->boot_enabled_vp_mask = 0;
>   
> -	clk_disable_unprepare(dispc->fclk);
> -	ret = pm_runtime_set_suspended(dev);
> -	if (ret) {
> -		dev_err(dev, "Failed to set DSS PM to suspended\n");
> -		return ret;
> +	if (dispc_is_idle(dispc)) {
> +		ret = dispc_softreset(dispc);
> +		if (ret)
> +			goto err_clk_disable;
> +	} else {
> +		for (u32 vp_idx = 0; vp_idx < dispc->feat->num_vps; vp_idx++) {
> +			bool enabled = VP_REG_GET(dispc, vp_idx,
> +						  DISPC_VP_CONTROL,
> +						  DISPC_VP_CONTROL_ENABLE_MASK);
> +
> +			if (!enabled)
> +				continue;
> +
> +			dispc->tidss->boot_enabled_vp_mask |= BIT(vp_idx);
> +
> +			/* Keep the VP clk enabled */
> +			ret = clk_prepare_enable(dispc->vp_clk[vp_idx]);
> +			if (ret) {
> +				while (vp_idx--) {
> +					if (!(dispc->tidss->boot_enabled_vp_mask &
> +					      BIT(vp_idx)))
> +						continue;
> +
> +					clk_disable_unprepare(dispc->vp_clk[vp_idx]);
> +				}
> +
> +				goto err_clk_disable;
> +			}
> +		}
> +
> +		if (!dispc->tidss->boot_enabled_vp_mask) {
> +			dev_warn(dev,
> +				 "Bad HW state: DSS not idle but no VPs are enabled. Resetting.\n");
> +			ret = dispc_softreset(dispc);
> +			if (ret)
> +				goto err_clk_disable;
> +		} else {
> +			/*
> +			 * Do basic HW init here, which won't interrupt the
> +			 * splash-screen.
> +			 */
> +
> +			/* Ensure we won't get interrupts */
> +			dispc_set_irqenable(dispc, 0);
> +			dispc_read_and_clear_irqstatus(dispc);
> +		}
> +	}
> +
> +	if (dispc->tidss->boot_enabled_vp_mask) {
> +		dev_dbg(dev,
> +			"Bootloader splash-screen detected, leaving DSS active.\n");
> +		pm_runtime_get_noresume(dev);
> +	} else {
> +		/*
> +		 * No splash-screen. Disable the clock and set DSS back to suspended.
> +		 */
> +		clk_disable_unprepare(dispc->fclk);
> +		ret = pm_runtime_set_suspended(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to set DSS PM to suspended\n");
> +			return ret;
> +		}
>   	}
>   
>   	return 0;
> @@ -2983,6 +3043,28 @@ static int dispc_init_hw(struct dispc_device *dispc)
>   	return ret;
>   }
>   
> +void dispc_init_hw_cleanup(struct dispc_device *dispc)
> +{
> +	if (!dispc->tidss->boot_enabled_vp_mask)
> +		return;
> +
> +	/*
> +	 * Call clk_disable_unprepare() to counter the clk_prepare_enable() we
> +	 * did in the dispc_init_hw().
> +	 */
> +	clk_disable_unprepare(dispc->fclk);
> +
> +	for (u32 vp_idx = 0; vp_idx < dispc->feat->num_vps; vp_idx++) {
> +		if (dispc->tidss->boot_enabled_vp_mask & BIT(vp_idx))
> +			clk_disable_unprepare(dispc->vp_clk[vp_idx]);
> +	}
> +
> +	/* counter the pm_runtime_get_noresume() */
> +	pm_runtime_put_noidle(dispc->dev);
> +
> +	dispc->tidss->boot_enabled_vp_mask = 0;
> +}
> +
>   int dispc_init(struct tidss_device *tidss)
>   {
>   	struct device *dev = tidss->dev;
> @@ -3092,11 +3174,30 @@ int dispc_init(struct tidss_device *tidss)
>   	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
>   			     &dispc->memory_bandwidth_limit);
>   
> -	r = dispc_init_hw(dispc);
> -	if (r)
> -		return r;
> -
>   	tidss->dispc = dispc;
>   
>   	return 0;
>   }
> +
> +void dispc_splash_fini(struct dispc_device *dispc)
> +{
> +	if (WARN_ON(!dispc->tidss->boot_enabled_vp_mask))
> +		return;
> +
> +	/*
> +	 * Do a reset now, to clean up the bootloader setup, as we're about to
> +	 * do a modeset.
> +	 */
> +	dispc_softreset(dispc);
> +
> +	/*
> +	 * Call resume manually. This will clk_prepare_enable() the fclk, and do
> +	 * the common basic HW configuration.
> +	 */
> +	dispc_runtime_resume(dispc);
> +
> +	/*
> +	 * Revert the enables and gets we did in dispc_init_hw() at probe time.
> +	 */
> +	dispc_init_hw_cleanup(dispc);
> +}
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 60c1b400eb89..647ed013e080 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -152,4 +152,9 @@ const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
>   int dispc_init(struct tidss_device *tidss);
>   void dispc_remove(struct tidss_device *tidss);
>   
> +int dispc_init_hw(struct dispc_device *dispc);
> +void dispc_init_hw_cleanup(struct dispc_device *dispc);
> +
> +void dispc_splash_fini(struct dispc_device *dispc);
> +
>   #endif
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 27d9a8fd541f..eb6a57b8f682 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -36,8 +36,22 @@ int tidss_runtime_get(struct tidss_device *tidss)
>   	dev_dbg(tidss->dev, "%s\n", __func__);
>   
>   	r = pm_runtime_resume_and_get(tidss->dev);
> -	WARN_ON(r < 0);
> -	return r;
> +	if (WARN_ON(r < 0))
> +		return r;
> +
> +	if (tidss->boot_enabled_vp_mask) {
> +		/*
> +		 * If 'boot_enabled_vp_mask' is set, it means that the DSS is
> +		 * enabled and bootloader splash-screen is still on the screen,
> +		 * using bootloader's DSS HW config.
> +		 *
> +		 * This is the first time the driver is about to use the HW, and
> +		 * we need to do some cleanup and initial setup.
> +		 */
> +		dispc_splash_fini(tidss->dispc);
> +	}
> +
> +	return 0;
>   }
>   
>   void tidss_runtime_put(struct tidss_device *tidss)
> @@ -149,6 +163,12 @@ static int tidss_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	ret = dispc_init_hw(tidss->dispc);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize dispc HW: %d\n", ret);
> +		return ret;
> +	}
> +
>   	ret = tidss_oldi_init(tidss);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to init OLDI\n");
> @@ -211,6 +231,7 @@ static int tidss_probe(struct platform_device *pdev)
>   	tidss_irq_uninstall(ddev);
>   
>   err_runtime_suspend:
> +
>   #ifndef CONFIG_PM
>   	dispc_runtime_suspend(tidss->dispc);
>   #endif
> @@ -219,6 +240,8 @@ static int tidss_probe(struct platform_device *pdev)
>   
>   	tidss_oldi_deinit(tidss);
>   
> +	dispc_init_hw_cleanup(tidss->dispc);
> +
>   	return ret;
>   }
>   
> @@ -245,6 +268,8 @@ static void tidss_remove(struct platform_device *pdev)
>   
>   	tidss_oldi_deinit(tidss);
>   
> +	dispc_init_hw_cleanup(tidss->dispc);
> +
>   	/* devm allocated dispc goes away with the dev so mark it NULL */
>   	dispc_remove(tidss);
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index 84454a4855d1..c23091be2b60 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -39,6 +39,8 @@ struct tidss_device {
>   	/* protects the irq masks field and irqenable/irqstatus registers */
>   	spinlock_t irq_lock;
>   	dispc_irq_t irq_mask;	/* enabled irqs */
> +
> +	u32 boot_enabled_vp_mask;
>   };
>   
>   #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
> 
> ---
> base-commit: 685e8dae19df73d5400734ee5ad9e96470f9c0b4
> change-id: 20250416-tidss-splash-3d8f328b7160
> 
> Best regards,

