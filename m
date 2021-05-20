Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1B38AA43
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 13:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB686F3F4;
	Thu, 20 May 2021 11:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2078.outbound.protection.outlook.com [40.107.96.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0CA6F3F2;
 Thu, 20 May 2021 11:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etNLx2DfvoXa/W6f6C2oAfBFFQf+D3KX59QancKv0UfEJJ/U4VvA9Jd4SfypAPZ1+S4B4khf3jA73wyeMFGiq+o617f3DRvnJJyIUPBpfQuLdx7j90Z0idpKqEspRU3A6bZP60bX593DLjx7w81ADQP2E4uKUTsIkcz+5u4x8YPPXUm0wY4/JGSqbhmbIAMBe3S5eX4Gjk7X0MgD63uvHFW1B5mblPxJBnLRlCxUGGxpOdm9vOAF7DjMKQrATLkgS5ptBcZ9btzKWgXdwqLXI5+cL9ly+UKj/zYOOxhKE9v7rB0nWMmBqWwa024H6cpe4v0VGM4AMfu0fGi8JkU/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbyrPbc47VTve4DWXO19HPfC0dkZgfQmIHy/oUvlEY4=;
 b=eEJxewKSk59Hcj9a1vFfKJlma44zuU9Cp18y+9LfIAG57ygWY36KhyGCvUHsYMfZYLcqYjtzAgzh2q5o32CQGjd/lzIwizMFAUnuPXP0uTQBRNq5LvuHUySdP1o3oIzuoPXtNKi/TCgeXhb+nbl0pZ1yT5uRscxvGn120RYZSslrsYccbpRXyjUFjUzNHt7EwbPJ0p1+8JO/tu4Esx2FYXtA6JqbHQuGzGnfEb/+bXd536/CvdYIGqq8/XgbAkxDoW5prXzvVWfgVRNmcxTv4VaQ7Npk2w+mv3FEgHp6h/AMZ0pyMl39P+nonqu9VmVn8ZWvSUfjYjnP0rR6q5+MZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbyrPbc47VTve4DWXO19HPfC0dkZgfQmIHy/oUvlEY4=;
 b=qesklrrKlKS82cWrZR/2tnCDqdFkmMWoD5LSTgwsYMrE1QHNFBhL2wvjkx5Vvbh5iwZYXD1P1mCyzm5NVFy37ukPvdyfPeOKbCgqAq7YnEees7d5zBV93StdMLhoY+xLyNTXsi6MA7kC6AzIhjuRlesbizLt2i6PJSplXsLkcck=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2420.namprd12.prod.outlook.com (2603:10b6:207:4c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 11:12:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 11:12:05 +0000
Subject: Re: [Mesa-dev] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
 <5b8ab744-4906-945d-cbca-1ce4c40f2fcb@gmail.com>
 <20210519165121.GA2585@sdutt-i7>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <521a34ba-52d4-a9c2-97bb-48873174fc49@amd.com>
Date: Thu, 20 May 2021 13:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210519165121.GA2585@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: AM4PR0101CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 AM4PR0101CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 11:12:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b18ebcb2-ecec-4c20-4593-08d91b80194f
X-MS-TrafficTypeDiagnostic: BL0PR12MB2420:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2420EFC95344159C0D6898EF832A9@BL0PR12MB2420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bz8XV9JyNh/IjviI7QP2u4SwZi8XWMtR/UQN0umGBgoiyRyb3b7cVoRSQbZvi8U0KyZLptYRgFX2A0QZ4O3oy5ZZtYW+27ieOpt5EBS74/uy1knLgavC6KXpYNLam1ZPCizZCr7+K6IhqlpshZbM4sc+yeW5+0j7B7QVwia2+IscDtUFNDUynHGED/FKx9H20OQ++9+OCHxIntyGh+keiUD40oZ2ZNmTo5pa9k/SQApzMITSkwJ4FpQU9XXIy01KMSzApslXNDb4vpN1gjCoyK3wegcaPDSSKYCwmW7oTNe4MynS+ylhHEjbU0osi2nRh2qNewBp3hR2lB90XKz/l5+mX28X/5ErtVnIau0BnlBqzxny08GWNbmoNRvXWgX4fgk+cE7fQS/dtkoIVx1XfjOiF8nMCsq+hbRHgTjROcnec5mLHmocAK42tICJSXn/JDi+34da0Bn7Vqa/tu0z8IJOM8GLX9xCc4YBEmBuQtMQFtflkxGz0vyDecsSdJRSBqJnOxw6rn7qR+KQwCrVI2oksCIk5q4vkGGcpHOYc8uhnvJUmCCAo8Sd4xSh83oyBownD8tfISGLV30H1sDs0er/kU5vUJwVbKm3oN64eXO5A9/vs2SUPD+PYRDX9lXEqgQau4jY7ckA9w00ijxixkrpi9Bk2Ln/6zgMiqZ5w4uAIhj5wAUK+UeP831iOKtSXud+BMgsaOQ0SZWSY/g4jY0n1nO1C3gWRb5BN4NQafX4dyHXPqMOPnhdYz0hu1mQJmX66Grg/Art3Z31vrusXQ5FAXS2U6pPIxHL2lvw8Zo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(316002)(110136005)(16526019)(45080400002)(30864003)(186003)(36756003)(5660300002)(478600001)(2616005)(966005)(6486002)(8936002)(38100700002)(7416002)(4326008)(8676002)(2906002)(83380400001)(66574015)(31696002)(6666004)(52116002)(66556008)(86362001)(31686004)(66476007)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cFhOOW5PYnNFL3NnWFhzRTVUYkcrek1qeW1XYTlzSVBldUM4WS92aERqWjRI?=
 =?utf-8?B?ZlFSK0Q1UFNaVldXSmVJNXFTUm1LcHphR0wvL0NTSWFydFZLZXFYRXpBc0dG?=
 =?utf-8?B?ZWxtUmVTZjI1OXdaWHJOS1VUZ0R0SjNDT0JTbHY0eGNMVFlPeGU5cC9aeGha?=
 =?utf-8?B?czllOCsvaEdlN0ZDaXgxcFVPTm91M3MzUnJtWlRoTlNFQmxlVXg4M1dTWmp4?=
 =?utf-8?B?a2IrbXpoU09zeUJnQk1ZWGlQdUJMS0R4eEtvM20zMzVRRlJBbm5MU1BwSWZT?=
 =?utf-8?B?clQrZ1huK0FYQmVaSFFJbFpCaHhYNGlnMnJzejRhN3IrbURaRDFoblIzZkR1?=
 =?utf-8?B?Z3NVK3d2Q1YwTkZLd294Qm1abm02OVpDVSt3ckJZdy9tOTF6V0RScWJFbFZG?=
 =?utf-8?B?RUUzamlSVW5xcFlTT2E1T0UycGhucEQrUkpVMS9xcFNpMHJ1TWR3aXF0dTUy?=
 =?utf-8?B?alR2aTVGQTl6MmxpbmRpTys0SFlxSDJmUFVBbGo0c21HT1pmM1NSOWpLWkFi?=
 =?utf-8?B?aE1ZMit5RHpuTDd5QmdpL3VNTGNkMTZuOEFwWkJzckJyWkloaHhsRkh1cEFM?=
 =?utf-8?B?a28xSHVoTHZEd3pYeUZFSnBQUVcyTnFqWnN3SDVHV2NiV2ZIMlJtZGtWdm5D?=
 =?utf-8?B?cmRsaEJBaGhmbU51UzM0b2JaRGhLV1p4YmR1bUxwNUtKcDFYTnBqRW5NNDJ3?=
 =?utf-8?B?S3FodFFIZDk4RmxZUlNLQkVRaGdkUmJrWGU3OXdDNHJ3Nm9BVEdvSkMvaUxR?=
 =?utf-8?B?N3VtKzFzbHk0K3BmbGoxdUoxSC8vSE9RdWhLTmZHeVBvcG50ZC8zUWxpOHVY?=
 =?utf-8?B?Qm1KZ0dLUGdQOVFYempYUU1JeGdtK3E3SEw3cHozb21YQTFiclNuWnZxRjR5?=
 =?utf-8?B?OWZFMHREQnA3dmtvTkoybmp2Z1hmeFdBaUxUZnRDRTNMV1ZyUlBLc1pEQ0tE?=
 =?utf-8?B?NDFKRUNMeXc5Zk5hczVwRFFHRFZzMEthMXBlSWlTVUt6RWxFNWVlNzhCelZM?=
 =?utf-8?B?RlMwUDNxc2NlekZBMHN4NUtIWmJiMzRUaG8zZm9EUHdzeDlkd3NpR0IvRU1P?=
 =?utf-8?B?dlhPVytUc0Fab0dsSC9Lb2Z3MlNFbDR2YnJCNEJrUS96OEpBem90dVBGa1B0?=
 =?utf-8?B?OXE2ekY3RXY5L0t0Nmxsdk9RVytYY0FJc0JjQUZaTHc3UU13UlhPdVJ3b3E5?=
 =?utf-8?B?S2FnY2dpT1ZzTVNkcSszaGp1RERqZWkzUEVObXJVdzd4d014ZStGU0w1Y0Nw?=
 =?utf-8?B?c3g2ZlVxazNCaUhvaGhDRWVWc0IyVjhTL1FieGMzSE4wdGRNdVFlUitBbXF4?=
 =?utf-8?B?c1I5Njc0VWJWNmQ3LzJUV0MyNnUwcW1XclJaVDFteTVCOER5NElvclNvVERX?=
 =?utf-8?B?TGlMbXl4OEVkYUtCUEYvQWlFUmxzQkFQaEpxOWxsMjBVYnNlOXJzOVRJR3dN?=
 =?utf-8?B?Yjh5ZXc5MzlvZE80bFpsT1ZiME9wUmY3OE5OQW9FMU1nU3BNZGtmS2dsd2M4?=
 =?utf-8?B?YzcxbG50QWV6YVRSMWw5R3VDSUFZNnhESjJZN3VCVjIyckdVV3g2NHJ2R2cx?=
 =?utf-8?B?NVUvUHhhSWM5TzVRZUV6TXBBSGdrVUJvOEk2S21oc1ZMSmR3UVBvQ3BPZDdG?=
 =?utf-8?B?YjVLZnNpNXArMlBCZHpCUWVkTlMxNnJDa2Qwdzg4cVJjcFptbW9IVTBRSWhL?=
 =?utf-8?B?MVdsK012bmdONklzbWtwZzNJVzl3QWxZWDRsYmx0eEFUR0ZXdFpJNGVkODNs?=
 =?utf-8?B?TitJa2VwTWI5VDNSQnU0eFVtWm9jbGNkalF5K1U4NUE2V3hpamFxNm9TdTN5?=
 =?utf-8?B?Q0ZBRk1oM0FKR3poYlNhaFdGQ3VGK1hzcFdpU0tKMUZoamZTSm5PRWgvVXNy?=
 =?utf-8?Q?ThRF71XuccF45?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18ebcb2-ecec-4c20-4593-08d91b80194f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 11:12:04.8672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRmBG09i5QU6oUCTA88kfS8LHjCbDkTAaaKCICoBTKJ/8Lex6xfvrYJt0x/ZCCiJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2420
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
Cc: tony.ye@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, michal.mrozek@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, mesa-dev@lists.freedesktop.org, karl@freedesktop.org,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.21 um 18:51 schrieb Matthew Brost:
> On Wed, May 19, 2021 at 01:45:39PM +0200, Christian König wrote:
>> Oh, yeah we call that gang submit on the AMD side.
>>
>> Had already some internal discussions how to implement this, but so far
>> couldn't figure out how to cleanly introduce that into the DRM scheduler.
>>
>> Can you briefly describe in a few words how that is supposed to work on the
>> Intel side?
>>
> Sure, I've done a quick PoC internally and have been able to hook this
> into the DRM scheduler.
>
> Basically each BB still maps to a single job as each job is somewhat
> unique (e.g. each job has its own ring, lrc, seqno, etc...). However all
> the jobs configured to run in parallel map to a single sched_entity
> which maintains the order each job was generated from the execbuf IOCTL
> (1 - N). When the backend receives jobs 1 to N - 1 it basically just
> updates some internal state. When the backend sees job N (last job) it
> actually does the submit for jobs 1 - N which with GuC submission is a
> simple command moving the LRC tail of the N jobs.
>
> Daniel has suggested that we create a single job for the NN BBs but that
> would be huge rework to the internals of the i915 and likely won't
> happen by the time this code first lands.
>
> Also worth noting one way a job isn't really a treated individually is
> the excl slot with dma-resv. In that case we create a composite fence of
> all jobs (dma_fence_array).

Yeah, that's something we have discussed as well.

How do you prevent the scheduler from over committing to a single ring 
buffer in this scenario?

Christian.

>
> Matt
>
>> Thanks,
>> Christian.
>>
>> Am 19.05.21 um 01:58 schrieb Matthew Brost:
>>> Add entry fpr i915 new parallel submission uAPI plan.
>>>
>>> v2:
>>>    (Daniel Vetter):
>>>     - Expand logical order explaination
>>>     - Add dummy header
>>>     - Only allow N BBs in execbuf IOCTL
>>>     - Configure parallel submission per slot not per gem context
>>>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Tony Ye <tony.ye@intel.com>
>>> CC: Carl Zhang <carl.zhang@intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++++++++++
>>>    Documentation/gpu/rfc/i915_scheduler.rst      |  53 ++++++-
>>>    2 files changed, 196 insertions(+), 1 deletion(-)
>>>    create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
>>>
>>> diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
>>> new file mode 100644
>>> index 000000000000..8c64b983ccad
>>> --- /dev/null
>>> +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
>>> @@ -0,0 +1,144 @@
>>> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
>>> +
>>> +/*
>>> + * i915_context_engines_parallel_submit:
>>> + *
>>> + * Setup a slot to allow multiple BBs to be submitted in a single execbuf IOCTL.
>>> + * Those BBs will then be scheduled to run on the GPU in parallel. Multiple
>>> + * hardware contexts are created internally in the i915 run these BBs. Once a
>>> + * slot is configured for N BBs only N BBs can be submitted in each execbuf
>>> + * IOCTL and this is implict behavior (e.g. the user doesn't tell the execbuf
>>> + * IOCTL there are N BBs, the execbuf IOCTL know how many BBs there are based on
>>> + * the slots configuration).
>>> + *
>>> + * Their are two currently defined ways to control the placement of the
>>> + * hardware contexts on physical engines: default behavior (no flags) and
>>> + * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added the in the
>>> + * future as new hardware / use cases arise. Details of how to use this
>>> + * interface below above the flags.
>>> + *
>>> + * Returns -EINVAL if hardware context placement configuration invalid or if the
>>> + * placement configuration isn't supported on the platform / submission
>>> + * interface.
>>> + * Returns -ENODEV if extension isn't supported on the platform / submission
>>> + * inteface.
>>> + */
>>> +struct i915_context_engines_parallel_submit {
>>> +	struct i915_user_extension base;
>>> +
>>> +	__u16 engine_index;	/* slot for parallel engine */
>>> +	__u16 width;		/* number of contexts per parallel engine */
>>> +	__u16 num_siblings;	/* number of siblings per context */
>>> +	__u16 mbz16;
>>> +/*
>>> + * Default placement behvavior (currently unsupported):
>>> + *
>>> + * Rather than restricting parallel submission to a single class with a
>>> + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a mode that
>>> + * enables parallel submission across multiple engine classes. In this case each
>>> + * context's logical engine mask indicates where that context can placed. It is
>>> + * implied in this mode that all contexts have mutual exclusive placement (e.g.
>>> + * if one context is running CS0 no other contexts can run on CS0).
>>> + *
>>> + * Example 1 pseudo code:
>>> + * CSX[Y] = engine class X, logical instance Y
>>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>> + * set_engines(INVALID)
>>> + * set_parallel(engine_index=0, width=2, num_siblings=2,
>>> + *		engines=CS0[0],CS0[1],CS1[0],CS1[1])
>>> + *
>>> + * Results in the following valid placements:
>>> + * CS0[0], CS1[0]
>>> + * CS0[0], CS1[1]
>>> + * CS0[1], CS1[0]
>>> + * CS0[1], CS1[1]
>>> + *
>>> + * This can also be though of as 2 virtual engines:
>>> + * VE[0] = CS0[0], CS0[1]
>>> + * VE[1] = CS1[0], CS1[1]
>>> + *
>>> + * Example 2 pseudo code:
>>> + * CS[X] = generic engine of same class, logical instance X
>>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>> + * set_engines(INVALID)
>>> + * set_parallel(engine_index=0, width=2, num_siblings=3,
>>> + *		engines=CS[0],CS[1],CS[2],CS[0],CS[1],CS[2])
>>> + *
>>> + * Results in the following valid placements:
>>> + * CS[0], CS[1]
>>> + * CS[0], CS[2]
>>> + * CS[1], CS[0]
>>> + * CS[1], CS[2]
>>> + * CS[2], CS[0]
>>> + * CS[2], CS[1]
>>> + *
>>> + *
>>> + * This can also be though of as 2 virtual engines:
>>> + * VE[0] = CS[0], CS[1], CS[2]
>>> + * VE[1] = CS[0], CS[1], CS[2]
>>> +
>>> + * This enables a use case where all engines are created equally, we don't care
>>> + * where they are scheduled, we just want a certain number of resources, for
>>> + * those resources to be scheduled in parallel, and possibly across multiple
>>> + * engine classes.
>>> + */
>>> +
>>> +/*
>>> + * I915_PARALLEL_IMPLICT_BONDS - Create implict bonds between each context.
>>> + * Each context must have the same number sibling and bonds are implictly create
>>> + * of the siblings.
>>> + *
>>> + * All of the below examples are in logical space.
>>> + *
>>> + * Example 1 pseudo code:
>>> + * CS[X] = generic engine of same class, logical instance X
>>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>> + * set_engines(INVALID)
>>> + * set_parallel(engine_index=0, width=2, num_siblings=1,
>>> + *		engines=CS[0],CS[1], flags=I915_PARALLEL_IMPLICT_BONDS)
>>> + *
>>> + * Results in the following valid placements:
>>> + * CS[0], CS[1]
>>> + *
>>> + * Example 2 pseudo code:
>>> + * CS[X] = generic engine of same class, logical instance X
>>> + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>> + * set_engines(INVALID)
>>> + * set_parallel(engine_index=0, width=2, num_siblings=2,
>>> + *		engines=CS[0],CS[2],CS[1],CS[3], flags=I915_PARALLEL_IMPLICT_BONDS)
>>> + *
>>> + * Results in the following valid placements:
>>> + * CS[0], CS[1]
>>> + * CS[2], CS[3]
>>> + *
>>> + * This can also be though of as 2 virtual engines:
>>> + * VE[0] = CS[0], CS[2]
>>> + * VE[1] = CS[1], CS[3]
>>> + *
>>> + * This enables a use case where all engines are not equal and certain placement
>>> + * rules are required (i.e. split-frame requires all contexts to be placed in a
>>> + * logically contiguous order on the VCS engines on gen11+ platforms). This use
>>> + * case (logically contiguous placement, within a single engine class) is
>>> + * supported when using GuC submission. Execlist mode could support all possible
>>> + * bonding configurations but currently doesn't support this extension.
>>> + */
>>> +#define I915_PARALLEL_IMPLICT_BONDS			(1<<0)
>>> +/*
>>> + * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
>>> + * points on all hardware contexts between each set of BBs. An example use case
>>> + * of this feature is split-frame on gen11+ hardware. When using this feature a
>>> + * BB must be submitted on each hardware context in the parallel gem context.
>>> + * The execbuf2 IOCTL enforces the user adheres to policy.
>>> + */
>>> +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH		(1<<1)
>>> +#define __I915_PARALLEL_UNKNOWN_FLAGS	(-(I915_PARALLEL_NO_PREEMPT_MID_BATCH << 1))
>>> +	__u64 flags;		/* all undefined flags must be zero */
>>> +	__u64 mbz64[3];		/* reserved for future use; must be zero */
>>> +
>>> +	/*
>>> +	 * width (i) * num_siblings (j) in length
>>> +	 * index = j + i * num_siblings
>>> +	 */
>>> +	struct i915_engine_class_instance engines[0];
>>> +} __attribute__ ((packed));
>>> +
>>> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
>>> index 7faa46cde088..64c539486ee4 100644
>>> --- a/Documentation/gpu/rfc/i915_scheduler.rst
>>> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
>>> @@ -82,4 +82,55 @@ https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fspec.oneapi.com%2Flevel-zero%2Flatest%2Fcore%2Fapi.html%23ze-command-queue-priorit&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C49a7557f4e494090755608d91ae758a6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570403202969375%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=dn3PVdxYQpkpWIru5eAXHgbfuLDkppAA5daV5sHQF7s%3D&amp;reserved=0
>>>    New parallel submission uAPI
>>>    ============================
>>> -Details to come in a following patch.
>>> +The existing bonding uAPI is completely broken with GuC submission because
>>> +whether a submission is a single context submit or parallel submit isn't known
>>> +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
>>> +contexts in parallel with the GuC the context must be explictly registered with
>>> +N contexts and all N contexts must be submitted in a single command to the GuC.
>>> +These interfaces doesn't support dynamically changing between N contexts as the
>>> +bonding uAPI does. Hence the need for a new parallel submission interface. Also
>>> +the legacy bonding uAPI is quite confusing and not intuitive at all.
>>> +
>>> +The new parallel submission uAPI consists of 3 parts:
>>> +
>>> +* Export engines logical mapping
>>> +* A 'set_parallel' extension to configure contexts for parallel
>>> +  submission
>>> +* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>>> +
>>> +Export engines logical mapping
>>> +------------------------------
>>> +Certain use cases require BBs to be placed on engine instances in logical order
>>> +(e.g. split-frame on gen11+). The logical mapping of engine instances can change
>>> +based on fusing. Rather than making UMDs be aware of fusing, simply expose the
>>> +logical mapping with the existing query engine info IOCTL. Also the GuC
>>> +submission interface currently only supports submitting multiple contexts to
>>> +engines in logical order which is a new requirement compared to execlists.
>>> +Lastly, all current platforms have at most 2 instances and the logical order is
>>> +the same a uABI order. This will change on platforms with more than 2 instances.
>>> +
>>> +A single bit will be added to drm_i915_engine_info.flags indicating that the
>>> +logical instance has been returned and a new field,
>>> +drm_i915_engine_info.logical_instance, returns the logical instance.
>>> +
>>> +A 'set_parallel' extension to configure contexts for parallel submission
>>> +------------------------------------------------------------------------
>>> +The 'set_parallel' extension configures a slot for parallel submission of N BBs.
>>> +It is setup step that should be called before using any of the contexts. See
>>> +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
>>> +similar existing examples. Once a slot is configured for parallel submission the
>>> +execbuf2 IOCTL can be called submiting N BBs in a single IOCTL. Initially only
>>> +support GuC submission. Execlist support can be added later if needed.
>>> +
>>> +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>>> +i915_context_engines_parallel_submit to the uAPI to implement this extension.
>>> +
>>> +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>>> +-------------------------------------------------------------------
>>> +Contexts that have been configured with the 'set_parallel' extension are allowed
>>> +to submit N BBs in a single execbuf2 IOCTL. The BBs are either the last N
>>> +objects in the drm_i915_gem_exec_object2 list or the first N if
>>> +I915_EXEC_BATCH_FIRST is set. The number of BBs is implict based on the slot
>>> +submitted and how it has been configured by 'set_parallel' or other extensions.
>>> +No uAPI changes in the execbuf IOCTL but worth mentioning the new behavior of
>>> +the IOCTL.

