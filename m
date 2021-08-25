Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3773F6D38
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 03:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4946E0FC;
	Wed, 25 Aug 2021 01:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D4489B38;
 Wed, 25 Aug 2021 01:51:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217435146"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="217435146"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 18:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="685895901"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2021 18:51:22 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 18:51:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 18:51:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 18:51:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHDEP/E/58UTEYIN78WrrIzyPbMX2ljUJZ8Ptr7iXdmGjfFcx9TUxQYWITemwJ9sbEfnMuXFdp9Hum/HU9MggvHiFLKEFdAgLtbR7AzwayaHEqKwzN/la4BD7NXJvt4thKhSdG8Eb+OYOewMvmRGNUyLaPa1/+y73T4rz70JbhhbEGSvv9bjdGVwiISiHrwAGkv2X1kTvgu8xAwnVDpGs4U73ncYRmbohjPqMwK/1tWR3gLSaty1Th9W3XPznQe0ERCD5lH/2vvIhu4kuvaNAm5T5tjiYBwvD08B734tXdh4IsHb4sVkgDVCxTmwsf9oR8L8O9TM+PTtLJNInC6B1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu/jooDT2+MZeGFddU1scGUnCtR/orfoI7GD2TyoQkQ=;
 b=NgVqfrER9Ijvbb9XLrb1wRgkg19Cz3ici9oZVFJTtRF0AsGk++CA+9PQHqM6UF4+0vBZ/6fJ/D5YjJsM5x5bse65Hp5y56kB5yz88I+tgCMpRXzHdEjTTMS6JETManY1A7lSR6JKmstWyVdeW9G8VmmqNbvCtxDUa9DM8SKHAQ9q78VQ9Pz1lRGi+PdoQk96Zlx/ZfWvl9BXzMgyTQOEnJBWX6DN7/GgNZ+vqOTGP5DSMWpqZuFfJj1SDElpRvFZe+bBdL8lc0L1jVqLXNDAF1U2g6Ue3rK4uTkkC6O/p4bX0VNeML9te7nDjt9neye+Ff42q1SwmX31WKy9a7hVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu/jooDT2+MZeGFddU1scGUnCtR/orfoI7GD2TyoQkQ=;
 b=hwpxtdbwO2o2KlcbwoplsHT2xj8V7HDd6b7rIqrjNH7YarfsSnxFTCxF2bddMAnwariH5Ay9X9DGdXaZk952XCZoBiLHKN8UmND1Wwp9SzvcgfTDVFYIBHcjRql/Y9GeIOHPQcqL1T07kYhslE/7CLv0YCNWRlx25H3tMlxusRc=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 01:51:19 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 01:51:19 +0000
Subject: Re: [Intel-gfx] [PATCH 14/27] drm/i915/guc: Don't touch
 guc_state.sched_state without a lock
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-15-matthew.brost@intel.com>
 <c7a09b2d-b5f2-49ea-01b9-f9b9fbbe7824@intel.com>
 <20210825014414.GA12621@jons-linux-dev-box>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <b3662da3-00c0-249f-66e7-d5249a9f4c9a@intel.com>
