Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780AB5BED6C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 21:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9014A10E755;
	Tue, 20 Sep 2022 19:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFFE10E3FE;
 Tue, 20 Sep 2022 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663701393; x=1695237393;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=caZ4kltcQCLJBtAuQ81Kp5WNVCU3icAHLjWfB6RXNRI=;
 b=HmHz8adNdbka0bhj5VAxuIqD0T/5+gWqhgL2IUFWjehN2Al0ru+km0FH
 pv/ESqaY0z0Ps09EsBTKi+1lhsTWyA7JFiZlGK8F7pmrPF2F7AEyhExIo
 p2x22lVoZP+klxPTbqBEsaTzwA2sDV95qRdpA41gW8gJ3RkJuyNUrjkVB
 O12K+73SLBzr+nqXouei3osZNjhcDcuxuaMCgjmUVFQP+uKDRP7BsAVn0
 fx/PtiV4kmB5hkaDuI49cB7IaxER+L8iBYBQckGw1oOwrOlarBrU9uSQ4
 LZKBzAImDv0Hlw2bs5CemwGRGE+nbk/02130HVtQ1xuPs1ktnUJhG3ibg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="280171837"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="280171837"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 12:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="649725140"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 20 Sep 2022 12:16:31 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 12:16:30 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 12:16:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 12:16:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 12:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbF31b6RE9AZMMvFr8EOiOdUdAuGIiI5x0ivq3+DAFVinT0d0uFCxVgYdj0qhOUnAlOicjb5TNnGVFv9O240dURAjGUyFZyRONWxBr9gpNyUodE0romXyU4qZ8w3pSazktpao20mNwIhSQTzIyg5Z/VnmsM1hjEpAM7e7WPDN/A3y3jovhXSi9a/lsGN4+f8jZXgfSbEBvZK3y0NZDbzwmCxKUu4JU5dRVZXqBkUMgd1pUBSmw+u3f2LAaWt/Nb6nffDfKN1uknZOzm/8xBCQqckBPG/xlhkv7VL2KSD9cpsH9x+7wNzSe0LGXJ8BUaGh4+XVwribl0YV0NHFeHoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGsrJWiqUJVLD1kijekOvJRDT4BttoCSvH1QQ8A/tPM=;
 b=B9/HFPWQXwDBcw/8dXJyPvI6s2k+dtjK7ERsj9Ef4oh6lJL5tRVudHjteD2hxVP8fSYtmuTURlaTyIWhjj/j8Xjju65isUXR/6sX1IgPBW8tcB7UxFzGhfOyPcSZSscfI3CG2BGHkOzmy4Y3TGZ1XEHbg/zQFRT8ZQZWTSQpC9nEoKrm7RtudwizLT7/WY65Pu2RfoMEW1AHXoGWiGuCCxU0njhptBnCyCnDHPe0A3VC7d1fN1j5/ouO9UMGiXwkhzl+vsP+XlyqhH8uBuvLzGMcYM2z3DO1GZISD6AyVGl1b6R+wD4HPn5jTiUguKcd1nO7p2xPUQST4zDoih2n9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9)
 by SA1PR11MB6712.namprd11.prod.outlook.com (2603:10b6:806:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 19:16:28 +0000
Received: from CO1PR11MB5108.namprd11.prod.outlook.com
 ([fe80::60be:993e:a3fc:1cf9]) by CO1PR11MB5108.namprd11.prod.outlook.com
 ([fe80::60be:993e:a3fc:1cf9%9]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 19:16:28 +0000
Message-ID: <a34072db-04aa-9117-1a03-6b5e60243986@intel.com>
Date: Tue, 20 Sep 2022 12:16:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v2 1/3] drm/i915: Add missing mask when
 reading GEN12_DSMBASE
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>, Caz Yokoyama <caz@caztech.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>
References: <20220915-stolen-v2-0-20ff797de047@intel.com>
 <20220915-stolen-v2-1-20ff797de047@intel.com>
From: Wayne Boyer <wayne.boyer@intel.com>
In-Reply-To: <20220915-stolen-v2-1-20ff797de047@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To CO1PR11MB5108.namprd11.prod.outlook.com
 (2603:10b6:303:92::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5108:EE_|SA1PR11MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: f190a7bb-6fc3-4858-cb26-08da9b3c9e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bikQkSxY0o37WI/PmrE3fcZtvz6yON6cz9pId9FVhVSNAMXV+kOLAxmSaEfULOPDjcPqx3l30/BrXAfddW8uPJzgPQevdoS1cCQPXgeHG0645oVPKay6/3HfQ7kNsruPN8Uyqb2+8VMVk/4e228A6dMfS2mqTgDlxwIFGV1dAVDCWWFhA6r0z78GDXpxaM3s3RnH6jhkiwkYz0hyTHP0u8fNuz5Vfcse/fVqWSkT/d4XghNNkJkisxlyWxvbslng+iyJEJtH85k3cCcyRigQyMAi3cWeBmlQa0aLSds5r8rNQ3i5h9bLAi0YZmPs2kY3ySF6cezpL/WPXbkAxSYWh5H+uQF8bWIeUAAC3I78b0PzI31l2tzmyGWgvHZfkotYm3AkKkX/IGX7/lwaNVw/0Wn4vhgKI4/eq7PkDEJCJpZj2UjV1ztfbMw36YkVe1tOCz1PR0vm3vvX6PQB1l3DQQc79IaOG/kI+sp02JOAdbRRUOalKqywN5i03oCH4KukZ44wwTGYwHRby3z6Gig51SKYCazn3w8sB4hLglPCFrp80pPJdotWxxTBaiEyXL4n9sBqcOWr4QKXzC48LeUsaCLKOeuoohaen0aIoAB32Kl1oOGeXNSWc2LWnyzQghhjeiO7qXivT+WDoANFMl++yj8/fw56DUp4hIvmX3IlqdozxkQqmaLwfIh5sCBAYziHSCbEhUL8n0SLgCYHFrMTbJHLzF8Cx9itT4u3Qg6WI6e43u1xxkM3I6AMJvuLqoI83S7n9jtm06ux6qfSdkyLxGhcoeAwZGQ438K6ry0gHj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5108.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(36756003)(6636002)(66476007)(66946007)(5660300002)(8936002)(316002)(110136005)(31696002)(66556008)(86362001)(4326008)(8676002)(38100700002)(82960400001)(83380400001)(6506007)(53546011)(6486002)(41300700001)(478600001)(2616005)(186003)(26005)(6512007)(31686004)(44832011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alpPaWFVMXdaTWJXTWx5OC9paEk4cDNEZjA5Qks3MSt2Qkp3SDNEczVCbjhh?=
 =?utf-8?B?V3VVd09xWjFOMXRzM1VXdjU4U1RCRlNodGRWMGgvMlJDTEhOQ254bHovQjFw?=
 =?utf-8?B?L002Y25rMURPc0hQYUtEVzZQWFE2RE5VUE1JV3NWMFVxK0hBSzdiUDdFVStV?=
 =?utf-8?B?ek9nNkYvNjhvelBmUHNwMWtmSERlTUJYeldHa0tWbE54WkpEMzhvVlQ0UmIy?=
 =?utf-8?B?Z21WUFV0Rk1NMC9tVHZ0S3h0eENSS1gxRlBMT3ZQSEcwVjVRKzErcUgyYTdS?=
 =?utf-8?B?NGRKS1dHcWd5UEtJM1ByUzY1dm5aSGN5RUVlaEI2RzB1dy84T2p4WkVyblJr?=
 =?utf-8?B?UjZIT2E0ekR3djkvNmV1MnkwOElwN01RZlh4R1dKWUZ3ekk5ZnUrdE5sYjVr?=
 =?utf-8?B?bWpGWE1YTVV0ek9HMnl1bkxuNm1kS1hSUHhYQkZlZ1UxMmRwaHBXbDZCanRh?=
 =?utf-8?B?OFNpRzcxd01LaytIU3oxZWh0R0tidjh3a0hXWUFmdmplNmlkWmlZcmc4Z1lY?=
 =?utf-8?B?dGI4clU1UzJmaEpaS1VER055allaYVRseFRYKzg5Um1KOXdyK2trWFBKdms5?=
 =?utf-8?B?QUpRMmhPN21uN1Z0c0VVZm4yUWVRSmUvc0tUc2hYWHRldmYwSkE1dEp6cjVP?=
 =?utf-8?B?bXpma0VIQzJOUytzM3VCMzdnTjNLZWRGelY3VUhIMEErVWhqaE1XMVVBVk9W?=
 =?utf-8?B?aXhmd3pSMmtxYTlnM1BlclcwcXNXZUJYWFRhU1BRQ29wYU5IT1ZtMjl5MVc5?=
 =?utf-8?B?SmVJdGYydURoSm93M2RQR2Y3d1Z6dXhwZ01qWUUvditSQjlSeER1WG1qZmhw?=
 =?utf-8?B?Y2VCbWxGK1Fic21BNTFGU0JkSlk1dEthM21RVko0eWNMdVRLbVlzdHc3cXpt?=
 =?utf-8?B?ckc1R2NWVzVJQUxHRG1nZnJLSFFZRnZTUjdncTlsS3BlU0hGZkNlMjhuTW5Q?=
 =?utf-8?B?WmMxWjJ2bEpxTjJpMmpheHo1N2lFT1hGOVlSL0V3RFQxOXc5aC9yNVA0YlhW?=
 =?utf-8?B?TE16R3lnU0RRSXpqS2JnS2lQUno5RStYVVkzQkRTSmc3ZnNBbUN2OVJsV050?=
 =?utf-8?B?M0Yrcm1yZDc5NS9HMnlLSXRhWEJWd1NyNkQzcWJBVmZzbkx3Tjg4ZUE3bmVH?=
 =?utf-8?B?bWNQaHBiZ2VEVnVDZGhuMUR3OE1RdzB0OWY5aVhBQzdCdWFsMklEaFl5WVNC?=
 =?utf-8?B?UjIxVjMyWXJSOWlpdXhQOTNtazRvc2xZK25oSUVlNWxlaW96cHp6SjkvaFgr?=
 =?utf-8?B?Y2ZtRUNXVWRxeDBBUUZ2ZW85blgrQmJWcEhXeDFYUjA4THlSWFRhZ3JpQ01z?=
 =?utf-8?B?aytHK2J1WjVXZzcrMENwM21PSjFCcHgrM2h4T2NzTE5HYkFOSHRKNFVMWlE3?=
 =?utf-8?B?elM1RVUzaTk5OXI3WnA2aWZ0WmhncWhacTZMYjVWa005eksydk92bHlId2pt?=
 =?utf-8?B?c3dtUm5uQzhWL2wxTEJUQlZ6SFcxQU1QaUJmYXNKOFB0dlJ1bHNMS2lucEhG?=
 =?utf-8?B?YjVNVlhsa0ZUTzFQb05GQ05MbnpkMlJNRzNPZklXOWtHUzhYVXlvek1Jbkdu?=
 =?utf-8?B?SElzakUrMnVoaUFYM09wYjFHbkJMRDhRSXhxVjFEakIyT3l4d3BTaWo2d1FH?=
 =?utf-8?B?cEhMT2FMdWN3Z1dUbTlQcmF0ZzV2Q0hvdEEyT0wwZm11MmZMbFZLcDhVaFRy?=
 =?utf-8?B?d0h5WWpjRTVLcTljWjk4Vk1tWE42S1d4SkQzUW5iNmFlYTZGQzV4T1ZXS2kx?=
 =?utf-8?B?MjJrRGNiOUxwdTU0VDR1NG9QbHpjVVJNalkrdHpKN2tyV3NZUFNraGY1RFZ6?=
 =?utf-8?B?bllKZUd6NEZsQyt2RlBHSWJQWjZVdS9kOFhBZk5URitNaFpsRlpiR0o2SVhv?=
 =?utf-8?B?eHhHZkJFUmhTQnZPczYxbCtkekhpRUpRZXdSaW82ZVJrdUkwRlI1QmljNXk4?=
 =?utf-8?B?R0VZeDd6VkIvY1oyOUs4UGRoWXV0VFl2NXJqRDVoWEp6dDQ5MHhVcHhhNVZk?=
 =?utf-8?B?cXNSOVJyWCtDZEVrTmM1N3dydzM4bVVDdE03bldiSXd5SFRISS8relR0ZEhj?=
 =?utf-8?B?bGNnSEROMVgwbTFSakRJckRWQ0ZFNTZzWEJDeU04Q0tZRnVOdUt4Y245c1Z3?=
 =?utf-8?B?OHBkMGx2aFZCWEhhb2lZQ04wUFZ1N1gxem13dHJUcExlRE5XdmJocHF4NG9N?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f190a7bb-6fc3-4858-cb26-08da9b3c9e2a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5108.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 19:16:28.2168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9oryZGuwlEWkFfSk7/lMUbNNUJi/TEgwHnTQkTRG02KAFSZHCJQ2kqz7gwjWtWjF7QtMlmTbitLVvrkz5jHQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6712
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
Cc: tejas.upadhyay@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/16/22 10:36 AM, Lucas De Marchi wrote:
> DSMBASE register is defined so BDSM bitfield contains the bits 63 to 20
> of the base address of stolen. For the supported platforms bits 0-19 are
> zero but that may not be true in future. Add the missing mask.
> 
> v2: Use REG_GENMASK64()
> 
> Acked-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Reviewed-by: Caz Yokoyama <caz@caztech.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 

Reviewed-by: Wayne Boyer <wayne.boyer@intel.com>

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index acc561c0f0aa..3665f9b035bb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -814,7 +814,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>   		return ERR_PTR(-ENXIO);
>   
>   	/* Use DSM base address instead for stolen memory */
> -	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
> +	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
>   	if (IS_DG1(uncore->i915)) {
>   		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>   		if (WARN_ON(lmem_size < dsm_base))
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1a9bd829fc7e..9584a50ed612 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7953,6 +7953,7 @@ enum skl_power_gate {
>   
>   #define GEN12_GSMBASE			_MMIO(0x108100)
>   #define GEN12_DSMBASE			_MMIO(0x1080C0)
> +#define   GEN12_BDSM_MASK		REG_GENMASK64(63, 20)
>   
>   #define XEHP_CLOCK_GATE_DIS		_MMIO(0x101014)
>   #define   SGSI_SIDECLK_DIS		REG_BIT(17)
> 

-- 
--
Wayne Boyer
Graphics Software Engineer
VTT-OSGC Platform Enablement
