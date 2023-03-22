Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3529C6C551E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 20:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC5910E13A;
	Wed, 22 Mar 2023 19:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259110E06E;
 Wed, 22 Mar 2023 19:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679514254; x=1711050254;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0W3ctK/QBYar+ehoVfDHMaWE8xSuFOfTCWTQH3d1IPk=;
 b=IZT2Giw398dnjXDWRtyZjjxED2XvbXOaMsP35WAHSRIEow7yPuNl8AaM
 hzfD4/Vqgxi8pP3Qm4hlllalbglvZm2G7G4pjbEtyBMjMPLTVrdq544Fe
 /k09aLgCnzb30KApGcODEGwx1FzT7dLDf7u46RAJqdbm4zyYYW44swstr
 2Tdi8HRDGheTHtuh3uC94x9nKAnaaQZHPO78HmdnfHwtTm6spsEOBnjIR
 v+Qe7vYQyaiPnbWf8oUh5niEmDI7I98KVe03QggDdXnQOMmZRkx8C+YV9
 9Wr58+KgHWRsrsZYRw7pSRuc9q377d6bxbAR+bFVP653J0DU9FOSSAW14 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323167448"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="323167448"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 12:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751191810"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="751191810"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2023 12:44:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 12:44:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 12:44:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 12:44:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYgXOqltKRDlm/lTFTul98SlwViWOvHDBKYDooijHyQx8RONv9HqTqjrExIXiutLHbkQJsE93trgPbvHZv/gaH4QJ9q0ZjFLT3NYz25Oii3X0GEjJAtCSyoPlpslmuoExj3D1dIN3W+LFpP6POaAJiM2uuPg0d/tkPc0fbzGS2Eh1F+6ZaKJwjLLz7W/Zvr1fU2Dxw65MA76Iuj0gHytkVhRztW7/BHrUKKELxtNso+ctGW0imAtLuARuyY85Ncr3TsgaHQv+H5JM71Wdp281rQCOqtFfFhgHiVabGt0CqujD54pScfOvofZqUhXjK93NTyVVSzfqscScIRdNt6tmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+g5y+rcJxYCd7paPwqsTBYXEAC/tmtFenpvU3n9YO6M=;
 b=cJB9lXb7BmjkeYjgl4sNHHgf2XxkbwM4H/nt1HBKEUdIw/JR4WnefCvLgDIfRmt+hl1LSown4y3kx99bZsn3gtN2f2bzSSjEoi1iUzYiGTTEw/AZgRoTStgEvPAOg5GDO67NR1BwX28ZvQ8uiSreHIFRngK+BBXZ8KKGdllhGqCfeUAWzntYgudrge13ZefDrflD7PTadiknGq1HS+XkjMDSfcVxlgpx7wHnU79T/I1eAIazy9MLE31Ir+mAvd5HmJikqvTlRKWrZgJ3iHX4yu9oQkfsFqBD4e9QIEAZxHp+gOr55RPDwKYulmEJ8EZsbZRr9dJhtLG7uxpAxokw8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 19:44:05 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab%6]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 19:44:05 +0000
