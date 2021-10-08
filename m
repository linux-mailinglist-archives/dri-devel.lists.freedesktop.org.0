Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61181426F37
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 18:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E15B6E0E4;
	Fri,  8 Oct 2021 16:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13116E0AB;
 Fri,  8 Oct 2021 16:41:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="223952735"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="223952735"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 09:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="590603369"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 08 Oct 2021 09:40:49 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 09:40:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 09:40:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 8 Oct 2021 09:40:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 8 Oct 2021 09:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtVMIHK7tmg0t9dNBHx8/PPUazxqTuCSWBzi8QJFRB6wgpr7NwVtuxBKMSd44Fd5XWXtnG2HOquVX/qJwB8UriOSZC9U+8qE3KxU2aNNiQkNTtNuxWs/PSe4fNhu9VlaaOmNHVj2fIv+jvu0fdLemo9kqOgZa3WNHhot5pjvWdu/7Y/xZdnvNKfLDIm26V/pdcRmw9geYBf6MSVjLj9yRj1pm7I2Fpfkwk2UJtmw19TS/Voius7Dtvuz45M9dZaNQrOSvxUopQ6j6JfI3rDJplLFtA1iYKJM0Er3xkhSBUbxwk28rvpxpy4KPI6A2TcNIYZxpb0cEl0+gbn1AeltHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kuj7ogo8PBSFvSGVou/L3bSrlWPtZ5W2jvbdC2XVrg=;
 b=DrUAuwkHz/kciixzPyJkWnRH2FLYwXmqQp5QpqgeaIyp3LxJiWTio9ZNtM4wI8QOlH7UqxsRPGQxxdxexZcWMmz5XSRKhVLMrpV12XQxrJSvHvQhP6XT4EZHq8CCTZkRS++7tXjR30DwFm1sTWxd7tjNOm9PzzpJYca8lQ9/NsV1MLndDltKcB8OpsvVLXP/NgVpyCkyc2CMx5yKtvRLFgQQO3vJbuyoacWzuiT4YVl1Vo7L1Snq1bdIFfhYVChumOhSTJuqqaOxVl3lGn+szC3V/B4aOYVBBkT/DsHzT5TkPSb1YnPmzgWt0oCpjJKOpg64m7mNDQx3275Y9rEwTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kuj7ogo8PBSFvSGVou/L3bSrlWPtZ5W2jvbdC2XVrg=;
 b=OKU5lcbiRO98Qk2ExRwXyol81uGszO4HcVveA9oS3lhfh8zlqSR5O37lvAYWdndBoXznRBYSODWkyvHop9H8PBAUx5c7RNO6roekCm5WiVS3Y1P3ZlbnQjyAKfMyBPkoxPXDugDs6pvuYLIqDvP4WWwQKWaG+b0FrGkrcctcdi0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 16:40:47 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 16:40:47 +0000
Subject: Re: [PATCH 10/26] drm/i915/guc: Assign contexts in parent-child
 relationship consecutive guc_ids
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-11-matthew.brost@intel.com>
 <63c2eb50-b5e9-5aec-1cf8-0e0b94cb991a@intel.com>
 <20211008012151.GA24680@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <e58f0cb8-0261-1e8d-5b56-5dd69bf070e3@intel.com>
