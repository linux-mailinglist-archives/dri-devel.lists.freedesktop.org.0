Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100C3B29E4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7706EA57;
	Thu, 24 Jun 2021 08:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88A6EA55;
 Thu, 24 Jun 2021 08:07:04 +0000 (UTC)
IronPort-SDR: 1WddGDXz9Ni8A4pCJcaYRLEYwC3dixz8y2XoMSQILsoLS88/l+RBYTZJ2GgZwb9ZrsVLZTvZM+
 creLIhaMdx+g==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="194722794"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="194722794"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:06:48 -0700
IronPort-SDR: 8/eo5APk4zdMXu0FN+wLrM/zTggRpAhTnkAmYTRZ+IPR7FPPJCkD/zsI3oSWpDppu7y95aJRLY
 6S2bQnOSmTDA==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="453335479"
Received: from schulke-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:06:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
In-Reply-To: <20210624072916.27703-5-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de>
Date: Thu, 24 Jun 2021 11:06:19 +0300
Message-ID: <87im23u1ok.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> For KMS drivers, replace the IRQ check in VBLANK ioctls with a check for
> vblank support. IRQs might be enabled wthout vblanking being supported.
>
> This change also removes the DRM framework's only dependency on IRQ state
> for non-legacy drivers. For legacy drivers with userspace modesetting,
> the original test remains in drm_wait_vblank_ioctl().
>
> v3:
> 	* optimize test in drm_wait_vblank_ioctl() for KMS case (Liviu)
> 	* update docs for drm_irq_uninstall()
> v2:
> 	* keep the old test for legacy drivers in
> 	  drm_wait_vblank_ioctl() (Daniel)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_irq.c    | 13 ++++---------
>  drivers/gpu/drm/drm_vblank.c | 16 ++++++++++++----
>  2 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index c3bd664ea733..945dd82e2ea3 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -74,10 +74,8 @@
>   * only supports devices with a single interrupt on the main device stored in
>   * &drm_device.dev and set as the device paramter in drm_dev_alloc().
>   *
> - * These IRQ helpers are strictly optional. Drivers which roll their own only
> - * need to set &drm_device.irq_enabled to signal the DRM core that vblank
> - * interrupts are working. Since these helpers don't automatically clean up the
> - * requested interrupt like e.g. devm_request_irq() they're not really
> + * These IRQ helpers are strictly optional. Since these helpers don't automatically
> + * clean up the requested interrupt like e.g. devm_request_irq() they're not really
>   * recommended.
>   */
>  
> @@ -91,9 +89,7 @@
>   * and after the installation.
>   *
>   * This is the simplified helper interface provided for drivers with no special
> - * needs. Drivers which need to install interrupt handlers for multiple
> - * interrupts must instead set &drm_device.irq_enabled to signal the DRM core
> - * that vblank interrupts are available.
> + * needs.
>   *
>   * @irq must match the interrupt number that would be passed to request_irq(),
>   * if called directly instead of using this helper function.
> @@ -156,8 +152,7 @@ EXPORT_SYMBOL(drm_irq_install);
>   *
>   * Calls the driver's &drm_driver.irq_uninstall function and unregisters the IRQ
>   * handler.  This should only be called by drivers which used drm_irq_install()
> - * to set up their interrupt handler. Other drivers must only reset
> - * &drm_device.irq_enabled to false.
> + * to set up their interrupt handler.
>   *
>   * Note that for kernel modesetting drivers it is a bug if this function fails.
>   * The sanity checks are only to catch buggy user modesetting drivers which call
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 3417e1ac7918..10fe16bafcb6 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	unsigned int pipe_index;
>  	unsigned int flags, pipe, high_pipe;
>  
> -	if (!dev->irq_enabled)
> -		return -EOPNOTSUPP;
> +#if defined(CONFIG_DRM_LEGACY)
> +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
> +		if (!dev->irq_enabled)
> +			return -EOPNOTSUPP;
> +	} else /* if DRIVER_MODESET */
> +#endif
> +	{
> +		if (!drm_dev_has_vblank(dev))
> +			return -EOPNOTSUPP;
> +	}

Sheesh I hate this kind of inline #ifdefs.

Two alternate suggestions that I believe should be as just efficient:

1) The more verbose:

#if defined(CONFIG_DRM_LEGACY)
static bool drm_wait_vblank_supported(struct drm_device *dev)
{
	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
		return dev->irq_enabled;
	else
		return drm_dev_has_vblank(dev);
}
#else
static bool drm_wait_vblank_supported(struct drm_device *dev)
{
	return drm_dev_has_vblank(dev);
}
#endif

2) The more compact:

static bool drm_wait_vblank_supported(struct drm_device *dev)
{
	if  (IS_ENABLED(CONFIG_DRM_LEGACY) && unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
		return dev->irq_enabled;
	else
		return drm_dev_has_vblank(dev);
}

Then, in drm_wait_vblank_ioctl().

	if (!drm_wait_vblank_supported(dev))
		return -EOPNOTSUPP;

The compiler should do the right thing without any explicit inline
keywords etc.

BR,
Jani.

>  
>  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>  		return -EINVAL;
> @@ -2023,7 +2031,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
> @@ -2082,7 +2090,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);

-- 
Jani Nikula, Intel Open Source Graphics Center
