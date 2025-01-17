Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6FBA151F0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 15:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AD610EB0E;
	Fri, 17 Jan 2025 14:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FAcbeC8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC3210EB0E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 14:37:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so1515146f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 06:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737124651; x=1737729451; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XotKZ5aC4hzDyG2o0IeDG6hv28Jq5p2Sy4ygAsaPcU8=;
 b=FAcbeC8oFB4dFFCX5SE3bpL21xHhdAHPmqqkqhDo0Bc7HslvfGOOZ/bw9Z7VLb2sTB
 We5rdSvBt/hPPVswKJ98EmuDVQCHPiH1FWMBCf8Ra5R6sjYvAZB3fIotOpix8Bm86HPp
 I6iVTsl2Zq/vwmVxPKMhACgXS9lqHx24lYeGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737124651; x=1737729451;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XotKZ5aC4hzDyG2o0IeDG6hv28Jq5p2Sy4ygAsaPcU8=;
 b=HKmlYJw8rdCWupjNV1cKdg+z0AFOCeKV7/X1sptAY04y63EoKrGF/ERX4d2nWDSZjR
 coy4BTZSC3lPt3Ux8GPgVlphEawvvFZhNnf0LUt+dHtQ8imBrPbjjwENgPB1j59Bswm0
 DNPH4d33q15xM/2+fQznc+bijXwgktNdbDFhAdF4p4VDS9OEdMzLXp++81351dBq1YxS
 fXr5tDNO+6NaqLGhaV+JEVA2LoUvuLArO4g78k/OpPEKq9HAo8qw8qWZj69VhGbd7tWC
 tVyN5MvmAIJS0iNXDAk28iKmy3lPTU7iOqncKB9pQVMwhZBBGBtBOXxjergB4E1F249L
 szkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWZPbsA6zREu3lkrLz+0dVHU71FkLOwNOZrqLl+3xoBPaLOEQbR6ePjWfiJDPT2zQqNsBKzL/2s8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtiInSEMhs3IZ0lJeZwWj5mJqIF0+/QSYLH9v7hasnSTdz5Lk4
 o5qayZ8fO9y2vI/VY+oLEoTz3HfMB7nNChVc4t8VGwbQCA88OxuziKYMoQCi050=
X-Gm-Gg: ASbGnctLNofPtawPc1sbV37lBx8Yioli6TvIEuoZPUoVgDkfYNeatbLYxA+KredbjVw
 voe01k6rg09Iny8/2KXl1+KFDJzZTq6tbk/VHlHXRpk/6j0NLmzcRwKWKc7jqbpiOGIZvbgwcIl
 pzHEoBefijsSUZrPNaqVvMTYh3g/ZJ5V8tvtP5R84oWK3NXfGzCtewgU5tzw9b1bI5UXR7M0rxH
 qV4heb3h8uTqjh7/YLZE5n6G/+dpgVTkwJjZDQTigeuM0E+gLTRehaE8dwwKtzGwBss
X-Google-Smtp-Source: AGHT+IGRKn0mOd/rGrQjlD6Ss6MEpPjLO2iVNpAQ/jZBO5GUHVoXw6I4KLkLGt5y/u2vf1HmVS66CA==
X-Received: by 2002:a05:6000:1788:b0:386:3d27:b4f0 with SMTP id
 ffacd0b85a97d-38bec505c43mr6963889f8f.14.1737124651189; 
 Fri, 17 Jan 2025 06:37:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c753cc1fsm97636935e9.39.2025.01.17.06.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 06:37:30 -0800 (PST)
Date: Fri, 17 Jan 2025 15:37:28 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
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
Message-ID: <Z4prKEpIg7A5pjHQ@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
 <20250115151056.GS5556@nvidia.com>
 <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
 <20250115170942.GT5556@nvidia.com>
 <5f588dac-d3e2-445d-9389-067b875412dc@amd.com>
 <20250116160747.GV5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116160747.GV5556@nvidia.com>
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

