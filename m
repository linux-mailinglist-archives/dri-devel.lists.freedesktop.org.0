Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4826722D0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E018C10E78E;
	Wed, 18 Jan 2023 16:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5C510E78A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674058789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/KuEvUKkBkm8TilG+UsvF5u0nNpzGNLJI38tVezjWCY=;
 b=iBjqGYmrirJ/W3c+skkQ8Wqo8bKQrua42lX/1dRfJCbODRCeAQgLY9XjEAUgX9qmcFJYy7
 +NnmfSYbZLpr2enjd11GRtoo3ixwpvEemOXEPGA0jl1eWzyV36EeVuGygIRcNZgMAeGoJI
 NKfWlQfka4TyEGHWbJTIrHOzYAiG9OA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-LsOqDcyAOYW0x-5PVabflw-1; Wed, 18 Jan 2023 11:19:47 -0500
X-MC-Unique: LsOqDcyAOYW0x-5PVabflw-1
Received: by mail-ej1-f71.google.com with SMTP id
 qb2-20020a1709077e8200b00842b790008fso24637230ejc.21
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 08:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/KuEvUKkBkm8TilG+UsvF5u0nNpzGNLJI38tVezjWCY=;
 b=sUN16Vjw0qQz0ASkni3H0ZUz+9prH4dqJsfK2HkapptcENSSS1xfMDdlg9CwnYcHlR
 K2joFRJJef0AO4BQQ2yP1OlgTLrQXv/0wdKefVdqKNAh25abEyj/OLWS7NwaT9EQm5Lo
 BJHhn0D9SCodUCDktTrPXu8n1+nPuU+x1oL05cc/RMtHajNhlsAonC1NrYkDjmFdzgkq
 LLsfc0aBjrRX0qd+YfneWHSAeqEUB9YQ+XwAfl8e5ec6vXjnMOPx/IU3Jo33/eqWncMg
 yRRf2KMhBJd2Or0vAVR8ZEwGWFCazEaJTyUTBDzOrcEF4JB1KdwT/aQ4Wy4ZXcshe0qN
 7GFA==
X-Gm-Message-State: AFqh2kpkrLNrFw4XXEQqeFTZqIlaLkbgS5rRNBqKHc/5hoD7DEq+3VOE
 u6s1bVX6FwpfzdhGOv72OGGkqbkg2o1346abHi1sPV0+uNK94qNuZ8P9mMYQwxh96a9QQqoKrXt
 1DINdQuQOyKC8trJJXiTeuauEUpyF
X-Received: by 2002:a17:906:bc5a:b0:871:ed54:60a3 with SMTP id
 s26-20020a170906bc5a00b00871ed5460a3mr7928216ejv.23.1674058786772; 
 Wed, 18 Jan 2023 08:19:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/Ymx8SWCn8nvwkgipk4aswDAvHWq8qxi8izFqRT0VxCP743Qhkm52hLrCMu8dS8Z0MSqu7Q==
X-Received: by 2002:a17:906:bc5a:b0:871:ed54:60a3 with SMTP id
 s26-20020a170906bc5a00b00871ed5460a3mr7928191ejv.23.1674058786580; 
 Wed, 18 Jan 2023 08:19:46 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906310f00b00738795e7d9bsm14808731ejx.2.2023.01.18.08.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 08:19:46 -0800 (PST)
Message-ID: <bcbef353-f579-4e90-1c77-be36bbe61c0f@redhat.com>
Date: Wed, 18 Jan 2023 17:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau VM_BIND
 UAPI
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com,
 jason@jlekstrand.net, tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net
References: <20230118061256.2689-1-dakr@redhat.com>
 <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
 <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com>
 <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/23 16:37, Christian König wrote:
> Am 18.01.23 um 16:34 schrieb Danilo Krummrich:
>> Hi Christian,
>>
>> On 1/18/23 09:53, Christian König wrote:
>>> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
>>>> This patch series provides a new UAPI for the Nouveau driver in 
>>>> order to
>>>> support Vulkan features, such as sparse bindings and sparse residency.
>>>>
>>>> Furthermore, with the DRM GPUVA manager it provides a new DRM core 
>>>> feature to
>>>> keep track of GPU virtual address (VA) mappings in a more generic way.
>>>>
>>>> The DRM GPUVA manager is indented to help drivers implement 
>>>> userspace-manageable
>>>> GPU VA spaces in reference to the Vulkan API. In order to achieve 
>>>> this goal it
>>>> serves the following purposes in this context.
>>>>
>>>>      1) Provide a dedicated range allocator to track GPU VA 
>>>> allocations and
>>>>         mappings, making use of the drm_mm range allocator.
>>>
>>> This means that the ranges are allocated by the kernel? If yes that's 
>>> a really really bad idea.
>>
>> No, it's just for keeping track of the ranges userspace has allocated.
> 
> Ok, that makes more sense.
> 
> So basically you have an IOCTL which asks kernel for a free range? Or 
> what exactly is the drm_mm used for here?

Not even that, userspace provides both the base address and the range,
the kernel really just keeps track of things. Though, writing a UAPI on
top of the GPUVA manager asking for a free range instead would be 
possible by just adding the corresponding wrapper functions to get a 
free hole.

Currently, and that's what I think I read out of your question, the main 
benefit of using drm_mm over simply stuffing the entries into a list or 
something boils down to easier collision detection and iterating 
sub-ranges of the whole VA space.

