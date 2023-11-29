Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9BB7FE1BD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 22:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325BA10E680;
	Wed, 29 Nov 2023 21:23:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D4710E540;
 Wed, 29 Nov 2023 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701292997; x=1732828997;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pRMeOHYilHTF6/iHGhNGIMIYhyh4xa3GUmsj9pVnwpc=;
 b=P+YkQYqpTxGAjzELtCOy5NNkyg98GodBbJcYENQBm3pIcF4xJJDX+KP6
 vRM9egthRgEids3rYxlskfYecpyiFfUsqSWgxDYTgV+tUccXBCS2pNEE/
 qIf07xwdSae9qKW8/wVqWa86FubLTH4twXOA2n5JQk/BZafT3wHlrvAXK
 1DL1bTLLOEyY+CU4QkLMTdSlNkmlp+EalljF0tAZ4Nn7y/imC92gIwVax
 zci1Sxo8fDWYMfXsKbUrCGUvyarGa7RxA4sxaaRAQYYYkCrpLe1szgETu
 ePxRxtzWya5X78xxVvVwx4EGiJb48iZlKCYVIT9L1aEtRIMVTFFY57r/4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11929303"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="11929303"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="859968423"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="859968423"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:23:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:23:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:23:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:23:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:22:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1QaSbpJxHf0q0SHQDQc/5lhA9DEEwxka9dnn+3rskakz/g16EFtPcA58Q6MuXpGO1GvO2PaYK029JhzeE65RX2QRCGpL0w6Gk/CNIbIL3uNLlhZpMhS6HReDEp43MGrE0UQIXVZm8xJQeGIC9Mn6jYkOG5Je99DoZ+0ml6/R5siEWbsXQrRgnPlKGT71zsFl5e2C5L3if1pkJM7dOUkNChirVgIf98enzguX+4vYOQP+lk6kPswA+NbJZ8GweLtwemaiahaElCSdykT4KudHXd/Z9zaQNdBIDFMMdZc7QDjhLERbCcbrflUloS9lstyFaxx0go3Nm0nHaZVHLyijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYu0VUyKblJdxpBtIDc9KTSxCMVtXUmb8kI+XaVaC9g=;
 b=Zovbzk6emPeBHDBoykY8GRhB3KVtOHiyjzEXxD2jxnLGO/RCvoqaJiTviJxvYFXZFD5cgrIOiuxa8+0D7zqY1fM3VijN2PnPDefMaeffM3fmhuwC7BstBUTxsJ1OoY/DAUlCPLHUs5n/c+0FNb94DPvsjfq+GmsH0Tv0KxTUCzv/4UTnIrHfQjlF9FcKTvm/SmWRQc6oYJzUfCtIK9sqiCTTq1ADLqp6ONzlJZ7Wypa4jpPQqdqWxls7MermYoN9LVMgFRnLsW8imF7gIEG2wzDmVWFy1IzZh6ZqQYZxZVSgcb5sb5oJwzRWcBd2m7ISXTK+NtH/CqQuLmuezSPlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 21:22:46 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:22:46 +0000
