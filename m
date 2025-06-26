Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D64AE9AAC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 12:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9F910E27C;
	Thu, 26 Jun 2025 10:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vo6l5QvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F48B10E27C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 10:04:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D59761AE0;
 Thu, 26 Jun 2025 10:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825B1C4CEEE;
 Thu, 26 Jun 2025 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750932261;
 bh=zCP8+haUsgajLpG9GHi1Yt0aYIxCMRg7RaznIp2uslE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vo6l5QvCYeKcxOrxHm6UJ9KbXPj6pGnXW9J14/CRHr6D9ZCLK7RQDyv3QvVL/eiW1
 rzfs1SzEXCA+0UGTr1XByoc+lqB6l65XcEwu4xpIBXWpX/q8RLBtUZUKSIbJGEAbBf
 0bOYp2yk22KrVdZV0sO/2GNyg7c0dEa6iuZgUnHyYgJy9v0hxEvrQYFiLv7kJv4Lb/
 kEVCTP/GLTWt+iG0GSeS57snL9ZlciCVA3fUDiFMbRAhFJIGgsQNGHs/t+Vj8iQtt9
 nGHPEst6K8JsLTumIfJJkadybyN+DCt3bAdeVuVpwDTwd1f3rTteqUM6JC37n7vzQv
 hctZ8T2fl6RNg==
Date: Thu, 26 Jun 2025 12:04:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <20250626-radiant-corgi-of-prowess-9a3aab@houat>
References: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
 <aF0SBNGmTpgtBTC3@gaggiata.pivistrello.it>
 <aF0UUBQFAu9GUde0@gaggiata.pivistrello.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vi6tlw5lpgixe2df"
Content-Disposition: inline
In-Reply-To: <aF0UUBQFAu9GUde0@gaggiata.pivistrello.it>
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


--vi6tlw5lpgixe2df
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
MIME-Version: 1.0

On Thu, Jun 26, 2025 at 11:35:12AM +0200, Francesco Dolcini wrote:
> On Thu, Jun 26, 2025 at 11:25:24AM +0200, Francesco Dolcini wrote:
> > On Wed, Jun 25, 2025 at 08:48:37AM +0200, Maxime Ripard wrote:
> > > Here's a series fixing (hopefully) the panel-simple regression for
> > > panels with a panel-dpi compatible.
> > >=20
> > > It's only build tested, so if you could give that series a try
> > > Francesco, I'd really appreciate it.
> >=20
> > It does not build for me, applied on top of commit ee88bddf7f2f ("Merge=
 tag
> > 'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf")
> >=20
> >   SYNC    include/config/auto.conf.cmd
> >   CALL    scripts/checksyscalls.sh
> >   CC      drivers/gpu/drm/drm_of.o
> >   CC [M]  drivers/gpu/drm/panel/panel-simple.o
> >   AR      drivers/gpu/drm/built-in.a
> >   AR      drivers/gpu/built-in.a
> >   AR      drivers/built-in.a
> >   AR      built-in.a
> >   AR      vmlinux.a
> >   LD      vmlinux.o
> >   OBJCOPY modules.builtin.modinfo
> >   GEN     modules.builtin
> >   GEN     .vmlinux.objs
> >   MODPOST Module.symvers
> > ERROR: modpost: "mipi_dsi_bus_type" [drivers/gpu/drm/panel/panel-simple=
=2Eko] undefined!
> > make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> > make[1]: *** [/home/francesco/Toradex/sources/linux/Makefile:1953: modp=
ost] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> > [Exit 2]
> >=20
>=20
> The issue is that I do not have CONFIG_DRM_MIPI_DSI. Adding it the build
> finishes, and it also fixes the issue.

Thanks! I've been able to reproduce, and I'll send a new version in a
couple of minutes.

Maxime

--vi6tlw5lpgixe2df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaF0bIgAKCRAnX84Zoj2+
dpw3AX4xiV4PYsblJakhkPwTl6lZXGBYC4lK87wDW/K/GFjL6o8I+r1OMlgCCmcv
/jrkVMsBf1Y/BsQi5a1l2X2Yvyyw5xDT/OKiEN5nrxr+ZbQePQY4dhevisKhEGJr
hwY1inXvvQ==
=HzPm
-----END PGP SIGNATURE-----

--vi6tlw5lpgixe2df--
