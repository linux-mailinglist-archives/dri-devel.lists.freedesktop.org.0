Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05DB91E5F9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 18:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D38210E488;
	Mon,  1 Jul 2024 16:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jg1gp8vZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAE410E479;
 Mon,  1 Jul 2024 16:55:25 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2c5362c7c0bso1780442a91.1; 
 Mon, 01 Jul 2024 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719852925; x=1720457725; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zQw9si+2zXQ439aHNWT2jvrwQCyc4dmYRCUWjQeo2eM=;
 b=jg1gp8vZISt0F55NnrbwvWtgekVB1MJP0PTGcLcepPBv3RLid37+wbqxv9/vsJ8z1B
 RTCOKtTlsUM1m3WE8jU209E/ovTKhpsPXzlFpSbXpCH5u/NkT7cAjm4d0AY4Y6x6sfNc
 iCX/FACLJNydg0GxLywrWqIwuSv2l/XniRFYQMSOYuYnzpqwwBCU0r/1fJnbqPBS27s9
 qu3CCZPO0tmxy2Fu+6hpsmDikyRnFLlKckEx4h9bz8xOcIsxgsLMBg7LnVJMpSHcKlzb
 HHZ+OO6J0V2Oj4USy3SfA+UjLVuXVKzH2tCyY97xlHvri7WoxTtFCH8fHzZs/K8sq59R
 vbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719852925; x=1720457725;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQw9si+2zXQ439aHNWT2jvrwQCyc4dmYRCUWjQeo2eM=;
 b=nXzETxK8AqoUSisxN31/vl4G4qn1sBW03ZHsxV8puBEQFIyng+N2YFP/V+mIZijMwh
 EnktKlL1dNIGn9Mwa+Fg8Hq4tfjruW7cSCLY/M9tmnDyJqPxVlHciYe2y/IHmC6SHY1W
 K1IeN3xjYVa0HvfkoKSj/mJhpm5QfOqcifN3ChYi6oJOzjYZ6Po2fUD+3JgEkTbtDIOP
 HNlt0Xn/9UkOSMkV+MgvIRbKhg2sZa+5TjlgE5pRgJL5mJY5lTwOOPBbygACsPw50a1W
 IrRBtNGUmhYY4Xpss8Jv86q549mABFCIGEHwC18TM8Rx0OlC+pyNIoaI1jXq6U+uqicu
 A42Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjpEC9Z3I8pospYU/Ht/I6yFjcoWzOJSwyzJTTxSIIUaKEoEZcmIklx5gfQ/JziOdJL0yPeH07fxpQUDgLtsjekgC1AyD93U6y2BuwdMvY
X-Gm-Message-State: AOJu0Yy6c5BEmFBl0HVdJ3XjfGDSHbJ0FCkngJuuIvgH300XA1boHVCf
 p9+N1ALLPo1xnsfWmyyh3Zx1uJm0HhalrbwU9HTi2melcmceF+N1iR0nK0tPuJiZt69L6SJvqnL
 e1gllk/yOQFJ83+e0a8CqH1ltn0NN9Q==
X-Google-Smtp-Source: AGHT+IFvB/G+g96UDIjLZZKESuRUcZW7c9pbL+TXQ1YADWaMz9FsPlH7PTbeDej55RfNlny1ivCRYQMQ75T25Kp52UE=
X-Received: by 2002:a17:90a:bf18:b0:2c2:c9b6:123a with SMTP id
 98e67ed59e1d1-2c93d6ea81bmr2959876a91.4.1719852924735; Mon, 01 Jul 2024
 09:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <0e20a775d01b889b800a6aa9296dd7ad7c070a4b.camel@kernel.org>
In-Reply-To: <0e20a775d01b889b800a6aa9296dd7ad7c070a4b.camel@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jul 2024 12:55:12 -0400
Message-ID: <CADnq5_M9SOtxNreT8J=5rANyCg4UUmKHWJgdjYT_a10jLYRNPA@mail.gmail.com>
Subject: Re: amdgpu UBSAN warnings in 6.10.0-rc5
To: Jeff Layton <jlayton@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000a5321e061c327610"
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

