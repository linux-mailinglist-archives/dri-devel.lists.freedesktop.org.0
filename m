Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56820D1B9FA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 23:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6050510E563;
	Tue, 13 Jan 2026 22:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="gYHdW/vN";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="OmjpypcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C49D10E562;
 Tue, 13 Jan 2026 22:44:51 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id C489FEC0106;
 Tue, 13 Jan 2026 17:44:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 13 Jan 2026 17:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1768344290; x=1768430690; bh=PHpRgS1Bsa
 J4ZeV1bRQoCtKPv2z5WpCc/9PlAWNa1RQ=; b=gYHdW/vNTKfpLquOa3U+0aDs+R
 i9YXMmv0rmHG+H+8JqDxU27LK3/jy/A5u18qD7Wph5glII2S2/Xutdmgz6pUZPWn
 J6i0+Ng66pxadnnEnaoeviUIiMS4wAjMS8L84d01WB8U9H1YZE3Q+af9qWIUVaXl
 oxhNNm7uA9T41a8zZBR3bEyn6EdMyPHsHbUFYUsN02+Z3O0fSWhQdukaj3dIX+A4
 jPPL6A1gnoY2gEhK4WMt1K0CShnXlLEOtWgTbLT9DmN7x+DWFbn9S7G6ykrU3eGX
 LuxqBD9AZlQ7/fqyr3l8J7KOjdaBzTx2o3aH7Do4R2uMZ1QQrdx5fJPEu0Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1768344290; x=1768430690; bh=PHpRgS1BsaJ4ZeV1bRQoCtKPv2z5WpCc/9P
 lAWNa1RQ=; b=OmjpypcQngEVLXEH7dP4OGJd8FtyqtYrbBJ1r/n4V2+xAb5t1by
 jLLl6ijyDe9MkLtK6zwcDtl1FYH4ZAPoRxcWDxTfAJCISNYbhtXoNVkSfBSSY6SF
 HlwtWFgZbm69L69fyQoPyUyXIor1Ecxrxdj2xZ5XA03i8hL1/d5F6xZsAafRFihH
 DyGluvNuvtC4BsmrCuYcjuIBKpCJkMb2YLBlMdRNj1LBS55J/N6Gn5as9CPJ8LiC
 xLmP8xMJm0KBGPKL+gRWlz+RYrB8lYmIj2GAqQp6klSllw7lKvjIfuCybN/+p2hQ
 GHp0Hlejj8mEBG/6cSOspoSd8s1mvIy6RSA==
X-ME-Sender: <xms:4spmaXcY1nF6EzBLa-fNVm3L98JUqXkMdU8nHkNgNGNBmMCJk42npw>
 <xme:4spmaTPM2Wp8-qoek03qXkTIrDU1o1tBN3hGKr4qhqXQ6waUoQnPGk947UR49JBku
 yK4nMyptqiAhIzJzsFpBOZcuaS7kqzOEcFIRDpE8wtu8DGc1OnnVw>
X-ME-Received: <xmr:4spmabUs9jgUCznVTl-zREQgBzeq7Iyo-5f4mmJ3lNqlQFjeeRrkNnKV8iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdduheehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefukfgfffgjfhggtgesghdtreertderjeenucfhrhhomhepvehhrhhishht
 ohhphhgvrhcuufhnohifhhhilhhluceotghhrhhisheskhhouggvheegrdhnvghtqeenuc
 ggtffrrghtthgvrhhnpeejvdetveefkeeggfeuveeukeetffdutddvuedvueektdekfeef
 ffejfeejtdfgteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegthhhrihhssehkohguvgehgedrnhgvthdpnhgspghrtghpthhtohepuddtpdhm
 ohguvgepshhmthhpohhuthdprhgtphhtthhopehtohgthhgrnhhskhihsehtohgthhhlrg
 gsrdhnvghtpdhrtghpthhtohepnhhouhhvvggruheslhhishhtshdrfhhrvggvuggvshhk
 thhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvg
 guvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
 rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtoh
 hmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhi
 phgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnse
 hsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:4spmaby3SVylqzcugfv9QFXGXNHlfkCq0wNYN7SveXwmQHI0AxzV4Q>
 <xmx:4spmaS_lQHnZvGwqXRJNeKowyPkzGVHQ86R_Z2mhUj2vVDMfYjoGBw>
 <xmx:4spmaQ9VVlqd9hYskYBLWAmzPe__5mVM0261WaNE9PYe39pdfnte1g>
 <xmx:4spmaRX1T2on_gyWnO5HrW_99Ch4EGoUxoMgXJmvxJDCR5damc-OhQ>
 <xmx:4spmaV-a7ToIG7-Z4fITkZfBuJpiQmMZaWYkkoOvQBqCnY4zc71wsNZw>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jan 2026 17:44:49 -0500 (EST)
