Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D77BF7C5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7C610E1C7;
	Tue, 10 Oct 2023 09:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA21A10E1BE;
 Tue, 10 Oct 2023 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696931205; x=1728467205;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rl6knOE9ydiSjJi6QeEGucWZc0t/cpv+Ijwqxq2/V+s=;
 b=AAE/X3aYMdwCAwZdXl5wGcn4MRuSTJn5sl6p/tPQ+b+nHZICYESEQjOK
 JO8yvWdJtoH+C6t1cOupvpyOxYcnTgHvCdqSPVtnURtlAdve3mEdRN5yq
 fzekH1B33a7nWaR1p1gaWC9OTdS4jFHmznzv0i4HSwAXOMMiSD+SVXOMN
 EZnl9fvrQSgvM7TR+bpjKM3OMX4/92S7eZvDXHcBk9EFb8PM5Aa/CZDwj
 hiKEiZD4WN4RkQvTJN/qRDkgKxzo+OeRc27UTcahAZQuG3KQVmD2rqWmK
 iahMk7LuUjLglp+nSD1um0LBYbbj2P5YYX0NrR9SDSYrule9bc8LE15mz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387190769"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="387190769"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782810302"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="782810302"
Received: from emikisch-mobl.amr.corp.intel.com (HELO [10.213.174.67])
 ([10.213.174.67])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:46:43 -0700
Message-ID: <741893db-a299-c944-a8ac-e5eac3651eb3@linux.intel.com>
Date: Tue, 10 Oct 2023 10:46:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Remove the 'force_probe'
 requirement for Meteor Lake
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20231008164824.919262-1-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20231008164824.919262-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Aditya Chauhan <aditya.chauhan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/10/2023 17:48, Andi Shyti wrote:
> From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> 
> Meteor Lake has demonstrated consistent stability for some time.
> All user-space API modifications tide to its core platform
> functions are operational.
> 
> The necessary firmware components are set up and comprehensive
> testing has been condused over a period.
> 
> Given the recent faborable CI results, as well, we believe it's
> time to eliminate the 'force_probe' prerequisite and activate the
> platform by default.
> 
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
> Hello,
> 
> This patch eliminates the 'force probe' for the MTL platforms. Over the recent
> weeks, MTL has demonstrated stability, consistently passing BAT tests with
> success rates ranging from 98% to 100%.
> 
> There's a single issue hindering us from achieving a 100% BAT test coverage.
> Fortunately, we've identified the issue, and the proposed solution can be found
> here[*]. The CI results are encouraging.
> 
> Once all reviews are addressed, we plan to submit this series with the "Fixes:"
> tag.
> 
> Thank you and best regards,
> Andi and Radhakrishna
> 
> [*] https://patchwork.freedesktop.org/series/124744/

Have there been any more recent developments, given 
https://patchwork.freedesktop.org/series/124866/, or proposal is still 
to remove force probe?

Regards,

Tvrtko

> 
>   drivers/gpu/drm/i915/i915_pci.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index df7c261410f7..fe748906c06f 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -836,7 +836,6 @@ static const struct intel_device_info mtl_info = {
>   	.has_pxp = 1,
>   	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>   	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> -	.require_force_probe = 1,
>   	MTL_CACHELEVEL,
>   };
>   
