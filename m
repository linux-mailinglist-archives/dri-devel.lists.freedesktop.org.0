Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930E13F90E7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 01:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9D26E898;
	Thu, 26 Aug 2021 23:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92A06E898;
 Thu, 26 Aug 2021 23:21:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217864213"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="217864213"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 16:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="537826385"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2021 16:21:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 16:21:25 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 16:21:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 26 Aug 2021 16:21:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 26 Aug 2021 16:21:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLy7UN5r09DR9Pu0y7RKkYJDLzAPu/Ej5AGqrVZ+bHkc6c5bI2U7C4Xy43mDvXN2rJCVOtdbrAorMIbhlwUNCbPy+oR1zGuEYpUPCNYuWcx2zerHTMGuLAU7wfE23NUDgjM1tw8GTg9+6DekuL4n4fLz6Qremp82iFxmmE0TKmbJCVZQYv3DALFktsNj2oSmbUxnjPTD+gxv5cAlUz12Svq50iEGcU9OCB/qgG3hN5qPY0KLRJ3x7f9fVhtPvEJjdNNhLA0BqEppkNK4EboKo6vLsn3qTY71WR3B3UvmcpY8VJCB+FRxjH4fSNg7TsHXHlbKgLqQy3hDTcGfwPeAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQBhKS1U2UgVzy29t4ryr1Zs9RIxuIbfZ205lfw11TE=;
 b=PikWM6opOUgREr6LdD/WORfo0/TAzIPycWqOzZmJz0cPU7iRRe8jRCYheUfioJaNULtsAeyJ2B4vqgjt1NdSJyo+KKdwfeBCjCoEM4QJda8iZy19giVkUUObszs6uCJQG6HzlYlAhVISj87H7FJRdsMqd5ZCxWbWiHkP+MxcB2dSd+y1H1pm4feihfb9HDku6dUeFslQ8KO+vY01Y41+XfURZD/b0jK2afLcDs4KfbHGmEeh10jITOQcWTURicMZyjLMTDhVDaM4bBeR/pvdUdJXOflZETWU3QeROQHKyuN6aur0NmwpYz9+3MIl2hJw7j2tYKPeeSDOdw/iZMQENg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQBhKS1U2UgVzy29t4ryr1Zs9RIxuIbfZ205lfw11TE=;
 b=eOom7D5HGLKcEGFJhx2xfcDnrltZQlSHgo9mqZzLwI9Bx95jyiH6FNr3DH7/BHApMq2GGI5Ewxy0kTJgNkW0U+VVDMBL0NM/bvtixHXAajrQgfS0IWYh3SuPQfYMWezV8FeMswgdjbTvN9RosGJXD0jc/kQFyC/ZuW/TswwrcJQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB3657.namprd11.prod.outlook.com (2603:10b6:5:143::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Thu, 26 Aug 2021 23:21:23 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.020; Thu, 26 Aug 2021
 23:21:23 +0000
Subject: Re: [PATCH 11/27] drm/i915/guc: Copy whole golden context, set engine
 state size of subset
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-12-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <c474e0b4-088a-bfe2-1f9e-70e305940127@intel.com>
Date: Thu, 26 Aug 2021 16:21:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210826032327.18078-12-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.79.152.56] (192.55.52.219) by
 SJ0PR13CA0214.namprd13.prod.outlook.com (2603:10b6:a03:2c1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.11 via Frontend Transport; Thu, 26 Aug 2021 23:21:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c00cf0f-b0fa-40dc-21f4-08d968e83852
X-MS-TrafficTypeDiagnostic: DM6PR11MB3657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB3657B4222610D59B7B73ED3AF4C79@DM6PR11MB3657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hd7pDzdW0Uk5GTZXM0Xs/BMaYa6MqqVdeAuI+VH6eghJp4ICtFsrRH0c57KJU0/0w2MYReGfEGxTXTCZVyjeljmPkl0m1QeUSZnsoPgWzrjOYhOfjF1TfjcmUI+XJbGx0By8tLjq8pKeqadyQqJnmrMD2g2Uyc51bwWnAiCt2RbvgbEN17vm5Hk75vcp8rHl9qtiSngg5X+eXPczfWXi3filxXsvX1ujt+YkIdz26bAPJZWndspZ3j9ytYEGT9lMgu/s5po92c9BmExPfGYqyFlTfSXUIMmqBjs0oWywdNuSFvbSHhT9k4StL6F0GZOE6MryelNq5tWf1xHhqFhZWCSjZvpwoLR5DNxh48WG7mhs8P91Jj7qHPK/geqtEs8nuAsQCfQPTWFBh6OBkM8VzCCc8QFr/b3QuvjpPhfjZfNcXZcrchrHWzNTXDdirOmBWNqh9kE6Z3FFhxaRgNXQWBbDqnsUI+YmAq3KQHBkEDFlCVIhkCwO/tz7OiqQ0GhK0efJ/jAhNNzdP3P19Ihwxsg1TU2LQDxInylYnpX+R25dY5PcR6HTVBr1JaZHe4nihFui6qFfKtZmZYTLY+ij5/RY4VnhiinfaEOM/PNEH4rFg/W5AMgigaHx3vEfkoPbUFH9C+cnUMs25unKYDk6eFi49CZnfphDXe90wR0H3lJlPd58TXkVvI140o2+k05i3V57eaR2zSZOH0aVd9wSmJkKZ38v8W8kpv/EzjbYOJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(316002)(66556008)(66476007)(66946007)(31686004)(38100700002)(8936002)(478600001)(5660300002)(86362001)(6486002)(36756003)(31696002)(83380400001)(16576012)(2616005)(956004)(2906002)(186003)(8676002)(450100002)(53546011)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzhXWEI3c3V4amtBS2NwT0t2cmxta2V1bmJOcG5aNzcrSmJJRnNmYmUzMi96?=
 =?utf-8?B?ZnJBcy9CNjBXOUUwTy9tRFo0L0JYQ2ZEYXVHUWdDNnp2VDdNVitrYnkxZVpp?=
 =?utf-8?B?OUk0dy9jR25kclMrZE5JaW42WTNxWXBJNzhnelBVVUQ1ZWlzVzFHTENRRHVK?=
 =?utf-8?B?TTdMZEEzNVAzT3RoMkV6MEJVWnpUdUlhWWZMT3JxWGl0d21ZR2lmeFNhK3Y2?=
 =?utf-8?B?UGRhUUsyOFNsL3l5Y08vZTg0UDRvMjdPVUp6Z2V0dU5HVGgwdGR5dFlBYmxH?=
 =?utf-8?B?YWVxSU5kTlpuaWhuL3dPY2czV081WHFWL01kTXN2YjZMN2dScVB1NDVFcVJj?=
 =?utf-8?B?enBJN25tc3N1eUpLRjhvTzhBNjhSZGRQWG5yTy9ZTCs0cTVtN0JXbkVNc3Bs?=
 =?utf-8?B?S1lnbkU2VmIvampiT242cytXUVU2VWtRVm9UdEZwNS9WRkdaMlZ0R1Nwd0Zs?=
 =?utf-8?B?SFJiWlE3Q0IrMTJ4eXhDbG5ySFFUTEd3L2l2Tm5VeEtzVE9LdzZlSHhLTTlZ?=
 =?utf-8?B?REJMc1c4enZGRmY4ZjloOVVVZDN1YkFlTVdQVFlDZ1NjSHBFTUdEeWcweUIz?=
 =?utf-8?B?d0VJTm1NaU9aOUNqQUV3R2luM2NrT2doYW5zS0lzcnJJSlh4L2svZlNtUUxZ?=
 =?utf-8?B?WkxVZDJwcDFna2I0ODdGV1BCM1RTaURvMElmK014c2ZGZkxNWSttS1RMZHVk?=
 =?utf-8?B?OUhkSVlHSktMWFdPL2ZPWTFvRVZrMUZQK3pXUG1WcnhuWmdYOEsrcWRxeHE1?=
 =?utf-8?B?RUhMeDFJMmZMNndCVnlYd0hjVEtqaGpObDVuMGNRUXlvSjFNVkRlVzN2bGha?=
 =?utf-8?B?RzhLSkJtb0x1Qmc0aGM1a2VYSGtXckxLTHdDMXVSeGlmM3k3MjRreCtaNTll?=
 =?utf-8?B?RlIwdFhKMnkvYkR3RjJLenJYY3BSYUI5ZDdqaW1SeXpjOFB1L21QTGVvcVk3?=
 =?utf-8?B?YlFTeGlrMXVSdW1uQTIydUk2TEFWMm94NnlHakdROFNLTGs4MFBiMHVtdkdy?=
 =?utf-8?B?a09FdkpGQnphWmpZclhJaGhjRXE3UEt1NENlOHd4eXRjaUFhRVJEa0RLc0pV?=
 =?utf-8?B?Zm5sYU5ZQlJaMDFpQ2NBZGlkeGlVaGVGZ2tpVzh5b0lqQkdHeVc2ZS9xTXlt?=
 =?utf-8?B?VXdpeDFFRGg2bmZSbU11ZlQ3ZDZWemRwWktTZmFYUTVBNzdlZkpkVEFqZXcx?=
 =?utf-8?B?Q05IVEVSdmxKcDRqdzc3Tk1LN2ZVNDRsTE9JNFl5K0VEcHBqRGczeDdnWjcv?=
 =?utf-8?B?SWN0K0s5VEV1akRiU0ljbUw1ZWdLRGVZQTBPdDRTMkZyMzgxWi9ZN3ZvR2Fz?=
 =?utf-8?B?UGpveGVJSFRvNGo0SFBkWlBZS2JycmYxZHRQR2JyRlVTc3dsRUp6Wk0wWFZH?=
 =?utf-8?B?dE96WjlUY1VlUjFWOTI1R21LZVVNamZURWdxVnFldjN6NEhzcDBVZVdDMFpR?=
 =?utf-8?B?QzNDQVl6ZTlMZFhFbEtnbkI5angyWUtLaHM3dkVpUlJIeEljUmFqU1lVV09Y?=
 =?utf-8?B?ODc0Szc3NzJoNHFWYTJzWmpzZHMwRVBpUjVNS0FzMlZqM05va2Z6RTBJTmYw?=
 =?utf-8?B?bXZ0WThFcW5JU2tqbHhlR21CdnhiY2c3UWgvUHlWOWJaZnpOcUFZVDliaFNt?=
 =?utf-8?B?RWg2MURMLzJEaVVpU3JVRjBRcSs3TjJNZU9zUzlCNTQ1dU5Ya3NJOW5yTEZ0?=
 =?utf-8?B?RkJiekNIQUVhamk0WlZBOXQwY3dPN1dNZ0hSVmZRRm81ck43K3Brd3EveXZy?=
 =?utf-8?Q?rZSkrhB0GJ+QwEHqRGgXtgx6i0pUmFX7EiYlk3L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c00cf0f-b0fa-40dc-21f4-08d968e83852
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 23:21:23.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je3oraRV0Yoke4/my/HBfkz5a+9JwT/2K3WhdeTnsD+Jha37cl4zawddGMiEZoPJuP47PgvrHQvngunRK27J+4H/G+F7YwLDG2jTZLyY1Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3657
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/25/2021 8:23 PM, Matthew Brost wrote:
> When the GuC does a media reset, it copies a golden context state back
> into the corrupted context's state. The address of the golden context
> and the size of the engine state restore are passed in via the GuC ADS.
> The i915 had a bug where it passed in the whole size of the golden
> context, not the size of the engine state to restore resulting in a
> memory corruption.
>
> Also copy the entire golden context on init rather than just the engine
> state that is restored.
>
> Fixes: 481d458caede ("drm/i915/guc: Add golden context to GuC ADS")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 28 +++++++++++++++++-----
>   1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 6926919bcac6..df2734bfe078 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -358,6 +358,11 @@ static int guc_prep_golden_context(struct intel_guc *guc,
>   	u8 engine_class, guc_class;
>   	struct guc_gt_system_info *info, local_info;
>   
> +	/* Skip execlist and PPGTT registers + HWSP */
> +	const u32 lr_hw_context_size = 80 * sizeof(u32);
> +	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
> +		lr_hw_context_size;
> +
>   	/*
>   	 * Reserve the memory for the golden contexts and point GuC at it but
>   	 * leave it empty for now. The context data will be filled in later
> @@ -396,7 +401,18 @@ static int guc_prep_golden_context(struct intel_guc *guc,
>   		if (!blob)
>   			continue;
>   
> -		blob->ads.eng_state_size[guc_class] = real_size;
> +		/*
> +		 * This interface is slightly confusing. We need to pass the
> +		 * base address of the golden context and the engine state size
> +		 * which is not the size of the whole golden context, it is a
> +		 * subset that the GuC uses when doing a watchdog reset. The
> +		 * engine state size must match the size of the golden context
> +		 * minus the first part of the golden context that the GuC does
> +		 * not retore during reset. Currently no real way to verify this
> +		 * other than reading the GuC spec / code and ensuring the
> +		 * 'skip_size' below matches the value used in the GuC code.
> +		 */

This last statement is incorrect. The skipped size is the PPHWSP + the 
execlists context. The size of the execlists context is defined in the 
specs (as part of the full context layout) and it is therefore not a 
magic number only available in the GuC code. With the comment fixed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		blob->ads.eng_state_size[guc_class] = real_size - skip_size;
>   		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
>   		addr_ggtt += alloc_size;
>   	}
> @@ -437,8 +453,8 @@ static void guc_init_golden_context(struct intel_guc *guc)
>   	u8 *ptr;
>   
>   	/* Skip execlist and PPGTT registers + HWSP */
> -	const u32 lr_hw_context_size = 80 * sizeof(u32);
> -	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
> +	__maybe_unused const u32 lr_hw_context_size = 80 * sizeof(u32);
> +	__maybe_unused const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
>   		lr_hw_context_size;
>   
>   	if (!intel_uc_uses_guc_submission(&gt->uc))
> @@ -476,12 +492,12 @@ static void guc_init_golden_context(struct intel_guc *guc)
>   			continue;
>   		}
>   
> -		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
> +		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] !=
> +			   real_size - skip_size);
>   		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
>   		addr_ggtt += alloc_size;
>   
> -		shmem_read(engine->default_state, skip_size, ptr + skip_size,
> -			   real_size - skip_size);
> +		shmem_read(engine->default_state, 0, ptr, real_size);
>   		ptr += alloc_size;
>   	}
>   

