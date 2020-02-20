Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C071669FE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35976EE73;
	Thu, 20 Feb 2020 21:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086B76EE73
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:39:41 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A726B206F4;
 Thu, 20 Feb 2020 21:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582234780;
 bh=AOlr7jf3K/FXgrKq5OzsFq48ildvnnOdsWivZsmBing=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T8ky0dtlTbGuKYw5j4CVVCNzL0ffAwl07PXy8MqqGJLEFjyTGrqOTW54YWXGpww2i
 npRXEPJ5iGG7IzFvdlX34j4kBwen/W6o0OiyEFVWgZOvrjnB87eQXqqiu+oeyphTvw
 hsqE5h9C8pozUC54goRAftDVKj3CeU75oaK058dE=
Received: by earth.universe (Postfix, from userid 1000)
 id 382AC3C0C83; Thu, 20 Feb 2020 22:39:38 +0100 (CET)
Date: Thu, 20 Feb 2020 22:39:38 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 49/51] drm/omap: dss: Remove unused omap_dss_device
 operations
Message-ID: <20200220213938.4rbbkn7pax6ywbnk@earth.universe>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
 <20200216210308.17312-50-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200216210308.17312-50-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: multipart/mixed; boundary="===============1276931400=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1276931400==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cobsf6dcbhkjpsz3"
Content-Disposition: inline


--cobsf6dcbhkjpsz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 16, 2020 at 11:03:06PM +0200, Laurent Pinchart wrote:
> The omap_dss_device .pre_enable(), .post_disable() and .set_timings()
> are not used anymore. Remove them.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Actually it would be good to postpone this patch a bit, since=20
I need those functions as intermediate step for converting DSI
code (I'm currently rebasing my series on yours).

-- Sebastian

--cobsf6dcbhkjpsz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5O/JcACgkQ2O7X88g7
+pobFhAAhTB6z9zaSXnfzF778K0j55ZFv3PluMVmB+8aBnjDHYyNxMq9/GittIpf
c+Su/bCSDVyxZlNoII98rvUL4E5FV5oR0/obge6XjqnvOZ6rV8wlEIDERMq1GaLu
APjxIfc5ZEiEmJloOBZmfWCYmvvnnu85eDJjl1toEh86Z8PFnxbopsBLQq+Sc+cz
OxoUbaaM55fMQSCbJvA0mISDB7ssWe4mMjaHl4IH+ERniZtNm2VvNtz2Oq5NMmUM
PE38c3gbSpoYC2JBb6e+bZsoUEDOe7j55TbUim2bHIMmlSyOCN/WT/2xmuUZejWy
bWhnLelCX2q77rcqgiv5ujwh6+jJgpK5DgeJP6mbPgNNpTpZNe5UrXYcJQWwRCDG
fAo+aWpvHKdNt1Ik6MhH+rJa9OJBhbS+8nuLxRToPURXN3mSDWGDAYp5EJoxdtoa
dmA0mEdjf6rIWGBBWQqK0Q8/UGG0xAw5EW/veGJwLSvNMX9VwRQ0u1CWNTupo1aw
IlMiajB11YC1n3lDVI1lP0npMp60kBalepEYCUSldQTXwyav2snWQD42fcgMI9Ss
Hfz/5l/YxwJFYvR2rQw4vWz3cqTsvVxQbblInU9tOOTh/o7Gz75WQFgGtm+Gteb/
HEKPdgVOHWjwJnxv0MIkZJeOmH810i1SDp5IfVkDxNDW7LBC92A=
=J2gP
-----END PGP SIGNATURE-----

--cobsf6dcbhkjpsz3--

--===============1276931400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1276931400==--
