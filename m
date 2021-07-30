Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1313DBE24
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 20:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EAF6E434;
	Fri, 30 Jul 2021 18:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71A16E432;
 Fri, 30 Jul 2021 18:13:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="200350646"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="200350646"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 11:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="477067995"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2021 11:13:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 11:13:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 30 Jul 2021 11:13:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 30 Jul 2021 11:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM5FAVFoUVsnI/yElR8vMavmXcmsCn06DG8QqJcPtU45ZbrUXSBcJedeU/Ji8DfTM7w/EdYVhrtrVJM/CWOqVPUtw7UNE1r8z0RyRnh18nFux7foVtTeqipknxjQiwxnekVPhWMyKeKmsQtYKS0EZxACKc5VffSoaE2oQb6m2XCtWsUzqLVpB+4NpP4oEZPdAEckSQ7q9LET0NwdMkmwJxCzlOpGIaS7/4mCmqpPQ8ULyOCFy1S7UPjuTvvbvzuJY+RzeAwg7WdNf+/0O2GduBy4+NkTseY/DvzimSVztTDfd5vFp24WeAg6Di8k31nidl60/7LEwgz3yRd7J+crYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8g5rROSx9kN5zQzF5zLPUuOnmyNGORQ3ulqoazDTVM=;
 b=FUJw6sa8MIZPbKICvdeE5yUkmEAeXMwrHT4YQtuyc5FcYPjMaC4CwEDp51BslmNtGAWY3OMG7P1xq+RKUi0rfuhdShLDTfVitCfVgukQxl9eB6Im6CkvX0JmfZFZ7ZIoWzckLsdBmJEOnzGWMbW5LLTBto+bo9IXG+YzucAraj04ypjAiFGeQRkF9MFmjzl+n9VGV34Xdg/ciOh1ApApYNtwnixKwljEeOVxk9owf7cL+j9R5Knkw1L6tKPoVdb0A/zM2IljulzE5CP0OGWyMsCIYQXRaZ5VE80awp5r4zsdmYU6eAap70ek0XF5imaY2TcKfl4XbiShNcNvOncwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8g5rROSx9kN5zQzF5zLPUuOnmyNGORQ3ulqoazDTVM=;
 b=eGsWF89gONOwAbIisO0h7E/Bj+IQbwKWa6K46MmzSeMmka+pQpYacy2e9YKtjEOOEeTj+pbbxdECIeixarYXVp+bxupJtTfZ1nLBsKYWakyImsRT8W1IT9pF3iUWux76PLBdC3ejOBZk0KF9cabijsZp6LHNme+rhktFGVIl4do=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 18:13:23 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 18:13:23 +0000
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: Check if engine has heartbeat
 when closing a context
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20210729003400.151864-1-matthew.brost@intel.com>
 <20210729003400.151864-2-matthew.brost@intel.com>
 <eea0bdb7-681b-0acb-0b9c-041fb38a7119@intel.com>
 <1b75f6c6-e458-6bc7-f867-12f1b5b18af0@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <e6e893a7-a0e2-0441-260f-75da3760de0b@intel.com>
