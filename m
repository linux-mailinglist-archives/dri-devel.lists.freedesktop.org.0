Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226BFCE5FD2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 07:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30CA11277D;
	Mon, 29 Dec 2025 06:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="x8QN9Y1D";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="guv5/iEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 166225 seconds by postgrey-1.36 at gabe;
 Mon, 29 Dec 2025 06:01:24 UTC
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AA111277D;
 Mon, 29 Dec 2025 06:01:24 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 34EA77A0074;
 Mon, 29 Dec 2025 01:01:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Mon, 29 Dec 2025 01:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1766988083; x=1767074483; bh=x+Sdey2ZtE
 qDYnxlQ6PLSaOnjlfGA29n6eujAw52uJk=; b=x8QN9Y1DhIPoh4HdT0mKnRa4Ux
 8iqVbMRDNvVOoWwjkJ+/YzPXC7CNoJdU9OM+TLtwVelW9xGgoQTG1S6G1k0XcRIA
 GhqDOq1nQrjqQ42MNqtV+qlqWZxm75XXglap2ZehG8vATQOxNiUrkZNvkQs4jZBr
 EqHQ9JgcduCYA+KTeXepY8pTmrCIJcOAKFePFI9es1vPdyfhTFCVOv8OIpzYsi1s
 iuiHjpAzHt7tQrXkCPCo0aopuw2Bv5WQJ95ed7rYg3xHoOlVhxrr4ZcNAyA4I9Uc
 BXjY94MCuWDHQyEcPHeupEPDwbQlifDSxpVVLhJc3JS1areXJ+zHPKWGK/qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1766988083; x=1767074483; bh=x+Sdey2ZtEqDYnxlQ6PLSaOnjlfGA29n6eu
 jAw52uJk=; b=guv5/iEp7togl9NaSGF9DiggdgegY6Oe6M5U6b5sHV1B0vbJ1zM
 zoTSzbuZ3YBtLpxlu9GGH4NU7wVyuF5N+nYbjZwQr06CqAckNChiR1WawnW1Uf3A
 +dy1jJgQCEG2SLOWBYMXgP1pZp4/whQBlqKNhU5zvKAOcIn98Ev6XcWyiWXldSvR
 kNZZrhg3aAXSU9Yl/rMRrOuoa3weqZ2MrQQPBOlCaUx8pHw5Tr9S2rFKMSV4kHXT
 xb6zZPOvuurQxUGp94VC2TAJUFFaetlLEz6B4sVeqNq1Y1lsUPCJ+eNl65zjXnuC
 dpWApkguA7KwVQFUZfQjkdsw5O2kwXotYvA==
X-ME-Sender: <xms:MhlSadEYw8rLfoBuzGumvQEaT9VqDYz1oFQPuXIOyWxcdhH8dckftw>
 <xme:MhlSaSwNq82LuXaExfDrf7i3nDOW8hQ6l9pOKu8vSSl3D2jSPhDCyITHexpg-YdjU
 RYzAu-kuCkqOkk3OmfJSqRaOy7RcRJGTeN3EXkxNHbKjHDxYy2TizE>
X-ME-Received: <xmr:MhlSaf0fQVXq6xKMOKcZx3pyj4hL6cdWpZlk3hODHyZlFTcg35G_BQ5CbRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejieefjecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:MhlSaarTfyqdzxtyLE-ZrDea1fsjO6bbtHgZnRNxGczBmr9UGHmlsg>
 <xmx:MhlSaUUU9vAYHhu_gpV1Z0ao3wSi9QDaFekrTJZXkFUhDTLWQqoBRg>
 <xmx:MhlSabqgDWU4h5Yr9lkVwPF0rmXSo1BAPJqxAFHPtKawNnY6IwmWdg>
 <xmx:MhlSaTBjyhiSCIBCtaiAbMu2hVHumxsMAondIM2pCfsSpmp2xek89Q>
 <xmx:MxlSaXZJ8LAp4qtuHP_HRUTQJ3aSbI-w6xgjhcVHHL7guW6olJhMiuJa>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 01:01:22 -0500 (EST)
From: Christopher Snowhill <chris@kode54.net>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [BUG] NULL pointer dereference in Nouveau in 6.19 rc3 on boot
Message-ID: <176698808133.6372.2408917375327107249@copycat>
User-Agent: Dodo
Date: Sun, 28 Dec 2025 22:01:21 -0800
In-Reply-To: <176682185563.8256.115798774340102079@copycat>
References: <176682185563.8256.115798774340102079@copycat>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha512"; boundary="===============0628149434855852146=="
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

