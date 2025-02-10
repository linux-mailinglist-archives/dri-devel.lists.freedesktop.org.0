Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387AA2FE84
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D7A10E404;
	Mon, 10 Feb 2025 23:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NcQS7yW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664CD10E404;
 Mon, 10 Feb 2025 23:39:19 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-866e924f735so1449151241.2; 
 Mon, 10 Feb 2025 15:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739230758; x=1739835558; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4J5WV+6IR7+S2waApgF1qBwpbiN//GCbixakjmicks=;
 b=NcQS7yW0bv6fsxyumcpCOwh+URkPkmVDXVFbDz5N0FIe8w7YUY2vl0VsM/779EB7Yl
 vw1nKs7xqoJkdF1ib3cJURCEgQRh9xZ6IYf4dSwOC8gtJqNhj6Kd9fMNPU+BzCsE6XfH
 o9QgSX2n59al+XSezM37I2+jplZ1Z2CJ0Vwu/snmLiacl2x8HKJusreC004PlruHUhmo
 JpBTf0NaD0uNMBqxn6D4Z0KUl8bUZ3suGpkKg1NstM+q6V/8w3jn91Zp1ouTCRSmoj2W
 ZHCr9Q0/Bnh608OMP005l9l13IuNJGjcgZ/0g6MTR3ELpGdXmdmUZvXo9wANR1wIAHMi
 WkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739230758; x=1739835558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4J5WV+6IR7+S2waApgF1qBwpbiN//GCbixakjmicks=;
 b=isurhDejPwVxqrqM26s4UssrbR0lXUkMUnGxaKMfJ5coh55Bg5A+uwbXFdpyw+a7hN
 wY7SCazI8viVhNX4Iz6YpH2qH6R/Iefgxc4Ba///i8NMTr1M4SM+oDtx4w3OjDxhzu0g
 7zHe3aUbcv6YyAU2ADcUYvl6KM33WypWPXS1I+WvpAsaWZoBhs+E5ZaHog+rdXEZGRIk
 LJLNiJ+5PwbQ/6W1mZhKa5etOO1QnEtvmMAN7rl+1jhPbh+IFfPSgMdd7XbW2LaGSGFp
 Spl03ufJ1Q+bYR7koskLNCkjSVtSEytaoyIGB1TwFP6vssMVGYwOj7txtb7aa+OVD1iI
 W6RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsBUM8JSCUiuEJagG4fKnCZCOTgngDCevZySeXTQvNntcY6cMK5sXJJZiWix3Jtw+70sSWgJ2Srw==@lists.freedesktop.org,
 AJvYcCXd2sM4Lkafo1DxrczJHyki0/BKSRJLhNQuU/GzWE5ipmL6rijiw3GrYISHrEeRI1eAHk6RPEQywSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqSy+4xh4JLeUhGy6xMiM/Xoj5IVq2JA/N0Ms6RFTLtRu/mDIr
 WW9tee1bD1FUZmtTSHswK07HvmbORYZgO7quRr3WjH5irFzHKT83quJO3rvaNc/qZtk3LWf5zoA
 85yao86IuJxMeVuO4fxF4FsVA9CU=
X-Gm-Gg: ASbGncsjCcw0J3iqnHHyumcSI15hE9y7N5Dk0x6UwEm93vuEW0iL1Qquv/Md3l7wOY/
 ac4ncKusN9210cQtmPKqqASleeEuligLbkAFunkf5M6rDT22z0ozKZp2IpBP5xtzuvBFvutyLRt
 meYkXuXyq7Gr4xyN56TG0+nEy34oD3JTU=
X-Google-Smtp-Source: AGHT+IEzfy3CbplemS9WcnlHDD6MpmxCskJpVqC7I5+Y9/ioGIApBpWu1Deqy+MADOJ9mj0OMU6KQgcPeg0LuaokY6w=
X-Received: by 2002:a05:6102:2b88:b0:4bb:ba51:7d48 with SMTP id
 ada2fe7eead31-4bbba51806cmr4870296137.5.1739230758203; Mon, 10 Feb 2025
 15:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20250210193801.781278-1-david@redhat.com>
 <20250210150515.c71078f212ff4661eafc15bf@linux-foundation.org>
