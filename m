Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCUVNGXQf2nQxwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 23:15:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F494C759C
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 23:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630B910E18F;
	Sun,  1 Feb 2026 22:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=sysophe.eu header.i=@sysophe.eu header.b="TY/cc6ou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hygieia.sysophe.eu (hygieia.sysophe.eu [138.201.91.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082CA10E170;
 Sun,  1 Feb 2026 22:14:55 +0000 (UTC)
Received: from hemera.lan.sysophe.eu (unknown
 [IPv6:2001:a18:2b1:1c01:a2ce:c8ff:fe62:fc79])
 by smtp.sysophe.eu (Postfix) with ESMTPSA id 5C937252CB62;
 Sun, 01 Feb 2026 23:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sysophe.eu; s=201205;
 t=1769984091; x=1770070491;
 bh=0ogN2CLPbL8nOB3SqefvBbOXqZCPRUfOJy7yrz4vqlg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TY/cc6ous55BaS+kAbFqGbYbxzHLzz6YZ89uDOP8Z7KoGb8+LhbkJryX1yjGdyhsQ
 +HnACVbdHRdz5VcWOcYDxAGgRCT2jRvJFpSitzppoE1ydHaHi/q1OaqanDlDrnWNd4
 Xur/0VWQPYtDbsBTNjXaS8VDMsusbYleixmr+XPc=
Date: Sun, 1 Feb 2026 23:14:51 +0100
From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@sysophe.eu>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Lyude
 Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter
 <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: NV04, 6.18.8 crashes on NULL pointer dereference
