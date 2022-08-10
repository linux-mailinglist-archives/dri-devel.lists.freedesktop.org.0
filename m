Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2C58F305
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 21:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25840113DE7;
	Wed, 10 Aug 2022 19:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68591400
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=0cifcFno1Bujwcj4DGyDEUKRSeBT35xyYqZdDXPdDTQ=;
 b=RSU9YhFxnNWfoLIlgmXo11lumfZtfmZFP0ph/knbb2mqBMzpy7AM1CdSrMk3eIKIaRGwSneAFePBH
 2k7bk3LcGYG/dc1S8dznmzwX4uY0Be7sRTwoQ54jhQ0NT+cf353wYlw3FUSYx53EFcwA3rdpVNPKyc
 BA6S52MQIdk39BReBC+9Fp4idsDr3lqdqwpUXU0BUowtUZ6vidF+s9mhDjJZ7hu446FIz1xaut+DKa
 opfo4O0MPmbKKSiHmoUH2UT1rKgaLjK48B7nqjkRuN6qeAlCkZHHD0QQpJPdiNgw6/S9HUIHMvGc0/
 xfVJGbdw1E5JMQJ5nWcnShRAOIO32mQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=0cifcFno1Bujwcj4DGyDEUKRSeBT35xyYqZdDXPdDTQ=;
 b=Dzc6Xtls8HS0BUIUEu7XkglpfG9sdcyTrDrIvSVcnShjCMmruUE/Wyo3W571XsjMfH6zx1tjwvPrc
 u7US9znCw==
X-HalOne-Cookie: d44dc801f8d6cdf3063665698d7d5a0e9f008e78
X-HalOne-ID: 5819626f-18e2-11ed-a6cc-d0431ea8a283
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 5819626f-18e2-11ed-a6cc-d0431ea8a283;
 Wed, 10 Aug 2022 19:26:34 +0000 (UTC)
Date: Wed, 10 Aug 2022 21:26:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] drm/probe-helper: Add
 drm_crtc_helper_mode_valid_static()
Message-ID: <YvQGaIfkske73Dgp@ravnborg.org>
References: <20220810112053.19547-1-tzimmermann@suse.de>
 <20220810112053.19547-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810112053.19547-3-tzimmermann@suse.de>
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
Cc: david@lechnology.com, emma@anholt.net, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 kamlesh.gurudasani@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Aug 10, 2022 at 01:20:51PM +0200, Thomas Zimmermann wrote:
> Add drm_crtc_helper_mode_valid_static(), which validates a given mode
> against a display hardware's mode. Convert simpledrm and use it in a
> few other drivers with static modes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