On Thu, Jan 16, 2025 at 12:07:47PM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 16, 2025 at 04:13:13PM +0100, Christian König wrote:
> >> But this, fundamentally, is importers creating attachments and then
> >> *ignoring the lifetime rules of DMABUF*. If you created an attachment,
> >> got a move and *ignored the move* because you put the PFN in your own
> >> VMA, then you are not following the attachment lifetime rules!
> > 
> >    Move notify is solely for informing the importer that they need to
> >    re-fresh their DMA mappings and eventually block for ongoing DMA to
> >    end.
> 
> I feel that it is a bit pedantic to say DMA and CPU are somehow
> different. The DMABUF API gives you a scatterlist, it is reasonable to
> say that move invalidates the entire scatterlist, CPU and DMA equally.

dma-buf doesn't even give you a scatterlist, there's dma-buf which truly
are just handles that are 100% device specific.

It really is the "everything is optional" interface. And yes we've had
endless amounts of fun where importers tried to peek behind the curtain,
largely because scatterlists didn't cleanly separate the dma_addr_t from
the struct page side of things. So I understand Christian's concerns here.

But that doesn't mean we cannot add another interface that does allow
importers to peek behind the curtiain. As long as we don't make a mess and
confuse importers, and ideally have compat functions so that existing
importers can deal with pfn exporters too it's all fine with me.

And I also don't see an issue with reasonable pfn semantics that would
prevent a generic mmap implementation on top of that, so that
dma_buf_mmap() just works for those. The mmu notifier pain is when you
consume mmaps/vma in a generic way, but implementing mmap with the current
dma_resv locking is dead easy. Unless I've missed something nonobvious and
just made a big fool of myself :-)

What we cannot demand is that all existing dma-buf exporters switch over
to the pfn interfaces. But hey it's the everything optional interface, the
only things is guarantees are
- fixed length
- no copying
- refcounting and yay it only took 10 years: consistent locking rules

So I really don't understand Christian's fundamental opposition here.

Cheers, Sima

