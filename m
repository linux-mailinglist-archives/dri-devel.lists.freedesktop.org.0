Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E8558BA6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 01:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C84310ECD3;
	Thu, 23 Jun 2022 23:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC3B10EC9F;
 Thu, 23 Jun 2022 23:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656026511; x=1687562511;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2zeJqCZMT+utEihV96iZLZzy3LIyHg5u+47OPuwpkbI=;
 b=Uerl7x0khtgxi9uFPpcBLFcCCk9EQOkwxos7hnpU8r9ojaiWoc04nwEv
 HOYrAM33kufnvala7NPzJJdJ9v9uJkUZUmOgyx/pEk9OqOYgYmBMUEPar
 9qhV/tM0sL68FMAx7bl7e+YoIJq+HQdGS2hJnCEILL+iYesPc1Dw5QWXA
 nN4kPoE178++w6vgArdzkQHiMwHjzUL/YZ2bDmrAXvL2wZqzz5luXyQMG
 ZUpboCUW+uys7QaTZSMADhlIN6unH7wAp3tTur9h7vaTxIcanc0EJe1Ae
 toVqWnuCHOziPWnxG7wJRx9yRcIlA1Prz46yhGvjKr0rsVUrMkt2ys5GA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="280913268"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; d="scan'208";a="280913268"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 16:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; d="scan'208";a="678281031"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Jun 2022 16:21:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 16:21:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 23 Jun 2022 16:21:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 23 Jun 2022 16:21:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOYGNHiN7DrxEH1ezeC2NQnsZbRZjjoUgL6jpUH3HKyXe4SanmctcusHcLJ8lfB4sPa4NVXH7ozs17TpOMvXpsTu9caP6WfIkbJV/ExkNWoKQIPd2eEjHzhk2ZNniwJQ9Ajqtx8XYddRD/fFONbmFltf7KjQGqSLOfPajcf+RYeWHelEyw0+aMxBNOH0mnYuRrCUz6iF2qAbx+snOsJOGDc69LSjvDfKL2Vk+8Q6jfGnEMBaTBSDvANXSXbtSI6UNLunQVld90soUuYeNq7FcqySbtAToHbyLbiln3SHM3w3fR0LXlNNhvd6rZOpX6NoPyA3CTJDyqTlKxKGK9ZFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cZUmJPA2SdTaxVQgS0JbskrVutT35zmPQzSvEy3TYY=;
 b=ku0O8cUAHa1CeCcEzIXQ1/F/ycuqTfUVnUfuSSkHwszh9f2Ph7vtF/DyLlyNNZsa58w7d5Ljpdwb62+Ewc8s8JlKh8xTDo4IiOIjyEXANNWOqYDv1RO/NVWwHGija4fst6QKc7BnEN0OxST+qOG0DekbYOMTFYTZwim3xoHr7u+Cyhk6z49/PsvGCAlHf5tIqbkBRK/dVBpnajPpLapHkTZyzedr6l8zVvW6LD3EuL7xgRU/0uuvKhnaSKYFbWJsplmDW25XPdeA9C/9y5ywQ8HYA+RZCHKkgR6/+ir+n9syDCOoGrCBgKEL+sXHMP7Jm0RGjjFVUW4ELkBvM9A/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 23 Jun
 2022 23:21:47 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7%2]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 23:21:47 +0000
Message-ID: <9d734dfa-ce26-465a-d20a-90dcd7355e78@intel.com>
Date: Thu, 23 Jun 2022 16:21:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Add a new SLPC selftest
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220610234712.36849-1-vinay.belgaumkar@intel.com>
 <87leto1lsc.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87leto1lsc.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::35) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f749ac4e-c88e-4d43-8db5-08da556f24f4
