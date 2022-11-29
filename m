Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998663BEE2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8A110E04F;
	Tue, 29 Nov 2022 11:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029A910E04F;
 Tue, 29 Nov 2022 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669721118; x=1701257118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3aDXtytgM1YkV4VXC3zdrYVUcbWQkrmp2iQnjej288Q=;
 b=WePxGBQfliUYgYX7RWSOXjDqNVOSFZF31M14zu65AJIR3C3rRlARokPG
 1Ov6wPp76FVjj51zJcZt3dIcbfXuT9LemgYFKkcILX9snS46byqGmVNxz
 ouLCMGip3U/ZkNkKhzC8SYK2Ii6AChkW6q+5VMz+08KQkQu/vOODCx6RV
 ghZXd5ThrU6mwdHRfwWafsGhzrnBCiwAxUlzJcOjOyh+pyjum/J1vf2rQ
 cBkQ66mhonDjS0WX5ye15I4MvrvMWaP7xwdeNBnfeOnhYr6OmpiPKblvN
 xgw/vZvfXSin1yHohLAI+zN20r/s1s6jZS1rEI3t0TIjXmvPwEASRKBgs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="302673745"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="302673745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 03:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="643748641"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="643748641"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 29 Nov 2022 03:25:17 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 03:25:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 03:25:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 03:25:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 03:25:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeVBCqhiaVqQ5EXTp7E8M12xvA4LmxSLCD4a0pny/W0Iw/ZlFdwTlk9rERjVfgFIQdw+zFL1oLIESLf82tJpfdOEDWVVa4jhwKE4mttbcbpyU4En6ydgyTxS+4KXFy3NCqcb2kxMVE5wRteHHACKfvee7q3Fw5kYhRQjPFXl4ejh/7cOWZyxQbbKHzFKEkyBNV+UeqfKrcaffZm+ID/riA18Kh+OiQK241dWmzYW4YeyYlJ0zCAq8gTDmlrcSQSen+DxMgsphwpMeUNK5aq2+QFMvht88yux/U4/hQ4YeZ/4fsD83Q+rdNoNpSrfFF8cul/SPXWe9Alf3CDL4UWZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyxP8GFnS3UrziLamUbNGlojqkUY2bLXb/AOVpTIbR4=;
 b=FuGLbnukrl18RfgU7QguGJ9i02wh94QkbM+zK9Qjmg4Mk5Mg2b3CYhD9LPsYLA27nJWek8QQx4amy0KMWog3F4k6OHN1MGC833zQSr+NRTvGeOt0U/gT3soCNo3E9P4qk9tEs1CayriSTDA/4FFDGAfvOY1Jdt442/hca4oq4UFgnzkiItgkm5vWODeEKHhU00N4NJ3PLnyQA2MsszHfRqbNfmDDAEsvb6GcgglH7+rUv5tjYEOVDoRJX3iBraItzIMgIbGqcE656CIiYKaCtR8QrTYTrDYXHjPK4JLHq7g/KWPsZhvAKWNOAt8PL5RW3yI1DIJyaI+r5weD50l5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MN2PR11MB4565.namprd11.prod.outlook.com (2603:10b6:208:26a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 11:25:14 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::91d7:def6:dd3b:3bbd%8]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 11:25:14 +0000
