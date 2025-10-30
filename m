Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC13C20415
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE22C10E96E;
	Thu, 30 Oct 2025 13:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CurEJVE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EA710E96D;
 Thu, 30 Oct 2025 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761831307; x=1793367307;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=CUS6P0a7OXqnVNviu3Le+Ik0LGNcmg5z2orr5NFcB5Q=;
 b=CurEJVE67iuGTxduIbXKLpR4h4zsdakUERtpuOb1VtnNzKB3p/sI0th4
 4FgqsX3dQ4ITwqKy8H9ZOsyMbw1wSfqL1mB5/49JCUrGMT0cVcnkQvsgj
 t/B4EzOsTJh7bC0pydGvvgpIjQqFCGeIZTpc9VzDLWIevfdfQU6/oY1Pj
 kuTn5zVJ45I5tC4XJLfE4zY9rNYB6AGGgTP1unVHH5wEeyk3rLDulKT/G
 unSWDOd9SDFO/lo18w/AyAVSzcqQ4Bbj5hmkwpMeH3kp0WVQfF+MjZzaH
 ImXeEB+S0MxzP1tPO7KdZu4M5CQtu2xjBHUXYQlujNTJ0f9c0GgC8jnvR g==;
X-CSE-ConnectionGUID: 3yClaJDNQROhhmCLYKms0w==
X-CSE-MsgGUID: oGAuem2/Q1CpiYXJqtKZ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89438475"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="89438475"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:35:06 -0700
X-CSE-ConnectionGUID: 5mX16E1tTk+Rb+BWaAghMw==
X-CSE-MsgGUID: erC500p0QECr1z4wbGOz0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="223177427"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:35:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: zhangzhijie <zhangzhijie@bosc.ac.cn>, zhangzhijie@bosc.ac.cn,
 wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, daniel@ffwll.ch,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Support Intel Xe GPU dirver Porting on RISC-V
 Architecture
In-Reply-To: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250715061837.2144388-1-zhangzhijie@bosc.ac.cn>
Date: Thu, 30 Oct 2025 15:34:59 +0200
Message-ID: <08cc7457a13e434832389d63d73f1df804ae1a2c@intel.com>
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

On Tue, 15 Jul 2025, zhangzhijie <zhangzhijie@bosc.ac.cn> wrote:
>     inb/outb speccial wire not support on other ARCH.
> Should detect whether arch platform support or not.
>
> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_vga.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
> index 4b98833bfa8c..5e48e3282670 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -33,6 +33,7 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
>  	if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
>  		return;
>  
> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
>  	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>  	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>  	outb(0x01, VGA_SEQ_I);
> @@ -40,6 +41,7 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
>  	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
>  	vga_put(pdev, VGA_RSRC_LEGACY_IO);
>  	udelay(300);
> +#endif

This should be abstracted to a separate function with the
#if/#else/#endif choosing a different implementation of the function
(empty stub in the else branch).

>  
>  	intel_de_write(dev_priv, vga_reg, VGA_DISP_DISABLE);
>  	intel_de_posting_read(dev_priv, vga_reg);
> @@ -80,6 +82,7 @@ void intel_vga_redisable(struct drm_i915_private *i915)
>  
>  void intel_vga_reset_io_mem(struct drm_i915_private *i915)
>  {
> +#if defined(CONFIG_X86) || defined(CONFIG_X86_64)
>  	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>  
>  	/*
> @@ -95,6 +98,7 @@ void intel_vga_reset_io_mem(struct drm_i915_private *i915)
>  	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>  	outb(inb(VGA_MIS_R), VGA_MIS_W);
>  	vga_put(pdev, VGA_RSRC_LEGACY_IO);
> +#endif

Ditto, but you have the function already.

>  }
>  
>  int intel_vga_register(struct drm_i915_private *i915)

-- 
Jani Nikula, Intel
