Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7167E76EE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 03:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4884410E412;
	Fri, 10 Nov 2023 02:01:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671C110E40F;
 Fri, 10 Nov 2023 02:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699581675; x=1731117675;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aKez55DoCvg4lVhH14AQFC05OsFiv1kjfoqrIHMv+sA=;
 b=Ii2e3oq9XZCganH4N00PwyYdQSSqfVcd/DIorSVCDgwTQ+heG/V2Nqvh
 c5gXiBS0156VKJs5E20ZSn6UzyI9lV+7xzmWRRBLQ8PgWE5eyJmUbZMVn
 qRl6yFhvaGfT02QUDSPsvSZER59W9Nx75FXh9CPeC3HNtfa24LrtM54Ip
 lJ9A+8JQ01/YN24ApykXKtY5g1mnkEzWDjdOP6rE1HhnhUCe7tMiaD/Ko
 IcZtMujE5hn5KSpNkI9bxcAfownk4yONaJHHaFuyJ+Pn53wuPSDsNMwHF
 XPZS7m0q1BffUI+lrhIruxVDaUW72G+i+rFk6uISPeGwmEU05IPnEmIMG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375155528"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="375155528"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 18:01:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="854264072"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="854264072"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 18:01:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 18:01:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 18:01:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 18:01:13 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 18:01:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mN7EWSX5cQs77F1CWIkoRz7OjAyC/htRE7Gj3rP+QYgSdMz5zm+O/YeauaNuXz6VucHK9wqDhvLi+Z7pcSegew9ZsBRpJ3j3Iz7WBEcURmIXjRRmmJ/EM//B8nfNUWubhPhTyUh6MIi//MOqy7eG3pMrRHtmQJPuyB8Pdddagf0l3Qr8mE72V/7aEzrbX8BsxSnlUXPkPmbI9ye2vFycwSrQQiXA32YMofMu3/NtdnRpyKKb3BrBPctAiNKhCzC0uQ8LQPh8bOYSUM2hgq6+6isXm/WI03Wd9Y2JaLpzELuyGZgqdDW3sQnBg+LzGJV5hbWLIxRWjqJwQu6Ndtyssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwwRIIRVUOF0DnEZk9HG7ajmCttQwMLbhQSPdwRGqwE=;
 b=jnWzkP9qm4WhfEWQWuPxFQPuSpW/CXlhRaE2LcK5TCSIpPVlZJI0rEMVvMA8D1EgoCsan2zbkcLPQjwCIz+VRmBe5K7LjkChgc6hOq+r6kpo9fIzx2kUs2Cvl3NPPL097kqDytU3J6QWJdXwozXqKsvKl2S1kPik/ckCT3fzAOxK5ZHcT/B+PtBsYitInwMZlw2JT5YRUZwDLtJoFa/g9mlc8FbOPrzwydkq/Zj3SHotxs8Mzy2tpEc2pNF6dCrJm/NUEsfgxSohZe6YKLAJwi/FskWRsvjkQRWk6d+Kl+zFo980pFkWkim6gcF+GIvpYVmfZmIMWKd6/Ejq35/vcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 02:01:05 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 02:01:04 +0000
