Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF4705B81
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 01:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F070C10E384;
	Tue, 16 May 2023 23:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DE210E380;
 Tue, 16 May 2023 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684281200; x=1715817200;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C48kwmQWa1768aFxogEdBom2PKI4rQtlo6s6jpQ7anw=;
 b=bdRqAciJjho4JV+NE4e5dsBZp+zASVdTkbnnjBP1SdTawIpmnYLMMBET
 Rmcmw4aI6CJ5MelxMSSbXgFIW2RFD8BJhvXlUWdqaovaR2rs/hlrf+UT4
 22Nf3u/rrbVfqX6RAQK9CEtR5MIiq66RUj+RJ48JpzHPcr/HM7BzfYEAy
 x+sVRW073xN6QHzKwzrykQZ/8K+s1wdhyZBcEhf6/BXaZOWrZJmCkue3c
 AJoXGGEOC2fSNjhu1d+OU2T8TesFRuUCbtf7Ihw2jRbeKvAkBtGIPrh5i
 /DHikyevQ1T+g6IPvSEScv/0TEoiKyvhm7Nr8BszMVGZzgORVXcLIW17c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="331980339"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="331980339"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 16:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="875838643"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="875838643"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 16 May 2023 16:53:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 16:53:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 16:53:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 16:53:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 16:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR6kbAOc71iaALsr/kktqoKmY2lHabaBewBAB6NIjswi1dIA1TJT9NNkquyJs5CmPPLl6y/qyg4IRyOAMq9nBzipvwNysCvrv8wfv1B0S6o6z9Z2gIsMbRfYtKj8AhdPwVDN/iykbLRTW3wCu0oM7Z1XLS7WvjMkj32b34BWdGLjcA9O+ji5174EWGYycI8jeG9L0Q+vv7kfjJVbkD5C747zy33627ZfLnFZNH3hexa23jQj2z4k69jIdfBnKtztUfrJJvcWJSpJ6z3ywQQ/PAqwrtc3MPLllf8sP1M8cgvy/K/l4T4FBvsd7FDK6sWeOS7ZgUdtgTcdnwQVGyy9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEgKZyTcS4m4aDLfb/brHjyW0se9XOjdaGDwpUcf6z4=;
 b=KaSyJwvDc2B9WAitjqJdRpORAl/WQjXYdaLZnHZEMHARdMemOBVKFMY3nofdFiwpSpPS4QT7KEfJg6XtlH/PUeMRxL4rq0mgUl+tHX4YyRSAtIBRbSdZBmMEi8U3kpwrS1wk3CJIgMAJU37479q5sbpiSLsSIhYLz/J8e0687TLObp+lxsITpWc7hmyAJXd/pQN5/MVhrU3Nvf6DUiCdpb2/q/9etK4AbR+ab5ZXGV/CkDymHihfmfu8C3jwska4b9KByD9a+XwqgrPVpkU+e9I3B2tRpi/Jsnn2K/iqmA4kxmWJxZFmfUawNJYtsTtW7kj4DwAJAkEJi5Fo1CyEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW4PR11MB6715.namprd11.prod.outlook.com (2603:10b6:303:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 23:53:04 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::3435:8461:a51:17fc]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::3435:8461:a51:17fc%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 23:53:04 +0000
Date: Tue, 16 May 2023 16:52:46 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/pmu: Change bitmask of enabled events to u32
Message-ID: <ZGQXTlBcPLel02wt@orsosgc001.jf.intel.com>
References: <20230516092445.184823-1-tvrtko.ursulin@linux.intel.com>
 <ZGP/7UvMtspSByjp@orsosgc001.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZGP/7UvMtspSByjp@orsosgc001.jf.intel.com>
