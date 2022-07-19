Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87D578F1D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 02:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE0D10E979;
	Tue, 19 Jul 2022 00:17:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239A110E15C;
 Tue, 19 Jul 2022 00:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658189820; x=1689725820;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sqvjPwA11lCpV3Ly1gveWU8VEzWV4tXwOOnvW3EDvLM=;
 b=c0iE+VY0fzP6yeB9zxDJPElyxD6jV8+qm+yByuJ0qbKS1VmDxX3wwtAS
 dxVxXgWkX6mFwSrWy3Aspr1pD91TFPzwJds5Tqq6zq+GcDz6g/mexCav0
 XFkM8pP+WDSIyg0TexmyyatXWFzGZIPo6ehrB0dYKAliMvAyurvSHCsDU
 ZhKEHAWdp5vFNPvsC28rhownKwh+zVn+emPaqCMxizOYs8ZZjQP/Bs6o4
 XbdM4yVWuybFKgWuTNS2BvqdG+Jn7FxpnNLNgRreVg9NjmIZps3IgDG1x
 qO5I/rXz+VNxZNYrjWrLxn+YNJPfT5Lkvlc3PBEpbVHyU1DQtrO5Hj2yQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350315112"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="350315112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 17:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="655506735"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2022 17:16:59 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 18 Jul 2022 17:16:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 17:16:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 18 Jul 2022 17:16:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 17:16:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lV7hoWpSNQLBzZoUzG+J7EsfvNbX83CLUdfWURd79/iRRyxO0nJTBx/mU8r9MG6inNS1SzhdMN7CpqEIpQcfc1lk2K5bis5sst9fYBT5q/kbt4T/mTHzxQItlU024IMgtp86KHylwHzuxXmOodQ9/KUYkkjC/z3wY9acmUGn/a1iIF2vb+9pDVFs/aobIzegH1VltYEUPap5B6vH3eC2CWnSsqz6wnSK+CKdBdh93mL28ZLbEfJC6dOfLdd455ZDavRJ3tnFrpzzxFcj88TkNxkdJfApDTls41uL82cLaOcyKwX0fK+dRmpHBEif+xcaV049hQGJPkOb9gvf7dWIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlpxWVu6dpUzMgws6oddiYmz7qzIJ8fzUrcZ57doYZ8=;
 b=i++qdih/n1saGGc0Hw6Q/lE1MIm/lmn/I1i8OmxuYiiL9h/UdD2H4PzaBYh1+tvU2xTfoqKEf4cBfQ61XNJI6Zajn6R7wdjX37V86DI6mVJRVwRlAEKNso+ILA1x9aBxkisEiZ+KiF5FakPu017NFKb8WRZR1FikuYNyRvK6gY/WKggI81+9y29H8KGDzzhS5g+GTob1jsVQDMkAe7gsZnK1onkvdGp0irlkc1aUV7QVuHxndV0RPEKXJr2bjetYnRLaKrsK6gGMvadh/5L4xx3qMKptVAS32jBNf1/Z2rL3pNmTJ4n1bEgb1brStfGv/Qy/V2TAKkYm3LpfYv9P1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB3545.namprd11.prod.outlook.com (2603:10b6:5:141::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Tue, 19 Jul
 2022 00:16:55 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 00:16:55 +0000
Message-ID: <4cf258f7-f423-b436-0093-4f22b38918ad@intel.com>
Date: Mon, 18 Jul 2022 17:16:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 11/12] drm/i915/guc: Don't abort on CTB_UNUSED
 status
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-12-John.C.Harrison@Intel.com>
 <76e0fe3e-4db5-78f6-304f-f67a4740d8a3@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <76e0fe3e-4db5-78f6-304f-f67a4740d8a3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 165550af-bb94-41f2-c8bd-08da691bfce5
