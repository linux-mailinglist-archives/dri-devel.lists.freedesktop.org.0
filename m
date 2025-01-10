Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90DFA09BF1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 20:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F5010E101;
	Fri, 10 Jan 2025 19:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hoyWgX6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6EC10E101
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 19:36:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-436202dd730so17936715e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736537698; x=1737142498; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kWAcn2HdAkzhLxO4py5Jy0oNRzwsuvt23AwwagkjAw=;
 b=hoyWgX6io1VGjOIo96+A+D5QgOTdnlz7Wj3LTpBsRjsKa6QgLVfhNmIp5TZf8sOtrM
 +YSeje9gdPk4PCNtjZww1ed6yKj8fcp3t1mz4kNd5k+NhAe8XMq/6waz3SgIkS0o53bn
 UN2WzZ9dexKnFbTCNG4bqCMY3k/i6zobluCW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736537698; x=1737142498;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7kWAcn2HdAkzhLxO4py5Jy0oNRzwsuvt23AwwagkjAw=;
 b=CNhzJcxCPexR7TmGC0e3ijX5yNxrsBccapWRCzmhKVN/WjhtOS5Y37ZbJSZ3JEHpID
 qmfyVvtjaZu5lKrti966OusmL8fuzgaOM99gEL/0EQeFSBpQe4hK/Fjec5V/8KRvfmgG
 IGlnMl8vbpjawKUKXV6NDu3asoRzFMEOQ5fZvY//yyAXJhf7Zf14NTi3aUAyyxsp2eo7
 3JYMIKChyKLLWBVin4/EQ+5EPS4L7dG8BPBpxS/1MsXi2TcaH+gN+3ua33q4EMkojAa7
 hpTPnT+dM//G1i2eOMb1T4+eqPzn9HNYBluz/wSCkLnft05nFfJpZP7ZlDKA30jCDjib
 Kflg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ipuzCgBVjHu5QHnSgrW5Grsl9hf/IQrCZsp3phgxwHGedPYJExdyEpMtkTI6Kt41DZJ+gjvKTuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ+GFOPhY5Ba7MvvvzT/W9c8iUxQ/we0Gyoai712xNiIJnwTWN
 gRUOibTBaWF8ULf06PiHq2bM08o0yXmqxVsWIoKdlckGJudgCFtN3fPmaLvLo6I=
X-Gm-Gg: ASbGnctC/6iBHVPZ1gXpPxBA/OUaKv4pM7evxquok32MD/z0MFka3wEbBxBuFBvwVGt
 /cTcpQq0d6FJLGPt48E1CsOIU5PkP6FVnThpy18WbYKvBntEAh8HerG88c2jbjB9xheJYHOahyl
 MF5fBGoE8it7Ub8CbIICHx3+6M4473Acm+qzY64nqLRFaClMJiQLgaaf05VUgfok9GG1IKW7DDm
 gwGX53UPkcj/4IiQdGW5FHbvbJWR6xXFC9Rc2JOw9ZL8cH0ZXOUdm0CCe+YOGVRW8bz
X-Google-Smtp-Source: AGHT+IEG18CSISXY84VJBWraGNluA4sVqJHq96BnG6t/WiH07yy9ye9bYCNc0ZRatrla1bgxtE/aQg==
X-Received: by 2002:a05:600c:138d:b0:433:c76d:d57e with SMTP id
 5b1f17b1804b1-436e26849f1mr121839695e9.5.1736537698379; 
 Fri, 10 Jan 2025 11:34:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436dd1682e4sm64030085e9.1.2025.01.10.11.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:34:57 -0800 (PST)
