Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C167DA1B924
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 16:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ECB10E9C1;
	Fri, 24 Jan 2025 15:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="akcMk1ic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B0310E9C1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 15:29:00 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so1232034f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737732539; x=1738337339; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+AUOleCAQXNWX4R6WEOCPMezKuf6jJkTIyVfG+jJvY=;
 b=akcMk1icjUc2NJYeCBvET6aLYxpB9hA+dz5cCmjw61qjzHkm/05+UGh2XiXswCUuHW
 lues6RJXDrzE7yrseo1GfqnKARIbSF+8Q48ezxEG/fNjIOiS6j0VmN0qib3SKLqjfqvV
 UX5++SNcaczspj6JyGjX2sHt9Vk9ryPzJASgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737732539; x=1738337339;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+AUOleCAQXNWX4R6WEOCPMezKuf6jJkTIyVfG+jJvY=;
 b=T/N7B4sCUukmeeUFgts9G5RfBW/jXPyoP0rObbVrST2WRn7s1LxChSypwr9QSLYcGR
 +lEyQg0p6Yjf0fYY/DTjBFfl0Hd4CP5/bncPF5yB23g/G2gVLJq25kWICZ4S7JET9t0R
 HE+ctO351jAbN99B1bC1fWGPDJ9NBwyaBytHty6V6betMnkuf2MJF7HcbAPtHU7GmpP8
 4H1BrzT3Cln7s+9tQDUvPEhOgs/BTz5DuZlAICG9YERK0BWU6+uYbh4+9Ov7s0CMb39+
 ulhfYrHguzZ3ujbupPkpyaFjhzxPRBzhhtX2NZrBLF4/qsfb3r0iM9LAYpVQAt3hHP8Z
 CI3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXatnxtagjwbzdkoEoYCT7YA05FCzO43zXGjXjevrJMr/xjnL+AgByTwv84LVAyehQbra1mzGptY+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB48P9Vft+5gSgq9fGlNlur3nEuxlRjKcxsG/3903lO524mXBx
 nDpWHYsWaeBNM676OVjt6IS+VSrINJPokcEM9ROelLE6j5sY82T/kPvba9BdPmI=
X-Gm-Gg: ASbGncvugHz9oQkiCA4+7v4QEcyKNhec1GXTPSTNnGA08natyNna4PfDE+WmOl54Ryt
 KQ82CPOOmC/pl3XuB5tWtsW+MjZR2hnRlkEj63XGhz+BqMmjVol19EoGmDQG4jrSxe4uZpkDgiX
 pf99gRUkqQJUJFkvtT9AUhWx1BlL5BemTz/kiHSwDLXZ3BS8kAXB3Cjx05oOS0EuTnTEZhE1voT
 e4kFHPQYF7SgFFJMOwWTCF0QcF/1H4vAa/CL+pv72yMFdPt5z20wcXg4ehoLzZgj0B4zjrzd8sc
 49VSPPw/35/zdEGr
X-Google-Smtp-Source: AGHT+IG7AtKSShZbMOeW1UKchLmGsIKlwNKebn/4Phf0AM9NhDt5TUVmFQc7i/i3BJ2+0nT3Qeq81w==
X-Received: by 2002:a5d:64e9:0:b0:386:2ebe:7ae2 with SMTP id
 ffacd0b85a97d-38bf57b8aa7mr28516016f8f.45.1737732539149; 
 Fri, 24 Jan 2025 07:28:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17662bsm3012012f8f.4.2025.01.24.07.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 07:28:58 -0800 (PST)
Date: Fri, 24 Jan 2025 16:28:56 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
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

