Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524E89E3AB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 21:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C00112F17;
	Tue,  9 Apr 2024 19:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QuUkHDqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16B112F13;
 Tue,  9 Apr 2024 19:37:28 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-56e1bbdb362so7358031a12.1; 
 Tue, 09 Apr 2024 12:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712691446; x=1713296246; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7QqV/MOJXotuQuCA0iZMxi0RbdJ1ro9852N1B/Dikp8=;
 b=QuUkHDqkIUTUevLjHo4MPOgssTPWhe6O1AEO1I2cDO2gJeP05RRCs8V7SGSHtELPBS
 J987UZWa9JHIo+/if4kCvz1ZJhJGETkPXHpRtFK2rTn64riHrTQWtHrHbzdNrRMxtp5D
 fRt1x2pTWFWCDjqCsB2QDqJ7JBWm0K3Mr8xuzAgx114MOTZKz0tKn+vl3C0ZFu6Z535R
 5k/OMJyWV/bIBti1oqG7hbIG67RS/IDVQLtr6WlnPq36mG9HACK41B0xu1OYGb6kDG5p
 fqhpBOTOCD9kccNG8IcV8Oun3B8Ag5UR782tYaFy8WW+ZqC+z0hSTl6g0CurxcdPAFYD
 +t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712691446; x=1713296246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7QqV/MOJXotuQuCA0iZMxi0RbdJ1ro9852N1B/Dikp8=;
 b=U5sC0alBXN/e1BxTTlqqv1G3mbX9rB5u69RlXTMgQBraAWkkflZ+0/qzftbjOoDUkz
 z9rCzSBA1GIOTbmQu6InCmxJZm8VCThGxKDss2FlsLK56skOrXB68LvJDj2HVzLHj8FS
 HStkVfkEVJFRzwqL+zqHrDFuioZntuQvxocepjKCMhHELEfvHirz1WBbtsashJQdamcR
 yTDJ1845wG8pgxlpw2x6FunhoKrFR9d/UnfAwG1hUmtnJgxlg1F05EB8w8vqq+osvV3M
 7AwbAIZeSr0/1DXWIzZrSUc9UQw/UJY9nmmuJhSGfI5qd6QgSwleWz87bFXD35T4CVXh
 jt2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJY8yUoShJTcY9ebUrVCFmjyKq4gSNrI18AZ8GQqHrDp5jVomVFrYdk0UkFBlavVA/ML2hjf5j9O+pZg8B8sQEiW+UzHvMmCVDR/NihvvwT5wjixYa7EhogkmX+DB1sMBLFPmtgvBSKG3U+4eaow==
X-Gm-Message-State: AOJu0YwqV1B+gR1fnBinyjHfyz3PZzjlmaNKfTaTE/DtxDW3WFkraw7J
 IFCjqUcp6tw75L5S3QXYhRWPCQvcUcj2EToC/L3t8Rnvw3+3OhQaYR5QzUVbej59I/sJudq52d/
 c34V5A1cByGYb3Yyld3VCVlNJn7I=
X-Google-Smtp-Source: AGHT+IFp5FIZNztbvSpyFUDHU0w1CVbITorUyRf5lQ1BLWJGUEbfMviAptRArA67cxLJTyJ/vIdIzF75wju3XDxdh7c=
X-Received: by 2002:a17:906:45a:b0:a47:34b2:ca4b with SMTP id
 e26-20020a170906045a00b00a4734b2ca4bmr300274eja.50.1712691445992; Tue, 09 Apr
 2024 12:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240409003401.2224446-1-airlied@gmail.com>
 <fcfb16a3a4bc53d4ac1724ab5649ee792977260f.camel@lynxeye.de>
 <36664f8f-0e6a-48a9-b9f9-7a6775007486@dakr.org>
