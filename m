Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBED67613A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BCD10E3B3;
	Fri, 20 Jan 2023 23:06:08 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FEC10E3B3;
 Fri, 20 Jan 2023 23:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674255967; x=1705791967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z+pkENhsPIAmefijjBZP6qG4lqd3A5n6Wvd+uIl3f2k=;
 b=mUM8G5V5gz/RSjiZhu/TjSNZ1qr0kT3tP1OQLbn4318ievkQxvRl42Vu
 Xpe0XkbqhoGgcBqjvi2FpDxstp8zb7d9Ss4/rfBpwZxCDiz+MMvwKd/Zh
 unWkQILBgNDG2mNrzw+X/c+IqrbuU6wnIj8XPommtf75FKn9YaDqY+5EL
 pcswpI1BlmxMU+8PB4FbBi4Ys+e98y56WbM8PXCmr3Dr8mfiGi1RNgjCk
 9fVm4xPXmzYILMVPDmBBVXRR5diPKPK/Tvc09gjQo6qEMzXw9bSSFvucd
 mt8jltmywZz0MlUWkZ0p/dFe4qn69HRP2+qAtJv6wCVR+gS9ea5V1RC3S g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="352974168"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="352974168"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 15:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="803234899"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="803234899"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2023 15:06:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 15:06:06 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 15:06:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 15:06:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 15:06:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlN/gc+/SJsWPVtvpo27BeIOW+cZRsYWMuvZ0CxdlnEYxUD5K6KSsaEA8pFfuSfCzPUBjNPDRi9ziqbpZH3k9i5GFK0B2Z0KDgF5r2ARHKz3sxNDbTT37AE2SnZP3cQY9MuVaGmwer2TPMN00hWimbd6kOE6xcjI/5f003w1/rALQ1b/ySEUzt6MDkq4C22nvAVnH6CGyHo1waPWjIwMszlMdYbplGo9L6ZMoUOWEZl2QKmFxjiom53SfmfZtAn+Vr0WWvu2JNeBCwHOTPpDZdUtjHSabVOixs3eXc86xkeMZsTd9WEcNTZZLZOd6ryKnybJZqYIr6neIs166HLQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts4SoPUgUEF7PGxGFn6/W11FCX7x/p7QFz04LGqw6sc=;
 b=IwyuPzFm+fcm6zUSB5L0x7+5u79MhRrmBS57QTtSCgmwTaEwCOUWw2Q7DI1sac8+ZwVgg+8MWry6bihJqsMLWnHXNQBaLDv2kG5cWh9eh8QQWFq/D2jnU4uD8XbWYloMDK8xp6jRwugcqeYPWUX1BsCIXBE2t0TB4sHCTCYEDZA3OubUKIDP3ezx97+Z5+FQbYn+Y5mht7Uf9kfIKYOeC3X0AHSBSK0h2OBlCWwE/qnIDmrjBPTf7/fbUfthm8QLYf6uvaVstMEk/6SkkAMSTsH5wXLfxgQFUsV2YWwGIc02mq8xS2kQKfUWg98ZUrI+uggxn0ACYrtaAK2I9t4uBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 20 Jan
 2023 23:06:04 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 23:06:04 +0000
