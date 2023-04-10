Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F16DCA9A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 20:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8516F10E1C9;
	Mon, 10 Apr 2023 18:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFC610E1C9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SNWE5x2heT4wRMDeqvoOrVh3zNO6TEM9XgPpdewy9GE=; b=TimXSrZBCJxuMnjSQI9BEcqPhM
 fq99fc4/rVnIS2h7C3gVNdrEJ8A8rNJEjJ8Lr5UA4V6/2/GuP89/ZZhcnZy7hvk4KEB90Byc8uUO4
 FzhxI7ugMqJU0zwIehG4KuIlqTNMF+d5Mk5PL09UL70MZOETwzyTMBhMVfJX5kyDkl1v2W18QMvv5
 iZTV6Emh4zSvJ26PHVlc9nKbq/bsCeFCrHIM22yxZmmi0YD9S8ATDwfimP2YXtw+LPbT50otIy4Np
 nC+ysOAX6j6gvnagK3v3eiIBK9uomlm/tXGuYP5BUyeIzfWud6/lcRL3TbFYBsZPciiHLluYxEvPb
 Qe4UlauA==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1plw5d-00E2cy-QX; Mon, 10 Apr 2023 20:18:05 +0200
Date: Mon, 10 Apr 2023 17:17:56 -0100
From: Melissa Wen <mwen@igalia.com>
To: Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH 2/2] vkms: Add support for multiple connectors
Message-ID: <20230410181756.j4pegq4zqv4vlkfc@mail.igalia.com>
References: <20221202142051.136651-3-marius.vlad@collabora.com>
 <20230405135145.305293-1-mcanal@igalia.com>
 <c3a03808-db42-5dca-54d0-2a227d765bf1@collabora.com>
 <ea757d75-869a-3e32-26b8-301514a72a5a@suse.de>
 <ae6b8a8d-450a-b919-1d53-93fa0bf67ccc@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7yjokmgv53zkzt4v"
Content-Disposition: inline
In-Reply-To: <ae6b8a8d-450a-b919-1d53-93fa0bf67ccc@collabora.com>
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
Cc: rodrigosiqueiramelo@gmail.com,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7yjokmgv53zkzt4v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/06, Marius Vlad wrote:
> Hi Thomas,
>=20
> Thanks for the clarifications! Made a couple of remarks in-line.
>=20
> On 4/6/23 14:29, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 06.04.23 um 11:17 schrieb Marius Vlad:
> > > Hi Maira,
> > >=20
> > > Thanks a lot for taking a look. Yeah, indeed, this creates a new
> > > connector, a CRTC and planes for it. Terminology wise, multiple
> > > pipes. The idea is to have multiple outputs, each with its own
> > > connector, as to be able to simulate (a few) more outputs. At least
> > > that's what I'm looking for.
> > >=20
> > > I'll adjust the commits description to clarify that.
> > >=20
> > > Regarding the planes, it seemed a bit easier to just create a new
> > > tuple of planes for each output, as in to reuse vkms_output_init().
> > > So I guess that you're suggestion would be to make use the existing
> > > planes.
> > >=20
> > > Seems a bit more work, not that keen on changing that, but I do have
> > > some follow-up questions for my own curiosity in case I do this:
> > >=20
> > > -=A0 Don't I need an entire pipe (a primary plane, crtc, encoder,
> > > connector) to power up the end side of the sink (display)?
> >=20
> > Yes, you need at least one full pipeline. I don't see how you'd get
> > something displayed otherwise.
> >=20
> > > - Can the primary one be sufficient for multiple outputs?
> >=20
> > We have no concept of "primary pipelines." The individual components
> > have index numbers. There's a primary plane attached to each CRTC, but
> > even that concept comes more from HW limitations and historical designs,
> > than fundamental requirements.
>=20
> Right, meant the primary plane, rather than pipeline.
>=20
> >=20
> > For multiple outputs, you can attach multiple encoders/connectors to the
> > same CRTC. They will then all display the same screen at the same
> > display resolution
> Yeah, this kind of sounds like cloning to me, and would like to display
> different things at the same time, on different outputs, to me it sounds I
> need primary plane and a CRTC for each connector. Right?
>=20
> >=20
> > > - Can the overlay planes be shared or I need to
> > > =A0=A0 discard the ones that are already in-use by other outputs?
> >=20
> > Even if your hardware planes support it, you cannot share planes among
> > CRTCs with DRM. At least I'm not aware how to. Each plane struct has a
> > designated CRTC struct. For most flexibility I'd have to match HW planes
> > and DRM planes dynamically. For example if you have 2 CRTCs that can
> > share 10 HW planes, you can allocate 10 DRM planes for each CRTC. The
> > atomic_check functions have to implement the mapping from hardware to
> > software plane and fail if no more hardware planes are available.
> >=20
> > If you want to display the same screen on multiple CRTCs, it's possible
> > to share the DRM framebuffers among similar the planes.
>=20
> Aham, understood, thanks again!

