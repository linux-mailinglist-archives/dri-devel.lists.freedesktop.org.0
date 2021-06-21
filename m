Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398833AED17
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECFD6E1F9;
	Mon, 21 Jun 2021 16:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFA16E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 16:06:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id B7472EA3;
 Mon, 21 Jun 2021 12:06:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 21 Jun 2021 12:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=2+6Fskh4rK0nwnGqhEwlYPq9vwZ
 sc0eVjx2sHvsSLos=; b=MvaWka3KI9EyK20ILYOACe+INoyDY60wpKDNhvI08OG
 qcDeK/pdRAkPBopYeSG5zbq1GBvnPnyaHBvY/x3Wih5A2/ubpGDv4mGU7zJgbhra
 y4X5fNZAtKrO5W0/MVK9rWcGeSrPaKPr4oMSVDvB+L7iMu+s1qFZNieB5Xo0DpZI
 BY+kDhkDxZZkH7lHwD0516LAwqlAuotUx0i81JVCy+RMqPijawt/Kg7lFdgFNpVz
 MW8Abv/dnINsD0f6GVO4oAYUFPC85jwcTIT1Rkg4Bl0zL2zC+vT8HdEERDg2w0gC
 n31431udhc1MSmV2xOw4+iBUfQslfsnT8/pZnE1CGqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2+6Fsk
 h4rK0nwnGqhEwlYPq9vwZsc0eVjx2sHvsSLos=; b=Z3MdKqIKk+9xL2lUzsGird
 kzw3oWdHJypZjf8EMGvCyj2SIdkEy5pnoXya3VS+99SFtvc/BAgIXSKxmUH8sY6X
 KSPJl5RP/dH3wKALIiETpK4kGa4ohXatDh07WqlkxK8qBH9XCOaXrLt1tx9i+WQe
 JGSoQRdSbHIkWu99wd31j8ZgNUu/23av4LtRl5w3DoNbclQun60PwZhylrRrMkJQ
 Nm8jIE4ykSIveSJ2sLQhJmPJ58Etx+jio9skkO4GUumHR32Gp8YKTySSuAxXilYo
 I0qt1zf4wDKYxCPevci7j+TfdMETX67AMtJ1/pf4h4M8cjj60juvsbuhbLdJyssg
 ==
X-ME-Sender: <xms:ALnQYN8XOdayoM_d5aobGTPSCtXowGCRznEEzVkyEmFF91h6ivcR7g>
 <xme:ALnQYBugSy1f2ekom2KTitQbu9eLueX2mWNY5RNhej_ouVo5cyoXPFCWgUloPgQ_g
 A9HhVbZdkT6u0o-ZoI>
X-ME-Received: <xmr:ALnQYLDFTzVa3me116g2uxFOl4M0XxYYpvJjdatqFjXZNbw76mpmPwyF8mBXwoNq53akcR667TbKHrwsYlCAjiAVZvmx5EpvisZS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefledgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ALnQYBe4toHC9R6KebyrYHf4BW_l9hPcZCp8NDtlMIZe5i-IAy0P7A>
 <xmx:ALnQYCPQqEcahjcMssgdDf7XfE-pX0Le7vay2p0JridFj8vhOz7T3Q>
 <xmx:ALnQYDmtCuk9wNjn4Qqp3sPSvabkXZK7PWfxTdO9LcJkxNZtkBqglw>
 <xmx:A7nQYDmAel22Ujba2J8oW-uql-ZPSpF8jiA3qVkXvvatho5qsQyMw2SyYFg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jun 2021 12:06:24 -0400 (EDT)
Date: Mon, 21 Jun 2021 18:06:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/vc4: dsi: Only register our component once a DSI
 device is attached
Message-ID: <20210621160621.7p7fa7f5m4gct4o2@gilmour>
References: <20200707101912.571531-1-maxime@cerno.tech>
 <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
 <CAPY8ntC+hzmfrJwWW0ytNdHSXruMKMi7N3K6tdJbp9gDBbJ3Qw@mail.gmail.com>
 <YM+MEsKjdkYAVI5X@pendragon.ideasonboard.com>
 <YM/FwVkkQXX8VrzV@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gqndglrex34izxzw"