In-Reply-To: <20250210150515.c71078f212ff4661eafc15bf@linux-foundation.org>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 11 Feb 2025 12:39:07 +1300
X-Gm-Features: AWEUYZmxTQri2-Cf24uNq3e2oUES2a1ywMTPcjyR3D9qOdCEqwTj81M6L3Eziec
Message-ID: <CAGsJ_4yVkJdKejof1CxJY1hkUSsQ-ziRzCTp9CBXdBJ-4d1HHw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] mm: fixes for device-exclusive entries (hmm)
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mm@kvack.org, nouveau@lists.freedesktop.org, 
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 damon@lists.linux.dev, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>, 
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 11, 2025 at 12:05=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Mon, 10 Feb 2025 20:37:42 +0100 David Hildenbrand <david@redhat.com> w=
rote:
>
> > Against mm-hotfixes-stable for now.
> >
> > Discussing the PageTail() call in make_device_exclusive_range() with
> > Willy, I recently discovered [1] that device-exclusive handling does
> > not properly work with THP, making the hmm-tests selftests fail if THPs
> > are enabled on the system.
> >
> > Looking into more details, I found that hugetlb is not properly fenced,
> > and I realized that something that was bugging me for longer -- how
> > device-exclusive entries interact with mapcounts -- completely breaks
> > migration/swapout/split/hwpoison handling of these folios while they ha=
ve
> > device-exclusive PTEs.
> >
> > The program below can be used to allocate 1 GiB worth of pages and
> > making them device-exclusive on a kernel with CONFIG_TEST_HMM.
> >
> > Once they are device-exclusive, these folios cannot get swapped out
> > (proc$pid/smaps_rollup will always indicate 1 GiB RSS no matter how
> > much one forces memory reclaim), and when having a memory block onlined
> > to ZONE_MOVABLE, trying to offline it will loop forever and complain ab=
out
> > failed migration of a page that should be movable.
> >
> > # echo offline > /sys/devices/system/memory/memory136/state
> > # echo online_movable > /sys/devices/system/memory/memory136/state
> > # ./hmm-swap &
> > ... wait until everything is device-exclusive
> > # echo offline > /sys/devices/system/memory/memory136/state
> > [  285.193431][T14882] page: refcount:2 mapcount:0 mapping:000000000000=
0000
> >   index:0x7f20671f7 pfn:0x442b6a
> > [  285.196618][T14882] memcg:ffff888179298000
> > [  285.198085][T14882] anon flags: 0x5fff0000002091c(referenced|uptodat=
e|
> >   dirty|active|owner_2|swapbacked|node=3D1|zone=3D3|lastcpupid=3D0x7ff)
> > [  285.201734][T14882] raw: ...
> > [  285.204464][T14882] raw: ...
> > [  285.207196][T14882] page dumped because: migration failure
> > [  285.209072][T14882] page_owner tracks the page as allocated
> > [  285.210915][T14882] page last allocated via order 0, migratetype
> >   Movable, gfp_mask 0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO=
),
> >   id 14926, tgid 14926 (hmm-swap), ts 254506295376, free_ts 22740202377=
4
> > [  285.216765][T14882]  post_alloc_hook+0x197/0x1b0
> > [  285.218874][T14882]  get_page_from_freelist+0x76e/0x3280
> > [  285.220864][T14882]  __alloc_frozen_pages_noprof+0x38e/0x2740
> > [  285.223302][T14882]  alloc_pages_mpol+0x1fc/0x540
> > [  285.225130][T14882]  folio_alloc_mpol_noprof+0x36/0x340
> > [  285.227222][T14882]  vma_alloc_folio_noprof+0xee/0x1a0
> > [  285.229074][T14882]  __handle_mm_fault+0x2b38/0x56a0
> > [  285.230822][T14882]  handle_mm_fault+0x368/0x9f0
> > ...
> >
> > This series fixes all issues I found so far.
>
> Cool.
>
> Barry, could you please redo your series "mm: batched unmap lazyfree
> large folios during reclamation" on top of this (on top of mm-unstable,
> ideally).

Sure. Thanks for letting me know.

>
