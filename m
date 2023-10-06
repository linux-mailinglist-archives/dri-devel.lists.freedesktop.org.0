Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F347BC238
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 00:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0447610E035;
	Fri,  6 Oct 2023 22:28:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4414210E035;
 Fri,  6 Oct 2023 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696631311; x=1728167311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i3Q7blmOEt5xBvk71Q1TP4vlC1nXb3ugKlp+ZDxs3Lk=;
 b=SG8ShKFSWBWLE/g3WHkUQJUKyxyyaUSru4hz0b/ro9VV3GYkHdq9FPvO
 DparapJGDqLCjuTEKsa3K6M9mTn3uMJSDOxg8xSowDSguaPkWhpgrh7Tp
 NqgZDnbrxA15djagYESPXumT+ppVFbdqJ5q9rfAm1N1ZLSji/d4XOhnHn
 6nqaQS8noQ0gW496PO2s0zyBsrrL+jqsmwZpMkHid550TTpOuuNnVq7yp
 yO5KyqJDOy29YqJzxlCo2vKIqzJqF3YeDMEaJHZuMWc7wrYUYFuVpNAXW
 SDhnFllcVusmUk+TSk4PaYDXsuJqBIYZ3scOQxDTt9G0oT5amnWNc+m1b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="368921649"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="368921649"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 15:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702191132"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="702191132"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 15:28:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 15:28:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 15:28:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 15:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buA5D8FyNaY8l0qwivgegDnukhj2ItuCbELzvv7TMRr3zXzmtj2JAmAl1fJeSM7FwTw/2GmLfdxOA96aSxR92y3CeGQIuRTGDVB5FDKu4rsKjrPnJpkRfioHYxePnpZ7SwyIC/lDpePXPXNH5/13opz3Vg7xy0fVzUAfOtkKSM/eLSgUFMJ3R9nUNCoDMITQIWLPoP8Pmt95FOOkmJFDLxEb5rk/kCanbZpa2+5qoqrimC2bBphlMjnqaNKVDEski4cHM+Ts5g5yt8EfZButIqY93yuhHwcqq0DjnQL6MbDYEuzKzOpE6WViF0+Nrx79e6dW20ux5KUkc6acaKBuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87drjaciCYWWy1V4HjaNYEWzxYFmnaOFSxhqOJfc4AM=;
 b=RHct9vjpn7amSaFtNwqVez9JrZ9PKzCM2tHbkz2JEpcYcplw5WLHRgI5TrjpJ1ecuqxgxBUzXYCR0dUUQiEmrEkTwR1zLnqqfvlxdAdvKX7UQmJzRiTuWP2g0gp+PCHmN+zAQDdwVQu9Utx64BxRO0LxAYyxepM3OKDQJNAL2stc5ua65N24Y+VTgcIQ7SOyT/VmBh1/GlHpbtNb8NWkl16DEUx8MU/44Xe5q+EawIqoXu5U/AR7FTOzRX1pXwPfOE+KJi8cY163I0cdM5+CMm49DZpc7lody9D/a7TaCi1TiVrwnSRW5HYnCfADnkdmRLfAVisePWkNUR4lIt2VMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by IA1PR11MB7272.namprd11.prod.outlook.com (2603:10b6:208:428::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Fri, 6 Oct
 2023 22:28:19 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 22:28:18 +0000
Message-ID: <c2484c48-ee9e-e772-4761-0bcb1853ce87@intel.com>
Date: Fri, 6 Oct 2023 15:28:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] drm/i915/guc: Support new and improved engine busyness
Content-Language: en-GB
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
 <20230922222510.2235213-2-John.C.Harrison@Intel.com>
 <ZRyAW3ugNnUA1ETR@unerlige-ril>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZRyAW3ugNnUA1ETR@unerlige-ril>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:303:dc::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|IA1PR11MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f494159-95cb-4477-8a00-08dbc6bb8a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+HOdLnv/QQC3VoqFU8m67yfjDksCVmJeaFV8qdqCRVf8hsb4yX/VRuh716OODbFxBhnJwfL7FUv9fCrU6nuv5qrdr+8GbtakGik+srFMauG15yUIuk0jYbVpuEICILkVYa7TWyDFIDSzXTIRE5bAyUdDEPmJE1o91QrT3xrhQBheo1OTkrGwmIfhGSh4yApdKhupDmxtyJmqu9J9ml/oj4QZ5GJ00K4W1sck8ly4Nw6NTSq0RS8vR0oDznCV6jvHVTAbsTFqIhUyj0RCxSZe4cIGp5Y8Flp1PZNRReScdTelA3K/u7N5kLiOHDJAmBFBb9Q30yYdeV91EoiJIngmMrtnQzuAYWp7/vmw4S9Kgo9Elt60M+qcTar7pCSsN0IxIvUBQH7picRxC3W4y3Q2XScY1JePur/EPd60M7gVk5CR9G2I2KtHgwDuC9FDtthzsE2EoE9xcsMn6G68ChFoT1E8KKGeai2+qOa4gVeOfheBFyhAnJJAtwwqVRlZ4ktog7YYJVCQF0wAYdQkq3i4HxzIDJDKjz5xehehzo0uCW0IU2nN0CYewyWH+dY0G4aHUFywtdL5xmsY8VSYvj7FF7h7hjkZHyWgFUF2nQYg0tTz25iQ4MRMiK6wJiX6ZFn4o1/bKmT1Mi1QBMESUyoTcYBwNsWSU5ebKorkod459s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31696002)(41300700001)(86362001)(6636002)(66476007)(478600001)(36756003)(37006003)(316002)(450100002)(6666004)(2906002)(66556008)(6486002)(53546011)(30864003)(83380400001)(66946007)(4326008)(6862004)(6506007)(8676002)(8936002)(31686004)(26005)(2616005)(5660300002)(82960400001)(6512007)(38100700002)(1883002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzJhSHl5N3pRRzc5Q201UkkvVVVFM1ZvT0planJhRjRIOWg1UGFCZUxXZXA0?=
 =?utf-8?B?Z1dtbnMvQ0M2Y3ZMaFg2SnBYTGd4aVRKNHJtQnlPdS92OGVyQWxobDRaMi9X?=
 =?utf-8?B?SDByT0dtM3FHNDVONlFHSXhheEtQSDVPVnFINUx5eDVrK0RGU044OTUvOXRM?=
 =?utf-8?B?MlZITCtYMlJMZWNaSkplUS8xSnBGNlBURDFJampyQm9yRVAybFh4RS9MUkkv?=
 =?utf-8?B?UHB0amJ4QzVkTmZkMUFBa1R6WU9tTkRyNHdTaVB2Qi9EYzVxQUJyaE9sc1FH?=
 =?utf-8?B?eExPalFYRVVIM0g0QnlKbGp4WUJWQ3VaZGtxOHVrZVlnM3B2UnFybDRQUnd2?=
 =?utf-8?B?R0tpK1E5VTM4RWNPQTFhb3ErUlQ3NXBTTVdwc1oxZm9kU3owcDhCQ29qa2h0?=
 =?utf-8?B?RnR4VGs1OWVtMlJlZTJRaFVEN1d0NWczOWVhRVR6ODFNQjJ6TUxXb2pqcUQr?=
 =?utf-8?B?WjAwVFNHcXZCVG4xRVhvWlErdmdaZ2t1M3g0eERseXdDZ255bjF6YVpiT2xz?=
 =?utf-8?B?RXpRYVlDd0NRTkRhR2VSM3pKTnNKWG81Z3kyV0lWUmF6M0k0dHQ2ZlFUaVEy?=
 =?utf-8?B?WHhFbEhucTdUaHhPYVZsYS9GcVcvUHcvUWs1dVFjSEFaU1ZOME43WEtsWDFT?=
 =?utf-8?B?K2dmdUJaRlE4dG1ZVFZLOFI2V1BWTVhkbC9hOEJDbnlKZHdCdmtPNTc0WGFL?=
 =?utf-8?B?TlI1QVlCYjRid3ZJRzB0bVBjV1FsemJnSTZjWkdzWmdkanlFbkZZVEJXZTA5?=
 =?utf-8?B?ekRJOVhscWl2RjY4Z0lFaG9zYTc0MDJnTDBQaHZrUExuOFk5cStONGtsbU92?=
 =?utf-8?B?WEtyTGVDUThXcWdldTg2dFpuOEgrMmh5Tm5lVU8rNHpVTWlPWGJXTVh4U2dt?=
 =?utf-8?B?em1tUGZnT0dJRVlqeExZWnZzU3FYeU4wY0k2ZS9CeWpSVFFtWGQvMVR2MjdM?=
 =?utf-8?B?SHlDcEtjdlYyejJDc3NqcWQ2NWtjdmZYUUJHWHFNRWZ6OHQ5Y2Frb0I3VTc4?=
 =?utf-8?B?eFhwNjZLSlNSb3pqSnUreDhIcmlVbThEQTdlRTFWUXVRTTVUS0lqYkRJMkVW?=
 =?utf-8?B?VmRKalMvTTlxd0IwMkVCNzMxcEhVa2R6dWdseE1rYUQzRUdGeFFmTC95ZHpM?=
 =?utf-8?B?eWVKeVA2T1ZmWnk0dytsODQ3aUVpSWlkVjZQanZCc1FkK2dVcS9sQ09mVmhG?=
 =?utf-8?B?V2thRGRIbUZpRklTS2FuSXJvZFNWd3NpNHh2T3llQUxqNjl5NkJsd3pzbllO?=
 =?utf-8?B?T2lsRnd0TlVuUnkrQ3pSSlkvMnBkajZ0U3dwWUI5TUMyMkZRa2lRS1hFa1No?=
 =?utf-8?B?NzJzWk5ZZjhZWnB6OVNWYWl3dG5xaWNwTlVUTkpGMDhCeUsvenBrMVN6Q09z?=
 =?utf-8?B?a1ZFZjVyQmZkQ2UzTGNDNWYxbDNpT2Z3MjBMQlAxMHpxanF6aDZrRFJ1QWdD?=
 =?utf-8?B?c2g2bm9iSnJWZzZrS1FmQ1ZVRks3RkJkeGxhMkNrTW1jSTFoODZIKzJlZThR?=
 =?utf-8?B?VnkwaGVMQWV6dHZvbXJPNXRWczhuWk9nUGR4cHExdnZFb3U1RWJnT05Ga0VK?=
 =?utf-8?B?aTY2T3JieHFtckVzTFZmb3QvWkVjYlpOOHNJcnMxTjBVbCtFY0U1QUlTSmRQ?=
 =?utf-8?B?dkY3TDh2SXRQZ1AwY1NDSGlMMWk0d3dpWmRRUEdDMnN0ckFmN0w4c0IrQnJ0?=
 =?utf-8?B?NC85ZTc3OEQrRHZVbGN2ZFNkdFgvRjhTbUVjQ1NoNWhoT1pFTkZXTEZSV2x0?=
 =?utf-8?B?UnRPQ1o4ckw5TndnbTRsUUtXTENSSVZwczNGUytRSGRqZFUrOVcvOS80ZmxS?=
 =?utf-8?B?QTJpSzZ2U1JZU2hyZklka2xnU0FubHRmSm84ZFplQWNIdHJlZGEvTkZqNHFI?=
 =?utf-8?B?a3pDU3U5c2hSeHYxVlp4Z3JhekhKSFhDbGduNGRNK0lzazdaNlBzaXRraWpU?=
 =?utf-8?B?d3VGd0ZaT1h6WCtCeWZKMFhuZzJKcnA5aC82d0pJNkVoQ25nMkdpR3BGZW8w?=
 =?utf-8?B?ZFArdFpHV3ZEZkZ3aEtzRVl5Q3lTODhPZTYreEptVHl5Z3Y4SnlPT3JIaTVs?=
 =?utf-8?B?czdrdzM3SDRuQ3hEUi9lZ2VyTjlSZVhtWUVkYXVzVmxEeDdteVlZbmNFUFE1?=
 =?utf-8?B?WUNrZHBMVW8vOTdEQzN0dy9aN0ZKMVNnNXlXNzBRbWx6MmplQ0tiYzJVa1Bt?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f494159-95cb-4477-8a00-08dbc6bb8a3b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 22:28:18.5021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lc2DYVCOzC9XQKGvngJ8/cceqXKOIJQVn86NHuXAbKX92+Sh6G+zK+NyCwKGAOagx/cOaoeWC0i64QR33s6fLg0tUlKJbbAscBRe4BCMsVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7272
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/3/2023 13:58, Umesh Nerlige Ramappa wrote:
> On Fri, Sep 22, 2023 at 03:25:08PM -0700, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The GuC has been extended to support a much more friendly engine
>> busyness interface. So partition the old interface into a 'busy_v1'
>> space and add 'busy_v2' support alongside. And if v2 is available, use
>> that in preference to v1. Note that v2 provides extra features over
>> and above v1 which will be exposed via PMU in subsequent patches.
>
> Since we are thinking of using the existing busyness counter to expose 
> the v2 values, we can drop the last sentence from above.
>
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> drivers/gpu/drm/i915/gt/intel_engine_types.h  |   4 +-
>> .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   4 +-
>> drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  82 ++--
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  55 ++-
>> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   9 +-
>> drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  23 +-
>> .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 381 ++++++++++++++----
>> 7 files changed, 427 insertions(+), 131 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> index a7e6775980043..40fd8f984d64b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> @@ -323,7 +323,7 @@ struct intel_engine_execlists_stats {
>>     ktime_t start;
>> };
>>
>> -struct intel_engine_guc_stats {
>> +struct intel_engine_guc_stats_v1 {
>>     /**
>>      * @running: Active state of the engine when busyness was last 
>> sampled.
>>      */
>> @@ -603,7 +603,7 @@ struct intel_engine_cs {
>>     struct {
>>         union {
>>             struct intel_engine_execlists_stats execlists;
>> -            struct intel_engine_guc_stats guc;
>> +            struct intel_engine_guc_stats_v1 guc_v1;
>>         };
>
> Overall, I would suggest having the renames as a separate patch. Would 
> make the review easier.
>
>>
>>         /**
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> index f359bef046e0b..c190a99a36c38 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> @@ -137,7 +137,9 @@ enum intel_guc_action {
>>     INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>>     INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>     INTEL_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>> -    INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> +    INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF_V1 = 0x550A,
>> +    INTEL_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION_V2 = 0x550C,
>> +    INTEL_GUC_ACTION_SET_FUNCTION_ENGINE_UTILIZATION_V2 = 0x550D,
>>     INTEL_GUC_ACTION_STATE_CAPTURE_NOTIFICATION = 0x8002,
>>     INTEL_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
>>     INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 6c392bad29c19..e6502ab5f049f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -226,45 +226,61 @@ struct intel_guc {
>>     struct mutex send_mutex;
>>
>>     /**
>> -     * @timestamp: GT timestamp object that stores a copy of the 
>> timestamp
>> -     * and adjusts it for overflow using a worker.
>> +     * @busy: Data used by the different versions of engine busyness 
>> implementations.
>>      */
>> -    struct {
>> -        /**
>> -         * @lock: Lock protecting the below fields and the engine 
>> stats.
>> -         */
>> -        spinlock_t lock;
>> -
>> -        /**
>> -         * @gt_stamp: 64 bit extended value of the GT timestamp.
>> -         */
>> -        u64 gt_stamp;
>> -
>> -        /**
>> -         * @ping_delay: Period for polling the GT timestamp for
>> -         * overflow.
>> -         */
>> -        unsigned long ping_delay;
>> -
>> -        /**
>> -         * @work: Periodic work to adjust GT timestamp, engine and
>> -         * context usage for overflows.
>> -         */
>> -        struct delayed_work work;
>> -
>> +    union {
>>         /**
>> -         * @shift: Right shift value for the gpm timestamp
>> +         * @v1: Data used by v1 engine busyness implementation. 
>> Mostly a copy
>> +         * of the GT timestamp extended to 64 bits and the worker 
>> for maintaining it.
>>          */
>> -        u32 shift;
>> +        struct {
>> +            /**
>> +             * @lock: Lock protecting the below fields and the 
>> engine stats.
>> +             */
>> +            spinlock_t lock;
>> +
>> +            /**
>> +             * @gt_stamp: 64 bit extended value of the GT timestamp.
>> +             */
>> +            u64 gt_stamp;
>> +
>> +            /**
>> +             * @ping_delay: Period for polling the GT timestamp for
>> +             * overflow.
>> +             */
>> +            unsigned long ping_delay;
>> +
>> +            /**
>> +             * @work: Periodic work to adjust GT timestamp, engine and
>> +             * context usage for overflows.
>> +             */
>> +            struct delayed_work work;
>> +
>> +            /**
>> +             * @shift: Right shift value for the gpm timestamp
>> +             */
>> +            u32 shift;
>> +
>> +            /**
>> +             * @last_stat_jiffies: jiffies at last actual stats 
>> collection time
>> +             * We use this timestamp to ensure we don't oversample the
>> +             * stats because runtime power management events can 
>> trigger
>> +             * stats collection at much higher rates than required.
>> +             */
>> +            unsigned long last_stat_jiffies;
>> +        } v1;
>>
>>         /**
>> -         * @last_stat_jiffies: jiffies at last actual stats 
>> collection time
>> -         * We use this timestamp to ensure we don't oversample the
>> -         * stats because runtime power management events can trigger
>> -         * stats collection at much higher rates than required.
>> +         * @v2: Data used by v2 engine busyness implementation - a 
>> memory object
>> +         * that is filled in by the GuC and read by the driver.
>>          */
>> -        unsigned long last_stat_jiffies;
>> -    } timestamp;
>> +        struct {
>> +            /** @device_vma: object allocated to hold the device 
>> level busyness data */
>> +            struct i915_vma *device_vma;
>> +            /** @device_map: access object for @device_vma */
>> +            struct iosys_map device_map;
>> +        } v2;
>> +    } busy;
>>
>>     /**
>>      * @dead_guc_worker: Asynchronous worker thread for forcing a GuC 
>> reset.
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> index 63724e17829a7..1ce595d6816f7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> @@ -59,7 +59,10 @@ struct __guc_ads_blob {
>>     struct guc_ads ads;
>>     struct guc_policies policies;
>>     struct guc_gt_system_info system_info;
>> -    struct guc_engine_usage engine_usage;
>> +    union {
>> +        struct guc_engine_usage v1;
>> +        struct guc_function_observation_data v2;
>> +    } engine_usage;
>>     /* From here on, location is dynamic! Refer to above diagram. */
>>     struct guc_mmio_reg regset[];
>> } __packed;
>> @@ -948,18 +951,62 @@ void intel_guc_ads_reset(struct intel_guc *guc)
>>     guc_ads_private_data_reset(guc);
>> }
>>
>> -u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
>> +u32 intel_guc_engine_usage_offset_pf(struct intel_guc *guc)
>> {
>>     return intel_guc_ggtt_offset(guc, guc->ads_vma) +
>>         offsetof(struct __guc_ads_blob, engine_usage);
>> }
>>
>> -struct iosys_map intel_guc_engine_usage_record_map(struct 
>> intel_engine_cs *engine)
>> +struct iosys_map intel_guc_engine_usage_record_map_v1(struct 
>> intel_engine_cs *engine)
>> {
>>     struct intel_guc *guc = &engine->gt->uc.guc;
>>     u8 guc_class = engine_class_to_guc_class(engine->class);
>>     size_t offset = offsetof(struct __guc_ads_blob,
>> - engine_usage.engines[guc_class][ilog2(engine->logical_mask)]);
>> + engine_usage.v1.engines[guc_class][ilog2(engine->logical_mask)]);
>>
>>     return IOSYS_MAP_INIT_OFFSET(&guc->ads_map, offset);
>> }
>> +
>> +int intel_guc_engine_usage_record_map_v2(struct intel_guc *guc,
>> +                     struct intel_engine_cs *engine,
>> +                     u32 guc_vf,
>> +                     struct iosys_map *engine_map,
>> +                     struct iosys_map *global_map)
>> +{
>> +    size_t offset_global, offset_engine;
>> +    struct iosys_map *map;
>> +    u32 instance;
>> +    u8 guc_class;
>> +
>> +    if (engine) {
>
> engine is not being passed as NULL in this patch, so we can drop the 
> checks in this function.
>
>> +        guc_class = engine_class_to_guc_class(engine->class);
>> +        instance = ilog2(engine->logical_mask);
>> +    }
>> +
>> +    if (guc_vf >= GUC_MAX_VF_COUNT) {
>
> Is it possible to split the code in if/else blocks into seperate 
> functions and do away with using guc_vf == ~0U to switch between the 2 
> logics.
This was the clearest way of organising it that didn't have checkpatch 
complaining about annoying things.

>
>> +        if (guc_vf != ~0U) {
>> +            guc_err(guc, "Out of range VF in busyness query: 
>> 0x%X\n", guc_vf);
>> +            return -EINVAL;
>> +        }
>> +
>> +        map = &guc->busy.v2.device_map;
>> +        offset_global = 0;
>> +
>> +        if (engine)
>> +            offset_engine = offsetof(struct 
>> guc_engine_observation_data,
>> +                         engine_data[guc_class][instance]);
>> +    } else {
>> +        map = &guc->ads_map;
>> +        offset_global = offsetof(struct __guc_ads_blob,
>> +                     engine_usage.v2.function_data[guc_vf]);
>> +        if (engine)
>> +            offset_engine = offsetof(struct __guc_ads_blob,
>> + 
>> engine_usage.v2.function_data[guc_vf].engine_data[guc_class][instance]);
>
> Recommending splitting the vf id based counter support to a future patch.
>
>> +    }
>> +
>> +    *global_map = IOSYS_MAP_INIT_OFFSET(map, offset_global);
>> +    if (engine)
>> +        *engine_map = IOSYS_MAP_INIT_OFFSET(map, offset_engine);
>> +
>> +    return 0;
>> +}
>
> <snip>
>
>> +static void __busy_v2_get_engine_usage_record(struct intel_guc *guc,
>> +                          struct intel_engine_cs *engine,
>> +                          u64 *_ticks_engine, u64 *_ticks_function,
>> +                          u64 *_ticks_gt)
>> +{
>> +    struct iosys_map rec_map_engine, rec_map_global;
>> +    u64 ticks_engine, ticks_function, ticks_gt;
>> +    int i = 0, ret;
>> +
>> +    ret = intel_guc_engine_usage_record_map_v2(guc, engine, ~0U,
>> +                           &rec_map_engine, &rec_map_global);
>> +    if (ret) {
>> +        ticks_engine = 0;
>> +        ticks_function = 0;
>> +        ticks_gt = 0;
>> +        goto done;
>> +    }
>> +
>> +#define record_read_engine(map_, field_) \
>> +    iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
>> +#define record_read_global(map_, field_) \
>> +    iosys_map_rd_field(map_, 0, struct guc_engine_observation_data, 
>> field_)
>> +
>> +    do {
>> +        if (engine)
>> +            ticks_engine = record_read_engine(&rec_map_engine, 
>> total_execution_ticks);
>> +        ticks_function = record_read_global(&rec_map_global, 
>> total_active_ticks);
>> +        ticks_gt = record_read_global(&rec_map_global, gt_timestamp);
>> +
>> +        if (engine && (record_read_engine(&rec_map_engine, 
>> total_execution_ticks) !=
>> +                   ticks_engine))
>> +            continue;
>> +
>
> engine record and global record could use separate functions, maybe like
> __busy_v2_get_engine_usage_record
> __busy_v2_get_global_usage_record
I originally had them split. But there is so much common code that it 
was much simpler code-wise to have a single function.

John.

>
> Regards,
> Umesh
>
>
>> +        if (record_read_global(&rec_map_global, total_active_ticks) 
>> == ticks_function &&
>> +            record_read_global(&rec_map_global, gt_timestamp) == 
>> ticks_gt)
>> +            break;
>> +    } while (++i < 6);
>> +
>> +#undef record_read_engine
>> +#undef record_read_global
>> +
>> +done:
>> +    if (_ticks_engine)
>> +        *_ticks_engine = ticks_engine;
>> +    if (_ticks_function)
>> +        *_ticks_function = ticks_function;
>> +    if (_ticks_gt)
>> +        *_ticks_gt = ticks_gt;
>> +}
>> +
>
> <snip>

