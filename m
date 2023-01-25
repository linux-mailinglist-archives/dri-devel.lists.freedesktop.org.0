Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DC67A80C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0039110E28D;
	Wed, 25 Jan 2023 00:56:57 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20E610E09E;
 Wed, 25 Jan 2023 00:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674608214; x=1706144214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3/FxJkmeBvDAG8CqX2rWwqSr0AyBWJ+spfq7g8GqcbI=;
 b=YBEm+pYiY1+PIWU7XUHQBNM/XbwnH+ViiArObLYCYgNeNKOQQ4ltB+B+
 cm6BkRPatMEvYyw14a6Pe7DQNShsaCCPpcZS9/7hWPW/ZQA+BDh9dagS2
 psFqrXd/wHbJR6alAN2jBWOGObOgyFSziSDJoHwIeTlyroJ0qmBACMe0N
 +Dd2UwzGeXq3IqtES6DujP26UIyLwvufXrRkqnz6k9LQQ1knvnKMK9rFs
 SwZCHEe2r8P1MiclwL5CGJHYtVfmZQd1ttLI1dxQXMAiddmhA+RFp20NV
 Nq3NjrR8mqCE2qH2OoeQbuEAgznKdxr7embYO7bQeFLhkWwxbJ6UNq84k w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306116640"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="306116640"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 16:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="725698872"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="725698872"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 16:56:53 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 16:56:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 16:56:53 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 16:56:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RX+5zzmSLnBVD7oG7kdejDS5Ic2IJkDOP0Cd43gj7nfsv6/HzTQKGwyQSm+K61FR6TiEoFB9d/T4zFSabAPmC8Yl3DEW9VuWxRdYydSj9hyTmiVtjnQdWFakTLgSIWLSQYVNKhQzw5ymWwIw1eH+xrH1fyja4xvOxDXJO0cHScvAjjGr6SWkj5ulkZmIEZlaVeH4SfYiyLyTUD9Pnj3RIOXzfgWAOnHKfjNaJ4gnggCO7frF8goHUrxwVQqLpp3Jfi+U88o9gc5SUdd2g66QgsCoyT4fT2wo1F6LaaK5OAHtSPPhyD5faQA0rzt3DbtidpczX8ZII+RJGunRp1FEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaSK5A8FLDPWUM/mZlcm/QF1pQqV8Bp3YRRN5dTy/CU=;
 b=jHcXoljFuPU9cP2lq88/i9UbXdYIhXZ55/30mJaGF4YQ32O+lwBLXiKSbAFph69ZUJFiHh4VjcoCKIGY1mOLKk6h+1rgWRVm2quMko9OdX5q0zryQghQnU0GWBuycOUHRNJNlWO8ZqH5EkKgHH7s/M9Bkr77pjH4NU6UFTB+7ZK8bqYuCNo7QVOaixUQiNauMH/u25gSZvr5fCsGfI08Vagt3NcCOqDsWo/pGjc7bXdyY15W2enI6GLGoPv/Qsord4wWZEfJ2rF5O0F5D09WLLAD1tM6eKZddzviUU9ynNL1DMSjk75Tsb7KenipKyvvZrvywhBtgNj396LngGl40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN0PR11MB5985.namprd11.prod.outlook.com (2603:10b6:208:370::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 00:56:51 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 00:56:51 +0000
Message-ID: <48b33eef-e361-21aa-e9de-8c0089951a7a@intel.com>
Date: Tue, 24 Jan 2023 16:56:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v4 3/7] drm/i915: Allow error capture without
 a request
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-4-John.C.Harrison@Intel.com>
 <ce45ea35-2ccc-4bdd-7684-da53efce3f21@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ce45ea35-2ccc-4bdd-7684-da53efce3f21@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MN0PR11MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: ad604c6c-c5f4-4fea-0332-08dafe6f0b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uZKIp/G/R24uXHljtBDT7p7BA9mrNPj9BJF+13klx5I90gI+ZC2XpmKuGE1xdg9qJQmKsDW3q7S233J+c8rkWJUOm6ohGKpzD9xt5phdOZuB74dlrjhjbx6mXc+olLwuNNwyl7VasgNi6XqVmIPnYqlcRfX8t9b+4fsDk1v8lZM/7oPKEUP3RH2wsv16dJEQ5J3IDukCteUOYJKNKci84Ed1UJwCUEhCRM+2I2edtkOpRA9cLrXoGTPqtMDJtZaWRXcp82KQDuYi9PqMjN/PYX6nPly8wAM+P+ciNaCUgeTJG44TaAguI0FvaAyfqyq9xzZeJXX5TABR9V9ZY5RU5WaXdgPs0lTDhmpkaEwXY2iOyMuBOrD53tUddD7BZBxVEvr9gsFqpfo1JNkR7KykO1FwjlLPFtD0KAQwmLY5DMC1o32hJdTEF3HOTUtKLKgTZ2BWgNLSofUXh/9WurgbAkRyOaFlu4SIRpYXTc07oqnsFz2O18vEQ+Tc7iUg2bNLf+GfoDpvqQ7ZQNyYZKs9JO0Gs9u2aFRfNa41fMAX4bHUG1Xb3ZgfYF3kM4sZ2bS4n4wnPp/xn5AYZ56XbfAf+Bzi+6XoOljCP9euGi4ITK76As1ofFcKP6RYUDeVet2rF7epBouq12r+oPSQYADr3XzGmVxA7lvayD6t9gL3Zcjdj3ISciTT4z5tGEycxNfT+CCZfJOnkzKf9lwkdCl89vxhHSsIu0x7mYCwlXoniQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199018)(2616005)(41300700001)(36756003)(5660300002)(2906002)(38100700002)(82960400001)(4326008)(186003)(83380400001)(86362001)(31696002)(478600001)(450100002)(6486002)(316002)(31686004)(66476007)(6512007)(53546011)(6506007)(26005)(8676002)(66946007)(8936002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmpKYzd0aHFpcmtSUjR4T2c5QUF6VXk3US9rcEdwd0xRNlM3R25CSFBhQUlk?=
 =?utf-8?B?UENpcUZUVUx5RlAvMTlncDRYYWQ1c0RQUWV5UWNwMWhEZU5zN2ZKMjJZLzR0?=
 =?utf-8?B?OGhCN2Uzc2s4WnB3VEZBNWNuSms3RkUzeG0rS053UlkvZTZ4ZEpyVSt3WXRY?=
 =?utf-8?B?aHFUN3FkbElDN3R5MjJnMWVDL28yWWZ1RjN3ek56M1FLVWJvQ1ZzeWdOaWZx?=
 =?utf-8?B?M00ySFpsbXQxcXVYWm05OVUycE5TMmdPdk1rbDFpTmQrN3JPUDNaUWQ0NGt5?=
 =?utf-8?B?MDVIN3NiT2tMYlBmbEYyZDlSaFZ4L1hvYmVXSU44ck1rZStDTENMcTRqTm0x?=
 =?utf-8?B?UEdoZTJWQTh6dEIxMDFVazJ0UmZzay8yWnFSVmlvREJ1Nlo5Rk5xaEZVcTVQ?=
 =?utf-8?B?U0wvYnRGVGY0RHJJSGd6SHVFK3M3Vk55QzFxY0JNNlR4K2oyRjRxWE9uWTI4?=
 =?utf-8?B?bDdIV25uUGljNDY5U0JjcW1HanVHNkk2alhVNVN0aDc3SndWd0dubC85MTdi?=
 =?utf-8?B?MXNOOGRTSENteFpZaW02Z1hpcjNDN0Zra1VQdFdhdHZBODZSNC9VRTNwRjZI?=
 =?utf-8?B?ekJDWVovMmgwUHJveFdDYUcxZ1Jwelp6cHQ4VFoxR2xhVmphVEdwaitGajh6?=
 =?utf-8?B?ajNOdk96NTUvSlhjcVNlWXJiZlhuVWMwZGJKTlV2b1gyWkt4NC9mKzQwT3NH?=
 =?utf-8?B?YnBSS1o2R1FYMDUvYUUyKzJVRnhOZmNGS3RHMnNSMTI5RGNFMG9CSStxL09Z?=
 =?utf-8?B?bndDNzBkbUdOem5VU3VrWWRpMTBjMHlNTURGNnhocVNKd05WN2ZaczRuRjRD?=
 =?utf-8?B?MCtCU0FzMmFDWTFOTGJOdlRtK0xvZGwwNGFNNHlhVWRDWHBLSUhoOGhIRGp0?=
 =?utf-8?B?VTFpNGdxOUt4SnhMS3cvNlZjNjM4VFV4WjhtQS9tTmpnaWdxaVhYM3hKZUE0?=
 =?utf-8?B?WElLMWE0eVBhY1J5UTkrNDVhTFBPbENqZFNRNEIvY1JsenlyVHlRcUo4QWxS?=
 =?utf-8?B?NzlnUVE3MTR5SG1LNVhqcnJzYldDNzE5WWc4aTRzWDZ0WFFaT0V3MS9ieEpR?=
 =?utf-8?B?dHJIUnVOZk1ZMXkrZk1BRUdUUnhsMHA1OW9WdlVvbFY0UDhFN2lpWlRNdXFi?=
 =?utf-8?B?RVMySU9va3FRUFZIeTFuZ2hnR2lDVnNyY1o5ZGdyVFRzUjg0YTZyM1JpMFhw?=
 =?utf-8?B?S29lVElrWStESlRaY2tRUHRrdUNCd0VBbnNjR0ZtbUd2a2I4ZEJiYVJUWEJY?=
 =?utf-8?B?MVJaclpJZTNSVE5yZmNtZUpjVlk3VjZKRmQwRGFiekpGVUNkSFlHSS9YNFVm?=
 =?utf-8?B?cGlUTzFZaDNsYUVRY0NYU0k3SC9CSHdvbCtxTVN0OHEyV1FjSnAvN2xMYkpx?=
 =?utf-8?B?bzcrbTU1S1JSUEFCWi81eDgvUzgzQ1gvYTdOcXVpSTUvYmFwRW4zeG9vWE1m?=
 =?utf-8?B?TUY3SmJtUGxlVHh0ZzE4N3BmVHJqQzlPYWhEUWpWOEdBVjhVRWZKMnl1VnNq?=
 =?utf-8?B?TE1UNTFDSnR3TXhLVlRKZTloNlRKUXVEaFZQZ2VZUzl0T0EyaGxDUzN0ZUcv?=
 =?utf-8?B?SWdvTStsUElGVis2cHRxS3J0ejVWZ1I1YnFBY3p0NTFQS016a1ZwS1ZLaDJD?=
 =?utf-8?B?cTNQQ1dzNnRZMndkZlJ0OGN4Ylc0WW9kanA5UXl1YllqZEhRQ2lqUDJWZnpr?=
 =?utf-8?B?NmlMd1E2SDdHUVVSWFVZS0dnbml3czNWaFF3ODRmZlJNcHlhNmpTNURwSkZL?=
 =?utf-8?B?VzkvUk50WVJ4cXpFZWRvZkJJaFhKKzlMYzRlVHVjU0pyTVd6Vy9HblEwcDY5?=
 =?utf-8?B?OElUU2wwRmZwc3FDc3pPRlhESlN4ZDhaZkZyVC9iS3Ywc256TWw5NGtjSVFN?=
 =?utf-8?B?dUNzcmhuT05OeWxBQ0JFS3JaV3A1UFd1TjYxZnUxbWRwSFVlZzl3WjNwRkN5?=
 =?utf-8?B?SitOK0MyRE5WOTgybmlNSDZKak5XRGUvSnlLUGlYQXdpSlhEaGcwb250dVVK?=
 =?utf-8?B?eldJOGZjMkxsNTVXNWdYMUxIVnJ5cHZ1RVZOMk1Zc3pMSWZNcnZWb09GTE5K?=
 =?utf-8?B?TVJMdlJXNGZVVGZYTXBuK1BZRkYzeHpiRHNsQ1I0U1Z0RW54TWgwcHM4b1Bm?=
 =?utf-8?B?dTR0RDJJTkhaY2JhL0NOazJQaGd4VGZRbFlDcGtBVnFqRDZPKzZibUhFMzBm?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad604c6c-c5f4-4fea-0332-08dafe6f0b76
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 00:56:51.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKsgTgtsOPhq7z+s1LebvrX5sN/V8qFrA6p9BGyjx+CYxMlG0m52582C3BMHSGG2657bCFoT1lc0D7v0LsivsHsPSBz7E34AL0IM0s3OzVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5985
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

On 1/24/2023 16:39, Ceraolo Spurio, Daniele wrote:
> On 1/20/2023 3:28 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There was a report of error captures occurring without any hung
>> context being indicated despite the capture being initiated by a 'hung
>> context notification' from GuC. The problem was not reproducible.
>> However, it is possible to happen if the context in question has no
>> active requests. For example, if the hang was in the context switch
>> itself then the breadcrumb write would have occurred and the KMD would
>> see an idle context.
>>
>> In the interests of attempting to provide as much information as
>> possible about a hang, it seems wise to include the engine info
>> regardless of whether a request was found or not. As opposed to just
>> prentending there was no hang at all.
>>
>> So update the error capture code to always record engine information
>> if a context is given. Which means updating record_context() to take a
>> context instead of a request (which it only ever used to find the
>> context anyway). And split the request agnostic parts of
>> intel_engine_coredump_add_request() out into a seaprate function.
>>
>> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of a null
>> pointer.
>> v3: Tidy up request locking code flow (Tvrtko)
>> v4: Pull in improved info message from next patch and fix up potential
>> leak of GuC register state (Daniele)
>
> In the very unlikely case that the capture fails, we're leaving the 
> data inside the GuC buffer. This is not new with this patch and not a 
> bug (that buffer is a ring and the stale data will be overwritten if 
> it gets full), but maybe something that can be improved as a follow-up.
Correct and correct.

John.

>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele
>
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 74 ++++++++++++++++++---------
>>   1 file changed, 50 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index b20bd6365615b..225f1b11a6b93 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct 
>> intel_engine_coredump *ee)
>>   }
>>     static bool record_context(struct i915_gem_context_coredump *e,
>> -               const struct i915_request *rq)
>> +               struct intel_context *ce)
>>   {
>>       struct i915_gem_context *ctx;
>>       struct task_struct *task;
>>       bool simulated;
>>         rcu_read_lock();
>> -    ctx = rcu_dereference(rq->context->gem_context);
>> +    ctx = rcu_dereference(ce->gem_context);
>>       if (ctx && !kref_get_unless_zero(&ctx->ref))
>>           ctx = NULL;
>>       rcu_read_unlock();
>> @@ -1396,8 +1396,8 @@ static bool record_context(struct 
>> i915_gem_context_coredump *e,
>>       e->guilty = atomic_read(&ctx->guilty_count);
>>       e->active = atomic_read(&ctx->active_count);
>>   -    e->total_runtime = 
>> intel_context_get_total_runtime_ns(rq->context);
>> -    e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
>> +    e->total_runtime = intel_context_get_total_runtime_ns(ce);
>> +    e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>>         simulated = i915_gem_context_no_error_capture(ctx);
>>   @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct 
>> intel_engine_cs *engine, gfp_t gfp, u32 dump_
>>       return ee;
>>   }
>>   +static struct intel_engine_capture_vma *
>> +engine_coredump_add_context(struct intel_engine_coredump *ee,
>> +                struct intel_context *ce,
>> +                gfp_t gfp)
>> +{
>> +    struct intel_engine_capture_vma *vma = NULL;
>> +
>> +    ee->simulated |= record_context(&ee->context, ce);
>> +    if (ee->simulated)
>> +        return NULL;
>> +
>> +    /*
>> +     * We need to copy these to an anonymous buffer
>> +     * as the simplest method to avoid being overwritten
>> +     * by userspace.
>> +     */
>> +    vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
>> +    vma = capture_vma(vma, ce->state, "HW context", gfp);
>> +
>> +    return vma;
>> +}
>> +
>>   struct intel_engine_capture_vma *
>>   intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>>                     struct i915_request *rq,
>>                     gfp_t gfp)
>>   {
>> -    struct intel_engine_capture_vma *vma = NULL;
>> +    struct intel_engine_capture_vma *vma;
>>   -    ee->simulated |= record_context(&ee->context, rq);
>> -    if (ee->simulated)
>> +    vma = engine_coredump_add_context(ee, rq->context, gfp);
>> +    if (!vma)
>>           return NULL;
>>         /*
>> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct 
>> intel_engine_coredump *ee,
>>        */
>>       vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>>       vma = capture_user(vma, rq, gfp);
>> -    vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>> -    vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>>         ee->rq_head = rq->head;
>>       ee->rq_post = rq->postfix;
>> @@ -1604,25 +1624,31 @@ capture_engine(struct intel_engine_cs *engine,
>>           return NULL;
>>         intel_engine_get_hung_entity(engine, &ce, &rq);
>> -    if (!rq || !i915_request_started(rq))
>> -        goto no_request_capture;
>> +    if (rq && !i915_request_started(rq)) {
>> +        drm_info(&engine->gt->i915->drm, "Got hung context on %s 
>> with active request %lld:%lld [0x%04X] not yet started\n",
>> +             engine->name, rq->fence.context, rq->fence.seqno, 
>> ce->guc_id.id);
>> +        i915_request_put(rq);
>> +        rq = NULL;
>> +    }
>>   -    capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>> -    if (!capture)
>> -        goto no_request_capture;
>> -    if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>> -        intel_guc_capture_get_matching_node(engine->gt, ee, ce);
>> +    if (rq) {
>> +        capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>> +        i915_request_put(rq);
>> +    } else if (ce) {
>> +        capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
>> +    }
>>   -    intel_engine_coredump_add_vma(ee, capture, compress);
>> -    i915_request_put(rq);
>> +    if (capture) {
>> +        intel_engine_coredump_add_vma(ee, capture, compress);
>>   -    return ee;
>> +        if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>> +            intel_guc_capture_get_matching_node(engine->gt, ee, ce);
>> +    } else {
>> +        kfree(ee);
>> +        ee = NULL;
>> +    }
>>   -no_request_capture:
>> -    if (rq)
>> -        i915_request_put(rq);
>> -    kfree(ee);
>> -    return NULL;
>> +    return ee;
>>   }
>>     static void
>