X-MS-TrafficTypeDiagnostic: MN0PR11MB6060:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0WWk74nTZt+4dqIpcOeModFdgttyeA2H9EQ4iCbw76jNECD3+ycu9rJEw9yX1gv5oYhHXjD1MNCmCZLFRhQSspgntn/Fy2H3qUhcPjkNIa8zf/ZQbWDKzezgsCRk75yTbrEHgN/EY2yDBWj3IKb1/pdjxwLV9jhjavO4Ir7eCg422F9FS1omcUWbewEvAlOhv56lnK5skCq2ZUiF2FvM9P17kkTsC7UYGpEn1HSJYAGwv1U0QUJFs722cyYnH7hqDvF//wlrsZ49jKJ+pXJFZsCaWn27ws7hPiJa7n5bramKkkHsEOBrouuXD70v/MFgMIl1KPGog+677DCdYgb+LLYCUaRN018Svw0ZkdqmzmozneIaVtN/jtKMmiNKZttiTWn+JAc2KHa4tVKvrvjxuXrz3dDfg6MNNI0jO41v8EpFdEYgRXcBjFYRd3UBAy5D4AA6vYi4w1Rt0rkCws5WTz9bxAbeodIwI5r1qTy+vYlWrht3cmeudYhVvHz8P9Hl8XqMIKmBZcQy5dJ1/RbEeL3PWgauWt96p6nANLfy1yV/uIWPtV8cXJSgyqEDQaMmaIoB/+oqkaBEqhGTqIFiK8CdlvECXNwjMs2xs1/90Jb7zXNJwn2Flq5YVyKIAwde8IZYUtD+sVRb82tSpzbxCOmlFbooN7JNI1cYykBoGu9m1AhMcpS9HzSLDm/d1wnxlXpXuHgqw4E1skPg+ixIjqH29EcG2nGbIUKZ5sxa+GsRPz3N3/1A/qPaNsgJPI1eZeCNC7ouIY+DYOcNgE9v1GSjB2u3YaLzdda/L/rTBvqL6qvfDwUSpJTv2NPV1fobriU4m6TvWiFR5pcFuH6kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(39860400002)(346002)(366004)(376002)(66946007)(37006003)(316002)(66476007)(4326008)(8676002)(2616005)(478600001)(41300700001)(5660300002)(186003)(6506007)(26005)(6636002)(83380400001)(66556008)(6862004)(36756003)(8936002)(82960400001)(31696002)(6486002)(38100700002)(31686004)(6512007)(53546011)(450100002)(2906002)(86362001)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2dPaVZrUm4zcjAvVWFwNFNBOGhaODdNcStRbXRCNklCamdFSUNJdE0valFH?=
 =?utf-8?B?Y3Jha29kakFMUU1NdkJGYU5VeTJ6aDduc1NNL2s4NTh5WFhEZVRBOVVvMHFn?=
 =?utf-8?B?TFJWQ0NvVkpjNU13Ylo5Q0FWWGVVR2JudC9GOTQ2cDZ1Z0pXaGZTMVM0bGp4?=
 =?utf-8?B?SkRSNlVWUlVnV0N1OUlnallTbWo0TXNjQTJJUTU3YmhVRktNbEQxWG5uVjRq?=
 =?utf-8?B?bDhIY1l6Z0dyME5tSU00dGNTS1JCOVd5dUE3OXl4WnVGaUQ1R3pEV09qMllp?=
 =?utf-8?B?MmNzWlhOT0lDVXB1WlRrZmJwaVhYSnY4YURRTXdmTU1RY2NMWEtheHRTUEYv?=
 =?utf-8?B?aWxRZitZeHpKRzZld29aOFZZcDFNa2hCeTdkWHI0Qm1OWFVFSVpSbGpWRXd5?=
 =?utf-8?B?UnhCTnh3aW5zQW5rZnd6dE1DeFFvcUtsVE5JZjFPMldFOXlkYkk2ckI4VFZ0?=
 =?utf-8?B?T3pxMlVvd3BKZHViTm9pZGhiZFFTQitNVi9YQUM3L25kTDZTMnBTbTVrZGxI?=
 =?utf-8?B?bm5NNEpQQThjMlcvSzVuQUFNZmZjZVZpUkh4NGdTNWZDM0wrOVJWUStLN1Zz?=
 =?utf-8?B?d3hVaHg5a3VIdWVib1F3bUtnRUNRM29XdllRQ2ZHWTVINXlUYnFZS1haM1B0?=
 =?utf-8?B?eUFwVm4rZzBaaFZ0Y2dMOU5VMXFFdTVnb0FNNjZwNEhhdVAvV2kwWmVDV0pz?=
 =?utf-8?B?SWhkMDdodkQ5aU9jUkNveVZDYzdSbkl3a0R2dytQNlZjZ2lvRmFBMnQ2b2Ja?=
 =?utf-8?B?YWdGNmUxTjVKTjNCa3E0djRXc3RvTUhOenNKdXF2b1A5Z09uREhmMXJGMnlV?=
 =?utf-8?B?MlpCZVluNXdNUmdUR0RuWXhXU1R4VEZTQkp6TVoxL3BQOFBRZE1uTmk0bkFH?=
 =?utf-8?B?N1JIcUl1elNCQlF4d2NmRERmcHg4dHVhaGNsY1dKbDcwTmFtMmZHdEJ0emhQ?=
 =?utf-8?B?NXlLZUQxRy95ZTZxYW4zeW9seEV1YkxScTdvQnBTZzdEbXZGQU9OcU9kSlEz?=
 =?utf-8?B?ZDZKcTRKc09vZlg0WGVjSDVEeElhZ05xTmF6Tjh1ZEw2b0xLVk9RWHc0Q3NK?=
 =?utf-8?B?b0llV0ZRVm9ycDMrYlpoSDhTYjQ5RDNKTU5SbFB5Uks2RlpNZmxGUjlwTVIz?=
 =?utf-8?B?ZDBQd3R0cVM3SHV6WE5WVzRabUJVWmJ3bVNKTmRYTGpNekRlWWRnTkd0NXVt?=
 =?utf-8?B?bTRaUlRQOW93N3lSUER5Z3VuMEhaYTZLRGFqOHB1Z2VNQTRObFV5bGY1c2dn?=
 =?utf-8?B?UWtyL01lMkhjSmpuc1ZJakZxSDRuejcxWHUveUZNMTJweW1xSG5KNWYzendu?=
 =?utf-8?B?dnZWYXlBVkErdXRwcUgyeGRhTG5hSXhTRFhSVUYzS2xiQVVnRTgrNUtyQnAz?=
 =?utf-8?B?T0x1aUF2K0dMYlAyYXNwb0wxT1ZUdkNZVHZTMXJuU09IVjdDeHEyN2lnWXBL?=
 =?utf-8?B?OGg5QXJUajE3d0JPSlRpR0g1b1JyWkpSRDVjak5uMDg5clFoaW1FeG5BTTdO?=
 =?utf-8?B?aWJFUllKOVZTZ1RhRlpWWDc3VmVBaXhZTXowTTN1WUtJaTVJaEJFV0cvak1q?=
 =?utf-8?B?MnJ6cnRxcUcvejBZY2RNM1E4a1pZcklGdnEwRlhHR2tYMGxocHcvb01vMFBC?=
 =?utf-8?B?V1JvRCsrVU1OK2d5SFAwMVZLaDMyWVYxclM3MlVrVGN2N0Jnd3BySnlwWDZl?=
 =?utf-8?B?NmhldHo1cG9OcXFtQ1M5cWpGSVFBN1QrbGplQit2TFFuSENnMHViUmhhbVcw?=
 =?utf-8?B?VWtsc0FQdUZsOGgrL0hxY0ppL0dlQXVTYzAwMW4wNFVuY3VDWUtIbXZvY2hs?=
 =?utf-8?B?Mkhza2NyeGFROFp6TnhWYXR6SG91NjF0Vk5LRUJwelpoS1pseklLKzhQbnNw?=
 =?utf-8?B?enp1azBjbFlQK080UkdaYXdiMVNTRThxMUVJOUpTYWlZSG9SM1F2cEZQbHlt?=
 =?utf-8?B?N0phK2I2dUpDRFNDNlhLOVE3NThGRW41bEdBZjU5ZFd4RWhUcmFCaU5lSTA3?=
 =?utf-8?B?cWdkWklrYzkzSHdqYytuNjFhT1FGL21kUm91VmYvOHlVaDNNZENzWkQ0aDE3?=
 =?utf-8?B?amJHd0p5Z1N3SDNYOXNqTmZ1SGlCSDVUSzhnRk15QW4yV3RWWmh3YUgwREZY?=
 =?utf-8?B?MWpTajFURVZRbWFtbE5BYUFLbkd1Rm5GNy9HTlQ3SVZBN2gxdHRnM29raW1K?=
 =?utf-8?B?VzhnYTU3MWphdU9seHY3dzVwUnpHNEZqaktZT1NXNkRJS1FCa2Z3ZjBMZW81?=
 =?utf-8?B?a0w2aW5adEhIckFZR0VMMGZDUTJNSzMyV05hcXlxa0J3eTZNTjlGbEtueVEz?=
 =?utf-8?B?d0Z2V1JyVGdCMFlLNmZzZG02SEk5S0RqNG9lTnIrNzV3c0NaTGd5NzRoTmpk?=
 =?utf-8?Q?vPV74s586N5GOQRQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f749ac4e-c88e-4d43-8db5-08da556f24f4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 23:21:47.7334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPAg4I+MjYti2Bzs3yJZdF4mmXgT0B3HDOESsV+JqBxHzNphe89rxncgD65w1XU8b6NOEdmTliPlloffePgybVK/3lH6B/clvsLL0GkSbrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/2022 1:32 PM, Dixit, Ashutosh wrote:
