Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3115CDF52C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 08:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA89011B035;
	Sat, 27 Dec 2025 07:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="4Yc3tiB4";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="oO4Y3K/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Sat, 27 Dec 2025 07:56:37 UTC
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD5D11B035;
 Sat, 27 Dec 2025 07:56:37 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CA32D7A0079;
 Sat, 27 Dec 2025 02:50:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sat, 27 Dec 2025 02:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
 t=1766821858; x=1766908258; bh=QMIJNuvie+0u+X5z3aBWu8hUYyNQz4uM
 O1rA4XqiPcY=; b=4Yc3tiB4AeyYFFK0cbnmYGz6y7Mgtb9PfYFaaLSyXEM7yHk5
 8b9KKMGuhgnweBzSMKgTeEEGEIBDLjZu0AxPaBwF9AQ9e/dzk47FlSRqGytv6Xck
 6fcFm6rIsOlN9wNO2XB66a06kkDLsIATHP6gWCAyZyfoKr0uG+Hm7LCun0zxi1ru
 ZkG8o8Un1X3VW4ue+wtHaWHcwEcdKVqwAifM6Qtz9k/Mlsp4YH3UBD/1t2eV+BeP
 +fsORSijJ5o94nDnmZib2tfQ1GncDZS3iE4+B+Stvo0bsdNKA8wprKEaVLiASXNS
 /7U7ioEHdDREsLyNGmo7r757WsxMNlJALCVXPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766821858; x=
 1766908258; bh=QMIJNuvie+0u+X5z3aBWu8hUYyNQz4uMO1rA4XqiPcY=; b=o
 O4Y3K/Ffrf0X57pbrDHxV2L1p6i7aHH3Pd/02zgHVUp1XgppkuuhNpjnGuFaYjF5
 5dIdGQO3ZnlZK7igwRiH5DG6DhFVo7dZrBVKJJZQY3xTpsc4chGite5nWjkiC9T9
 rRv70BzBE47it5lI4VBlBpi3JJmbe9A9nPx+BuYMBgm996Ez8JHkOoZwjhTJ8zKw
 4FjlNjjjU3ac/kX/RhssHGV6p4dCXCtFh+mACZNaiP30Uo80m3HN10YbMZ023ikF
 mBShAxzUAVp3FQLhVEKQbMyevWIT4TMYPbWqbo57rO+jB8MC6q/sOBbU5hlBTvHs
 OMDseq/SybI/iyCs7gb4w==
X-ME-Sender: <xms:4o9PaetaUMX0NC-HpqSYp25SbjcK7w018DlKRgEqQBNhLwCwfKS0ew>
 <xme:4o9PaT6OK-HaoCh84EnMVsRo6zNKpbX6z49KsO1-Ck1TcZHw01s4e8Cv_g7zGlZgJ
 rik8HOFIn1BU58MUtE0b3JChLWQs5rZzsF3wF-WgGwT9JzS5xE4lLc>
X-ME-Received: <xmr:4o9PaadAhq8fH6GiL_YsWgGULplxLMIZSi50X-VwHkcE_WIZKZMDtlSLHPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejtdekvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevuffkfgffgggtsehgtderredtreejnecuhfhrohhmpeevhhhrihhsthhophhh
 vghrucfunhhofihhihhllhcuoegthhhrihhssehkohguvgehgedrnhgvtheqnecuggftrf
 grthhtvghrnhepudefieeuiedtffdvudefueeikeevteehuddtkeffveelkefhteefiedt
 hfdtleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eptghhrhhisheskhhouggvheegrdhnvghtpdhnsggprhgtphhtthhopeelpdhmohguvgep
 shhmthhpohhuthdprhgtphhtthhopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvg
 hskhhtohhprdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhr
 vggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
 hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdr
 tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmh
 hrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghn
 nhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpd
 hrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:4o9PaQx4_z2Tj3Ict_e-UwgIQq_WekbS0rG6vqT1_Fzez4Xn7Be80g>
 <xmx:4o9Paf8dV3K34xO2SKQCPAnVdMLgi1_3bKSKMnFewpMDO0B9ZukWHQ>
 <xmx:4o9Paezgk-1XdxHoHKmzGsLwSgykweD2JD-m3aqzSTd8q9gGUzc_ZA>
 <xmx:4o9PaXqkuGG6mD6bOBleBP17ENa6PP8J87PEEJ1lXPpropyRk9Ri5w>
 <xmx:4o9PadgqqDrWh60-9sdEoFaTS3wHRr_hW-755e4cm-6sbb3bAFm3oRCn>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Dec 2025 02:50:57 -0500 (EST)
