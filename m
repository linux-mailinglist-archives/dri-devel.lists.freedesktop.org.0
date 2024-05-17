Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF28C8789
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 15:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B8610EED8;
	Fri, 17 May 2024 13:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IIU7cYPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1B010EEDD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 13:55:19 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1ec69e3dbcfso10297205ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715954118; x=1716558918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ZxQSJrLWHCfnaAsDV35fIgvxplbZ5Wh2f2VjoJkfWc=;
 b=IIU7cYPLVFY4T3VII8/l9htlKKSGLSjiN66PKxRpGrqb3S1o3SyoEx334kYwQYvHNo
 J9NG/qtxFx2BZZvFrPfMHRZgN03RtcFJsE89Mv9uqRuqc4ZQJJFedBO3ngfWBwk94F7q
 tQ2VebuV9uVvEewTAnc4Uq0AxdNbIx3q5/Y4sal5AYeitLDNTdhW9C2PzaIJEPOryh97
 IyP9JKLSTMZ9dXSsYNgLuB80eHijMNJP/gaXDBt1FOmCU89B9XjdQqeoFbM+uSh5tV7E
 F0raKlwbGDdhnGeSZg/E/nMYwoA7ME/MVfKO7kRa8wyrK/la0VCm4o8sl92WWvxxEIdw
 kDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715954118; x=1716558918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ZxQSJrLWHCfnaAsDV35fIgvxplbZ5Wh2f2VjoJkfWc=;
 b=eXArv0JwXyyC7PikfHZuxthiEfRwJ/QEEPJ+j5b5Buca9WxhvzjCojK0FPBJZaPxEn
 bqYvMOrFoywn/+rvC31ViP3DUd5wa+bxvQfJrzCpZa1rTcz0XDVbg09TYNgmIwYNRrh9
 W+DXg7JKuHGpYEso9gFX8RfzBMS635/N1XiKNgmQkVyGsjQgav/hvuSKnAnvi+8DBT9C
 zPUHo1M4c36DvID6gWnFQaCOQ9nzXo+OQoc2rUNBcl0nE1OR/VVlSOv988QWE4YlhcN1
 s3Rl8qDD9eP4jn4VIQrbCoRGk8rUrHxSt+spf9RQBoGMt0NiEDBGIayfvcg3K56nNAeH
 V69g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF49sXPfZP5n1g69CG4xiN4GF0zTbXwJYUHMBFAi0Dq3ew+uGVqE/tHj/DOmYsmJfgqO2NsfAlVfpwtsA3tsZ8uUEbCfQqHxZgxEunp5hB
X-Gm-Message-State: AOJu0YwDpGfPMEB/z3B4yt5S5dA/fQHKjRoV6HJFQu47orHYxvRvSrgk
 SKfh5qmPadrhiwJzXA0gpYQwSmZcN+buxQbCrzV92r1Ji1Up9KdTiaW9rPencH1VUbrZOZ1lhBt
 RHSnRYwUTON8r2ulAePSeKKe07lSe2tQd
X-Google-Smtp-Source: AGHT+IGwEX78O0IPn/LXQEz9L1cBE2phMOdId85UeU23Pc2FrTGewlbOW/8t6Hjkh2Ub/HWo7jrIvmSVn/vzYm5neUc=
X-Received: by 2002:a05:6a20:914f:b0:1ad:89e:21b5 with SMTP id
 adf61e73a8af0-1afde0d4ce4mr24848771637.15.1715954118578; Fri, 17 May 2024
 06:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
 <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 May 2024 09:55:07 -0400
