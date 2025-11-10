Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BE1C48697
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 18:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6608410E274;
	Mon, 10 Nov 2025 17:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2cbKSP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766E710E2E1;
 Mon, 10 Nov 2025 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762796762; x=1794332762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rNxhafV1eenMHHAmTU6nOTjxT2gmS4nhDy+CSjrviGM=;
 b=f2cbKSP1Giak4MhQWz9807ly4HBGlaqZDDbDjPv+sKXrO9/m/2BSnyjz
 Z7L3+j0Y/qVtUpt8TWE+UPD5/c9wg4lOfpgWgsfXYar5HxrFDJxYPCSZE
 /XEls2h9DevIRWX3am5SENRvQa98YYiH93ZIWApf37ZXoHx7zAGpZOX0E
 Fa+KWyvE9LHoLJlZlormf2P/MQlt/keZgPdQMYdY7qeHSopIgvSKyRIaH
 KpzdnNbPzkqwwwedNk8JG8n1OJY6jmjIIs9++9QkkLSlsTk37/O2ZEgEm
 Lya8IylL/+iubSEdlJcK2RMdOpkNY9hvf7M0YAJrdGsrtP+HeOkhn6E6+ A==;
X-CSE-ConnectionGUID: T6vN8CsERRWO8/xnuW26Jg==
X-CSE-MsgGUID: XhPuYhJcQOWDeZC9TmHxyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64892682"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64892682"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 09:46:02 -0800
X-CSE-ConnectionGUID: 8BLSbjjwTeeSAbFQcIDzBQ==
X-CSE-MsgGUID: JLm2tNy7ROiaNsRFOqfDxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188039597"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.30])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 09:46:01 -0800
Date: Mon, 10 Nov 2025 19:45:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 23/24] drm/vblank: reduce pipe checks
Message-ID: <aRIk1Q6ivG6temIY@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
 <472777431de3c0f8a8d43e2ee7a55b3a170d138c.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <472777431de3c0f8a8d43e2ee7a55b3a170d138c.1762791343.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Nov 10, 2025 at 06:17:41PM +0200, Jani Nikula wrote:
> Now that drm_vblank_crtc() is the only place that indexes dev->vblank[],
> and its usage has reduced considerably, add the primary pipe
> out-of-bounds check there, and return NULL. Expect callers to check it
> and act accordingly.
> 
> In drm_crtc_vblank_crtc(), warn and return NULL, and let it go boom. If
> the crtc->pipe is out of bounds, it's a driver error that needs to be
> fixed.
> 
> Remove superfluous pipe checks all around.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 36 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 44fb8d225485..7829e64e42b4 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -177,13 +177,22 @@ MODULE_PARM_DESC(timestamp_precision_usec, "Max. error on timestamps [usecs]");
>  static struct drm_vblank_crtc *
>  drm_vblank_crtc(struct drm_device *dev, unsigned int pipe)
>  {
> +	if (pipe >= dev->num_crtcs)
> +		return NULL;
> +
>  	return &dev->vblank[pipe];
>  }
>  
>  struct drm_vblank_crtc *
>  drm_crtc_vblank_crtc(struct drm_crtc *crtc)
>  {
> -	return drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
> +	struct drm_vblank_crtc *vblank;
> +
> +	vblank = drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
> +	if (drm_WARN_ON(crtc->dev, !vblank))
> +		return NULL;
> +
> +	return vblank;
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_crtc);
>  
> @@ -631,7 +640,6 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>  				     const struct drm_display_mode *mode)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  	int linedur_ns = 0, framedur_ns = 0;
>  	int dotclock = mode->crtc_clock;
> @@ -639,9 +647,6 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>  	if (!drm_dev_has_vblank(dev))
>  		return;

I belive this at least gets called from the atomic helpers even
for drivers that don't have vblank support. In which case the
drm_crtc_vblank_crtc() call would have to be done after the
drm_dev_has_vblank() check or else you'll get spurious WARNs.

I don't remember if there are other cases like this as well.

>  
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return;
> -
>  	/* Valid dotclock? */
>  	if (dotclock > 0) {
>  		int frame_size = mode->crtc_htotal * mode->crtc_vtotal;
> @@ -724,11 +729,6 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>  	int vpos, hpos, i;
>  	int delta_ns, duration_ns;
>  
> -	if (pipe >= dev->num_crtcs) {
> -		drm_err(dev, "Invalid crtc %u\n", pipe);
> -		return false;
> -	}
> -
>  	/* Scanout position query not supported? Should not happen. */
>  	if (!get_scanout_position) {
>  		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
> @@ -1339,9 +1339,6 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  	ktime_t now;
>  	u64 seq;
>  
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return;
> -
>  	/*
>  	 * Grab event_lock early to prevent vblank work from being scheduled
>  	 * while we're in the middle of shutting down vblank interrupts
> @@ -1480,9 +1477,6 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
>  	unsigned int pipe = drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> -		return;
> -
>  	spin_lock_irq(&dev->vbl_lock);
>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>  		    pipe, vblank->enabled, vblank->inmodeset);
> @@ -1764,10 +1758,9 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  		pipe = pipe_index;
>  	}
>  
> -	if (pipe >= dev->num_crtcs)
> -		return -EINVAL;
> -
>  	vblank = drm_vblank_crtc(dev, pipe);
> +	if (!vblank)
> +		return -EINVAL;
>  
>  	/* If the counter is currently enabled and accurate, short-circuit
>  	 * queries to return the cached timestamp of the last vblank.
> @@ -1902,14 +1895,15 @@ static void drm_handle_vblank_events(struct drm_vblank_crtc *vblank)
>   */
>  bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>  {
> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> +	struct drm_vblank_crtc *vblank;
>  	unsigned long irqflags;
>  	bool disable_irq;
>  
>  	if (drm_WARN_ON_ONCE(dev, !drm_dev_has_vblank(dev)))
>  		return false;
>  
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> +	vblank = drm_vblank_crtc(dev, pipe);
> +	if (drm_WARN_ON(dev, !vblank))
>  		return false;
>  
>  	spin_lock_irqsave(&dev->event_lock, irqflags);
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