From: Christopher Snowhill <chris@kode54.net>
To: Dmitrii Tochanskii <tochansky@tochlab.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [BUG] NULL pointer dereference in Nouveau in 6.19 rc3 on boot
Message-ID: <176834429425.47794.11416759214626261638@copycat>
User-Agent: Dodo
Date: Tue, 13 Jan 2026 14:44:54 -0800
In-Reply-To: <2420af5b-492e-4ecd-a432-5904f097c581@tochlab.net>
References: <176682185563.8256.115798774340102079@copycat>
 <176698808133.6372.2408917375327107249@copycat>
 <176704843302.28863.16755724580325167330@copycat>
 <2420af5b-492e-4ecd-a432-5904f097c581@tochlab.net>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha512"; boundary="===============6221225689765788292=="
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

--===============6221225689765788292==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On Tue 13 Jan 2026 12:13:23 PM , Dmitrii Tochanskii wrote:
>=20
> On 12/30/25 1:47 AM, Christopher Snowhill wrote:
> > On Sun 28 Dec 2025 10:01:21 PM , Christopher Snowhill wrote:
> >> On Fri 26 Dec 2025 11:50:55 PM , Christopher Snowhill wrote:
> >>> I get the following NULL pointer dereference on boot, shortly before it
> >>> would be showing me my LUKS password prompt on a graphical screen. I had
> >>> to trust that there was a prompt and log into it blindly to boot and
> >>> recover this kernel log snippet.
> >>>
> >>> This kernel is built using the linux-cachyos-rc package, and only has
> >>> minor patches unrelated to DRM code, except that I also applied the
> >>> Nouveau ZCULL patch set on top, as well as some downstream sched-ext
> >>> patches from Andrea Righi's tree.
> >>>
> >>> Using latest stable linux-firmware packages from CachyOS, so
> >>> 1:20251125-2.
> >>>
> >>> Should I also have CC'd Maarten Lankhorst? I recall he was retiring from
> >>> the maintainer position due to leaving Intel, but get_maintainers.pl
> >>> still returns his contact name and address.
> >>>
> >>> Dec 26 22:52:57 cachyos kernel: nouveau 0000:01:00.0: vgaarb: deactivat=
e vga
> >>> console
> >>> Dec 26 22:52:57 cachyos kernel: BUG: kernel NULL pointer dereference, a=
ddress:
> >>> 00000000000000cc
> >>> Dec 26 22:52:57 cachyos kernel: #PF: supervisor read access in kernel m=
ode
> >>> Dec 26 22:52:57 cachyos kernel: #PF: error_code(0x0000) - not-present p=
age
> >>> Dec 26 22:52:57 cachyos kernel: PGD 0 P4D 0
> >>> Dec 26 22:52:57 cachyos kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> >>> Dec 26 22:52:57 cachyos kernel: CPU: 3 UID: 0 PID: 398 Comm: (udev-work=
er) Not
> >>> tainted 6.19.0-rc2-1-cachyos-rc #1 PREEMPT(full)
> >>> 71029b2e9fcfeb4957f998851dc3b8eefd7c60f1
> >>> Dec 26 22:52:57 cachyos kernel: Hardware name: Micro-Star International=
 Co.,
> >>> Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
> >>> Dec 26 22:52:57 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> >>> Dec 26 22:52:57 cachyos kernel: Code: 48 88 f2 0f 1f 00 90 90 90 90 90 =
90 90
> >>> 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89=
 f5 41
