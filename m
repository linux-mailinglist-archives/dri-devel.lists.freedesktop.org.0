Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC188A5E9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 16:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2929E10E98D;
	Mon, 25 Mar 2024 15:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P83NXhFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D57E10E98A;
 Mon, 25 Mar 2024 15:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379484; x=1742915484;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uo6EW6o1ThMIneFfstinf+Enjdx0oToIU38SIGgjgSw=;
 b=P83NXhFOCsmZhhLgMQtfBlor4rYGnr4pZlcKCPnGULtJSII7ORss298i
 p2ayzJB2zuyQ4P0IPuznE78Fl2nIrL9jnw/llatrHuYh0lGxk3lIErCA+
 h8Fhb6lSl+BoiJuzQ8P7LptwqLFUXbm9ZmASot/OpSFGkemWp7argn9P6
 DzmjimQlIIK68lFvXnKSuenE/g/lNI0xE+SnqRGHlttFhs1XUItT6f0Yp
 wogaGNSa9uxzgmLdCGdF7HKKaMU7jvzhrw1xsXhPTNUSmN8Kqzl6n5Z9E
 ELU7ScKwSZCid35N5MMAmfK4BDfbHWcUWWXJ8VqNed0QLRmJBET25Gkfu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6246634"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6246634"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20374360"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:11:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/i915: Delete stray .rej file
In-Reply-To: <20240325144728.537855-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240325144728.537855-1-lucas.demarchi@intel.com>
Date: Mon, 25 Mar 2024 17:11:18 +0200
Message-ID: <87edbyibxl.fsf@intel.com>
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

On Mon, 25 Mar 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> drivers/gpu/drm/i915/gt/intel_workarounds.c.rej was incorrectly added to
> the tree after solving a conflict. Remove it.
>
> Fixes: 326e30e4624c ("drm/i915: Drop dead code for pvc")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20240325083435.4f970eec@canb.auug.org.au
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  .../gpu/drm/i915/gt/intel_workarounds.c.rej    | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gt/intel_workarounds.c.rej
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c.rej b/drivers/gpu/drm/i915/gt/intel_workarounds.c.rej
> deleted file mode 100644
> index 91463b1d684a..000000000000
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c.rej
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -diff a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c	(rejected hunks)
> -@@ -2844,14 +2767,13 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
> - 
> - 	if (IS_GFX_GT_IP_STEP(gt, IP_VER(12, 70), STEP_A0, STEP_B0) ||
> - 	    IS_GFX_GT_IP_STEP(gt, IP_VER(12, 71), STEP_A0, STEP_B0) ||
> --	    IS_PONTEVECCHIO(i915) ||
> - 	    IS_DG2(i915)) {
> - 		/* Wa_22014226127 */
> - 		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
> - 	}
> - 
> --	if (IS_PONTEVECCHIO(i915) || IS_DG2(i915))
> --		/* Wa_14015227452:dg2,pvc */
> -+	if (IS_DG2(i915))
> -+		/* Wa_14015227452 */
> - 		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE);
> - 
> - 	if (IS_DG2(i915)) {

-- 
Jani Nikula, Intel