> On Fri, 10 Jun 2022 16:47:12 -0700, Vinay Belgaumkar wrote:
>> This test will validate we can achieve actual frequency of RP0. Pcode
>> grants frequencies based on what GuC is requesting. However, thermal
>> throttling can limit what is being granted. Add a test to request for
>> max, but don't fail the test if RP0 is not granted due to throttle
>> reasons.
>>
>> Also optimize the selftest by using a common run_test function to avoid
>> code duplication.
> The refactoring does change the order of operations (changing the freq vs
> spawning the spinner) but should be fine I think.
Yes, we now start the spinner outside the for loop, so that freq changes 
occur quickly. This ensures we don't mess with SLPC algorithm's history 
by frequently restarting the WL in the for loop.
>
>> Rename the "clamp" tests to vary_max_freq and vary_min_freq.
> Either is ok, but maybe "clamp" names were ok I think since they verify req
> freq is clamped at min/max.
True, though clamp usually is associated with limiting, whereas we 
actually increase the min.
>
>> v2: Fix compile warning
>>
>> Fixes 8ee2c227822e ("drm/i915/guc/slpc: Add SLPC selftest")
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/selftest_slpc.c | 323 ++++++++++++------------
>>   1 file changed, 158 insertions(+), 165 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> index b768cea5943d..099129aae9a5 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> @@ -8,6 +8,11 @@
>>   #define delay_for_h2g() usleep_range(H2G_DELAY, H2G_DELAY + 10000)
>>   #define FREQUENCY_REQ_UNIT	DIV_ROUND_CLOSEST(GT_FREQUENCY_MULTIPLIER, \
>> 						  GEN9_FREQ_SCALER)
>> +enum test_type {
>> +	VARY_MIN,
>> +	VARY_MAX,
>> +	MAX_GRANTED
>> +};
>>
>>   static int slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>   {
>> @@ -36,147 +41,120 @@ static int slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 freq)
>> 	return ret;
>>   }
>>
>> -static int live_slpc_clamp_min(void *arg)
>> +static int vary_max_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
>> +		  u32 *max_act_freq)
> Please run checkpatch, indentation seems off.
I had run it. Not sure why this wasn't caught.
>
>>   {
>> -	struct drm_i915_private *i915 = arg;
>> -	struct intel_gt *gt = to_gt(i915);
>> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>> -	struct intel_rps *rps = &gt->rps;
>> -	struct intel_engine_cs *engine;
>> -	enum intel_engine_id id;
>> -	struct igt_spinner spin;
>> +	u32 step, max_freq, req_freq;
>> +	u32 act_freq;
>> 	u32 slpc_min_freq, slpc_max_freq;
>> 	int err = 0;
>>
>> -	if (!intel_uc_uses_guc_slpc(&gt->uc))
>> -		return 0;
>> -
>> -	if (igt_spinner_init(&spin, gt))
>> -		return -ENOMEM;
>> +	slpc_min_freq = slpc->min_freq;
>> +	slpc_max_freq = slpc->rp0_freq;
> nit but we don't really need such variables since we don't change their
> values, we should just use slpc->min_freq, slpc->rp0_freq directly. I'd
> change this in all places in this patch.

I will remove it from the sub-functions, but will need to keep the one 
in the main run_test(). We should query SLPC's min and max and then 
restore that at the end of the test. It is possible that SLPC's min is 
different from platform min for certain skus.

>
>> -	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
>> -		pr_err("Could not get SLPC max freq\n");
>> -		return -EIO;
>> -	}
>> -
>> -	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
>> -		pr_err("Could not get SLPC min freq\n");
>> -		return -EIO;
> Why do we need these two function calls? Can't we just use slpc->rp0_freq
> and slpc->min_freq as we are doing in the vary_min/max_freq() functions
> above?
Same as above.
>
> Also, as mentioned below I think here we should just do:
>
>          slpc_set_max_freq(slpc, slpc->rp0_freq);
>          slpc_set_min_freq(slpc, slpc->min_freq);
>
> to restore freq to a known state before starting the test (just in case a
> previous test changed the values).
Any test that changes the frequencies should restore them as well.
>
>> -	}
>> -
>> -	if (slpc_min_freq == slpc_max_freq) {
>> -		pr_err("Min/Max are fused to the same value\n");
>> -		return -EINVAL;
> What if they are actually equal? I think basically the max/min freq test
> loops will just not be entered (so effectively the tests will just
> skip). The granted freq test will be fine. So I think we can just delete
> this if statement?
>
> (It is showing deleted above in the patch but is in the new code somewhere
> too).
Actually, we should set it to min/rp0 if this is the case. That change 
will be in a separate patch. This is needed for certain cases.
>
>> -	}
>> -
>> -	intel_gt_pm_wait_for_idle(gt);
>> -	intel_gt_pm_get(gt);
>> -	for_each_engine(engine, gt, id) {
>> -		struct i915_request *rq;
>> -		u32 step, min_freq, req_freq;
>> -		u32 act_freq, max_act_freq;
>> -
>> -		if (!intel_engine_can_store_dword(engine))
>> -			continue;
>> +	/* Go from max to min in 5 steps */
>> +	step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>> +	*max_act_freq = slpc_min_freq;
>> +	for (max_freq = slpc_max_freq; max_freq > slpc_min_freq;
>> +				max_freq -= step) {
>> +		err = slpc_set_max_freq(slpc, max_freq);
>> +		if (err)
>> +			break;
>>
>> -		/* Go from min to max in 5 steps */
>> -		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>> -		max_act_freq = slpc_min_freq;
>> -		for (min_freq = slpc_min_freq; min_freq < slpc_max_freq;
>> -					min_freq += step) {
>> -			err = slpc_set_min_freq(slpc, min_freq);
>> -			if (err)
>> -				break;
>> -
>> -			st_engine_heartbeat_disable(engine);
>> -
>> -			rq = igt_spinner_create_request(&spin,
>> -							engine->kernel_context,
>> -							MI_NOOP);
>> -			if (IS_ERR(rq)) {
>> -				err = PTR_ERR(rq);
>> -				st_engine_heartbeat_enable(engine);
>> -				break;
>> -			}
>> +		req_freq = intel_rps_read_punit_req_frequency(rps);
>>
>> -			i915_request_add(rq);
>> +		/* GuC requests freq in multiples of 50/3 MHz */
>> +		if (req_freq > (max_freq + FREQUENCY_REQ_UNIT)) {
>> +			pr_err("SWReq is %d, should be at most %d\n", req_freq,
>> +				max_freq + FREQUENCY_REQ_UNIT);
>> +			err = -EINVAL;
> Probably a nit but check can be (so should we be checking both high and low
> limits?):
> 		if (req_freq > (max_freq + FREQUENCY_REQ_UNIT) ||
> 		    req_freq < (slpc_min_freq - FREQUENCY_REQ_UNIT))
>
> Though if we do this we'd need to change the pr_err() or have two separate
> if statements. Not sure if it's worth it but thought I'll mention it.
We are looking to validate it does not cross the upper limit.
>
>> +static int vary_min_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
>> +		  u32 *max_act_freq)
>> +{
>> +	u32 step, min_freq, req_freq;
>> +	u32 act_freq;
>> +	u32 slpc_min_freq, slpc_max_freq;
>> +	int err = 0;
>>
>> -			act_freq =  intel_rps_read_actual_frequency(rps);
>> -			if (act_freq > max_act_freq)
>> -				max_act_freq = act_freq;
>> +	slpc_min_freq = slpc->min_freq;
>> +	slpc_max_freq = slpc->rp0_freq;
>>
>> -			igt_spinner_end(&spin);
>> -			st_engine_heartbeat_enable(engine);
>> -		}
>> +	/* Go from min to max in 5 steps */
>> +	step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>> +	*max_act_freq = slpc_min_freq;
>> +	for (min_freq = slpc_min_freq; min_freq < slpc_max_freq;
>> +				min_freq += step) {
>> +		err = slpc_set_min_freq(slpc, min_freq);
>> +		if (err)
>> +			break;
>>
>> -		pr_info("Max actual frequency for %s was %d\n",
>> -			engine->name, max_act_freq);
>> +		req_freq = intel_rps_read_punit_req_frequency(rps);
>>
>> -		/* Actual frequency should rise above min */
>> -		if (max_act_freq == slpc_min_freq) {
> Nit again. This check is somewhere in the new code but I think a better
> check is
>
> 		if (max_act_freq <= slpc_min_freq)
>
> just in case the act freq for whatever reason falls below
> slpc_min_freq. Even if we know this is impossible (bugs make the impossible
> possible).
sure.
>
>> -			pr_err("Actual freq did not rise above min\n");
>> +		/* GuC requests freq in multiples of 50/3 MHz */
>> +		if (req_freq < (min_freq - FREQUENCY_REQ_UNIT)) {
>> +			pr_err("SWReq is %d, should be at least %d\n", req_freq,
>> +				min_freq - FREQUENCY_REQ_UNIT);
>> 			err = -EINVAL;
> Again nit as above, but check can be:
> 		if (req_freq < (min_freq - FREQUENCY_REQ_UNIT) ||
> 		    req_freq > (slpc_max_freq + FREQUENCY_REQ_UNIT)) {
It can be higher, we want to validate lower range.
>
>> 		}
>>
>> +		act_freq =  intel_rps_read_actual_frequency(rps);
>> +		if (act_freq > *max_act_freq)
>> +			*max_act_freq = act_freq;
>> +
>> 		if (err)
>> 			break;
>> 	}
>>
>> -	/* Restore min/max frequencies */
>> -	slpc_set_max_freq(slpc, slpc_max_freq);
>> -	slpc_set_min_freq(slpc, slpc_min_freq);
>> +	return err;
>> +}
>>
>> -	if (igt_flush_test(gt->i915))
>> -		err = -EIO;
>> +static int max_granted_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps, u32 *max_act_freq)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +	u32 perf_limit_reasons;
>> +	int err = 0;
>>
>> -	intel_gt_pm_put(gt);
>> -	igt_spinner_fini(&spin);
>> -	intel_gt_pm_wait_for_idle(gt);
>> +	err = slpc_set_min_freq(slpc, slpc->rp0_freq);
>> +	if (err)
>> +		return err;
>> +
>> +	*max_act_freq =  intel_rps_read_actual_frequency(rps);
>> +	if (!(*max_act_freq == slpc->rp0_freq)) {
>> +		/* Check if there was some throttling by pcode */
>> +		perf_limit_reasons = intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS);
>> +
>> +		/* If not, this is an error */
>> +		if (perf_limit_reasons && GT0_PERF_LIMIT_REASONS_MASK) {
>> +			pr_err("Pcode did not grant max freq\n");
>> +			err = -EINVAL;
> Looks incorrect, probably something like:
> 		if (!(perf_limit_reasons & GT0_PERF_LIMIT_REASONS_MASK))
Hmm, good catch. We should flag error iff there is no throttling and act 
freq does not go to max.
>
>> +		}
>> +	}
>>
>> 	return err;
>>   }
>>
>> -static int live_slpc_clamp_max(void *arg)
>> +static int run_test(struct intel_gt *gt, int test_type)
>>   {
>> -	struct drm_i915_private *i915 = arg;
>> -	struct intel_gt *gt = to_gt(i915);
>> -	struct intel_guc_slpc *slpc;
>> -	struct intel_rps *rps;
>> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>> +	struct intel_rps *rps = &gt->rps;
>> 	struct intel_engine_cs *engine;
>> 	enum intel_engine_id id;
>> 	struct igt_spinner spin;
>> -	int err = 0;
>> 	u32 slpc_min_freq, slpc_max_freq;
>> -
>> -	slpc = &gt->uc.guc.slpc;
>> -	rps = &gt->rps;
>> +	int err = 0;
>>
>> 	if (!intel_uc_uses_guc_slpc(&gt->uc))
>> 		return 0;
>> @@ -203,69 +181,56 @@ static int live_slpc_clamp_max(void *arg)
>> 	intel_gt_pm_get(gt);
>> 	for_each_engine(engine, gt, id) {
>> 		struct i915_request *rq;
>> -		u32 max_freq, req_freq;
>> -		u32 act_freq, max_act_freq;
>> -		u32 step;
>> +		u32 max_act_freq;
>>
>> 		if (!intel_engine_can_store_dword(engine))
>> 			continue;
>>
>> -		/* Go from max to min in 5 steps */
>> -		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>> -		max_act_freq = slpc_min_freq;
>> -		for (max_freq = slpc_max_freq; max_freq > slpc_min_freq;
>> -					max_freq -= step) {
>> -			err = slpc_set_max_freq(slpc, max_freq);
>> -			if (err)
>> -				break;
>> -
>> -			st_engine_heartbeat_disable(engine);
>> -
>> -			rq = igt_spinner_create_request(&spin,
>> -							engine->kernel_context,
>> -							MI_NOOP);
>> -			if (IS_ERR(rq)) {
>> -				st_engine_heartbeat_enable(engine);
>> -				err = PTR_ERR(rq);
>> -				break;
>> -			}
>> +		st_engine_heartbeat_disable(engine);
>>
>> -			i915_request_add(rq);
>> +		rq = igt_spinner_create_request(&spin,
>> +						engine->kernel_context,
>> +						MI_NOOP);
>> +		if (IS_ERR(rq)) {
>> +			err = PTR_ERR(rq);
>> +			st_engine_heartbeat_enable(engine);
>> +			break;
>> +		}
>>
>> -			if (!igt_wait_for_spinner(&spin, rq)) {
>> -				pr_err("%s: SLPC spinner did not start\n",
>> -				       engine->name);
>> -				igt_spinner_end(&spin);
>> -				st_engine_heartbeat_enable(engine);
>> -				intel_gt_set_wedged(engine->gt);
>> -				err = -EIO;
>> -				break;
>> -			}
>> +		i915_request_add(rq);
>> +
>> +		if (!igt_wait_for_spinner(&spin, rq)) {
>> +			pr_err("%s: Spinner did not start\n",
>> +			       engine->name);
>> +			igt_spinner_end(&spin);
>> +			st_engine_heartbeat_enable(engine);
>> +			intel_gt_set_wedged(engine->gt);
>> +			err = -EIO;
>> +			break;
>> +		}
>>
>> -			delay_for_h2g();
>> +		switch (test_type) {
>>
>> -			/* Verify that SWREQ indeed was set to specific value */
>> -			req_freq = intel_rps_read_punit_req_frequency(rps);
>> +		case VARY_MIN:
>> +			err = vary_min_freq(slpc, rps, &max_act_freq);
>> +			break;
>> +
>> +		case VARY_MAX:
>> +			err = vary_max_freq(slpc, rps, &max_act_freq);
>> +			break;
>>
>> -			/* GuC requests freq in multiples of 50/3 MHz */
>> -			if (req_freq > (max_freq + FREQUENCY_REQ_UNIT)) {
>> -				pr_err("SWReq is %d, should be at most %d\n", req_freq,
>> -				       max_freq + FREQUENCY_REQ_UNIT);
>> +		case MAX_GRANTED:
>> +			/* Media engines have a different RP0 */
>> +			if ((engine->class == VIDEO_DECODE_CLASS) ||
>> +			    (engine->class == VIDEO_ENHANCEMENT_CLASS)) {
>> 				igt_spinner_end(&spin);
>> 				st_engine_heartbeat_enable(engine);
>> -				err = -EINVAL;
>> -				break;
>> +				err = 0;
>> +				continue;
> I think it's preferable to move this media engine code out of the main loop
> into max_granted_freq() function if possible (maybe by faking max_act_freq
> if needed)?
All the engine related info is here. I will need to pass it to the 
max_granted_freq() function. Also, faking the act_freq probably 
overkill. I can add a fixme here instead to update when we have a 
reliable way to obtain media RP0 instead.
>
>> 			}
>>
>> -			act_freq =  intel_rps_read_actual_frequency(rps);
>> -			if (act_freq > max_act_freq)
>> -				max_act_freq = act_freq;
>> -
>> -			st_engine_heartbeat_enable(engine);
>> -			igt_spinner_end(&spin);
>> -
>> -			if (err)
>> -				break;
>> +			err = max_granted_freq(slpc, rps, &max_act_freq);
>> +			break;
>> 		}
>>
>> 		pr_info("Max actual frequency for %s was %d\n",
>> @@ -277,31 +242,59 @@ static int live_slpc_clamp_max(void *arg)
>> 			err = -EINVAL;
>> 		}
>>
>> -		if (igt_flush_test(gt->i915)) {
>> -			err = -EIO;
>> -			break;
>> -		}
>> +		igt_spinner_end(&spin);
>> +		st_engine_heartbeat_enable(engine);
>>
>> 		if (err)
>> 			break;
>> 	}
>>
>> -	/* Restore min/max freq */
>> +	/* Restore min/max frequencies */
>> 	slpc_set_max_freq(slpc, slpc_max_freq);
>> 	slpc_set_min_freq(slpc, slpc_min_freq);
> As mentioned above maybe we should restore at the beginning of the test too
> (before the for_each_engine() loop) to start from a known state?
>
> Anyway here maybe get rid of the variables and:

This is restoring whatever frequencies SLPC was running with initially. 
Regarding resetting the frequencies to min for every engine loop 
iteration, we are already iterating from min->max inside the for loop, 
so will be duplication.

Thanks for the detailed review,

Vinay.

>
>          slpc_set_max_freq(slpc, slpc->rp0_freq);
>          slpc_set_min_freq(slpc, slpc->min_freq);
>
> Thanks.
> --
> Ashutosh