--000000000000a5321e061c327610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 8:40=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> I've been testing some vfs patches (multigrain timestamps) on my
> personal desktop with a 6.10.0-rc5-ish kernel, and have hit a number of
> warnings in the amdgpu driver, including a UBSAN warning that looks
> like a potential array overrun:
>
> [    8.772608] ------------[ cut here ]------------
> [    8.772609] UBSAN: array-index-out-of-bounds in drivers/gpu/drm/amd/am=
dgpu/../display/dc/bios/bios_parser2.c:680:23
> [    8.772612] index 8 is out of range for type 'atom_gpio_pin_assignment=
 [8]'
> [    8.772614] CPU: 13 PID: 508 Comm: (udev-worker) Not tainted 6.10.0-rc=
5-00292-gb3efd5c27332 #35
> [    8.772616] Hardware name: Micro-Star International Co., Ltd. MS-7E27/=
PRO B650M-P (MS-7E27), BIOS 1.A0 06/07/2024
> [    8.772618] Call Trace:
> [    8.772620]  <TASK>
> [    8.772621]  dump_stack_lvl+0x5d/0x80
> [    8.772629]  ubsan_epilogue+0x5/0x30
> [    8.772633]  __ubsan_handle_out_of_bounds.cold+0x46/0x4b
> [    8.772636]  bios_parser_get_gpio_pin_info+0x11c/0x150 [amdgpu]
> [    8.773016]  link_get_hpd_gpio+0x7e/0xd0 [amdgpu]
> [    8.773205]  construct_phy+0x26d/0xd40 [amdgpu]
> [    8.773355]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.773370]  ? link_create+0x210/0x250 [amdgpu]
> [    8.773493]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.773495]  link_create+0x210/0x250 [amdgpu]
> [    8.773610]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.773612]  create_links+0x151/0x530 [amdgpu]
> [    8.773759]  dc_create+0x401/0x7b0 [amdgpu]
> [    8.773883]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.773886]  amdgpu_dm_init.isra.0+0x32f/0x22d0 [amdgpu]
> [    8.774045]  ? irq_work_queue+0x2d/0x50
> [    8.774048]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774050]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774052]  ? vprintk_emit+0x176/0x2a0
> [    8.774056]  ? dev_vprintk_emit+0x181/0x1b0
> [    8.774063]  dm_hw_init+0x12/0x30 [amdgpu]
> [    8.774187]  amdgpu_device_init.cold+0x1c43/0x1f90 [amdgpu]
> [    8.774373]  amdgpu_driver_load_kms+0x19/0x70 [amdgpu]
> [    8.774507]  amdgpu_pci_probe+0x1a7/0x4b0 [amdgpu]
> [    8.774631]  local_pci_probe+0x42/0x90
> [    8.774635]  pci_device_probe+0xc1/0x2a0
> [    8.774638]  really_probe+0xdb/0x340
> [    8.774642]  ? pm_runtime_barrier+0x54/0x90
> [    8.774644]  ? __pfx___driver_attach+0x10/0x10
> [    8.774646]  __driver_probe_device+0x78/0x110
> [    8.774648]  driver_probe_device+0x1f/0xa0
> [    8.774650]  __driver_attach+0xba/0x1c0
> [    8.774652]  bus_for_each_dev+0x8c/0xe0
> [    8.774655]  bus_add_driver+0x142/0x220
> [    8.774657]  driver_register+0x72/0xd0
> [    8.774660]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
> [    8.774779]  do_one_initcall+0x58/0x310
> [    8.774784]  do_init_module+0x90/0x250
> [    8.774787]  init_module_from_file+0x86/0xc0
> [    8.774791]  idempotent_init_module+0x121/0x2b0
> [    8.774794]  __x64_sys_finit_module+0x5e/0xb0
> [    8.774796]  do_syscall_64+0x82/0x160
> [    8.774799]  ? __pfx_page_put_link+0x10/0x10
> [    8.774804]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774806]  ? do_sys_openat2+0x9c/0xe0
> [    8.774809]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774810]  ? syscall_exit_to_user_mode+0x72/0x220
> [    8.774813]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774815]  ? do_syscall_64+0x8e/0x160
> [    8.774816]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774818]  ? __seccomp_filter+0x303/0x520
> [    8.774820]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774824]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774825]  ? syscall_exit_to_user_mode+0x72/0x220
> [    8.774827]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774829]  ? do_syscall_64+0x8e/0x160
> [    8.774830]  ? do_syscall_64+0x8e/0x160
> [    8.774831]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774833]  ? srso_alias_return_thunk+0x5/0xfbef5
> [    8.774835]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [    8.774837] RIP: 0033:0x7fa5f44391bd
> [    8.774848] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2b cc 0c 00 f7 d8 64 89 01 48
> [    8.774850] RSP: 002b:00007fff5d55a5a8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
> [    8.774852] RAX: ffffffffffffffda RBX: 0000555b3bfe6a50 RCX: 00007fa5f=
44391bd
> [    8.774854] RDX: 0000000000000000 RSI: 00007fa5f455507d RDI: 000000000=
000002c
> [    8.774855] RBP: 00007fff5d55a660 R08: 0000000000000001 R09: 00007fff5=
d55a5f0
> [    8.774855] R10: 0000000000000050 R11: 0000000000000246 R12: 00007fa5f=
455507d
> [    8.774856] R13: 0000000000020000 R14: 0000555b3bfebb30 R15: 0000555b3=
bff63d0
> [    8.774859]  </TASK>
> [    8.774864] ---[ end trace ]---
>
>
> It looks like "count" probably needs to be clamped to
> ARRAY_SIZE(header->gpio_pin) in bios_parser_get_gpio_pin_info ?
>
> dmesg is attached. There are couple of other warnings in there too
> after the UBSAN one, but this one looks the most worrisome.

