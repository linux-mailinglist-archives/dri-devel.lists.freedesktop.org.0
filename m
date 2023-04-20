Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D76E8D07
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDEA10EBDE;
	Thu, 20 Apr 2023 08:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E4810EBF6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:45:00 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:4a06:df00:7656:3cff:fe3f:7ce9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7226A6603252;
 Thu, 20 Apr 2023 09:44:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681980298;
 bh=3qk3MzyEccA2fIatz6+lxykV9oQx6NNNuQyWh7+gFS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iBMYq5fs8FnjBB9xqaJrh7uvZ87y7ew5Hi4FLHOWmltSzv3pg7HS72RqEOp6L+CtV
 LYV4pBLYl7V4yMb0da+actgIoE6EuyXIT8nhetP/3b2nleGnD1jC8i6yBVqt2eh2HI
 w1ZLbM5wMtYYDYfq9WN41IJ82cBmVcvoLsHDPsrnkpbg3mRIMQNYJibtNHYlNme1ln
 iG6RUWOR5DCHsHnHUTbup314s/gZ+tjHzeeHaKMfGd3CdUeAoNu2xxSVpLL/EwBhMt
 l/+Dmtw1gtFOPnGUxgoqT8ZtK8BNryW239iQxqtlvkfAPHZI+2npnlhdSZTw3+j3vV
 eM4IJVljg/4Rw==
Date: Thu, 20 Apr 2023 11:44:55 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH 2/2] vkms: Add support for multiple connectors
Message-ID: <ZED7h4DJNOXJHJQl@xpredator>
References: <20221202142051.136651-3-marius.vlad@collabora.com>
 <20230405135145.305293-1-mcanal@igalia.com>
 <c3a03808-db42-5dca-54d0-2a227d765bf1@collabora.com>
 <ea757d75-869a-3e32-26b8-301514a72a5a@suse.de>
 <ae6b8a8d-450a-b919-1d53-93fa0bf67ccc@collabora.com>
 <20230410181756.j4pegq4zqv4vlkfc@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9qWhHHFnW1iMPzJd"
Content-Disposition: inline
In-Reply-To: <20230410181756.j4pegq4zqv4vlkfc@mail.igalia.com>
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
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9qWhHHFnW1iMPzJd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Melissa,

Added a note about that in the latest version.

Thanks!

On Mon, Apr 10, 2023 at 05:17:56PM -0100, Melissa Wen wrote:
> On 04/06, Marius Vlad wrote:
> > Hi Thomas,
> >=20
> > Thanks for the clarifications! Made a couple of remarks in-line.
> >=20
> > On 4/6/23 14:29, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 06.04.23 um 11:17 schrieb Marius Vlad:
> > > > Hi Maira,
> > > >=20
> > > > Thanks a lot for taking a look. Yeah, indeed, this creates a new
> > > > connector, a CRTC and planes for it. Terminology wise, multiple
> > > > pipes. The idea is to have multiple outputs, each with its own
> > > > connector, as to be able to simulate (a few) more outputs. At least
> > > > that's what I'm looking for.
> > > >=20
> > > > I'll adjust the commits description to clarify that.
> > > >=20
> > > > Regarding the planes, it seemed a bit easier to just create a new
> > > > tuple of planes for each output, as in to reuse vkms_output_init().
> > > > So I guess that you're suggestion would be to make use the existing
> > > > planes.
> > > >=20
> > > > Seems a bit more work, not that keen on changing that, but I do have
> > > > some follow-up questions for my own curiosity in case I do this:
> > > >=20
> > > > -=A0 Don't I need an entire pipe (a primary plane, crtc, encoder,
> > > > connector) to power up the end side of the sink (display)?
> > >=20
> > > Yes, you need at least one full pipeline. I don't see how you'd get
> > > something displayed otherwise.
> > >=20
> > > > - Can the primary one be sufficient for multiple outputs?
> > >=20
> > > We have no concept of "primary pipelines." The individual components
> > > have index numbers. There's a primary plane attached to each CRTC, but
> > > even that concept comes more from HW limitations and historical desig=
ns,
> > > than fundamental requirements.
> >=20
> > Right, meant the primary plane, rather than pipeline.
> >=20
> > >=20
> > > For multiple outputs, you can attach multiple encoders/connectors to =
the
> > > same CRTC. They will then all display the same screen at the same
> > > display resolution
> > Yeah, this kind of sounds like cloning to me, and would like to display
> > different things at the same time, on different outputs, to me it sound=
s I
> > need primary plane and a CRTC for each connector. Right?
> >=20
> > >=20
> > > > - Can the overlay planes be shared or I need to
> > > > =A0=A0 discard the ones that are already in-use by other outputs?
> > >=20
> > > Even if your hardware planes support it, you cannot share planes among
> > > CRTCs with DRM. At least I'm not aware how to. Each plane struct has a
> > > designated CRTC struct. For most flexibility I'd have to match HW pla=
nes
> > > and DRM planes dynamically. For example if you have 2 CRTCs that can
> > > share 10 HW planes, you can allocate 10 DRM planes for each CRTC. The
> > > atomic_check functions have to implement the mapping from hardware to
> > > software plane and fail if no more hardware planes are available.
> > >=20
> > > If you want to display the same screen on multiple CRTCs, it's possib=
le
> > > to share the DRM framebuffers among similar the planes.
> >=20
> > Aham, understood, thanks again!
>=20
> Some drivers allow overlay planes to move between CRTCs. We have briefly
> discussed on IRC that it would be interesting to have this (even for all
> plane types) in vkms for testing and validation, but in a next step. As
> it's not included in this proposal here, I'd suggest you to include this
> feature/improvement in the vkms TODO in your next version, to keep it in
> our minds for future works.
>=20
> BR,
>=20
> Melissa
>=20
> >=20
> > >=20
> > > Best regards
> > > Thomas
> > >=20
> > > >=20
> > > > I'll have a look at that writeback test as well see what's causing =
that
> > > > NULL pointer deref.
> > > >=20
> > > >=20
> > > > On 4/5/23 16:51, Ma=EDra Canal wrote:
> > > > > Hi Marius,
> > > > >=20
> > > > > > This patch adds support for creating multiple virtual connector=
s, in
> > > > > > case one would need it. Use module parameters to specify how ma=
ny,
> > > > > > defaulting to just one, allocating from the start, a maximum of=
 4