Message-ID: <CADnq5_P3pR8C=SsZWv85h7rZUxxfoQBeMsNbTWnLpOqeQ-2m=Q@mail.gmail.com>
Subject: Re: [git pull] drm urgent for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, May 16, 2024 at 2:02=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 15 May 2024 at 19:54, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Here is the buddy allocator fix I picked up from the list, please apply=
.
>
> So I removed my reverts, and am running a kernel that includes the
> merge 972a2543e3dd ("Merge tag 'drm-next-2024-05-16' of
> https://gitlab.freedesktop.org/drm/kernel") but I still see a lot of
> warnings as per below.
>
> I was going to say that the difference is that now they trigger
> through the page fault path (amdgpu_gem_fault) while previously they
> triggered through the system call path and amdgpu_drm_ioctl. But it
> turns out it's both in both cases, and it just happened to be one or
> the other in the particular warnings that I cut-and-pasted.
>
> As before, there are tens of thousands of them after being up for less
> than an hour, so this is not some kind of rare thing.
>
> The machine hasn't _crashed_ yet, though. But I'm going to be out and
> about and working on my laptop the rest of the day, so I won't be able
> to test.
>
> (And that kernel version of "6.9.0-08295-gfd39ab3b5289" that is quoted
> in the WARN isn't some official kernel, I have about ten private
> patches that I keep testing in my tree, so if you wondered what the
> heck that git version is, it's not going to match anything you see,
> but the ~ten patches also aren't relevant to this).
>
> Nothing unusual in the config, although this is clang-built. Shouldn't
> matter, never has before.

Can you try this patch?
https://patchwork.freedesktop.org/patch/594539/

Alex

>
>             Linus
>
> ---
> CPU: 28 PID: 3326 Comm: mutter-x11-fram Tainted: G        W
> 6.9.0-08295-gfd39ab3b5289 #64
> Hardware name: Gigabyte Technology Co., Ltd. TRX40 AORUS MASTER/TRX40
> AORUS MASTER, BIOS F7 09/07/2022
> RIP: 0010:__force_merge+0x14f/0x180 [drm_buddy]
> Code: 74 0d 49 8b 44 24 18 48 d3 e0 49 29 44 24 30 4c 89 e7 ba 01 00
> 00 00 e8 9f 00 00 00 44 39 e8 73 1f 49 8b 04 24 e9 25 ff ff ff <0f> 0b
> 4c 39 c3 75 a3 eb 99 b8 f4 ff ff ff c3 b8 f4 ff ff ff eb 02
> RSP: 0000:ffff9e350314baa0 EFLAGS: 00010246
> RAX: ffff974a227a4a00 RBX: ffff974a2d024b88 RCX: 000000000b8eb800
> RDX: ffff974a2d024bf8 RSI: ffff974a2d024bd0 RDI: ffff974a2d024bb0
> RBP: 0000000000000000 R08: ffff974a2d024b88 R09: 0000000000001000
> R10: 0000000000000800 R11: 0000000000000000 R12: ffff974a2198fa18
> R13: 0000000000000009 R14: 0000000010000000 R15: 0000000000000000
> FS:  00007f56a78b6540(0000) GS:ffff97591e700000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f5688040000 CR3: 0000000198cc9000 CR4: 0000000000350ef0
> Call Trace:
>  <TASK>
>  ? __warn+0xc1/0x190
>  ? __force_merge+0x14f/0x180 [drm_buddy]
>  ? report_bug+0x129/0x1a0
>  ? handle_bug+0x3d/0x70
>  ? exc_invalid_op+0x16/0x40
>  ? asm_exc_invalid_op+0x16/0x20
>  ? __force_merge+0x14f/0x180 [drm_buddy]
>  drm_buddy_alloc_blocks+0x249/0x400 [drm_buddy]
>  ? __cond_resched+0x16/0x40
>  amdgpu_vram_mgr_new+0x204/0x3f0 [amdgpu]
>  ttm_resource_alloc+0x31/0x120 [ttm]
>  ttm_bo_alloc_resource+0xbc/0x260 [ttm]
>  ? memcg_account_kmem+0x4a/0xe0
>  ? ttm_resource_compatible+0xbb/0xe0 [ttm]
>  ttm_bo_validate+0x9f/0x210 [ttm]
>  ? __alloc_pages+0x129/0x210
>  amdgpu_bo_fault_reserve_notify+0x98/0x110 [amdgpu]
>  amdgpu_gem_fault+0x53/0xd0 [amdgpu]
>  __do_fault+0x41/0x140
>  do_pte_missing+0x453/0xfd0
>  handle_mm_fault+0x73c/0x1090
>  do_user_addr_fault+0x2e2/0x6f0
>  exc_page_fault+0x56/0x110
>  asm_exc_page_fault+0x22/0x30
