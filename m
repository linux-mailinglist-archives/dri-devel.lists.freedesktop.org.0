Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE173E2F18
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980556E1F9;
	Fri,  6 Aug 2021 18:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177996E18E;
 Fri,  6 Aug 2021 18:01:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="214150931"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="214150931"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 11:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="502074303"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 06 Aug 2021 11:01:03 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:01:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 6 Aug 2021 11:01:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 6 Aug 2021 11:01:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN6kDRpE3GhakpiBHENTeuXNaD1B/AXCSAg3jn/zrGxUuI8uKUDFEi8Old7m4Z5zSMIHZvY2cdeIC2AGZJJFIw+PILj8h5yTk/4TqXeqe2I1NaHaee4yEB+13EMPf9lyzFdmbxFUtevflmWfhYP8pa+NaVXRemR+jIgMURmcLv3EVzlRcUT8/UepqrRBQUD5WszENzpkQCD4RewSR6dOUm3WPOsLu7icY1G3gY/i9GP+P/krG3zixUhkNDYD1MdBWOAj99eGl7VOh5UYZZMrRfK/G8DlTU3sfOzDB6Mzw0bjUM6ynuqTHbh4Kxarz4y2b1WJbE4mbtIP0zjy4Zrgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNQ6s6ARLGEH6qlADQfNkZNiukikly4TbyV0tguwhSk=;
 b=BJQ68+k9Nrx/dKt6Tyyq8MTB3f/byVA36YRQI2TL8VyqeVQPCayX8ySLtnf5VbqOMXffRBnl1kq1L6NzkCNM5ntNwKTOVI2G4F4WelLJY1Fg9CQe+jjN/aFY5Y1oj7pgS4B7pooY6zOcIL3dBNl1Xu1pV97dW7bhfUQPg8sgPE2gXaZH9i0j2esy6POhEzfrUdByEHetHskHMKxqelVjEyb5yS9SlkI2ZUNcsy0HfP6oZg/TiuHlfZZORVPYXD2iV1zqeJCrFibVQrUxCcOyrtpXPJKSYKeBZaMu2zYQBiCC0y8qQDyTFD1L/FDntrDqwSVPO+RhMLCFcMiBHyRjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNQ6s6ARLGEH6qlADQfNkZNiukikly4TbyV0tguwhSk=;
 b=Yin0QnehDuM3KovihCXqpQwGiDBgQ5EVe9mrvr4lj8Kq/wdglh3rtOe7kaox33K1VRbDXubk32eznzOd/1qNPmcsKKuhJx6ufpitF0UfJsKtfBtQfJG6DiXrtva1PbU7N09urRvxVAWzWJoZ+rxuIYd7tJWzCoCb6yTI3LlZomo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5594.namprd11.prod.outlook.com (2603:10b6:510:e4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 18:00:59 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.026; Fri, 6 Aug 2021
 18:00:59 +0000
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: Check if engine has heartbeat
 when closing a context
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20210729003400.151864-1-matthew.brost@intel.com>
 <20210729003400.151864-2-matthew.brost@intel.com>
 <eea0bdb7-681b-0acb-0b9c-041fb38a7119@intel.com>
 <1b75f6c6-e458-6bc7-f867-12f1b5b18af0@linux.intel.com>
 <e6e893a7-a0e2-0441-260f-75da3760de0b@intel.com>
 <58cb6331-813a-7007-dac5-65a2f2ad344e@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <b3d7ae68-ce4b-ec2c-c70d-9f81e2ea07d7@intel.com>
Date: Fri, 6 Aug 2021 11:00:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <58cb6331-813a-7007-dac5-65a2f2ad344e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR1601CA0017.namprd16.prod.outlook.com
 (2603:10b6:300:da::27) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR1601CA0017.namprd16.prod.outlook.com (2603:10b6:300:da::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 18:00:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82066a3c-7489-45af-86c9-08d959042566
X-MS-TrafficTypeDiagnostic: PH0PR11MB5594:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5594560732E3C031B4A4F4A9BDF39@PH0PR11MB5594.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xgIj5ihYeqadz5ZqPdfSZqn3KsH4XwSPQlkrmqumn1hIGcE1npGQlpWAUHyhbWxxkS6RJ6DUjbIWldptbPDaul3aT69p8FSwid1nLHb+hN4WQK7Dm01FUi7nPlfEtt8LizAD6T6XB7EXy6Bw8W+WUvhedj3JYty6d8R9oG0Va9EytB9FlyfPxODvg9bZYEc/qPGf2RnRkwPM7yfE5QJwj/mxkEn6TDV8WLJiiaijwhvXUnDuCyimXyIviyTR3BBmgka0wplUu/jOvbHJKswld/ayIPIi0Tly3U3p8/ltaIdNACJez2+S663aXbm145thtTFIInyo83dGLFXCDorxWiOUEGgWOSI/Hk03bq3UYLQ9G8nWUg1aRfHg/lKn/E5nIrOz7IRMqZQ2riZIk8oAwBMeXPvPB3lLlNK0vVXcPRwGv0LR4ylprdUqzvT2cKTSFa5mA/VMiiOMzkYeKJRNULEjlhE0hm+hvKnzXO8mIbrZjnvtNEljtgzw+TsldacE0w/t1ztpHraGq3aD5DNyqrhYPnKJ3iRi0H8IrnddLWpNpeaKDe2FXsG47ubQvd/JGO1H04ZLKonA5wYEkTb+i7KUZC4ZtyjRIj/6RIfkKoyKWdLFwR6IhLJM0cZswiancns7xABnlHRaFz1Hy6sP+YISWP8hmJZ/yM4sQvvkZiGzjsG8ramORdegCq0Drio3LKkY82W92DkUHgyIfV7dIFXKfKtyvAXUVRdppUfPofgWYzN2CS6tFsrx1Th5iRj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(66946007)(66556008)(36756003)(38100700002)(186003)(16576012)(5660300002)(83380400001)(316002)(66476007)(966005)(31686004)(26005)(2616005)(956004)(110136005)(6486002)(31696002)(86362001)(8936002)(2906002)(53546011)(30864003)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bC9UeW5jN2haamJqRWw3VWJMYlZKM1U2VTZOU1ViendaTUtaTVk5MUZBTUNB?=
 =?utf-8?B?R0ZmWlNVOXYyYithUE8vVGUyb2w1b0tGN2ZWK0d4ellOeko0elQzT3ZlaXpn?=
 =?utf-8?B?ZXBoeE5KWVlQbnhFZjVGVU4xZlVWVGNHc0pqZmdGT1djOVhCTGFIa0YxM0g0?=
 =?utf-8?B?SERWTkF5S1MxejVoMHdCSmpxdEZCZmllWkZXeEFlZVZhQ1Bid254aUROS2Vi?=
 =?utf-8?B?L09GRWc2aEhSSGtJSzRYT0JLcE9kc05vaDdna001RlBSa3YrK1lpblJsOHBs?=
 =?utf-8?B?VWZUY3FQSUx5TVZZckU4RHhibW93Qi9yMTl2MzY1NUxVVWl4MDF2OURKS2lY?=
 =?utf-8?B?aDZuK0VLWTlia0MyTTZpVVJ4OHdrNUhqSy9xNzFFbDE2ZFZtalM0VUtTeWxU?=
 =?utf-8?B?M3BIZXdnenJBakdtdmM1NkJKNTcwNVZXNU9yM1MrTGhLaUErTG5VT3B0eTVj?=
 =?utf-8?B?eDV2bEpGVUpqTzVKelg4YjZqeFkzbGhkTGwzbTZaeDZ0WEtZRCs1RjV5MnVi?=
 =?utf-8?B?STZacTB2SU9UNS95WDV0bTN6d01CR3pDeGZycTlna1QvSFFvaUlvcE8zOGpX?=
 =?utf-8?B?Z3duT2RJeDQvaE53cDFsQkRycjVOR2RSR21RdEhzMkUvNWVuRzNhTWlDL2dZ?=
 =?utf-8?B?SnUvRHJGYUpLUnJDNmFGTFZrWGJaQ3owZ3N0c1NMQXJVc00xY1U2L2NQUlpZ?=
 =?utf-8?B?OTNNK3V2eXBFR3Z1V2ExbWVKWjNYTlRVZUtuMTlkNGFlZGZGM01KNmRtYkNl?=
 =?utf-8?B?SEs1dVFxU1NFcG9aQUlGMnlOZTJHSGpiQm9mcXZwMkw1WXhwS0hLMXJHZkNh?=
 =?utf-8?B?N2VIQ1VrWEs0YWkyd3VhY0pLQi9OdURReVQ3eGkyRjdzV3gwMFRSdytWdlov?=
 =?utf-8?B?dTIvTExTbm1MdGIzdS9aeS9qOTM1VXA4UjdQZGZ4a0xFMFNlMGQvdlNQejR0?=
 =?utf-8?B?SDlxcERRVXNxMzlZUjBpTnpjS2Z1dlEydkt3dmVOYlNnT1F1a0Y2UnR3K1JB?=
 =?utf-8?B?T3E3SVFINm5PQlczNVQ0OGFBeHQvQjcxWk12c1p1TFJXU1JaazRidXBzWGxO?=
 =?utf-8?B?emx5NXB3ODJaTjFvOUNLOENzZlI1aFc5Z2xreHpHeTd5SzFHV0g0NGZmUGpi?=
 =?utf-8?B?YytOZHZwN0M2YjkzbE1qaGYrVCtrVko3RVVIT1FMNEVyWU91WFlacFpxMzRY?=
 =?utf-8?B?cFl4YUNzcWtHUGh0M3R4WTFzQU42cTdBTXpNMDdENWtNa0N4Z3J4MGlWd2Z6?=
 =?utf-8?B?eHZGNEpja2w3dFNHTWl6WjBJYmxpZ1MxYXIvZFhtT2tTSXZHa1NvSkx0bDhL?=
 =?utf-8?B?Z29DbzdxQlA4QWZMbUp6NC8zMGpXdTRNRjQ3TElLUmZtMzJIUjRjTXJicWZB?=
 =?utf-8?B?a3I4TGErZXBLTHVlaGhtVmdaMU05MzN1UGtTdWxYTWcyM1UvNk9jNnhVMElw?=
 =?utf-8?B?N3JmTEg2Z1IyZnN6bWMwcElxYkwwQTZRckVrS1ZFOE5vVmg0YittODNqclR0?=
 =?utf-8?B?WFZIT1lyeGFFMFBibmNTRkdYUmQrQk8vcTlCU2Zqanl1dG5wYmxZQyt2REgw?=
 =?utf-8?B?c3A5MWEyVkF1bTdaaGZ4NjZReFlXTURLcHROK1paTVpUSnF5c0hRQVE2TEV2?=
 =?utf-8?B?NWx0eWxIWnJpZmdSR3FhcDdxQVNrV3diaFlVQU9FaHFHRDBwbFdaeWI3U1Y2?=
 =?utf-8?B?MHpUN3EwdldWS3R1NE5HeXgxbEJUT3NHd2JQeHVrS2p6TjdjZFQwMEpidGMy?=
 =?utf-8?Q?isKb1y8uy8wBW6QPpfngBJ1vhTRBx4IIFtQzlqI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82066a3c-7489-45af-86c9-08d959042566
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 18:00:59.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEeVj026WYhUUvFXqXzfcahRV6ileOR0sapklDIKzYHARy1egF+rLBE/rUfKncZxEluOwxlL0GXr07DXsxZaSGr3rABHvKmkRpt5cYgNbFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5594
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

On 8/2/2021 02:40, Tvrtko Ursulin wrote:
> On 30/07/2021 19:13, John Harrison wrote:
>> On 7/30/2021 02:49, Tvrtko Ursulin wrote:
>>> On 30/07/2021 01:13, John Harrison wrote:
>>>> On 7/28/2021 17:34, Matthew Brost wrote:
>>>>> If an engine associated with a context does not have a heartbeat, 
>>>>> ban it
>>>>> immediately. This is needed for GuC submission as a idle pulse 
>>>>> doesn't
>>>>> kick the context off the hardware where it then can check for a
>>>>> heartbeat and ban the context.
>>>
>>> Pulse, that is a request with I915_PRIORITY_BARRIER, does not 
>>> preempt a running normal priority context?
>>>
>>> Why does it matter then whether or not heartbeats are enabled - when 
>>> heartbeat just ends up sending the same engine pulse (eventually, 
>>> with raising priority)?
>> The point is that the pulse is pointless. See the rest of my comments 
>> below, specifically "the context will get resubmitted to the hardware 
>> after the pulse completes". To re-iterate...
>>
>> Yes, it preempts the context. Yes, it does so whether heartbeats are 
>> enabled or not. But so what? Who cares? You have preempted a context. 
>> It is no longer running on the hardware. BUT IT IS STILL A VALID 
>> CONTEXT. 
>
> It is valid yes, and it even may be the current ABI so another 
> question is whether it is okay to change that.
>
>> The backend scheduler will just resubmit it to the hardware as soon 
>> as the pulse completes. The only reason this works at all is because 
>> of the horrid hack in the execlist scheduler's back end 
>> implementation (in __execlists_schedule_in):
>>          if (unlikely(intel_context_is_closed(ce) &&
>>                       !intel_engine_has_heartbeat(engine)))
>>                  intel_context_set_banned(ce);
>
> Right, is the above code then needed with this patch - when ban is 
> immediately applied on the higher level?
>
>> The actual back end scheduler is saying "Is this a zombie context? Is 
>> the heartbeat disabled? Then ban it". No other scheduler backend is 
>> going to have knowledge of zombie context status or of the heartbeat 
>> status. Nor are they going to call back into the higher levels of the 
>> i915 driver to trigger a ban operation. Certainly a hardware 
>> implemented scheduler is not going to be looking at private i915 
>> driver information to decide whether to submit a context or whether 
>> to tell the OS to kill it off instead.
>>
>> For persistence to work with a hardware scheduler (or a non-Intel 
>> specific scheduler such as the DRM one), the handling of zombie 
>> contexts, banning, etc. *must* be done entirely in the front end. It 
>> cannot rely on any backend hacks. That means you can't rely on any 
>> fancy behaviour of pulses.
>>
>> If you want to ban a context then you must explicitly ban that 
>> context. If you want to ban it at some later point then you need to 
>> track it at the top level as a zombie and then explicitly ban that 
>> zombie at whatever later point.
>
> I am still trying to understand it all. If I go by the commit message:
>
> """
> This is needed for GuC submission as a idle pulse doesn't
> kick the context off the hardware where it then can check for a
> heartbeat and ban the context.
> """
>
> That did not explain things for me. Sentence does not appear to make 
> sense. Now, it seems "kick off the hardware" is meant as revoke and 
> not just preempt. Which is fine, perhaps just needs to be written more 
> explicitly. But the part of checking for heartbeat after idle pulse 
> does not compute for me. It is the heartbeat which emits idle pulses, 
> not idle pulse emitting heartbeats.
I am in agreement that the commit message is confusing and does not 
explain either the problem or the solution.


>
>
> But anyway, I can buy the handling at the front end story completely. 
> It makes sense. We just need to agree that a) it is okay to change the 
> ABI and b) remove the backend check from execlists if it is not needed 
> any longer.
>
> And if ABI change is okay then commit message needs to talk about it 
> loudly and clearly.
I don't think we have a choice. The current ABI is not and cannot ever 
be compatible with any scheduler external to i915. It cannot be 
implemented with a hardware scheduler such as the GuC and it cannot be 
implemented with an external software scheduler such as the DRM one.