--===============0628149434855852146==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On Fri 26 Dec 2025 11:50:55 PM , Christopher Snowhill wrote:
> I get the following NULL pointer dereference on boot, shortly before it
> would be showing me my LUKS password prompt on a graphical screen. I had
> to trust that there was a prompt and log into it blindly to boot and
> recover this kernel log snippet.
>=20
> This kernel is built using the linux-cachyos-rc package, and only has
> minor patches unrelated to DRM code, except that I also applied the
> Nouveau ZCULL patch set on top, as well as some downstream sched-ext
> patches from Andrea Righi's tree.
>=20
> Using latest stable linux-firmware packages from CachyOS, so
> 1:20251125-2.
>=20
> Should I also have CC'd Maarten Lankhorst? I recall he was retiring from
> the maintainer position due to leaving Intel, but get_maintainers.pl
> still returns his contact name and address.
>=20
> Dec 26 22:52:57 cachyos kernel: nouveau 0000:01:00.0: vgaarb: deactivate vga
> console
> Dec 26 22:52:57 cachyos kernel: BUG: kernel NULL pointer dereference, addre=
ss:
> 00000000000000cc
> Dec 26 22:52:57 cachyos kernel: #PF: supervisor read access in kernel mode
> Dec 26 22:52:57 cachyos kernel: #PF: error_code(0x0000) - not-present page
> Dec 26 22:52:57 cachyos kernel: PGD 0 P4D 0
> Dec 26 22:52:57 cachyos kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Dec 26 22:52:57 cachyos kernel: CPU: 3 UID: 0 PID: 398 Comm: (udev-worker) =
Not
> tainted 6.19.0-rc2-1-cachyos-rc #1 PREEMPT(full)
> 71029b2e9fcfeb4957f998851dc3b8eefd7c60f1
> Dec 26 22:52:57 cachyos kernel: Hardware name: Micro-Star International Co.,
> Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
> Dec 26 22:52:57 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> Dec 26 22:52:57 cachyos kernel: Code: 48 88 f2 0f 1f 00 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 =
41
> 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48 89
> Dec 26 22:52:57 cachyos kernel: RSP: 0018:ffffd13900b73568 EFLAGS: 00010282
> Dec 26 22:52:57 cachyos kernel: RAX: ffff8ef7a5429000 RBX: 0000000000000000
> RCX: ffffd13900b735ff
> Dec 26 22:52:57 cachyos kernel: RDX: ffffd13900b7359a RSI: 0000000000000070
> RDI: 0000000000000000
> Dec 26 22:52:57 cachyos kernel: RBP: ffff8ef79305d000 R08: ffffd13900b73608
> R09: 000000000000001f
> Dec 26 22:52:57 cachyos kernel: R10: 0000000000000002 R11: 0000000000010000
> R12: ffffd13900b735ff
> Dec 26 22:52:57 cachyos kernel: R13: 0000000000000070 R14: ffffd13900b73608
> R15: ffffd13900b735fe
> Dec 26 22:52:57 cachyos kernel: FS:  00007f830f677840(0000)
> GS:ffff8f0ec8730000(0000) knlGS:0000000000000000
> Dec 26 22:52:57 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc CR3: 0000000117521000
> CR4: 0000000000f50ef0
> Dec 26 22:52:57 cachyos kernel: PKRU: 55555554
> Dec 26 22:52:57 cachyos kernel: Call Trace:
> Dec 26 22:52:57 cachyos kernel:  <TASK>
> Dec 26 22:52:57 cachyos kernel:  nvbios_pmuEp+0x51/0x130 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvkm_gsp_fwsec_init+0x76/0x3c0 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  r535_gsp_oneinit+0x2e4/0x1060 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  gh100_gsp_oneinit+0x33b/0x4d0 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvkm_subdev_init_+0x63/0x100 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvkm_object_init+0x42/0x120 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvkm_ioctl_new+0x1d8/0x290 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
> [nouveau 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvkm_ioctl+0xba/0x130 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos systemd-udevd[363]: 0000:01:00.0: Worker [398]
> terminated by signal 9 (KILL).
> Dec 26 22:52:57 cachyos kernel:  nvif_object_ctor+0x114/0x190 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nouveau_drm_device_new+0x15c/0x320 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  nouveau_drm_probe+0xbb/0x210 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  ? __pm_runtime_resume+0x59/0x80
> Dec 26 22:52:57 cachyos kernel:  pci_device_probe+0x112/0x2d0
> Dec 26 22:52:57 cachyos kernel:  really_probe+0xde/0x400
> Dec 26 22:52:57 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> Dec 26 22:52:57 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
> Dec 26 22:52:57 cachyos kernel:  __driver_probe_device+0x78/0x150
> Dec 26 22:52:57 cachyos kernel:  __driver_attach+0xa0/0x340
> Dec 26 22:52:57 cachyos kernel:  bus_for_each_dev+0x10b/0x160
> Dec 26 22:52:57 cachyos kernel:  bus_add_driver+0x131/0x280
> Dec 26 22:52:57 cachyos kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  driver_register+0x75/0xe0
> Dec 26 22:52:57 cachyos kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
> 92367f81003504f1f8c63f31342b6d203ebdc5d1]
> Dec 26 22:52:57 cachyos kernel:  do_one_initcall+0x5b/0x300
> Dec 26 22:52:57 cachyos kernel:  do_init_module+0x62/0x250
> Dec 26 22:52:57 cachyos kernel:  ? init_module_from_file+0xd6/0x140
> Dec 26 22:52:57 cachyos kernel:  init_module_from_file+0xd6/0x140
> Dec 26 22:52:57 cachyos kernel:  idempotent_init_module+0x118/0x310
> Dec 26 22:52:57 cachyos kernel:  __x64_sys_finit_module+0x71/0xe0
> Dec 26 22:52:57 cachyos kernel:  ? syscall_trace_enter+0x91/0x1e0
> Dec 26 22:52:57 cachyos kernel:  do_syscall_64+0x81/0x630
> Dec 26 22:52:57 cachyos kernel:  ? __x64_sys_pread64+0x9c/0xd0
> Dec 26 22:52:57 cachyos kernel:  ? do_syscall_64+0x81/0x630
> Dec 26 22:52:57 cachyos kernel:  ? __do_sys_newfstatat+0xe0/0x170
> Dec 26 22:52:57 cachyos kernel:  ? do_syscall_64+0x81/0x630
> Dec 26 22:52:57 cachyos kernel:  ? irq_exit_rcu+0x55/0x100
> Dec 26 22:52:57 cachyos kernel:  entry_SYSCALL_64_after_hwframe+0x79/0x81
> Dec 26 22:52:57 cachyos kernel: RIP: 0033:0x7f830ff3c79d
> Dec 26 22:52:57 cachyos kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90
> f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24
> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 01 48
> Dec 26 22:52:57 cachyos kernel: RSP: 002b:00007ffc68e73f08 EFLAGS: 00000246
> ORIG_RAX: 0000000000000139
> Dec 26 22:52:57 cachyos kernel: RAX: ffffffffffffffda RBX: 0000558c285bb2a0
> RCX: 00007f830ff3c79d
> Dec 26 22:52:57 cachyos kernel: RDX: 0000000000000004 RSI: 00007f830f6222f2
> RDI: 000000000000003f
> Dec 26 22:52:57 cachyos kernel: RBP: 00007ffc68e73fa0 R08: 0000000000000000
> R09: 0000558c285bc240
> Dec 26 22:52:57 cachyos kernel: R10: 0000000000000000 R11: 0000000000000246
> R12: 00007f830f6222f2
> Dec 26 22:52:57 cachyos kernel: R13: 0000000000020000 R14: 0000558c2853b7a0
> R15: 0000558c285bb2a0
> Dec 26 22:52:57 cachyos kernel:  </TASK>
> Dec 26 22:52:57 cachyos kernel: Modules linked in: dm_mod nouveau(+)
> drm_ttm_helper ttm gpu_sched hid_playstation(+) i2c_algo_bit uas nvme
> ghash_clmulni_intel drm_gpuvm led_class_multicolor usb_storage aesni_intel
> drm_exec ff_memless nvme_core mxm_wmi ccp nvme_keyring drm_display_helper
> nvme_auth hid_multitouch hid_logitech_dj(+) video hkdf cec wmi
> Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc
> Dec 26 22:52:57 cachyos kernel: ---[ end trace 0000000000000000 ]---
> Dec 26 22:52:57 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
> Dec 26 22:52:57 cachyos kernel: Code: 48 88 f2 0f 1f 00 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 =
41
> 54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48 89
> Dec 26 22:52:57 cachyos kernel: RSP: 0018:ffffd13900b73568 EFLAGS: 00010282
> Dec 26 22:52:57 cachyos kernel: RAX: ffff8ef7a5429000 RBX: 0000000000000000
> RCX: ffffd13900b735ff
> Dec 26 22:52:57 cachyos kernel: RDX: ffffd13900b7359a RSI: 0000000000000070
> RDI: 0000000000000000
> Dec 26 22:52:57 cachyos kernel: RBP: ffff8ef79305d000 R08: ffffd13900b73608
> R09: 000000000000001f
> Dec 26 22:52:57 cachyos kernel: R10: 0000000000000002 R11: 0000000000010000
> R12: ffffd13900b735ff
> Dec 26 22:52:57 cachyos kernel: R13: 0000000000000070 R14: ffffd13900b73608
> R15: ffffd13900b735fe
> Dec 26 22:52:57 cachyos kernel: FS:  00007f830f677840(0000)
> GS:ffff8f0ec8730000(0000) knlGS:0000000000000000
> Dec 26 22:52:57 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Dec 26 22:52:57 cachyos kernel: CR2: 00000000000000cc CR3: 0000000117521000
> CR4: 0000000000f50ef0
> Dec 26 22:52:57 cachyos kernel: PKRU: 55555554
> Dec 26 22:52:57 cachyos kernel: note: (udev-worker)[398] exited with irqs
> disabled
>=20