> >>> 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 =
48 89
> >>> Dec 26 22:52:57 cachyos kernel: RSP: 0018:ffffd13900b73568 EFLAGS: 0001=
0282
> >>> Dec 26 22:52:57 cachyos kernel: RAX: ffff8ef7a5429000 RBX: 000000000000=
0000
> >>> RCX: ffffd13900b735ff
> >>> Dec 26 22:52:57 cachyos kernel: RDX: ffffd13900b7359a RSI: 000000000000=
0070
> >>> RDI: 0000000000000000
> >>> Dec 26 22:52:57 cachyos kernel: RBP: ffff8ef79305d000 R08: ffffd13900b7=
3608
> >>> R09: 000000000000001f
> >>> Dec 26 22:52:57 cachyos kernel: R10: 0000000000000002 R11: 000000000001=
0000
> >>> R12: ffffd13900b735ff
> >>> Dec 26 22:52:57 cachyos kernel: R13: 0000000000000070 R14: ffffd13900b7=
3608
> >>> R15: ffffd13900b735fe
> >>> Dec 26 22:52:57 cachyos kernel: FS:  00007f830f677840(0000)
> >>> GS:ffff8f0ec8730000(0000) knlGS:0000000000000000
> >>> Dec 26 22:52:57 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> >>> 0000000080050033
> >>> Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc CR3: 000000011752=
1000
> >>> CR4: 0000000000f50ef0
> >>> Dec 26 22:52:57 cachyos kernel: PKRU: 55555554
> >>> Dec 26 22:52:57 cachyos kernel: Call Trace:
> >>> Dec 26 22:52:57 cachyos kernel:  <TASK>
> >>> Dec 26 22:52:57 cachyos kernel:  nvbios_pmuEp+0x51/0x130 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvkm_gsp_fwsec_init+0x76/0x3c0 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  r535_gsp_oneinit+0x2e4/0x1060 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  gh100_gsp_oneinit+0x33b/0x4d0 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvkm_subdev_init_+0x63/0x100 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvkm_object_init+0x42/0x120 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvkm_ioctl_new+0x1d8/0x290 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
> >>> [nouveau 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [no=
uveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvkm_ioctl+0xba/0x130 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos systemd-udevd[363]: 0000:01:00.0: Worker [398]
> >>> terminated by signal 9 (KILL).
> >>> Dec 26 22:52:57 cachyos kernel:  nvif_object_ctor+0x114/0x190 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nouveau_drm_device_new+0x15c/0x320 [no=
uveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  nouveau_drm_probe+0xbb/0x210 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  ? __pm_runtime_resume+0x59/0x80
> >>> Dec 26 22:52:57 cachyos kernel:  pci_device_probe+0x112/0x2d0
> >>> Dec 26 22:52:57 cachyos kernel:  really_probe+0xde/0x400
> >>> Dec 26 22:52:57 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> >>> Dec 26 22:52:57 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> >>> Dec 26 22:52:57 cachyos kernel:  __driver_probe_device+0x78/0x150
> >>> Dec 26 22:52:57 cachyos kernel:  __driver_attach+0xa0/0x340
> >>> Dec 26 22:52:57 cachyos kernel:  bus_for_each_dev+0x10b/0x160
> >>> Dec 26 22:52:57 cachyos kernel:  bus_add_driver+0x131/0x280
> >>> Dec 26 22:52:57 cachyos kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [no=
uveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  driver_register+0x75/0xe0
> >>> Dec 26 22:52:57 cachyos kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
> >>> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> >>> Dec 26 22:52:57 cachyos kernel:  do_one_initcall+0x5b/0x300
> >>> Dec 26 22:52:57 cachyos kernel:  do_init_module+0x62/0x250
> >>> Dec 26 22:52:57 cachyos kernel:  ? init_module_from_file+0xd6/0x140
> >>> Dec 26 22:52:57 cachyos kernel:  init_module_from_file+0xd6/0x140
> >>> Dec 26 22:52:57 cachyos kernel:  idempotent_init_module+0x118/0x310
> >>> Dec 26 22:52:57 cachyos kernel:  __x64_sys_finit_module+0x71/0xe0
> >>> Dec 26 22:52:57 cachyos kernel:  ? syscall_trace_enter+0x91/0x1e0
> >>> Dec 26 22:52:57 cachyos kernel:  do_syscall_64+0x81/0x630
> >>> Dec 26 22:52:57 cachyos kernel:  ? __x64_sys_pread64+0x9c/0xd0
> >>> Dec 26 22:52:57 cachyos kernel:  ? do_syscall_64+0x81/0x630
> >>> Dec 26 22:52:57 cachyos kernel:  ? __do_sys_newfstatat+0xe0/0x170
> >>> Dec 26 22:52:57 cachyos kernel:  ? do_syscall_64+0x81/0x630
> >>> Dec 26 22:52:57 cachyos kernel:  ? irq_exit_rcu+0x55/0x100
> >>> Dec 26 22:52:57 cachyos kernel:  entry_SYSCALL_64_after_hwframe+0x79/0x=
81
> >>> Dec 26 22:52:57 cachyos kernel: RIP: 0033:0x7f830ff3c79d
> >>> Dec 26 22:52:57 cachyos kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 =
00 90
> >>> f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b=
 4c 24
> >>> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 =
01 48
> >>> Dec 26 22:52:57 cachyos kernel: RSP: 002b:00007ffc68e73f08 EFLAGS: 0000=
0246
> >>> ORIG_RAX: 0000000000000139
> >>> Dec 26 22:52:57 cachyos kernel: RAX: ffffffffffffffda RBX: 0000558c285b=
b2a0
> >>> RCX: 00007f830ff3c79d
> >>> Dec 26 22:52:57 cachyos kernel: RDX: 0000000000000004 RSI: 00007f830f62=
22f2
> >>> RDI: 000000000000003f
> >>> Dec 26 22:52:57 cachyos kernel: RBP: 00007ffc68e73fa0 R08: 000000000000=
0000
> >>> R09: 0000558c285bc240
> >>> Dec 26 22:52:57 cachyos kernel: R10: 0000000000000000 R11: 000000000000=
0246
> >>> R12: 00007f830f6222f2
> >>> Dec 26 22:52:57 cachyos kernel: R13: 0000000000020000 R14: 0000558c2853=
b7a0
> >>> R15: 0000558c285bb2a0
> >>> Dec 26 22:52:57 cachyos kernel:  </TASK>
> >>> Dec 26 22:52:57 cachyos kernel: Modules linked in: dm_mod nouveau(+)
> >>> drm_ttm_helper ttm gpu_sched hid_playstation(+) i2c_algo_bit uas nvme
> >>> ghash_clmulni_intel drm_gpuvm led_class_multicolor usb_storage aesni_in=
tel
> >>> drm_exec ff_memless nvme_core mxm_wmi ccp nvme_keyring drm_display_help=
er
> >>> nvme_auth hid_multitouch hid_logitech_dj(+) video hkdf cec wmi
> >>> Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc
> >>> Dec 26 22:52:57 cachyos kernel: ---[ end trace 0000000000000000 ]---
> >>> Dec 26 22:52:57 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> >>> Dec 26 22:52:57 cachyos kernel: Code: 48 88 f2 0f 1f 00 90 90 90 90 90 =
90 90
> >>> 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89=
 f5 41
> >>> 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 =
48 89
> >>> Dec 26 22:52:57 cachyos kernel: RSP: 0018:ffffd13900b73568 EFLAGS: 0001=
0282
> >>> Dec 26 22:52:57 cachyos kernel: RAX: ffff8ef7a5429000 RBX: 000000000000=
0000
> >>> RCX: ffffd13900b735ff
> >>> Dec 26 22:52:57 cachyos kernel: RDX: ffffd13900b7359a RSI: 000000000000=
0070
> >>> RDI: 0000000000000000
> >>> Dec 26 22:52:57 cachyos kernel: RBP: ffff8ef79305d000 R08: ffffd13900b7=
3608
> >>> R09: 000000000000001f
> >>> Dec 26 22:52:57 cachyos kernel: R10: 0000000000000002 R11: 000000000001=
0000
> >>> R12: ffffd13900b735ff
> >>> Dec 26 22:52:57 cachyos kernel: R13: 0000000000000070 R14: ffffd13900b7=
3608
> >>> R15: ffffd13900b735fe
> >>> Dec 26 22:52:57 cachyos kernel: FS:  00007f830f677840(0000)
> >>> GS:ffff8f0ec8730000(0000) knlGS:0000000000000000
> >>> Dec 26 22:52:57 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> >>> 0000000080050033
> >>> Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc CR3: 000000011752=
1000
> >>> CR4: 0000000000f50ef0
> >>> Dec 26 22:52:57 cachyos kernel: PKRU: 55555554
> >>> Dec 26 22:52:57 cachyos kernel: note: (udev-worker)[398] exited with ir=
qs
> >>> disabled
> >>>
> >> Still crashing with 6.19 rc3. I have to use the proprietary drivers to
> >> have a desktop, but I probably should be using those anyway.
> >>
> >> Dec 28 21:47:18 cachyos kernel: BUG: kernel NULL pointer dereference, ad=
dress:
> >> 00000000000000cc
> >> Dec 28 21:47:18 cachyos kernel: #PF: supervisor read access in kernel mo=
de
> >> Dec 28 21:47:18 cachyos kernel: #PF: error_code(0x0000) - not-present pa=
ge
> >> Dec 28 21:47:18 cachyos kernel: PGD 0 P4D 0
> >> Dec 28 21:47:18 cachyos kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> >> Dec 28 21:47:18 cachyos kernel: CPU: 3 UID: 0 PID: 410 Comm: (udev-worke=
r) Not
> >> tainted 6.19.0-rc3-1-cachyos-rc #1 PREEMPT(full)
> >> 048c9ac8e7cc8ed3d1ec452c3a62bf8817030490
> >> Dec 28 21:47:18 cachyos kernel: Hardware name: Micro-Star International =
Co.,
> >> Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
> >> Dec 28 21:47:18 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> >> Dec 28 21:47:18 cachyos kernel: Code: 48 08 f4 0f 1f 00 90 90 90 90 90 9=
0 90
> >> 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 =
f5 41
> >> 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 4=
8 89
> >> Dec 28 21:47:18 cachyos kernel: RSP: 0018:ffffd1e280bdb6f8 EFLAGS: 00010=
286
> >> Dec 28 21:47:18 cachyos kernel: RAX: ffff8bec90f54800 RBX: 0000000000000=
000
> >> RCX: ffffd1e280bdb78f
> >> Dec 28 21:47:18 cachyos kernel: RDX: ffffd1e280bdb72a RSI: 0000000000000=
070
> >> RDI: 0000000000000000
> >> Dec 28 21:47:18 cachyos kernel: RBP: ffff8beca75a1000 R08: ffffd1e280bdb=
798
> >> R09: 000000000000001f
> >> Dec 28 21:47:18 cachyos kernel: R10: 0000000000000002 R11: 0000000000010=
000
> >> R12: ffffd1e280bdb78f
> >> Dec 28 21:47:18 cachyos kernel: R13: 0000000000000070 R14: ffffd1e280bdb=
798
> >> R15: ffffd1e280bdb78e
> >> Dec 28 21:47:18 cachyos kernel: FS:  00007f1ad28a2840(0000)
> >> GS:ffff8c03c7130000(0000) knlGS:0000000000000000
> >> Dec 28 21:47:18 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> >> 0000000080050033
> >> Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc CR3: 00000001184a6=
000
> >> CR4: 0000000000f50ef0
> >> Dec 28 21:47:18 cachyos kernel: PKRU: 55555554
> >> Dec 28 21:47:18 cachyos kernel: Call Trace:
> >> Dec 28 21:47:18 cachyos kernel:  <TASK>
> >> Dec 28 21:47:18 cachyos kernel:  nvbios_pmuEp+0x51/0x130 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvkm_gsp_fwsec_init+0x76/0x3c0 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  r535_gsp_oneinit+0x2e4/0x1060 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  gh100_gsp_oneinit+0x33b/0x4d0 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvkm_subdev_init_+0x63/0x100 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvkm_object_init+0x42/0x120 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvkm_ioctl_new+0x1d8/0x290 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
> >> [nouveau 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [nou=
veau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvkm_ioctl+0xba/0x130 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvif_object_ctor+0x114/0x190 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nouveau_drm_device_new+0x15c/0x320 [nou=
veau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  nouveau_drm_probe+0xbb/0x210 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  ? __pm_runtime_resume+0x59/0x80
> >> Dec 28 21:47:18 cachyos kernel:  pci_device_probe+0x112/0x2d0
> >> Dec 28 21:47:18 cachyos kernel:  really_probe+0xde/0x400
> >> Dec 28 21:47:18 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> >> Dec 28 21:47:18 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> >> Dec 28 21:47:18 cachyos kernel:  __driver_probe_device+0x78/0x150
> >> Dec 28 21:47:18 cachyos kernel:  __driver_attach+0xa0/0x340
> >> Dec 28 21:47:18 cachyos kernel:  bus_for_each_dev+0x10b/0x160
> >> Dec 28 21:47:18 cachyos kernel:  bus_add_driver+0x131/0x280
> >> Dec 28 21:47:18 cachyos kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [nou=
veau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  driver_register+0x75/0xe0
> >> Dec 28 21:47:18 cachyos kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
> >> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> >> Dec 28 21:47:18 cachyos kernel:  do_one_initcall+0x5b/0x300
> >> Dec 28 21:47:18 cachyos kernel:  do_init_module+0x62/0x250
> >> Dec 28 21:47:18 cachyos kernel:  ? init_module_from_file+0xd6/0x140
> >> Dec 28 21:47:18 cachyos kernel:  init_module_from_file+0xd6/0x140
> >> Dec 28 21:47:18 cachyos kernel:  idempotent_init_module+0x118/0x310
> >> Dec 28 21:47:18 cachyos kernel:  __x64_sys_finit_module+0x71/0xe0
> >> Dec 28 21:47:18 cachyos systemd-udevd[360]: 0000:01:00.0: Worker [410]
> >> terminated by signal 9 (KILL).
> >> Dec 28 21:47:18 cachyos kernel:  ? syscall_trace_enter+0x91/0x1e0
> >> Dec 28 21:47:18 cachyos kernel:  do_syscall_64+0x81/0x630
> >> Dec 28 21:47:18 cachyos kernel:  ? do_syscall_64+0x81/0x630
> >> Dec 28 21:47:18 cachyos kernel:  ? irq_exit_rcu+0x55/0x100
> >> Dec 28 21:47:18 cachyos kernel:  entry_SYSCALL_64_after_hwframe+0x79/0x81
> >> Dec 28 21:47:18 cachyos kernel: RIP: 0033:0x7f1ad316779d
> >> Dec 28 21:47:18 cachyos kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 0=
0 90
> >> f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b =
4c 24
> >> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 0=
1 48
> >> Dec 28 21:47:18 cachyos kernel: RSP: 002b:00007ffe71df2278 EFLAGS: 00000=
246
> >> ORIG_RAX: 0000000000000139
> >> Dec 28 21:47:18 cachyos kernel: RAX: ffffffffffffffda RBX: 000055cb0eb47=
6a0
> >> RCX: 00007f1ad316779d
> >> Dec 28 21:47:18 cachyos kernel: RDX: 0000000000000004 RSI: 00007f1ad284d=
2f2
> >> RDI: 000000000000005d
> >> Dec 28 21:47:18 cachyos kernel: RBP: 00007ffe71df2310 R08: 0000000000000=
000
> >> R09: 000055cb0eb49a70
> >> Dec 28 21:47:18 cachyos kernel: R10: 0000000000000000 R11: 0000000000000=
246
> >> R12: 00007f1ad284d2f2
> >> Dec 28 21:47:18 cachyos kernel: R13: 0000000000020000 R14: 000055cb0eadd=
7c0
> >> R15: 000055cb0eb476a0
> >> Dec 28 21:47:18 cachyos kernel:  </TASK>
> >> Dec 28 21:47:18 cachyos kernel: Modules linked in: dm_mod nouveau(+)
> >> drm_ttm_helper ttm gpu_sched uas i2c_algo_bit hid_playstation
> >> ghash_clmulni_intel drm_gpuvm nvme usb_storage led_class_multicolor drm_=
exec
> >> aesni_intel ff_memless mxm_wmi nvme_core ccp nvme_keyring drm_display_he=
lper
> >> nvme_auth hid_logitech_dj hid_multitouch cec hkdf video wmi
> >> Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc
> >> Dec 28 21:47:18 cachyos kernel: ---[ end trace 0000000000000000 ]---
> >> Dec 28 21:47:18 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> >> Dec 28 21:47:18 cachyos kernel: Code: 48 08 f4 0f 1f 00 90 90 90 90 90 9=
0 90
> >> 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 =
f5 41
> >> 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 4=
8 89
> >> Dec 28 21:47:18 cachyos kernel: RSP: 0018:ffffd1e280bdb6f8 EFLAGS: 00010=
286
> >> Dec 28 21:47:18 cachyos kernel: RAX: ffff8bec90f54800 RBX: 0000000000000=
000
> >> RCX: ffffd1e280bdb78f
> >> Dec 28 21:47:18 cachyos kernel: RDX: ffffd1e280bdb72a RSI: 0000000000000=
070
> >> RDI: 0000000000000000
> >> Dec 28 21:47:18 cachyos kernel: RBP: ffff8beca75a1000 R08: ffffd1e280bdb=
798
> >> R09: 000000000000001f
> >> Dec 28 21:47:18 cachyos kernel: R10: 0000000000000002 R11: 0000000000010=
000
> >> R12: ffffd1e280bdb78f
> >> Dec 28 21:47:18 cachyos kernel: R13: 0000000000000070 R14: ffffd1e280bdb=
798
> >> R15: ffffd1e280bdb78e
> >> Dec 28 21:47:18 cachyos kernel: FS:  00007f1ad28a2840(0000)
> >> GS:ffff8c03c7130000(0000) knlGS:0000000000000000
> >> Dec 28 21:47:18 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> >> 0000000080050033
> >> Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc CR3: 00000001184a6=
000
> >> CR4: 0000000000f50ef0
> >> Dec 28 21:47:18 cachyos kernel: PKRU: 55555554
> >> Dec 28 21:47:18 cachyos kernel: note: (udev-worker)[410] exited with irqs
> >> disabled
> >>
> >> Does this new kernel require bleeding edge linux-firmware for nvidia?
> > Replicated the issue on linux-mainline, so it's not cachyos patches
> > causing the problem. Another user has failed to replicate it on various
> > 6.19 versions (rc1, rc3) using a 3000 series GPU, so it's likely
> > Blackwell specific, as I have a 5070 Ti.
> >
> > The crash on linux-mainline was complicated by the mt76 string overflow
> > issue that still isn't patched in RC3, though.
> >
> > Dec 28 23:01:13 archlinux kernel: BUG: kernel NULL pointer dereference,
> > address: 00000000000000cc
> > Dec 28 23:01:13 archlinux kernel: #PF: supervisor read access in kernel m=
ode
> > Dec 28 23:01:13 archlinux kernel: #PF: error_code(0x0000) - not-present p=
age
> > Dec 28 23:01:13 archlinux kernel: PGD 0 P4D 0
> > Dec 28 23:01:13 archlinux kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> > Dec 28 23:01:13 archlinux kernel: CPU: 3 UID: 0 PID: 432 Comm: (udev-work=
er)
> > Not tainted 6.19.0-rc3-1-mainline-dirty #1 PREEMPT(full)
> > 6f31553276eb8f2de91bc301e09f6c7cde02609a
> > Dec 28 23:01:13 archlinux kernel: Hardware name: Micro-Star International=
 Co.,
> > Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
> > Dec 28 23:01:13 archlinux kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> > Dec 28 23:01:13 archlinux kernel: Code: ff e8 80 0b 73 f8 90 90 90 90 90 =
90 90
> > 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f=
5 41
> > 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b1 00 00 00 83 c6 0a 49 89 d6 48=
 89
> > Dec 28 23:01:13 archlinux kernel: RSP: 0018:ffffcccc815074b8 EFLAGS: 0001=
0296
> > Dec 28 23:01:13 archlinux kernel: RAX: 0000000000000000 RBX: 000000000000=
0000
> > RCX: ffffcccc81507536
> > Dec 28 23:01:13 archlinux kernel: RDX: ffffcccc815074f2 RSI: 000000000000=
0070
> > RDI: 0000000000000000
> > Dec 28 23:01:13 archlinux kernel: RBP: ffffcccc81507536 R08: ffffcccc8150=
7537
> > R09: 0000000000001000
> > Dec 28 23:01:13 archlinux kernel: R10: 000000009ffdf000 R11: 000000000000=
0002
> > R12: ffffcccc81507537
> > Dec 28 23:01:13 archlinux kernel: R13: 0000000000000070 R14: ffffcccc8150=
758e
> > R15: ffffcccc8150758f
> > Dec 28 23:01:13 archlinux kernel: FS:  00007f175c3b8840(0000)
> > GS:ffff8aef0298c000(0000) knlGS:0000000000000000
> > Dec 28 23:01:13 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> > 0000000080050033
> > Dec 28 23:01:13 archlinux kernel: CR2: 00000000000000cc CR3: 0000000116f9=
6000
> > CR4: 0000000000f50ef0
> > Dec 28 23:01:13 archlinux kernel: PKRU: 55555554
> > Dec 28 23:01:13 archlinux kernel: Call Trace:
> > Dec 28 23:01:13 archlinux kernel:  <TASK>
> > Dec 28 23:01:13 archlinux kernel:  nvbios_pmuTe+0x4f/0xf0 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvbios_pmuEp+0x4d/0xc0 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvkm_gsp_fwsec_init+0x77/0x3c0 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  r535_gsp_oneinit+0x25e/0xf90 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  ? gh100_gsp_oneinit+0x288/0x420 [nouve=
au
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  gh100_gsp_oneinit+0x2bc/0x420 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvkm_subdev_oneinit_+0x43/0x90 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  ? ktime_get+0x3b/0xd0
> > Dec 28 23:01:13 archlinux kernel:  nvkm_subdev_init_+0x31/0xa0 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  ? nvkm_intr_rearm+0xc4/0x1c0 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvkm_object_init+0x42/0x120 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvkm_ioctl_new+0x15c/0x220 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
> > [nouveau 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [no=
uveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvkm_ioctl+0xba/0x130 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvif_object_ctor+0x114/0x190 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  nouveau_drm_device_new+0x15c/0x320 [no=
uveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  ? __pci_set_master+0x5e/0xe0
> > Dec 28 23:01:13 archlinux kernel:  nouveau_drm_probe+0xb9/0x210 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  ? __pm_runtime_resume+0x5f/0x90
> > Dec 28 23:01:13 archlinux kernel:  local_pci_probe+0x42/0x90
> > Dec 28 23:01:13 archlinux kernel:  pci_device_probe+0xda/0x280
> > Dec 28 23:01:13 archlinux kernel:  ? sysfs_do_create_link_sd+0x6d/0xd0
> > Dec 28 23:01:13 archlinux kernel:  really_probe+0xde/0x380
> > Dec 28 23:01:13 archlinux kernel:  __driver_probe_device+0x78/0x150
> > Dec 28 23:01:13 archlinux kernel:  driver_probe_device+0x1f/0xa0
> > Dec 28 23:01:13 archlinux kernel:  ? __pfx___driver_attach+0x10/0x10
> > Dec 28 23:01:13 archlinux kernel:  __driver_attach+0xcb/0x200
> > Dec 28 23:01:13 archlinux kernel:  bus_for_each_dev+0x85/0xd0
> > Dec 28 23:01:13 archlinux kernel:  bus_add_driver+0x118/0x200
> > Dec 28 23:01:13 archlinux kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [no=
uveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  driver_register+0x75/0xe0
> > Dec 28 23:01:13 archlinux kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
> > 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
> > Dec 28 23:01:13 archlinux kernel:  do_one_initcall+0x5b/0x300
> > Dec 28 23:01:13 archlinux kernel:  do_init_module+0x62/0x250
> > Dec 28 23:01:13 archlinux systemd-udevd[359]: 0000:01:00.0: Worker [432]
> > terminated by signal 9 (KILL).
> > Dec 28 23:01:13 archlinux kernel:  init_module_from_file+0xd8/0x140
> > Dec 28 23:01:13 archlinux kernel:  idempotent_init_module+0x114/0x310
> > Dec 28 23:01:13 archlinux kernel:  __x64_sys_finit_module+0x71/0xe0
> > Dec 28 23:01:13 archlinux kernel:  ? syscall_trace_enter+0x8d/0x1d0
> > Dec 28 23:01:13 archlinux kernel:  do_syscall_64+0x81/0x610
> > Dec 28 23:01:13 archlinux kernel:  ? do_sys_openat2+0xac/0xf0
> > Dec 28 23:01:13 archlinux kernel:  ? __x64_sys_openat+0x61/0xa0
> > Dec 28 23:01:13 archlinux kernel:  ? do_syscall_64+0x81/0x610
> > Dec 28 23:01:13 archlinux kernel:  ? do_sys_openat2+0xac/0xf0
> > Dec 28 23:01:13 archlinux kernel:  ? __x64_sys_openat+0x61/0xa0
> > Dec 28 23:01:13 archlinux kernel:  ? do_syscall_64+0x81/0x610
> > Dec 28 23:01:13 archlinux kernel:  ? __x64_sys_openat+0x61/0xa0
> > Dec 28 23:01:13 archlinux kernel:  ? do_syscall_64+0x81/0x610
> > Dec 28 23:01:13 archlinux kernel:  ? sched_clock+0x10/0x30
> > Dec 28 23:01:13 archlinux kernel:  ? sched_clock_cpu+0xf/0x200
> > Dec 28 23:01:13 archlinux kernel:  ?
> > __flush_smp_call_function_queue+0xae/0x410
> > Dec 28 23:01:13 archlinux kernel:  ? sched_clock_cpu+0xf/0x200
> > Dec 28 23:01:13 archlinux kernel:  ? irqtime_account_irq+0x3c/0xc0
> > Dec 28 23:01:13 archlinux kernel:  ? __irq_exit_rcu+0x4c/0xf0
> > Dec 28 23:01:13 archlinux kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
> > Dec 28 23:01:13 archlinux kernel: RIP: 0033:0x7f175cc7d79d
> > Dec 28 23:01:13 archlinux kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 =
00 90
> > f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4=
c 24
> > 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 01=
 48
> > Dec 28 23:01:13 archlinux kernel: RSP: 002b:00007ffeea4f46a8 EFLAGS: 0000=
0246
> > ORIG_RAX: 0000000000000139
> > Dec 28 23:01:13 archlinux kernel: RAX: ffffffffffffffda RBX: 0000561d180f=
9e90
> > RCX: 00007f175cc7d79d
> > Dec 28 23:01:13 archlinux kernel: RDX: 0000000000000004 RSI: 00007f175c36=
32f2
> > RDI: 000000000000008d
> > Dec 28 23:01:13 archlinux kernel: RBP: 00007ffeea4f4740 R08: 000000000000=
0000
> > R09: 0000561d180fd7d0
> > Dec 28 23:01:13 archlinux kernel: R10: 0000000000000000 R11: 000000000000=
0246
> > R12: 00007f175c3632f2
> > Dec 28 23:01:13 archlinux kernel: R13: 0000000000020000 R14: 0000561d180f=
9210
> > R15: 0000561d180f9e90
> > Dec 28 23:01:13 archlinux kernel:  </TASK>
> > Dec 28 23:01:13 archlinux kernel: Modules linked in: dm_mod nouveau(+)
> > drm_ttm_helper ttm gpu_sched uas hid_playstation i2c_algo_bit
> > ghash_clmulni_intel nvme usb_storage drm_gpuvm led_class_multicolor
> > aesni_intel ff_memless drm_exec nvme_core mxm_wmi ccp nvme_keyring
> > drm_display_helper nvme_auth hid_logitech_dj(+) video hkdf hid_multitouch=
 cec
> > wmi
> > Dec 28 23:01:13 archlinux kernel: CR2: 00000000000000cc
> > Dec 28 23:01:13 archlinux kernel: ---[ end trace 0000000000000000 ]---
> > Dec 28 23:01:13 archlinux kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> > Dec 28 23:01:13 archlinux kernel: Code: ff e8 80 0b 73 f8 90 90 90 90 90 =
90 90
> > 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f=
5 41
> > 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b1 00 00 00 83 c6 0a 49 89 d6 48=
 89
> > Dec 28 23:01:13 archlinux kernel: RSP: 0018:ffffcccc815074b8 EFLAGS: 0001=
0296
> > Dec 28 23:01:13 archlinux kernel: RAX: 0000000000000000 RBX: 000000000000=
0000
> > RCX: ffffcccc81507536
> > Dec 28 23:01:13 archlinux kernel: RDX: ffffcccc815074f2 RSI: 000000000000=
0070
> > RDI: 0000000000000000
> > Dec 28 23:01:13 archlinux kernel: RBP: ffffcccc81507536 R08: ffffcccc8150=
7537
> > R09: 0000000000001000
> > Dec 28 23:01:13 archlinux kernel: R10: 000000009ffdf000 R11: 000000000000=
0002
> > R12: ffffcccc81507537
> > Dec 28 23:01:13 archlinux kernel: R13: 0000000000000070 R14: ffffcccc8150=
758e
> > R15: ffffcccc8150758f
> > Dec 28 23:01:13 archlinux kernel: FS:  00007f175c3b8840(0000)
> > GS:ffff8aef0298c000(0000) knlGS:0000000000000000
> > Dec 28 23:01:13 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> > 0000000080050033
> > Dec 28 23:01:13 archlinux kernel: CR2: 00000000000000cc CR3: 0000000116f9=
6000
> > CR4: 0000000000f50ef0
> > Dec 28 23:01:13 archlinux kernel: PKRU: 55555554
> > Dec 28 23:01:13 archlinux kernel: note: (udev-worker)[432] exited with ir=
qs
> > disabled
> >
> I started having the same error when upgrading from 6.18.3 to 6.18.4 on=20
> RTX 5080.
>=20
> Bug line is drivers/gpu/drm/nouveau/nvkm/subdev/bios/bit.c:30 because=20
> 'bios' is NULL.
>=20
> Not sure where it has to be set but in=20
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c:266 it's NULL.
>=20
>

There's a patch staged, "nouveau: don't attempt fwsec on sb on newer
platforms." This corrects the issue.

--===============6221225689765788292==
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
MIME-Version: 1.0

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEdiLr51NrDwQ29PFjjWyYR59K3nEFAmlmyuYACgkQjWyYR59K
3nFHZQ/9H1U3H/DgVd3xJe6yjfipJLua9hmX7P14zCB0bP5OwsjSjlrq8qTrxMpE
YrZo/RleAquUSyFGdedOWCVBfhVoYeDKl5foPujb8wPUqj3+A8ca+HRUj1vHUCyw
EjX0ywlbSeZwHkbUr2ejnHmfm8bur8vfdJg4yk7aeSdxRYHk+EQiGNN0pXtUFYBz
+l6kMrO7hh7zAHoqVGvxG4zH/p787Ca+T5G9e05DesltiROnaBrfH9ImaPgXbw3R
CdgwSEfBrWWX3Njze1wBE4ssNN8F5UfiUZnCvg1TmruBSOTifp4W3J5tMf/mR3wa
zl4e1HnmsPOVuEuz5/Ycyt0hdMrFLNXn9Q1hjduyAXFb7s7PP7Fma4KUMygbJtcK
UTGb6VV15lq7XgpL4jZq61AXMJY93KNqc0zYvcypHu2G23T8+81kAlj8iPsDcB2T
w7TaPKYNsUu2IlmSJAkg+FWHY+MSB2O7ELOMimYeY9lcS1yDTvY3fUGBz8MrOJg7
R7+tsveujGcyx1GRERyV23mM0r95wkQWVmdYNcy/fpA58ePgzA8qCZVLcdGsdFUv
w5nNN/AAZ154Cdc6E5CR7H4hveP5hQBNgo9bzqJfJPOf3lD+PidHJKjK0b68IXbA
PgIWjo3C6tTxxfziNeYV7v+NCtX2+drfCfPz5+f+NyMKHe+PS6Q=
=deY6
-----END PGP SIGNATURE-----

--===============6221225689765788292==--
