Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59F81F9FB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 17:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78B810E105;
	Thu, 28 Dec 2023 16:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A7E10E0E7;
 Thu, 28 Dec 2023 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703781652; x=1735317652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HpZoHXNF8wQeyDACOOvCNble18MrpAlcxrmoQ9Npfds=;
 b=PAAX5Wi+kHHWzK8zYa6on3MXuazgV9VFIMusoKpzNlz2/LQ1Tl/JfJ0f
 xfg2KuCO2/0s0GHNGpwoQ7nf8geK/zfchOCKt2lQ0gr7Fj2WNsZn8bsRK
 XeN5KhNovvlLXcqO90q0bxqoEWi2R075FwKkWDgD6KcMUrsi/Onvmv+1Z
 0XIDeNSm1dTrR7dCgJRMji5xrpBz6490egjR7Ssechlwv8K5hrdzdwgbj
 8uzG2drmBflW36n6c0H3FZI5Tj6hx8dlPxfrh5get/4euLU4a3HKRglDS
 JWET8/FBOePwo1ubxrCGrTxfQFBChp1yYh3WIe3clUFVo+bPKtYK27rr5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3856585"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="3856585"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:40:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="728353451"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="728353451"
Received: from ceyeghel-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.50.226])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:40:48 -0800
Date: Thu, 28 Dec 2023 17:40:44 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 3/4] drm/i915/guc: reconcile Excess struct member
 kernel-doc warnings
Message-ID: <ZY2lDJ4BkwO1AZGj@ashyti-mobl2.lan>
References: <20231226195432.10891-1-rdunlap@infradead.org>
 <20231226195432.10891-3-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231226195432.10891-3-rdunlap@infradead.org>
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

[...]

> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -105,61 +105,67 @@ struct intel_guc {
>  	 */


struct { } interrupts is missing here.

>  	struct {
>  		/**
> -		 * @lock: protects everything in submission_state,
> -		 * ce->guc_id.id, and ce->guc_id.ref when transitioning in and

[...]

> +		 * we start bypassing the schedule disable delay
>  		 */
>  		unsigned int sched_disable_gucid_threshold;
>  	} submission_state;

Here struct { } send_regs is missing

But as for this patch:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

>  	struct {
>  		/**
> -		 * @lock: Lock protecting the below fields and the engine stats.
> +		 * @timestamp.lock: Lock protecting the below fields and

[...]