From: Christopher Snowhill <chris@kode54.net>
To: nouveau@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: NULL pointer dereference in Nouveau in 6.19 rc2 on boot
Message-ID: <176682185563.8256.115798774340102079@copycat>
User-Agent: Dodo
Date: Fri, 26 Dec 2025 23:50:55 -0800
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha512"; boundary="===============3980477359181962303=="
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

--===============3980477359181962303==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

I get the following NULL pointer dereference on boot, shortly before it
would be showing me my LUKS password prompt on a graphical screen. I had
to trust that there was a prompt and log into it blindly to boot and
recover this kernel log snippet.

This kernel is built using the linux-cachyos-rc package, and only has
minor patches unrelated to DRM code, except that I also applied the
Nouveau ZCULL patch set on top, as well as some downstream sched-ext
patches from Andrea Righi's tree.

Using latest stable linux-firmware packages from CachyOS, so
1:20251125-2.

Should I also have CC'd Maarten Lankhorst? I recall he was retiring from
the maintainer position due to leaving Intel, but get_maintainers.pl
still returns his contact name and address.

Dec 26 22:52:57 cachyos kernel: nouveau 0000:01:00.0: vgaarb: deactivate vga
console
Dec 26 22:52:57 cachyos kernel: BUG: kernel NULL pointer dereference, address:
00000000000000cc
Dec 26 22:52:57 cachyos kernel: #PF: supervisor read access in kernel mode
Dec 26 22:52:57 cachyos kernel: #PF: error_code(0x0000) - not-present page
Dec 26 22:52:57 cachyos kernel: PGD 0 P4D 0
Dec 26 22:52:57 cachyos kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Dec 26 22:52:57 cachyos kernel: CPU: 3 UID: 0 PID: 398 Comm: (udev-worker) Not
tainted 6.19.0-rc2-1-cachyos-rc #1 PREEMPT(full)
71029b2e9fcfeb4957f998851dc3b8eefd7c60f1
Dec 26 22:52:57 cachyos kernel: Hardware name: Micro-Star International Co.,
Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
Dec 26 22:52:57 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
Dec 26 22:52:57 cachyos kernel: Code: 48 88 f2 0f 1f 00 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 41
54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48 89
Dec 26 22:52:57 cachyos kernel: RSP: 0018:ffffd13900b73568 EFLAGS: 00010282
Dec 26 22:52:57 cachyos kernel: RAX: ffff8ef7a5429000 RBX: 0000000000000000
RCX: ffffd13900b735ff
Dec 26 22:52:57 cachyos kernel: RDX: ffffd13900b7359a RSI: 0000000000000070
RDI: 0000000000000000
Dec 26 22:52:57 cachyos kernel: RBP: ffff8ef79305d000 R08: ffffd13900b73608
R09: 000000000000001f
Dec 26 22:52:57 cachyos kernel: R10: 0000000000000002 R11: 0000000000010000
R12: ffffd13900b735ff
Dec 26 22:52:57 cachyos kernel: R13: 0000000000000070 R14: ffffd13900b73608
R15: ffffd13900b735fe
Dec 26 22:52:57 cachyos kernel: FS:  00007f830f677840(0000)
GS:ffff8f0ec8730000(0000) knlGS:0000000000000000
Dec 26 22:52:57 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc CR3: 0000000117521000
CR4: 0000000000f50ef0
Dec 26 22:52:57 cachyos kernel: PKRU: 55555554
Dec 26 22:52:57 cachyos kernel: Call Trace:
Dec 26 22:52:57 cachyos kernel:  <TASK>
Dec 26 22:52:57 cachyos kernel:  nvbios_pmuEp+0x51/0x130 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvkm_gsp_fwsec_init+0x76/0x3c0 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  r535_gsp_oneinit+0x2e4/0x1060 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  gh100_gsp_oneinit+0x33b/0x4d0 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvkm_subdev_init_+0x63/0x100 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvkm_object_init+0x42/0x120 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvkm_ioctl_new+0x1d8/0x290 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
[nouveau 92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvkm_ioctl+0xba/0x130 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos systemd-udevd[363]: 0000:01:00.0: Worker [398]
terminated by signal 9 (KILL).
Dec 26 22:52:57 cachyos kernel:  nvif_object_ctor+0x114/0x190 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nouveau_drm_device_new+0x15c/0x320 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  nouveau_drm_probe+0xbb/0x210 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  ? __pm_runtime_resume+0x59/0x80
Dec 26 22:52:57 cachyos kernel:  pci_device_probe+0x112/0x2d0
Dec 26 22:52:57 cachyos kernel:  really_probe+0xde/0x400
Dec 26 22:52:57 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
Dec 26 22:52:57 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
Dec 26 22:52:57 cachyos kernel:  __driver_probe_device+0x78/0x150
Dec 26 22:52:57 cachyos kernel:  __driver_attach+0xa0/0x340
Dec 26 22:52:57 cachyos kernel:  bus_for_each_dev+0x10b/0x160
Dec 26 22:52:57 cachyos kernel:  bus_add_driver+0x131/0x280
Dec 26 22:52:57 cachyos kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  driver_register+0x75/0xe0
Dec 26 22:52:57 cachyos kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
92367f81003504f1f8c63f31342b6d203ebdc5d1]
Dec 26 22:52:57 cachyos kernel:  do_one_initcall+0x5b/0x300
Dec 26 22:52:57 cachyos kernel:  do_init_module+0x62/0x250
Dec 26 22:52:57 cachyos kernel:  ? init_module_from_file+0xd6/0x140
Dec 26 22:52:57 cachyos kernel:  init_module_from_file+0xd6/0x140
Dec 26 22:52:57 cachyos kernel:  idempotent_init_module+0x118/0x310
Dec 26 22:52:57 cachyos kernel:  __x64_sys_finit_module+0x71/0xe0
Dec 26 22:52:57 cachyos kernel:  ? syscall_trace_enter+0x91/0x1e0
Dec 26 22:52:57 cachyos kernel:  do_syscall_64+0x81/0x630
Dec 26 22:52:57 cachyos kernel:  ? __x64_sys_pread64+0x9c/0xd0
Dec 26 22:52:57 cachyos kernel:  ? do_syscall_64+0x81/0x630
Dec 26 22:52:57 cachyos kernel:  ? __do_sys_newfstatat+0xe0/0x170
Dec 26 22:52:57 cachyos kernel:  ? do_syscall_64+0x81/0x630
Dec 26 22:52:57 cachyos kernel:  ? irq_exit_rcu+0x55/0x100
Dec 26 22:52:57 cachyos kernel:  entry_SYSCALL_64_after_hwframe+0x79/0x81
Dec 26 22:52:57 cachyos kernel: RIP: 0033:0x7f830ff3c79d
Dec 26 22:52:57 cachyos kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 01 48
Dec 26 22:52:57 cachyos kernel: RSP: 002b:00007ffc68e73f08 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Dec 26 22:52:57 cachyos kernel: RAX: ffffffffffffffda RBX: 0000558c285bb2a0
RCX: 00007f830ff3c79d
Dec 26 22:52:57 cachyos kernel: RDX: 0000000000000004 RSI: 00007f830f6222f2
RDI: 000000000000003f
Dec 26 22:52:57 cachyos kernel: RBP: 00007ffc68e73fa0 R08: 0000000000000000
R09: 0000558c285bc240
Dec 26 22:52:57 cachyos kernel: R10: 0000000000000000 R11: 0000000000000246
R12: 00007f830f6222f2
Dec 26 22:52:57 cachyos kernel: R13: 0000000000020000 R14: 0000558c2853b7a0
R15: 0000558c285bb2a0
Dec 26 22:52:57 cachyos kernel:  </TASK>
Dec 26 22:52:57 cachyos kernel: Modules linked in: dm_mod nouveau(+)
drm_ttm_helper ttm gpu_sched hid_playstation(+) i2c_algo_bit uas nvme
ghash_clmulni_intel drm_gpuvm led_class_multicolor usb_storage aesni_intel
drm_exec ff_memless nvme_core mxm_wmi ccp nvme_keyring drm_display_helper
nvme_auth hid_multitouch hid_logitech_dj(+) video hkdf cec wmi
Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc
Dec 26 22:52:57 cachyos kernel: ---[ end trace 0000000000000000 ]---
Dec 26 22:52:57 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
Dec 26 22:52:57 cachyos kernel: Code: 48 88 f2 0f 1f 00 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 41
54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48 89
Dec 26 22:52:57 cachyos kernel: RSP: 0018:ffffd13900b73568 EFLAGS: 00010282
Dec 26 22:52:57 cachyos kernel: RAX: ffff8ef7a5429000 RBX: 0000000000000000
RCX: ffffd13900b735ff
Dec 26 22:52:57 cachyos kernel: RDX: ffffd13900b7359a RSI: 0000000000000070
RDI: 0000000000000000
Dec 26 22:52:57 cachyos kernel: RBP: ffff8ef79305d000 R08: ffffd13900b73608
R09: 000000000000001f
Dec 26 22:52:57 cachyos kernel: R10: 0000000000000002 R11: 0000000000010000
R12: ffffd13900b735ff
Dec 26 22:52:57 cachyos kernel: R13: 0000000000000070 R14: ffffd13900b73608
R15: ffffd13900b735fe
Dec 26 22:52:57 cachyos kernel: FS:  00007f830f677840(0000)
GS:ffff8f0ec8730000(0000) knlGS:0000000000000000
Dec 26 22:52:57 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc CR3: 0000000117521000
CR4: 0000000000f50ef0
Dec 26 22:52:57 cachyos kernel: PKRU: 55555554
Dec 26 22:52:57 cachyos kernel: note: (udev-worker)[398] exited with irqs
disabled


