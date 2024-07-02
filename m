Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7B923CAA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 13:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4FD10E5C6;
	Tue,  2 Jul 2024 11:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K9Zpd8rB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D522310E5C6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 11:43:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4253B6190D;
 Tue,  2 Jul 2024 11:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94589C116B1;
 Tue,  2 Jul 2024 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719920585;
 bh=kZbEaEyz/Tkk/PxXhmha720XfMtQAhLTk94HlDe6p1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K9Zpd8rBy888J6P40DsGoLbMZH+oAjTn24zwR9iNac+cPX9X787bjLnwpAVZbg0Ab
 frgqJ1QnDIMZWAQWzRU6+mhNUaX1PG5YXHI1eJ9vkJRYE43U3Jqtwc9Y7hq2/zRKcq
 9CcI2QBQ8pUV9qcCW7gDtHCP05m+ks6w85tJFdw6V40DWDrp7tihEruUrxu9+7tS1T
 K5ZOi0XJPAyGNeDeycEdwJYZLpMPbVGRsdcP+BivEL4+rplJRmTiQfgNHGiYtLAJ4+
 WgPKyhkYc7izyTmya215lA7VQrTi9F9JdpUXrPgzuzdSe/vud9SI8jX89cLwlQEpyH
 n+xxIJT620XRA==
Date: Tue, 2 Jul 2024 13:43:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
Message-ID: <20240702-bold-exotic-mamba-fdbba4@houat>
References: <20240619-dsi-devres-fix-v1-1-a5c59310a52e@ideasonboard.com>
 <20240626-gabby-ladybug-of-freedom-08e6eb@houat>
 <66ab4206-d1c8-4aad-99a7-c4c316e343a9@ideasonboard.com>
 <20240626-warping-nondescript-mustang-bfce27@houat>
 <b7cf71b8-76fd-4638-a7b6-cc8dbae635bf@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="omhmpq3yr25sgkgg"
Content-Disposition: inline
In-Reply-To: <b7cf71b8-76fd-4638-a7b6-cc8dbae635bf@ideasonboard.com>
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


--omhmpq3yr25sgkgg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Wed, Jun 26, 2024 at 06:53:40PM GMT, Tomi Valkeinen wrote:
> On 26/06/2024 18:07, Maxime Ripard wrote:
> > On Wed, Jun 26, 2024 at 12:55:39PM GMT, Tomi Valkeinen wrote:
> > > On 26/06/2024 11:49, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeinen wrote:
> > > > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > >=20
> > > > > When a bridge driver uses devm_mipi_dsi_device_register_full() or
> > > > > devm_mipi_dsi_attach(), the resource management is moved to devre=
s,
> > > > > which releases the resource automatically when the bridge driver =
is
> > > > > unbound.
> > > > >=20
> > > > > However, if the DSI host goes away first, the host unregistration=
 code
> > > > > will automatically detach and unregister any DSI peripherals, wit=
hout
> > > > > notifying the devres about it. So when the bridge driver later is
> > > > > unbound, the resources are released a second time, leading to cra=
sh.
> > > >=20
> > > > That's super surprising. mipi_dsi_device_unregister calls
> > > > device_unregister, which calls device_del, which in turn calls
> > > > devres_release_all.
> > >=20
> > > Hmm, right.
> > >=20
> > > > If that doesn't work like that, then it's what needs to be fixed, a=
nd
> > > > not worked around in the MIPI-DSI bus.
> > >=20
> > > Well, something causes a crash for both the device register/unregiste=
r case
> > > and the attach/detach case, and the call stacks and debug prints show=
ed a
> > > double unregister/detach...
> > >=20
> > > I need to dig up the board and check again why the devres_release_all=
() in
> > > device_del() doesn't solve this. But I can probably only get back to =
this in
> > > August, so it's perhaps best to ignore this patch for now.
> > >=20
> > > However, the attach/detach case is still valid? I see no devres calls=
 in the
> > > detach paths.
> >=20
> > I'm not sure what you mean by the attach/detach case. Do you expect
> > device resources allocated in attach to be freed when detach run?
>=20
> Ah, never mind, the devres_release_all() would of course deal with that t=
oo.
>=20
> However, I just realized/remembered why it crashes.
>=20
> devm_mipi_dsi_device_register_full() and devm_mipi_dsi_attach() are given=
 a
> device which is used for the devres. This device is probably always the
> bridge device. So when the bridge device goes away, so do those resources.
>
> The mipi_dsi_device_unregister() call deals with a DSI device, which was
> created in devm_mipi_dsi_device_register_full(). Unregistering that DSI
> device, which does happen when the DSI host is removed, does not affect t=
he
> devres of the bridge.
>=20
> So, unloading the DSI host driver causes mipi_dsi_device_unregister() and
> mipi_dsi_detach() to be called (as part of mipi_dsi_host_unregister()), a=
nd
> unloading the bridge driver causes them to be called again via devres.

Sorry, that's one of the things I don't quite get. Both functions are
exclusively(?) called from I2C bridges, so the device passed there
should be a i2c_client instance, and thus the MIPI-DSI host going away
will not remove those i2c devices, only the MIPI-DSI ones, right?

So if we remove the host, the MIPI-DSI device will be detached and
removed through the path you were explaing with the i2c client lingering
around. And if we remove the I2C device, then devm will kick in and will
detach and remove the MIPI-DSI device.

Or is it the other way around? That if you remove the host, the device
is properly detached and removed, but there's still the devm actions
lingering around in the i2c device with pointers to the mipi_dsi_device
that was first created, but since destroyed?

And thus, if the i2c device ever goes away, we get a use-after-free?

Maxime

--omhmpq3yr25sgkgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoPnxAAKCRDj7w1vZxhR
xecNAP4p0hrtaR5VpAUxQh77du2w/99QitTXda5ESBUZ/tsx+wD/WpaxG/OtwRDC
qdChDyLJT14nu3fq+raaofJXdkiFYwI=
=C7to
-----END PGP SIGNATURE-----

--omhmpq3yr25sgkgg--
