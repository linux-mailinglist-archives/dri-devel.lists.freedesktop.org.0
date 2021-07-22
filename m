Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF723D2F5D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 23:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8941E6E8E2;
	Thu, 22 Jul 2021 21:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D706E8E2;
 Thu, 22 Jul 2021 21:50:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="199016715"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="199016715"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 14:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="497108639"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 22 Jul 2021 14:50:30 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 22 Jul 2021 14:50:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 22 Jul 2021 14:50:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 22 Jul 2021 14:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V23t4vRbJtkZVwyHiXSAVCtgJSntxrEgEvgEGEBEyCoqlIm9QoSpNbqWS43/26IlhB7niPT+U/zKBLK2vdlIZT+nV/bLrtyIOjK7OTg1jVszG9iaESPJxFS4/ris0VUSu/z01uouVwNmwfSx/D0UZTZ5R/IBRSLBjcziJ/mslwr3j+q1Jg/oi6QiQrNQvSKzjFXPYDXKkj1VMNCwfgNJc7ooVARf33TZWfEJUoV/ZbzH1n/GLjzXIrMXP9GA0a0sGp4l7e5oXgmiEpqn3KjjzKjUlcolRdbtfp++70YgYl7u8AcwHnHATvgapIfN2NmNkW3khfbceLiiBV4V0oNEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txOGiELq4dB+YKyfE22Cjk0GJ2vClbH7y6BG17UmNUI=;
 b=OhSeM5b1eVs23Gjtio+HvJuLGZ2HVa8l1DNBg5WheDi/9HEqgnPA0IVb6pMH4h/yteoPTq16pJFLOiC7kq/FRnw0S45aRtzEgNtXdpaNJZzCs31K80WBBxAnmQK6gawAPbYtS1OGa3RdzRX58km84jm7i1U4VYYLKvCL0D6Xtl+CDLDR0BSEdpBeNyZhYVn04IwTRUc1ZfYjtcqanyExvnEZu9q74uwPTtJnRuf88QlOkGm2+13pL/u3c3qT4HBJgxn0IYa/Gnjh9lFexENo+AaIUmtImoemmBYpUkEqOiS0eL6seyi23n6D13hoAnwHFl4HbN2nVBH5adz2ll62xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txOGiELq4dB+YKyfE22Cjk0GJ2vClbH7y6BG17UmNUI=;
 b=QuYrv7aiQmTNlPvWA24jWlwR1ebf8EqYawL2qQBaLSnoFTGuaezgicbeBrYNGIyi1kSctuooZab2FyN3mgezY7mBWzBsfMLIRjq+4eljcCHuzFrSbCsSiJotVhKgVd1ikK6RdzbK2MxUPa6E1swaWXe8DitPd7nU3VrkF4HZ7Pc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1548.namprd11.prod.outlook.com (2603:10b6:4:c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.26; Thu, 22 Jul 2021 21:50:27 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 21:50:27 +0000
Subject: Re: [PATCH 50/51] drm/i915/guc: Implement GuC priority management
To: Matthew Brost <matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-51-matthew.brost@intel.com>
 <c0bd8e5c-784c-18cc-d724-f676dd3546aa@intel.com>
 <20210722213835.GA22352@DUT151-ICLU.fm.intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ebe8c917-c4b0-90a3-29df-030009cd7d51@intel.com>
Date: Thu, 22 Jul 2021 14:50:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210722213835.GA22352@DUT151-ICLU.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: CO2PR04CA0133.namprd04.prod.outlook.com (2603:10b6:104::11)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 CO2PR04CA0133.namprd04.prod.outlook.com (2603:10b6:104::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 21:50:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a35b207f-2586-4558-fcb9-08d94d5ab75c
X-MS-TrafficTypeDiagnostic: DM5PR11MB1548:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB154898626A959A8E53B2D456F4E49@DM5PR11MB1548.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjahgQlHgsN904pKfdZuwVDuM0dSn0vwwlC1DN4BGMUL2l+jltgzKNhL5sdhGeRL0XcTWlkdzf0oOgMryHl8l/gPEwqm7xgNUu3IKiRqkK3NoH4zUQfhR10IqL5sIF6X7R2vOEdY1rAAEz6VUea+eEuGp7lFio+q2S9en4Ww/zB3ONQ9txmT23GYRF5BgeIgmPOm8539Om5hF9aXiQQco6NOuR7jYo6rilFYJPXnhJ1Ba/GGoVmWptc+KfzAUc3LLnAWtdG62P8E7yz5fig792dhDc6wB1VTL3MzgTiuu6cJNqRFzYRvcZAcxtBB/heZTi8hgoZ30+zD9NuKbvzoqNRaPXjRvjJkSqIGTr5DmCt2o7xcP135GCQ0wsw8S+vfD4xRTcrzz20Q0a1HEshexlzuqIuJwSie2tzEZDG2iO8ZA/7KQwZ4cKk5VYszlnqBFu1YXEkVC+RAotMPKmFxiCAS1dwcPjm7mQJSXvSv0rI/I/RAFFBCWJ3opOnY4NeF6TY4mKON9CVHM9IBcWy+K+3Zy9kr3KpDntdzx+YlQB00qmwCAmNTFRVxn4HxrWJY2n/T6s+IEhoSsN5q/FYIm4OsX0lkKFkmYRZIBA0q00Elow4b07DuHeMPKGyWvs02hlnpCsepowrwom8ycJ+DWrVlTlISsOBV84av1Hn/FiQU/zgpkPv6XChQxufjrpTjt5t2OLVV/T6SnG67EQZdcDzeYQ1glAeZLll5GLMWlkb3e9PzQ65sIKt9cCt7dJ84
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(37006003)(16576012)(4326008)(38100700002)(2906002)(86362001)(316002)(478600001)(83380400001)(2616005)(8936002)(186003)(956004)(107886003)(31696002)(31686004)(6862004)(36756003)(450100002)(5660300002)(26005)(6636002)(66946007)(6486002)(8676002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk9XUVZnc2RCSzYxcUkvdzBubzVLWXN5emw0M2RhdmtYMGFvS1UrQWk5NXpD?=
 =?utf-8?B?Mm9TdFFUZUprdzhhdkhzTHAzZk5odnRuUUJsTzB0KzdFRC9tVnpWclE5QjBI?=
 =?utf-8?B?TXl0Z2RwclNlSlBhWlBZMWVFeXk4SFFBdlBVa2UzYlhkdnBFT0pMQ1lWeUlu?=
 =?utf-8?B?UXdLbVZiZ0xCcU8xN3hPdVltNU9iT0VTeklmSWo4Y2NjSHo5eUJ1dzE4MU9i?=
 =?utf-8?B?MDYxUVdFSlFGajNNWkxIRTBvMno4YThoemRobjhzTWE2Wm1YNGVqTE50QjlV?=
 =?utf-8?B?M1YrUmJYQXFQdXR0djNvd3ZGNlJNMlBOdCs3NjBYQU42Y0ZMNkZpMzBpOW9w?=
 =?utf-8?B?bmMwbTRMRGZDNFdyaWswZU9VT3M5U0JPWFloem9XVk4rZEdTS2YzME13Q0xt?=
 =?utf-8?B?dDJBVUlVdm1XeWY5enVoM0k1NG9lQzZSYnRDV2NPKzdWd1N5TUliaVdCRHFu?=
 =?utf-8?B?U2tKaU4yL2dGSXRTMkpuSjdNUWhJR0FCdTdBQ1JWNWkzWE91OS83bHQyZDRW?=
 =?utf-8?B?V1FpTGZIbnRuZVZ4M0hrY3VjL2cwNnJIaUdvSjFrQXFNYUo4cDlNU0NtcFFY?=
 =?utf-8?B?OTFjRnRVR3JrZnQraUVERi9FQTlqV0x6TzZ1VVZlSHVZby9hYTdKd3ZyR1F5?=
 =?utf-8?B?SnlqWnQrRkVWcmxYTzhhUXpWRGtLdWlmRWc2bW5WWWpjb2FZWlhzUVJVYWMx?=
 =?utf-8?B?TERwY0NnVmQrcnp1ZnRRSXVCTEVCR1VoQjl6YmdpV0p0bFpEaHAyRVZocUFE?=
 =?utf-8?B?MUJrZDVvSFJ6WmY2dHVoeHhLTWFPbTFOTHBsbDlaTFNjQ3RvUm1lbFU2MnEr?=
 =?utf-8?B?VTBvQUFTWklPUzhBTnJ2R2FSdkJiZkVwZjd0Z3l2T0tidTZRTmYvdDgzaFVS?=
 =?utf-8?B?d2lHMEFONWRMdm02cXBzRVAybC95aEpVbndTYTgyQzZMVDhiNDRvZHZVenBj?=
 =?utf-8?B?ajNNZVJkelh3SlpXVHJPTFhzU3l4Z3R1K211VjVhMWZjUlQ1d0dsUUZPOHVm?=
 =?utf-8?B?MUduRjlXNTVOdi9yVjBJbmVYY081SFp5VlVGQ1RNNzNOY2RzU2k5MXhzR2Jq?=
 =?utf-8?B?TVgzNm9iU1VzYklKRnRkTjlmOVZYUlBjRjFCMXUwMDV1MW0rMmMybVNuV2ow?=
 =?utf-8?B?bngzbXRxY0ZRU3kyMnkvSytNaDBKUUVWellyN29iUFhnbURiL2NoWjRuTmVu?=
 =?utf-8?B?MG1BaG9SNWQyb1RsZkJnMWdlQVB3QlNNYzFQK0RlMU8wMll3cUE0V1J1Lzha?=
 =?utf-8?B?QVU2ZHRxZlgxOWhuR0RFdzdPNXloSFA0V3ZwVW9Nb0djampFQmhGM3c0cmxq?=
 =?utf-8?B?M0FSSHVicTNDZE94K0VsdGZ1Wk94QkFBMnp2QjYvQ2IycVJ0bjQwUEIvV0xw?=
 =?utf-8?B?QytXdThpZ0c0aElmVmRSazN6eFgrbXVFZCtPWk82OURYMy96bTB2SExkWkdk?=
 =?utf-8?B?My9OVVVnK2tWNFBObUR0ZFZjKzNiWlJQbUlYYXZBRnRLdEp4NzFlQk8wc29N?=
 =?utf-8?B?dXhnbGFZU09vakp4eGRGSCsyeDZZNUQ3NnNBRm9tMnU3TjhtV0VXVTVickZN?=
 =?utf-8?B?ZEFUN05WTWovczJzaTJnUnJXVDhPUFZmdmJNZUhwdFBYcVJ1cnNFUkc3TWI4?=
 =?utf-8?B?S0NQTTlBYjdyMTFuVUh1aGVFMFFIbXRxdDNySEVBcktuUExLRmJGZjhodkJF?=
 =?utf-8?B?STNFTmlIVmNOaks2VnNUbWoxejV3SGg3ZWVNUDNvMEhtcUVnZVFXK3M1Q1JO?=
 =?utf-8?Q?MGrtwsu9E3sb/uGnf0avBNsXYEarCQzU/aLwYLP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a35b207f-2586-4558-fcb9-08d94d5ab75c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 21:50:27.0297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiNYXJUswAH1Pp1KLMrhP3eQugnLqGIagUTAv5SalCGppr+xeXgmEb4yq8I834pLcnvymKNWZjxEmax1NqohAFJY4sKAGP0CX7ULMnIk9I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1548
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
Cc: intel-gfx@lists.freedesktop.org, john.c.harrison@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


<snip>

>>> @@ -1756,15 +1796,119 @@ static int guc_context_alloc(struct intel_context *ce)
>>>    	return lrc_alloc(ce, ce->engine);
>>>    }
>>> +static void guc_context_set_prio(struct intel_guc *guc,
>>> +				 struct intel_context *ce,
>>> +				 u8 prio)
>>> +{
>>> +	u32 action[] = {
>>> +		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
>>> +		ce->guc_id,
>>> +		prio,
>>> +	};
>>> +
>>> +	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
>>> +		   prio > GUC_CLIENT_PRIORITY_NORMAL);
>>> +
>>> +	if (ce->guc_prio == prio || submission_disabled(guc) ||
>>> +	    !context_registered(ce))
>>> +		return;
>>> +
>>> +	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>>> +
>>> +	ce->guc_prio = prio;
>>> +	trace_intel_context_set_prio(ce);
>>> +}
>>> +
>>> +static inline u8 map_i915_prio_to_guc_prio(int prio)
>>> +{
>>> +	if (prio == I915_PRIORITY_NORMAL)
>>> +		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
>>> +	else if (prio < I915_PRIORITY_NORMAL)
>>> +		return GUC_CLIENT_PRIORITY_NORMAL;
>>> +	else if (prio != I915_PRIORITY_BARRIER)
>> Shouldn't this be I915_PRIORITY_UNPREEMPTABLE?
>>
> No, I915_PRIORITY_UNPREEMPTABLE is an execlists only concept.

then we need a

/* we don't expect umpreemptable submissions with the GuC */
GEM_BUG_ON(prio == I915_PRIORITY_UNPREEMPTABLE)

or something, because that prio level would be assigned incorrectly 
otherwise.

Daniele

