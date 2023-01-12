Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C25A66842F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 21:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E313D10E1C0;
	Thu, 12 Jan 2023 20:46:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145AB10E1C0;
 Thu, 12 Jan 2023 20:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673556396; x=1705092396;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cJfick/Hi9qeZk3mkbLhhnmkp0gRngSjRkBwLm0E7Tk=;
 b=Tvm59oHMJIO97ZlPrWloAXaOJeilB9QER2n6eZi+LmMawaOp5zhV8Wyb
 dMPZS10O8GKgitvWSM/MI93njWKnVLKhoO9DzL7m15qma/iqoJeTgyopS
 Zk0hExmyowd4aIYiQ7YkDI7l8Zd542Led22WM5C7suL4tW77p+KClY03o
 7p1IhwTqh2/7n+/l21N7Mx6sArw+kLzdHAZx7C/XXgSHXoch/4rpmIdox
 F3k581FesQfHVELPqIrN6UDpC/j56RhOHY6rhWStRV6HtlAGIxeSba8dz
 OVwXRUOcow58y1wIN4kGYJPkUGzOLRdkzDqlZSoNATWUCTsdDCBTxEopp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="388314420"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="388314420"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 12:46:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="635525102"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="635525102"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 12 Jan 2023 12:46:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 12:46:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 12:46:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 12:46:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 12:46:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fU9VK+8wx+dVqLoAzsJvKwuhi4f49CoknRKHUZsoZYriEplPZaZph5ZVKZARrRvQEV5Vwqv/2fgOxW1D487E6RglzL9MeSfPmGXwohMwJ43JoxVb6RYwFNxaT+E0vgCfMg7Y30ts5xoDk6Q/LwKoSWz4O5WTXkqJYi1cX0DuzWNUVBF8gtHFuseID+1lgToLUdNKe9GmczNhL1aW1xGWx37R5O5Tc3aFByvnsgM1xgrK8zo457KAR7xtZAvtDwzVftqh98v4Xs+3y7+d1tfT8ulnXIjE+Jiychql2LT2Sz33VA0vEjcJ1B0coMsTvqSq4FBmoGhubO8SA17fACRsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28vHJmNzEBE3k0EgZRqbSfNf97UXJO+0jBSEJ2j4sEE=;
 b=J642zoaCaKh3IUfZFO547jrx7EJAskNhEJAXQed4o2u1kPx4WFoyDmIwYM72h90zmuYSQ8A8Zzs6lit+nZwyZyAj5dZPMp3CW8XZKNj7b9IUspwVasrAxc67SdwVi7lzp2sUnbsSg0OJBxFiR2svUMlY80YW1DTCxGSwBb8goM3pHWpBpWOkwiFm5LkgFvtApyt+Pp4kT75LC5YawGkzOjKP/ZPsGZ2MFj9PNxF2mV0ICRGQn7pRxGP8y5sEaWhO1Zr1Nc3raAQZ2IUXA/lySAyT6gf/z3nOy0Rt7cO0PUn9pR3kJyCxupWe0E8NFfVzaPuxkV9dfQpvTRSxXiIBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 20:46:29 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 20:46:29 +0000