Date: Fri, 30 Jul 2021 11:13:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <1b75f6c6-e458-6bc7-f867-12f1b5b18af0@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0077.namprd03.prod.outlook.com (2603:10b6:303:b6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Fri, 30 Jul 2021 18:13:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec3d8de5-feb7-4671-8390-08d95385b7e6
X-MS-TrafficTypeDiagnostic: PH0PR11MB5644:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56442B657D52D2E9359CD36CBDEC9@PH0PR11MB5644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NnBHPxcNeEySZvkeEh5zzdYAqJwJwSGMc9TFPD7Lz1XCW5E47POhNko6vbNDy29+oREhaF8QgZ50jX3wKga6aggNxd4/Kusy4SNB7ILDoaSHhZgEv8skFE1HmmrTdgj48ikfCurTBPJqGBgIXd3oeF5l3nXm+5NQlD8IW42EUINhPfd3rNuMWgHwhnjZCQ6HqgtEDeVr+TdzEgp6K/4BmYJNdaKaf36ugJrUmd8IaOD8U+HeSdHGwxSCt/gKXYdNRfCLGdpP0aZ/zpf3kT/id0CtSm8K0RHIptY6YbuOCYtOeZAVnEy8P6XyIyKZqLZjkybrbflN90YE9ln6yyglyFf6Av7/OmZZi3j2WWVQqcgHjbHO1bAsVsPBvM+Fb/onQaeWF8/YOlLOiVWDzdi7iHNoeIgMmnQMeCCNXXxlzhpZvoS3UTnLZg66hgNa3CQbnZtMOHxD5bvA95ari8Mglk1GitM9mkCX/K/G6yHFN3vNailJFbpW/GXo01pB/8hY94slMZpc6bup21iKUd+3TPuFg5YGHysNymZNjS04dYxXvcaZOPOZmd9t4RJxCDfkc+GomqFIwCDr8CZonwohlGjC4PLcEh33SSaWK2N3nv0yz410GRhvbOXSSw9JVuSCrQMF8454rrLiPXqTGsovMCIWeyryuu43pp7fiJQJToJtNo6mAQoeD0CxN9WmymNwUDSsXOFoiEEsBImbHqssDiC1SCJvz7d3dDuMONbKukFu1L3BpKE29QOPEXXBEF39
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(8676002)(5660300002)(8936002)(86362001)(316002)(16576012)(31696002)(83380400001)(110136005)(31686004)(2906002)(66946007)(2616005)(966005)(66476007)(66556008)(478600001)(6486002)(36756003)(26005)(30864003)(53546011)(186003)(956004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWVNZmZZcEJRTGZSTzNHZ1J0TWVFOHpZKzRBcDhXWjhJNU5mRjVrU1BxbUF4?=
 =?utf-8?B?Z1JmdW01N1JFTFZ2em9GYjFMaTBuMFNPdWNVMlNldXAvTlgxU0lpYTZpMVZI?=
 =?utf-8?B?cU0za3pUdmt0eW5TZTU0Z3VGOExEekN6S2duQW45cE53TFBPZzY1bFlJbVJX?=
 =?utf-8?B?ZVJsZ3BvSVZnc1JseWl0QW8wTEdta09ZQjZjV2ZwR0FGZS9BZVlKV0NpSVAy?=
 =?utf-8?B?WGFXbXJFUW9mdGxYMSs3UzJ5K3VXZW95RHpDR3E1ck9nc051aUhNNlNBTDBV?=
 =?utf-8?B?QTVvWlZRaWxrTStsek4yOG5UYVJRVld1cVB3OGlqUUNlZzlXaTlKZTBUakEx?=
 =?utf-8?B?aFlvcUtwYTdMVURkOUtsakRjejRWSjB0YjdqS0VGSGttanBHdGRHYitXcWc0?=
 =?utf-8?B?cERTVDdUa3A1Rzk4ZGZ2MjJXS3VLUzZLV3hGbkgzc1FIQVVhdVp1MnZOWVc2?=
 =?utf-8?B?ODJCVFFmQkhmMVBtRmRSWDdDODAvN0d0ZXBuU01Cd3gzRUVjM05sOFhDNXc3?=
 =?utf-8?B?Q2hQNm1TeUJ5M3NXclJIaHVNYndRVm5tbThwL1RkRms3VUh3RkwxWndoUUV6?=
 =?utf-8?B?dlljcDdZRndZWk9mcE8ycXlWVCtWUlNyZTRwSU5YWVdRK0dPTlNFd2lSdkU2?=
 =?utf-8?B?ZGVhQmdpVEtjUnpUaXdSeWdNVGhBeEZScFBRcVRBZXFLUzYxazVveVNFWC8w?=
 =?utf-8?B?TnBEeDl3bzVweUhRZVNqRFNvaWN4ZStCWllwazNPdTFBbTdxTHVIUXAxc1hq?=
 =?utf-8?B?VTVKVjd2YzVRb2JJdnUyQ20vKzdvYkZ2YkFyak9QeGxzcktITm9zanRBTVk5?=
 =?utf-8?B?TVRzU3RqRVMwajJXSmRuemR6bTQzUmxUYmZjbDUySWo5NkVPTnNGWjB6c2lS?=
 =?utf-8?B?aUZqeTNyYUQ4M2t4Sjh4dE05Wng3WmVzNEYrZis0aGJQbTFaeFJsTnF1a2J2?=
 =?utf-8?B?RU5hd1hvRUthb0VEcmFqOXFRS08yWWI1Y2UzVXV4SlJlL0hVMkRjVXlKbzVp?=
 =?utf-8?B?MHR1a3ZlNGZoZGUyNTYrVXN2WWpsZzN6amYzN1UwQjYybkZmU09lRU9pNEJr?=
 =?utf-8?B?Tkt3eW1keWVDN3Q4U2xnOEROZDZ6QUp1ZU1MZjhJRkltazRnRmhxTWQxY2FT?=
 =?utf-8?B?Y2lTdEVwUkhPWFBHQTNFOWZVY3FIeC9RazJTcW82MnVjOXdiVTJVaDN5NU14?=
 =?utf-8?B?K3U2VGppOWpyeEY3dFAvZFBRaGhkM1dEQm9xYXpWeGpzdFlhSUw4YlQrQkhh?=
 =?utf-8?B?ZjFNaERKNUZSbHA3ekZtakVHYm92cFg0bkFMMURCSGZpOGYvbnVNSlRTTzFl?=
 =?utf-8?B?L2lKd0F3NGlxS29jT2VYb210L2NLdkhpWWR3QlBBQkhLMndOalNjV3MyRUJM?=
 =?utf-8?B?anYzVXQ0WE0vUXdWaWVXb09QY2t2S1RBVlVnbFVsYk5FZXhiVnN1TkVyYUM2?=
 =?utf-8?B?TkhoQVFRb2czWllLdVV3OXFOVzFlbXlRb1lOK05oQmFpYW0wYklYdWpINVI2?=
 =?utf-8?B?L0ZtMlozRlJNRG0yV0NXVTI1Z0dIdnNQbzRKYlZicFNJbXo3eHhEV0ZtMzFR?=
 =?utf-8?B?TmkzUWJIWThqY0VoT1M2WUFoTEVtdjNVTy8wNUpkeWY0SWI4R1RZOGRnMU91?=
 =?utf-8?B?azZ4a0I1bTZNSFNHZUhhSjVsRnJDRXZLMmx2SFZzd0FKSFpaRkNBc2FmTXU0?=
 =?utf-8?B?S3RTbmlnSmpNVXl0N3U5UDdoTUxBTmxWeHpqbUNFSXZZNC84Qy9EL0VWSVMx?=
 =?utf-8?Q?/J64nWTa5VzCfpqU8eFgMVy/0I8kBWl0NYygMts?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3d8de5-feb7-4671-8390-08d95385b7e6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 18:13:23.2063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoWEgLUJ/qO+nPIn4KFKf2tAbWthG30Zlu2CzARC7Z/pRH0r7oAFrGs3CadXWBUIQaw+c+qCB0iDSoZJZJSwIli9qGBrpdw7MRoRZp1en7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
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

On 7/30/2021 02:49, Tvrtko Ursulin wrote:
> On 30/07/2021 01:13, John Harrison wrote:
>> On 7/28/2021 17:34, Matthew Brost wrote:
>>> If an engine associated with a context does not have a heartbeat, 
>>> ban it
>>> immediately. This is needed for GuC submission as a idle pulse doesn't
>>> kick the context off the hardware where it then can check for a
>>> heartbeat and ban the context.
>
> Pulse, that is a request with I915_PRIORITY_BARRIER, does not preempt 
> a running normal priority context?
>
> Why does it matter then whether or not heartbeats are enabled - when 
> heartbeat just ends up sending the same engine pulse (eventually, with 
> raising priority)?
The point is that the pulse is pointless. See the rest of my comments 
below, specifically "the context will get resubmitted to the hardware 
after the pulse completes". To re-iterate...

Yes, it preempts the context. Yes, it does so whether heartbeats are 
enabled or not. But so what? Who cares? You have preempted a context. It 
is no longer running on the hardware. BUT IT IS STILL A VALID CONTEXT. 
The backend scheduler will just resubmit it to the hardware as soon as 
the pulse completes. The only reason this works at all is because of the 
horrid hack in the execlist scheduler's back end implementation (in 
__execlists_schedule_in):
         if (unlikely(intel_context_is_closed(ce) &&
                      !intel_engine_has_heartbeat(engine)))
                 intel_context_set_banned(ce);

The actual back end scheduler is saying "Is this a zombie context? Is 
the heartbeat disabled? Then ban it". No other scheduler backend is 
going to have knowledge of zombie context status or of the heartbeat 
status. Nor are they going to call back into the higher levels of the 
i915 driver to trigger a ban operation. Certainly a hardware implemented 
scheduler is not going to be looking at private i915 driver information 
to decide whether to submit a context or whether to tell the OS to kill 
it off instead.

For persistence to work with a hardware scheduler (or a non-Intel 
specific scheduler such as the DRM one), the handling of zombie 
contexts, banning, etc. *must* be done entirely in the front end. It 
cannot rely on any backend hacks. That means you can't rely on any fancy 
behaviour of pulses.

If you want to ban a context then you must explicitly ban that context. 
If you want to ban it at some later point then you need to track it at 
the top level as a zombie and then explicitly ban that zombie at 
whatever later point.


>
>> It's worse than this. If the engine in question is an individual 
>> physical engine then sending a pulse (with sufficiently high 
>> priority) will pre-empt the engine and kick the context off. However, 
>> the GuC 
>
> Why it is different for physical vs virtual, aren't both just 
> schedulable contexts with different engine masks for what GuC is 
> concerned? Oh, is it a matter of needing to send pulses to all engines 
> which comprise a virtual one?
It isn't different. It is totally broken for both. It is potentially 
more broken for virtual engines because of the question of which engine 
to pulse. But as stated above, the pulse is pointless anyway so the 
which engine question doesn't even matter.

John.


>
>> scheduler does not have hacks in it to check the state of the 
>> heartbeat or whether a context is actually a zombie or not. Thus, the 
>> context will get resubmitted to the hardware after the pulse 
>> completes and effectively nothing will have happened.
>>
>> I would assume that the DRM scheduler which we are meant to be 
>> switching to for execlist as well as GuC submission is also unlikely 
>> to have hacks for zombie contexts and tests for whether the i915 
>> specific heartbeat has been disabled since the context became a 
>> zombie. So when that switch happens, this test will also fail in 
>> execlist mode as well as GuC mode.
>>
>> The choices I see here are to simply remove persistence completely 
>> (it is a basically a bug that became UAPI because it wasn't caught 
>> soon enough!) or to implement it in a way that does not require hacks 
>> in the back end scheduler. Apparently, the DRM scheduler is expected 
>> to allow zombie contexts to persist until the DRM file handle is 
>> closed. So presumably we will have to go with option two.
>>
>> That means flagging a context as being a zombie when it is closed but 
>> still active. The driver would then add it to a zombie list owned by 
>> the DRM client object. When that client object is closed, i915 would 
>> go through the list and genuinely kill all the contexts. No back end 
>> scheduler hacks required and no intimate knowledge of the i915 
>> heartbeat mechanism required either.
>>
>> John.
>>
>>
>>>
>>> This patch also updates intel_engine_has_heartbeat to be a vfunc as we
>>> now need to call this function on execlists virtual engines too.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
>>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
>>>   drivers/gpu/drm/i915/gt/intel_engine.h        | 21 
>>> ++-----------------
>>>   .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
>>>   6 files changed, 26 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index 9c3672bac0e2..b8e01c5ba9e5 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -1090,8 +1090,9 @@ static void kill_engines(struct 
>>> i915_gem_engines *engines, bool ban)
>>>        */
>>>       for_each_gem_engine(ce, engines, it) {
>>>           struct intel_engine_cs *engine;
>>> +        bool local_ban = ban || 
>>> !intel_engine_has_heartbeat(ce->engine);
>
> In any case (pending me understanding what's really going on there), 
> why would this check not be in kill_context with currently does this:
>
>     bool ban = (!i915_gem_context_is_persistent(ctx) ||
>             !ctx->i915->params.enable_hangcheck);
> ...
>         kill_engines(pos, ban);
>
> So whether to ban decision would be consolidated to one place.
>
> In fact, decision on whether to allow persistent is tied to 
> enable_hangcheck, which also drives hearbeat emission. So perhaps one 
> part of the correct fix is to extend the above (kill_context) ban 
> criteria to include hearbeat values anyway. Otherwise isn't it a 
> simple miss that this check fails to account to hearbeat disablement 
> via sysfs?
>
> Regards,
>
> Tvrtko
>
>>> -        if (ban && intel_context_ban(ce, NULL))
>>> +        if (local_ban && intel_context_ban(ce, NULL))
>>>               continue;
>>>           /*
>>> @@ -1104,7 +1105,7 @@ static void kill_engines(struct 
>>> i915_gem_engines *engines, bool ban)
>>>           engine = active_engine(ce);
>>>           /* First attempt to gracefully cancel the context */
>>> -        if (engine && !__cancel_engine(engine) && ban)
>>> +        if (engine && !__cancel_engine(engine) && local_ban)
>>>               /*
>>>                * If we are unable to send a preemptive pulse to bump
>>>                * the context from the GPU, we have to resort to a full
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h 
>>> b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> index e54351a170e2..65f2eb2a78e4 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> @@ -55,6 +55,8 @@ struct intel_context_ops {
>>>       void (*reset)(struct intel_context *ce);
>>>       void (*destroy)(struct kref *kref);
>>> +    bool (*has_heartbeat)(const struct intel_engine_cs *engine);
>>> +
>>>       /* virtual engine/context interface */
>>>       struct intel_context *(*create_virtual)(struct intel_engine_cs 
>>> **engine,
>>>                           unsigned int count);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h 
>>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>>> index c2a5640ae055..1b11a808acc4 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>>> @@ -283,28 +283,11 @@ struct intel_context *
>>>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>>                   unsigned int count);
>>> -static inline bool
>>> -intel_virtual_engine_has_heartbeat(const struct intel_engine_cs 
>>> *engine)
>>> -{
>>> -    /*
>>> -     * For non-GuC submission we expect the back-end to look at the
>>> -     * heartbeat status of the actual physical engine that the work
>>> -     * has been (or is being) scheduled on, so we should only reach
>>> -     * here with GuC submission enabled.
>>> -     */
>>> -    GEM_BUG_ON(!intel_engine_uses_guc(engine));
>>> -
>>> -    return intel_guc_virtual_engine_has_heartbeat(engine);
>>> -}
>>> -
>>>   static inline bool
>>>   intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>>>   {
>>> -    if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>>> -        return false;
>>> -
>>> -    if (intel_engine_is_virtual(engine))
>>> -        return intel_virtual_engine_has_heartbeat(engine);
>>> +    if (engine->cops->has_heartbeat)
>>> +        return engine->cops->has_heartbeat(engine);
>>>       else
>>>           return READ_ONCE(engine->props.heartbeat_interval_ms);
>>>   }
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> index de5f9c86b9a4..18005b5546b6 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> @@ -3619,6 +3619,18 @@ virtual_get_sibling(struct intel_engine_cs 
>>> *engine, unsigned int sibling)
>>>       return ve->siblings[sibling];
>>>   }
>>> +static bool virtual_engine_has_heartbeat(const struct 
>>> intel_engine_cs *ve)
>>> +{
>>> +    struct intel_engine_cs *engine;
>>> +    intel_engine_mask_t tmp, mask = ve->mask;
>>> +
>>> +    for_each_engine_masked(engine, ve->gt, mask, tmp)
>>> +        if (READ_ONCE(engine->props.heartbeat_interval_ms))
>>> +            return true;
>>> +
>>> +    return false;
>>> +}
>>> +
>>>   static const struct intel_context_ops virtual_context_ops = {
>>>       .flags = COPS_HAS_INFLIGHT,
>>> @@ -3634,6 +3646,8 @@ static const struct intel_context_ops 
>>> virtual_context_ops = {
>>>       .enter = virtual_context_enter,
>>>       .exit = virtual_context_exit,
>>> +    .has_heartbeat = virtual_engine_has_heartbeat,
>>> +
>>>       .destroy = virtual_context_destroy,
>>>       .get_sibling = virtual_get_sibling,
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 89ff0e4b4bc7..ae70bff3605f 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2168,6 +2168,8 @@ static int guc_virtual_context_alloc(struct 
>>> intel_context *ce)
>>>       return lrc_alloc(ce, engine);
>>>   }
>>> +static bool guc_virtual_engine_has_heartbeat(const struct 
>>> intel_engine_cs *ve);
>>> +
>>>   static const struct intel_context_ops virtual_guc_context_ops = {
>>>       .alloc = guc_virtual_context_alloc,
>>> @@ -2183,6 +2185,8 @@ static const struct intel_context_ops 
>>> virtual_guc_context_ops = {
>>>       .enter = guc_virtual_context_enter,
>>>       .exit = guc_virtual_context_exit,
>>> +    .has_heartbeat = guc_virtual_engine_has_heartbeat,
>>> +
>>>       .sched_disable = guc_context_sched_disable,
>>>       .destroy = guc_context_destroy,
>>> @@ -3029,7 +3033,7 @@ guc_create_virtual(struct intel_engine_cs 
>>> **siblings, unsigned int count)
>>>       return ERR_PTR(err);
>>>   }
>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct 
>>> intel_engine_cs *ve)
>>> +static bool guc_virtual_engine_has_heartbeat(const struct 
>>> intel_engine_cs *ve)
>>>   {
>>>       struct intel_engine_cs *engine;
>>>       intel_engine_mask_t tmp, mask = ve->mask;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>> index c7ef44fa0c36..c2afc3b88fd8 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>> @@ -29,8 +29,6 @@ void intel_guc_dump_active_requests(struct 
>>> intel_engine_cs *engine,
>>>                       struct i915_request *hung_rq,
>>>                       struct drm_printer *m);
>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct 
>>> intel_engine_cs *ve);
>>> -
>>>   int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>>>                      atomic_t *wait_var,
>>>                      bool interruptible,
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