> 
> Regards,
> Christian.
> 
>>
>> - Danilo
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>      2) Generically connect GPU VA mappings to their backing 
>>>> buffers, in
>>>>         particular DRM GEM objects.
>>>>
>>>>      3) Provide a common implementation to perform more complex mapping
>>>>         operations on the GPU VA space. In particular splitting and 
>>>> merging
>>>>         of GPU VA mappings, e.g. for intersecting mapping requests 
>>>> or partial
>>>>         unmap requests.
>>>>
>>>> The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, 
>>>> itself
>>>> providing the following new interfaces.
>>>>
>>>>      1) Initialize a GPU VA space via the new 
>>>> DRM_IOCTL_NOUVEAU_VM_INIT ioctl
>>>>         for UMDs to specify the portion of VA space managed by the 
>>>> kernel and
>>>>         userspace, respectively.
>>>>
>>>>      2) Allocate and free a VA space region as well as bind and 
>>>> unbind memory
>>>>         to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND 
>>>> ioctl.
>>>>
>>>>      3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>>>>
>>>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use 
>>>> of the DRM
>>>> scheduler to queue jobs and support asynchronous processing with DRM 
>>>> syncobjs
>>>> as synchronization mechanism.
>>>>
>>>> By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
>>>> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>>>>
>>>> The new VM_BIND UAPI for Nouveau makes also use of drm_exec 
>>>> (execution context
>>>> for GEM buffers) by Christian König. Since the patch implementing 
>>>> drm_exec was
>>>> not yet merged into drm-next it is part of this series, as well as a 
>>>> small fix
>>>> for this patch, which was found while testing this series.
>>>>
>>>> This patch series is also available at [1].
>>>>
>>>> There is a Mesa NVK merge request by Dave Airlie [2] implementing the
>>>> corresponding userspace parts for this series.
>>>>
>>>> The Vulkan CTS test suite passes the sparse binding and sparse 
>>>> residency test
>>>> cases for the new UAPI together with Dave's Mesa work.
>>>>
>>>> There are also some test cases in the igt-gpu-tools project [3] for 
>>>> the new UAPI
>>>> and hence the DRM GPU VA manager. However, most of them are testing 
>>>> the DRM GPU
>>>> VA manager's logic through Nouveau's new UAPI and should be 
>>>> considered just as
>>>> helper for implementation.
>>>>
>>>> However, I absolutely intend to change those test cases to proper 
>>>> kunit test
>>>> cases for the DRM GPUVA manager, once and if we agree on it's 
>>>> usefulness and
>>>> design.
>>>>
>>>> [1] 
>>>> https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next /
>>>> https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
>>>> [2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
>>>> [3] 
>>>> https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouveau_vm_bind
>>>>
>>>> I also want to give credit to Dave Airlie, who contributed a lot of 
>>>> ideas to
>>>> this patch series.
>>>>
>>>> Christian König (1):
>>>>    drm: execution context for GEM buffers
>>>>
>>>> Danilo Krummrich (13):
>>>>    drm/exec: fix memory leak in drm_exec_prepare_obj()
>>>>    drm: manager to keep track of GPUs VA mappings
>>>>    drm: debugfs: provide infrastructure to dump a DRM GPU VA space
>>>>    drm/nouveau: new VM_BIND uapi interfaces
>>>>    drm/nouveau: get vmm via nouveau_cli_vmm()
>>>>    drm/nouveau: bo: initialize GEM GPU VA interface
>>>>    drm/nouveau: move usercopy helpers to nouveau_drv.h
>>>>    drm/nouveau: fence: fail to emit when fence context is killed
>>>>    drm/nouveau: chan: provide nouveau_channel_kill()
>>>>    drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
>>>>    drm/nouveau: implement uvmm for user mode bindings
>>>>    drm/nouveau: implement new VM_BIND UAPI
>>>>    drm/nouveau: debugfs: implement DRM GPU VA debugfs
>>>>
>>>>   Documentation/gpu/driver-uapi.rst             |   11 +
>>>>   Documentation/gpu/drm-mm.rst                  |   43 +
>>>>   drivers/gpu/drm/Kconfig                       |    6 +
>>>>   drivers/gpu/drm/Makefile                      |    3 +
>>>>   drivers/gpu/drm/amd/amdgpu/Kconfig            |    1 +
>>>>   drivers/gpu/drm/drm_debugfs.c                 |   56 +
>>>>   drivers/gpu/drm/drm_exec.c                    |  294 ++++
>>>>   drivers/gpu/drm/drm_gem.c                     |    3 +
>>>>   drivers/gpu/drm/drm_gpuva_mgr.c               | 1323 
>>>> +++++++++++++++++
>>>>   drivers/gpu/drm/nouveau/Kbuild                |    3 +
>>>>   drivers/gpu/drm/nouveau/Kconfig               |    2 +
>>>>   drivers/gpu/drm/nouveau/include/nvif/if000c.h |   23 +-
>>>>   drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   17 +-
>>>>   .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   10 +
>>>>   drivers/gpu/drm/nouveau/nouveau_abi16.c       |   23 +
>>>>   drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
>>>>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  152 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_chan.c        |   16 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
>>>>   drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   24 +
>>>>   drivers/gpu/drm/nouveau/nouveau_drm.c         |   25 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_drv.h         |   92 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_exec.c        |  310 ++++
>>>>   drivers/gpu/drm/nouveau/nouveau_exec.h        |   55 +
>>>>   drivers/gpu/drm/nouveau/nouveau_fence.c       |    7 +
>>>>   drivers/gpu/drm/nouveau/nouveau_fence.h       |    2 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_gem.c         |   83 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
>>>>   drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_sched.c       |  780 ++++++++++
>>>>   drivers/gpu/drm/nouveau/nouveau_sched.h       |   98 ++
>>>>   drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
>>>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  575 +++++++
>>>>   drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   68 +
>>>>   drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
>>>>   drivers/gpu/drm/nouveau/nvif/vmm.c            |   73 +-
>>>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  168 ++-
>>>>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |    1 +
>>>>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |   32 +-
>>>>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |    3 +
>>>>   include/drm/drm_debugfs.h                     |   25 +
>>>>   include/drm/drm_drv.h                         |    6 +
>>>>   include/drm/drm_exec.h                        |  144 ++
>>>>   include/drm/drm_gem.h                         |   75 +
>>>>   include/drm/drm_gpuva_mgr.h                   |  527 +++++++
>>>>   include/uapi/drm/nouveau_drm.h                |  216 +++
>>>>   47 files changed, 5266 insertions(+), 126 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/drm_exec.c
>>>>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
>>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
>>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
>>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
>>>>   create mode 100644 include/drm/drm_exec.h
>>>>   create mode 100644 include/drm/drm_gpuva_mgr.h
>>>>
>>>>
>>>> base-commit: 0b45ac1170ea6416bc1d36798414c04870cd356d
>>>
>>
> 

