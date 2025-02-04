Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8601DA26F82
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 11:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D1C10E2DB;
	Tue,  4 Feb 2025 10:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="EsZErOQ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBE710E2DB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 10:46:01 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so4490577f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 02:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738665960; x=1739270760; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTqSzT/TXDWQqYRy4tctsFxrDEke2AKGwuYUOQfB5/U=;
 b=EsZErOQ9Wk/uDYMUF9vCYzr2+AuS/GEe9Qf4jUWhAMWGbjuKLt7z/OKsrm0Lne6fkM
 1V4hBMRRlOqBP/DmIlW+hEgVl58KRlvm0Si5qyNG4jHJuU+iDAJkC+nqnXyxzWSANmFs
 dwTFUscedevP5prOC9yJx1o8VSwytcRd5oSh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738665960; x=1739270760;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NTqSzT/TXDWQqYRy4tctsFxrDEke2AKGwuYUOQfB5/U=;
 b=e66pLmTLdT7R9SCLeGKNxO5rYGpK/PK4KYxLiUiZy0Fkk2A3UIYduTLxPxt6RQdK7R
 1NmQ9cRo20dQaeahiuHrq/b8aLG/ctuXw877pKBXC3kNB+OivqmeDu5FnlfXB7zcwAZ1
 P72iV1U5nEModSnYWTUUHbdURW420Peak06fwlRSF704jUp79HZO9KmCwzIOuH8im6M9
 2HWnmmDn2PhSCA/5PO6gqJoBKq2nl7yBunWrEk0/YddEB+EMeDbBmEgZ/Wf16OoLDmjo
 B76kSBb0zA4t4XtM/hrN/XTFwZvvdNlS1slP7hasHlyGtZVJbCeufcAo6kXbR6LwnsHT
 4mWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhtQ++piLgN9mFUBE9UtxwZNsriaC3Gbp0QTJPA/LoOtnmBtSA9SCAYKNjUhk0rqtLvlVBouvaRSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9mjFWKUTfq9lXH/a07iVOz2+upqXG/WmlYpmncDkOLNQR2QqD
 CLGzeyUhIoHDSmfmrj3cuXUHQzDzs9xuXYqADzYW3Kc0GYbW3ZC9iaGYRPT6I6s=
X-Gm-Gg: ASbGncs9VH8pfbOvbEHmHmlYr4i1n7f6Ypn2KnCrDYmPjKu4GksE9mZFDyWwJZndWJp
 a6P6zizFhZpYPs4SH1p3LWyQKLR2ia2ZYvrREt1+zpmtAJVrF/VpkPETTPOlJHzOG/wy5t+/GMc
 wde4OmblZnrKOM6vAwqRG6g29Y5mNG0g/jDd46V/D0C7/cwyDSZeIn4LfIh+7kQGvfBGpcDrG9R
 LAKdGWjfh5zHxy3uUPHFIgJBPHOb3i9iWryP44kyfqsLDSTwg/iLys9XzVN9Ma+u76OkqDEahAP
 yhglYxvEofB8mJrZQpHej0aJGKY=
X-Google-Smtp-Source: AGHT+IGWhHTEnUp8RUiWMKHvCVuyT8/rXL2ynOFabY336YUpw5mRZI1i4GZUr3SXSEIaoymXJPH+Tw==
X-Received: by 2002:a05:6000:1faa:b0:385:fa3d:1988 with SMTP id
 ffacd0b85a97d-38c5194ca8emr22392899f8f.8.1738665960211; 
 Tue, 04 Feb 2025 02:46:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13139sm220098775e9.3.2025.02.04.02.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 02:45:59 -0800 (PST)