--===============3980477359181962303==
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
MIME-Version: 1.0

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEdiLr51NrDwQ29PFjjWyYR59K3nEFAmlPj98ACgkQjWyYR59K
3nFNzxAAiqwHRToqG7+yGVfeohcIzuTM/J35RWz0KDKGRFc/KgpjB0qEVg0qxGkp
jaamJ6eib7+G9k9Wsk12pZhyOKVXwp9F5i2STMAwY6P5BJnrH4r2Nzh2Mv2wfFwB
x8dLAUDXh3vTqRy67C/te6pI3sf6Rve56ao97pm0FlW9MZAwvu+QaNw5YMin+jWY
FAcMZe508nlhckjtwn5/IzYQwsQl5Ii1XUlq9KxTQNmtsEk0a7VHWACACvzIbMuT
VksTTcCCe4iYb9z8Vxd0cZJHj0OxV6i523GU80yLeXQyQHeGnCQDU4vrzbzvkg/D
KAJHyPE2LZrM2QSdfBDocVIziopehvQPAlCS2BHCLd4uK8/rE20d6NGpgJyXhwlu
Tf1UUgD5hyzGYSbZdGd26s4oYGL3Hshy+JBGEtuF1HyEUsW0jjkkRMGpvqn/Fy/q
6B/WNFDGKAPg8UVK/hFABIR98suI7FSA6wFzwckp8wUNcf+q5AnTbeTQGimymoOk
YKIfNZzLSY0UC5t2gnMdHubxlVrk0+4DnZ9od/dAuKWsfmgRxD8axMPdL+PEbNHs
ATpgXq3mOpQs6+QIZAnKRZ69bsV+rC5SAqz89trshZ/ggeUxHKWoCxaKpYYbfiOg
MxI3ggUqfhiRW2fS1oWfW22hlIxTd29pM/K/cU+r2HYfbpPDfs8=
=zaIr
-----END PGP SIGNATURE-----

--===============3980477359181962303==--
