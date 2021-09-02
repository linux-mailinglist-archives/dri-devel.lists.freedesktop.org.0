Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F93FF41D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 21:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463E26E7EF;
	Thu,  2 Sep 2021 19:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A1B6E7EF;
 Thu,  2 Sep 2021 19:25:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="219282940"
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; d="scan'208";a="219282940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 12:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; d="scan'208";a="499952729"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2021 12:25:20 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 2 Sep 2021 12:25:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 2 Sep 2021 12:25:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 2 Sep 2021 12:25:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 2 Sep 2021 12:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhryHunmfG2XhgYONhb8tNBuYf7pFvNp6OtuT60VXc5QkpQszYangaNI4lqR0GXGN8+qKUmpvh82Ek9FT9IGZFm/pXEbkZR8tN7Ste6t1+z01oCRAkYnCKdSIU4EwHYGN5GWME7bW2oxJ2/Yk/AjoPkhAdGjK0m0FJLtDONcN9EHqwIIMfLYBqtGCbXpdcJf5oLdCtt97nEpvr9cttpgqgLLtGVTxGVShXWsgP4kMZdxFApthXxngNgRerUhU3I/NL+1MWbHPzTaRW5CSxBGWIa2zYPdF+wiJWA303C2MoeAWxjplQVdodbW8FoKu+H8AbJSrogoXMd82MGS4QS6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoY/WPZdAhNCgcOEV4TAR+ZAr/5Lhm3mte3Qv53p8PY=;
 b=HPVxjICVONZ2jVbzoCKYS/rmHnTJV16PhrYoaJ04B1zFe36uwg3iSZODbVvoXrsua4Ri30Ot0q0qDvtrUBSjMurDZEYLMOy15wk5WApDNkIk50mMFvVdzdsSPm5k1AQm7dD9Tqhz20Gp5ZRsh7JlG315S9RcpTM94TccITO8s3WGybDWnHWuDP5WYZ9Lk4X3LvC9NzJ8Jj5JorpRgdbBt0nRG1lYsa6SKrJ+hJu27zBgdGsrPhgR4qI2xvcCHdnM7YThh9uA5BnCD3LaG8XIiaqnutMrLo9myTZRVWlFye/vdoDrcUOjaMonMF8jWhuij6ytS2/qthv0NvGk6TkX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoY/WPZdAhNCgcOEV4TAR+ZAr/5Lhm3mte3Qv53p8PY=;
 b=TDegEwGQP46VS3MBFoX8KpgkY9x/MojivLmC/2wvjGmIghXdhul1U1YesjVtOtpt6TBAScrVWt3hX3xEOJXyJFnKp1E8MP5+oM3oOJ9RD6vhZfb1B2T2OFxQbbZi+gaVuDa31FINBIeKRd1AHME9kD/c/BZ0WOJC8aU9CfWEpCk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Thu, 2 Sep
 2021 19:25:16 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 19:25:16 +0000
Subject: Re: [PATCH v5 10/25] drm/i915/guc: Copy whole golden context, set
 engine state size of subset
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <matthew.brost@intel.com>
References: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
 <20210902005022.711767-11-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <ff1a37b2-0275-9f2c-763b-0ef818c29c48@intel.com>
