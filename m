Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BD282F313
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194B710E09C;
	Tue, 16 Jan 2024 17:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4626910E046;
 Tue, 16 Jan 2024 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425555; x=1736961555;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FRcJsLveL8F46uBOxH8NC2/qCggQIyYFWpjn+zez1XQ=;
 b=N/ckXzsQtSIlBfvVSSThw8m8E+SuIgxb6r6um/vxldps9zQuD2TGP2Ts
 B69YpGz0Rth7jPR0lgPHQezdmXxxDwpabn9zQedtCyPR1W/PlmU1glT/o
 lrgsxh5MjD25swShmqukg9f4cdZW4+ADGo0t+vlOcYtOU8qnBeefVRNmn
 T7d0om08M0GdOoRAskkQ5sqJ5hAMyKM1nUAHXKdL9G6Q829uxZYTpYIYv
 6p9pAy2w3GLOXtbewxeMxVXoBTbJCWjAouaT4Ud88dMSJ1Sou08Zjs9Jd
 rtlmdwr6jZA0c1k6W3ZDTgcZDnbJvUfc4qSYMlLvZHqxhQgnKZd6VOTSQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="464216256"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="464216256"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854417627"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854417627"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 09:19:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 09:19:14 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 09:19:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 09:19:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 09:19:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giAiI5Vvaa7e0u9sbqKClBlYmvzX3JWTI7fojLOLlIxS7aNE9UbbPSqd7BvJiRk86mTbe0pGfoCXgmrp9ExhOH+pguiX+XK4EHzDzo3mSESQgxbrqTOzimO202szcE/nW0mrwtAKa4/HxcG8p+v6z8fYpl7/keIfiw1qMLGTVgnCSbKQgNxvxJoXk8aGFQoQ1eqQsai/0x7j1o6NmGczl2Sfnlk9xiwuDdVLMlfsy8PPToeNOrEiNI3FOScIdK8d4HSRHVYO8+BNwIz0dk7p4+juO1naRp9dUNESOVp6fcPH91qyPeWCKRLMglfLy1IHlPAQ+kY1AcDrfq/9jBWfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1dhagiDx6ZEeoVCFZpQOUVIckuD3yDLGxELbz3+mPY=;
 b=NS91xpqzPKV8lYU9h/Oyzt6a1x+NYQvtHKtkZXFhnHN/QPQdw5QpCbv7x+T/bLCX1TDfJ8iSwki6ZrBYrrvLsv1vUzhoOipjlFvh7cr5SiCv9gfyT99K+wOB/AGyeBbcNdRc1nPDcrMiwxTD9Yd2XsSuPKwBxaWlBLSf5homrrfVaa1umbZai1IMvKa5P8J7BMK1cfdFKA2GV1G+BMr/oxWOM4ojfqJoWZ/YD+GVtnj/C5GTeJrNNW7eZJ3cbMv+TM5CJC5U2vsCB8hbxiv/MtRMydWAaLzuPhssklqz+C3w6pKToZ2MNfh+36XddJeHuHcG6AYyBl7H3fkkW5D6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.26; Tue, 16 Jan 2024 17:19:11 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::fe65:e38b:8d7a:355d]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::fe65:e38b:8d7a:355d%6]) with mapi id 15.20.7181.018; Tue, 16 Jan 2024
 17:19:11 +0000
