Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB2168C24
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 04:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C04A6F5CF;
	Sat, 22 Feb 2020 03:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42DE6F5CF
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 03:13:51 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F4382071E;
 Sat, 22 Feb 2020 03:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582341231;
 bh=qqc5a2A48bBmq7FKUsHPnKPHkB9Am2kUBn6ekht3ZRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1xrvlmhRgVH0RRmqmW/zbZnOmsbgeA4c0XmGziNp6fw5d3HR7jk4XVsZwtpCaCf5
 ZE9IhKMgrDDMPK3bySlMlfeDgBkgWtiGW/GrEubQZNfbQeniz5ld154c+bNSooTT52
 0bTgJ5oX1kUYRhjtT2gH6vuqNmW0QKleXMDkLMc8=
Received: by earth.universe (Postfix, from userid 1000)
 id E1ED33C0C83; Sat, 22 Feb 2020 04:13:48 +0100 (CET)
Date: Sat, 22 Feb 2020 04:13:48 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 49/51] drm/omap: dss: Remove unused omap_dss_device
 operations
Message-ID: <20200222031348.ozzn2zyhr57n4aka@earth.universe>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
 <20200216210308.17312-50-laurent.pinchart@ideasonboard.com>
 <20200220213938.4rbbkn7pax6ywbnk@earth.universe>
 <20200220214530.GS4998@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200220214530.GS4998@pendragon.ideasonboard.com>
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
Content-Type: multipart/mixed; boundary="===============2122692200=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2122692200==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eruvl65yn35ewvh7"
Content-Disposition: inline


--eruvl65yn35ewvh7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 20, 2020 at 11:45:30PM +0200, Laurent Pinchart wrote:
> On Thu, Feb 20, 2020 at 10:39:38PM +0100, Sebastian Reichel wrote:
> > On Sun, Feb 16, 2020 at 11:03:06PM +0200, Laurent Pinchart wrote:
> > > The omap_dss_device .pre_enable(), .post_disable() and .set_timings()
> > > are not used anymore. Remove them.
> > >=20
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > ---
> >=20
> > Actually it would be good to postpone this patch a bit, since=20
> > I need those functions as intermediate step for converting DSI
> > code (I'm currently rebasing my series on yours).
>=20
> I'm fine with that. I'll move the patch to the end of the series
> (nothing depends on it) and postpone it for now.

Great, Thanks. I got my DSI cleanup patches working on top of your
series:

https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/log/?h=
=3Domapdrm/bridge/devel-with-dsi

I added a similar patch towards the end, which removes all
of the omap_dss_device ops:

https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/commit/?=
h=3Domapdrm/bridge/devel-with-dsi&id=3D4269becc2bf39631a4ae5aba8e21f4aab83f=
c837

-- Sebastian

--eruvl65yn35ewvh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5QnGkACgkQ2O7X88g7
+pqVLRAAmgyiLfBC9VQcPuC//0H9PaegihZ+P8pwp5ahNVPF/DayZN1zJzl++FKg
u/xVRFyfynf2b8ETjbdRLJegY7sqy/cNhinrTr2jUc03k6ctyD9Ue6KLMrvlJYHu
l//U8wJxpzSEnVsWJxY3PVy53oko1WQTZJXCXSvxRUynMcBd570VDj++hIQAV7QU
tYP8COdRqspOTXemv0HzGC356btgl+DEO3G6uZFL0oXobFqmm40yogUTSgTst4Vu
TGTuVsti6T4TCMF/gQI8opTsPDmde7zZgIcH+JFmx4UiNJwMqMzuqUIhOAHI9E3d
VNmXb84rxWtaR1VRHYtomuzvTYbSv478UwJSoc1+Djg0zbPorSrtmyEChha9jGfc
pUnzWWP8C5MU0c+4LPqmjHXtu0//6kClZ8nJ8i7yaAFKmSWTQ6hqhKYRoZOfpUuL
WZmseDIkuMdWj3hS5lGH2ImCB/TFyPgPnjt93/92d5eGgYI7EjHz70w153WJ5xLb
uk2gRw/nRdm43gA0GyhcMD2PYVTtkU4l32yeD5/UQIu3jti8iA5nCLkBieWWE1l+
l7UUDn4yxKUwVdn/SGPgk2NruH6qHPIyz5d61flbHVkZNVNg4MNYuH+hjUx5ZU7o
oX7OioNDmBNNtd4YnBFq7tLxi4AC0L5UOATvnRmM/DRLwENIA9s=
=D8AH
-----END PGP SIGNATURE-----

--eruvl65yn35ewvh7--

--===============2122692200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2122692200==--
