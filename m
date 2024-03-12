Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA925879137
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 10:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4295F1129E6;
	Tue, 12 Mar 2024 09:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="UZVOzlKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5064E1129E6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:45:03 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4132cbe26a9so9753325e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1710236701; x=1710841501;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QftTXg54zY1p2085kBM+2oJpX8CdgY2WsBBjLubusxo=;
 b=UZVOzlKu5n5z8M/R6DS1SG87AoVwsvqD3PoM7xBIm25oca4Ft2auHi3HKb8Mn0rQMb
 fbXKRNFqkDnc5ezbFEcLJX+E0KSLu4gvaWnIdrQ3eQ6bJ6qCy5ejpg+kx5irSuvYIPII
 Cqg1SYSv/MoigEbMmfNFe0vANqNrUZuBRmIio8DzO6jYt3GwWpp6s/23c01F15pCmdFP
 og5J5HxCg7qlw+lCjxdQQYiCvMK6VsRDHaQZI6eFTH+TXehl4ji6I1mZCdBg2K7tRbaI
 Db8JuvkOtYffrNqv9ea6e1WqV/1HxzVVLEmkwvHycJJq6rlJ2FPfmSTf6X9AFFHUWCpB
 LsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710236701; x=1710841501;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QftTXg54zY1p2085kBM+2oJpX8CdgY2WsBBjLubusxo=;
 b=GTvBwMBcCNl1iutiRxY9SYmcUfpzRfpS62sAazJUJaGxDClGZtAtnk4IXBpuR9awpK
 wD5wgI399xZEhBu9gZj1JZzOdifyaaHt9+V4GMhggpD5I0WqLwGrjrwpLOAZueHpvwTp
 VpDeO5vsGtyYGwd3KZkGBCR4/kM+OMBXGbPfYEvXGqIXj/Lwk10ksHmpj8hdcoYijLzJ
 0r7ueCBZiNePdyDI2FHoayiMSene/0kD/T0oJdK6ns3aOQSmfRoznWQEPaqoJ3fHM27F
 95N+CLUQkAi3iENSmQLDDT+uxMqNtff7AvCQ11NKYClsKzNAJMrsD0XSATtIrjlvOAt3
 v9FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfFIeJc3Oi93AxiFkzRro2XnKpbsicCgQPmiI0rcxGZtZeWQOaqHPquF2KPsBC63B1Eeb5hHGIQKwZygcbTXk7YDtiOd1CdQzXxJDqxBnY
X-Gm-Message-State: AOJu0Yw5GhvGa+zVz0bhcvxZ0vqU2H6sXMTZhgMidJODTqUH1DKRj8L8
 S0bFPtL9W7pQWR4DZJtZY/acBn3rB0q4zuB9NJ9+7agppqCSDS7OQfPD+CTywLQ=
X-Google-Smtp-Source: AGHT+IE5ewnKsDtExhQRG0jxWwzceo03oBBog1s4neTSN2GuQ5C6KQnq6VXxZvwdKwFs0A97ge6wXQ==
X-Received: by 2002:adf:f6c4:0:b0:33d:c5c6:5e1c with SMTP id
 y4-20020adff6c4000000b0033dc5c65e1cmr987524wrp.58.1710236701146; 
 Tue, 12 Mar 2024 02:45:01 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 f19-20020adfb613000000b0033dc931eb06sm8760858wre.0.2024.03.12.02.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 02:45:00 -0700 (PDT)
Message-ID: <b5134b40-6e84-47c9-a4f2-2a2c0faa9481@ursulin.net>
Date: Tue, 12 Mar 2024 09:45:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal to add CRIU support to DRM render nodes
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: Felix Kuehling <felix.kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 criu@openvz.org
Cc: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <03a9977c-2044-40c7-9688-9ab326abb81c@amd.com>
 <81c7b2c3-564a-4946-832b-5394cd19a7b7@ursulin.net>
