Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7FC844A9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 10:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7025F10E39A;
	Tue, 25 Nov 2025 09:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzrRgt6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEFB10E39A;
 Tue, 25 Nov 2025 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764064052; x=1795600052;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=NQl4HTJxjn2olNJOQjtZGcx2wqprJBGQtWLPJtWDrPM=;
 b=QzrRgt6nD0qzC/tjvM3TO71eCTkSlvkcjGUoufEVbZTD1PbNSaUsIfAs
 kxfAUwczGUp6jmOr1NklTw+E1UP7OkP236wRMADdmppjRsdX4jul8JC7z
 r2+zsHKdyDvOitmiJKt/BWwm8SA+dU+Zrn8GdwnSY1mnzzyozGT8iNIH3
 jD8jf6WG2npxU5hPwfA5gcNZhJ1TU40ilIFU5AaMTJ6J4OCN4xmedG73+
 O6+ZepoOEtBixuokzO4WbYGFlN6ea50b3Ia5w52tbCITN89td8LRRdCMV
 N20kg829LVj6Z5zWCZbt4uTgeUNlnVivCqLoe2zeOgvzRVBfLCQc7VFy4 g==;
X-CSE-ConnectionGUID: rdsKqceATKmDxz3DJ7T/Bg==
X-CSE-MsgGUID: Wr4VfxUxSqi6qhmV74uvDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83688347"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="83688347"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:47:32 -0800
X-CSE-ConnectionGUID: aEADA086Tr6wZ7kN/hOWcQ==
X-CSE-MsgGUID: /4GU4NLES/GDSC0aA4cndQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="197072905"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.213])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:47:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: zhangzhijie <zhangzhijie@bosc.ac.cn>, jeff@jeffgeerling.com,
 zhangzhijie@bosc.ac.cn, wangran@bosc.ac.cn, zhangjian@bosc.ac.cn,
 daniel@ffwll.ch, rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guoyaxing@bosc.ac.cn,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH v3] i915: Support Intel GPU porting on any non-x86 system.
In-Reply-To: <20251125093651.2414999-1-zhangzhijie@bosc.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251125093651.2414999-1-zhangzhijie@bosc.ac.cn>
Date: Tue, 25 Nov 2025 11:47:24 +0200
Message-ID: <b76c84c0c6396391289559a22e9d5fafa70f50b3@intel.com>
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
> inb/outb VGA_SEQ_* not support on other ARCH (such as RISCV).
> Should detect whether arch platform support or not.
>
> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
>
> Changes in v3:
>     1.Rewrite Commit message.
>     2. Remove likely/unlikely
>
> Changes in v2:
> 	1. vga_get/put inside the branch.

Argh, I also said, "I would rather finish the discussion on the previous
version before seeing a new version."

Can you please stop sending new versions? It's not helping you get any
of this merged.


BR,
Jani.


>
> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_vga.c | 33 +++++++++++++++++-------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index 6e125564db34..fda4c2cfd7cf 100644
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
> +	if (intel_arch_support_vga_pm(display)) {
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
> +	if (intel_arch_support_vga_pm(display)) {
> +		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> +		outb(inb(VGA_MIS_R), VGA_MIS_W);
> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +	}
>  }
>  
>  int intel_vga_register(struct intel_display *display)

-- 
Jani Nikula, Intel