Date: Fri, 10 Jan 2025 20:34:55 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
Mail-Followup-To: Xu Yilun <yilun.xu@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Jan 09, 2025 at 07:06:48AM +0800, Xu Yilun wrote:
> >  So I guess my first question is, which locking rules do you want here for
> >  pfn importers?
> > 
> >  follow_pfn() is unwanted for private MMIO, so dma_resv_lock.
> > 
> >    As Sima explained you either have follow_pfn() and mmu_notifier or you
> >    have DMA addresses and dma_resv lock / dma_fence.
> > 
> >    Just giving out PFNs without some lifetime associated with them is one of
> >    the major problems we faced before and really not something you can do.
> 
> I'm trying to make exporter give out PFN with lifetime control via
> move_notify() in this series. May not be conceptually correct but seems
> possible.
> 
> > 
> > 
> >  If mmu notifiers is fine, then I think the current approach of follow_pfn
> >  should be ok. But if you instead dma_resv_lock rules (or the cpu mmap
> >  somehow is an issue itself), then I think the clean design is create a new
> > 
> >  cpu mmap() is an issue, this series is aimed to eliminate userspace
> >  mapping for private MMIO resources.
> > 
> >    Why?
> 
> OK, I can start from here.
> 
> It is about the Secure guest, or CoCo VM. The memory and MMIOs assigned
> to this kind of guest is unaccessable to host itself, by leveraging HW
> encryption & access control technology (e.g. Intel TDX, AMD SEV-SNP ...).
> This is to protect the tenant data being stolen by CSP itself.
> 
> The impact is when host accesses the encrypted region, bad things
> happen to system, e.g. memory corruption, MCE. Kernel is trying to
> mitigate most of the impact by alloc and assign user unmappable memory
> resources (private memory) to guest, which prevents userspace
> accidents. guest_memfd is the private memory provider that only allows
> for KVM to position the page/pfn by fd + offset and create secondary
> page table (EPT, NPT...), no host mapping, no VMA, no mmu_notifier. But
> the lifecycle of the private memory is still controlled by guest_memfd.
> When fallocate(fd, PUNCH_HOLE), the memory resource is revoked and KVM
> is notified to unmap corresponding EPT.
> 
> The further thought is guest_memfd is also suitable for normal guest.
> It makes no sense VMM must build host mapping table before guest access.
> 
> Now I'm trying to seek a similar way for private MMIO. A MMIO resource
> provider that is exported as an fd. It controls the lifecycle of the
> MMIO resource and notify KVM when revoked. dma-buf seems to be a good
> provider which have done most of the work, only need to extend the
> memory resource seeking by fd + offset.

So if I'm getting this right, what you need from a functional pov is a
dma_buf_tdx_mmap? Because due to tdx restrictions, the normal dma_buf_mmap
is not going to work I guess?

Also another thing that's a bit tricky is that kvm kinda has a 3rd dma-buf
memory model:
- permanently pinned dma-buf, they never move
- dynamic dma-buf, they move through ->move_notify and importers can remap
- revocable dma-buf, which thus far only exist for pci mmio resources

Since we're leaning even more on that 3rd model I'm wondering whether we
should make it something official. Because the existing dynamic importers
do very much assume that re-acquiring the memory after move_notify will
work. But for the revocable use-case the entire point is that it will
never work.

I feel like that's a concept we need to make explicit, so that dynamic
importers can reject such memory if necessary.

So yeah there's a bunch of tricky lifetime questions that need to be
sorted out with proper design I think, and the current "let's just use pfn
directly" proposal hides them all under the rug. I agree with Christian
that we need a bit more care here.
-Sima

> 
> > 
> >  separate access mechanism just for that. It would be the 5th or so (kernel
> >  vmap, userspace mmap, dma_buf_attach and driver private stuff like
> >  virtio_dma_buf.c where you access your buffer with a uuid), so really not
> >  a big deal.
> > 
> >  OK, will think more about that.
> > 
> >    Please note that we have follow_pfn() + mmu_notifier working for KVM/XEN
> 
> Folow_pfn & mmu_notifier won't work here, cause no VMA, no host mapping
> table.
> 
> Thanks,
> Yilun
> >    with MMIO mappings and P2P. And that required exactly zero DMA-buf changes
> >    :)
> > 
> >    I don't fully understand your use case, but I think it's quite likely that
> >    we already have that working.
> > 
> >    Regards,
> >    Christian.

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
