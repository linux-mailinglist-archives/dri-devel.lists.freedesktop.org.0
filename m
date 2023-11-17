Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5C7EEDA0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DA710E2EF;
	Fri, 17 Nov 2023 08:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2EE10E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 08:40:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BBB861BFE;
 Fri, 17 Nov 2023 08:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D45C433C8;
 Fri, 17 Nov 2023 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700210410;
 bh=QS544dptcJn8anCfGyKc1y1SkULMRBmzWjjmtBErnJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mgLdAQltW+dFFZm6S9QyMy0dBWlLDX9jED1RYqxal5kb9BNp5WjDE5YlaR0qv4aM6
 yQtLCZgfbWLpWYz8/hhZXrx+AN7yJK59kEQ5nUkLESU9xSlUyIHtJhVTYYebmynOyq
 KQBVO1VH43HsKJnHCIaqzlTWMfxC17bX52SXkkQEQuKBzMQ+OGIX+VSL2289AmUmaj
 0iTYvKwYY4PhK8DX0JvRdHAqJ+Yeb0d/2eBBeID6eJPEg5ZhyEBxVQICKxiXy/qXRx
 fhm2DX5i1satLSkmHROrHwI9049Mo5ADKDwNYpEeSQBHJnvsRb9Bo297QV/YqDYHny
 gk4l9n39lDkfg==
Date: Fri, 17 Nov 2023 09:40:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
Message-ID: <oe2rcrep4rukf7k3aqc6grfbp2hh4syehtmxivbjx746u46lg2@74v2bl526mpm>
References: <20231008223315.279215-1-marex@denx.de>
 <ea0e3550-83ca-4006-819a-64780589d687@linaro.org>
 <5481d74f-4b58-4527-987a-562e1b213a6b@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6bytxhntxkb5lvdw"
Content-Disposition: inline
In-Reply-To: <5481d74f-4b58-4527-987a-562e1b213a6b@denx.de>
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
Cc: neil.armstrong@linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6bytxhntxkb5lvdw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 10:15:31PM +0100, Marek Vasut wrote:
> On 10/9/23 10:58, Neil Armstrong wrote:
> > On 09/10/2023 00:33, Marek Vasut wrote:
> > > Add missing .bus_flags =3D DRM_BUS_FLAG_DE_HIGH to this panel descrip=
tion,
> > > ones which match both the datasheet and the panel display_timing flag=
s .
> > >=20
> > > Fixes: 1e29b840af9f ("drm/panel: simple: Add Innolux G101ICE-L01 pane=
l")
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: dri-devel@lists.freedesktop.org
> > > ---
> > > =A0 drivers/gpu/drm/panel/panel-simple.c | 1 +
> > > =A0 1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > > b/drivers/gpu/drm/panel/panel-simple.c
> > > index 44c11c418cd56..8e4ea15f0e1e5 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2318,6 +2318,7 @@ static const struct panel_desc
> > > innolux_g101ice_l01 =3D {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 .disable =3D 200,
> > > =A0=A0=A0=A0=A0 },
> > > =A0=A0=A0=A0=A0 .bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > > +=A0=A0=A0 .bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
> > > =A0=A0=A0=A0=A0 .connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> > > =A0 };
> >=20
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>=20
> Maybe it is time to apply ?

The expectation is that you would kind of apply it yourself. Do you have
a drm-misc committer account? If not, you should apply for one, you
definitely qualify.

Maxime

--6bytxhntxkb5lvdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVcm5wAKCRDj7w1vZxhR
xfVXAP9EZZYRKu+x7QknB2S0ea7a8lZbUZEue4+lHfgF2stlJgD/aqSwp7BQphhB
I5fu8D3dOkfg2mKeLeH36BX5Jd5iyAQ=
=R6J8
-----END PGP SIGNATURE-----

--6bytxhntxkb5lvdw--
