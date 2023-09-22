Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04B97AB233
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 14:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078CE10E65A;
	Fri, 22 Sep 2023 12:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1B10E65A;
 Fri, 22 Sep 2023 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695386030; x=1726922030;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IB5+DG+IU21vWmVIlnRhy971YbxkosKK8KycYL7OEP0=;
 b=j7aLNhFFLq/vLZ7Qyx5HR6SMjxy39sTC8EOCaYGx7MH+WMlpUwIAt3Dr
 l5X9nR2mFZmcHglAeQmAUNqHTIn6E7Fd4wghoz30qwGlsa0pNq5B2SCWk
 Sa4tV88fzjzcQXpj0QI2ztB0m2bRIgZ2MWQDiXanPEbX1/T1RGPbaLrB5
 p6hEoS8V2sTmx0d50u3Cr7cpUhXAu2tSVw+LGUtbDoS1XOkVojKN5DKWa
 DLhZt3UJh+tLBNpPqtX+tGEvrNhxEamzOHGNZDjAgxdpikjN+yN/2AhMQ
 wADU4sITgb5ZIuJ3kquU7sj6IbgxgMNqGzSYD1x8QaY1IIkmAWyHRQVpj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360196735"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="360196735"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 05:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="890799824"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="890799824"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 05:32:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 05:33:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 05:33:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 05:33:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtTnne59sOpLqGgyVtq608ZqGDBQGL/PNUbu4vnBBYFgSRZecwT6I2/STzkPBhrTtOdygdLVYtvAKvuSX9r5tBc1hP/qVe58gBhJ9Xz7p1B10uZwMkyhKbqvwHYSG9kKFaLpClImKhnrnB7I3+Fs/xlDO6iuSN4mwrvWpKtD3f1v+llVB77m1Tk0CX3cdVvp94hTg6SeK5NkTPIicOrdlur0veSIlN5yoH5+1nXoC2/g0y/svNwHi/ZjfQfFzt9ImVEjp+RbLxPeL8hlkLGFd3oFKC92wKBqvlcYL0ALNfqyUrUqrzP+A14obU/a9i5+taFAsPzWf2oBRuPwi2zoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA/OjEtKuUCA5UPrcrISrXbmt3otHH0oy9uGwUdbJ2Q=;
 b=eecLAqgI8O1m5tL/HUlikk1dr34UpHAHqt1TTZdySfHmJfVPXfudCtEpWI9wgnZvhCFd9UMIs0/r7ceV44BBWvM9/k1v4Rp3lwEDW/5gDvNekAQm4KD282o3Nbpl7IRzQJzYAHW+1MIVVY5VPDxqwf62S7GFC3tM2AbbbMaMdvkgOWP1fTrjl5KVjWxkJQ8T6iG1Fic+KwPb/5GRzNpIP270fQ37MLrsdsIAp9/PO9Ff8cgTF5HOCARePE5MfWLcP7bzWSVcC2ZwdFmthmqWm3NepA7JNyjunV4OaLF4E4SDHK9t7fW1vQuDLuJAkJP95lQ/MBMnhS8BmHI/JRNqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SJ0PR11MB8271.namprd11.prod.outlook.com (2603:10b6:a03:47a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 22 Sep
 2023 12:33:47 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283%5]) with mapi id 15.20.6813.024; Fri, 22 Sep 2023
 12:33:47 +0000