Message-ID: <0305bca9-1424-9120-b5d9-53f418152e23@intel.com>
Date: Tue, 29 Nov 2022 16:55:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/mtl: Media GT and Render GT share
 common GGTT
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221122070126.4813-1-aravind.iddamsetty@intel.com>
 <f2c26394-ee62-6a67-0b3f-877426ce35e4@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <f2c26394-ee62-6a67-0b3f-877426ce35e4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::20) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MN2PR11MB4565:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddfc60b-84d3-40d4-bd8a-08dad1fc626a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cvw+6WSkiRIXcnvAVUVNht6MtuYAfybRsgwa1EU/a/17NY1hQaW4HhvuPH+4RTE2eQ4+lCS/aUmS2DirRMfrymksGGDcrJsrXLmj6YiXkGAQu6lpla0jqQZg+4RmHWFNz4BqVtnF2U3AtFVOUC7thJxZOfme8aCTUx5Y4cpm7ojhaTtEoKwFfSaORix6lmwWBWKUWFo55YFiY4eCe4eh2bjrWPB+RUEJQuUkQenmKDLm5HolKZNtc0DBnB3MPGXjhdGqcDxDxFelvTNaJHdVkc6o7GaTeijU20cY/UyQsmkv+5rm0mAJYTsyM9dRb2aBa6QqcuaN+/Wkk0YOYry6FPfr7EdbecM+BFljeMNU2kUffw+wrKxkcoem1ZO8uuMvdhA4GMxNbM01Q5mWdErdDW4rnvX//FxcLw1mUOgURf++LXdFK5bxlMCcITuXWsASMFiMJg/wcfdTfejGsu84Td4eAr2828DEzTX25WNCR9YVaJhN9MbEhtFVBA12OJ2tNCdnp53cDNheCZEZGY5rkEk5eV3bP3CgkqWnRWswVsefjJBPUp/nukGcCAePuE795XpuKprwvzkY3pVhLYiYoNgNYG3BjIIER2h6LtaC9gAE1wGeIKBPK+M1tSgebnYg39Rz5Jaae1t97/R2PjK98PN3Pd0Iw9oYvu34hk3/e4TACpscGTsSbhCYtcqsQC+YuzdLUvEPzs5E4QoiVVT2quremdo2L67Z4ecirjWu8r8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199015)(2906002)(30864003)(31686004)(66899015)(41300700001)(4326008)(66476007)(66556008)(186003)(8676002)(36756003)(316002)(8936002)(5660300002)(26005)(6512007)(478600001)(86362001)(6486002)(2616005)(6666004)(66946007)(31696002)(6506007)(53546011)(55236004)(83380400001)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1JtWEVpSHMrQnJvbUN5MkpNb0M2MUNTZlFoQjNpNWV0LzNYU2t1T2l1MWox?=
 =?utf-8?B?cU5qdmlQSm1Bb2FwVTdwazRncjFxaEROT0FtYm1RN29KNFRXNXRtQ29HdG8z?=
 =?utf-8?B?K1VZd3VQSkVRUWVETU4raXRRdlA2WWw0U0x2K2Q3N2hUMnU3SlQzNEM3ZDBE?=
 =?utf-8?B?UVc2cE4zZjVMZ3Z5dEZoY05ZbmxtOWRVTzhNVmUwTjJkN2labjZMdEJZMUxV?=
 =?utf-8?B?bFd0cVljMDQwc3liWjNHeWcvWlBOWXV5UmhuSkVjMnBVYSsvcTJZczRDMlJE?=
 =?utf-8?B?S2JpZjQyVmZ2eEdrQ1BIMUJKZHZlV2ZnUW1hSlQvMU0vME1xQThlK0ZwNGsr?=
 =?utf-8?B?WXlMNXJQb1NxWTZmL284Y2c1LzhZVEVHZGZDOHJ0TytLd2xJY09pOUNXS3Nr?=
 =?utf-8?B?V3FEMUN1dWs3ZmhkYnYvUDk1SVNTVzBrbTU0TXF5UGlQNVhya1JGbkFDWURm?=
 =?utf-8?B?a25BeFc2a0o4SGRzZHJRTjVCUVpMcUoyclpVTkhOV3o4eGJlaU9lR3k5T3Y0?=
 =?utf-8?B?eW1CVENtUndxUThiQkJPdUlLRFNqQTZUWklJVXhoa0NpVE1BNVhHMXE5SVov?=
 =?utf-8?B?SU1saE5rVVIzYWRtSHNMdE5TV0ZtdUI0Q1c5Y2tQbWM4NTZ5MDBrcDlsbENN?=
 =?utf-8?B?b2t1WnlLd256OW1HQ0tQNVBDcUVQWDdwaDhBNFZtN0FZMndjUlhwOHRqOGc0?=
 =?utf-8?B?T2UrU09RZGx1aDVSMlpTZzE1eDdXZ1F3YnNtSzhJQTRhWjRSdGROQlNxYmRF?=
 =?utf-8?B?dnZVbmo3OGl2cC9KUlVDZ2dmdHlvZkt1MVZ6Q01jd2cvcnNiR1BlQWZmVmY4?=
 =?utf-8?B?SW9uY0YrbXdZNitLR3Bma3luaGg0WldWQXovd3hYYWNiNEJPOUdYMlVyOHA2?=
 =?utf-8?B?ZXZ0a2dzRmJORFlFRlNWQnY4RlFkQytPSzUwWlc3TmZRVm5tbWQ4cTFySmJh?=
 =?utf-8?B?T1ljaWVWcFFkeUkzYmEzbTlkK1FhaUNMUG4ybVl3ZndneVB0bnNNalQ0bGxu?=
 =?utf-8?B?ZmQzZUtXcks2MHo0K0JENEI2c2NBaE5FekM2S3JVb1A1V2h0bHV2N3U2NW5S?=
 =?utf-8?B?UEV4RjVjekpjWnBFRUlwVUplVTBsbTNiNWRuYnVDWEFGUW83YVlmOVlwcEpa?=
 =?utf-8?B?N2tzSHROL2xGZHQ2WkMvRHlHckJXaHMzYUl1S21vcmZUaC9GNVpDS0hrdTNu?=
 =?utf-8?B?eDBLaGhpRzdxRUxORkRYWkpmajBvZGJlZnV5SEkwSWNPN1J0UFZFTUdyUGtH?=
 =?utf-8?B?M1V2VTRLaTR3V3VUM1NDSlgwcWZ0WVNuMHRsdU1MWXFYWHVNRElOZFVONytx?=
 =?utf-8?B?UmJGUkpPOWZRZmJ4cDJUOEtOeGRiMmdvUm1ZamZ0ZEE2Zk53OVJEYTFGb0R4?=
 =?utf-8?B?RWpvNENzWXVHY2MyekwyWDhkK2hyRU9uaktKVCs0UmFJMDRSMTJFVDNTVkxx?=
 =?utf-8?B?NXVSZkpET0t1RXdUR05XSlZ0TEx0NTBOM2xRakJuWW1EMW5mbWlYb2QrOFgx?=
 =?utf-8?B?eWdyVmY5WCtVZHNFYjFFSGFkRVRJMDVKNUtRbUJockdGNDlWUXJnTUI2UzJQ?=
 =?utf-8?B?WjJLSUR4QnJWblgzUUJsbVg5WVJYWVdMM09DelhkdW9ic2NLK2xFM2RyU0Zp?=
 =?utf-8?B?Rmk1VlZZNG5oUUF0V1V0ekh3WS8wTDI2SUdGb21SUGhvbXpWaHNoWVNDMkN4?=
 =?utf-8?B?Q1gzNUM4TC9ibjFCRjh5cXQ0SFZWanlpYUsvZWRsSVZsOFllbkgxMFB3dU8y?=
 =?utf-8?B?cC9mUG9zWExkc0Z6RHl5WmJWTVJUZldPRmxBb3R5dHNBOXdRRll1SmFrNUhx?=
 =?utf-8?B?R25rSTNtNFovQ25USjBUUnpVb25EZjc5VnZTSEdKWGNyNFhHYnJQbU9MNisv?=
 =?utf-8?B?Z2pNSWdCTDRjbmFPc2VVWnFMeDlId0hjd0xvTXoxYXMxT3VzUWtWSEJDZUM1?=
 =?utf-8?B?SG5wTHMwWkpnWTN6UVVDVDVsR1ducHc2bXhZTFZFa3R3NVMrRzlObGovT0RX?=
 =?utf-8?B?aXlpeXlEL2gwNEovZzA0NURzbTduYkxxQkhVQk9DMG9yNHdVUElhMEMwT1dS?=
 =?utf-8?B?eFpGOVZBankyTW02Z0pQR3V0OHJuWDlTK3pjMEJsb3lPYnRMVjJUeHUwaW9T?=
 =?utf-8?B?OGlxMGg2WkI0dTE2NHdYWGx1OGYzclJhUUdwazJUOHNWeE9aZkQ5bTYzcmNk?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddfc60b-84d3-40d4-bd8a-08dad1fc626a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 11:25:14.1191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+gdV/XuODMc3tvrrUTdRaI96U/3gRx2Ru7SD4VXQDN/gmq9JSPsbMlXdOO4ClCpj58HHjHviV4p5Ww4gizcpO0+0492iuyN2wy5915nafA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4565
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



