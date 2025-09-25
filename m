Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D76B9F567
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5038410E8F8;
	Thu, 25 Sep 2025 12:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qCkjCgww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBCC10E8F8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:48:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E35CF434F8;
 Thu, 25 Sep 2025 12:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FCBC4CEF0;
 Thu, 25 Sep 2025 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758804489;
 bh=1ipVFYFMiuR5F7EukbEmgjPCYH8EmaeiYw+uLkYVTrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qCkjCgwwygXnCnJyGWTLqwljG2Tw3EvDltbC2CckpYzg4V93tH3QiwNm+U59O4Zqc
 fWyKN3frfGYIIr4N2yKjjHdj96z4SieyGAcGTc9CLrtUYQd43i6rPB66tacb10qd+I
 HQTsy4fGhENe+SogGUfCT78kjDuIs9DUjNJBf5apMFNYukufFI5nJnJy3qlCqJZJ7D
 DyIGDxFH8f1pzNP0pcx+G/70bCPk4erH8Az7QhxntDX65gJTmyDtcdXIzNm2Nten/f
 YdFoCGPk/3kXJxYx8IKnUnBgDNBrNITsqKa+9wx8AQEJPAQD73IIgpEpJJzeISEpsg
 RtjUyFTGYMkVA==
Received: by venus (Postfix, from userid 1000)
 id 7C85A1805A0; Thu, 25 Sep 2025 14:48:07 +0200 (CEST)
Date: Thu, 25 Sep 2025 14:48:07 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michael Riesch <michael.riesch@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: sitronix-st7789v: fix sync flags for
 t28cp45tn89
Message-ID: <hktw42pbb4rk3azapasigphhlbndkh5pmcm6fucdvk3ukoiull@dpoh7amjyymh>
References: <20250924-t28cp45tn89-fix-v1-1-8e8f52239c84@collabora.com>
 <6e50e9fb-10f5-48e6-bc04-ec66ca90a626@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w64dwrdjv5cr2ceg"
Content-Disposition: inline
In-Reply-To: <6e50e9fb-10f5-48e6-bc04-ec66ca90a626@mailbox.org>
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


--w64dwrdjv5cr2ceg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/panel: sitronix-st7789v: fix sync flags for
 t28cp45tn89
MIME-Version: 1.0

Hello Marek,

On Thu, Sep 25, 2025 at 02:15:41AM +0200, Marek Vasut wrote:
> On 9/24/25 11:46 PM, Sebastian Reichel wrote:
> > From: Sebastian Reichel <sebastian.reichel@collabora.com>
> >=20
> > I planned to set the polarity of horizontal and vertical sync, but
> > accidentally described vertical sync twice with different polarity
> > instead.
> >=20
> > Note, that there is no functional change, because the driver only
> > makes use of DRM_MODE_FLAG_P[HV]SYNC to divert from the default
> > active-low polarity.
> >=20
> > Reported-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> > Closes: https://lore.kernel.org/all/20250923132616.GH20765@pendragon.id=
easonboard.com/
> > Fixes: a411558cc143 ("drm/panel: sitronix-st7789v: add Inanbo T28CP45TN=
89 support")
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/g=
pu/drm/panel/panel-sitronix-st7789v.c
> > index 04d91929eedda092b966b8cffdef5b267748f190..dedf0a390a88dd45a8179e2=
d22e872128c87cfda 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > @@ -261,7 +261,7 @@ static const struct drm_display_mode t28cp45tn89_mo=
de =3D {
> >   	.vtotal =3D 320 + 8 + 4 + 4,
> >   	.width_mm =3D 43,
> >   	.height_mm =3D 57,
> > -	.flags =3D DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC,
> > +	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC,
> Is this panel somehow special with its NHSYNC / PVSYNC , compared to the
> other supported panels, which all use PHSYNC / PVSYNC ? I would expect all
> of these DSI TCON to use the same polarity, how come this one needs NHSYN=
C ?

I wrote this based on reverse engineering incl. quite a bit try-and-error a=
nd
don't have very good data about the panel. Using DRM_MODE_FLAG_PHSYNC like =
all
the other panels results in garbage data on the display.

Greetings,

-- Sebastian

--w64dwrdjv5cr2ceg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjVOgIACgkQ2O7X88g7
+poTjRAAp2ByyBdVykfjLW0AzuSIfUBeMB5GOwwYrD7GLn4AZJB6HeGmVYFCkxXU
OYjLoIVbE6ufUqpPRvPswFioeoU0lkA41I4qZbMzwbid688B56pvxLb+CBy9nC6f
OKCiYEPooFGaZGpd/KyOraEfi5xpxSFPGlSMNxujq8XZ4Crttd7CIZA3CJUZbRTo
qa0MGkYGmg/px5vrcv0G4d9KkbB4S9hUzVvJLQzatrfXtpYko/14QN1BnCtuHyO/
eH1V02P2Q04faSBpkBcehN0GlW8t2sMnW4RVk9ouJG0Ggu0dfgLCk258scB4Hg1m
QGx2u5YvOVvCzz//PVZZ7jYGiFplwh+X4AZLDZLyJnruwEB9fyKWbGTAm0gYlQZ5
AGeeWBE2FyLzCu3Ywhke1PBfOy1AAAUuM9vNrtmOIQoqSIkKVcYwQ1qU6k5yRcjN
fp6QQLzEP9YH15BF6SM6CJ9KHbTVjZMHY9itFt6mb74HVLKV5x0XhPw5L8hOJHNT
mJQDAHdhspg19+lBVGhxHRcfypRIBh9nF2bpm7Vzv5SGLs85mBHHkL2wmkB4n21M
OckYVdXkL5ALGa0K25CN3Dw3w38oLfaEV+BfjlM6+GJi2ZOlniIBtE+deseEp9hE
v3dQXvYk0FNjtJ/Z7nY9P85xkNOeXjO/r2Ysmm0mG9GovZyx7NI=
=sv8+
-----END PGP SIGNATURE-----

--w64dwrdjv5cr2ceg--
