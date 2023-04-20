Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835F6E8FF3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 12:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754F910E293;
	Thu, 20 Apr 2023 10:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B6010E293;
 Thu, 20 Apr 2023 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681986043; x=1713522043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ujVcexr8NeZtGcJuYz80Wlt14pcpla2+2unPTrfWpFE=;
 b=UcpjSmjhIbSUsHN5uTDRyA1VH1VswbqoxlgMBMUBO+xzHyFyRswfv6aR
 uivwz+Ng6ZX+t1ZYLw+HULpCXgL8kLWTxJJ6EG4qmcrRcxXbOPLAm28f8
 TW+YHPANO59e2948u/mSfjJnfhLRIZ893ctjoILudGM67Zcke4qOxHNrF
 ESla3Kr9zdod0PNzaDNDIry93Mm2sirxBKn7aSVOzNplbI6RuDy9eQZVn
 8IX7pujVsPtTYAFEeQr+6rtH2Y80MBYpRdKw6ERj0u5PUkojEfzkWNfk4
 ecok5+db2FddvvY0FUFWR2Tp6Pdv4FykOhR2bIcakLDDZJp7ATrsb0is6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="326023498"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="326023498"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 03:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835676715"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="835676715"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.56.189])
 ([10.252.56.189])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 03:20:41 -0700
Message-ID: <874e7aa6-748a-e5f5-6692-c75eda4e963f@linux.intel.com>
Date: Thu, 20 Apr 2023 12:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Set has_llc=0
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-2-fei.yang@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230419230058.2659455-2-fei.yang@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have multiple bugs that requires this and it can be picked up 
irrespective of this series. I have sent a trybot patch for this and

once that passes, I will push this one.


https://patchwork.freedesktop.org/series/116746/


Nirmoy

On 4/20/2023 1:00 AM, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> On MTL, LLC is not shared between GT and CPU, set has_llc=0.
>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index d64e074d7457..272a8ba37b64 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1147,6 +1147,7 @@ static const struct intel_device_info mtl_info = {
>   	.has_flat_ccs = 0,
>   	.has_gmd_id = 1,
>   	.has_guc_deprivilege = 1,
> +	.has_llc = 0,
>   	.has_mslice_steering = 0,
>   	.has_snoop = 1,
>   	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