Still crashing with 6.19 rc3. I have to use the proprietary drivers to
have a desktop, but I probably should be using those anyway.

Dec 28 21:47:18 cachyos kernel: BUG: kernel NULL pointer dereference, address:
00000000000000cc
Dec 28 21:47:18 cachyos kernel: #PF: supervisor read access in kernel mode
Dec 28 21:47:18 cachyos kernel: #PF: error_code(0x0000) - not-present page
Dec 28 21:47:18 cachyos kernel: PGD 0 P4D 0
Dec 28 21:47:18 cachyos kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Dec 28 21:47:18 cachyos kernel: CPU: 3 UID: 0 PID: 410 Comm: (udev-worker) Not
tainted 6.19.0-rc3-1-cachyos-rc #1 PREEMPT(full)
048c9ac8e7cc8ed3d1ec452c3a62bf8817030490
Dec 28 21:47:18 cachyos kernel: Hardware name: Micro-Star International Co.,
Ltd. MS-7E16/X670E GAMING PLUS WIFI (MS-7E16), BIOS 1.C7 10/22/2025
Dec 28 21:47:18 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
Dec 28 21:47:18 cachyos kernel: Code: 48 08 f4 0f 1f 00 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 41
54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48 89
Dec 28 21:47:18 cachyos kernel: RSP: 0018:ffffd1e280bdb6f8 EFLAGS: 00010286
Dec 28 21:47:18 cachyos kernel: RAX: ffff8bec90f54800 RBX: 0000000000000000
RCX: ffffd1e280bdb78f
Dec 28 21:47:18 cachyos kernel: RDX: ffffd1e280bdb72a RSI: 0000000000000070
RDI: 0000000000000000
Dec 28 21:47:18 cachyos kernel: RBP: ffff8beca75a1000 R08: ffffd1e280bdb798
R09: 000000000000001f
Dec 28 21:47:18 cachyos kernel: R10: 0000000000000002 R11: 0000000000010000
R12: ffffd1e280bdb78f
Dec 28 21:47:18 cachyos kernel: R13: 0000000000000070 R14: ffffd1e280bdb798
R15: ffffd1e280bdb78e
Dec 28 21:47:18 cachyos kernel: FS:  00007f1ad28a2840(0000)
GS:ffff8c03c7130000(0000) knlGS:0000000000000000
Dec 28 21:47:18 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc CR3: 00000001184a6000
CR4: 0000000000f50ef0
Dec 28 21:47:18 cachyos kernel: PKRU: 55555554
Dec 28 21:47:18 cachyos kernel: Call Trace:
Dec 28 21:47:18 cachyos kernel:  <TASK>
Dec 28 21:47:18 cachyos kernel:  nvbios_pmuEp+0x51/0x130 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvkm_gsp_fwsec_init+0x76/0x3c0 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  r535_gsp_oneinit+0x2e4/0x1060 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  gh100_gsp_oneinit+0x33b/0x4d0 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvkm_subdev_init_+0x63/0x100 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvkm_subdev_init+0x46/0x60 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvkm_device_init+0x163/0x1e0 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvkm_udevice_init+0x45/0x70 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvkm_object_init+0x42/0x120 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvkm_ioctl_new+0x1d8/0x290 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  ? __pfx_nvkm_client_child_new+0x10/0x10
[nouveau 52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvkm_ioctl+0xba/0x130 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvif_object_ctor+0x114/0x190 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nvif_device_ctor+0x2e/0x70 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nouveau_drm_device_new+0x15c/0x320 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  nouveau_drm_probe+0xbb/0x210 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  ? __pm_runtime_resume+0x59/0x80
Dec 28 21:47:18 cachyos kernel:  pci_device_probe+0x112/0x2d0
Dec 28 21:47:18 cachyos kernel:  really_probe+0xde/0x400
Dec 28 21:47:18 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
Dec 28 21:47:18 cachyos kernel:  ? __pfx___driver_attach+0x10/0x10
Dec 28 21:47:18 cachyos kernel:  __driver_probe_device+0x78/0x150
Dec 28 21:47:18 cachyos kernel:  __driver_attach+0xa0/0x340
Dec 28 21:47:18 cachyos kernel:  bus_for_each_dev+0x10b/0x160
Dec 28 21:47:18 cachyos kernel:  bus_add_driver+0x131/0x280
Dec 28 21:47:18 cachyos kernel:  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  driver_register+0x75/0xe0
Dec 28 21:47:18 cachyos kernel:  nouveau_drm_init+0x1b3/0xff0 [nouveau
52ba080e4b7b95996467b34d4d25c4c6ce5aa54d]
Dec 28 21:47:18 cachyos kernel:  do_one_initcall+0x5b/0x300
Dec 28 21:47:18 cachyos kernel:  do_init_module+0x62/0x250
Dec 28 21:47:18 cachyos kernel:  ? init_module_from_file+0xd6/0x140
Dec 28 21:47:18 cachyos kernel:  init_module_from_file+0xd6/0x140
Dec 28 21:47:18 cachyos kernel:  idempotent_init_module+0x118/0x310
Dec 28 21:47:18 cachyos kernel:  __x64_sys_finit_module+0x71/0xe0
Dec 28 21:47:18 cachyos systemd-udevd[360]: 0000:01:00.0: Worker [410]
terminated by signal 9 (KILL).
Dec 28 21:47:18 cachyos kernel:  ? syscall_trace_enter+0x91/0x1e0
Dec 28 21:47:18 cachyos kernel:  do_syscall_64+0x81/0x630
Dec 28 21:47:18 cachyos kernel:  ? do_syscall_64+0x81/0x630
Dec 28 21:47:18 cachyos kernel:  ? irq_exit_rcu+0x55/0x100
Dec 28 21:47:18 cachyos kernel:  entry_SYSCALL_64_after_hwframe+0x79/0x81
Dec 28 21:47:18 cachyos kernel: RIP: 0033:0x7f1ad316779d
Dec 28 21:47:18 cachyos kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 15 0f 00 f7 d8 64 89 01 48
Dec 28 21:47:18 cachyos kernel: RSP: 002b:00007ffe71df2278 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
Dec 28 21:47:18 cachyos kernel: RAX: ffffffffffffffda RBX: 000055cb0eb476a0
RCX: 00007f1ad316779d
Dec 28 21:47:18 cachyos kernel: RDX: 0000000000000004 RSI: 00007f1ad284d2f2
RDI: 000000000000005d
Dec 28 21:47:18 cachyos kernel: RBP: 00007ffe71df2310 R08: 0000000000000000
R09: 000055cb0eb49a70
Dec 28 21:47:18 cachyos kernel: R10: 0000000000000000 R11: 0000000000000246
R12: 00007f1ad284d2f2
Dec 28 21:47:18 cachyos kernel: R13: 0000000000020000 R14: 000055cb0eadd7c0
R15: 000055cb0eb476a0
Dec 28 21:47:18 cachyos kernel:  </TASK>
Dec 28 21:47:18 cachyos kernel: Modules linked in: dm_mod nouveau(+)
drm_ttm_helper ttm gpu_sched uas i2c_algo_bit hid_playstation
ghash_clmulni_intel drm_gpuvm nvme usb_storage led_class_multicolor drm_exec
aesni_intel ff_memless mxm_wmi nvme_core ccp nvme_keyring drm_display_helper
nvme_auth hid_logitech_dj hid_multitouch cec hkdf video wmi
Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc
Dec 28 21:47:18 cachyos kernel: ---[ end trace 0000000000000000 ]---
Dec 28 21:47:18 cachyos kernel: RIP: 0010:bit_entry+0x14/0xf0 [nouveau]
Dec 28 21:47:18 cachyos kernel: Code: 48 08 f4 0f 1f 00 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 41 56 41 55 41 89 f5 41
54 55 53 <8b> b7 cc 00 00 00 85 f6 0f 84 b0 00 00 00 83 c6 0a 49 89 d6 48 89
Dec 28 21:47:18 cachyos kernel: RSP: 0018:ffffd1e280bdb6f8 EFLAGS: 00010286
Dec 28 21:47:18 cachyos kernel: RAX: ffff8bec90f54800 RBX: 0000000000000000
RCX: ffffd1e280bdb78f
Dec 28 21:47:18 cachyos kernel: RDX: ffffd1e280bdb72a RSI: 0000000000000070
RDI: 0000000000000000
Dec 28 21:47:18 cachyos kernel: RBP: ffff8beca75a1000 R08: ffffd1e280bdb798
R09: 000000000000001f
Dec 28 21:47:18 cachyos kernel: R10: 0000000000000002 R11: 0000000000010000
R12: ffffd1e280bdb78f
Dec 28 21:47:18 cachyos kernel: R13: 0000000000000070 R14: ffffd1e280bdb798
R15: ffffd1e280bdb78e
Dec 28 21:47:18 cachyos kernel: FS:  00007f1ad28a2840(0000)
GS:ffff8c03c7130000(0000) knlGS:0000000000000000
Dec 28 21:47:18 cachyos kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 28 21:47:18 cachyos kernel: CR2: 00000000000000cc CR3: 00000001184a6000
CR4: 0000000000f50ef0
Dec 28 21:47:18 cachyos kernel: PKRU: 55555554
Dec 28 21:47:18 cachyos kernel: note: (udev-worker)[410] exited with irqs
disabled

Does this new kernel require bleeding edge linux-firmware for nvidia?

--===============0628149434855852146==
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
MIME-Version: 1.0

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEdiLr51NrDwQ29PFjjWyYR59K3nEFAmlSGTEACgkQjWyYR59K
3nEX3g/9EXJDxtnWf7VKlGoi/s192VYSAfJZkFsDdpw7s4cXVANrE0lIqniTQfMq
oDIWJ5LWrS81KGTGMSXa8Iw6HPHO/k6K5jdg2ByoPCQyTolDC/+YfJCweVTvJk6l
aSATI/svrMGb47u/3Ld4okYv2bQSXScHdidRylCuWjF4U0REOv0uh6ZA6nZHmR4c
1BGnvEeH5VTyMLItJUfT3/W00diD6Io31So4vMKVVDXDJMVqqvzxVFkDmXyoXYh9
05V6uzPhRz0kWaJybLTkBnSniTiVhIQ11hiQsx8iNn71w9ALpFzbh0RI5MWf/7nC
jjqeiH5ILH/FStYbq898rcBptZ4gGrFuZyzivm4MlqWV4jgyvm6v6UlFFmthTRxj
vLc5SyIc8yOfxiOT3+xnDYIo7jKDk9D+UP623T3+fFNDN46C88FfphOzS2sJeiOl
U7zbLTWyydORXTF+m/B8M2CTbBom35a46719Z0IkIaTU3nUdkQlcMhXsOX8YlktD
VEFVDkmEddxgEzTk7648P7Nv+3JGHCY/NVxMqQTuKWluphCnudhJC3Ilne/QDKA6
8t0uce26g7FljWcjGCk+zu5uqO7KyZOQ1VmZTjDqeJxjiwv25MfrDJcEqX8OntEL
8dW3RjaQl391Yjc83mdkdgTgKEGCiCcFJV6/bgj+Y3t1AMbwQDs=
=pl5o
-----END PGP SIGNATURE-----

--===============0628149434855852146==--
