Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24E5A16B7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 18:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F3610E7EC;
	Thu, 25 Aug 2022 16:31:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7872410E7EC;
 Thu, 25 Aug 2022 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661445111; x=1692981111;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t6An9QJGW+sUuOy7Z37fFEbrOc8BIilPjLJyMlg2aew=;
 b=Bt/fBKjrnTKwvyde7dZ/tzk6HrriXzuzglYNSXBTpX9+PkHw4K1vBUVW
 58+RJx535Dx5u27DH7aocLSP0wB4S2WdYpEc93IDiDkgZuSqkaYPC+du9
 0j0YoKqpb0O/a6snlgrjxhTFqaIbjyF+uqprPlIEn78bKuqBRmMGAuLYk
 av9hh5WsKNNh4+8MrTTPs7LKXdih+sQ+5fZw5mPzD45zG+f6MulbcVCQx
 NPhfJxkP3zZ07JNtovK+8AQpi6WISH9z73jEE+3e20bnOiHztvlWqsVCf
 n51jZyL9xbqD+gFV1b8thG9K6rI05f5w2g0xJlwIDQ3fMw1xfVdoXg+U0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="277307667"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="277307667"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 09:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="671067287"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2022 09:31:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 09:31:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 09:31:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 09:31:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 09:31:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8nVXWQt7HVYUQQo/BmPAD1olmYbJ/6rtSR4GBZ7OYcRijqfFuh8ocL3+gl7IXMkcrzudBKtPBdorjFQSBP+Mi/1eR1gjlM7pNpB9DFqb239B+Wvq8QKpC/R818ZZN1ik7lN5Ta4ywxFXFxjEfy2GnseWW5R+cEbFXahryzHhmJGSVNDWy2xqP1tOFKyicvLoLnT4ri2uLT/tSZmyHJ0WOCDDlWE9E3ruR17FUZZMlKW1O5ZCsx0dajJuAVcIPFKExgWFraeS420nnCzADeleMsXBHaSWqZ9ajjZBKMvI//UE6s32gEwSS9JsBB5q4yyvR8w7tLMfldgJUz6cjA02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsrWVXi0aMqqhN+F9esX4hcvogGkxaJ5UHV8IOFAbU8=;
 b=L+c4rdHYsqSj3ftTkQ8jH/kwxlHKlR7pkEmVg1QalaVVfdBKEDSJH6vi+hilBWuP6Phymj5dk5PxvqyjbL/UnUR6x5XQDVyLyPNsYXlTu0tHO8QtFyOuU23YzcbSYhovBsPRWxnw18UoaFRA2r8cf0YmM1lB4yETFDIN7AnFFPYUni0BinWFVc2eCEC+n7BBxLjvScIhi33GEN0PsIJK5ut7vMqdih4Av3t00IXjQwN7VjfZlPwgMDNOf2+m53SIQPGgWDiURj4fORnMLxrNqqMMLtyVt+hMH5HkboFHA1JG6KnwAfYvVQhZawINk/+ip9RX2w/GFlpwanpL6/ADGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1646.namprd11.prod.outlook.com (2603:10b6:301:c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Thu, 25 Aug
 2022 16:31:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::d078:34f1:873f:a40d]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::d078:34f1:873f:a40d%6]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 16:31:44 +0000
Message-ID: <899bfc43-cc8e-1e26-a58d-eeb80ed74d06@intel.com>
Date: Thu, 25 Aug 2022 09:31:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/guc: Make GuC log sizes runtime
 configurable
Content-Language: en-GB
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-7-John.C.Harrison@Intel.com>
 <166133167788.14547.12249088266216764022@jlahtine-mobl.ger.corp.intel.com>
 <4bd7b51a-caf0-d987-c7df-6cfb24f36597@intel.com>
 <166141170600.5625.4355115277022948576@jlahtine-mobl.ger.corp.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <166141170600.5625.4355115277022948576@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99fc0f53-4bca-43f6-d8e1-08da86b74bf2