On 29-11-2022 15:41, Tvrtko Ursulin wrote:
> 
> On 22/11/2022 07:01, Aravind Iddamsetty wrote:
>> On XE_LPM+ platforms the media engines are carved out into a separate
>> GT but have a common GGTMMADR address range which essentially makes
>> the GGTT address space to be shared between media and render GT. As a
>> result any updates in GGTT shall invalidate TLB of GTs sharing it and
>> similarly any operation on GGTT requiring an action on a GT will have to
>> involve all GTs sharing it. setup_private_pat was being done on a per
>> GGTT based as that doesn't touch any GGTT structures moved it to per GT
>> based.
>>
>> BSPEC: 63834
>>
>> v2:
>> 1. Add details to commit msg
>> 2. includes fix for failure to add item to ggtt->gt_list, as suggested
>> by Lucas
>> 3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
>> it.
>> 4. setup_private_pat moved out of intel_gt_tiles_init
>>
>> v3:
>> 1. Move out for_each_gt from i915_driver.c (Jani Nikula)
>>
>> v4: drop using RCU primitives on ggtt->gt_list as it is not an RCU list
>> (Matt Roper)
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
>>   drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
>>   drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>>   drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
>>   drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
>>   drivers/gpu/drm/i915/i915_gem.c           |  2 +
>>   drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
>>   drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
>>   drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>>   9 files changed, 111 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 8145851ad23d..7644738b9cdb 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/types.h>
>>   #include <linux/stop_machine.h>
>>   +#include <drm/drm_managed.h>
>>   #include <drm/i915_drm.h>
>>   #include <drm/intel-gtt.h>
>>   @@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct
>> i915_address_space *vm)
>>     void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>>   {
>> +    struct intel_gt *gt;
>> +
>>       i915_ggtt_suspend_vm(&ggtt->vm);
>>       ggtt->invalidate(ggtt);
>>   -    intel_gt_check_and_clear_faults(ggtt->vm.gt);
>> +    list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +        intel_gt_check_and_clear_faults(gt);
>>   }
>>     void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>> @@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct
>> i915_ggtt *ggtt)
>>     static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>>   {
>> -    struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>       struct drm_i915_private *i915 = ggtt->vm.i915;
>>         gen8_ggtt_invalidate(ggtt);
>>   -    if (GRAPHICS_VER(i915) >= 12)
>> -        intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
>> -                      GEN12_GUC_TLB_INV_CR_INVALIDATE);
>> -    else
>> -        intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>> +    if (GRAPHICS_VER(i915) >= 12) {
>> +        struct intel_gt *gt;
>> +
>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +            intel_uncore_write_fw(gt->uncore,
>> +                          GEN12_GUC_TLB_INV_CR,
>> +                          GEN12_GUC_TLB_INV_CR_INVALIDATE);
>> +    } else {
>> +        intel_uncore_write_fw(ggtt->vm.gt->uncore,
>> +                      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
>> +    }
>>   }
>>     u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>> @@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>         ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>>   -    setup_private_pat(ggtt->vm.gt);
>> -
>>       return ggtt_probe_common(ggtt, size);
>>   }
>>   @@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt
>> *ggtt, struct intel_gt *gt)
>>    */
>>   int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>>   {
>> -    int ret;
>> +    struct intel_gt *gt;
>> +    int ret, i;
>> +
>> +    for_each_gt(gt, i915, i) {
>> +        ret = intel_gt_assign_ggtt(gt);
>> +        if (ret)
>> +            return ret;
>> +    }
>>         ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>>       if (ret)
>> @@ -1208,6 +1222,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private
>> *i915)
>>       return 0;
>>   }
>>   +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
>> +{
>> +    struct i915_ggtt *ggtt;
>> +
>> +    ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
>> +    if (!ggtt)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    INIT_LIST_HEAD(&ggtt->gt_list);
>> +
>> +    return ggtt;
>> +}
>> +
>>   int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>>   {
>>       if (GRAPHICS_VER(i915) < 6)
>> @@ -1296,9 +1323,11 @@ bool i915_ggtt_resume_vm(struct
>> i915_address_space *vm)
>>     void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>   {
>> +    struct intel_gt *gt;
>>       bool flush;
>>   -    intel_gt_check_and_clear_faults(ggtt->vm.gt);
>> +    list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +        intel_gt_check_and_clear_faults(gt);
>>         flush = i915_ggtt_resume_vm(&ggtt->vm);
>>   @@ -1307,9 +1336,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>       if (flush)
>>           wbinvd_on_all_cpus();
>>   -    if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
>> -        setup_private_pat(ggtt->vm.gt);
> 
> Moving this really should have been a separate patch.
> 
>> -
>>       intel_ggtt_restore_fences(ggtt);
>>   }
>>   diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index b5ad9caa5537..b03788d7674e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -110,9 +110,18 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>>     int intel_gt_assign_ggtt(struct intel_gt *gt)
>>   {
>> -    gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt),
>> GFP_KERNEL);
>> +    /* Media GT shares primary GT's GGTT */
>> +    if (gt->type == GT_MEDIA) {
>> +        gt->ggtt = to_gt(gt->i915)->ggtt;
> 
> AFAICT this creates two implicit assumptions: 1) That for_each_gt
> iterates in a certain order (primary always first), when it is calling
> in here; and 2) That the primary tile is not media. Ideally a
> GEM_BUG_ON(!gt->ggtt) would cover for it, since I am not sure the
> list_add_tail below is guaranteed to explode or not.

