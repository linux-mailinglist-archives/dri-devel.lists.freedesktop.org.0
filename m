Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E870A45AAB3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 19:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D256E323;
	Tue, 23 Nov 2021 18:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C700C6E24E;
 Tue, 23 Nov 2021 18:00:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="215109803"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="215109803"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 09:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="497357993"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 23 Nov 2021 09:35:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 09:35:32 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 09:35:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 23 Nov 2021 09:35:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 23 Nov 2021 09:35:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQ6BwW3pUwMc8MMWGV5AmEg+Sqn/aWfP9xe3IgEj4nvGR0R4kSQXhWFLt6LbbootumKfr5dfuamWAgUVku+nm+jsw9U+6aaKYloxSMEBh91zBaavAqFV72vQvKaL2lu1pl/uKQroQNtfmDCH3t8ZNbLFrSBQ6Ui71UqSBP00I/0N2CuMA6ISKdN8KSYmzT2DC/6jUhLbGii1nEQcdL+NkUSLtW9+wjmPp6URNXE9x7U26c3hwVo50js1FcmnJGjlMlu0jr9HRFKYZ1U2v5zMhvY+FoOJ7KECGPeaNSnIthjj3xisIpPvuu6bsMDxx71AvxnGn5rAnGYTbiYEqprphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNThQBz21/9rf9lNOpDvUZy5VSB0woo//CtbYlMNO5I=;
 b=ZX5BRHqplOwyUUHBZg5cBg9Mzu8FG/YEvJ+YXHyTgIRfFk+/Tt/UvFR0ZJRxrkSdx8dgVQoCwIr4wUX2b5MZsO4xdxExMAakIcI6phljqClATqaImGy7eyXfnNgz2f9701ydOKv6k4TQ4NFcwFFeZFxXM90Wj5S171SsH8bboD6J/CvrnDzhIScNPqo+g45vuE+7g1NmLQPrlbnRE9rsutUdnElQn4qkVQdhnhenIcUXc9CsYnRE3HMBb8y8BKZTaqsJYs76VPMNlv8GdyZskXh7P3Q2KZj70c9O4agoe9d4OCK0Cnu9BF7zbdFSDHhng/z50Z/hT5kkuQqc6sTKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNThQBz21/9rf9lNOpDvUZy5VSB0woo//CtbYlMNO5I=;
 b=ANQjQUsRW85esHIzB9S2N2sYdRuAa+4vZ7gG0VeVET8admeuEa3/akESP1ijsFazZTUMv/QftfqEJHg/RnRU/au/G2wIGt/WidM2RV/mLt9RNrfD4XJK8FWpfVUltCo5J1vRJcdTjj99yyzKQ75Sd1nLIHon8eRvuhsXOrHmKy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5619.namprd11.prod.outlook.com (2603:10b6:5:358::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 17:35:29 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::c996:6b95:8421:8c33]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::c996:6b95:8421:8c33%4]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 17:35:29 +0000
Message-ID: <fc8f15b2-892e-0d1c-3e91-83ef7160e832@intel.com>
Date: Tue, 23 Nov 2021 09:35:26 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH 2/3] drm/i915/gt: Compare average group occupancy for RPS
 evaluation
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
 <20211117224955.28999-3-vinay.belgaumkar@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20211117224955.28999-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
