Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DF8C7C89
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 20:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8831710E3C3;
	Thu, 16 May 2024 18:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hSTo1a+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A3710E3C3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 18:32:10 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ac9b225a91so423382a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 11:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715884329; x=1716489129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9nxwbG6gb8ueBywH4meN9WHXcrWE2uzTDdW5y8fNX4=;
 b=hSTo1a+20qbJpZsAJ3PafxoDjbEoILdp6wqi54m26h29YU5GbTixe7+iHd67WB9SC/
 ArkS2CQhijffznzGYayz6CGVwBKUSLpqlNiyGR5IKn/bzkINSeBEwE8O25cz2Xo8fbLZ
 Jyi2A8CVNn75ZJDhgd9TQz+m+NR5EeHPRuacYlN5vMQ/BAdQzRTDE0bh3LluUPY+KmW4
 W+2dQWh6SKW6LN2lyPERZtEFifGOp/NK87E9IIx68b48LT0NmwfTLivsAA7fPe8FO/7j
 PhOPDu7w87k+T5tFykah8/mqrLk8+FHFP3SK9us0KxJmplOerqpWR3seEXjs8DuHGXhf
 ZV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715884329; x=1716489129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e9nxwbG6gb8ueBywH4meN9WHXcrWE2uzTDdW5y8fNX4=;
 b=Vs3f7NMrrWsGwASgTKOlTrXPzPF0ZBTn003NokjbF49Pye+nuIcOhaJvYL07DLrW/b
 iTbG2cy68hQSmeATNVeSH+kCKIZK2DgRvGz3KizZ8unK3RuMqTQwWl6uGlz1DgPs208H
 5x/BQ7B9CcNpS2OIJOUZxzHn3aFiwqnvo4rHz9rjwA3tNtsuYv7lZ4AGLG+twnWl3aQn
 +mY8Hf7C7ULNE0JAcMdQoe2QmfEZ60PeGA9q8EEmiEEEcgFWLPEvqZF2dezbM9eEhE/3
 iVF5A6H+zOtF3qtdSpLeQGJ51rI8Uj/jzUNv+OgZFV6uVkGbWTFp3nBjjGrlWTlunF2Y
 NoiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL4Jply6FKwQWRdcWn+OBixspiaC1hV+wSXdPxk9+1YMcH3+cibehsA3QoY8VdNEUHZxbgwlPtZQAJlpSelTqoVS0kYbak4JNKwNCRk7PP
X-Gm-Message-State: AOJu0Yxo1qPzmLPmOtq1dlZB2lgZOqpaem949NrKIsjj9P2WHa2wYb6B
 hTNHnl07SWShmLf7NPitYavsbO116yzk7APwd6tA7Fr/XTRRpRrt01H41s6uoVWdslUbpKKUGtQ
 lbx3Ki6nhUlJUWWbL6pFpGO2OTuQ=
X-Google-Smtp-Source: AGHT+IHZ4P921nR29yCMtTxUXYhj08WmtLOz5u90bzk2FKHb1mib22+S/j0SRqZy3C/6k9WA6jxsHYZha5Y6GQCsDqY=
X-Received: by 2002:a17:90a:e009:b0:2b1:a632:60f6 with SMTP id
 98e67ed59e1d1-2b6ccef66abmr15883107a91.44.1715884329461; Thu, 16 May 2024
 11:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
 <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 May 2024 14:31:58 -0400
Message-ID: <CADnq5_NmC9bYkPFUD35gBtxsk_9jYhOTugni-q4WGXggf6=rLA@mail.gmail.com>
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

Arun is investigating and trying to repro it.  You still have a
polaris based GPU right?

Thanks,

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
