Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B4A2C1E2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 12:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB0B10EAEA;
	Fri,  7 Feb 2025 11:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HPfTnn/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6B010EAE6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 11:47:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 711E0A4325B;
 Fri,  7 Feb 2025 11:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86377C4CED1;
 Fri,  7 Feb 2025 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738928874;
 bh=nEdBXnQOKdhAznLz7iWf7QdsK9vcI38EpNgrZYx51b0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HPfTnn/G8Kfuy6BFL8oJzo7HRZNgNcwUfKwiv7MYu/FzQDFZ70VpvttQzTigwYqKw
 SCrMbw70yRmUNreLqA8lXOGzBL4dZIiVr6Fnw2qk1aOSbWEJlKM+1i4UPQBxfbkxwH
 Fj9OzFn1jT980/Ep415KnJh78j944B3PKFu4Slqw8iPBPF8Q+FMSTlbtD6t4alJptI
 nF9RIWMduDMMCvtjH/LkLLjnTbSOyPjrX/Kwt0pmHqXFd9v2gBG36decnVB47ZyJgR
 7peNSMHX8hA6yiAweNkBYSxI5Vu5IA9UFoBmgdJ3LeQK+imd8pV96VP1yIEDOA1W4Y
 eex0KKdFfWDWQ==
Date: Fri, 7 Feb 2025 12:47:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250207-ingenious-daffodil-dugong-51be57@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="onr6klnz6qtdrilr"
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
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


--onr6klnz6qtdrilr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

Hi,

On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> DRM bridges are currently considered as a fixed element of a DRM card, and
> thus their lifetime is assumed to extend for as long as the card
> exists. New use cases, such as hot-pluggable hardware with video bridges,
> require DRM bridges to be added and removed to a DRM card without tearing
> the card down. This is possible for connectors already (used by DP MST), =
so
> add this possibility to DRM bridges as well.
>=20
> Implementation is based on drm_connector_init() as far as it makes sense,
> and differs when it doesn't. A difference is that bridges are not exposed
> to userspace, hence struct drm_bridge does not embed a struct
> drm_mode_object which would provide the refcount. Instead we add to struct
> drm_bridge a refcount field (we don't need other struct drm_mode_object
> fields here) and instead of using the drm_mode_object_*() functions we
> reimplement from those functions the few lines that drm_bridge needs for
> refcounting.
>=20
> Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
> bridge.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

So, a couple of general comments:

- I've said it a couple of times already, but I really think you're
  making it harder than necessary for you here. This (and only this!)
  should be the very first series you should be pushing. The rest can
  only ever work if that work goes through, and it's already hard enough
  as it is. So, split that patch into a series of its own, get that
  merged, and then we will be able to deal with panels conversion and
  whatever. That's even more true with panels since there's ongoing work
  that will make it easier for you too. So the best thing here is
  probably to wait.

- This patch really needs to be split into several patches, something
  along the lines of:

  + Creating devm_drm_bridge_alloc()
  + Adding refcounting
  + Taking the references in all the needed places
  + Converting a bunch of drivers

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
>  drivers/gpu/drm/drm_bridge.c |  76 ++++++++++++++++++++++++++--
>  include/drm/drm_bridge.h     | 117 +++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 189 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 1955a231378050abf1071d74a145831b425c47c5..f694b32ca59cb91c32846bc00=
b43360df41cc1ad 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -200,6 +200,57 @@
>  DEFINE_MUTEX(bridge_lock);
>  LIST_HEAD(bridge_list);
> =20
> +/* Internal function (for refcounted bridges) */
> +void __drm_bridge_free(struct kref *kref)
> +{
> +	struct drm_bridge *bridge =3D container_of(kref, struct drm_bridge, ref=
count);
> +	void *container =3D ((void *)bridge) - bridge->container_offset;
> +
> +	DRM_DEBUG("bridge=3D%p, container=3D%p FREE\n", bridge, container);

Pointers are not really useful to track here, since they are obfuscated
most of the time. Using the bridge device name would probably be better
(or removing the SHOUTING DEBUG entirely :))