Date: Tue, 24 Aug 2021 18:51:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210825014414.GA12621@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BY3PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:39a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 01:51:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae1c74c3-5bb4-451b-a867-08d9676ad519
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR11MB5332CDC1CF6CDAE6E708A9C7F4C69@CH0PR11MB5332.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VbfZSjaKzenKECMyyfSgAI9FBBAdggGCUnEJucVaVcMjRujqy2wJXaZv/9Rk4FwsVzoXvh/9sdcrHgrxPIUM10DuefO6Fs6bkno3Kerv+kQQ237a90GtN2YeK7xKk2IwnCbiv1gnf3JcJSlRaa/B7eCEAQaFfFKnXaac7vEfihZMJ2mnZ5JZ6/yGRxdxxGZkidX9iDoIVmasLsfLM57/4w087XyyyG/gYRMiZ7YjDfU91lygwDv6oTRPxQWHIPZp1CA+NQwHSEs+N6OrxaR4dwi1N8VyV5qxIlBtCSQ90oqgUQJ7QVv7yhSypkY/EyqS6IrWPtz/vKX4616prqcm5G9Ul0bvvi3Bef+r8Rg/dEauf4JbqsYKrxWVY95Hj+Gb5bzpE0x0dnwMm+e9c05JNnBTREX3Hkj45/APExfSHcf5sRp/26ZAcDQBYSJP+UCpL+O7IXRQbRj2QDO4ID/H8tCEYB/83/+xw4knAIbAiYry9IlQMIfxaXnePE0hG+MVN56TiyRZ+1zDnO+xUqnGDyfqcsQ2o41+Z59nztc1Fqe1KcBLsvlh4lVQMD5OMcO9HizIH6VqFDG+Vz3xbRjMd6/NGB/JIAp8zMPTzqXRXGZ/KXyV3FTYXQVAPU1wB4yUW49XVp3bHpbHFEXwpA1nXADtO8BaOFCQJOwBYsDnZizZolpUuz8dWyAW3QqjhRyxodBb/8jeE7OgzE889KIQrLPBvsbm9OYoycQIDztQB5DpPSDqAHRqvNbX6UInUvZTII4HCP31rO3j2kTDO1rYzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(16576012)(37006003)(5660300002)(4326008)(6862004)(316002)(478600001)(2616005)(956004)(31696002)(2906002)(83380400001)(6636002)(86362001)(8936002)(31686004)(26005)(38100700002)(186003)(36756003)(66476007)(66556008)(66946007)(6666004)(53546011)(6486002)(8676002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzRCaW5YM0pjc2w4cWxtN1FuTndaOHgrSlh2NE1wcGhiL216M1dPU21xUXhF?=
 =?utf-8?B?TlhhQ3Q3M2RxZExOU3hiODl0Uyt4czVKaFN3M2Nwd0JlY1FQbmVwbEY2cWJG?=
 =?utf-8?B?ZGdITjJIL3BOMnpwNDBrZWI0QjJXZE9EMldDUmFETkJDR0xzb3FtRERQZ2Nr?=
 =?utf-8?B?NWxoU0hVTXZVYTZCZmk1TkVacDU4TXVBYmNPVk5tdTF3TUwwVFRabGxwWFlw?=
 =?utf-8?B?K3JML2hsZ2JxN0VhYXNFUVh3R2t1dGxKQ1pYUm5mY3F3V3JWZEhIUDV3dDY5?=
 =?utf-8?B?RWptcE4xNkphZ0JuVDJzZTRKbzZXQ1ZOcUFWSzA0QTBXNDVPRzQvU3FFckNC?=
 =?utf-8?B?K011cmZlV2M5bEJ6c0NlMk1rUkxpWkVXdy9QRHgxNHQvajU4ZyttcXRkUU5r?=
 =?utf-8?B?R05FOTZkc3dvQlhCTlo4MWh1eHlkS3Q2bmFjZ0lTRTVMSG96WUlyd2NDSXA4?=
 =?utf-8?B?RTFGNXNyMFR1bU9rUTdDQUIvSlVvc05LTXZGWkFsYUJrM09BTk9JQjBLeE42?=
 =?utf-8?B?L1pROGNHblpuVFBTcEg4NTdBUzRVckV6QjkvUDJCN3lHM01ydFZIbExIb284?=
 =?utf-8?B?SGQzWUtsSnB6TG5ZWmcwVjRSWkorL20rTExMRVRmaTAwTU90ZFFZTXNHVWhm?=
 =?utf-8?B?SGQ2RTcxQ2Z0aTBkZU1DUi9HNEVLbDNVcjFTRjZXZmMvUEZqOFFxY0w2OTJO?=
 =?utf-8?B?U1lkS0t3TkdqN09tbno2MDdRMEpjRm91YysvYUhCVjZHQVppQ1pUMHh3T0Ry?=
 =?utf-8?B?aDQ5aHphaGpKZTRERUwwNUJ3VEVvckp5S1Q4ZElCUTVTaHpUdXpmUVdyR2Zz?=
 =?utf-8?B?VzBTTlRyNmlwbHNaWnlMamdkRjlYT0tPRUFzTnVreXZvMUZISGcxanVwQ3BQ?=
 =?utf-8?B?b2ZyM0pWVHVVM0ZRcEpTOG5SRk9zRW01NGlFRFRSWmJGNndSbDV6MnpLa0tO?=
 =?utf-8?B?ckduWm5kb3ZiUFRBSm53RnR1QVBUT0NNTysyanhMUk5kZ3k2ZjNVY1RNZnow?=
 =?utf-8?B?N0pSY2NqUUtwN00yUUhuSG45TXhVcVJ5MDlaSndHK1J3RkUrK1F4QXBjbVht?=
 =?utf-8?B?Y1FSa0ZIMUsrOW5jamh2OTZCY2JxYWQrQVZJVzdIMTV3bTVYNXBDUVJEbDZj?=
 =?utf-8?B?YkNsME15R1ZlK2RQd2U4RXozZ2hMTE1TWUx3Y0V3QVlBNTJibmkraUFSR2Nu?=
 =?utf-8?B?S2ZUYnkzUWlqQWJVWk9Ea0RXSS9mWnlDNnlwa3RoU05XU1NUYmlWY3FBcCtG?=
 =?utf-8?B?V2hVSUlqaDM0TmdGSWk2ZUVvQnFXTCtHV3pJckpRUk54Ky9MRDNJTVhWbytr?=
 =?utf-8?B?eGNDd1J5Wkp3ckdIUkZmWmJsaU1PK3JVOGp4UXhFc2ozREZhR0J1cm5qUy9j?=
 =?utf-8?B?TG04QVFsUHQySklnSmRpQ01HTllZQjAyclJ6V2lYem5HSm1BbjUrZ3praDRR?=
 =?utf-8?B?Q2NwcWkxYmZUVlNsVEF0eGJzZ1VublFtUGxpUjZSN2Q2bXp5QzlIaXN1eXJQ?=
 =?utf-8?B?TlZYeWxmQVlady84Q1ZGOXk3U1E1eElGT2VJTmgzZDkxSy85ZWloSUhsalNG?=
 =?utf-8?B?bzU3YTBZUW14aXdqODdyZGRjNHVmT0ovRDl4cXNGTForYk1FbUxZWWNwdTRI?=
 =?utf-8?B?cTMyZW5VOUZtY2I0bXgwVEFkdjhVdHdlNHBaUllVcGVFWVpNWGJsenNCY3Rt?=
 =?utf-8?B?endsdkJOWnNTZitYRWErcGpTak1yUEh3WlRmRnc1RTkzaTJXMEt2ejV6NVZF?=
 =?utf-8?Q?YxlPPVi1IRkYN2MktVkXIqcI3iS2drwjrcVwarO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1c74c3-5bb4-451b-a867-08d9676ad519
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 01:51:19.1129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJidY4ytKi3AD8i73iMDsha4N9T7fJ0q2pBqytTz+YS62A0bGBxi7iW5/bbnb5UfDvILMLx3D+OcO6sAMEHXkk7XCJsB7feRnBoagOzoq1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5332
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



On 8/24/2021 6:44 PM, Matthew Brost wrote:
> On Tue, Aug 24, 2021 at 06:20:49PM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 8/18/2021 11:16 PM, Matthew Brost wrote:
>>> Before we did some clever tricks to not use the a lock when touching
>>> guc_state.sched_state in certain cases. Don't do that, enforce the use
>>> of the lock.
>>>
>>> Part of this is removing a dead code path from guc_lrc_desc_pin where a
>>> context could be deregistered when the aforementioned function was
>>> called from the submission path. Remove this dead code and add a
>>> GEM_BUG_ON if this path is ever attempted to be used.
>>>
>>> v2:
>>>    (kernel test robo )
>>>     - Add __maybe_unused to sched_state_is_init()
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> ---
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 58 ++++++++++---------
>>>    1 file changed, 32 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 85f96d325048..fa87470ea576 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -150,11 +150,23 @@ static inline void clr_context_registered(struct intel_context *ce)
>>>    #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
>>>    static inline void init_sched_state(struct intel_context *ce)
>>>    {
>>> -	/* Only should be called from guc_lrc_desc_pin() */
>>> +	lockdep_assert_held(&ce->guc_state.lock);
>>>    	atomic_set(&ce->guc_sched_state_no_lock, 0);
>>>    	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
>>>    }
>>> +__maybe_unused
>>> +static bool sched_state_is_init(struct intel_context *ce)
>>> +{
>>> +	/*
>>> +	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
>>> +	 * suspend.
>>> +	 */
>> This seems like something we want to fix. Not a blocker for this, but we can
>> add it to the list.
>>
> Right, hence the comment in the code.
>   
>>> +	return !(atomic_read(&ce->guc_sched_state_no_lock) &
>>> +		 ~SCHED_STATE_NO_LOCK_REGISTERED) &&
>>> +		!(ce->guc_state.sched_state &= ~SCHED_STATE_BLOCKED_MASK);
>>> +}
>>> +
>>>    static inline bool
>>>    context_wait_for_deregister_to_register(struct intel_context *ce)
>>>    {
>>> @@ -165,7 +177,7 @@ context_wait_for_deregister_to_register(struct intel_context *ce)
>>>    static inline void
>>>    set_context_wait_for_deregister_to_register(struct intel_context *ce)
>>>    {
>>> -	/* Only should be called from guc_lrc_desc_pin() without lock */
>>> +	lockdep_assert_held(&ce->guc_state.lock);
>>>    	ce->guc_state.sched_state |=
>>>    		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
>>>    }
>>> @@ -605,9 +617,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>>>    	bool pending_disable, pending_enable, deregister, destroyed, banned;
>>>    	xa_for_each(&guc->context_lookup, index, ce) {
>>> -		/* Flush context */
>>>    		spin_lock_irqsave(&ce->guc_state.lock, flags);
>>> -		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>>    		/*
>>>    		 * Once we are at this point submission_disabled() is guaranteed
>>> @@ -623,6 +633,8 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>>>    		banned = context_banned(ce);
>>>    		init_sched_state(ce);
>>> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>> +
>>>    		if (pending_enable || destroyed || deregister) {
>>>    			decr_outstanding_submission_g2h(guc);
>>>    			if (deregister)
>>> @@ -1325,6 +1337,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>>    	int ret = 0;
>>>    	GEM_BUG_ON(!engine->mask);
>>> +	GEM_BUG_ON(!sched_state_is_init(ce));
>>>    	/*
>>>    	 * Ensure LRC + CT vmas are is same region as write barrier is done
>>> @@ -1353,7 +1366,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>>    	desc->priority = ce->guc_prio;
>>>    	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>>    	guc_context_policy_init(engine, desc);
>>> -	init_sched_state(ce);
>>>    	/*
>>>    	 * The context_lookup xarray is used to determine if the hardware
>>> @@ -1364,26 +1376,23 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>>    	 * registering this context.
>>>    	 */
>>>    	if (context_registered) {
>>> +		bool disabled;
>>> +		unsigned long flags;
>>> +
>>>    		trace_intel_context_steal_guc_id(ce);
>>> -		if (!loop) {
>>> +		GEM_BUG_ON(!loop);
>>> +
>>> +		/* Seal race with Reset */
>>> +		spin_lock_irqsave(&ce->guc_state.lock, flags);
>>> +		disabled = submission_disabled(guc);
>>> +		if (likely(!disabled)) {
>>>    			set_context_wait_for_deregister_to_register(ce);
>>>    			intel_context_get(ce);
>>> -		} else {
>>> -			bool disabled;
>>> -			unsigned long flags;
>>> -
>>> -			/* Seal race with Reset */
>>> -			spin_lock_irqsave(&ce->guc_state.lock, flags);
>>> -			disabled = submission_disabled(guc);
>>> -			if (likely(!disabled)) {
>>> -				set_context_wait_for_deregister_to_register(ce);
>>> -				intel_context_get(ce);
>>> -			}
>>> -			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>> -			if (unlikely(disabled)) {
>>> -				reset_lrc_desc(guc, desc_idx);
>>> -				return 0;	/* Will get registered later */
>>> -			}
>>> +		}
>>> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>> +		if (unlikely(disabled)) {
>>> +			reset_lrc_desc(guc, desc_idx);
>>> +			return 0;	/* Will get registered later */
>>>    		}
>>>    		/*
>>> @@ -1392,10 +1401,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>>    		 */
>>>    		with_intel_runtime_pm(runtime_pm, wakeref)
>>>    			ret = deregister_context(ce, ce->guc_id, loop);
>>> -		if (unlikely(ret == -EBUSY)) {
>>> -			clr_context_wait_for_deregister_to_register(ce);
>>> -			intel_context_put(ce);
>> Why is the EBUSY case not applicable anymore?
>>
> Commmit message cover this - this is dead code that can't be reached
> in the current code nor can be it be reached in upcoming code. Or put
> another way loop is always true thus we can't get -EBUSY from
> deregister_context().

ok, I hadn't realized that we could get -EBUSY only if loop=false.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> Matt
>
>> Daniele
>>
>>> -		} else if (unlikely(ret == -ENODEV)) {
>>> +		if (unlikely(ret == -ENODEV)) {
>>>    			ret = 0;	/* Will get registered later */
>>>    		}
>>>    	} else {

