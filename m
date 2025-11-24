Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB4C82799
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 22:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6C710E25D;
	Mon, 24 Nov 2025 21:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DG+Rbq1V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD57C10E042;
 Mon, 24 Nov 2025 21:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764018360; x=1795554360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bnsZ/57wYh6tRMk1uFAzn7dFdL8isX7dHZO/V6LngHg=;
 b=DG+Rbq1VYHTJKX4C7+mnxS62DaOmto1fjHm9sAnAeOwh09z6HSQZpfHB
 4qGgYeCFP3u4zr+mqNuyl2OgDlrdo4nCK62G51lcPugH0kOcp86etyi47
 LDCx4ER5GXZJkbRwONSi6KVdGCLmOshHCib5BQ/6UKzL2XqQiFXUZGliX
 n/5WMwZT2EyhF8w6iomP5dOH/jZjlNdcB4xFE34Ywja00NAIxPPKIM3/m
 QFcqiheOJTnYQS5ur0EA/oFcPd2muKhC3lfQieznuW0wAGmwm0wPvrsg6
 qfaQYrracCCRDR/LsgAIylHOpKgRe/j2ZH1QNvxrN64BQW5xppHWinoGz w==;
X-CSE-ConnectionGUID: SlkZVpT0TFamSTri/It2Fg==
X-CSE-MsgGUID: bA02jAYbTFWX32zoZ673vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88681011"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="88681011"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:05:59 -0800
X-CSE-ConnectionGUID: OdFwTplZQm2jhQClKJ5ZFg==
X-CSE-MsgGUID: NSObI5SPSb6kJssMCAJeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196731627"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO localhost)
 ([10.124.222.165])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:05:56 -0800
Date: Mon, 24 Nov 2025 23:05:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: zhangzhijie <zhangzhijie@bosc.ac.cn>
Cc: jani.nikula@linux.intel.com, jeff@jeffgeerling.com, wangran@bosc.ac.cn,
 zhangjian@bosc.ac.cn, daniel@ffwll.ch, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i915: Support Intel GPU porting on any non-x86 system.
Message-ID: <aSTIsRbrtEfJQzWU@intel.com>
References: <20251124065612.1920389-1-zhangzhijie@bosc.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251124065612.1920389-1-zhangzhijie@bosc.ac.cn>
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

On Mon, Nov 24, 2025 at 02:56:12PM +0800, zhangzhijie wrote:
> inb/outb speccial wire not support on other ARCH.
> Should detect whether arch platform support or not.
> 
> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_vga.c | 27 ++++++++++++++++++------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index 6e125564db34..d5d6c4ba6434 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -41,6 +41,15 @@ static bool has_vga_pipe_sel(struct intel_display *display)
>  	return DISPLAY_VER(display) < 7;
>  }
>  
> +static bool intel_arch_support_vga_pm(struct intel_display *display)

whatis "pm"?

> +{
> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
> +	return true;
> +#else
> +	return false;
> +#endif

Isn't there already some kind of ARCH_HAS_PORTIO thing?
Does that not work?

> +}
> +
>  /* Disable the VGA plane that we never use */
>  void intel_vga_disable(struct intel_display *display)
>  {
> @@ -66,11 +75,13 @@ void intel_vga_disable(struct intel_display *display)
>  

I wouldn't expect us to get this far. The VGA plane should
never have been enabled in the first place.

>  	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>  	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);

Why are you leaving the vga_get() outside the check?

> -	outb(0x01, VGA_SEQ_I);
> -	sr1 = inb(VGA_SEQ_D);
> -	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> -	udelay(300);
> +	if (likely(intel_arch_support_vga_pm(display))) {
> +		outb(0x01, VGA_SEQ_I);
> +		sr1 = inb(VGA_SEQ_D);
> +		outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +		udelay(300);
> +	}
>  
>  	intel_de_write(display, vga_reg, VGA_DISP_DISABLE);
>  	intel_de_posting_read(display, vga_reg);
> @@ -91,8 +102,10 @@ void intel_vga_reset_io_mem(struct intel_display *display)
>  	 * and error messages.
>  	 */
>  	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> -	outb(inb(VGA_MIS_R), VGA_MIS_W);
> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +	if (likely(intel_arch_support_vga_pm(display))) {
> +		outb(inb(VGA_MIS_R), VGA_MIS_W);
> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +	}
>  }
>  
>  int intel_vga_register(struct intel_display *display)
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
