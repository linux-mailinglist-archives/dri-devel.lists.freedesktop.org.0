Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB3A80F06
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A61A10E245;
	Tue,  8 Apr 2025 14:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nGstXoNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656E10E245
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:57:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B0F7EA4126C;
 Tue,  8 Apr 2025 14:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8009C4CEE7;
 Tue,  8 Apr 2025 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744124267;
 bh=4f9zShnuQnFyWbqqWcvoaYnR7xN61wiLeUuAAXDZocQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nGstXoNHU4YK1QTWZLYeq/Xedj9fpS+JlI7KEv0mar+DwPZU7r8wbgB6BCWbvyI5E
 puJTmNuTRK7h9yrAewkRSc6QXGuVK0rju2yumRu7RnzAOxjv4dI4WQods4E0mFfzSr
 9ncbXOYbabOaCwffaf7B4j1jgDRzmSqxtlCKS4Bv8A2C3RQ4Q8C/1rP6d2xPsQaZmz
 h2gJDLlCXiv2Zs2PprPN0m4GSKh6n9TwoPrOVzi0gQ385lxBt+w9ajwpm5xztNJ+AN
 USb4rQ93+LpGKK9vhoTbarGqkdKXWezjccnNIofKEfAxWfr9KtLdV+G3KdFnSVH1uF
 cO7K55vzwhWcg==
Date: Tue, 8 Apr 2025 16:57:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Anusha Srivatsa <asrivats@redhat.com>
Subject: Re: [PATCH 1/3] drm/panel: auo-a030jtn01: Fix compilation build
Message-ID: <20250408-imaginary-khaki-sloth-eeceff@houat>
References: <20250408122008.1676235-1-mripard@kernel.org>
 <nyrjnvctqnk6f3x5q7rlmy5nb7iopoti56pgh43zqknici5ms4@cibpldh7epra>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ihndz6ioe6gqkxtu"
Content-Disposition: inline
In-Reply-To: <nyrjnvctqnk6f3x5q7rlmy5nb7iopoti56pgh43zqknici5ms4@cibpldh7epra>
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


--ihndz6ioe6gqkxtu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] drm/panel: auo-a030jtn01: Fix compilation build
MIME-Version: 1.0

Hi Lucas,

On Tue, Apr 08, 2025 at 09:34:22AM -0500, Lucas De Marchi wrote:
> On Tue, Apr 08, 2025 at 02:20:06PM +0200, Maxime Ripard wrote:
> > Commit 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in
> > place of devm_kzalloc()") switched from a kmalloc + drm_panel_init call
> > to a devm_drm_panel_alloc one.
> >=20
> > However, the variable it was storing the allocated pointer in doesn't
> > exist, resulting in a compilation breakage.
> >=20
> > Fixes: 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in=
 place of devm_kzalloc()")
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> I still get a failure in modpost:
>=20
> 	ERROR: modpost: "__devm_drm_panel_alloc" [drivers/gpu/drm/panel/panel-au=
o-a030jtn01.ko] undefined!
>=20
> because that entire block is:
>=20
> 	#ifdef CONFIG_OF
>=20
> Based on the header, I think the intention wasn't to add those functions
> there, right? Moving it outside the ifdef at least fixes the build for
> me.
>=20
> Lucas De Marchi
>=20
> -------8<------------
> Subject: [PATCH] drm/panel: Fix build error on !CONFIG_OF
>=20
> Move helpers outside of CONFIG_OF, so basic allocation also works
> without it.
>=20
> Fixes: ed9c594d495d ("drm/panel: Add new helpers for refcounted panel all=
ocatons")
> Fixes: dcba396f6907 ("drm/panel: Add refcount support")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 76 ++++++++++++++++++-------------------
>  1 file changed, 38 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 870bf8d471ee9..99b348782ce31 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -318,44 +318,6 @@ int drm_panel_get_modes(struct drm_panel *panel,
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
> -#ifdef CONFIG_OF
> -/**
> - * of_drm_find_panel - look up a panel using a device tree node
> - * @np: device tree node of the panel
> - *
> - * Searches the set of registered panels for one that matches the given =
device
> - * tree node. If a matching panel is found, return a pointer to it.
> - *
> - * Return: A pointer to the panel registered for the specified device tr=
ee
> - * node or an ERR_PTR() if no panel matching the device tree node can be=
 found.
> - *
> - * Possible error codes returned by this function:
> - *
> - * - EPROBE_DEFER: the panel device has not been probed yet, and the cal=
ler
> - *   should retry later
> - * - ENODEV: the device is not available (status !=3D "okay" or "ok")
> - */
> -struct drm_panel *of_drm_find_panel(const struct device_node *np)
> -{
> -	struct drm_panel *panel;
> -
> -	if (!of_device_is_available(np))
> -		return ERR_PTR(-ENODEV);
> -
> -	mutex_lock(&panel_lock);
> -
> -	list_for_each_entry(panel, &panel_list, list) {
> -		if (panel->dev->of_node =3D=3D np) {
> -			mutex_unlock(&panel_lock);
> -			return panel;
> -		}
> -	}
> -
> -	mutex_unlock(&panel_lock);
> -	return ERR_PTR(-EPROBE_DEFER);
> -}
> -EXPORT_SYMBOL(of_drm_find_panel);
> -
>  static void __drm_panel_free(struct kref *kref)
>  {
>  	struct drm_panel *panel =3D container_of(kref, struct drm_panel, refcou=
nt);
> @@ -443,6 +405,44 @@ void *__devm_drm_panel_alloc(struct device *dev, siz=
e_t size, size_t offset,
>  }
>  EXPORT_SYMBOL(__devm_drm_panel_alloc);
> +#ifdef CONFIG_OF
> +/**
> + * of_drm_find_panel - look up a panel using a device tree node
> + * @np: device tree node of the panel
> + *
> + * Searches the set of registered panels for one that matches the given =
device
> + * tree node. If a matching panel is found, return a pointer to it.
> + *
> + * Return: A pointer to the panel registered for the specified device tr=
ee
> + * node or an ERR_PTR() if no panel matching the device tree node can be=
 found.
> + *
> + * Possible error codes returned by this function:
> + *
> + * - EPROBE_DEFER: the panel device has not been probed yet, and the cal=
ler
> + *   should retry later
> + * - ENODEV: the device is not available (status !=3D "okay" or "ok")
> + */
> +struct drm_panel *of_drm_find_panel(const struct device_node *np)
> +{
> +	struct drm_panel *panel;
> +
> +	if (!of_device_is_available(np))
> +		return ERR_PTR(-ENODEV);
> +
> +	mutex_lock(&panel_lock);
> +
> +	list_for_each_entry(panel, &panel_list, list) {
> +		if (panel->dev->of_node =3D=3D np) {
> +			mutex_unlock(&panel_lock);
> +			return panel;
> +		}
> +	}
> +
> +	mutex_unlock(&panel_lock);
> +	return ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL(of_drm_find_panel);
> +
>  /**
>   * of_drm_get_panel_orientation - look up the orientation of the panel t=
hrough
>   * the "rotation" binding from a device tree node

It's a bit hard to read with that change log, but assuming this doesn't
change of_drm_find_panel,

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ihndz6ioe6gqkxtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/U5ZwAKCRDj7w1vZxhR
xTMGAP4kihb5Y79TwKtp+a1KfxJRpQHkD/A+EXQV4aoFUuU5CgD9Eu2iqsGcrYjy
U2ME/5r7pQV6Izl9DzA13+PQKY5yhwU=
=rxYk
-----END PGP SIGNATURE-----

--ihndz6ioe6gqkxtu--
