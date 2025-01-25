Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048BBA1BFEC
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 01:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A450A10EA52;
	Sat, 25 Jan 2025 00:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WMNI4Auo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A330710EA52
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 00:42:33 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-467a1ee7ff2so25834071cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 16:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737765752; x=1738370552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=f7pKh/ag2j5qbT1Y4Wj1y1SyzQlx5R1LIQwzt6aLNy4=;
 b=WMNI4AuoZ61wAQu9XBH1e/PrtK7TRim7YFy60nmadg0tLWlZn87iavR+AUT/DfCnfO
 v/sXi/fZzlBUQZGVEzrB5NczVHGCT+jn4nT2/R1dKmW5DQbbwneKizW8aGLNvQnJju0h
 StXQPPDLMsCO6MNqlyk9g1Bkimllq4WlwIEpP2j42oI6R8Vg8FStnw0HPR15BSF8XHjt
 HbjuwZC5JF81/w6Z1evLg5wTajSwht80KEUnKN+x5Y7qSsgn/3lhihZOi0VDEViAGM2C
 06kfihJh70wjYOy+ckSqXvbb68zb5TeiFxYp/92HunbiQG0JOzPU0eRFD1SbLZF8Kko7
 1R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737765752; x=1738370552;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f7pKh/ag2j5qbT1Y4Wj1y1SyzQlx5R1LIQwzt6aLNy4=;
 b=Sgrku5wKs6ZCytZRq+CLeiPXaM9LcZu/h3A+rxikitOFu1YheDEymd09pjQUfax0e4
 5qvrhN5Yd3XXIO4DtY4PJcsu44LLunvnqR79p2h585KpRt3JTprjDkTFCeihGmWYt/Zf
 EwzDTtp8y/xOlgL+g1hg+sCBg1VJ5dbavxlIAqoaBQQ4LF/tC7YQ06A2Jwn9gZix/sLd
 K5zRxwz05/xOaYiHrhhgubMWOAfaBFnSEKhaQtEkTdUnYTe60N7oHq0HoMqZ6B5q755S
 QxxzfuUJV/s7RxlCRtiwBgXZrudfHN/cW6Y5JaQdC0jcPJm/qnKmse+qqVsSxObIRbXa
 J72Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPWnQxhWBc5LAEoVI47lCs2cc3fS+oKAkUDE8NdoH1t3VB85vWqAQE9/6BhqWU4VOt97ZNO4NHPTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsZgZ7IIpew60PhDVYrWsyqRm6HvhK9s/bxMsLcsxqIeoCojPh
 4zOSNxUJAysPFu1VHvXOVu45j93uoYyehL5ekEo3OZkfhuX1m3qq
X-Gm-Gg: ASbGncvdBcnCllahtRIGGLrGwoEDuj3PkZrnp8BWdGny9b3NIvsRIHDBWsRDg2kD7yw
 m4bcSCVBHa/7G1oQRmsuHsiY7BSofys0U328Q4EkzFX3YQOFVKCMUieMK+qM6iVUpvcI604YCPD
 kkUmRLZ4L7ecTroimQyz2QADch0R9L00O3qYZobGelL9d5+5Q86yq1zI30NM1sO3fzF8otaqu7e
 9JEo6DUexOCBX7/i345/jwSh39amKmf4nuzyozih8xu2OQDsnZ+wAgOTMTgtnNWYpLEl9bDW5K8
 xN4R5/BsEHoGRYOsCg==
X-Google-Smtp-Source: AGHT+IEnGOd+kPcVlHlZsjUbmI+Oi6Y4XlM4fVBlprpEeOv1H7Hh7EYKP+1OkHfAbfni5jUvmEu0Zw==
X-Received: by 2002:a05:622a:142:b0:461:4150:b8a4 with SMTP id
 d75a77b69052e-46e1284c93bmr456069491cf.0.1737765752365; 
 Fri, 24 Jan 2025 16:42:32 -0800 (PST)
