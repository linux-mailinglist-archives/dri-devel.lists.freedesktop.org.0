Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B635F1112
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 19:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DB210ED9A;
	Fri, 30 Sep 2022 17:44:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9264710E2FF;
 Fri, 30 Sep 2022 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664559867; x=1696095867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xSgy+h0np3bSCHhM9I9fS6pVTerfpgiMoEb7dpHSAbM=;
 b=V4iZUJNBnxoWktAtCl7foegraznNhCn4z+dWqU+7NKtyaKgxnpE90xjK
 iKq4NEsaRIDXnCAW9WvC3gTaJkhw/kxbYWs0ck3VK7WTCbKw82HZcsTiU
 oEEyDEGovsONGQDkjpbPA2+mf9yu2tfbBJKMOHYmhPTqCiUpLGngjY2EX
 0K7sW4vOlxZCpsowrP+N/fcVMRbwMYO/BislEfZtR9z4jrEfIyRx0Di/O
 ro34hmDOoQyBD83rOntX3S23S7iprnxU7wLSUnkTmMOaEKa+SdgLVGQua
 EoBn5LvdHHdY7nMPcWgPQsFGcMaILQr2uo0O/pO+Hd8d7eOSUJMcxbvQg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="285385617"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="285385617"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 10:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="573938798"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="573938798"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 30 Sep 2022 10:44:18 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 10:44:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 10:44:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 10:44:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrfqO9+jmVrX7fwtR2TFgohg8tCGZ8aiENr7515498SIWlHWfTqnU6wVzGo8R0JpixTiRs8Aga7QC5VRgWxxWibFDiFL887BO0RUh5apafKjSoyPfLhgkfL9qfxDFnrcJWXQQCva6DAjJGtLeDY/tsqy9N7qCvCwSo/e8IjjzEd7btj0kzarxfqwIeadOkm4Bsof9/erlI8irFzM3aCm9gYYT5e5tpOsioAqx2WEgvmJbkxaw//qngvN13OKFEUrETmLin4drIyWdD5KuN1qOxu4nWRkmDcWwJ6hz+/bEWlFHY6LxGEnx8lN0VZoGKrmUi5OwffQVymUGhvjKKTNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6ma67LK7L/PwL8Y3rIYiuW1rEi6ABlC1oE35EYKRVQ=;
 b=hZVDAL2bOI/MVKz/cI1Mz1R4vx75s9bV9VefbtaASoeFy6b4Dpd+YqT3wSNyl+FeyWLxcS0k0wY0unAxnPCF+tk3RVD/mnhMFXnbGY2qQZdva/B2P3xoXJjk6JUQzS1t6AHVsrgmDwrXT/cxCxZAy5+gOcwOo2bWzS41oDhN5KTexn8oywHfIRl85Gw/bvUf0C1mwYa9Q+xIUznsl0da4ytg8c3EcXeLnVejpnNBL/Q65frQcTmmDevHs1zrqSfp2qoDL4MeKXyCRs+TtUbTn+rHlMUPUIcaH2FRhZyCyXLVrDL01PXDfk/BY5OGrrUGJvsIT9hCnNdywwsbm0Mjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.18; Fri, 30 Sep
 2022 17:44:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 17:44:10 +0000
