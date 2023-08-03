Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CEF76F461
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 23:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D009F10E054;
	Thu,  3 Aug 2023 21:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5893F10E037;
 Thu,  3 Aug 2023 21:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691096480; x=1722632480;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MA67qb7iGkk0hhbI5AvlkFahnGIfLc/LrUVqOa6qkPQ=;
 b=HuBYyi/xssypFVsyLm6qlm6ECcvs2dL5oOm1bGPUzn9eKYB3BPjwd/CL
 ApFQY/s8z6OHLGdJ8hSfjyhsxaFgV2YZg14E8OSZW3ZwO0Rj0mksP0qbV
 X0V6Ec/iXJw/qJsXCBSwARbmqUtt1mDlwQ1rTVIBoD9zKQHuOWkpiC223
 7URxFG+2rdjuzXHXQaSdW3n234WFDC43rJYlFZAQSGf5ubRHWuEIx5xFs
 sIhlAw/REAs0xgDT4J11aLYddjvkuQpmKPznQXL017i2XGH+WJXLP2poN
 h19cHsB+vbRYTuHn2IJYRXco4kSdq8EiegQodbD3Z9gzTQDrsbMZ01lIy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="433849229"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="433849229"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 14:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="903588216"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="903588216"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 03 Aug 2023 14:01:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 14:01:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 14:01:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 14:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSsvgiQ3wUknK7H2dD4jLtQMLdHYFSRBlU53ZT/oHbGpEyp0vFMeBppYn4J/8ZkrxkhMbdNtKUpBj32v6MmjfWMtjj//wPOpYPM1HHGtsRd/Suxf1qcZqHBTOH2TMgw8YVfCmUweKVVsoPvmE9o0vgOvEjbR6nZLn1vVJ6nTFpJ1VVUpb0IjtfMEsvVb88/knEk/frSIwAI7p9tpgickAAvp/pl5VlMc7UydEHJroFKFrlHaT409lpJQ4nfeDhyU13AkxwHfvZ0yV3+9Jw8O5gtuGCBmLg8XzoT4fRFUjHvrzDqpRQ6CU0Ydnx8mlYNlwC4Yud/5yGZeKLzgDAjxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzYM13XKYhwFXQQX3TZVYG1kTOTCKmhH4IH/mMAsOXU=;
 b=bPBzeiELXpVHG5CPYq2g5guDxtEn7gxtqNM0tve/zgc3tFN/nq4UUGcF+Ygdmp/MX5H7x0bDol6/yUyUQmt78NGkFW15DNzXmdSKz4U0QiItIPC6EYaKA3jOLL/3aWyRrP8aQoDnfw5Djy808WAazn8qliq/HW+57NP2/+nqAMHzuuNlkIsKeRS7gG/FNLrKCVDhPR0YXi0RDlNpWN+z6iN7+e1fDkdlrKAmHQerFD4yrA/5UGofD0H/oshSDVLzXsH1TxI+26cUToHT+RtSAANQFLgtPNkyM4nHPWUKk++yyATnEPcL9ADEG2b505cbeLn6Y/MmWykFlUhEYla0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 3 Aug
 2023 21:01:10 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 21:01:10 +0000
