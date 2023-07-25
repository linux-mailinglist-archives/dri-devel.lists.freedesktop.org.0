Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A570D760501
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 04:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523B510E013;
	Tue, 25 Jul 2023 02:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F1010E013
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 02:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690250641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vqww6ZfVz3WGuiA93vwsDp4D2TM+/LywwC6I4AB0uM=;
 b=TN4LFpAzSAlxTExM+9G5caxcXQN/L9BP7AE814cnGyDDRu3O16o9w/138Qc3sE7AwGHFEd
 nbU31jFfOhwa6ju5tKFMDnElR6sxhlp6rojptY/Z+26TN2s9xfkP4+3jlRFaC18iwc4eZQ
 cg92JAps+SDJG9v/kWw57jQzwIzlyUE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-3Z4zYcYPMxmGWGv90OpTYg-1; Mon, 24 Jul 2023 22:03:59 -0400
X-MC-Unique: 3Z4zYcYPMxmGWGv90OpTYg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a34a0b75eso330110666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 19:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690250638; x=1690855438;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+vqww6ZfVz3WGuiA93vwsDp4D2TM+/LywwC6I4AB0uM=;
 b=f4/8tSI5/9+WdKFy6tS4eECqGaYoT+Dd/WLxK5rk8ymsCZR8MonDDF9u9YZKpk/Hlm
 JvRcbovEl8TGVnF4e8H0/jzGuTM5CF3WBBAszIXsti6TiscmBDXw/+AGsfsf15pRTnN2
 M38laVKdGPxCjqjr0alQ3+i/IVN6k/33tw9AUQnRmX8fEcKh27QITZaJE7Tryand/8Jo
 bbxpfN/7fEAJirj9jVDgvnUpcPp0GjyYJc6FFK6iKy6gIbLWg4l8WBW+FAiZeKI19z3c
 N4MIVxH5NidewpNuGGgmlYSVGozLCzOwhrvX91QaoaonfHjs3FXgMeR5csTuuAAoeVyz
 dk/w==
X-Gm-Message-State: ABy/qLbFC/yAUctJWSdRBd57BO1idVNEUNv8+Q3o7IVEtIABkl0n0StJ
 HD0ic+pA7k1qFiWQXTnmSFjbSSw3YgtXzuMuEjXELpvIxvvxnnFgcY3KMCc2vHuWrhMmS92w8oc
 ou9tMj9S4ks/bEI/h+fm9RgewZe/K
X-Received: by 2002:a17:906:53d0:b0:970:1b2d:45cc with SMTP id
 p16-20020a17090653d000b009701b2d45ccmr11082973ejo.57.1690250638445; 
 Mon, 24 Jul 2023 19:03:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFaQYUuaSsOqp9M2CUlqNjePppMlkda/ZcoOm423ZgK9PVds1tLZGRiESPqcEQhQRWhcz5B5w==
X-Received: by 2002:a17:906:53d0:b0:970:1b2d:45cc with SMTP id
 p16-20020a17090653d000b009701b2d45ccmr11082950ejo.57.1690250638053; 
 Mon, 24 Jul 2023 19:03:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ot7-20020a170906ccc700b009929c09abdfsm7542238ejb.70.2023.07.24.19.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 19:03:57 -0700 (PDT)
Message-ID: <da776218-e930-5cbf-b2ab-8e6c39b900cd@redhat.com>
Date: Tue, 25 Jul 2023 04:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-misc-next v8 03/12] drm/nouveau: new VM_BIND uapi
 interfaces
