Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D7C80739
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 13:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DD910E2AA;
	Mon, 24 Nov 2025 12:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNK9kqVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC16510E242;
 Mon, 24 Nov 2025 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763987095; x=1795523095;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=lbXR8pNXuoNd5gg+ROZ3W2rfqbKzrqOAsRHD+wb1a/c=;
 b=aNK9kqVaIO6e5jc8L2AfEVHhFH+EjE4gGGtLsY+6EOR3F8YV20JjzIG9
 4ln+gB6VDltBs82+CvKSD/DCk7NnLPK1VI0/V9oOYGV0c+c5tM0yy7XM9
 gDj9wApirZbA8MbtS+lliIHao/QMr0xgHVDtNAm+SThMK1U6+H1EUDtUH
 fz7/uTU+jaEqKqkNjbP9yghFLsnlX4aBHExXyqCCeJaPlCFL425pDK8sO
 o6hdv1z6sr9NmBD4LhdwnlJUD7fFoj5vMme4L2pAoQXMZL4h8JC+Kmb/k
 2BbwcqODJ8KbSpEwMKXPjRkLHVaZnOg/5cfgE95Tg4tv9mPmALwUoSih+ Q==;
X-CSE-ConnectionGUID: /Pp7Mj5OTO2GLjclljJayQ==
X-CSE-MsgGUID: FLxUk4iBRqanOCIB1JDSAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77457615"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="77457615"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 04:24:55 -0800
X-CSE-ConnectionGUID: CunMbfARRkeTbxWtLWF70w==
X-CSE-MsgGUID: FAErxhK3QhmZ2keD/Dci9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="197248535"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.177])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 04:24:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: zhangzhijie <zhangzhijie@bosc.ac.cn>, jeff@jeffgeerling.com,
 zhangzhijie@bosc.ac.cn, wangran@bosc.ac.cn, zhangjian@bosc.ac.cn,
 daniel@ffwll.ch, rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guoyaxing@bosc.ac.cn
Subject: Re: [PATCH v2] i915: Support Intel GPU porting on any non-x86 system.
In-Reply-To: <20251124065645.1920632-1-zhangzhijie@bosc.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251124065645.1920632-1-zhangzhijie@bosc.ac.cn>
Date: Mon, 24 Nov 2025 14:24:47 +0200
Message-ID: <bac7a05b799309fe2c269232e70e82f86a8e2811@intel.com>
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

On Mon, 24 Nov 2025, zhangzhijie <zhangzhijie@bosc.ac.cn> wrote:
> inb/outb speccial wire not support on other ARCH.
> Should detect whether arch platform support or not.

Seems to me it inb/outb depend on CONFIG_HAS_IOPORT. Which arch are you
talking about specifically?

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
> @@ -66,11 +75,13 @@ void intel_vga_disable(struct intel_display *display)
>  
>  	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>  	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> -	outb(0x01, VGA_SEQ_I);
> -	sr1 = inb(VGA_SEQ_D);
> -	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
> -	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> -	udelay(300);
> +	if (likely(intel_arch_support_vga_pm(display))) {

As a rule of thumb, please do not use likely/unlikely, at all.

Here, intel_arch_support_vga_pm() is evaluated at build time, and the
likely has no functional value, only dubious documentation value.

> +		outb(0x01, VGA_SEQ_I);
> +		sr1 = inb(VGA_SEQ_D);
> +		outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
> +		vga_put(pdev, VGA_RSRC_LEGACY_IO);

Both or neither get/put need to be inside the branch. Now you only get,
never put, on non-x86.

BR,
Jani.

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

-- 
Jani Nikula, Intel
