Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8348F62C739
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 19:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B84610E436;
	Wed, 16 Nov 2022 18:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C674210E432;
 Wed, 16 Nov 2022 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668621964; x=1700157964;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kXtwJ3LRHfY6BOVPHEnJKo5kHygM8kqMBb7on+Wmz0M=;
 b=Z3LXHUPfNjSUhCdcUotCPfNACWfpkKbscD9kzLJBs2domnSnaDIzkhsW
 j0xNkglm39ZeqEi2LSDUU8qNoRDKug4XNKoH4P4ZoyxiQhgqYyc0sXitN
 uIS/aFLdbyn1rVsZj/Tfv7M+qsjgXgRHkVKmPfF4YYaxN0b4v1TRhmMe5
 +dgtgGK+lTyjP7KT8zt4ox3r8ToukTsNurqnwFmnrXZLs+2vxeV/F++v3
 w7Bigsp9lMsCUr48AJpFd/gbbOWteWjm3fA3hGtJy7o0+kI6yLhyG+gHJ
 jNAZZS2vHYtloZkEGeFBFHSusAIbje/XYL/F+X3E4mYFTfyS3jezRL4Eb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="314435295"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="314435295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 10:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="764423896"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="764423896"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2022 10:06:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 10:06:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 10:06:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 10:06:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 10:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyVeW2n9Z+528gvafsLnu4GqaCoO0ow3m+2C+kxRPpN+kPOM/4iqBkKYMD9tXH0WoHT0ZhCWpUEaMF9vBh1Oqp8XY36vzDGA+N06Zx+GIR2gxGu7KyAsDHY6Lp2rYSEMiUAUS8or+mCGjS1wDK+AUwDErg0KGJ4k4RTCPMebMnsRDtArySq1ti1OkS6CKNMgJKu9DMyuUUj/cMT7Cz6ZQD8/61x2t54PDsXNSloRjzmyc7aPM6loE/L7JmsnuZ5QyqW3CUgG5Rf6HSGnse9RnMmEVuVshWEl7rZ2rAFFOBl2xNGAvwMoHkaAJOAYohVMZjHFSijV7BT82EjZxkmw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNH+mylfrUl3layjt7OnJcTLANzownS5QX5S476HIO4=;
 b=MF1LxD54dofc8PDAwVAHiYvHie5/7b+A6j87vKcFP8RKKpJUxAkt5zmDJ/CNHLfdMjUW+er+BhCHWVLRYDVkCx6XY87MYOlE6TF16ux2GugKI3MQFGc/EiGRkMojMdbG4hJ47+w5Tb1DbIL1MZDzCaHzIfxcAFnqdvkwf0yas6y3EYIeqWNhFcM/18ozxjYNSKSjRENXmDgvAbAquzm7+61Cw4TD5c5zwGDNl+cMlP2h8IJQwaO74494dwvKkoHfO60RI6eu7yIEb7OPeTw8DhgbAZrHd6E8n48Yzy6q1ksnElfdzkAni+/Rp7nwcCiY5BMoPrlOUbJNzuNogvTkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 18:05:47 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f8e2:ab0:4fc2:9df3]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f8e2:ab0:4fc2:9df3%5]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 18:05:47 +0000
