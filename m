Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2333A6EA442
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 09:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CBC10E2E1;
	Fri, 21 Apr 2023 07:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9511D10E2E1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:05:34 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:4a06:df00:7656:3cff:fe3f:7ce9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 62A616603270;
 Fri, 21 Apr 2023 08:05:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682060732;
 bh=ntycJhlTeqZ1rIDpkTwh0cJahN1ZGR4GKHmt1VjStBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HKXVH9MCvNRN9JdT/umUH/LKq2P8OisPpuVjnyusC2txKJPzCVuMT+dw9ftpNgVib
 QLGMRBh4TRR0IrP8Y0cMQ0dgaqj3vhYpS+0p/G6lViCJDsNRsCzgNZwadsIoXB69ac
 u4drCHmT2JhPBNdcUknQwVTQhwSBA1C9bojozOp4TBAKD/e9Zj4HNaEtTsDZ6X/U7h
 rygeR2eGyY86fNwxQrLxn35D7NcW9U5aVBzYLJsMc5XEnESjG+mJax1H2fLmEKkbq5
 D6cZAF3wCic9d0Q2EOVVr/OLWiQ7uWkl+s471OP4mFBQU6Di3zLS4xf14qKa7GaHGy
 IpWfW/Zv/cjIQ==
Date: Fri, 21 Apr 2023 10:05:27 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 2/3] vkms: Add support for multiple pipes
Message-ID: <ZEI1t981LcfvDleI@xpredator>
References: <20230420084147.19042-1-marius.vlad@collabora.com>
 <20230420084147.19042-3-marius.vlad@collabora.com>
 <8cd5ff71-7a90-f54a-01cb-9b760b97db33@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cSDJaoQhMYfwzTRp"
Content-Disposition: inline
In-Reply-To: <8cd5ff71-7a90-f54a-01cb-9b760b97db33@igalia.com>
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
Cc: melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, tzimmermann@suse.de,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cSDJaoQhMYfwzTRp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ma=EDra,

Thanks a lot for taking a look!

On Thu, Apr 20, 2023 at 01:47:59PM -0300, Ma=EDra Canal wrote:
> Hi Marius,
>=20
> Thanks for the changing the commit message! Just a few nits:
>=20
> On 4/20/23 05:41, Marius Vlad wrote:
> > This adds support for creating multiple virtual pipes, in case one would
> > need to display multiple independent things on different outputs.
> >=20
> > We use a module parameter to specify how many to create,  defaulting to
> > just one with the possibility of specifying a maximum of 4 possible pip=
es.
> >=20
> > This is of particular importance when testing out the DRM back-end in
> > compositors, but also to be able to independently set different DPMS st=
ates.
>=20
> When I run the VKMS CI, I'm getting the following warning in most tests
> with max_pipes=3D3:
>=20
> (kms_atomic:2085) igt_kms-WARNING: Output Virtual-2 could not be assigned=
 to a pipe
> (kms_atomic:2085) igt_kms-WARNING: Output Virtual-3 could not be assigned=
 to a pipe
Hmm, first time I'm seeing these. By VKMS CI you mean piglit with some a
list of igt tests? Noticed some warnings about the Writeback connector but
those warnings are with or without these patches.
>=20
> >=20
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
> >   drivers/gpu/drm/vkms/vkms_drv.c       | 27 ++++++++++++++++++++++-----
> >   drivers/gpu/drm/vkms/vkms_drv.h       | 11 ++++++++---
> >   drivers/gpu/drm/vkms/vkms_output.c    |  5 ++---
> >   drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++++------------
> >   5 files changed, 45 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vk=
ms_crtc.c
> > index 57bbd32e9beb..0b6c40ac80b6 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -89,8 +89,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc=
 *crtc,