X-MS-TrafficTypeDiagnostic: DM6PR11MB3545:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kK7Ok4HRYq9L8zOk4r6PwcpsTee0RunNiZIvuIKwVcwvXIkSfUjxRjub7Iy1J9JpCTAF6S8lL0DLStUQX+c16XQrdracvw3svBjr2RYAiOE3/uC1HQA6k4PhwWWiLlzT5j1kHFxvAIdyK92HRjNMNEIg3ntQx3Mz2knA3zAHElatYb8DkM7xm4qgfGECPQF0H01aNQs82UqthIdD2E3GYV7jcbQ+yTbOFZoRwWFw2nFVKoS9atr8YaxeA0MDLE3aB5RjPxLJ95INYsjAz+W0ufjVzX710fQenraCBf/lZgzqZ1xW2kTbiwBOe4RMfxpktXhZk75VXpNGnP1HVkidsR/De+lIksm4tZZ9OUSB/qj026r57ZH4XqvkkzJCBUeCwX/g7ibLRIidX6p9j014xsN1RSE/e4PfGjItRaDYBe5d3Rt/f0TA+SW3acdIVd60VVx36ftgHz6x/qG+Pal88mff6i1BTg5wakiANA4+askmPSpRZelmLx9MayJarUyL6DxSkB05wnojhJPBOkK9+LahV92P5SHA7g5Yl/zQDLCcvT3VV2WSc03hfLATpw+ZLfUg6NKCWeJQFxtcNynd062bUKY2LDwevV8vO/w9+xjlshAdzgGzTI2oo9cqV2o2RX8lPOQA6d4yYf4FhqcVBYUXJdRglRpXf7MT1tQx0SL5QXh6haiWd8GAVUjgDBd+aueO8XgrSTSewHg9cd+BHVdeOPuXShIOyhZLPbHICnnxNxsXyJNdPs8OrTkQIPb6nXaILSsJyEQGi3zeLJ0i5owSLJuGRUfqMb+BwnN4jP5j5YdBfgkXH4sL8Bgl3LeXgEZnybpmYM/C85PrqKDfew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(396003)(366004)(39860400002)(346002)(31696002)(86362001)(2616005)(6486002)(186003)(6512007)(478600001)(6506007)(41300700001)(53546011)(26005)(82960400001)(83380400001)(38100700002)(31686004)(2906002)(5660300002)(8936002)(36756003)(4326008)(66476007)(66556008)(316002)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2JJMldxY0xCZkltM3A5L2JIUlBrWitvS2hSYUd6dXBOVWZCQmpzanQ0VkJt?=
 =?utf-8?B?V0hMVzUxbWVyR25sV1gzSU13aUxnSFZURE9OTUpXNmM3WXc3ZUFabm1rdjE4?=
 =?utf-8?B?MitsSERtUk1iTHNlV3Z4dGQrRlVDS2F5WFVBTDdiNktpWWNEVWVWZVBxWXNw?=
 =?utf-8?B?Mkk2OWx2UGtlZThtWGV5djg5TCs3ZjN5Uk9vUmtPL0VHakpxYnlOYTV4S2dj?=
 =?utf-8?B?Y01mNVA2cTQveUpWZDVaMzBpUS9uelh4UXhNR2hOT1E4YnI5cnRydHhBeUZN?=
 =?utf-8?B?Slh6MERYVVhUNjQ5NnJSWWVsZ0R2WFJkckVIVnF2Rm9sV0EwbjREV1FSelVH?=
 =?utf-8?B?MFNyOWhWbUsxYjFHSnFncmRHa3pIaTcrSEVJd2UxcXIrenZtQm81VDNjUW5U?=
 =?utf-8?B?b3pTMXpsd05lVkhLbk5YR3RVWjFVZnpBd3V0MWNqU3RGdlE2REEyWFZ5b21y?=
 =?utf-8?B?RmFDUUp2RHRJM0taSHpkN1ZRS3VaVno2YkF1V0xTS29rTDRORGdSckxuV1p5?=
 =?utf-8?B?ZTBDckMydWtxMGRVMnRkU0tGdWdvNmdidzI2ZjFldjhCNmhrK3ZjanJsU2hT?=
 =?utf-8?B?dGFOZHUzRG9Ua3kyeVU2b0w1NkVNUlBRemNkM3M5ZGU3MnhRMlFGM0RpT09k?=
 =?utf-8?B?NnFtRjN1SUdtQ2x0NEZVWDJqVmJKbEFSWXBCUXVybjU2Q1lwcVQyeXM4dDRP?=
 =?utf-8?B?VGNvb1ZZQmVZaWFrT29oMGdCUENJL0M1SUtJL1Nnd25HYUZzRnJNMkVsR1dr?=
 =?utf-8?B?dDBJL05KWUY5bko5bE1tN3JvQU5seitXUWdzaGtzZ0k1S3FUUUhDZmJCc3ZZ?=
 =?utf-8?B?VWd5S0FNVzdLNTdNUjlNaFFjRHJFclpwWEFkd1k5ZDlpeExpOGl3N2hMRVdY?=
 =?utf-8?B?WGh5cktObHIzSUFGT0tBVzlPK25KTkV6ZnNnNnRIMklEb0ZWQjcrbkRqcnZK?=
 =?utf-8?B?b3B3M3dSNkxFWWFzb09YRzJja2E4b21DZ0s5OVE4SElhUFdrc2o2WnhyNTYy?=
 =?utf-8?B?a1pFZXhvTjVtOWdXZ2N4b0cyOXA5di9YUlBFK1Vob1pQQnVzVnJTNlNMK2xL?=
 =?utf-8?B?UXJOUFdvb2liWHVCb1VqSnVkRkUxM2FQUHUvWmFUV0lEMFQ4VllQYWMrbkRm?=
 =?utf-8?B?NjRxSXhmcTlXZnJVQ2h1bFhaaTRHZTNXbzNYZ0NqWit6OUh2UkxxMTFBK2NS?=
 =?utf-8?B?ZWtmY0gvSjlHVWhYVWVpQ0VzR1pMRzAyNWwwbHZybWZIM2JoUlFxcUUwSG1N?=
 =?utf-8?B?djZ6NzBua0NhYzZZZVpxOEg2T1Q5TUNUdWt0WVpIdEFldHNtZ01taWRwSy8w?=
 =?utf-8?B?ZDFGN0VzazErQ0tMZVhWaCtPeGZJSGlLWFlHVkFtUmoxYUhPMGFYU3lsWXdS?=
 =?utf-8?B?MEROU3ZidVJQNHVMQ2hZVG1MN0g0MmJtbDkweGMrVlFqM1JrSTFTS1M0UHNJ?=
 =?utf-8?B?VWF6R3pZcnR4MUZRTVhUcnBGZnJBMkNUWmFRbXNUMG1XbEgrTUl4b2YvMlJD?=
 =?utf-8?B?SmJqU3dSOWpTVWR4THZrcm45dDlFL3Z2RlJ3T054NmNNeXIwQzBKdGMwd2lu?=
 =?utf-8?B?b2RjdlVwTjJRRFF1MGhqVnVOMkl0bmdjdVFrL01DalFDTElVZ3o2T2JYZDIx?=
 =?utf-8?B?b1JjdDNsczBoMnlvVlRpbEpXcFV1Qi95Um0rTlQ3QVREM2tZLzVtUGJ0czlM?=
 =?utf-8?B?VVV2YVRsOWlzcGQ5QXY2azlZQjBnQWJ4VGlzb3F1N0IzSXpwOHJyRnN5UFU2?=
 =?utf-8?B?S1ZNYWdHR1E5a09HT1BzUDVEM2E4UUdCbFVXdE5SenZyQyt3dXRzVjdkZXdr?=
 =?utf-8?B?ZEM2MmxWclltK0JJZ3NNUFRITmR1U1U4aUh1c3RySm1YcEc4eit2UnY1VXJq?=
 =?utf-8?B?Zmx1amFQNEk5Ym54RVpHYkdhL1BxaVdNZ2lxd0NOdW4xTUxjTVlsaUNFUGtn?=
 =?utf-8?B?NXVuRUI3VEtwRHNrMmJZQkRtU2I3aml4L1o2WjJSMkpPUVlGazFLZm5ja0VD?=
 =?utf-8?B?Ull0c29mQjByMk1xdnU2cEdaeCtTSjlaRE9xMW5NZmxOdEVHSEU5dTltVWlU?=
 =?utf-8?B?Y2orM0xZd3NOM0t4V3NyUXB5eWJKaXFURUxCMGdRbDVSdGQzK0w5NjJQQVpO?=
 =?utf-8?B?aDFXYWg4VXEyR0FwNEtMc252ZkQ2WFhtanI2UUhYcFkzSy91b0xWek5WZ0JR?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 165550af-bb94-41f2-c8bd-08da691bfce5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 00:16:55.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47ox4CDX6vHi4VSx8sZaXqQsOlG0V5vfcHyDe1yq3LrhaFProfCYPVROB3T+o0Bzmb7M+iGDrWVsL0whM4LNqqdieb0lJ7WWHfkDOa+glUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3545
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