Message-ID: <20260201231451.1ef0128c@hemera.lan.sysophe.eu>
In-Reply-To: <20260201185705.0c5364f1@hemera.lan.sysophe.eu>
References: <20260201185705.0c5364f1@hemera.lan.sysophe.eu>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[sysophe.eu:s=201205];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[sysophe.eu : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[sysophe.eu:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[bonbons@sysophe.eu,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,hemera.lan.sysophe.eu:mid]
X-Rspamd-Queue-Id: 0F494C759C
X-Rspamd-Action: no action

Bisect completed.

The offending patch is:
commit 448a2071a843831fe5fa71545cbfa7e15ee8966d (HEAD)
Author: Lyude Paul <lyude@redhat.com>
Date:   Wed Jan 21 14:13:10 2026 -0500

    drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)
   =20
    commit 604826acb3f53c6648a7ee99a3914ead680ab7fb upstream.
   =20
    Apparently we never actually filled these in, despite the fact that we =
do
    in fact technically support atomic modesetting.
   =20
    Since not having these filled in causes us to potentially forget to dis=
able
    fbdev and friends during suspend/resume, let's fix it.
   =20
    Signed-off-by: Lyude Paul <lyude@redhat.com>
    Cc: stable@vger.kernel.org
    Reviewed-by: Dave Airlie <airlied@redhat.com>
    Link: https://patch.msgid.link/20260121191320.210342-1-lyude@redhat.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/gpu/drm/nouveau/nouveau_display.c | 2 ++
 1 file changed, 2 insertions(+)


It landed in 6.18.8. Seems like not all chip generations are ready for
atomic modesetting.


Grepping for atomic_duplicate_state I find the following:
drivers/gpu/drm/nouveau/dispnv50/head.c:nv50_head_atomic_duplicate_state(st=
ruct drm_crtc *crtc)
drivers/gpu/drm/nouveau/dispnv50/head.c:	.atomic_duplicate_state =3D nv50_h=
ead_atomic_duplicate_state,
drivers/gpu/drm/nouveau/dispnv50/head.c:	.atomic_duplicate_state =3D nv50_h=
ead_atomic_duplicate_state,
drivers/gpu/drm/nouveau/dispnv50/disp.c:	.atomic_duplicate_state =3D nouvea=
u_conn_atomic_duplicate_state,
drivers/gpu/drm/nouveau/dispnv50/wndw.c:nv50_wndw_atomic_duplicate_state(st=
ruct drm_plane *plane)
drivers/gpu/drm/nouveau/dispnv50/wndw.c:	.atomic_duplicate_state =3D nv50_w=
ndw_atomic_duplicate_state,
drivers/gpu/drm/nouveau/nouveau_connector.c:nouveau_conn_atomic_duplicate_s=
tate(struct drm_connector *connector)
drivers/gpu/drm/nouveau/nouveau_connector.c:	.atomic_duplicate_state =3D no=
uveau_conn_atomic_duplicate_state,
drivers/gpu/drm/nouveau/nouveau_connector.c:	.atomic_duplicate_state =3D no=
uveau_conn_atomic_duplicate_state,
drivers/gpu/drm/nouveau/nouveau_connector.h:nouveau_conn_atomic_duplicate_s=
tate(struct drm_connector *);
which seems to indicate only nv50 and up would support atomic
modesetting, or at least have sufficient code coverage for it.

drivers/gpu/drm/nouveau/dispnv04/ seems to be missing the needed code/assig=
nments!

Bruno


On Sun, 1 Feb 2026 18:57:05 +0100 Bruno Pr=C3=A9mont wrote:
> The oldish system boots fine with 6.17.13 but crashes with 6.18.8
> (nouveau built-in).
>=20
> At first glance, due to the multiple WARNING traces before the final
> kernel NULL pointer dereference if looks like nouveau is missing some hel=
per
> functions [atomic_duplicate_state()] while stating it can to atomic
> modesetting, at least for this old card.
> From commit log between 6.17.13 and 6.18.8 though for nouveau/drm I don't=
 see
> any change that would stand out.
> Stating bisection in the hope of finding something more precise.
>=20
> Bruno
>=20
>=20
>=20
> Below the kernel log starting at nouveau initialization:
>=20
> [    3.009786] nouveau 0000:01:00.0: NVIDIA NV04 (20044001)
> [    3.016713] nouveau 0000:01:00.0: bios: trying PRAMIN...
> [    3.022916] nouveau 0000:01:00.0: bios: 00000260: NPDE signature (9b03=
0041) unknown
> [    3.030698] nouveau 0000:01:00.0: bios: 00000000: type 00, 32768 bytes
> [    3.042773] nouveau 0000:01:00.0: bios: scored 4
> [    3.047513] nouveau 0000:01:00.0: bios: trying PROM...
> [    3.054711] nouveau 0000:01:00.0: bios: 00000000: ROM signature (0000)=
 unknown
> [    3.061958] nouveau 0000:01:00.0: bios: image 0 invalid
> [    3.067255] nouveau 0000:01:00.0: bios: scored 0
> [    3.071894] nouveau 0000:01:00.0: bios: trying ACPI...
> [    3.077157] nouveau 0000:01:00.0: bios: using image from PRAMIN
> [    3.083103] nouveau 0000:01:00.0: bios: 00000260: NPDE signature (9b03=
0041) unknown
> [    3.090872] nouveau 0000:01:00.0: bios: 00000260: NPDE signature (9b03=
0041) unknown
> [    3.098608] nouveau 0000:01:00.0: bios: BMP version 1.1
> [    3.104467] nouveau 0000:01:00.0: bios: version 02.04.19.00.00
> [    3.110413] nouveau 0000:01:00.0: bios: DCB table not found
> [    3.116067] nouveau 0000:01:00.0: i2c: ccb 00: type 00 drive 3f sense =
3e share ff auxch c1
> [    3.124871] nouveau 0000:01:00.0: bios: DCB table not found
> [    3.130467] nouveau 0000:01:00.0: i2c: ccb 01: type 00 drive 37 sense =
36 share ff auxch c1
> [    3.139237] nouveau 0000:01:00.0: bios: DCB table not found
> [    3.144896] nouveau 0000:01:00.0: bios: DCB table not found
> [    3.150745] nouveau 0000:01:00.0: disp: head-0: ctor
> [    3.155809] nouveau 0000:01:00.0: disp: head-1: ctor
> [    3.160922] nouveau 0000:01:00.0: vgaarb: deactivate vga console
> [    3.171109] Console: switching to colour dummy device 80x25
> [    3.177768] nouveau: drm:00000000:00000080: init running...
> [    3.183782] nouveau 0000:01:00.0: mc: intr 0/01010000 requested by disp
> [    3.190427] nouveau 0000:01:00.0: mc: intr 0/00001000 requested by gr
> [    3.196972] nouveau 0000:01:00.0: mc: intr 0/10000000 requested by bus
> [    3.203525] nouveau 0000:01:00.0: mc: intr 0/00100000 requested by tim=
er
> [    3.210369] agpgart-intel 0000:00:00.0: AGP 1.0 bridge
> [    3.215696] agpgart-intel 0000:00:00.0: putting AGP V2 device into 0x =
mode
> [    3.222628] nouveau 0000:01:00.0: putting AGP V2 device into 0x mode
> [    3.229098] nouveau 0000:01:00.0: timer: unknown input clock freq
> [    3.235274] nouveau 0000:01:00.0: timer: input frequency : 0Hz
> [    3.241125] nouveau 0000:01:00.0: timer: numerator       : 00000001
> [    3.247459] nouveau 0000:01:00.0: timer: denominator     : 00000001
> [    3.253792] nouveau 0000:01:00.0: timer: timer frequency : 0Hz
> [    3.259647] nouveau 0000:01:00.0: timer: time low        : a0b3511b
> [    3.265982] nouveau 0000:01:00.0: timer: time high       : 00000000
> [    3.273538] nouveau 0000:01:00.0: fb: 16 MiB SDRAM
> [    3.281503] nouveau 0000:01:00.0: clk: --:  =20
> [    3.286033] nouveau: drm:00000000:00000080: init children...
> [    3.291715] nouveau: drm:00000000:00000080: init completed in 108340us
> [    3.298650] nouveau: drm:00000000:80000009: init running...
> [    3.304303] nouveau: drm:00000000:80000009: init children...
> [    3.309979] nouveau: drm:00000000:80000009: init completed in 5677us
> [    3.316530] nouveau: drm:00000000:00000000: init running...
> [    3.322123] nouveau: drm:00000000:00000000: init children...
> [    3.327850] nouveau: drm:00000000:00000000: init completed in 5728us
> [    3.334298] nouveau: DRM:00000000:00000080: init running...
> [    3.339892] nouveau: DRM:00000000:00000080: init children...
> [    3.345626] nouveau: DRM:00000000:00000080: init completed in 5736us
> [    3.352052] nouveau: DRM:00000000:80000009: init running...
> [    3.357702] nouveau: DRM:00000000:80000009: init children...
> [    3.363378] nouveau: DRM:00000000:80000009: init completed in 5677us
> [    3.369906] nouveau: DRM:00000000:8000000d: init running...
> [    3.375555] nouveau: DRM:00000000:8000000d: init children...
> [    3.381233] nouveau: DRM:00000000:8000000d: init completed in 5679us
> [    3.390661] nouveau 0000:01:00.0: drm: VRAM: 15 MiB
> [    3.395691] nouveau 0000:01:00.0: drm: GART: 64 MiB
> [    3.400595] nouveau 0000:01:00.0: drm: BMP version 1.1
> [    3.405810] nouveau 0000:01:00.0: drm: No DCB data found in VBIOS
> [    3.411925] nouveau 0000:01:00.0: i2c: bus 0000: probing TV encoders
> [    3.419496] nouveau 0000:01:00.0: i2c: bus 0000: no devices found.
> [    3.426486] nouveau 0000:01:00.0: fifo:000000: engn 2.0[mpeg] not found
> [    3.433130] nouveau 0000:01:00.0: fifo:000000: chan:000000
> [    3.438690] nouveau 0000:01:00.0: fifo:000000:00[      sw]:=20
> [    3.444423] nouveau 0000:01:00.0: fifo:000000:00[     dma]:=20
> [    3.450105] nouveau 0000:01:00.0: fifo:000000:01[      gr]:=20
> [    3.455851] nouveau 0000:01:00.0: mc: intr 0/00000100 requested by fifo
> [    3.464233] nouveau: DRM:00000000:00000002: init running...
> [    3.469855] nouveau: DRM:00000000:00000002: init children...
> [    3.475589] nouveau: DRM:00000000:00000002: init completed in 5734us
> [    3.482092] nouveau: DRM:00000000:0000006b: init running...
> [    3.487749] nouveau: DRM:00000000:0000006b: init children...
> [    3.493426] nouveau: DRM:00000000:0000006b: init completed in 5682us
> [    3.500140] nouveau: DRM:80000002:0000003d: init running...
> [    3.505793] nouveau: DRM:80000002:0000003d: init children...
> [    3.511473] nouveau: DRM:80000002:0000003d: init completed in 5681us
> [    3.518034] nouveau: DRM:80000003:0000003d: init running...
> [    3.523679] nouveau: DRM:80000003:0000003d: init children...
> [    3.529357] nouveau: DRM:80000003:0000003d: init completed in 5680us
> [    3.535929] nouveau: DRM:0000006e:fffffffc: init running...
> [    3.541527] nouveau: DRM:00000000:00000000: init running...
> [    3.547167] nouveau: DRM:00000000:00000000: init children...
> [    3.552843] nouveau: DRM:00000000:00000000: init completed in 5677us
> [    3.559303] nouveau: DRM:0000006e:fffffffc: init children...
> [    3.565046] nouveau: DRM:0000006e:fffffffc: init completed in 23522us
> [    3.571779] nouveau: DRM:80000006:0000003d: init running...
> [    3.577433] nouveau: DRM:80000006:0000003d: init children...
> [    3.583110] nouveau: DRM:80000006:0000003d: init completed in 5678us
> [    3.590331] nouveau: DRM:00000039:00000039: init running...
> [    3.595990] nouveau: DRM:00000000:00000000: init running...
> [    3.601579] nouveau: DRM:00000000:00000000: init children...
> [    3.607302] nouveau: DRM:00000000:00000000: init completed in 5723us
> [    3.613721] nouveau: DRM:00000039:00000039: init children...
> [    3.619397] nouveau: DRM:00000039:00000039: init completed in 23410us
> [    3.625922] nouveau 0000:01:00.0: drm: MM: using M2MF for buffer copies
> [    3.633084] nouveau: DRM:00000000:00000046: init running...
> [    3.638742] nouveau: DRM:00000000:00000046: init children...
> [    3.644466] nouveau: DRM:00000000:00000046: init completed in 5724us
> [    3.651924] nouveau: DRM:00000000:8000000e: init running...
> [    3.657609] nouveau: DRM:00000000:8000000e: init children...
> [    3.663287] nouveau: DRM:00000000:8000000e: init completed in 5678us
> [    3.669733] nouveau 0000:01:00.0: drm: Saving VGA fonts
> [    3.715871] ------------[ cut here ]------------
> [    3.720534] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_plane.c:389 =
__drm_universal_plane_init+0x3e8/0x7e0
> [    3.730495] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S         =
         6.18.8-zeus #2 PREEMPT(voluntary)=20
> [    3.740836] Tainted: [S]=3DCPU_OUT_OF_SPEC
> [    3.744825] Hardware name:  /SR440BX                        , BIOS 4S4=
R100A.86A.0017.P10.0004031558 04/03/00
> [    3.754712] EIP: __drm_universal_plane_init+0x3e8/0x7e0
> [    3.759973] Code: 8b 00 8b 93 b8 02 00 00 89 04 24 31 c0 89 44 24 04 8=
b 45 e4 e8 09 a1 ff ff 8b 45 e8 83 c4 2c 5b 5e 5f 5d c3 8d b6 00 00 00 00 <=
0f> 0b e9 6d fc ff ff 90 85 db 0f 84 18 01 00 00 85 c0 8d b6 00 00
> [    3.778792] EAX: c2793400 EBX: c1bb57a0 ECX: 00000000 EDX: c1633570
> [    3.785136] ESI: c2796400 EDI: 00000000 EBP: c2441c2c ESP: c2441bf4
> [    3.791420] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010=
246
> [    3.798273] CR0: 80050033 CR2: ffda8000 CR3: 02078000 CR4: 000002d0
> [    3.804611] Call Trace:
> [    3.807081]  ? __kmalloc_noprof+0x371/0x3e0
> [    3.811301]  ? __drm_universal_plane_alloc+0x20/0x100
> [    3.816433]  ? __drm_universal_plane_alloc+0x20/0x100
> [    3.821518]  __drm_universal_plane_alloc+0x67/0x100
> [    3.826477]  nv04_crtc_create+0xb7/0x1b0
> [    3.830446]  nv04_display_create+0xdc/0x2e0
> [    3.834713]  ? nv_crtc_mode_set+0xd90/0xd90
> [    3.838929]  nouveau_display_create+0x346/0x5f0
> [    3.843485]  nouveau_drm_device_init+0x10d/0x800
> [    3.848189]  nouveau_drm_probe+0x107/0x1a0
> [    3.852315]  pci_device_probe+0x85/0xf0
> [    3.856252]  ? sysfs_create_link+0x1d/0x40
> [    3.860397]  really_probe+0x9e/0x200
> [    3.864052]  __driver_probe_device+0x6c/0x120
> [    3.868439]  ? __might_sleep+0x30/0x70
> [    3.872229]  driver_probe_device+0x22/0xe0
> [    3.876401]  __driver_attach+0xc6/0x180
> [    3.880268]  ? __device_attach_driver+0x120/0x120
> [    3.885048]  bus_for_each_dev+0x4d/0x90
> [    3.888913]  driver_attach+0x1e/0x30
> [    3.892510]  ? __device_attach_driver+0x120/0x120
> [    3.897295]  bus_add_driver+0xc6/0x180
> [    3.901075]  driver_register+0x6c/0xd0
> [    3.904906]  __pci_register_driver+0x36/0x40
> [    3.909212]  nouveau_drm_init+0x16e/0x184
> [    3.913263]  do_one_initcall+0x5f/0x1a8
> [    3.917186]  ? drm_sched_fence_slab_init+0x44/0x44
> [    3.922010]  ? kernel_init_freeable+0x147/0x1d4
> [    3.926617]  kernel_init_freeable+0x182/0x1d4
> [    3.931005]  ? rest_init+0xa0/0xa0
> [    3.934495]  kernel_init+0x15/0x110
> [    3.938016]  ? schedule_tail+0x4e/0x60
> [    3.941804]  ? rest_init+0xa0/0xa0
> [    3.945285]  ret_from_fork+0x135/0x150
> [    3.949084]  ? rest_init+0xa0/0xa0
> [    3.952510]  ret_from_fork_asm+0x12/0x18
> [    3.956516]  entry_INT80_32+0xef/0xf4
> [    3.960217] ---[ end trace 0000000000000000 ]---
> [    3.965018] ------------[ cut here ]------------
> [    3.969649] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_crtc.c:251 _=
_drm_crtc_init_with_planes+0x240/0x2a0
> [    3.979570] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S      W  =
         6.18.8-zeus #2 PREEMPT(voluntary)=20
> [    3.989908] Tainted: [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN
> [    3.994761] Hardware name:  /SR440BX                        , BIOS 4S4=
R100A.86A.0017.P10.0004031558 04/03/00
> [    4.004654] EIP: __drm_crtc_init_with_planes+0x240/0x2a0
> [    4.009993] Code: e8 a5 5c 01 00 8b 96 14 02 00 00 31 f6 89 f8 c7 04 2=
4 00 00 00 00 89 74 24 04 e8 8b 5c 01 00 8b 45 f0 83 c4 20 5b 5e 5f 5d c3 <=
0f> 0b e9 2a fe ff ff 90 2e 8d b4 26 00 00 00 00 8b 86 4c 01 00 00
> [    4.028810] EAX: c2793400 EBX: c278a000 ECX: c2796400 EDX: c1bb5840
> [    4.035148] ESI: 00000000 EDI: 00000000 EBP: c2441c40 ESP: c2441c14
> [    4.041433] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010=
246
> [    4.048326] CR0: 80050033 CR2: ffda8000 CR3: 02078000 CR4: 000002d0
> [    4.054668] Call Trace:
> [    4.057135]  ? __drm_universal_plane_alloc+0x67/0x100
> [    4.062218]  drm_crtc_init_with_planes+0x36/0x50
> [    4.066912]  nv04_crtc_create+0xe7/0x1b0
> [    4.070869]  nv04_display_create+0xdc/0x2e0
> [    4.075158]  ? nv_crtc_mode_set+0xd90/0xd90
> [    4.079375]  nouveau_display_create+0x346/0x5f0
> [    4.083982]  nouveau_drm_device_init+0x10d/0x800
> [    4.088632]  nouveau_drm_probe+0x107/0x1a0
> [    4.092753]  pci_device_probe+0x85/0xf0
> [    4.096673]  ? sysfs_create_link+0x1d/0x40
> [    4.100806]  really_probe+0x9e/0x200
> [    4.104454]  __driver_probe_device+0x6c/0x120
> [    4.108842]  ? __might_sleep+0x30/0x70
> [    4.112620]  driver_probe_device+0x22/0xe0
> [    4.116797]  __driver_attach+0xc6/0x180
> [    4.120662]  ? __device_attach_driver+0x120/0x120
> [    4.125440]  bus_for_each_dev+0x4d/0x90
> [    4.129306]  driver_attach+0x1e/0x30
> [    4.132903]  ? __device_attach_driver+0x120/0x120
> [    4.137679]  bus_add_driver+0xc6/0x180
> [    4.141458]  driver_register+0x6c/0xd0
> [    4.145284]  __pci_register_driver+0x36/0x40
> [    4.149588]  nouveau_drm_init+0x16e/0x184
> [    4.153675]  do_one_initcall+0x5f/0x1a8
> [    4.157543]  ? drm_sched_fence_slab_init+0x44/0x44
> [    4.162362]  ? kernel_init_freeable+0x147/0x1d4
> [    4.166967]  kernel_init_freeable+0x182/0x1d4
> [    4.171355]  ? rest_init+0xa0/0xa0
> [    4.174837]  kernel_init+0x15/0x110
> [    4.178360]  ? schedule_tail+0x4e/0x60
> [    4.182141]  ? rest_init+0xa0/0xa0
> [    4.185620]  ret_from_fork+0x135/0x150
> [    4.189405]  ? rest_init+0xa0/0xa0
> [    4.192833]  ret_from_fork_asm+0x12/0x18
> [    4.196833]  entry_INT80_32+0xef/0xf4
> [    4.200530] ---[ end trace 0000000000000000 ]---
> [    4.205698] nouveau: DRM:00000000:80000013: init running...
> [    4.211300] nouveau: DRM:00000000:80000013: init children...
> [    4.217036] nouveau: DRM:00000000:80000013: init completed in 5736us
> [    4.223450] nouveau: DRM:00000000:8000000e: init running...
> [    4.229103] nouveau: DRM:00000000:8000000e: init children...
> [    4.234834] nouveau: DRM:00000000:8000000e: init completed in 5731us
> [    4.241354] nouveau 0000:01:00.0: drm: No DCB data found in VBIOS
> [    4.248265] ------------[ cut here ]------------
> [    4.252902] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_plane.c:389 =
__drm_universal_plane_init+0x3e8/0x7e0
> [    4.262831] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S      W  =
         6.18.8-zeus #2 PREEMPT(voluntary)=20
> [    4.273171] Tainted: [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN
> [    4.278025] Hardware name:  /SR440BX                        , BIOS 4S4=
R100A.86A.0017.P10.0004031558 04/03/00
> [    4.287910] EIP: __drm_universal_plane_init+0x3e8/0x7e0
> [    4.293169] Code: 8b 00 8b 93 b8 02 00 00 89 04 24 31 c0 89 44 24 04 8=
b 45 e4 e8 09 a1 ff ff 8b 45 e8 83 c4 2c 5b 5e 5f 5d c3 8d b6 00 00 00 00 <=
0f> 0b e9 6d fc ff ff 90 85 db 0f 84 18 01 00 00 85 c0 8d b6 00 00
> [    4.311991] EAX: c2793400 EBX: c1bb59e0 ECX: 00000001 EDX: c1633570
> [    4.318328] ESI: c2797000 EDI: 00000000 EBP: c2441c40 ESP: c2441c08
> [    4.324664] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010=
246
> [    4.331473] CR0: 80050033 CR2: ffda8000 CR3: 02078000 CR4: 000002d0
> [    4.337814] Call Trace:
> [    4.340282]  ? __might_sleep+0x30/0x70
> [    4.344112]  drm_universal_plane_init+0x4b/0x60
> [    4.348679]  nouveau_overlay_init+0x340/0x450
> [    4.353069]  nv04_display_create+0x299/0x2e0
> [    4.357416]  ? nv_crtc_mode_set+0xd90/0xd90
> [    4.361630]  nouveau_display_create+0x346/0x5f0
> [    4.366236]  nouveau_drm_device_init+0x10d/0x800
> [    4.370893]  nouveau_drm_probe+0x107/0x1a0
> [    4.375067]  pci_device_probe+0x85/0xf0
> [    4.378941]  ? sysfs_create_link+0x1d/0x40
> [    4.383065]  really_probe+0x9e/0x200
> [    4.386720]  __driver_probe_device+0x6c/0x120
> [    4.391108]  ? __might_sleep+0x30/0x70
> [    4.394938]  driver_probe_device+0x22/0xe0
> [    4.399063]  __driver_attach+0xc6/0x180
> [    4.402921]  ? __device_attach_driver+0x120/0x120
> [    4.407698]  bus_for_each_dev+0x4d/0x90
> [    4.411564]  driver_attach+0x1e/0x30
> [    4.415214]  ? __device_attach_driver+0x120/0x120
> [    4.419949]  bus_add_driver+0xc6/0x180
> [    4.423767]  driver_register+0x6c/0xd0
> [    4.427546]  __pci_register_driver+0x36/0x40
> [    4.431843]  nouveau_drm_init+0x16e/0x184
> [    4.435936]  do_one_initcall+0x5f/0x1a8
> [    4.439807]  ? drm_sched_fence_slab_init+0x44/0x44
> [    4.444685]  ? kernel_init_freeable+0x147/0x1d4
> [    4.449247]  kernel_init_freeable+0x182/0x1d4
> [    4.453677]  ? rest_init+0xa0/0xa0
> [    4.457114]  kernel_init+0x15/0x110
> [    4.460627]  ? schedule_tail+0x4e/0x60
> [    4.464465]  ? rest_init+0xa0/0xa0
> [    4.467898]  ret_from_fork+0x135/0x150
> [    4.471680]  ? rest_init+0xa0/0xa0
> [    4.475160]  ret_from_fork_asm+0x12/0x18
> [    4.479116]  entry_INT80_32+0xef/0xf4
> [    4.482807] ---[ end trace 0000000000000000 ]---
> [    4.489006] nouveau: DRM:00000000:ffffffff: init running...
> [    4.494674] nouveau: DRM:00000000:ffffffff: init children...
> [    4.500352] nouveau: DRM:00000000:ffffffff: init completed in 5679us
> [    4.510030] [drm] Initialized nouveau 1.4.0 for 0000:01:00.0 on minor 0
> [    4.517043] nouveau: drm:00000000:00000000: init running...
> [    4.522639] nouveau: drm:00000000:00000000: init children...
> [    4.528397] nouveau: drm:00000000:00000000: init completed in 5759us
> [    4.534909] nouveau: swapper/0[1]:00000000:00000080: init running...
> [    4.541288] nouveau: swapper/0[1]:00000000:00000080: init children...
> [    4.547815] nouveau: swapper/0[1]:00000000:00000080: init completed in=
 6529us
> [    4.555092] nouveau: swapper/0[1]:00000000:80000009: init running...
> [    4.561467] nouveau: swapper/0[1]:00000000:80000009: init children...
> [    4.567971] nouveau: swapper/0[1]:00000000:80000009: init completed in=
 6505us
> [    4.575291] nouveau: swapper/0[1]:00000000:8000000d: init running...
> [    4.581667] nouveau: swapper/0[1]:00000000:8000000d: init children...
> [    4.588175] nouveau: swapper/0[1]:00000000:8000000d: init completed in=
 6507us
> [    4.631683] nouveau 0000:01:00.0: [drm] format C8   little-endian (0x2=
0203843) not supported
> [    4.640252] nouveau 0000:01:00.0: [drm] No compatible format found
> [    4.693486] fbcon: nouveaudrmfb (fb0) is primary device
> [    4.695560] BUG: kernel NULL pointer dereference, address: 00000000
> [    4.695583] #PF: supervisor read access in kernel mode
> [    4.695595] #PF: error_code(0x0000) - not-present page
> [    4.695607] *pde =3D 00000000=20
> [    4.695631] Oops: Oops: 0000 [#1]
> [    4.695662] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S      W  =
         6.18.8-zeus #2 PREEMPT(voluntary)=20
> [    4.695694] Tainted: [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN
> [    4.695702] Hardware name:  /SR440BX                        , BIOS 4S4=
R100A.86A.0017.P10.0004031558 04/03/00
> [    4.695714] EIP: 0x0
> [    4.695742] Code: Unable to access opcode bytes at 0xffffffd6.
> [    4.695753] EAX: c2796400 EBX: 00000000 ECX: c2796400 EDX: c1bb57a0
> [    4.695771] ESI: 00000000 EDI: c2c731c0 EBP: c2441a6c ESP: c2441a38
> [    4.695787] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010=
246
> [    4.695805] CR0: 80050033 CR2: ffffffd6 CR3: 02078000 CR4: 000002d0
> [    4.695823] Call Trace:
> [    4.695839]  drm_atomic_get_plane_state+0x81/0x170
> [    4.695881]  ? commit_work+0x10/0x10
> [    4.695922]  drm_client_modeset_commit_atomic+0xa0/0x1e0
> [    4.695966]  ? commit_work+0x10/0x10
> [    4.695988]  drm_client_modeset_commit_locked+0x46/0x150
> [    4.696013]  ? mutex_lock+0x1a/0x40
> [    4.696061]  drm_client_modeset_commit+0x22/0x50
> [    4.696085]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x9d/0xd0
> [    4.696129]  drm_fb_helper_set_par+0x25/0x40
> [    4.696151]  fbcon_init+0x2a6/0x630
> [    4.696189]  ? klist_class_dev_get+0xb/0x10
> [    4.696222]  ? klist_add_tail+0x2f/0x70
> [    4.696258]  visual_init+0x8f/0x100
> [    4.696285]  do_bind_con_driver.isra.0+0x156/0x240
> [    4.696310]  ? device_create_groups_vargs+0xaf/0xf0
> [    4.696364]  do_take_over_console+0x102/0x150
> [    4.696387]  do_fbcon_takeover+0x89/0x130
> [    4.696410]  fbcon_fb_registered+0x147/0x150
> [    4.696434]  ? pm_vt_switch_required+0x93/0xa0
> [    4.696472]  do_register_framebuffer+0x174/0x270
> [    4.696493]  ? __might_sleep+0x30/0x70
> [    4.696531]  register_framebuffer+0x17/0x30
> [    4.696551]  __drm_fb_helper_initial_config_and_unlock+0x315/0x460
> [    4.696582]  drm_fb_helper_initial_config+0x30/0x40
> [    4.696605]  drm_fbdev_client_hotplug+0x6a/0xa0
> [    4.696629]  drm_client_register+0x4d/0xa0
> [    4.696655]  ? drm_client_init+0xb1/0xe0
> [    4.696677]  drm_fbdev_client_setup+0x97/0x180
> [    4.696702]  drm_client_setup+0x99/0xb0
> [    4.696724]  nouveau_drm_probe+0x135/0x1a0
> [    4.696756]  pci_device_probe+0x85/0xf0
> [    4.696800]  ? sysfs_create_link+0x1d/0x40
> [    4.696842]  really_probe+0x9e/0x200
> [    4.696865]  __driver_probe_device+0x6c/0x120
> [    4.696886]  ? __might_sleep+0x30/0x70
> [    4.696910]  driver_probe_device+0x22/0xe0
> [    4.696931]  __driver_attach+0xc6/0x180
> [    4.696951]  ? __device_attach_driver+0x120/0x120
> [    4.696971]  bus_for_each_dev+0x4d/0x90
> [    4.696991]  driver_attach+0x1e/0x30
> [    4.697010]  ? __device_attach_driver+0x120/0x120
> [    4.697030]  bus_add_driver+0xc6/0x180
> [    4.697050]  driver_register+0x6c/0xd0
> [    4.697071]  __pci_register_driver+0x36/0x40
> [    4.697096]  nouveau_drm_init+0x16e/0x184
> [    4.697136]  do_one_initcall+0x5f/0x1a8
> [    4.697169]  ? drm_sched_fence_slab_init+0x44/0x44
> [    4.697194]  ? kernel_init_freeable+0x147/0x1d4
> [    4.697216]  kernel_init_freeable+0x182/0x1d4
> [    4.697238]  ? rest_init+0xa0/0xa0
> [    4.697263]  kernel_init+0x15/0x110
> [    4.697285]  ? schedule_tail+0x4e/0x60
> [    4.697322]  ? rest_init+0xa0/0xa0
> [    4.697344]  ret_from_fork+0x135/0x150
> [    4.697387]  ? rest_init+0xa0/0xa0
> [    4.697408]  ret_from_fork_asm+0x12/0x18
> [    4.697438]  entry_INT80_32+0xef/0xf4
> [    4.697468] CR2: 0000000000000000
> [    4.697482] ---[ end trace 0000000000000000 ]---
> [    4.697493] EIP: 0x0
> [    4.697510] Code: Unable to access opcode bytes at 0xffffffd6.
> [    4.697521] EAX: c2796400 EBX: 00000000 ECX: c2796400 EDX: c1bb57a0
> [    4.697537] ESI: 00000000 EDI: c2c731c0 EBP: c2441a6c ESP: c2441a38
> [    4.697553] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010=
246
> [    4.697571] CR0: 80050033 CR2: ffffffd6 CR3: 02078000 CR4: 000002d0
> [    4.697590] note: swapper/0[1] exited with irqs disabled
> [    4.697611] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x00000009
> [    4.697627] Kernel Offset: disabled
> [    4.703609] ---[ end Kernel panic - not syncing: Attempted to kill ini=
t! exitcode=3D0x00000009 ]---