My view is that any implementation involving knowledge of the heartbeat 
is fundamentally broken.

According to Daniel Vetter, the DRM ABI on this subject is that an 
actively executing context should persist until the DRM file handle is 
closed. That seems like a much more plausible and simple ABI than one 
that says 'if the heartbeat is running then a context will persist 
forever, if the heartbeat is not running then it will be killed 
immediately, if the heart was running but then stops running then the 
context will be killed on the next context switch, ...'. And if I 
understand it correctly, the current ABI allows a badly written user app 
to cause a denial of service by leaving contexts permanently running an 
infinite loop on the hardware even after the app has been killed! How 
can that ever be considered a good idea?

Therefore, the context close implementation should be to add an active 
context to a zombie list. If a context is in zombie state and its last 
request completes then the context can be immediately killed at that 
point. Otherwise, on DRM handle close, we go through the zombie list and 
immediately kill all contexts.

Simple, clean, no back-end scheduler hacks, no reliance on heartbeats or 
pulses. Also no opportunity for rogue (or just badly written) user 
processes to leave zombie contexts running on the hardware forever and 
causing a denial of service attack. If the host process is killed, all 
of its GPU processes are also killed irrespective of what dodgy context 
flags they may or may not have set.

John.


>
> Or perhaps there is no ABI change? I am not really clear how does 
> setting banned status propagate to the GuC backend. I mean at which 
> point does i915 ends up passing that info to the firmware?
>
> Regards,
>
> Tvrtko
>
>>
>>
>>>
>>>> It's worse than this. If the engine in question is an individual 
>>>> physical engine then sending a pulse (with sufficiently high 
>>>> priority) will pre-empt the engine and kick the context off. 
>>>> However, the GuC 
>>>
>>> Why it is different for physical vs virtual, aren't both just 
>>> schedulable contexts with different engine masks for what GuC is 
>>> concerned? Oh, is it a matter of needing to send pulses to all 
>>> engines which comprise a virtual one?
>> It isn't different. It is totally broken for both. It is potentially 
>> more broken for virtual engines because of the question of which 
>> engine to pulse. But as stated above, the pulse is pointless anyway 
>> so the which engine question doesn't even matter.
>>
>> John.
>>
>>
>>>
>>>> scheduler does not have hacks in it to check the state of the 
>>>> heartbeat or whether a context is actually a zombie or not. Thus, 
>>>> the context will get resubmitted to the hardware after the pulse 
>>>> completes and effectively nothing will have happened.
>>>>
>>>> I would assume that the DRM scheduler which we are meant to be 
>>>> switching to for execlist as well as GuC submission is also 
>>>> unlikely to have hacks for zombie contexts and tests for whether 
>>>> the i915 specific heartbeat has been disabled since the context 
>>>> became a zombie. So when that switch happens, this test will also 
>>>> fail in execlist mode as well as GuC mode.
>>>>
>>>> The choices I see here are to simply remove persistence completely 
>>>> (it is a basically a bug that became UAPI because it wasn't caught 
>>>> soon enough!) or to implement it in a way that does not require 
>>>> hacks in the back end scheduler. Apparently, the DRM scheduler is 
>>>> expected to allow zombie contexts to persist until the DRM file 
>>>> handle is closed. So presumably we will have to go with option two.
>>>>
>>>> That means flagging a context as being a zombie when it is closed 
>>>> but still active. The driver would then add it to a zombie list 
>>>> owned by the DRM client object. When that client object is closed, 
>>>> i915 would go through the list and genuinely kill all the contexts. 
>>>> No back end scheduler hacks required and no intimate knowledge of 
>>>> the i915 heartbeat mechanism required either.
>>>>
>>>> John.
>>>>
>>>>
>>>>>
>>>>> This patch also updates intel_engine_has_heartbeat to be a vfunc 
>>>>> as we
>>>>> now need to call this function on execlists virtual engines too.
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
>>>>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
>>>>>   drivers/gpu/drm/i915/gt/intel_engine.h        | 21 
>>>>> ++-----------------
>>>>>   .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
>>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
>>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
>>>>>   6 files changed, 26 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> index 9c3672bac0e2..b8e01c5ba9e5 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> @@ -1090,8 +1090,9 @@ static void kill_engines(struct 
>>>>> i915_gem_engines *engines, bool ban)
>>>>>        */
>>>>>       for_each_gem_engine(ce, engines, it) {
>>>>>           struct intel_engine_cs *engine;
>>>>> +        bool local_ban = ban || 
>>>>> !intel_engine_has_heartbeat(ce->engine);
>>>
>>> In any case (pending me understanding what's really going on there), 
>>> why would this check not be in kill_context with currently does this:
>>>
>>>     bool ban = (!i915_gem_context_is_persistent(ctx) ||
>>>             !ctx->i915->params.enable_hangcheck);
>>> ...
>>>         kill_engines(pos, ban);
>>>
>>> So whether to ban decision would be consolidated to one place.
>>>
>>> In fact, decision on whether to allow persistent is tied to 
>>> enable_hangcheck, which also drives hearbeat emission. So perhaps 
>>> one part of the correct fix is to extend the above (kill_context) 
>>> ban criteria to include hearbeat values anyway. Otherwise isn't it a 
>>> simple miss that this check fails to account to hearbeat disablement 
>>> via sysfs?
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>> -        if (ban && intel_context_ban(ce, NULL))
>>>>> +        if (local_ban && intel_context_ban(ce, NULL))
>>>>>               continue;
>>>>>           /*
>>>>> @@ -1104,7 +1105,7 @@ static void kill_engines(struct 
>>>>> i915_gem_engines *engines, bool ban)
>>>>>           engine = active_engine(ce);
>>>>>           /* First attempt to gracefully cancel the context */
>>>>> -        if (engine && !__cancel_engine(engine) && ban)
>>>>> +        if (engine && !__cancel_engine(engine) && local_ban)
>>>>>               /*
>>>>>                * If we are unable to send a preemptive pulse to bump
>>>>>                * the context from the GPU, we have to resort to a 
>>>>> full
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h 
>>>>> b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>> index e54351a170e2..65f2eb2a78e4 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>> @@ -55,6 +55,8 @@ struct intel_context_ops {
>>>>>       void (*reset)(struct intel_context *ce);
>>>>>       void (*destroy)(struct kref *kref);
>>>>> +    bool (*has_heartbeat)(const struct intel_engine_cs *engine);
>>>>> +
>>>>>       /* virtual engine/context interface */
>>>>>       struct intel_context *(*create_virtual)(struct 
>>>>> intel_engine_cs **engine,
>>>>>                           unsigned int count);
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h 
>>>>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>> index c2a5640ae055..1b11a808acc4 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>> @@ -283,28 +283,11 @@ struct intel_context *
>>>>>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>>>>                   unsigned int count);
>>>>> -static inline bool
>>>>> -intel_virtual_engine_has_heartbeat(const struct intel_engine_cs 
>>>>> *engine)
>>>>> -{
>>>>> -    /*
>>>>> -     * For non-GuC submission we expect the back-end to look at the
>>>>> -     * heartbeat status of the actual physical engine that the work
>>>>> -     * has been (or is being) scheduled on, so we should only reach
>>>>> -     * here with GuC submission enabled.
>>>>> -     */
>>>>> -    GEM_BUG_ON(!intel_engine_uses_guc(engine));
>>>>> -
>>>>> -    return intel_guc_virtual_engine_has_heartbeat(engine);
>>>>> -}
>>>>> -
>>>>>   static inline bool
>>>>>   intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>>>>>   {
>>>>> -    if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>>>>> -        return false;
>>>>> -
>>>>> -    if (intel_engine_is_virtual(engine))
>>>>> -        return intel_virtual_engine_has_heartbeat(engine);
>>>>> +    if (engine->cops->has_heartbeat)
>>>>> +        return engine->cops->has_heartbeat(engine);
>>>>>       else
>>>>>           return READ_ONCE(engine->props.heartbeat_interval_ms);
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>>>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> index de5f9c86b9a4..18005b5546b6 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>> @@ -3619,6 +3619,18 @@ virtual_get_sibling(struct intel_engine_cs 
>>>>> *engine, unsigned int sibling)
>>>>>       return ve->siblings[sibling];
>>>>>   }
>>>>> +static bool virtual_engine_has_heartbeat(const struct 
>>>>> intel_engine_cs *ve)
>>>>> +{
>>>>> +    struct intel_engine_cs *engine;
>>>>> +    intel_engine_mask_t tmp, mask = ve->mask;
>>>>> +
>>>>> +    for_each_engine_masked(engine, ve->gt, mask, tmp)
>>>>> +        if (READ_ONCE(engine->props.heartbeat_interval_ms))
>>>>> +            return true;
>>>>> +
>>>>> +    return false;
>>>>> +}
>>>>> +
>>>>>   static const struct intel_context_ops virtual_context_ops = {
>>>>>       .flags = COPS_HAS_INFLIGHT,
>>>>> @@ -3634,6 +3646,8 @@ static const struct intel_context_ops 
>>>>> virtual_context_ops = {
>>>>>       .enter = virtual_context_enter,
>>>>>       .exit = virtual_context_exit,
>>>>> +    .has_heartbeat = virtual_engine_has_heartbeat,
>>>>> +
>>>>>       .destroy = virtual_context_destroy,
>>>>>       .get_sibling = virtual_get_sibling,
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> index 89ff0e4b4bc7..ae70bff3605f 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> @@ -2168,6 +2168,8 @@ static int guc_virtual_context_alloc(struct 
>>>>> intel_context *ce)
>>>>>       return lrc_alloc(ce, engine);
>>>>>   }
>>>>> +static bool guc_virtual_engine_has_heartbeat(const struct 
>>>>> intel_engine_cs *ve);
>>>>> +
>>>>>   static const struct intel_context_ops virtual_guc_context_ops = {
>>>>>       .alloc = guc_virtual_context_alloc,
>>>>> @@ -2183,6 +2185,8 @@ static const struct intel_context_ops 
>>>>> virtual_guc_context_ops = {
>>>>>       .enter = guc_virtual_context_enter,
>>>>>       .exit = guc_virtual_context_exit,
>>>>> +    .has_heartbeat = guc_virtual_engine_has_heartbeat,
>>>>> +
>>>>>       .sched_disable = guc_context_sched_disable,
>>>>>       .destroy = guc_context_destroy,
>>>>> @@ -3029,7 +3033,7 @@ guc_create_virtual(struct intel_engine_cs 
>>>>> **siblings, unsigned int count)
>>>>>       return ERR_PTR(err);
>>>>>   }
>>>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct 
>>>>> intel_engine_cs *ve)
>>>>> +static bool guc_virtual_engine_has_heartbeat(const struct 
>>>>> intel_engine_cs *ve)
>>>>>   {
>>>>>       struct intel_engine_cs *engine;
>>>>>       intel_engine_mask_t tmp, mask = ve->mask;
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>> index c7ef44fa0c36..c2afc3b88fd8 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>> @@ -29,8 +29,6 @@ void intel_guc_dump_active_requests(struct 
>>>>> intel_engine_cs *engine,
>>>>>                       struct i915_request *hung_rq,
>>>>>                       struct drm_printer *m);
>>>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct 
>>>>> intel_engine_cs *ve);
>>>>> -
>>>>>   int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>>>>>                      atomic_t *wait_var,
>>>>>                      bool interruptible,
>>>>
>>>> _______________________________________________
>>>> Intel-gfx mailing list
>>>> Intel-gfx@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>>