Date: Tue, 4 Feb 2025 11:45:57 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui <ray.huang@amd.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
Message-ID: <Z6Hv5esGqHWU2TVe@phenom.ffwll.local>
Mail-Followup-To: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 Huang Rui <ray.huang@amd.com>,
 virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <40485636-7ea3-4e34-b4bb-1ccaaadd4e47@amd.com>
 <62aeac90-1ba6-4e22-9465-fee95973a6bf@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62aeac90-1ba6-4e22-9465-fee95973a6bf@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Mon, Jan 20, 2025 at 05:54:10PM +0800, Huang, Honglei1 wrote:
> On 2024/12/27 10:02, Huang, Honglei1 wrote:
> > On 2024/12/22 9:59, Demi Marie Obenour wrote:
> > > On 12/20/24 10:35 AM, Simona Vetter wrote:
> > > > On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
> > > > > From: Honglei Huang<Honglei1.Huang@amd.com>
> > > > > 
> > > > > A virtio-gpu userptr is based on HMM notifier.
> > > > > Used for let host access guest userspace memory and
> > > > > notice the change of userspace memory.
> > > > > This series patches are in very beginning state,
> > > > > User space are pinned currently to ensure the host
> > > > > device memory operations are correct.
> > > > > The free and unmap operations for userspace can be
> > > > > handled by MMU notifier this is a simple and basice
> > > > > SVM feature for this series patches.
> > > > > The physical PFNS update operations is splited into
> > > > > two OPs in here. The evicted memories won't be used
> > > > > anymore but remap into host again to achieve same
> > > > > effect with hmm_rang_fault.
> > > > So in my opinion there are two ways to implement userptr that make sense:
> > > > 
> > > > - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
> > > >    notifier
> > > > 
> > > > - unpinnned userptr where you entirely rely on userptr and do not hold any
> > > >    page references or page pins at all, for full SVM integration. This
> > > >    should use hmm_range_fault ideally, since that's the version that
> > > >    doesn't ever grab any page reference pins.
> > > > 
> > > > All the in-between variants are imo really bad hacks, whether they hold a
> > > > page reference or a temporary page pin (which seems to be what you're
> > > > doing here). In much older kernels there was some justification for them,
> > > > because strange stuff happened over fork(), but with FOLL_LONGTERM this is
> > > > now all sorted out. So there's really only fully pinned, or true svm left
> > > > as clean design choices imo.
> > > > 
> > > > With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
> > > > you?
> > > +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
> > > in complexity that pinning everything avoids.  Furthermore, this avoids the
> > > host having to take action in response to guest memory reclaim requests.
> > > This avoids additional complexity (and thus attack surface) on the host side.
> > > Furthermore, since this is for ROCm and not for graphics, I am less concerned
> > > about supporting systems that require swappable GPU VRAM.

I kinda ignored this one, because from my point of view it's all clear.
But I guess better to elaborate some more.

> > Hi Sima and Demi, I totally agree the flag FOLL_LONGTERM is needed, I
> > will add it in next version. And for the first pin variants
> > implementation, the MMU notifier is also needed I think.
> > Cause the userptr feature in UMD generally used like this: the
> > registering of userptr
> > always is explicitly invoked by user code like
> > "registerMemoryToGPU(userptrAddr, ...)",
> > but for the userptr release/free, there is no explicit API for it, at
> > least in hsakmt/KFD stack.
> > User just need call system call "free(userptrAddr)", thenkernel driver
> > will release the userptr
> > by MMU notifier callback.Virtio-GPU has no other way to know if user has
> > been free the userptr
> > except for MMU notifior.And in UMD theres is no way to get the free()
> > operation is invoked by user.
> > the only way is use MMU notifierin virtio-GPU driver and free the
> > corresponding data in host
> > by some virtio CMDs as far as I can see.

Yes that's what I meant that you need real svm/hmm here. You cannot fake
the amdkfd/hsakmt model with pin_user_pages, it fundamentally falls apart.
One case is overcommit, where userspace malloc() a huge amount of virtual
address space, registers it with the gpu, but only uses fairly little of
it. If you pin that all, you run out of memory or at least thrash
performance.

For the hsa/kfd model, you must use hmm+mmu_notifier, or you're breaking
the uapi contract.

