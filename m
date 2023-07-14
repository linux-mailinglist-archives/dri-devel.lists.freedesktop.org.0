Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16A7536F7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE8510E841;
	Fri, 14 Jul 2023 09:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A1110E841
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYdkUy7YtMZ1V0RLhFViyKslNVvdKchALCzcXVNhm9K0/zaYYOxQAqQzRpTbrgilfZESgbH6N+g27rHKoaIa1SphGiDf8kE14aiFq1v0o1yiVWgBbCVVGyIPJbco/9sg349Zp3SpMtbYuCu5Rep3+B+sktuv9Och/skK6w+1PD5CyED5zwOI09o4/tUBXbIkqDOEha3e8sgQNhYa5MTX7Azkaf4kluc5F/qZFdqkb9b8hu+CtGAzv0bxoAphE859l+TYfXilg4W1CBgXrwMeNFRfApC/vBpOqONHmjtFD9GXfOOo7PSwS0QYVzhYh+CEVFJyzomZMaNe9dxndkHi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MauXFySEbFdkNrxVYg2EOUv869FokCFjbr6Qs069u0=;
 b=ibYk4piF/PYKX1T99taian03uMeARnG7knxRdxeBDe94C9wxKc859Pb7veqGsljo1LrdhBdJFbnuGonSnjjyIVyf4dfdBLkTYy6ia+0eKNTjteFPPJ+BTQ0q0q/9aEq5aXyjeEkMDQrslqHLV2JCLjQOMVwGdWLqcYqcjQDqPR1ckqbBl5+xP/rXWdzIZgY0W/+uMGARj1UjU1J9nG8P/yucTqQ2MRfhLJ8lTt4TzdDd/LTrordkHFQ3azYneKdCpqn0tpyW4b/2W8y9ycBgtynDendzpIfJTQdUDIScGxZe9MOn0cxbHRSzxf4fa4DQ4mQgmpaS2lyNLMSN6Ddc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MauXFySEbFdkNrxVYg2EOUv869FokCFjbr6Qs069u0=;
 b=ARSHMwlTcIw52tHEQUcwP676SJnIhgAjLPFT7Hav1GN/bv+52dTN47M8vpHBj49M+yb/CxNpFLriRHYvsX4AnmSt4f689prxxPKmu/igqtuFrdoazik3LREyaeo4WuzECui9MY6gmbYAgiWDCxgaNXfMt24x7eUKauhu+Pmhp5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 09:47:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 09:47:58 +0000