Message-ID: <89566262-2cd0-f456-e8b2-c7bc6ad6fe36@intel.com>
Date: Fri, 30 Sep 2022 10:44:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v4 3/4] drm/i915: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
 <20220929021813.2172701-4-John.C.Harrison@Intel.com>
 <a2c2cddf-009b-a2e0-2af2-6f1553c59cbc@linux.intel.com>
 <ae042c9d-f6f1-2ecd-e23a-7d6994c97151@intel.com>
 <28690581-b934-b99f-feb9-78a8e6c2d052@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <28690581-b934-b99f-feb9-78a8e6c2d052@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::44) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: cde93471-447e-4a67-a49c-08daa30b619d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q1N2QLsQ0QyqrZcEgVhwSx4gXyk+KjX2p6oaewt6B4sL7HdPlipw8RuzwgM9DzTQ4Fd3kSGmA+n54ld5dDnvmR5kCCAVXEtrwpd7s5VCBHbE3BqHjOenN89S7HmZuXEqdxQXRf9gBhw1mS1dcHy6I74bmTpUXA9a3z0OPLxmv9B2tjEVdPY1owLczfPyFZca52TUFSzwHaOii5YEkLSD+YKHLP36Mm1F4c6a9Ij1tZGVisuqfGLN3Y0WuRFwZLFUjhAFXyGZK5vd6Sx3kMmX9rfAOKVJ1iVlw2e3w3+v0bPwpsUa2Bbx8I8VL4dE9NyEFDXszo9iiCnj5WSrZoklpfKsw5D7nrDUuBRbYEwy9P+0HVlmRvnsr1nHdAiWJZplA1BZzmaJtGDEep9WS5Mv9RVgOP61Ipndgn0mq3BFgGKxgbw4rtfr92ql53xdk5b0F6Pg5DaBfSg5dkDnIsvTi4NPRDVaMr79jmxbl3ys2liUt2fsmEvSLnL6bX6s07sutbectbarJtU6QcM94SSnnCvqf73org108bExIGoPRoprp6QfXJGIZKVAD3vbax3LpyCpI5TkGjMDAQUhLpruEVdX9Pwg1ZVP6/ss+KAL3VjdbhyJUdQYNg6tyH/sPGODit2ac9n1qgbNC7UcpiMRdvBmZshTkTRSdTVuzseQ0IB5Vox3MrthpE8P5S99/BJ5lqBQeBGHdoIuP5phWTmmav/Mb3Fj8RvRMhNkYZeIqM8kv35IqSgoSO6yA8hnw46A4UBmR9mAIVjj4PHQL2SIohjyP6i0NQ6SCPkQ2RKZOzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199015)(66556008)(4326008)(5660300002)(8936002)(41300700001)(8676002)(66476007)(6486002)(66946007)(478600001)(316002)(186003)(83380400001)(53546011)(26005)(36756003)(2616005)(2906002)(86362001)(6512007)(31696002)(38100700002)(31686004)(82960400001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHlxRFFHUmowV3l6SVA4QVNCUzRjemZDbnQ1STE3bUVOTWVPUEhQOEtnMnUy?=
 =?utf-8?B?bHlBQzI1U3hnQ1ZBcitjSUVaUVlOQllyR0hFV2JCLyswYjQ1K0hKMVE4cHdP?=
 =?utf-8?B?WFhyQzFTTWc4U0ZYZVV4ZDVBWTRVRW16VWlrblBma3BmbXBYQWUwcU00ZnRO?=
 =?utf-8?B?WVZDSkV4YURqRDhRejJwQ05QZ1VHUXFRZjl6aXhvcTBxTXZjYllIcS95Uy9p?=
 =?utf-8?B?dkYxOVN2ZXYwRFlIbklhQWk1alJ5Q3hXWEFZTmRCdHpsRHFYQkgxWCtWbWov?=
 =?utf-8?B?amgwYVBGc3lWbVdVend4eHVBTGhzSVo4NzFXMzZIQkxXQ1EvZisxN3RuUEhw?=
 =?utf-8?B?Q0xKaEFKNnh6L09hc0VxcjNuN2ZndCtXQUhMNk1GRXMzeW1qcHJVbFM0eEg0?=
 =?utf-8?B?UmFaNHZlVGNhV2wwdllqdURvK3dMdW1nU0dLa1puTmp1N09RQlo0UCtucTk0?=
 =?utf-8?B?RERiVFh1R21FajdJMW9LTGJnL281SUlaN2VQTHlEV3lwcTBFZlhkUFppRVE0?=
 =?utf-8?B?K2ZHUkZKQ09FN3RsUjBaS3RHTVdUR1FDWXVQUDMvSitJU1gxT1lnMkoxYTg5?=
 =?utf-8?B?eTFCU0V1SzNhVmc3cWxoMHVEUFlNaW9QT1o0WWlmWkJyL3AxTlQ3NjVmdjRm?=
 =?utf-8?B?enBRRHJaTVN0eU5mdHphdEYwWFdSc0o4OUNFY2MxdXhmM0RrTDA5M2I2dk1C?=
 =?utf-8?B?eWFRQ28waEtmRzVOWjRPWWdDNVNsN3dTdnNyVldBSnNJMlZOK21ua0NBbjJH?=
 =?utf-8?B?MkNRUTBMZjc0d1M4dkcvOFBlY090dS9HSzZuU0FYZXBEK1pTNFltckwyYUFu?=
 =?utf-8?B?emdqSXdUVjFVQ1IvQnRKdTUrU01DZzAxUnQxUUhnRU04aElqTmZ0VVROdEd2?=
 =?utf-8?B?NzV5SzF3Z1hXVzFCUUdSc2RXNjhpQUNMY1V1Q016Z0trTU9wSWFsSDMzMUVa?=
 =?utf-8?B?c3FWTGVsY1MyV3h2Qm93TVZxRzVrKzkvZXZMTnJPNEU5ZWkzQnlqOVZ0S3ZG?=
 =?utf-8?B?SjNiRzAxb05IT0Y5SlJqUkprbjc0WDJKYlZ1WUx6clZTY2pCTzBVWEVNTk5Q?=
 =?utf-8?B?ZEVnZFNxSmhjS0RzRm54OG96RWpnK2laNTh1VS9FdVJMakc5cnhlL1hPcHhr?=
 =?utf-8?B?WU8rQmJIbndMMkRwNG8vdkpIWW1GSnppVnhvck5YZzU3REZwaGM4aTU3ZjBO?=
 =?utf-8?B?SXhOcmR4UTFxaEp0RzB4UEpuQjhFQU5RY25ZQ3RjR3lKeksvVVphbldVQ1dl?=
 =?utf-8?B?cjFOU1BrazMrRUhSYnhRU1RPQVBtZDNCelJsRG95TVkyTGowOFJ1bzI0cFVz?=
 =?utf-8?B?OVFJVzNUR0dWZ0RVUlkxOFBoOU52cFZmY1NWTnBiR1dPRkNwVCt1UXdMU2w4?=
 =?utf-8?B?ei9tZFcwSkoxT1poWUp4dldZbXM5WkdIZm9wdGdXQWxsTXpVRmRUY2J1SjRT?=
 =?utf-8?B?WFdsL3dZRUlXTzZPTUxWUW5DUmpHQkYrTkdaZVNoU3prN3R5U3ZRU0RGYXNr?=
 =?utf-8?B?ZUxJZkRLdVc5SjBUZXdOL014Q2FlbTg4N0ltYUtjRDRoRjk1MzYveXgwaE5S?=
 =?utf-8?B?aG5XZFBMQm4zSU5sRW5yM1pZLzBRcWgwVkoyMzU2bmlEa2FTWWRkSW5HZ1R5?=
 =?utf-8?B?ekxNRDZZRllYYVp6R3F2cHRXMHNEQ2lHSGhpMEVsQUg0dXFjanZPekdnMUlR?=
 =?utf-8?B?WkhDNkU3NFVHNnlyYkl6VFlOVVk5T1NwZSt6UUdFNWNvelFoT2pHSmR6ZkpI?=
 =?utf-8?B?VFdVbHdabGhaWVl2bGUrN0dIZTJzY1cwdGlxdm85UVJyN3VPWjBCSWZLVVoy?=
 =?utf-8?B?T3BlRHhYVjdLWEtoR1V5Q0FUMXgzVEp2N2s1UkdOVDMwUFU1UEVobXdqK2xw?=
 =?utf-8?B?NjJDaHNsZ0o0SWdSSVNIcTFpajkrTkMwZTZIWGdrV2pYL2I5YStmWS92ZzVa?=
 =?utf-8?B?eVh2VERmbzdWQzFnVkJOd0JteTNXTjZ4WTZCQW44alZ0V1AwNzVGU2dyRkRw?=
 =?utf-8?B?V0s0T3Y5MFNTYmp6L01GVnZCek90aG56U292MnluK2o0NFFsbmsxRUNpU0x5?=
 =?utf-8?B?M3FlWUpZZ1JXeDdoWFg2eVZ2MEZ5SU9MT0kza21yYWxIRzhZUVZ0MDVmT1dR?=
 =?utf-8?B?ejdlTEJ2QVZkOXlxUGZZbm8yYVprTmpWRnFYMEhIRHJQbWtRc3VhamFhQ2VU?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cde93471-447e-4a67-a49c-08daa30b619d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 17:44:10.6222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mad0W3PdBnaPCcdUBkmpzINOvXiCUiRfTmlhGhdZJRPg733kFx01MvXl3RGOWybyHKIiT49fcMvRsnbD5Oh+8nz09NoDBzJ1Ybwf19aBsEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
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

On 9/30/2022 02:22, Tvrtko Ursulin wrote:
> On 29/09/2022 17:21, John Harrison wrote:
>> On 9/29/2022 00:42, Tvrtko Ursulin wrote:
>>> On 29/09/2022 03:18, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Compute workloads are inherently not pre-emptible for long periods on
>>>> current hardware. As a workaround for this, the pre-emption timeout
>>>> for compute capable engines was disabled. This is undesirable with GuC
>>>> submission as it prevents per engine reset of hung contexts. Hence the
>>>> next patch will re-enable the timeout but bumped up by an order of
>>>> magnitude.
>>>>
>>>> However, the heartbeat might not respect that. Depending upon current
>>>> activity, a pre-emption to the heartbeat pulse might not even be
>>>> attempted until the last heartbeat period. Which means that only one
>>>> period is granted for the pre-emption to occur. With the aforesaid
>>>> bump, the pre-emption timeout could be significantly larger than this
>>>> heartbeat period.
>>>>
>>>> So adjust the heartbeat code to take the pre-emption timeout into
>>>> account. When it reaches the final (high priority) period, it now
>>>> ensures the delay before hitting reset is bigger than the pre-emption
>>>> timeout.
>>>>
>>>> v2: Fix for selftests which adjust the heartbeat period manually.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 19 
>>>> +++++++++++++++++++
>>>>   1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>> index a3698f611f457..823a790a0e2ae 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>> @@ -22,9 +22,28 @@
>>>>     static bool next_heartbeat(struct intel_engine_cs *engine)
>>>>   {
>>>> +    struct i915_request *rq;
>>>>       long delay;
>>>>         delay = READ_ONCE(engine->props.heartbeat_interval_ms);
>>>> +
>>>> +    rq = engine->heartbeat.systole;
>>>> +
>>>> +    if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
>>>> +        delay == engine->defaults.heartbeat_interval_ms) {
>>>
>>> Maybe I forgot but what is the reason for the check against the 
>>> default heartbeat interval?
>> That's the 'v2: fix for selftests that manually adjust the 
>> heartbeat'. If something (or someone) has explicitly set an override 
>> of the heartbeat then it has to be assumed that they know what they 
>> are doing, and if things don't work any more that's their problem. 
>> But if we don't respect their override then they won't get the 
>> timings they expect and the selftest will fail.
>
> Isn't this a bit too strict for the non-selftest case? If the new 
> concept is extending the last pulse to guarantee preemption, then I 
> think we could allow tweaking of the heartbeat period. Like what if 
> user wants 1s, or 10s instead of 2.5s - why would that need to break 
> the improvement from this patch?
Then the user is back to where they were before this patch.

>
> In what ways selftests fail? Are they trying to guess time to reset 
> based on the hearbeat period set? If so perhaps add a helper to query 
> it based on the last pulse extension.

I don't recall. It was six months ago when I was actually working on 
this. And right now I do not have the time to go back and re-run all the 
testing and re-write a bunch of self tests with whole new helpers and 
algorithms and whatever else might be necessary to polish this to 
perfection. And in the meantime, all the existing issues are still 
present - there is no range checking on any of this stuff, it is very 
possible for a driver with default settings to break a legal workload 
because the heartbeat and pre-emption are fighting with each other, we 
don't even have per engine resets enabled, etc.

Maybe it could be even better with a follow up patch. Feel free to do 
that. But as it stands, this patch set significantly improves the 
situation without making anything worse.

John.

>
> Regards,
>
> Tvrtko