In-Reply-To: <81c7b2c3-564a-4946-832b-5394cd19a7b7@ursulin.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/03/2024 14:48, Tvrtko Ursulin wrote:
> 
> Hi Felix,
> 
> On 06/12/2023 21:23, Felix Kuehling wrote:
>> Executive Summary: We need to add CRIU support to DRM render nodes in 
>> order to maintain CRIU support for ROCm application once they start 
>> relying on render nodes for more GPU memory management. In this email 
>> I'm providing some background why we are doing this, and outlining 
>> some of the problems we need to solve to checkpoint and restore render 
>> node state and shared memory (DMABuf) state. I have some thoughts on 
>> the API design, leaning on what we did for KFD, but would like to get 
>> feedback from the DRI community regarding that API and to what extent 
>> there is interest in making that generic.
>>
>> We are working on using DRM render nodes for virtual address mappings 
>> in ROCm applications to implement the CUDA11-style VM API and improve 
>> interoperability between graphics and compute. This uses DMABufs for 
>> sharing buffer objects between KFD and multiple render node devices, 
>> as well as between processes. In the long run this also provides a 
>> path to moving all or most memory management from the KFD ioctl API to 
>> libdrm.
>>
>> Once ROCm user mode starts using render nodes for virtual address 
>> management, that creates a problem for checkpointing and restoring 
>> ROCm applications with CRIU. Currently there is no support for 
>> checkpointing and restoring render node state, other than CPU virtual 
>> address mappings. Support will be needed for checkpointing GEM buffer 
>> objects and handles, their GPU virtual address mappings and memory 
>> sharing relationships between devices and processes.
>>
>> Eventually, if full CRIU support for graphics applications is desired, 
>> more state would need to be captured, including scheduler contexts and 
>> BO lists. Most of this state is driver-specific.
>>
>> After some internal discussions we decided to take our design process 
>> public as this potentially touches DRM GEM and DMABuf APIs and may 
>> have implications for other drivers in the future.
>>
>> One basic question before going into any API details: Is there a 
>> desire to have CRIU support for other DRM drivers?
> 
> This sounds like a very interesting feature on the overall, although I 
> cannot answer on the last question here.

I forgot to finish this thought. I cannot answer / don't know of any 
concrete plans, but I think feature is pretty cool and if amdgpu gets it 
working I wouldn't be surprised if other drivers would get interested.