In-Reply-To: <36664f8f-0e6a-48a9-b9f9-7a6775007486@dakr.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 10 Apr 2024 05:37:14 +1000
Message-ID: <CAPM=9tyvjaDA1kv2RcBLpaBZa8QXgefBR9p-r3UsAwCq9CKNZQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: fix instmem race condition around ptr stores
To: Danilo Krummrich <me@dakr.org>
Cc: Lucas Stach <dev@lynxeye.de>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 9 Apr 2024 at 21:33, Danilo Krummrich <me@dakr.org> wrote:
>
> On 4/9/24 10:27, Lucas Stach wrote:
> > Am Dienstag, dem 09.04.2024 um 10:34 +1000 schrieb Dave Airlie:
> >> From: Dave Airlie <airlied@redhat.com>
> >>
> >> Running a lot of VK CTS in parallel against nouveau, once every
> >> few hours you might see something like this crash.
> >>
> >> BUG: kernel NULL pointer dereference, address: 0000000000000008
> >> PGD 8000000114e6e067 P4D 8000000114e6e067 PUD 109046067 PMD 0
> >> Oops: 0000 [#1] PREEMPT SMP PTI
> >> CPU: 7 PID: 53891 Comm: deqp-vk Not tainted 6.8.0-rc6+ #27
> >> Hardware name: Gigabyte Technology Co., Ltd. Z390 I AORUS PRO WIFI/Z390 I AORUS PRO WIFI-CF, BIOS F8 11/05/2021
> >> RIP: 0010:gp100_vmm_pgt_mem+0xe3/0x180 [nouveau]
> >> Code: c7 48 01 c8 49 89 45 58 85 d2 0f 84 95 00 00 00 41 0f b7 46 12 49 8b 7e 08 89 da 42 8d 2c f8 48 8b 47 08 41 83 c7 01 48 89 ee <48> 8b 40 08 ff d0 0f 1f 00 49 8b 7e 08 48 89 d9 48 8d 75 04 48 c1
> >> RSP: 0000:ffffac20c5857838 EFLAGS: 00010202
> >> RAX: 0000000000000000 RBX: 00000000004d8001 RCX: 0000000000000001
> >> RDX: 00000000004d8001 RSI: 00000000000006d8 RDI: ffffa07afe332180
> >> RBP: 00000000000006d8 R08: ffffac20c5857ad0 R09: 0000000000ffff10
> >> R10: 0000000000000001 R11: ffffa07af27e2de0 R12: 000000000000001c
> >> R13: ffffac20c5857ad0 R14: ffffa07a96fe9040 R15: 000000000000001c
> >> FS:  00007fe395eed7c0(0000) GS:ffffa07e2c980000(0000) knlGS:0000000000000000
> >> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> CR2: 0000000000000008 CR3: 000000011febe001 CR4: 00000000003706f0
> >> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >> Call Trace:
> >>
> >> ...
> >>
> >>   ? gp100_vmm_pgt_mem+0xe3/0x180 [nouveau]
> >>   ? gp100_vmm_pgt_mem+0x37/0x180 [nouveau]
> >>   nvkm_vmm_iter+0x351/0xa20 [nouveau]
> >>   ? __pfx_nvkm_vmm_ref_ptes+0x10/0x10 [nouveau]
> >>   ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
> >>   ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
> >>   ? __lock_acquire+0x3ed/0x2170
> >>   ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
> >>   nvkm_vmm_ptes_get_map+0xc2/0x100 [nouveau]
> >>   ? __pfx_nvkm_vmm_ref_ptes+0x10/0x10 [nouveau]
> >>   ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
> >>   nvkm_vmm_map_locked+0x224/0x3a0 [nouveau]
> >>
> >> Adding any sort of useful debug usually makes it go away, so I hand
> >> wrote the function in a line, and debugged the asm.
> >>
> >> Every so often pt->memory->ptrs is NULL. This ptrs ptr is set in
> >> the nv50_instobj_acquire called from nvkm_kmap.
> >>
> >> If Thread A and Thread B both get to nv50_instobj_acquire around
> >> the same time, and Thread A hits the refcount_set line, and in
> >> lockstep thread B succeeds at refcount_inc_not_zero, there is a
> >> chance the ptrs value won't have been stored since refcount_set
> >> is unordered. Force a memory barrier here, I picked smp_mb, since
> >> we want it on all CPUs and it's write followed by a read.
>
> Good catch!
>
> >>
> >> Cc: linux-stable
> >> Signed-off-by: Dave Airlie <airlied@redhat.com>
> >> ---
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> >> index a7f3fc342d87..cbacc7b11f8c 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> >> @@ -250,6 +250,9 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
> >>                      iobj->base.memory.ptrs = &nv50_instobj_fast;
> >>              else
> >>                      iobj->base.memory.ptrs = &nv50_instobj_slow;
> >> +            /* barrier to ensure ptrs is written before another thread
> >> +               does refcount_inc_not_zero successfully. */
> >> +            smp_mb();
> >
> > Doesn't this miss the corresponding smp_rmb after
> > refcount_inc_not_zero? Without it a sufficiently speculating CPU might
> > still hoist the NULL ptr load across the refcount increase.
>
> Agree, also think this one could be smp_wmb() only.
>
> I also think it's reasonable to keep "the fast path refcount_inc_not_zero
> that doesn't take the lock", since the scope for this being potentially racy
> is limited to this function only.

I've been retesting with just barrier() here, since this seems at
least to be compiler related, but probably the smp_rmb/smp_wmb combo
is the safest answer across arches.

Dave.
