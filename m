Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1DD239CDF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 00:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1DC89FA0;
	Sun,  2 Aug 2020 22:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2050A89FA0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 22:48:33 +0000 (UTC)
Received: from earth.universe (unknown [185.213.155.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E2332083B;
 Sun,  2 Aug 2020 22:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596408512;
 bh=k4gm9OOTMgavfyeGdzFhdQx2WD5tKDe0Vrnh+3mA0bY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wCrKxAAigGpUB3/sQ8qmxvQESPTkJN40Is6ieH8PMpebniizrxwsA72rLlclbxQU3
 Dycyf60/1+5wueflmluDocURjbNhr0FwEE4R5lBc86Rkp4/+UC/1xtdaIwEOuP556Z
 xpGYjTIrkx5aBmuOvtZNTW9U1q6+LHWMYXinI4dQ=
Received: by earth.universe (Postfix, from userid 1000)
 id 6E72A3C0B95; Mon,  3 Aug 2020 00:48:30 +0200 (CEST)
Date: Mon, 3 Aug 2020 00:48:30 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 21/22] drm/omap: display: Backlight update
Message-ID: <20200802224830.lxsk5lybdbxk4l3t@earth.universe>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-22-sam@ravnborg.org>
 <20200802142605.ih6hwhnjxnqhaflt@earth.universe>
 <20200802143207.GA1175585@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200802143207.GA1175585@ravnborg.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Zheng Bin <zhengbin13@huawei.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============0116241191=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0116241191==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufj3vmlrjscuwjfw"
Content-Disposition: inline


--ufj3vmlrjscuwjfw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Aug 02, 2020 at 04:32:07PM +0200, Sam Ravnborg wrote:
> On Sun, Aug 02, 2020 at 04:26:05PM +0200, Sebastian Reichel wrote:
> > On Sun, Aug 02, 2020 at 01:06:35PM +0200, Sam Ravnborg wrote:
> > > - Introduce backlight_{enable/disable)
> > > - Use get/set methods for backlight_properties
> > > - Drop redundant get_brightness() implementation
> > >   The default implementation return the current brightness value
> > > - Use macro for backlight initialization
> > >=20
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Zheng Bin <zhengbin13@huawei.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > ---
> > >  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 35 ++++-------------=
--
> > >  1 file changed, 6 insertions(+), 29 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/driver=
s/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > > index 3484b5d4a91c..433e240896b3 100644
> > > --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > > +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > > @@ -110,15 +110,10 @@ static void dsicm_bl_power(struct panel_drv_dat=
a *ddata, bool enable)
> > >  	else
> > >  		return;
> > > =20
> > > -	if (enable) {
> > > -		backlight->props.fb_blank =3D FB_BLANK_UNBLANK;
> > > -		backlight->props.state =3D ~(BL_CORE_FBBLANK | BL_CORE_SUSPENDED);
> > > -		backlight->props.power =3D FB_BLANK_UNBLANK;
> > > -	} else {
> > > -		backlight->props.fb_blank =3D FB_BLANK_NORMAL;
> > > -		backlight->props.power =3D FB_BLANK_POWERDOWN;
> > > -		backlight->props.state |=3D BL_CORE_FBBLANK | BL_CORE_SUSPENDED;
> > > -	}
> > > +	if (enable)
> > > +		backlight_enable(backlight);
> > > +	else
> > > +		backlight_disable(backlight);
> > > =20
> > >  	backlight_update_status(backlight);
> >=20
> > backlight_update_status() is already called by backlight_enable/disable.
>=20
> Right, thanks.
> Dropped in v2.
>=20
> Let me know if you already have a similar patch and if I shall
> drop this.

I did not touch the backlight bits and I can easily rebase my patches. I th=
ink
this should be kept.

> It would be nice to have the panel parts of omapdrm migrated in
> this cycle. I recall you have 50+ patches pending.

I plan to send only the first part and go step by step.

-- Sebastian

--ufj3vmlrjscuwjfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl8nQrsACgkQ2O7X88g7
+pr8bxAAninlST+fVFd4gXQLEep4F1TxU0OzzlWzLo4zm0CqPIMWSQtZRfhpmZy7
94S4FWd5qZw2KJDyVVKSUqNsQxReH0/TsYAmhIxa786Z4jI+4gbxesDIXEULRRVm
QupxyfsFQlerjvdtfK1MIeSLRWGzC+29xV7vbk4HA2OGzMKPX9nSxX7eoysUQ1ud
Yg3QrxJALkL+waaX9plko9H6zYEMCNRcz21HB/3NKyqQVFA8/PBVv2OAO4bu0Bbm
YgmINQonyZ4cIVSveNX92LgxG1VqaOXymI+GGtOBM1EVL1WklHKXXPZSdopFnIzd
ejlIP6BABPsN3gQ9JcaqAUvoFcTd/bfBTiLDqY/WSeHZILDlz3483C3YuXCj/QA3
Pg7a262UCV9ZcYi3nRBhpKF8FLw5UD9efdeztWfXo4O4L+rPY59k4w+jO7DS/58K
olaLGkOWFmxt8PFm0CF71q2XiH2UfeGr5H0lOJ7EkO8D9bCGmEvpvRnFN6zCcPMU
WdHlcXeB701iQJaNU+G4KAkcDjq6T8VUcLo+xYMasqgQpdJwytaJR/Qb2y1jU2O/
2HQrFcuSdojnPHrOw5kCWo37hLY2KUW4DqtK91Md4X7Spmc1rzabZLjrCTPGUtsy
9pZ+Y7ISCKJ2hNI3TzLKXS7qY5atK0OgbLJUMXmsxGWIECLgtMs=
=oQt2
-----END PGP SIGNATURE-----

--ufj3vmlrjscuwjfw--

--===============0116241191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0116241191==--