> +	kfree(container);
> +}
> +EXPORT_SYMBOL(__drm_bridge_free);
> +
> +static void drm_bridge_put_void(void *data)
> +{
> +	struct drm_bridge *bridge =3D (struct drm_bridge *)data;
> +
> +	drm_bridge_put(bridge);
> +}
> +
> +void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t of=
fset,
> +			      const struct drm_bridge_funcs *funcs)
> +{
> +	void *container;
> +	struct drm_bridge *bridge;
> +	int err;
> +
> +	if (!funcs) {
> +		dev_warn(dev, "Missing funcs pointer\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	container =3D kzalloc(size, GFP_KERNEL);
> +	if (!container)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bridge =3D container + offset;
> +	bridge->container_offset =3D offset;
> +	bridge->funcs =3D funcs;
> +	kref_init(&bridge->refcount);
> +	bridge->is_refcounted =3D 1;
> +
> +	err =3D devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	DRM_DEBUG("bridge=3D%p, container=3D%p, funcs=3D%ps ALLOC\n", bridge, c=
ontainer, funcs);
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__devm_drm_bridge_alloc);
> +
>  /**
>   * drm_bridge_add - add the given bridge to the global bridge list
>   *
> @@ -209,6 +260,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
>  {
>  	struct drm_bridge *br, *tmp;
> =20
> +	DRM_DEBUG("bridge=3D%p ADD\n", bridge);
> +
> +	drm_bridge_get(bridge);
> +
>  	mutex_init(&bridge->hpd_mutex);
> =20
>  	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> @@ -257,6 +312,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>  {
>  	struct drm_bridge *br, *tmp;
> =20
> +	DRM_DEBUG("bridge=3D%p REMOVE\n", bridge);
> +
>  	mutex_lock(&bridge_lock);
>  	list_del_init(&bridge->list);
>  	mutex_unlock(&bridge_lock);
> @@ -266,6 +323,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>  			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
> =20
>  	mutex_destroy(&bridge->hpd_mutex);
> +
> +	drm_bridge_put(bridge);
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
> =20
> @@ -326,11 +385,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, =
struct drm_bridge *bridge,
>  	if (!encoder || !bridge)
>  		return -EINVAL;
> =20
> -	if (previous && (!previous->dev || previous->encoder !=3D encoder))
> -		return -EINVAL;
> +	drm_bridge_get(bridge);
> =20
> -	if (bridge->dev)
> -		return -EBUSY;
> +	if (previous && (!previous->dev || previous->encoder !=3D encoder)) {
> +		ret =3D -EINVAL;
> +		goto err_put_bridge;
> +	}
> +
> +	if (bridge->dev) {
> +		ret =3D -EBUSY;
> +		goto err_put_bridge;
> +	}
> =20
>  	bridge->dev =3D encoder->dev;
>  	bridge->encoder =3D encoder;
> @@ -379,6 +444,8 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
ruct drm_bridge *bridge,
>  			      "failed to attach bridge %pOF to encoder %s\n",
>  			      bridge->of_node, encoder->name);
> =20
> +err_put_bridge:
> +	drm_bridge_put(bridge);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_bridge_attach);
> @@ -399,6 +466,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
> =20
>  	list_del(&bridge->chain_node);
>  	bridge->dev =3D NULL;
> +	drm_bridge_put(bridge);
>  }
> =20
>  /**
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad2bab=
febea62db1d9e43 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -31,6 +31,7 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_print.h>
> =20
>  struct device_node;
> =20
> @@ -863,6 +864,22 @@ struct drm_bridge {
>  	const struct drm_bridge_timings *timings;
>  	/** @funcs: control functions */
>  	const struct drm_bridge_funcs *funcs;
> +
> +	/**
> +	 * @container_offset: Offset of this struct within the container
> +	 * struct embedding it. Used for refcounted bridges to free the
> +	 * embeddeing struct when the refcount drops to zero. Unused on
> +	 * legacy bridges.
> +	 */
> +	size_t container_offset;

This shouldn't be in there. You can create an intermediate structure and
store both pointers for the action to consume.

> +	/**
> +	 * @refcount: reference count for bridges with dynamic lifetime
> +	 * (see drm_bridge_init)
> +	 */
> +	struct kref refcount;
> +	/** @is_refcounted: this bridge has dynamic lifetime management */
> +	bool is_refcounted;
> +

I'm not sure we want to treat both paths separately too. It'll require
to update most of/all the drivers, but it's not too hard with
coccinelle:

virtual patch

@@
identifier f;
identifier b, c, d;
expression bf;
type T;
@@

 f(...)
 {
	...
-	T *c;
+	T *c;
	...
-	c =3D devm_kzalloc(d, ...);
+	c =3D devm_drm_bridge_alloc(d, T, b, bf);
	...
-	c->b.funcs =3D bf;
	...
	drm_bridge_add(&c->b);
	...
 }

We need to add a bit more variations (like kzalloc vs devm_kzalloc,
drm_bridge_add vs devm_drm_bridge_add, etc.), but it should be a good
first approximation

Maxime

--onr6klnz6qtdrilr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6Xy2wAKCRAnX84Zoj2+
dlxoAX9TP8qOkQ0zoddMR5ii8MgL64pt6E8LkMYScFxgRiGlWE8FkjffkXmD5uAv
LRbGvWEBfRh9LAS0twZb7UV9k+bsXBpO84KxLkYUPBuu0xs2nRUYsfKm7hu2pw4l
lZArDO243A==
=F2Te
-----END PGP SIGNATURE-----

--onr6klnz6qtdrilr--