Message-ID: <1c9e3c2b-a2bd-e465-809c-0e57ca61f40d@amd.com>
Date: Fri, 14 Jul 2023 11:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/scheduler: Add more documentation
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-1-c567249709f7@asahilina.net>
 <332e031c-c04e-998c-e401-685c817ea2a1@amd.com>
 <6ba6827b-ab2b-1c03-2c72-eb3f6da7e719@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6ba6827b-ab2b-1c03-2c72-eb3f6da7e719@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: a9271636-8e8e-4669-606d-08db844f67f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01FsplJ0hBRfZhTvvpsbSzVKmw5T60Jbe7DjmgN5Wly+/TsQfY/CM/hmapt1ZHbHehoLJZglkOyXaRqwFrskYVElGFNtfhJxuo9SsOTw4hYv0LhXwtbSgLcrzhkKuuNe5ctmpXQKpDnh8Po6Y+Vv3V9qQA5kGPjjTBgUN3W5iGjz0NR57Qag2w9kDTwItYY42P1rtEZHkOBGnl+P1ds9EW2aNRLZmrjw/dghQ0BywQVX7J9aOXKIU4LHmcVm7wx0zVc0StlIfaGxyyBeb5hHEiffiiQMA6HE29d6qc3GrR7tKd5UYXvgv2nI2dUZWwKTL5+sOCm4hvpYSZL/Ho934bGhoAJuzXNdeDiUnPBz8Td0W2+yMnDWRs4z1Xq9Yub+HqB21Mi8fLGoDuC+x2um3D0MKIfg3EA5pNuVgdzVY8QNLYPEOhnH2MsL3jZUMGgs3fdBNpFdUhPMqbvgjw1cb78SeXodv7WbQU2Nuxogk9s7m6n3InCVocLdwG4RxriWTVnidHf7UhK3ESQ+vghvHJAeOb65Ma30h+tpNVmCXBfkrMhv0R1YM2yJelhAo+oc+2aUDwAlDc+z1BbDC58gDYmq9aLxPpcYB7nvdjOpV7oZ1XzpaDxetEy84yUG3oA/q6up1ZUOBqu9h3PKeclJ8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(110136005)(41300700001)(54906003)(66476007)(7416002)(4326008)(66946007)(66556008)(31686004)(478600001)(5660300002)(2906002)(316002)(8936002)(8676002)(6666004)(6486002)(6512007)(86362001)(6506007)(31696002)(66574015)(186003)(83380400001)(36756003)(2616005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGFWSWE2dFJQWlpvNFJNR3dpL25LMEhBTWd1Uk56aVVjcTBtNzlmNjVWemtv?=
 =?utf-8?B?UnBsaG5qcXNkZ3k1N3czcngzWDNhQWI3c3FRbGVrdWN3VzhjYWE0c25nWDhT?=
 =?utf-8?B?N1NTYnBhSW1WTDE1QzB4cHZkdnhKNE5GN0JwWnJlMm5KWGluRE9KSEhaL0Ra?=
 =?utf-8?B?a2x1S096VCtvaTZIZTlpU2k3aUVmNmdYckFLbjZ0TUs5VVB1cWVxQTRhM3Ju?=
 =?utf-8?B?R2pYMEhrMEt1WFRHR2JXODJGQW5CeWE4ZTFuRkEvK3JodW93amhBeHRRMkdH?=
 =?utf-8?B?Tlk2ZlAyZWQzamJiTXhGUFhMeEpJRlZvWnp0Tks5REVJSlNWQWlsV0tsUVBt?=
 =?utf-8?B?UDRvTHgzd2xjUFozV2RsTm55ZkhjRm1jR0VLZzVSRFN5bnVzTnMxNjRZTTdu?=
 =?utf-8?B?VWJMeTBRSGo4TEN1ZWRqUmhoQjhKUWlZUGluOG9qdXFjR1BuWlQvYUtlbUZK?=
 =?utf-8?B?VTZyWGRXRGtlWkxlTlkvVElTWGxmbFZLc3ZrQ0dBSHJNQUo5UmtJd1p5OEV4?=
 =?utf-8?B?SWRlVDh0bnVVai9kMTZsWFFRM3dlaE4vNlhieEIxeVRmcUQvSkR1ZmdVS1k4?=
 =?utf-8?B?djZscGFWa1lncXVOc3lPTkpQVkdyZzBFWENwSHQwMzUyS2VQbVVURG9ySk1G?=
 =?utf-8?B?OU5EbzlPaGFaeFpWTU9uTXdaT0ErcThMMUJ2SisvQzNGNG1SYy9YbUp2MVlH?=
 =?utf-8?B?WHhtNlV5eFloYmFDU2ZqTGZpMmk1R0ZSRGszdlJ5dGt2UVJPQjJLQmlSNWtm?=
 =?utf-8?B?eTZhQnFEYlJJdFFYaUNsdEFpdmpURW5TbVYzNkRRYU16bDByVjdXVkcySzB0?=
 =?utf-8?B?U0YwSEJYZmRhUC8vKzAzSEdwZ2JmMnVHcVZMQ2VNZzJ0ZlpMbGlIbG5SYTJx?=
 =?utf-8?B?TmlOZEVWNVU0dGN1ekMyZVpLQU5weTVJaTIrS0lWZnZ5NlFpeEpJaysrMTdn?=
 =?utf-8?B?Mmp3SlZWbVNqcW1qZ0Z0QVJWa0R4Z2xtb01uRDVad2N0ZXRCZ2FSdUhIZTlC?=
 =?utf-8?B?cmlJQytHbUVvM0pZWVdGanNEUnVRYkExdHF4YWIxY1FCbHpmWDl5MmVMQm9x?=
 =?utf-8?B?bXhDa2N0RmNnOS9rdG8weHhyK3VPQnpVU0FuWUx4WHJEWGlXZmhzUGYrUzMx?=
 =?utf-8?B?ODExUGtLSjY3b0M1UWJEZHFzbVA2VVU4cFFsNldKaThPRzI4a2huemF2djZp?=
 =?utf-8?B?WVRwQlp2V0RoQlREamdhSXlIcUtZMjA5Zm9ra1JOSXNDN1V1Y25CUG92cVFL?=
 =?utf-8?B?U0MvSlA5Ky91emZDTjJ6cVc0dEdnTm55eVk3WVpSM1Nwei9HUk0yM3ZBUVVX?=
 =?utf-8?B?azF2L1pYOUNEWE5pSWtjVFRzanpwS2xtSTgzRnNrWXBMQ2dkRlE0Ky9mazlk?=
 =?utf-8?B?U0U3cTBHU2VxQWk4YVFvQkV2QXhiekFwbVBsMTlKL01SUmZWM1J2bTlBKzV0?=
 =?utf-8?B?VjRaOTFDcnVCTWw0ckJlTkkyZFAzWEg0Um84YnE4Sk9iTUFVZTZLenBwVHMv?=
 =?utf-8?B?Z21DaS9hUFRibnAwM1RNdFZjU0JOYVJUTXd6bzk4ZWRub3lIQ2RIMC9kUFJC?=
 =?utf-8?B?b3JyNENvMVpLQlhKeEdGYy8waUFoRzlSV2Z3WHR4cnFIT3pxMmM2NVZFd3BV?=
 =?utf-8?B?blIvKzRXbEJuOThiU2lHaXNCb0dNTDI3ZHpCZnlXVUJRdCt6RDJnRmdKNzNp?=
 =?utf-8?B?eFNha3lHOTc1cnRPSjBNTEhpK1RMRnI3YnMxYmZ3dHRrQjZCdjZabisxS0tJ?=
 =?utf-8?B?K0ZNL1hEWlJham5hNFI4cE9RWGJmUG9McmJIZDBIRVpHL0ZEbTNnK3B5MHc5?=
 =?utf-8?B?bnNSNVVQZ0ozUWxGWGhCWDBqU0xNL0VhMHI2U0xWemF4YnROL09mQ3B2Y3hh?=
 =?utf-8?B?TVNPcHVMZ05vNXUwY29lYWZEa2Qxa09LbFBJK1hUeUtmNkVDdGJSalN1RVBN?=
 =?utf-8?B?QWFpOWJUY01jaXA5SnFlK0lLRlQ0SVpRckV1YVNQUEorSm1DQXU5ZFB1VTlt?=
 =?utf-8?B?VGV3SmU5Z1N2TUordzhUOWJtM0RlaDdWMml1eVVPWVMxNkNSaFRQVnIzVHNO?=
 =?utf-8?B?QWN1OERBc3RJOW9xTE5IUkUzNnlZb2RmWDhadTE2VnlKTVZPSEdqaGs3OFEz?=
 =?utf-8?B?TGgrMFRidExqM1RXekhrckt0ZHFaQ0FkNGJLSktFTDFCbkJBcXFmcVEzQmVX?=
 =?utf-8?Q?dhIGT+xW8oDtNqkrhLO+MmJquXp3wTnXeTCLOS3LvaJQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9271636-8e8e-4669-606d-08db844f67f0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:47:58.6652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xK1Utk+9nYc5RTWLndyJPpIDw1rPyfp1Dbag/GgCppCLQ3wDnkkyroXaqbhcIkiv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.23 um 11:39 schrieb Asahi Lina:
> On 14/07/2023 17.40, Christian König wrote:
>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>> Document the implied lifetime rules of the scheduler (or at least the
>>> intended ones), as well as the expectations of how resource acquisition
>>> should be handled.
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 58 
>>> ++++++++++++++++++++++++++++++++--
>>>    1 file changed, 55 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 7b2bfc10c1a5..1f3bc3606239 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -43,9 +43,61 @@
>>>     *
>>>     * The jobs in a entity are always scheduled in the order that 
>>> they were pushed.
>>>     *
>>> - * Note that once a job was taken from the entities queue and 
>>> pushed to the
>>> - * hardware, i.e. the pending queue, the entity must not be 
>>> referenced anymore
>>> - * through the jobs entity pointer.
>>> + * Lifetime rules
>>> + * --------------
>>> + *
>>> + * Getting object lifetimes right across the stack is critical to 
>>> avoid UAF
>>> + * issues. The DRM scheduler has the following lifetime rules:
>>> + *
>>> + * - The scheduler must outlive all of its entities.
>>> + * - Jobs pushed to the scheduler are owned by it, and must only be 
>>> freed
>>> + *   after the free_job() callback is called.
>>> + * - Scheduler fences are reference-counted and may outlive the 
>>> scheduler.
>>
>>> + * - The scheduler *may* be destroyed while jobs are still in flight.
>>
>> That's not correct. The scheduler can only be destroyed after all the
>> entities serving it have been destroyed as well as all the jobs already
>> pushed to the hw finished.
>
> The point of this series is to change this behavior so I can actually 
> use the scheduler in my use case, and that begins with formally 
> documenting it as Daniel suggested. That is, I need it to be safe for 
> jobs to not be yet complete before the scheduler is destroyed (the 
> entities do get destroyed first, that's the first bullet point).

Yeah, but you need to document the current situation not how you like it 
to be.

Extending that comes when the functionality for this is implemented.

>
> We already had this discussion. Without this guarantee, I cannot build 
> a reasonable safe Rust abstraction. Unless you have another 
> suggestion, as far as I can tell it's either this or I give up on 
> using the DRM scheduler entirely and reimplement something else on my 
> own.
>
>> What might be possible to add is that the hw is still working on the
>> already pushed jobs, but so far that was rejected as undesirable.
>
> Where was this rejected?

Years ago. Our initial driver suspend/resume design relied on that. 
Turned out not to be a good idea

>
>>> + * - There is no guarantee that all jobs have been freed when all 
>>> entities
>>> + *   and the scheduled have been destroyed. Jobs may be freed 
>>> asynchronously
>>> + *   after this point.
>>> + * - Once a job is taken from the entity's queue and pushed to the 
>>> hardware,
>>> + *   i.e. the pending queue, the entity must not be referenced any 
>>> more
>>> + *   through the job's entity pointer. In other words, entities are 
>>> not
>>> + *   required to outlive job execution.
>>> + *
>>> + * If the scheduler is destroyed with jobs in flight, the following
>>> + * happens:
>>> + *
>>> + * - Jobs that were pushed but have not yet run will be destroyed 
>>> as part
>>> + *   of the entity cleanup (which must happen before the scheduler 
>>> itself
>>> + *   is destroyed, per the first rule above). This signals the job
>>> + *   finished fence with an error flag. This process runs 
>>> asynchronously
>>> + *   after drm_sched_entity_destroy() returns.
>>> + * - Jobs that are in-flight on the hardware are "detached" from their
>>> + *   driver fence (the fence returned from the run_job() callback). In
>>> + *   this case, it is up to the driver to ensure that any 
>>> bookkeeping or
>>> + *   internal data structures have separately managed lifetimes and 
>>> that
>>> + *   the hardware either cancels the jobs or runs them to completion.
>>> + *   The DRM scheduler itself will immediately signal the job complete
>>> + *   fence (with an error flag) and then call free_job() as part of 
>>> the
>>> + *   cleanup process.
>>> + *
>>> + * After the scheduler is destroyed, drivers *may* (but are not 
>>> required to)
>>> + * skip signaling their remaining driver fences, as long as they 
>>> have only ever
>>> + * been returned to the scheduler being destroyed as the return 
>>> value from
>>> + * run_job() and not passed anywhere else.
>>
>> This is an outright NAK to this. Fences must always be cleanly signaled.
>
> This is just documenting the fact that the DRM scheduler no longer 
> cares about the fences after it is destroyed. I can remove it from the 
> docs if you want, I don't rely on this behavior.
>
>> IIRC Daniel documented this as mandatory on the dma_fence behavior.
>
> Right, in the general case all dma_fences must be signaled, that's why 
> I explicitly said this only applies if the scheduler is the *only* 
> user of those fences.
>
> If you don't think this should be a guarantee the scheduler officially 
> makes, I'll remove it from the text.

Please drop that.

When you want to cancel fences already pushed to the hw then do so in 
the driver and signal that through the dma_fence error code.

What we can certainly add is a big warning in drm_sched_fini() when the 
hw hasn't finished it's processing.

Christian.

>
> ~~ Lina
>

