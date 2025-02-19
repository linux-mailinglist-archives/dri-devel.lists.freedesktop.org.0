Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB18A3BFBD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140D10E2B7;
	Wed, 19 Feb 2025 13:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="R89VJYkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF01B10E2B7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:22:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4398738217aso29808925e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739971323; x=1740576123; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ItERCttD4ZqCJ2HvXTOXVmKnbOGbB9MYcRuiAClfxiU=;
 b=R89VJYknKBHmJABDLWvcbZpLJp0DWikX+0CgVPDkYo2voe9fHmqW7j6fBQkN1s+BH7
 5Ec8aDaRakEXfjDWCb0BUzzrKJxtq8Xy8vRkfpI+J34uexi7rW1zfEReUzasExcEmlGN
 NyuQoaMDw+r1wV4DzANo2M8wpHRa6DP4857rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739971323; x=1740576123;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ItERCttD4ZqCJ2HvXTOXVmKnbOGbB9MYcRuiAClfxiU=;
 b=bh53jEzpr740xsHUQ1OE2s38a88OmEJBqYB382nVKZDbvtNwQ8B7yoQLZBKgxLby1O
 UB8ZT90Co9aklzT0TwTkx+9QH7fbBJvrTjtPWPPpiim09breGQGqEkZyDl5TatYq3D1D
 1ntXHQCAB+3dgV964xtvis++utDDmKeFK1PqDdQu8DVs7+R9z7GoedQ01hn2Mzjzxa3g
 HkhxCJBahGyVGlVGg+ih0Z7uoOdkre3FBzhDjrtdGCrCGEd6zlRQJqtomGFb5oX7a2J3
 Kj2q775kJp5d/uUwx9eAM7g/FfOXdQu0wH8QNr9vH+2/GdSAaZIyGYPnJpOEx2h6qBmY
 nOmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUeHQrd53TUmDGBGKqQ3M+zaeInZT01vKIdyjOEbDbL5yievZmkC/Z0gJTZPsNm3zA2w6XYNshaoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzinhedhLvLj6ne5785j48e5j1bcpoCgP77qDCAAj+ZU3JRypp8
 UBANZe1FVjbj431pNdloz3c8xKT7BknvUdVIgDvwpGs1cg2t2RWPx6dSpPgJ7dQ=
X-Gm-Gg: ASbGncupylAK0ihvKty9ejj2M2/h9mhfS4oGv6Hju3utTrxY6c0q31XZwxVGHdqefHA
 sWkFS22lgnL1EJ0UJ9eKXWuPF/SmApPvYmI1WiLEQOBN4Vuy39DctEStIewjl3AXlztmEepyJyl
 yIjOAqkHHSpw7yp4mdJpv2fNyCkQfvDU61zeaX6IvMSXwUkVc6rHW3McPs8jx6fGlSJhESWraLM
 P55iNN3y/qf0OYh9ksk7EyAlgRPeFE4Dc5May7pX5noomUhTGuOX2WzQqgze/JfMVEs9sx25Sgc
 zB1EiAbFPQDnZJ4v0P+fSkgSfM8=
X-Google-Smtp-Source: AGHT+IFOilwBJ5aoh97zcLA4mj4xU/YMSCmbCjCXU9wojxNHTeliFqqcujswwLdduRHkO4EdT9IN9A==
X-Received: by 2002:a05:600c:1c18:b0:439:6e12:fdb4 with SMTP id
 5b1f17b1804b1-43999da3ac7mr40722565e9.14.1739971323224; 
 Wed, 19 Feb 2025 05:22:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5ef9sm17846401f8f.76.2025.02.19.05.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:22:02 -0800 (PST)
Date: Wed, 19 Feb 2025 14:22:00 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 op-tee@lists.trustedfirmware.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z7Xa-K0aOqcndICH@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 op-tee@lists.trustedfirmware.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com,
 Florent Tomasin <florent.tomasin@arm.com>
References: <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
 <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com>
 <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
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