X-MS-TrafficTypeDiagnostic: MWHPR11MB1646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9Wmn/GhZB9wK0XOb3hkcy4jTk7uu7UqzpkHMvY1DMfC4TednBC1cHvYiA1sKz2HwWgrLVALTYCub+mxFqEjHqBXwa/XF7zqfAUDHzoJd0KHgMrALy/uYIPBg0IYUAz8rXJ4dBTe8hWNJ2ogy1wn0ENppTqUSAVN+069dY3TYLdpuXxtnkVbe3LIB0e5DFE13msSSqs9In+t8k9gdcxMzmL6+3D3DEZctWgzsoZtZdw5fC1rORJsLgGCxqeTvtLO2/ZUru1Qfkg7dgSaprT4EXO/J1hZOthf4WrBfTpR3RZK0GLABFegPNp+ZOHpLEqhJVkqQrxJAG7MabLMJgP7eG0FAM/IGNGauvSsNbBVws3XxFs1xAWINisI8KqStyaHcEjxIkNGKA94ujoS/uJop1NqTQifpWGGE1E8AkG1CIMeR44i1Ny3bfJYclQhrV/xXsAOEjtH9PNuaJZnNVf+gitH8B5l7FRFhBmaGpiJYqxcFb2kdOBsAsc8bkJSSgGgIVfAZulo8Ba52MIayYglLwKq4fiM6XcK7NmYydbxf+nJdAG3CedfLsAYIDAUZgMTJxKIRgQI9sXG2nhnBAZQHnIXQpVKl2oumuAQGjrlaaWG7Gw3PYo74Ngejzl4pkWAos77qUL8IKtvWKOK5M4C56JTL6rTreVJ3JLJcwmokL8l9wGOpkln5p1OKhqHet3bWVCtT9gqTgKLGSa0GV35yFh6Wsed2TeIqwkNplvjEEHAW6PkVpYJF9BOPXjoGIy0/kq0hvf3d59c8VUdAwSMJiyBzvzPsviwpKHgS/cGgC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(36756003)(6486002)(30864003)(8936002)(66476007)(66946007)(5660300002)(66556008)(186003)(6512007)(478600001)(26005)(2616005)(4326008)(41300700001)(6506007)(83380400001)(53546011)(82960400001)(86362001)(31696002)(31686004)(6666004)(2906002)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZBWnY3ay80TUxka09MNm5BOUNLOUtUUmcyazZIbXFDNWNyMFhRbjdYWmU0?=
 =?utf-8?B?aFVQU3hiWVlOOVdrOGhtSnB5NWZtcFY3VGNseHAzcGFrOHp1Uzc4Tjd3OVN1?=
 =?utf-8?B?ZUFBY2RKaVNwQUFiRmpZL0w0amQxbjNXSHR1T0tqY0NUaFNBUnZ3YWE5Y3Uw?=
 =?utf-8?B?d3FtVjlLNXZHWmVnblZFMTFGenpPYTJ4RWJ2emM3Z2tpNmtWUUNpWU45UkFS?=
 =?utf-8?B?aldlRjZ2SjVNNERLYmRrMVhiZFRsV3UxWG4reWFSY0p5cnd3a3VFT3FRdXk4?=
 =?utf-8?B?MWgxbWRTTktGcDh4dmduT3ZxSzZJaDdZWThqN0x4YVhaSUFESFhYVDAxM3pj?=
 =?utf-8?B?cFRNeTl6OXZ3Nm9aWk4rTURBdDdETHFvM2lUcG1PazZveTh2ejVrZStlcHd1?=
 =?utf-8?B?Mlk4N3FSaFRPendzQjhodno4VlVXNndzZmhSL2JvWmZVdm00OVQ2MjZPNDY1?=
 =?utf-8?B?UVBkRi9GNjZnZklMc3BmNkJnOXM4cW54b2hRU3JmSysrMDNUVURXclJRaHUx?=
 =?utf-8?B?bmFRb0t5dUU4cDIwTy9Yc1ZxWk5FUitSYnIwbGNOd01BUkxycUxLaDdIeEdO?=
 =?utf-8?B?NDhrUUhLMnJPNXgzQ0Y3d0xpNitpbW9rUUY2YVRDZGs3ZktPc3o5b0FnZ2t1?=
 =?utf-8?B?cDNpU1RIV29aQXhqRDNQZTF6aWYwK1laVVZ0Z000cFF2YVlmNTM1bFdYMzZJ?=
 =?utf-8?B?czhUT2ZieUttd3hya3RpcjhkaDdRUFQ3TDJCRm83ZmdiUWwxZnNQeU1jRlJa?=
 =?utf-8?B?MnA1V2NwZ09DOXNxV3lIQ2w4ZEpucjNDc3JJK3ErRkJCN0FoblNyMmVOUWdo?=
 =?utf-8?B?U2t1S25lZnhveGlIQlZCRFMyZmJlQWtkT3ljRmxHV1lFVUl3K2VoUXhrVkZU?=
 =?utf-8?B?VWZhUW9UTHBBL3A2d1FzNVRDc1BZY1R5b0d1ZW1uQlVkNU9Da05iOS9remxJ?=
 =?utf-8?B?dEJ4eDhUUlRBamd6bzlyTUNKUk9JalZwZUdxMUlwZ2dkOEw3aUVUajNHWXkv?=
 =?utf-8?B?VDExM3Nkd1hINzJObjhyNStzaEQ5ekRFUDI0TUZqSkVWZm9WOXIxajZHakE0?=
 =?utf-8?B?WTFpYlQ3WW0xMStsVWpESFdVbUVjNVJ0VWxJZXN3eGRGbk9IYXlYR3NSaW1j?=
 =?utf-8?B?VXRpNy9rZmI1WHVQRVpiQkh4eW56MW9ZYVJwdnJjQW02MHJaOVZXSDQwYjlw?=
 =?utf-8?B?KytUdVh0MWxobitHSTR5aG9mb0pTRG5xWTB1NUNTSlZPQlFUbnJLd2FEWC95?=
 =?utf-8?B?d2tjOG9SWVc5TWoxL3phUHJ4Qm9OZ1JhQ0VTL1MxcXRhWm1sQ3hzTUFFTy8w?=
 =?utf-8?B?bmRyNnFXUURONURHc0dMdnR0c1FOZ3lIRzJjZWdxRytQQkNUVFllNjFpQjBz?=
 =?utf-8?B?cWhtdFdTazI3bEZ0UEwrK2hLQkhqdy9yUXpTQnQ1eEhSc3oza005UFVHQXVs?=
 =?utf-8?B?UG5vS0hRMXpiSG5wZ282dHRtOEFzcTR1cmlSL041WlgydTAzN3ZKWVRSeWNL?=
 =?utf-8?B?dzhHQW5pM3hOeDZnNWVocFZlcmhiRndmc0pDVWhhVHJxa29KeU9yb0RlWHNJ?=
 =?utf-8?B?MHM0R0dXczFaQXFORlZUVnBhZFVOTXZJR2xLWjVHMFlPd2wyVS94YTQrM2pn?=
 =?utf-8?B?Vmh5ZisvT1JoSjFPNm9zZk9NdHpKYWNXMWVUOXRMVmNjeFAzVDN6SWpSSTFK?=
 =?utf-8?B?M0VqZVgzQXA0VExqazd0dlhqOFFHQkgvcS9nTWg2NldoUkQvQmhkVko5aG5J?=
 =?utf-8?B?Wkw4NFNVNnNaSVZYcGdNYm1tRmRZOVFBVmkxN041TXBybm9WWEdWdGlqZmNT?=
 =?utf-8?B?UzZDWkpsbmYwRmpWVDJsNlFCSWJlazJUcXhZVS9mVU9mWHIrM01wOTRxSWd4?=
 =?utf-8?B?cXdsRHlrN0xFRUgwNHdBMm5VWXQ2MWNESHVma012Qm00R2xOVWgvaXVxVlVl?=
 =?utf-8?B?RmtaL011NFRxNzlJUmwrZ2VSbWFRclcxRUQxK25ia1liSEI4bDNFeSs4YmVR?=
 =?utf-8?B?R1FKZ3dqY3Q3Y1ZaOE96ZXhpcW5ZUTI2Wm45S2hlVmdadjZMODVjZjFFZC9W?=
 =?utf-8?B?YVNJSG1TWGtzM2tQWTNxK2VJcy9XZS96T2g5dzJyYi92cTZXZmQwVldzQnAx?=
 =?utf-8?B?VXJOaXBub0lIdHpmczFDSU95elF5VHRFUnI3MzcxcCsvU0MxMzhFUGdUWmtT?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fc0f53-4bca-43f6-d8e1-08da86b74bf2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 16:31:43.9252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myTnZpp27IsCiPWJ996O8XjoikWwWw0rzq9CrpkCw7rvCVNGShVUxEJdL9bHGkee/1TJvzqHepGHxkUisM6DU94l1U0hqBDyPNkwjyFbcBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1646
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

