Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B7BA1099E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD9910E36C;
	Tue, 14 Jan 2025 14:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Cagok+yK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD21810E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:44:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aae81f4fdc4so1059104766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 06:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736865847; x=1737470647; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ATFNgMzaw3+odlncdmVbwQjWHseefp7b7ULkUB6sipQ=;
 b=Cagok+yKfU5c3rGPuRBYbpWlQH1OKGJOLWIljB5sD/B5i23EneCaetwtqtayRwt1Na
 9XM2/ixl7R/zKH0ak0J8jx/z0nSTO3n5Pig3m2QMtU+SIlOTTbmbviauz3/FXplH3+FK
 n8WsE20RcJKPCcRy8ZbufNuId18k4rESdPkXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736865847; x=1737470647;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ATFNgMzaw3+odlncdmVbwQjWHseefp7b7ULkUB6sipQ=;
 b=lGS9WKXoA78rTOv/KhaQtUnP8V3UqdCZBYB4mTHcCeMw/5IxaXp0kFgQmE9svQ1H9c
 EviED4iux0UCIPEFRQpOEV7V+QQV2FV0Stidhg/FCtZgIOF+fBBQJpn5pulxdYDruQk1
 6CZQkgLHbT5eyumk3ONJwOJEvKFegWZjL6k4NT1gpChtHiViKDlGdmJOMla9njwsBZL7
 Yzdwm1AE/UJ6T/22Z6kQ4Fd4eybn/GZWIdn5SNUg0ex5P3fH7eTDSdr1JLX6m6pnwGZv
 D0GtfVPz1lJLm30BT+ooAQjk1/JL3SevWo/FkuLdITLQtykZ+bJ8elovrbm//UTzjPov
 VOHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa6tE51eNsw95lfO7gy+iOEsJn59tAxfbRPNOGoi4wJg9C9Wl2LsxdVhKEjIVBH1iLMOGFfXojARs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7l6+bXaBlhd6uBeWfelWY8wYni88oagdAMIsI4oJJlF896IBc
 S+Ckok0UX+5pyDdGivBT+frbIc4eYCpf/HNvAiwJHl/gHmNqXuG8bIXi4YnCQ+s=
X-Gm-Gg: ASbGnctjDQzzGVg47cP99Emq1RNfeFjB91la1cKwIsaO6yNZQYqGNKDuzrpJGj4YKMC
 l3nlX9zwj04VyCcHNE7vK7j1xvLYKLV0ZBCMY/Gm1DawWYIMywe1uUx2lIbR/E/nqxlDGsBjggw
 e8PN+5h2A7lswElRGm5q0+FXMKEFjMpDNHEnEwbL0Gom6sM7SrM5QKw1DMlrv4gh1Hsfe1/4EBE
 YLf9GTGv39GxgYqUgGfXPxKpiMKNbX70fMZZGGU2FqVLKKl72GagTNxmhU+r3DEmXLi
X-Google-Smtp-Source: AGHT+IGAg6SbQyvl4hHoMLWiihnCnk4YJMHgw8ibbt0hblBqr0eHOCrKPtQvQh7P/3PbA4F//m55Iw==
X-Received: by 2002:a17:907:a48:b0:ab2:c1e2:1da9 with SMTP id
 a640c23a62f3a-ab2c1e22977mr2341583266b.51.1736865847270; 
 Tue, 14 Jan 2025 06:44:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b2181sm636633966b.162.2025.01.14.06.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 06:44:06 -0800 (PST)
Date: Tue, 14 Jan 2025 15:44:04 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 Xu Yilun <yilun.xu@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110203838.GL5556@nvidia.com>
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

On Fri, Jan 10, 2025 at 04:38:38PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 10, 2025 at 08:34:55PM +0100, Simona Vetter wrote:
> 
> > So if I'm getting this right, what you need from a functional pov is a
> > dma_buf_tdx_mmap? Because due to tdx restrictions, the normal dma_buf_mmap
> > is not going to work I guess?
> 
> Don't want something TDX specific!
> 
> There is a general desire, and CC is one, but there are other
> motivations like performance, to stop using VMAs and mmaps as a way to
> exchanage memory between two entities. Instead we want to use FDs.
> 
> We now have memfd and guestmemfd that are usable with
> memfd_pin_folios() - this covers pinnable CPU memory.
> 
> And for a long time we had DMABUF which is for all the other wild
> stuff, and it supports movable memory too.
> 
> So, the normal DMABUF semantics with reservation locking and move
> notifiers seem workable to me here. They are broadly similar enough to
> the mmu notifier locking that they can serve the same job of updating
> page tables.