To: Faith Ekstrand <faith@gfxstrand.net>, airlied@gmail.com
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-4-dakr@redhat.com>
 <CAOFGe95kS0KzSUhjWiikBcx9vRQKnqipFE+a=FPobCgEi=ysAw@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CAOFGe95kS0KzSUhjWiikBcx9vRQKnqipFE+a=FPobCgEi=ysAw@mail.gmail.com>
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/22/23 00:58, Faith Ekstrand wrote:
> 
> On Wed, Jul 19, 2023 at 7:15 PM Danilo Krummrich <dakr@redhat.com 
> <mailto:dakr@redhat.com>> wrote:
> 
>     This commit provides the interfaces for the new UAPI motivated by the
>     Vulkan API. It allows user mode drivers (UMDs) to:
> 
>     1) Initialize a GPU virtual address (VA) space via the new
>         DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
>         VA area.
> 
>     2) Bind and unbind GPU VA space mappings via the new
>         DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> 
>     3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
> 
>     Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
>     asynchronous processing with DRM syncobjs as synchronization mechanism.
> 
>     The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
>     DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
> 
>     Co-authored-by: Dave Airlie <airlied@redhat.com
>     <mailto:airlied@redhat.com>>
>     Signed-off-by: Danilo Krummrich <dakr@redhat.com
>     <mailto:dakr@redhat.com>>
>     ---
>       Documentation/gpu/driver-uapi.rst |   8 ++
>       include/uapi/drm/nouveau_drm.h    | 209 ++++++++++++++++++++++++++++++
>       2 files changed, 217 insertions(+)
> 
>     diff --git a/Documentation/gpu/driver-uapi.rst
>     b/Documentation/gpu/driver-uapi.rst
>     index 4411e6919a3d..9c7ca6e33a68 100644
>     --- a/Documentation/gpu/driver-uapi.rst
>     +++ b/Documentation/gpu/driver-uapi.rst
>     @@ -6,3 +6,11 @@ drm/i915 uAPI
>       =============
> 
>       .. kernel-doc:: include/uapi/drm/i915_drm.h
>     +
>     +drm/nouveau uAPI
>     +================
>     +
>     +VM_BIND / EXEC uAPI
>     +-------------------
>     +
>     +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
>     diff --git a/include/uapi/drm/nouveau_drm.h
>     b/include/uapi/drm/nouveau_drm.h
>     index 853a327433d3..4d3a70529637 100644
>     --- a/include/uapi/drm/nouveau_drm.h
>     +++ b/include/uapi/drm/nouveau_drm.h
>     @@ -126,6 +126,209 @@ struct drm_nouveau_gem_cpu_fini {
>              __u32 handle;
>       };
> 
>     +/**
>     + * struct drm_nouveau_sync - sync object
>     + *
>     + * This structure serves as synchronization mechanism for (potentially)
>     + * asynchronous operations such as EXEC or VM_BIND.
>     + */
>     +struct drm_nouveau_sync {
>     +       /**
>     +        * @flags: the flags for a sync object
>     +        *
>     +        * The first 8 bits are used to determine the type of the
>     sync object.
>     +        */
>     +       __u32 flags;
>     +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
>     +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
>     +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
>     +       /**
>     +        * @handle: the handle of the sync object
>     +        */
>     +       __u32 handle;
>     +       /**
>     +        * @timeline_value:
>     +        *
>     +        * The timeline point of the sync object in case the syncobj
>     is of
>     +        * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
>     +        */
>     +       __u64 timeline_value;
>     +};
>     +
>     +/**
>     + * struct drm_nouveau_vm_init - GPU VA space init structure
>     + *
>     + * Used to initialize the GPU's VA space for a user client, telling
>     the kernel
>     + * which portion of the VA space is managed by the UMD and kernel
>     respectively.
> 
> 
> I assume this has to be called quite early. Like maybe before any BOs or 
> channels are created? In any case, it'd be nice to have that documented.

Exactly, doing any of those will disable the new uAPI entirely if it 
wasn't yet initialized. I will add some documentation for this.

> 
>     + */
>     +struct drm_nouveau_vm_init {
>     +       /**
>     +        * @unmanaged_addr: start address of the kernel managed VA
>     space region
>     +        */
>     +       __u64 unmanaged_addr;
>     +       /**
>     +        * @unmanaged_size: size of the kernel managed VA space
>     region in bytes
>     +        */
>     +       __u64 unmanaged_size;
> 
> 
> Over-all, I think this is the right API. My only concern is with the 
> word "unmanaged". None of the VA space is unmanaged. Some is 
> userspace-managed and some is kernel-managed.  I guess "unmanaged" kinda 
> makes sense because this is coming from userspace and it's saying which 
> bits it manages and which bits it doesn't.  Still seems clunky to me.  
> Maybe kernel_managed? IDK, that feels weird too. Since we're already 
> using UMD in this file, we could call it kmd_managed. IDK. 🤷🏻‍♀️

kernel_managed / kmd_managed both sounds fine to me. I'm good with 
either one.

> 
> Yeah, I know this is a total bikeshed color thing and I'm not going to 
> block anything based on it. 😅 Just wanted to see if we can come up with 
> anything better.  It's documented and that's the important thing.
> 
>     +};
>     +
>     +/**
>     + * struct drm_nouveau_vm_bind_op - VM_BIND operation
>     + *
>     + * This structure represents a single VM_BIND operation. UMDs
>     should pass
>     + * an array of this structure via struct drm_nouveau_vm_bind's
>     &op_ptr field.
>     + */
>     +struct drm_nouveau_vm_bind_op {
>     +       /**
>     +        * @op: the operation type
>     +        */
>     +       __u32 op;
>     +/**
>     + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
>     + *
>     + * Map a GEM object to the GPU's VA space. Optionally, the
>     + * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the
>     kernel to
>     + * create sparse mappings for the given range.
>     + */
>     +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
>     +/**
>     + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
>     + *
>     + * Unmap an existing mapping in the GPU's VA space. If the region
>     the mapping
>     + * is located in is a sparse region, new sparse mappings are
>     created where the
>     + * unmapped (memory backed) mapping was mapped previously. To
>     remove a sparse
>     + * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
>     + */
>     +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
>     +       /**
>     +        * @flags: the flags for a &drm_nouveau_vm_bind_op
>     +        */
>     +       __u32 flags;
>     +/**
>     + * @DRM_NOUVEAU_VM_BIND_SPARSE:
>     + *
>     + * Indicates that an allocated VA space region should be sparse.
>     + */
>     +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>     +       /**
>     +        * @handle: the handle of the DRM GEM object to map
>     +        */
>     +       __u32 handle;
>     +       /**
>     +        * @pad: 32 bit padding, should be 0
>     +        */
>     +       __u32 pad;
>     +       /**
>     +        * @addr:
>     +        *
>     +        * the address the VA space region or (memory backed)
>     mapping should be mapped to
>     +        */
>     +       __u64 addr;
>     +       /**
>     +        * @bo_offset: the offset within the BO backing the mapping
>     +        */
>     +       __u64 bo_offset;
>     +       /**
>     +        * @range: the size of the requested mapping in bytes
>     +        */
>     +       __u64 range;
>     +};
>     +
>     +/**
>     + * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
>     + */
>     +struct drm_nouveau_vm_bind {
>     +       /**
>     +        * @op_count: the number of &drm_nouveau_vm_bind_op
>     +        */
>     +       __u32 op_count;
> 
> 
> I've chatted a bit with Dave on IRC about this but both VM_BIND and EXEC 
> should support `op_count == 0` and do exactly the same thing that they 
> would do if there were real ops. In the case of vm_bind, that just means 
> wait on the waits and then signal the signals. In particular, it should 
> NOT just return success and do nothing. Dave has a patch for this for 
> EXEC but IDK if VM_BIND needs any attention.  Of course, if it's not 
> ASYNC, then quickly doing nothing after validating inputs is acceptable.

What will this be used for? I guess it would not be important to be 
executed in order with "regular" (non-noop) jobs? Because the only thing 
this would tell you is that e.g. for VM_BIND all previous binds 
completed, which is what we have syncobjs for.

- Danilo

> 
>     +       /**
>     +        * @flags: the flags for a &drm_nouveau_vm_bind ioctl
>     +        */
>     +       __u32 flags;
>     +/**
>     + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
>     + *
>     + * Indicates that the given VM_BIND operation should be executed
>     asynchronously
>     + * by the kernel.
>     + *
>     + * If this flag is not supplied the kernel executes the associated
>     operations
>     + * synchronously and doesn't accept any &drm_nouveau_sync objects.
>     + */
>     +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>     +       /**
>     +        * @wait_count: the number of wait &drm_nouveau_syncs
>     +        */
>     +       __u32 wait_count;
>     +       /**
>     +        * @sig_count: the number of &drm_nouveau_syncs to signal
>     when finished
>     +        */
>     +       __u32 sig_count;
>     +       /**
>     +        * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>     +        */
>     +       __u64 wait_ptr;
>     +       /**
>     +        * @sig_ptr: pointer to &drm_nouveau_syncs to signal when
>     finished
>     +        */
>     +       __u64 sig_ptr;
>     +       /**
>     +        * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
>     +        */
>     +       __u64 op_ptr;
>     +};
>     +
>     +/**
>     + * struct drm_nouveau_exec_push - EXEC push operation
>     + *
>     + * This structure represents a single EXEC push operation. UMDs
>     should pass an
>     + * array of this structure via struct drm_nouveau_exec's &push_ptr
>     field.
>     + */
>     +struct drm_nouveau_exec_push {
>     +       /**
>     +        * @va: the virtual address of the push buffer mapping
>     +        */
>     +       __u64 va;
>     +       /**
>     +        * @va_len: the length of the push buffer mapping
>     +        */
>     +       __u64 va_len;
>     +};
>     +
>     +/**
>     + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
>     + */
>     +struct drm_nouveau_exec {
>     +       /**
>     +        * @channel: the channel to execute the push buffer in
>     +        */
>     +       __u32 channel;
>     +       /**
>     +        * @push_count: the number of &drm_nouveau_exec_push ops
>     +        */
>     +       __u32 push_count;
> 
> 
> Same comment as above. We want `push_count == 0` to behave the same as 
> any other EXEC just without anything new. In particular, it needs to 
> wait on all the waits as well as the previous EXECs on that channel and 
> then signal the sigs. I know Dave has a patch for this and it's working 
> quite well in my testing.
> 
> Other than that, everything looks good.  I'm still re-reading all the 
> NVK patches but they've been working quite well in my testing this week 
> apart from a perf issue I need to dig into. I'll give a real RB once 
> we're sure we all agree on the semantics of _count.
> 
> ~Faith
> 
>     +       /**
>     +        * @wait_count: the number of wait &drm_nouveau_syncs
>     +        */
>     +       __u32 wait_count;
>     +       /**
>     +        * @sig_count: the number of &drm_nouveau_syncs to signal
>     when finished
>     +        */
>     +       __u32 sig_count;
>     +       /**
>     +        * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>     +        */
>     +       __u64 wait_ptr;
>     +       /**
>     +        * @sig_ptr: pointer to &drm_nouveau_syncs to signal when
>     finished
>     +        */
>     +       __u64 sig_ptr;
>     +       /**
>     +        * @push_ptr: pointer to &drm_nouveau_exec_push ops
>     +        */
>     +       __u64 push_ptr;
>     +};
>     +
>       #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>       #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>       #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
>     @@ -136,6 +339,9 @@ struct drm_nouveau_gem_cpu_fini {
>       #define DRM_NOUVEAU_NVIF               0x07
>       #define DRM_NOUVEAU_SVM_INIT           0x08
>       #define DRM_NOUVEAU_SVM_BIND           0x09
>     +#define DRM_NOUVEAU_VM_INIT            0x10
>     +#define DRM_NOUVEAU_VM_BIND            0x11
>     +#define DRM_NOUVEAU_EXEC               0x12
>       #define DRM_NOUVEAU_GEM_NEW            0x40
>       #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>       #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
>     @@ -197,6 +403,9 @@ struct drm_nouveau_svm_bind {
>       #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW
>     (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct
>     drm_nouveau_gem_cpu_fini)
>       #define DRM_IOCTL_NOUVEAU_GEM_INFO         
>       DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct
>     drm_nouveau_gem_info)
> 
>     +#define DRM_IOCTL_NOUVEAU_VM_INIT           
>     DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct
>     drm_nouveau_vm_init)
>     +#define DRM_IOCTL_NOUVEAU_VM_BIND           
>     DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct
>     drm_nouveau_vm_bind)
>     +#define DRM_IOCTL_NOUVEAU_EXEC             
>       DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>       #if defined(__cplusplus)
>       }
>       #endif
>     -- 
>     2.41.0
> 