Message-ID: <5a8be54d-9627-3d60-b6b0-22f3732e6962@intel.com>
Date: Thu, 12 Jan 2023 12:46:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915: Allow error capture of a
 pending request
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-3-John.C.Harrison@Intel.com>
 <dab002d8-75f7-d8b5-d0a0-a6a21ec724b0@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <dab002d8-75f7-d8b5-d0a0-a6a21ec724b0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:303:dc::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ee815a-70d9-45bb-a31a-08daf4de14ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g7SHmfscoxRpCBvY5MfrOHDFFgpZ7Rke42fL+wq6WdrGMwfLNKrB9AlaRyy70YGS28jgtohwafgKxGcqoARlANYEqS4J5uQyyXLlBMKcx0wb8BVI3hwihe+jYn9oPfh+8DvYe9fTUKIoY4KXjfsQpNQdLQrspAMNkwn035PYQjI424yFPxsc4DSqpon44t99LAw1M3EBkk392jZKAhSqgcVDQQB8Mk3O0RtX0DVYvY/dOD3+SPBLw0nM/qlFC7Me38tA9OS9Yj2e+lTirWhH0DoMcxOpue+sxPqGthnR3rr7szy9KrrU5La7oIVxOiagnpujN5rvAw/PhqRlErP0oW2TMSofAgq4OUf8kOr4fpvI028dZiTi41CVDSgpDFwV/oyoo3XSxRwyn9t3g4Bh/bKj3vAGNgxJAlm7Mjr4aoP+4kNrOQULWjk4HgCq+nis7g4L1zVGgJaCQ/Mn4xZVg2pzr9IxZZ6CwcMx6Fn7sSwjYy2k8O4Uy3TQ5dEDuHqsl+sMPqspdpaZsbUPgGLTjEveGouju2stFO92sUS0xW9ZR3kbQNkAE/DXm06ftNEgjuQAIOlF4BFS7JxPBsH6vDFkN+3OVP7RjusdD0sIl6utcAnsqHyUPnDM14Os7Yjz1qlW7gVVcWyrSS22CYLU4ooE3N4ZSta99jN5C+Sdj9KLRK17P4F2PHuLo+yxefwLE0Wj6ckYpoXqpUEAGhhEDHsaitftn9/b1BDBo6mh5Hk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199015)(6486002)(53546011)(6506007)(478600001)(2616005)(316002)(26005)(31686004)(186003)(2906002)(66556008)(8676002)(66476007)(41300700001)(66946007)(4326008)(6512007)(5660300002)(8936002)(83380400001)(31696002)(86362001)(38100700002)(82960400001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlBoRG91Si9xcmx4cnA5bUdWRDFUWk4vWTltdTgyVEwzREUxTlpjdnBJTHNY?=
 =?utf-8?B?RUlMTThsbzFwM1hST29Jb004T24zcVlKUVlrczllakl2bHduam56aUhCdk5Z?=
 =?utf-8?B?UEdiUEdyZFNDYUVmUjdJN0FYNWJ6aW1VTGtoOG9PWk9VL3d0SWRkaTVkNnZh?=
 =?utf-8?B?ancrZ1ZWVzh0MEhwdGU3WVh0OUw3dE9uQlI5M1ptQzlML244OFFVTUZkL0Ew?=
 =?utf-8?B?TWxJUXVoUWdOZXFpTThmT3NUTWhOaFpnbWF2VFFuVmY2VXVDRk5tUEJsNVN1?=
 =?utf-8?B?UkFhNzJMV1JDOG5JbEsraUNTUVZoVGxvQjJvWmdzbmZlZWozNzY0b3BVRVVS?=
 =?utf-8?B?a2ZGNGgwSE55cHRJU2REWGN2dWxkSnlHVEZRT1QzZlRhSXdNblNPKzU4bXM0?=
 =?utf-8?B?cmVrbVJ5TFRlT3g4bGs1Nk1HODVwT0FWcHpGbThQSW1kdi8zc1hzZ2kyQTFW?=
 =?utf-8?B?aHlvQitxaU9uTGdvWkFGcW1jZStYYzljNjhLanNhVmdjcTdqUUJxc2xLajd4?=
 =?utf-8?B?dHI3RHlPcDZqcmJSb1Z6bnJyYnhpQmF6T2dFVklsMlpJaDdEOUhQK1NVUk5o?=
 =?utf-8?B?NDJPeTVXTkQrYktzTzNGZTcvWVNxYk5NYjNoTnNDL0RZQy8vS2lsdzlJSDNl?=
 =?utf-8?B?NHpDSW1jZVBKdkdhbERscElmOUNwK3c4VGJIS3hKS1JLU0NraEZqSWg5Mkhn?=
 =?utf-8?B?YSsxSG1kZGhZc1Vvc3A2OFZkN1d4RUVWcjlObFZ5bHVmaklJVUh5bDRWdmty?=
 =?utf-8?B?SlFyTDhjVzZ3UnVqbm12d2pTYXZmYmozT0hHMjlDSjZVeFNSSE5rV256UElq?=
 =?utf-8?B?OUVEd0tHc2NUOTdPMjByOWtzLzRPVDNpVGFVMTd3L1NDcks3c21VL25Bem5y?=
 =?utf-8?B?VjZKUjFPOTIweVhqTGRtSU9kWS9tYlhncFQ3V0tyUjNqYmRaT2Y0aE90ZERz?=
 =?utf-8?B?anliZVlQcHpRZFh3WGorMjBCeXNTN3RTalppOTNkclN1M21VNTFXc0pFTFFL?=
 =?utf-8?B?eU9Wc0d0S3h3ZVRpc1dVMkZOcXp6eVJrdU1tL1Uzc3FaK3FPZG5DSHhodU5X?=
 =?utf-8?B?dGNxdWNobUx3WlVnRWplZHBzbE5YTFU4bDc5alFwdUUyVXJIQW1YWWJvSk9Z?=
 =?utf-8?B?SFJNenVLMHpoMFpNM3pYbDVqQUYwS2ZoeVN3U2xSR0ZtUlB5RGFCQmo3WUpT?=
 =?utf-8?B?UjhWdE1aZGhNNkFQR3RLQnYwdFNBK0R2TkZZN0ZiQ0ZtNTdVeDRkbWRpOENl?=
 =?utf-8?B?TUZiL2dtRlNWVmhGaG9DN0QrMFFQYWt4QXZRVFZQUXNWN1NaTCsxdjlXa1A2?=
 =?utf-8?B?T2NxQU0xR0tTUnF0NFVhampPelBvZW8wNWUrMlN0YkFuWkQ4cm5aSjBjODFm?=
 =?utf-8?B?K2Q1NmhEMTNJbnhWMXJKa2VRTVFMY0FMWUZoZzhkdVlKQjJ0c0ZYN3NlZ25j?=
 =?utf-8?B?L2FQS0YvK3JVRU0xMlFYK3V1U2xrV1NraURxRFhlM3dJT0NFL0d0YnJLdElX?=
 =?utf-8?B?NU1pYjI2eWZwWjgwcm9NMldDRFRpdWorRWRPb0JwRVNoaFJiOG1tUjBVOUdS?=
 =?utf-8?B?SUplY3lzb1N3UFA1aGJJeHhHMThYWThSWFhxSG5zL2JLUzlyQTEwa2FWRmJz?=
 =?utf-8?B?VFJBVUR0VmE3aHVoSXQ5VkpITE1mV1AzRG9MemduQzBlRFhFRDB2MWFJVU9v?=
 =?utf-8?B?MS9IQmVwSGhaUDc1dDQ5d2hYb1RqWnM4VS9VNHVSb0xlUHYyNk9iTkJXc1hl?=
 =?utf-8?B?RUp2bzdGNDJSQStxSWFrNnAvaVR5eUlLVXV0VkVSMGVtTDVmaVlrWjJ0NjZQ?=
 =?utf-8?B?NHk5VGJpcFJwQ1UwODMvbnNqKzJQR0pGK2pDT05SWWswaGYwbUJUUVhNd2or?=
 =?utf-8?B?ZWVUN3BWRlhFUnhhdlkzYWx6VTBuWlZ5QmpubTV0Vm5GVlZ0NkFYYk1qRmRy?=
 =?utf-8?B?Y3AzRVpoWWpzY241T1Rsb0VZTkJ4aGxFRWpqY3FRVE5ITDdJNUZNbEY2M3ZL?=
 =?utf-8?B?WDFrY0I3WVNIdWo4QVF6Y0FIVE5GSWlFbllkekhZeTRnZCtydForSEdWOWtw?=
 =?utf-8?B?TDJZSkRucWhHd1JpcUFvRm1aekZJZHM1a01CVXo5Z2J1U2pBc0QzdU14Nzl1?=
 =?utf-8?B?Mk5OY293Q2FGZThONDZTVHgvdVY3WFBqODN0UFNRS2RDbmp0T0ZMVlVtZ0ZN?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ee815a-70d9-45bb-a31a-08daf4de14ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 20:46:29.8787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7I5t8r7LGyDr2wsnzagOqIJSOupVMIZRU7268gdxMz+dBttsoj7pGcg0qqCi1w0TrVWQid8qKJBVQAgJsbHZrI9T920LeVNchZJD/tvVQdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
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

On 1/12/2023 02:06, Tvrtko Ursulin wrote:
> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A hang situation has been observed where the only requests on the
>> context were either completed or not yet started according to the
>> breaadcrumbs. However, the register state claimed a batch was (maybe)
>> in progress. So, allow capture of the pending request on the grounds
>> that this might be better than nothing.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index bd2cf7d235df0..2e338a9667a4b 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1628,11 +1628,9 @@ capture_engine(struct intel_engine_cs *engine,
>>       if (ce) {
>>           intel_engine_clear_hung_context(engine);
>>           rq = intel_context_find_active_request(ce);
>> -        if (rq && !i915_request_started(rq)) {
>> -            drm_info(&engine->gt->i915->drm, "Got hung context on %s 
>> with no active request!\n",
>> -                 engine->name);
>> -            rq = NULL;
>> -        }
>> +        if (rq && !i915_request_started(rq))
>> +            drm_info(&engine->gt->i915->drm, "Confused - active 
>> request not yet started: %lld:%lld, ce = 0x%04X/%s!\n",
>> +                 rq->fence.context, rq->fence.seqno, ce->guc_id.id, 
>> engine->name);
>
> Ah you change active to started in this patch! :)
Yeah, I'm wanting to keep these two patches separate. This one is a more 
questionable change in actual behaviour. The previous patch just allows 
capturing the context when the request has been rejected. Whereas this 
one changes the request acceptance criteria. With the potential to start 
blaming innocent requests. It seems plausible to me, especially with the 
warning message. We know the context owning the request is guilty so why 
wouldn't we blame that request just because the tracking is off (maybe 
due to some driver bug). But I could see someone objecting on grounds of 
being super strict about who/what gets blamed for a hang and either 
nacks or maybe wants this change reverted some time later.

>
> I suggest no "ce" in user visible messages and maybe stick with the 
> convention grep suggest is already established:
>
> "Hung context with active request %lld:%lld [0x%04X] not started!"
>
Are you also meaning to drop the engine name? I think it is important to 
keep the '%s' in there somewhere.

John.


> Regards,
>
> Tvrtko
>
>>       } else {
>>           /*
>>            * Getting here with GuC enabled means it is a forced error 
>> capture

