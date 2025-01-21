Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAFA181C1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 17:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3525D10E601;
	Tue, 21 Jan 2025 16:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jSGli7TL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD25210E601
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 16:12:36 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3021922f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 08:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737475895; x=1738080695; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3TZ7bh5A7EZSnsLkgxiyqxFy8dvQ9QyQVZnf6qscv2k=;
 b=jSGli7TLST/JXfXdqzahIBKviwJsj3djoNzCEgfw/GptrDxJIPZyf4xbH1cvtVwbig
 HWCE8edxRzFn7uD4jP86PlLcw0g7WEJd3anCEG8EeZJBUn+2nkTfkRjGb0HLCra68sJT
 +QIywR0Elj3RQPrGTXVbR3Q/TenH8wBRo48GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737475895; x=1738080695;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3TZ7bh5A7EZSnsLkgxiyqxFy8dvQ9QyQVZnf6qscv2k=;
 b=DGyVuFUeRK4taSnMaChnLiq04peGwMzbLpdhQaRqOsxp9jgeQ/jaOoMS3TruvhHaHx
 g2EtPlrt/DF3c1KDwjqkzVeN3WbS5Il/y9WiXYem2AXwPR7xIkt8kEwwld0gUf+V+uxU
 ec7uWmsTVG6Z8tOsGgudrSsIpmrtmU8T5Tk6cVZIy57L2R/dxnhGPX9QHbNsg3X1ehrr
 zpi7DU3NPoorvoHDKjVdMVSZ4DVorUwhb2pNLaAlEmSEFwizR+6ZO3k9bmhFNMc7N80v
 jvCAFC+qSRufAP3jtoh0iobvFRFcDOCy0uhd/hkTbTFM942KuHwN/zy9yt22g47xu1Bl
 iQBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU83LrS0Edc5OGl2vi/VVwtC9YUEBeGBRiY1VQB+qFVg+zMqXyKtRCfgm3vBhoyesnvpUBsXBcgsrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt3jElhplI/1uaKfWq0/rgF0EHmlEGqtqNdC3TErC4thYHU2hI
 BnIX+cFLl1Im/Ieg6nEt4KAkQh88QWL2C6HZT0Js/hUjYmmDhiOlGffcONjFTdM=
X-Gm-Gg: ASbGncsMA2ouLSY9lKNY0Z/V4+vWkkY2PliRw0cvr1zf7B7rL0ffNjWONAd2E74raCO
 DCu2XJsYBbytTowIZuQSNgxguDSIYSddIHSaYRDbK1lF6MyVWxGSMiltZNHdegtZiGKFS0UEH1e
 AlsuSVxdajdkzvYv+agEgHeXaT2S4pcttIJX3BLon+oR8WieMGMjNg8KW28VuSinQ3VJ2bWDRAp
 6fdLuJh3XpdYGUntgBWyyrfEU3BvJRX3Ob0ZDYFydUc7aGkW83KBxvWiyi7sHFafaE/4Pxr3NkI
 SJP4INuOiB5SbcUk
X-Google-Smtp-Source: AGHT+IEfWEjj/q32mCraGgQNxIiqVriBvUHyDamWB6hpE5IzhQZsU39uZ8fQcOOtWX//LMCPZR86zQ==
X-Received: by 2002:a5d:4845:0:b0:385:f573:1f78 with SMTP id
 ffacd0b85a97d-38bf566e2b2mr13104592f8f.24.1737475895196; 
 Tue, 21 Jan 2025 08:11:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e06asm14026067f8f.95.2025.01.21.08.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 08:11:34 -0800 (PST)
Date: Tue, 21 Jan 2025 17:11:32 +0100
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
Message-ID: <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
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
References: <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
 <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
 <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com>
 <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
 <20250120194804.GT5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120194804.GT5556@nvidia.com>
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

On Mon, Jan 20, 2025 at 03:48:04PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 20, 2025 at 07:50:23PM +0100, Simona Vetter wrote:
> > On Mon, Jan 20, 2025 at 01:59:01PM -0400, Jason Gunthorpe wrote:
> > > On Mon, Jan 20, 2025 at 01:14:12PM +0100, Christian König wrote:
> > > What is going wrong with your email? You replied to Simona, but
> > > Simona Vetter <simona.vetter@ffwll.ch> is dropped from the To/CC
> > > list??? I added the address back, but seems like a weird thing to
> > > happen.
> > 
> > Might also be funny mailing list stuff, depending how you get these. I
> > read mails over lore and pretty much ignore cc (unless it's not also on
> > any list, since those tend to be security issues) because I get cc'ed on
> > way too much stuff for that to be a useful signal.
> 
> Oh I see, you are sending a Mail-followup-to header that excludes your
> address, so you don't get any emails at all.. My mutt is dropping you
> as well.
> 
> > Yeah I'm not worried about cpu mmap locking semantics. drm/ttm is a pretty
> > clear example that you can implement dma-buf mmap with the rules we have,
> > except the unmap_mapping_range might need a bit fudging with a separate
> > address_space.
> 
> From my perspective the mmap thing is a bit of a side/DRM-only thing
> as nothing I'm interested in wants to mmap dmabuf into a VMA.

I guess we could just skip mmap on these pfn exporters, but it also means
a bit more boilerplate. At least the device mapping / dma_buf_attachment
side should be doable with just the pfn and the new dma-api?

> However, I think if you have locking rules that can fit into a VMA
> fault path and link move_notify to unmap_mapping_range() then you've
> got a pretty usuable API.
> 
> > For cpu mmaps I'm more worried about the arch bits in the pte, stuff like
> > caching mode or encrypted memory bits and things like that. There's
> > vma->vm_pgprot, but it's a mess. But maybe this all is an incentive to
> > clean up that mess a bit.
> 
> I'm convinced we need meta-data along with pfns, there is too much
> stuff that needs more information than just the address. Cachability,
> CC encryption, exporting device, etc. This is a topic to partially
> cross when we talk about how to fully remove struct page requirements
> from the new DMA API.
> 
> I'm hoping we can get to something where we describe not just how the
> pfns should be DMA mapped, but also can describe how they should be
> CPU mapped. For instance that this PFN space is always mapped
> uncachable, in CPU and in IOMMU.

I was pondering whether dma_mmap and friends would be a good place to
prototype this and go for a fully generic implementation. But then even
those have _wc/_uncached variants.

If you go into arch specific stuff, then x86 does have wc/uc/... tracking,
but only for memory (set_page_wc and friends iirc). And you can bypass it
if you know what you're doing.

> We also have current bugs in the iommu/vfio side where we are fudging
> CC stuff, like assuming CPU memory is encrypted (not always true) and
> that MMIO is non-encrypted (not always true)

tbf CC pte flags I just don't grok at all. I've once tried to understand
what current exporters and gpu drivers do and just gave up. But that's
also a bit why I'm worried here because it's an enigma to me.

> > I thought iommuv2 (or whatever linux calls these) has full fault support
> > and could support current move semantics. But yeah for iommu without
> > fault support we need some kind of pin or a newly formalized revoke model.
> 
> No, this is HW dependent, including PCI device, and I'm aware of no HW
> that fully implements this in a way that could be useful to implement
> arbitary move semantics for VFIO..

Hm I thought we've had at least prototypes floating around of device fault
repair, but I guess that only works with ATS/pasid stuff and not general
iommu traffic from devices. Definitely needs some device cooperation since
the timeouts of a full fault are almost endless.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