On 7/18/2022 05:36, Tvrtko Ursulin wrote:
> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When the KMD sends a CLIENT_RESET request to GuC (as part of the
>> suspend sequence), GuC will mark the CTB buffer as 'UNUSED'. If the
>> KMD then checked the CTB queue, it would see a non-zero status value
>> and report the buffer as corrupted.
>>
>> Technically, no G2H messages should be received once the CLIENT_RESET
>> has been sent. However, if a context was outstanding on an engine then
>> it would get reset and a reset notification would be sent. So, don't
>> actually treat UNUSED as a catastrophic error. Just flag it up as
>> unexpected and keep going.
>
> Does it need a Fixes: tag?
Not really. It's a theoretical hole only. It was exposed during POC work 
for a nasty w/a that ultimately didn't need to go forwards. The POC was 
generating fake interrupts and causing us to check the CTB channel after 
the CLIENT_RESET had been processed. We have never had an actual 
instance of an outstanding request during CLIENT_RESET. That would be a 
much more serious bug - trying to suspend while an engine is still 
processing a request.

John.


>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../i915/gt/uc/abi/guc_communication_ctb_abi.h |  8 +++++---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c      | 18 ++++++++++++++++--
>>   2 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git 
>> a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> index df83c1cc7c7a6..28b8387f97b77 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> @@ -37,6 +37,7 @@
>>    *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too 
>> large)     |
>>    *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated 
>> message)      |
>>    *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail 
>> modified)      |
>> + *  |   |       |   - _`GUC_CTB_STATUS_UNUSED` = 8 (CTB is not in 
>> use)         |
>>    * 
>> +---+-------+--------------------------------------------------------------+
>>    *  |...|       | RESERVED = 
>> MBZ                                               |
>>    * 
>> +---+-------+--------------------------------------------------------------+
>> @@ -49,9 +50,10 @@ struct guc_ct_buffer_desc {
>>       u32 tail;
>>       u32 status;
>>   #define GUC_CTB_STATUS_NO_ERROR                0
>> -#define GUC_CTB_STATUS_OVERFLOW                (1 << 0)
>> -#define GUC_CTB_STATUS_UNDERFLOW            (1 << 1)
>> -#define GUC_CTB_STATUS_MISMATCH                (1 << 2)
>> +#define GUC_CTB_STATUS_OVERFLOW                BIT(0)
>> +#define GUC_CTB_STATUS_UNDERFLOW            BIT(1)
>> +#define GUC_CTB_STATUS_MISMATCH                BIT(2)
>> +#define GUC_CTB_STATUS_UNUSED                BIT(3)
>>       u32 reserved[13];
>>   } __packed;
>>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index f01325cd1b625..11b5d4ddb19ce 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -816,8 +816,22 @@ static int ct_read(struct intel_guc_ct *ct, 
>> struct ct_incoming_msg **msg)
>>       if (unlikely(ctb->broken))
>>           return -EPIPE;
>>   -    if (unlikely(desc->status))
>> -        goto corrupted;
>> +    if (unlikely(desc->status)) {
>> +        u32 status = desc->status;
>> +
>> +        if (status & GUC_CTB_STATUS_UNUSED) {
>> +            /*
>> +             * Potentially valid if a CLIENT_RESET request resulted in
>> +             * contexts/engines being reset. But should never happen as
>> +             * no contexts should be active when CLIENT_RESET is sent.
>> +             */
>> +            CT_ERROR(ct, "Unexpected G2H after GuC has stopped!\n");
>> +            status &= ~GUC_CTB_STATUS_UNUSED;
>> +        }
>> +
>> +        if (status)
>> +            goto corrupted;
>> +    }
>>         GEM_BUG_ON(head > size);