Yeah raw pfn is fine with me too. It might come with more "might not work
on this dma-buf" restrictions, but I can't think of a practical one right
now.

> > Also another thing that's a bit tricky is that kvm kinda has a 3rd dma-buf
> > memory model:
> > - permanently pinned dma-buf, they never move
> > - dynamic dma-buf, they move through ->move_notify and importers can remap
> > - revocable dma-buf, which thus far only exist for pci mmio resources
> 
> I would like to see the importers be able to discover which one is
> going to be used, because we have RDMA cases where we can support 1
> and 3 but not 2.
> 
> revocable doesn't require page faulting as it is a terminal condition.

Yeah this is why I think we should separate the dynamic from the revocable
use-cases clearly, because mixing them is going to result in issues.

> > Since we're leaning even more on that 3rd model I'm wondering whether we
> > should make it something official. Because the existing dynamic importers
> > do very much assume that re-acquiring the memory after move_notify will
> > work. But for the revocable use-case the entire point is that it will
> > never work.
> 
> > I feel like that's a concept we need to make explicit, so that dynamic
> > importers can reject such memory if necessary.
> 
> It strikes me as strange that HW can do page faulting, so it can
> support #2, but it can't handle a non-present fault?

I guess it's not a kernel issue, but userspace might want to know whether
this dma-buf could potentially nuke the entire gpu context. Because that's
what you get when we can't patch up a fault, which is the difference
between a recovable dma-buf and a dynamic dma-buf.

E.g. if a compositor gets a dma-buf it assumes that by just binding that
it will not risk gpu context destruction (unless you're out of memory and
everything is on fire anyway, and it's ok to die). But if a nasty client
app supplies a revocable dma-buf, then it can shot down the higher
priviledged compositor gpu workload with precision. Which is not great, so
maybe existing dynamic gpu importers should reject revocable dma-buf.
That's at least what I had in mind as a potential issue.

> > So yeah there's a bunch of tricky lifetime questions that need to be
> > sorted out with proper design I think, and the current "let's just use pfn
> > directly" proposal hides them all under the rug. 
> 
> I don't think these two things are connected. The lifetime model that
> KVM needs to work with the EPT, and that VFIO needs for it's MMIO,
> definately should be reviewed and evaluated.
> 
> But it is completely orthogonal to allowing iommufd and kvm to access
> the CPU PFN to use in their mapping flows, instead of the
> dma_addr_t.
> 
> What I want to get to is a replacement for scatter list in DMABUF that
> is an array of arrays, roughly like:
> 
>   struct memory_chunks {
>       struct memory_p2p_provider *provider;
>       struct bio_vec addrs[];
>   };
>   int (*dmabuf_get_memory)(struct memory_chunks **chunks, size_t *num_chunks);
> 
> This can represent all forms of memory: P2P, private, CPU, etc and
> would be efficient with the new DMA API.
> 
> This is similar to the structure BIO has, and it composes nicely with
> a future pin_user_pages() and memfd_pin_folios().

Since you mention pin here, I think that's another aspect of the revocable
vs dynamic question. Dynamic buffers are expected to sometimes just move
around for no reason, and importers must be able to cope.

For recovable exporters/importers I'd expect that movement is not
happening, meaning it's pinned until the single terminal revocation. And
maybe I read the kvm stuff wrong, but it reads more like the latter to me
when crawling through the pfn code.

Once we have the lifetime rules nailed then there's the other issue of how
to describe the memory, and my take for that is that once the dma-api has
a clear answer we'll just blindly adopt that one and done.

And currently with either dynamic attachments and dma_addr_t or through
fishing the pfn from the cpu pagetables there's some very clearly defined
lifetime and locking rules (which kvm might get wrong, I've seen some
discussions fly by where it wasn't doing a perfect job with reflecting pte
changes, but that was about access attributes iirc). If we add something
new, we need clear rules and not just "here's the kvm code that uses it".
That's how we've done dma-buf at first, and it was a terrible mess of
mismatched expecations.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
