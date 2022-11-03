Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C05618865
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 20:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137710E7D3;
	Thu,  3 Nov 2022 19:16:17 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D34810E197;
 Thu,  3 Nov 2022 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667502973; x=1699038973;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ma9CzgJQvW7jNhh7X6LERgnPc6COZdmAcIIqWoGY6+8=;
 b=nMnLLJqb1L1HOw2Na0QgTd1iyybTwMOt3yIn1t1tV1V8UYQYSe1Gb8Bf
 QoNqfQ5VnTwXYBwuO26+R+WT7fysImrfKMbtpjFY/UctC0FoNl2zt8U/N
 CpwwUlGMcsVCliNFU1oEe0P6BJzzTVVogzHAgk/zme1Ofig6282AAGHZM
 mGgErfApJvY2oUAOOAdu8D68+1tfvuj99+yZIf7K2swI6RQ0u7euLa9vr
 8nPPPv7F2McqOD3jYcXyxlE6ZqcFIi4g4d2/T3AsWPV4PoFFcvO2IxVGB
 76/Q+vg6jd/wJSkYm41hlZ+NwNkNt4jyT7oyF5NWx2iZwvTXDIweAY3KP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="308497470"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="308497470"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 12:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="585911881"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="585911881"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 03 Nov 2022 12:16:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 12:16:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 12:16:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 12:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq4qUTpp4S3LnLrJG+Mjg5Qx+jkJ/fP3veBzdFIZaszJCDHXgL9F4fNFuaeOvXfaYrMETZ2s1STX/EPLqSbOkEHXnrz5ANorXNXzRC4p9y3QBYHwcVyzmb5+Y6b9zHF4fodnMcOnEvpqW79gWADzlxSI31ZuxuaVtO+MGQAL4m07IwBgEGyn8+tmkNOhJJw/V45SiX7VdO9JIWYpQAE7A5PrJ/UuFAllNIKE9BIp3Gng/dlBtIN+VG81E7Cv/MT19eqz0k37lQ8/JEreKiFyn43RcW3xoSS80++JGDtGmRgF4zAPM/3bVUmHeSkTbEbEfJqGdHQ/pZ13cUgBLjSoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJXzL2Qa3YPEh+qFBCxsdcq8PwcnO/x/3llBNgAUkgQ=;
 b=ZFQ2xsroIQkCg/ih9Z2qWXL0GIPpY1G9Bf7BawQ2FBrQDgItomvQlVS2m0ENA/QyphV1REYu7ndV/2Zk/L5ItrMSe66YmeryWNZojgSULEx9XDGXhSohBRKBHcJklyVxNFfD1mMypoHPpW8QoLtzkHkfaBvm8s6QKUL6jWgF9Q5pNLC7etquwzRo8bWXPh39LdsLCvtgD5umA0Z+V5jXw7ltHoIy7tdj57grZzJC/zavKXl19T2pMnJK8piVTMaq1Efs+/lotGooJTH6CNAYcTIOuChc7dS+D+BwIBjU0hBr33xK2tn37BAYlG5Zx5sA20j4nOR1AARynWcWXiRs4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB6800.namprd11.prod.outlook.com (2603:10b6:806:260::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 19:16:09 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 19:16:09 +0000
Message-ID: <5fad1ec1-8fea-9685-4cc9-2e3c2edf799f@intel.com>
Date: Thu, 3 Nov 2022 12:16:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
 <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
 <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com>
 <1855f0f2-8a1c-7bf4-76c0-76a4354ea8e8@linux.intel.com>
 <2b2eb780-08f7-c7df-0397-a7f732da272d@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2b2eb780-08f7-c7df-0397-a7f732da272d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0090.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SN7PR11MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: d895e00d-d45f-452e-7dec-08dabdcfdd51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PDXvzSNADL7cpgBSnp8JHJGBddvNuXDP8RqPP0RXoIS8YszaHVUuhX0USyWJA8K4+NXHo+M+MA+hmi211YDGxEnyXz4zV2QD5e2aP+0or5njpRE0Jak/+WJhWQ62UlST7YUJI+Ojs/LK0MP5kcvEGxTH6HHckfdn08QTmlBw4uSTboeuyZbRf+bhjvA43dKJHTCbMjXAR3VFXRzxfP3l3ZD6rF/IGu1UYcvWAcP3pNhYpBbgvMMf53V8ZGlpAxYwe2+QlZSkpWGsj5S9m07pbc0AGAl89ha/UnghlKoxGW3YjN3KP8qP4pCfAXYXc0Btd8v8Yr6xilCGeh1L86F73/sMQF7F+uaoo8BdzOE0+CAiN2qQGar5ORvcV23qqgeQmBrlgjDr4au4Y/fm6avOipsqL9pJj1QIownRnqJ1iMYE3j+5NDTScgCloG1TDa35Z/3I9pYHi0Roi7WuT5cpwNQ2ebPVIYIPnia+L3gZxInzNu8m1qb1NNxtumBG2L89XKSo99i2GbmF5/JKUfv1uWQ5nRJRzfrizENzWrEhdKsjWD8kYu7Qz4w/U5XF5vHTxg9yxG621Xe7ik/Six3YQ0347WiEXfvszXamp67WUTgdaba4kSjFnYRiJTYTIFR9woQCOiqR2SW2S25X3OK1i7TEg1IZF0hhtp/CqlkvYJJRy+efbeT54ZCYyZtdzC9rGJ9bQ+cbBCsR1QS7zssg7+sEWIJli2KUm3IgwSBbgS/f18LxMcMccUyKsBeBj8UvMV0P6ZG+mBG95yEgEvqgeC9RInJF0/SKPzbJLI55rYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199015)(38100700002)(2906002)(30864003)(31686004)(82960400001)(83380400001)(186003)(86362001)(31696002)(26005)(2616005)(53546011)(110136005)(6512007)(6486002)(316002)(8676002)(41300700001)(8936002)(66476007)(4326008)(66556008)(6506007)(66946007)(5660300002)(36756003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxqQURralhoQjA5cG1tZjBTVEJBNGN6ZG5jWmprZzljOEJnZzRRb2VsWUN6?=
 =?utf-8?B?d2E2eGZUUTUzL1FScTBPcXdXMHQzYXYvaUZvWkdiMVc3bmdqQ1orN2tUL1lz?=
 =?utf-8?B?VGM5ejhTVDRSdnpBRHczV2JkaWZWZ1J5MHIrZE53dFZDOHA5ZXBTOHNiZ2t2?=
 =?utf-8?B?dWE4V0xQWHQzUmppQ1BveVN2TE13YTJRNDVGRDlFakJ5NlZROHdTY0h6WlBD?=
 =?utf-8?B?TjllcGxlTFpIK2RvMWpQRFh4UmVndEI3b1FXdmxPMG1yb1VmNHVVTUg4TlZH?=
 =?utf-8?B?eC9iRU04dWtFSnVrb0ZpajJpSzQ5bmg0ZHNlakpkTkkzMnlHclNZSmFWMjdJ?=
 =?utf-8?B?cjRwVGdrWjJtVjlUUjZhcmZWYmhaZzBlM3NtdmhyTDM4WmpDdWM0Z2Z1UGUv?=
 =?utf-8?B?Umh4UGdWVXBmMlhTSWhKQjhyMWlwVGlEazBESUh5Z2kzd0QwelIwcFBJamFh?=
 =?utf-8?B?S1h1ZDNjMVFMSGdrYTJCZ3Qzc1QwZlhyMjdPLzFOVDhwVzFmTEZHbVZ4Sk9v?=
 =?utf-8?B?VXI5NGJmWnlKckQvRDAzOExpMDRVdGhwanB2MVdXL1UvZkUzRS9zNzB3SGVy?=
 =?utf-8?B?cHltL1FoTjRwVjI0WDVmZTl5cmwweEl2QldOTnJIUFZES29KYlRrdFBrUTky?=
 =?utf-8?B?L2lkbnRzelZscGFnNWpiTHkzOUlTczA3YXY5UHRURjV6SEhiSjVmZi9QWEtm?=
 =?utf-8?B?b0lOSmV4dUFvd0lWYzdnR3ZISXlJcjF4ZTFYdlRPUUFVc0pLekI5MXhkN0d0?=
 =?utf-8?B?bGVlNnh5OTd1U2EvU1IrS1R6a0lKa0NhbWRxWk5zdnlZamFaU3liZDVjKzAr?=
 =?utf-8?B?UUZvMUx5NHFySHhkMXc2eWE0a0dpaVZ1cGFFN2RJeFRTOVlHcDFqQnhkN1B1?=
 =?utf-8?B?M25VTUZvK0ltOG9XbFZ4dXlpRzlPREcrKzRrWXF6eS80bmYwRm9ZcG1KMVZw?=
 =?utf-8?B?aE84TGg5KzFFaTJmQzljekdSSS96ZjZScnVkeFNzSlh6ZGQzeTFmdDBheVRS?=
 =?utf-8?B?YkFiNXRIWXFyRTFQRmpLK0xZMktwTDFvWDVUNGdObDN2L1QyRVBMQ0dFcTJO?=
 =?utf-8?B?R3dkRVVmZEREVVhvUlJEWHVuSDdPVEUzbkxwbnhxenFkVWNvLytXeVJ5dnBx?=
 =?utf-8?B?cFFGRWd5Y3N3NmdTRGgrVXVRWVdnT29lQUlGbDR3clhRVlFtd3ArWGt2YkNj?=
 =?utf-8?B?VGoycjJTU0FVMkpEcm96dUkxSDZaQUVpV29wNGdBaHRXbDdBOXFjcWJJNUdB?=
 =?utf-8?B?ckJHTW4xOStWdmxteTVOSWRHOXZMY1YrMzJkY2pCYk1PTXRoQ3VrWTErZ3E4?=
 =?utf-8?B?NkU5clRNUUFkUUt1T2xnSnJkaHB4aTdxNjI3VjhmMEtOY1Fmb0Q2L3dzVU51?=
 =?utf-8?B?alIvM1FCQ2ZpVHpmR1BjTGw2Z0dXbzVVTkQ3bzZSTCtEbWhKejhoUVpIOUZk?=
 =?utf-8?B?RDJZSFkvejg1UElNYnc3T0NWTS9FN1ArakNpdUxtVU51Vmx4cmRVTFZYcllv?=
 =?utf-8?B?V2xFMkpZL3RhZDlTbnlSZ3YwUHdtYmJjWkdkdlRRaWkyZXoxcmE2dXZCS2w0?=
 =?utf-8?B?OHIrK3BUdVBDeG1XSEU2RG1CK2VldWd3VmQrVUM4RExOaE5NOUlTSEJBdk95?=
 =?utf-8?B?T1hxUFUyeFNyMFNRUFRsYTZDb0pHUSs4V0JlUStMR3Fza1A1cVFCcHhCUjRI?=
 =?utf-8?B?MmIxb0xiT2N0VFBLTDNQbVlEK0VGYXUvQjQwVEFJQnRYTldBNXppRjFEdGFl?=
 =?utf-8?B?am42YlFaZEJoc3pXTFh3OS9wd1A1My9MNm5SMXMyRlZjWWNZSnRScXkvRFNR?=
 =?utf-8?B?cjdLeUp5RTBjZUhzQXpPOHVSZWxGRHI3aUoyTEV3SjRIUy9HczA5WS8ranNW?=
 =?utf-8?B?NnpjcVNmT1RPR1diQnFOVzRpU21xUWRSKzAwUkxTVEF5bTBKcjZqU3h5Z29U?=
 =?utf-8?B?MzU5UEFoNmYwZ3gwUm1DbThVTEw5aVRYclh2MW1SSWtKOXF5RGJLbGRHdThV?=
 =?utf-8?B?U2pIUnFlNm0rNlIvd29xOWhYZkFnOXZjRVpTVEVXWTVadTlSakZCK2RhUHB6?=
 =?utf-8?B?cndGcEh6QjUzKzVmdDRBODJpRVI3UE9yWTNCMVJLVnpVYXdHbjV1M1BDTWxO?=
 =?utf-8?B?Nk56VC83cjZSSDhQQVpZM1luUFd2RmVkMEFrYUdma3p1WGhQdDdHRWFkMkFl?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d895e00d-d45f-452e-7dec-08dabdcfdd51
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 19:16:09.6425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKrmzc26q+opLnJzGPWApjou7jZT5fOH3gVMFtwK1RQugNtOSxt6GqHnf6sC3Zd0/9qJ2tBXSbJR8lYPMjc4svVK9qwgGsQWLKldpmBnE7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6800
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

On 11/3/2022 02:38, Tvrtko Ursulin wrote:
> On 03/11/2022 09:18, Tvrtko Ursulin wrote:
>> On 03/11/2022 01:33, John Harrison wrote:
>>> On 11/2/2022 07:20, Tvrtko Ursulin wrote:
>>>> On 02/11/2022 12:12, Jani Nikula wrote:
>>>>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> At the end of each test, IGT does a drop caches call via sysfs with
>>>>>
>>>>> sysfs?
>>> Sorry, that was meant to say debugfs. I've also been working on some 
>>> sysfs IGT issues and evidently got my wires crossed!
>>>
>>>>>
>>>>>> special flags set. One of the possible paths waits for idle with an
>>>>>> infinite timeout. That causes problems for debugging issues when CI
>>>>>> catches a "can't go idle" test failure. Best case, the CI system 
>>>>>> times
>>>>>> out (after 90s), attempts a bunch of state dump actions and then
>>>>>> reboots the system to recover it. Worst case, the CI system can't do
>>>>>> anything at all and then times out (after 1000s) and simply reboots.
>>>>>> Sometimes a serial port log of dmesg might be available, 
>>>>>> sometimes not.
>>>>>>
>>>>>> So rather than making life hard for ourselves, change the timeout to
>>>>>> be 10s rather than infinite. Also, trigger the standard
>>>>>> wedge/reset/recover sequence so that testing can continue with a
>>>>>> working system (if possible).
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>> index ae987e92251dd..9d916fbbfc27c 100644
>>>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>> @@ -641,6 +641,9 @@ 
>>>>>> DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>>>>             DROP_RESET_ACTIVE | \
>>>>>>             DROP_RESET_SEQNO | \
>>>>>>             DROP_RCU)
>>>>>> +
>>>>>> +#define DROP_IDLE_TIMEOUT    (HZ * 10)
>>>>>
>>>>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only 
>>>>> used
>>>>> here.
>>>>
>>>> So move here, dropping i915 prefix, next to the newly proposed one?
>>> Sure, can do that.
>>>
>>>>
>>>>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>>>>> gt/intel_gt.c.
>>>>
>>>> Move there and rename to GT_IDLE_TIMEOUT?
>>>>
>>>>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in 
>>>>> intel_gt_pm.c.
>>>>
>>>> No action needed, maybe drop i915 prefix if wanted.
>>>>
>>> These two are totally unrelated and in code not being touched by 
>>> this change. I would rather not conflate changing random other 
>>> things with fixing this specific issue.
>>>
>>>>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>>>>
>>>> Add _MS suffix if wanted.
>>>>
>>>>> My head spins.
>>>>
>>>> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT 
>>>> applies to DROP_ACTIVE and not only DROP_IDLE.
>>> My original intention for the name was that is the 'drop caches 
>>> timeout for intel_gt_wait_for_idle'. Which is quite the mouthful and 
>>> hence abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised later 
>>> that name can be conflated with the DROP_IDLE flag. Will rename.
>>>
>>>
>>>>
>>>> Things get refactored, code moves around, bits get left behind, who 
>>>> knows. No reason to get too worked up. :) As long as people are 
>>>> taking a wider view when touching the code base, and are not afraid 
>>>> to send cleanups, things should be good.
>>> On the other hand, if every patch gets blocked in code review 
>>> because someone points out some completely unrelated piece of code 
>>> could be a bit better then nothing ever gets fixed. If you spot 
>>> something that you think should be improved, isn't the general idea 
>>> that you should post a patch yourself to improve it?
>>
>> There's two maintainers per branch and an order of magnitude or two 
>> more developers so it'd be nice if cleanups would just be incoming on 
>> self-initiative basis. ;)
>>
>>>> For the actual functional change at hand - it would be nice if code 
>>>> paths in question could handle SIGINT and then we could punt the 
>>>> decision on how long someone wants to wait purely to userspace. But 
>>>> it's probably hard and it's only debugfs so whatever.
>>>>
>>> The code paths in question will already abort on a signal won't 
>>> they? Both intel_gt_wait_for_idle() and 
>>> intel_guc_wait_for_pending_msg(), which is where the 
>>> uc_wait_for_idle eventually ends up, have an 'if(signal_pending) 
>>> return -EINTR;' check. Beyond that, it sounds like what you are 
>>> asking for is a change in the IGT libraries and/or CI framework to 
>>> start sending signals after some specific timeout. That seems like a 
>>> significantly more complex change (in terms of the number of 
>>> entities affected and number of groups involved) and unnecessary.
>>
>> If you say so, I haven't looked at them all. But if the code path in 
>> question already aborts on signals then I am not sure what is the 
>> patch fixing? I assumed you are trying to avoid the write stuck in D 
>> forever, which then prevents driver unload and everything, requiring 
>> the test runner to eventually reboot. If you say SIGINT works then 
>> you can already recover from userspace, no?
>>
>>>> Whether or not 10s is enough CI will hopefully tell us. I'd 
>>>> probably err on the side of safety and make it longer, but at most 
>>>> half from the test runner timeout.
>>> This is supposed to be test clean up. This is not about how long a 
>>> particular test takes to complete but about how long it takes to 
>>> declare the system broken after the test has already finished. I 
>>> would argue that even 10s is massively longer than required.
>>>
>>>>
>>>> I am not convinced that wedging is correct though. Conceptually 
>>>> could be just that the timeout is too short. What does wedging 
>>>> really give us, on top of limiting the wait, when latter AFAIU is 
>>>> the key factor which would prevent the need to reboot the machine?
>>>>
>>> It gives us a system that knows what state it is in. If we can't 
>>> idle the GT then something is very badly wrong. Wedging indicates 
>>> that. It also ensure that a full GT reset will be attempted before 
>>> the next test is run. Helping to prevent a failure on test X from 
>>> propagating into failures of unrelated tests X+1, X+2, ... And if 
>>> the GT reset does not work because the system is really that badly 
>>> broken then future tests will not run rather than report erroneous 
>>> failures.
>>>
>>> This is not about getting a more stable system for end users by 
>>> sweeping issues under the carpet and pretending all is well. End 
>>> users don't run IGTs or explicitly call dodgy debugfs entry points. 
>>> The sole motivation here is to get more accurate results from CI. 
>>> That is, correctly identifying which test has hit a problem, getting 
>>> valid debug analysis for that test (logs and such) and allowing 
>>> further testing to complete correctly in the case where the system 
>>> can be recovered.
>>
>> I don't really oppose shortening of the timeout in principle, just 
>> want a clear statement if this is something IGT / test runner could 
>> already do or not. It can apply a timeout, it can also send SIGINT, 
>> and it could even trigger a reset from outside. Sure it is debugfs 
>> hacks so general "kernel should not implement policy" need not be 
>> strictly followed, but lets have it clear what are the options.
>
> One conceptual problem with applying this policy is that the code is:
>
>     if (val & (DROP_IDLE | DROP_ACTIVE)) {
>         ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>         if (ret)
>             return ret;
>     }
>
>     if (val & DROP_IDLE) {
>         ret = intel_gt_pm_wait_for_idle(gt);
>         if (ret)
>             return ret;
>     }
>
> So if someone passes in DROP_IDLE and then why would only the first 
> branch have a short timeout and wedge. Yeah some bug happens to be 
> there at the moment, but put a bug in a different place and you hang 
> on the second branch and then need another patch. Versus perhaps 
> making it all respect SIGINT and handle from outside.
>
The pm_wait_for_idle is can only called after gt_wait_for_idle has 
completed successfully. There is no route to skip the GT idle or to do 
the PM idle even if the GT idle fails. So the chances of the PM idle 
failing are greatly reduced. There would have to be something outside of 
a GT keeping the GPU awake and there isn't a whole lot of hardware left 
at that point!

