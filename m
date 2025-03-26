Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4EA71A2B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5841110E6F2;
	Wed, 26 Mar 2025 15:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NgbxCAQ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD64610E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:25:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0454D43811;
 Wed, 26 Mar 2025 15:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F1BC4CEE2;
 Wed, 26 Mar 2025 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743002709;
 bh=kt+LdfFip12WDLC5j3cmKeWc4UoHGSmUrB0AJQ2jWlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NgbxCAQ7jAuOweaU4SDrahAdnPPPj3DFEv1JhosQrZBqWEqbSNE4mBoYVpo9puiR4
 joKzu5ydeMX+xHvWvCBngu7uRMQE8nuaVRobr0il5yv8JLhOdaUs93WWGfXqOYHFBR
 g2s0pQgXfL7ZoQzX/OjF6FQd0LaANruirSUGw0OSl3MuI0LirP3G9bliGQK9qvXvo9
 a3e+/UB0ySWusYu1fM2vQdCf0pvaV16el8ipvn327JvFvCyBef9AYccS8bpdZpV9/T
 sD+0sKi7WG0G854sZZgjcRweX/QRio7lpsQmQwkYjC4JYrN86z93MrAwPZbi3MBEpB
 I35ka/GuhhBVQ==
Date: Wed, 26 Mar 2025 16:25:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/5] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250326-illegal-vicugna-of-reverence-e4c3d1@houat>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-1-4e2bf5d19c5d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w5aflokbiw5fdb7n"
Content-Disposition: inline
In-Reply-To: <20250325-b4-panel-refcounting-v1-1-4e2bf5d19c5d@redhat.com>
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


--w5aflokbiw5fdb7n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0

On Tue, Mar 25, 2025 at 01:24:08PM -0400, Anusha Srivatsa wrote:
> Introduce reference counted allocations for panels to avoid
> use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> to allocate a new refcounted panel. Followed the documentation for
> drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> implementations for this purpose.
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++
>  include/drm/drm_panel.h     | 22 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index c627e42a7ce70459f50eb5095fffc806ca45dabf..bdeab5710ee324dc1742fbc77=
582250960556308 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -355,6 +355,31 @@ struct drm_panel *of_drm_find_panel(const struct dev=
ice_node *np)
>  }
>  EXPORT_SYMBOL(of_drm_find_panel);
> =20
> +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t off=
set,
> +			     const struct drm_panel_funcs *funcs,
> +			     int connector_type)
> +{
> +	void *container;
> +	struct drm_panel *panel;
> +
> +	if (!funcs) {
> +		dev_warn(dev, "Missing funcs pointer\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> +	if (!container)
> +		return ERR_PTR(-ENOMEM);
> +
> +	panel =3D container + offset;
> +	panel->funcs =3D funcs;
> +
> +	drm_panel_init(panel, dev, funcs, connector_type);
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__devm_drm_panel_alloc);
> +
>  /**
>   * of_drm_get_panel_orientation - look up the orientation of the panel t=
hrough
>   * the "rotation" binding from a device tree node
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index a9c042c8dea1a82ef979c7a68204e0b55483fc28..63fb1dbe15a0556e7484bc187=
37a6b1f4c208b0c 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -28,6 +28,7 @@
>  #include <linux/errno.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/kref.h>
> =20
>  struct backlight_device;
>  struct dentry;
> @@ -268,6 +269,27 @@ struct drm_panel {
>  	bool enabled;
>  };
> =20
> +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t off=
set,
> +			     const struct drm_panel_funcs *funcs,
> +			     int connector_type);
> +
> +/**
> + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
> + * @dev: struct device of the panel device
> + * @type: the type of the struct which contains struct &drm_panel
> + * @member: the name of the &drm_panel within @type
> + * @funcs: callbacks for this panel
> + * @connector_type: connector type of the driver
> + * The returned refcount is initialised to 1

There's not returned refcount. What is returned is a pointer to the
container structure. You should mention that the reference count is
initialized to 1, and will be given back automatically through a devm
action.

Iirc, Luca had a similar mention in his series, if you need inspiration.

> + * Returns:
> + * Pointer to new panel, or ERR_PTR on failure.

It doesn't return a pointer to the new panel, but to the structure
containing the panel.

Maxime

--w5aflokbiw5fdb7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+QcTAAKCRDj7w1vZxhR
xR34AP0VPzR1Vh27yHyFY3AMWW8VIZce+7PEjB5diAGv7vXl2wEAi2DiPaz0gmCJ
srThpK1ea4mhDs7YEH9HpYH/+BcEggc=
=UONS
-----END PGP SIGNATURE-----

--w5aflokbiw5fdb7n--
