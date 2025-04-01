Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F106A78165
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D5A10E63D;
	Tue,  1 Apr 2025 17:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnyE0EEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0734C10E63D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743528289; x=1775064289;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZE1/JQ5ftDyb71AL32bisjdp/0zZEsd/R+37Np1VCw8=;
 b=OnyE0EEPsobA8HvL6v+2vWquTSi/+1UBZyo1+L3+xykgHOLLh9ZGQ1S9
 n7cbvByipUiRvBwsgltIjrejj8iUSCSIoLXcOq5YiIEZK+7CQD3/nJjPh
 vZMYGKeUAdKR/TmyxHggfklXPTAWKX3gNIQvqgJs6y9GWjPV2QvSm7cDS
 UlP1dhgphT+oZ8XwthRpYlue2hdsPx0m1TZZbqZZ1gD7uZzHZBAlmdjN4
 ccA0DzZIMs89i+2uSfbPSRQxSm7Vj+DD3vDJhDcnevCj1nQ66I46juSo2
 vDDv2m2K0ggcRiszAE3tiu+SoGWesW4wVWo8ItlmK5h+9dsfAIci1RqZi Q==;
X-CSE-ConnectionGUID: 0OsI1MSjQpmv5yxfumO3QQ==
X-CSE-MsgGUID: MQK48zxVRImfWgt4Jv7JjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44963751"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44963751"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 10:24:48 -0700
X-CSE-ConnectionGUID: umXyprQ8Tk+KhkfTgYYtMQ==
X-CSE-MsgGUID: eKGiMkf2TUuz5jWKeoahjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126917016"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 01 Apr 2025 10:24:46 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 24AF834974;
 Tue,  1 Apr 2025 18:24:45 +0100 (IST)
Message-ID: <02a35563-9699-4f9a-abe0-12a0e2347167@intel.com>
Date: Tue, 1 Apr 2025 19:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] drm/xe/guc: Introduce enum with offsets for
 multi-LRC register H2G
To: Tomasz Lis <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
 <20250331132107.1242954-4-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250331132107.1242954-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31.03.2025 15:21, Tomasz Lis wrote:
> Some GuC messages are constructed with incrementing dword counter
> rather than referencing specific DWORDs, as described in GuC interface
> specification.
> 
> This change introduces the definitions of DWORD numbers for parameters
> which will need to be referenced in a CTB parser to be added in a
> following patch. To ensure correctness of these DWORDs, verification
> in form of asserts was added to the message construction code.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h | 7 +++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 448afb86e05c..86bd4b092c7c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -161,6 +161,13 @@ enum xe_guc_preempt_options {
>  	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>  };
>  
> +enum xe_guc_register_context_multi_lrc_param_offsets {
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11

while likely we only need those 4 indices, IMO it would cleaner to
define all of them in ABI to reflect the whole message layout:

enum xe_guc_register_context_multi_lrc_message {
	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_0_MBZ = 0,
	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_1_FLAGS,
	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_2_PARENT_CONTEXT,
	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_3_ENGINE_CLASS,
	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_4_ENGINE_SUBMIT_MASK,
	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_6_WQ_DESC_ADDR_UPPER,
	...

> +};
> +
>  enum xe_guc_report_status {
>  	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>  	XE_GUC_REPORT_STATUS_ACKED = 0x1,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 31bc2022bfc2..3c8574e2c1f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  	action[len++] = info->context_idx;
>  	action[len++] = info->engine_class;
>  	action[len++] = info->engine_submit_mask;
> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
>  	action[len++] = info->wq_desc_lo;
>  	action[len++] = info->wq_desc_hi;
> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
>  	action[len++] = info->wq_base_lo;
>  	action[len++] = info->wq_base_hi;
>  	action[len++] = info->wq_size;
> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
>  	action[len++] = q->width;
> +	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
>  	action[len++] = info->hwlrca_lo;
>  	action[len++] = info->hwlrca_hi;
>  

hmm, it looks little paranoid, and pollute otherwise clean code,
so maybe either convert completely to index based message encoding:

	action[.._FLAGS] = info->flags;
	action[.._WQ_DESC_LO] = info->wq_desc_lo;
	action[.._WQ_DESC_HI] = info->wq_desc_hi;
	...
	for (i = 0; i < q->width; ++i)
		action[.._HWLRCA_LO + 1 + i] = ..;
		action[.._HWLRCA_HI + 1 + i] = ..;

or assert those important entries at the end:

	xe_gt_assert(gt, action[..WQ_DESC_LO] == info->wq_desc_lo);
	xe_gt_assert(gt, action[..HWLRCA_LO] == info->hwlrca_lo);

@Matt, any other ideas or you don't care?