Message-ID: <0994d04e-0ea9-4537-a6e6-b96eaf096005@intel.com>
Date: Thu, 9 Nov 2023 18:01:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Add a selftest for
 FAST_REQUEST errors
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20231106235929.454983-1-John.C.Harrison@Intel.com>
 <20231106235929.454983-3-John.C.Harrison@Intel.com>
 <552c0af3-9a03-4211-a7de-8bd1f9d4f5cf@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <552c0af3-9a03-4211-a7de-8bd1f9d4f5cf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 56be4958-7d9b-411c-5203-08dbe190e5a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Nqg77d59NgNy4nqZInLfdXfxOQK38kjV1wZ30JabiQ6mLw7titvURxr9m4qSc/XjKle55r3RZwBlWNyC6tM9sV7phHR2QnBoLdOIcGQEkTl7niIevX2A0lA+AqkAQ1KT1mIhR10c1NWzo66q55snB0Bc6pZXmUaOrsBZ77ccj/DKn6dwuR21PFr80az2w5gbllf/KQCDU5fyPnPDzTXlcHhphHse8J/XCbBI3/560fO/9ylJRZdIBkWLUIOpxtywtUDvL+e7YBTDtT6COBThNDDGGtWoyVeYQj2AaVpqEDm3veGWjbB3bt4XvK1WFYO4HTF/D2VB6CJxmr6reZeT6vf9E0poeO2AE9+imDKBedyCqVxbQOJxPp3lcNFK2lgoYxiiLunzjQU60hHaUhKCQoHRSYA9nTTmJLVAPgkemRDiKaOxAXM4lt3VQm0V8mY91P1UR2DjCQpl4lykeUhc6x1eeCusA3ppdEmxVNPjakc53kqXJHkv6+Eao0dQXgfxEKgpAp6so7BE46sGrZN4l38muPcdlFpORP/wA6x2dgQq/ueLRSJeRCUgg6xQP1hSaJsQGvE4UGEXHik8Jylb3R4dHTNNFkDYRrUQ2vqFAj8wykY7K7ZqRwIqR8ZHCZKXK4B3y08qzFmMTqhoLN56g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(5660300002)(4326008)(2906002)(82960400001)(8936002)(450100002)(41300700001)(38100700002)(86362001)(31696002)(6506007)(53546011)(2616005)(6512007)(36756003)(8676002)(26005)(83380400001)(31686004)(66476007)(66556008)(6486002)(478600001)(66946007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE02WkdRM0NwWmxmYkwzQWVKclh0bDUrYWVQTjlRNUE5aDBCSlBSM0lmNWkz?=
 =?utf-8?B?dnlvMGloaUlyZ0tIZDBXWldMMmtTaWx6MForK1h4S3RyZXJPWDI4NHowQjQ3?=
 =?utf-8?B?eGNaT2hBaXFta3B4amRKMG5BQnQ5NkwwY0Y0dHFoOStHcW40ditMVThVTXY3?=
 =?utf-8?B?WTY1RzI5WGY5YlZ6MzFzTHBZazFjT2pxa2Z3RnVSS1BPcjhMd3F0VXo4enM3?=
 =?utf-8?B?K1M0ZUFSMXQrQlg1cEdseFBDU1hqUXlHRjFRWWora01SNzBhUjQvVlpVR3px?=
 =?utf-8?B?OGVKTEhQME1pVU9kWDhEMGF6eDcxY2cvRmt2ZjFpTFVLVzdJN0grMW56bXh5?=
 =?utf-8?B?TWxqTVY1alJEWXU1NFgyYXl6WVhmUUVhUmlmY1Y4UndzTUpHVmRoTW9EWWZ0?=
 =?utf-8?B?TWJTOU92bHpwM1o0ZWd4QThTOXNlLythd1RMK1l2aEJ6YjVBNkNMK0NhbnFL?=
 =?utf-8?B?b09oM3kxay9KK20wTTdnYUZ4R2l6U2pXQkJwOTk4Q1ZobEJvOGQyTHBnU3pC?=
 =?utf-8?B?WGF3Y0VXdElNaVhueHhicUJlYVcwV1BRVkFBR29jNkNIVHk0K2prWDlUektX?=
 =?utf-8?B?SVRST1NwbUhhSG5WVjRpWVFnVkFRMW9zVmdwbHN5dnpLNGM4dkFyQ3M1Ylhs?=
 =?utf-8?B?S0FCSzJVaWRkcHZDV0gyRU9PU25rbllpMkRaSFVsWklXSkRVS29JZnJVZ3Fz?=
 =?utf-8?B?cy9iR3A4Tng4a3pUaGlhZmZGSVJDY0VSMDUxejlmaGtQRURqWGF6VVEySlNj?=
 =?utf-8?B?am9NQWxvRnQrQTdnbWVRMm0zMzFVZnVDQis0M0FHU0lTdFJ4NmRhUVFoZ0ZV?=
 =?utf-8?B?YTlBYTBVM2J4UVdCb0FGK2RlME0xWU5Bbmw0OS9IL2N6b0pXc2IrbndGQ1VL?=
 =?utf-8?B?WHg1ZkwzUkRuK2dWd3YrYk51NzVOVnhhcWhDclNaZHp2YlFiUHBscE1VVkRw?=
 =?utf-8?B?aDdtcUtheWg5WVpYbTV2ZUZLdEtEdXh0SFZYeE9BQUdxcUpjckxJRHNDVUtn?=
 =?utf-8?B?WFdzdlBScWNlczJXTHhXQ2UxMUxNc2F4UnhLKzEvc2ZmNndRSjNmVWtRbUZ3?=
 =?utf-8?B?WVgxS3U1YU1HWGttSWVCZTl6UkVTY3VwaEQ5cU9CMXB1cktnL0JNdHYvaUJ1?=
 =?utf-8?B?SWRIMHdDaGxacy9NWXpKdGh3YUNYMmJPQ0wzazVNSCtBVzV0SnlJaHVXWWNw?=
 =?utf-8?B?RjcwTVQ5aXFJMUk2azFBdXVTWGMrdXp2SzFVMFprVlNjYkRqTU9kZlJiMSt6?=
 =?utf-8?B?RlZTamJMNTlVZmRNSDFiWmkzY0Mzd1ltRTd6QVJZN3haQk10ZGlEWXd6OVl3?=
 =?utf-8?B?TitnQmM0VUlRMUxQejZHZlRTcUI5VmhZQ1BYeTg1RW5lT0dhcit0M1VkNGRW?=
 =?utf-8?B?N0YwQVExZTgxSDcxcnBFamdvK1Y4QUZpS0xoMFlmT05hNnVoQWQ2cUhvcGxX?=
 =?utf-8?B?Rm1EcFZ5UlJOb0JUSzBpZmJzcWtoV0xaMVl6YXhISGNLZlg3ZVBWWlY1WldT?=
 =?utf-8?B?QXBXeHkxb3JQeHJLeFNDZnJycDdJc2R2eG4vRDh2NnQ0cDdGT2lmdmFKZThN?=
 =?utf-8?B?d3Bpa0ZxdU1qK3FvQm1Ycm82YmZjNFJNM2JFUHd5SVRlMlYveEphVFpWczFW?=
 =?utf-8?B?bVRqRFhxbnUzenRuZmI4WldSOEFVZFJibkYwZFlPZit1d2orSFlhSlg2OG1O?=
 =?utf-8?B?cDEvU0FBaUZEOWJ6U2N0aVYwTzlwMHhNK0xZN29VMlA5T0k1cFhReUl2UnUv?=
 =?utf-8?B?dGtHTkFjanlkNXNHM1FzWWt0YmpQRWtseWhGRDY4amVOc1hqSjZ3bW9qR0pT?=
 =?utf-8?B?VTRTTS8rOENDb21RT05yOUdraEN3d1NKM2U3UGxaMjN6WllqdS9LQmtzalZs?=
 =?utf-8?B?ZEhxNlZWakl1ejJCcDFLcEd0VkRldk9uT0FqYmFGRUlWY1BIWmo3bjBQNmxr?=
 =?utf-8?B?WExiQ3YrR2ZNRkMzWDdHSEJoeGc4OFdqR1hoS3pxRUxoNnliTU80b0JLSll0?=
 =?utf-8?B?MDRneENuY3BGUGM5VkNGVzlSWGZXVFhVWkxsMFZ6ZnVrR3RhTlVvVTJmZHU3?=
 =?utf-8?B?Sm5xOGVJMnBoWHJHcGVLVTYwQ21jbkw4Z2RzSzdaMzlKZ29lQ05SOTRJWXht?=
 =?utf-8?B?NTFpc2VvVHdmTzR5djBQb2RiYUZuTGlNMm1hQXg5cDBtdWJwUm1qKys1RnJ2?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56be4958-7d9b-411c-5203-08dbe190e5a1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 02:01:04.8496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xarUbDJokEX3+JWhFwvoyxLfvcb/64jw1cjvRPWOa6uzmhvTnrCqAwScqGZ8eqAIu8DHK3ykIerRh71fQ1o0LDvTlm9aRLQkxDDJ3kzTrQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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

On 11/9/2023 12:33, Daniele Ceraolo Spurio wrote:
> On 11/6/2023 3:59 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There is a mechanism for reporting errors from fire and forget H2G
>> messages. This is the only way to find out about almost any error in
>> the GuC backend submission path. So it would be useful to know that it
>> is working.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h    |   4 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |   9 ++
>>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 122 ++++++++++++++++++++++
>>   3 files changed, 135 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 2b6dfe62c8f2a..e22c12ce245ad 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -297,6 +297,10 @@ struct intel_guc {
>>        * @number_guc_id_stolen: The number of guc_ids that have been 
>> stolen
>>        */
>>       int number_guc_id_stolen;
>> +    /**
>> +     * @fast_response_selftest: Backdoor to CT handler for fast 
>> response selftest
>> +     */
>> +    u32 fast_response_selftest;
>>   #endif
>>   };
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index 89e314b3756bb..9d958afb78b7f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -1076,6 +1076,15 @@ static int ct_handle_response(struct 
>> intel_guc_ct *ct, struct ct_incoming_msg *r
>>           found = true;
>>           break;
>>       }
>> +
>> +#ifdef CONFIG_DRM_I915_SELFTEST
>> +    if (!found && ct_to_guc(ct)->fast_response_selftest) {
>> +        CT_DEBUG(ct, "Assuming unsolicited response due to 
>> FAST_REQUEST selftest\n");
>> +        ct_to_guc(ct)->fast_response_selftest++;
>> +        found = 1;
>
> found = true ? it's the same thing, but it's cleaner to assign boolean 
> values to bool variables
Doh.

>
>> +    }
>> +#endif
>> +
>>       if (!found) {
>>           CT_ERROR(ct, "Unsolicited response message: len %u, data 
>> %#x (fence %u, last %u)\n",
>>                len, hxg[0], fence, ct->requests.last_fence);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c 
>> b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> index bfb72143566f6..97fbbb396336c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> @@ -286,11 +286,133 @@ static int intel_guc_steal_guc_ids(void *arg)
>>       return ret;
>>   }
>>   +/*
>> + * Send a context schedule H2G message with an invalid context id.
>> + * This should generate a GUC_RESULT_INVALID_CONTEXT response.
>> + */
>> +static int bad_h2g(struct intel_guc *guc)
>> +{
>> +    u32 action[3], len = 0;
>
> AFAICS This is a 2 DW command, so you can use action[2].
Yup. Copy and paste bug.

>
>> +
>> +    action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
>> +    action[len++] = 0x12345678;
>> +
>> +    return intel_guc_send_nb(guc, action, len, 0);
>> +}
>> +
>> +/*
>> + * Set a spinner running to make sure the system is alive and active,
>> + * then send a bad but asynchronous H2G command and wait to see if an
>> + * error response is returned. If no response is received or if the
>> + * spinner dies then the test will fail.
>> + */
>> +#define FAST_RESPONSE_TIMEOUT_MS    1000
>> +static int intel_guc_fast_request(void *arg)
>> +{
>> +    struct intel_gt *gt = arg;
>> +    struct intel_context *ce;
>> +    struct igt_spinner spin;
>> +    struct i915_request *rq;
>> +    intel_wakeref_t wakeref;
>> +    struct intel_engine_cs *engine = 
>> intel_selftest_find_any_engine(gt);
>> +    ktime_t before, now, delta;
>> +    bool spinning = false;
>> +    u64 delta_ms;
>> +    int ret = 0;
>> +
>> +    if (!engine)
>> +        return 0;
>> +
>> +    wakeref = intel_runtime_pm_get(gt->uncore->rpm);
>> +
>> +    ce = intel_context_create(engine);
>> +    if (IS_ERR(ce)) {
>> +        ret = PTR_ERR(ce);
>> +        gt_err(gt, "Failed to create spinner request: %pe\n", ce);
>> +        goto err_pm;
>> +    }
>> +
>> +    ret = igt_spinner_init(&spin, engine->gt);
>> +    if (ret) {
>> +        gt_err(gt, "Failed to create spinner: %pe\n", ERR_PTR(ret));
>> +        goto err_pm;
>> +    }
>> +    spinning = true;
>> +
>> +    rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
>> +    intel_context_put(ce);
>> +    if (IS_ERR(rq)) {
>> +        ret = PTR_ERR(rq);
>> +        gt_err(gt, "Failed to create spinner request: %pe\n", rq);
>> +        goto err_spin;
>> +    }
>> +
>> +    ret = request_add_spin(rq, &spin);
>> +    if (ret) {
>> +        gt_err(gt, "Failed to add Spinner request: %pe\n", 
>> ERR_PTR(ret));
>> +        goto err_rq;
>> +    }
>> +
>> +    gt->uc.guc.fast_response_selftest = 1;
>> +
>> +    ret = bad_h2g(&gt->uc.guc);
>> +    if (ret) {
>> +        gt_err(gt, "Failed to send H2G: %pe\n", ERR_PTR(ret));
>> +        goto err_rq;
>> +    }
>> +
>> +    before = ktime_get();
>> +    while (gt->uc.guc.fast_response_selftest == 1) {
>> +        ret = i915_request_wait(rq, 0, 1);
>> +        if (ret != -ETIME) {
>> +            gt_err(gt, "Request wait failed: %pe\n", ERR_PTR(ret));
>> +            goto err_rq;
>> +        }
>> +        now = ktime_get();
>> +        delta = ktime_sub(now, before);
>> +        delta_ms = ktime_to_ms(delta);
>> +
>> +        if (delta_ms > FAST_RESPONSE_TIMEOUT_MS) {
>> +            gt_err(gt, "Timed out waiting for fast request error!\n");
>> +            ret = -ETIME;
>> +            goto err_rq;
>> +        }
>> +    }
>
>
> This seems a bit convoluted. Why not just wait for either the request 
> completion or the fast_response_selftest value to change?
> something like:
>
> ret = wait_for(fast_response_selftest != 1 || i915_request_completed(rq),
>                FAST_RESPONSE_TIMEOUT_MS);
>
> if (ret || i915_request_completed(rq))
>     // error
Um. Because my brain wasn't working when I knocked this up?

John.

>
>
> Daniele
>
>> +
>> +    if (gt->uc.guc.fast_response_selftest != 2) {
>> +        gt_err(gt, "Unexpected fast response count: %d\n",
>> +               gt->uc.guc.fast_response_selftest);
>> +        goto err_rq;
>> +    }
>> +
>> +    igt_spinner_end(&spin);
>> +    spinning = false;
>> +
>> +    ret = intel_selftest_wait_for_rq(rq);
>> +    if (ret) {
>> +        gt_err(gt, "Request failed to complete: %pe\n", ERR_PTR(ret));
>> +        goto err_rq;
>> +    }
>> +
>> +err_rq:
>> +    i915_request_put(rq);
>> +
>> +err_spin:
>> +    if (spinning)
>> +        igt_spinner_end(&spin);
>> +    igt_spinner_fini(&spin);
>> +
>> +err_pm:
>> +    intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>> +    return ret;
>> +}
>> +
>>   int intel_guc_live_selftests(struct drm_i915_private *i915)
>>   {
>>       static const struct i915_subtest tests[] = {
>>           SUBTEST(intel_guc_scrub_ctbs),
>>           SUBTEST(intel_guc_steal_guc_ids),
>> +        SUBTEST(intel_guc_fast_request),
>>       };
>>       struct intel_gt *gt = to_gt(i915);
>