Date: Thu, 2 Sep 2021 12:25:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210902005022.711767-11-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR1701CA0024.namprd17.prod.outlook.com
 (2603:10b6:301:14::34) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR1701CA0024.namprd17.prod.outlook.com (2603:10b6:301:14::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 19:25:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc855afa-b30b-478d-4645-08d96e4764b5
X-MS-TrafficTypeDiagnostic: PH0PR11MB5643:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5643754D7A18D8D68BC6571CBDCE9@PH0PR11MB5643.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wu5XSEFdOmR7doM76tvbk2yM5X8aec7711s03MZKPz48YmanWBYVYtDjpG205wpXuFGC4atxp9ve7v31xqc2catI0nQbS6GX7OCxGVV959wu+jKtHkT6bAJIqk//D+6asWXHtbTGqsJkfiIteOVJNYHcEqrwIftSs60/gKQmxxcfbrqZrp8736VXJQzlDS/h9mDkEEBH70GmKZ0dvdbH94nLvFr6TnUONpY8nrnL1QlM/p/sV7svpL/hNeReQZYXW4G8fgqAPhFrgDzgwWw98pJbYqR59gOC9gZb3Gu1U4bRgZcV5RV1v90HGwnKryipjIA61yqf+Y3gKTE5lxm6l542Ob8vwMmCwXfY6rNFSflZvF8gkk0180MONioZlSl6FqyKGDm7jg/LwYmGSV+CNlBSduenPJklYhrHAmGi0qCwdDaUETylXOadHJ0fNWaPBLa2JJMgvoBIKrTGe0zAjyo6P35MFT5Zv1FiDaSnXvqY0s3GomQytXWO7QtFw/GAsoI/dQL9/UQ/U08Q+y7rOcpXLix35QLiF8MzcW4jtbxfhpKOWMfk92PGX1jXLz6eBMIBF3FKqUzL7IZxWJ/NAGj+vIgPSsD/cMI13gwXXZsRiCCJI07yTUGOtLoPWjZWyOf7hHJQKkBe6pBKbq0pEsnJhws6x+fEh5w1TGHVFwkPctNxwn7dKRle0PiSLQA/KAOQJG4dNjMc5fySiPjDyK2okz0bQj95d+khz7jcWGGw3pFkgsJ8WeeSPFdSpe5M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(186003)(53546011)(26005)(956004)(107886003)(66946007)(2906002)(450100002)(5660300002)(2616005)(83380400001)(31696002)(38100700002)(4326008)(16576012)(66476007)(36756003)(86362001)(6486002)(8676002)(316002)(66556008)(31686004)(478600001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2J0NlBYbWRXTFZINEg2WUtVcGhtR2xRK0RNbVRQY0pBcnhkejF2UzUrdVVB?=
 =?utf-8?B?MVNnbTNMck5BMkMvYTN0dzVBSGROV3FmRTlxYWt5bXJhSVg0b3NWY2xBbG94?=
 =?utf-8?B?RzBWWmFFKzNFYTlpalF3SVA3WllxYlUvM3Z1SFVmRm5acmYwR3V6SHZVMnMr?=
 =?utf-8?B?L2dqdUNRRjA2MmhMRy9hbCtRcXluSmEvV3VKNXBmYnZLSlo1MnFCU0FodlhO?=
 =?utf-8?B?STY1dCtBa0NzMStVK2E1MERucnp5d1BwZ0VCb3VxamV6ZE9zbXdtUDY5aU5R?=
 =?utf-8?B?MlY3S2lFWE5HZ0NnOEQ3R09IVFM0UGl3NjFrZDJCQ3lSTVVwTytGbGoyaDhP?=
 =?utf-8?B?KzR3TnpSWityTjF0a3o5V2RMME9PUk1iSHEzZm5odFdmaXRzbklQVXVYOUNS?=
 =?utf-8?B?RnZYbnNQdFJiN3l0UlYwSFpmamhXNm5LRFV4ZktidnNrT2Y5Y0VINFFrbWtH?=
 =?utf-8?B?NlBTWGNmYncwMGxkYzNYc0RLRVJTNVZ5blEvRHJCaTVYN2ZpTno1U3BZaElD?=
 =?utf-8?B?bGd4aEg4VDIwcHB3OEJHbm9Wemc0eHZaTmxNdFI5SjJFeUVTVVFVM0FFc3M5?=
 =?utf-8?B?Y0k0SXkyRHJUWXpKdDZxMHlUYTJ4NVZSS0JlbUppYmVjdU9ndnpobzVRU1ZO?=
 =?utf-8?B?Wmo2NE5rR1IwcXV6SlRBTTdmYWR1bHpuL1E4YlJhZDNNSStTVmh5RmtYazRm?=
 =?utf-8?B?SCs2aEx2cmxUTDRxMFdjcklQWW50dWpqeVRza29iL0tsQk01RVNvZm0rc1Qw?=
 =?utf-8?B?MmYwdFhuRHpqaGYyYzllMGxiQUQ0NTNORnh0K2pjN1NuNzFhZ3U2Yk4rWEh4?=
 =?utf-8?B?US9GY3NJUDhXUHNXeXRkTW5LVHFjc1M5enBHMDBhQzk4R0hBbnlKeWJnSjJW?=
 =?utf-8?B?NUFEamFSM2o2TUtHY1JVQVdnLzMxMTVlUkdNbllIcHhrNGo2R05xcWh0RGY4?=
 =?utf-8?B?QjQyVjhOOTZ4QnZneWxzL2thQUV0dTVQRFlLY2piVjBrVDVNalNwSjZIS3Ir?=
 =?utf-8?B?TXI4SDdTdDNhWUl4Tk00RW85Vkd1Q1loUG9XQVZlb2hHR3JHb1FVUEFNV0tG?=
 =?utf-8?B?Q2tsSWd2VXRtNFlOZEQwdUd2dzdXekJ0ZlBHV2FuODVBaWQ3M211RVRXVWNa?=
 =?utf-8?B?Z25JUzBVOTBNUUVQZEorVHVaV2R1ZXZyMjVxYk81NE14UzNuS1BPMG5vN3kw?=
 =?utf-8?B?cWF3Rm5zRkx4dG5aZHpWRlZqMElNUE5JbWd1VjFWeWFSQjMwQUl3L2orZmk5?=
 =?utf-8?B?NXkxcms3MG44WXJWSWpxOWExSGs3ZmlLZElwWWRYZ2d2UUEyUGVLbnJoN3ZZ?=
 =?utf-8?B?TEZ6cHVmME02WFJQcVBZZ005Z0VhdlFpbG13VFFybzRrWGc1NFBRTnQzM0xy?=
 =?utf-8?B?cWpJQzJRS05VYXFvaS9FSXd0RkcvaEJJczRUakx5dkI4ejZnczZYUzFkcHdO?=
 =?utf-8?B?dUtUSVk4SVk5cXhrN0F0K1pzb1dhNVZEM3h3cE1CRmRCQU5QVVIwbWFlM2tP?=
 =?utf-8?B?djFDYlRXT09qb3krejRGM2U3OTBGdm1NZVp0RzBqMjdLTnNlWEk1WnRTWDJP?=
 =?utf-8?B?WEpjNE53TjgvVDd0cWczZzZMeWVWMjhyM3lQUkxlUGEvUFZoblFMSDUzNTRu?=
 =?utf-8?B?Tm9iNzBwQTB6aUpMTjdVU1dvazhwdG9SSUdTUStKWjBwZG1mR2dYS0FZTnVk?=
 =?utf-8?B?TEpwWFV4RHdYajkxTUNldWRBcUhLT200TmVVRGRDeVk5U3I0U1p4TGsrRkR3?=
 =?utf-8?Q?7nwZ15jKVVwdkn8QLEdL/LPuIKe5dIpcwvKFS1W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc855afa-b30b-478d-4645-08d96e4764b5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 19:25:16.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3xvkAulqXHhcyotr6M6sbQUWOctndnYECMKfMJgzI9J1QaXcvIMuRmIhz493rF6Btrvw7vEnS4kciVSCeX3fAxYIumx80ERKrP/AE55FS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
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

On 9/1/2021 17:50, Daniele Ceraolo Spurio wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
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
> v2 (Daniele): use defines to avoid duplicated const variables (John).
>
> Fixes: 481d458caede ("drm/i915/guc: Add golden context to GuC ADS")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 26 ++++++++++++++--------
>   1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 6926919bcac6..2c6ea64af7ec 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -349,6 +349,8 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
>   	info->engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
>   }
>   
> +#define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
> +#define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
Personally, I would have preferred to turn it into a function. 
Especially as it gets more complex with the later platforms that are now 
being pushed upstream. Not a blocker though.

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>   static int guc_prep_golden_context(struct intel_guc *guc,
>   				   struct __guc_ads_blob *blob)
>   {
> @@ -396,7 +398,18 @@ static int guc_prep_golden_context(struct intel_guc *guc,
>   		if (!blob)
>   			continue;
>   
> -		blob->ads.eng_state_size[guc_class] = real_size;
> +		/*
> +		 * This interface is slightly confusing. We need to pass the
> +		 * base address of the full golden context and the size of just
> +		 * the engine state, which is the section of the context image
> +		 * that starts after the execlists context. This is required to
> +		 * allow the GuC to restore just the engine state when a
> +		 * watchdog reset occurs.
> +		 * We calculate the engine state size by removing the size of
> +		 * what comes before it in the context image (which is identical
> +		 * on all engines).
> +		 */
> +		blob->ads.eng_state_size[guc_class] = real_size - LRC_SKIP_SIZE;
>   		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
>   		addr_ggtt += alloc_size;
>   	}
> @@ -436,11 +449,6 @@ static void guc_init_golden_context(struct intel_guc *guc)
>   	u8 engine_class, guc_class;
>   	u8 *ptr;
>   
> -	/* Skip execlist and PPGTT registers + HWSP */
> -	const u32 lr_hw_context_size = 80 * sizeof(u32);
> -	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
> -		lr_hw_context_size;
> -
>   	if (!intel_uc_uses_guc_submission(&gt->uc))
>   		return;
>   
> @@ -476,12 +484,12 @@ static void guc_init_golden_context(struct intel_guc *guc)
>   			continue;
>   		}
>   
> -		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
> +		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] !=
> +			   real_size - LRC_SKIP_SIZE);
>   		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
>   		addr_ggtt += alloc_size;
>   
> -		shmem_read(engine->default_state, skip_size, ptr + skip_size,
> -			   real_size - skip_size);
> +		shmem_read(engine->default_state, 0, ptr, real_size);
>   		ptr += alloc_size;
>   	}
>   

