Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C0A618FD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 19:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897C810E35D;
	Fri, 14 Mar 2025 18:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u8s3Pa9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050D10E35D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 18:04:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BA9B5C4A31;
 Fri, 14 Mar 2025 18:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5EEC4CEE3;
 Fri, 14 Mar 2025 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741975483;
 bh=dc+5Fwuqnj7VThwM2tp+KuPSbbCmFL6xhXJcyRarTx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u8s3Pa9uc2R03aqOxHsgjhJL9fFv7bs2a+kw03vbXaqvQBgxetaOnIpQyRQcLq6xR
 zqr/IrjBjCKigQp3pC7vlUAIjDkyktnRqXtEj09/0E8KPXhDjfdWUqGbXNPGoIgRYw
 toDPkqhfPuVKQF0zBltgvMAAEI7gjzuhGadfRZTrkILYKBiFyGqHMrD7ubCvJRJyje
 IUTkULwspqSyCVF+Q8sR5uE1SCyY2crzmi+GseQuUMC+SdZ9ebGAYEnb9D871z5+Di
 DNWvGOd4AcjCihziIAkzc6opk6rFd17GY4EdntSBY412OW14vYqVqAENhJgGCIQEQw
 7VLeuPLpS7Xlw==
Date: Fri, 14 Mar 2025 19:04:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 02/11] drm/bridge: add support for refcounting
Message-ID: <20250314-amorphous-congenial-woodlouse-f50bde@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-drm-bridge-refcount-v7-2-152571f8c694@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ogfn2prbpwhr3lh7"
Content-Disposition: inline
In-Reply-To: <20250314-drm-bridge-refcount-v7-2-152571f8c694@bootlin.com>
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


--ogfn2prbpwhr3lh7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 02/11] drm/bridge: add support for refcounting
MIME-Version: 1.0

