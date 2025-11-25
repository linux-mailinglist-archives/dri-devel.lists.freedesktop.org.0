Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE6FC8404B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD6810E387;
	Tue, 25 Nov 2025 08:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1CeM/U4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1601D10E1B5;
 Tue, 25 Nov 2025 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764059891; x=1795595891;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=4hPbvwObn922jRZBV2FDZK1+G0Cd3qDpcAe+yyEEais=;
 b=W1CeM/U4VibBv3SnYQ+nVzFGxuNe5uBC5UXqyq7HeXFvfcldp5cykTmy
 v7RgW8+He2UsUdxFAQCToDfEXO33Fi7YAkkQ1BWO8pU161y7RDJfxA9+L
 E9rYYGqNCCDu4GmD4d91pvqW8XK8Pv/ropdL0bmoA/P3zof6PBe04HGfz
 nsD+CI4cfh9iiVDcZKPsvyPab3qiZEAu2LEwUDf4sHONQyYIcKW/H0sAq
 03tfzm4FVAcY5RRtyRcZUjY0x++oFslrL/6birMAMHhYlJmXmoBee5T+T
 LWbyciMWcJih9wuMBeU1zdNqa1lxj51vayObSmn1oP7fKMwbW2FQ3Ra89 A==;
X-CSE-ConnectionGUID: WBEhwZjlQAKdAE47P6Xh6A==
X-CSE-MsgGUID: CpVzYqhdSXCSoyaW8H6l+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66016463"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66016463"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 00:38:10 -0800
X-CSE-ConnectionGUID: gbstitpnRhSiOx4K8cKupA==
X-CSE-MsgGUID: ONNzabv0SdO53OtAwTJbow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="197689402"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.213])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 00:38:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: zhangzhijie <zhangzhijie@bosc.ac.cn>, jeff@jeffgeerling.com,
 zhangzhijie@bosc.ac.cn, wangran@bosc.ac.cn, zhangjian@bosc.ac.cn,
 daniel@ffwll.ch, rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guoyaxing@bosc.ac.cn,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH v2/2] i915: Support Intel GPU porting on any non-x86
 system.
In-Reply-To: <20251125033420.2265288-1-zhangzhijie@bosc.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251125033420.2265288-1-zhangzhijie@bosc.ac.cn>
Date: Tue, 25 Nov 2025 10:38:01 +0200
Message-ID: <98262d9d2ea7c02858aafae680a3ca0ff0a9dc9a@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Nov 2025, zhangzhijie <zhangzhijie@bosc.ac.cn> wrote:
> inb/outb speccial wire not support on other ARCH.
> Should detect whether arch platform support or not.

I would rather finish the discussion on the previous version before
seeing a new version.

You mentioned risc-v in the previous thread, but it needs to be part of
the commit message too. And I still don't know what "speccial wire" is
supposed to mean here.

You still use likely/unlikely, and I told you not to.

There's no patch changelog.

The version in the subject is "v2/2", but there has already been two
"v2" posted previously.


BR,
Jani.


>
> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_vga.c | 33 +++++++++++++++++-------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index 6e125564db34..d85622ba10fc 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -41,6 +41,15 @@ static bool has_vga_pipe_sel(struct intel_display *display)
>  	return DISPLAY_VER(display) < 7;
>  }
>  
> +static bool intel_arch_support_vga_pm(struct intel_display *display)
> +{
> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
> +	return true;
> +#else
> +	return false;
> +#endif
> +}
> +
>  /* Disable the VGA plane that we never use */
>  void intel_vga_disable(struct intel_display *display)
>  {
> @@ -64,13 +73,15 @@ void intel_vga_disable(struct intel_display *display)
>  	drm_dbg_kms(display->drm, "Disabling VGA plane on pipe %c\n",
>  		    pipe_name(pipe));
>  
> -	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
> -	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> -	outb(0x01, VGA_SEQ_I);
> -	sr1 = inb(VGA_SEQ_D);
> -	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> -	udelay(300);
> +	if (likely(intel_arch_support_vga_pm(display))) {
> +		/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
> +		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> +		outb(0x01, VGA_SEQ_I);
> +		sr1 = inb(VGA_SEQ_D);
> +		outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +		udelay(300);
> +	}
>  
>  	intel_de_write(display, vga_reg, VGA_DISP_DISABLE);
>  	intel_de_posting_read(display, vga_reg);
> @@ -90,9 +101,11 @@ void intel_vga_reset_io_mem(struct intel_display *display)
>  	 * sure vgacon can keep working normally without triggering interrupts
>  	 * and error messages.
>  	 */
> -	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> -	outb(inb(VGA_MIS_R), VGA_MIS_W);
> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +	if (likely(intel_arch_support_vga_pm(display))) {
> +		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> +		outb(inb(VGA_MIS_R), VGA_MIS_W);
> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +	}
>  }
>  
>  int intel_vga_register(struct intel_display *display)

-- 
Jani Nikula, Intel