On 8/25/2022 00:15, Joonas Lahtinen wrote:
> Quoting John Harrison (2022-08-24 21:45:09)
>> On 8/24/2022 02:01, Joonas Lahtinen wrote:
>>> NACK on this one. Let's get this reverted or fixed to eliminate
>>> new module parameters.
>>>
>>> What prevents us just from using the maximum sizes? Or alternatively
>>> we could check the already existing drm.debug variable or anything else
>>> but addding 3 new module parameters.
>> We don't want to waste 24MB of memory for all users when 99.999% of them
>> don't care about GuC logs.
> It is not exactly wasting memory if it is what is needed to capture
> the error logs to properly debug a system. And it's definitely not much
> on any modern system where you will have a GPU. You can always leave
> the Kconfig options in place for the cases where it matters.
>
> On the other hand, if 99.999% don't need this, then it could just stay
> as a kernel config time option as well?
No. The point is that we need to able to ask customers to increase the 
log size, repro an issue and send us the results. All on a pre-installed 
system where they do not have the option to build a custom kernel. 
Either we always allocate the maximum and waste the memory for all end 
users or we have a runtime configuration option. Compile time is not 
acceptable for some important customers/situations.

>
>> We also don't want to tie the GuC logging buffer size to the DRM
>> debugging output. Enabling kernel debug output can change timings and
>> prevent the issue that one is trying to capture in the GuC log. And it
>> seems unlikely we could add an entire new top level DRM debug flag just
>> for an internal i915 only log buffer size. Plus drm.debug is explicitly
>> stated as being dynamically changeable via sysfs at any time. The GuC
>> log buffer size cannot be changed without reloading the i915 driver. Or
>> at least, not without reloading the GuC, but we definitely don't want to
>> create a UAPI for arbitrarily reloading the GuC.
>>
>> We can make these parameters 'unsafe' so that they taint the kernel if
>> used. But this is exactly what module parameters are for - configuration
>> that we don't want to hardcode as CONFIG options but which must be set
>> at module load time.
> It's better to have sane defaults. And if somebody wants something
> strange, they can have a Kconfig behind EXPERT option. But even then
> there should really be need for it.
Define sane.

