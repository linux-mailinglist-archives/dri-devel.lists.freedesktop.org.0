Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A2672D41
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 01:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D4510E881;
	Thu, 19 Jan 2023 00:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C638410E87B;
 Thu, 19 Jan 2023 00:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674086974; x=1705622974;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=872zlnEPSdzpRNG3aIq4Fu7Yr0kTX0Snnc4MtmPQ2r4=;
 b=Q3a1RerGquCFmPlNTAzzSkdP+DOTDZItflm47jCyd8dJ3YFblphS9lj8
 rTE8uRqWxAB4+O9cxGglWEXG8ot9HT9BVVKZYh5WIhRDmLJWkmJrcqC+o
 /IiNJuSAOJl8WoWwZhYpIeQgPGqdC4sF2s0Il5XjKhBJqy1qsTU9UvbMa
 9oyOhV4At5sBkL+q1HRZhIFPoniH2dgl9DG4niYSdw9hfnj/dkq1EL1d4
 K2KUAKIPGEyJHh0RFl/Ix9HaYT5zSNPbL3FmUUFoc8cCw6S22NAttSplh
 J680nTnLgrbZqj7jDDqy5jj0yH5QGuY26NBeu/u/eBFwpghBFufamKH/S Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="387492353"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="387492353"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 16:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692217201"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="692217201"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 18 Jan 2023 16:09:33 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 16:09:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 16:09:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 16:09:33 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 16:09:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnek4klnkKrfnjapoNV8EmJW4kkmpuLL43pCKDgNhKvtNpWkjwcZtuaULQSuGS14VQvluYXuAm2EI25KPTgus4vcXadu+I8ks6nuE291idDZw2gE4tw/hHWWl/80JqU+FH1oc/XyXV+dJQVu+B5sMAI3bdUzK4nS3VHfjSlOKaxY/SIXl8MHPrXSLo27jJVHTRLbtZlxps0C9hlg2n3LQAEQ6KBdkDU320h0g1s0M62Z3GzQLM9RVIUwLVtPL0gBPP4J8pysUIvB/r29IM1eZZTLhAKAzdorvNjargb/3W5Yv/G5ivC2S1F1ZgDT7l7UwqFJRPTiKhnTGYTNK/+raQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyMLLjsl9IE+Pp/byezlhrJ+5dDNum5V2muZyxCtN68=;
 b=eJ0EG1adM9Q1EAdYd6AjG2DRDICZ1n8pHq3VTy4NQtj7dFBG9Rh6eVM4azD/gh2K+cJe/GGdZ/MVcI7dt1SKv+KQIGyHIKgFOkmN9xKYIaTcH6uzJqRgkmVf5Dmfk5Zs9zi3dXJLuIBQBGFY0U/PojRgoCrZiLp5Dn3bTMB/eiP0DdMLEVnwWlAMIbsMv+9aJLd5Hj29f0qLJuhE7bzfNoyIFexoGhikh4OV/TuHC0cH8l70VSAaytdnU7LLZv35WPp53TqK0UuPytGriVUfY5zCFi5Nu5E0VfZc2uiVaEQEwyxvYHZnF1nS1lCUvSAcLL+Ok7Vnl4AJEjBtomDc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 00:09:31 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 00:09:31 +0000