Message-ID: <1efa6ced-191d-ca8e-c560-76ef0ca2edf8@intel.com>
Date: Thu, 3 Aug 2023 14:01:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/1] drm/i915/pxp/mtl: intel_pxp_init_hw needs
 runtime-pm inside pm-complete
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230802190611.1639371-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230802190611.1639371-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:a03:60::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc64414-21a9-4c23-f2c9-08db9464c380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lSAksuYtG3naABSm29OZM2Up5u7xmgqtybVxW/d9y27k2/9wSoZpJGh05NS6Iw8/6Q2nU15ysjaOE1XfozOf1ua2F6cZyAi7TOXVt5WdB9bJZM7blA5pryIaeAGFUCdQYEzBZJ5fWnxccvmQuQ4A/gMefmNQiHLOWVyDi2OFlUlSqfCc+CAMMuRxk9uoOtRm5iJSHbnqUhsap2uXER4h47pjqFHsPOig2YL0Q6Ytib/qWa0BgZSh79ZUOfLc+yPGVrZAuard79eqV2IdUu7lqgP0GgIFI96YIUgaVNzS93Hfm5z4kPBDBp6AEViPvathjX9gwEsQqd0uM1I4M9QfgwHxQE7FQzcoJkNAQUkMv/T2h/BotNkCX+VOi5FspEN+e4O46VwMG6EYOq2QqlhmLJldupzBFXu2kN9n5R/t++fqR2nVDu4vspxTTdIGnlE9nUfS6UUS4vdYKMk1KfleZTJfmvK11YcXvXlDTHBsTwU8fVKY6Gyr6V5v6kei5MTAdyZPkXZTpMd+Di7zVFSVtbtm6LOluNpFAlhXbopkPh9kgLbHZKVXNXKG/k4Cb2eDvzuKDo57djA5RDGCeEYxDRNcc1BjMHerph82hIVId5uEmYrgRNKn1Irzimj8xXkhn0CVm86XZRMRfFQYZOxewQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(31686004)(6506007)(26005)(186003)(2906002)(8676002)(82960400001)(31696002)(36756003)(478600001)(6512007)(6486002)(450100002)(316002)(2616005)(38100700002)(4326008)(41300700001)(83380400001)(66476007)(66556008)(8936002)(53546011)(5660300002)(86362001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmhvK1V4czVHdG02S1o2cGNUYy8vLzBrZDJoTFpIelFMRWY4ME52N3JpbTNv?=
 =?utf-8?B?Um96UHZIWW96K2plNjBZK09tendUbkMvRUdTeFlacCsxcTRLdDkxclhLcEU5?=
 =?utf-8?B?UENkWGNQQ3ZKWExEbW1VKzZ2cm52bTNOdE41TFhQOFpvTFNhaHVXa20rYWJY?=
 =?utf-8?B?dHJDTWV3WXd3V0FiNVFCT3B3QnhTV2RnanUvTlhqYTRFTGkrcnRpeVp1eC9p?=
 =?utf-8?B?bmQ0MDRjN2M2aWZtN1dSTWN0Y1lsKy9aV1pqbkUyTEpBMkpGSDcxK3puQW9J?=
 =?utf-8?B?Ky82c2hsT3ZOYW5DL3E2ZEt5M0VGKzhuRlcxN1A0Y1FaSS9iL1BucVVhd1F5?=
 =?utf-8?B?UDAxUXlRWjZFblpIWEU5UzlQWFphcVh2QmdrUFdIWnBVcDhaOG9MRWJGSkJ5?=
 =?utf-8?B?TVBjZjZKMnJvUm9HUU93eEZ4MTgyREwwZHd2am5mSmpESjhzZGFZai9sd0RF?=
 =?utf-8?B?bUtYWWl2SnFOUm9vVzQ2Y1RQdjhrdVpTcllYYnBLUUZMbHhHcXF6V0U0T0pY?=
 =?utf-8?B?eE5UY25jTVpsVCtsQ1dQR01rWDBSSUR6cUlzOHNFbVlzdnVudTgrOUZJM0Rm?=
 =?utf-8?B?Y3ArOWluL1RML1hsV1h5S2FHRDJFcWxVQ1RTaHVpcmlIT0xGLzEwTEphWWRB?=
 =?utf-8?B?OEYwczdsSlZxOFBSZkl3dFJDQzBQVk1tanhkTTk1WlRnZDgxdEx3YUJGamx1?=
 =?utf-8?B?TTVDdE9ZWEdPSU1idWRua2pKTm03aFVjaWF1bGJDSUIxUjl2QklvS21DRWtj?=
 =?utf-8?B?SllUT29iVk1EeWRLcENFdHhKMmRTcFN5ckw1MVdUMDhLMGtEYzhuamI0em90?=
 =?utf-8?B?bkNXZllzYVRPUzlkUHoxOFNGVExEc3RHdGE3Tm9MODZnWlMvR3l6clFkRklR?=
 =?utf-8?B?Q2ZkYVFzRTNUenRzaHZUeU1vS2FacGEwRjZHY2g0ME56emswZThBT0p1dFZ3?=
 =?utf-8?B?akpxZnJRNHFnK1BocU9JMU13ZlUrWGhtR0R5cVFsMDFocEJHTE80a3dZbjJv?=
 =?utf-8?B?WjU4K2piNUZ6L3EwRDltdXlHMkRCN1BsZXk0V0JpYTNFWVZnRm92R01CRnlP?=
 =?utf-8?B?ZDRSTEUzSENCRXM5MlJCaXIyY3NGTmwwcTdCSENZL0JoeDBSK21GVDdYdkJ0?=
 =?utf-8?B?NDhiZENyYzZqYkN2UkJ3YWd4VWVQcGZER3ZnSFpibzNnYlVzT2htb0FHWGVT?=
 =?utf-8?B?V3RVeEpkdkc5T2ZwOW5ZNnhLZkVXRDNrcWN0dndPU3VRWTN4ZEpzWVgzZjFZ?=
 =?utf-8?B?ZHhWMzJVRjJQYWp5NzAyYStxcXUxZlFwalFTaE94R0FUZzFOZEdVbW01UzNl?=
 =?utf-8?B?cFhBMHpqTUZTV1RCeEtZK050UnRVMGVqMUIzMFlMaEtsVVFvUlcwSks4T3Ar?=
 =?utf-8?B?LytqWWZlMExVMHVibmZTSHpGZnFML3h3dTZBTjBNWnVkYzFLcXdCMjZDd3Qx?=
 =?utf-8?B?Z3VMR2k0dHhXQkpFbUFHOGlZZGhsS0dBWUxPWDJadnRiZnllTXhoS25lWXlY?=
 =?utf-8?B?b2U1L0pQajlMaTNKejVzMlp2dWI0ckt5WmZSWVVCTUJiV0dYRlFiK1o3QlRz?=
 =?utf-8?B?NEZEbEtMNEZQTVpkZmdBU2xPd013aXNISWlzOCtjVnl5L1FFRUJzODRTMlpu?=
 =?utf-8?B?SnlTcGxVREUxdGYwU0xtWTd1Y1pzQXZDWW1yeVY0L0ZQYWVETnZ3RjhlMnJT?=
 =?utf-8?B?cTZ2c280RW5SaUFZZFBaR3RCTEtaM082amUxTEF2ZDFWZFhyWFdmazM2N1Q4?=
 =?utf-8?B?SDNGdURFSllIQUNzcTRxZ3pSTXR0c2RrWEZqRzFaaHRjbjAvNnBOL3lqcVhU?=
 =?utf-8?B?c1k3YWU5b2g2dkVLck9SVHlxM2pUV2ZFN2RhenBQZzE1OFdrTG5ZSzBZdHl1?=
 =?utf-8?B?UDNWQ2owTHJ0OGFrMXhCcGhRNjB6cDFPMHVucjU3ZXp6K25velVlZkRzV3pS?=
 =?utf-8?B?ekFzY0VjK2tnOHFndU50d25XMTIwRU5nZ1hERGp0VWUzMStqMjg0TkN6eUt1?=
 =?utf-8?B?UjJWQWU0VzFOajFVWHlXOUw5b3U2eHlEdStkZUR0eUlNa1pEdCtQVVRoMWln?=
 =?utf-8?B?S1FuRXRycTZhVmp1MENRNnJYNVRzbGNUZkdvK3MvMTRZUEFFZWs5em14cXBI?=
 =?utf-8?B?ei9Pa1hKK2EyY3M3T1A5TW92VG50RHBtNFZuSTJZb3Yrazd5d3FZd3ZZV3pp?=
 =?utf-8?Q?UFvBj6jhqU90r+9wbiKvBjU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc64414-21a9-4c23-f2c9-08db9464c380
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 21:01:10.2062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SN1zUltCmwhF6hp9MKbZ4lOsWBf1ddHldwmuIRblgMZuENNjlufCoZbMTZ/mR2hDMgCIT+YokMvH8RINfe/mfILswHcd6rDKkbb+B5+oWks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
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



On 8/2/2023 12:06 PM, Alan Previn wrote:
> In the case of failed suspend flow or cases where the kernel does not go
> into full suspend but goes from suspend_prepare back to resume_complete,
> we get called for a pm_complete but without runtime_pm guaranteed.
>
> Thus, ensure we take the runtime_pm when calling intel_pxp_init_hw
> from within intel_pxp_resume_complete.
>
> v2: resume_complete and runtime_resume should abstract a common
>      helper with different wakeref requirements. (Daniele)
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>



CI is showing a decent hit to the passrate on DG2, but it looks 
unrelated to me. Maybe trigger a re-run to be safe?
Once it's confirmed that the failures are unrelated, this is:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c | 18 +++++++++++++++++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.h |  5 +++--
>   2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index 1a04067f61fc..6dfd24918953 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -34,8 +34,10 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
>   	}
>   }
>   
> -void intel_pxp_resume_complete(struct intel_pxp *pxp)
> +static void _pxp_resume(struct intel_pxp *pxp, bool take_wakeref)
>   {
> +	intel_wakeref_t wakeref;
> +
>   	if (!intel_pxp_is_enabled(pxp))
>   		return;
>   
> @@ -48,7 +50,21 @@ void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   	if (!HAS_ENGINE(pxp->ctrl_gt, GSC0) && !pxp->pxp_component)
>   		return;
>   
> +	if (take_wakeref)
> +		wakeref = intel_runtime_pm_get(&pxp->ctrl_gt->i915->runtime_pm);
>   	intel_pxp_init_hw(pxp);
> +	if (take_wakeref)
> +		intel_runtime_pm_put(&pxp->ctrl_gt->i915->runtime_pm, wakeref);
> +}
> +
> +void intel_pxp_resume_complete(struct intel_pxp *pxp)
> +{
> +	_pxp_resume(pxp, true);
> +}
> +
> +void intel_pxp_runtime_resume(struct intel_pxp *pxp)
> +{
> +	_pxp_resume(pxp, false);
>   }
>   
>   void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> index 06b46f535b42..8695889b8380 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> @@ -13,6 +13,7 @@ void intel_pxp_suspend_prepare(struct intel_pxp *pxp);
>   void intel_pxp_suspend(struct intel_pxp *pxp);
>   void intel_pxp_resume_complete(struct intel_pxp *pxp);
>   void intel_pxp_runtime_suspend(struct intel_pxp *pxp);
> +void intel_pxp_runtime_resume(struct intel_pxp *pxp);
>   #else
>   static inline void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
>   {
> @@ -29,9 +30,9 @@ static inline void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   static inline void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
>   {
>   }
> -#endif
> +
>   static inline void intel_pxp_runtime_resume(struct intel_pxp *pxp)
>   {
> -	intel_pxp_resume_complete(pxp);
>   }
> +#endif
>   #endif /* __INTEL_PXP_PM_H__ */
>
> base-commit: d7a437067a2146e1035a5609dae08b9595773a16