Message-ID: <6f9fbbe8-cbca-406a-8b5e-b070e9eddb14@intel.com>
Date: Wed, 29 Nov 2023 13:22:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/i915/guc: Add a selftest for FAST_REQUEST
 errors
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20231114010016.234570-1-John.C.Harrison@Intel.com>
 <20231114010016.234570-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231114010016.234570-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: fad08d62-4e99-4c66-7657-08dbf12154b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0yPd8PWxikg8ihq6bQ9+6DhR4yWKcK+EXnj3CItShXM9Zw2c3flu+xZk0HU6951YXalS8nVBPSexItRd3KrIVOSuWzuBGO7hnw2Z0a43BCvNIBqQt7f9TkY9QWnjJ6sT/aK3+srBYpuQXyaKGbWx8HQAND0F01eCKerzkPD0r9odmfGkbpYQUrRUetPYXwKwLVN07fBOgutKUaZduYzdZrKMrUwjKsZK4ZRW3+XaZuskVm175VicwXWcXTwyDLxWSKWA04Jqzkq8Zqy4+jILfejT1VoRgd3XE6i9kfehV4b7BIYOT44KZMomneF0ILjhnHYZn5EQVr8zHDzcMeDKlFcGpgSK+E6VFwm7F910OL7eXPdWzjn7hlqfd901Zf9KL3iEL5z8IE9rhFARzgqor919Rt9TopYddZaIJMxlS1LW8vSAXqu+hlpOdk3CEXZGFLLRIikHJ3rAkS/OIAPE/AXRcPDUG6wGls5MDAMhWZ2SfKeUqaavJeklCyp/Cm+I2NrgGnjSYxapbVT4584b/KJDKLsKwlzpn06GLG/HU1NSipqidJVnwR+qt5doEgymKjSvVHeNBAvKoC71DzOWDo6Uy861AeSUgEtA28qM9RFoNpAf6Og+1SV7k3boggodaANanFjgGQd6zrekaeBJtSqRH2tVjpDeqgvokppraX8YMcehkCIH87sumxqwc4l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(41300700001)(36756003)(86362001)(31686004)(83380400001)(5660300002)(82960400001)(26005)(2616005)(2906002)(66476007)(6512007)(53546011)(6506007)(8936002)(31696002)(8676002)(4326008)(450100002)(478600001)(6486002)(202311291699003)(66556008)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THNDWGVEbEVrQ2V0UE1Ta2ZUWnBMUnhRaENpRlZIQXRDWVJlL2d6M0lNMXB5?=
 =?utf-8?B?eUwyS2l1MHBxMDd3Uk9EandZNS9PTVVxY2FiT2t0N1ZSZWNsUWxLRXdNVVVZ?=
 =?utf-8?B?OGNBejVzaXZtSFVjRVVybUpkRis5M1pFTE5sa3VxRThPb0EwSnZmNEFpVWNk?=
 =?utf-8?B?cUJIUGJvcTlnanVRMkx6QUhHbjJxSTJXQ0Z1ZUxObFBNdk0yVWl1SzBoOC9a?=
 =?utf-8?B?TUdaMDE2VGJES2NaaUdGcEM0TmRiSTE4cVVsblFOS0lXL3R5UTFBYVFXMzdV?=
 =?utf-8?B?Um5yckw4RXlzR1ZqaDgvS0MzWGhCNE50anFLSDhoRFlGUU1YYnY0S2R0QXI5?=
 =?utf-8?B?K0g5ZzVUVFlBdkIxOEFxTGNpL2M0VU5JaTNBbktjOUN3S09ibSs0c3BCcSth?=
 =?utf-8?B?QTVYMmZPanJ6OWN5L0gxcU5tbFdVWnZDNHlFaDNNN2NDSWQ0QVNzb2ZpM3hD?=
 =?utf-8?B?MEMxN2hoOUhoU0RUamNaSko2Zkc1VHhFV1BmS0d6eXc2WWNWbTAwNG5vRzNI?=
 =?utf-8?B?cVVwcGtaeUVyUlpDTUFNWElIbU1wRVhLZTY0Y00zSS82QTQvQ1Z1TU9hTzBh?=
 =?utf-8?B?S0xDZVo5NStTbDRwdXlPWmFuT0oxTVJLeW5KSy8xaXZJNlBIZkZMdG5wZU9a?=
 =?utf-8?B?WC9pZHZOUlJmMy9UbkFpSUhKdUliUFA4UUpMa2FFa0VKV1dKVTJvWms5Q1hD?=
 =?utf-8?B?L3grWHVVN1YvU2hGWVp4WVNDVUFjZmZMRVdzNTlKMXBtb3J0T3dFdzIzaHNn?=
 =?utf-8?B?WjdnRVo4SFVUekFoYkxVbkpDVHFVWFJBLytNVmR4NHBMZjBPZGtoMkFoWHRx?=
 =?utf-8?B?S0hUR3ZNYVY1Mk90ZWdNZXJ6SFdDR0J2VG4zQzJMVFFhelNIQU4zdDBsYnJx?=
 =?utf-8?B?UFJTRmo0TEljdnpPbXVhNFdzZ3VLbzlwVEhGTVNYQWtxZE9ETStyT2xLUlBW?=
 =?utf-8?B?cGdLYS9XWU11YkNBNWZUSXcrMTI3UU9FWjlwZHE2a01rL2lxWm9FWE54Z216?=
 =?utf-8?B?V1lOenduU3krcnRkcVFlZDM5MGk4aWdoaGlYVDNzcGlpb2s1b2oxNnZGaTNn?=
 =?utf-8?B?eWw2Ri9QVmJuMUF3bXo5RldFOXpuanhOWk9SZGFFNW0wOGtjNThDL3VkNzZx?=
 =?utf-8?B?VWxJM3NjR2xFbDU2elk3RnR0dVhhSkNvZ0xYRXA0Rk84SUt4aFJqaWpyekZi?=
 =?utf-8?B?RWhQdUk2aTg4R0tibWJma2N5WEVxRjZZdlVwT0FaMG9xeFhqWHdzUkNVcU1Z?=
 =?utf-8?B?ZVlPaS9pL0x5aDN1M09RRG9haDhabFFHeVNlNmk0OE1vNHU3bFZLOXFSemR3?=
 =?utf-8?B?VEhFNWp1ckxLTVhpTFFocUt0YlZxYXUxTEw4dDR3U0pKRG1qa1RPc1c3YnNu?=
 =?utf-8?B?cXdmWWRZZXJaaWkyRTEyNXFmN0RSQUpjTnlEK3owZTV5Y2d1N1VSQzVXbUt5?=
 =?utf-8?B?WU9UUUdDOVloWVErYjNyU1cvZ1Q4VGRuaXQ0T29PRURkSU9jOXdzdFVaaEFY?=
 =?utf-8?B?d2JKSGtUYzZCZ3BhM0NNTGs3OTAyZy9vQ0gveTFqZVVDUkhPR0hBSksrb1Vj?=
 =?utf-8?B?Ykw1eDVqOTBxRWYvTGJldVBEWTZ3MnM3UUNDN040Wit0QW03djNaNFdyRXdo?=
 =?utf-8?B?YWJwZk5OVldUK01DMElLbUkrMXViSEhacTExK1I2V1N4a0lUYU5Ca1ZHUmpz?=
 =?utf-8?B?QUFzajVDSFB1NUZ0Zm9HZkdrZjhSWFdXeWNPS0ZJTVFrNnNHUEk4aTR1ck5h?=
 =?utf-8?B?TW1YYXNSMUFMTVVGTElKcU5Ta2R4NWp4SzBlczROUVRJNmt1MFpjTzN0U3NM?=
 =?utf-8?B?QVczVzF2b3FDOEFYd1phbnk4N3BrQnNhOEE1azdGZWtvdzUzQlJrOTc1LzBl?=
 =?utf-8?B?VmR6R2cxQVdqYmpoajlUVmgveHA4cDYraXhNQlJFS0NNL0xua05FdEtoRllk?=
 =?utf-8?B?S04yVkU1MkJmTkYxNDBJK25UUG9MeUQ4czlKbm9LeVRpa2VIY3lUQjJ4L2Vu?=
 =?utf-8?B?c3I1MEt1VHRJTjhtYlFGR1o1bWh6TEpsMElFV3N5bFV2TWtFdkNLUEt5L2Ur?=
 =?utf-8?B?MkNZcDZ2elNCTFg1cWRGTmFnTkphSzhac2tyaFlPWjZQVnNQWkZ2RExDMFlw?=
 =?utf-8?B?SXZVTlRrM29FcXdXZG12bndoVUhVVlNLdHN1a1Fsb2IzN3FwanBhUkNvNmF1?=
 =?utf-8?Q?xA6LIj9BivzXYfqO7h1S2uY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fad08d62-4e99-4c66-7657-08dbf12154b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:22:46.1975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SB+kirb8PzpXFT04NYystYFmVAJRIDPypktBIjW9ul3iznC06THUmQr2MegwZouhNLvBQ4M+h2UX/R5hVGH3naJn+wkxzdxVfh/TWvPcio4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
