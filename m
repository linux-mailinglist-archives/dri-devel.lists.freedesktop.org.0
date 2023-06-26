Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7F673DF4D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77310E1F5;
	Mon, 26 Jun 2023 12:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF79010E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:32:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23A2660DDA;
 Mon, 26 Jun 2023 12:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFD6C433C8;
 Mon, 26 Jun 2023 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687782768;
 bh=PMdxZz5qL+jhXPsf8WGfulRQw6kJj+3NRGMJdH8CM1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ldxkDhYoNHwPMLK8oEyeK+i8l5vEeFyWEEKkgANLLC4QM+ws1JvmIxbrY+bFhWdgX
 QYxC2L/lC1ltXrXtMKPE1p2rwtCa1qCWEGSTE/1++ZIQWLwFp+Y3hb/kvuSwMuAYTb
 Rh7W9tXsNCmSctIBBW36yIkndIQNj3iF3GsTPx8a4ee2Ew9WYzZj/u0S9C0clMTdIm
 UuvAwIjZ/7HNTqTzGjWt6zl9rIEwe1ZZ3W71t1W9GcfCpb2OvYSXQ+oR7rlAeMVr8G
 em757BfKY7m0+Jo4yOzgZx7AQKHJPDotNtMKnO3wjg7+cP32l4UBac3tayX6eaQHHo
 wvt0DbZ31xFvQ==
Date: Mon, 26 Jun 2023 14:32:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/drm_gem.c: remove surplus else after return clause
Message-ID: <ixkyytoxpsnw3ffumacdyyoj4qbs3zqob73oj6hzuzuwi25axm@roghs7ruhnik>
References: <20230314125305.2278964-1-15330273260@189.cn>
 <cde47fd0-a8e4-36cf-3f0b-a1b473799db3@loongson.cn>
 <163af01e-01cc-008d-333f-964cba9f9130@suse.de>
 <670a1763-181a-0133-9b31-b790072b3af8@loongson.cn>
 <c2bdf8ea-b770-23a1-222b-1791ab0e3cec@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nhuitd5mtowkcj4k"
Content-Disposition: inline
In-Reply-To: <c2bdf8ea-b770-23a1-222b-1791ab0e3cec@suse.de>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 liyi <liyi@loongson.cn>, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nhuitd5mtowkcj4k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 20, 2023 at 06:18:31PM +0200, Thomas Zimmermann wrote:
> Am 20.06.23 um 18:06 schrieb Sui Jingfeng:
> > Hi,
> >=20
> > On 2023/6/20 22:43, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 20.06.23 um 06:08 schrieb Sui Jingfeng:
> > > > ping ?
> > > >=20
> > > > On 2023/3/14 20:53, Sui Jingfeng wrote:
> > > > > =A0 else is not generally useful after return
> > >=20
> > > No indention please.
> > >=20
> > OK, will be fixed at the next version.
> > > > >=20
> > > > > Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> > > > > ---
> > > > > =A0 drivers/gpu/drm/drm_gem.c | 7 ++++---
> > > > > =A0 1 file changed, 4 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > > index a6208e2c089b..364e3733af98 100644
> > > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > > @@ -1150,8 +1150,8 @@ int drm_gem_pin(struct drm_gem_object *obj)
> > > > > =A0 {
> > > > > =A0=A0=A0=A0=A0 if (obj->funcs->pin)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return obj->funcs->pin(obj);
> > > > > -=A0=A0=A0 else
> > > > > -=A0=A0=A0=A0=A0=A0=A0 return 0;
> > > > > +
> > > > > +=A0=A0=A0 return 0;
> > >=20
> > > This change is ok.
> > >=20
> > > > > =A0 }
> > > > > =A0 void drm_gem_unpin(struct drm_gem_object *obj)
> > > > > @@ -1172,7 +1172,8 @@ int drm_gem_vmap(struct drm_gem_object
> > > > > *obj, struct iosys_map *map)
> > > > > =A0=A0=A0=A0=A0 ret =3D obj->funcs->vmap(obj, map);
> > > > > =A0=A0=A0=A0=A0 if (ret)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > > -=A0=A0=A0 else if (iosys_map_is_null(map))
> > > > > +
> > > > > +=A0=A0=A0 if (iosys_map_is_null(map))
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
> > >=20
> > > This is not correct. Calling iosys_map_is_null() is part of handling
> > > the return value from vmap, so the else is fine.
> > >=20
> > Are you serious ?
> >=20
> >=20
> > 1. Before apply this patch:
> >=20
> >=20
> > If the 'ret' is 0,=A0 it stand for obj->funcs->vmap() is successful, th=
en
> > if (iosys_map_is_null(map)) will be run.
> >=20
> > If the 'ret' is NOT 0, then it return immediately.
> >=20
> >=20
> > 2. After apply this patch:
> >=20
> >=20
> > If the 'ret' is NOT 0, it stand for obj->funcs->vmap() failed, then it
> > return immediately.
> >=20
> > If the 'ret' is 0, it stand for obj->funcs->vmap() is successful, then
> > the check if (iosys_map_is_null(map))
> >=20
> > will be run!
> >=20
> >=20
> > I feel strange about the core here, I think the check ' if
> > (iosys_map_is_null(map))' is not needed,
> >=20
> > the implement should responsible to handle all of possible errors.
>=20
> The ->vmap() callback can succeed with ret=3D0, but we still have no memo=
ry.
> Then we return -ENOMEM. The call to _is_null(map) is part of the error
> handling for ->vmap(). That is a bit strange, but it as always worked like
> that. Keeping all error handling in the same if-else block make all this
> more obvious.

Reading that patch, it wasn't obvious to me at all and could have made
the same patch.

Could we add a comment maybe to make it more obvious?

Maxime
--nhuitd5mtowkcj4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJmFbAAKCRDj7w1vZxhR
xbcIAP9lHreCUuEV75swV320YyYwr/FisLJs9q8J2rnSKBQ6LQD9EkY/p+lPEhZ3
S7V0PkreeLMuu7VXMtoUPuP5IzjLFgI=
=yoW7
-----END PGP SIGNATURE-----

--nhuitd5mtowkcj4k--
