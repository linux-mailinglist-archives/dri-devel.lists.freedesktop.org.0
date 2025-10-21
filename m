Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078BBBF78F8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 18:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451E410E300;
	Tue, 21 Oct 2025 16:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D9Zujx5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E0410E300
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 16:01:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7881444CD7;
 Tue, 21 Oct 2025 16:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008AAC4CEF1;
 Tue, 21 Oct 2025 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761062480;
 bh=h8f+2mlAVixbbRPndHqYJN9W6PWBGmuOEI1As8n6tWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D9Zujx5RJHL1eHpmvYiNlBCVvZxpCqzOdS4c5hgHPHOfhQVCQ3pLtv9EkvLGhKZRD
 wmbws4xIqo57po58rlpuz9G5djnt1iF+vohuAxkA0U3YrZxmDC+r1bLKhJBdK94QfX
 1Zm6srQrbVV87pOQFvPN69v2cMc7CnAL1NhhE4OSNCJ7ycotbWDj0MN69D9dLXoS3o
 tY1OBuepwmLeK8dYO5lV63m27T8dFODYX+SKoyLNVwOQ95eQ4RMQxJOIjb6q6m9mTZ
 sF0ekUmVOg3ghSZRIxRuGrAVI/iqDSf/YmUGHN3eG9QdO8aqllutNOdkmuCrr6s+Vq
 ELLa2gbYiqL3Q==
Date: Tue, 21 Oct 2025 18:01:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Bajjuri Praneeth <praneeth@ti.com>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 thomas.petazzoni@bootlin.com, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/tilcdc: Fix removal actions in case of failed probe
Message-ID: <zpbkhcczqdf2ppxnytms3yfnvf5nr2r5pvsg2hiob76m5fxm4g@czug2uitm57n>
References: <20251014143229.559564-1-kory.maincent@bootlin.com>
 <p4u2goyadub3dfuz4empf3g7a44b2ausy4hjjkcwj7nzgeochx@xztpij2i2lao>
 <20251014182122.5f63b027@kmaincent-XPS-13-7390>
 <20251021151435.23a03b85@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="n7x4gneis3run3kt"
Content-Disposition: inline
In-Reply-To: <20251021151435.23a03b85@kmaincent-XPS-13-7390>
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


--n7x4gneis3run3kt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tilcdc: Fix removal actions in case of failed probe
MIME-Version: 1.0

On Tue, Oct 21, 2025 at 03:14:35PM +0200, Kory Maincent wrote:
> On Tue, 14 Oct 2025 18:21:22 +0200
> Kory Maincent <kory.maincent@bootlin.com> wrote:
>=20
> > Hello Maxime,
> >=20
> > On Tue, 14 Oct 2025 17:36:47 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >=20
> > > On Tue, Oct 14, 2025 at 04:32:28PM +0200, Kory Maincent wrote: =20
> > > > From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> > > >=20
> > > > The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() hel=
pers
> > > > should only be called when the device has been successfully registe=
red.
> > > > Currently, these functions are called unconditionally in tilcdc_fin=
i(),
> > > > which causes warnings during probe deferral scenarios.
> > > >=20
> > > > [    7.972317] WARNING: CPU: 0 PID: 23 at
> > > > drivers/gpu/drm/drm_atomic_state_helper.c:175
> > > > drm_atomic_helper_crtc_duplicate_state+0x60/0x68 ... [    8.005820]
> > > > drm_atomic_helper_crtc_duplicate_state from
> > > > drm_atomic_get_crtc_state+0x68/0x108 [    8.005858]
> > > > drm_atomic_get_crtc_state from drm_atomic_helper_disable_all+0x90/0=
x1c8 [
> > > >  8.005885]  drm_atomic_helper_disable_all from
> > > > drm_atomic_helper_shutdown+0x90/0x144 [    8.005911]
> > > > drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [tilcdc] [
> > > > 8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [=
tilcdc]
> > > >=20
> > > > Fix this by moving both drm_kms_helper_poll_fini() and
> > > > drm_atomic_helper_shutdown() inside the priv->is_registered conditi=
onal
> > > > block, ensuring they only execute after successful device registrat=
ion.
> > > >=20
> > > > Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at
> > > > shutdown/remove time for misc drivers") Signed-off-by: Kory Maincent
> > > > (TI.com) <kory.maincent@bootlin.com> ---
> > > >  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> > > > b/drivers/gpu/drm/tilcdc/tilcdc_drv.c index 7caec4d38ddf..2031267a3=
490
> > > > 100644 --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> > > > +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> > > > @@ -172,11 +172,11 @@ static void tilcdc_fini(struct drm_device *de=
v)
> > > >  	if (priv->crtc)
> > > >  		tilcdc_crtc_shutdown(priv->crtc);
> > > > =20
> > > > -	if (priv->is_registered)
> > > > +	if (priv->is_registered) {
> > > >  		drm_dev_unregister(dev);
> > > > -
> > > > -	drm_kms_helper_poll_fini(dev);
> > > > -	drm_atomic_helper_shutdown(dev);
> > > > +		drm_kms_helper_poll_fini(dev);
> > > > +		drm_atomic_helper_shutdown(dev);
> > > > +	}
> > > >  	tilcdc_irq_uninstall(dev);
> > > >  	drm_mode_config_cleanup(dev);   =20
> > >=20
> > > I don't think that's the right fix. tilcdc_fini is pretty complex
> > > because it gets called from multiple locations with various level of
> > > initialisation.
> > >=20
> > > This is done because tilcdc_init is using a bunch of deprecated
> > > functions with better alternatives now, and those would make the job =
of
> > > tilcdc_fini much easier.
> > >=20
> > > That's what we should be focusing on. =20
> >=20
> > I am also currently focusing on improving this driver (which has indeed=
 some
> > weird code leftover), but this work will land in drm misc next while th=
is is a
> > fix for the current implementation which fix an unwanted warning.
>=20
> Maxime is it okay to merge this to the right drm fix branch as I am curre=
ntly
> working on the tilcdc cleaning process that will land into drm misc next.
>=20
> Also I intend to remove the tilcdc panel subdriver and its binding as it
> can be replaced by the simple panel driver. I know it is unusual to remov=
e a
> binding but the driver and the binding are crappy and legacy. What do you=
 think?

I don't see why what I was suggesting also couldn't be fixes, but at the
end of the day, I don't care which way it goes.

Maxime

--n7x4gneis3run3kt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaPeuSQAKCRAnX84Zoj2+
du+JAYDfQOLwXDYTby3YeidW4aLo0eJAhYd67R95dahkcCEsaD6yDv6w7d9OWP6J
bC0peGEBfAgXz2XXC+SrZtOpd+rCSua4tDE6+3jKAt70GTsrerW3UPaGCyZvAtF5
Q/m7v0YJiA==
=4mGh
-----END PGP SIGNATURE-----

--n7x4gneis3run3kt--