> Funnily enough, it has a tiny relation to an i915 feature I recently 
> implemented on Mesa's request, which is to be able to "upload" the GPU 
> context from the GPU hang error state and replay the hanging request. It 
> is kind of (at a stretch) a very special tiny subset of checkout and 
> restore so I am not mentioning it as a curiosity.
> 
> And there is also another partical conceptual intersect with the (at the 
> moment not yet upstream) i915 online debugger. This part being in the 
> area of discovering and enumerating GPU resources beloning to the client.
> 
> I don't see an immediate design or code sharing opportunities though but 
> just mentioning.
> 
> I did spend some time reading your plugin and kernel implementation out 
> of curiousity and have some comments and questions.
> 
>> With that out of the way, some considerations for a possible DRM CRIU 
>> API (either generic of AMDGPU driver specific): The API goes through 
>> several phases during checkpoint and restore:
>>
>> Checkpoint:
>>
>>  1. Process-info (enumerates objects and sizes so user mode can allocate
>>     memory for the checkpoint, stops execution on the GPU)
>>  2. Checkpoint (store object metadata for BOs, queues, etc.)
>>  3. Unpause (resumes execution after the checkpoint is complete)
>>
>> Restore:
>>
>>  1. Restore (restore objects, VMAs are not in the right place at this 
>> time)
>>  2. Resume (final fixups after the VMAs are sorted out, resume execution)
> 
> Btw is check-pointing guaranteeing all relevant activity is idled? For 
> instance dma_resv objects are free of fences which would need to 
> restored for things to continue executing sensibly? Or how is that handled?
> 
>> For some more background about our implementation in KFD, you can 
>> refer to this whitepaper: 
>> https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md
>>
>> Potential objections to a KFD-style CRIU API in DRM render nodes, I'll 
>> address each of them in more detail below:
>>
>>   * Opaque information in the checkpoint data that user mode can't
>>     interpret or do anything with
>>   * A second API for creating objects (e.g. BOs) that is separate from
>>     the regular BO creation API
>>   * Kernel mode would need to be involved in restoring BO sharing
>>     relationships rather than replaying BO creation, export and import
>>     from user mode
>>
>> # Opaque information in the checkpoint
>>
>> This comes out of ABI compatibility considerations. Adding any new 
>> objects or attributes to the driver/HW state that needs to be 
>> checkpointed could potentially break the ABI of the CRIU 
>> checkpoint/restore ioctl if the plugin needs to parse that 
>> information. Therefore, much of the information in our KFD CRIU ioctl 
>> API is opaque. It is written by kernel mode in the checkpoint, it is 
>> consumed by kernel mode when restoring the checkpoint, but user mode 
>> doesn't care about the contents or binary layout, so there is no user 
>> mode ABI to break. This is how we were able to maintain CRIU support 
>> when we added the SVM API to KFD without changing the CRIU plugin and 
>> without breaking our ABI.
>>
>> Opaque information may also lend itself to API abstraction, if this 
>> becomes a generic DRM API with driver-specific callbacks that fill in 
>> HW-specific opaque data.
> 
> This feels sound in principle to me. Fundamentally the state is very 
> hardware specfic, and/or driver version specific, so I don't see 
> anything could be gained in practice by making it much less opaque. 
> (Apart from making things more complicated.)
> 
> I was however unsure of the current split of how you dump buffer objects 
> with some data in the defined bo structure, and some in completely 
> opaque private data. Is there a benefit to that split, or maybe in other 
> words, is there a benefit on having part transparent and part opaque for 
> buffer objects?
> 
> To slightly touch upon the question of whether this could become a 
> generic DRM API. It feels it would be hard to do it from the start. What 
> sounds more feasible is if/when generic looking helpers can be spotted 
> while developing the RFC then potentially structure the code they can 
> easily be promoted to shared/common at some future moment.
> 
>> # Second API for creating objects
>>
>> Creating BOs and other objects when restoring a checkpoint needs more 
>> information than the usual BO alloc and similar APIs provide. For 
>> example, we need to restore BOs with the same GEM handles so that user 
>> mode can continue using those handles after resuming execution. If BOs 
>> are shared through DMABufs without dynamic attachment, we need to 
>> restore pinned BOs as pinned. Validation of virtual addresses and 
>> handling MMU notifiers must be suspended until the virtual address 
>> space is restored. For user mode queues we need to save and restore a 
>> lot of queue execution state so that execution can resume cleanly.
> 
> This also sounds justified to me. Restore creating all internal objects 
> is definitely special and sounds better to add uapi to create them 
> directly with the correct properties, than to add uapi to adjust 
> internal properties after creation. And in case you would always need 
> some new uapi - so at least to adjust after creation. At which point you 
> may have both in one. Internally implementation can be split or common, 
> whatever makes sense for a given object type, but new uapi definitely 
> sounds is required.
>> # Restoring buffer sharing relationships
>>
>> Different GEM handles in different render nodes and processes can 
>> refer to the same underlying shared memory, either by directly 
>> pointing to the same GEM object, or by creating an import attachment 
>> that may get its SG tables invalidated and updated dynamically through 
>> dynamic attachment callbacks. In the latter case it's obvious, who is 
>> the exporter and who is the importer. In the first case, either one 
>> could be the exporter, and it's not clear who would need to create the 
>> BO and who would need to 
> 
> To see if I follow the former case correctly.
> 
> This could be two clients A and B, where B has imported a dma-buf shared 
> BO from A and has since closed the dma-buf fd? Which results in a single 
> BO with reference count of 2 and obj->import_attach unset. History of 
> who created the object is lost.
> 
> In fact it could even be that two imported objects remain (clients A, B 
> and C) and A, who originally created the BO, has since fully released 
> it. So any kind of "creator" tracking if added wouldn't be fully 
> reliable either.
> 
>> import it when restoring the checkpoint. To further complicate things, 
>> multiple processes in a checkpoint get restored concurrently. So there 
>> is no guarantee that an exporter has restored a shared BO at the time 
>> an importer is trying to restore its import.
>>
>> A proposal to deal with these problems would be to treat importers and 
>> exporters the same. Whoever restores first, ends up creating the BO 
>> and potentially attaching to it. The other process(es) can find BOs 
>> that were already restored by another process by looking it up with a 
>> unique ID that could be based on the DMABuf inode number. An 
>> alternative would be a two-pass approach that needs to restore BOs on 
>> two passes:
>>
>>  1. Restore exported BOs
>>  2. Restore imports
>>
>> With some inter-process synchronization in CRIU itself between these 
>> two passes. This may require changes in the core CRIU, outside our 
>> plugin. Both approaches depend on identifying BOs with some unique ID 
>> that could be based on the DMABuf inode number in the checkpoint. 
>> However, we would need to identify the processes in the same restore 
>> session, possibly based on parent/child process relationships, to 
>> create a scope where those IDs are valid during restore.
> 
> If my understanding above is on the right track, then I think this is 
> the only thing which can be done (for all scenarios).
> 
> I also *think* it would be safe. At least at the moment I cannot think 
> what could go wrong. Semantics are that it doesn't really matter who 
> created the object.
> 
>> Finally, we would also need to checkpoint and restore DMABuf file 
>> descriptors themselves. These are anonymous file descriptors. The CRIU 
>> plugin could probably be taught to recreate them from the original 
>> exported BO based on the inode number that could be queried with fstat 
>> in the checkpoint. It would need help from the render node CRIU API to 
>> find the right BO from the inode, which may be from a different 
>> process in the same restore session.
> 
> This part feels like it is breaking the component separation a bit 
> because even for buffers fully owned by amdgpu, strictly speaking the 
> dma-buf fd is not. At least my understanding from the above is that you 
> propose to attempt to import the fd, from the kernel side, during the 
> checkpoint process? Like:
> 
> Checkpoint:
> 
> CRIU for each anon fd:
>    amdgpu_plugin(fd)
>      -> attempt in kernel dma buf import (passes fd to kernel via ioctl?)
>          -> is it ours? (no -> error)
>              -> create a record mapping fd number to amdgpu BO
> 
> Restore:
> 
> for each dma-buf fd record:
>     create BO if does not exists
>     export BO to same fd
>     close BO handle if not in regular BO handle records
> 
> Or since you mention lookup by inode, that would need to be 
> dmabuf_plugin so it can lookup inodes in the private mount space. 
> However how would it co-operate with amdgpu_plugin is not clear to me.

I later also realised that I was maybe increasing the scope for you 
here. :) You did state focus is ROCm applications which possibly doesn't 
care about dma-resv, fences, syncobjs etc?

But I think the "how to handle dma-bufs" design question is still 
relevant and interesting. For example I had this thought that perhaps 
what would be needed is a CRIU plugin hierarchy.

Because fundamentally we would be snapshoting a hierarcy of kernel 
objects belonging to different drivers (kfd, amdgpu, dma-buf, ...). And 
if one day someone would to try to handle dma fences and drm syncobjs, 
the argument for a hierarchial design would be even stronger I think.

Something like a drm_plugin.so could call sub-plugins (amdgpu, dma-buf, 
sync file, ...) and internally build the representation of the whole 
state and how the relationship between the objects.

With that kind of design there probably would be a need to define some 
common kernel side api and uapi, so all involved objects can be 
enumerated with some unique ids etc.

Now.. the counter argument.. the more state from different drivers would 
one want to handle the bigger this project would get. Would it even be 
feasible is the question, to the point that it may be simpler to just 
run the workload in a VM via SR-IOV and simply hibernate the whole thin 
guest. :)

Regards,

Tvrtko