Some drivers allow overlay planes to move between CRTCs. We have briefly
discussed on IRC that it would be interesting to have this (even for all
plane types) in vkms for testing and validation, but in a next step. As
it's not included in this proposal here, I'd suggest you to include this
feature/improvement in the vkms TODO in your next version, to keep it in
our minds for future works.

BR,

Melissa

>=20
> >=20
> > Best regards
> > Thomas
> >=20
> > >=20
> > > I'll have a look at that writeback test as well see what's causing th=
at
> > > NULL pointer deref.
> > >=20
> > >=20
> > > On 4/5/23 16:51, Ma=EDra Canal wrote:
> > > > Hi Marius,
> > > >=20
> > > > > This patch adds support for creating multiple virtual connectors,=
 in
> > > > > case one would need it. Use module parameters to specify how many,
> > > > > defaulting to just one, allocating from the start, a maximum of 4
> > > > > possible outputs.
> > > >=20
> > > > I got a bit confused by this description. The commit message
> > > > says that you
> > > > are creating multiple connectors, but it seems like you are
> > > > creating multiple
> > > > pipes. From what I could see, for each new connector created,
> > > > you are also
> > > > creating a new CRTC and new planes.
> > > >=20
> > > > Moreover, if your real intention is to create multiple pipes, I
> > > > believe that
> > > > you don't really need to duplicate the planes as well.
> > > >=20
> > > > I ran the VKMS CI [1] with your patches applied and, although
> > > > most of the
> > > > tests are now passing with multiple pipes, which is really nice,
> > > > the test
> > > > kms_writeback crashes with the following error:
> > > >=20
> > > > [ 1997.244347] [IGT] kms_writeback: starting subtest
> > > > writeback-check-output
> > > > [ 1997.250673] BUG: kernel NULL pointer dereference, address:
> > > > 000000000000016c
> > > > [ 1997.250691] #PF: supervisor read access in kernel mode
> > > > [ 1997.250693] #PF: error_code(0x0000) - not-present page
> > > > [ 1997.250694] PGD 800000001a877067 P4D 800000001a877067 PUD
> > > > 1a872067 PMD 0
> > > > [ 1997.250697] Oops: 0000 [#1] PREEMPT SMP PTI
> > > > [ 1997.250699] CPU: 2 PID: 3223 Comm: kms_writeback Not tainted
> > > > 6.3.0-rc4-g8c2c29ba129f-dirty #257
> > > > [ 1997.250701] Hardware name: QEMU Standard PC (i440FX + PIIX,
> > > > 1996), BIOS 1.16.2-1.fc37 04/01/2014
> > > > [ 1997.250703] RIP: 0010:drm_vblank_get+0xa/0xe0
> > > > [ 1997.250710] Code: a9 66 66 66 66 66 66 2e 0f 1f 84 00 00 00
> > > > 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57
> > > > 41 56 41 55 41 54 53 <8b> 87 6c 01 00 00 41 bc ea ff ff ff 85 c0
> > > > 74 74 89 f5 48 89 fb 39
> > > > [ 1997.250712] RSP: 0018:ffffb84d407a3b08 EFLAGS: 00010202
> > > > [ 1997.250714] RAX: 0000000000000000 RBX: ffffa2eb02bf8b70 RCX:
> > > > 0000000000000000
> > > > [ 1997.250718] RDX: ffffa2eb180d2420 RSI: 0000000000000000 RDI:
> > > > 0000000000000000
> > > > [ 1997.250719] RBP: ffffa2eb02bf99e8 R08: 0000000000000036 R09:
> > > > ffffa2eb01d620c0
> > > > [ 1997.250720] R10: ffffe82b84027e40 R11: ffffffffc0042520 R12:
> > > > ffffa2eb01c01900
> > > > [ 1997.250721] R13: ffffa2eb02bf9b60 R14: 0000000000000001 R15:
> > > > ffffa2ea1ecd6b80
> > > > [ 1997.250722] FS:=A0 00007f7d44e89a80(0000)
> > > > GS:ffffa2eb3bd00000(0000) knlGS:0000000000000000
> > > > [ 1997.250723] CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > [ 1997.250725] CR2: 000000000000016c CR3: 000000001ec02000 CR4:
> > > > 00000000000006e0
> > > > [ 1997.250728] Call Trace:
> > > > [ 1997.250735]=A0 <TASK>
> > > > [ 1997.250736]=A0 vkms_set_composer+0x18/0x60 [vkms]
> > > > [ 1997.250745]=A0 vkms_wb_atomic_commit+0x93/0x150 [vkms]
> > > > [ 1997.250749]=A0 drm_atomic_helper_commit_modeset_enables+0x1d9/0x=
250
> > > > [ 1997.250754]=A0 vkms_atomic_commit_tail+0x33/0xb0 [vkms]
> > > > [ 1997.250758]=A0 commit_tail+0x8d/0x170
> > > > [ 1997.250761]=A0 drm_atomic_helper_commit+0x26b/0x280
> > > > [ 1997.250763]=A0 drm_atomic_commit+0x9f/0xc0
> > > > [ 1997.250766]=A0 ? __pfx___drm_printfn_info+0x10/0x10
> > > > [ 1997.250769]=A0 drm_mode_atomic_ioctl+0x34c/0x480
> > > > [ 1997.250771]=A0 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > > > [ 1997.250773]=A0 drm_ioctl_kernel+0xd7/0x150
> > > > [ 1997.250780]=A0 drm_ioctl+0x31f/0x490
> > > > [ 1997.250781]=A0 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > > > [ 1997.250783]=A0 __se_sys_ioctl+0x6d/0xb0
> > > > [ 1997.250789]=A0 do_syscall_64+0x43/0x90
> > > > [ 1997.250795]=A0 entry_SYSCALL_64_after_hwframe+0x72/0xdc
> > > >=20
> > > > [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/tree/master/=
tests/vkms_ci
> > > >=20
> > > > Best Regards,
> > > > - Ma=EDra Canal
> > > >=20
> > > > >=20
> > > > > This is of particular importance when testing out the DRM backend=
 in
> > > > > compositors, but also to be able to independently handle multiple
> > > > > outputs/connectors, like setting one to off/sleep on while the ot=
hers
> > > > > are on, and combinations that arise from that.
> > > > >=20
> > > > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > > > ---
> > > > > =A0 drivers/gpu/drm/vkms/vkms_crtc.c=A0=A0=A0=A0=A0 |=A0 3 +--
> > > > > =A0 drivers/gpu/drm/vkms/vkms_drv.c=A0=A0=A0=A0=A0=A0 | 26 ++++++=
++++++++++++++++----
> > > > > =A0 drivers/gpu/drm/vkms/vkms_drv.h=A0=A0=A0=A0=A0=A0 |=A0 8 ++++=
+---
> > > > > =A0 drivers/gpu/drm/vkms/vkms_output.c=A0=A0=A0 |=A0 5 ++---
> > > > > =A0 drivers/gpu/drm/vkms/vkms_writeback.c | 18 ++++++++----------
> > > > > =A0 5 files changed, 38 insertions(+), 22 deletions(-)
> > > > >=20
> >=20

--7yjokmgv53zkzt4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmQ0Us8ACgkQwqF3j0dL
ehycww/+OIUQK8bCyGRfJ/R6oBKhkOh04mFU6b9U4Nf+n/fz7Nqpx5pm+qBb1VzA
7IC3PTMm46RX2FP+XAxrO1g1mvCVapME9ahbgIYTG4B2xRl0Ta4II6+nTXD6abTx
NolaJ/Nlq9HoWdkzn1JscVnnuT06HoFA7egkmA6h8AJs/TBWzh+1TugRN5hYNjIK
FMn3JfRmqf93Oyqz8NkF5OyZZJcehCfEbdTwzG8qh6PInESlNUD5ecFNEeL1UCCV
pNPtsg0li2YECIw6m+34o/X54b7kpPRlybW9Xdkcyxvqj+0251cqIxPpcX0wWLG8
mWcaytB2YTmhma+4DCGYomzRQoZeAqjFOJkvPF7jn344hYNgQgaxoZ+qAyPal1Ak
ClQTh/Lml/9xk6yltFzvCIW6g8KAwn/mrPTgOXClHQo/sqP6Sez83SdcYvDngVem
Gn2RLOJlUF83zTrotRyCrqJofXWKgtb+vHvRvdQgbcsstA6fldRiak24ijgH4RjC
jOtPLmMkPe3bzKLf7g/svyfU50Er2Ww6VOg/7HLfoQvMTyl+rKX6R4CTW3mnG0Nb
oFXDi+phVo2ZK6M7B6/FrEBp7rt2oOGbCRMSPzL6RpPY9yAzqh2PdRneIoUTFdY5
NVjyRCd+zMpHCsDhpFx7PTIKTJevNz1NDP8OtmqUZ7sbJWnGeYw=
=cRlT
-----END PGP SIGNATURE-----

--7yjokmgv53zkzt4v--
