Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67899A0631A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FE510E8FC;
	Wed,  8 Jan 2025 17:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PstdYcgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF3710E8FC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:14:25 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so12710166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736356404; x=1736961204; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rKvx99e6g4Z0rpqLB9wRUAqjWOH2T8CbRV87JKLyuz8=;
 b=PstdYcgypvcDY5HK+VNEV7QQ5Cbs6IfNVUBuXoDVTK1sVrONb4JRbGand9ZNEe/LFw
 7/30DRFQUx7CKSzdSGh13tKyGML2P02frzqgHF3pQHs6SH2BLzM+ppsapqyhFJkEsli8
 Myjda3b3jbpuDNXIYNlcfte9QM03WdTubuvFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736356404; x=1736961204;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rKvx99e6g4Z0rpqLB9wRUAqjWOH2T8CbRV87JKLyuz8=;
 b=h29eTPrbQuF9BU0sp/PHVwdptd00yGpOYDAc5nz9dJ9vrll5WPHiWR7UHzY8gnkoU6
 3lWYw9xNrmf0fnObu6pAUicxtOKWtF/6xwz00dMKTkhqIHAIPZqBhedHCkY2rKzlMEx8
 74bR5LcUEnmYuaozTtCxM/e5gQY+mNs5hV86Dg3T2RzdvCtDgSl10TLvDfNKII64Q4bm
 akuE+sU6O+fHGstLD3p5dRwCfC/C9l7MWzyq/+3S1HnQOksf34VYehRNfYPXCPop7by1
 fV15gCMSyDcgS/qS+IXDZJcQnhU7/NUtYLlJDmXOKXhYL/txrFeBbAZmHoXbFGE2yzP0
 ZTcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4RJAAx5GHHXxX84dT0F2/hwteqZdPgu+KhtvVgXQEHs7lrZpdK7wfNVcjGZSxmVI18ftLiux3Xrg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsR/8j1Pw+/DpVeqp9YAiKqpiwIgN0jl8L38N7YBfUz/7EF/Vj
 62J2vU0ZNnqIQVjTlwyYXmKQRegOsrpxVbfYkMRbEwchwOCgeTQeG7+NOYUq3LxswvGHygyleFt
 Y
X-Gm-Gg: ASbGncu9iH6IuhpxXM/P5fjW+kpYEFca7pkFpm1p2z/VlNqsQg+onF2fWTdlFaDoE/n
 q9lMyhoPHFZFWuTX8zjQyo594eFW6xO9JUBudJFqcEhQ5ymeBCRpOwHUF/kcmGqdPkzW2Sd6irD
 6+G4SPo3rez8pn5UhjmzAfYKRkdnkcBl/vdquNKFzB0jE28MkviYPv1BwrrNU6FjA4PfC1BgOKB
 kmWEMJtAhCcZUzd1wc+wWLif03GZvtcnVXNdKBcIhcZlzcffH0t1HnRDyx8EnYASL+c
X-Google-Smtp-Source: AGHT+IEvX8sJF+22nN0j17naG8VSCjm7ShZTKBpfpfH1JpRjytMJdmQiTcsKEjTDhwAIeG3CgHjK7A==
X-Received: by 2002:a05:6000:156c:b0:386:1cd3:8a0e with SMTP id
 ffacd0b85a97d-38a8731007fmr3232471f8f.48.1736355930091; 
 Wed, 08 Jan 2025 09:05:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e357sm54692891f8f.72.2025.01.08.09.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:05:29 -0800 (PST)
Date: Wed, 8 Jan 2025 18:05:27 +0100
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
Message-ID: <Z36wV07M8B_wgWPl@phenom.ffwll.local>
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
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
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

On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wrote:
> 
> On 2024/12/22 9:59, Demi Marie Obenour wrote:
> > On 12/20/24 10:35 AM, Simona Vetter wrote:
> > > On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
> > > > From: Honglei Huang <Honglei1.Huang@amd.com>
> > > > 
> > > > A virtio-gpu userptr is based on HMM notifier.
> > > > Used for let host access guest userspace memory and
> > > > notice the change of userspace memory.
> > > > This series patches are in very beginning state,
> > > > User space are pinned currently to ensure the host
> > > > device memory operations are correct.
> > > > The free and unmap operations for userspace can be
> > > > handled by MMU notifier this is a simple and basice
> > > > SVM feature for this series patches.
> > > > The physical PFNS update operations is splited into
> > > > two OPs in here. The evicted memories won't be used
> > > > anymore but remap into host again to achieve same
> > > > effect with hmm_rang_fault.
> > > 
> > > So in my opinion there are two ways to implement userptr that make sense:
> > > 
> > > - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
> > >    notifier
> > > 
> > > - unpinnned userptr where you entirely rely on userptr and do not hold any
> > >    page references or page pins at all, for full SVM integration. This
> > >    should use hmm_range_fault ideally, since that's the version that
> > >    doesn't ever grab any page reference pins.
> > > 
> > > All the in-between variants are imo really bad hacks, whether they hold a
> > > page reference or a temporary page pin (which seems to be what you're
> > > doing here). In much older kernels there was some justification for them,
> > > because strange stuff happened over fork(), but with FOLL_LONGTERM this is
> > > now all sorted out. So there's really only fully pinned, or true svm left
> > > as clean design choices imo.
> > > 
> > > With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
> > > you?
> > 
> > +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
> > in complexity that pinning everything avoids.  Furthermore, this avoids the
> > host having to take action in response to guest memory reclaim requests.
> > This avoids additional complexity (and thus attack surface) on the host side.
> > Furthermore, since this is for ROCm and not for graphics, I am less concerned
> > about supporting systems that require swappable GPU VRAM.
> 
> Hi Sima and Demi,
> 
> I totally agree the flag FOLL_LONGTERM is needed, I will add it in next
> version.
> 
> And for the first pin variants implementation, the MMU notifier is also
> needed I think.Cause the userptr feature in UMD generally used like this:
> the registering of userptr always is explicitly invoked by user code like
> "registerMemoryToGPU(userptrAddr, ...)", but for the userptr release/free,
> there is no explicit API for it, at least in hsakmt/KFD stack. User just
> need call system call "free(userptrAddr)", then kernel driver will release
> the userptr by MMU notifier callback.Virtio-GPU has no other way to know if
> user has been free the userptr except for MMU notifior.And in UMD theres is
> no way to get the free() operation is invoked by user.The only way is use
> MMU notifier in virtio-GPU driver and free the corresponding data in host by
> some virtio CMDs as far as I can see.
> 
> And for the second way that is use hmm_range_fault, there is a predictable
> issues as far as I can see, at least in hsakmt/KFD stack. That is the memory
> may migrate when GPU/device is working. In bare metal, when memory is
> migrating KFD driver will pause the compute work of the device in
> mmap_wirte_lock then use hmm_range_fault to remap the migrated/evicted
> memories to GPU then restore the compute work of device to ensure the
> correction of the data. But in virtio-GPU driver the migration happen in
> guest kernel, the evict mmu notifier callback happens in guest, a virtio CMD
> can be used for notify host but as lack of mmap_write_lock protection in
> host kernel, host will hold invalid data for a short period of time, this
> may lead to some issues. And it is hard to fix as far as I can see.
> 
> I will extract some APIs into helper according to your request, and I will
> refactor the whole userptr implementation, use some callbacks in page
> getting path, let the pin method and hmm_range_fault can be choiced
> in this series patches.

Ok, so if this is for svm, then you need full blast hmm, or the semantics
are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userptr, this does
not work.

The other option is that hsakmt/kfd api is completely busted, and that's
kinda not a kernel problem.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
