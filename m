Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB74C35B2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F72F10E599;
	Thu, 24 Feb 2022 19:19:58 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4754D10E1C7;
 Thu, 24 Feb 2022 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645730396; x=1677266396;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rdG8enYHyVN0PBoz8lhSw8Xj+E7pTMdeEXmF9swGE6s=;
 b=fCnYC7UXT7qW2ghG1eRfz5CGm3Xi8pI339GHIRsvPapdktzVGVUg/y1d
 p73snD2g/1Cpjasu8HAfJTST3HdAAWUEndCAgkLAAgxbKpXNhFfiTwQJz
 VGJoyv3SmwgJZdS5goiK2NoWeQjIYqGMPmnwm/vA3mR8m1SIH2nV/tOOU
 8mLjEQXJRHEcGs8nN8a1zp8knb1G7EVlx/Gx1I1neh/SOVgcb7KBxzX/b
 mrSXWF27nTvVCXDJuPT2hXv/tcxm2Y9TtFN9HBTSq53ge/dd/65bJ1UXL
 7Hjv7uWreX77AToV7qgjWI+VFREZtHYau5tS9Q6cYoaS50FKVlkEMNBAP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252248316"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252248316"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 11:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="506437386"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 24 Feb 2022 11:19:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 11:19:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 24 Feb 2022 11:19:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 11:19:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt8cJl6BpO+3htKj8WsSYZmpFzQA1lMCrBZJLU0H8fWdaAQUfBBI+j6ifcyqHCPkNkcLp4jfEAOLd/JMOIwPgacPuk5fmzNgt1O29r0dTdIcx0paZ7DIoNmms6haVcs2h2Y2aAdGOaQDUPpYU8xbdzRjxJ9W3JWECpndcsIXdVC2Th3nw86MdtR29jdUsvxVnqY8yGh6IfDe6HiSh2yaA6Iaw2BDWhMYhFykuvnVho5xq5Z8lUXAuVdNT2VoWcIT7JaEqweILpden6ozgG+appp+qI6CcMQpFqi6ThKZOC6sc9hWoT8FK2f9rSGyKOgfs/CwXqREKRKIVughV8VExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbacpthzyaXqKErkXL7JCt4giCiBI2v4uIKInAlGEd0=;
 b=Q3NumZ0TmcOKpEbH0BP+ie87K8buAxUus9F/XYVIgA13S3vADedvs97kb64BHrFGwMK6TjqhralyVKRBzTHblmvStSAG1xWTi1UebZVoV/67/VwrwfZQ5TyLfoMgE8b/8k41/hN4urjqn3AhAu7h6NVTvuBrxK4oNP4WhuMb0j9W0aGLH6LL/iXh0DtiD5GKLJ6g7Gci3qk4F0TMLDAtdwoD+T+l+V4uUJ6kQ1NRbfbaTJLNe/PZm5sr9UpMqqjljAc7a73qgjhImPd9VltuMPXfk8UpQhKS1V6IevzeBnYl+kwvx+RbJ3PIiFPaxv1lyrYowLp/690Psnq91FxLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1501.namprd11.prod.outlook.com (2603:10b6:301:d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Thu, 24 Feb
 2022 19:19:52 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 19:19:52 +0000
Message-ID: <c1472196-260a-d2c8-c508-10fe58d4cd47@intel.com>
Date: Thu, 24 Feb 2022 11:19:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
 <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
 <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
 <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
 <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR14CA0041.namprd14.prod.outlook.com
 (2603:10b6:300:12b::27) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d06e8a7-d9a4-4380-a92c-08d9f7caa220
X-MS-TrafficTypeDiagnostic: MWHPR11MB1501:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB15018F2C628B5405894070CCBD3D9@MWHPR11MB1501.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3u485BaIUa385m8/M8wAb3IV8x9Gzu/vbmM1Tl2OOgsmKb/Dna5sCjJ+pxoKiwqrxN5orqU5gpTD8Gbbc53nAb2KMkvPjVCcaW0ghDTPducn5ACoVOEtayq70FT6n05PgVVwi4J0SzdUuFGwLRN1timqEvdeZWxSa/TXK1GXOKKtYmFGCt5oKR9PMXN7w5Nm9w1ziM8ecu5E310ITltdEwEIGJFxO1/HaaQrL/2kfmAednuGSQLzVxxwhUVGxgXF7dWJN//iCWHeleGGu/ty1gDtWUj7qg1NAZ9nQ7Q4zOa85LRuA89ISAphfzSukcYMJp3bAMARRVmimyPnOL4uH/jSFWZJJtlq2jcJZ3AX2LzaamFMzWgRbxEMuFDzTbAuCSohbA+jC602dxHDMi3vFRXSq+ChudjwR9RWBA57eTuhTIRD3QP2ju0gDy1hxbUyPvtwy2L7tO3AGh9hjHJZxiSUC9kMgreptobmslWXLFcOfkOwpxLEJOwsuAAm/rQo+VsNZp5Skrt13R+L+NgnhzUMnabbIcA0dmrYRr2nO8gvxvnPtS3YS5A6MgghR8TRBU97YYHCaFiJnYDV+boGibDXZsSFPXoMQZuc7ttAcajf8lbJO33NceGBMzt0z6HKfpt3icXilVFKgx/3Yfr1ptfFKMvD3uRBII4ISVEU+tAhrYKI3N2Gu6xSAIC9MzejDbC7+9x0EmXF6x/WVmDSheotrNYxK+T5iDHb1k64UXT4z1uJrsocuyi8bWh5A0f2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(53546011)(66946007)(6506007)(2906002)(38100700002)(26005)(186003)(82960400001)(31696002)(86362001)(83380400001)(6512007)(4326008)(30864003)(5660300002)(8936002)(36756003)(6666004)(2616005)(31686004)(6486002)(66556008)(66476007)(8676002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3ZkUzdFbndiWXJ2NGtuc2Q3czMzYUpBR3pFa3RNMHNUSUdaNDZCUE1pdGl4?=
 =?utf-8?B?b2dMeDlPWnNucDYzYTdSOGhsd2xmYjhiQjdJbCtKWmNqTis0bCtzT3hTc3hV?=
 =?utf-8?B?aHdJUkJwcTdkSmVMYy8yMEsrRVlUVGpFQ1VKL2tuallXOU5yZ2xqQVBwMUNl?=
 =?utf-8?B?ZUNmZml6MG9vbmRzOUpKc0VkRE9KU3cyL2hSbFZlam1NbEJYMmlBVTltN2Y2?=
 =?utf-8?B?TU5XSGVXUWdDbFo2ODB2cEpNQ21sNDFrdlNoaXIwQUhOT0hxZUYrVkRMS3Bm?=
 =?utf-8?B?bEc1cnM5cjRpclpZYTc5RnZQYTVPYjgwQzNLSHlieVBnOG5DT3NIOEtzMm5U?=
 =?utf-8?B?TmkxQkRMRlh1TDBBRFAyTGRYcnpsdFhIbXVEOUl3Nzl1dnpaL3FTS3Z1c2RB?=
 =?utf-8?B?NUJOVEVVMHpvQmZQVTh1eFZGMUdTenFMbnl4N0VIaW96M25EN3Z1QThOSCtO?=
 =?utf-8?B?OG1wQ1BTSVBVRFpGOU03TmRtc3Y4bUxBd3BzdkF0dE5jakdCd09MZUNuaUI3?=
 =?utf-8?B?WWJKQ0k1ZlVuYnBrcnpqMTlRTzgybFo5VFI3RzB1bFhYWjF3VEU1ZjVzSmxT?=
 =?utf-8?B?YkE4ZFZCcnNLSnBGSnpuN1Q3RUlxN1RTMG5od1ZrdHdaOVFQOTRoSkw0MGVu?=
 =?utf-8?B?Q3M5emZYZS9GMmZ0Y25sRnpYTGphZzgzd2xqcm4rcGUxZmozVUNQQ0lXZWhu?=
 =?utf-8?B?TzIwZnE5VmdoZnFaT2phTlQ5ZlREL0tOTUJ4SDhFSC9iMnE4SkYwMURDcHYr?=
 =?utf-8?B?bDFNVHpkSXZLWnF2Ukp1V1h1L01pUEFCUm5GaU01aHRGTnBJVkpVMllTRE43?=
 =?utf-8?B?a3dZQkxpS04wc2JKTkdyemx3cmhTSHgyeFM3VzY5ajdJTVVSUCtZTU1jMC9o?=
 =?utf-8?B?YUtkWDkzdUlBYzdRUE8wSFpYNSs5VFJ1SnRRVVFXQmFrRHRIQkJQTmZMSkVS?=
 =?utf-8?B?eE9ZSm93aEUzbXRXcm9EUE5aMHkyWitFSDMyVjZwUXNVYW52aUZhK2lPQjI3?=
 =?utf-8?B?Z3J5ZHFwWTRIN2x2QVhXYm5ocXdDaWFGdURKZjNaWWVDN2tVUGJ5dkJkTUlT?=
 =?utf-8?B?bmk3NDZpaHBKQlZ1bzZ6cnhwc3J5WC92ZENEc0xsTytUdFhqa1Ava0NkYVdG?=
 =?utf-8?B?d1MwSHo1Z2FZM2Y4anVJLzQwYmtsV0RTbXpzYytvT0xYRUVGd1gxYTlrUEVk?=
 =?utf-8?B?UVpFT2wxY0hRaTlvc1dzU1dRTnVJdHprUEh1VGpCcHdrY0czT0hoZERiQ0Mx?=
 =?utf-8?B?S1lLTlhvSHc3RHZBeFIrWkM3c2wyckpXZUVFb3QrRVpqRGpFMFNTVk5vY1JC?=
 =?utf-8?B?L2lIZkZabkErclVabjJtQUdGaGU4NG5pUUw2dHF2TzZ0OGFHZzFEcnFONWly?=
 =?utf-8?B?OCtCVFZ1Ymd6UlJtRVFYN1MwbFk4SHI3ZUgzOTh2NWhGbU8zZ2dDdFBQNGhX?=
 =?utf-8?B?V0VEZVFxUGRNUWtXTkQ0SUg3YjVtVVFMTldlbmNIUHlXR0tWYmxWYlRvbFdD?=
 =?utf-8?B?cXpLNUluZ0x1ZGdhY0FyMCtTWXBIclR1TUR6VTFJSmxKbUhTUnM5T015SHdY?=
 =?utf-8?B?ditIZHROekNGS1BFNExOMmh0bjRkQnZjUTVjbVpHemttQ0FVWDR4TXZSc0o4?=
 =?utf-8?B?MDUycUdUZ2l4SmVPczNkRUZLNXpNdlYydVlMNE1HQlBNREhVM0hEWm1vbzRv?=
 =?utf-8?B?QnVkSko0WUtXenZZVmVuczE4anhLUlhKTUEwYXRoTWYyRHlEYXNWR3JvalNU?=
 =?utf-8?B?dDFtV3U0UktPOVZFdmN3bTNzK0xwUDVSaFRMRjVZMkp4ZUNxbVZnNkJGc2N4?=
 =?utf-8?B?blJvWmF3OHFzVGZXeVdGSjlrTGkwdU1RcEtoVGdPRGZNcHFPeFpJWDNPcEVM?=
 =?utf-8?B?c2ZPNFBWRHNMbGFaR2t4V3llT2UrZHlKVnM3cENqQXkzekVIbXJnTURHTlFa?=
 =?utf-8?B?cWdobUFPSHRHUC9nTUhleVZxTThYWmVoOFpzTzBoakNGZnJyUlUwbFp0dW1j?=
 =?utf-8?B?T0ZaWHgzQk9CU1hDaWZpbXlSV3MwSXdWWldlRzEvVnZOeGVkdUplTkpsTmsy?=
 =?utf-8?B?bFBkcnNtUm9lOE1sb1JyL0QvY3EzSjMrNW5ZTExiNDhUYVl4NHBBWmU5R285?=
 =?utf-8?B?OEtPYUI5L1NiejhodWVIZm1qL0IxRUl4cDg2amF6QlNRVjlLblZWRWpFNE5L?=
 =?utf-8?B?YzBNVHBONkVOVHhzTWtJOTNHYnVUd29YbHMxZ3A1UUZibkZ3M1N1SkdHSmJU?=
 =?utf-8?Q?yD8CQh9GEZeixfIZCtptsTl1crJ/4wM/6BKiE3M6cA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d06e8a7-d9a4-4380-a92c-08d9f7caa220
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 19:19:52.7639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruXbhd83yv+qnxTE5F5XFDB5jafioUoKEZ910AAceezqj0G0LY/axWzVRZwiVXtfEbxYtcmcJYXshP8LUOGwYMZC+Hga9t6sAnDo/sTZMa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1501
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

On 2/24/2022 01:59, Tvrtko Ursulin wrote:
> On 23/02/2022 19:03, John Harrison wrote:
>> On 2/23/2022 04:13, Tvrtko Ursulin wrote:
>>> On 23/02/2022 02:11, John Harrison wrote:
>>>> On 2/22/2022 01:52, Tvrtko Ursulin wrote:
>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> GuC converts the pre-emption timeout and timeslice quantum values 
>>>>>> into
>>>>>> clock ticks internally. That significantly reduces the point of 
>>>>>> 32bit
>>>>>> overflow. On current platforms, worst case scenario is approximately
>>>>>
>>>>> Where does 32-bit come from, the GuC side? We already use 64-bits 
>>>>> so that something to fix to start with. Yep...
>>>> Yes, the GuC API is defined as 32bits only and then does a straight 
>>>> multiply by the clock speed with no range checking. We have 
>>>> requested 64bit support but there was push back on the grounds that 
>>>> it is not something the GuC timer hardware supports and such long 
>>>> timeouts are not real world usable anyway.
>>>
>>> As long as compute are happy with 100 seconds, then it "should be 
>>> enough for everbody". :D
>> Compute disable all forms of reset and rely on manual kill. So yes.
>>
>> But even if they aren't. That's all we can do at the moment. If there 
>> is a genuine customer requirement for more then we can push for full 
>> 64bit software implemented timers in the GuC but until that happens, 
>> we don't have much choice.
>
> Yeah.
>
>>
>>>
>>>>>
>>>>> ./gt/uc/intel_guc_fwif.h:       u32 execution_quantum;
>>>>>
>>>>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>>>>> engine->props.timeslice_duration_ms * 1000;
>>>>>
>>>>> ./gt/intel_engine_types.h:              unsigned long 
>>>>> timeslice_duration_ms;
>>>>>
>>>>> timeslice_store/preempt_timeout_store:
>>>>> err = kstrtoull(buf, 0, &duration);
>>>>>
>>>>> So both kconfig and sysfs can already overflow GuC, not only 
>>>>> because of tick conversion internally but because at backend level 
>>>>> nothing was done for assigning 64-bit into 32-bit. Or I failed to 
>>>>> find where it is handled.
>>>> That's why I'm adding this range check to make sure we don't allow 
>>>> overflows.
>>>
>>> Yes and no, this fixes it, but the first bug was not only due GuC 
>>> internal tick conversion. It was present ever since the u64 from 
>>> i915 was shoved into u32 sent to GuC. So even if GuC used the value 
>>> without additional multiplication, bug was be there. My point being 
>>> when GuC backend was added timeout_ms values should have been 
>>> limited/clamped to U32_MAX. The tick discovery is additional limit 
>>> on top.
>> I'm not disagreeing. I'm just saying that the truncation wasn't 
>> noticed until I actually tried using very long timeouts to debug a 
>> particular problem. Now that it is noticed, we need some method of 
>> range checking and this simple clamp solves all the truncation problems.
>
> Agreed in principle, just please mention in the commit message all 
> aspects of the problem.
>
> I think we can get away without a Fixes: tag since it requires user 
> fiddling to break things in unexpected ways.
>
> I would though put in a code a clamping which expresses both, 
> something like min(u32, ..GUC LIMIT..). So the full story is 
> documented forever. Or "if > u32 || > ..GUC LIMIT..) return -EINVAL". 
> Just in case GuC limit one day changes but u32 stays. Perhaps internal 
> ticks go away or anything and we are left with plain 1:1 millisecond 
> relationship.
Can certainly add a comment along the lines of "GuC API only takes a 
32bit field but that is further reduced to GUC_LIMIT due to internal 
calculations which would otherwise overflow".

But if the GuC limit is > u32 then, by definition, that means the GuC 
API has changed to take a u64 instead of a u32. So there will no u32 
truncation any more. So I'm not seeing a need to explicitly test the 
integer size when the value check covers that.

>
>>>>>> 110 seconds. Rather than allowing the user to set higher values and
>>>>>> then get confused by early timeouts, add limits when setting these
>>>>>> values.
>>>>>
>>>>> Btw who is reviewing GuC patches these days - things have somehow 
>>>>> gotten pretty quiet in activity and I don't think that's due 
>>>>> absence of stuff to improve or fix? Asking since I think I noticed 
>>>>> a few already which you posted and then crickets on the mailing list.
>>>> Too much work to do and not enough engineers to do it all :(.
>>>>
>>>>
>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>>>>>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>>>>>>   3 files changed, 38 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>> index e53008b4dd05..2a1e9f36e6f5 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct 
>>>>>> intel_gt *gt, enum intel_engine_id id,
>>>>>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>>>>>           engine->props.preempt_timeout_ms = 0;
>>>>>>   +    /* Cap timeouts to prevent overflow inside GuC */
>>>>>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>>>>>> +        if (engine->props.timeslice_duration_ms > 
>>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>>>
>>>>> Hm "wanted".. There's been too much back and forth on the GuC load 
>>>>> options over the years to keep track.. intel_engine_uses_guc work 
>>>>> sounds like would work and read nicer.
>>>> I'm not adding a new feature check here. I'm just using the 
>>>> existing one. If we want to rename it yet again then that would be 
>>>> a different patch set.
>>>
>>> $ grep intel_engine_uses_guc . -rl
>>> ./i915_perf.c
>>> ./i915_request.c
>>> ./selftests/intel_scheduler_helpers.c
>>> ./gem/i915_gem_context.c
>>> ./gt/intel_context.c
>>> ./gt/intel_engine.h
>>> ./gt/intel_engine_cs.c
>>> ./gt/intel_engine_heartbeat.c
>>> ./gt/intel_engine_pm.c
>>> ./gt/intel_reset.c
>>> ./gt/intel_lrc.c
>>> ./gt/selftest_context.c
>>> ./gt/selftest_engine_pm.c
>>> ./gt/selftest_hangcheck.c
>>> ./gt/selftest_mocs.c
>>> ./gt/selftest_workarounds.c
>>>
>>> Sounds better to me than intel_guc_submission_is_wanted. What does 
>>> the reader know whether "is wanted" translates to "is actually 
>>> used". Shrug on "is wanted".
>> Yes, but isn't '_uses' the one that hits a BUG_ON if you call it too 
>> early in the boot up sequence? I never understood why that was 
>> necessary or why we need so many different ways to ask the same 
>> question. But this version already exists and definitely works 
>> without hitting any explosions.
>
> No idea if it causes a bug on, doesn't in the helper itself so maybe 
> you are saying it is called too early? Might be.. I think over time 
> the nice idea we had that "setup" and "init" phases of engine setup 
> clearly separated got destroyed a bit. There would always be an option 
> to move this clamping in a later phase, once the submission method is 
> known. One could argue that if the submission method is not yet known 
> at this point, it is even wrong to clamp based on something which will 
> only be decided later. Because:
>
> int intel_engines_init(struct intel_gt *gt)
> {
>     int (*setup)(struct intel_engine_cs *engine);
>     struct intel_engine_cs *engine;
>     enum intel_engine_id id;
>     int err;
>
>     if (intel_uc_uses_guc_submission(&gt->uc)) {
>         gt->submission_method = INTEL_SUBMISSION_GUC;
>
> So this uses "uses", not "wanted". Presumably the point for having 
> "wanted" and "uses" is that they can disagree, in which case if you 
> clamp early based on "wanted" that suggests it could be wrong.

Okay, looks like I was getting confused with intel_guc_is_used(). That 
one blows up if called too early.

I'll change it to _uses_ and repost, then.

>
>>>>> And limit to class instead of applying to all engines looks like a 
>>>>> miss.
>>>> As per follow up email, the class limit is not applied here.
>>>>
>>>>>
>>>>>> + drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>>>>> duration to %d to prevent possibly overflow\n",
>>>>>> +                 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>>>>>> +            engine->props.timeslice_duration_ms = 
>>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>>>
>>>>> I am not sure logging such message during driver load is useful. 
>>>>> Sounds more like a confused driver which starts with one value and 
>>>>> then overrides itself. I'd just silently set the value appropriate 
>>>>> for the active backend. Preemption timeout kconfig text already 
>>>>> documents the fact timeouts can get overriden at runtime depending 
>>>>> on platform+engine. So maybe just add same text to timeslice kconfig.
>>>> The point is to make people aware if they compile with unsupported 
>>>> config options. As far as I know, there is no way to apply range 
>>>> checking or other limits to config defines. Which means that a user 
>>>> would silently get unwanted behaviour. That seems like a bad thing 
>>>> to me. If the driver is confused because the user built it in a 
>>>> confused manner then we should let them know.
>>>
>>> Okay, but I think make it notice low level.
>>>
>>> Also consider in patch 3/3 when you triple it, and then clamp back 
>>> down here. That's even more confused state since tripling gets 
>>> nerfed. I think that's also an argument to always account preempt 
>>> timeout in heartbeat interval calculation. Haven't got to your reply 
>>> on 2/3 yet though..
>> That sounds like even more reason to make sure the warning gets seen. 
>> The more complex the system and the more chances there are to get it 
>> wrong, the more important it is to have a nice easy to see and 
>> understand notification that it did go wrong.
>
> I did not disagree, just said make it notice, one level higher than 
> info! :)
But then it won't appear unless you have explicitly said an elevated 
debug level. Whereas info appears in dmesg by default (but is still not 
classed as an error by CI and such).

>
> But also think how, if we agree to go with tripling, that you'd have 
> to consider that in the sysfs store when hearbeat timeout is written, 
> to consider whether or not to triple and error out if preemption 
> timeout is over limit.
I see this as just setting the default values. If an end user is 
explicitly overriding the defaults then we should obey what they have 
requested. If they are changing the heartbeat interval then they can 
also change the pre-emption timeout appropriately.

John.


>
>>>>>> +        }
>>>>>> +
>>>>>> +        if (engine->props.preempt_timeout_ms > 
>>>>>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>>>>>> +            drm_info(&engine->i915->drm, "Warning, clamping 
>>>>>> pre-emption timeout to %d to prevent possibly overflow\n",
>>>>>> +                 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>>>>>> +            engine->props.preempt_timeout_ms = 
>>>>>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>>       engine->defaults = engine->props; /* never to change again */
>>>>>>         engine->context_size = intel_engine_context_size(gt, 
>>>>>> engine->class);
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>>>>>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>>>> index 967031056202..f57efe026474 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>>>> @@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct 
>>>>>> kobj_attribute *attr,
>>>>>>       if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>>>>           return -EINVAL;
>>>>>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>>>>>> +        duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>>>> +        duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>>>> +        drm_info(&engine->i915->drm, "Warning, clamping 
>>>>>> timeslice duration to %lld to prevent possibly overflow\n",
>>>>>> +             duration);
>>>>>> +    }
>>>>>
>>>>> I would suggest to avoid duplicated clamping logic. Maybe hide the 
>>>>> all backend logic into the helpers then, like maybe:
>>>>>
>>>>>   d = intel_engine_validate_timeslice/preempt_timeout(engine, 
>>>>> duration);
>>>>>   if (d != duration)
>>>>>     return -EINVAL:
>>>>>
>>>>> Returning -EINVAL would be equivalent to existing behaviour:
>>>>>
>>>>>     if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>>>         return -EINVAL;
>>>>>
>>>>> That way userspace has explicit notification and read-back is 
>>>>> identical to written in value. From engine setup you can just call 
>>>>> the helper silently.
>>>> Sure, EINVAL rather than clamping works as well. And can certainly 
>>>> add helper wrappers. But as above, I don't like the idea of 
>>>> silently disregarding a user specified config option.
>>>
>>> Deal - with the open of heartbeat interval TBD.
>>>
>>>>
>>>>>
>>>>>> +
>>>>>>       WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>>>>>>         if (execlists_active(&engine->execlists))
>>>>>> @@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, 
>>>>>> struct kobj_attribute *attr,
>>>>>>       if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>>>>           return -EINVAL;
>>>>>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>>>>>> +        timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>>>>>> +        timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>>>>>> +        drm_info(&engine->i915->drm, "Warning, clamping 
>>>>>> pre-emption timeout to %lld to prevent possibly overflow\n",
>>>>>> +             timeout);
>>>>>> +    }
>>>>>> +
>>>>>>       WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>>>>>>         if (READ_ONCE(engine->execlists.pending[0]))
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>>>> index 6a4612a852e2..ad131092f8df 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>>>> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>>>>>>     #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>>>>>>   +/*
>>>>>> + * GuC converts the timeout to clock ticks internally. Different 
>>>>>> platforms have
>>>>>> + * different GuC clocks. Thus, the maximum value before overflow 
>>>>>> is platform
>>>>>> + * dependent. Current worst case scenario is about 110s. So, 
>>>>>> limit to 100s to be
>>>>>> + * safe.
>>>>>> + */
>>>>>> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS        (100 * 1000)
>>>>>> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS    (100 * 1000)
>>>>>
>>>>> Most important question -
>>>>> how will we know/notice if/when new GuC arrives where these 
>>>>> timeouts would still overflow? Can this be queried somehow at 
>>>>> runtime or where does the limit comes from? How is GuC told about 
>>>>> it? Set in some field and it just allows too large values silently 
>>>>> break things?
>>>> Currently, we don't notice except by debugging peculiar test 
>>>> failures :(.
>>>>
>>>> These limits are not in any GuC spec. Indeed, it took a while to 
>>>> actually work out why increasing the value actually caused shorter 
>>>> timeouts to occur! As above, there is no range checking inside GuC 
>>>> itself. It does a truncated multiply which results in an 
>>>> effectively random number and just happily uses it.
>>>
>>> I will agree with what Daniele said - push on GuC fw folks to 
>>> document the max values they guarantee to support in the interface 
>>> spec. Otherwise it is too fragile.
>> I do agree. But that is going to take time. I would like to get 
>> something merged now while we fight over spec updates.
>
> Yeah that's okay, did not mean to imply I am against a quick fix. 
> "Otherwise it is too fragile, *in the long run*" should have written 
> or something like that.
>
> Regards,
>
> Tvrtko

