Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E65118E1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB8110EB58;
	Wed, 27 Apr 2022 14:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9710E99F;
 Wed, 27 Apr 2022 14:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fREj9gyHShKcsvWmS8tNblqI15Sv0e74QRx9TArYKwc+fWWdbkWYQschDUnjsZHW69+CLeIMB8/4VDb2GH7xo8boazWHzqjbrjQu3lEfVDFn2RATHhcRo+KP0rBTqCVx9w4bTFpKOu46YknjLcpJ6s8Q6CPx1ICsOMpw0dI2Czz9/JIEWy+IIupI7GjNY7QM8qnQYQhIktgYsoWWqHodxJ+p3Km3LDhjKnjXE9+vl4m0UwSUA9SO7LwX+rJ34jUQNgPTo4x36fa8CgBsoZZJpgt0dZ+ubdKnei0WNf7JElMPkWmdf5elm5LEz/Kt5iUQAYKF+buvlYswRHOrs83OIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiEe3dyHlO1djh7s7oMZkqGgAHaVKx+Kx2nYSLzrwlQ=;
 b=MP61AbkHETkdSL24NWKSY+SUt1PuPfYDGaFTqHZ/SGCkke+6iSUCPp2SPURmjQPfPKnyFkc+VpvSRiRF5n/IHD4fZRJqUuH8itLVPN61Y4kmoX/ZMeE8cTq+Zn0K9FfxB1ouCRfqoZdx6bkKq+T+Qoh4PTQP4UEaPl4s5QPpB4s2g7CvflvCvxD9THRozSYgGbcf8SdbhKZaajIqSMA7QWST+BZSIhj0sBk9au+mnmXyKVukv9dPNdvP3058fsaFEkrSbU86V+/eKuBiaJ39AcD53vE4hly0YGhvPhsM3XbAIIMnNjzByToTIMHMAl+ZvFbgRZn/QS/qeUSiZtycww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiEe3dyHlO1djh7s7oMZkqGgAHaVKx+Kx2nYSLzrwlQ=;
 b=wD+LwhclQQzPbXQz5ju0pptQmopp56F/Y6lZmewB8tjE3kwv+G0RUHodXofN2BRgmxhlLq1bKcqBg12qAB+6SGgbHj6P6jJd7qo8U3lw1aUJvKS3Rd4n0V28GrwI0M7vKI7dHA0aKPFdTPyVONJ4qKUkJTy4GgoWk+FnF769olw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CH0PR12MB5153.namprd12.prod.outlook.com (2603:10b6:610:b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 14:43:34 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 14:43:33 +0000
Content-Type: multipart/alternative;
 boundary="------------0jCVxokiYreNePCQmGLNIrCr"
Message-ID: <65b6cc23-1a77-7df0-5768-f81cd03b6514@amd.com>
Date: Wed, 27 Apr 2022 10:43:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gpu: drm: remove redundant dma_fence_put() when
 drm_sched_job_add_dependency() fails
Content-Language: en-US
To: Hangyu Hua <hbh25y@gmail.com>, yuq825@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220425083645.25922-1-hbh25y@gmail.com>
 <b7d8956e-5ac6-8200-d8b1-4ce828f04665@amd.com>
 <79b198d0-eff2-d658-4b5e-9084a834fc93@gmail.com>
 <e26e6ef8-6665-0b9d-804f-cf107f1788d4@amd.com>
 <88dd5d67-7dd5-2f58-5254-adaa941deb0f@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <88dd5d67-7dd5-2f58-5254-adaa941deb0f@gmail.com>
X-ClientProxiedBy: YT3PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::15) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e99d1d0e-64b3-4595-042a-08da285c4dd4
X-MS-TrafficTypeDiagnostic: CH0PR12MB5153:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB515361A51126914E163061B7EAFA9@CH0PR12MB5153.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7k8jRKDtkkKEQJyUeSCeMTLEKfBsdZOlW2xkLCqH63hMURntrb130j7oVzpvgCdgfHKavct1ZRwzd/2eXs43ZvLbVHKShA01QXk5GXcjXRnWDInLi7/y+SaU01Dr04yB2tsriTo3Sn2hEiOc0qTNWwHUoRZcOo5eMpxVgFk4VlNU+zTnG6mbMvXl9XlsZlmjV2qKOPTA3rDE4pLrSf9NVNKQcX0XhrMHfXQsbDQPftFhK865FhN762j5mNjrVFs3oUX53KyRW/QBGDP/kNEEhyRUkLEjfc+Evp1LhaEoe3gNkjUDsLPEFHeiRHwmJQ0VhKCU/bQqVgA9EtnVgxiCoFJTJHxWIM0seSAP8kdoXjUO/ucBYFU9w/mRA/IOiXVyM1f5KM5m/M86QTlGWTHr+qAxcZF6bJZQnnNZpCdbEU+68hfihbBJz1bdxN0GYCreJep8uWeH9Hp6aWNJ0MiCX88xL5iNIuo63jWQ6REG/ARkVy8dQWM8Hdv+tZKJienP9Oc5Nt3VR5jfn7fUnDYJeEwn+iwZiBOIsKOgP2qUZbi8Gmw3g5AwYefEQq2haKqfkiF+K+jBI8EEp6Nk/YxQACpt7T8ikJLnELfkurl7TcFIWfuEhYUXIH9xe4AwR8oEtFr76quoP48qsNRtKkvqy2CQd4ad9m0H13noAj0Vg2nksamO7c945VlOip9fQ+OVlpDmFOqxGrElu7F8iwKWL3XW1eNjk+kkYP2TwsBj/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(83380400001)(86362001)(31696002)(66556008)(53546011)(8676002)(66476007)(44832011)(316002)(2906002)(38100700002)(2616005)(186003)(5660300002)(4326008)(8936002)(36756003)(31686004)(6506007)(508600001)(6486002)(33964004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRCa1dkdm1kYzgwYkZOSDEvYUZEanl6TytCbGVUdWo1dC81blZsbndxTk5O?=
 =?utf-8?B?VUJVbWo1ZHNSeXY1enlrWTZ5ZzB3K1d3TStoL2JjdVZTcHdlZUN2d2UwVm9S?=
 =?utf-8?B?N000WW1WMGVuV3dWK3dvWFd0UE9SN3FOWjNiTThJaE5DMzRKRXQ5aVNjRTls?=
 =?utf-8?B?elpMMVZnQzZiaTVoZHJTcFFvV3lWeUFHek4xZGk1ZFZtT3M1czloSTRxaGxT?=
 =?utf-8?B?MWpyOVhxS05oZ2NtbU9nZVZ1cnYwOUQrWXVjTDNZRjhpNWY5WGtqRkd1a0d2?=
 =?utf-8?B?UjBrRUorL3ZqaE9KK1EwRDh4emRnb0hid21lSUlEUkhqUm1iSlBoczFScGJL?=
 =?utf-8?B?QXZXNEVYNXIrN2plamJFai9IeU1MWFVMcmZ5K2Z4SFF4NnFkamFFcEFDYm1B?=
 =?utf-8?B?a25Na2VUM3l2bjBXZ01jT3BMeDd2YmxzekYySTdYNzdTZk1EaW1nSEZjWDVI?=
 =?utf-8?B?NE5CWnVwQmsyWEVBdkMvTk5XTE5kRDMyOXpoSzRuQ1FqTlk2VTQ1eDJvNXhN?=
 =?utf-8?B?cVdLUTY1VjNabmxaaWxPNk1DZHc0V2RQN1ZQL1hzcFJlWklBcHQwSFBOMytW?=
 =?utf-8?B?V053SE91YnRhS2xLc0oreUJIdk9PWWsySXUxSjZDNlhxYkcwajJiUVQyaXlM?=
 =?utf-8?B?dWhKeGdDcHlEZGlRbDhXK2VrRkx3R1dJTTRFRnFJSS83bWhMWWJZMnUwTGlK?=
 =?utf-8?B?cHZOWnRKa3dWZmcreCttNVpvQUpZTVM2Sm5jWTZBK0hxNmx3NW1VZ0V2cHdl?=
 =?utf-8?B?TlUxV0pGUXNNQnd3NW1vcU51WVhFL21HeGZPRzYzczh3SHdkaHdBZVB1N21m?=
 =?utf-8?B?aXNnUUlIRUNqTzNSWkNUdGplcUJNcTFHQmxZVDM1Y3llKzlHNENEajdlZDFt?=
 =?utf-8?B?Nzh2akJWRW9VbUZwTm9iVWpaQWMzLzk1SjViTGxuNEtCK3RFUFJPVytaUzNx?=
 =?utf-8?B?WUlEYXIyS25qQi9vcU9NSmliL0V5bmJINmx4cGlUZWxmLzhha0NKQTZadTFF?=
 =?utf-8?B?NmZ0SW1qZG9kaVAxbjR4ckI3eDhuZEU3TmgrS3FOeGJBRUpORE9sL1Jwd2J2?=
 =?utf-8?B?enJ5Wmxja0tSRjJOeDVGdDgzMnlxQWw4ZlQ3NjQzWWFIb01rVmhpcDc1QTE1?=
 =?utf-8?B?MkZ5MEdLZGJ2TTVVUHVSR29telkyZTVHS0lXQ2dyUTBadXhRWjE1ZXNGbjVh?=
 =?utf-8?B?YkpITDJVTVNocTAvMktMTXJwNkNCNkhLR3BhRkJqRDF0VkdhUndSb0Jsb1Fh?=
 =?utf-8?B?NkRLM0RrSmtiWTRaM0tkOStIVmdhcFoyVXhzelhKdUJoZTVEQWx6S29SYUJZ?=
 =?utf-8?B?cElOUnNQM1JFZjlqajFFMSs3VVFSY05rWDhvTFd6dStUeTk3SlBLWXNCb0RQ?=
 =?utf-8?B?ZlgvQjNITTlKWkRabGptUnFFdGtCNUZKeWoyWjJVcEk1dlRQczBIYWNEaVpE?=
 =?utf-8?B?OU4yU2c0R3ZQcjJvZEVOdzNWbm5iM0UrVlgrL3RWeDllSVU3N3lkZnUvWVl2?=
 =?utf-8?B?aXR2cEZLNXRiMGR6cUt3NXl5WUNySWJNYjNYcmlpUm5IYTBQK2d1SDdwRkps?=
 =?utf-8?B?Z0o1SU9MUWZFYmkwczJnN2JOc2F0RkxPRDVlelZCMWlJV2tKc1ZaMWhjc3g4?=
 =?utf-8?B?U3g2S2tsTG9GbFhJcS9RMUFTYVk2RWFPaWRTdEJNT3ZXQ0tIL1dZLzNPc2xv?=
 =?utf-8?B?eTRDR2tMZkxlWU43SHhhRXNoQjlBNVpGdU00WWs4eFdZWHpNQXFoS1JINjFs?=
 =?utf-8?B?aThSRnRqZDk0aE42QTlmK05IY3BpaXd6Ym1lcjZrYkRQYWdiT24yeXVtejRS?=
 =?utf-8?B?UDI3UWJVS0JSVWFDKzFSVURhY2NsbUtFaW9Ga0RUeFFnbFNVRUsyODZOVXBZ?=
 =?utf-8?B?eE04alNzeGp3OTNkMW55czVkRENSdDNueG51amVuZGloRmZwSlYwd0RZMFBF?=
 =?utf-8?B?a1hrTVQ3UlBzdUJBNHBaRGl0Vm1jVWhxOHRFMGx0UXN0UlNwRUFObmNzeGNC?=
 =?utf-8?B?UjlkeUd5ZzVVc3liU25oa0RVZ1A3N2lObnZSZmFISm11VTRuaGl3N3IwQVVi?=
 =?utf-8?B?ck95cEtMM0gvTDh0YWlobmI0NDh6ZTVXSDVPeDNRYzg2ZGJ0T3MySmVWL2lM?=
 =?utf-8?B?SkxnRmt4UkdLbTk4UFBnaHpjbklNeTIxc1RaYjZTL1J4NU5yR3VXL1QwaHpy?=
 =?utf-8?B?dG9Tcm1YYmc2R0FCUkhNSzVuWVhlUUk2NlZuZGxzeEQ0dFUxdSt3Q2JPQk12?=
 =?utf-8?B?UFFEODU0bTVRa2x4SXVZdVV0ZkFkajJ3NDBvWUY1Uzd5RjJKbWpZTHROcEQ2?=
 =?utf-8?B?bTgxd0VnMm03Umg4UlZNZ2dmZXR6NjllNERseEFMQ1UrdllkWk5pTmNteWtt?=
 =?utf-8?Q?5u0cGOVQWu0zL7p5azcr7SmtqQebVY0jrazZoBjkABTJC?=
X-MS-Exchange-AntiSpam-MessageData-1: sRmB+KG8A9CD9Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99d1d0e-64b3-4595-042a-08da285c4dd4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 14:43:33.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g29sC22wRYInw2nGZ3MmyVZ7/E0Jx4sJW0rJJPLMdIeBiKjnfUvuCJidGcRF3n6DEIHiySvgMOaPLQg/l9eMuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5153
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------0jCVxokiYreNePCQmGLNIrCr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022-04-26 22:31, Hangyu Hua wrote:
> On 2022/4/26 22:55, Andrey Grodzovsky wrote:
>>
>> On 2022-04-25 22:54, Hangyu Hua wrote:
>>> On 2022/4/25 23:42, Andrey Grodzovsky wrote:
>>>> On 2022-04-25 04:36, Hangyu Hua wrote:
>>>>
>>>>> When drm_sched_job_add_dependency() fails, dma_fence_put() will be 
>>>>> called
>>>>> internally. Calling it again after drm_sched_job_add_dependency() 
>>>>> finishes
>>>>> may result in a dangling pointer.
>>>>>
>>>>> Fix this by removing redundant dma_fence_put().
>>>>>
>>>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>>>> ---
>>>>>   drivers/gpu/drm/lima/lima_gem.c        | 1 -
>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>>>>>   2 files changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/lima/lima_gem.c 
>>>>> b/drivers/gpu/drm/lima/lima_gem.c
>>>>> index 55bb1ec3c4f7..99c8e7f6bb1c 100644
>>>>> --- a/drivers/gpu/drm/lima/lima_gem.c
>>>>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>>>>> @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file 
>>>>> *file, struct lima_submit *submit)
>>>>>           err = drm_sched_job_add_dependency(&submit->task->base, 
>>>>> fence);
>>>>>           if (err) {
>>>>> -            dma_fence_put(fence);
>>>>>               return err;
>>>>
>>>>
>>>> Makes sense here
>>>>
>>>>
>>>>>           }
>>>>>       }
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index b81fceb0b8a2..ebab9eca37a8 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -708,7 +708,6 @@ int 
>>>>> drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>>>           dma_fence_get(fence);
>>>>>           ret = drm_sched_job_add_dependency(job, fence);
>>>>>           if (ret) {
>>>>> -            dma_fence_put(fence);
>>>>
>>>>
>>>>
>>>> Not sure about this one since if you look at the relevant commits -
>>>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies' and
>>>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder'
>>>> You will see that the dma_fence_put here balances the extra 
>>>> dma_fence_get
>>>> above
>>>>
>>>> Andrey
>>>>
>>>
>>> I don't think so. I checked the call chain and found no additional 
>>> dma_fence_get(). But dma_fence_get() needs to be called before 
>>> drm_sched_job_add_dependency() to keep the counter balanced. 
>>
>>
>> I don't say there is an additional get, I just say that 
>> drm_sched_job_add_dependency doesn't grab an extra reference to the 
>> fences it stores so this needs to be done outside and for that
>> drm_sched_job_add_implicit_dependencies->dma_fence_get is called and, 
>> if this addition fails you just call dma_fence_put to keep the 
>> counter balanced.
>>
>
> drm_sched_job_add_implicit_dependencies() will call 
> drm_sched_job_add_dependency(). And drm_sched_job_add_dependency() 
> already call dma_fence_put() when it fails. Calling dma_fence_put() 
> twice doesn't make sense.
>
> dma_fence_get() is in [2]. But dma_fence_put() will be called in [1] 
> and [3] when xa_alloc() fails.


The way I see it, [2] and [3] are mat matching *get* and *put* 
respectively. [1] *put* is against the original 
dma_fence_init->kref_init of the fence which always set the refcount at 1.
Also in support of this see commit 'drm/scheduler: fix 
drm_sched_job_add_implicit_dependencies harder' - it says there 
"drm_sched_job_add_dependency() could drop the last ref"  - this last 
ref is the original refcount set by dma_fence_init->kref

Andrey


>
>
> int drm_sched_job_add_dependency(struct drm_sched_job *job,
>                  struct dma_fence *fence)
> {
>     ...
>     ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, 
> GFP_KERNEL);
>     if (ret != 0)
>         dma_fence_put(fence);    <--- [1]
>
>     return ret;
> }
> EXPORT_SYMBOL(drm_sched_job_add_dependency);
>
>
> int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>                         struct drm_gem_object *obj,
>                         bool write)
> {
>     struct dma_resv_iter cursor;
>     struct dma_fence *fence;
>     int ret;
>
>     dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>         /* Make sure to grab an additional ref on the added fence */
>         dma_fence_get(fence);    <--- [2]
>         ret = drm_sched_job_add_dependency(job, fence);
>         if (ret) {
>             dma_fence_put(fence);    <--- [3]
>             return ret;
>         }
>     }
>     return 0;
> }
>
>
>>
>>> On the other hand, dma_fence_get() and dma_fence_put() are 
>>> meaningless here if threre is an extra dma_fence_get() beacause 
>>> counter will not decrease to 0 during drm_sched_job_add_dependency().
>>>
>>> I check the call chain as follows:
>>>
>>> msm_ioctl_gem_submit()
>>> -> submit_fence_sync()
>>> -> drm_sched_job_add_implicit_dependencies()
>>
>>
>> Can you maybe trace or print one such example of problematic refcount 
>> that you are trying to fix ? I still don't see where is the problem.
>>
>> Andrey
>>
>
> I also wish I could. System logs can make this easy. But i don't have 
> a corresponding GPU physical device. 
> drm_sched_job_add_implicit_dependencies is only used in a few devices.
>
> Thanks.
>>
>>>
>>> Thanks,
>>> Hangyu
>>>
>>>>
>>>>>               return ret;
>>>>>           }
>>>>>       }
--------------0jCVxokiYreNePCQmGLNIrCr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-04-26 22:31, Hangyu Hua wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:88dd5d67-7dd5-2f58-5254-adaa941deb0f@gmail.com">On
      2022/4/26 22:55, Andrey Grodzovsky wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 2022-04-25 22:54, Hangyu Hua wrote:
        <br>
        <blockquote type="cite">On 2022/4/25 23:42, Andrey Grodzovsky
          wrote:
          <br>
          <blockquote type="cite">On 2022-04-25 04:36, Hangyu Hua wrote:
            <br>
            <br>
            <blockquote type="cite">When drm_sched_job_add_dependency()
              fails, dma_fence_put() will be called
              <br>
              internally. Calling it again after
              drm_sched_job_add_dependency() finishes
              <br>
              may result in a dangling pointer.
              <br>
              <br>
              Fix this by removing redundant dma_fence_put().
              <br>
              <br>
              Signed-off-by: Hangyu Hua <a class="moz-txt-link-rfc2396E" href="mailto:hbh25y@gmail.com">&lt;hbh25y@gmail.com&gt;</a>
              <br>
              ---
              <br>
              &nbsp; drivers/gpu/drm/lima/lima_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 -
              <br>
              &nbsp; drivers/gpu/drm/scheduler/sched_main.c | 1 -
              <br>
              &nbsp; 2 files changed, 2 deletions(-)
              <br>
              <br>
              diff --git a/drivers/gpu/drm/lima/lima_gem.c
              b/drivers/gpu/drm/lima/lima_gem.c
              <br>
              index 55bb1ec3c4f7..99c8e7f6bb1c 100644
              <br>
              --- a/drivers/gpu/drm/lima/lima_gem.c
              <br>
              +++ b/drivers/gpu/drm/lima/lima_gem.c
              <br>
              @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct
              drm_file *file, struct lima_submit *submit)
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =
              drm_sched_job_add_dependency(&amp;submit-&gt;task-&gt;base,
              fence);
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err) {
              <br>
              -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
              <br>
            </blockquote>
            <br>
            <br>
            Makes sense here
            <br>
            <br>
            <br>
            <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
              <br>
              diff --git a/drivers/gpu/drm/scheduler/sched_main.c
              b/drivers/gpu/drm/scheduler/sched_main.c
              <br>
              index b81fceb0b8a2..ebab9eca37a8 100644
              <br>
              --- a/drivers/gpu/drm/scheduler/sched_main.c
              <br>
              +++ b/drivers/gpu/drm/scheduler/sched_main.c
              <br>
              @@ -708,7 +708,6 @@ int
              drm_sched_job_add_implicit_dependencies(struct
              drm_sched_job *job,
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_get(fence);
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = drm_sched_job_add_dependency(job, fence);
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {
              <br>
              -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);
              <br>
            </blockquote>
            <br>
            <br>
            <br>
            Not sure about this one since if you look at the relevant
            commits -
            <br>
            'drm/scheduler: fix drm_sched_job_add_implicit_dependencies'
            and
            <br>
            'drm/scheduler: fix drm_sched_job_add_implicit_dependencies
            harder'
            <br>
            You will see that the dma_fence_put here balances the extra
            dma_fence_get
            <br>
            above
            <br>
            <br>
            Andrey
            <br>
            <br>
          </blockquote>
          <br>
          I don't think so. I checked the call chain and found no
          additional dma_fence_get(). But dma_fence_get() needs to be
          called before drm_sched_job_add_dependency() to keep the
          counter balanced. </blockquote>
        <br>
        <br>
        I don't say there is an additional get, I just say that
        drm_sched_job_add_dependency doesn't grab an extra reference to
        the fences it stores so this needs to be done outside and for
        that
        <br>
        drm_sched_job_add_implicit_dependencies-&gt;dma_fence_get is
        called and, if this addition fails you just call dma_fence_put
        to keep the counter balanced.
        <br>
        <br>
      </blockquote>
      <br>
      drm_sched_job_add_implicit_dependencies() will call
      drm_sched_job_add_dependency(). And drm_sched_job_add_dependency()
      already call dma_fence_put() when it fails. Calling
      dma_fence_put() twice doesn't make sense.
      <br>
      <br>
      dma_fence_get() is in [2]. But dma_fence_put() will be called in
      [1] and [3] when xa_alloc() fails.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>The way I see it, [2] and [3] are mat matching <b>get</b> and <b>put</b>
      respectively. [1] <b>put</b> is against the original
      dma_fence_init-&gt;kref_init of the fence which always set the
      refcount at 1.<br>
      Also in support of this see commit 'drm/scheduler: fix
      drm_sched_job_add_implicit_dependencies harder' - it says there
      &quot;drm_sched_job_add_dependency() could drop the last ref&quot;&nbsp; - this
      last ref is the original refcount set by dma_fence_init-&gt;kref <br>
    </p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:88dd5d67-7dd5-2f58-5254-adaa941deb0f@gmail.com">
      <br>
      <br>
      int drm_sched_job_add_dependency(struct drm_sched_job *job,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence)
      <br>
      {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;...
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;ret = xa_alloc(&amp;job-&gt;dependencies, &amp;id, fence,
      xa_limit_32b, GFP_KERNEL);
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;if (ret != 0)
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);&nbsp;&nbsp;&nbsp; &lt;--- [1]
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;return ret;
      <br>
      }
      <br>
      EXPORT_SYMBOL(drm_sched_job_add_dependency);
      <br>
      <br>
      <br>
      int drm_sched_job_add_implicit_dependencies(struct drm_sched_job
      *job,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *obj,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool write)
      <br>
      {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;struct dma_resv_iter cursor;
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;struct dma_fence *fence;
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;int ret;
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;dma_resv_for_each_fence(&amp;cursor, obj-&gt;resv, write,
      fence) {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Make sure to grab an additional ref on the added fence
      */
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_get(fence);&nbsp;&nbsp;&nbsp; &lt;--- [2]
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = drm_sched_job_add_dependency(job, fence);
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(fence);&nbsp;&nbsp;&nbsp; &lt;--- [3]
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;}
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;return 0;
      <br>
      }
      <br>
      <br>
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">On the other hand, dma_fence_get() and
          dma_fence_put() are meaningless here if threre is an extra
          dma_fence_get() beacause counter will not decrease to 0 during
          drm_sched_job_add_dependency().
          <br>
          <br>
          I check the call chain as follows:
          <br>
          <br>
          msm_ioctl_gem_submit()
          <br>
          -&gt; submit_fence_sync()
          <br>
          -&gt; drm_sched_job_add_implicit_dependencies()
          <br>
        </blockquote>
        <br>
        <br>
        Can you maybe trace or print one such example of problematic
        refcount that you are trying to fix ? I still don't see where is
        the problem.
        <br>
        <br>
        Andrey
        <br>
        <br>
      </blockquote>
      <br>
      I also wish I could. System logs can make this easy. But i don't
      have a corresponding GPU physical device.
      drm_sched_job_add_implicit_dependencies is only used in a few
      devices.
      <br>
      <br>
      Thanks.
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">
          <br>
          Thanks,
          <br>
          Hangyu
          <br>
          <br>
          <blockquote type="cite">
            <br>
            <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
              <br>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0jCVxokiYreNePCQmGLNIrCr--
