Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EBF3761C9
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 10:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2CE6E135;
	Fri,  7 May 2021 08:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14C86E135
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 08:20:36 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1levis-0001mt-7n; Fri, 07 May 2021 10:20:34 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1levir-0003Zc-J2; Fri, 07 May 2021 10:20:33 +0200
Date: Fri, 7 May 2021 10:20:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] video: fbdev: imxfb: Fix an error message
Message-ID: <20210507082033.ihp2ozulam72wezw@pengutronix.de>
References: <d7b25026f82659da3c6f7159eea480faa9d738be.1620327302.git.christophe.jaillet@wanadoo.fr>
 <20210507050503.iwrcis2xzhjjthmp@pengutronix.de>
 <5cd9c8de-acd9-9594-38a0-62ecf5734c10@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k6uy7cv4js3qqvsf"
Content-Disposition: inline
In-Reply-To: <5cd9c8de-acd9-9594-38a0-62ecf5734c10@wanadoo.fr>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, s.hauer@pengutronix.de,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, j.beisert@pengutronix.de, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--k6uy7cv4js3qqvsf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

[dropping krzysztof.h1@poczta.fm from recipents, the address doesn't
seem to exist]

On Fri, May 07, 2021 at 09:11:19AM +0200, Christophe JAILLET wrote:
> Le 07/05/2021 =E0 07:05, Uwe Kleine-K=F6nig a =E9crit=A0:
> > On Thu, May 06, 2021 at 08:57:05PM +0200, Christophe JAILLET wrote:
> > > 'ret' is known to be 0 here.
> > > No error code is available, so just remove it from the error message.
> > >=20
> > > Fixes: 72330b0eeefc ("i.MX Framebuffer: Use readl/writel instead of d=
irect pointer deref")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   drivers/video/fbdev/imxfb.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> > > index 7f8debd2da06..ad598257ab38 100644
> > > --- a/drivers/video/fbdev/imxfb.c
> > > +++ b/drivers/video/fbdev/imxfb.c
> > > @@ -992,7 +992,7 @@ static int imxfb_probe(struct platform_device *pd=
ev)
> > >   	info->screen_buffer =3D dma_alloc_wc(&pdev->dev, fbi->map_size,
> > >   					   &fbi->map_dma, GFP_KERNEL);
> > >   	if (!info->screen_buffer) {
> > > -		dev_err(&pdev->dev, "Failed to allocate video RAM: %d\n", ret);
> > > +		dev_err(&pdev->dev, "Failed to allocate video RAM\n");
> > >   		ret =3D -ENOMEM;
> > >   		goto failed_map;
> > >   	}
> >=20
> > Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > Are you using this driver, or did you find that problem using some
> > static checker?
>=20
> No, I'm not using this driver AFAIK.

OK, thanks. (We're working on a DRM driver for this hardware. So you
could have been an interested tester.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k6uy7cv4js3qqvsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCU+E4ACgkQwfwUeK3K
7AkjAAgAnt/sPpkqRLMXAau9y9HiswDIt+I8Pdi7OOyx53eECYY1KD+2Lo9YSg6I
8bnnHAEmSLebkh98Wb83wa61xTi7t66L/MtIjPY+aYjg7AFWiXNmbFVQLgmXeobc
L9bsN2CwMZtCsu50jJt6vVIgWrg5Ddzn7/9oiGCQNlCmSX16dmKQepIxnzEOuima
XWxQrAsctEYpn7ms0MnTqVruHFKGs7jFyA0K9MQN8FD8odvLXE3/VQhmXmpCpAKY
wm4LEJlqsfoasRQa1pevm5iHksq6YBNEtVOs9r6r9rLkUydHbaJLWydO/3k3Sj4S
7sKqBYyFG144lPJarkg5E77+61g39g==
=tg7t
-----END PGP SIGNATURE-----

--k6uy7cv4js3qqvsf--
