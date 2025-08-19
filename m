Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B77B2C000
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694AB10E5A0;
	Tue, 19 Aug 2025 11:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B0DNFhrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AAE10E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:15:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2184344C98;
 Tue, 19 Aug 2025 11:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D1BC4CEF1;
 Tue, 19 Aug 2025 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755602134;
 bh=kMnUYwQP+DdOU8NHJO6yq5VjpZNz60BrZq0kGU8lUqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B0DNFhrQkf61CLNcDm3FOQvUto7KbiKzaZCr6Pj03oSHhXZ7c3tX9q27cp7i3AP3y
 t1iHxpDi5OsxU7Tz90j4lHw5bd4c3OKWGc42X2Wf6KACm11+r5TYoBaeRgVbUvz7ac
 PBEOnIV0Z4/jIPu/Xz1Du2Cny0iI9u89u4J6bI6FCmXyxm0D2hTKvfkDQgaN41qt+Q
 V58nivdyCui9qaimtoysBkctMeMvY2EtOoJxSSm42uLYfaMrwFEpyMuoBD8xGR1ocm
 Bg8Gv9yGYYHNXllmIXZjDwlJ/jv7tlABBVBzryyromwtz+VzKIiR4mTVYbvwOF314y
 VWz6GNvIfRH5g==
Date: Tue, 19 Aug 2025 13:15:30 +0200
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
Subject: Re: [PATCH v7 2/3] drm/bridge: add list of removed refcounted bridges
Message-ID: <ecfsac5tok6bu7n6ctzt5j7n6vtiumn47iwmff4pid57kdsunz@wqxdxgsaibcw>
References: <20250819-drm-bridge-debugfs-removed-v7-0-970702579978@bootlin.com>
 <20250819-drm-bridge-debugfs-removed-v7-2-970702579978@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nsotnouia2rwiyj2"
Content-Disposition: inline
In-Reply-To: <20250819-drm-bridge-debugfs-removed-v7-2-970702579978@bootlin.com>
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


--nsotnouia2rwiyj2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/3] drm/bridge: add list of removed refcounted bridges
MIME-Version: 1.0

On Tue, Aug 19, 2025 at 11:42:11AM +0200, Luca Ceresoli wrote:
> Between drm_bridge_add() and drm_bridge_remove() bridges are "published" =
to
> the DRM core via the global bridge_list and visible in
> /sys/kernel/debug/dri/bridges. However between drm_bridge_remove() and the
> last drm_bridge_put() memory is still allocated even though the bridge is
> not "published", i.e. not in bridges_list, and also not visible in
> debugfs. This prevents debugging refcounted bridges lifetime, especially
> leaks due to any missing drm_bridge_put().
>=20
> In order to allow debugfs to also show the removed bridges, move such
> bridges into a new ad-hoc list until they are eventually freed.
>=20
> Note this requires adding INIT_LIST_HEAD(&bridge->list) in the bridge
> initialization code. The lack of such init was not exposing any bug so fa=
r,
> but it would with the new code, for example when a bridge is allocated and
> then freed without calling drm_bridge_add(), which is common on probe
> errors.
>=20
> Document the new behaviour of drm_bridge_remove() and update the
> drm_bridge_add() documentation to stay consistent.
>=20
> drm_bridge_add() needs special care for bridges being added after having
> been previously added and then removed.  This happens for example for many
> non-DCS DSI host bridge drivers like samsung-dsim which
> drm_bridge_add/remove() themselves every time the DSI device does a DSI
> attaches/detach. When the DSI device is hot-pluggable this happens multip=
le
> times in the lifetime of the DSI host bridge.  When this happens, the
> bridge->list is found in the removed list, not at the initialized state as
> drm_bridge_add() currently expects.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Changes in v7:
> - rebase on current drm-misc-next
> - remove if (drm_bridge_is_refcounted(bridge)), refcounting is now
>   mandatory
> - add check to detect when re-adding a bridge that is in the removed list
> - improve commit message
> - fix typo
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 36e0829d25c29457cff5da5fec99646c74b6ad5a..2e688ee14b9efbc810bcdb0ab=
7ecd4b688be8299 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -197,15 +197,22 @@
>   * driver.
>   */
> =20
> +/* Protect bridge_list and bridge_removed_list */
>  static DEFINE_MUTEX(bridge_lock);
>  static LIST_HEAD(bridge_list);
> +static LIST_HEAD(bridge_removed_list);

I'm not super fond of "removed" here, it's ambiguous, especially since
the bridge wouldn't be considered as removed after the last put.

lingering maybe?

> =20
>  static void __drm_bridge_free(struct kref *kref)
>  {
>  	struct drm_bridge *bridge =3D container_of(kref, struct drm_bridge, ref=
count);
> =20
> +	mutex_lock(&bridge_lock);
> +	list_del(&bridge->list);
> +	mutex_unlock(&bridge_lock);
> +
>  	if (bridge->funcs->destroy)
>  		bridge->funcs->destroy(bridge);
> +
>  	kfree(bridge->container);
>  }
> =20
> @@ -275,6 +282,7 @@ void *__devm_drm_bridge_alloc(struct device *dev, siz=
e_t size, size_t offset,
>  		return ERR_PTR(-ENOMEM);
> =20
>  	bridge =3D container + offset;
> +	INIT_LIST_HEAD(&bridge->list);
>  	bridge->container =3D container;
>  	bridge->funcs =3D funcs;
>  	kref_init(&bridge->refcount);
> @@ -288,10 +296,13 @@ void *__devm_drm_bridge_alloc(struct device *dev, s=
ize_t size, size_t offset,
>  EXPORT_SYMBOL(__devm_drm_bridge_alloc);
> =20
>  /**
> - * drm_bridge_add - add the given bridge to the global bridge list
> + * drm_bridge_add - publish a bridge
>   *
>   * @bridge: bridge control structure
>   *
> + * Add the given bridge to the global list of "published" bridges, where
> + * they can be found by users via of_drm_find_bridge().

It's quite a change in semantics, at least in the doc. I believe it
should be a separate patch, since it's really more about updating the
drm_bridge_add / drm_bridge_remove doc than collecting the
removed-but-not-freed bridges.

Also, I'm not sure if it's more obvious here. The quotes around publish
kind of it to that too. Maybe using register / registration would make
it more obvious?

Maxime

--nsotnouia2rwiyj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKRczQAKCRAnX84Zoj2+
dgXtAX9SgyL+O/+ndp90CYpn+wH3ax9YUd9RjgKIfBDLu5PvchzpeRiLkvuSw3/K
4qFv3QwBfA1KiLO2rkETWPOnEmSDhrpvllgdOl/mGmY4mwQZ6n23bDNgJxuqwb/N
Nf3FJ0a15w==
=Bwie
-----END PGP SIGNATURE-----

--nsotnouia2rwiyj2--