> > And for the second way that is use hmm_range_fault, there is a
> > predictable issues as far as I can see, at least in hsakmt/KFD stack.
> > That is the memory may migrate when GPU/device is working. In bare
> > metal, when memory is migrating KFD driver will pause the compute work
> > of the device in mmap_wirte_lock then use hmm_range_fault to remap the
> > migrated/evicted memories to GPU then restore the compute work of device
> > to ensure the correction of the data. But in virtio-GPU driver the
> > migration happen in guest kernel, the evict mmu notifier callback
> > happens in guest, a virtio CMD can be used for notify host but as lack
> > of mmap_write_lock protection in host kernel, host will hold invalid
> > data for a short period of time, this may lead to some issues. And it is
> > hard to fix as far as I can see.

I forgot the exact details, but when I looked amdkfd was taking too big
locks in the migration paths, which results in deadlocks. Those were
worked around by taking even bigger locks, the mmap_write_lock. But that's
a design issue with amdkfd, not something fundamental.

hmm only needs the mmu_notifier callbacks to work, meaning either context
preemption and restarting, or tlb invalidation and gpu page fault
handling. Those you can forward between guest and host with no issues, and
with hw support like pasid/ats in iommu this already happens.

Note that the drm_gpusvm library that's under discussion for xe had the
same issue in version 1 of relying on mmap_write_lock to paper over design
issues. But the recent versions should be fixed. Would be really good to
look at all that. And then probably do a full redo of the svm support for
amd in amdgpu.ko using all these new helper libraries, because my personal
take is that fixing amdkfd is probably more work than just writing new
clean code.

> > Finally I will extract some APIs into helper according to your request,
> > and I will refactor the whole userptr
> > implementation, use some callbacks in page getting path, let the pin
> > method and hmm_range_fault can be choiced
> > in this series patches.
> > 
> > Regards,
> > Honglei
> 
> Hi Sima,
> 
> I modified the code, remove all the MMU nitifior and use pin_user_pages_fast
> only. Under this implementation userptr fully
> managed by UMD. We did a performance test, it decreased by 30% in
> OpenCL stack in Geekbench6 benmark.
> We use AMD V2000 for test:
> use MMU notifior + pin_user_pages:
> near 13000 score: https://browser.geekbench.com/v6/compute/3257793
> 
> use pin_user_pages only:
> near 10000 socre: https://browser.geekbench.com/v6/compute/3496228
> 
> The code is under clean up, I will send out later.

pin_user_pages is fundamentally broken for the hsa memory model, no amount
of benchmarking different flavors of it against each another will change
that.

> And I found a another thing, it seems like in intel i915 userptr
> implementation, the pin_user_pages is also used in MMU notifior.
> Code path is: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/gem/i915_gem_userptr.c?h=v6.13#:~:text=ret%20%3D%20pin_user_pages_fast(obj%2D%3Euserptr.ptr%20%2B%20pinned%20*%20PAGE_SIZE%2C

Yeah i915-gem isn't great code and shouldn't be used as example for
anything. This is Dave&me asked Xe developers to create a lot of the
infrastructure in drm libraries, to make sure we have a solid design here
and not what i915-gem did.

Also note that i915-gem userptr is for buffer based userptr, like for
VK_KHR_external_memory if I remember correctly. This is not the hsa memory
model at all.
> 
> Patch set: https://lore.kernel.org/all/159353552439.22701.14005121342739071590@emeril.freedesktop.org/T/
> https://patchwork.kernel.org/project/intel-gfx/patch/20210323155059.628690-17-maarten.lankhorst@linux.intel.com/#24064663
> 
> And I didn't find the hmm_range_fault code path, maybe I missed it?

i915-gem never supported the svm/hsa memory model in upstream, so yeah
it's not there. For drm/xe see the work from Matt Brost that's currently
under discussion on dri-devel for what it should all look like.

Cheers, Sima

> 
> Regards,
> Honglei
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