X-ClientProxiedBy: BYAPR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:a03:54::19) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW4PR11MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: d66891db-65cc-44d8-a929-08db5668b02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqIUg7UTMWYTo2YifdF4C+vsv2tBihqZIHTMyBTihGUH+LUCwoUNWVohZL97V2glaDzJoByKm9tf1y/epZeN6nLEmBUwXqMM0Vrnz5IseLTnAnJ0EoS+2NFBNrtY+0ZbmTsBOF8tsi/86JzIThZiwm1TtcX03lEWrR2ea9DOF3mFw/MBqZIqGZgF1zBe7shI1KczvVKSLhCZjr6ArTg/2x6sBWb5SvGPG3V2FqNV5a4oze4oL1K6Zrh7OJ2K6VdVXM4C3UNbIIus0Zj+qZcH7hC9W571UZqL+aaBsUjapKMo488TMM8y/sYk9PVgXi0uDXvbxGyQBrh1Fu21k5H9Tvmsxxzo+a1HV0z8MiwYAf4Tb2ZbOz694ypfGGb3azhiFVUorfnxzmZFMFotbMFCUWUqFqHqhRzmtw5vgcnoha9dtioSISWRJfDwlJ0vXsEf02oTM5H6BUoGK18bFA5A2YSruLih9NlvJc0XJs1YHIYokwngerv8udbmSwPcorUn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(478600001)(6666004)(41300700001)(82960400001)(66556008)(6916009)(66946007)(4326008)(66476007)(316002)(54906003)(8936002)(8676002)(38100700002)(186003)(2906002)(6506007)(83380400001)(26005)(6512007)(86362001)(966005)(6486002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R01MNTI3d2ZmK1ZQRS9hOXFTeXc1VFlOV1dxQXNhaGo1eDdBWGJNbFFvcHpM?=
 =?utf-8?B?ZjN3TkVFTGtDbG9lNUd2V2IzZGd4QTlxaDdHaGF1YnhSc2dva3V5clNnVHhj?=
 =?utf-8?B?YzJEMG5aTVFMTGVvZjJqLzBXWTRsa0ZXdWQzc3Yyd0JDalNtdFFvaE1Icm1X?=
 =?utf-8?B?Ny9Yem5vd1ZiNTBuQzYwbWN5VzFwcjlKaW5iQ1ZmMFh5MmVCaHhSTEJQZTNx?=
 =?utf-8?B?aURrRjRtbWtNalNiZzlXUmRMTVhVQVFDNU9oL3V6b2phWTJoNTFJbTRrRWNT?=
 =?utf-8?B?ZmVLR3VRUHBhTWk3U0NoRG1MNTh1TVROR1ZRZUhZL3VuNGN2WG56UWFvRm9w?=
 =?utf-8?B?ZDdSeStKemNqOUR6Sm5JK0tiajhhR0dySUpRQVdJRWc5cWhqMHRLRU1CVUk4?=
 =?utf-8?B?dnk0Q1ZoTTNUclJzVUp4c1d2ZkpQZXR0T21sb2hSSzgraU9uM0VyS1BqV0l2?=
 =?utf-8?B?YnNOc0huSkhKYUE5QitaTDBRYlBHNHpkc1hXUUZVc1BCTGI0b0lSbUhXODhL?=
 =?utf-8?B?R04wZVZLZXQ4VUQ1akN1d25LQ1pnTk9sMWFEQzdRUnp0MXVRNG5LZTdIOEpI?=
 =?utf-8?B?S0N5Rzh6Q1M0Z3o4Rjc1QmtMYURKcExIWDdOOGFZdytVcUJaUlhyeGRYeStX?=
 =?utf-8?B?dVJYeEpiTWpERFFxTWJlZ1E0MmpVb1ZqRGJTWjhrUFg0SnF2R3ZobTN1N1pS?=
 =?utf-8?B?TEVIQ2dEYjFVaGdYb0JySDA5Y3JWUXMwQVlHUm85d2lOb1NTTDVrM0JWeUtL?=
 =?utf-8?B?cDlNdURtdzJzRkVjY2M3aVhJS3JFMFAwNU1FQTk2dGZXUkhDOHlQOWNJcHRz?=
 =?utf-8?B?THVEZFFqeWpjWGcwR3ROSlY5T0ltZ29jalczS0J6UThLS1BBanduRTZZbktJ?=
 =?utf-8?B?Tmwzd29oNlFGdlZKRGY4TVQvSjN5VDBLdDFLRm9tdm1uVjBCMlZFUTBuVUV3?=
 =?utf-8?B?RzFHOW8vUGlZV0MxMGhHM2QvL040RU84VkdIK1VnNEJRWTE1c2pwbFNpazhR?=
 =?utf-8?B?enltaTVGUGRCc0ViWm9vY2ZOa3RXaHR4cW5KdTk3SjZzRUUxaHRNTGVUdGNL?=
 =?utf-8?B?akhxSDdPZ0NLTVRHSGZjTEJGbm5XM2t3a0FDT2hjNW10bUF4Q0I0VitEbEUz?=
 =?utf-8?B?Yzh0cEFoQ0ZjTk0wT2pDYTZtdlZpVmNlMEhkZERkNDkrN2l0TUl4ajZUWjNO?=
 =?utf-8?B?WkFjNTU2LzlrbGRqZndqTHNtWkdiZ0tIeFFuT0owRzVFTUdacENJdDNMenpn?=
 =?utf-8?B?TzFyS1QvMjc2eHJ1L21Md04yOUVTVitTaEVnQ1VwRDcwUE5DU0Y0ZjRCMlAv?=
 =?utf-8?B?TnA5c0pHbE1CUVN3NGEzVStPdW5tVHZoNThQNzdaVjJZZTZkbWFFZ0d1dFZy?=
 =?utf-8?B?T2xicGF5RjhDMlRFazIvYmlCUVJiaHlqTUhPWkpoRG1QNzFPZURvakUxUGR5?=
 =?utf-8?B?bWJOa2lBKzBkbC9YdHRQL0lrczVxVEE4TUdYODRSMkFZcWkweVA1d0dhN2Zr?=
 =?utf-8?B?RVJjSHFVT2hlU0l3SHBwN201RXRDWXNoTmZadUZJRWloSzd3NGRENWhodDdv?=
 =?utf-8?B?elV4dnVnejhxNHhwcWZ1dnhOSXJ3WWU3TTAyU21MdjJDa2xkRnNYd1Vqalh6?=
 =?utf-8?B?UFhPN0hlbUkyMkNhU1ZmSFR3Y1VKYnM1RXZueDdtLzhCMW1raG55MCsxd0oz?=
 =?utf-8?B?TVFhUkNNclIzaTNRazM5NmJNVE1rdzkzNEZqeDhiMTdQK292VTUxWUpYaWR6?=
 =?utf-8?B?aHA5cFlnRDdtd21MT2haSlJqS2lHekFZTVliNGpzdmVOUjlYeURTdlBGNnBk?=
 =?utf-8?B?aWRCdFRsaHdmR25uZkZMdVZXeXNVQ08yQlpuZTQxRGVzdWNPTVdKbUpyTlAy?=
 =?utf-8?B?VUljK1g5NUpSK1dFczJJMVpNMGU3ZXIwUFNhdlJVQTBUck85ZDgxbFNJT1ZW?=
 =?utf-8?B?VHpsK1VyTVJtSmp2OEN0eTN6U0N1SER6ampzRGo5Y3ZuN1lxeDJXcjQxOXJC?=
 =?utf-8?B?NzFhSmRzV3l3cDJNbllFS2dneG54ZnR5NmlkSmFJdEpZZGVRTXEvL2gyeisz?=
 =?utf-8?B?VEdJemYxRkdoS0RLZDBYUitHOFhjeENQTkw2dlVHdngxQllURUtkYW8rVDlX?=
 =?utf-8?B?clF0N0V1ZURJQjBDSGw4NTQvUzJTaEJzdnVoeEVvV1VRanZwcnc5aVFQRnlL?=
 =?utf-8?Q?daMxSAzHvVntMWA2Uuv2+aI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d66891db-65cc-44d8-a929-08db5668b02b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 23:53:03.8281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NMvuqM6C7OriR07kRcM5sbsYeoHZTCsicpTiiwdUtobaI6fWXOnXQIgg1bi84awTNr1brVWxhUsPhJETiCJ2tlM0gBUaSwYVCmB4cHsSds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6715
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 03:13:01PM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, May 16, 2023 at 10:24:45AM +0100, Tvrtko Ursulin wrote:
>>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>>Having it as u64 was a confusing (but harmless) mistake.
>>
>>Also add some asserts to make sure the internal field does not overflow
>>in the future.
>>
>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>I am not entirely sure the __builtin_constant_p->BUILD_BUG_ON branch will
>>work with all compilers. Lets see...
>>
>>Compile tested only.
>>---
>>drivers/gpu/drm/i915/i915_pmu.c | 32 ++++++++++++++++++++++----------
>>1 file changed, 22 insertions(+), 10 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>>index 7ece883a7d95..8736b3418f88 100644
>>--- a/drivers/gpu/drm/i915/i915_pmu.c
>>+++ b/drivers/gpu/drm/i915/i915_pmu.c
>>@@ -50,7 +50,7 @@ static u8 engine_event_instance(struct perf_event *event)
>>	return (event->attr.config >> I915_PMU_SAMPLE_BITS) & 0xff;
>>}
>>
>>-static bool is_engine_config(u64 config)
>>+static bool is_engine_config(const u64 config)
>>{
>>	return config < __I915_PMU_OTHER(0);
>>}
>>@@ -82,15 +82,28 @@ static unsigned int other_bit(const u64 config)
>>
>>static unsigned int config_bit(const u64 config)
>>{
>>+	unsigned int bit;
>>+
>>	if (is_engine_config(config))
>>-		return engine_config_sample(config);
>>+		bit = engine_config_sample(config);
>>	else
>>-		return other_bit(config);
>>+		bit = other_bit(config);
>>+
>>+	if (__builtin_constant_p(config))
>>+		BUILD_BUG_ON(bit >
>>+			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>>+							 enable)) - 1);
>>+	else
>>+		WARN_ON_ONCE(bit >
>>+			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>>+							 enable)) - 1);
>
>The else is firing for the INTERRUPT event because event_bit() also 
>calls config_bit(). It would be best to move this check to 
>config_mask() and leave this function as is.

