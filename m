Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78774736EAE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 16:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A1510E2EE;
	Tue, 20 Jun 2023 14:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4810B10E18A;
 Tue, 20 Jun 2023 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687271463; x=1718807463;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VgwgRk2ZtfzuBIGcQfc8sRO0BfyQCt/FE6BK7BzcF6I=;
 b=myCSydjVMUhQwGFv2qHOo7a8V/NM5wR05jFFJgYOT9Ucx7R3fiBVSwx2
 fok0CjLWiUgILO4tiEbxBExa0aTVPz+E63eiT6iS4VWzsVV/mSZrSgoef
 d4CVXS9m2SvMqpJ7HZDYqFZMLa3lb17M0fZjFRMMARwo03CHR+7wD0bvI
 2sXRW5T8zYTBKoCvC5PiCbfSU7xDWZo+QnNW41wPukXOJtNc+A12j8MSR
 DUZcfN8G06Qw1RSiu9hAyVOW0s9a4BBLb/+N9dju0amRY/2CpeUH6ZuaL
 hDb2ylPMOWxvU+CS6hODsMLUKW1BuC9FlE2DCUSkycKILiEY//4N/w5Jz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="446247226"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="446247226"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 07:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="960805281"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="960805281"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jun 2023 07:31:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 07:31:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 07:31:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 07:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQbvULJTAQbNoQd8z16kGzn1sZx9PB4AYZCSrMzEI8sB5IsEEK2fhXSG43/nhbz9KJsxR1hlqGvbPPdOqoh9DftMZ/99+sEy9umkLplf2lQxXvQjaU9wTj82EccLB5hVQJx0NwMGYNdZJg3xVkh380UEDDWi1IY47xgdtjOv5H2ce2OUE3+okCTutXX+FyICnPgB9pNBnA3qfoY4lMvFj/u986kC3R4irT1W53rfxdfNJi9LuBMSC48/a853e3MZk7rVkLAN8IHZ/4fh5KqRarMCxGFmhQekcjJyDGztGecFn8IjcKeyjBquK5cz7z2jSTHHAIDH3jkEFOiifSDM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYjh8vfZM92OpMTPRzwqZsH+bEj1X1mrVKW6YjVwK50=;
 b=N/3G7EeWAqFWVvOeiSfGXaSyz+AeT1xlDtkmDOGzjCUYcMtTqUsBIrePoZEoW0YhuT0SEtQ11h3yA07jGA+zO/MJeaehtW9ZZBJiKNK1B2CMbPhkz/KfGX+zxe4x0gB2OeNAjRvooDIU653lSpLekOgGNkRJWxXiqCUBo26k5vJPbd6WDCsU1Miq2dfdS8GIK2P1unY1OkBadT3QxLlhudDLTcWI34uqSf/CK+E8/EWprKvZFPpko7zB0w57TNQNak6VEXWzTOexdzzJMdwkGJ5/x5N7bqo6VH4G64gA0WwrAwNgyng/m89DITpbKp6nDtIddVJK4zDWsgv1I0K2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19)
 by DS7PR11MB6174.namprd11.prod.outlook.com (2603:10b6:8:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 14:30:59 +0000
Received: from BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::c504:1864:9eed:136f]) by BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::c504:1864:9eed:136f%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 14:30:59 +0000
Message-ID: <7b7a779c-9cf1-efd3-c8e4-27211d0753ad@intel.com>
Date: Tue, 20 Jun 2023 09:30:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230601174553.2410741-1-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20230601174553.2410741-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To BYAPR11MB3398.namprd11.prod.outlook.com
 (2603:10b6:a03:19::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:EE_|DS7PR11MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bab223-a454-480f-af2f-08db719af692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: COssvrkWCLr9iudOcN/1RwwtSUdLjP+bGvUKWMbFG9DG+BdV3sFncswNUqCG+8h2UJH1FRC7h6aouhEkbXLTIIZc6lkTgX4rBioWY08Atyjgl0gBzc7Z2Gb28v+1GGYNHbm+zxHxETOT7K6spVCVVZ2LqpGcwtO1tM0NoAOVsanGjC55JXTIRcsn60AcowBve/lR/f10mbdRgMN+WFU3TxYLyCv9PcjwLd1ailTCJCFSuWQGzdVJrLA1xZcphFhvB/g+zNmOJZy7OJeDiS7Z62tfsHlHkdikwJOtvB9yhxABaId1NIw2Sytotej9p3jrhyGEc59H/BlBPlh512FDmstp/u9u1Mdxdv+GRs5hGecvq4beVHw2GFMjyysRuvZqamAWqrptCV773+vTn94yOeSkyaxdp2IE34pf0r2l8eJwKykm2Q2PMwsxG1dyy3yQJufawVBd/kXwAvNAEJhm7D2PGjABogcKFZPzkLFwvL+73lvX8qeSSYyxop5vU43m0V30QOONwOB9rvf9C+/BHWw/03vCCP+rdcBB4rbMTDrvrxB7kGOAOp/KDK6JayYggW8kQlEnUiGB5NCFNRCHJfzaq3UWGsA6HZS1VE0Ex44ldLQ0WyvxahxpxJMqLN1EvS+e5iQ/7OWaPGIQljrH1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3398.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(6486002)(478600001)(2616005)(26005)(6666004)(83380400001)(6512007)(53546011)(6506007)(186003)(2906002)(30864003)(5660300002)(36756003)(38100700002)(4326008)(450100002)(66946007)(31696002)(316002)(86362001)(82960400001)(8936002)(8676002)(41300700001)(66476007)(66556008)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRNSWdOOTE4ZjljVWlHV2I4cVU2NGs1NjA1aHU2UktZWHJsTENlemVaY3pJ?=
 =?utf-8?B?cU5xREhPdVBPQ3B2SE9HTnVOeHJiK0VCUzg1djZSLzlkNkFKbW9XVXE5T0k1?=
 =?utf-8?B?QXlMM0MreXJvOW9INnZyNFdUZzhGMW1pVUJ3VGtUTnZLYjNxUmcxeElqVU04?=
 =?utf-8?B?QkkrWHNDUjdiQjhSZ1pTREFyNDAyd3JicWpKQnpXS1ljbmFibFdTdk9vWlNU?=
 =?utf-8?B?M0RRNDJraDdHNmdrVFA5M1RsVjlqbjB1Vmd5NVZnWjIyRlFFd3NJeVA0Rzdt?=
 =?utf-8?B?em8yMHNOTTQxV0tieVpLU1pVRnJaTFZDMnlBekxOTENsa0hTbWRzYU5sNTZy?=
 =?utf-8?B?dmhYTEgvYzZwNTlEVHNSbmVybGFwMHJNWkpTRGVIejRoaHIzdVJwZlEzaVBM?=
 =?utf-8?B?ei9KV2o1clZzU0NDYVpZRUhwd0YwTEZmTjFTVnYwa05TZTFpNWJOTXRNU2pq?=
 =?utf-8?B?TmhQdXE3K3ZqMjRKbWxWOVlIcTNhUDJtbkhFY0RvcUM3d3BBNjQrWkc2cXdX?=
 =?utf-8?B?TGZNczI3RHZzSU9hSVNtQXRUaHBPWVl3QnRHelJERDFLRUNhbHN5MjZsQVZ5?=
 =?utf-8?B?UTdZMHgyelFGdHk5N05yZDF2OWd1NGN3ZGNhTE5KckNwQnVLN1hyYVpmUlZK?=
 =?utf-8?B?Wjkvc0NEcW9TeTIvY2RnWXpzK0YwWDdXbDhBbGppUzFXNVhTNWpJb0dIWGR1?=
 =?utf-8?B?UndNbnJxUzZrWFhSZ1hmZlY3bVpYQ1hKSDg3eTJRWXU2MDJsME5ZQTFhbTE2?=
 =?utf-8?B?RFRLaFNuNnBTSjB3cy8xZzE3aDZuZGZzbjBRMEZCNm81aVFON1d1S2NYcFY2?=
 =?utf-8?B?VXNUQVRkbDZDaURUR1dBY0tzemJnaUxxSUZFeGpuSWhzL21Jbm1PTGxJMjlQ?=
 =?utf-8?B?SUFjWmdMUE1EbGEvOXd3Rmxyemk0VnJNMnZ5UHRzTGZ5K3ptWXdZaVh6Mmpz?=
 =?utf-8?B?L2JzbFUwT1lhd2pFZUVhc1B5OUJ5bXRCUUhjOUk0ZzJnOFZFVkJLNGFHYml2?=
 =?utf-8?B?dTdYUEgzcUNZOFpxeHBmcFJlYUwvbHRML3lmRCtYRTZzUCtjRGdUUU5WQ25J?=
 =?utf-8?B?OTlET1JFY3RpL0VaUkR4b1RTN1VNUVZGb0hFK1NkVCsycVI2Mld0ODdoQkh6?=
 =?utf-8?B?WFdYbElKRlpJeUxsSmFlNkovc3JYbzVPa0VYQzJOd082MGJDVUFTR290UzRp?=
 =?utf-8?B?S1I0RHhrK3lSYnNvbXlMVitUL0wveFl3MHJ2Um9sMXFoTEgybERzSXdhTW1G?=
 =?utf-8?B?R20zckRITnNNYnYvcnlFcXNvZ1pQOFlxM2NuS09VaHkvZDEwMDhSNzJ1Nmcw?=
 =?utf-8?B?dVltY1NUdVkvUUhWM1hmNWNSdEFTWWRIWlhzeTUrN0hsNVVWNGRWOVJkVVpN?=
 =?utf-8?B?TjVDY3pVVlRMZjQ3em5yL1I3WDBWMno3Q0tQZkZRTjJxcm43eGhDeFhXUDRN?=
 =?utf-8?B?VEdVQS9oOTltQURYQndqYktjempudnQ5UjhuL3l4MlBPQ2RHd0hKd3ZvMkQ3?=
 =?utf-8?B?L2VFbzZCNlZiM0lGcXR4MXFRcmVzRjRudUNXZlFmVkhFOTZhc3luSjBUUTUx?=
 =?utf-8?B?WEVFeEwzdC9qUk83OSs5RytnbzRqUzAzV0FGRmZpVThud0duclhNellqRXFa?=
 =?utf-8?B?bVRLSW5jVnBDckE4Nmppa2J4aitTMFE5dEhWeUcvbmc2NFEyVVdBckEwQUZa?=
 =?utf-8?B?cEx1N2NJR0c3cmJOUGZSNm05eUZ3eTJNaDhERzl1d25TV0QzbjBjM01FT2ZI?=
 =?utf-8?B?OUFKUkhyc1ZBMlBNbnNDZjRHOW5lRzh1N3p1eVVKUVNzTkFvRWpQbElPd1RN?=
 =?utf-8?B?Vk9vb1lZQ1g0bXFGa09CVWQxaVdJRXgxS2VXM1lsdktjeXBuN0JGdHVOczli?=
 =?utf-8?B?dG82c3M2RVAzWG0zOTZtUHE0R0FPcFJSem9GWmg3eFhDRTFBaEZDTFEvY1RW?=
 =?utf-8?B?eHovR2tGbjlPU0pjTjVPL2RpQXltSmxyaDM5WllhaVFoSFJwc25sMlFEMi9G?=
 =?utf-8?B?T3hWdGZuZnJ5UzBpWFNsN0VXUzJSYnc4UmpjTDhlOXl4eGtidW80RmszMXF2?=
 =?utf-8?B?TU44Z3JCYzJPaUYxQ0IzYnlaSnN0engyUjVlT0lldkJHeTJVZ0VHR3piQ3JY?=
 =?utf-8?B?MHpLWjlCNThvSDNaL2loYmhEaENvV3ZOMDRiS0xOMVVkSmprRW5RUXduSkNv?=
 =?utf-8?Q?Cv+52oC2DeGmRcXyObmoyUI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bab223-a454-480f-af2f-08db719af692
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 14:30:58.3212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI7wodS2EQC0KhAWG1NusZfZzmQozfb+X/gFaaQUvwVdiMlNXfoW1s/DGLLtJ8jkm2azkUEeNTZkQcUpm1acVnH6A8XfDbW33iO4RWJ/GQfvBLEJxz/hR9GNXel3Qv3+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6174
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/2023 12:45 PM, Alan Previn wrote:
> After recent discussions with Mesa folks, it was requested
> that we optimize i915's GET_PARAM for the PXP_STATUS without
> changing the UAPI spec.
>
> This patch adds this additional optimizations:
>     - If any PXP initializatoin flow failed, then ensure that
>       we catch it so that we can change the returned PXP_STATUS
>       from "2" (i.e. 'PXP is supported but not yet ready')
>       to "-ENODEV". This typically should not happen and if it
>       does, we have a platform configuration.
>     - If a PXP arbitration session creation event failed
>       due to incorrect firmware version or blocking SOC fusing
>       or blocking BIOS configuration (platform reasons that won't
>       change if we retry), then reflect that blockage by also
>       returning -ENODEV in the GET_PARAM-PXP_STATUS.
>     - GET_PARAM:PXP_STATUS should not wait at all if PXP is
>       supported but non-i915 dependencies (component-driver /
>       firmware) we are still pending to complete the init flows.
>       In this case, just return "2" immediately (i.e. 'PXP is
>       supported but not yet ready').
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c  | 11 +++++++++-
>   drivers/gpu/drm/i915/i915_getparam.c       |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp.c       | 25 ++++++++++++++++++----
>   drivers/gpu/drm/i915/pxp/intel_pxp.h       |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |  7 +++---
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   |  7 +++---
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  9 ++++++++
>   7 files changed, 50 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index fb0984f875f9..4dd744c96a37 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -42,8 +42,17 @@ static void gsc_work(struct work_struct *work)
>   		}
>   
>   		ret = intel_gsc_proxy_request_handler(gsc);
> -		if (ret)
> +		if (ret) {
> +			if (actions & GSC_ACTION_FW_LOAD) {
> +				/*
> +				 * a proxy request failure that came together with the
> +				 * firmware load action means the last part of init has
> +				 * failed so GSC fw won't be usable after this
> +				 */
> +				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
> +			}
>   			goto out_put;
> +		}
>   
>   		/* mark the GSC FW init as done the first time we run this */
>   		if (actions & GSC_ACTION_FW_LOAD) {

On the huc authentication comment block above this snippet, the last 
statement: "Note that we can only do the GSC auth if the GuC auth was" 
is confusing as the code below is only dealing with HuC Authentication.

This function seems to have a section to deal with FW load action and 
another to deal with SW Proxy requests, but we seem to be mixing both 
actions in the SW proxy section. instead, can we move this call to 
intel_gsc_proxy_request_handler to the FW load section itself instead of 
handling it as an additional check in the SW_proxy section? In the same 
vein, we should also move the intel_uc_fw_change_status() call into the 
above FW Load action section. i think that way the code reads better.

> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 6f11d7eaa91a..1b2ee98a158a 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -105,7 +105,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   			return value;
>   		break;
>   	case I915_PARAM_PXP_STATUS:
> -		value = intel_pxp_get_readiness_status(i915->pxp);
> +		value = intel_pxp_get_readiness_status(i915->pxp, 1);
>   		if (value < 0)
>   			return value;
>   		break;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index bb2e15329f34..1478bb9b4e26 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -359,21 +359,38 @@ void intel_pxp_end(struct intel_pxp *pxp)
>   	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>   }
>   
> +static bool pxp_required_fw_failed(struct intel_pxp *pxp)
> +{
> +	if (__intel_uc_fw_status(&pxp->ctrl_gt->uc.huc.fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
> +		return true;
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0) &&
> +	    __intel_uc_fw_status(&pxp->ctrl_gt->uc.gsc.fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
> +		return true;
> +
> +	return false;
> +}
> +
>   /*
>    * this helper is used by both intel_pxp_start and by
>    * the GET_PARAM IOCTL that user space calls. Thus, the
>    * return values here should match the UAPI spec.
>    */
> -int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
> +int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout)
>   {
>   	if (!intel_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
> +	if (pxp_required_fw_failed(pxp))
> +		return -ENODEV;
> +
> +	if (pxp->platform_cfg_is_bad)
> +		return -ENODEV;
> +
>   	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
> -		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), 250))
> +		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), timeout))
>   			return 2;
>   	} else {
> -		if (wait_for(pxp_component_bound(pxp), 250))
> +		if (wait_for(pxp_component_bound(pxp), timeout))
>   			return 2;
>   	}
>   	return 1;
> @@ -387,7 +404,7 @@ int intel_pxp_start(struct intel_pxp *pxp)
>   {
>   	int ret = 0;
>   
> -	ret = intel_pxp_get_readiness_status(pxp);
> +	ret = intel_pxp_get_readiness_status(pxp, 250);
>   	if (ret < 0)
>   		return ret;
>   	else if (ret > 1)

In intel_pxp_start(), shouldn't the 250ms be defined in the struct as a 
define with a comment that explains why it is 250 vs some other number? 
Also in the i915_getparam_ioctl, shouldn't the timeout value be 0 
instead of 1 as this is a simple status check?

Also, the return value of 2 if the timeout expires seems 
counter-intuitive. I think EBUSY will be more appropriate especially 
since the IOCTL call seems to be a quick status check.

> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 17254c3f1267..46d65d641e2b 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -26,7 +26,7 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
>   void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>   void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
>   
> -int intel_pxp_get_readiness_status(struct intel_pxp *pxp);
> +int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout);
>   int intel_pxp_get_backend_timeout_ms(struct intel_pxp *pxp);
>   int intel_pxp_start(struct intel_pxp *pxp);
>   void intel_pxp_end(struct intel_pxp *pxp);
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index 8dc41de3f6f7..d891dd1d051e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -17,12 +17,13 @@
>   #include "intel_pxp_types.h"
>   
>   static bool
> -is_fw_err_platform_config(u32 type)
> +is_fw_err_platform_config(u32 type, struct intel_pxp *pxp)
>   {
>   	switch (type) {
>   	case PXP_STATUS_ERROR_API_VERSION:
>   	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>   	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		pxp->platform_cfg_is_bad = true;
>   		return true;
>   	default:
>   		break;
> @@ -225,7 +226,7 @@ int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
>   	if (ret) {
>   		drm_err(&i915->drm, "Failed to init session %d, ret=[%d]\n", arb_session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(msg_out.header.status, pxp)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
>   				      arb_session_id, msg_out.header.status,
> @@ -268,7 +269,7 @@ void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>   		drm_err(&i915->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
>   			session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(msg_out.header.status, pxp)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
>   				      session_id, msg_out.header.status,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index 1ce07d7e8769..535f4ff824b8 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -20,12 +20,13 @@
>   #include "intel_pxp_types.h"
>   
>   static bool
> -is_fw_err_platform_config(u32 type)
> +is_fw_err_platform_config(u32 type, struct intel_pxp *pxp)
>   {
>   	switch (type) {
>   	case PXP_STATUS_ERROR_API_VERSION:
>   	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>   	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +		pxp->platform_cfg_is_bad = true;
>   		return true;
>   	default:
>   		break;
> @@ -339,7 +340,7 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>   	if (ret) {
>   		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(msg_out.header.status, pxp)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
>   				      arb_session_id, msg_out.header.status,
> @@ -387,7 +388,7 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>   		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%u, ret=[%d]\n",
>   			session_id, ret);
>   	} else if (msg_out.header.status != 0) {
> -		if (is_fw_err_platform_config(msg_out.header.status)) {
> +		if (is_fw_err_platform_config(msg_out.header.status, pxp)) {
>   			drm_info_once(&i915->drm,
>   				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
>   				      session_id, msg_out.header.status,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 1a8765866b8b..7e11fa8034b2 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -26,6 +26,15 @@ struct intel_pxp {
>   	 */
>   	struct intel_gt *ctrl_gt;
>   
> +	/**
> +	 * @platform_cfg_is_bad: used to track if any prior arb session creation resulted
> +	 * in a failure that was caused by a platform configuration issue, meaning that
> +	 * failure will not get resolved without a change to the platform (not kernel)
> +	 * such as BIOS configuration, firwmware update, etc. This bool gets reflected when
> +	 * GET_PARAM:I915_PARAM_PXP_STATUS is called.
> +	 */
> +	bool platform_cfg_is_bad;
> +
>   	/**
>   	 * @kcr_base: base mmio offset for the KCR engine which is different on legacy platforms
>   	 * vs newer platforms where the KCR is inside the media-tile.
>
> base-commit: a66da4c33d8ede541aea9ba6d0d73b556a072d54