On Tue, Feb 18, 2025 at 04:22:10PM +0000, Daniel Stone wrote:
> Hi Sumit,
> 
> On Mon, 17 Feb 2025 at 06:13, Sumit Garg <sumit.garg@linaro.org> wrote:
> > On Fri, 14 Feb 2025 at 21:19, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > I would say one heap per-profile.
> >
> > And then it would have a per vendor multiplication factor as each
> > vendor enforces memory restriction in a platform specific manner which
> > won't scale.
> 
> Yes, they do enforce it in a platform-specific manner, but so does
> TEE. There is no one golden set of semantics which is globally
> applicable between all hardware and all products in a useful manner.
> 
> So, if we define protected,secure-video +
> protected,secure-video-record + protected,trusted-ui heap names, we
> have exactly the same number of axes. The only change is from uint32_t
> to string.
> 
> > > > Christian gave an historical background here [1] as to why that hasn't
> > > > worked in the past with DMA heaps given the scalability issues.
> > > >
> > > > [1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532f71@gmail.com/
> > >
> > > Hm, I fail to see where Christian dismiss the dma-heaps solution in
> > > this email. He even says:
> > >
> > > > If the memory is not physically attached to any device, but rather just
> > > memory attached to the CPU or a system wide memory controller then
> > > expose the memory as DMA-heap with specific requirements (e.g. certain
> > > sized pages, contiguous, restricted, encrypted, ...).
> >
> > I am not saying Christian dismissed DMA heaps but rather how
> > scalability is an issue. What we are proposing here is a generic
> > interface via TEE to the firmware/Trusted OS which can perform all the
> > platform specific memory restrictions. This solution will scale across
> > vendors.
> 
> I read something completely different into Christian's mail.
> 
> What Christian is saying is that injecting generic constraint solving
> into the kernel doesn't scale. It's not OK to build out generic
> infrastructure in the kernel which queries a bunch of leaf drivers and
> attempts to somehow come up with something which satisfies
> userspace-provided constraints.

Fully agreeing. The one thing we discussed, but haven't implemented yet,
is that we'd add sysfs links from devices to the dma-heaps they support.
Including allowing for priorities and different use-cases on the same
device. We just haven't gotten there yet.

But even with that it's up to userspace to do the constraint solving, not
the kernel.

> But this isn't the same thing as saying 'dma-heaps is wrong'! Again,
> there is no additional complexity in the kernel between a dma-heap
> which bridges over to TEE, and a TEE userspace interface which also
> bridges over to TEE. Both of them are completely fine according to
> what he's said.
>
> > > Honestly, when I look at dma-heap implementations, they seem
> > > to be trivial shells around existing (more complex) allocators, and the
> > > boiler plate [1] to expose a dma-heap is relatively small. The dma-buf
> > > implementation, you already have, so we're talking about a hundred
> > > lines of code to maintain, which shouldn't be significantly more than
> > > what you have for the new ioctl() to be honest.
> >
> > It will rather be redundant vendor specific code under DMA heaps
> > calling into firmware/Trusted OS to enforce memory restrictions as you
> > can look into Mediatek example [1]. With TEE subsystem managing that
> > it won't be the case as we will provide a common abstraction for the
> > communication with underlying firmware/Trusted OS.
> 
> Yes, it's common for everyone who uses TEE to implement SVP. It's not
> common for the people who do _not_ use TEE to implement SVP. Which
> means that userspace has to type out both, and what we're asking in
> this thread is: why?
> 
> Why should userspace have to support dma-heap allocation for platforms
> supporting SVP via a static DT-defined carveout as well as supporting
> TEE API allocation for platforms supporting SVP via a dynamic
> carveout? What benefit does it bring to have this surfaced as a
> completely separate uAPI?
> 
> > > And I'll insist on what
> > > Daniel said, it's a small price to pay to have a standard interface to
> > > expose to userspace. If dma-heaps are not used for this kind things, I
> > > honestly wonder what they will be used for...
> >
> > Let's try not to forcefully find a use-case for DMA heaps when there
> > is a better alternative available.
> 
> What makes it better? If you could explain very clearly the benefit
> userspace will gain from asking TEE to allocate $n bytes for
> TEE_IOC_UC_SECURE_VIDEO_PLAY, compared to asking dma-heap to allocate
> $n bytes for protected,secure-video, I think that would really help.
> Right now, I don't understand how it would be better in any way
> whatsoever for userspace. And I think your decision to implement it as
> a separate API is based on a misunderstanding of Christian's position.
> 
> > I am still failing to see why you
> > don't consider following as a standardised user-space interface:
> >
> > "When user-space has to work with restricted memory, ask TEE device to
> > allocate it"
> 
> As far as I can tell, having userspace work with the TEE interface
> brings zero benefit (again, please correct me if I'm wrong and explain
> how it's better). The direct cost - call it a disbenefit - it brings
> is that we have to spend a pile of time typing out support for TEE
> allocation in every media/GPU/display driver/application, and when we
> do any kind of negotiation, we have to have one protocol definition
> for TEE and one for non-TEE.
> 
> dma-heaps was created to solve the problem of having too many
> 'allocate $n bytes from $specialplace' uAPIs. The proliferation was
> painful and making it difficult for userspace to do what it needed to
> do. Userspace doesn't _yet_ make full use of it, but the solution is
> to make userspace make full use of it, not to go create entirely
> separate allocation paths for unclear reasons.
> 
> Besides, I'm writing this from a platform that implements SVP not via
> TEE. I've worked on platforms which implement SVP without any TEE,
> where the TEE implementation would be at best a no-op stub, and at
> worst flat-out impossible.
> 
> So that's 'why not TEE as the single uAPI for SVP'. So, again, let's
> please turn this around: _why_ TEE? Who benefits from exposing this as
> completely separate to the more generic uAPI that we specifically
> designed to handle things like this?

Completely concurring on everything said above. TEE exposed through a
dma-buf heap (or maybe special v4l allocation flag for secure video
playback) and then we prime import that on the display side. Maybe also
through drm render drivers for the EGL/VK protected content extensions.
Same for any other hw means to allocate content protected buffers, TEE is
not special here at all.

Anything else needs seriously good justifications why the entire dma-buf
heap design is busted.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
