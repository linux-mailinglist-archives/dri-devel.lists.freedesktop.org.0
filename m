Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C221CA679
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B656EAA3;
	Fri,  8 May 2020 08:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6C76E15F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 17:22:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7E63A47A;
 Thu,  7 May 2020 13:22:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 07 May 2020 13:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=AtwnMVHOzK8UMHe+XysxjBGhDEV
 3ahLRRG2z8MAWYBM=; b=sZY7RTLbE1ohKxTNRii17O6xsCpoN1YEah+87xj0eLS
 J+57j84XlYK8DSLNrxOKKadBdUSUjGG7RsNFLd4fZZHiT5QAPF+GsPAtpmYQCaGu
 abOA4QN+ydVsMCT90V+U4V/PWRh+/qqAe2xAtzDb3hn4RQ+XbrKvTxf7LQOZVQT8
 pZ95J7Y+PpCxJoe/pAGw1Eh5WmncGKyPrs+2Nvb43O6vinlqNlqNdHj1YaWnpV96
 MRl0bFHXgOiu7Z0NgOcF3JB80oaSerOmzP2v+Rfhs1lI7dutz1veja8QjrzpqS3O
 zU7Olg//bqiZPxlZ2+/Flo+ILwJoD+otcWLVVdXcR9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AtwnMV
 HOzK8UMHe+XysxjBGhDEV3ahLRRG2z8MAWYBM=; b=EGGUFkA/dhISMxhjTPC5V5
 GCgYOadHw/Twkr695smNjOAB74x7zMQB3JHh31NMgR1bjBZExWYOTFulofSvdiKM
 g3ZoyqkpiLxS0DRX2CqIXzy9t69gPYMOSXS7xba3GT0tiI7VRUUABtn+zXyaT3Jg
 Wd15u+H+BMfMjt2CKefRcOgfpTqXP2Ggh9jlMBL09TUuQTc2y3wYsXC4rC9IRz91
 8JrCHQAE63jfJIed73IwVrwTUQzcRpSb17sBW0oh/XKod95CWZO+h+V0zs+E90eJ
 VOX5AdauRBkfOrIyZRpzT9EMHC5reWFJnWL0QQL+0c+zqqQuXh076JEqy+8CGqjg
 ==
X-ME-Sender: <xms:uEO0Xm-UELfAKpF4LyswgBSG4YZ2DxV2vtcgFVOjuL_708jZKqYphQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedtgdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepudelfeevuddutdetjeeggeefvdetveeftdejteevieffudefgeejleegteek
 geevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uEO0XtFrKUKkz1AaNNtWfFKDfs_rO22-fIu0jYZoQdvrrdGxHSEbmA>
 <xmx:uEO0XoTPHIIAYuJ4KVHOfA0xMuUFg1i93P09bSwFTAQr0IcxKDEH0g>
 <xmx:uEO0XsSS0nNQed5IpxmhDL5B4RyosKBqAdzqwBbVHOVaTADSUtgqbQ>
 <xmx:ukO0XlEJo5zkuHShKco6fA_6uniuby3RbiSGXfQ0dJtpHp1gN2cc1BNk-xQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8C9F030661D0;
 Thu,  7 May 2020 13:22:00 -0400 (EDT)
Date: Thu, 7 May 2020 19:21:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jian-Hong Pan <jian-hong@endlessm.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
Message-ID: <20200507172158.cybtakpo6cxv6wcs@gilmour.lan>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com>
 <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: devicetree@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-i2c@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Linux Upstreaming Team <linux@endlessm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1271012759=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1271012759==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="34jthk25fxopffnu"
Content-Disposition: inline


--34jthk25fxopffnu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2020 at 02:35:08PM +0800, Jian-Hong Pan wrote:
> Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B44=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:21=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > On Mon, Apr 27, 2020 at 03:23:42PM +0800, Jian-Hong Pan wrote:
> > > Hi Maxime,
> > >
> > > Thanks for your V2 patch series!  I'm testing it.
> > >
> > > This patch series is applied upon mainline kernel 5.7-rc2 cleanly and=
 built.