> >    This semantics doesn't work well for CPU mappings because you need to
> >    hold the reservation lock to make sure that the information stay valid
> >    and you can't hold a lock while returning from a page fault.
> 
> Sure, I imagine hooking up a VMA is hard - but that doesn't change my
> point. The semantics can be reasonable and well defined.
> 
> >    Yeah and exactly that is something we don't want to allow because it
> >    means that every importer need to get things right to prevent exporters
> >    from running into problems.
> 
> You can make the same argument about the DMA address. We should just
> get rid of DMABUF entirely because people are going to mis-use it and
> wrongly implement the invalidation callback.
> 
> I have no idea why GPU drivers want to implement mmap of dmabuf, that
> seems to be a uniquely GPU thing. We are not going to be doing stuff
> like that in KVM and other places. And we can implement the
> invalidation callback with correct locking. Why should we all be
> punished because DRM drivers seem to have this weird historical mmap
> problem?
> 
> I don't think that is a reasonable way to approach building a general
> purpose linux kernel API.
>  
> >    Well it's not miss-used, it's just a very bad design decision to let
> >    every importer implement functionality which actually belong into a
> >    single point in the exporter.
> 
> Well, this is the problem. Sure it may be that importers should not
> implement mmap - but using the PFN side address is needed for more
> than just mmap!
> 
> DMA mapping belongs in the importer, and the new DMA API makes this
> even more explicit by allowing the importer alot of options to
> optimize the process of building the HW datastructures. Scatterlist
> and the enforeced represetation of the DMA list is very inefficient
> and we are working to get rid of it. It isn't going to be replaced by
> any sort of list of DMA addresses though.
> 
> If you really disagree you can try to convince the NVMe people to give
> up their optimizations the new DMA API allows so DRM can prevent this
> code-review problem.
> 
> I also want the same optimizations in RDMA, and I am also not
> convinced giving them up is a worthwhile tradeoff.
> 
> >    Why would you want to do a dmabuf2 here?
> 
> Because I need the same kind of common framework. I need to hook VFIO
> to RDMA as well. I need to fix RDMA to have working P2P in all
> cases. I need to hook KVM virtual device stuff to iommufd. Someone
> else need VFIO to hook into DRM.
> 
> How many different times do I need to implement a buffer sharing
> lifetime model? No, we should not make a VFIO specific thing, we need
> a general tool to do this properly and cover all the different use
> cases. That's "dmabuf2" or whatever you want to call it. There are
> more than enough use cases to justify doing this. I think this is a
> bad idea, we do not need two things, we should have dmabuf to handle
> all the use cases people have, not just DRMs.
> 
> >    I don't mind improving the scatterlist approach in any way possible.
> >    I'm just rejecting things which we already tried and turned out to be a
> >    bad idea.
> >    If you make an interface which gives DMA addresses plus additional
> >    information like address space, access hints etc.. to importers that
> >    would be really welcomed.
> 
> This is not welcomed, having lists of DMA addresses is inefficient and
> does not match the direction of the DMA API. We are trying very hard
> to completely remove the lists of DMA addresses in common fast paths.
> 
> >    But exposing PFNs and letting the importers created their DMA mappings
> >    themselves and making CPU mappings themselves is an absolutely clear
> >    no-go.
> 
> Again, this is what we must have to support the new DMA API, the KVM
> and IOMMUFD use cases I mentioned.
> 
> >> In this case Xu is exporting MMIO from VFIO and importing to KVM and
> >> iommufd.
> > 
> >    So basically a portion of a PCIe BAR is imported into iommufd?
> 
> Yeah, and KVM. And RMDA.
> 
> >    Then create an interface between VFIO and KVM/iommufd which allows to
> >    pass data between these two.
> >    We already do this between DMA-buf exporters/importers all the time.
> >    Just don't make it general DMA-buf API.
> 
> I have no idea what this means. We'd need a new API linked to DMABUF
> that would be optional and used by this part of the world. As I said
> above we could protect it with some module namespace so you can keep
> it out of DRM. If you can agree to that then it seems fine..
> 
> > > Someone else had some use case where they wanted to put the VFIO MMIO
> > > PCIe BAR into a DMABUF and ship it into a GPU driver for
> > > somethingsomething virtualization but I didn't understand it.
> > 
> >    Yeah, that is already perfectly supported.
> 
> No, it isn't. Christoph is blocking DMABUF in VFIO because he does not
> want to scatterlist abuses that dmabuf is doing to proliferate.  We
> already have some ARM systems where the naive way typical DMABUF
> implementations are setting up P2P does not work. Those systems have
> PCI offset.
> 
> Getting this to be "perfectly supported" is why we are working on all
> these aspects to improve the DMA API and remove the scatterlist
> abuses.
> 
> >> In a certain sense CC is a TEE that is built using KVM instead of the
> >> TEE subsystem. Using KVM and integrating with the MM brings a whole
> >> set of unique challenges that TEE got to avoid..
> > 
> >    Please go over those challenges in more detail. I need to get a better
> >    understanding of what's going on here.
> >    E.g. who manages encryption keys, who raises the machine check on
> >    violations etc...
> 
> TEE broadly has Linux launch a secure world that does some private
> work. The secure worlds tend to be very limited, they are not really
> VMs and they don't run full Linux inside
> 
> CC broadly has the secure world exist at boot and launch Linux and
> provide services to Linux. The secure world enforces memory isolation
> on Linux and generates faults on violations. KVM is the gateway to
> launch new secure worlds and the secure worlds are full VMs with all
> the device emulation and more.
> 
> It CC is much more like xen with it's hypervisor and DOM0 concepts.
> 
> From this perspective, the only thing that matters is that CC secure
> memory is different and special - it is very much like your private
> memory concept. Only special places that understand it and have the
> right HW capability can use it. All the consumers need a CPU address
> to program their HW because of how the secure world security works.
> 
> Jason

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
