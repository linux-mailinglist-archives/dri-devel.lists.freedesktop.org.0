Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D059634BD8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 01:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFAC10E1E6;
	Wed, 23 Nov 2022 00:56:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ADE10E1E6;
 Wed, 23 Nov 2022 00:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669164999; x=1700700999;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y78xUJ5AZX4VmokYOBvqBZ+c5lngCcAmPDEwk3T8szY=;
 b=WrLvvJFoEhmn65Shmou9i7kpRY2jIVsakyUro1m8dq4LRXiRRgYVYSrF
 y3Gs5Ut8e9+pSaFRunZMhaK1OyxeidzuUaYSlwP1yPjgqEXgTVWKvWivE
 mPHBIHg/ZdWagmi2L9Sj05AGIEDJb0uc64W/wsR7j2WEtd04Xgr4eLlQQ
 amGGh6QY7dZpP/T9OnfhA0BFzEuw83bbdoe/X+Xen7b2QPBA0BB3Jv0dK
 Kz35MtDk9+i9tiQ1ZfxKpLr35sdkhGKANX59/Z7GRYAOauCMvZgAEhYzJ
 kwz7sAKRhMUBth1Ru5bKDv5yI/ovreTIcnnd7aCizGQV7HplxG+Qb2vk9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="376095894"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="376095894"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 16:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="672678798"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="672678798"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 22 Nov 2022 16:56:38 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13; Tue, 22 Nov 2022 16:56:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13 via Frontend Transport; Tue, 22 Nov 2022 16:56:37 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 16:56:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mff18wMgl0GbchHPiVjznAxJoFgNjnHd2ADmBhJUBGixoInVCMypPGqAq6R7JzSAj0KCGdVd5kJSgBEfztMbmcaHqBj7dGEFCzh5qZQRFO+E3KnHdoAiiwbEg7/b/7g6vZoJ7bvTCOfJn1cSxjvQX1/HYHgDH3ST1LJFtpSxagLSg3WvShLDwCiu7BhPErzC3cC7vMQ+EZ23xRjwXhXqTFFy3isNgS00CR4zQOhUf8gKjjt+yYan9u3ilNP4+uZKdT1h0C3XYU+S0DHCUsdFwnO45Iz77UszfUlEanZDI0mCY4Yq7194wSn2yAvi55nmpK7iKD972CdfNgZln8YsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si9O41T57/P3n4UFDNDWcvXaRAlLl14E1h5KrN6f9RE=;
 b=iZzVyUxWgfOz6Xa9nTz/3NlAW+KMU89SiD4se0YqzJzq8UMt6itqlo9boAjcXqUsr1+DS3qL4X30F2LnLALdV4M4NKLa9ydVqV9K3M09gU2vPq3IgJKXYE90bMWdI5pt0JNhfe1cawn2rawMsptGz8j2UpLLMH9CkOYulKATAUF3Qqp70j69IWnocygyJ36LdPO6SAqEVJ7ByilSftoyTXvQdsFvz7uPSozQ6bwcA0jTg4JWaQ6PQVGgImxhbYcakOXLSy/RFjXsj0kUmAvIilptJ+Xz9eH54l7cK854LpaztlujVe2xfX+W6pUuwKdW3l3bSidUK/RwG4raW7FglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 00:56:34 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12%4]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 00:56:34 +0000
Message-ID: <8fc99db3-0b04-815f-61b5-1621ff01c5f5@intel.com>
Date: Tue, 22 Nov 2022 16:56:32 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/5] drm/i915/guc: Add GuC specific debug print wrappers
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-4-John.C.Harrison@Intel.com>
 <cc30e487-c2c6-3016-bade-a8e31c63df77@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <cc30e487-c2c6-3016-bade-a8e31c63df77@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:254::8) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc541c1-fdb9-496a-d054-08dacced913e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yWQmu0BEodJyz456T2A6z1eIWz5wIVelFhigk4kBlm594K4liHStGhHCufWe1WMXqN4ernCgADeB5EgI+7CE/3Z9HRBPI55rdPovaULaznF5Kkx2jZOKYdT8anSPgaYYoVd7mLAC2oAEHKwA6iS/KwOQhqDVh6ff16BVQA3jQynwvOaIkpk8uwOAHzF7LNRh/ysHEvTJdws8i8WAF2kQZq2kDSyt25cyfr9c2DBq+h59v4t3L/K0U0IJ8g83O+Su3hiiR4eL03wakPG5maE48y/zBuxkwi+8+/hIkol0rcxscB8sGWTf+M5MHGDgJUEVj1clQox1uVmvO9SqPVXN6eXG/yW1i6CfEDqJdc4s8/77FesILpLrUOivFjUaJbTG1b1C6eC5U1t0b6JWr3Kj9vPMIVuiRtufbJAJ0rO2gSZGBabdteMepvhXw2/qoi2fksI32gMOmUFgjYRIW1UEVJUgPiAtcMjoM+6FiHGgnexWIqjy3KcjlVv9/3gdHfFbLiF74YC2UqvkdwPFxw7SHQ6Ms9caytZKZ5JwSF+SFv0S3MGuAyBF3/xQzzOdo/cl9NVJliY9UTkzjsk4edzYEB5P2NV+FIp2UAGqFQLQdo0WXJHDqI5NYyjg+a1gYXagES97i387lW2Bt3FSRcs9jAUTY5UHMzwHOUQ+Z4+63Aw8OC3VLfjz8bXMLDyUrLC+SI3+GRoblZwHKIS2P9cjodRqDLb4iXYVBO3r9Z7e3pY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(6486002)(31686004)(82960400001)(38100700002)(2906002)(53546011)(26005)(6506007)(36756003)(316002)(450100002)(6512007)(8676002)(31696002)(66476007)(66556008)(478600001)(83380400001)(41300700001)(86362001)(8936002)(66946007)(4326008)(2616005)(186003)(5660300002)(30864003)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRQR0htSXhuSk1GeWEzTXphNzVybVliOXRaT1FDUXk1SU1nTE9Sa0luWHR4?=
 =?utf-8?B?MmwreU9qOUl2a04vVWpzcXR2Vkw4czNWNnpzVlBQempvVnYzMGhYclVER3o3?=
 =?utf-8?B?VEp3N0cwTEhMcGNIbzRNbVpUL2pBTnNWZ2VvTXM4UG14djhDN3JjVDBGcTdW?=
 =?utf-8?B?RU1YM3RYaXBHSHAxSjdvN2trbjFCdnluRFYrS2FvS0k1ODl1VmVIa2JwNE52?=
 =?utf-8?B?UCs4Q1NlOS9zTVFmQ05TWkRTOStSeXM5eGVKeHpubGtKQ0hDcDVJUGhyVDdH?=
 =?utf-8?B?YzFrb3RucmJpM1RiUnJHRC9aY2N6NTZnOEdtTkpwZ1RTMUtWUlJiOExnajFL?=
 =?utf-8?B?SFpKRFRkOG1ycGhXWnhML0Q3aWVtelhGWFFIMk5wVjRIZWVvK3Y0Rnpwbkxi?=
 =?utf-8?B?c0lVMHJNekNoSThwNzdtWXdRVHIrK3Jaak93SmthM2lDTEhBdkM5QmtRT1RQ?=
 =?utf-8?B?U0lBRHZ5UjhKNGdlZ3J4QTZpNmNQdXd2UEZNVVJkamVtRmRPeUlyZzNBdjV3?=
 =?utf-8?B?L0gvK1B0VEFzTEtrQkhLMjR3MWQ4QjNHUXNDaEduRHBMeWlFNU9TRmtaYnBl?=
 =?utf-8?B?anRpSm05MG1CaWdTM3pzeWVPblJlK1Yya2VUeURrT3hHaDRiN09DSkJReUFa?=
 =?utf-8?B?SFphZmJ1ZitRM1doR0ZUK2N6enJVSHdGSHU2NFpSaHZjREZMNys4KzVUK2dx?=
 =?utf-8?B?ZkxmMWlybE5zZ0tDdmEwd0dlRmZvNHpXMGFheDA0M1JacVZNNXB0ZVdoUWVq?=
 =?utf-8?B?ZHlHSVliM0M5eDNYSGJuNFkvdXEyQ0NxaVFsQVY0clY0QjZyenhRYTlJTThh?=
 =?utf-8?B?UzZWTk4yUlJFMDJjZVlVbFNVeXZ3Y1NNcWJNaEg3L0ZLM3NONmxkWU8zOHFH?=
 =?utf-8?B?c25HY0VJcUw3SGEyeGhLRGpxT0VmTHlmMStPd09raDB4dWJHa0VUcDNoWlI5?=
 =?utf-8?B?eVNUUzFOaHBlZ0hpVHZWejdQcFYwa3FmNE1PWVNKN25FVm8rdVFDRzVSYTdD?=
 =?utf-8?B?dXZ4cW5IOWtHdHRGM1BCNlA1Wi9mWmRGaEpTZzdWbDVsbmh4N3N3MU1adjA3?=
 =?utf-8?B?RGh0NDBrMXYyc2cyZlEraUdpREs3OVFzSkJsbzNLUmc1WmkyajM2VGR1dnVm?=
 =?utf-8?B?b3gyQlJMYnZYOG5neXduS2VsNXJKWmhUMVdrdkFlUHdnS29Scjc3eVdidUph?=
 =?utf-8?B?NnZaeStYRUFsd2FHZk1pakM2cVp5cTE5MGp2S0hnTDJYblRCSjRnWjZkd1Z2?=
 =?utf-8?B?U2RRSWFlWXMrTFk3MnJFV2VoWUdhMlgwVmhzN1NaQStYQTFYL0I3dncrbmN1?=
 =?utf-8?B?aDdJTEcyZHJQeHNHME1SU0RyWXBwaldjQ0VXL1lQUjNDQUJXdXdGc1BQay9H?=
 =?utf-8?B?bUNtdHdxRkEwVDRMNzg2RDJkYmx5VUY4dWUwNUJUay8ycXJXR1ZSK1JNbTJZ?=
 =?utf-8?B?c2U4RmN2QjY0QU9JaGc0Wm9ONk1qeERrY3JEYnoyVDBScVRYdi9YdUhKQm9Q?=
 =?utf-8?B?ajFkaG95L1MwQ2dKa0ZQRENzVnd0UnkxeStsc1oyckNoNHNRQXQ4TVFnbDll?=
 =?utf-8?B?dzNnWmhoTGNkL2F3T2NxaHF0WnNZRHZPVjh0OElmTjdyK3Ewc0haaEI2RVdD?=
 =?utf-8?B?a0h0a1Mva0VuM1dvWTNGL01MR0RnZVUwZWFORWRZcFNRMU9nbmVpM2tsUjBw?=
 =?utf-8?B?M2tBVUdmSGx1NmprS0M5UDlFVjgrUHZoNGpJWThDWW9PUGdCcjVWT2tHbjBV?=
 =?utf-8?B?YWNFUEJsSm45bHBoVWEvNkJ5azhxRVRsdUh2UUYySGJSVE9GSVEwMFIxUXZQ?=
 =?utf-8?B?WVZPWUt6RS9yTS80R2R3ZGNoSWdldzFRaE1aa1Q3ZmdKSE5wZXdzNkxtd2dp?=
 =?utf-8?B?UnJEcDRDTjNBaUM3UEhQZmJaTVdBRkpBaXZBVEhRd3BxeVpOc0JjeUdQMVhl?=
 =?utf-8?B?SnRpck5LdGhEOUdkd1ZSaDN5WUVSK2NWYm9GS3FRTVNCTERKNHp0bWp2U1RF?=
 =?utf-8?B?YTJqM2d5VHZaMmg0ekl6dWw0QTJwWlFkekNLTGxIQUF4RWhXZjNGQzB0WWxE?=
 =?utf-8?B?aGhSRjdDVEhBeTdxUk5vbWcwNklWS2F3T2NmR3VTcXd2MzJ2dkdlcko4djVa?=
 =?utf-8?B?YWJSUksrT3pVY1B0MmtDRDZ4QkZDSlg1azZCVGFYVk0xNGVaUGxoR2l4Y0FP?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc541c1-fdb9-496a-d054-08dacced913e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 00:56:34.5130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIH039KQkH/CuWyLHyBtnSfFVgQN8anN95nN9O+0Ut6aZp6bdu60E6hdqbIs1obOutGT+27ZR3q7/rRuxjehmCU/DV8mLZvAuCngkvuqqas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/2022 09:42, Michal Wajdeczko wrote:
> On 18.11.2022 02:58, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Create a set of GuC printers and start using them.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 32 ++++------
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 35 +++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  8 +--
>>   .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 48 +++++---------
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 19 +++---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 37 ++++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |  7 +--
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 55 +++++++---------
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 62 +++++++++----------
>>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 34 +++++-----
>>   .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 22 +++----
>>   .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 10 +--
>>   12 files changed, 179 insertions(+), 190 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 52aede324788e..d9972510ee29b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -94,8 +94,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>>   
>>   	spin_lock_irq(gt->irq_lock);
>> -	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
>> -		     gt->pm_guc_events);
>> +	guc_WARN_ON_ONCE(guc, intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
>> +			 gt->pm_guc_events);
>>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>>   	spin_unlock_irq(gt->irq_lock);
>>   
>> @@ -339,7 +339,7 @@ static void guc_init_params(struct intel_guc *guc)
>>   	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
>>   
>>   	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
>> -		DRM_DEBUG_DRIVER("param[%2d] = %#x\n", i, params[i]);
>> +		guc_dbg(guc, "init param[%2d] = %#x\n", i, params[i]);
>>   }
>>   
>>   /*
>> @@ -451,7 +451,7 @@ int intel_guc_init(struct intel_guc *guc)
>>   	intel_uc_fw_fini(&guc->fw);
>>   out:
>>   	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
>> -	i915_probe_error(gt->i915, "failed with %d\n", ret);
>> +	guc_probe_error(guc, "init failed with %d\n", ret);
>>   	return ret;
>>   }
>>   
>> @@ -484,7 +484,6 @@ void intel_guc_fini(struct intel_guc *guc)
>>   int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>>   			u32 *response_buf, u32 response_buf_size)
>>   {
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
>>   	u32 header;
>>   	int i;
>> @@ -519,8 +518,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>>   					   10, 10, &header);
>>   	if (unlikely(ret)) {
>>   timeout:
>> -		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
>> -			request[0], header);
>> +		guc_err(guc, "mmio request %#x: no reply %x\n", request[0], header);
>>   		goto out;
>>   	}
>>   
>> @@ -541,8 +539,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>>   	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>>   		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
>>   
>> -		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
>> -			request[0], reason);
>> +		guc_dbg(guc, "mmio request %#x: retrying, reason %u\n", request[0], reason);
>>   		goto retry;
>>   	}
>>   
>> @@ -550,16 +547,14 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
>>   		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>>   		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>>   
>> -		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
>> -			request[0], error, hint);
>> +		guc_err(guc, "mmio request %#x: failure %x/%u\n", request[0], error, hint);
>>   		ret = -ENXIO;
>>   		goto out;
>>   	}
>>   
>>   	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>>   proto:
>> -		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
>> -			request[0], header);
>> +		guc_err(guc, "mmio request %#x: unexpected reply %#x\n", request[0], header);
>>   		ret = -EPROTO;
>>   		goto out;
>>   	}
>> @@ -601,9 +596,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
>>   	msg = payload[0] & guc->msg_enabled_mask;
>>   
>>   	if (msg & INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED)
>> -		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC crash dump notification!\n");
>> +		guc_err(guc, "early notification: Crash dump!\n");
>>   	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
>> -		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC exception notification!\n");
>> +		guc_err(guc, "early notification: Exception!\n");
>>   
>>   	return 0;
>>   }
>> @@ -657,7 +652,7 @@ int intel_guc_suspend(struct intel_guc *guc)
>>   		 */
>>   		ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
>>   		if (ret)
>> -			DRM_ERROR("GuC suspend: RESET_CLIENT action failed with error %d!\n", ret);
>> +			guc_err(guc, "suspend: RESET_CLIENT action failed with error %d!\n", ret);
>>   	}
>>   
>>   	/* Signal that the GuC isn't running. */
>> @@ -832,12 +827,11 @@ static int __guc_action_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 va
>>   
>>   static int __guc_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 value)
>>   {
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	int err = __guc_action_self_cfg(guc, key, len, value);
>>   
>>   	if (unlikely(err))
>> -		i915_probe_error(i915, "Unsuccessful self-config (%pe) key %#hx value %#llx\n",
>> -				 ERR_PTR(err), key, value);
>> +		guc_probe_error(guc, "self-config; Unsuccessful (%pe) key %#hx value %#llx\n",
> self-config:
>
>> +				ERR_PTR(err), key, value);
>>   	return err;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 1bb3f98292866..8c02d22bc7e82 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -24,6 +24,41 @@
>>   struct __guc_ads_blob;
>>   struct intel_guc_state_capture;
>>   
>> +#define guc_err(_guc, _fmt, ...) \
>> +	gt_err(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_warn(_guc, _fmt, ...) \
>> +	gt_warn(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_notice(_guc, _fmt, ...) \
>> +	gt_notice(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_info(_guc, _fmt, ...) \
>> +	gt_info(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_dbg(_guc, _fmt, ...) \
>> +	gt_dbg(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_probe_error(_guc, _fmt, ...) \
>> +	do { \
>> +		if (i915_error_injected()) \
>> +			guc_dbg(_guc, _fmt, ##__VA_ARGS__); \
>> +		else \
>> +			guc_err(_guc, _fmt, ##__VA_ARGS__); \
>> +	} while (0)
> use gt_probe_error ?
Brain fade, I think. For some reason I was thinking that wouldn't work, 
but it clearly does.

>
>> +
>> +#define guc_WARN_ON(_guc, _condition) \
>> +	guc_WARN(_guc, _condition, "%s", "guc_WARN_ON(" __stringify(_condition) ")")
>> +
>> +#define guc_WARN_ON_ONCE(_guc, _condition) \
>> +	guc_WARN_ONCE(_guc, _condition, "%s", "guc_WARN_ON_ONCE(" __stringify(_condition) ")")
>> +
>> +#define guc_WARN(_guc, _condition, _fmt, ...) \
>> +	gt_WARN(guc_to_gt(_guc), _condition, "GuC " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_WARN_ONCE(_guc, _condition, _fmt, ...) \
>> +	gt_WARN_ONCE(guc_to_gt(_guc), _condition, "GuC " _fmt, ##__VA_ARGS__)
>> +
>>   /**
>>    * struct intel_guc - Top level structure of GuC.
>>    *
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> index a7f737c4792e2..fa9a31176b4a7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> @@ -427,7 +427,7 @@ static long guc_mmio_reg_state_create(struct intel_guc *guc)
>>   
>>   	guc->ads_regset = temp_set.storage;
>>   
>> -	drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %zu KB for temporary ADS regset\n",
>> +	guc_dbg(guc, "used %zu KB for temporary ADS regset\n",
>>   		(temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
>>   
>>   	return total * sizeof(struct guc_mmio_reg);
>> @@ -621,8 +621,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
>>   
>>   		engine = find_engine_state(gt, engine_class);
>>   		if (!engine) {
>> -			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n",
>> -				engine_class);
>> +			guc_err(guc, "No engine state recorded for class %d!\n", engine_class);
>>   			ads_blob_write(guc, ads.eng_state_size[guc_class], 0);
>>   			ads_blob_write(guc, ads.golden_context_lrca[guc_class], 0);
>>   			continue;
>> @@ -646,7 +645,6 @@ static int
>>   guc_capture_prep_lists(struct intel_guc *guc)
>>   {
>>   	struct intel_gt *gt = guc_to_gt(guc);
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
>>   	struct guc_gt_system_info local_info;
>>   	struct iosys_map info_map;
>> @@ -751,7 +749,7 @@ guc_capture_prep_lists(struct intel_guc *guc)
>>   	}
>>   
>>   	if (guc->ads_capture_size && guc->ads_capture_size != PAGE_ALIGN(total_size))
>> -		drm_warn(&i915->drm, "GuC->ADS->Capture alloc size changed from %d to %d\n",
>> +		guc_warn(guc, "capture alloc size changed from %d to %d\n",
>>   			 guc->ads_capture_size, PAGE_ALIGN(total_size));
>>   
>>   	return PAGE_ALIGN(total_size);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> index 1d49a7ec0bd8f..a8876178da6ff 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> @@ -353,7 +353,6 @@ guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
>>   				       u32 ipver)
>>   {
>>   	struct intel_gt *gt = guc_to_gt(guc);
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	struct sseu_dev_info *sseu;
>>   	int slice, subslice, i, iter, num_steer_regs, num_tot_regs = 0;
>>   	const struct __guc_mmio_reg_descr_group *list;
>> @@ -402,7 +401,7 @@ guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
>>   		}
>>   	}
>>   
>> -	drm_dbg(&i915->drm, "GuC-capture found %d-ext-regs.\n", num_tot_regs);
>> +	guc_dbg(guc, "capture found %d ext-regs.\n", num_tot_regs);
>>   	guc->capture->extlists = extlists;
>>   }
>>   
>> @@ -477,7 +476,6 @@ guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
>>   		      struct guc_mmio_reg *ptr, u16 num_entries)
>>   {
>>   	u32 i = 0, j = 0;
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
>>   	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
>>   	const struct __guc_mmio_reg_descr_group *match;
>> @@ -509,8 +507,7 @@ guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
>>   		}
>>   	}
>>   	if (i < num_entries)
>> -		drm_dbg(&i915->drm, "GuC-capture: Init reglist short %d out %d.\n",
>> -			(int)i, (int)num_entries);
>> +		guc_dbg(guc, "capture: Init reglist short %d out %d.\n", i, num_entries);
>>   
>>   	return 0;
>>   }
>> @@ -540,12 +537,11 @@ guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
>>   			size_t *size, bool is_purpose_est)
>>   {
>>   	struct intel_guc_state_capture *gc = guc->capture;
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
>>   	int num_regs;
>>   
>>   	if (!gc->reglists) {
>> -		drm_warn(&i915->drm, "GuC-capture: No reglist on this device\n");
>> +		guc_warn(guc, "capture: No reglist on this device\n");
>>   		return -ENODEV;
>>   	}
>>   
>> @@ -557,9 +553,9 @@ guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
>>   	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
>>   	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
>>   		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
>> -			drm_warn(&i915->drm, "Missing GuC-Err-Cap reglist Global!\n");
>> +			guc_warn(guc, "capture: Missing reglist: Global!\n");
>>   		else
>> -			drm_warn(&i915->drm, "Missing GuC-Err-Cap reglist %s(%u):%s(%u)!\n",
>> +			guc_warn(guc, "capture: Missing reglist: %s(%u):%s(%u)!\n",
>>   				 __stringify_type(type), type,
>>   				 __stringify_engclass(classid), classid);
>>   		return -ENODATA;
>> @@ -592,7 +588,6 @@ intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classi
>>   {
>>   	struct intel_guc_state_capture *gc = guc->capture;
>>   	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	struct guc_debug_capture_list *listnode;
>>   	int ret, num_regs;
>>   	u8 *caplist, *tmp;
>> @@ -623,7 +618,7 @@ intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classi
>>   
>>   	caplist = kzalloc(size, GFP_KERNEL);
>>   	if (!caplist) {
>> -		drm_dbg(&i915->drm, "GuC-capture: failed to alloc cached caplist");
>> +		guc_dbg(guc, "capture: Failed to alloc cached caplist\n");
>>   		return -ENOMEM;
>>   	}
>>   
>> @@ -653,7 +648,6 @@ intel_guc_capture_getnullheader(struct intel_guc *guc,
>>   				void **outptr, size_t *size)
>>   {
>>   	struct intel_guc_state_capture *gc = guc->capture;
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	int tmp = sizeof(u32) * 4;
>>   	void *null_header;
>>   
>> @@ -665,7 +659,7 @@ intel_guc_capture_getnullheader(struct intel_guc *guc,
>>   
>>   	null_header = kzalloc(tmp, GFP_KERNEL);
>>   	if (!null_header) {
>> -		drm_dbg(&i915->drm, "GuC-capture: failed to alloc cached nulllist");
>> +		guc_dbg(guc, "capture: Failed to alloc cached null list\n");
>>   		return -ENOMEM;
>>   	}
>>   
>> @@ -727,7 +721,6 @@ guc_capture_output_min_size_est(struct intel_guc *guc)
>>   
>>   static void check_guc_capture_size(struct intel_guc *guc)
>>   {
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	int min_size = guc_capture_output_min_size_est(guc);
>>   	int spare_size = min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>>   	u32 buffer_size = intel_guc_log_section_size_capture(&guc->log);
>> @@ -741,13 +734,13 @@ static void check_guc_capture_size(struct intel_guc *guc)
>>   	 * INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
>>   	 */
>>   	if (min_size < 0)
>> -		drm_warn(&i915->drm, "Failed to calculate GuC error state capture buffer minimum size: %d!\n",
>> +		guc_warn(guc, "error state capture buffer minimum size calculation failed: %d!\n",
>>   			 min_size);
>>   	else if (min_size > buffer_size)
>> -		drm_warn(&i915->drm, "GuC error state capture buffer maybe small: %d < %d\n",
>> +		guc_warn(guc, "error state capture buffer maybe small: %d < %d\n",
>>   			 buffer_size, min_size);
>>   	else if (spare_size > buffer_size)
>> -		drm_dbg(&i915->drm, "GuC error state capture buffer lacks spare size: %d < %d (min = %d)\n",
>> +		guc_dbg(guc, "error state capture buffer lacks spare size: %d < %d (min = %d)\n",
>>   			buffer_size, spare_size, min_size);
>>   }
>>   
>> @@ -848,7 +841,6 @@ static int
>>   guc_capture_log_remove_dw(struct intel_guc *guc, struct __guc_capture_bufstate *buf,
>>   			  u32 *dw)
>>   {
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	int tries = 2;
>>   	int avail = 0;
>>   	u32 *src_data;
>> @@ -865,7 +857,7 @@ guc_capture_log_remove_dw(struct intel_guc *guc, struct __guc_capture_bufstate *
>>   			return 4;
>>   		}
>>   		if (avail)
>> -			drm_dbg(&i915->drm, "GuC-Cap-Logs not dword aligned, skipping.\n");
>> +			guc_dbg(guc, "capture: Log not dword aligned, skipping.\n");
>>   		buf->rd = 0;
>>   	}
>>   
>> @@ -1118,13 +1110,12 @@ static void
>>   __guc_capture_create_prealloc_nodes(struct intel_guc *guc)
>>   {
>>   	struct __guc_capture_parsed_output *node = NULL;
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	int i;
>>   
>>   	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
>>   		node = guc_capture_alloc_one_node(guc);
>>   		if (!node) {
>> -			drm_warn(&i915->drm, "GuC Capture pre-alloc-cache failure\n");
>> +			guc_warn(guc, "capture pre-alloc-cache failure\n");
>>   			/* dont free the priors, use what we got and cleanup at shutdown */
>>   			return;
>>   		}
>> @@ -1169,7 +1160,6 @@ guc_capture_create_prealloc_nodes(struct intel_guc *guc)
>>   static int
>>   guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstate *buf)
>>   {
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	struct guc_state_capture_group_header_t ghdr = {0};
>>   	struct guc_state_capture_header_t hdr = {0};
>>   	struct __guc_capture_parsed_output *node = NULL;
>> @@ -1183,7 +1173,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
>>   	if (!i)
>>   		return -ENODATA;
>>   	if (i % sizeof(u32)) {
>> -		drm_warn(&i915->drm, "GuC Capture new entries unaligned\n");
>> +		guc_warn(guc, "capture new entries unaligned\n");
>>   		ret = -EIO;
>>   		goto bailout;
>>   	}
>> @@ -1301,8 +1291,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
>>   				break;
>>   			}
>>   			if (datatype != GUC_CAPTURE_LIST_TYPE_GLOBAL)
>> -				drm_dbg(&i915->drm, "GuC Capture missing global dump: %08x!\n",
>> -					datatype);
>> +				guc_dbg(guc, "cpture missing global dump: %08x!\n", datatype);
> typo
>
>>   		}
>>   		node->is_partial = is_partial;
>>   		node->reginfo[datatype].vfid = FIELD_GET(CAP_HDR_CAPTURE_VFID, hdr.owner);
>> @@ -1322,7 +1311,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
>>   
>>   		numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
>>   		if (numregs > guc->capture->max_mmio_per_node) {
>> -			drm_dbg(&i915->drm, "GuC Capture list extraction clipped by prealloc!\n");
>> +			guc_dbg(guc, "capture list extraction clipped by prealloc!\n");
>>   			numregs = guc->capture->max_mmio_per_node;
>>   		}
>>   		node->reginfo[datatype].num_regs = numregs;
>> @@ -1367,7 +1356,6 @@ static void __guc_capture_process_output(struct intel_guc *guc)
>>   {
>>   	unsigned int buffer_size, read_offset, write_offset, full_count;
>>   	struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	struct guc_log_buffer_state log_buf_state_local;
>>   	struct guc_log_buffer_state *log_buf_state;
>>   	struct __guc_capture_bufstate buf;
>> @@ -1403,7 +1391,7 @@ static void __guc_capture_process_output(struct intel_guc *guc)
>>   		write_offset = buffer_size;
>>   	} else if (unlikely((read_offset > buffer_size) ||
>>   			(write_offset > buffer_size))) {
>> -		drm_err(&i915->drm, "invalid GuC log capture buffer state!\n");
>> +		guc_err(guc, "capture: invalid buffer state!\n");
>>   		/* copy whole buffer as offsets are unreliable */
>>   		read_offset = 0;
>>   		write_offset = buffer_size;
>> @@ -1586,13 +1574,11 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
>>   					 struct intel_context *ce)
>>   {
>>   	struct __guc_capture_parsed_output *n, *ntmp;
>> -	struct drm_i915_private *i915;
>>   	struct intel_guc *guc;
>>   
>>   	if (!gt || !ee || !ce)
>>   		return;
>>   
>> -	i915 = gt->i915;
>>   	guc = &gt->uc.guc;
>>   	if (!guc->capture)
>>   		return;
>> @@ -1615,7 +1601,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
>>   			return;
>>   		}
>>   	}
>> -	drm_dbg(&i915->drm, "GuC capture can't match ee to node\n");
>> +	guc_dbg(guc, "capture can't match ee to node\n");
>>   }
>>   
>>   void intel_guc_capture_process(struct intel_guc *guc)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> index 5b86b2e286e07..4a2811aa3d5e1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> @@ -103,8 +103,9 @@ static inline bool guc_ready(struct intel_uncore *uncore, u32 *status)
>>   	return uk_val == INTEL_GUC_LOAD_STATUS_READY;
>>   }
>>   
>> -static int guc_wait_ucode(struct intel_uncore *uncore)
>> +static int guc_wait_ucode(struct intel_gt *gt)
>>   {
>> +	struct intel_uncore *uncore = gt->uncore;
>>   	u32 status;
>>   	int ret;
>>   
>> @@ -127,12 +128,8 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
>>   	 */
>>   	ret = wait_for(guc_ready(uncore, &status), 200);
>>   	if (ret) {
>> -		struct drm_device *drm = &uncore->i915->drm;
>> -
>> -		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>> -		drm_info(drm, "GuC load failed: status: Reset = %d, "
>> -			"BootROM = 0x%02X, UKernel = 0x%02X, "
>> -			"MIA = 0x%02X, Auth = 0x%02X\n",
>> +		gt_info(gt, "GuC load failed: status = 0x%08X\n", status);
>> +		gt_info(gt, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> hmm, these should be guc_info() not gt_info()
>
> so instead of gt we should pass guc to guc_wait_ucode()
I was trying to not re-work any actual code if possible. But yeah, it 
makes sense to switch the parameter here. The calling function is all 
'guc' object based anyway.

>
>>   			REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>   			REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>   			REG_FIELD_GET(GS_UKERNEL_MASK, status),
>> @@ -140,13 +137,13 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
>>   			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>   
>>   		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>> -			drm_info(drm, "GuC firmware signature verification failed\n");
>> +			gt_info(gt, "GuC firmware signature verification failed\n");
>>   			ret = -ENOEXEC;
>>   		}
>>   
>>   		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) == INTEL_GUC_LOAD_STATUS_EXCEPTION) {
>> -			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
>> -				 intel_uncore_read(uncore, SOFT_SCRATCH(13)));
>> +			gt_info(gt, "GuC firmware exception. EIP: %#x\n",
>> +				intel_uncore_read(uncore, SOFT_SCRATCH(13)));
>>   			ret = -ENXIO;
>>   		}
>>   	}
>> @@ -194,7 +191,7 @@ int intel_guc_fw_upload(struct intel_guc *guc)
>>   	if (ret)
>>   		goto out;
>>   
>> -	ret = guc_wait_ucode(uncore);
>> +	ret = guc_wait_ucode(gt);
>>   	if (ret)
>>   		goto out;
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> index 68331c538b0a7..8c9a020700b52 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> @@ -39,7 +39,6 @@ struct guc_log_section {
>>   static void _guc_log_init_sizes(struct intel_guc_log *log)
>>   {
>>   	struct intel_guc *guc = log_to_guc(log);
>> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
>>   		{
>>   			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
>> @@ -82,12 +81,12 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>>   		}
>>   
>>   		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
>> -			drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
>> +			guc_err(guc, "log: Mis-aligned %s size: 0x%X vs 0x%X!\n",
>>   				sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
>>   		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
>>   
>>   		if (!log->sizes[i].count) {
>> -			drm_err(&i915->drm, "Zero GuC log %s size!", sections[i].name);
>> +			guc_err(guc, "log: zero %s size!\n", sections[i].name);
>>   		} else {
>>   			/* Size is +1 unit */
>>   			log->sizes[i].count--;
>> @@ -95,14 +94,14 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>>   
>>   		/* Clip to field size */
>>   		if (log->sizes[i].count > sections[i].max) {
>> -			drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
>> +			guc_err(guc, "log: %s size too large: %d vs %d!\n",
>>   				sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
>>   			log->sizes[i].count = sections[i].max;
>>   		}
>>   	}
>>   
>>   	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
>> -		drm_err(&i915->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
>> +		guc_err(guc, "log: Unit mis-match for crash and debug sections: %d vs %d!\n",
>>   			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
>>   			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
>>   		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
>> @@ -383,7 +382,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>>   
>>   	mutex_lock(&log->relay.lock);
>>   
>> -	if (WARN_ON(!intel_guc_log_relay_created(log)))
>> +	if (guc_WARN_ON(log_to_guc(log), !intel_guc_log_relay_created(log)))
> hmm, is this WARN_ON really needed here?
Well, it is an internal driver error if it occurs. All code paths that 
lead here should already have validated that relay logging has been 
started. So if the buffer has not been allocated then something bad has 
happened. Seems like that's what a WARN is meant to be used for.

John.


>
>>   		goto out_unlock;
>>   
>>   	/* Get the pointer to shared GuC log buffer */
>> @@ -451,7 +450,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>>   			write_offset = buffer_size;
>>   		} else if (unlikely((read_offset > buffer_size) ||
>>   				    (write_offset > buffer_size))) {
>> -			DRM_ERROR("invalid log buffer state\n");
>> +			guc_err(log_to_guc(log), "log: invalid buffer state\n");
>>   			/* copy whole buffer as offsets are unreliable */
>>   			read_offset = 0;
>>   			write_offset = buffer_size;
>> @@ -520,7 +519,7 @@ void intel_guc_log_init_early(struct intel_guc_log *log)
>>   static int guc_log_relay_create(struct intel_guc_log *log)
>>   {
>>   	struct intel_guc *guc = log_to_guc(log);
>> -	struct drm_i915_private *dev_priv = guc_to_gt(guc)->i915;
>> +	struct intel_gt *gt = guc_to_gt(guc);
>>   	struct rchan *guc_log_relay_chan;
>>   	size_t n_subbufs, subbuf_size;
>>   	int ret;
>> @@ -543,11 +542,11 @@ static int guc_log_relay_create(struct intel_guc_log *log)
>>   	n_subbufs = 8;
>>   
>>   	guc_log_relay_chan = relay_open("guc_log",
>> -					dev_priv->drm.primary->debugfs_root,
>> +					gt->i915->drm.primary->debugfs_root,
>>   					subbuf_size, n_subbufs,
>> -					&relay_callbacks, dev_priv);
>> +					&relay_callbacks, gt->i915);
>>   	if (!guc_log_relay_chan) {
>> -		DRM_ERROR("Couldn't create relay chan for GuC logging\n");
>> +		guc_err(guc, "log: Failed to create relay chan\n");
>>   
>>   		ret = -ENOMEM;
>>   		return ret;
>> @@ -596,7 +595,7 @@ static u32 __get_default_log_level(struct intel_guc_log *log)
>>   	}
>>   
>>   	if (i915->params.guc_log_level > GUC_LOG_LEVEL_MAX) {
>> -		DRM_WARN("Incompatible option detected: %s=%d, %s!\n",
>> +		guc_warn(guc, "log: Incompatible options detected: %s=%d, %s!\n",
>>   			 "guc_log_level", i915->params.guc_log_level,
>>   			 "verbosity too high");
>>   		return (IS_ENABLED(CONFIG_DRM_I915_DEBUG) ||
>> @@ -641,15 +640,15 @@ int intel_guc_log_create(struct intel_guc_log *log)
>>   	log->buf_addr = vaddr;
>>   
>>   	log->level = __get_default_log_level(log);
>> -	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
>> -			 log->level, str_enabled_disabled(log->level),
>> -			 str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
>> -			 GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
>> +	guc_dbg(guc, "guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
>> +		log->level, str_enabled_disabled(log->level),
>> +		str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
>> +		GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
>>   
>>   	return 0;
>>   
>>   err:
>> -	DRM_ERROR("Failed to allocate or map GuC log buffer. %d\n", ret);
>> +	guc_err(guc, "log: Failed to allocate or map buffer: %d\n", ret);
>>   	return ret;
>>   }
>>   
>> @@ -687,7 +686,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>>   					     GUC_LOG_LEVEL_IS_ENABLED(level),
>>   					     GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>   	if (ret) {
>> -		DRM_DEBUG_DRIVER("guc_log_control action failed %d\n", ret);
>> +		guc_dbg(guc, "guc_log_control action failed %d\n", ret);
>>   		goto out_unlock;
>>   	}
>>   
>> @@ -905,7 +904,7 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>>   
>>   	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>>   	if (IS_ERR(map)) {
>> -		DRM_DEBUG("Failed to pin object\n");
>> +		guc_dbg(guc, "log: Failed to pin buffer object\n");
>>   		drm_puts(p, "(log data unaccessible)\n");
>>   		free_page((unsigned long)page);
>>   		return PTR_ERR(map);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> index b5855091cf6a9..62f3b97111f64 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> @@ -70,13 +70,12 @@ static int __guc_rc_control(struct intel_guc *guc, bool enable)
>>   
>>   	ret = guc_action_control_gucrc(guc, enable);
>>   	if (ret) {
>> -		i915_probe_error(guc_to_gt(guc)->i915, "Failed to %s GuC RC (%pe)\n",
>> -				 str_enable_disable(enable), ERR_PTR(ret));
>> +		guc_probe_error(guc, "RC: Failed to %s: %pe\n",
>> +				str_enable_disable(enable), ERR_PTR(ret));
> in most cases we show error in () so it looks like:
>
> 	"GT0 GuC RC: Failed to enable (-ENOMEM)"
>
> please don't change that
>
>>   		return ret;
>>   	}
>>   
>> -	drm_info(&gt->i915->drm, "GuC RC: %s\n",
>> -		 str_enabled_disabled(enable));
>> +	guc_info(guc, "RC %s\n", str_enabled_disabled(enable));
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 63464933cbceb..b9ef0b4a123e1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -171,14 +171,12 @@ static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>>   static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>>   {
>>   	struct intel_guc *guc = slpc_to_guc(slpc);
>> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
>>   	int ret;
>>   
>>   	ret = guc_action_slpc_query(guc, offset);
>>   	if (unlikely(ret))
>> -		i915_probe_error(i915, "Failed to query task state (%pe)\n",
>> -				 ERR_PTR(ret));
>> +		guc_probe_error(guc, "SLPC: Failed to query task state (%pe)\n", ERR_PTR(ret));
>>   
>>   	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>>   
>> @@ -188,15 +186,14 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>>   static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>>   {
>>   	struct intel_guc *guc = slpc_to_guc(slpc);
>> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	int ret;
>>   
>>   	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>>   
>>   	ret = guc_action_slpc_set_param(guc, id, value);
>>   	if (ret)
>> -		i915_probe_error(i915, "Failed to set param %d to %u (%pe)\n",
>> -				 id, value, ERR_PTR(ret));
>> +		guc_probe_error(guc, "SLPC: Failed to set param %d to %u (%pe)\n",
>> +				id, value, ERR_PTR(ret));
>>   
>>   	return ret;
>>   }
>> @@ -236,8 +233,7 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>   					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>   					freq);
>>   		if (ret)
>> -			drm_notice(&i915->drm,
>> -				   "Failed to send set_param for min freq(%d): (%d)\n",
>> +			guc_notice(guc, "SLPC: Failed to send set_param for min freq(%d): (%d)\n",
>>   				   freq, ret);
>>   	}
>>   
>> @@ -267,7 +263,6 @@ static void slpc_boost_work(struct work_struct *work)
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   {
>>   	struct intel_guc *guc = slpc_to_guc(slpc);
>> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>>   	int err;
>>   
>> @@ -275,9 +270,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   
>>   	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
>>   	if (unlikely(err)) {
>> -		i915_probe_error(i915,
>> -				 "Failed to allocate SLPC struct (err=%pe)\n",
>> -				 ERR_PTR(err));
>> +		guc_probe_error(guc, "SLPC: Failed to allocate SLPC struct (err=%pe)\n",
> while here, drop "err=" just leave "(%pe)"
>
> Michal
>
>> +				ERR_PTR(err));
>>   		return err;
>>   	}
>>   
>> @@ -338,7 +332,6 @@ static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
>>   
>>   static int slpc_reset(struct intel_guc_slpc *slpc)
>>   {
>> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	struct intel_guc *guc = slpc_to_guc(slpc);
>>   	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
>>   	int ret;
>> @@ -346,15 +339,14 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
>>   	ret = guc_action_slpc_reset(guc, offset);
>>   
>>   	if (unlikely(ret < 0)) {
>> -		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
>> -				 ERR_PTR(ret));
>> +		guc_probe_error(guc, "SLPC: Reset action failed (%pe)\n", ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>>   	if (!ret) {
>>   		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
>> -			i915_probe_error(i915, "SLPC not enabled! State = %s\n",
>> -					 slpc_get_state_string(slpc));
>> +			guc_probe_error(guc, "SLPC: Not enabled! State = %s\n",
>> +					slpc_get_state_string(slpc));
>>   			return -EIO;
>>   		}
>>   	}
>> @@ -495,8 +487,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>   			     val < slpc->rp1_freq);
>>   	if (ret) {
>> -		i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
>> -				 ERR_PTR(ret));
>> +		guc_probe_error(slpc_to_guc(slpc), "SLPC: Failed to toggle efficient freq (%pe)\n",
>> +				ERR_PTR(ret));
>>   		goto out;
>>   	}
>>   
>> @@ -611,15 +603,12 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>>   
>>   static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
>>   {
>> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	int slpc_min_freq;
>>   	int ret;
>>   
>>   	ret = intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq);
>>   	if (ret) {
>> -		drm_err(&i915->drm,
>> -			"Failed to get min freq: (%d)\n",
>> -			ret);
>> +		guc_err(slpc_to_guc(slpc), "SLPC: Failed to get min freq: (%d)\n", ret);
>>   		return false;
>>   	}
>>   
>> @@ -685,8 +674,7 @@ int intel_guc_slpc_override_gucrc_mode(struct intel_guc_slpc *slpc, u32 mode)
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   		ret = slpc_set_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>>   		if (ret)
>> -			drm_err(&i915->drm,
>> -				"Override gucrc mode %d failed %d\n",
>> +			guc_err(slpc_to_guc(slpc), "SLPC: Override gucrc mode %d failed %d\n",
>>   				mode, ret);
>>   	}
>>   
>> @@ -702,9 +690,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   		ret = slpc_unset_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE);
>>   		if (ret)
>> -			drm_err(&i915->drm,
>> -				"Unsetting gucrc mode failed %d\n",
>> -				ret);
>> +			guc_err(slpc_to_guc(slpc), "SLPC: Unsetting gucrc mode failed %d\n", ret);
>>   	}
>>   
>>   	return ret;
>> @@ -726,6 +712,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   {
>>   	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>>   	int ret;
>>   
>>   	GEM_BUG_ON(!slpc->vma);
>> @@ -734,8 +721,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   	ret = slpc_reset(slpc);
>>   	if (unlikely(ret < 0)) {
>> -		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
>> -				 ERR_PTR(ret));
>> +		guc_probe_error(guc, "SLPC: Reset event returned (%pe)\n",
>> +				ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>> @@ -753,16 +740,16 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   	/* Set SLPC max limit to RP0 */
>>   	ret = slpc_use_fused_rp0(slpc);
>>   	if (unlikely(ret)) {
>> -		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
>> -				 ERR_PTR(ret));
>> +		guc_probe_error(guc, "SLPC: Failed to set max to RP0 (%pe)\n",
>> +				ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>>   	/* Revert SLPC min/max to softlimits if necessary */
>>   	ret = slpc_set_softlimits(slpc);
>>   	if (unlikely(ret)) {
>> -		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
>> -				 ERR_PTR(ret));
>> +		guc_probe_error(guc, "SLPC: Failed to set softlimits (%pe)\n",
>> +				ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 0a42f1807f52c..da8ab18aa4ce7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1443,8 +1443,7 @@ static void guc_init_engine_stats(struct intel_guc *guc)
>>   		int ret = guc_action_enable_usage_stats(guc);
>>   
>>   		if (ret)
>> -			drm_err(&gt->i915->drm,
>> -				"Failed to enable usage stats: %d!\n", ret);
>> +			guc_err(guc, "Failed to enable usage stats: %d!\n", ret);
>>   	}
>>   }
>>   
>> @@ -3584,8 +3583,7 @@ static int guc_request_alloc(struct i915_request *rq)
>>   		intel_context_sched_disable_unpin(ce);
>>   	else if (intel_context_is_closed(ce))
>>   		if (wait_for(context_close_done(ce), 1500))
>> -			drm_warn(&guc_to_gt(guc)->i915->drm,
>> -				 "timed out waiting on context sched close before realloc\n");
>> +			guc_warn(guc, "timed out waiting on context sched close before realloc\n");
>>   	/*
>>   	 * Call pin_guc_id here rather than in the pinning step as with
>>   	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
>> @@ -4350,7 +4348,7 @@ static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
>>   		return ret;
>>   
>>   	if (ret != policy->count) {
>> -		drm_warn(&guc_to_gt(guc)->i915->drm, "GuC global scheduler policy processed %d of %d KLVs!",
>> +		guc_warn(guc, "H2G: global scheduler policy processed %d of %d KLVs!\n",
>>   			 ret, policy->count);
>>   		if (ret > policy->count)
>>   			return -EPROTO;
>> @@ -4383,9 +4381,9 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>>   
>>   		ret = __guc_action_set_scheduling_policies(guc, &policy);
>>   		if (ret)
>> -			i915_probe_error(gt->i915,
>> -					 "Failed to configure global scheduling policies: %pe!\n",
>> -					 ERR_PTR(ret));
>> +			guc_probe_error(guc,
>> +					"Failed to configure global scheduling policies: %pe!\n",
>> +					ERR_PTR(ret));
>>   	}
>>   
>>   	return ret;
>> @@ -4484,21 +4482,18 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
>>   	struct intel_context *ce;
>>   
>>   	if (unlikely(ctx_id >= GUC_MAX_CONTEXT_ID)) {
>> -		drm_err(&guc_to_gt(guc)->i915->drm,
>> -			"Invalid ctx_id %u\n", ctx_id);
>> +		guc_err(guc, "Invalid ctx_id %u\n", ctx_id);
>>   		return NULL;
>>   	}
>>   
>>   	ce = __get_context(guc, ctx_id);
>>   	if (unlikely(!ce)) {
>> -		drm_err(&guc_to_gt(guc)->i915->drm,
>> -			"Context is NULL, ctx_id %u\n", ctx_id);
>> +		guc_err(guc, "Context is NULL, ctx_id %u\n", ctx_id);
>>   		return NULL;
>>   	}
>>   
>>   	if (unlikely(intel_context_is_child(ce))) {
>> -		drm_err(&guc_to_gt(guc)->i915->drm,
>> -			"Context is child, ctx_id %u\n", ctx_id);
>> +		guc_err(guc, "Context is child, ctx_id %u\n", ctx_id);
>>   		return NULL;
>>   	}
>>   
>> @@ -4513,7 +4508,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>>   	u32 ctx_id;
>>   
>>   	if (unlikely(len < 1)) {
>> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
>> +		guc_err(guc, "notification: Invalid length %u for deregister done\n", len);
>>   		return -EPROTO;
>>   	}
>>   	ctx_id = msg[0];
>> @@ -4565,7 +4560,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>>   	u32 ctx_id;
>>   
>>   	if (unlikely(len < 2)) {
>> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
>> +		guc_err(guc, "notification: Invalid length %u for sched done\n", len);
>>   		return -EPROTO;
>>   	}
>>   	ctx_id = msg[0];
>> @@ -4577,8 +4572,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>>   	if (unlikely(context_destroyed(ce) ||
>>   		     (!context_pending_enable(ce) &&
>>   		     !context_pending_disable(ce)))) {
>> -		drm_err(&guc_to_gt(guc)->i915->drm,
>> -			"Bad context sched_state 0x%x, ctx_id %u\n",
>> +		guc_err(guc, "notification: Bad context sched_state 0x%x, ctx_id %u\n",
>>   			ce->guc_state.sched_state, ctx_id);
>>   		return -EPROTO;
>>   	}
>> @@ -4666,8 +4660,8 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>>   		capture_error_state(guc, ce);
>>   		guc_context_replay(ce);
>>   	} else {
>> -		drm_info(&guc_to_gt(guc)->i915->drm,
>> -			 "Ignoring context reset notification of exiting context 0x%04X on %s",
>> +		guc_info(guc,
>> +			 "Ignoring context reset notification of exiting context 0x%04X on %s\n",
>>   			 ce->guc_id.id, ce->engine->name);
>>   	}
>>   }
>> @@ -4680,7 +4674,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>>   	int ctx_id;
>>   
>>   	if (unlikely(len != 1)) {
>> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
>> +		guc_err(guc, "notification: Invalid length %u for context reset\n", len);
>>   		return -EPROTO;
>>   	}
>>   
>> @@ -4713,13 +4707,13 @@ int intel_guc_error_capture_process_msg(struct intel_guc *guc,
>>   	u32 status;
>>   
>>   	if (unlikely(len != 1)) {
>> -		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
>> +		guc_err(guc, "notification: Invalid length %u for error capture\n", len);
>>   		return -EPROTO;
>>   	}
>>   
>>   	status = msg[0] & INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
>>   	if (status == INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
>> -		drm_warn(&guc_to_gt(guc)->i915->drm, "G2H-Error capture no space");
>> +		guc_warn(guc, "notification: Error capture buffer overflow\n");
>>   
>>   	intel_guc_capture_process(guc);
>>   
>> @@ -4762,13 +4756,12 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>   					 const u32 *msg, u32 len)
>>   {
>>   	struct intel_engine_cs *engine;
>> -	struct intel_gt *gt = guc_to_gt(guc);
>>   	u8 guc_class, instance;
>>   	u32 reason;
>>   	unsigned long flags;
>>   
>>   	if (unlikely(len != 3)) {
>> -		drm_err(&gt->i915->drm, "Invalid length %u", len);
>> +		guc_err(guc, "notification: Invalid length %u for engine failure\n", len);
>>   		return -EPROTO;
>>   	}
>>   
>> @@ -4778,8 +4771,8 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>   
>>   	engine = intel_guc_lookup_engine(guc, guc_class, instance);
>>   	if (unlikely(!engine)) {
>> -		drm_err(&gt->i915->drm,
>> -			"Invalid engine %d:%d", guc_class, instance);
>> +		guc_err(guc, "notification: Invalid engine %d:%d for engine failure\n",
>> +			guc_class, instance);
>>   		return -EPROTO;
>>   	}
>>   
>> @@ -4787,7 +4780,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>   	 * This is an unexpected failure of a hardware feature. So, log a real
>>   	 * error message not just the informational that comes with the reset.
>>   	 */
>> -	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
>> +	guc_err(guc, "notification: Engine reset request failed on %d:%d (%s) because 0x%08X\n",
>>   		guc_class, instance, engine->name, reason);
>>   
>>   	spin_lock_irqsave(&guc->submission_state.lock, flags);
>> @@ -5297,6 +5290,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>   		   unsigned long flags)
>>   {
>>   	struct guc_virtual_engine *ve;
>> +	struct intel_gt *gt;
>>   	struct intel_guc *guc;
>>   	unsigned int n;
>>   	int err;
>> @@ -5305,10 +5299,11 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>   	if (!ve)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> -	guc = &siblings[0]->gt->uc.guc;
>> +	gt = siblings[0]->gt;
>> +	guc = &gt->uc.guc;
>>   
>>   	ve->base.i915 = siblings[0]->i915;
>> -	ve->base.gt = siblings[0]->gt;
>> +	ve->base.gt = gt;
>>   	ve->base.uncore = siblings[0]->uncore;
>>   	ve->base.id = -1;
>>   
>> @@ -5336,8 +5331,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>   
>>   		GEM_BUG_ON(!is_power_of_2(sibling->mask));
>>   		if (sibling->mask & ve->base.mask) {
>> -			DRM_DEBUG("duplicate %s entry in load balancer\n",
>> -				  sibling->name);
>> +			guc_dbg(guc, "Duplicate %s entry in load balancer\n", sibling->name);
>>   			err = -EINVAL;
>>   			goto err_put;
>>   		}
>> @@ -5346,8 +5340,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>   		ve->base.logical_mask |= sibling->logical_mask;
>>   
>>   		if (n != 0 && ve->base.class != sibling->class) {
>> -			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
>> -				  sibling->class, ve->base.class);
>> +			guc_dbg(guc, "Invalid mixing of engine class, sibling %d, already %d\n",
>> +				sibling->class, ve->base.class);
>>   			err = -EINVAL;
>>   			goto err_put;
>>   		} else if (n == 0) {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> index e28518fe8b908..d588c32d65c54 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> @@ -65,7 +65,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>>   		ce = intel_context_create(engine);
>>   		if (IS_ERR(ce)) {
>>   			ret = PTR_ERR(ce);
>> -			drm_err(&gt->i915->drm, "Failed to create context, %d: %d\n", i, ret);
>> +			gt_err(gt, "Failed to create context, %d: %d\n", i, ret);
>>   			goto err;
>>   		}
>>   
>> @@ -86,7 +86,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>>   
>>   		if (IS_ERR(rq)) {
>>   			ret = PTR_ERR(rq);
>> -			drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n", i, ret);
>> +			gt_err(gt, "Failed to create request, %d: %d\n", i, ret);
>>   			goto err;
>>   		}
>>   
>> @@ -96,7 +96,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>>   	for (i = 0; i < 3; ++i) {
>>   		ret = i915_request_wait(last[i], 0, HZ);
>>   		if (ret < 0) {
>> -			drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
>> +			gt_err(gt, "Last request failed to complete: %d\n", ret);
>>   			goto err;
>>   		}
>>   		i915_request_put(last[i]);
>> @@ -113,7 +113,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>>   	/* GT will not idle if G2H are lost */
>>   	ret = intel_gt_wait_for_idle(gt, HZ);
>>   	if (ret < 0) {
>> -		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>> +		gt_err(gt, "GT failed to idle: %d\n", ret);
>>   		goto err;
>>   	}
>>   
>> @@ -153,7 +153,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   
>>   	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
>>   	if (!ce) {
>> -		drm_err(&gt->i915->drm, "Context array allocation failed\n");
>> +		guc_err(guc, "Context array allocation failed\n");
>>   		return -ENOMEM;
>>   	}
>>   
>> @@ -167,24 +167,24 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	if (IS_ERR(ce[context_index])) {
>>   		ret = PTR_ERR(ce[context_index]);
>>   		ce[context_index] = NULL;
>> -		drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
>> +		guc_err(guc, "Failed to create context: %d\n", ret);
>>   		goto err_wakeref;
>>   	}
>>   	ret = igt_spinner_init(&spin, engine->gt);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
>> +		guc_err(guc, "Failed to create spinner: %d\n", ret);
>>   		goto err_contexts;
>>   	}
>>   	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
>>   					     MI_ARB_CHECK);
>>   	if (IS_ERR(spin_rq)) {
>>   		ret = PTR_ERR(spin_rq);
>> -		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>> +		guc_err(guc, "Failed to create spinner request: %d\n", ret);
>>   		goto err_contexts;
>>   	}
>>   	ret = request_add_spin(spin_rq, &spin);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
>> +		guc_err(guc, "Failed to add Spinner request: %d\n", ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>> @@ -194,7 +194,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   		if (IS_ERR(ce[context_index])) {
>>   			ret = PTR_ERR(ce[context_index--]);
>>   			ce[context_index] = NULL;
>> -			drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
>> +			guc_err(guc, "Failed to create context: %d\n", ret);
>>   			goto err_spin_rq;
>>   		}
>>   
>> @@ -203,7 +203,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   			ret = PTR_ERR(rq);
>>   			rq = NULL;
>>   			if (ret != -EAGAIN) {
>> -				drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n",
>> +				guc_err(guc, "Failed to create request, %d: %d\n",
>>   					context_index, ret);
>>   				goto err_spin_rq;
>>   			}
>> @@ -218,7 +218,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	igt_spinner_end(&spin);
>>   	ret = intel_selftest_wait_for_rq(spin_rq);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Spin request failed to complete: %d\n", ret);
>> +		guc_err(guc, "Spin request failed to complete: %d\n", ret);
>>   		i915_request_put(last);
>>   		goto err_spin_rq;
>>   	}
>> @@ -230,7 +230,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	ret = i915_request_wait(last, 0, HZ * 30);
>>   	i915_request_put(last);
>>   	if (ret < 0) {
>> -		drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
>> +		guc_err(guc, "Last request failed to complete: %d\n", ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>> @@ -238,7 +238,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	rq = nop_user_request(ce[context_index], NULL);
>>   	if (IS_ERR(rq)) {
>>   		ret = PTR_ERR(rq);
>> -		drm_err(&gt->i915->drm, "Failed to steal guc_id, %d: %d\n", context_index, ret);
>> +		guc_err(guc, "Failed to steal guc_id, %d: %d\n", context_index, ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>> @@ -246,20 +246,20 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   	ret = i915_request_wait(rq, 0, HZ);
>>   	i915_request_put(rq);
>>   	if (ret < 0) {
>> -		drm_err(&gt->i915->drm, "Request with stolen guc_id failed to complete: %d\n", ret);
>> +		guc_err(guc, "Request with stolen guc_id failed to complete: %d\n", ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>>   	/* Wait for idle */
>>   	ret = intel_gt_wait_for_idle(gt, HZ * 30);
>>   	if (ret < 0) {
>> -		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>> +		guc_err(guc, "GT failed to idle: %d\n", ret);
>>   		goto err_spin_rq;
>>   	}
>>   
>>   	/* Verify a guc_id was stolen */
>>   	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
>> -		drm_err(&gt->i915->drm, "No guc_id was stolen");
>> +		guc_err(guc, "No guc_id was stolen\n");
>>   		ret = -EINVAL;
>>   	} else {
>>   		ret = 0;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
>> index d91b58f704039..07018ec75c21f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
>> @@ -45,7 +45,7 @@ static int intel_hang_guc(void *arg)
>>   
>>   	ctx = kernel_context(gt->i915, NULL);
>>   	if (IS_ERR(ctx)) {
>> -		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
>> +		gt_err(gt, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
>>   		return PTR_ERR(ctx);
>>   	}
>>   
>> @@ -54,7 +54,7 @@ static int intel_hang_guc(void *arg)
>>   	ce = intel_context_create(engine);
>>   	if (IS_ERR(ce)) {
>>   		ret = PTR_ERR(ce);
>> -		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>> +		gt_err(gt, "Failed to create spinner request: %d\n", ret);
>>   		goto err;
>>   	}
>>   
>> @@ -63,13 +63,13 @@ static int intel_hang_guc(void *arg)
>>   	old_beat = engine->props.heartbeat_interval_ms;
>>   	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Failed to boost heatbeat interval: %d\n", ret);
>> +		gt_err(gt, "Failed to boost heatbeat interval: %d\n", ret);
>>   		goto err;
>>   	}
>>   
>>   	ret = igt_spinner_init(&spin, engine->gt);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
>> +		gt_err(gt, "Failed to create spinner: %d\n", ret);
>>   		goto err;
>>   	}
>>   
>> @@ -77,28 +77,28 @@ static int intel_hang_guc(void *arg)
>>   	intel_context_put(ce);
>>   	if (IS_ERR(rq)) {
>>   		ret = PTR_ERR(rq);
>> -		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>> +		gt_err(gt, "Failed to create spinner request: %d\n", ret);
>>   		goto err_spin;
>>   	}
>>   
>>   	ret = request_add_spin(rq, &spin);
>>   	if (ret) {
>>   		i915_request_put(rq);
>> -		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
>> +		gt_err(gt, "Failed to add Spinner request: %d\n", ret);
>>   		goto err_spin;
>>   	}
>>   
>>   	ret = intel_reset_guc(gt);
>>   	if (ret) {
>>   		i915_request_put(rq);
>> -		drm_err(&gt->i915->drm, "Failed to reset GuC, ret = %d\n", ret);
>> +		gt_err(gt, "Failed to reset GuC, ret = %d\n", ret);
>>   		goto err_spin;
>>   	}
>>   
>>   	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
>>   	if (!(guc_status & GS_MIA_IN_RESET)) {
>>   		i915_request_put(rq);
>> -		drm_err(&gt->i915->drm, "GuC failed to reset: status = 0x%08X\n", guc_status);
>> +		gt_err(gt, "GuC failed to reset: status = 0x%08X\n", guc_status);
>>   		ret = -EIO;
>>   		goto err_spin;
>>   	}
>> @@ -107,12 +107,12 @@ static int intel_hang_guc(void *arg)
>>   	ret = intel_selftest_wait_for_rq(rq);
>>   	i915_request_put(rq);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "Request failed to complete: %d\n", ret);
>> +		gt_err(gt, "Request failed to complete: %d\n", ret);
>>   		goto err_spin;
>>   	}
>>   
>>   	if (i915_reset_count(global) == reset_count) {
>> -		drm_err(&gt->i915->drm, "Failed to record a GPU reset\n");
>> +		gt_err(gt, "Failed to record a GPU reset\n");
>>   		ret = -EINVAL;
>>   		goto err_spin;
>>   	}
>> @@ -132,7 +132,7 @@ static int intel_hang_guc(void *arg)
>>   		ret = intel_selftest_wait_for_rq(rq);
>>   		i915_request_put(rq);
>>   		if (ret) {
>> -			drm_err(&gt->i915->drm, "No-op failed to complete: %d\n", ret);
>> +			gt_err(gt, "No-op failed to complete: %d\n", ret);
>>   			goto err;
>>   		}
>>   	}
>> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
>> index d17982c36d256..04e28735a2ee6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
>> @@ -115,30 +115,30 @@ static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
>>   
>>   	parent = multi_lrc_create_parent(gt, class, 0);
>>   	if (IS_ERR(parent)) {
>> -		drm_err(&gt->i915->drm, "Failed creating contexts: %ld", PTR_ERR(parent));
>> +		gt_err(gt, "Failed creating contexts: %ld", PTR_ERR(parent));
>>   		return PTR_ERR(parent);
>>   	} else if (!parent) {
>> -		drm_dbg(&gt->i915->drm, "Not enough engines in class: %d", class);
>> +		gt_dbg(gt, "Not enough engines in class: %d", class);
>>   		return 0;
>>   	}
>>   
>>   	rq = multi_lrc_nop_request(parent);
>>   	if (IS_ERR(rq)) {
>>   		ret = PTR_ERR(rq);
>> -		drm_err(&gt->i915->drm, "Failed creating requests: %d", ret);
>> +		gt_err(gt, "Failed creating requests: %d", ret);
>>   		goto out;
>>   	}
>>   
>>   	ret = intel_selftest_wait_for_rq(rq);
>>   	if (ret)
>> -		drm_err(&gt->i915->drm, "Failed waiting on request: %d", ret);
>> +		gt_err(gt, "Failed waiting on request: %d", ret);
>>   
>>   	i915_request_put(rq);
>>   
>>   	if (ret >= 0) {
>>   		ret = intel_gt_wait_for_idle(gt, HZ * 5);
>>   		if (ret < 0)
>> -			drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>> +			gt_err(gt, "GT failed to idle: %d\n", ret);
>>   	}
>>   
>>   out:

