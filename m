Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DBCE84C2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 23:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F1610E75D;
	Mon, 29 Dec 2025 22:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="w4edK7QD";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ef/xdIGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Mon, 29 Dec 2025 22:56:09 UTC
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F9C10E75C;
 Mon, 29 Dec 2025 22:56:09 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id B7750EC07C3;
 Mon, 29 Dec 2025 17:47:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 29 Dec 2025 17:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1767048434; x=1767134834; bh=sC4Dmt8faG
 aG3J0la5jwWLGZq0BUzEfWC3OeSM3f1Y4=; b=w4edK7QDt0vWRjE9BjkNxMQVfc
 EK5HNrIq1MiA2DIkLreRrMpsnCRJqivTPXDQWTh1jaz2MAQ6YVuCOZCPSNlOsN9H
 d4xT9WL4m02cQnXXyTQJYKmyjHMuIKiM+jBlSh2A6Gb6cpVLcH4CII6+R82iZ/O2
 2smF95sfBCYx66VmeGrCPEaD4kx/40ZPA14uQe1bIICYobYzNpB6Im3I6fx04mTP
 tI3mimK3m/3nnFtITYJdDoPIzOXvEjnkNv2BJ3CCpHjyTGlALDYEe6+MjugP91Vl
 KROykP+ZO6W74+Nfn4kIW3yNX9apcynOhXwI3fuPx0HqMo1jcS+a4K8PGrPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1767048434; x=1767134834; bh=sC4Dmt8faGaG3J0la5jwWLGZq0BUzEfWC3O
 eSM3f1Y4=; b=ef/xdIGPfkzT9TqVYYpmNOTs6Ifqurm2s/59fZN9nXQkfKq+DLE
 R1JFYtzrPKsdtj17Gx8Tq2wCpRiKJOom+AAis7IpjShkkCgKoJdMOUcN2jD2EwvP
 4Q10biZ/0sZwAdMAE1LuXYZOXDvyn0LUjcuhlR41/GXGKwufeS3kgU53mU1Cuqlz
 SA2pMc4Av/UGkTN5onZpbzYBlALWbrD0CKVatS3orbNcTbA6H9YhhmK/Ixy8XlEu
 9sGsv059uefb2dKuoT8oh9am1Sa1A480Cy35lM6UBVnDPy8wM8Ezw3+nzvgWSI4W
 L2nuKX/hB7RFF8Br6uPllfxsUqIqg0xzXQQ==
X-ME-Sender: <xms:8gRTaQX7Dv19klGp9d4atZ99teZteTPNi5uWGcyVeQM9mQMBfWFmBA>
 <xme:8gRTaVAVJQVf_YcJ7gGKFdPgaQf4Vv6T2jtP7YGRElQ2wa_Md1dxX5OzAay3v6V8o
 no5326Jb9Q_zYUkJ4B-mrm3AqSFPs5ngSPWn1b8_e5hDJXTvzrLEQ3f>
X-ME-Received: <xmr:8gRTaVHvtlCYHt5XRh9QPJmcNTYXaoMukqK0puA8n0_emPhhTR7uAMDd9I8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejkeefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevuffkfgffjghfgggtsehgtderredtreejnecuhfhrohhmpeevhhhrihhsthho
 phhhvghrucfunhhofihhihhllhcuoegthhhrihhssehkohguvgehgedrnhgvtheqnecugg
 ftrfgrthhtvghrnhepjedvteevfeekgefgueevueekteffuddtvdeuvdeukedtkeeffeff
 jeefjedtgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheptghhrhhisheskhhouggvheegrdhnvghtpdhnsggprhgtphhtthhopeelpdhmohgu
 vgepshhmthhpohhuthdprhgtphhtthhopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvg
 guvghskhhtohhprdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdr
 fhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
 esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgr
 thdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 epmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhm
 rghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtoh
 hmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:8gRTaW6SXg2tKihleXxILa3iT9wwriNuZh89ThFtmAvJ52KyTX3OzA>
 <xmx:8gRTabll4X0tQwoNwC3PngRYBk-k3uIjpJ3UJohB3bgodvgfW3uysg>
 <xmx:8gRTaR6HXX_bYEGUY9DY2tpNkXFLHmmUhtvrZAcKroKVIoPvWWLzdA>
 <xmx:8gRTacRT_TGuanVUbIcL8ClvynbNKOfx4A48ExDDXxwoRLA9k89E5A>
 <xmx:8gRTaaTacYwu4GR1m8uatw-VJaGcCOtjqcO0_9zKCYH4RJOr1llZ6Z2r>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 17:47:13 -0500 (EST)
From: Christopher Snowhill <chris@kode54.net>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: RE: [BUG] NULL pointer dereference in Nouveau in 6.19 rc3 on boot
Message-ID: <176704843302.28863.16755724580325167330@copycat>
User-Agent: Dodo
Date: Mon, 29 Dec 2025 14:47:13 -0800
In-Reply-To: <176698808133.6372.2408917375327107249@copycat>
References: <176682185563.8256.115798774340102079@copycat>
 <176698808133.6372.2408917375327107249@copycat>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha512"; boundary="===============6739603137155656827=="
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

--===============6739603137155656827==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On Sun 28 Dec 2025 10:01:21 PM , Christopher Snowhill wrote:
>=20
>=20
> On Fri 26 Dec 2025 11:50:55 PM , Christopher Snowhill wrote:
> > I get the following NULL pointer dereference on boot, shortly before it
> > would be showing me my LUKS password prompt on a graphical screen. I had
> > to trust that there was a prompt and log into it blindly to boot and
> > recover this kernel log snippet.
> >=20
> > This kernel is built using the linux-cachyos-rc package, and only has
> > minor patches unrelated to DRM code, except that I also applied the
> > Nouveau ZCULL patch set on top, as well as some downstream sched-ext
> > patches from Andrea Righi's tree.
> >=20
> > Using latest stable linux-firmware packages from CachyOS, so
> > 1:20251125-2.
> >=20
> > Should I also have CC'd Maarten Lankhorst? I recall he was retiring from
> > the maintainer position due to leaving Intel, but get_maintainers.pl
> > still returns his contact name and address.
> >=20
> > Dec 26 22:52:57 cachyos kernel: nouveau 0000:01:00.0: vgaarb: deactivate =
vga
> > console
> > Dec 26 22:52:57 cachyos kernel: BUG: kernel NULL pointer dereference, add=
ress:
> > 00000000000000cc
> > Dec 26 22:52:57 cachyos kernel: #PF: supervisor read access in kernel mode
> > Dec 26 22:52:57 cachyos kernel: #PF: error_code(0x0000) - not-present page
> > Dec 26 22:52:57 cachyos kernel: PGD 0 P4D 0
> > Dec 26 22:52:57 cachyos kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> > Dec 26 22:52:57 cachyos kernel: CPU: 3 UID: 0 PID: 398 Comm: (udev-worker=
) Not
> > tainted 6.19.0-rc2-1-cachyos-rc #1 PREEMPT(full)
> > 71029b2e9fcfeb4957f998851dc3b8eefd7c60f1
> > Dec 26 22:52:57 cachyos kernel: Hardware name: Micro-Star International C=
o.,
> > Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
> > Dec 26 22:52:57 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> > Dec 26 22:52:57 cachyos kernel: Code: 48 88 f2 0f 1f 00 90 90 90 90 90 90=
 90
> > 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f=
5 41
> > 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48=
 89
> > Dec 26 22:52:57 cachyos kernel: RSP: 0018:ffffd13900b73568 EFLAGS: 000102=
82
> > Dec 26 22:52:57 cachyos kernel: RAX: ffff8ef7a5429000 RBX: 00000000000000=
00
> > RCX: ffffd13900b735ff
> > Dec 26 22:52:57 cachyos kernel: RDX: ffffd13900b7359a RSI: 00000000000000=
70
> > RDI: 0000000000000000
> > Dec 26 22:52:57 cachyos kernel: RBP: ffff8ef79305d000 R08: ffffd13900b736=
08
> > R09: 000000000000001f
> > Dec 26 22:52:57 cachyos kernel: R10: 0000000000000002 R11: 00000000000100=
00
> > R12: ffffd13900b735ff
> > Dec 26 22:52:57 cachyos kernel: R13: 0000000000000070 R14: ffffd13900b736=
08
> > R15: ffffd13900b735fe
> > Dec 26 22:52:57 cachyos kernel: FS:  00007f830f677840(0000)
> > GS:ffff8f0ec8730000(0000) knlGS:0000000000000000
> > Dec 26 22:52:57 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> > 0000000080050033
> > Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc CR3: 00000001175210=
00
> > CR4: 0000000000f50ef0
> > Dec 26 22:52:57 cachyos kernel: PKRU: 55555554
> > Dec 26 22:52:57 cachyos kernel: Call Trace:
> > Dec 26 22:52:57 cachyos kernel:  <TASK>
> > Dec 26 22:52:57 cachyos kernel:  nvbios_pmuEp+0x51/0x130 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvkm_gsp_fwsec_init+0x76/0x3c0 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  r535_gsp_oneinit+0x2e4/0x1060 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  gh100_gsp_oneinit+0x33b/0x4d0 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvkm_subdev_init_+0x63/0x100 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvkm_object_init+0x42/0x120 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvkm_ioctl_new+0x1d8/0x290 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
> > [nouveau 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouv=
eau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvkm_ioctl+0xba/0x130 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos systemd-udevd[363]: 0000:01:00.0: Worker [398]
> > terminated by signal 9 (KILL).
> > Dec 26 22:52:57 cachyos kernel:  nvif_object_ctor+0x114/0x190 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nouveau_drm_device_new+0x15c/0x320 [nouv=
eau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  nouveau_drm_probe+0xbb/0x210 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  ? __pm_runtime_resume+0x59/0x80
> > Dec 26 22:52:57 cachyos kernel:  pci_device_probe+0x112/0x2d0
> > Dec 26 22:52:57 cachyos kernel:  really_probe+0xde/0x400
> > Dec 26 22:52:57 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> > Dec 26 22:52:57 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> > Dec 26 22:52:57 cachyos kernel:  __driver_probe_device+0x78/0x150
> > Dec 26 22:52:57 cachyos kernel:  __driver_attach+0xa0/0x340
> > Dec 26 22:52:57 cachyos kernel:  bus_for_each_dev+0x10b/0x160
> > Dec 26 22:52:57 cachyos kernel:  bus_add_driver+0x131/0x280
> > Dec 26 22:52:57 cachyos kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [nouv=
eau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  driver_register+0x75/0xe0
> > Dec 26 22:52:57 cachyos kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
> > 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> > Dec 26 22:52:57 cachyos kernel:  do_one_initcall+0x5b/0x300
> > Dec 26 22:52:57 cachyos kernel:  do_init_module+0x62/0x250
> > Dec 26 22:52:57 cachyos kernel:  ? init_module_from_file+0xd6/0x140
> > Dec 26 22:52:57 cachyos kernel:  init_module_from_file+0xd6/0x140
> > Dec 26 22:52:57 cachyos kernel:  idempotent_init_module+0x118/0x310
> > Dec 26 22:52:57 cachyos kernel:  __x64_sys_finit_module+0x71/0xe0
> > Dec 26 22:52:57 cachyos kernel:  ? syscall_trace_enter+0x91/0x1e0
> > Dec 26 22:52:57 cachyos kernel:  do_syscall_64+0x81/0x630
> > Dec 26 22:52:57 cachyos kernel:  ? __x64_sys_pread64+0x9c/0xd0
> > Dec 26 22:52:57 cachyos kernel:  ? do_syscall_64+0x81/0x630
> > Dec 26 22:52:57 cachyos kernel:  ? __do_sys_newfstatat+0xe0/0x170
> > Dec 26 22:52:57 cachyos kernel:  ? do_syscall_64+0x81/0x630
> > Dec 26 22:52:57 cachyos kernel:  ? irq_exit_rcu+0x55/0x100
> > Dec 26 22:52:57 cachyos kernel:  entry_SYSCALL_64_after_hwframe+0x79/0x81
> > Dec 26 22:52:57 cachyos kernel: RIP: 0033:0x7f830ff3c79d
> > Dec 26 22:52:57 cachyos kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00=
 90
> > f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4=
c 24
> > 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 01=
 48
> > Dec 26 22:52:57 cachyos kernel: RSP: 002b:00007ffc68e73f08 EFLAGS: 000002=
46
> > ORIG_RAX: 0000000000000139
> > Dec 26 22:52:57 cachyos kernel: RAX: ffffffffffffffda RBX: 0000558c285bb2=
a0
> > RCX: 00007f830ff3c79d
> > Dec 26 22:52:57 cachyos kernel: RDX: 0000000000000004 RSI: 00007f830f6222=
f2
> > RDI: 000000000000003f
> > Dec 26 22:52:57 cachyos kernel: RBP: 00007ffc68e73fa0 R08: 00000000000000=
00
> > R09: 0000558c285bc240
> > Dec 26 22:52:57 cachyos kernel: R10: 0000000000000000 R11: 00000000000002=
46
> > R12: 00007f830f6222f2
> > Dec 26 22:52:57 cachyos kernel: R13: 0000000000020000 R14: 0000558c2853b7=
a0
> > R15: 0000558c285bb2a0
> > Dec 26 22:52:57 cachyos kernel:  </TASK>
> > Dec 26 22:52:57 cachyos kernel: Modules linked in: dm_mod nouveau(+)
> > drm_ttm_helper ttm gpu_sched hid_playstation(+) i2c_algo_bit uas nvme
> > ghash_clmulni_intel drm_gpuvm led_class_multicolor usb_storage aesni_intel
> > drm_exec ff_memless nvme_core mxm_wmi ccp nvme_keyring drm_display_helper
> > nvme_auth hid_multitouch hid_logitech_dj(+) video hkdf cec wmi
> > Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc
> > Dec 26 22:52:57 cachyos kernel: ---[ end trace 0000000000000000 ]---
> > Dec 26 22:52:57 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> > Dec 26 22:52:57 cachyos kernel: Code: 48 88 f2 0f 1f 00 90 90 90 90 90 90=
 90
> > 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f=
5 41
> > 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48=
 89
> > Dec 26 22:52:57 cachyos kernel: RSP: 0018:ffffd13900b73568 EFLAGS: 000102=
82
> > Dec 26 22:52:57 cachyos kernel: RAX: ffff8ef7a5429000 RBX: 00000000000000=
00
> > RCX: ffffd13900b735ff
> > Dec 26 22:52:57 cachyos kernel: RDX: ffffd13900b7359a RSI: 00000000000000=
70
> > RDI: 0000000000000000
> > Dec 26 22:52:57 cachyos kernel: RBP: ffff8ef79305d000 R08: ffffd13900b736=
08
> > R09: 000000000000001f
> > Dec 26 22:52:57 cachyos kernel: R10: 0000000000000002 R11: 00000000000100=
00
> > R12: ffffd13900b735ff
> > Dec 26 22:52:57 cachyos kernel: R13: 0000000000000070 R14: ffffd13900b736=
08
> > R15: ffffd13900b735fe
> > Dec 26 22:52:57 cachyos kernel: FS:  00007f830f677840(0000)
> > GS:ffff8f0ec8730000(0000) knlGS:0000000000000000
> > Dec 26 22:52:57 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> > 0000000080050033
> > Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc CR3: 00000001175210=
00
> > CR4: 0000000000f50ef0
> > Dec 26 22:52:57 cachyos kernel: PKRU: 55555554
> > Dec 26 22:52:57 cachyos kernel: note: (udev-worker)[398] exited with irqs
> > disabled
> >=20
>=20
> Still crashing with 6.19 rc3. I have to use the proprietary drivers to
> have a desktop, but I probably should be using those anyway.
>=20
> Dec 28 21:47:18 cachyos kernel: BUG: kernel NULL pointer dereference, addre=
ss:
> 00000000000000cc
> Dec 28 21:47:18 cachyos kernel: #PF: supervisor read access in kernel mode
> Dec 28 21:47:18 cachyos kernel: #PF: error_code(0x0000) - not-present page
> Dec 28 21:47:18 cachyos kernel: PGD 0 P4D 0
> Dec 28 21:47:18 cachyos kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Dec 28 21:47:18 cachyos kernel: CPU: 3 UID: 0 PID: 410 Comm: (udev-worker) =
Not
> tainted 6.19.0-rc3-1-cachyos-rc #1 PREEMPT(full)
> 048c9ac8e7cc8ed3d1ec452c3a62bf8817030490
> Dec 28 21:47:18 cachyos kernel: Hardware name: Micro-Star International Co.,
> Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
> Dec 28 21:47:18 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> Dec 28 21:47:18 cachyos kernel: Code: 48 08 f4 0f 1f 00 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 =
41
> 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48 89
> Dec 28 21:47:18 cachyos kernel: RSP: 0018:ffffd1e280bdb6f8 EFLAGS: 00010286
> Dec 28 21:47:18 cachyos kernel: RAX: ffff8bec90f54800 RBX: 0000000000000000
> RCX: ffffd1e280bdb78f
> Dec 28 21:47:18 cachyos kernel: RDX: ffffd1e280bdb72a RSI: 0000000000000070
> RDI: 0000000000000000
> Dec 28 21:47:18 cachyos kernel: RBP: ffff8beca75a1000 R08: ffffd1e280bdb798
> R09: 000000000000001f
> Dec 28 21:47:18 cachyos kernel: R10: 0000000000000002 R11: 0000000000010000
> R12: ffffd1e280bdb78f
> Dec 28 21:47:18 cachyos kernel: R13: 0000000000000070 R14: ffffd1e280bdb798
> R15: ffffd1e280bdb78e
> Dec 28 21:47:18 cachyos kernel: FS:  00007f1ad28a2840(0000)
> GS:ffff8c03c7130000(0000) knlGS:0000000000000000
> Dec 28 21:47:18 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc CR3: 00000001184a6000
> CR4: 0000000000f50ef0
> Dec 28 21:47:18 cachyos kernel: PKRU: 55555554
> Dec 28 21:47:18 cachyos kernel: Call Trace:
> Dec 28 21:47:18 cachyos kernel:  <TASK>
> Dec 28 21:47:18 cachyos kernel:  nvbios_pmuEp+0x51/0x130 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvkm_gsp_fwsec_init+0x76/0x3c0 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  r535_gsp_oneinit+0x2e4/0x1060 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  gh100_gsp_oneinit+0x33b/0x4d0 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvkm_subdev_init_+0x63/0x100 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvkm_object_init+0x42/0x120 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvkm_ioctl_new+0x1d8/0x290 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
> [nouveau 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvkm_ioctl+0xba/0x130 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvif_object_ctor+0x114/0x190 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nouveau_drm_device_new+0x15c/0x320 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  nouveau_drm_probe+0xbb/0x210 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  ? __pm_runtime_resume+0x59/0x80
> Dec 28 21:47:18 cachyos kernel:  pci_device_probe+0x112/0x2d0
> Dec 28 21:47:18 cachyos kernel:  really_probe+0xde/0x400
> Dec 28 21:47:18 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> Dec 28 21:47:18 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> Dec 28 21:47:18 cachyos kernel:  __driver_probe_device+0x78/0x150
> Dec 28 21:47:18 cachyos kernel:  __driver_attach+0xa0/0x340
> Dec 28 21:47:18 cachyos kernel:  bus_for_each_dev+0x10b/0x160
> Dec 28 21:47:18 cachyos kernel:  bus_add_driver+0x131/0x280
> Dec 28 21:47:18 cachyos kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  driver_register+0x75/0xe0
> Dec 28 21:47:18 cachyos kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
> 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
> Dec 28 21:47:18 cachyos kernel:  do_one_initcall+0x5b/0x300
> Dec 28 21:47:18 cachyos kernel:  do_init_module+0x62/0x250
> Dec 28 21:47:18 cachyos kernel:  ? init_module_from_file+0xd6/0x140
> Dec 28 21:47:18 cachyos kernel:  init_module_from_file+0xd6/0x140
> Dec 28 21:47:18 cachyos kernel:  idempotent_init_module+0x118/0x310
> Dec 28 21:47:18 cachyos kernel:  __x64_sys_finit_module+0x71/0xe0
> Dec 28 21:47:18 cachyos systemd-udevd[360]: 0000:01:00.0: Worker [410]
> terminated by signal 9 (KILL).
> Dec 28 21:47:18 cachyos kernel:  ? syscall_trace_enter+0x91/0x1e0
> Dec 28 21:47:18 cachyos kernel:  do_syscall_64+0x81/0x630
> Dec 28 21:47:18 cachyos kernel:  ? do_syscall_64+0x81/0x630
> Dec 28 21:47:18 cachyos kernel:  ? irq_exit_rcu+0x55/0x100
> Dec 28 21:47:18 cachyos kernel:  entry_SYSCALL_64_after_hwframe+0x79/0x81
> Dec 28 21:47:18 cachyos kernel: RIP: 0033:0x7f1ad316779d
> Dec 28 21:47:18 cachyos kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90
> f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24
> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 01 48
> Dec 28 21:47:18 cachyos kernel: RSP: 002b:00007ffe71df2278 EFLAGS: 00000246
> ORIG_RAX: 0000000000000139
> Dec 28 21:47:18 cachyos kernel: RAX: ffffffffffffffda RBX: 000055cb0eb476a0
> RCX: 00007f1ad316779d
> Dec 28 21:47:18 cachyos kernel: RDX: 0000000000000004 RSI: 00007f1ad284d2f2
> RDI: 000000000000005d
> Dec 28 21:47:18 cachyos kernel: RBP: 00007ffe71df2310 R08: 0000000000000000
> R09: 000055cb0eb49a70
> Dec 28 21:47:18 cachyos kernel: R10: 0000000000000000 R11: 0000000000000246
> R12: 00007f1ad284d2f2
> Dec 28 21:47:18 cachyos kernel: R13: 0000000000020000 R14: 000055cb0eadd7c0
> R15: 000055cb0eb476a0
> Dec 28 21:47:18 cachyos kernel:  </TASK>
> Dec 28 21:47:18 cachyos kernel: Modules linked in: dm_mod nouveau(+)
> drm_ttm_helper ttm gpu_sched uas i2c_algo_bit hid_playstation
> ghash_clmulni_intel drm_gpuvm nvme usb_storage led_class_multicolor drm_exec
> aesni_intel ff_memless mxm_wmi nvme_core ccp nvme_keyring drm_display_helper
> nvme_auth hid_logitech_dj hid_multitouch cec hkdf video wmi
> Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc
> Dec 28 21:47:18 cachyos kernel: ---[ end trace 0000000000000000 ]---
> Dec 28 21:47:18 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> Dec 28 21:47:18 cachyos kernel: Code: 48 08 f4 0f 1f 00 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 =
41
> 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48 89
> Dec 28 21:47:18 cachyos kernel: RSP: 0018:ffffd1e280bdb6f8 EFLAGS: 00010286
> Dec 28 21:47:18 cachyos kernel: RAX: ffff8bec90f54800 RBX: 0000000000000000
> RCX: ffffd1e280bdb78f
> Dec 28 21:47:18 cachyos kernel: RDX: ffffd1e280bdb72a RSI: 0000000000000070
> RDI: 0000000000000000
> Dec 28 21:47:18 cachyos kernel: RBP: ffff8beca75a1000 R08: ffffd1e280bdb798
> R09: 000000000000001f
> Dec 28 21:47:18 cachyos kernel: R10: 0000000000000002 R11: 0000000000010000
> R12: ffffd1e280bdb78f
> Dec 28 21:47:18 cachyos kernel: R13: 0000000000000070 R14: ffffd1e280bdb798
> R15: ffffd1e280bdb78e
> Dec 28 21:47:18 cachyos kernel: FS:  00007f1ad28a2840(0000)
> GS:ffff8c03c7130000(0000) knlGS:0000000000000000
> Dec 28 21:47:18 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc CR3: 00000001184a6000
> CR4: 0000000000f50ef0
> Dec 28 21:47:18 cachyos kernel: PKRU: 55555554
> Dec 28 21:47:18 cachyos kernel: note: (udev-worker)[410] exited with irqs
> disabled
>=20
> Does this new kernel require bleeding edge linux-firmware for nvidia?

Replicated the issue on linux-mainline, so it's not cachyos patches
causing the problem. Another user has failed to replicate it on various
6.19 versions (rc1, rc3) using a 3000 series GPU, so it's likely
Blackwell specific, as I have a 5070 Ti.

The crash on linux-mainline was complicated by the mt76 string overflow
issue that still isn't patched in RC3, though.

Dec 28 23:01:13 archlinux kernel: BUG: kernel NULL pointer dereference,
address: 00000000000000cc
Dec 28 23:01:13 archlinux kernel: #PF: supervisor read access in kernel mode
Dec 28 23:01:13 archlinux kernel: #PF: error_code(0x0000) - not-present page
Dec 28 23:01:13 archlinux kernel: PGD 0 P4D 0
Dec 28 23:01:13 archlinux kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Dec 28 23:01:13 archlinux kernel: CPU: 3 UID: 0 PID: 432 Comm: (udev-worker)
Not tainted 6.19.0-rc3-1-mainline-dirty #1 PREEMPT(full)
6f31553276eb8f2de91bc301e09f6c7cde02609a
Dec 28 23:01:13 archlinux kernel: Hardware name: Micro-Star International Co.,
Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
Dec 28 23:01:13 archlinux kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
Dec 28 23:01:13 archlinux kernel: Code: ff e8 80 0b 73 f8 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 41
54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b1 00 00 00 83 c6 0a 49 89 d6 48 89
Dec 28 23:01:13 archlinux kernel: RSP: 0018:ffffcccc815074b8 EFLAGS: 00010296
Dec 28 23:01:13 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000000
RCX: ffffcccc81507536
Dec 28 23:01:13 archlinux kernel: RDX: ffffcccc815074f2 RSI: 0000000000000070
RDI: 0000000000000000
Dec 28 23:01:13 archlinux kernel: RBP: ffffcccc81507536 R08: ffffcccc81507537
R09: 0000000000001000
Dec 28 23:01:13 archlinux kernel: R10: 000000009ffdf000 R11: 0000000000000002
R12: ffffcccc81507537
Dec 28 23:01:13 archlinux kernel: R13: 0000000000000070 R14: ffffcccc8150758e
R15: ffffcccc8150758f
Dec 28 23:01:13 archlinux kernel: FS:  00007f175c3b8840(0000)
GS:ffff8aef0298c000(0000) knlGS:0000000000000000
Dec 28 23:01:13 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 28 23:01:13 archlinux kernel: CR2: 00000000000000cc CR3: 0000000116f96000
CR4: 0000000000f50ef0
Dec 28 23:01:13 archlinux kernel: PKRU: 55555554
Dec 28 23:01:13 archlinux kernel: Call Trace:
Dec 28 23:01:13 archlinux kernel:  <TASK>
Dec 28 23:01:13 archlinux kernel:  nvbios_pmuTe+0x4f/0xf0 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvbios_pmuEp+0x4d/0xc0 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvkm_gsp_fwsec_init+0x77/0x3c0 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  r535_gsp_oneinit+0x25e/0xf90 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  ? gh100_gsp_oneinit+0x288/0x420 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  gh100_gsp_oneinit+0x2bc/0x420 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvkm_subdev_oneinit_+0x43/0x90 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  ? ktime_get+0x3b/0xd0
Dec 28 23:01:13 archlinux kernel:  nvkm_subdev_init_+0x31/0xa0 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  ? nvkm_intr_rearm+0xc4/0x1c0 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvkm_object_init+0x42/0x120 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvkm_ioctl_new+0x15c/0x220 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
[nouveau 1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvkm_ioctl+0xba/0x130 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvif_object_ctor+0x114/0x190 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  nouveau_drm_device_new+0x15c/0x320 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  ? __pci_set_master+0x5e/0xe0
Dec 28 23:01:13 archlinux kernel:  nouveau_drm_probe+0xb9/0x210 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  ? __pm_runtime_resume+0x5f/0x90
Dec 28 23:01:13 archlinux kernel:  local_pci_probe+0x42/0x90
Dec 28 23:01:13 archlinux kernel:  pci_device_probe+0xda/0x280
Dec 28 23:01:13 archlinux kernel:  ? sysfs_do_create_link_sd+0x6d/0xd0
Dec 28 23:01:13 archlinux kernel:  really_probe+0xde/0x380
Dec 28 23:01:13 archlinux kernel:  __driver_probe_device+0x78/0x150
Dec 28 23:01:13 archlinux kernel:  driver_probe_device+0x1f/0xa0
Dec 28 23:01:13 archlinux kernel:  ? __pfx___driver_attach+0x10/0x10
Dec 28 23:01:13 archlinux kernel:  __driver_attach+0xcb/0x200
Dec 28 23:01:13 archlinux kernel:  bus_for_each_dev+0x85/0xd0
Dec 28 23:01:13 archlinux kernel:  bus_add_driver+0x118/0x200
Dec 28 23:01:13 archlinux kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  driver_register+0x75/0xe0
Dec 28 23:01:13 archlinux kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
1ced2b39f8fa9b515ea0f917e46ab5fde01df79e]
Dec 28 23:01:13 archlinux kernel:  do_one_initcall+0x5b/0x300
Dec 28 23:01:13 archlinux kernel:  do_init_module+0x62/0x250
Dec 28 23:01:13 archlinux systemd-udevd[359]: 0000:01:00.0: Worker [432]
terminated by signal 9 (KILL).
Dec 28 23:01:13 archlinux kernel:  init_module_from_file+0xd8/0x140
Dec 28 23:01:13 archlinux kernel:  idempotent_init_module+0x114/0x310
Dec 28 23:01:13 archlinux kernel:  __x64_sys_finit_module+0x71/0xe0
Dec 28 23:01:13 archlinux kernel:  ? syscall_trace_enter+0x8d/0x1d0
Dec 28 23:01:13 archlinux kernel:  do_syscall_64+0x81/0x610
Dec 28 23:01:13 archlinux kernel:  ? do_sys_openat2+0xac/0xf0
Dec 28 23:01:13 archlinux kernel:  ? __x64_sys_openat+0x61/0xa0
Dec 28 23:01:13 archlinux kernel:  ? do_syscall_64+0x81/0x610
Dec 28 23:01:13 archlinux kernel:  ? do_sys_openat2+0xac/0xf0
Dec 28 23:01:13 archlinux kernel:  ? __x64_sys_openat+0x61/0xa0
Dec 28 23:01:13 archlinux kernel:  ? do_syscall_64+0x81/0x610
Dec 28 23:01:13 archlinux kernel:  ? __x64_sys_openat+0x61/0xa0
Dec 28 23:01:13 archlinux kernel:  ? do_syscall_64+0x81/0x610
Dec 28 23:01:13 archlinux kernel:  ? sched_clock+0x10/0x30
Dec 28 23:01:13 archlinux kernel:  ? sched_clock_cpu+0xf/0x200
Dec 28 23:01:13 archlinux kernel:  ?
__flush_smp_call_function_queue+0xae/0x410
Dec 28 23:01:13 archlinux kernel:  ? sched_clock_cpu+0xf/0x200
Dec 28 23:01:13 archlinux kernel:  ? irqtime_account_irq+0x3c/0xc0
Dec 28 23:01:13 archlinux kernel:  ? __irq_exit_rcu+0x4c/0xf0
Dec 28 23:01:13 archlinux kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Dec 28 23:01:13 archlinux kernel: RIP: 0033:0x7f175cc7d79d
Dec 28 23:01:13 archlinux kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 01 48
Dec 28 23:01:13 archlinux kernel: RSP: 002b:00007ffeea4f46a8 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Dec 28 23:01:13 archlinux kernel: RAX: ffffffffffffffda RBX: 0000561d180f9e90
RCX: 00007f175cc7d79d
Dec 28 23:01:13 archlinux kernel: RDX: 0000000000000004 RSI: 00007f175c3632f2
RDI: 000000000000008d
Dec 28 23:01:13 archlinux kernel: RBP: 00007ffeea4f4740 R08: 0000000000000000
R09: 0000561d180fd7d0
Dec 28 23:01:13 archlinux kernel: R10: 0000000000000000 R11: 0000000000000246
R12: 00007f175c3632f2
Dec 28 23:01:13 archlinux kernel: R13: 0000000000020000 R14: 0000561d180f9210
R15: 0000561d180f9e90
Dec 28 23:01:13 archlinux kernel:  </TASK>
Dec 28 23:01:13 archlinux kernel: Modules linked in: dm_mod nouveau(+)
drm_ttm_helper ttm gpu_sched uas hid_playstation i2c_algo_bit
ghash_clmulni_intel nvme usb_storage drm_gpuvm led_class_multicolor
aesni_intel ff_memless drm_exec nvme_core mxm_wmi ccp nvme_keyring
drm_display_helper nvme_auth hid_logitech_dj(+) video hkdf hid_multitouch cec
wmi
Dec 28 23:01:13 archlinux kernel: CR2: 00000000000000cc
Dec 28 23:01:13 archlinux kernel: ---[ end trace 0000000000000000 ]---
Dec 28 23:01:13 archlinux kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
Dec 28 23:01:13 archlinux kernel: Code: ff e8 80 0b 73 f8 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 41
54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b1 00 00 00 83 c6 0a 49 89 d6 48 89
Dec 28 23:01:13 archlinux kernel: RSP: 0018:ffffcccc815074b8 EFLAGS: 00010296
Dec 28 23:01:13 archlinux kernel: RAX: 0000000000000000 RBX: 0000000000000000
RCX: ffffcccc81507536
Dec 28 23:01:13 archlinux kernel: RDX: ffffcccc815074f2 RSI: 0000000000000070
RDI: 0000000000000000
Dec 28 23:01:13 archlinux kernel: RBP: ffffcccc81507536 R08: ffffcccc81507537
R09: 0000000000001000
Dec 28 23:01:13 archlinux kernel: R10: 000000009ffdf000 R11: 0000000000000002
R12: ffffcccc81507537
Dec 28 23:01:13 archlinux kernel: R13: 0000000000000070 R14: ffffcccc8150758e
R15: ffffcccc8150758f
Dec 28 23:01:13 archlinux kernel: FS:  00007f175c3b8840(0000)
GS:ffff8aef0298c000(0000) knlGS:0000000000000000
Dec 28 23:01:13 archlinux kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 28 23:01:13 archlinux kernel: CR2: 00000000000000cc CR3: 0000000116f96000
CR4: 0000000000f50ef0
Dec 28 23:01:13 archlinux kernel: PKRU: 55555554
Dec 28 23:01:13 archlinux kernel: note: (udev-worker)[432] exited with irqs
disabled


--===============6739603137155656827==
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
MIME-Version: 1.0

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEdiLr51NrDwQ29PFjjWyYR59K3nEFAmlTBPEACgkQjWyYR59K
3nGTVhAAiUseTpX6ZXuejIuZQhh0ApXq9owQoOFYOGrqXyEsquPqRiYqjnaSN5bJ
FbzvtRP0dYkQnSo9VkZ93Z+M1AqLrUjKjyFHq72itn1BqQNuhmu4vPLS3zDHFyvR
P+Wlh0fKMQdxCsnRrhiNBheEz/jwVV7PPzXHZyZXXIiTh5K2OjP7+BqD/5X1cggo
aAE679qtSSLDxf43GqZobiwSOCbvO7yEhI5EyiE+kQNyu4LLlaRDIRfmqXCNJNwV
TndSbMANaahefPLo7ApOuCRXQvdHw8230wdjMiJn9FK71+CHTdK5MQQ683grJorn
3ncJrka5LVr5YdRlwKoRB05UTiT7EtumRRU4n68Gz9PIVFWe4cbnjoosiQTcehVc
VUT1B86gUuU8HR3HMOpIQG31KBgQXNTOeD/YADqgXG+vnqjMIx2+UGCienvu792H
yxBZIBUCSci9HouncvVBLOvNuuuYbgkb+uQlIAuJaTU9liXBQma5nXuHDw6UzGHm
3zeSLVdbIxHILDGDolUoO8b1NTD7qWf2kLYqea8eZgaM1qS8KjQIZRRG308z5MfO
pVJHhNYLq7hXYoiUeOHqUArkKsEdXPAGwtULQNMEOfRkfOjA4abR+rL7U7SFAFea
a6beXmJnXwPnuXq0vPEvhJbG2BdH3zdVdE39EkcQynIHl1ZuHPw=
=4BzC
-----END PGP SIGNATURE-----

--===============6739603137155656827==--
