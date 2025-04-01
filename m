Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D87A78195
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B66310E644;
	Tue,  1 Apr 2025 17:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlIpwmnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A373E10E644;
 Tue,  1 Apr 2025 17:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743529119; x=1775065119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Iod/UQvgNMFHQ6yvYpoQEaY1lZII8IGt2u9U/Kuvu1c=;
 b=nlIpwmndjbi1oTaKeldlCmChh0T4W1I0BY9TSySscCALLmlScGOj/vyL
 Yx56+8xmolqlh70akxkRBLBmelQJbHb3mAuOUjhfQkUdR+zRi/DTgGbSV
 VnCnttU+6QYruRObChFDYiFiK7ofpCD3766+AxNR0CFueCMLRzF04eQhY
 rCMkXSOj65IGd71uYr2FrNb0oIE3Z7DpFC93QV6UfbvEoDtjDXDkqf50V
 3uxAhNplN3QfqlTY51X3NNjS/vFV/HZ1OxRt6TorYktpxKyr+CDwO9HPK
 MTzLX7n524KtyVyAmo3BV59/Wg9IDEzGexfb6dtN6mSCFfaxRg7xb2xTb A==;
X-CSE-ConnectionGUID: eSJw2JSOQ6+PpfA41T0HnA==
X-CSE-MsgGUID: g1hbhce1T0ax3Dgu6bKCXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48532844"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="48532844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 10:38:38 -0700
X-CSE-ConnectionGUID: tw3whFPVSoKuDDBwDx4Z+A==
X-CSE-MsgGUID: GKouFZLuRdeFgP7OcEtaOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="131654958"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 01 Apr 2025 10:38:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Apr 2025 20:38:33 +0300
Date: Tue, 1 Apr 2025 20:38:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/8] drm/i915/display/i9xx: Add a disable_tiling() for
 i9xx planes
Message-ID: <Z-wkmdNgCM2-Ye7m@intel.com>
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401125818.333033-3-jfalempe@redhat.com>
X-Patchwork-Hint: comment
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

On Tue, Apr 01, 2025 at 02:51:08PM +0200, Jocelyn Falempe wrote:
> drm_panic draws in linear framebuffer, so it's easier to re-use the
> current framebuffer, and disable tiling in the panic handler, to show
> the panic screen.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
>  .../drm/i915/display/intel_display_types.h    |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index 5e8344fdfc28..9c93d5ac7129 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -908,6 +908,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
>  	.format_mod_supported = i8xx_plane_format_mod_supported,
>  };
>  
> +static void i9xx_disable_tiling(struct intel_plane *plane)
> +{
> +	struct intel_display *display = to_intel_display(plane);
> +	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
> +	u32 dspcntr;
> +	u32 reg;
> +
> +	dspcntr = intel_de_read_fw(display, DSPCNTR(display, i9xx_plane));
> +	dspcntr &= ~DISP_TILED;
> +	intel_de_write_fw(display, DSPCNTR(display, i9xx_plane), dspcntr);

This fails to account all the different alignment/etc. restrictions
between linear vs. tiled. I don't think we want hacks like this.

> +
> +	if (DISPLAY_VER(display) >= 4) {
> +		reg = intel_de_read_fw(display, DSPSURF(display, i9xx_plane));
> +		intel_de_write_fw(display, DSPSURF(display, i9xx_plane), reg);
> +
> +	} else {
> +		reg = intel_de_read_fw(display, DSPADDR(display, i9xx_plane));
> +		intel_de_write_fw(display, DSPADDR(display, i9xx_plane), reg);
> +	}
> +}
> +
>  struct intel_plane *
>  intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>  {
> @@ -1050,6 +1071,8 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>  		}
>  	}
>  
> +	plane->disable_tiling = i9xx_disable_tiling;
> +
>  	modifiers = intel_fb_plane_get_modifiers(display, INTEL_PLANE_CAP_TILING_X);
>  
>  	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 367b53a9eae2..62d0785c9edf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1512,6 +1512,8 @@ struct intel_plane {
>  			   bool async_flip);
>  	void (*enable_flip_done)(struct intel_plane *plane);
>  	void (*disable_flip_done)(struct intel_plane *plane);
> +	/* For drm_panic */
> +	void (*disable_tiling)(struct intel_plane *plane);
>  };
>  
>  #define to_intel_atomic_state(x) container_of(x, struct intel_atomic_state, base)
> -- 
> 2.49.0

-- 
Ville Syrjälä
Intel
