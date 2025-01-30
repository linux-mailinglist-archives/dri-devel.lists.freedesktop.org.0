Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB3A22BDC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 11:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7210E31C;
	Thu, 30 Jan 2025 10:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dbUF/quz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6C910E923
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 10:43:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso4153985e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 02:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738233808; x=1738838608; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q8o779/JKhHVNvMt9ae+MuGgQ6geVG8dZfqUZQIwBdU=;
 b=dbUF/quzr0PT2HYk2q9hd00uqylQrcfYnYjwxfJMaywbhZ92doUmt+lxIShB0TEzU+
 cKV53V9A8S+4MhvJ+kkY++4FdUDN0DHJxTUDJOL6bKq4edDPsIBlHcrlTinjPPuxYCEj
 zg8rNSU5kSxG53o9sfJ5VtXS7A3EsrIAQqDbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738233808; x=1738838608;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8o779/JKhHVNvMt9ae+MuGgQ6geVG8dZfqUZQIwBdU=;
 b=cT6IzUr1kkg62IctW0+D8Ne5Jw0rPq032BcHCWQ3f9vRbg4OoGdCXH0T6kwLxJE8Y+
 o1f2fMOEPXN8wsQ6ZkNQjJkDBg+I1Bc4E42tULo57rs1saExcUklhQyKoYPX9qECO/Ua
 +7bk+uQMOlMO5ys1lyyWRIgT787sX5zwI4yueUk7lpz4kTcbrqLYxU6MrVERvwo4V6un
 lSPT2jdU1zvOPQd4vcj3wBnM/baPVxn6aXypcZYFmP2f6noeNc5Ad9PtBZBd87IZQ4SI
 v1jP2NM0GC2eTz3wNlxcu7VkraFAb/mWhgvZvUCaPHSW1/WDNHlYWhUVUYEQsDrGoY0W
 ySgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUwtaMQZfPfoOE+ylJ8e5PnHfevS2ABnfg3JRf6Jg1c6qFLukDDCLruAkQexsimDv7873y87u0huM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvLU77BQGmniVHPmiS68zC4HOpfStVKbrmo3/WwSW/hhJPKhIG
 xiqA3PYAAE1Bpd8DC9jkxEU+3u1uBlzTkebr70WAOJl58+Ag8YcfqXHJnApmFg4=
X-Gm-Gg: ASbGncstovOI3wtFrjcXtcihzMKJuX40J7QcTtQ5BaYoZoeq9NaejftDMDMYltEYjvN
 E/cVDLmwP07ZJ+VnfiQoaVCPmfHHaTRIih1jG3zn0SyNZPKhScISef3G7wFmwrIKMN3jEibDkw3
 r0TUiWL8v6WpcIL2X7BUX1QuTKlajdAGD3ywciLuTr6uH8wCG4oCegl7fhgFRWYYhF6rBfOZxFe
 7aiHCsrdutW/LwiHhWHMDlRX2Hc9ja4AcEsdczs9w17aSL0E+yKujk7Ogdkp+beJnGLzhQY2nh6
 eiADrmxm9VMvI7i5AokL8ho7qSs=
X-Google-Smtp-Source: AGHT+IHoUvHshAGTRaYOTGv2HbproKUGTWM5vAaGbhLqj8z8OheIfWyoMmWPJMekjx89GDC8VcDxDQ==
X-Received: by 2002:a05:600c:c87:b0:434:f1e9:afb3 with SMTP id
 5b1f17b1804b1-438e0d879fdmr29012205e9.3.1738233808211; 
 Thu, 30 Jan 2025 02:43:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b579dsm1584246f8f.78.2025.01.30.02.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 02:43:27 -0800 (PST)
Date: Thu, 30 Jan 2025 11:43:25 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <Z5tXzV0vcKJg_wuM@phenom.ffwll.local>
Mail-Followup-To: Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
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

On Thu, Jan 30, 2025 at 11:27:37AM +1100, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> > Let's document how this function is to be used, and why the requirement
> > for the folio lock might maybe be dropped in the future.
> 
> Sorry, only just catching up on your other thread. The folio lock was to ensure
> the GPU got a chance to make forward progress by mapping the page. Without it
> the CPU could immediately invalidate the entry before the GPU had a chance to
> retry the fault.
> 
> Obviously performance wise having such thrashing is terrible, so should
> really be avoided by userspace, but the lock at least allowed such programs
> to complete.

Imo this is not a legit use-case. If userspace concurrently (instead of
clearly alternating) uses the same 4k page for gpu atomics and on the cpu,
it just gets to keep the fallout.

Plus there's no guarantee that we hold the folio_lock long enough for the
gpu to actually complete the atomic, so this isn't even really helping
with forward progress even if this somehow would be a legit usecase.

But this is also why thp is potentially an issue, because if thp
constantly creates pmd entries that potentially causes false sharing and
we do have thrashing that shouldn't happen.
-Sima

> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  mm/memory.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 46956994aaff..caaae8df11a9 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
> >  }
> >  #endif
> >  
> > +/**
> > + * restore_exclusive_pte - Restore a device-exclusive entry
> > + * @vma: VMA covering @address
> > + * @folio: the mapped folio
> > + * @page: the mapped folio page
> > + * @address: the virtual address
> > + * @ptep: PTE pointer into the locked page table mapping the folio page
> > + * @orig_pte: PTE value at @ptep
> > + *
> > + * Restore a device-exclusive non-swap entry to an ordinary present PTE.
> > + *
> > + * The folio and the page table must be locked, and MMU notifiers must have
> > + * been called to invalidate any (exclusive) device mappings. In case of
> > + * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
> > + * fault MMU_NOTIFY_EXCLUSIVE is triggered.
> > + *
> > + * Locking the folio makes sure that anybody who just converted the PTE to
> > + * a device-private entry can map it into the device, before unlocking it; so
> > + * the folio lock prevents concurrent conversion to device-exclusive.
> 
> I don't quite follow this - a concurrent conversion would already fail
> because the GUP in make_device_exclusive_range() would most likely cause
> an unexpected reference during the migration. And if a migration entry
> has already been installed for the device private PTE conversion then
> make_device_exclusive_range() will skip it as a non-present entry anyway.
> 
> However s/device-private/device-exclusive/ makes sense - the intent was to allow
> the device to map it before a call to restore_exclusive_pte() (ie. a CPU fault)
> could convert it back to a normal PTE.
> 
> > + * TODO: the folio lock does not protect against all cases of concurrent
> > + * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
> > + * must already use MMU notifiers to sync against any concurrent changes
> 
> Right. It's expected drivers are using MMU notifiers to keep page tables in
> sync, same as for hmm_range_fault().
> 
> > + * Maybe the requirement for the folio lock can be dropped in the future.
> > + */
> >  static void restore_exclusive_pte(struct vm_area_struct *vma,
> >  		struct folio *folio, struct page *page, unsigned long address,
> >  		pte_t *ptep, pte_t orig_pte)
> > -- 
> > 2.48.1
> > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