It's harmless.  The array is variably sized and the code already takes
this into account.  The attached patch should silence the warning.

Alex

> --
> Jeff Layton <jlayton@kernel.org>

--000000000000a5321e061c327610
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-atomfirmware-silence-UBSAN-warning.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-atomfirmware-silence-UBSAN-warning.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ly380bcv0>
X-Attachment-Id: f_ly380bcv0

RnJvbSA1NDZkMjBiNDk2MzkwOGRmM2YxZGE2M2VkZDgzMGM0ZTY5NTk3MTI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxMjo1MDoxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWRncHUvYXRvbWZpcm13YXJlOiBzaWxlbmNlIFVCU0FOIHdhcm5pbmcKClRoaXMgaXMg
YSB2YXJpYWJseSBzaXplZCBhcnJheS4KCkxpbms6IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL2FyY2hpdmVzL2FtZC1nZngvMjAyNC1KdW5lLzExMDQyMC5odG1sClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvYXRvbWZpcm13YXJlLmgKaW5kZXggNTcxNjkxODM3MjAwLi4wOWNiYzNhZmQ2ZDggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmgKQEAgLTczNCw3ICs3MzQs
NyBAQCBzdHJ1Y3QgYXRvbV9ncGlvX3Bpbl9sdXRfdjJfMQogewogICBzdHJ1Y3QgIGF0b21fY29t
bW9uX3RhYmxlX2hlYWRlciAgdGFibGVfaGVhZGVyOwogICAvKnRoZSByZWFsIG51bWJlciBvZiB0
aGlzIGluY2x1ZGVkIGluIHRoZSBzdHJ1Y3R1cmUgaXMgY2FsY3VhbHRlZCBieSB1c2luZyB0aGUg
KHdob2xlIHN0cnVjdHVyZSBzaXplIC0gdGhlIGhlYWRlciBzaXplKS9zaXplIG9mIGF0b21fZ3Bp
b19waW5fbHV0ICAqLwotICBzdHJ1Y3QgIGF0b21fZ3Bpb19waW5fYXNzaWdubWVudCAgZ3Bpb19w
aW5bOF07CisgIHN0cnVjdCAgYXRvbV9ncGlvX3Bpbl9hc3NpZ25tZW50ICBncGlvX3BpbltdOwog
fTsKIAogCi0tIAoyLjQ1LjIKCg==
--000000000000a5321e061c327610--