Received: from [192.168.86.49] (98.255.111.182) by
 SJ0PR03CA0388.namprd03.prod.outlook.com (2603:10b6:a03:3a1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 17:35:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaf77bdc-8805-469c-a961-08d9aea7a45c
X-MS-TrafficTypeDiagnostic: CO6PR11MB5619:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CO6PR11MB5619ACAC1A542E4F66EA6B1A85609@CO6PR11MB5619.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYlUpuKHY+RNeLq4yXf+p2oV1Fg4Gj+JgyFqyB1EPFqOWOJLl/ZUHpBDWwUrVAQGiJTKzE80+nRD8x/HUB6aejlGGCZxRkQQEutoqeCh+NEUTiv6OsGxthknULftW0IuSX48I+71RizXev5X9ql6ns+XEtuHzIKQjG8O8hCRkhKX1u/JAW5aS7Te8Fkt4xJ035YqmKRLSP95KdmcN2vEuV5m1+7wTn+Q29S/p8GywJ/rpRVmUtZGoHshRjvHtNii4nCdyvRUNlGa9Kmp/YFX884fA9xZv2oMu++24Y4Q8Xtdp6CU67HQ/96QM/XGz7JZHtyxwly9kH2qBrHndXUruDA5ubzI+YDnMgee7o+obkKgWQono8znGOAdvU3b/COqFptlFpPpQQFLZemg2u7tFNbcmUTwPzdAjNShGGhx2zIfDf9QD4a5HxsuT4KLC6+ByJb5FIYyYiaxhTHbhNz0DP0F639UqArAqwH44HUPMtlH8uo5TdbsW2eG4v+BKSuM+M1VPRvQuMe0g8cNwJVJ/wXiTF2q7P9XDj78Az3OztdTzp47PbO5tV0hyuTVMwavV4c6PFlldnAO933z0ORTa0V48jxg+LbLlyLVo1kWpJ9vy4JRgy8FADZRpGRiL6kqahULCCt6V9EZ/OwGrPnuRfhS5YaGCcK0lrYlX3bFzhXqj7Lr5ymjKr70/DTqGdTlgtPrxS/LXs0IMFt4WlRGn8hwYqx+jBHCzoCYcMISwng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(2906002)(66556008)(31696002)(86362001)(8676002)(66946007)(53546011)(26005)(508600001)(83380400001)(186003)(8936002)(54906003)(5660300002)(2616005)(36756003)(16576012)(82960400001)(316002)(6486002)(956004)(38100700002)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTlKSlJCbUNwMmxWdXk1aE13RTJzNERVMGZSZkFHamkyamJKbm9ReEM3WUFJ?=
 =?utf-8?B?U0dRSzdJd2UrVEIrUjlEcGs0d0lRTHV2L3Zkb3l1RjhkV1lCMGZDMFVSWHVk?=
 =?utf-8?B?MVhBTDFhTFg5UUk5K3NHVTVlU2V5ZWhQc0h2Zzg2RXdNMjN1NHhZQmJPdDBD?=
 =?utf-8?B?Y2pzeVNVZ3A3YkVFeVE5YnRMRlpudEV1WEdaQjZab0VzUHBNZEVGbnlqMmVn?=
 =?utf-8?B?dmhZZ1pBMFhLSlM2d2pPTUlMbEtKSHdBcDlIMFJSWXI2Zmx0VGtlSDdQVVk1?=
 =?utf-8?B?SDYyMlhzRmxUcEQxRDdjMTF3dnJ6OWYwM3ZodTRhbWZCM3J2TDN5UFo2TXVa?=
 =?utf-8?B?ckp5VXR0VmJ5cjNVaU1RMUp2bndXdVk5eVNYb05DVXJrZ1lmTkZiMlV3TW9R?=
 =?utf-8?B?SmRlNzA5NXUvVTBGdXEzMklSTHJXRDhWMzkrRXJuenlXazdiSDc3MXZqSVBL?=
 =?utf-8?B?bWNFY3BrcVZhK2VYRkdqclRlSWFTN0U0MXJ1dkpjTjEwMDFtTjl1M2QyRysr?=
 =?utf-8?B?S3ZDUlI4NkZxVncrVU4yYlFIQ0FvdjhnM0c2UlVXVklrc0trd3QxRDRIcm14?=
 =?utf-8?B?NXJmMzVpaGlna3RFMVRnekZkOGtpVWdLbU9BSHAvM3R3b1JpbmkvNWlIM2FO?=
 =?utf-8?B?dkliNHpET2RkRUN2WFdRMVAwZjh4WDJvb080MXhmNGM1Rk5CYWRIWmo0T1N2?=
 =?utf-8?B?cnlWUTNOc3ZjVnUza29hT2djNTIzNHBlcERTLzdQQzZuV1RNUklEMXVSZ3Vz?=
 =?utf-8?B?bjlmYWsyNlBscm9MTUZ5RnBDQ0NlVVdLVUJZOXorQUJCaEFUaWVVNXh1ZWlC?=
 =?utf-8?B?M24wb2s5VlZlMlhLbmVVKy9Iem1veGVZYW5ERVg5b3RtV1BocG5GVUxacm5v?=
 =?utf-8?B?SkxDNDE3QUtvRllhbVlxR245UkNHN2tSUEtZdXEySmkrWldXVG5TSFlTRVdw?=
 =?utf-8?B?SHRqeFBtY1N0NWJIZnRCelE0WE9vdHJvQzBHZFhGeFdNbUw2QThlMEF0Y2tY?=
 =?utf-8?B?dUV5bGxHY01zejNRVHVaQ1hOM25zeXFQcTAzYXorOXFyY29hM2hZQUxRS0dH?=
 =?utf-8?B?UVJRWGtlL25GckswWFNueE03WGdqalBma3c4VTQ3ZEZCNmtsZG1BVUxiNWNC?=
 =?utf-8?B?bXFSdWVvM2RPOVdGMW1HV2tERVY4QUJkTUE2bFJkdi9LME5LSjh3TjA4TEVI?=
 =?utf-8?B?aXAzS3NjazI2LzNRYmdjUjRDM0NzTWNXa3NTVWJlNUdVbi9Wc0VFODdLV1Bm?=
 =?utf-8?B?Um1DR0Y1UjBaVGtvdCsrNnBhVkM4SFU5aWNPRGdpZFlCWUVzalJJY3l5WWlR?=
 =?utf-8?B?K0RmcjVMMDdjalRoUDlTb29GOFJyUGViWW0vaHRCUFRqeko3azR2dHFIRTJT?=
 =?utf-8?B?SkpnR2ZvNVVHUGtoRnlsMGM3WEF6L3lFNGdybkJZeFNvZTNhZ2dqejdtbWFw?=
 =?utf-8?B?cjFqYmZzNzU3L1NIeFBybE5NcmRWTHROeCt5aUVITUdyaFhhMzZ4UTFvV0Zv?=
 =?utf-8?B?dm1VUlBySzBrZ2ZQdVdFNkc2Q3ZlRkxkVzA3VnE0VjROQzhRTEF1Z3hBQTFu?=
 =?utf-8?B?amhjNjB1M1VqeCtEeVlyVFU4cHlOT245L1VZeWxlUXVxMUhSanZkd2FweThn?=
 =?utf-8?B?VVo3Njc0SWowQzVmSlFJSDlqZHBEK296cTFrTVV5VEQva0kwYXFoaVFGRUJR?=
 =?utf-8?B?QzB4c0RrSGd6bmU2Sjh0OFpkU0FTZ2llZFFxLy9OOTEwaEwxd2JqQ2pxVGhp?=
 =?utf-8?B?NDRIZyt5U1JrTzhWQXVnRnpVMW1BdFZIVDNKT25tUVRsdjZsVVYvdWxFS2ht?=
 =?utf-8?B?Q1Znd0tyaUs1a0hjK1FOWUlsZ0xNZWJhdCtLSjNvZ2dIQllTTndBTjI2Qkht?=
 =?utf-8?B?aHYyUUVpZVF4SkpFRTJDSS9NVjJ4MGkvVG1TNDFnTnBPZHJrZWRUdFRFTmYv?=
 =?utf-8?B?Ylk3eW9GbUIzYTZxS3lISWNwTUs4SlJFSS9uSnNZSVJrbWZBd0NrMG0wZTV3?=
 =?utf-8?B?RUUvcDh1VlBwdU5KV2piam03MGhKbnR0T2MySHFkR28yN3VxV2lKK0J0TW1z?=
 =?utf-8?B?VGFsOHovUlpoblI0Z3d1NndOU2c0SHUzUE9ReUxzc05ra2Z4c09rakI4YnNx?=
 =?utf-8?B?YlRuK0JoV0NtWmsyWmFSaTVrK0FFczV3cVczMUNWZFJDdytIYUhqL2l2eHNF?=
 =?utf-8?B?WWlMWnNqTVVMcFRlcFRtVDhnQU9PWVRKREg2Rm81dndTNFFFdEdKUzEzQ1Nm?=
 =?utf-8?B?YXZLbmVuR3JnRHRyR2tBTVR5L1h3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf77bdc-8805-469c-a961-08d9aea7a45c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 17:35:29.4851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cLd08AWb2R1gtum/1ERl8qMZiKIpQfLjoSeLHccB7ULT7LKgzWxSipGUSaJLKcOsBDWBG3BJ59fHreFtgJx28jVOQur1XkymHVddEy4qEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5619
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/17/2021 2:49 PM, Vinay Belgaumkar wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Currently, we inspect each engine individually and measure the occupancy
> of that engine over the last evaluation interval. If that exceeds our
> busyness thresholds, we decide to increase the GPU frequency. However,
> under a load balancer, we should consider the occupancy of entire engine
> groups, as work may be spread out across the group. In doing so, we
> prefer wide over fast, power consumption is approximately proportional to
> the square of the frequency. However, since the load balancer is greedy,
> the first idle engine gets all the work, and preferrentially reuses the
> last active engine, under light loads all work is assigned to one
> engine, and so that engine appears very busy. But if the work happened
> to overlap slightly, the workload would spread across multiple engines,
> reducing each individual engine's runtime, and so reducing the rps
> contribution, keeping the frequency low. Instead, when considering the
> contribution, consider the contribution over the entire engine group
> (capacity).
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 48 ++++++++++++++++++++---------
>   1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 07ff7ba7b2b7..3675ac93ded0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -7,6 +7,7 @@
>   
>   #include "i915_drv.h"
>   #include "intel_breadcrumbs.h"
> +#include "intel_engine_pm.h"
>   #include "intel_gt.h"
>   #include "intel_gt_clock_utils.h"
>   #include "intel_gt_irq.h"
> @@ -65,26 +66,45 @@ static void set(struct intel_uncore *uncore, i915_reg_t reg, u32 val)
>   static void rps_timer(struct timer_list *t)
>   {
>   	struct intel_rps *rps = from_timer(rps, t, timer);
> -	struct intel_engine_cs *engine;
> -	ktime_t dt, last, timestamp;
> -	enum intel_engine_id id;
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	ktime_t dt, last, timestamp = 0;
>   	s64 max_busy[3] = {};
> +	int i, j;
>   
> -	timestamp = 0;
> -	for_each_engine(engine, rps_to_gt(rps), id) {
> -		s64 busy;
> -		int i;
> +	/* Compare average occupancy over each engine group */
> +	for (i = 0; i < ARRAY_SIZE(gt->engine_class); i++) {
> +		s64 busy = 0;
> +		int count = 0;
> +
> +		for (j = 0; j < ARRAY_SIZE(gt->engine_class[i]); j++) {
> +			struct intel_engine_cs *engine;
>   
> -		dt = intel_engine_get_busy_time(engine, &timestamp);
> -		last = engine->stats.rps;
> -		engine->stats.rps = dt;
> +			engine = gt->engine_class[i][j];
> +			if (!engine)
> +				continue;
>   
> -		busy = ktime_to_ns(ktime_sub(dt, last));
> -		for (i = 0; i < ARRAY_SIZE(max_busy); i++) {
> -			if (busy > max_busy[i])
> -				swap(busy, max_busy[i]);
> +			dt = intel_engine_get_busy_time(engine, &timestamp);
> +			last = engine->stats.rps;
> +			engine->stats.rps = dt;
> +
> +			if (!intel_engine_pm_is_awake(engine))
> +				continue;
> +
> +			busy += ktime_to_ns(ktime_sub(dt, last));
> +			count++;
> +		}
> +
> +		if (count > 1)
> +			busy = div_u64(busy, count);
> +		if (busy <= max_busy[ARRAY_SIZE(max_busy) - 1])
> +			continue;
> +
> +		for (j = 0; j < ARRAY_SIZE(max_busy); j++) {
> +			if (busy > max_busy[j])
> +				swap(busy, max_busy[j]);
>   		}
>   	}
> +
>   	last = rps->pm_timestamp;
>   	rps->pm_timestamp = timestamp;
>   
> 
