Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253E606965
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 22:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E5010E2E2;
	Thu, 20 Oct 2022 20:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F5610E24F;
 Thu, 20 Oct 2022 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666296967; x=1697832967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I1J3Q9qP3UJPJEveZT0Ud1xS/SHqvRGJl4px14u0iOI=;
 b=mmBUpr7ZvH0UfXB46uB2Lgp5onST1j/VMa6vO5mTEsB44GEE3/8e/tFz
 4Znjnh4Q1qO9GLuHI3MyW5Qrt9T37KwGinjXiGbDGLaojYK6290fdJ0BI
 SGWrfueoBa/t9xZU8SPv51ejKm1CYn/E0eHWfCPXwdSaTG/3m9Wl015iL
 dLJ8H2Y35g8a6/d/wPjzBdu7KlqXTXYLYwPcRrKpn1lqwQT6p9g9q1hYg
 PGDtsg85kIjSrgy8gahwE8JXu3rcqZNQU4AfPRph/lGxo6ZqXJgi6+dA6
 58WpLXQcjvM8vXp/E7EiQbzjsaQ8MG2+czbFgBadbDhBEz4gEJZO/Swi0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="286548038"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="286548038"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 13:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="698889516"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="698889516"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 20 Oct 2022 13:16:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 13:16:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 13:16:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 13:16:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 13:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9j8yR3XNay33VrKXwIK4N47LrBX2nZ5CBDQ97Bi4rxGXtNYEyzzTBw9jeA7PZdpt9/RBkHej685Adjxz/QEU0zn4lQgsoUZuQul6sCt4nAPXnOPkfda55jmmuKARRW4nRVpk0dfvW6aLNy6J3OirGtS8GJBnh8HsgRqsQyMEXsITrm30PcjIA8aTIWJsBXl0ybl4VJ87nMVOTfQ18zivHehaD/xRAMCvR9tT4vLuZo2Yp3WwNOZCYkoe14ZJPfHZ7TkCvl2DiDw0ct+8/rssN/OfFvcBt4E5FrOTxGNP3/iAjXOicmh6fukppH5gkgMjbLanmvnfU8j+cqTj0daqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpZewbQGjkZJ8J6CfWrGQSM5MFaAMrHblTd0p0fmv1s=;
 b=iCgViexCwlAcb6bhbdtPN7RbHfoX6QT3nYZkXzp+G7VaT5xNlAdjM4bYYO4nt8P7nPRPtMVrxwFnyqti7YHzCUwpdH0MoiS8Qvg+fCPpQTcAZsmCrKEMNtGhYG0gJr2TsLCygqr79Us8FgHyI1fJDhqwXlAO/G92Evoa/oU3gVgcOmS6Scn4G5z7HL22J49zdtzBr/UccV+BFUZRWu8EmJJiyrIO7W/OidSJ7DEyq3Q5c4ZSH7BdnMQ3tQGGxL7XEZvaiVIproDOaNtI89nsUkXneKvDHiQFfbsmK5hsd4JlkTXYCjRQS9S/U8el33VYq1yy1Fr3Ozv8/S15HWMIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CH0PR11MB5708.namprd11.prod.outlook.com (2603:10b6:610:111::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 20:16:02 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 20:16:02 +0000
Message-ID: <bbe2b4c5-04be-bdc3-3911-d1544516eac1@intel.com>
Date: Thu, 20 Oct 2022 13:16:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221020002944.4228-1-vinay.belgaumkar@intel.com>
 <874jvyqr9o.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <874jvyqr9o.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CH0PR11MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: a6909674-9e40-4d04-6167-08dab2d7e916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Li0b7dgX1+f2BAK5PxIID6BscBsl8eMEGX2VwqgpoLxwFF9XI9xBLQNw9SLf1vS9LVVlduHO++QoVi0wAZvriBN9ujy1WUfoI/8IrhWiKF50VgxdDm/mYPqAkNuhr3T/jF6bIAruxVHaIGEzxHo5LWfVr7/CYtNBJvCBEi97KjQZUa1+dJ7dPau8CHdaqxdQoguYveNNxyPjInyZtQTdHFeanoXjv30DAJac/W7ojv4l5PspogDYgQZsotyteTyAcMF86+1TtpMUYR7SnZbdur4Zzi7yL4N16LbxkXnEeLJKqVzMr8IkqZVwDjzJsRH4esU4/auhqLWDZYFmAir1gpywbRSfyN3X+7UOP9PRu+OWU1ZGYlZRSSTLH/cIaJsix3qa2DDyLRou4lrG2GrDBrfGKDtzuXXbR+JpE+h0zBAmvu7Hprr2H1kMb2oTUinxT23Pr8rqbY+xoO/0j1jLVuKtPMkq1WEuqBepA0dkY8KH95SvENQlF1I1v9sPzUGH82r+HNY9t1DgECUv9LVchwZbCDoAt4kfKCmKm5HvKhLQWVx5O7UIOG0V5+NgPBrQX6WJKBTFhuPP9IR/bgCmLHpi/FkgrVz93MLt5uIhJrkiWf9+MU9N9uYv+C5wZMH2Rq6gReC2V/vekaacwFyeMTpy3+8QRWRFx0rpNmqRvzm348R5r/JGG8DM2ExdLMjXhhEFUbXVQelwN3/SYREBvaY3R+jV9ppgvU0C9OfXvWJOvpfSFzJBJyLSDzSlEN9A+fg5ZdSp+z/ttoTjZRSdp5+rJFV64PHrkRdPJiIbnp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(31686004)(37006003)(6862004)(5660300002)(66556008)(66946007)(316002)(6636002)(4326008)(8936002)(8676002)(6512007)(26005)(478600001)(41300700001)(2906002)(2616005)(53546011)(66476007)(186003)(6486002)(6506007)(36756003)(83380400001)(82960400001)(38100700002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnUrdVBhdjlNYUxtQkNvREFrQmJJcXZjUnBNMFJWVFE4L2xjYzRRVFhDb3h6?=
 =?utf-8?B?RnV6Tms2Z0pwNGNuSVFQdnhibHNKZUt4YkNWbHc0MU5tZkd2azRWazMyWUZt?=
 =?utf-8?B?T0llS1BLcWlULzlrTVg0Rm4ydlE0R0tMUWRVU1hmaFl0S2ViWHFFdDdNR0hH?=
 =?utf-8?B?RFJXRmlnMkswQzUrOXJ1M0hzOXh2eDRUTE5SbGRKMG94ZW0zMG9Lei9DakFn?=
 =?utf-8?B?bzZrRGFJUi9DTFRsczJsTTRSRE5OeU5GYUlVdlpvOHQxdDB4VFVCNGRqbHZk?=
 =?utf-8?B?WE0vMjNCMnhaSXVyLzdxRFRCN3pTZ2N4d204Vkh6RHFiT28yVXltZ3hVSUlF?=
 =?utf-8?B?ck4vbm10emFMV2pGYytzUG9lM1NiaHArU3F6YlRSa2lMcTRsbnFJaVJvdUFw?=
 =?utf-8?B?NWhtZk94Q2ZpWFJLVjlRT0lzUE1XZDNHczNEZ1laVUl3WkFYZ1ZHS2RTVzR4?=
 =?utf-8?B?M01PL1RSSlF4UCtxWVZYakdQWklnNlZBS0ZBUDhEb254TUJPcFRKQ1R1ZFJJ?=
 =?utf-8?B?ckY2eFFFYisvaGVkaDhEWlV4MHNsUTBSbUc5NU9sMHRTMm5tamxQWU91Yjhz?=
 =?utf-8?B?a3JFSHNjbC9wU2FHZlFsQW55aVNFSVd5S1ZLZ3huemU0d2duWktxWGtZbGJh?=
 =?utf-8?B?Rm1BckVQdUlBSXdwZUZEZno5VkN2b0swZEdCRlA1Q1BVcjZSWnBHaVRPMDRq?=
 =?utf-8?B?UmI3akxFQTdBQUExa3pDUlRsaUdzYVVXMTllOGkzY0xHV1NzamRyVy9vS0d4?=
 =?utf-8?B?N2E0UkVzZFpCQUNnZjF6cTVLUTBaVUNpWjhUTUgyTUhLd0dreWM2K0hhcThX?=
 =?utf-8?B?dmRDOUJBcXJBQzRDaGg0WXJyNnRnbEVsR0V5ekZaWWFHTm9vaVFrMVB3cnMv?=
 =?utf-8?B?WjhISE1jcnVTK3NMZ1NxaEVYK3N4dHg3S3JvV3lEQmxnR2IwMDZyNVpKOWxu?=
 =?utf-8?B?a25CbjFsbENmZWNzSjliN0xMNlhOMkpHZEZ2ZWYxSmFDOFRwU0l4NE9uSWRs?=
 =?utf-8?B?VEpCK1NCMkRJOVVsMGxJdHVSVEJTUDFxbGIyVmFqKzQ3REhmbENnc2NWZit6?=
 =?utf-8?B?WS9CeGRzUGo5Z21SQ1NncjNEeDlsYTdoNVpwQlRWZDN2WUo2T0hnZ0dYVUhL?=
 =?utf-8?B?TlB1K3ZvOEcreGNEYVFPTEVpSk0wSXVNUG56K3EybUVMTGxkZkhpZ3VjNllO?=
 =?utf-8?B?VEw5K0p5T3lCaUtGQlZSVjJFd2l0TXk2RENRdEZpNEM5TFJBbnRUVkpkYldk?=
 =?utf-8?B?ZGUzdGhGVk1aUU1ENFEyR2Y4WlJNZHZlempPK3Zwb2JJcWowem1STU5DK3pG?=
 =?utf-8?B?WWFvbHF4eWl1RVJHS2pQeTJ3bGViaFVRc1NuNGQ2QzVUdEdBWFUzcVRXcy8x?=
 =?utf-8?B?TFVPZXZCWUVOVDduR3J1ZHhabXkvMExiZXVEVStlUTkvMDJJZFhBTm43eFBn?=
 =?utf-8?B?TVJOelNTNy9yaDZhY0ptZ214aTBYYUUvblJoK29xSXJFWWYrOVNwS29ZbHYv?=
 =?utf-8?B?aERyTGJFUTZzR3JBanRJSDFqb1BIMlZuVzJkK2pvS2pBV20vZTdrdTRQL05y?=
 =?utf-8?B?ZXB1NEdPUithR0RnM2RpeS9MUTB6Sk9NOWxFZE5HUkxCZ2hXZkJsL09yQUpJ?=
 =?utf-8?B?UlpKd2xjUzZJdmZOWUM3N3V4L1BVYVlzWVg4Y3JpQUN1N2tCeUp0TnNoeW13?=
 =?utf-8?B?ZkY0Umt6YWkyZ3d6TU5uc3A3bG9ENnlZOFgrdXBrSDJsekVPdndDTzljY29s?=
 =?utf-8?B?MWYxOTBxTzNuNm9lWE51Z01EMHNsVXFlRElQbDZ6TU9XT3N0VlVtY3B6VHUw?=
 =?utf-8?B?YktadFFBZGhua05MVDM3WVF6V3FxWlcwM1Q3bktzR3hqN0dMS1ZCYUdNYmpT?=
 =?utf-8?B?Y0cyRHNiQk9rdXZ1R0JDY0UrM0M1MXR0alU0MnAzaXErVStRVnFzMldTQ202?=
 =?utf-8?B?dzZvdVlzblE1T3lUYTZ2UjV4d1VCZVpwVFJqT1EvL0JkVEtJZWlCRGQ0dXZP?=
 =?utf-8?B?b2ZWdTdTZWZpMWN1MksxcEtDQ3FWLzVVVlNzeWcrQm1SempISm9BR0grYTdy?=
 =?utf-8?B?bEZVZjdGMHJhc0Y2MVlSWGl4MS9nTDhDYzU4TWhyTHRUVkpSTUZVUHNQZ0Ri?=
 =?utf-8?B?eTZSbXV4bVpqWFNrMk5GSnN3T1Z4WnlpZXB2eldVV3RuNHpLWWkySTNnQloz?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6909674-9e40-4d04-6167-08dab2d7e916
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 20:16:02.5710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH+VbCW84cvtgzNYNL7NwpKABvc6ILJxL4LN9JNcRlaKkOi3JXpARB7VjOibs2zgMXfP/8aZzhy+2NdZ1RgYEn8Yw2LJOk08u1z9GrxK9vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5708
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/20/2022 11:33 AM, Dixit, Ashutosh wrote:
> On Wed, 19 Oct 2022 17:29:44 -0700, Vinay Belgaumkar wrote:
> Hi Vinay,
>
>> Waitboost (when SLPC is enabled) results in a H2G message. This can result
>> in thousands of messages during a stress test and fill up an already full
>> CTB. There is no need to request for RP0 if GuC is already requesting the
>> same.
> But how are we sure that the freq will remain at RP0 in the future (when
> the waiting request or any requests which are ahead execute)?
>
> In the current waitboost implementation, set_param is sent to GuC ahead of
> the waiting request to ensure that the freq would be max when this waiting
> request executed on the GPU and the freq is kept at max till this request
> retires (considering just one waiting request). How can we ensure this if
> we don't send the waitboost set_param to GuC?

There is no way to guarantee the frequency will remain at RP0 till the 
request retires. As a theoretical example, lets say the request boosted 
freq to RP0, but a user changed min freq using sysfs immediately after.

Waitboost is done by a pending request to "hurry" the current requests. 
If GT is already at boost frequency, that purpose is served. Also, host 
algorithm already has this optimization as well.

Thanks,

Vinay.

>
> I had assumed we'll do this optimization for server parts where min is
> already RP0 in which case we can completely disable waitboost. But this
> patch is something else.
>
> Thanks.
> --
> Ashutosh
>
>
>> v2: Add the tracing back, and check requested freq
>> in the worker thread (Tvrtko)
>> v3: Check requested freq in dec_waiters as well
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 14 +++++++++++---
>>   2 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index fc23c562d9b2..18b75cf08d1b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -1016,6 +1016,9 @@ void intel_rps_boost(struct i915_request *rq)
>> 		if (rps_uses_slpc(rps)) {
>> 			slpc = rps_to_slpc(rps);
>>
>> +			GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
>> +				 rq->fence.context, rq->fence.seqno);
>> +
>> 			/* Return if old value is non zero */
>> 			if (!atomic_fetch_inc(&slpc->num_waiters))
>> 				schedule_work(&slpc->boost_work);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index b7cdeec44bd3..9dbdbab1515a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -227,14 +227,19 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>   static void slpc_boost_work(struct work_struct *work)
>>   {
>> 	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
>> +	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
>> 	int err;
>>
>> 	/*
>> 	 * Raise min freq to boost. It's possible that
>> 	 * this is greater than current max. But it will
>> 	 * certainly be limited by RP0. An error setting
>> -	 * the min param is not fatal.
>> +	 * the min param is not fatal. No need to boost
>> +	 * if we are already requesting it.
>> 	 */
>> +	if (intel_rps_get_requested_frequency(rps) == slpc->boost_freq)
>> +		return;
>> +
>> 	mutex_lock(&slpc->lock);
>> 	if (atomic_read(&slpc->num_waiters)) {
>> 		err = slpc_force_min_freq(slpc, slpc->boost_freq);
>> @@ -728,6 +733,7 @@ int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val)
>>
>>   void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
>>   {
>> +	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
>> 	/*
>> 	 * Return min back to the softlimit.
>> 	 * This is called during request retire,
>> @@ -735,8 +741,10 @@ void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
>> 	 * set_param fails.
>> 	 */
>> 	mutex_lock(&slpc->lock);
>> -	if (atomic_dec_and_test(&slpc->num_waiters))
>> -		slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
>> +	if (atomic_dec_and_test(&slpc->num_waiters)) {
>> +		if (intel_rps_get_requested_frequency(rps) != slpc->min_freq_softlimit)
>> +			slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
>> +	}
>> 	mutex_unlock(&slpc->lock);
>>   }
>>
>> --
>> 2.35.1
>>
