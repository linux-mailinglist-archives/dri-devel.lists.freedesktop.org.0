Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79002A0260E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 13:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85A310E66E;
	Mon,  6 Jan 2025 12:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="loWU5/cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8CE10E66E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 12:58:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4575A5C4967;
 Mon,  6 Jan 2025 12:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE13C4CED2;
 Mon,  6 Jan 2025 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736168322;
 bh=RzbscbQLdw1BlUdcC7uT2SHDzyF+WJMoidpi0oDvh0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=loWU5/cvyCRBbYuzqSug7NG15e7g6qG2XrgZ8TZz6nQs+Ck5+m5wEUAFW+4Eq5ue8
 wcviapA8X2Lq41tg499++upFlIlT3ZGRBJoBBcYAZ0Hh2SXXnKk0HWgANZ6LU4PwOZ
 pGH/jvDxPRGRGD6F75Mw75B4vCwWC1zFNHzE7hklxjt3SLLN9QQbg1gj5lCGYRBtYO
 OcD8wHy447m6EO6r/vfFIg1k7+70UbsQhJwKWl441n5frqpO0CY5w8LdijV1Ba4CEI
 OmScP1zKmKt7dssxsXxeFHQBH/swDJG80FLzQTBvRypbu6fWRsBNbEJzlDubdFnaCw
 NsEP059nnmnBw==
Date: Mon, 6 Jan 2025 13:58:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 6/8] drm: writeback: Add missing cleanup in case of
 initialization failure
Message-ID: <20250106-airborne-vicugna-of-effort-534a4f@houat>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
 <20241230-google-vkms-managed-v6-6-15c7d65cd63b@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ln3vbazomcrenweo"
Content-Disposition: inline
In-Reply-To: <20241230-google-vkms-managed-v6-6-15c7d65cd63b@bootlin.com>
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


--ln3vbazomcrenweo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 6/8] drm: writeback: Add missing cleanup in case of
 initialization failure
MIME-Version: 1.0

On Mon, Dec 30, 2024 at 07:37:36PM +0100, Louis Chauvet wrote:
> The current implementation of drm_writeback_connector initialization does
> not properly clean up all resources in case of failure (allocated
> properties and possible_encoders). Add this cleaning in case of failure.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeb=
ack.c
> index 494400b09796d37ed89145da45d5f1e029632de5..9c69f7181e02c23dabce48840=
5608c40d4184af5 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -247,18 +247,20 @@ static int __drm_writeback_connector_init(struct dr=
m_device *dev,
>  	int ret =3D create_writeback_properties(dev);
> =20
>  	if (ret !=3D 0)
> -		return ret;
> +		goto failed_properties;
> =20
>  	connector->interlace_allowed =3D 0;
> =20
>  	ret =3D drm_connector_attach_encoder(connector, enc);
>  	if (ret)
> -		return ret;
> +		goto failed_properties;
> =20
>  	blob =3D drm_property_create_blob(dev, n_formats * sizeof(*formats),
>  					formats);
> -	if (IS_ERR(blob))
> -		return PTR_ERR(blob);
> +	if (IS_ERR(blob)) {
> +		ret =3D PTR_ERR(blob);
> +		goto failed_blob;
> +	}
> =20
>  	INIT_LIST_HEAD(&wb_connector->job_queue);
>  	spin_lock_init(&wb_connector->job_lock);
> @@ -281,6 +283,11 @@ static int __drm_writeback_connector_init(struct drm=
_device *dev,
>  	wb_connector->pixel_formats_blob_ptr =3D blob;
> =20
>  	return 0;
> +failed_blob:
> +	connector->possible_encoders &=3D ~drm_encoder_mask(enc);

I don't think it's worth it to uninitialize that particular field. All
the structure fields are going to be in an undefined state, and
shouldn't be used anymore.

Maxime

--ln3vbazomcrenweo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3vTewAKCRAnX84Zoj2+
dsDpAYCIXdQERbNxj1OGftZS8VAu0XExH6SHEBfgHPPMMfeLvEhVsLfx564x51d0
Z0LfHpEBf1VchOzR37b8gkLc5FaOPsDv6VtYQXXekqpDUKQ3eO+CXyXnJ/2C+otD
EpTazza57g==
=BDFc
-----END PGP SIGNATURE-----

--ln3vbazomcrenweo--