Received: from [10.138.7.94] ([163.5.171.73]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e6687e729sm15510991cf.19.2025.01.24.16.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 16:42:31 -0800 (PST)
Message-ID: <9572ba57-5552-4543-a3b0-6097520a12a3@gmail.com>
Date: Fri, 24 Jan 2025 19:42:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>, Huang Rui
 <ray.huang@amd.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <Z36wV07M8B_wgWPl@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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

On 1/8/25 12:05 PM, Simona Vetter wrote:
> On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wrote:
>>
>> On 2024/12/22 9:59, Demi Marie Obenour wrote:
>>> On 12/20/24 10:35 AM, Simona Vetter wrote:
>>>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>>>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>>>>
>>>>> A virtio-gpu userptr is based on HMM notifier.
>>>>> Used for let host access guest userspace memory and
>>>>> notice the change of userspace memory.
>>>>> This series patches are in very beginning state,
>>>>> User space are pinned currently to ensure the host
>>>>> device memory operations are correct.
>>>>> The free and unmap operations for userspace can be
>>>>> handled by MMU notifier this is a simple and basice
>>>>> SVM feature for this series patches.
>>>>> The physical PFNS update operations is splited into
>>>>> two OPs in here. The evicted memories won't be used
>>>>> anymore but remap into host again to achieve same
>>>>> effect with hmm_rang_fault.
>>>>
>>>> So in my opinion there are two ways to implement userptr that make sense:
>>>>
>>>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>>>    notifier
>>>>
>>>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>>>    page references or page pins at all, for full SVM integration. This
>>>>    should use hmm_range_fault ideally, since that's the version that
>>>>    doesn't ever grab any page reference pins.
>>>>
>>>> All the in-between variants are imo really bad hacks, whether they hold a
>>>> page reference or a temporary page pin (which seems to be what you're
>>>> doing here). In much older kernels there was some justification for them,
>>>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>>>> now all sorted out. So there's really only fully pinned, or true svm left
>>>> as clean design choices imo.
>>>>
>>>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>>>> you?
>>>
>>> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
>>> in complexity that pinning everything avoids.  Furthermore, this avoids the
>>> host having to take action in response to guest memory reclaim requests.
>>> This avoids additional complexity (and thus attack surface) on the host side.
>>> Furthermore, since this is for ROCm and not for graphics, I am less concerned
>>> about supporting systems that require swappable GPU VRAM.
>>
>> Hi Sima and Demi,
>>
>> I totally agree the flag FOLL_LONGTERM is needed, I will add it in next
>> version.
>>
>> And for the first pin variants implementation, the MMU notifier is also
>> needed I think.Cause the userptr feature in UMD generally used like this:
>> the registering of userptr always is explicitly invoked by user code like
>> "registerMemoryToGPU(userptrAddr, ...)", but for the userptr release/free,
>> there is no explicit API for it, at least in hsakmt/KFD stack. User just
>> need call system call "free(userptrAddr)", then kernel driver will release
>> the userptr by MMU notifier callback.Virtio-GPU has no other way to know if
>> user has been free the userptr except for MMU notifior.And in UMD theres is
>> no way to get the free() operation is invoked by user.The only way is use
>> MMU notifier in virtio-GPU driver and free the corresponding data in host by
>> some virtio CMDs as far as I can see.
>>
>> And for the second way that is use hmm_range_fault, there is a predictable
>> issues as far as I can see, at least in hsakmt/KFD stack. That is the memory
>> may migrate when GPU/device is working. In bare metal, when memory is
>> migrating KFD driver will pause the compute work of the device in
>> mmap_wirte_lock then use hmm_range_fault to remap the migrated/evicted
>> memories to GPU then restore the compute work of device to ensure the
>> correction of the data. But in virtio-GPU driver the migration happen in
>> guest kernel, the evict mmu notifier callback happens in guest, a virtio CMD
>> can be used for notify host but as lack of mmap_write_lock protection in
>> host kernel, host will hold invalid data for a short period of time, this
>> may lead to some issues. And it is hard to fix as far as I can see.
>>
>> I will extract some APIs into helper according to your request, and I will
>> refactor the whole userptr implementation, use some callbacks in page
>> getting path, let the pin method and hmm_range_fault can be choiced
>> in this series patches.
> 
> Ok, so if this is for svm, then you need full blast hmm, or the semantics
> are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userptr, this does
> not work.

Is this still broken in the virtualized case?  Page migration between host
and device memory is completely transparent to the guest kernel, so pinning
guest memory doesn't interfere with the host KMD at all.  In fact, the host
KMD is not even aware of it.

Allowing memory registered with AMDKFD to be pageable *by the guest* seems
like a bad idea to me.  Paging would require a guest <=> host round-trip
for _each_ call to mmu_interval_notifier_ops::invalidate().  That’s going
to be _very_ slow if it happens with any regularity.  Worse, the userspace
VMM will need to be notified if the GPU writes to the pages while the guest
expects them to be stable.  Can this be done with userfaultfd, and if so,
is it even a good idea?

The reason I am not sure that using userfaultfd to notify the guest of
changes is a good idea is that it seems intuitively rather risky.  At a
minimum, it allows the guest to stall host accesses for an arbitrarily
long period of time, which I suspect will make exploiting race conditions
easier.  Furthermore, this seems very prone to deadlocks.  Suppose that
that the guest causes a virtual device to access write-protected memory.
The VMM’s virtual device implementation will cause a userfaultfd
write-protect fault, which will then be passed to the guest to handle.
Suppose that resolving the fault requires allocating memory, which in
turn causes memory reclaim that waits for I/O on the same block device.
If the virtual device is single-threaded, you just deadlocked.  Even
if it is not single-threaded, operations like live migration might never
complete.  It might be possible for userspace to check the cause of a
write-protect fault and break the deadlock, but that is even more
complexity.

With FOLL_LONGTERM, this can’t happen.  The guest will never try to
make the pages clean, so it never needs to write-protect them.  This
means that the host does not need to worry about its device model
stalling forever and that there is no risk of deadlock.  The only thing
I know will break is using writable file-backed memory with SVM, but
that seems like a very, _very_ niche thing to do as there is no
consistency guarantee.  Read-only access would work fine.

> The other option is that hsakmt/kfd api is completely busted, and that's
> kinda not a kernel problem.

My understanding is that it _is_ busted, in that it is tied to address
spaces, not contexts.  If my understanding is correct, the host-side
device model must create a separate process for each guest process that
wants to use KFD.  Otherwise, different guest processes that use the same
GPU virtual address will conflict with each other.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