Message-ID: <8a8277a6-ef85-503f-8df4-34e9b01e727f@intel.com>
Date: Fri, 22 Sep 2023 18:03:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH 5/5] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
 <20230921114852.192862-6-tvrtko.ursulin@linux.intel.com>
 <652f7064-2523-f810-3075-d66196fc42e2@intel.com>
 <31738ef5-c207-bd20-8405-64bdc97bcfbe@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <31738ef5-c207-bd20-8405-64bdc97bcfbe@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::13) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SJ0PR11MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d43b7d7-9ba9-4d4e-6acf-08dbbb682aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +e2DX/DGBNPD0drdfXaKg17o6o8pyjZoYS0SVQjyEB1s/t10mNFxLh2LxQSvepBqtCaTLFIWZJYwdTtFR0oDKbRw3VWzyEONci45A7NImlVStijyZEkq7GFFLyyuskkJmlyq6z9tjEbL8nL6Rg+8NzrfJ3Gvi2h7XhIZLa02Pov7tERq6ZoB1Pkt0BMS6ElTIJzaNK9uQIBSSK28FR3pP4k70Ry2Xi9rmJmQDfWLeZce+9uqaMD/+neNs3QkY3rkCW8BQTXnRLJ52tWECaCizYyS7zi/7Bt6iO//aaNI1+zA9ogGPAJSNmLe05oyA3zFT+/OahxNjIOfPRdeGwjSVSJlPauPhyODIQuAxbf2MaV93Wo9EYdmudf28BpsQxz8nGO26M1IAkDxbehrpTvklEKsXWF93s9R/hQRgmxsJnDg95NSgnJQloDzTOYR3Tj51RoGu18c6hcxssVNhrZvyYRdVKgBcMqfOYbMDTLj/o7ea0lP/KFkt+tVt35dYcApHigKnAnqixqn34QF15RPZ8CpJk4DZVEdvsAZ61vv/cHai6SPCxAEimrsom7gmiOftacgH2BUBdMNlXJO+xe9NMNGYbRkZ0QaTiAmnTugia3cTuLEuAlvrbVcBmvgeL7y2naojXxFZNuAOQB7IdAL6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(1800799009)(451199024)(186009)(478600001)(38100700002)(54906003)(66476007)(66556008)(41300700001)(66946007)(26005)(6512007)(2616005)(82960400001)(6666004)(316002)(53546011)(6506007)(6486002)(5660300002)(8676002)(8936002)(4326008)(31686004)(86362001)(31696002)(2906002)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWNCcXFWU3FOMHZMS09CaFY4WjhIWTBPMllKYjdGSi9UZzJyYWpjcFpVbUVS?=
 =?utf-8?B?dDNrSmxubTdmRjhLSkVQeGlNb05BVWZDNXJjRmJ4MVpRMlhvZG1PNTRiWEEw?=
 =?utf-8?B?MDFYN09oaVl3c2YrYUE3eXI0eXZXWGU2ai9FMWtOd3FkZUM0OVoyeXRSVExr?=
 =?utf-8?B?T1l1QkNUZFlXSURZTjVjdHhYQUlrN3h4TUlFUU1lVHZyNFRYalh2OWh1ZWwz?=
 =?utf-8?B?YlVFVHd0emQ1NmVpdDVTTlZtT3hqaEZ6TE9EUDMwNzh2UU5WbFZWdVFxTEZx?=
 =?utf-8?B?cXdhR2lFSDFvYVlPM3F5eEV6QzBIYTVlb2ozYzIwLzdhbUM4WkV5SitvZXAx?=
 =?utf-8?B?dWhsUUhoY0srYUs4Y2FuaFdaMXpsYUNMUzBMNVpWZmpSY1ZXakdEN1N5a0NW?=
 =?utf-8?B?N1NwL1F1RUp0WTkzak1vTmgxbURFUEp2cSswRld3WDhCV3F4MUhDbjVZajZW?=
 =?utf-8?B?MnplWmJBUmxXZGw2dzlmbnVGaTVPSW85anA0MEV3TWRCSFFVb0VlZ1hZMWVn?=
 =?utf-8?B?aVhmUHIwbWxpK2dpMDhwbW91YmNQNmszY01LZTlNSW45NWFMdldEeHFiSW82?=
 =?utf-8?B?T2JMM1pSaTg3OVJrbUZhT1FrSGRTaEJ1ZFZFdHV5Z1lWK3lmOVRYelNCZXZO?=
 =?utf-8?B?ZDRQS1JBOFdoVFhvSW04dFM0Z3NMbldOWmV4ZklKQ1IrN2U1UW85YzU0dGEw?=
 =?utf-8?B?bGptaVpwZHNHZU5EWktHL1RjczRYa3ptbXhmRUdxT0UzK3huWTA1T0JWcGlQ?=
 =?utf-8?B?MmN6MDRsRkt6QmlWbkVzcFl3S2pxSkNFU2hkVVArajNyNlFmNGJSTDM1M1lO?=
 =?utf-8?B?aDRob0pNZTlhdmhnY1ZuOWlsRll3YXN5clg5MkZCaEZ0di9KZUdDUUJzUW53?=
 =?utf-8?B?SGhBdGVoSVBRSHk3Um9PcnVvSkFjOE5HNFZhYUZ3Y1lUbmpaZlpPYkxTc2lV?=
 =?utf-8?B?QnBuQlMxRXNIczNkZmdyajRDUVhoV2RyYUdzZnFQNmowTVp2QmlBUkdaYUpZ?=
 =?utf-8?B?RWxNU3ZFblhEZXNnLzdkbFpwMU1NUEN5eEY5SzZTK2lHd0VpQXViSUdyd3RR?=
 =?utf-8?B?eGoxbGc4UDg2T0tjYzJkRXRpSTRMRTExdXMxa2Q4UzlLM09XMXRGaW9oaWZn?=
 =?utf-8?B?YXlJZFY3cUYwR3JNeGE2VDBTdWlGcDNBZEZoNGhDb0QrK2NOSGdyREc1RUdm?=
 =?utf-8?B?NFVtaVhsR2FRNEV0R05FcEhQUm5BNkdZV2VTODRRTTNra3d0bzBCQW9XL09W?=
 =?utf-8?B?TlpKVVdBOGZQZDVXQzFVNXUzMTByRGt5Mk43cGNMNjlpZ05BVVNYTU9uSjZ0?=
 =?utf-8?B?dnhvVEYyeXovM0txdHFnOVRXSGttWU1YZkNHWHM5bEtjaUNuSnpDc1VoQ2xR?=
 =?utf-8?B?M3VOZ1UxTVRvMXM0dUx6K2s5YVZOMkNLUmhXVXJhcG0vU0RQMkh5K0FSN1l0?=
 =?utf-8?B?Z1ZOU2hYblZmZXdmYXVnT08xRGU1REZadmtTYWJpQkVTc1FuTTJwWi9Ia2Ew?=
 =?utf-8?B?RGhtUUNmeTNKY2wwYzV3eEpwaG1TamRRSGJ3UFhVKzRhOTNYZFdxaSttKzJq?=
 =?utf-8?B?Y2hKQjlMMXFjSGVmVWNjN1VNdnR6NktDQlRGWjdVVE56NzN3cE0wNTJmcE1P?=
 =?utf-8?B?RGM0VW56YVZZbzVjWnFIaEhITjZsQ2xwemJpaStkcVRNRGUyaTNRaGpWVHc0?=
 =?utf-8?B?TkNsRE0xdldEU0toN0ZGdVg3Tng1UWF5ZER2T2x6MXN4aTNjbURMM0ZiamYx?=
 =?utf-8?B?VEpPeHY5ak40S3dSc3dmNXNIWHQxNWFxekhwUTNLZC9paXZOZUI5bXcxVkxW?=
 =?utf-8?B?aUpMYlpla1R6WkNhQmxHZFhCYmgyblI2a0t6L3RJbWFBOTBOU2xXZ0Z6Y3Mz?=
 =?utf-8?B?UzhlUWd2czhZN0hyT24xdUNnVWtXQnIzb3pBRGdPZXJJL3MvaGJmQy9EVHFP?=
 =?utf-8?B?OXdpQzNPTTZ5dTdsRkoyc2ppSXZJMk9WR042Vlg1NUN1YlFkSFZzK3g4WVBM?=
 =?utf-8?B?ZVlxWkhVR1FkQ2dRWXNtUU0vb0IrQmV1QWwwOUVYV1B2VEZJMFBJOFlOaFJN?=
 =?utf-8?B?eDhjNFBCTGNNeHY0UEFENHJDZnFYR0ZVNnNuL3hLckpjUGo3RWkrT0N2TlNR?=
 =?utf-8?B?MTZuWkpBRTNMa0JXZGtzMkIzdVUrUnZjMnBTUjd5d1JPSHdRVEErK3NaTW45?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d43b7d7-9ba9-4d4e-6acf-08dbbb682aa1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 12:33:47.2781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJh7ql7n8ENK4s9jH/3rFMlbIoQsB5IXob3w8JLT75gz45zZiZ0+Vixb3HnTpKEjiBlHCdyvT3yUfMwhCxoQSW7Qqm4EbS8Ts9gNNQV6G3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
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
Cc: Tejas
 Upadhyay <tejas.upadhyay@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22-09-2023 16:27, Tvrtko Ursulin wrote:
