Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8C559D3B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 17:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39F110E250;
	Fri, 24 Jun 2022 15:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7456D10E27C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 15:25:05 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 597A2200008;
 Fri, 24 Jun 2022 15:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656084303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ah9Guq9sVOhK1akYWfj2KUeC+akdxxVJl9dp1GDBNU=;
 b=POAhcEkE3xV6/f+A6z8Cq1fjuGW0jefiDXthAcHa7mlr1lxHd7f0mTSfEcP1yqWE9fUZ8g
 W2oppdYGeBLX7UyBih7u7BfR/mm4P+cvlFRMOtf5v8gNi2MM0tjnHrG8E7CyCXxwg1diFf
 Hjci6jHEEFQuObl6q52c18rzPOuwWu2fBqsx3nmyyilDw/zs1ppvElTis9rvqDrNPnOXal
 sCRlRdYA+odbYCtFUxfyKuzBcZ33Z2OEo8eALIKmJlxjB5nAR2p+RbMo2VXhbG2SMeS3EA
 Z51zrbWxIpjc/7ez9hcmEZVhxklWIL4Las4YzCDLfIM+Dp+RYOofLtfq4zMyIg==
Date: Fri, 24 Jun 2022 17:25:02 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: logicvc: Fix uninitialized variable in probe
Message-ID: <YrXXTtOdAMex4UFc@aptenodytes>
References: <Yqh6OfSiPFuVrGo4@kili>
 <YrXLrVUIavGWC4sx@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VYlOOEfoKFRFhdQ2"
Content-Disposition: inline
In-Reply-To: <YrXLrVUIavGWC4sx@aptenodytes>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--VYlOOEfoKFRFhdQ2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 24 Jun 22, 16:35, Paul Kocialkowski wrote:
> Hi Dan,
>=20
> On Tue 14 Jun 22, 15:08, Dan Carpenter wrote:
> > The "regmap" is supposed to be initialized to NULL but it's used
> > without being initialized.
> >=20
> > Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controll=
er")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Nice catch, thanks a lot!
>=20
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Pushed to drm-misc-next, thanks!

Paul

> Cheers,
>=20
> Paul
>=20
> > ---
> >  drivers/gpu/drm/logicvc/logicvc_drm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/lo=
gicvc/logicvc_drm.c
> > index df1805cf0f95..0b983a33f9ff 100644
> > --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> > +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> > @@ -298,7 +298,7 @@ static int logicvc_drm_probe(struct platform_device=
 *pdev)
> >  	struct logicvc_drm *logicvc;
> >  	struct device *dev =3D &pdev->dev;
> >  	struct drm_device *drm_dev;
> > -	struct regmap *regmap;
> > +	struct regmap *regmap =3D NULL;
> >  	struct resource res;
> >  	void __iomem *base;
> >  	int irq;
> > --=20
> > 2.35.1
> >=20
>=20
> --=20
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--VYlOOEfoKFRFhdQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1104ACgkQ3cLmz3+f
v9Hm4Qf9HercPXzmBZcqVWxopvsJO0efqPoHeCi5DfSFDYMjwGt6WH8yKImLlB94
OlKAyLlEgWez+QstD6x1GH6iCB60J6IFc1XN+ITXYgvcOc0CCbC8KpyqhsBTjnRM
zOBLz2k7sPZY6ctO+KviLM12W/I61z92CUvqSHxt3hai18LMSreGwjJFSBBLJ+Oo
R91iQbd0y5LdV6+0ch/W0zwumkVWGxdUUVg1BeGEGWBftAU6ic+89k+H360v3OWh
WBg+mFtw8HCrs2Kd59q5UQb9otGd5hI4oVzcThYt7d1jOUi2boyVE18nYA9+C267
3fggYFkJ6yeCrUrNK5bxqfAtMTgFtg==
=LAzp
-----END PGP SIGNATURE-----

--VYlOOEfoKFRFhdQ2--