Message-ID: <abbff94b-bbd0-4c61-942e-d1cc08b4eecc@intel.com>
Date: Tue, 16 Jan 2024 12:19:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Add GuC based register capture for error
 capture
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: aaff45f6-4d0f-473b-a2ff-08dc16b7413b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SNN//tONqxkT/Sa/GoynRGdvYx/ZcHUQFCL2iO0APWEx06DRxccaw2RPkvZkN5hQtK9FEmpfMayksgKSNcEnkY/Gw4ieHdv/GmZ5NWiI2VmqhqKuYH45kjVqY3noZh9JcSHW44AXjvLvImkHQz3fMhN/tjLPDIiWYsnroYVG7uYePsjgpmEk0mlf5a8ZsKntpJlXplVqhITZsh1LNi+IQoCK1fz4BOFURhp6fDMWmnlK+tnsb8M4LM1BOmtBP8Q2uVEOfMs83o97TtBDoLHBLasUNzQaiBibsQqjnu5OQvTbpPpGqllmYR0aMwnhZFHutDfbH/a7z4+nRYuHGxHV1C07BviL9QaMTSr2fZvQcr5etbWf+9YcFhMq0p4ZtAw1dwXvk77YFsa5cH1D3aW+woRj61k9I9L1r/TVTnH4LHcfYS6MpvIknO1ZL+zHRvkr7DK9m33eG++u6dOB07/sfoe69gmw4vf1C0xDRSDIZM7konXOozE6IP7rT+bbyr/Nxa988IrrBj4CqTt0P+7Xw18EONg7zMbsZ/FsTyRHPihRDf+Vl2W56j4EE6xjJ+qvKyRItcWX2SE43/Ch/Q4vG4h+SUauY9InHvPjIAACFC8ETlvP2IfAx0LGHcVlxEfsqshWQVBNATHuLGXoJUAc+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(6512007)(6506007)(6666004)(26005)(53546011)(2616005)(38100700002)(31696002)(86362001)(36756003)(82960400001)(2906002)(6486002)(8676002)(83380400001)(5660300002)(450100002)(316002)(478600001)(41300700001)(8936002)(66476007)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2t5MUZpcHlEbXlmRE1CUGxrYUxuQzFtY1gwU1VZaG9jQUg4Unl2WXJ1LzBV?=
 =?utf-8?B?bXBiMlhvNjdvNHFITWx4clcwbzRsT2k1Sy9XR1JDelB1Z016azUvM05FNWVu?=
 =?utf-8?B?ZmRaOWVlY3NtKzB4ZU8xNXRQZ01ZVmxESGVCMmlFL1V2STk0MytmQjhNelQr?=
 =?utf-8?B?aU53N3Qvd0h3ZDVXbTBCR2IwQlg2ZGNkYTVsUEdubkVJbEYrTjZ2c2tUQzdk?=
 =?utf-8?B?a2Uxd25XK2F3dWFIbXZ2dWtrbFlvVlJURzBxdmdyaVkzYW9pc211cytXc1B6?=
 =?utf-8?B?eXJsMlN6Um90Q3JNemRWNmdzUllmaEI5bVFIQnZjc3NnU1lJcUR2djhOU0tz?=
 =?utf-8?B?TFNFVFlRaE1NWU9mbkNCZGpFRUlVbVVjR3MrNGRtK3pUZmFtZkQ3MlJoMFd4?=
 =?utf-8?B?dkplRVFxNmYrMzYrRndRYmROaC92TnREZ3NaSUwwYVJ6dkVnaThjbVd1Z2dU?=
 =?utf-8?B?cCtLWVdaR1ZsbGxFdUk5ZWdBTmhzakpmZTZaL3hobWJGUndSSkxNZnNIZnJ1?=
 =?utf-8?B?UFdxVGdyVndEY0IyTXllNVNib24yYWJKNTQ2WEdON0dMTmN5WHRYeHRnVkF0?=
 =?utf-8?B?aDMwN2QrMCtBdUx0L3Rjd0hoc3lnZXFQYS9ob3pISnRtdEIxYjJmNkFBeSsy?=
 =?utf-8?B?SmhTTTVIZlBpeFU1dnRSeDd3ZU9QVzZFS0ZCb21DTkFnS3dsby9LWGh3VVJK?=
 =?utf-8?B?UnlJaVhaZnQvemtBaGFyZ1RzckRhK09ZZHRXVG42SHViN0xCY0VBdWR4YlZz?=
 =?utf-8?B?eEszREVXWjRtM3M1ck5VaGVJbGp3OUFaVllGQmp0bEEyV1JwMDZueXZLQkpx?=
 =?utf-8?B?ZDlrYWUrRzl2a1FwQTJoeGl4S0NMcWFWRWY3Wm1yMjZpdlJUcS9hU1VyUldV?=
 =?utf-8?B?UG5NcCtleXpZSlVGekV2ZzgwbnZibDk2Nk00cmZlUUNTYjJ6UDNUdGF1MC8v?=
 =?utf-8?B?Y29kcDJ5RXhGNjBTTDRqMkFPZDhNWlF2K0grUUhvMFI2dFlkcC8rQ0Q0Q0gr?=
 =?utf-8?B?RlRJSVcwQWxjbG1GT0FocUI3aEd2dlVvZ01nejFzVVJta2JieEhaQmJPOENI?=
 =?utf-8?B?Y3cwWXZUMXJoNTFYR0p4MnFacnV2UkhKYXNrNmFtakVJTVhHdEE3VUhDV0JW?=
 =?utf-8?B?NW1tSnA2d3M2YlM3Vmc0VXdrR1NxakljRzF0NFF6MmNydzFDc0xlbXhsRFJN?=
 =?utf-8?B?VGxsRWd2N0hVTkZEMVpRZ3BBKzBuYjhiNGMyVmxEVWU2SkFRZ3Qra241ay9H?=
 =?utf-8?B?MkFTL0w3MG8wY0hOZUJTSTQ1amVjNG1LTUoyMWs3dlVqZk1tQ1NmZit1bFJa?=
 =?utf-8?B?LzVjU0VEL0R2TXI0aGJRWFR3RlVUbVp1ZWtzTG1QL1FQRE5XdXM1VFlRQTVh?=
 =?utf-8?B?bE1qOExCVlYzMkpaeUFPU1lsTzluNzNKbzM0L3FjZnd5RFZBVzZ1TmMxRGlu?=
 =?utf-8?B?d1VmZ0tRZWNxcEthYlgxdllucno4NEZ5V0pVeDYxazFJOTZDNmJpZXJDckw1?=
 =?utf-8?B?RHRDK09KRnhLWVVXVTNCQ2hVWHMvNmJjRy9oQW8zYlBwbXIzOHRrRDVFcHJX?=
 =?utf-8?B?ejRpVVd2OW1IbkhhVzJCUFFHTncyQ2lhTW0rQ1NVSGQxR2NVZFNnZDQxL3Bv?=
 =?utf-8?B?OGM2QlpaVFpXbzhvZXUzZ2dsNlV2SHRQSTRlTW9vYklVV3QzUS9LVzJMYnNv?=
 =?utf-8?B?VHhVYTd3alJtR0hNSE44MjVLc2w1c2UvZUpNTUtqVkVOSytHNFJPaVBXRkZl?=
 =?utf-8?B?YmEwdnVHbU9uU01sSkdLeXFlMjhHTU9lRHoxZ0Q0eE1iUVR2M3ZGZkJQL2tC?=
 =?utf-8?B?THVRT2hyYzVtVDJoMU5PaVVPeHVXZXpiTXlaWEE5bmxiNjdQckEyclQ4WTN6?=
 =?utf-8?B?eEVtT01vMkVneWNGQ2htM3NzWm14YkZxL3VnM2RyVjd6SFNaQlhjSXQxZFlM?=
 =?utf-8?B?RUhEZ1JpcjhoWHBYYnA2N3NhWGlMNGFjdnlIcmlhTFRrVnVBbFdFaU5WNThV?=
 =?utf-8?B?MmVFdlAxdFQvZFpJSTExMU9TcnhpMmgwek5MdHhZdFZQckpDSThncCs2OWg1?=
 =?utf-8?B?cWc5T3FKVWtCYUdXUVR5UmhwOElqbzhMZWFKeGhsQ0ZJdmVBb1k0eVUwU2xr?=
 =?utf-8?Q?ZkQy7wgH6YALAkhoA5xegtLmC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaff45f6-4d0f-473b-a2ff-08dc16b7413b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 17:19:11.0638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4S3PQc9hHNLbgE9Nfgc2UEGQ0cV9Du5rd7D9xuhurxqb5RJq24FCwp5WlLrRS1IF789emAhsCKsad6M59F3OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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