Ok makes sense.
> 
>> +    } else {
>> +        gt->ggtt = i915_ggtt_create(gt->i915);
>> +        if (IS_ERR(gt->ggtt))
>> +            return PTR_ERR(gt->ggtt);
>> +    }
>>   -    return gt->ggtt ? 0 : -ENOMEM;
>> +    list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
>> +
>> +    return 0;
>>   }
>>     int intel_gt_init_mmio(struct intel_gt *gt)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index c1d9cd255e06..8d915640914b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -277,6 +277,9 @@ struct intel_gt {
>>       struct kobject *sysfs_defaults;
>>         struct i915_perf_gt perf;
>> +
>> +    /** link: &ggtt.gt_list */
>> +    struct list_head ggtt_link;
>>   };
>>     struct intel_gt_definition {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index 4d75ba4bb41d..d1900fec6cd1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -390,6 +390,9 @@ struct i915_ggtt {
>>       struct mutex error_mutex;
>>       struct drm_mm_node error_capture;
>>       struct drm_mm_node uc_fw;
>> +
>> +    /** List of GTs mapping this GGTT */
>> +    struct list_head gt_list;
>>   };
>>     struct i915_ppgtt {
>> @@ -584,6 +587,7 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>>   int i915_init_ggtt(struct drm_i915_private *i915);
>>   void i915_ggtt_driver_release(struct drm_i915_private *i915);
>>   void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
>> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
>>     static inline bool i915_ggtt_has_aperture(const struct i915_ggtt
>> *ggtt)
>>   {
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c
>> b/drivers/gpu/drm/i915/i915_driver.c
>> index 69103ae37779..4e1bb3c23c63 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -612,10 +612,6 @@ static int i915_driver_hw_probe(struct
>> drm_i915_private *dev_priv)
>>         i915_perf_init(dev_priv);
>>   -    ret = intel_gt_assign_ggtt(to_gt(dev_priv));
>> -    if (ret)
>> -        goto err_perf;
>> -
>>       ret = i915_ggtt_probe_hw(dev_priv);
>>       if (ret)
>>           goto err_perf;
>> @@ -1316,7 +1312,8 @@ int i915_driver_suspend_switcheroo(struct
>> drm_i915_private *i915,
>>   static int i915_drm_resume(struct drm_device *dev)
>>   {
>>       struct drm_i915_private *dev_priv = to_i915(dev);
>> -    int ret;
>> +    struct intel_gt *gt;
>> +    int ret, i;
>>         disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>>   @@ -1331,6 +1328,11 @@ static int i915_drm_resume(struct drm_device
>> *dev)
>>           drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>>         i915_ggtt_resume(to_gt(dev_priv)->ggtt);
>> +
>> +    for_each_gt(gt, dev_priv, i)
>> +        if (GRAPHICS_VER(gt->i915) >= 8)
>> +            setup_private_pat(gt);
> 
> If this is now called from i915_driver.c, the >= 8 check should probably
> go into setup_private_pat. And exported function renamed to
> intel_gt_setup_private_pat. Otherwise it feels like top level code has a
> little bit of too much deep knowledge of things.

got it.
> 
>> +
>>       /* Must be called after GGTT is resumed. */
>>       intel_dpt_resume(dev_priv);
>>   diff --git a/drivers/gpu/drm/i915/i915_gem.c
>> b/drivers/gpu/drm/i915/i915_gem.c
>> index 8468ca9885fd..086c4702e1bf 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1143,6 +1143,8 @@ int i915_gem_init(struct drm_i915_private
>> *dev_priv)
>>       for_each_gt(gt, dev_priv, i) {
>>           intel_uc_fetch_firmwares(&gt->uc);
>>           intel_wopcm_init(&gt->wopcm);
>> +        if (GRAPHICS_VER(dev_priv) >= 8)
>> +            setup_private_pat(gt);
>>       }
>>         ret = i915_init_ggtt(dev_priv);
>> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c
>> b/drivers/gpu/drm/i915/i915_gem_evict.c
>> index f025ee4fa526..4cfe36b0366b 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
>> @@ -43,16 +43,25 @@ static bool dying_vma(struct i915_vma *vma)
>>       return !kref_read(&vma->obj->base.refcount);
>>   }
>>   -static int ggtt_flush(struct intel_gt *gt)
>> +static int ggtt_flush(struct i915_address_space *vm)
>>   {
>> -    /*
>> -     * Not everything in the GGTT is tracked via vma (otherwise we
>> -     * could evict as required with minimal stalling) so we are forced
>> -     * to idle the GPU and explicitly retire outstanding requests in
>> -     * the hopes that we can then remove contexts and the like only
>> -     * bound by their active reference.
>> -     */
>> -    return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>> +    struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +    struct intel_gt *gt;
>> +    int ret = 0;
>> +
>> +    list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
>> +        /*
>> +         * Not everything in the GGTT is tracked via vma (otherwise we
>> +         * could evict as required with minimal stalling) so we are
>> forced
>> +         * to idle the GPU and explicitly retire outstanding requests in
>> +         * the hopes that we can then remove contexts and the like only
>> +         * bound by their active reference.
>> +         */
>> +        ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +    return ret;
>>   }
>>     static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx
>> *ww)
>> @@ -149,6 +158,7 @@ i915_gem_evict_something(struct i915_address_space
>> *vm,
>>       struct drm_mm_node *node;
>>       enum drm_mm_insert_mode mode;
>>       struct i915_vma *active;
>> +    struct intel_gt *gt;
> 
> Declare where it is used, like in i915_gem_evict_for_node? Or maybe add
> a local helper like vm_retire_requests, not sure?
sure.

Thanks for your review Tvrtko, I would be doing these changes a little
later. Hope it should be fine.

Thanks,
Aravind.
> 
> Regards,
> 
> Tvrtko
> 
>>       int ret;
>>         lockdep_assert_held(&vm->mutex);
>> @@ -174,7 +184,14 @@ i915_gem_evict_something(struct
>> i915_address_space *vm,
>>                       min_size, alignment, color,
>>                       start, end, mode);
>>   -    intel_gt_retire_requests(vm->gt);
>> +    if (i915_is_ggtt(vm)) {
>> +        struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +
>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +            intel_gt_retire_requests(gt);
>> +    } else {
>> +        intel_gt_retire_requests(vm->gt);
>> +    }
>>     search_again:
>>       active = NULL;
>> @@ -246,7 +263,7 @@ i915_gem_evict_something(struct i915_address_space
>> *vm,
>>       if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>>           return -EBUSY;
>>   -    ret = ggtt_flush(vm->gt);
>> +    ret = ggtt_flush(vm);
>>       if (ret)
>>           return ret;
>>   @@ -332,7 +349,15 @@ int i915_gem_evict_for_node(struct
>> i915_address_space *vm,
>>        * a stray pin (preventing eviction) that can only be resolved by
>>        * retiring.
>>        */
>> -    intel_gt_retire_requests(vm->gt);
>> +    if (i915_is_ggtt(vm)) {
>> +        struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> +        struct intel_gt *gt;
>> +
>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +            intel_gt_retire_requests(gt);
>> +    } else {
>> +        intel_gt_retire_requests(vm->gt);
>> +    }
>>         if (i915_vm_has_cache_coloring(vm)) {
>>           /* Expand search to cover neighbouring guard pages (or
>> lack!) */
>> @@ -438,7 +463,7 @@ int i915_gem_evict_vm(struct i915_address_space
>> *vm, struct i915_gem_ww_ctx *ww)
>>        * switch otherwise is ineffective.
>>        */
>>       if (i915_is_ggtt(vm)) {
>> -        ret = ggtt_flush(vm->gt);
>> +        ret = ggtt_flush(vm);
>>           if (ret)
>>               return ret;
>>       }
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c
>> b/drivers/gpu/drm/i915/i915_vma.c
>> index 703fee6b5f75..726705b10637 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -1544,6 +1544,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma,
>> struct i915_gem_ww_ctx *ww,
>>                  u32 align, unsigned int flags)
>>   {
>>       struct i915_address_space *vm = vma->vm;
>> +    struct intel_gt *gt;
>> +    struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>       int err;
>>         do {
>> @@ -1559,7 +1561,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma,
>> struct i915_gem_ww_ctx *ww,
>>           }
>>             /* Unlike i915_vma_pin, we don't take no for an answer! */
>> -        flush_idle_contexts(vm->gt);
>> +        list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +            flush_idle_contexts(gt);
>>           if (mutex_lock_interruptible(&vm->mutex) == 0) {
>>               /*
>>                * We pass NULL ww here, as we don't want to unbind
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c
>> b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> index e5dd82e7e480..2535b9684bd1 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private
>> *i915)
>>        */
>>       with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>           i915_ggtt_resume(to_gt(i915)->ggtt);
>> +        if (GRAPHICS_VER(i915) >= 8)
>> +            setup_private_pat(to_gt(i915));
>>           i915_gem_resume(i915);
>>       }
>>   }