Message-ID: <a52b86fc-8dd1-ec59-94cc-217aa467c315@intel.com>
Date: Fri, 20 Jan 2023 15:06:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/6] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-GB
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-2-John.C.Harrison@Intel.com>
 <Y8le1Z1nfSR2QWrg@smile.fi.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Y8le1Z1nfSR2QWrg@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: a55965de-f932-45f1-d292-08dafb3ae7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBVSyTkyctbQJYSksYiQOuhE6lU3PqZeryp425/jFjQ0CjpjYFAy39ysm2IQA5NOy0go43LtDRARLrPW+4e4TDTWE+dzcimxgJTHzu+p1xJovFnh1qBnoDpweOeT5Iy8GWnU/Fj79Zabvps7L7WwLjZI3OoEkgUoolDOttiHnWC5iEkA/FWqyHU+aDx76OaQ1u27x4MoPXH9rPSdgyCxBn9TFngGHNq7uAEgovsfCXrMKZnCpyytIduVtCxgFYJufSELo1EA1f7s27/1Y0DoMFu+vlUCWz87Fevtiah+sz9Hp9CLBaG5UnXWaSxh8oyIdmzCmQJdmoJai5myWHIpJNQ68SLi1WKVL6rUGOI3GZ7I2bjiQ5a8JqykHd5RUeH30OO2rOr7e+2zZ7cytKtDZ0osXhqdbAckWq/cdLVmuBPQsM+q2BBaxmi449yCXyYk7IQI/EMjpxYaqa+6KwgJ1mS3ruZaJrrVlgANmwGNhSBlWy9uRGB2S7rfqxVAiizW5V4/E1biNgI+cTFSMem1JhCnl8/EUlOyC0cqYyXXM9JwMHTeItF+c1Q9Wmhv3fY2uYj4/dlbCH7HJ3QvSUrH2ctnc/iJLe1jgTw0e1nHGQPb1mQUs8INmIv249QR8C0YhuH60WUuWBnbVEWC0uFE/8PmRxAOINso1G7k5tMMtEzz15GPau6czNf1KFztsdakx/3X7n8v+BnVoI/Om0uLxg8JUx43bEuIHhhhL+leqx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(6506007)(53546011)(26005)(6512007)(186003)(6486002)(31686004)(478600001)(66476007)(66946007)(4326008)(6916009)(66556008)(8676002)(316002)(41300700001)(36756003)(8936002)(2616005)(83380400001)(2906002)(5660300002)(86362001)(54906003)(82960400001)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEFQeTEvbGxTWTZ0bXFvQzZzZHlVUnFKZm1XNFEwMGZjeTBuSHQyZlhRVThS?=
 =?utf-8?B?TWhRMnA1MHk5Vm9nVkkrMWw3NTNFRFlwV3VQblBNc0xsdkhLbUszZmpNZHJS?=
 =?utf-8?B?VmxPVFUrRmRnODBJZkt4eFU5MXQvY2pGbllsNStUb1A1dS8vUm5PSEZtemx4?=
 =?utf-8?B?YlpOdDdtQi9lNDA4dTF6VGZJUjNObkVSQitSMnhhT0RYdXdzdFd5cXFYT3o2?=
 =?utf-8?B?dXQxdnowTXRja3Qvb3JRRWFNRkNpWUhrTENWZ2JkcGNKNy9KdWNHRHZkVllh?=
 =?utf-8?B?aW00a3JRVmNxU1M5OStCZnEzS3d3YmQ5ZDA1ZldVaUd3TTlGMFJkMkpXNWhC?=
 =?utf-8?B?ZHNVZ25yWVFTOXBQOFhYVUFvZ2h4TFBYZDAzZXEreTAxOUU1Nmt1QUkvKzN5?=
 =?utf-8?B?YzlCeTFJcWpDYmZyNzYzTDAvanFaU3JidmFzejNTa2FObVpwWkE1K0UzZkxR?=
 =?utf-8?B?dWFCb2VLakhyRzRRNVAyZFVVVldPWXRrbStMbFNidjRHRnJPOG96TVBJQUY1?=
 =?utf-8?B?c1JFYm92em9OOWZpdE1IM2ZrZGJqL01LOVcxeXRJbytxVjVxdEtlVlpwZHZh?=
 =?utf-8?B?QkNSd3p5ekpaS3RBMVdFYnQ1dC9lWnpHMm5HSzM1bTdsKzFra3FPUzFnK25Q?=
 =?utf-8?B?eWxUVDRQN29XRnpJa0hUT3I2RmJDNFMrbVpYWDRPK20zSXlrWGo5VVR4RG1v?=
 =?utf-8?B?NS9UT0VLakZXUWhOa25neHppZldyVDFEUWNvaDk2cEJmV0ovdXVwOUFvSndm?=
 =?utf-8?B?YXU1U2F0YkR2N3o0cTVXM3N2RmxkQ3dtZTN1Y0VpT1d5S1JBMEQ5dDZHT1l4?=
 =?utf-8?B?SHpDTHNLSjAvTjJnbGFJcHY2NjlObTRwY25kNzNEbVhBRXM1bFNTNlluem5M?=
 =?utf-8?B?eERFRFExRm9nbVJVVkFjQWhvZmpQS2k0ZzZMVWhneEgzMkpWMWJRZ0o1TVBN?=
 =?utf-8?B?S0d1UG1WdVRrRFFnSjlIdG1jNHg5SkVUa0kxcEE1eTJJU0RsYVlsSDVaYTNU?=
 =?utf-8?B?M0lZb3FMTW4vV01PVFNMU1kyeGZjWnd5MkpRdkNxODgyS1lLSDhRM0dOQ2or?=
 =?utf-8?B?WEVycHhqRlBOVTJWejFqKzlmV3g0bjMxWkcwUDhEZ283VkUrR0o4NmFjQjNS?=
 =?utf-8?B?aGlNRjRTWXhYZ0drMDVYNkNodnkxUDR6bVJ5alI5cDQvdnVGR2RYM0MzQ0N0?=
 =?utf-8?B?YzIrNHRSeGNrV3AxODgzVW91cE1Tdmt2aUY5QjJRQXRuVVZ0MTA5SVo4dHN2?=
 =?utf-8?B?MENxZmF1dis4N01xQ0tVdnNDUkJvcnd0NjJxVXBLRkJPU0FweW1FMHMzUE9o?=
 =?utf-8?B?MUlEMGVaNVp6VTh3WXB3bEFSZS9COU5TWU5ncU93NlpNbHdJcEhZdkFuWHB4?=
 =?utf-8?B?a1dqU3p6Z05JYXM2cUQzTlJzNXVLSTJWbHF4bDhZbG5kUnNVT3NkNWVzdXNx?=
 =?utf-8?B?aG9ZZk1sazNKK0F2VDFGaDZYOENwbEpPMFFkQzJmYnowWU12L1hZb3BWNTFu?=
 =?utf-8?B?YlFMU3pkNzlmazkwWW1XTlA2RzJnQ1ZJMmN5elQ1OXFLMElqdS9jVHFianVK?=
 =?utf-8?B?VkgzUzdTcG5PVVo5UEZtcUxHZEluUXlMOW93bEc1Z01INGZBZW9FZWNmaDNt?=
 =?utf-8?B?QXVDNEtJSGYyYlFZcFFnRGxmRzBzNTQ3bmk1VWNySThIK3phb3g3ZUNkVmRw?=
 =?utf-8?B?cS95Tk1kZG5qRlNoaWtOUkthNGZJMkZqUlgxcGlBendZSUx1K2VyTGlmNFdJ?=
 =?utf-8?B?ekhLZUdZSUtEeFlrU245ZjBhd2VPUm9QRGJYUXlPbFo4SjA3OEhzRzBTU1Rx?=
 =?utf-8?B?SFcwaU1paGFmaUJ2OEJiTEFkM2k0MER5V01CRFcwMEhJT2h2RGN4OGxUZno3?=
 =?utf-8?B?UEtlcFRZRTJiK3BYTCtuZmc0dE1wV0lhLzVxdFVSbkYyQ0M0bGZWWWUwMFA2?=
 =?utf-8?B?WThRbnMzLzY0OXNTbjhodXFzRHJ4OGdIVHZZVGx0RWpEc0czRGVGVFd3eThx?=
 =?utf-8?B?Um8wQjRnZmh5ckpGVmVZaXhNK2JxY0laYW5hai9nWE5yMXhmYVI0TG1DeXo0?=
 =?utf-8?B?UllqQ2ZvbHlQUnN5TVM5S2QyZTE0TlNCa3Z3YTdJOXpjNHdYUnBvQjZpcXhs?=
 =?utf-8?B?R2xuYlhXOG5VS2hFWXdZOWlGcjlwSWdRVnZRTHBRVllkZjVsVmsvUjUyVFpW?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a55965de-f932-45f1-d292-08dafb3ae7d5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 23:06:04.4602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V76JIII0rEN9AtVFLAjebXajiv1DuM+/ZX8sMllSwQDcY7rKUV1uj0HDpLkMeSyEGRwYuIjt7S+KNElZUqOZRo4O/nAtvdHWJddsjHSpELo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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
 Intel-GFX@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/2023 07:16, Andy Shevchenko wrote:
> On Wed, Jan 18, 2023 at 10:49:55PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When GuC support was added to error capture, the locking around the
>> request object was broken. Fix it up.
>>
>> The context based search manages the spinlocking around the search
>> internally. So it needs to grab the reference count internally as
>> well. The execlist only request based search relies on external
>> locking, so it needs an external reference count but within the
>> spinlock not outside it.
>>
>> The only other caller of the context based search is the code for
>> dumping engine state to debugfs. That code wasn't previously getting
>> an explicit reference at all as it does everything while holding the
>> execlist specific spinlock. So, that needs updaing as well as that
>> spinlock doesn't help when using GuC submission. Rather than trying to
>> conditionally get/put depending on submission model, just change it to
>> always do the get/put.
>>
>> In addition, intel_guc_find_hung_context() was not acquiring the
>> correct spinlock before searching the request list. So fix that up
>> too. While at it, add some extra whitespace padding for readability.
> ...
>
>> +		found = false;
>> +		spin_lock(&ce->guc_state.lock);
>>   		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>>   			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>>   				continue;
>>   
>> +			found = true;
>> +			break;
>> +		}
> This can be combined to (see also below)
>
> 		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
> 			if (i915_test_request_state(rq) == I915_REQUEST_ACTIVE)
> 				break;
> 		}
>
>> +		spin_unlock(&ce->guc_state.lock);
> Instead of 'found' you can check the current entry pointer
>
> 		if (!list_entry_is_head(...))
>
> And because requests can only be messed up with the guc_state itself, I think
> you don't need to perform the above check under spinlock, so it's safe.
I'm not following the argument as to why it is safe to test a guc_state 
owned list outside of holding the guc_state spinlock.

I also think that having an explicit 'found' flag makes the code more 
readable and immediately obvious as to what is going on. For the sake of 
one bool (which the compiler would optimise out anyway), I don't think 
it is worth the obfuscation of behaviour and the risk of "I think this 
will work".

John.


>
>> +		if (found) {
>>   			intel_engine_set_hung_context(engine, ce);

