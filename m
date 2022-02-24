Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A04C377C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B506710E6F1;
	Thu, 24 Feb 2022 21:13:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39FC10E6ED;
 Thu, 24 Feb 2022 21:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645737213; x=1677273213;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nrnfjcun4iG8YIdFMLUV3App4EQPqfjXyd0Zh7pRsnI=;
 b=GjzBKo0i+NHNiOSsVuRH4ezfwjwnjKQkkYpGU+rEM24JyebO6mL4Je6T
 lhwK524Yq4nN+qXxkRdIUL8bN0VNXp+Dfptmep0q+O0Y3UK9FfZwd0Yv8
 wDyDZTlbdIXOcqnZ0mfdmjSH6uSXeQvkBCnkDIP/GwM2U6njp+wZPBMMw
 yvOagYIrps/3cKy6Ud2+d3VcbusvCltBqSwVXe21JVYy2ry5/hetKCiGc
 ZqmzdEic17Za2SVN6XFusqdk3Fgctz47EJ+ZzHtJpX8EqvvzZUrd56PBX
 TZ0FHF2sOu8Vej0p9gtydFw/xhOCgJV8WVhYmLHRQRWkvJgWjcPXQB5a2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252274597"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252274597"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 13:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="506473269"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 24 Feb 2022 13:13:33 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 13:13:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 24 Feb 2022 13:13:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 13:13:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRFeph2njzUNY63ann73KSNTkDxTZG3E1XMwz1afJKVGVi59xbkFfrSYmYBmDkGpuT55hsRvKjvs/EbZfk9ftJDhSfO01abr9+zKhYt4mwBBAYj+BKEWOVHtOfEPW0Stj7dhFNFE1VpJVs9u8nUY6YyhkZTce8N0ZNV127O1ORHt+wQ36HzfNuyXCV43OQhLDCVDCG1hSLEQ+Vyo2+kgZEozkr27u9eqM70lxLQ1zKiaVNRl4mssAIsFMI+EuEmbIHgMcSqyzYLzZph/CR7yg+tohMptYEXa0YUzxOCl3Lf1JzvmtigTwOy0P9dnvUYsjzr1pEt4LbzOt175DeN7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRUcthzNpM6Tlgw4ccyorOArP3zj79/fQCd+4cEwkXo=;
 b=nFoMVfgi/rzHjPJZk+lnAjH3SfJVrl/LfKminh3tX/dkgAk1lYsM778zDusqPwx6fijglApuA2EW4RgSlECDe0Rf4bm59Ps5/vVx4jB7nDNy/ljbTSUUYhuB+dmDZx/enbW6etOtcAQs3qoCek4u6hQLe1SFixYgZqA2+pS9a2SICXEEZmdeqF60uoWYhUd0H9LJwwAH0kdzfblRU1vu3KSdwyFSkEnaAVDYHPNCcMmIIDttCo7btKgbbV743t9CCYt34yR9GY34Q6g8WZRAlNAoCswxT0s9ILEHP/UGdQjX8zpRCIA0As6WMDlvSm9iH7OJrvYO8xDUxnFAuJAjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN6PR11MB3069.namprd11.prod.outlook.com (2603:10b6:805:d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 21:13:30 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 21:13:29 +0000
Message-ID: <7644920a-c4f9-624f-6421-be3cb3e5e91b@intel.com>
Date: Thu, 24 Feb 2022 13:13:26 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/guc: Move lrc desc setup to
 where it is needed
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-6-John.C.Harrison@Intel.com>
 <cc5b20ac-86b4-2d8a-8d53-c4b870213b10@intel.com>
 <0b971744-b456-9a92-818f-1f038669da7f@intel.com>
 <0cd43952-3a0d-60ec-5702-fb0e395025fa@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <0cd43952-3a0d-60ec-5702-fb0e395025fa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:300:116::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10afd3cc-7f3a-462c-7050-08d9f7da816c
X-MS-TrafficTypeDiagnostic: SN6PR11MB3069:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB3069CC1BA1137F94BF7CB6BFBD3D9@SN6PR11MB3069.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FO60HZAEi9yjjxDnI3OT/A+u5+VFMU59wNK4St236ShLalhTShs+YsyFhnUK4YIWj/1xe3icB3RnugUex34Uu/VAedtabPHE9YXRCabrgU/6JqNiPvxcNH/6AgqilsyBHNOpb7MNfNjjzVNCERU8lgQaD9Q8MZvEutx+iBBZ+HqMOp+//9aKs8FsQI77o+jfaGohtIL4I+bBwXzG+gWOlXNnuegqGBQSaQzKyBvPQgZ/nFNUNBClOyXR6r/CVA5cXI4bq+BfpvKgs3enWSJenzl8lCWCaaFq2bB8Qjc6Y7daV+lFed5ahbr3x18PRrLF0P899CIHUjJGZ4R+BCuf3jkGSysWePnFXLl0/S4t+EABe0NJRABOyUGLp2vbI5ZSQ5PsveXzAzDhwyyn5e0Tcor5HfecL/bsQFSy46C+//6cfB9CzISvbKevOuu/KdRPNwaPtFNSZh/N2Aj/an3e/e4RRieL8D0lzIFxuM2cqeFL/pbSa9yscRdNCZYro+9VquSMGNEZu1wdeO0gn/ZzF2zZP4/vFx0RNdQD8O5tflWspUOmFOBdfI9wSzKtH9/ZnO8RxEMVmt4Jio3jtWbmHoHSGI+doWdAEIHQUHJKIROcF4nECxq3o1dnjVyGJAzg/RjA0cGZFtS1szbBjiglJ3IlRCGR5Fj3Jjds2Rkf3e0L8CT0V5oEXxYc8tl/oKcXL40Yya2HwJ8RzpflOdqf2nP9cywNuQN/0tjTwDECJ85cxa2MjiKA6MvFXhVZxKa2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(2616005)(26005)(186003)(8936002)(53546011)(83380400001)(6666004)(5660300002)(2906002)(316002)(4326008)(6486002)(508600001)(66476007)(8676002)(31696002)(450100002)(66556008)(38100700002)(36756003)(86362001)(31686004)(66946007)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWtFeEQyamVha2RVTG11MW16SEZuZFR4bVRPRXd6NjVGYTFENXpYUklPdjcy?=
 =?utf-8?B?SXoxeUhnM2s5bG1NaXl3ZlhYU2ppZm12NTZITXVsTUMwaWlwR3RWeC9CWkgw?=
 =?utf-8?B?d1I5dng3djlrcHozbjd5YWR1RmxyMWVZTDZldGMzRlpLREU4STRpSVZPRS84?=
 =?utf-8?B?azMzZmNKY0R1VjRGekFLWE93alNNSFNPaXNEcmVWR3R5VkJ3ZndJOFBVRG0w?=
 =?utf-8?B?QTloSk5MRmVSdXR3aG93Q1NDOGFYREpWNUJVM0Vmc3hIdXozSVIvdkVZMWcx?=
 =?utf-8?B?VnNxUGNkeVRrTzVRUVZSYmRuTTlWbzF0MUpGVmpiL0Rqd01nK1U3V2EzWHQ5?=
 =?utf-8?B?bXJyNHhocnVCeityNThwdXd2UE95RnJ5K1FzUVdSK2N4aExaVzVPeWZTZ2Qv?=
 =?utf-8?B?STBzVFFuUFVmRU8yR0hhRS8wSzJwNFNZNElpZmwzQ1lWOGt1T05ybkt4bEto?=
 =?utf-8?B?MTh1TlFybjhhditybkNVQ1lsYmUrSitXUUV2WCsvSkErNVNQOVJFK0c0aEZy?=
 =?utf-8?B?ZXUwYTVJQlB0ZDA2NkNYOHdVY2ZnSkFMZGZ6bWtXRGR0ZWhIWDczNHdDT2NF?=
 =?utf-8?B?SXVLaHRSdU4xS3kxZEFPZlhuQUg1c1UwS3N4NytzT21GZHZDbzBEZ1ZBTVBa?=
 =?utf-8?B?VmZKOFI2Z2txRklpR2E1emkyYXUvNzVvR2xCK3hkbmRTWFloWnhJSFJ3c3gy?=
 =?utf-8?B?ME1kZnRTaVovRkVyZWgyc0dSQUNxSEU1UXlDTVJlYjJGaTdudDRNa2V4L0NH?=
 =?utf-8?B?SUVvWmpoTlNqRFBta2l2dHlGa0kzVm8zV0dzY2Faa3ZaNWhzWDFQSk1hUHN4?=
 =?utf-8?B?TUNNOTRiNjJRbndKdDRNRXJEVWFJY3RzbGJadEtydDVXQnlqTERXQXZ4dS8r?=
 =?utf-8?B?WisvYU4wNnNHWEZkWU9GRHRyQllXMC9GR1NUU3M0eVJyVFRLNlNvWXFER1o5?=
 =?utf-8?B?Wko3cmFFL1cxR2wrbnFYT2RtR3FGZzc4aURYYVBvSEhjWUtabVIrcitRRVJ1?=
 =?utf-8?B?eEVlYnVsTlJuVWdDV2pMZllCeEQrbWN4N1VQK3JicndvTE4vcjc2Szg2L0k0?=
 =?utf-8?B?MVA1T3ZPemlyT1QyVzJveEhHTTBlSDVOdE1adExzNk92U3IyMUw0WHV4U1ll?=
 =?utf-8?B?V0tUSUxRYTFScEFuZjV2djVhd0ZLa3dYaVlvMmdnVmFEeU1wc0VGNHlIQVl1?=
 =?utf-8?B?MzVTU250Y3lzMXA5WDRrVE0vQSs4dzRsSjlFbHNRZmRvdERLQ3MyejdvNkd2?=
 =?utf-8?B?L2ZpZS84Wk1FSHpNMHNqcFN6KzM0dzFDZFdhWjU2YXAxbFJuemZzTDJDNHdn?=
 =?utf-8?B?NjV1a3EzOFpNRTNHcEI4QmhSbHM3NVdKM2Ezc2dnTFRybkRyWEoyc0poK0pj?=
 =?utf-8?B?VHRMajFJMnBJVzRjKzVvcWFzd2VBZXF1emR1Q0JBU3hQVlhOYmwydXhjazNr?=
 =?utf-8?B?VTNWaWU4WkZGWnphYjR6clVra0dWN2gvNDJlNFB1dVdIOWg4VWFZZzcxY2ZD?=
 =?utf-8?B?UmorcjZBRGN6MTJ0WEpneGt4TXdheUp0Z0NzZ1JERmhTTW1BaVNBMGtzWWhG?=
 =?utf-8?B?QkdnYjJQcXI1SGc0ajJpbWVHeUJlNWREeE9GZVI2dzNFd3daNXh3Qk04NCtV?=
 =?utf-8?B?SmVXN0dVeWhtRUV0S2JDZXJhcWpuVFdtOVJMKytVaThwaVc1Z3FqWUFjU3Vk?=
 =?utf-8?B?T045QVIrbk1nOHJvNW5QRkRrdWZEYmlIZ3BKZmFnc2xyY2JORkZVWTQxYnpC?=
 =?utf-8?B?UGxIS1pRdjhxNzBhVDRLaWpEMHY2bzYvbStpY3U3QUhWZ1hUemhwYStmcmZF?=
 =?utf-8?B?TWY0Z1hoc3V1Z3hqdW1HdVowSDVMZGpUTUZMdFJiVFljNStqK3gycUtwRFlK?=
 =?utf-8?B?bzZGWnN4a3lYa2YzZmhMMDJUbGlIWTZhMkxCeENaSklSVnowc0szOElpVGVM?=
 =?utf-8?B?UDV1N2pOODRsOGFzelg2RFRoNFlhNzRHN0V6RGlMZVl4Mng5dUNRQnFwNmNu?=
 =?utf-8?B?ZnpDTGtiTkdlYitKcjVpbHJ3S0h1Q08xNE96VVRwam9FblEzeGkxVlA5YWt2?=
 =?utf-8?B?MzRJM3YwQVBtQ1JScFdIVjRHZWpPVXJVN25UVFNNZ2FwUE9nNVl1NEsrcUk1?=
 =?utf-8?B?MkxzcWxwZjQxYUdtQjhWbVFrRExMMjZFSVRZd0JFTzFzTnhMa1h3Z0w1ZnE5?=
 =?utf-8?B?bjFnTmdrTXZnSk1CWVA4OUwxMHUwaTdRSGNVR2Q4Zll1ak1mQmg5Tll1UkpR?=
 =?utf-8?Q?gvHW6aHX6xIHJdCdRXcZ1Hyo430OHZZAs5vLlG7WbQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10afd3cc-7f3a-462c-7050-08d9f7da816c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:13:29.7809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2N/tgKDub9pVaXOdm+ppg5sU2JGvk5uiqV4qa2nhSiU5nHY75pZ5AP69dKVBuJKVrbahI2R6LiNa+4aoXXGC6RHYiMEdkLbEaPBg0EpeuSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3069
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

On 2/23/2022 18:03, Ceraolo Spurio, Daniele wrote:
> On 2/23/2022 12:23 PM, John Harrison wrote:
>> On 2/22/2022 17:12, Ceraolo Spurio, Daniele wrote:
>>> On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> The LRC descriptor was being initialised early on in the context
>>>> registration sequence. It could then be determined that the actual
>>>> registration needs to be delayed and the descriptor would be wiped
>>>> out. This is inefficient, so move the setup to later in the process
>>>> after the point of no return.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++--
>>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> index 0ab2d1a24bf6..aa74ec74194a 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> @@ -2153,6 +2153,8 @@ static int 
>>>> __guc_action_register_context(struct intel_guc *guc,
>>>>                            0, loop);
>>>>   }
>>>>   +static void prepare_context_registration_info(struct 
>>>> intel_context *ce);
>>>> +
>>>>   static int register_context(struct intel_context *ce, bool loop)
>>>>   {
>>>>       struct intel_guc *guc = ce_to_guc(ce);
>>>> @@ -2163,6 +2165,8 @@ static int register_context(struct 
>>>> intel_context *ce, bool loop)
>>>>       GEM_BUG_ON(intel_context_is_child(ce));
>>>>       trace_intel_context_register(ce);
>>>>   +    prepare_context_registration_info(ce);
>>>> +
>>>>       if (intel_context_is_parent(ce))
>>>>           ret = __guc_action_register_multi_lrc(guc, ce, 
>>>> ce->guc_id.id,
>>>>                                 offset, loop);
>>>> @@ -2246,7 +2250,6 @@ static void 
>>>> prepare_context_registration_info(struct intel_context *ce)
>>>>       struct intel_context *child;
>>>>         GEM_BUG_ON(!engine->mask);
>>>> -    GEM_BUG_ON(!sched_state_is_init(ce));
>>>>         /*
>>>>        * Ensure LRC + CT vmas are is same region as write barrier 
>>>> is done
>>>> @@ -2314,9 +2317,13 @@ static int try_context_registration(struct 
>>>> intel_context *ce, bool loop)
>>>>       bool context_registered;
>>>>       int ret = 0;
>>>>   +    GEM_BUG_ON(!sched_state_is_init(ce));
>>>> +
>>>>       context_registered = ctx_id_mapped(guc, desc_idx);
>>>>   -    prepare_context_registration_info(ce);
>>>> +    if (context_registered)
>>>> +        clr_ctx_id_mapping(guc, desc_idx);
>>>> +    set_ctx_id_mapping(guc, desc_idx, ce);
>>>
>>> I think we can do the clr unconditionally. Also, should we drop the 
>>> clr/set pair in prepare_context_registration_info? it shouldn't be 
>>> needed, unless I'm missing a path where we don;t pass through here.
>>>
>>> Daniele
>> I don't believe so.
>>
>> The point is that the context id might have changed (it got stolen, 
>> re-used, etc. - all the state machine code below can cause aborts and 
>> retries and such like if something is pending and the register needs 
>> to be delayed). So we need to clear out the old mapping and add a new 
>> one to be safe. Also, I'm not sure if it is safe to do a xa_store to 
>> an already used entry as an update or if you are supposed to clear it 
>> first? But that's what the code did before and I'm trying to not 
>> change any actual behaviour here.
>
> I was comparing with previous behavior. before this patch, we only do 
> the setting of the ctx_id here (inside 
> prepare_context_registration_info) and you're not changing any of the 
> abort/retry behavior, so if it was enough before it should be enough now.
Hmm, I think I must have confused myself with the intermediate steps 
along the way. Yes, it looks like the clr/set in prepare is redundant by 
the end.

>
> Regarding the xa ops, we did an unconditional clear before, so it 
> should be ok to just do the same and have the clear and set back to 
> back without checking if the context ID was already in use or not.
Actually, I was thinking you meant to drop the clr completely rather 
than just drop the condition. Yeah, that sounds fine.

Will post an update.

John.

>
> Daniele
>
>>
>> John.
>>
>>>
>>>>         /*
>>>>        * The context_lookup xarray is used to determine if the 
>>>> hardware
>>>
>>
>

