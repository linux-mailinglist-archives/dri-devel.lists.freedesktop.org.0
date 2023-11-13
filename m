Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AFA7E9D09
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDC510E09E;
	Mon, 13 Nov 2023 13:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855A910E09E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:21:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQxKwJCNTT6HH2go/wD/Ec2dDXD6gf8Tud1YOcQoiukGCyTSfQ2URlcb4uIEjKVZvHdUhddmPiU3qZK08a56Xvj8Grs6cXcuYVPWuppDqbeClteiwiZkEXSOywNk9wkp7rkAq60KUjChyiofMLRYtTe5N6R1oz3QCecu1AZDPl/yS+QIJxkv6j29T5qWZaFagngw+B0U+Zn17lcHtQDVYUFn6xOCXN02qJX4U+W1OcokDIE0IaqLr7VMoSQyd7k3kow2fYsgvldOrjmoNaAWGl1NLlpmBDaIpbkxmNiW8iZYq4bxL2gkHzZSzWB8KC8N8moSowb75EIwgCKtjThSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jg/IIh+baDaggOBux2pSzR8Rm4gGGN8z3kPq9frNm/c=;
 b=HkSuS+m+aQVabhoMWbhJdA02tZlG/9CT0Io4zm3yKnD/awyPqCQipa/ZG5j+hMtlpUwV+pX4LmnyVCPrVV7oxKzsCiNujuc/yZfXablcs1/fYPPp3o6fzirUo8OoHCx0+U0si9sSrNwfZIiy52gvAqq2byuh3rP1gWUZeT9jDs9+xfeRyxe/+X+sY35zXs+zs3E+Ky0Ya94OeELLtYubkKET63VJvKONaaRbCkl4L3bm8Lwi7ttNyDXoNUpBb5wPhch/Squ+G5pHyFZYYc9nAOw3wmwl/PnXvx7M7NWIpodAtT1mZ44M+698d36tWM6wgwIJFlvI3A55hyBY3q1kBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jg/IIh+baDaggOBux2pSzR8Rm4gGGN8z3kPq9frNm/c=;
 b=kvdZxf1WHcNbuMhRatxS5MM/p/Y7NZClWL5ZWIRk2QN+nxmMVAU3ZfuI9Tk8oNDrECqUR0434y9zYnWJF6+h1pLFoFpveJH8FEkrET5Cr04I+/AuGvqcDsmrmtgfOaUk/RqiVkzFra/towcZIu4BHX6OJeISYHTMtmE8ghfKQKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6059.namprd12.prod.outlook.com (2603:10b6:930:2c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 13:21:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 13:21:07 +0000
Message-ID: <dc7b9a4a-e823-420a-bff5-c4b2450b535a@amd.com>
Date: Mon, 13 Nov 2023 14:20:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: improve GPU scheduler documentation
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, ltuikov89@gmail.com, dri-devel@lists.freedesktop.org,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexander.deucher@amd.com, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20231113123832.120710-1-christian.koenig@amd.com>
 <4be75380-eefc-4808-9cfb-8e3f2448ab90@redhat.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4be75380-eefc-4808-9cfb-8e3f2448ab90@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::12) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 7192d22c-390a-477b-a69a-08dbe44b6416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: srflonQzsXWlVgPQb7sWCZUzHnYMLjF5cQUakWt4HytAYcqUcIYBQ83bQWmwDi8MVq22UP5asfvrXUXXsoaeF4Btq4iBWxOcxp6zT6OVj14tcuBtK3YrYHzcx5TSy1H02W8TGQtzB5qXPGTLL+/F1qbqTZURoUREMA7c2XKjA9m3Wf5Y6POwpse3v8VWAqVt9BknrsaYSBofDChRxkKZlGLoVUdwxx3k+d6Zmp4JLY+EbRETEGL6hZEjH3I1NDeOgUFQAEh4xbJER8kWM5xQDahP9QD4umw/gPsZg15n4yMkJ2wtL3U7oyXtdvUNWlcDW1EjgOfQD7DHGpAnn+CIZkBqXD6EfV7Fs/MZhtbUBarm2D+YfrzNcmRFkEXJBi56H6mzJPsLumfBb1ee98X4IY+QA83+lj4Vl8NMvC2vjAmkfgCu+aIhnul8U5STggWzPGZVef+vFcg4xBSFQ3e2kdov0H/fEkDDuBrYSVH69HYHqcrpAEpaSZ32zTlHgaEhwECC1IX+qvFLU7jaOpTT77+gAy+/Bbadx7L5xIpB/XwQpJVDmGL3FWyk0Syw6yYpanaqxEdtlcAmBr0ROVLKRbmyVlGWLUhk1Ao8nApQZf10ZhE5NFkwi5DLCQvC01bDtAEHYAED7qVgBeUCypDGWfM3DfkWGYR57kd5X8ukAg8vMIAwAZyIhom6AOk+R9E9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(1800799009)(64100799003)(186009)(451199024)(26005)(2616005)(66574015)(53546011)(6506007)(6666004)(6512007)(83380400001)(5660300002)(8676002)(8936002)(41300700001)(30864003)(2906002)(6486002)(478600001)(316002)(110136005)(66476007)(66556008)(66946007)(36756003)(31696002)(86362001)(38100700002)(31686004)(66899024)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elJrN3lqTWRFallWa3dmVFJoTzgxZ3kxeDZIYXpxc1FNSVU5YWgvODNQUzFi?=
 =?utf-8?B?TmNSN3UrRVRQNG4zRDczZFBwcG9LV3Q1eTgrWVI2ZWQwcy9MWVhrcmo2alBT?=
 =?utf-8?B?T0NlSVRJZlhmQ3JyYUFkdkNpZ2xkM1pKbnZPa2ZsNnFUTUZwYWtTQzZKa2V5?=
 =?utf-8?B?eWNwSFkydllmRDBMcXJpMGJWRnhDT014bVQ3eUExRUQ1UmZqbjBZQ3ptQVVY?=
 =?utf-8?B?ckQyMnZVQ1B5WURtNVh5WWk1T2NEYjhHL0lBcHhPM1lqbEs3MHUxQllsNlIw?=
 =?utf-8?B?TGtTeHQyQkFLNWNmVExrZXJ1TENMdjJDeTVwcTV5OW9GQVdveG91WnJuN0hD?=
 =?utf-8?B?dno1d2o1dGRxcHNvY3ZqZWE4d2thNkZCL1JEY0N2Zk1VVE4zOG8zQ2k3Y1RS?=
 =?utf-8?B?aUpCWFpGU2lYU2hXbmpycmhua1paWUkxeUJid1FRSGZScFR3VHRxU21yQi8y?=
 =?utf-8?B?VVAwZUxuQmJuSE1Xc3N4T3BLQ0tvQm1KNDIrdU1IaHhCbnAxaDJ5eHpLbUJO?=
 =?utf-8?B?NUhMRHJ5endNY1lCYUU4WEY1ZThiSUg1S1gxT3ZMclhDWEFQdU9aajEwWnZx?=
 =?utf-8?B?eGJZVnpLdkcwYVJjbEdpVlEwdUg1VS9FQTlsVElhSXhiZUlJbDJYUTdtZXVu?=
 =?utf-8?B?aU5Vc3pPUFdGRGpLODIxN1lKQ0dFbGorTEwwR2VNczVmN0NwU2pUMWpCeDZw?=
 =?utf-8?B?eXVWZDgrYWVxc25UQTIvUStSWkJia0hMNWFielFxRjJiSWJqSWlyczYvNmlP?=
 =?utf-8?B?SWp4T296bkhJemhveFlPelFpM1k1UWE5K0dJbllUOFVqNFcwRVBGeXBTM0Q0?=
 =?utf-8?B?SG9oVFJ6VThoS1pNU3pJL1pLUTFLRTdIY00yRVZhOWpsTkZobU1DUVlsdVVT?=
 =?utf-8?B?eDVUMnQzcTVBWkJEYzRzVmVBYlJ6b2FTV0MwRldzZm9hRElEVENkc0pteEdF?=
 =?utf-8?B?WlpaclBNampUUWI2R3JlSVJHR2FCN0MvOXdRNzJRN2ZtTEpudmpGQVRyanNq?=
 =?utf-8?B?N2VrSGptZG9MS3Y4MUVmSGtGc3FYSWNKNUFEUEZOOW9QYWJNNjdqdi81WS85?=
 =?utf-8?B?WHpVSUMxSGNvMVB1T05RUGxzQU96UzFhdjU5THg0MnVIaVVGVGNUbmJOOWNl?=
 =?utf-8?B?YTBuNW5Ic2JROEYybVBNUGc3Z3RuRStKOEF5UTBveXlpUXVHaXcxNitGRWJh?=
 =?utf-8?B?YmlMRGtxcllCQkJnbXB2anBVYUJ2Qm1xYys1cHdsRjQrNTY5elhYNWZ0Z3dU?=
 =?utf-8?B?VVB0NTdJb2pBU0lqMlJCdkR5ek5qeUVXckQ4dFlqcittYVF2OHJnL1o5ZXVG?=
 =?utf-8?B?MklvVk1MWFgxbW4zajdOalZWTTJBUnZKcFh5WExrdC9jYWEvTCtRekIyRm5Z?=
 =?utf-8?B?OTZpV3N3ODVIdWIvbC9jRnR2NmdJZk12alRobkpzVndoTUlUbFRYZjd2ekZm?=
 =?utf-8?B?b0QvWkM3VUFZb0hTYjZ1MXNVNDBDOTlvakVvVGVPaGR0bnUvMHRBU1lXUGx1?=
 =?utf-8?B?N0lHNE5wVUZETVZIVU92UzZzcVhET2FQa2tESHRHWmlTWmFNb0QwNnppVWJ2?=
 =?utf-8?B?UG90bFNLNzV0UlVXdmpoRlNWMUovUmNuKzJBdTVWdnUrOW1za0JJVWR1M21r?=
 =?utf-8?B?czlPL0pjangrVnZsdFA0L1NXbVppcERlblFPcDFKSjJ6S3UyaXBicEgwaU5J?=
 =?utf-8?B?eTdXaDNmRDU4eUtNVlJEaVIrWDRXcVRXT3dwTDU2dHZTK1Q1aFlwT2liUmtK?=
 =?utf-8?B?Qm5HaTgvOUFBT3FoQXhibzlsR0VmYnNpZGlFN2tNQ2Jac2psZVBJbWJtOElO?=
 =?utf-8?B?aEdwd1hSbEgzOG9UUnIvR21CNlI1aW1nMnBCZHkzdWhTSXZ4STUxNGNQRkFo?=
 =?utf-8?B?Nm9pM2pmWm8wcmdLSXVPVjhLZjZSVUgvQTNNS21kajdjMDBXR3pPbnZGZWRZ?=
 =?utf-8?B?cFNGTVFOV3RrZXpFazlvTE93YS9mQWVXR1pLaDNPNDJJV0drUkFJUnFWZUZq?=
 =?utf-8?B?NWxJN01pTGxxUkVMUitwUDlIWllRcVZ3MGhDM0FCdlZkTVVBN3BQRFVBSTlS?=
 =?utf-8?B?Q0haVEx5ajJjOS9RWnZ5NndUSEViazFhRFRVbDkvOEdUM01iandOUnhWS3BI?=
 =?utf-8?Q?o7Yk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7192d22c-390a-477b-a69a-08dbe44b6416
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:21:07.3095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw2fEPKC1GrKC2TywNnahOLyBDn8BsDrjgimQup1ju4sUqj5Wm0uBI6sJ/Mc91f/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6059
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

