Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE75B2841
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 23:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C1F10E5CF;
	Thu,  8 Sep 2022 21:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EABA10E5CF;
 Thu,  8 Sep 2022 21:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662671794; x=1694207794;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GVdlBC3y5/9ifATxOHJtDzRNzenmYdHwSJESa+REdJA=;
 b=Kpy3IRtfY0STm+7/M0pPX6fV4q2qiAL0zBDrJM2VmTrbE+30u2UDISDC
 hIJXOrc6BjqpCDMszbqlxWaLkELVUC/bobk5bHHX6IRyPhgmm8Bg/Ip5B
 UT07V911L+pGb5DYXtYRfG61w1beSjdMQXmgBDco7IeZJT8mIB2M2Y+aQ
 wFp9cFiPPRcToGhxhh7U9fzwHgeOThiOb7j1m8qYuQWNKpoKxApGk3zSM
 xWQSN5nbMBkTm2ocNHYxCanK8HNWBvpSqbBO/06cxA6yQ7ePQ8KvCgmN5
 x3vdW8NGRi2dVo1xfpcpmGDwZyRFL+EDyvLKhfSC7tVKRBSdUrg5BzXu1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="297326522"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="297326522"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 14:16:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="566107627"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 08 Sep 2022 14:16:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 14:16:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 14:16:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 14:16:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 14:16:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfGY1MmADXozTJsS7cAX86BP0gQK3fFnKxeJbeu9LglJ6LJAi+fimgu8ijSAkR38/MfHEfcPI7R3iaflC76R5hJYRWGQsrl8bmJAwgN2PViKkAJge/UhGqSoHusprJeeQJkYhqoWln1S7xyk+rlByQQlqzYB5EOXNn6JZmQtRbFN3HLQQxiIFbvm1Mr+Dx2CirWduLkZH3CjqIbSYDIY6cOtO1yjwVkgFSMm0h9U2WJb0xYJn6dgVvRKuhX8pPPnysBrxe3L4udS01k9Loj7ryroWBHWW45eExUO41XwN2FPSifyZMPsaE7Cb2bzzOyzvvcW78i708XhzhdDzZnCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8b1xKl8Tz8oAfNBcw5FrCC6S4GqyguqEMV/UXBosJKg=;
 b=cMbf1+4AtJKiVhSBsVu9Ong5G5UNTHP4vu4n/ugsHEvTRv1MAgYzC6Uwzy0sz/4/7WGvqp4kNPwvZh1hynw/zn6NE3yhTFGU+nvc3WPfp4y7xRkjLtzfajeXWnfSepiVl6KNHBPRBtU/1sW5MneEtlSP4uRfS4fuCF7Tl7DgmgbsYVRDlY+p951GPqkbF55d2YgmRWUJpumoR3yNT2Lnd6Pe+c24j0xl6ux/LzTp3UCf3DKnjAt987kmjD0fMAT5TJrHRnTQ0VdGJPmCuiCzX/R/tWlLhkiJeM7A5HQ6zTqhZXvgCGMOI2J0IcDsB/LEXMMtsPnMFDyOo939uX80/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BYAPR11MB3528.namprd11.prod.outlook.com (2603:10b6:a03:87::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.16; Thu, 8 Sep 2022 21:16:30 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Thu, 8 Sep 2022
 21:16:30 +0000
Message-ID: <6c731ec3-562d-d983-cec1-408b2334ed11@intel.com>
Date: Thu, 8 Sep 2022 14:16:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 10/14] drm/i915/uncore: Add GSI offset to uncore
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-11-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220906234934.3655440-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0035.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::48) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7358b166-5a3a-4ac4-f0da-08da91df65f7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3528:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHkTSJb9AlkNuv9o0p+P3Zzza/Y7bJtHkNQOEkyL6BLXsoouRNP9aMlrYFsOKzBGG+b8IXGDsCIaS3Pt4dNalMImT6vCp+IBWIh6I2w/4oBi04Hsj3y9MTA2rzPSLVj6ImTV1uwvm4BMQ/7RUZm4xSPJCYSzxISdCHHWyKjx7ooBFNooe8zYkdvrmGaFjGSWCKEXCNp43/7LDUtiy4NH50UcYLieQ0I/xTpzpLC1MDJc1qxl+X0hbSGe0K042ucPQdZ0Gfxz5VdFA2O42CsUZjazlVdlc1CAPbNVAzNvrg4y5T3TSDA6QdTcdHV+afz0JfyH/wSCzzaGTeusvybt3AW5euR4PAwHZ8NGdIAFMHjY1brRxkmYstO2HhVesSSSfyd3q6aFSxvgIfL5F2xAw9hs81jKGLIX3Icv9ilIPSwSjSg1Vy/FVsWrckniOUxzubliOCrgQMYO/IFlvDZ1PWcDWYGCKyU3z4f4S6HV190z8vQyPZiILu6cLyw3Bgfss6I2jzcrZ0BoP3gK0KziJEVtDUjnxITAmZA+/LhoCstnXnXImeEH+F3/i7+TwvaTguezvFVJ89tHwVVondZZWmXhx5fD2B2hrovrIq8cBcKA00fs9u1KWGwdtjyubmUlN+/tkxOtu0YeW9o7WYWSwbe5lwsnxhnt41/66sVeWOGPqqh7uBYiFFMn4MnT+h6yzu9U1wTngfiWNXUYTRzJuDNCrVB6O551qTpd50auX33zGwZrMO8SfYt1nQQDQve9dhrubtxtczvpZuO0gfPGpd+5Yfig6P5UJIoktdYbbtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(366004)(39860400002)(136003)(4326008)(31686004)(5660300002)(36756003)(82960400001)(53546011)(26005)(6512007)(450100002)(66556008)(66476007)(66946007)(8936002)(2906002)(38100700002)(6506007)(316002)(31696002)(8676002)(83380400001)(86362001)(186003)(6486002)(2616005)(41300700001)(478600001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2dVK0phTVB3c1ZTMkRIWHpoUkRuMGYzZ2hMZ1MvSTl6bzNXdURWb0VOdktz?=
 =?utf-8?B?VHQzNVhuaGZhMGhuSjRVZnBJOTZhbkd1RGpVZjY0UU5OL2grVFVzVlZBZnVU?=
 =?utf-8?B?Y0gzN2dNRVIwM2VsMU9nOFpXR3dyWVNhU1JjUGJEMTc3Z1I5cjJFM25GZU1z?=
 =?utf-8?B?L01CL3k5T1Z5Q21zdHNRd1F5M1JZbGlHa1B1bTRCNFJtZ2tTNW9yWG5USnhM?=
 =?utf-8?B?RHRPMWt5b1diS2JzcGlydnFSZ0pGYXdjTmpJUEw2NnR4cWg5WlEzUzFSc2ZR?=
 =?utf-8?B?eWlkdlhJNU1MY0toTFV4SEdtdURtQXJRTC8rNHV4ZE5ER0hZb1BCUWNDanI5?=
 =?utf-8?B?Z3JNZHpMMDRILytFREh3dkpiVmRWT25QWmUyUWd2WmIwcTJCZEFkREloY0l4?=
 =?utf-8?B?cGxub2FvQUtWaTcrWUZWeGxXR014YWtnejdQY0hycTVDQmMrV2JMU2J3ODFG?=
 =?utf-8?B?dVZjREllZ05WS2RkangwSC95L2hweVZjc0dzRzZpdzVyWXY1WlNzcVhZbW0x?=
 =?utf-8?B?S2dJRHVXOVFvazRobzV1eW90OGdYY25PMWdtb1RRNHc5V2k4YkJCTGlCbUcv?=
 =?utf-8?B?RHU1TVE1MXlVc2ZvY3E2QVh6Y0NpNXM4QnB0WG5BN2RjUG8rQWMzMUlMY3hS?=
 =?utf-8?B?eG1sTWIrY0ZkSnZ5YVBiTit2UkNEd0lzUzdlMDVTejU0OFE4M1psOVJ3NWZu?=
 =?utf-8?B?YXJhbHZPTVo4cVh0aHFsSUlEaWZiQ1laUlNvVExFTU5NWEN4dERuZ1dpSUVD?=
 =?utf-8?B?amZuVmUveVp2bVV3ejgrcDFlRDVEcEY3VXlnVHJoN3F1QzM3VnN1N3pSODhm?=
 =?utf-8?B?dVJVdWpqd0M0SGVwMXpSb0FEQXU1WExoOS9mZ1hrN0NReW5rMTk3TjFVS1ZH?=
 =?utf-8?B?VGQ2RmRVcEdGbnFFL0hFLzBWS2ZERWRxbU4rU1JQTnByazlBLzl5M1NFNDht?=
 =?utf-8?B?Z0RLako5ZzJJK0J5bVJFYlNENUVVN0pxTFRibjlnTkRhT0p1RGdqM2ZzL3Vi?=
 =?utf-8?B?YXhJZDFUV05RWFdwVTBDTGVBNHRDbXJsalRkS2ZCVXNpeFBNV2ZnWlVXSG15?=
 =?utf-8?B?Z0NUN21kMEJVWU1QcmlUTlRhVk9LQ0wwN3dianFNd1lvNXBDYWxCQ0pIUDNp?=
 =?utf-8?B?Vysxa0hDWFhKZ0xabXV1eDJ5Ly9MQmIvTXhIbmFxYWdOYjNrY0NpL3crREVS?=
 =?utf-8?B?QkNWam5iaVhRbnZMby8zKzBXcWJsS1NPMUdYR1hEaEJQbDczczg0RXA4NmRk?=
 =?utf-8?B?UTduVHNYV1dKcjFqdUJiR1lDSktMRDh5eFNaeVh5b1pOS05sYStUZU5NaWNu?=
 =?utf-8?B?dVhNZDBNa1pnSzlYM3JmVlJEYy9XSjh1elFkV3JBc3JwQVAzaTdRVldDbzhB?=
 =?utf-8?B?WFd5ejNLdDRpYTdXOVBCcWgzdWpRR0VwRTBSeUIzNDFMQ0djRFdsVS8yWE9O?=
 =?utf-8?B?dmxCNTVHa0JnY2VlbWFOOEE0K0JVSUp2VGNxQWZEZU9vS0d3MEQ4L1QrOE02?=
 =?utf-8?B?WWd3aXNlOWRnT0V6eU1QZzFZYmc3bnpFTWppSEduaWxTNDZCdklYdDdBN3dF?=
 =?utf-8?B?cjdpVDlvRG1uVUNObkRUeDhCT016Rmlla3pUMG9KNDZGdE5hYW5KSnhrSXZm?=
 =?utf-8?B?R0xtd2drdHo1L3padFRYOXhocFpVR2o4KytCRmR0cUV0djlOM0RTNFFKTXA1?=
 =?utf-8?B?dEppcm0rUDBqY3lobXkzUHI2TjcrcWRUV0t2N0w4TVh1TlExRng4Z2dlRnV4?=
 =?utf-8?B?THFlTHp0ZVU0S29lRlBHYnZOUE9KajVObTF5OEwwaGhXa3FXWGpoM0xuQmdo?=
 =?utf-8?B?anlHZWNvdVI4STg1Um1lRzVpV3Y4VEFUUU52djV5TEhRR0IvSnJvK0NtR1RU?=
 =?utf-8?B?d1phQXlkM3p2Ni9QSFZVRmdzYWQ2WmllN0F0YkFoOU5LYlFobTJMNm9sN2N5?=
 =?utf-8?B?YVBpQnQvR0VhdUJITUlGbkRUVkQ0T2wyNGViQk5hTUU1akhiaFdQMmtIY3dT?=
 =?utf-8?B?MVBidDExS1ZlWSt5T2QvVWFwRHU2QmVBeFZLcDkxQm9hdFd1TDNGVUVGbkQx?=
 =?utf-8?B?aURVYncvQmdDU0VpQVhDcEE3Rlc4WWE0WW1ZUytvWEgvYlNSRWwyakRqQXBm?=
 =?utf-8?B?MnhBUklpZTgybnZpV3VBVjBxeGVhNnp0TUc4M1RLV3VLWE80ZWxrelI3TlVp?=
 =?utf-8?Q?q7elMY4Zyum6LSlomNJDXG8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7358b166-5a3a-4ac4-f0da-08da91df65f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 21:16:30.2703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJnBo7ylWOKIhbyA7PNonqXG3iLaYe/IUehRif41YjqmGZWGXg7k2eu8fETfAFLGyUlVPCv5ZRH1NdKDEFKUChq68u0xr641+20aAT8qG8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3528
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



On 9/6/2022 4:49 PM, Matt Roper wrote:
> GT non-engine registers (referred to as "GSI" registers by the spec)
> have the same relative offsets on standalone media as they do on the
> primary GT, just with an additional "GSI offset" added to their MMIO
> address.  If we store this GSI offset in the standalone media's
> intel_uncore structure, it can be automatically applied to all GSI reg
> reads/writes that happen on that GT, allowing us to re-use our existing
> GT code with minimal changes.
>
> Forcewake and shadowed register tables for the media GT (which will be
> added in a future patch) are listed as final addresses that already
> include the GSI offset, so we also need to add the GSI offset before
> doing lookups of registers in one of those tables.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_types.h |  1 +
>   drivers/gpu/drm/i915/intel_uncore.c      | 10 ++++++++--
>   drivers/gpu/drm/i915/intel_uncore.h      | 22 ++++++++++++++++++++--
>   3 files changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 0e139f7d75ed..82dc28643572 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -274,6 +274,7 @@ struct intel_gt_definition {
>   	enum intel_gt_type type;
>   	char *name;
>   	u32 mapping_base;
> +	u32 gsi_offset;
>   	intel_engine_mask_t engine_mask;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 452b3a31e965..5cd423c7b646 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -928,6 +928,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
>   {
>   	const struct intel_forcewake_range *entry;
>   
> +	if (IS_GSI_REG(offset))
> +		offset += uncore->gsi_offset;
> +
>   	entry = BSEARCH(offset,
>   			uncore->fw_domains_table,
>   			uncore->fw_domains_table_entries,
> @@ -1143,6 +1146,9 @@ static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
>   	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
>   		return false;
>   
> +	if (IS_GSI_REG(offset))
> +		offset += uncore->gsi_offset;
> +
>   	return BSEARCH(offset,
>   		       uncore->shadowed_reg_table,
>   		       uncore->shadowed_reg_table_entries,
> @@ -1995,8 +2001,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
>   
>   	d->uncore = uncore;
>   	d->wake_count = 0;
> -	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set);
> -	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack);
> +	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set) + uncore->gsi_offset;
> +	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack) + uncore->gsi_offset;
>   
>   	d->id = domain_id;
>   
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 4acb78a03233..7f1d7903a8f3 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -136,6 +136,16 @@ struct intel_uncore {
>   
>   	spinlock_t lock; /** lock is also taken in irq contexts. */
>   
> +	/*
> +	 * Do we need to apply an additional offset to reach the beginning
> +	 * of the basic non-engine GT registers (referred to as "GSI" on
> +	 * newer platforms, or "GT block" on older platforms)?  If so, we'll
> +	 * track that here and apply it transparently to registers in the
> +	 * appropriate range to maintain compatibility with our existing
> +	 * register definitions and GT code.
> +	 */
> +	u32 gsi_offset;
> +
>   	unsigned int flags;
>   #define UNCORE_HAS_FORCEWAKE		BIT(0)
>   #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
> @@ -294,19 +304,27 @@ intel_wait_for_register_fw(struct intel_uncore *uncore,
>   					    2, timeout_ms, NULL);
>   }
>   
> +#define IS_GSI_REG(reg) ((reg) < 0x40000)
> +
>   /* register access functions */
>   #define __raw_read(x__, s__) \
>   static inline u##x__ __raw_uncore_read##x__(const struct intel_uncore *uncore, \
>   					    i915_reg_t reg) \
>   { \
> -	return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
> +	u32 offset = i915_mmio_reg_offset(reg); \
> +	if (IS_GSI_REG(offset)) \
> +		offset += uncore->gsi_offset; \
> +	return read##s__(uncore->regs + offset); \
>   }
>   
>   #define __raw_write(x__, s__) \
>   static inline void __raw_uncore_write##x__(const struct intel_uncore *uncore, \
>   					   i915_reg_t reg, u##x__ val) \
>   { \
> -	write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
> +	u32 offset = i915_mmio_reg_offset(reg); \
> +	if (IS_GSI_REG(offset)) \
> +		offset += uncore->gsi_offset; \
> +	write##s__(val, uncore->regs + offset); \
>   }
>   __raw_read(8, b)
>   __raw_read(16, w)


Do we also need to update the raw_reg_<read/write> macros at the bottom 
of this file? Those seem to currently only be used for irq regs (which 
are outside the GSI range), so not structly required, but if we decide 
to not update them we should at least add a comment.

I'm also not sure why those macros exist to begin with as they're 
basically equivalent to __raw_uncore_<read/write>32, with the only 
difference being that uncore->regs is de-referenced outside the macro.

Daniele