Content-Disposition: inline
In-Reply-To: <YM/FwVkkQXX8VrzV@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Eric Anholt <eric@anholt.net>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gqndglrex34izxzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 21, 2021 at 01:48:33AM +0300, Laurent Pinchart wrote:
> Then, when running kmstest --flip, I get one warning per frame:
>=20
> [   29.762089] [drm:vc4_dsi_runtime_resume] *ERROR* vc4_dsi_runtime_resum=
e:
> [   29.763200] [drm:vc4_dsi_runtime_resume] *ERROR* vc4_dsi_runtime_resum=
e: All good
> [   29.793861] ------------[ cut here ]------------
> [   29.798572] WARNING: CPU: 2 PID: 249 at drivers/gpu/drm/drm_modeset_lo=
ck.c:246 drm_modeset_lock+0xd0/0x100
> [   29.808365] Modules linked in: ipv6 bcm2835_codec(C) bcm2835_unicam bc=
m2835_v4l2(C) bcm2835_isp(C) bcm2835_mmal_vchiq(C) v4l2_mem2mem v4l2_dv_tim=
ings imx296 rtc_ds1307 videobuf2_vmallom
> [   29.855284] CPU: 2 PID: 249 Comm: kworker/u8:10 Tainted: G         C  =
      5.10.44-v8+ #23
> [   29.863756] Hardware name: Raspberry Pi Compute Module 4 Rev 1.0 (DT)
> [   29.870297] Workqueue: events_unbound commit_work
> [   29.875077] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=3D--)
> [   29.881172] pc : drm_modeset_lock+0xd0/0x100
> [   29.885506] lr : drm_atomic_get_new_or_current_crtc_state+0x6c/0x110
> [   29.891950] sp : ffffffc011fcbcb0
> [   29.895308] x29: ffffffc011fcbcb0 x28: ffffff80403fe780
> [   29.900705] x27: ffffff80415a2000 x26: ffffffc0106f0000
> [   29.906100] x25: 0000000000000000 x24: ffffff80420d3c80
> [   29.911495] x23: ffffff8042174080 x22: 0000000000000038
> [   29.916890] x21: 0000000000000000 x20: ffffff80421740a8
> [   29.922284] x19: ffffffc011f8bc50 x18: 0000000000000000
> [   29.927678] x17: 0000000000000000 x16: 0000000000000000
> [   29.933072] x15: 0000000000000000 x14: 0000000000000000
> [   29.938466] x13: 0048000000000329 x12: 0326032303290320
> [   29.943860] x11: 03200000020301f4 x10: 00000000000019e0
> [   29.949255] x9 : ffffffc0106efd8c x8 : ffffff804390d5c0
> [   29.954649] x7 : 7fffffffffffffff x6 : 0000000000000001
> [   29.960043] x5 : 0000000000000001 x4 : 0000000000000001
> [   29.965436] x3 : ffffff80415a2000 x2 : ffffff804199b200
> [   29.970830] x1 : 00000000000000bc x0 : ffffffc011f8bc98
> [   29.976225] Call trace:
> [   29.978708]  drm_modeset_lock+0xd0/0x100
> [   29.982687]  drm_atomic_get_new_or_current_crtc_state+0x6c/0x110
> [   29.988781]  vc4_atomic_complete_commit+0x4e4/0x860
> [   29.993729]  commit_work+0x18/0x20
> [   29.997181]  process_one_work+0x1c4/0x4a0
> [   30.001248]  worker_thread+0x50/0x420
> [   30.004965]  kthread+0x11c/0x150
> [   30.008239]  ret_from_fork+0x10/0x20
> [   30.011865] ---[ end trace f44ae6b09cda951a ]---
>=20
> Does it ring any bell ?
>=20
> In case this is useful information, the problem didn't occur on top of
> commit e1499baa0b0c.

I think I have a fix here:
https://github.com/raspberrypi/linux/pull/4402

I haven't tested kmstest --flip yet though

maxime

--gqndglrex34izxzw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNC4/QAKCRDj7w1vZxhR
xYyEAQCy/BZPAlI01MnMokEfDCfkC22y22hNLHIrrSmp1ziwZAEAhGNfhNt6asvf
0sGYJXEY3sgIxabtRpC5oJALpGfxegE=
=6rfN
-----END PGP SIGNATURE-----

--gqndglrex34izxzw--
