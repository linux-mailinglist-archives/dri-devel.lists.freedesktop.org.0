Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F411B37C20
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A925210E07E;
	Wed, 27 Aug 2025 07:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oFIccRh0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8AA10E07E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 07:46:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AC3E86025C;
 Wed, 27 Aug 2025 07:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FB7C4CEEB;
 Wed, 27 Aug 2025 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756280766;
 bh=ytubK461FniUf2IfwdqKsByFkQ4P0lYinRAgiXXMQSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFIccRh0T7Gcu5rUbogq38tukybr1RmrGuforXmNK4SIKXOqQNlmNVDNro+9jy5vy
 Sss83LMuf9GuGjIj95Lo6jzcmNtIUnzGuaYx8Rhrprh+ckO6axB51qtTemZYxUxk2n
 FkEZZhvE6ToWkXq7N4hl8E/6L+9o9Q3FwPol8E/8e/1YG/aEvDoIUYkjzVZUpaNGr1
 HP37jXpN+p4vno5I+RrxtD4/qPiVGAJPIicgbFhsyKrEjvdzdt3rg5CtqVhk7/om4h
 Y9OjuTySiwIPW/vrjcvjQPKvW3VX9VAx0IKrPkIpdsQgahAKQxpmdWGD43fyTey3sk
 R+B3Ib2RFpZrA==
Date: Wed, 27 Aug 2025 09:46:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
Message-ID: <20250827-charming-arcane-stingray-cfb8b6@houat>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="crrk2hz4sf2bauvt"
Content-Disposition: inline
In-Reply-To: <20250820131302.6a2da5ef@booty>
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


--crrk2hz4sf2bauvt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
MIME-Version: 1.0

On Wed, Aug 20, 2025 at 01:13:02PM +0200, Luca Ceresoli wrote:
> Hello Maxime,
>=20
> On Tue, 19 Aug 2025 14:29:32 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > > @@ -1005,7 +1041,24 @@ static void sn65dsi83_remove(struct i2c_client=
 *client)
> > >  {
> > >  	struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
> > > =20
> > > +	drm_bridge_unplug(&ctx->bridge);
> > >  	drm_bridge_remove(&ctx->bridge); =20
> >=20
> > Shouldn't we merge drm_bridge_unplug with the release part of
> > devm_drm_bridge_alloc?
>=20
> I'm not sure I got what you are suggesting here, sorry.
>=20
> Do you mean that __devm_drm_bridge_alloc() should add a devres action
> to call drm_bridge_unplug(), so the unplug is called implicitly and
> does not need to be called explicitly by all drivers?

Yes

> If that's what you mean, I don't think that would work. Unless I'm
> missing something, devres actions are always invoked just after the
> driver .remove callback.

Yes, they are called in reverse order of registration, after remove.

> But we need to call drm_bridge_unplug() at the beginning (or just
> before) .remove, at least for drivers that need to do something in
> .remove that cannot be done by devm.
>=20
> In pseudocode:
>=20
> mybridge_remove()
> {
>   drm_bridge_unplug(); <-- explicit call as in my patch
>   xyz_disable();
>   drm_bridge_unplug(); <-- implicitly done by devres
> }
>=20
> We want xyz_disable() to be done after drm_bridge_unplug(), so other
> code paths using drm_bridge_enter/exit() won't mess with xyz.

It's not clear to me why doing it before xyz_disable() is important
here? If anything, it would prevent from disabling the hardware for
example, even though you still have your memory mapping, clocks, power
domains, regulators, etc. to properly disable it.

You're still correct that it's a bad idea though because we want to do
it before we start freeing all those, so it needs to execute as the
before the devm actions ...

> devres actions cannot be added to be executed _before_ .remove, AFAIK.

=2E.. and we can't do that either.

Maxime

--crrk2hz4sf2bauvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK63uwAKCRAnX84Zoj2+
dgLcAYCbzeLhpttYGY0jIOvo/NL1UpFAUrqw3LpkYCfx7XLCeWzOJnDcUU+sOaAV
PQRUGesBgJr8xIO7M9NVXmh8k2lakSPVKLcdG+5v6nlYTP8thl/MHrBT2nsih6oO
fJVVvVq9Pg==
=XFdz
-----END PGP SIGNATURE-----

--crrk2hz4sf2bauvt--