> > > > > > possible outputs.
> > > > >=20
> > > > > I got a bit confused by this description. The commit message
> > > > > says that you
> > > > > are creating multiple connectors, but it seems like you are
> > > > > creating multiple
> > > > > pipes. From what I could see, for each new connector created,
> > > > > you are also
> > > > > creating a new CRTC and new planes.
> > > > >=20
> > > > > Moreover, if your real intention is to create multiple pipes, I
> > > > > believe that
> > > > > you don't really need to duplicate the planes as well.
> > > > >=20
> > > > > I ran the VKMS CI [1] with your patches applied and, although
> > > > > most of the
> > > > > tests are now passing with multiple pipes, which is really nice,
> > > > > the test
> > > > > kms_writeback crashes with the following error:
> > > > >=20
> > > > > [ 1997.244347] [IGT] kms_writeback: starting subtest
> > > > > writeback-check-output
> > > > > [ 1997.250673] BUG: kernel NULL pointer dereference, address:
> > > > > 000000000000016c
> > > > > [ 1997.250691] #PF: supervisor read access in kernel mode
> > > > > [ 1997.250693] #PF: error_code(0x0000) - not-present page
> > > > > [ 1997.250694] PGD 800000001a877067 P4D 800000001a877067 PUD
> > > > > 1a872067 PMD 0
> > > > > [ 1997.250697] Oops: 0000 [#1] PREEMPT SMP PTI
> > > > > [ 1997.250699] CPU: 2 PID: 3223 Comm: kms_writeback Not tainted
> > > > > 6.3.0-rc4-g8c2c29ba129f-dirty #257
> > > > > [ 1997.250701] Hardware name: QEMU Standard PC (i440FX + PIIX,
> > > > > 1996), BIOS 1.16.2-1.fc37 04/01/2014
> > > > > [ 1997.250703] RIP: 0010:drm_vblank_get+0xa/0xe0
> > > > > [ 1997.250710] Code: a9 66 66 66 66 66 66 2e 0f 1f 84 00 00 00
> > > > > 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57
> > > > > 41 56 41 55 41 54 53 <8b> 87 6c 01 00 00 41 bc ea ff ff ff 85 c0
> > > > > 74 74 89 f5 48 89 fb 39
> > > > > [ 1997.250712] RSP: 0018:ffffb84d407a3b08 EFLAGS: 00010202
> > > > > [ 1997.250714] RAX: 0000000000000000 RBX: ffffa2eb02bf8b70 RCX:
> > > > > 0000000000000000
> > > > > [ 1997.250718] RDX: ffffa2eb180d2420 RSI: 0000000000000000 RDI:
> > > > > 0000000000000000
> > > > > [ 1997.250719] RBP: ffffa2eb02bf99e8 R08: 0000000000000036 R09:
> > > > > ffffa2eb01d620c0
> > > > > [ 1997.250720] R10: ffffe82b84027e40 R11: ffffffffc0042520 R12:
> > > > > ffffa2eb01c01900
> > > > > [ 1997.250721] R13: ffffa2eb02bf9b60 R14: 0000000000000001 R15:
> > > > > ffffa2ea1ecd6b80
> > > > > [ 1997.250722] FS:=A0 00007f7d44e89a80(0000)
> > > > > GS:ffffa2eb3bd00000(0000) knlGS:0000000000000000
> > > > > [ 1997.250723] CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > [ 1997.250725] CR2: 000000000000016c CR3: 000000001ec02000 CR4:
> > > > > 00000000000006e0
> > > > > [ 1997.250728] Call Trace:
> > > > > [ 1997.250735]=A0 <TASK>
> > > > > [ 1997.250736]=A0 vkms_set_composer+0x18/0x60 [vkms]
> > > > > [ 1997.250745]=A0 vkms_wb_atomic_commit+0x93/0x150 [vkms]
> > > > > [ 1997.250749]=A0 drm_atomic_helper_commit_modeset_enables+0x1d9/=
0x250
> > > > > [ 1997.250754]=A0 vkms_atomic_commit_tail+0x33/0xb0 [vkms]
> > > > > [ 1997.250758]=A0 commit_tail+0x8d/0x170
> > > > > [ 1997.250761]=A0 drm_atomic_helper_commit+0x26b/0x280
> > > > > [ 1997.250763]=A0 drm_atomic_commit+0x9f/0xc0
> > > > > [ 1997.250766]=A0 ? __pfx___drm_printfn_info+0x10/0x10
> > > > > [ 1997.250769]=A0 drm_mode_atomic_ioctl+0x34c/0x480
> > > > > [ 1997.250771]=A0 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > > > > [ 1997.250773]=A0 drm_ioctl_kernel+0xd7/0x150
> > > > > [ 1997.250780]=A0 drm_ioctl+0x31f/0x490
> > > > > [ 1997.250781]=A0 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > > > > [ 1997.250783]=A0 __se_sys_ioctl+0x6d/0xb0
> > > > > [ 1997.250789]=A0 do_syscall_64+0x43/0x90
> > > > > [ 1997.250795]=A0 entry_SYSCALL_64_after_hwframe+0x72/0xdc
> > > > >=20
> > > > > [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/tree/maste=
r/tests/vkms_ci
> > > > >=20
> > > > > Best Regards,
> > > > > - Ma=EDra Canal
> > > > >=20
> > > > > >=20
> > > > > > This is of particular importance when testing out the DRM backe=
nd in
> > > > > > compositors, but also to be able to independently handle multip=
le
> > > > > > outputs/connectors, like setting one to off/sleep on while the =
others
> > > > > > are on, and combinations that arise from that.
> > > > > >=20
> > > > > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > > > > ---
> > > > > > =A0 drivers/gpu/drm/vkms/vkms_crtc.c=A0=A0=A0=A0=A0 |=A0 3 +--
> > > > > > =A0 drivers/gpu/drm/vkms/vkms_drv.c=A0=A0=A0=A0=A0=A0 | 26 ++++=
++++++++++++++++++----
> > > > > > =A0 drivers/gpu/drm/vkms/vkms_drv.h=A0=A0=A0=A0=A0=A0 |=A0 8 ++=
+++---
> > > > > > =A0 drivers/gpu/drm/vkms/vkms_output.c=A0=A0=A0 |=A0 5 ++---
> > > > > > =A0 drivers/gpu/drm/vkms/vkms_writeback.c | 18 ++++++++--------=
--
> > > > > > =A0 5 files changed, 38 insertions(+), 22 deletions(-)
> > > > > >=20
> > >=20



--9qWhHHFnW1iMPzJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmRA+4QACgkQ9jQS5glH
1u8CRA/+JOarRrf+O/KEde+IBkq5S46LgQ0PT3waiFhdP/WiPZY2Fzgyhy3IgRtb
E1+58lM2HFI8vTExJdzqmXyJ7sDQGJPizpvXnp86bWOIOGYrdYgGFzDZ22XKnzgG
XXD9VEpY7V8BX6NfLr0KxN+16ch4VnWLhv6yb1Ze+0Yq8ToXhESDSNT5NlbT5f53
TQxCYvEDQiR0THe7yj6xE29e9AFzr3ucGpTPdp4mdYoKU8W1dR6qMC3tNB8wfJhY
Lk/U0nTs9A2zLER8KG5MMinMLFMKKLivgf0t1uTRIX1C3aLnwHjp3l2JBiT5r+Bj
lMB/PMniIA2OaIb0qisEWbxp29uZ3X3WDPLppPO2lRi0HtQVXML7Nd+oLlcBWfwD
WEx59Btpw8Cxy0h4QqDXB4xQr2v/mAWCp3QrbtsnD3VhlaQ5ZkrE8vavPdAB5Nye
NNpOJEc5Zg80FS/jv5fZAdkDMCqRtkAVKFyI9A7Xt5jhaGkksEFdGss8UDFHpGsZ
HndL1w8mkLlwowsJbEinFzM/gxVE0Is1BwXm1gIgUuu1kFnYZBvov55PxNYGp2d6
blLYFIqRPM96elpmWSA40jKM8H709uD4FvQbPlF3vjqUSeYw5hbrJvmfVarlXzUW
2rYTwtWziF0sgMqeaDa1Z144fmsi35DB4d0aQro3gXj/PPj6H9k=
=fA80
-----END PGP SIGNATURE-----

--9qWhHHFnW1iMPzJd--