On Fri, Mar 14, 2025 at 11:31:15AM +0100, Luca Ceresoli wrote:
> DRM bridges are currently considered as a fixed element of a DRM card, and
> thus their lifetime is assumed to extend for as long as the card
> exists. New use cases, such as hot-pluggable hardware with video bridges,
> require DRM bridges to be added to and removed from a DRM card without
> tearing the card down. This is possible for connectors already (used by DP
> MST), it is now needed for DRM bridges as well.
>=20
> As a first preliminary step, make bridges reference-counted to allow a
> struct drm_bridge (along with the private driver structure embedding it) =
to
> stay allocated even after the driver has been removed, until the last
> reference is put.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Changes in v7:
>  - export drm_bridge_put_void
>  - struct drm_bridge: use container pointer instead of container_offset
>  - remove drm_bridge_is_refcounted()
>  - remove all DRM_DEBUG()s
>  - drm_bridge_get/put: accept NULL pointer and return the bridge pointer =
to
>    allow pass-through calls
>  - extract to separate patches:
>     - the addition of drm_bridge_alloc
>     - the addition of drm_bridge_get/put() to drm_bridge_add/remove()
>     - the addition of drm_bridge_get/put() to drm_bridge_attach/detach()
>  - fix a typo, slightly improve kerneldoc
>=20
> Changes in v6:
>  - use drm_warn, not WARN_ON (Jani Nikula)
>  - Add devm_drm_bridge_alloc() to replace drm_bridge_init() (similar to
>    drmm_encoder_alloc)
>  - Remove .destroy func: deallocation is done via the struct offset
>    computed by the devm_drm_bridge_alloc() macro
>  - use fixed free callback, as the same callback is used in all cases
>    anyway (remove free_cb, add bool is_refcounted)
>  - add drm_bridge_get/put() to drm_bridge_attach/detach() (add the bridge
>    to a list)
>  - make some DRM_DEBUG() strings more informative
>=20
> This patch was added in v5.
> ---
>  drivers/gpu/drm/drm_bridge.c | 33 +++++++++++++++-
>  include/drm/drm_bridge.h     | 91 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 123 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 96df717b2caeb41d45346ded576eaeb2806fd051..2ba0dac9bfc2dfd709d5e2457=
d69067c7324972c 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -199,23 +199,54 @@
>  static DEFINE_MUTEX(bridge_lock);
>  static LIST_HEAD(bridge_list);
> =20
> +void __drm_bridge_free(struct kref *kref)
> +{
> +	struct drm_bridge *bridge =3D container_of(kref, struct drm_bridge, ref=
count);
> +
> +	kfree(bridge->container);
> +}
> +EXPORT_SYMBOL(__drm_bridge_free);
> +
> +/**
> + * drm_bridge_put_void - wrapper to drm_bridge_put() taking a void point=
er
> + *
> + * @data: pointer to @struct drm_bridge, cast to a void pointer
> + *
> + * Wrapper of drm_bridge_put() to be used when a function taking a void
> + * pointer is needed, for example as a devm action.
> + */
> +void drm_bridge_put_void(void *data)
> +{
> +	struct drm_bridge *bridge =3D (struct drm_bridge *)data;
> +
> +	drm_bridge_put(bridge);
> +}
> +EXPORT_SYMBOL(drm_bridge_put_void);
> +
>  void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t of=
fset,
>  			      const struct drm_bridge_funcs *funcs)
>  {
>  	void *container;
>  	struct drm_bridge *bridge;
> +	int err;
> =20
>  	if (!funcs) {
>  		dev_warn(dev, "Missing funcs pointer\n");
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> -	container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> +	container =3D kzalloc(size, GFP_KERNEL);
>  	if (!container)
>  		return ERR_PTR(-ENOMEM);
> =20
>  	bridge =3D container + offset;
> +	bridge->container =3D container;
>  	bridge->funcs =3D funcs;
> +	kref_init(&bridge->refcount);
> +
> +	err =3D devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
> +	if (err)
> +		return ERR_PTR(err);
> =20
>  	return container;
>  }
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index dae463b30542d586a595b67f7bdf5a5e898e9572..5c1e2b9cafb12eb429d1f5d3e=
f312e6cf9b54f47 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -840,6 +840,17 @@ struct drm_bridge {
>  	const struct drm_bridge_timings *timings;
>  	/** @funcs: control functions */
>  	const struct drm_bridge_funcs *funcs;
> +
> +	/**
> +	 * @container: Pointer to the private driver struct embedding this
> +	 * @struct drm_bridge.
> +	 */
> +	void *container;

newline here

> +	/**
> +	 * @refcount: reference count of users referencing this bridge.
> +	 */
> +	struct kref refcount;
> +
>  	/** @driver_private: pointer to the bridge driver's internal context */
>  	void *driver_private;
>  	/** @ops: bitmask of operations supported by the bridge */
> @@ -941,6 +952,82 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
>  	return container_of(priv, struct drm_bridge, base);
>  }
> =20
> +void __drm_bridge_free(struct kref *kref);
> +
> +/**
> + * drm_bridge_get - Acquire a bridge reference
> + * @bridge: DRM bridge
> + *
> + * This function increments the bridge's refcount.
> + *
> + * Returns:
> + * Pointer to @bridge.
> + */
> +static inline struct drm_bridge *drm_bridge_get(struct drm_bridge *bridg=
e)
> +{
> +	if (!bridge)
> +		return bridge;
> +
> +	kref_get(&bridge->refcount);
> +
> +	return bridge;
> +}
> +
> +/**
> + * drm_bridge_put - Release a bridge reference
> + * @bridge: DRM bridge
> + *
> + * This function decrements the bridge's reference count and frees the
> + * object if the reference count drops to zero.
> + *
> + * See also drm_bridge_put_and_clear() which is more handy in many cases.
> + *
> + * Returns:
> + * Pointer to @bridge.
> + */
> +static inline struct drm_bridge *drm_bridge_put(struct drm_bridge *bridg=
e)
> +{
> +	if (!bridge)
> +		return bridge;
> +
> +	kref_put(&bridge->refcount, __drm_bridge_free);
> +
> +	return bridge;
> +}

I'm not sure we discussed it already, but why do you need to put both
drm_bridge_get and drm_bridge_put into the header, and thus export
__drm_bridge_free?

I'd expect both to be in drm_bridge.c?

> +
> +void drm_bridge_put_void(void *data);
> +
> +/**
> + * drm_bridge_put_and_clear - Given a bridge pointer, clear the pointer
> + *                            then put the bridge
> + *
> + * @bridge_pp: pointer to pointer to a struct drm_bridge
> + *
> + * Helper to put a DRM bridge (whose pointer is passed), but only after
> + * setting its pointer to NULL. Useful for drivers having struct drm_bri=
dge
> + * pointers they need to dispose of, without leaving a use-after-free
> + * window where the pointed bridge might have been freed while still
> + * holding a pointer to it.
> + *
> + * For example a driver having this private struct::
> + *
> + *     struct my_bridge {
> + *         struct drm_bridge *remote_bridge;
> + *         ...
> + *     };
> + *
> + * can dispose of remote_bridge using::
> + *
> + *     drm_bridge_put_and_clear(&my_bridge->remote_bridge);
> + */
> +static inline void drm_bridge_put_and_clear(struct drm_bridge **bridge_p=
p)
> +{
> +	struct drm_bridge *bridge =3D *bridge_pp;
> +
> +	*bridge_pp =3D NULL;
> +	drm_bridge_put(bridge);
> +}

I'm not convinced we need that one for now, and it doesn't look like
there's a user for it in your series, so I'd rather introduce it once we
actually need it.

>  void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t of=
fset,
>  			      const struct drm_bridge_funcs *funcs);
> =20
> @@ -951,6 +1038,10 @@ void *__devm_drm_bridge_alloc(struct device *dev, s=
ize_t size, size_t offset,
>   * @member: the name of the &drm_bridge within @type
>   * @funcs: callbacks for this bridge
>   *
> + * The returned refcount is initialized to 1.

I'm confused, there's no returned refcount here? Or did you mean the
returned bridge refcount?

Maxime

--ogfn2prbpwhr3lh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9RvuAAKCRAnX84Zoj2+
dtM5AYCvzfyI8gpm36jTfrIY96znjt1wzijA2lQ52UxjSFkYO9t694AMup+ITzs7
EyQVzgABgIg4gTydgrw1WqSFnOK2JnBDYv4sNhcaTrhO/VRhtqjjmYMxojwjjHEe
jjPoI3FqXw==
=Jlmw
-----END PGP SIGNATURE-----

--ogfn2prbpwhr3lh7--