> > > System can boot into console text mode, but no graphic UI.
> > >
> > > Get the error in vc5_hdmi_phy_init(), and full dmesg is at [1]:
> > >
> > > [    5.587543] vc4_hdmi fef00700.hdmi: Unknown register ID 46
> > > [    5.587700] debugfs: Directory 'fef00700.hdmi' with parent 'vc4-hd=
mi' already present!
> > > [    5.588070] vc4_hdmi fef00700.hdmi: vc4-hdmi-hifi <-> fef00700.hdm=
i mapping ok
> > > [    5.588076] vc4_hdmi fef00700.hdmi: ASoC: no DMI vendor name!
> > > [    5.588263] vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops)
> > > [    5.588299] vc4_hdmi fef05700.hdmi: Unknown register ID 46
> > > [    5.588373] debugfs: Directory 'vc4-hdmi' with parent 'asoc' alrea=
dy present!
> > > [    5.588673] vc4_hdmi fef05700.hdmi: vc4-hdmi-hifi <-> fef05700.hdm=
i mapping ok
> > > [    5.588677] vc4_hdmi fef05700.hdmi: ASoC: no DMI vendor name!
> > > [    5.588809] vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops)
> > > [    5.588854] vc4-drm gpu: bound fe806000.vec (ops vc4_vec_ops)
> > > [    5.588897] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops)
> > > [    5.588934] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops)
> > > [    5.588990] vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_o=
ps)
> > > [    5.589030] vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_o=
ps)
> > > [    5.589074] vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_o=
ps)
> > > [    5.589106] vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_o=
ps)
> > > [    5.589145] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_o=
ps)
> > > [    5.589294] checking generic (3e513000 6d8c00) vs hw (0 ffffffffff=
ffffff)
> > > [    5.589297] fb0: switching to vc4drmfb from simple
> > > [    5.589433] Console: switching to colour dummy device 80x25
> > > [    5.589481] [drm] Supports vblank timestamp caching Rev 2 (21.10.2=
013).
> > > [    5.589816] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> > > [    5.601079] ------------[ cut here ]------------
> > > [    5.601095] WARNING: CPU: 2 PID: 127 at drivers/gpu/drm/vc4/vc4_hd=
mi_phy.c:413 vc5_hdmi_phy_init+0x7ac/0x2078
> > > [    5.601097] Modules linked in:
> > > [    5.601103] CPU: 2 PID: 127 Comm: kworker/2:1 Not tainted 5.7.0-rc=
2-00091-ga181df59a930 #7
> > > [    5.601105] Hardware name: Raspberry Pi 4 Model B (DT)
> > > [    5.601112] Workqueue: events deferred_probe_work_func
> > > [    5.601116] pstate: 20000005 (nzCv daif -PAN -UAO)
> > > [    5.601119] pc : vc5_hdmi_phy_init+0x7ac/0x2078
> > > [    5.601123] lr : vc4_hdmi_encoder_enable+0x1b8/0x1ac0
> > > [    5.601124] sp : ffff80001217b410
> > > [    5.601126] x29: ffff80001217b410 x28: ffff0000ec6370f0
> > > [    5.601129] x27: ffff0000f650d400 x26: 000000008a500000
> > > [    5.601132] x25: ffff8000113b4ac0 x24: 0000000000002060
> > > [    5.601135] x23: 000000000a500000 x22: 0000000000000300
> > > [    5.601137] x21: 0000000008d9ee20 x20: ffff0000ec535080
> > > [    5.601140] x19: 000000010989e7c0 x18: 0000000000000000
> > > [    5.601142] x17: 0000000000000001 x16: 0000000000005207
> > > [    5.601145] x15: 00004932ad293c92 x14: 0000000000000137
> > > [    5.601147] x13: ffff800010015000 x12: 0000000000000001
> > > [    5.601150] x11: 0000000000000001 x10: 0000000000000000
> > > [    5.601152] x9 : 0000000000000000 x8 : ffff800010015038
> > > [    5.601154] x7 : 0000000000000001 x6 : ffff80001217b368
> > > [    5.601157] x5 : 0000000000000000 x4 : 000000000000004c
> > > [    5.601159] x3 : 0000000000000000 x2 : ffff8000113b4ac0
> > > [    5.601162] x1 : ffff8000120c5f44 x0 : 00000000dc8984ff
> > > [    5.601164] Call trace:
> > > [    5.601169]  vc5_hdmi_phy_init+0x7ac/0x2078
> > > [    5.601172]  vc4_hdmi_encoder_enable+0x1b8/0x1ac0
> > > [    5.601176]  drm_atomic_helper_commit_modeset_enables+0x224/0x248
> > > [    5.601179]  vc4_atomic_complete_commit+0x400/0x558
> > > [    5.601182]  vc4_atomic_commit+0x1e0/0x200
> > > [    5.601185]  drm_atomic_commit+0x4c/0x60
> > > [    5.601190]  drm_client_modeset_commit_atomic.isra.0+0x17c/0x238
> > > [    5.601192]  drm_client_modeset_commit_locked+0x5c/0x198
> > > [    5.601195]  drm_client_modeset_commit+0x30/0x58
> > > [    5.601201]  drm_fb_helper_restore_fbdev_mode_unlocked+0x78/0xe0
> > > [    5.601204]  drm_fb_helper_set_par+0x30/0x68
> > > [    5.601208]  fbcon_init+0x3d4/0x598
> > > [    5.601212]  visual_init+0xb0/0x108
> > > [    5.601214]  do_bind_con_driver+0x1d0/0x3a8
> > > [    5.601217]  do_take_over_console+0x144/0x208
> > > [    5.601219]  do_fbcon_takeover+0x68/0xd8
> > > [    5.601222]  fbcon_fb_registered+0x100/0x118
> > > [    5.601226]  register_framebuffer+0x1f4/0x338
> > > [    5.601229]  __drm_fb_helper_initial_config_and_unlock+0x2f8/0x4a0
> > > [    5.601232]  drm_fbdev_client_hotplug+0xd4/0x1b0
> > > [    5.601235]  drm_fbdev_generic_setup+0xb0/0x130
> > > [    5.601238]  vc4_drm_bind+0x184/0x1a0
> > > [    5.601241]  try_to_bring_up_master+0x168/0x1c8
> > > [    5.601244]  __component_add+0xa4/0x170
> > > [    5.601246]  component_add+0x14/0x20
> > > [    5.601248]  vc4_vec_dev_probe+0x20/0x30
> > > [    5.601252]  platform_drv_probe+0x54/0xa8
> > > [    5.601254]  really_probe+0xd8/0x320
> > > [    5.601256]  driver_probe_device+0x58/0xf0
> > > [    5.601258]  __device_attach_driver+0x84/0xc8
> > > [    5.601263]  bus_for_each_drv+0x78/0xc8
> > > [    5.601265]  __device_attach+0xe4/0x140
> > > [    5.601267]  device_initial_probe+0x14/0x20
> > > [    5.601269]  bus_probe_device+0x9c/0xa8
> > > [    5.601271]  deferred_probe_work_func+0x74/0xb0
> > > [    5.601276]  process_one_work+0x1bc/0x338
> > > [    5.601279]  worker_thread+0x1f8/0x428
> > > [    5.601282]  kthread+0x138/0x158
> > > [    5.601286]  ret_from_fork+0x10/0x1c
> > > [    5.601288] ---[ end trace cfba0996218c3f3d ]---
> >
> > Thanks for testing!
> >
> > Do you have a bit more details regarding your setup? Was it connected t=
o an
> > external display?
>=20
> Yes, the HDMI cable is connected to HDMI0 port on RPi 4.
>=20
> > If so, do you know the resolution it was trying to setup?
>=20
> According to the log, I think it is 1920x1080:
> Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Output
> HDMI-1 connected
> Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Output
> HDMI-2 disconnected
> Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Output
> Composite-1 disconnected
> Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Using
> exact sizes for initial modes
> Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Output
> HDMI-1 using initial mode 1920x1080 +0+0
>=20
> https://gist.github.com/starnight/45e1468bfa0426a54d2fb4a9269cfb94

It looks to be fairly standard then, and I'm testing on the same resolution=
 so
it should be alright.

Given from your log, it looks like you're running as arm64 though, while I =
stuck
with arm32, so it could be the explanation.

Can you share your config.txt and .config so that I can try to reproduce it
here?

Thanks!
Maxime

--34jthk25fxopffnu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXrRDtgAKCRDj7w1vZxhR
xThwAP97h7Soqibnh5o2V7knb+qSIWCtf4YNw41r8AeI5KQKqQD7Bz7NiA/MBc3P
s1xa8/8wkJ9/IwUBn9Ik2vBeuvQoPQk=
=/FEz
-----END PGP SIGNATURE-----

--34jthk25fxopffnu--

--===============1271012759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1271012759==--
