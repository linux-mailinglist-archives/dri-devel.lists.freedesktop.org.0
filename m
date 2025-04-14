Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9FA8877B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 17:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FFA10E622;
	Mon, 14 Apr 2025 15:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m1IjtOfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A75F10E622
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 15:40:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 10A2D451E7;
 Mon, 14 Apr 2025 15:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633B9C4CEE2;
 Mon, 14 Apr 2025 15:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744645248;
 bh=5QSDn6KKf0BI/D2F5oXgxnkoaf9AduFGO5YkzxDQTRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m1IjtOfF2xuF5dFlNxDnCXUTbL/f8ikg62tzfw46eJhMbatuCHPm7yAYF72xF7vd3
 sEnyrG2r7f0WZ2gijdKeXUYezJhOBDb4XN61H8IXVVXjTA5SW1HAD3sr+lcf1m+eyG
 sGNR+gcstIvDoWGLxUPk2XoWq9cdgo/VvMqx9mN34D3GI4LzgYm24Zp0p/yflkCaNS
 oqaUIFuMkvf1E0boe7dPeyX4F+OcLnGkXL7hHAx96JVjJ0lqaLCqKqSuQypfXedvwk
 TqI4ekc7Y3iWoVB7J6Cc0lqFG/DmekuEoBzc079X0k1h+6ZNYXsGjvOF1Zcvz4ETAR
 4ts/1LvqJjh9g==
Date: Mon, 14 Apr 2025 17:40:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] drm/bridge: documentat bridge allocation and
 lifecycle
Message-ID: <20250414-dangerous-stoic-lemur-5e083c@houat>
References: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
 <20250409-drm-bridge-alloc-doc-test-v7-1-a3ca4b97597f@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7r4bubvsnjmr6bbb"
Content-Disposition: inline
In-Reply-To: <20250409-drm-bridge-alloc-doc-test-v7-1-a3ca4b97597f@bootlin.com>
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


--7r4bubvsnjmr6bbb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] drm/bridge: documentat bridge allocation and
 lifecycle
MIME-Version: 1.0

Hi,

On Wed, Apr 09, 2025 at 04:50:34PM +0200, Luca Ceresoli wrote:
> Document in detail the DRM bridge allocation and refcounting process based
> on the recently introduced devm_drm_bridge_alloc().
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

There's a typo in your commit title.