Am 13.11.23 um 14:14 schrieb Danilo Krummrich:
> Hi Christian,
>
> On 11/13/23 13:38, Christian König wrote:
>> Start to improve the scheduler document. Especially document the
>> lifetime of each of the objects as well as the restrictions around
>> DMA-fence handling and userspace compatibility.
>
> Thanks a lot for submitting this - it's very much appreciated!
>
> Before reviewing in detail, do you mind to re-structure this a little bit?

Not the slightest. I'm not a native speaker of English and generally not 
very good at writing documentation.

> Instead
> of packing everything in an enumeration I'd suggest to have separate 
> DOC paragraphs.
>
> For instance:
>
> - keep "Overview" to introduce the overall idea and basic structures 
> of the component
> - a paragraph for each of those basic structures (drm_gpu_scheduler, 
> drm_sched_entity,
>   drm_sched_fence) explaining their purpose and lifetime
> - a paragraph about the pitfalls dealing with DMA fences
> - a paragraph about the pitfalls of the driver callbacks (although 
> this might highly
>   intersect with the previous suggested one)
>
> I feel like this would be much easier to read.

Going to give that a try.

>
> Besides that, which covers the conceptual side of things, I think we 
> also need to
> improve the documentation on what the scheduler implementation expects 
> from drivers,
> e.g. zero initialize structures, valid initialization parameters for 
> typical use cases,
> etc. However, that's for a separate patch.

