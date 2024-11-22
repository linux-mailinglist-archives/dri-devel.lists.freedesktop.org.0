Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529419D5BA0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2D410EB1A;
	Fri, 22 Nov 2024 09:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gc3EMrcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C181310EB17;
 Fri, 22 Nov 2024 09:14:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0C385C59B7;
 Fri, 22 Nov 2024 09:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5221C4CED3;
 Fri, 22 Nov 2024 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732266853;
 bh=Ktrx65spKXltoQXr+YKWmD/fL+YZPBtostbDU2x3DlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gc3EMrcJ+ZUHThH/iajokWT6M0BHeWSiisBQLchYUVwXhUrR4RgiwgK5+2tmGT1R+
 ZHV3bc0uJHrmiLAZeduvQthTcdCMsBvaUlNvzcOcaCjYXiUXGviGrcf10yDAfcQdZ/
 dF+pdvXqLJszH44db0qHtgomE6T8uccPxDcAxfCtAQLfCBcLDFtt0Z1HGZhHj/EBUL
 SU+cKUS42IKejUFIOH0a5D9MXNXSWtEOoqIYdB6AGik+EOcY/suhJSJgCJu+zRla96
 Ue809U1PVz+1JCQ25aOwdSnQzpEF3ooK4uiQZ7N6owri/kx2zyqQqqeVk5/ynucAtA
 yhikCHGFemKhw==
Date: Fri, 22 Nov 2024 10:14:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Liviu Dudau <liviu@dudau.co.uk>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 hjc@rock-chips.com, 
 heiko@sntech.de, andy.yan@rock-chips.com, dim-tools@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <20241122-beneficial-married-wolverine-90ca8c@houat>
References: <deeef745-f3fb-4e85-a9d0-e8d38d43c1cf@linux.intel.com>
 <20241118150816.GA3706736@thelio-3990X>
 <Zzy9Afen1GhV/DHm@bart.dudau.co.uk>
 <20241119214915.GA848207@thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wkfkhmqbabvp7mx6"
Content-Disposition: inline
In-Reply-To: <20241119214915.GA848207@thelio-3990X>
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


--wkfkhmqbabvp7mx6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PULL] drm-misc-next
MIME-Version: 1.0

On Tue, Nov 19, 2024 at 02:49:15PM -0700, Nathan Chancellor wrote:
> On Tue, Nov 19, 2024 at 04:29:53PM +0000, Liviu Dudau wrote:
> > On Mon, Nov 18, 2024 at 08:08:16AM -0700, Nathan Chancellor wrote:
> > > On Thu, Oct 31, 2024 at 02:41:38PM +0100, Maarten Lankhorst wrote:
> > > > Cristian Ciocaltea (3):
> > > >       drm/rockchip: Add basic RK3588 HDMI output support
> > >=20
> > > Can someone please apply [1] to resolve a link time failure seen with
> > > 32-bit clang builds? I am still seeing it in -next and my ping on the
> > > patch does not appear to be seen...
> > >=20
> > > [1]: https://lore.kernel.org/20241018151016.3496613-1-arnd@kernel.org/
> >=20
> > Pushed to drm-misc-next.
>=20
> Thank you! Is there going to be another pull request from drm-misc-next
> into drm-next for 6.13? I suspect not, so I believe this fix needs to be
> cherry-picked into drm-misc-next-fixes, as the problematic change is
> already in drm-next.

Applied to drm-misc-next-fixes. It'll be part of our PR next week for
Linus, and should be in next tomorrow.

Sorry

Maxime

--wkfkhmqbabvp7mx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0BLYgAKCRAnX84Zoj2+
dvH1AYCRPNbyaUmAlprNmKJl7JL/MrUMJ4RsfpRHuAYMZLGWoXVcexpcT4I+i4nj
fKgaIowBgKJDP4Axp1py2MD2lpBL1LhbaFe7ah0D5UG7azI0C6z7/XDQMGH7D632
b2JBaVpi9A==
=5WKy
-----END PGP SIGNATURE-----

--wkfkhmqbabvp7mx6--