Date: Fri, 8 Oct 2021 09:40:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211008012151.GA24680@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0338.namprd04.prod.outlook.com
 (2603:10b6:303:8a::13) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0338.namprd04.prod.outlook.com (2603:10b6:303:8a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 16:40:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43677bba-5a97-4e09-0206-08d98a7a6126
X-MS-TrafficTypeDiagnostic: PH0PR11MB5660:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5660401ADD88C276DBD6F7C8BDB29@PH0PR11MB5660.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MF+6WOZgfImGlBrQjDrMB3dQLc4/fv1y3OXPOm/TKY0Wef115zD/wr+0qoJJh3Bjdu93mG4mQKWDXw8HI0/m5GwkPAG9/7ARaXFLMspEycxLOe4u+0cBTvGgWs5twHIiRO+TOV/9S3hNzF6svbO9nFuhF1UriUber6ajT6HCs/6HsAf9Zuh4qHikoz646giymulnv/Jxfjd3mChrXqpTTm3ZBn2DQ7vLjh8e9zvL9W87jclzu7KdXqi1cg60TZrHOfSh4Mc9+nZwmPnhQcbe+l2IJk49XTBLazPvOtPnyXfH3Wya7sGMtlYHC8q0rj1+mh1Tl1iAPL+Gc5WM3jZpr7BQOK9FB9IlNwAhAv2bP8p/EycH793nMcwkIqJR/j5JoBQe7prBz29Ji6UFBipZ2SKrIqRkUtH0eZK25FdHQNzaemumbu5qBvKpKOOj29UtikaNbSZr+20QnVEV6mjVPaqT6QE1EhRH1iAjW+fxrAqRS6MYN1KSDFMXXnnpYHYdS5UROAhnSy7nDjBfilgE2PMbfEAz+MTDB6r00XbquyHviXr/85brXgwSYe+FO+68VJBunVYQi5FzkjoWfuhdz/DsCE21wgir0vRPlGfgx/XCPcD8PdhIuv5LLlsALqjNmfTmq2cd7hY+3LraWgFwdJRA8rQZWmaULHVlOOMEnUHh2vaKZ3MULVlXUZgOTE8nqXX4oFuAKZziwfcAjFMkItH0wdXmg+T8kU34qBB68X64yMbkK2AiNw5MiT9ENGXk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(6862004)(86362001)(6636002)(26005)(956004)(107886003)(2616005)(316002)(16576012)(5660300002)(186003)(37006003)(38100700002)(6486002)(8936002)(508600001)(66476007)(4326008)(31696002)(66556008)(450100002)(53546011)(36756003)(2906002)(66946007)(83380400001)(8676002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekFlMkJuTjlUTmM4Rll6cTJzeEwwR1pnQ1B0RzlWNHhuYTAzTmY1Ui9RV2d4?=
 =?utf-8?B?T1g2WjdsLzFKSWM1YUo4L3l3U2kxY2ZIOGpRZkdSanZWWWdGRVljTHJZKzV3?=
 =?utf-8?B?R2lsVENXY2s1NU05dkFmNEQ2SElNZFFIblVDTW93ak8xeVlpbnFYdDNhL0Y5?=
 =?utf-8?B?NlJBSE5UMmdvUDZWcnhsYmdnRmFrS2pGd1NlN3Fyazc5NFpJWDFmeVhxck1m?=
 =?utf-8?B?NmF2UlltUWxOWnpDbWFvckVuUlJFOCtMeElaUDlaUW9RUXZ3cDl3cUY4aHpl?=
 =?utf-8?B?VjJiYU1hRGd3WU5uRHVZSXl0cnJFVWc3ejhEaWcyK1V1SDBUdjZWS1FkU3hG?=
 =?utf-8?B?U1hZZGtPNmlseDZHSGhRVFhkUzRoUkNwc1R0Y2ZNdCs2WUk2UmhCN25VelJ4?=
 =?utf-8?B?UUR2SzRwQks4K1c2YitBTUJtTFcwdXlwR2Uybkx0TjZNK0VLQ21pR1o4dlJr?=
 =?utf-8?B?WDBQQXRwc1hGQVllRUMreG5VeDdaZlFScEg4L0F6cjcrckI0cjQwaVN0eGNj?=
 =?utf-8?B?WkIvemt3RlZRUUs2SVVZd1diMWhBRS8xdUtNQ3lKVHNNclBsZXlRNDdRT25l?=
 =?utf-8?B?WlNlNFM1ODc1WXRCSDYzL3ZyUDR0V0FxdkVad1BUTXpJd1FwNXd2RE5EWWFJ?=
 =?utf-8?B?V2djTlR4UnI3ZUFwS1lNc1NzRlVxc3pSQ3lmQnY3VVl0U1A3NUhNYkdIVjJm?=
 =?utf-8?B?R3piZzRJVC9JMnVEL2M4MXBxVU5DK25TLzFDRUJXUkRXeG96SnI2S3JTWk5Q?=
 =?utf-8?B?NEN1RFk4NWpLclVSNHdUM2RLQk5TeVFEZGhpZlFuRmc3dUtKcWhWVFdGK1BK?=
 =?utf-8?B?MWJpcXRYTXk4b1ZNV24rV1NVZkVySHFUMzN4NVhaSWpqOVRpMlJLb2N5UnJW?=
 =?utf-8?B?dDE2Y1p0Zmo2VzRaeis3am84WHZPUEw3VEJHbWYyRXdjaXYrbkFwdXEzWmh6?=
 =?utf-8?B?RjRYT1lzcUZwRzJGMXRBaVE0VjZOdmNhYmNoN205YzViMFBEMjE3S2tZd0cx?=
 =?utf-8?B?SkxyQzExWGxuOVRPQUZScTQ1OXdHRGRVNTlFSklWSHpobHJKRlNBQm9oODdp?=
 =?utf-8?B?akF1Ukd3cTlHeXJpSy9NbndzcGJYOFgzYVhkSTVHSkRadjljUUx1ZWZJQlAr?=
 =?utf-8?B?cXg2SURaRGpuODVRQWJ0R2thUUVTVnk3KzRqcG50N0hMRGZ2M2dEdEJWRjQv?=
 =?utf-8?B?cFNtb2N1Q254OTM5dmM4R3pHemlpWEsvNVFVTG5YN0hvK3g2VXhONWJHRXV3?=
 =?utf-8?B?Y2xWTHQzMDhPSW5xWTgrdm1rVVo3SzNiMVQ4amNmZ0wrWklXSTl1NEpKV0Vy?=
 =?utf-8?B?L0hUQlltUTBDZ1V1UmRPWXJuZXQ0d0hwOExwdVB4ZCtxdWRwZ3EyOFpuaG5u?=
 =?utf-8?B?ekF0YXBtYnBYMVhXb3pCdDJkTHFKWm5LUEZ2TlZZOHNzYTN4Smh1WjdnWjVi?=
 =?utf-8?B?Mnc5NE85SnF4YmYvTjkwU3dnSkJnQmFEUzNIcElVNzZJSUhJSG9qdjY3RjlI?=
 =?utf-8?B?VlVkT0ZrMXBaY0p3aGVZUjc0TW05RmRZL3dPWkJRTTZVTVR6clI0Q0dwWkxG?=
 =?utf-8?B?VGhkMnNRY09HaXZ2OUdMZiszdWdIUysyQ2lHRkVZckVrWUhCRVA2NjV0RVl0?=
 =?utf-8?B?YVVwd0hnTnAyZEtiOHBVc2VFdGI0Z0NpS00xamdLTHQxSjMwWFo4YmpGRy9V?=
 =?utf-8?B?dUF6Yzc0MnVYQjQzWlVDazNwdW5CK1ROTHg3S0F6T1lJMXgxUmkyZ21xTG1D?=
 =?utf-8?Q?OcupPGsMTT5Qa2CJ+HlZSksHY3WjFsDkC/pvvDi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43677bba-5a97-4e09-0206-08d98a7a6126
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 16:40:47.2141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksv8C0X+Hf7n56yprSCiziXr2OKoCrvskDgP+BN/lf8Lmqay/nMITS6hc90Ubb3Q3v9lwLQqcP/p12xz1GhgrhWobCdrGTpyItIMOjpJJFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5660
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

On 10/7/2021 18:21, Matthew Brost wrote:
> On Thu, Oct 07, 2021 at 03:03:04PM -0700, John Harrison wrote:
>> On 10/4/2021 15:06, Matthew Brost wrote:
>>> Assign contexts in parent-child relationship consecutive guc_ids. This
>>> is accomplished by partitioning guc_id space between ones that need to
>>> be consecutive (1/16 available guc_ids) and ones that do not (15/16 of
>>> available guc_ids). The consecutive search is implemented via the bitmap
>>> API.
>>>
>>> This is a precursor to the full GuC multi-lrc implementation but aligns
>>> to how GuC mutli-lrc interface is defined - guc_ids must be consecutive
>>> when using the GuC multi-lrc interface.
>>>
>>> v2:
>>>    (Daniel Vetter)
>>>     - Explicitly state why we assign consecutive guc_ids
>>> v3:
>>>    (John Harrison)
>>>     - Bring back in spin lock
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +-
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 104 ++++++++++++++----
>>>    2 files changed, 86 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> index 25a598e2b6e8..a9f4ec972bfb 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> @@ -76,9 +76,13 @@ struct intel_guc {
>>>    		 */
>>>    		spinlock_t lock;
>>>    		/**
>>> -		 * @guc_ids: used to allocate new guc_ids
>>> +		 * @guc_ids: used to allocate new guc_ids, single-lrc
>>>    		 */
>>>    		struct ida guc_ids;
>>> +		/**
>>> +		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
>>> +		 */
>>> +		unsigned long *guc_ids_bitmap;
>>>    		/**
>>>    		 * @guc_id_list: list of intel_context with valid guc_ids but no
>>>    		 * refs
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 1f2809187513..79e7732e83b2 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -128,6 +128,16 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>>>    #define GUC_REQUEST_SIZE 64 /* bytes */
>>> +/*
>>> + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
>>> + * per the GuC submission interface. A different allocation algorithm is used
>>> + * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
>>> + * partition the guc_id space. We believe the number of multi-lrc contexts in
>>> + * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
>>> + * multi-lrc.
>>> + */
>>> +#define NUMBER_MULTI_LRC_GUC_ID		(GUC_MAX_LRC_DESCRIPTORS / 16)
>>> +
>>>    /*
>>>     * Below is a set of functions which control the GuC scheduling state which
>>>     * require a lock.
>>> @@ -1206,6 +1216,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
>>>    	INIT_WORK(&guc->submission_state.destroyed_worker,
>>>    		  destroyed_worker_func);
>>> +	guc->submission_state.guc_ids_bitmap =
>>> +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
>>> +	if (!guc->submission_state.guc_ids_bitmap)
>>> +		return -ENOMEM;
>>> +
>>>    	return 0;
>>>    }
>>> @@ -1217,6 +1232,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>>>    	guc_lrc_desc_pool_destroy(guc);
>>>    	guc_flush_destroyed_contexts(guc);
>>>    	i915_sched_engine_put(guc->sched_engine);
>>> +	bitmap_free(guc->submission_state.guc_ids_bitmap);
>>>    }
>>>    static inline void queue_request(struct i915_sched_engine *sched_engine,
>>> @@ -1268,18 +1284,43 @@ static void guc_submit_request(struct i915_request *rq)
>>>    	spin_unlock_irqrestore(&sched_engine->lock, flags);
>>>    }
>>> -static int new_guc_id(struct intel_guc *guc)
>>> +static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    {
>>> -	return ida_simple_get(&guc->submission_state.guc_ids, 0,
>>> -			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
>>> -			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>> +	int ret;
>>> +
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>> +
>>> +	if (intel_context_is_parent(ce))
>>> +		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
>>> +					      NUMBER_MULTI_LRC_GUC_ID,
>>> +					      order_base_2(ce->parallel.number_children
>>> +							   + 1));
>>> +	else
>>> +		ret = ida_simple_get(&guc->submission_state.guc_ids,
>>> +				     NUMBER_MULTI_LRC_GUC_ID,
>>> +				     GUC_MAX_LRC_DESCRIPTORS,
>>> +				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
>>> +				     __GFP_NOWARN);
>>> +	if (unlikely(ret < 0))
>>> +		return ret;
>>> +
>>> +	ce->guc_id.id = ret;
>>> +	return 0;
>>>    }
>>>    static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    {
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>> +
>>>    	if (!context_guc_id_invalid(ce)) {
>>> -		ida_simple_remove(&guc->submission_state.guc_ids,
>>> -				  ce->guc_id.id);
>>> +		if (intel_context_is_parent(ce))
>>> +			bitmap_release_region(guc->submission_state.guc_ids_bitmap,
>>> +					      ce->guc_id.id,
>>> +					      order_base_2(ce->parallel.number_children
>>> +							   + 1));
>> There was a discussion on the previous revision about adding a BUG_ON to
>> ensure that number_children cannot change between the bitmap alloc and the
>> bitmap release. I'm not seeing the new BUG_ON mentioned in this patch.
>>
> I thought you meant to add a BUG_ON to ensure before we release a region
> / id it is occupied? I looked in both the bitmap API and ida API and
> neither have a function that checks if region / id is occupied so can't
> really add a BUG_ON for that.
>
> How much you add BUG_ON to ensure the number of children canoot change
> between alloc and release? I don't follow how that would work.
>
> Matt
I was thinking that where number_children is modified, you have a 
BUG_ON(guc_id_is_valid). That would ensure that the release has to match 
the alloc. Hmm, you already have a BUG_ON about the parent/child not 
being pinned in intel_context_bind_parent_child(), which I guess covers 
it because you shouldn't have a guc_id if you aren't pinned, right? And 
that is the only function which can modify number_children, yes? So 
maybe it's all good?

John.

>
>> John.
>>
>>
>>> +		else
>>> +			ida_simple_remove(&guc->submission_state.guc_ids,
>>> +					  ce->guc_id.id);
>>>    		reset_lrc_desc(guc, ce->guc_id.id);
>>>    		set_context_guc_id_invalid(ce);
>>>    	}
>>> @@ -1296,49 +1337,64 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>    }
>>> -static int steal_guc_id(struct intel_guc *guc)
>>> +static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    {
>>> -	struct intel_context *ce;
>>> -	int guc_id;
>>> +	struct intel_context *cn;
>>>    	lockdep_assert_held(&guc->submission_state.lock);
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>> +	GEM_BUG_ON(intel_context_is_parent(ce));
>>>    	if (!list_empty(&guc->submission_state.guc_id_list)) {
>>> -		ce = list_first_entry(&guc->submission_state.guc_id_list,
>>> +		cn = list_first_entry(&guc->submission_state.guc_id_list,
>>>    				      struct intel_context,
>>>    				      guc_id.link);
>>> -		GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>>> -		GEM_BUG_ON(context_guc_id_invalid(ce));
>>> +		GEM_BUG_ON(atomic_read(&cn->guc_id.ref));
>>> +		GEM_BUG_ON(context_guc_id_invalid(cn));
>>> +		GEM_BUG_ON(intel_context_is_child(cn));
>>> +		GEM_BUG_ON(intel_context_is_parent(cn));
>>> -		list_del_init(&ce->guc_id.link);
>>> -		guc_id = ce->guc_id.id;
>>> +		list_del_init(&cn->guc_id.link);
>>> +		ce->guc_id = cn->guc_id;
>>>    		spin_lock(&ce->guc_state.lock);
>>> -		clr_context_registered(ce);
>>> +		clr_context_registered(cn);
>>>    		spin_unlock(&ce->guc_state.lock);
>>> -		set_context_guc_id_invalid(ce);
>>> -		return guc_id;
>>> +		set_context_guc_id_invalid(cn);
>>> +
>>> +		return 0;
>>>    	} else {
>>>    		return -EAGAIN;
>>>    	}
>>>    }
>>> -static int assign_guc_id(struct intel_guc *guc, u16 *out)
>>> +static int assign_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    {
>>>    	int ret;
>>>    	lockdep_assert_held(&guc->submission_state.lock);
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>> -	ret = new_guc_id(guc);
>>> +	ret = new_guc_id(guc, ce);
>>>    	if (unlikely(ret < 0)) {
>>> -		ret = steal_guc_id(guc);
>>> +		if (intel_context_is_parent(ce))
>>> +			return -ENOSPC;
>>> +
>>> +		ret = steal_guc_id(guc, ce);
>>>    		if (ret < 0)
>>>    			return ret;
>>>    	}
>>> -	*out = ret;
>>> +	if (intel_context_is_parent(ce)) {
>>> +		struct intel_context *child;
>>> +		int i = 1;
>>> +
>>> +		for_each_child(ce, child)
>>> +			child->guc_id.id = ce->guc_id.id + i++;
>>> +	}
>>> +
>>>    	return 0;
>>>    }
>>> @@ -1356,7 +1412,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    	might_lock(&ce->guc_state.lock);
>>>    	if (context_guc_id_invalid(ce)) {
>>> -		ret = assign_guc_id(guc, &ce->guc_id.id);
>>> +		ret = assign_guc_id(guc, ce);
>>>    		if (ret)
>>>    			goto out_unlock;
>>>    		ret = 1;	/* Indidcates newly assigned guc_id */
>>> @@ -1398,8 +1454,10 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    	unsigned long flags;
>>>    	GEM_BUG_ON(atomic_read(&ce->guc_id.ref) < 0);
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>> -	if (unlikely(context_guc_id_invalid(ce)))
>>> +	if (unlikely(context_guc_id_invalid(ce) ||
>>> +		     intel_context_is_parent(ce)))
>>>    		return;
>>>    	spin_lock_irqsave(&guc->submission_state.lock, flags);