Yeah, each individual function should have kerneldoc attached to it.

I think we should also try to deprecate more of the hacks AMD came up. 
Especially the error and GPU reset handling is more than messed up.

Regards,
Christian.

>
> - Danilo
>
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 126 ++++++++++++++++++++-----
>>   1 file changed, 104 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 506371c42745..36a7c5dc852d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -24,28 +24,110 @@
>>   /**
>>    * DOC: Overview
>>    *
>> - * The GPU scheduler provides entities which allow userspace to push 
>> jobs
>> - * into software queues which are then scheduled on a hardware run 
>> queue.
>> - * The software queues have a priority among them. The scheduler 
>> selects the entities
>> - * from the run queue using a FIFO. The scheduler provides 
>> dependency handling
>> - * features among jobs. The driver is supposed to provide callback 
>> functions for
>> - * backend operations to the scheduler like submitting a job to 
>> hardware run queue,
>> - * returning the dependencies of a job etc.
>> - *
>> - * The organisation of the scheduler is the following:
>> - *
>> - * 1. Each hw run queue has one scheduler
>> - * 2. Each scheduler has multiple run queues with different priorities
>> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
>> - * 3. Each scheduler run queue has a queue of entities to schedule
>> - * 4. Entities themselves maintain a queue of jobs that will be 
>> scheduled on
>> - *    the hardware.
>> - *
>> - * The jobs in a entity are always scheduled in the order that they 
>> were pushed.
>> - *
>> - * Note that once a job was taken from the entities queue and pushed 
>> to the
>> - * hardware, i.e. the pending queue, the entity must not be 
>> referenced anymore
>> - * through the jobs entity pointer.
>> + * The GPU scheduler implements some logic to decide which command 
>> submission
>> + * to push next to the hardware. Another major use case for the GPU 
>> scheduler
>> + * is to enforce correct driver behavior around those command 
>> submission.
>> + * Because of this it's also used by drivers which don't need the 
>> actual
>> + * scheduling functionality.
>> + *
>> + * To fulfill this task the GPU scheduler uses of the following 
>> objects:
>> + *
>> + * 1. The job object which contains a bunch of dependencies in the 
>> form of
>> + *    DMA-fence objects. Drivers can also implement an optional 
>> prepare_job
>> + *    callback which returns additional dependencies as DMA-fence 
>> objects.
>> + *    It's important to note that this callback must follow the 
>> DMA-fence rules,
>> + *    so it can't easily allocate memory or grab locks under which 
>> memory is
>> + *    allocated. Drivers should use this as base class for an object 
>> which
>> + *    contains the necessary state to push the command submission to 
>> the
>> + *    hardware.
>> + *
>> + *    The lifetime of the job object should at least be from pushing 
>> it into the
>> + *    scheduler until the scheduler notes through the free callback 
>> that a job
>> + *    isn't needed any more. Drivers can of course keep their job 
>> object alive
>> + *    longer than that, but that's outside of the scope of the 
>> scheduler
>> + *    component. Job initialization is split into two parts,
>> + *    drm_sched_job_init() and drm_sched_job_arm(). It's important 
>> to note that
>> + *    after arming a job drivers must follow the DMA-fence rules and 
>> can't
>> + *    easily allocate memory or takes locks under which memory is 
>> allocated.
>> + *
>> + * 2. The entity object which is a container for jobs which should 
>> execute
>> + *    sequentially. Drivers should create an entity for each 
>> individual context
>> + *    they maintain for command submissions which can run in parallel.
>> + *
>> + *    The lifetime of the entity should *not* exceed the lifetime of 
>> the
>> + *    userspace process it was created for and drivers should call the
>> + *    drm_sched_entity_flush() function from their 
>> file_operations.flush
>> + *    callback. Background is that for compatibility reasons with 
>> existing
>> + *    userspace all results of a command submission should become 
>> visible
>> + *    externally even after after a process exits. The only 
>> exception to that
>> + *    is when the process is actively killed by a SIGKILL. In this 
>> case the
>> + *    entity object makes sure that jobs are freed without running 
>> them while
>> + *    still maintaining correct sequential order for signaling 
>> fences. So it's
>> + *    possible that an entity object is not alive any more while 
>> jobs from it
>> + *    are still running on the hardware.
>> + *
>> + * 3. The hardware fence object which is a DMA-fence provided by the 
>> driver as
>> + *    result of running jobs. Drivers need to make sure that the normal
>> + *    DMA-fence semantics are followed for this object. It's 
>> important to note
>> + *    that the memory for this object can *not* be allocated in the 
>> run_job
>> + *    callback since that would violate the requirements for the 
>> DMA-fence
>> + *    implementation. The scheduler maintains a timeout handler 
>> which triggers
>> + *    if this fence doesn't signal in a configurable time frame.
>> + *
>> + *    The lifetime of this object follows DMA-fence ref-counting 
>> rules, the
>> + *    scheduler takes ownership of the reference returned by the 
>> driver and
>> + *    drops it when it's not needed any more. Errors should also be 
>> signaled
>> + *    through the hardware fence and are bubbled up back to the 
>> scheduler fence
>> + *    and entity.
>> + *
>> + * 4. The scheduler fence object which encapsulates the whole time 
>> from pushing
>> + *    the job into the scheduler until the hardware has finished 
>> processing it.
>> + *    This is internally managed by the scheduler, but drivers can grab
>> + *    additional reference to it after arming a job. The implementation
>> + *    provides DMA-fence interfaces for signaling both scheduling of 
>> a command
>> + *    submission as well as finishing of processing.
>> + *
>> + *    The lifetime of this object also follows normal DMA-fence 
>> ref-counting
>> + *    rules. The finished fence is the one normally exposed outside 
>> of the
>> + *    scheduler, but the driver can grab references to both the 
>> scheduled as
>> + *    well as the finished fence when needed for pipe-lining 
>> optimizations.
>> + *
>> + * 5. The run queue object which is a container of entities for a 
>> certain
>> + *    priority level. The lifetime of those objects are bound to the 
>> scheduler
>> + *    lifetime.
>> + *
>> + *    This is internally managed by the scheduler and drivers 
>> shouldn't touch
>> + *    them directly.
>> + *
>> + * 6. The scheduler object itself which does the actual work of 
>> selecting a job
>> + *    and pushing it to the hardware. Both FIFO and RR selection 
>> algorithm are
>> + *    supported, but FIFO is preferred for many use cases.
>> + *
>> + *    The lifetime of this object is managed by the driver using it. 
>> Before
>> + *    destroying the scheduler the driver must ensure that all hardware
>> + *    processing involving this scheduler object has finished by 
>> calling for
>> + *    example disable_irq(). It is *not* sufficient to wait for the 
>> hardware
>> + *    fence here since this doesn't guarantee that all callback 
>> processing has
>> + *    finished.
>> + *
>> + * All callbacks the driver needs to implement are restricted by 
>> DMA-fence
>> + * signaling rules to guarantee deadlock free forward progress. This 
>> especially
>> + * means that for normal operation no memory can be allocated. All 
>> memory which
>> + * is needed for pushing the job to the hardware must be allocated 
>> before
>> + * arming a job. It also means that no locks can be taken under 
>> which memory
>> + * might be allocated as well.
>> + *
>> + * Memory which is optional to allocate for device core dumping or 
>> debugging
>> + * *must* be allocated with GFP_NOWAIT and appropriate error 
>> handling taking if
>> + * that allocation fails. GFP_ATOMIC should only be used if absolutely
>> + * necessary since dipping into the special atomic reserves is 
>> usually not
>> + * justified for a GPU driver.
>> + *
>> + * The scheduler also used to provided functionality for 
>> re-submitting jobs
>> + * with replacing the hardware fence during reset handling. This 
>> functionality
>> + * is now marked as deprecated since this has proven to be 
>> fundamentally racy
>> + * and not compatible with DMA-fence rules and shouldn't be used in 
>> any new
>> + * code.
>>    */
>>     #include <linux/kthread.h>
>