With the header file fixed,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_mipi_dbi.c               | 18 ++++++++++++++
>  drivers/gpu/drm/drm_probe_helper.c           | 25 ++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c |  1 +
>  drivers/gpu/drm/tiny/hx8357d.c               |  1 +
>  drivers/gpu/drm/tiny/ili9163.c               |  1 +
>  drivers/gpu/drm/tiny/ili9341.c               |  1 +
>  drivers/gpu/drm/tiny/ili9486.c               |  1 +
>  drivers/gpu/drm/tiny/mi0283qt.c              |  1 +
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c        |  1 +
>  drivers/gpu/drm/tiny/repaper.c               | 10 ++++++++
>  drivers/gpu/drm/tiny/simpledrm.c             | 10 +-------
>  drivers/gpu/drm/tiny/st7735r.c               |  1 +
>  include/drm/drm_mipi_dbi.h                   |  2 ++
>  include/drm/drm_probe_helper.h               |  8 +++++--
>  14 files changed, 70 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index b67ec9a5cda9..d544a99df9df 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -309,6 +309,24 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
>  	drm_dev_exit(idx);
>  }
>  
> +/**
> + * mipi_dbi_pipe_mode_valid - MIPI DBI mode-valid helper
> + * @pipe: Simple display pipe
> + * @mode: The mode to test
> + *
> + * This function validates a given display mode against the MIPI DBI's hardware
> + * display. Drivers can use this as their &drm_simple_display_pipe_funcs->mode_valid
> + * callback.
> + */
> +enum drm_mode_status mipi_dbi_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
> +					      const struct drm_display_mode *mode)
> +{
> +	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
> +
> +	return drm_crtc_helper_mode_valid_static(&pipe->crtc, mode, &dbidev->mode);
> +}
> +EXPORT_SYMBOL(mipi_dbi_pipe_mode_valid);
> +
>  /**
>   * mipi_dbi_pipe_update - Display pipe update helper
>   * @pipe: Simple display pipe
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 809187377e4e..bc3876853fca 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1014,6 +1014,31 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_helper_hpd_irq_event);
>  
> +/**
> + * drm_crtc_helper_mode_valid_static - Validates a display mode
> + * @crtc: the crtc
> + * @mode: the mode to validate
> + * @hw_mode: the display hardware's mode
> + *
> + * Returns:
> + * MODE_OK on success, or another mode-status code otherwise.
> + */
> +enum drm_mode_status drm_crtc_helper_mode_valid_static(struct drm_crtc *crtc,
> +						       const struct drm_display_mode *mode,
> +						       const struct drm_display_mode *hw_mode)
> +{
> +
> +	if (mode->hdisplay != hw_mode->hdisplay && mode->vdisplay != hw_mode->vdisplay)
> +		return MODE_ONE_SIZE;
> +	else if (mode->hdisplay != hw_mode->hdisplay)
> +		return MODE_ONE_WIDTH;
> +	else if (mode->vdisplay != hw_mode->vdisplay)
> +		return MODE_ONE_HEIGHT;
> +
> +	return MODE_OK;
> +}
> +EXPORT_SYMBOL(drm_crtc_helper_mode_valid_static);
> +
>  /**
>   * drm_connector_helper_get_modes_from_ddc - Updates the connector's EDID
>   *                                           property from the connector's
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 7da09e34385d..39dc40cf681f 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -576,6 +576,7 @@ static void ili9341_dbi_enable(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs ili9341_dbi_funcs = {
> +	.mode_valid = mipi_dbi_pipe_mode_valid,
>  	.enable = ili9341_dbi_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
> index 57f229a785bf..48c24aa8c28a 100644
> --- a/drivers/gpu/drm/tiny/hx8357d.c
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -181,6 +181,7 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs hx8357d_pipe_funcs = {
> +	.mode_valid = mipi_dbi_pipe_mode_valid,
>  	.enable = yx240qv29_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
> index 86439e50e304..9a1a5943bee0 100644
> --- a/drivers/gpu/drm/tiny/ili9163.c
> +++ b/drivers/gpu/drm/tiny/ili9163.c
> @@ -100,6 +100,7 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs ili9163_pipe_funcs = {
> +	.mode_valid = mipi_dbi_pipe_mode_valid,
>  	.enable = yx240qv29_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
> index b8826a0b086b..69b265e78096 100644
> --- a/drivers/gpu/drm/tiny/ili9341.c
> +++ b/drivers/gpu/drm/tiny/ili9341.c
> @@ -137,6 +137,7 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs ili9341_pipe_funcs = {
> +	.mode_valid = mipi_dbi_pipe_mode_valid,
>  	.enable = yx240qv29_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index a5b433a8e0d8..c80028bb1d11 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -150,6 +150,7 @@ static void waveshare_enable(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs waveshare_pipe_funcs = {
> +	.mode_valid = mipi_dbi_pipe_mode_valid,
>  	.enable = waveshare_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
> index 27f1bd4da2f4..bc522fb3d94d 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> @@ -141,6 +141,7 @@ static void mi0283qt_enable(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs mi0283qt_pipe_funcs = {
> +	.mode_valid = mipi_dbi_pipe_mode_valid,
>  	.enable = mi0283qt_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> index a76fefa8adbc..955a61d628e7 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -212,6 +212,7 @@ static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs panel_mipi_dbi_pipe_funcs = {
> +	.mode_valid = mipi_dbi_pipe_mode_valid,
>  	.enable = panel_mipi_dbi_enable,
>  	.disable = mipi_dbi_pipe_disable,
>  	.update = mipi_dbi_pipe_update,
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 855968fd46af..a7995a3c9397 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -621,6 +621,15 @@ static void power_off(struct repaper_epd *epd)
>  	gpiod_set_value_cansleep(epd->discharge, 0);
>  }
>  
> +static enum drm_mode_status repaper_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
> +						    const struct drm_display_mode *mode)
> +{
> +	struct drm_crtc *crtc = &pipe->crtc;
> +	struct repaper_epd *epd = drm_to_epd(crtc->dev);
> +
> +	return drm_crtc_helper_mode_valid_static(crtc, mode, epd->mode);
> +}
> +
>  static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
>  				struct drm_crtc_state *crtc_state,
>  				struct drm_plane_state *plane_state)
> @@ -831,6 +840,7 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
> +	.mode_valid = repaper_pipe_mode_valid,
>  	.enable = repaper_pipe_enable,
>  	.disable = repaper_pipe_disable,
>  	.update = repaper_pipe_update,
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 2d5b56c4a77d..31d3bc6c5acf 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -570,15 +570,7 @@ static enum drm_mode_status simpledrm_crtc_helper_mode_valid(struct drm_crtc *cr
>  {
>  	struct simpledrm_device *sdev = simpledrm_device_of_dev(crtc->dev);
>  
> -	if (mode->hdisplay != sdev->mode.hdisplay &&
> -	    mode->vdisplay != sdev->mode.vdisplay)
> -		return MODE_ONE_SIZE;
> -	else if (mode->hdisplay != sdev->mode.hdisplay)
> -		return MODE_ONE_WIDTH;
> -	else if (mode->vdisplay != sdev->mode.vdisplay)
> -		return MODE_ONE_HEIGHT;
> -
> -	return MODE_OK;
> +	return drm_crtc_helper_mode_valid_static(crtc, mode, &sdev->mode);
>  }
>  
>  static int simpledrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
> index d2042a0f02dd..c36ba08acda1 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -133,6 +133,7 @@ static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
>  }
>  
>  static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
> +	.mode_valid	= mipi_dbi_pipe_mode_valid,
>  	.enable		= st7735r_pipe_enable,
>  	.disable	= mipi_dbi_pipe_disable,
>  	.update		= mipi_dbi_pipe_update,
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index dad2f187b64b..14eaecb1825c 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -155,6 +155,8 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
>  int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
>  		      const struct drm_simple_display_pipe_funcs *funcs,
>  		      const struct drm_display_mode *mode, unsigned int rotation);
> +enum drm_mode_status mipi_dbi_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
> +					      const struct drm_display_mode *mode);
>  void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
>  			  struct drm_plane_state *old_state);
>  void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index 5a883ee9fc32..22b283b35654 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -3,11 +3,11 @@
>  #ifndef __DRM_PROBE_HELPER_H__
>  #define __DRM_PROBE_HELPER_H__
>  
> -#include <linux/types.h>
> +#include <drm/drm_modes.h>
There is no reason to pull in the header, a forward of struct drm_display_mode
should be enough. I expect this to be a left-over from a previous
iteration.

>  
>  struct drm_connector;
> +struct drm_crtc;
>  struct drm_device;
> -struct drm_display_mode;
>  struct drm_modeset_acquire_ctx;
>  
>  int drm_helper_probe_single_connector_modes(struct drm_connector
> @@ -27,6 +27,10 @@ void drm_kms_helper_poll_disable(struct drm_device *dev);
>  void drm_kms_helper_poll_enable(struct drm_device *dev);
>  bool drm_kms_helper_is_poll_worker(void);
>  
> +enum drm_mode_status drm_crtc_helper_mode_valid_static(struct drm_crtc *crtc,
> +						       const struct drm_display_mode *mode,
> +						       const struct drm_display_mode *hw_mode);
> +
>  int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
>  int drm_connector_helper_get_modes_static(struct drm_connector *connector,
>  					  const struct drm_display_mode *hw_mode);
> -- 
> 2.37.1