> >   {
> >   	struct drm_device *dev =3D crtc->dev;
> >   	unsigned int pipe =3D crtc->index;
> > -	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
> > -	struct vkms_output *output =3D &vkmsdev->output;
> > +	struct vkms_output *output =3D drm_crtc_to_vkms_output(crtc);
> >   	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> >   	if (!READ_ONCE(vblank->enabled)) {
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkm=
s_drv.c
> > index 6d3a2d57d992..63091ce6735a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -51,14 +51,19 @@ static bool enable_overlay;
> >   module_param_named(enable_overlay, enable_overlay, bool, 0444);
> >   MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> > +static int max_pipes =3D 1;
>=20
> I believe this should be unsigned int, otherwise if you configure
> max_pipes=3D-3, you will get an error like:
Yeah, probably need to add a also a minimum lower range range. Even if with=
 an
uint8_t, it would wrap to unnecessary large values. I'd just ignore=20
everything under 1.
>=20
> [   31.015005] ------------[ cut here ]------------
> [   31.015011] WARNING: CPU: 0 PID: 1062 at mm/page_alloc.c:5568 __alloc_=
pages+0x65/0x300
> [   31.015021] Modules linked in: vkms(+) [last unloaded: vkms]
> [   31.015030] CPU: 0 PID: 1062 Comm: modprobe Not tainted 6.3.0-rc4-0150=
2-g91c249b2b9f6-dirty #92
> [   31.015035] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.16.2-1.fc37 04/01/2014
> [   31.015038] RIP: 0010:__alloc_pages+0x65/0x300
> [   31.015043] Code: 00 f7 c7 00 20 00 00 75 0e 83 fe 0b 72 09 f6 05 16 0=
2 c3 01 01 74 0c 83 fe 0a 76 15 31 ed e9 51 01 00 00 c6 05 01 02 c3 01 01 <=
0f> 0b 83 fe 0a 77 eb 23 1d f6 05 c5 01 65 48 8b 3d 26 77 fd 71 8b
> [   31.015047] RSP: 0018:ffffa95442247880 EFLAGS: 00010246
> [   31.015052] RAX: 0bb151d28a828b00 RBX: 0000000000040dc0 RCX: 000000000=
0000000
> [   31.015055] RDX: 0000000000000000 RSI: 000000000000001d RDI: 000000000=
0040dc0
> [   31.015059] RBP: 0000000000000000 R08: ffffffff8f6cbeac R09: 000000000=
0000010
> [   31.015061] R10: ffff9cb282c6a500 R11: 0000000400000001 R12: 000000000=
0000dc0
> [   31.015065] R13: ffffffffc01e3258 R14: 0000000000000000 R15: 000000000=
000001d
> [   31.015067] FS:  00007f95f41b6740(0000) GS:ffff9cb2bbc00000(0000) knlG=
S:0000000000000000
> [   31.015071] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   31.015075] CR2: 00007ffc3933cec8 CR3: 000000011c110000 CR4: 000000000=
00006f0
> [   31.015082] Call Trace:
> [   31.015102]  <TASK>
> [   31.015106]  __kmalloc_large_node+0x82/0x120
> [   31.015113]  ? drm_vblank_init+0x30/0x100
> [   31.015120]  __kmalloc_node_track_caller+0xc4/0x180
> [   31.015125]  ? __kmalloc_node_track_caller+0x8f/0x180
> [   31.015128]  ? preempt_count_add+0x5e/0xa0
> [   31.015134]  drmm_kmalloc+0x31/0x110
> [   31.015140]  drm_vblank_init+0x30/0x100
> [   31.015145]  init_module+0x179/0xff0 [vkms]
> [   31.015160]  ? __pfx_init_module+0x10/0x10 [vkms]
> [   31.015171]  do_one_initcall+0x10c/0x2d0
> [   31.015180]  ? do_init_module+0x1d/0x1c0
> [   31.015187]  do_init_module+0x45/0x1c0
> [   31.015192]  load_module+0x16eb/0x1970
> [   31.015198]  ? kernel_read_file_from_fd+0x5a/0x90
> [   31.015205]  __se_sys_finit_module+0xb3/0xf0
> [   31.015212]  do_syscall_64+0x43/0x90
> [   31.015218]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [   31.015224] RIP: 0033:0x7f95f42bf6bd
> [   31.015228] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 43 d7 0c 00 f7 d8 64 89 01 48
> [   31.015232] RSP: 002b:00007ffc3933ef08 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
> [   31.015236] RAX: ffffffffffffffda RBX: 000055ec9b730a10 RCX: 00007f95f=
42bf6bd
> [   31.015239] RDX: 0000000000000000 RSI: 000055ec9b730470 RDI: 000000000=
0000003
> [   31.015241] RBP: 000055ec9b730470 R08: 0000000000000000 R09: 00007ffc3=
933f030
> [   31.015243] R10: 0000000000000003 R11: 0000000000000246 R12: 000000000=
0040000
> [   31.015245] R13: 000055ec9b730ab0 R14: 0000000000000000 R15: 000055ec9=
b730c70
> [   31.015248]  </TASK>
> [   31.015250] ---[ end trace 0000000000000000 ]---
> [   31.015253] [drm:init_module [vkms]] *ERROR* Failed to vblank
>=20
> Also, when I setted max_pipes=3D4, I'm getting the following error:
I'll try to replicate these with igt tests, as those seems to stress
things a bit. Seems a bit odd to happen only at four.
>=20
> [   74.804396] ------------[ cut here ]------------
> [   74.804402] WARNING: CPU: 2 PID: 1587 at drivers/gpu/drm/drm_plane.c:2=
52 __drm_universal_plane_init+0x4fe/0x550
> [   74.804415] Modules linked in: vkms(+)
> [   74.804421] CPU: 2 PID: 1587 Comm: modprobe Tainted: G        W       =
   6.3.0-rc4-01502-g91c249b2b9f6-dirty #92
> [   74.804426] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.16.2-1.fc37 04/01/2014
> [   74.804429] RIP: 0010:__drm_universal_plane_init+0x4fe/0x550
> [   74.804434] Code: c4 20 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc 4=
9 8b b6 90 05 00 00 48 8b 44 24 08 8b 10 48 8b 3c 24 e8 84 b8 ff ff eb d1 <=
0f> 0b 41 bc ea ff ff ff eb c7 0f 0b 41 bc ea ff ff ff eb bd 49 8b
> [   74.804438] RSP: 0018:ffffb2cc8217f858 EFLAGS: 00010246
> [   74.804453] RAX: 0000000000000000 RBX: ffffffffc0223318 RCX: ffffffffc=
0223318
> [   74.804456] RDX: 0000000000000008 RSI: ffffa24080913028 RDI: ffffa2409=
8d20000
> [   74.804458] RBP: ffffb2cc8217f970 R08: ffffffffc0223300 R09: 000000000=
0000005
> [   74.804461] R10: ffffb2cc8217f910 R11: 0000000000000000 R12: 000000000=
0000008
> [   74.804463] R13: ffffa24080913028 R14: ffffa24080913028 R15: ffffa2409=
8d20000
> [   74.804465] FS:  00007fbd9fc9b740(0000) GS:ffffa240bbd00000(0000) knlG=
S:0000000000000000
> [   74.804469] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   74.804471] CR2: 00007f74a59d1f30 CR3: 0000000103304000 CR4: 000000000=
00006e0
> [   74.804479] Call Trace:
> [   74.804483]  <TASK>
> [   74.804485]  ? preempt_count_add+0x5e/0xa0
> [   74.804492]  __drmm_universal_plane_alloc+0xce/0x140
> [   74.804497]  ? __drm_connector_init+0x3d6/0x4c0
> [   74.804502]  vkms_plane_init+0x4d/0x70 [vkms]
> [   74.804516]  vkms_output_init+0xa7/0x380 [vkms]
> [   74.804527]  init_module+0x25d/0xff0 [vkms]
> [   74.804538]  ? __pfx_init_module+0x10/0x10 [vkms]
> [   74.804548]  do_one_initcall+0x10c/0x2d0
> [   74.804557]  ? do_init_module+0x1d/0x1c0
> [   74.804564]  do_init_module+0x45/0x1c0
> [   74.804569]  load_module+0x16eb/0x1970
> [   74.804575]  ? kernel_read_file_from_fd+0x5a/0x90
> [   74.804615]  __se_sys_finit_module+0xb3/0xf0
> [   74.804624]  do_syscall_64+0x43/0x90
> [   74.804632]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [   74.804640] RIP: 0033:0x7fbd9fda46bd
> [   74.804645] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 43 d7 0c 00 f7 d8 64 89 01 48
> [   74.804649] RSP: 002b:00007ffd8cdc6d58 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
> [   74.804655] RAX: ffffffffffffffda RBX: 00005614c1f3ea10 RCX: 00007fbd9=
fda46bd
> [   74.804659] RDX: 0000000000000000 RSI: 00005614c1f3e470 RDI: 000000000=
0000003
> [   74.804662] RBP: 00005614c1f3e470 R08: 0000000000000000 R09: 00007ffd8=
cdc6e80
> [   74.804665] R10: 0000000000000003 R11: 0000000000000246 R12: 000000000=
0040000
> [   74.804668] R13: 00005614c1f3eab0 R14: 0000000000000000 R15: 00005614c=
1f3ec70
> [   74.804673]  </TASK>
> [   74.804675] ---[ end trace 0000000000000000 ]---
> [   74.804736] BUG: kernel NULL pointer dereference, address: 00000000000=
000a8
> [   74.806126] #PF: supervisor read access in kernel mode
> [   74.806590] #PF: error_code(0x0000) - not-present page
> [   74.807160] PGD 0 P4D 0
> [   74.807463] Oops: 0000 [#1] PREEMPT SMP PTI
> [   74.807874] CPU: 2 PID: 1587 Comm: modprobe Tainted: G        W       =
   6.3.0-rc4-01502-g91c249b2b9f6-dirty #92
> [   74.808597] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.16.2-1.fc37 04/01/2014
> [   74.809097] RIP: 0010:destroy_workqueue+0xf/0x2f0
> [   74.809397] Code: 41 5e 41 5f 5d e9 b1 24 ff 00 90 90 90 90 90 90 90 9=
0 90 90 90 90 90 90 90 90 90 55 41 57 41 56 41 54 53 48 83 ec 10 49 89 ff <=
48> 8b bf a8 00 00 00 48 85 ff 74 14 49 c7 87 a8 00 00 00 00 00 00
> [   74.810308] RSP: 0018:ffffb2cc8217f928 EFLAGS: 00010286
> [   74.810637] RAX: 0000000000000004 RBX: 0000000000000003 RCX: 000000000=
0000001
> [   74.811041] RDX: 0000000000000002 RSI: 0000000000000082 RDI: 000000000=
0000000
> [   74.811436] RBP: ffffa23f9df001c0 R08: 0000000000b90826 R09: 000003fff=
ffffc00
> [   74.811857] R10: 000000000000015d R11: 0000000000000000 R12: 000000000=
0000282
> [   74.812256] R13: 0000000000000001 R14: ffffa24098d20000 R15: 000000000=
0000000
> [   74.812673] FS:  00007fbd9fc9b740(0000) GS:ffffa240bbd00000(0000) knlG=
S:0000000000000000
> [   74.813294] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   74.814296] CR2: 00000000000000a8 CR3: 0000000103304000 CR4: 000000000=
00006e0
> [   74.814824] Call Trace:
> [   74.815114]  <TASK>
> [   74.815388]  ? _raw_spin_unlock_irq+0xe/0x30
> [   74.815806]  vkms_release+0x26/0x50 [vkms]
> [   74.816187]  devm_drm_dev_init_release+0x2d/0x60
> [   74.816590]  devres_release_group+0xeb/0x140
> [   74.817005]  init_module+0x196/0xff0 [vkms]
> [   74.817394]  ? __pfx_init_module+0x10/0x10 [vkms]
> [   74.817833]  do_one_initcall+0x10c/0x2d0
> [   74.818208]  ? do_init_module+0x1d/0x1c0
> [   74.818587]  do_init_module+0x45/0x1c0
> [   74.818869]  load_module+0x16eb/0x1970
> [   74.819147]  ? kernel_read_file_from_fd+0x5a/0x90
> [   74.819458]  __se_sys_finit_module+0xb3/0xf0
> [   74.819786]  do_syscall_64+0x43/0x90
> [   74.820041]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [   74.821852] RIP: 0033:0x7fbd9fda46bd
> [   74.822118] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 43 d7 0c 00 f7 d8 64 89 01 48
> [   74.822902] RSP: 002b:00007ffd8cdc6d58 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
> [   74.823311] RAX: ffffffffffffffda RBX: 00005614c1f3ea10 RCX: 00007fbd9=
fda46bd
> [   74.823648] RDX: 0000000000000000 RSI: 00005614c1f3e470 RDI: 000000000=
0000003
> [   74.823977] RBP: 00005614c1f3e470 R08: 0000000000000000 R09: 00007ffd8=
cdc6e80
> [   74.824297] R10: 0000000000000003 R11: 0000000000000246 R12: 000000000=
0040000
> [   74.824612] R13: 00005614c1f3eab0 R14: 0000000000000000 R15: 00005614c=
1f3ec70
> [   74.824931]  </TASK>
> [   74.825080] Modules linked in: vkms(+)
> [   74.825269] CR2: 00000000000000a8
> [   74.825505] ---[ end trace 0000000000000000 ]---
> [   74.825735] RIP: 0010:destroy_workqueue+0xf/0x2f0
> [   74.825948] Code: 41 5e 41 5f 5d e9 b1 24 ff 00 90 90 90 90 90 90 90 9=
0 90 90 90 90 90 90 90 90 90 55 41 57 41 56 41 54 53 48 83 ec 10 49 89 ff <=
48> 8b bf a8 00 00 00 48 85 ff 74 14 49 c7 87 a8 00 00 00 00 00 00
> [   74.826609] RSP: 0018:ffffb2cc8217f928 EFLAGS: 00010286
> [   74.826843] RAX: 0000000000000004 RBX: 0000000000000003 RCX: 000000000=
0000001
> [   74.827114] RDX: 0000000000000002 RSI: 0000000000000082 RDI: 000000000=
0000000
> [   74.827382] RBP: ffffa23f9df001c0 R08: 0000000000b90826 R09: 000003fff=
ffffc00
> [   74.827622] R10: 000000000000015d R11: 0000000000000000 R12: 000000000=
0000282
> [   74.827818] R13: 0000000000000001 R14: ffffa24098d20000 R15: 000000000=
0000000
> [   74.828008] FS:  00007fbd9fc9b740(0000) GS:ffffa240bbd00000(0000) knlG=
S:0000000000000000
> [   74.828245] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   74.828415] CR2: 00000000000000a8 CR3: 0000000103304000 CR4: 000000000=
00006e0
>=20
> > +module_param_named(max_pipes, max_pipes, int, 0444);
> > +MODULE_PARM_DESC(max_pipes, "Specify how many pipes to create");
> > +
> >   DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
> >   static void vkms_release(struct drm_device *dev)
> >   {
> > -	struct vkms_device *vkms =3D drm_device_to_vkms_device(dev);
> > +	int i;
> > +	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
> > -	if (vkms->output.composer_workq)
> > -		destroy_workqueue(vkms->output.composer_workq);
> > +	for (i =3D 0; i < vkmsdev->config->max_pipes; i++)
> > +		destroy_workqueue(vkmsdev->output[i].composer_workq);
> >   }
> >   static void vkms_atomic_commit_tail(struct drm_atomic_state *old_stat=
e)
> > @@ -99,6 +104,7 @@ static int vkms_config_show(struct seq_file *m, void=
 *data)