> 
> On 22/09/2023 09:48, Iddamsetty, Aravind wrote:
>>
>>
>> On 21-09-2023 17:18, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Use the newly added drm_print_memory_stats helper to show memory
>>> utilisation of our objects in drm/driver specific fdinfo output.
>>>
>>> To collect the stats we walk the per memory regions object lists
>>> and accumulate object size into the respective drm_memory_stats
>>> categories.
>>>
>>> Objects with multiple possible placements are reported in multiple
>>> regions for total and shared sizes, while other categories are
>>
>> I guess you forgot to correct this.
> 
> Ah yes, will fix.
> 
>>
>>> counted only for the currently active region.
>>>
>>> v2:
>>>   * Only account against the active region.
>>>   * Use DMA_RESV_USAGE_BOOKKEEP when testing for active. (Tejas)
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> # v1
>>> ---
>>>   drivers/gpu/drm/i915/i915_drm_client.c | 64 ++++++++++++++++++++++++++
>>>   1 file changed, 64 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
>>> b/drivers/gpu/drm/i915/i915_drm_client.c
>>> index a61356012df8..94abc2fb2ea6 100644
>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>>> @@ -45,6 +45,68 @@ void __i915_drm_client_free(struct kref *kref)
>>>   }
>>>     #ifdef CONFIG_PROC_FS
>>> +static void
>>> +obj_meminfo(struct drm_i915_gem_object *obj,
>>> +        struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
>>> +{
>>> +    const enum intel_region_id id = obj->mm.region ?
>>> +                    obj->mm.region->id : INTEL_REGION_SMEM;
>>> +    const u64 sz = obj->base.size;
>>> +
>>> +    if (obj->base.handle_count > 1)
>>> +        stats[id].shared += sz;
>>> +    else
>>> +        stats[id].private += sz;
>>> +
>>> +    if (i915_gem_object_has_pages(obj)) {
>>> +        stats[id].resident += sz;
>>> +
>>> +        if (!dma_resv_test_signaled(obj->base.resv,
>>> +                        DMA_RESV_USAGE_BOOKKEEP))
>>> +            stats[id].active += sz;
>>> +        else if (i915_gem_object_is_shrinkable(obj) &&
>>> +             obj->mm.madv == I915_MADV_DONTNEED)
>>> +            stats[id].purgeable += sz;
>>> +    }
>>> +}
>>> +
>>> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>> +{
>>> +    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
>>> +    struct drm_i915_file_private *fpriv = file->driver_priv;
>>> +    struct i915_drm_client *client = fpriv->client;
>>> +    struct drm_i915_private *i915 = fpriv->i915;
>>> +    struct drm_i915_gem_object *obj;
>>> +    struct intel_memory_region *mr;
>>> +    struct list_head *pos;
>>> +    unsigned int id;
>>> +
>>> +    /* Public objects. */
>>> +    spin_lock(&file->table_lock);
>>> +    idr_for_each_entry(&file->object_idr, obj, id)
>>> +        obj_meminfo(obj, stats);
>>> +    spin_unlock(&file->table_lock);
>>> +
>>> +    /* Internal objects. */
>>> +    rcu_read_lock();
>>> +    list_for_each_rcu(pos, &client->objects_list) {
>>> +        obj = i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
>>> +                             client_link));
>>> +        if (!obj)
>>> +            continue;
>>> +        obj_meminfo(obj, stats);
>>> +        i915_gem_object_put(obj);
>>> +    }
>>> +    rcu_read_unlock();
>>> +
>>> +    for_each_memory_region(mr, i915, id)
>>> +        drm_print_memory_stats(p,
>>> +                       &stats[id],
>>> +                       DRM_GEM_OBJECT_RESIDENT |
>>> +                       DRM_GEM_OBJECT_PURGEABLE,
>>> +                       mr->name);
>>> +}
>>> +
>>>   static const char * const uabi_class_names[] = {
>>>       [I915_ENGINE_CLASS_RENDER] = "render",
>>>       [I915_ENGINE_CLASS_COPY] = "copy",
>>> @@ -106,6 +168,8 @@ void i915_drm_client_fdinfo(struct drm_printer
>>> *p, struct drm_file *file)
>>>        *
>>> ******************************************************************
>>>        */
>>>   +    show_meminfo(p, file);
>>> +
>>>       if (GRAPHICS_VER(i915) < 8)
>>>           return;
>>>   
>>
>> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> Thank you! Would you be able to also look at the IGTs I posted yesterday?

Ya sure will take a look.

Thanks,
Aravind.
> 
> Regards,
> 
> Tvrtko
