Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46087A0261A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 14:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86E310E669;
	Mon,  6 Jan 2025 13:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pb3EvVPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E58610E669
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 13:04:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DB669A4175B;
 Mon,  6 Jan 2025 13:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C117C4CED2;
 Mon,  6 Jan 2025 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736168664;
 bh=q/jK2YEBRveVg970rSjYdUGGNYnZYP6k10Y067WlNq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pb3EvVPLk0Ure0Vce3VeTzXwQ07XlaCgbZxraH0m6/JO0bFN8Z9tpB+IuLsxuYnnN
 n4LGa9RaLWHKk6JrKW0IyDdTWEcdPo1O9Gql+tB5X3sBmWVpXTXJMaNnB//IWIFlI4
 qpTq182jxM09EtCaVUrfcEFFE3xY7FW1zwY+0zS8Yy/0OApEoe6HsQ2kA4R5vKBSxF
 qUF7fN62EROKHQNzRhNxq04D8N69sfsOEG4S4c28RFThCv9VGoS7/+JpRPEcjc1RX0
 Q3E/Wv2xXzJtqa3+RjcB5C813MB6+0+UJEtMgEGcMh+kDyNN1ZRpYZHZnCSMIz098o
 9ZTS5LSlYX9ow==
Date: Mon, 6 Jan 2025 14:04:21 +0100
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
Subject: Re: [PATCH v6 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
Message-ID: <20250106-acoustic-inescapable-locust-9d5b36@houat>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
 <20241230-google-vkms-managed-v6-7-15c7d65cd63b@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="67vldsxk4lmeegfc"
Content-Disposition: inline
In-Reply-To: <20241230-google-vkms-managed-v6-7-15c7d65cd63b@bootlin.com>
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


--67vldsxk4lmeegfc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
MIME-Version: 1.0

On Mon, Dec 30, 2024 at 07:37:37PM +0100, Louis Chauvet wrote:
> To allows driver to only use drmm objects, add helper to create
> drm_writeback_connectors with automated lifetime management.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 69 +++++++++++++++++++++++++++++++++++=
++++++
>  include/drm/drm_writeback.h     |  8 +++++
>  2 files changed, 77 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeb=
ack.c
> index 9c69f7181e02c23dabce488405608c40d4184af5..1251f65aae9e3b6fb5c5de9ab=
9280e5430342208 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -369,6 +369,75 @@ static void drm_writeback_connector_cleanup(struct d=
rm_device *dev,
>  	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
>  }
> =20
> +/**
> + * drmm_writeback_connector_init - Initialize a writeback connector with
> + * a custom encoder
> + *
> + * @dev: DRM device
> + * @wb_connector: Writeback connector to initialize
> + * @con_funcs: Connector funcs vtable
> + * @enc: handle to the already initialized drm encoder, optional
> + * @enc_funcs: Encoder funcs vtable, optional, only used when @enc is NU=
LL
> + * @formats: Array of supported pixel formats for the writeback engine
> + * @n_formats: Length of the formats array
> + * @possible_crtcs: if @enc is NULL, this will set the possible_crtc for=
 the
> + *		    newly created encoder
> + *
> + * This function initialize a writeback connector and register its clean=
up.
> + *
> + * This function creates the writeback-connector-specific properties if =
they
> + * have not been already created, initializes the connector as
> + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the prop=
erty
> + * values.
> + *
> + * If @enc is NULL, this function will create a drm-managed encoder and =
will
> + * attach @enc_funcs on it. It will also attach the CRTC passed in
> + * @possible_crtcs
> + *
> + * Returns: 0 on success, or a negative error code
> + */
> +int drmm_writeback_connector_init(struct drm_device *dev,
> +				  struct drm_writeback_connector *wb_connector,
> +				  const struct drm_connector_funcs *con_funcs,
> +				  struct drm_encoder *enc,
> +				  const struct drm_encoder_helper_funcs *enc_funcs,
> +				  const u32 *formats, int n_formats,
> +				  u32 possible_crtcs)

The name isn't really consistent with the other functions. We already
have a drm_writeback_connector_init that doesn't take the encoder point
but will just read it from wb_connector->encoder, and we have
drm_writeback_connector_with_encoder that assumes the encoder has
already been created.

We should the name or behavior on either one of them. Why do we need an
optional encoder pointer? If enc is not NULL, then enc_funcs shouldn't
be necessary, if it's NULL, then drm_writeback_connector_init will be
sufficient?

Maxime

--67vldsxk4lmeegfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3vU1QAKCRAnX84Zoj2+
drY0AYDJ+2C+lp1A+BLxjl/KfF/0wXFAErZHKNaufWx8/jcyCdhH114ah/wcmQmz
1/bx9jUBfj2+wrABgZBS2z1n1gpqAzZUZ7olzZ98No+59B8IXbbGe0Z7+wxxI0Up
aQ1EzZAvnQ==
=wZoB
-----END PGP SIGNATURE-----

--67vldsxk4lmeegfc--