> >   	seq_printf(m, "writeback=3D%d\n", vkmsdev->config->writeback);
> >   	seq_printf(m, "cursor=3D%d\n", vkmsdev->config->cursor);
> >   	seq_printf(m, "overlay=3D%d\n", vkmsdev->config->overlay);
> > +	seq_printf(m, "pipes=3D%d\n", vkmsdev->config->max_pipes);
> >   	return 0;
> >   }
> > @@ -133,6 +139,7 @@ static const struct drm_mode_config_helper_funcs vk=
ms_mode_config_helpers =3D {
> >   static int vkms_modeset_init(struct vkms_device *vkmsdev)
> >   {
> >   	struct drm_device *dev =3D &vkmsdev->drm;
> > +	int i, ret =3D 0;
> >   	drm_mode_config_init(dev);
>=20
> I commited a patch a while ago that changed this bit. Therefore, your pat=
ch
> isn't applicable in the drm-misc-next. It would be nice if you could reba=
se
> the patches on top of the drm-misc-next.
Okay, will do.=20
>=20
> Best Regards,
> - Ma=EDra Canal

--cSDJaoQhMYfwzTRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmRCNbQACgkQ9jQS5glH
1u8ulQ//W0e8+qQk6B/WuOTfHiNWEDprFOpVkwUE/A0+/v5VUd0T+gLyyDFaqeeN
1fE9/Hh29ZlxK/+Tw6T6GXmYskJ+e33CbM2caJcJisM1dUh0heL9qgNPtMmyoi5W
3l6U17UkVlr4fnvAV8pFX6/ef4XbEzYr2PYZzeJRodppPgBpi+/nnNpUdarlPXb3
pJQfj+Kfgf5FnxFx+LH7uJqpA3VTDy2nxgbf2bxEQpbtiO3mTf7n4ktyX5XlTdM3
aW/W9tuPWXGnLwcQKC3kaChpvuPZe4aPav48NSCRTklweDE6x2wtIa0310CDUi+q
Vngmg3DX3OvVVtWkpkeuuHbfAl8f98X67B9Xou55a0zQEXpeJ4jMEbHegcJmp+d7
p7tRP8r3PzyIxBw8ygbpmEVhzu0k2vNyK4zbo9E25OE/DDLuhno8ymcAsWbuu7Tm
ftY6o4S1aVcuUavrNpNCE2tXsMmHZQ0WTQ7QBfPUv0/pSTaXNuFWWYuEbEle0qS7
1LEh10UFdrBywsXgE3uUz94hMa2o/YtFkPtworX9CpyIl4Hct9gw3OFVEnZ4tceX
xR4GniXi3xl44i7gJL8iL6ds+Gkclw7nrRtTE9ApYZaodlWp6AIDYHOF/5y0y9vg
nJpPe0zBtP7MutH+9sSoKFqI38TmWhaUu7xou1jY7uxNIQDC6n4=
=1X5f
-----END PGP SIGNATURE-----

--cSDJaoQhMYfwzTRp--
