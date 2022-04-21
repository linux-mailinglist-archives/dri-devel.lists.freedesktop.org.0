Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E0509AB0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373D10F850;
	Thu, 21 Apr 2022 08:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F99D10F84B;
 Thu, 21 Apr 2022 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650529883; x=1682065883;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zzNvirlYkkziTJvdx2DHiWBsxoMsvkMgSyNBQkhFE5M=;
 b=lyGFbJUtmjCCeHh2+obrTcbTX67DDspQD0M+knGFU3h1spUQedUiAya5
 4/JbogqwMem7ovdUcPRJ3/8P+2Bqv68EDUX5wKk2dxxa0Kd8rKa2hFbn1
 qMaqePa1u0XRPxnKkAgd4HF3pYn5O5D3jea9kT1uw7uN59qVNtwfk9GSk
 6X3fno/njnA6A1s+VcMhzdXBjmbK59cjUIxfAsgj0ujFfCrTB7Vi4L65M
 RQcFw0IwDoDK5/mgjtHcJ5vynhQzvanT1wm8cxyesWyepIn1eVq5ZorPh
 uRgZj8C5wkCH5Bx+0H5YAB1yrAMBMyhS7pMqz5JwJKWvPDRNcYqxl1vLh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="289393932"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="289393932"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:31:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="530179930"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 01:31:20 -0700
Date: Thu, 21 Apr 2022 14:02:14 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [CI 3/4] drm/i915/selftests: fixup min_alignment usage
Message-ID: <20220421083214.GC18679@intel.com>
References: <20220420181613.70033-1-matthew.auld@intel.com>
 <20220420181613.70033-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420181613.70033-3-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-20 at 19:16:12 +0100, Matthew Auld wrote:
> Trying to cast the region id into the region type doesn't work too well,
> since the i915_vm_min_alignment() won't give us the correct value for
> the stolen-lmem case.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Looks good to me.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 5c9bfa409ff5..bccc49a8ab5e 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1150,7 +1150,7 @@ static int misaligned_pin(struct i915_address_space *vm,
>  		flags |= PIN_GLOBAL;
>  
>  	for_each_memory_region(mr, vm->i915, id) {
> -		u64 min_alignment = i915_vm_min_alignment(vm, (enum intel_memory_type)id);
> +		u64 min_alignment = i915_vm_min_alignment(vm, mr->type);
>  		u64 size = min_alignment;
>  		u64 addr = round_down(hole_start + (hole_size / 2), min_alignment);
>  
> -- 
> 2.34.1
> 