Message-ID: <6763dca1-5061-f508-0846-8ef51a7acdc8@intel.com>
Date: Wed, 22 Mar 2023 12:44:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] drm/i915/gsc: implement wa 14015076503
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
 <20230320211039.1513368-2-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230320211039.1513368-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO6PR11MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: eabc4ec6-95dc-46a4-1fea-08db2b0dcb67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/maV3yeUpEz7HeGj6OG87avVcmWZEiYEl6dE8UwBnkVtjeiXbq2AN1x7p0V1qggAwvpHc7TucmQpurYGDZrkdVnB5Q4/JGk1zWAuU1GtEGwl+j6pLvQBUYj4rUjmUlc9iubKpm2h2Ou/cwLcNGj1evvkG7ouLQH2vapQkR7nT9CUcaO2ADAg8z88PUDI7ZoX5J5PpedtkHxqS5zSqaB13D0RqzHJ7j3X5VElxCjCsWOdTwLL7PnkO0jpMC34RhvLuun8UDETCrAz8wdSxhys5ZJz/mZMDjB5ru7JoCXR6Kw5JBs5LzX5p/c3OPdRt2+g6vRD/LbqFBmtKD1LBfb2VIB/3+COBda86cnO0dxSsed7qbYKCU5de63Tz70JxG1FHnoCpy0aehO07/8HP3AoP55UKWAc2/5kgiFxBccxGBxAsLQ5KNLgf6tUgX2DKLH1zpw3ws5fo6aFPzKINQtu4iLRQZz9nvNVa2xVl/NOodR8gRKo9dHF35iksodJnMyx/+q762AVyX03sabochHRtZ8fGpC/MiNPxlpFekzNAlOR++5CHhTun/vvoSCfThjKlfVd5RSL4LmY0rEDVXobzohtoWKuanmk6CzcU3TQECLGfoz/Ip9NDrdQiuRCKDBT+8LzvgdxDMf7ZnXUPfClqr5xMThBzq6n8JfZx3yjNEVpTtlAuwNIABLjppNekliExC3gGjwWxNktpZOaKCnxxh83hc2fmocrLp6iHr5KCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199018)(2616005)(6666004)(186003)(4326008)(6486002)(83380400001)(107886003)(38100700002)(478600001)(316002)(66946007)(66476007)(8676002)(450100002)(66556008)(54906003)(53546011)(26005)(6506007)(6512007)(31686004)(41300700001)(8936002)(5660300002)(2906002)(82960400001)(36756003)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEVhQ1NPbkpDNExyYjJTblNRcWxsWitUdG5US0xzSm9OUzJHQklFVDV2Mmp4?=
 =?utf-8?B?WDRKWENDMC9oKzd5V21sekY1TUlXc2dQSFlNV201alVMdHVaMUtCTlR5eXU4?=
 =?utf-8?B?K2VUU09sb0swRE5TamJDeGo0eldNNzNodlVnK2h6OVF0MVphdFlIRjBmRURm?=
 =?utf-8?B?RUd3OWlMdkpTSk15UTgwcSszeW9qTEd0aVNhaDU5MHZNYUhQazBIT25VT1FW?=
 =?utf-8?B?Tm4vcHNZY2Y3Nk5OSEp0d0dsWnNJaGFSaFQ4ZGNUbndPTFF0RXFxZU1seGcz?=
 =?utf-8?B?RmFKck1Qb1dZVkx2QlJLbElTUjJYaDVOU2tNOW1zbVh5L1I0eDhYYXlaVDBW?=
 =?utf-8?B?YVpZeHExaHdpSWxVcHdCYVVXOEFPTmQ2OU1XK0twTVQ5cTRsUVROOU15clZW?=
 =?utf-8?B?NVY0MnZTMllnelRXRTZOaWdCek5tbzducURicGE3TGIwcTQzZHdhRmE1OVRD?=
 =?utf-8?B?QS9yNFM0eEJZRCtBZWxpeFAyK0U4MzY4S3RFMkVMaHFwOFd4ZlZWZEcybURY?=
 =?utf-8?B?K1VOaENTMklDWU1OVy9vRlRibFJIUHVpVnN0MFBDUjJhMU1wV2tMZEN3ZDJJ?=
 =?utf-8?B?cUsreXUxckg4OUVqSGIzNk82N1d4bkVYWDhWdGp4WVc1MmlUNE9TWmYzc294?=
 =?utf-8?B?R283aEdIaDRvbXhoYTZ2cFA4alFTdTdDS1czSWhkWVhNQTR1VnVHa21ZQjdB?=
 =?utf-8?B?TERRZEIxdWM3Tlh3ZXRQTENqdTN1SlRiUHNsVWRQVHdEZDk5K2FkS0NPSDYy?=
 =?utf-8?B?V0lrVnBzQk1QYW9Qc09zUWpjVk9SODFMaHIyU01HTFdCVFR2SWtCRnBTQWJY?=
 =?utf-8?B?dmQwK2k3VTIvZGdiSDB6QTBHSU9uc3NSWnF6K3pzTVBBZE1jY1A5VWIzL1pJ?=
 =?utf-8?B?eUNqSmdxQzMwVVNTVE1WcDg2ZWwyaG1XQjg5Y0N0WFNXbGZQTmY3WDB2Qi9N?=
 =?utf-8?B?SC9YakFtQW9GNFJMbzhRejRLQlp4dWJOTEJLaC9UZ0dLWEZRSEJBdWdtNTF6?=
 =?utf-8?B?c0Yxb3RhaW9ESS9IL1dlS1h2cnhlMWQ2cnNrblNlNnBNRUZwTEJoUnZSRndK?=
 =?utf-8?B?dzVuOTYydnNhek1XdXptMFhsVWU0SE5kcDlNc2hvSHF2M0hDamhaRCtXdjgr?=
 =?utf-8?B?UmhscEZQL00xVlQ2TlhRN0NZZEVPZERMOUVRQ09UK0pqaldPYmZTYmZURjNV?=
 =?utf-8?B?cWppVldvbFNyeWRzRjlvTVJld0dJT0JXbGdBTkF3QWUvWVllNUUwb1JjcTd5?=
 =?utf-8?B?OC9yeE42MjQxQ2pCZzAwL1k3VzMwNjk1NTdMSUxsTkRTZVZvdjhhL2p6cTZJ?=
 =?utf-8?B?dmtOTEpJRDZzWStpeWc1TkltdGViTW9IdlA1UzBTTzN5VU05bUo3NTlkak9C?=
 =?utf-8?B?bzkrWXphL0UrRVp0V3U1N2tETWpOZFBrQkdxU1I2RGZGZXY4ajkvTU5RdG00?=
 =?utf-8?B?SUk3QW9hZGxnZWk5VktPdndkSlhKRzFKNENWMUpLbUFCeEI1QU9idUZPSmMr?=
 =?utf-8?B?SHUrMEl5SElTYW1DZERFNkZBS2lVQmlMcTQ4RlpqZmdvQVF5Snc4cEhOQTBy?=
 =?utf-8?B?N3o3d01tb2lFYVNudis2bmRjd0NMZ2dLRUpLY3VGd2tINFhtdVlTdnh4ZWl0?=
 =?utf-8?B?dW50c1JENWZhK2YrVG9ZamJWbFdTK1JaaGQ5b1Bja1lFK0wwc0Rka1NSZE53?=
 =?utf-8?B?SHJpVCs4UmpiTk9JTmJidFlrVkYrYlNZZnpSdWhReUFrRXQ0UU4rQmRoZGMw?=
 =?utf-8?B?SlRCNHFwc3pjL0tObzRqSTVmR280T3RBMm96RnFmTFJLdUcxWlJjdGtGR1l2?=
 =?utf-8?B?N1dWUXhYRmpFZUsxbENwdjRVbHAyTmtBL0UzWUNNTUhjb0xoN0xMeXhHdzNs?=
 =?utf-8?B?MEs3Si95Q3RicE52S1g3bzBHRm9UVTBISkdkZGlTdS85d3cvZUtPN1dQR1RR?=
 =?utf-8?B?S3pNSVdkYlR3NmQ5am9Pczc4QjJ5NmppbS9oTmN3V2pvbnFVWW91dTVmTnEv?=
 =?utf-8?B?QnFvb1VUV01nUGREanFyUkxLVHI5S3d5eXR0QkhoaFJXZmw1a2xTcWhRd0ZY?=
 =?utf-8?B?Vzd5SVdIcDhqTDVpbHFUWFlCL2psRWlScmx6UUJkdzJ3aXl4Q1YvK0dvVE5z?=
 =?utf-8?B?bzliRm9seFdnay8zNGI2aXg1VlFLV1RhdG4rUklTSUZUbjcyYTlZWDBOZjdo?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eabc4ec6-95dc-46a4-1fea-08db2b0dcb67
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 19:44:05.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xnm1DqHmfzdxLPBU0JnD9BT75MdtkUm2vp2W5sXfB44GUpchQErdkR6u/BLFzhqR3E+AobhPouVZxG6XI+zjtO6yuQ8TFXHLdMKfb3qbAbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5603
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
Cc: Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/20/2023 14:10, Daniele Ceraolo Spurio wrote:
> The WA states that we need to alert the GSC FW before doing a GSC engine
> reset and then wait for 200ms. The GuC owns engine reset, so on the i915
> side we only need to apply this for full GT reset.
>
> Given that we do full GT resets in the resume paths to cleanup the HW
> state and that a long wait in those scenarios would not be acceptable,
> a faster path has been introduced where, if the GSC is idle, we try first
> to individually reset the GuC and all engines except the GSC and only fall
> back to full reset if that fails.
I'm confused. If the code path is a resume then surely all engines are 
idle. But, there is presumably a reason why we do a full GT reset on the 
resume - because the hardware state is not guaranteed to be sensible at 
that point. So how is it safe to skip the GSC reset?