Please ignore this patch
The patch is for Xe upstream, sent to wrong ML.

Regards,
Zhanjun
On 2024-01-16 12:12 p.m., Zhanjun Dong wrote:
> Port GuC based register capture for error capture from i915 to Xe.
> 
> There are 3 parts in this commit:
> . Prepare for capture registers
>      There is a bo create at guc ads init time, that is very early
>      and engine map is not ready, make it hard to calculate the
>      capture buffer size, new function created for worst case size
>      caluation. Other than that, this part basically follows the i915
>      design.
> . Process capture notification message
>      Basically follows i915 design
> . Sysfs command process.
>      Xe switched to devcoredump, adopted command line process with
>      captured list.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> Zhanjun Dong (9):
>    drm/xe/guc: Add register defines for GuC based register capture
>    drm/xe/guc: Expose dss per group for GuC error capture
>    drm/xe/guc: Update GuC ADS size for error capture
>    drm/xe/guc: Add XE_LP steered register lists
>    drm/xe/guc: Add capture size check in GuC log buffer
>    drm/xe/guc: Check sizing of guc_capture output
>    drm/xe/guc: Extract GuC error capture lists on G2H notification
>    drm/xe/guc: Pre-allocate output nodes for extraction
>    drm/xe/guc: Plumb GuC-capture into dev coredump
> 
>   drivers/gpu/drm/xe/Kconfig               |   11 +
>   drivers/gpu/drm/xe/Makefile              |    1 +
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |   12 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   20 +
>   drivers/gpu/drm/xe/xe_gt_mcr.c           |    4 +-
>   drivers/gpu/drm/xe/xe_gt_mcr.h           |    1 +
>   drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
>   drivers/gpu/drm/xe/xe_gt_topology.c      |    3 -
>   drivers/gpu/drm/xe/xe_guc.c              |    7 +
>   drivers/gpu/drm/xe/xe_guc_ads.c          |  255 +++-
>   drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
>   drivers/gpu/drm/xe/xe_guc_capture.c      | 1404 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_capture.h      |   35 +
>   drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  225 ++++
>   drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
>   drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
>   drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
>   drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
>   drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
>   drivers/gpu/drm/xe/xe_guc_submit.c       |   22 +-
>   drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
>   drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
>   drivers/gpu/drm/xe/xe_hw_engine.c        |   73 +-
>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |  106 +-
>   25 files changed, 2355 insertions(+), 131 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h
> 