Message-ID: <c96e9e42-a7e7-f896-5d25-93dd338e15be@intel.com>
Date: Wed, 16 Nov 2022 10:05:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] drm/i915/mtl: Enable Idle Messaging for GSC CS
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20221115134440.3669021-1-badal.nilawar@intel.com>
 <20221115134440.3669021-2-badal.nilawar@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20221115134440.3669021-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::32) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: bad0bb91-50ef-493e-5857-08dac7fd302a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3vtjSgFYiz0dURtNxDkGNxDYnr6RKplVcbfvDtLe13/RQA4oJHBPk3+wBGsWdGSbLepdzmN7JO2rMTsERv7Mg23kGP1VO2nsD+aizBr3zShz1OeI2ibUVteqWV1KuxB6AIIRAYeOE3QNGAO1Ifist4ePowCJsZ8rira8++uzifKSqkzINwgl+ZKiUkhwI9vnTXEhYR3OYYj2bNDtbMfrvkG8pz6322aRZpRGv9BPiaEO2j7bB50LxGWmfT5epCbni7Eqgb5SWY6S1V9NUYN9QyqKDjk9QLT/CT1mgZIvUBvbG+RrS2QTs0sMyh/cHVz61MbtncboPKHJbl21wBVPvAelzLSQ6TMQUiDeZ4U6cAp3f7P05fWMaZT730QNwPJElqROz+vOz/PNTq9IvZB0A8X66TdYypQ9qzQP/CBB0RtvvhGZq2/70hoAKb3JZe/u9JzHdKHt20lxQ1BY4yxbRcSX04lKARdo2mNtmD2xbr5vCwNuy3UOAH+Ra+7EqOykeDMku/Y5DTuaJ2H/Fbo1U2cvSC4ZdsDtjdw7rbLSqrAWYlAULzwZGIpoulanapZq7s7NfrHVeFLiTp+67OXCBAVr2BpNAqNwy754GQrwNYQH7QT/q7WDyNeCIOoM/CMALmOUSK0LX3ge4MM0HvJwSyBYFnSaPfxGmX8HHoYTSS53MTihzhryf2/YvFVDjXuH61eCfW+Kr1D1mYFUu5ykLATe+B+1WAfZFlxkgVgCGMzQzxs9STDjI1ZjtnJ2Hx6F3Ppm3YHtia92iCmHrauylCk9d0+a9oUsKoeuZEEmhKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(8676002)(83380400001)(186003)(2616005)(4326008)(66946007)(66476007)(450100002)(2906002)(36756003)(6486002)(66556008)(6512007)(26005)(8936002)(38100700002)(316002)(53546011)(5660300002)(82960400001)(6506007)(86362001)(31686004)(41300700001)(31696002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aS9tNWs3eW9obWJSNnQwUXlzYml0M1hidXNiTlN6SXZ2aVppTnQ3dUVwRk40?=
 =?utf-8?B?MjR6WUdQS3czSTRhV3pVd0tsd25jakFYblJnOW8reU11UjVlcURuWnhrL29D?=
 =?utf-8?B?MlVNQzhEL05QdldoSFRZWUR3eDhURytiWUxuWk9DMUVTVVdCT0czYWZqMW54?=
 =?utf-8?B?Mm1VblNmRjlDYUNTSVJQTXNRWkVYZDVydXNUKzF5Y0RuM1hzaFljSWhuM0xJ?=
 =?utf-8?B?NFd2OVY1ckRNQStXcTcrYWNMcnNYS0RQK0dEOHVWLzJWTWhNZ2JUYWxnN2k5?=
 =?utf-8?B?aWZIRGJkVGh6NGFmNWJnRjVJRGE0N29nSmk1Z1ZLWmN0dEE1N1c5dndsZjhH?=
 =?utf-8?B?aVowTUlVcVlvOE1Xa2xXa2lnUVA3SkhyMWVrdnlCNjhvaVFpYXVIZFNEZWJ2?=
 =?utf-8?B?cVBKK1lkMGN2VHdmNHRIQS8xUXJJZE1BWmRSUHBhOFNIU0NPY3hscXVzWUhX?=
 =?utf-8?B?bUVnbnA1SU5wamZYNEdvcHJVajZEZzZrcGlhUkxVSGZYd2tsem1rbHVLSFVs?=
 =?utf-8?B?RWZQTllMTmlVK09Pa2cwYVkyNFNYKy8reTJLZnlxaDlwUHRCNkVpQkpiaVNn?=
 =?utf-8?B?dVlSa253eDVtbSs3ZDZsSjNyRytRbUwxUDBVTWJaTzcvTVJNZFAvdkQ3TFI5?=
 =?utf-8?B?cGx6WVM4aWRwNGphdUNobEkycFVLaVVoTU1xRldaUG80Q0ROaE9nVXlaNnk3?=
 =?utf-8?B?NDdNYlVtc2drQStkQysvVUhTYVBnVVgvT0h4Qjc2SkNqcVNMa3Mra1UwcElW?=
 =?utf-8?B?OXBiZndiMlhCTWpqdzVTeXY0QW51S3JLMkUzOU1mdGUrd2JYVWZsTE91NVlu?=
 =?utf-8?B?bisrK2NOYzFiY2JKRDRqK2pxQlBZQ2ZOREk3NHVrczJkMTcyQm5JWlYyVFJB?=
 =?utf-8?B?K1U0cWRmMHVsbC9WQzBKVW5POTR4REJUY2lUcnV3Y0N0Zzd3ek9JeWhmZzRD?=
 =?utf-8?B?eWhYZDVOWGhRdEtpV3BUNlMyblo3a0NYZlRMTEp4SitlSktUREpnbXdPZWJs?=
 =?utf-8?B?bUJ2WEpqVDRZcWErSTFwQXNYRTgrckJpckFQZWpmYmo0Nk1qVDBDR1A3eC92?=
 =?utf-8?B?VloyMi9hV0swUHdaTmN0emZjR1JFL2YyRWVpbThERmhiSmErWDF0NmtqZllM?=
 =?utf-8?B?a2pDZTdQMVFlK3FYL3F1S0NvNjErSU44OHhGREpXdExDUkljZXdjWEE5c1Rl?=
 =?utf-8?B?K1dEYU9oYy95SmtGR3Erc3NEd0MzNlBWcmkvMGNQS0dlbnlmM3NnOXpEY3ow?=
 =?utf-8?B?aUJrMUNYVW5IVWU0S0xnZmRpdjYxWS9YV1cxWC9wcjd1dGxKRkgxM1MyaC9H?=
 =?utf-8?B?UlIraXAyRkdQV1ZjVXRpc2RxMjEwaGp0Z2M4MHZqSjdRK2hqUVJaL0l3Wmow?=
 =?utf-8?B?dWFTSFlxVXByUGFzK3lHNDRFYkhRcTF4Mmg1YW1YMjJsVUtsT1FRSU05Rzkr?=
 =?utf-8?B?aFhJZnRobVVaWHZzSTdjQTIyQ016SGhTL2g4RHhKdmVrSWR6azBOM1UxZVhJ?=
 =?utf-8?B?RHpDYUpxTStxV1lZaS9SS0FaQWRxSHAwMUU2cERDYTJ4MHdEZHl3cDlCUzBz?=
 =?utf-8?B?NXVSTXA4aVdmN3J1amxNaFNmVG8ySU9kYlhQejVyY253VDdlK2gzdFVTL1hp?=
 =?utf-8?B?ZG9CVnJNMFJqWW90a012RWE4eGtOenYvRnNEMnpDVGFMTElrQ2FSb3FuZUtk?=
 =?utf-8?B?YUdPczZ3NlBpUnVOQ3RseHptUjRQK2NEOVAzL3pzR1N4K1owNUhDcDlWbnNR?=
 =?utf-8?B?ZWhXQ1Q1ZnVLckNjblFiR0l3a2ZQTWkxb2pURkxIWE1VZHV2SzJlZWoyeEdK?=
 =?utf-8?B?ZU1aS0Z1VUhuRDFRT3ZtYW1JYTdWaGpOL1lBc0tUeE1lUUVIb1YrOWs2OUV4?=
 =?utf-8?B?OGV3dGRDdG0wMCs4RXlzamJKWUpFV2VsazMyL1o4WmRQQXdwaWczR2ZmelVW?=
 =?utf-8?B?b0FBTVlUSmVZWHIzZ1UwMHZkTFByRkRuZm03SXBzZVV3emQ5aTE0M3VvTTU2?=
 =?utf-8?B?Vytia3FVN3V4UFBVVTVreEp0NnhCMnpORzFock9aazZ6TjNpODZNeE42TG1n?=
 =?utf-8?B?S1E3TUFjR2YySkw3bHE2M1phV01oYlFub3JCVXpkSGE0NlRYeWJmYW82ejRQ?=
 =?utf-8?B?YVpsaDBMWDJhaTZkLytGOTZTbTdOL24zME1IaHhDWjVKYVZKZVBLbWRIdEYv?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bad0bb91-50ef-493e-5857-08dac7fd302a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 18:05:47.6487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4keXe3YIPA/dCrPF4TnWwl9LYQ9p/XguWY8Rr6V1nfVgxD05W9InAb6MKkQckWiOGHbVHKDiAW+mj3pg+1whElv1PJwIujq4PgaY39+8IXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
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
Cc: radhakrishna.sripada@intel.com, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 daniele.ceraolospurio@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/15/2022 5:44 AM, Badal Nilawar wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> By defaut idle mesaging is disabled for GSC CS so to unblock RC6
> entry on media tile idle messaging need to be enabled.
>
> v2:
>   - Fix review comments (Vinay)
>   - Set GSC idle hysterisis to 5 us (Badal)
>
> Bspec: 71496
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
>   2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index b0a4a2dbe3ee..5522885b2db0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -15,6 +15,22 @@
>   #include "intel_rc6.h"
>   #include "intel_ring.h"
>   #include "shmem_utils.h"
> +#include "intel_gt_regs.h"
> +
> +static void intel_gsc_idle_msg_enable(struct intel_engine_cs *engine)
> +{
> +	struct drm_i915_private *i915 = engine->i915;
> +
> +	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
> +		intel_uncore_write(engine->gt->uncore,
> +				   RC_PSMI_CTRL_GSCCS,
> +				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
> +		/* 5 us hysterisis */
> +		intel_uncore_write(engine->gt->uncore,
> +				   PWRCTX_MAXCNT_GSCCS,
> +				   0xA);
> +	}
> +}
>   
>   static void dbg_poison_ce(struct intel_context *ce)
>   {
> @@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
>   
>   	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
>   	intel_engine_init_heartbeat(engine);
> +
> +	intel_gsc_idle_msg_enable(engine);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 07031e03f80c..20472eb15364 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -913,6 +913,10 @@
>   #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
>   #define  MSG_IDLE_FW_SHIFT	9
>   
> +#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)

Alignment still seems off? Other than that,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +#define	  IDLE_MSG_DISABLE	BIT(0)
> +#define PWRCTX_MAXCNT_GSCCS	_MMIO(0x11a054)
> +
>   #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
>   #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
>   
