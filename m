Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FC559CA4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 16:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B749C10E12A;
	Fri, 24 Jun 2022 14:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 671 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jun 2022 14:46:39 UTC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618D10E12A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:46:39 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE6514000D;
 Fri, 24 Jun 2022 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656081997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2QzchmONwTzPfLJQojEaSuoBpphe4iTkr7b8+dO3nG8=;
 b=bnewBukl9Kx8dcWGHh2reToQpME9dbJ2WTDzSIoKJbgl/ez3RmrL5swaTlJ+PAgYjapVCD
 8dl9Xpsnj4YLp7d0VkncTmPBttl2+t02FBBvn8blOlPlhNQC1tU5AkXjAwQb0E5iOvmVmK
 n0Z2QNJg2ptY3OCbUS9JZOiG0wjfuF1c1prK92nWkOXfCFxPzsVXx+i6S/CEW6RJlsWPZF
 7uUxECdfowVHiAzjW853yMcUjVDB4Y3LZ6a8MLEYcEjKqdraTZvww0+nntwBM/Q9CnMO1Y
 lM8QkvD0K52hNRAfHc/hyUZz+TFLT7l7zqNY8X/eW3j8rt5QHB2A2Kz0ne51tw==
Date: Fri, 24 Jun 2022 16:46:36 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm: logicvc: Fix uninitialized variable in probe
Message-ID: <YrXOTAR6koA1b8XJ@aptenodytes>
References: <Yqh6OfSiPFuVrGo4@kili> <YrXLrVUIavGWC4sx@aptenodytes>
 <20220624143717.tykkcznvzq5e5qz2@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SOpWuwT3AEi/BzGX"
Content-Disposition: inline
In-Reply-To: <20220624143717.tykkcznvzq5e5qz2@houat>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--SOpWuwT3AEi/BzGX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 24 Jun 22, 16:37, Maxime Ripard wrote:
> Hi,
>=20
> On Fri, Jun 24, 2022 at 04:35:25PM +0200, Paul Kocialkowski wrote:
> > On Tue 14 Jun 22, 15:08, Dan Carpenter wrote:
> > > The "regmap" is supposed to be initialized to NULL but it's used
> > > without being initialized.
> > >=20
> > > Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display contro=
ller")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > Nice catch, thanks a lot!
> >=20
> > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> Since you have the commit rights to drm-misc, you should apply it

Absolutely, I'm on my way to doing that.

Do I need to reply to the emails with a message indicating that I merged th=
em
or is using the tool sufficient?

Thanks,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--SOpWuwT3AEi/BzGX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1zkwACgkQ3cLmz3+f
v9HLuwf/e4518vP5Xi07cO4xiv0Ku8S4/5NWxpTr3QxM7Bh/5T5E0/SUtKN7arFt
zP3E6DCkLyXG+BRJH0NR/OE3XezGM+IBtdulv4vWhA5kVObxF5xyMhs/2Avycsnb
TGhEc+fuAP5qcod+vIF0C2mIoDo/ElgOYjWu0rWcJpsbgJiyBQOqaUhnwAMKmpOE
iDmeH5qEflfqcgfXZq5RNa+prEieNq2O5FBqjIu1PHiZ9XtmOpc6nqjWcaSwHLd1
wAI5OXDmIHtxSKkynAnBzY3TQMvWZDouksiIZLN0iE9vn3IVs3s4LNAPQ7gFdVTR
vYY47D6Q/Nso2IWUsbAcDYhiIZdNag==
=f/rj
-----END PGP SIGNATURE-----

--SOpWuwT3AEi/BzGX--
