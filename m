Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D484DA0A5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 17:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C33810E285;
	Tue, 15 Mar 2022 16:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA4410E285;
 Tue, 15 Mar 2022 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647363552; x=1678899552;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f5U9IV06fQZjGRIVxG2N9CJN4+H9CZanY229wql9z94=;
 b=dl625Uudq/z+6D+xzeQzGFEMwNzKYDFd6e8JHHy11EM9z8fbgECpDWU0
 qpGNvSqgK/+SaetYFx6thojriTFJpdiscEgcpoffsSy6nXiJAiFHX0XqX
 Krlta5NyAn3XQUcGoY6RXMuqkkDodHZDYO0y8L71YBH6nwsPqPOu8z6Tc
 G8gU7IpEHGUd5KG6npQ6nWfWnghV28ZPvWsBjv6uXckLfNO9/dNukT6Ko
 8wagTTCzHeXmFYAx2kR6eVubfYPmAEV+ruMK8s2TcHuXsPPsEjVTJ8+An
 EqF7VEDQdCPeV5dRIi7MoAg2fj3yZgVdj2+9inUGPmReLVcGvSnstoj1S Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281133144"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="281133144"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 09:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="549666122"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2022 09:59:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 09:59:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 15 Mar 2022 09:59:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 15 Mar 2022 09:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwG5Le0b5R4c1b8kLvGKdQBk3tnxWzdHRKI9OLfBvSNV3EXIczQReFsdUOnCtTbvJRE1mKOAFlTALxyAmnvqqB4/mWssdANi+3mZqmENkuCP5whKoLhWd8gDEqeSVEqNnWujzIXzvUzN0EmxsI5J6Ey721T6r/tQVeseHoEQ1Odj7p2NZfZPBsJK0V8lGhRV0t9RlArS4+1dWFt8ksQ9wLI2UBOzjCjPFbgLVVOchgFtT+rallWfVcM5VDDDVCze7o71UBryIMQIRxIsxAj1SR9Hf7c7wuoGU1atx/IuJpyAyiwVJOWguk0zMvPzIRK8UMZrmBwJwz4l3bjlRU9xCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ34HxsVy9+lUoi53G1X8Z42saO0B5vsuEW7O1V9Mc8=;
 b=MNGMt/EEnYhkorBHRJBykqGYTK6b/jP0LuOcZzJ6faJdqg/+xhopPYxjfQU4LIp1Rf3UFRaYML1FWjCTlml/DnI+XOdz1CQ+RWUsbd0uCUL3Qf88pXZ7vdRWTt3cIqARzFdI1+cw58w8d2DKBDNQ4cHJHsY2SfVH9GQP56HHY6J3aBE2bJ2YTYHR7wZ6248lyP9N7hddC9dUCCo1aOWqSs4wr6Oc0L3d54dE2opIRS7Dzze4lVX7U5jZnTyxwn8GUrNXEkA6ym0ZsCxJNm/zigNY3XiPQUuqORYs5hw1u+/L8ewAKncGbgaSzDeKPUo43D16c478/Sc76Xo0v/q+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by SA1PR11MB5802.namprd11.prod.outlook.com (2603:10b6:806:235::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 16:59:08 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 16:59:08 +0000
Message-ID: <d2efdd6a-3cf1-be31-2e47-55a2bdac2b3d@intel.com>
Date: Tue, 15 Mar 2022 09:59:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/gem: Remove logic for
 wbinvd_on_all_cpus
Content-Language: en-US
From: Michael Cheng <michael.cheng@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20220222172649.331661-1-michael.cheng@intel.com>
 <20220222172649.331661-3-michael.cheng@intel.com>
 <40f820e6-6b28-fd8a-b058-13f0bbbf71fc@shipmail.org>
 <20220308175803.pszuli2ms3e7tah3@ldmartin-desk2>
 <109ec27b-3957-f13f-aec7-18fda2819ee0@intel.com>
In-Reply-To: <109ec27b-3957-f13f-aec7-18fda2819ee0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:a03:255::29) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da462026-8c06-4150-c02a-08da06a51ee5
X-MS-TrafficTypeDiagnostic: SA1PR11MB5802:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SA1PR11MB58028767D568F9F7510E076EE1109@SA1PR11MB5802.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMvvOMztYVlUWqZ9xyk8iI4ulivP7UxNsmiVQil0cIC2ljMZbgNa1KVO2Gfizf0YMruPNLpokIz8ph2BCL6tPqBek582em1ahVT0UiftOz5PwvQ/NJWmsGWRjTLsEcNXbRoAfZi4OO9xDf9bTMOIaWUH2TZ6Mh9LuyVlWgBrp9E+kVt6We9PVQXuJf3rPFBbJQQSlP8T15DoElY+h01Vraxz6diP71hHBC/Rsd263ifBZcs7sxFhqTLAWZ20cHDkNTKLoyECLe0VFO61xVctGm1hhru8KFdoqKkC4bagHYA72SLH4yzK8DsQ3Ri2HmkqbRLyHrI6ZDqKn8l0JwIueXTDs++zX0G3QndI5Qq2t1YfDD6pHZRepzOs68ISb0PpY/A+WjorXy9bWmNk3dH2Jh7BqY7bUgsmU79TnjXpvF7ecVa78hs/RHftY1xIHT7kINcPhoT4Un7p1RPZrSd0lDKXZ77GshSfddl+2Sq9g/ThH6n5nZUtueL2sCtu392+qfOx7/Arweem+atCcwNJcZQxnSLrwsWlZa/MEOcUixTsEFQN6CwxRJ8DOFeLfsY9bQNkaU5h9vq2QPCv+UpqMJsS1LQlRXWgHngw3aFP3sGcfPZ58y5cx0gt0ZcxpUCucHvJecE6+fY9iHufUoN6Uvt/B51+CYIt6qxhyG1s/sU4SYxIolqiDxt1OyndqQrijwZLLgsxW2/aVqwyuGieG5Kb2NFt3WXz+dHip/+2t8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(38100700002)(2616005)(316002)(508600001)(66574015)(4326008)(8676002)(66556008)(66476007)(966005)(66946007)(6486002)(6666004)(6636002)(31686004)(186003)(26005)(53546011)(6506007)(44832011)(36756003)(83380400001)(2906002)(6512007)(5660300002)(110136005)(86362001)(31696002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHFSaTJDckk5SjNERzJmUDA3eGNkNlFtMjFVK3dETjFGTUtFZHV0YlduZGVL?=
 =?utf-8?B?empqbmdMaWlMZnJoY0xXNUc4VnpRdm13aUhDVWQ1L1hFRjFNSW4yb0JTbVI2?=
 =?utf-8?B?enBXQllpSnZaaVVsb2owUG9LNVZuRTAzbzF5UjI3UEdPZkJ4U25nd1YzT2g3?=
 =?utf-8?B?UjRUeGdkNndDMUwyUlhpMDRyR3lyazdheFl6Rk9WRXRXbHo4c2hkYm5UaXRr?=
 =?utf-8?B?R01HQTFzT2diNjBEeGpTKy9JMTlyc3BwSk9jVXhqZDV5WWJxdUpZUkNHb2ti?=
 =?utf-8?B?UWZsT0J5SHJVTHNxSjJObVJKdkIyaUdmRkIrVHZXTzM4ZXAwK3NnWUlyY2kr?=
 =?utf-8?B?cm5tRkJYL3ZQSkQ2amFsSWtCYWZaWmRCK3NkR2Nvckl3aWRKMHRKMG56K25X?=
 =?utf-8?B?YVRzMVlDRTJXSjM2aDhMTk56QlE1UTM3elFscElWVjFwNVlBS1c5U1J0cS9y?=
 =?utf-8?B?V2Y2czg2dDM5R3dLS0twRyt3RHVVYUdTMUpTUFo4MmIrVmdXVy9BOEdHZEtK?=
 =?utf-8?B?SkxUQWFMaW45QU9Fdk1nNG1OaVNZK0MwbWdwelNvU1I4bmk5dU9lQnI4THVG?=
 =?utf-8?B?eDhRSjdaRU1IZzNNZlpCclpBeFdXa1prbVdrOGpqanljOTFtcEp1dm1qUWtn?=
 =?utf-8?B?aU9kSURYMGRiNFdndmFyNTNTMkhPTzRpRkJtMDh5R3VLWHA5eDRFbGtPS3Iw?=
 =?utf-8?B?QUZZRThoOGpRTTlRWStnWFhZZC9iVlJIelpFVk1MODdlV3VTNS9OTG9DNjEx?=
 =?utf-8?B?U2FWUTR1R0FuZGQwckhjNHpkNVdWenVEWkN2WVRxODVTbEo3bnRXcC92QTMw?=
 =?utf-8?B?N3dnOEhZZk9ocXI1dnNWZnRWd2ZwUE9OVWlIdU5RN2t6akllck9xVjFweHg3?=
 =?utf-8?B?b3BaY0FSaWJqekRGc0RlaWhtLzB0KzVGcmlDK1J6YllkbTM3cGt1T2JaRlNp?=
 =?utf-8?B?RDZYcEFNemxwcGM0d2poQ1JBRUhyVFlFVC92dHI2SG00ZTlwYnJjc1J1SStO?=
 =?utf-8?B?WEJjMGkyazBGd3JtSEVCMkoyM1BVeDlyb2pBY1BPUThOTDVFRVgwRGVXcmpu?=
 =?utf-8?B?elR3U3ZiVzl5MXF6OHY3U1htN3cxSzF2WkJGb01pbVRHSnlsSGUvakR5c0tJ?=
 =?utf-8?B?T3RLS0ZSUmVxaCt3N2dHb1ZWL3I5RzNKQUswUFNQbWQ2QWcyTGh4N1FQbEt1?=
 =?utf-8?B?bkxGZDkydVFEcFN6YzdkbkdaZzdxWm5GcDQ0dUZ0djVzeXlmZHZHK3JIakJZ?=
 =?utf-8?B?TmUrY3h4UHpPaFFnc2YyQUJkeG9vYVNGYVhTajRnMEhTbkxXeVkvdWpOM2hV?=
 =?utf-8?B?bXE2MnpGVGgzTitKLzNaSGhPODJxQTNzbjRCeTA5TTZzQXVBbzRoYlRFUURZ?=
 =?utf-8?B?V3hnUjRzdzFhYzdYOEdZT1lOcWpFWm05VkJqOVJWc3ZSMnpFd1Rlem9EVHow?=
 =?utf-8?B?SW85OFB5TVN0SHRqV0h6ekcxc3JBR0YveVY5MU1YMjBmOURhUjVHZnpqczdU?=
 =?utf-8?B?NWVlL1RFYUwycE00QjlVcWJhazVCSlpLQzUzWk1YclRkQjNvb0wzenk2ODlh?=
 =?utf-8?B?azNuaHdEOHhub3NKa2xZaC9oNTI2S3pSSzJkc0FTY1ZBdE5SNHljV2gvazRm?=
 =?utf-8?B?YWdCbGdvampZYzMxejJQdlArc1dwZWZCSS9TQysyRjZpT3QydHh6TVlJL3ly?=
 =?utf-8?B?UUtKZnYrV0IvZk1LSnNjVElJK2o0eGtTVXR2L2p6bDZIV1kxWGpnN3oxM0Js?=
 =?utf-8?B?SktteTcrR3czbUx3NHlZZkQzakorQlRXNzRZS0hLM1Q2Zi9qbUcwc1Uza0Y1?=
 =?utf-8?B?ak1qcUlCa3NJYThFdkZ2MmRiSzJCSnljdGxRcnFCRWtUUUY0aTZjWGk1ZjZK?=
 =?utf-8?B?OTZ0Um1DanNqcUxvYlpIYmZZZTZyNFpTOUV6L2V6OFNjaHMydXdURjFCbTF1?=
 =?utf-8?B?cVllTk43SDVqa2R1L2JQOEtJdkhxS29VN1VYeU5tNkVXRklpWVMwN3ZacjRz?=
 =?utf-8?B?OG5USFF0SDd3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da462026-8c06-4150-c02a-08da06a51ee5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 16:59:08.6121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IA5sAikJUL0ENzcceapTrRIRnfcHSzc/1ADntiOn4gfCFBExIvUFoc1nfuSaTskxC07lurKdTVWrrIPYHlM8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Daniel for additional feedback!

On 2022-03-14 4:06 p.m., Michael Cheng wrote:

> On 2022-03-08 10:58 a.m., Lucas De Marchi wrote:
>
>> On Tue, Feb 22, 2022 at 08:24:31PM +0100, Thomas Hellström (Intel) 
>> wrote:
>>> Hi, Michael,
>>>
>>> On 2/22/22 18:26, Michael Cheng wrote:
>>>> This patch removes logic for wbinvd_on_all_cpus and brings in
>>>> drm_cache.h. This header has the logic that outputs a warning
>>>> when wbinvd_on_all_cpus when its being used on a non-x86 platform.
>>>>
>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>
>>> Linus has been pretty clear that he won't accept patches that add 
>>> macros that works on one arch and warns on others anymore in i915 
>>> and I figure even less so in drm code.
>>>
>>> So we shouldn't try to move this out to drm. Instead we should 
>>> restrict the wbinvd() inside our driver to integrated and X86 only. 
>>> For discrete on all architectures we should be coherent and hence 
>>> not be needing wbinvd().
>>
>> the warn is there to guarantee we don't forget a code path. However
>> simply adding the warning is the real issue: we should rather guarantee
>> we can't take that code path. I.e., as you said refactor the code to
>> guarantee it works on discrete without that logic.
>>
>>     $ git grep wbinvd_on_all_cpus -- drivers/gpu/drm/
>>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>>
>>     drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:      * Currently we 
>> just do a heavy handed wbinvd_on_all_cpus() here since
>>     drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c: wbinvd_on_all_cpus();
>>
>> It looks like we actually go through this on other discrete graphics. Is
>> this missing an update like s/IS_DG1/IS_DGFX/? Or should we be doing
>> something else?
>>
>>     drivers/gpu/drm/i915/gem/i915_gem_pm.c:#define 
>> wbinvd_on_all_cpus() \
>>     drivers/gpu/drm/i915/gem/i915_gem_pm.c: wbinvd_on_all_cpus();
>>
>> Those are for suspend. Revert ac05a22cd07a ("drm/i915/gem: Almagamate 
>> clflushes on suspend")
>> or extract that part to a helper function and implement it differently
>> for arches != x86?
>>
>>     drivers/gpu/drm/i915/gem/i915_gem_pm.c: wbinvd_on_all_cpus();
>>
>> Probably take a similar approach to the suspend case?
>>
>>     drivers/gpu/drm/i915/gt/intel_ggtt.c: wbinvd_on_all_cpus();
>
> For a helper function, I have a #define for all non x86 architecture 
> that gives a warn on [1] within drm_cache.h Or would it be better to 
> implement a helper function instead?
>
> [1]. https://patchwork.freedesktop.org/patch/475750/?series=99991&rev=5
>
>>
>> This one comes from 64b95df91f44 ("drm/i915: Assume exclusive access 
>> to objects inside resume")
>> Shouldn't that be doing the invalidate if the write domain is 
>> I915_GEM_DOMAIN_CPU
>>
>> In the end I think the warning would be ok if it was the cherry on top,
>> to guarantee we don't take those paths. We should probably have a
>> warn_once() to avoid spamming the console. But we  also have to rework
>> the code to guarantee we are the only ones who may eventually get that
>> warning, and not the end user.
> Could we first add the helper function/#define for now, and rework the 
> code in a different patch series?
>>
>> Lucas De Marchi
>>
>>>
>>> Thanks,
>>>
>>> /Thomas
>>>
>>>