On Fri, Jan 24, 2025 at 11:44:28AM +0100, David Hildenbrand wrote:
> On 23.01.25 16:08, Simona Vetter wrote:
> > On Thu, Jan 23, 2025 at 11:20:37AM +0100, David Hildenbrand wrote:
> > > Hi,
> > > 
> > > I keep finding issues in our implementation of "device exclusive non-swap
> > > entries", and the way it messes with mapcounts is disgusting.
> > > 
> > > As a reminder, what we do here is to replace a PTE pointing to an anonymous
> > > page by a "device exclusive non-swap entry".
> > > 
> > > As long as the original PTE is in place, the only CPU can access it, as soon
> > > as the "device exclusive non-swap entry" is in place, only the device can
> > > access it. Conversion back and forth is triggered by CPU / device faults.
> > > 
> > > I have fixes/reworks/simplifications for most things, but as there is only a
> > > "real" single user in-tree of make_device_exclusive():
> > > 
> > > 	drivers/gpu/drm/nouveau/nouveau_svm.c
> > > 
> > > to "support SVM atomics in Nouveau [1]"
> > > 
> > > naturally I am wondering: is this still a thing on actual hardware, or is it
> > > already stale on recent hardware and not really required anymore?
> > > 
> > > 
> > > [1] https://lore.kernel.org/linux-kernel//6621654.gmDyfcmpjF@nvdebian/T/
> > 
> 
> Thanks for your answer!
> 
> Nvidia folks told me on a different channel that it's still getting used.
> 
> > As long as you don't have a coherent interconnect it's needed. On intel
> > discrete device atomics require device memory, so they need full hmm
> > migration (and hence wont use this function even once we land intel gpu
> > svm code in upstream).
> 
> Makes sense.
> 
> > On integrated the gpu is tied into the coherency
> > fabric, so there it's not needed.
> > 
> > I think the more fundamental question with both this function here and
> > with forced migration to device memory is that there's no guarantee it
> > will work out.
> 
> Yes, in particular with device-exclusive, it doesn't really work with THP
> and is only limited to anonymous memory. I have patches to at least make it
> work reliably with THP.

I should have crawled through the implementation first before replying.
Since it only looks at folio_mapcount() make_device_exclusive() should at
least in theory work reliably on anon memory, and not be impacted by
elevated refcounts due to migration/ksm/thp/whatever. This is unlike
device atomics that require migration to device memory, which is just
fundamentally not a reliable thing.

> Then, we seem to give up too easily if we cannot lock the folio when wanting
> to convert to device-exclusive, which also looks rather odd. But well, maybe
> it just works good enough in the common case, or there is some other retry
> logic that makes it fly.

I've crawled through the path to migrate pages from device memory back to
system memory a few months ago, and found some livelock issues in there.
Wouldn't be surprised if m_d_e has some of the same, but I didn't dig
through it (least because intel can't use it because not-so-great hw
design).

> > At least that's my understanding. And for this gpu device
> > atomics without coherent interconnect idea to work, we'd need to be able
> > to guarantee that we can make any page device exclusive. So from my side I
> > have some pretty big question marks on this entire thing overall.
> 
> I don't think other memory (shmem/file/...) is really feasible as soon as
> other processes (not the current process) map/write/read file pages.

Yeah none of the apis that use this internally in their implementations
make any promises beyond memory acquired with libc's malloc() or one of
the variants. So this limitation is fine.

> We could really only handle if we converted a single PTE and that PTE is
> getting converted back again.
> 
> There are other concerns I have (what if the page is pinned and access
> outside of the user space page tables?). Maybe there was not need to handle
> these cases so far.

I think that's also ok, but might be good to document this clearly that
concurrent direct i/o or rdma registered buffer or whatever will mess with
this. The promise is only between the gpu and the cpu, not anything else,
in current apis. At least to my knowledge.

> So best I can do is make anonymous memory more reliable with
> device-exclusive and fixup some of the problematic parts that I see (e.g.,
> broken page reclaim, page migration, ...).
> 
> But before starting to cleanup+improve the existing handling of anonymous
> memory, I was wondering if this whole thing is getting used at all.

Yeah if this can be made reliable (under the limitation of only anon
memory and only excluding userspace access) then I expect we'll need this
for a very long time. I just had no idea whether even that is possible.

What isn't good is if it's only mostly reliable, like the current
pgmap->ops->migrate_to_ram() path in do_swap_page() still is. But that one
is fixable, the patches should be floating around somewhere.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