> ---
>=20
> Changes in v7:
>  - remove mention of "legacy mode", we now support only refcounted
>    bridges
>  - rename patch title from "drm/bridge: add documentation of refcounted
>    bridges", we now support only refcounted bridges
>=20
> Changes in v6:
>  - update to the new devm_drm_bridge_alloc() API
>  - rewrite and improve various sentences for clarity
>  - fix typos (Randy Dunlap)
>=20
> This patch was added in v5.
> ---
>  Documentation/gpu/drm-kms-helpers.rst |  6 +++
>  drivers/gpu/drm/drm_bridge.c          | 73 +++++++++++++++++++++++++++++=
++++++
>  2 files changed, 79 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/dr=
m-kms-helpers.rst
> index 5139705089f200b189876a5a61bf2a935cec433a..393cd0e4cb5af3fe98674e7a9=
6c853ffb2556c97 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -151,6 +151,12 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>     :doc: overview
> =20
> +Bridge allocation and lifecycle
> +-------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> +   :doc: bridge lifecycle
> +
>  Display Driver Integration
>  --------------------------
> =20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b4c89ec01998b849018ce031c7cd84614e65e710..b7e1ad761dad52bdb2ec09d42=
5e69ee23a18fd36 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -61,6 +61,79 @@
>   * encoder chain.
>   */
> =20
> +/**
> + * DOC: bridge lifecycle
> + *
> + * In some use cases such as hot-plugging a DRM bridge device can
> + * physically disappear and reappear at runtime. To handle such cases
> + * without destroying and recreating the entire DRM pipeline, DRM bridge
> + * lifetime is managed using reference counting:

That case doesn't exist yet, so documenting it seems a source of confusion.

> + * - each &struct drm_bridge is reference counted since its allocation
> + * - any code taking a pointer to a bridge has APIs to get a reference a=
nd
> + *   put it when done, to ensure the memory allocated for the bridge won=
't
> + *   be deallocated while there is still a reference to it
> + * - the driver implementing the bridge also holds a reference, but the
> + *   allocated struct can survive the driver in case other references st=
ill
> + *   exist
> + * - deallocation is done when the last put happens, dropping the refcou=
nt
> + *   to zero
> + *
> + * Usage of refcounted bridges happens in two sides: the bridge *provide=
r*
> + * and the bridge *consumers*. The bridge provider is the driver
> + * implementing the bridge. The bridge consumers are all parts of the
> + * kernel taking a &struct drm_bridge pointer, including other bridges,
> + * encoders and the DRM core.
> + *
> + * For bridge **providers**, the bridge driver declares a driver-specific
> + * struct embedding a &struct drm_bridge. E.g.::
> + *
> + *   struct my_bridge {
> + *       ...
> + *       struct drm_bridge bridge;
> + *       ...
> + *   };
> + *
> + * The driver must allocate and initialize ``struct my_bridge`` using
> + * devm_drm_bridge_alloc(), as in this example::
> + *
> + *     static int my_bridge_probe(...)
> + *     {
> + *         struct device *dev =3D ...;
> + *         struct my_bridge *mybr;
> + *
> + *         mybr =3D devm_drm_bridge_alloc(dev, struct my_bridge, bridge,=
 &my_bridge_funcs);
> + *         if (IS_ERR(mybr))
> + *             return PTR_ERR(mybr);
> + *
> + *         // Get resources, initialize my_bridge members...
> + *         drm_bridge_add(&mybr->bridge);
> + *         ...
> + *     }
> + *
> + *     static void my_bridge_remove(...)
> + *     {
> + *         struct my_bridge *mybr =3D ...;
> + *
> + *         drm_bridge_remove(&mybr->bridge);
> + *         // Free resources
> + *         // ... NO kfree here!
> + *     }

This part is already documented by drm_bridge_add(), so it's not clear
what that section brings to the table either.

> + * Bridge **consumers** need to handle the case of a bridge being removed
> + * while they have a pointer to it. As this can happen at any time, such
> + * code can incur in use-after-free. To avoid that, consumers have to ca=
ll
> + * drm_bridge_get() when taking a pointer and drm_bridge_put() after they
> + * are done using it. This will extend the allocation lifetime of the
> + * bridge struct until the last reference has been put, potentially a lo=
ng
> + * time after the bridge device has been removed from the kernel.

And it's kind of the same thing here. You're saying here that every
consumer absolutely needs to call drm_bridge_get() and drm_bridge_put()
on their pointer ...

> + * Functions that return a pointer to a bridge, such as
> + * of_drm_find_bridge(), internally call drm_bridge_get() on the bridge
> + * they are about to return, so users using such functions to get a brid=
ge
> + * pointer only have to take care of calling drm_bridge_put().
> + */

=2E.. but that every function that gives you a pointer will take care of
drm_bridge_get already and (will) document that you need to call
drm_bridge_put ?

I guess my larger question is kind of an editorial one. What do you want
people to learn here that isn't in some function documentation already?
At the moment, it looks like a doc that used to be useful but got kind
of deprecated by the documentation you created on all the functions we
merged so far, or a documentation that might be useful at some point but
not quite yet. Either way, it's confusing.

Maxime

--7r4bubvsnjmr6bbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/0sfQAKCRDj7w1vZxhR
xaCOAP0fs5wqFsAMRRjpo4RFWiZr7coTS4MFS6msUslo7GPA6AD+JN13lmgDSnwt
TepAz3sv0KOKOs3KvskmyqtnrgJJ5AE=
=78Qg
-----END PGP SIGNATURE-----

--7r4bubvsnjmr6bbb--