Message-ID: <1572e763-b59d-cc48-e1d4-831e77a07bf0@intel.com>
Date: Wed, 18 Jan 2023 16:09:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/9] drm/i915/pxp: Add MTL hw-plumbing enabling for KCR
 operation
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-4-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230111214226.907536-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: a69bbe1d-e957-45e0-ee78-08daf9b16fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySKwHMbhMdeFphJB20rBYgMenVJFzsQe1TupCDDl6m3r+63pzdxyVz8qlxnUZy1o4JUMle1KFYmeHRZMcXfeAUxZZ4s+7C0jlKP2TsdRQASerHMqwxkK+gsW6NXg7dp9IeMYzzDRGTtA0OUoiD7RboqcJ9S6BmP4pG285jsjaCzFNi2bMmhWXYkLPEou2sb1MFV9g9VnWiJ23LqYMfpTzxhlqyz/STt9LBTJzEjskPq3+jA62x9Mbksui8A7PaKTtKmFRVlDsZxELNni+6OujrHndAKZ8W3hstggbt757hOcke6sG7YKi30tMYnO4WchkCDt13hon6FHFrXg9EPbPGUdNeCfLS1Yz8Uv9KM3sjPw+nzn/6D2IlB6cUWaAd8lSNKS5NiHzuINCKGIRPf1H/AW5HLnqiPEa1ldl8/E6IP0Yrpq2rhXOHKr10HajFaI/ScDrftjDAt0Efyg5M9yIsG0tv/YMlZ2qCDVxVg09ynkj3eRIpId7l3m2fKxv41eKzlKqZm+5eDoEViJM+Bxjp2TXxJ6BrbUFcaBE2Oh5wK5hd30QtQ/LRZMXyVLJ8x+2Xh7D5uzCA1Sy3PU9CBsBysjWRc7GAokm43b2oDEMr2dH2Xrokd0itSe9Rssfg458M+NgTpFO7yZ/4okf32CgGIVrUISDReBnJlC+fA7+ttmjMjXmAb2NwxUbWXFTq0P+XJD5GoqRYRyIz//izx3Cbj8dw/798ixkms90e2hpIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(31686004)(86362001)(66476007)(2906002)(66556008)(66946007)(5660300002)(8936002)(82960400001)(31696002)(38100700002)(316002)(6666004)(53546011)(6486002)(6506007)(478600001)(36756003)(8676002)(4326008)(41300700001)(186003)(6512007)(83380400001)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly8zMlFOQXUrMTUxUWwrbzB1NDV3QUxZL3ZxL3VNL3JseEQ1K1BJdGEyUkRv?=
 =?utf-8?B?d3JaRE8xT0Q4U3l6d0FncUlhZ2EzdDlpSmF4NjdyR09wVkpQRmMvc1ZSR043?=
 =?utf-8?B?SU8ydWlXZXl0T0M2bXZJZFYwVkhwclBPY2hNVVAzUkdaTURxMGhHRjVPd3Nz?=
 =?utf-8?B?OEVxMjRrb2pFYk10TUZVWmxCNWtXVlFqY3Fvem0xWllpK1ROekxiVkxIZ2JZ?=
 =?utf-8?B?RVRHQldRYkRWcWtPNHJFSnhpdzV6NGMzWmtCck1IZVVjR3ZmWWY2Zi8wMENa?=
 =?utf-8?B?QW1zVXJEdXpMS2pvSXlxOE1HQkVDV1BEUFQxOWJPcEJISnVSdFAzL2UzNUEx?=
 =?utf-8?B?WG43VituZXdBdVNkUE5ZL1V0elJNbFJCUFIvQzJxMUJIQmNiVGt5Rjl0bklw?=
 =?utf-8?B?ZFF4ZklLZDlORjduK1p5Qmd3OHdvSGUrYjdQV01wV2dOLzlEVXhpUjROR3RL?=
 =?utf-8?B?dUxnTktRRnluU3Q4M2txdnQ0bThoTURiWFBJT0VUNTY2WjluZWpaSjQyNEcr?=
 =?utf-8?B?dHpqS2d1Vk9BQUZqdDlVa3pnK3lOSGtxRkJ3SVBOZWN3SFdBMm80QlBYM0Np?=
 =?utf-8?B?cVJhSStMS1F0NjhXTlNzWVZMMGp4Znphd2JJRDRSYWN4d3NlZXN3cmFFd3I2?=
 =?utf-8?B?S2NJSzNqWFRmWXk1Z1IyS09HNGJNZFduTm9uOUZBMlVyQVc0UkIyR25zNUZ5?=
 =?utf-8?B?N01qc1dSNStrSnpHN1RkYmNaTkhMeHNERGk5UGY4M3IzL1NHYnJybWRsT0x0?=
 =?utf-8?B?bTEraTFWc2FqQUxqN2ZZZEY4RzllY0t2ZzFOUVBVelk5VnR2TjU4dkowbXVT?=
 =?utf-8?B?M2ZrWlFQK0JsaW4wNWJWMHI0NFJwS3V5NGJLWmh1SE9wcUZoSGd2RzlWT3hQ?=
 =?utf-8?B?MDd2bENUZElMOGVuQUU1ZTdOQXFlYWJPYVNmYXp3YnMyTlZmeWdOK05xeFpJ?=
 =?utf-8?B?V0xZK1ZYSCt5THpKaVE0aTRTQ0FZWEF3aWtoT085d1h5UHUvWGNxM2pXVVlx?=
 =?utf-8?B?WmdOQXdGNEdrSDRza3hhZUlhOUFjNWFJSm01Y0pMWHk5bGRxZG1MMXMwVWVH?=
 =?utf-8?B?OG0za2xVU3ZhZjVPMFhaLzdqeUVVTGhnQ0FqVzgxR2NvTEg3Vlh1QUZQcDhD?=
 =?utf-8?B?eWFsUlVVTDkwdHU4QlZ6VnA0UEphaXJpSS8yK1AvS0FyMUNLSGY4VzVQTDlh?=
 =?utf-8?B?TGlCRXRybzZKTER5UTRYbjRZeGhzR1RBdzVQQitMSFNvL3JRNnpsY2l3WkZT?=
 =?utf-8?B?RUFTc0U1bzRUdWF3T09jMytOM29YcTI2STRGQ2R6UTVoWkFoVXZHZUN1SUtj?=
 =?utf-8?B?Z3BITnJJYU56VU5ZVmMwZ2krWEJMdFYycFdaNERrb3hjQlBnQ1FMY0tQd1Zy?=
 =?utf-8?B?U0ZieVQwZWNMRnhZSE5OcmhwbVY2R25HOVJ2UWQ5a09lS3NydEdGV1pZOGpY?=
 =?utf-8?B?cnVXVHl6eUY5Q2NENnBJYUhJUjRMQjV3aUF4ckNTc2R5K2k5bGRUVFQzc1Zt?=
 =?utf-8?B?LzdITUJvQ2lRV0w5Q09SUng2VUlON2lZSThJbTg1dGw1aHRUSGYxUUZFZ3hC?=
 =?utf-8?B?VGVNNXRGdG04SlBrK3RqOU84UEJIWGdQQVY2RFZDK1B1YkxicHdYV3lNRUdZ?=
 =?utf-8?B?TUs0elJyR1hUMzJCUTFSVlQrVGlLS3JQNmNqNWpGWjlkeTRJYXNmdG52SkEv?=
 =?utf-8?B?RitFV1BPdll5aTlGb2dFbVdveTM1MWNWZ25xSEEwRURPTGhTZkg3cDVqS0wz?=
 =?utf-8?B?Rnl6YkRoR2doRW5VRkh1OVNoeHJnTEpwZlAreE5UN25GZllMdjRBbkNMbXpm?=
 =?utf-8?B?VnNCbGtaYlRuRE1XNkRGZkdRY0VHZUQzbzhDTjU2aDFER3JoTm0rU2ZWUnBL?=
 =?utf-8?B?UUlMVEI0d1BERnZIbnFJSW9IelVDSUJGKzRWeTIyZlZCdWl6SWNCbnNtWUVj?=
 =?utf-8?B?ZmpaTzdSSEM1bjRMTjRRa1NsM1E5blpiYkZkcElVOTVEeFltaHRmS3lNNWdZ?=
 =?utf-8?B?ZGtkV0kzZmJhNExWd3ZJZ1hBd3pKbDRISklIMTlFMkNBdmRGRU53MWgyMnU5?=
 =?utf-8?B?SFIxZjBHM2pKWWh6ZFYxOUVTTVIyMEg3dUppOWZQc0JiTFY2R242elRrL3A0?=
 =?utf-8?B?SE1nMU1lOVBGUmVzaWJUUXBpdlRTTlhnVjlwblpBeWQvaE02eUM3MCtvSUhD?=
 =?utf-8?Q?H1XsynLlogSM+Hr1SMCNPUw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a69bbe1d-e957-45e0-ee78-08daf9b16fcd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 00:09:30.8529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Xv4MMjPAaP/IorhgUW4POXKGQqclEpFmcdh1eKNmOyrJF/ICSWWvR1RjST2RgXFekS7HjmO5CqqeScAQBYfPIpjW7exF8L5H/l0oipwqx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 1:42 PM, Alan Previn wrote:
> Add MTL hw-plumbing enabling for KCR operation under PXP
> which includes:
>
> 1. Updating 'pick-gt' to get the media tile for
>     KCR interrupt handling
> 2. Adding MTL's KCR registers for PXP operation
>     (init, status-checking, etc.).
>
> While doing #2, lets create a separate registers header file for PXP
> to be consistent with other i915 global subsystems.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c       |  3 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp.c         | 35 ++++++++++++--------
>   drivers/gpu/drm/i915/pxp/intel_pxp_regs.h    | 26 +++++++++++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 29 +++++++++++-----
>   4 files changed, 70 insertions(+), 23 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 8fac2660e16b..957fa11373fc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -100,7 +100,8 @@ static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
>   	case VIDEO_ENHANCEMENT_CLASS:
>   		return media_gt;
>   	case OTHER_CLASS:
> -		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
> +		if ((instance == OTHER_GSC_INSTANCE || instance == OTHER_KCR_INSTANCE) &&
> +		    HAS_ENGINE(media_gt, GSC0))
>   			return media_gt;
>   		fallthrough;
>   	default:
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index be52bf92e847..809b49f59594 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -14,6 +14,7 @@
>   #include "intel_pxp.h"
>   #include "intel_pxp_gsccs.h"
>   #include "intel_pxp_irq.h"
> +#include "intel_pxp_regs.h"
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
> @@ -61,21 +62,30 @@ bool intel_pxp_is_active(const struct intel_pxp *pxp)
>   	return IS_ENABLED(CONFIG_DRM_I915_PXP) && pxp && pxp->arb_is_valid;
>   }
>   
> -/* KCR register definitions */
> -#define KCR_INIT _MMIO(0x320f0)
> -/* Setting KCR Init bit is required after system boot */
> -#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
> +static i915_reg_t get_kcr_reg(const struct intel_pxp *pxp)
> +{
> +	if (pxp->gsccs_priv)

IMO here a better check would be:

if (pxp->ctrl_gt->type == GT_MEDIA)

It's equivalent, but IMO from a readability perspective it highlights 
the fact that this is a change due to us moving to the media GT model 
and has nothing to do with the GSC CS itself.

> +		return MTL_KCR_INIT;
> +	return GEN12_KCR_INIT;
> +}
>   
> -static void kcr_pxp_enable(struct intel_gt *gt)
> +static void kcr_pxp_set_status(const struct intel_pxp *pxp, bool enable)
>   {
> -	intel_uncore_write(gt->uncore, KCR_INIT,
> -			   _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
> +	i915_reg_t reg = get_kcr_reg(pxp);
> +	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
> +		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
> +
> +	intel_uncore_write(pxp->ctrl_gt->uncore, reg, val);
>   }
>   
> -static void kcr_pxp_disable(struct intel_gt *gt)
> +static void kcr_pxp_enable(const struct intel_pxp *pxp)
>   {
> -	intel_uncore_write(gt->uncore, KCR_INIT,
> -			   _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
> +	kcr_pxp_set_status(pxp, true);
> +}
> +
> +static void kcr_pxp_disable(const struct intel_pxp *pxp)
> +{
> +	kcr_pxp_set_status(pxp, false);
>   }
>   
>   static int create_vcs_context(struct intel_pxp *pxp)
> @@ -323,14 +333,13 @@ int intel_pxp_start(struct intel_pxp *pxp)
>   
>   void intel_pxp_init_hw(struct intel_pxp *pxp)
>   {
> -	kcr_pxp_enable(pxp->ctrl_gt);
> +	kcr_pxp_enable(pxp);
>   	intel_pxp_irq_enable(pxp);
>   }
>   
>   void intel_pxp_fini_hw(struct intel_pxp *pxp)
>   {
> -	kcr_pxp_disable(pxp->ctrl_gt);
> -
> +	kcr_pxp_disable(pxp);
>   	intel_pxp_irq_disable(pxp);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
> new file mode 100644
> index 000000000000..dd4131903d4e
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2023, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_REGS_H__
> +#define __INTEL_PXP_REGS_H__
> +
> +#include "i915_reg_defs.h"
> +
> +/* KCR enable/disable control */
> +#define GEN12_KCR_INIT _MMIO(0x320f0)
> +#define MTL_KCR_INIT _MMIO(0x3860f0)
> +
> +/* Setting KCR Init bit is required after system boot */
> +#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
> +
> +/* KCR hwdrm session in play status 0-31 */
> +#define GEN12_KCR_SIP _MMIO(0x32260)
> +#define MTL_KCR_SIP _MMIO(0x386260)
> +
> +/* PXP global terminate register for session termination */
> +#define GEN12_KCR_GLOBAL_TERMINATE _MMIO(0x320f8)
> +#define MTL_KCR_GLOBAL_TERMINATE _MMIO(0x3860f8)

Non blocking suggestion:
it looks like all KCR regs are at the same relative offsets, just from a 
different base (which makes, sense, because the HW just got moved to the 
media tile as-is). So we could possibly have something like what we do 
for the engines:

#define GEN12_KCR_BASE 0x32000
#define MTL_KCR_BASE 0x386000

#define KCR_INIT(base) _MMIO(base + 0xf0)
#define KCR_GLOBAL_TERMINATE(base) _MMIO(base + 0xf8)
#define KCR_SIP(base) _MMIO(base + 0x260)

Then if we store the correct base in the pxp structure we can just pass 
it in the define when we need to access a register and remove the if 
conditions at each access.

Daniele

> +
> +#endif /* __INTEL_PXP_REGS_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 080aa2209c5b..7bb06e67b155 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -11,23 +11,25 @@
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
> +#include "intel_pxp_regs.h"
>   
>   #define ARB_SESSION I915_PROTECTED_CONTENT_DEFAULT_SESSION /* shorter define */
>   
> -#define GEN12_KCR_SIP _MMIO(0x32260) /* KCR hwdrm session in play 0-31 */
> -
> -/* PXP global terminate register for session termination */
> -#define PXP_GLOBAL_TERMINATE _MMIO(0x320f8)
> -
>   static bool intel_pxp_session_is_in_play(struct intel_pxp *pxp, u32 id)
>   {
>   	struct intel_uncore *uncore = pxp->ctrl_gt->uncore;
>   	intel_wakeref_t wakeref;
> +	i915_reg_t reg;
>   	u32 sip = 0;
>   
>   	/* if we're suspended the session is considered off */
> -	with_intel_runtime_pm_if_in_use(uncore->rpm, wakeref)
> -		sip = intel_uncore_read(uncore, GEN12_KCR_SIP);
> +	with_intel_runtime_pm_if_in_use(uncore->rpm, wakeref) {
> +		if (pxp->gsccs_priv)
> +			reg = MTL_KCR_SIP;
> +		else
> +			reg = GEN12_KCR_SIP;
> +		sip = intel_uncore_read(uncore, reg);
> +	}
>   
>   	return sip & BIT(id);
>   }
> @@ -37,6 +39,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
>   	struct intel_uncore *uncore = pxp->ctrl_gt->uncore;
>   	intel_wakeref_t wakeref;
>   	u32 mask = BIT(id);
> +	i915_reg_t reg;
>   	int ret;
>   
>   	/* if we're suspended the session is considered off */
> @@ -44,8 +47,13 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
>   	if (!wakeref)
>   		return in_play ? -ENODEV : 0;
>   
> +	if (pxp->gsccs_priv)
> +		reg = MTL_KCR_SIP;
> +	else
> +		reg = GEN12_KCR_SIP;
> +
>   	ret = intel_wait_for_register(uncore,
> -				      GEN12_KCR_SIP,
> +				      reg,
>   				      mask,
>   				      in_play ? mask : 0,
>   				      100);
> @@ -112,7 +120,10 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>   		return ret;
>   	}
>   
> -	intel_uncore_write(gt->uncore, PXP_GLOBAL_TERMINATE, 1);
> +	if (pxp->gsccs_priv)
> +		intel_uncore_write(gt->uncore, MTL_KCR_GLOBAL_TERMINATE, 1);
> +	else
> +		intel_uncore_write(gt->uncore, GEN12_KCR_GLOBAL_TERMINATE, 1);
>   
>   	return ret;
>   }