>
> Note: according to the WA specs, if the GSC is idle it should be possible
> to only wait for the uC wakeup time (~15ms) instead of the whole 200ms.
> However, the GSC FW team have mentioned that the wakeup time can change
> based on other things going on in the HW and pcode, so a good security
> margin would be required. Given that when the GSC is idle we already
> skip the wait & reset entirely and that this reduced wait would still
> likely be too long to use in resume paths, it's not worth adding support
> for this reduced wait.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c     | 77 +++++++++++++++++++++--
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h |  2 +
>   drivers/gpu/drm/i915/i915_reg.h           | 14 ++++-
>   3 files changed, 86 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 2c3463f77e5c..5f75f59122cf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -14,6 +14,8 @@
>   
>   #include "gt/intel_gt_regs.h"
>   
> +#include "gt/uc/intel_gsc_fw.h"
> +
>   #include "i915_drv.h"
>   #include "i915_file_private.h"
>   #include "i915_gpu_error.h"
> @@ -695,6 +697,67 @@ static reset_func intel_get_gpu_reset(const struct intel_gt *gt)
>   		return NULL;
>   }
>   
> +static int __reset_guc(struct intel_gt *gt)
> +{
> +	u32 guc_domain =
> +		GRAPHICS_VER(gt->i915) >= 11 ? GEN11_GRDOM_GUC : GEN9_GRDOM_GUC;
> +
> +	return gen6_hw_domain_reset(gt, guc_domain);
> +}
> +
> +static bool needs_wa_14015076503(struct intel_gt *gt, intel_engine_mask_t engine_mask)
> +{
> +	if (!IS_METEORLAKE(gt->i915) || !HAS_ENGINE(gt, GSC0))
> +		return false;
> +
> +	if (!__HAS_ENGINE(engine_mask, GSC0))
> +		return false;
> +
> +	return intel_gsc_uc_fw_init_done(&gt->uc.gsc);
> +}
> +
> +static intel_engine_mask_t
> +wa_14015076503_start(struct intel_gt *gt, intel_engine_mask_t engine_mask, bool first)
> +{
> +	if (!needs_wa_14015076503(gt, engine_mask))
> +		return engine_mask;
> +
> +	/*
> +	 * wa_14015076503: if the GSC FW is loaded, we need to alert it that
> +	 * we're going to do a GSC engine reset and then wait for 200ms for the
> +	 * FW to get ready for it. However, if this the first ALL_ENGINES reset
if this is

John.

> +	 * attempt and the GSC is not busy, we can try to instead reset the GuC
> +	 * and all the other engines individually to avoid the 200ms wait.
> +	 */
> +	if (engine_mask == ALL_ENGINES && first && intel_engine_is_idle(gt->engine[GSC0])) {
> +		__reset_guc(gt);
> +		engine_mask = gt->info.engine_mask & ~BIT(GSC0);
> +	} else {
> +		intel_uncore_rmw(gt->uncore,
> +				 HECI_H_GS1(MTL_GSC_HECI2_BASE),
> +				 0, HECI_H_GS1_ER_PREP);
> +
> +		/* make sure the reset bit is clear when writing the CSR reg */
> +		intel_uncore_rmw(gt->uncore,
> +				 HECI_H_CSR(MTL_GSC_HECI2_BASE),
> +				 HECI_H_CSR_RST, HECI_H_CSR_IG);
> +		msleep(200);
> +	}
> +
> +	return engine_mask;
> +}
> +
> +static void
> +wa_14015076503_end(struct intel_gt *gt, intel_engine_mask_t engine_mask)
> +{
> +	if (!needs_wa_14015076503(gt, engine_mask))
> +		return;
> +
> +	intel_uncore_rmw(gt->uncore,
> +			 HECI_H_GS1(MTL_GSC_HECI2_BASE),
> +			 HECI_H_GS1_ER_PREP, 0);
> +}
> +
>   int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>   {
>   	const int retries = engine_mask == ALL_ENGINES ? RESET_MAX_RETRIES : 1;
> @@ -712,10 +775,16 @@ int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>   	 */
>   	intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
>   	for (retry = 0; ret == -ETIMEDOUT && retry < retries; retry++) {
> -		GT_TRACE(gt, "engine_mask=%x\n", engine_mask);
> +		intel_engine_mask_t reset_mask;
> +
> +		reset_mask = wa_14015076503_start(gt, engine_mask, !retry);
> +
> +		GT_TRACE(gt, "engine_mask=%x\n", reset_mask);
>   		preempt_disable();
> -		ret = reset(gt, engine_mask, retry);
> +		ret = reset(gt, reset_mask, retry);
>   		preempt_enable();
> +
> +		wa_14015076503_end(gt, reset_mask);
>   	}
>   	intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
>   
> @@ -740,14 +809,12 @@ bool intel_has_reset_engine(const struct intel_gt *gt)
>   
>   int intel_reset_guc(struct intel_gt *gt)
>   {
> -	u32 guc_domain =
> -		GRAPHICS_VER(gt->i915) >= 11 ? GEN11_GRDOM_GUC : GEN9_GRDOM_GUC;
>   	int ret;
>   
>   	GEM_BUG_ON(!HAS_GT_UC(gt->i915));
>   
>   	intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
> -	ret = gen6_hw_domain_reset(gt, guc_domain);
> +	ret = __reset_guc(gt);
>   	intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> index 4b5dbb44afb4..f4c1106bb2a9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> @@ -9,7 +9,9 @@
>   #include <linux/types.h>
>   
>   struct intel_gsc_uc;
> +struct intel_uncore;
>   
>   int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
> +
>   #endif
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index d22ffd7a32dc..80e33ede7fac 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -928,8 +928,18 @@
>   #define DG1_GSC_HECI2_BASE	0x00259000
>   #define DG2_GSC_HECI1_BASE	0x00373000
>   #define DG2_GSC_HECI2_BASE	0x00374000
> -
> -
> +#define MTL_GSC_HECI1_BASE	0x00116000
> +#define MTL_GSC_HECI2_BASE	0x00117000
> +
> +#define HECI_H_CSR(base)	_MMIO(base + 0x4)
> +#define   HECI_H_CSR_IE		REG_BIT(0)
> +#define   HECI_H_CSR_IS		REG_BIT(1)
> +#define   HECI_H_CSR_IG		REG_BIT(2)
> +#define   HECI_H_CSR_RDY	REG_BIT(3)
> +#define   HECI_H_CSR_RST	REG_BIT(4)
> +
> +#define HECI_H_GS1(base)	_MMIO(base + 0xc4c)
> +#define   HECI_H_GS1_ER_PREP	REG_BIT(0)
>   
>   #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
>   #define   GTT_CACHE_EN_ALL	0xF0007FFF