Sane for most users is to not allocate 24MB of memory for an internal 
debug only buffer they will never use. And which completely swamps any 
error capture log with the ASCII encoding of said buffer.

But as above, we need a way to (very occasionally) get larger GuC logs 
from customers without rebuilding the kernel.

John.

>
> So for now, let's get the module parameters reverted and go with
> reasonable default buffer sizes when GuC is enabled. The compile time
> options can be left in place.
>
> Thank you in advance.
>
> Regards, Joonas
>
>> John.
>>
>>> For future reference, please do Cc maintainers when adding new uAPI
>>> like module parameters.
>>>
>>> Regards, Joonas
>>>
>>> Quoting John.C.Harrison@Intel.com (2022-07-28 05:20:27)
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> The GuC log buffer sizes had to be configured statically at compile
>>>> time. This can be quite troublesome when needing to get larger logs
>>>> out of a released driver. So re-organise the code to allow a boot time
>>>> module parameter override.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  53 ++----
>>>>    .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  14 +-
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 176 +++++++++++++++++-
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  42 +++--
>>>>    drivers/gpu/drm/i915/i915_params.c            |  12 ++
>>>>    drivers/gpu/drm/i915/i915_params.h            |   3 +
>>>>    6 files changed, 226 insertions(+), 74 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>> index ab4aacc516aa4..01f2705cb94a3 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>> @@ -224,53 +224,22 @@ static u32 guc_ctl_feature_flags(struct intel_guc *guc)
>>>>    
>>>>    static u32 guc_ctl_log_params_flags(struct intel_guc *guc)
>>>>    {
>>>> -       u32 offset = intel_guc_ggtt_offset(guc, guc->log.vma) >> PAGE_SHIFT;
>>>> -       u32 flags;
>>>> -
>>>> -       #if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>>>> -       #define LOG_UNIT SZ_1M
>>>> -       #define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>>>> -       #else
>>>> -       #define LOG_UNIT SZ_4K
>>>> -       #define LOG_FLAG 0
>>>> -       #endif
>>>> -
>>>> -       #if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>>> -       #define CAPTURE_UNIT SZ_1M
>>>> -       #define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>>>> -       #else
>>>> -       #define CAPTURE_UNIT SZ_4K
>>>> -       #define CAPTURE_FLAG 0
>>>> -       #endif
>>>> -
>>>> -       BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
>>>> -       BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
>>>> -       BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
>>>> -       BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
>>>> -       BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>>>> -       BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>>>> -
>>>> -       BUILD_BUG_ON((CRASH_BUFFER_SIZE / LOG_UNIT - 1) >
>>>> -                       (GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT));
>>>> -       BUILD_BUG_ON((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) >
>>>> -                       (GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT));
>>>> -       BUILD_BUG_ON((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) >
>>>> -                       (GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT));
>>>> +       struct intel_guc_log *log = &guc->log;
>>>> +       u32 offset, flags;
>>>> +
>>>> +       GEM_BUG_ON(!log->sizes_initialised);
>>>> +
>>>> +       offset = intel_guc_ggtt_offset(guc, log->vma) >> PAGE_SHIFT;
>>>>    
>>>>           flags = GUC_LOG_VALID |
>>>>                   GUC_LOG_NOTIFY_ON_HALF_FULL |
>>>> -               CAPTURE_FLAG |
>>>> -               LOG_FLAG |
>>>> -               ((CRASH_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_CRASH_SHIFT) |
>>>> -               ((DEBUG_BUFFER_SIZE / LOG_UNIT - 1) << GUC_LOG_DEBUG_SHIFT) |
>>>> -               ((CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) << GUC_LOG_CAPTURE_SHIFT) |
>>>> +               log->sizes[GUC_LOG_SECTIONS_DEBUG].flag |
>>>> +               log->sizes[GUC_LOG_SECTIONS_CAPTURE].flag |
>>>> +               (log->sizes[GUC_LOG_SECTIONS_CRASH].count << GUC_LOG_CRASH_SHIFT) |
>>>> +               (log->sizes[GUC_LOG_SECTIONS_DEBUG].count << GUC_LOG_DEBUG_SHIFT) |
>>>> +               (log->sizes[GUC_LOG_SECTIONS_CAPTURE].count << GUC_LOG_CAPTURE_SHIFT) |
>>>>                   (offset << GUC_LOG_BUF_ADDR_SHIFT);
>>>>    
>>>> -       #undef LOG_UNIT
>>>> -       #undef LOG_FLAG
>>>> -       #undef CAPTURE_UNIT
>>>> -       #undef CAPTURE_FLAG
>>>> -
>>>>           return flags;
>>>>    }
>>>>    
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>>>> index b54b7883320b1..d2ac53d4f3b6e 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>>>> @@ -656,16 +656,17 @@ static void check_guc_capture_size(struct intel_guc *guc)
>>>>           struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>>>           int min_size = guc_capture_output_min_size_est(guc);
>>>>           int spare_size = min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>>>> +       u32 buffer_size = intel_guc_log_section_size_capture(&guc->log);
>>>>    
>>>>           if (min_size < 0)
>>>>                   drm_warn(&i915->drm, "Failed to calculate GuC error state capture buffer minimum size: %d!\n",
>>>>                            min_size);
>>>> -       else if (min_size > CAPTURE_BUFFER_SIZE)
>>>> +       else if (min_size > buffer_size)
>>>>                   drm_warn(&i915->drm, "GuC error state capture buffer is too small: %d < %d\n",
>>>> -                        CAPTURE_BUFFER_SIZE, min_size);
>>>> -       else if (spare_size > CAPTURE_BUFFER_SIZE)
>>>> +                        buffer_size, min_size);
>>>> +       else if (spare_size > buffer_size)
>>>>                   drm_notice(&i915->drm, "GuC error state capture buffer maybe too small: %d < %d (min = %d)\n",
>>>> -                          CAPTURE_BUFFER_SIZE, spare_size, min_size);
>>>> +                          buffer_size, spare_size, min_size);
>>>>    }
>>>>    
>>>>    /*
>>>> @@ -1294,7 +1295,8 @@ static void __guc_capture_process_output(struct intel_guc *guc)
>>>>    
>>>>           log_buf_state = guc->log.buf_addr +
>>>>                           (sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER);
>>>> -       src_data = guc->log.buf_addr + intel_guc_get_log_buffer_offset(GUC_CAPTURE_LOG_BUFFER);
>>>> +       src_data = guc->log.buf_addr +
>>>> +                  intel_guc_get_log_buffer_offset(&guc->log, GUC_CAPTURE_LOG_BUFFER);
>>>>    
>>>>           /*
>>>>            * Make a copy of the state structure, inside GuC log buffer
>>>> @@ -1302,7 +1304,7 @@ static void __guc_capture_process_output(struct intel_guc *guc)
>>>>            * from it multiple times.
>>>>            */
>>>>           memcpy(&log_buf_state_local, log_buf_state, sizeof(struct guc_log_buffer_state));
>>>> -       buffer_size = intel_guc_get_log_buffer_size(GUC_CAPTURE_LOG_BUFFER);
>>>> +       buffer_size = intel_guc_get_log_buffer_size(&guc->log, GUC_CAPTURE_LOG_BUFFER);
>>>>           read_offset = log_buf_state_local.read_ptr;
>>>>           write_offset = log_buf_state_local.sampled_write_ptr;
>>>>           full_count = log_buf_state_local.buffer_full_cnt;
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>>> index 4722d4b18ed19..890b6853bd609 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>>> @@ -13,8 +13,158 @@
>>>>    #include "intel_guc_capture.h"
>>>>    #include "intel_guc_log.h"
>>>>    
>>>> +#if defined(CONFIG_DRM_I915_DEBUG_GUC)
>>>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE      SZ_2M
>>>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE      SZ_16M
>>>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE    SZ_4M
>>>> +#elif defined(CONFIG_DRM_I915_DEBUG_GEM)
>>>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE      SZ_1M
>>>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE      SZ_2M
>>>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE    SZ_4M
>>>> +#else
>>>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE      SZ_8K
>>>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE      SZ_64K
>>>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE    SZ_2M
>>>> +#endif
>>>> +
>>>>    static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log);
>>>>    
>>>> +struct guc_log_section {
>>>> +       u32 max;
>>>> +       u32 flag;
>>>> +       u32 default_val;
>>>> +       const char *name;
>>>> +};
>>>> +
>>>> +static s32 scale_log_param(struct intel_guc_log *log, const struct guc_log_section *section,
>>>> +                          s32 param)
>>>> +{
>>>> +       /* -1 means default */
>>>> +       if (param < 0)
>>>> +               return section->default_val;
>>>> +
>>>> +       /* Check for 32-bit overflow */
>>>> +       if (param >= SZ_4K) {
>>>> +               drm_err(&guc_to_gt(log_to_guc(log))->i915->drm, "Size too large for GuC %s log: %dMB!",
>>>> +                       section->name, param);
>>>> +               return section->default_val;
>>>> +       }
>>>> +
>>>> +       /* Param units are 1MB */
>>>> +       return param * SZ_1M;
>>>> +}
>>>> +
>>>> +static void _guc_log_init_sizes(struct intel_guc_log *log)
>>>> +{
>>>> +       struct intel_guc *guc = log_to_guc(log);
>>>> +       struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>>> +       static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
>>>> +               {
>>>> +                       GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
>>>> +                       GUC_LOG_LOG_ALLOC_UNITS,
>>>> +                       GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
>>>> +                       "crash dump"
>>>> +               },
>>>> +               {
>>>> +                       GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
>>>> +                       GUC_LOG_LOG_ALLOC_UNITS,
>>>> +                       GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
>>>> +                       "debug",
>>>> +               },
>>>> +               {
>>>> +                       GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
>>>> +                       GUC_LOG_CAPTURE_ALLOC_UNITS,
>>>> +                       GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
>>>> +                       "capture",
>>>> +               }
>>>> +       };
>>>> +       s32 params[GUC_LOG_SECTIONS_LIMIT] = {
>>>> +               i915->params.guc_log_size_crash,
>>>> +               i915->params.guc_log_size_debug,
>>>> +               i915->params.guc_log_size_capture,
>>>> +       };
>>>> +       int i;
>>>> +
>>>> +       for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
>>>> +               log->sizes[i].bytes = scale_log_param(log, sections + i, params[i]);
>>>> +
>>>> +       /* If debug size > 1MB then bump default crash size to keep the same units */
>>>> +       if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
>>>> +           (i915->params.guc_log_size_crash == -1) &&
>>>> +           GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
>>>> +               log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
>>>> +
>>>> +       /* Prepare the GuC API structure fields: */
>>>> +       for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++) {
>>>> +               /* Convert to correct units */
>>>> +               if ((log->sizes[i].bytes % SZ_1M) == 0) {
>>>> +                       log->sizes[i].units = SZ_1M;
>>>> +                       log->sizes[i].flag = sections[i].flag;
>>>> +               } else {
>>>> +                       log->sizes[i].units = SZ_4K;
>>>> +                       log->sizes[i].flag = 0;
>>>> +               }
>>>> +
>>>> +               if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
>>>> +                       drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
>>>> +                               sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
>>>> +               log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
>>>> +
>>>> +               if (!log->sizes[i].count) {
>>>> +                       drm_err(&i915->drm, "Zero GuC log %s size!", sections[i].name);
>>>> +               } else {
>>>> +                       /* Size is +1 unit */
>>>> +                       log->sizes[i].count--;
>>>> +               }
>>>> +
>>>> +               /* Clip to field size */
>>>> +               if (log->sizes[i].count > sections[i].max) {
>>>> +                       drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
>>>> +                               sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
>>>> +                       log->sizes[i].count = sections[i].max;
>>>> +               }
>>>> +       }
>>>> +
>>>> +       if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
>>>> +               drm_err(&i915->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
>>>> +                       log->sizes[GUC_LOG_SECTIONS_CRASH].units,
>>>> +                       log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
>>>> +               log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
>>>> +               log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
>>>> +       }
>>>> +
>>>> +       log->sizes_initialised = true;
>>>> +}
>>>> +
>>>> +static void guc_log_init_sizes(struct intel_guc_log *log)
>>>> +{
>>>> +       if (log->sizes_initialised)
>>>> +               return;
>>>> +
>>>> +       _guc_log_init_sizes(log);
>>>> +}
>>>> +
>>>> +static u32 intel_guc_log_section_size_crash(struct intel_guc_log *log)
>>>> +{
>>>> +       guc_log_init_sizes(log);
>>>> +
>>>> +       return log->sizes[GUC_LOG_SECTIONS_CRASH].bytes;
>>>> +}
>>>> +
>>>> +static u32 intel_guc_log_section_size_debug(struct intel_guc_log *log)
>>>> +{
>>>> +       guc_log_init_sizes(log);
>>>> +
>>>> +       return log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes;
>>>> +}
>>>> +
>>>> +u32 intel_guc_log_section_size_capture(struct intel_guc_log *log)
>>>> +{
>>>> +       guc_log_init_sizes(log);
>>>> +
>>>> +       return log->sizes[GUC_LOG_SECTIONS_CAPTURE].bytes;
>>>> +}
>>>> +
>>>>    static u32 intel_guc_log_size(struct intel_guc_log *log)
>>>>    {
>>>>           /*
>>>> @@ -38,7 +188,10 @@ static u32 intel_guc_log_size(struct intel_guc_log *log)
>>>>            *  |         Capture logs          |
>>>>            *  +===============================+ + CAPTURE_SIZE
>>>>            */
>>>> -       return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE + CAPTURE_BUFFER_SIZE;
>>>> +       return PAGE_SIZE +
>>>> +               intel_guc_log_section_size_crash(log) +
>>>> +               intel_guc_log_section_size_debug(log) +
>>>> +               intel_guc_log_section_size_capture(log);
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -165,7 +318,8 @@ static void guc_move_to_next_buf(struct intel_guc_log *log)
>>>>           smp_wmb();
>>>>    
>>>>           /* All data has been written, so now move the offset of sub buffer. */
>>>> -       relay_reserve(log->relay.channel, log->vma->obj->base.size - CAPTURE_BUFFER_SIZE);
>>>> +       relay_reserve(log->relay.channel, log->vma->obj->base.size -
>>>> +                                         intel_guc_log_section_size_capture(log));
>>>>    
>>>>           /* Switch to the next sub buffer */
>>>>           relay_flush(log->relay.channel);
>>>> @@ -210,15 +364,16 @@ bool intel_guc_check_log_buf_overflow(struct intel_guc_log *log,
>>>>           return overflow;
>>>>    }
>>>>    
>>>> -unsigned int intel_guc_get_log_buffer_size(enum guc_log_buffer_type type)
>>>> +unsigned int intel_guc_get_log_buffer_size(struct intel_guc_log *log,
>>>> +                                          enum guc_log_buffer_type type)
>>>>    {
>>>>           switch (type) {
>>>>           case GUC_DEBUG_LOG_BUFFER:
>>>> -               return DEBUG_BUFFER_SIZE;
>>>> +               return intel_guc_log_section_size_debug(log);
>>>>           case GUC_CRASH_DUMP_LOG_BUFFER:
>>>> -               return CRASH_BUFFER_SIZE;
>>>> +               return intel_guc_log_section_size_crash(log);
>>>>           case GUC_CAPTURE_LOG_BUFFER:
>>>> -               return CAPTURE_BUFFER_SIZE;
>>>> +               return intel_guc_log_section_size_capture(log);
>>>>           default:
>>>>                   MISSING_CASE(type);
>>>>           }
>>>> @@ -226,7 +381,8 @@ unsigned int intel_guc_get_log_buffer_size(enum guc_log_buffer_type type)
>>>>           return 0;
>>>>    }
>>>>    
>>>> -size_t intel_guc_get_log_buffer_offset(enum guc_log_buffer_type type)
>>>> +size_t intel_guc_get_log_buffer_offset(struct intel_guc_log *log,
>>>> +                                      enum guc_log_buffer_type type)
>>>>    {
>>>>           enum guc_log_buffer_type i;
>>>>           size_t offset = PAGE_SIZE;/* for the log_buffer_states */
>>>> @@ -234,7 +390,7 @@ size_t intel_guc_get_log_buffer_offset(enum guc_log_buffer_type type)
>>>>           for (i = GUC_DEBUG_LOG_BUFFER; i < GUC_MAX_LOG_BUFFER; ++i) {
>>>>                   if (i == type)
>>>>                           break;
>>>> -               offset += intel_guc_get_log_buffer_size(i);
>>>> +               offset += intel_guc_get_log_buffer_size(log, i);
>>>>           }
>>>>    
>>>>           return offset;
>>>> @@ -285,7 +441,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>>>>                    */
>>>>                   memcpy(&log_buf_state_local, log_buf_state,
>>>>                          sizeof(struct guc_log_buffer_state));
>>>> -               buffer_size = intel_guc_get_log_buffer_size(type);
>>>> +               buffer_size = intel_guc_get_log_buffer_size(log, type);
>>>>                   read_offset = log_buf_state_local.read_ptr;
>>>>                   write_offset = log_buf_state_local.sampled_write_ptr;
>>>>                   full_cnt = log_buf_state_local.buffer_full_cnt;
>>>> @@ -400,7 +556,7 @@ static int guc_log_relay_create(struct intel_guc_log *log)
>>>>             * Keep the size of sub buffers same as shared log buffer
>>>>             * but GuC log-events excludes the error-state-capture logs
>>>>             */
>>>> -       subbuf_size = log->vma->size - CAPTURE_BUFFER_SIZE;
>>>> +       subbuf_size = log->vma->size - intel_guc_log_section_size_capture(log);
>>>>    
>>>>           /*
>>>>            * Store up to 8 snapshots, which is large enough to buffer sufficient
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
>>>> index dc9715411d626..02127703be809 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
>>>> @@ -15,20 +15,6 @@
>>>>    
>>>>    struct intel_guc;
>>>>    
>>>> -#if defined(CONFIG_DRM_I915_DEBUG_GUC)
>>>> -#define CRASH_BUFFER_SIZE      SZ_2M
>>>> -#define DEBUG_BUFFER_SIZE      SZ_16M
>>>> -#define CAPTURE_BUFFER_SIZE    SZ_4M
>>>> -#elif defined(CONFIG_DRM_I915_DEBUG_GEM)
>>>> -#define CRASH_BUFFER_SIZE      SZ_1M
>>>> -#define DEBUG_BUFFER_SIZE      SZ_2M
>>>> -#define CAPTURE_BUFFER_SIZE    SZ_4M
>>>> -#else
>>>> -#define CRASH_BUFFER_SIZE      SZ_8K
>>>> -#define DEBUG_BUFFER_SIZE      SZ_64K
>>>> -#define CAPTURE_BUFFER_SIZE    SZ_2M
>>>> -#endif
>>>> -
>>>>    /*
>>>>     * While we're using plain log level in i915, GuC controls are much more...
>>>>     * "elaborate"? We have a couple of bits for verbosity, separate bit for actual
>>>> @@ -46,10 +32,30 @@ struct intel_guc;
>>>>    #define GUC_VERBOSITY_TO_LOG_LEVEL(x)  ((x) + 2)
>>>>    #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
>>>>    
>>>> +enum {
>>>> +       GUC_LOG_SECTIONS_CRASH,
>>>> +       GUC_LOG_SECTIONS_DEBUG,
>>>> +       GUC_LOG_SECTIONS_CAPTURE,
>>>> +       GUC_LOG_SECTIONS_LIMIT
>>>> +};
>>>> +
>>>>    struct intel_guc_log {
>>>>           u32 level;
>>>> +
>>>> +       /* Allocation settings */
>>>> +       struct {
>>>> +               s32 bytes;      /* Size in bytes */
>>>> +               s32 units;      /* GuC API units - 1MB or 4KB */
>>>> +               s32 count;      /* Number of API units */
>>>> +               u32 flag;       /* GuC API units flag */
>>>> +       } sizes[GUC_LOG_SECTIONS_LIMIT];
>>>> +       bool sizes_initialised;
>>>> +
>>>> +       /* Combined buffer allocation */
>>>>           struct i915_vma *vma;
>>>>           void *buf_addr;
>>>> +
>>>> +       /* RelayFS support */
>>>>           struct {
>>>>                   bool buf_in_use;
>>>>                   bool started;
>>>> @@ -58,6 +64,7 @@ struct intel_guc_log {
>>>>                   struct mutex lock;
>>>>                   u32 full_count;
>>>>           } relay;
>>>> +
>>>>           /* logging related stats */
>>>>           struct {
>>>>                   u32 sampled_overflow;
>>>> @@ -69,8 +76,9 @@ struct intel_guc_log {
>>>>    void intel_guc_log_init_early(struct intel_guc_log *log);
>>>>    bool intel_guc_check_log_buf_overflow(struct intel_guc_log *log, enum guc_log_buffer_type type,
>>>>                                         unsigned int full_cnt);
>>>> -unsigned int intel_guc_get_log_buffer_size(enum guc_log_buffer_type type);
>>>> -size_t intel_guc_get_log_buffer_offset(enum guc_log_buffer_type type);
>>>> +unsigned int intel_guc_get_log_buffer_size(struct intel_guc_log *log,
>>>> +                                          enum guc_log_buffer_type type);
>>>> +size_t intel_guc_get_log_buffer_offset(struct intel_guc_log *log, enum guc_log_buffer_type type);
>>>>    int intel_guc_log_create(struct intel_guc_log *log);
>>>>    void intel_guc_log_destroy(struct intel_guc_log *log);
>>>>    
>>>> @@ -92,4 +100,6 @@ void intel_guc_log_info(struct intel_guc_log *log, struct drm_printer *p);
>>>>    int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>>>>                          bool dump_load_err);
>>>>    
>>>> +u32 intel_guc_log_section_size_capture(struct intel_guc_log *log);
>>>> +
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
>>>> index 6fc475a5db615..06ca5b8221118 100644
>>>> --- a/drivers/gpu/drm/i915/i915_params.c
>>>> +++ b/drivers/gpu/drm/i915/i915_params.c
>>>> @@ -171,6 +171,18 @@ i915_param_named(guc_log_level, int, 0400,
>>>>           "GuC firmware logging level. Requires GuC to be loaded. "
>>>>           "(-1=auto [default], 0=disable, 1..4=enable with verbosity min..max)");
>>>>    
>>>> +i915_param_named(guc_log_size_crash, int, 0400,
>>>> +       "GuC firmware logging buffer size for crash dumps (in MB)"
>>>> +       "(-1=auto [default], NB: max = 4, other restrictions apply)");
>>>> +
>>>> +i915_param_named(guc_log_size_debug, int, 0400,
>>>> +       "GuC firmware logging buffer size for debug logs (in MB)"
>>>> +       "(-1=auto [default], NB: max = 16, other restrictions apply)");
>>>> +
>>>> +i915_param_named(guc_log_size_capture, int, 0400,
>>>> +       "GuC error capture register dump buffer size (in MB)"
>>>> +       "(-1=auto [default], NB: max = 4, other restrictions apply)");
>>>> +
>>>>    i915_param_named_unsafe(guc_firmware_path, charp, 0400,
>>>>           "GuC firmware path to use instead of the default one");
>>>>    
>>>> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
>>>> index 2733cb6cfe094..f684d1ab87078 100644
>>>> --- a/drivers/gpu/drm/i915/i915_params.h
>>>> +++ b/drivers/gpu/drm/i915/i915_params.h
>>>> @@ -61,6 +61,9 @@ struct drm_printer;
>>>>           param(int, invert_brightness, 0, 0600) \
>>>>           param(int, enable_guc, -1, 0400) \
>>>>           param(int, guc_log_level, -1, 0400) \
>>>> +       param(int, guc_log_size_crash, -1, 0400) \
>>>> +       param(int, guc_log_size_debug, -1, 0400) \
>>>> +       param(int, guc_log_size_capture, -1, 0400) \
>>>>           param(char *, guc_firmware_path, NULL, 0400) \
>>>>           param(char *, huc_firmware_path, NULL, 0400) \
>>>>           param(char *, dmc_firmware_path, NULL, 0400) \
>>>> -- 
>>>> 2.37.1
>>>>

