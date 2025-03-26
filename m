Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806F4A71A36
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E9910E6F4;
	Wed, 26 Mar 2025 15:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SxHxZUcv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B42710E6F4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:28:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39C045C6830;
 Wed, 26 Mar 2025 15:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94415C4CEED;
 Wed, 26 Mar 2025 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743002902;
 bh=+iTDM1up9bQyibbW8Bm0+4EO+vdNAR+vKU9j9w34kYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SxHxZUcvd0c+VlPOSawUfFkduDYadlR37K+FMQHCAZy/++rzWlaixMcDoJGDdDANs
 CzS18JGEuldUJe6AsKytDKVwHQ9xt4Ep9Ey3h+dr2vqvz9pC3hXoz9Cayui9SEH5L5
 AFRxbWeruM0yX6xgmQnjFL/wH1VGWmzFlRqR8nVOcVRAKZqIqM/F7T6bwXhEd/QGJq
 y5+vQWyYB+j+f/m0OmBGTHaLnadR4kBT6F2ZANgmrruC4DxuPV6cdMjXv0iYkkvd2t
 jtriA0FWrU2cxJXwwCSHz1hd3ZxKSuhPmNmy4J8Nn6f5b6wK4TWFONJQp00YE4qN8S
 GaKuqQjiwu2pw==
Date: Wed, 26 Mar 2025 16:28:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/5] drm/panel: Add refcount support
Message-ID: <20250326-persimmon-parrot-of-glamour-f31fdb@houat>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-2-4e2bf5d19c5d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="35mfar5h62wtrpdj"
Content-Disposition: inline
In-Reply-To: <20250325-b4-panel-refcounting-v1-2-4e2bf5d19c5d@redhat.com>
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


--35mfar5h62wtrpdj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] drm/panel: Add refcount support
MIME-Version: 1.0

On Tue, Mar 25, 2025 at 01:24:09PM -0400, Anusha Srivatsa wrote:
> Allocate panel via reference counting.
> Add _get() and _put() helper functions
> to ensure panel allocations are refcounted.
> Avoid use after free by ensuring panel is
> valid and can be usable till the last reference
> is put. This avoids use-after-free
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 65 +++++++++++++++++++++++++++++++++++++++=
+++++-
>  include/drm/drm_panel.h     | 19 ++++++++++++-
>  2 files changed, 82 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index bdeab5710ee324dc1742fbc77582250960556308..079c3c666a2ddc99a0051d1a3=
c9ba65d986dd003 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -355,24 +355,87 @@ struct drm_panel *of_drm_find_panel(const struct de=
vice_node *np)
>  }
>  EXPORT_SYMBOL(of_drm_find_panel);
> =20
> +static void __drm_panel_free(struct kref *kref)
> +{
> +	struct drm_panel *panel =3D container_of(kref, struct drm_panel, refcou=
nt);
> +
> +	kfree(panel->container);
> +}
> +
> +/**
> + * drm_panel_get - Acquire a panel reference
> + * @panel: DRM panel
> + *
> + * This function increments the panel's refcount.
> + *
> + */
> +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> +{
> +	if (!panel)
> +		return panel;
> +
> +	kref_get(&panel->refcount);
> +
> +	return panel;
> +}

This should be exported

> +/**
> + * drm_panel_put - Release a panel reference
> + * @panel: DRM panel
> + *
> + * This function decrements the panel's reference count and frees the
> + * object if the reference count drops to zero.
> + */
> +struct drm_panel *drm_panel_put(struct drm_panel *panel)
> +{
> +	if (!panel)
> +		return panel;
> +
> +	kref_put(&panel->refcount, __drm_panel_free);
> +
> +	return panel;
> +}

Ditto,

> +/**
> + * drm_bridge_put_void - wrapper to drm_bridge_put() taking a void point=
er
> + *
> + * @data: pointer to @struct drm_bridge, cast to a void pointer
> + *
> + * Wrapper of drm_bridge_put() to be used when a function taking a void
> + * pointer is needed, for example as a devm action.
> + */
> +static void drm_panel_put_void(void *data)
> +{
> +	struct drm_panel *panel =3D (struct drm_panel *)data;
> +
> +	drm_panel_put(panel);
> +}

You can drop the documentation on that one.

Looks good otherwise,
Maxime

--35mfar5h62wtrpdj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+QdEwAKCRDj7w1vZxhR
xYQOAP9w3MTmVHhd861+uBbT6ku5QPjuAF8QKp2uW930Xg0/ngEA8+IQLZq8MDQH
cJZsh0JTE1RLVLeeQTyRMOo8NM6g5wk=
=WCTM
-----END PGP SIGNATURE-----

--35mfar5h62wtrpdj--