Regarding signals, the PM idle code ends up at 
wait_var_event_killable(). I assume that is interruptible via at least a 
KILL signal if not any signal. Although it's not entirely clear trying 
to follow through the implementation of this code. Also, I have no idea 
if there is a safe way to add a timeout to that code (or why it wasn't 
already written with a timeout included). Someone more familiar with the 
wakeref internals would need to comment.

However, I strongly disagree that we should not fix the driver just 
because it is possible to workaround the issue by re-writing the CI 
framework. Feel free to bring a redesign plan to the IGT WG and whatever 
equivalent CI meetings in parallel. But we absolutely should not have 
infinite waits in the kernel if there is a trivial way to not have 
infinite waits.

Also, sending a signal does not result in the wedge happening. I 
specifically did not want to change that code path because I was 
assuming there was a valid reason for it. If you have been interrupted 
then you are in the territory of maybe it would have succeeded if you 
just left it for a moment longer. Whereas, hitting the timeout says that 
someone very deliberately said this is too long to wait and therefore 
the system must be broken.

Plus, infinite wait is not a valid code path in the first place so any 
change in behaviour is not really a change in behaviour. Code can't be 
relying on a kernel call to never return for its correct operation!

And if you don't wedge then you don't recover. Each subsequent test 
would just hit the infinite timeout, get killed by the CI framework's 
shiny new kill signal and be marked as yet another unrelated bug that 
will be logged separately. Whereas, using a sensible timeout and then 
wedging will at least attempt to recover the situation. And if it can be 
recovered, future tests will pass. If it can't then future testing will 
be aborted.

John.


> Regards,
>
> Tvrtko