I posted the modified version here - 
https://patchwork.freedesktop.org/patch/537361/?series=117843&rev=1 as 
part of the MTL PMU series so that it Tests out with IGT patches.

Thanks,
Umesh

>
>Thanks,
>Umesh
>
>>+
>>+	return bit;
>>}
>>
>>-static u64 config_mask(u64 config)
>>+static u32 config_mask(const u64 config)
>>{
>>-	return BIT_ULL(config_bit(config));
>>+	return BIT(config_bit(config));
>>}
>>
>>static bool is_engine_event(struct perf_event *event)
>>@@ -633,11 +646,10 @@ static void i915_pmu_enable(struct perf_event *event)
>>{
>>	struct drm_i915_private *i915 =
>>		container_of(event->pmu, typeof(*i915), pmu.base);
>>+	const unsigned int bit = event_bit(event);
>>	struct i915_pmu *pmu = &i915->pmu;
>>	unsigned long flags;
>>-	unsigned int bit;
>>
>>-	bit = event_bit(event);
>>	if (bit == -1)
>>		goto update;
>>
>>@@ -651,7 +663,7 @@ static void i915_pmu_enable(struct perf_event *event)
>>	GEM_BUG_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>>	GEM_BUG_ON(pmu->enable_count[bit] == ~0);
>>
>>-	pmu->enable |= BIT_ULL(bit);
>>+	pmu->enable |= BIT(bit);
>>	pmu->enable_count[bit]++;
>>
>>	/*
>>@@ -698,7 +710,7 @@ static void i915_pmu_disable(struct perf_event *event)
>>{
>>	struct drm_i915_private *i915 =
>>		container_of(event->pmu, typeof(*i915), pmu.base);
>>-	unsigned int bit = event_bit(event);
>>+	const unsigned int bit = event_bit(event);
>>	struct i915_pmu *pmu = &i915->pmu;
>>	unsigned long flags;
>>
>>@@ -734,7 +746,7 @@ static void i915_pmu_disable(struct perf_event *event)
>>	 * bitmask when the last listener on an event goes away.
>>	 */
>>	if (--pmu->enable_count[bit] == 0) {
>>-		pmu->enable &= ~BIT_ULL(bit);
>>+		pmu->enable &= ~BIT(bit);
>>		pmu->timer_enabled &= pmu_needs_timer(pmu, true);
>>	}
>>
>>-- 
>>2.39.2
>>