X-OriginatorOrg: intel.com
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/13/2023 5:00 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There is a mechanism for reporting errors from fire and forget H2G
> messages. This is the only way to find out about almost any error in
> the GuC backend submission path. So it would be useful to know that it
> is working.
>
> v2: Fix some dumb over-complications and a couple of typos - review
> feedback from Daniele.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h    |   4 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |   9 ++
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 115 ++++++++++++++++++++++
>   3 files changed, 128 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 2b6dfe62c8f2a..e22c12ce245ad 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -297,6 +297,10 @@ struct intel_guc {
>   	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
>   	 */
>   	int number_guc_id_stolen;
> +	/**
> +	 * @fast_response_selftest: Backdoor to CT handler for fast response selftest
> +	 */
> +	u32 fast_response_selftest;
>   #endif
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 89e314b3756bb..ed6ce73ef3b07 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1076,6 +1076,15 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   		found = true;
>   		break;
>   	}
> +
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +	if (!found && ct_to_guc(ct)->fast_response_selftest) {
> +		CT_DEBUG(ct, "Assuming unsolicited response due to FAST_REQUEST selftest\n");
> +		ct_to_guc(ct)->fast_response_selftest++;
> +		found = true;
> +	}
> +#endif
> +
>   	if (!found) {
>   		CT_ERROR(ct, "Unsolicited response message: len %u, data %#x (fence %u, last %u)\n",
>   			 len, hxg[0], fence, ct->requests.last_fence);
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index bfb72143566f6..c900aac85adba 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -286,11 +286,126 @@ static int intel_guc_steal_guc_ids(void *arg)
>   	return ret;
>   }
>   
> +/*
> + * Send a context schedule H2G message with an invalid context id.
> + * This should generate a GUC_RESULT_INVALID_CONTEXT response.
> + */
> +static int bad_h2g(struct intel_guc *guc)
> +{
> +	u32 action[] = {
> +	   INTEL_GUC_ACTION_SCHED_CONTEXT,
> +	   0x12345678,
> +	};
> +
> +	return intel_guc_send_nb(guc, action, ARRAY_SIZE(action), 0);
> +}
> +
> +/*
> + * Set a spinner running to make sure the system is alive and active,
> + * then send a bad but asynchronous H2G command and wait to see if an
> + * error response is returned. If no response is received or if the
> + * spinner dies then the test will fail.
> + */
> +#define FAST_RESPONSE_TIMEOUT_MS	1000
> +static int intel_guc_fast_request(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	struct intel_context *ce;
> +	struct igt_spinner spin;
> +	struct i915_request *rq;
> +	intel_wakeref_t wakeref;
> +	struct intel_engine_cs *engine = intel_selftest_find_any_engine(gt);
> +	bool spinning = false;
> +	int ret = 0;
> +
> +	if (!engine)
> +		return 0;
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +
> +	ce = intel_context_create(engine);
> +	if (IS_ERR(ce)) {
> +		ret = PTR_ERR(ce);
> +		gt_err(gt, "Failed to create spinner request: %pe\n", ce);
> +		goto err_pm;
> +	}
> +
> +	ret = igt_spinner_init(&spin, engine->gt);
> +	if (ret) {
> +		gt_err(gt, "Failed to create spinner: %pe\n", ERR_PTR(ret));
> +		goto err_pm;
> +	}
> +	spinning = true;
> +
> +	rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
> +	intel_context_put(ce);
> +	if (IS_ERR(rq)) {
> +		ret = PTR_ERR(rq);
> +		gt_err(gt, "Failed to create spinner request: %pe\n", rq);
> +		goto err_spin;
> +	}
> +
> +	ret = request_add_spin(rq, &spin);
> +	if (ret) {
> +		gt_err(gt, "Failed to add Spinner request: %pe\n", ERR_PTR(ret));
> +		goto err_rq;
> +	}
> +
> +	gt->uc.guc.fast_response_selftest = 1;
> +
> +	ret = bad_h2g(&gt->uc.guc);
> +	if (ret) {
> +		gt_err(gt, "Failed to send H2G: %pe\n", ERR_PTR(ret));
> +		goto err_rq;
> +	}
> +
> +	ret = wait_for(gt->uc.guc.fast_response_selftest != 1 || i915_request_completed(rq),
> +		       FAST_RESPONSE_TIMEOUT_MS);
> +	if (ret) {
> +		gt_err(gt, "Request wait failed: %pe\n", ERR_PTR(ret));
> +		goto err_rq;
> +	}
> +
> +	if (i915_request_completed(rq)) {
> +		gt_err(gt, "Spinner died waiting for fast request error!\n");
> +		ret = -EIO;
> +		goto err_rq;
> +	}
> +
> +	if (gt->uc.guc.fast_response_selftest != 2) {
> +		gt_err(gt, "Unexpected fast response count: %d\n",
> +		       gt->uc.guc.fast_response_selftest);
> +		goto err_rq;
> +	}
> +
> +	igt_spinner_end(&spin);
> +	spinning = false;
> +
> +	ret = intel_selftest_wait_for_rq(rq);
> +	if (ret) {
> +		gt_err(gt, "Request failed to complete: %pe\n", ERR_PTR(ret));
> +		goto err_rq;
> +	}
> +
> +err_rq:
> +	i915_request_put(rq);
> +
> +err_spin:
> +	if (spinning)
> +		igt_spinner_end(&spin);
> +	igt_spinner_fini(&spin);
> +
> +err_pm:
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +	return ret;
> +}
> +
>   int intel_guc_live_selftests(struct drm_i915_private *i915)
>   {
>   	static const struct i915_subtest tests[] = {
>   		SUBTEST(intel_guc_scrub_ctbs),
>   		SUBTEST(intel_guc_steal_guc_ids),
> +		SUBTEST(intel_guc_fast_request),
>   	};
>   	struct intel_gt *gt = to_gt(i915);
>   

