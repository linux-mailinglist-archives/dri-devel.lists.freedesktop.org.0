Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303AAB5729C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 10:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5D610E33F;
	Mon, 15 Sep 2025 08:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AqZC4ldO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C9810E33F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 08:13:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 46E0E60191;
 Mon, 15 Sep 2025 08:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ED9C4CEF1;
 Mon, 15 Sep 2025 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757924000;
 bh=Kvxbq8ZY50iQtwSPw2J7cxdtxmgCPslX5dJPedZwKAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AqZC4ldOZRFXgYCHja1IHKT9emRrGnijp+xI/S3jBWd5HwRBLHhmAE2/Gor3Bb8xx
 Q6tOUr4ELEnuN3V5zkP2Kv9bLBdoxh+l+pkzDnuDWTMMwcOhnL1mXQPIKVhB3jrg8n
 axMCVX5RWa2amkqoz2Iq5q4klOlirBZ1IFWxIgFV1+r2tsz06FP/DGXcsx5l80Nwqe
 DFDltc0sJIJmTVvrKYx52FtFPjV3xofsSFM7FUVP8sVkoorh1Q9sIQ/Gfo8GWtQNtP
 7Ecvx/O38ZL0fbkE8eG7IRuLATcas3RdB7RUROoS8f8RojUjOqJbRgkGoI9j91T4i9
 JMj4eI2x3+iTA==
Date: Mon, 15 Sep 2025 10:13:16 +0200
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
Subject: Re: [PATCH v8 0/3] drm/bridge: debugfs: show refcount and list
 removed bridges
Message-ID: <20250915-celadon-dalmatian-of-defense-ca56fb@penduick>
References: <20250912-drm-bridge-debugfs-removed-v8-0-5c33d87ccb55@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rynp5u3443fr6mka"
Content-Disposition: inline
In-Reply-To: <20250912-drm-bridge-debugfs-removed-v8-0-5c33d87ccb55@bootlin.com>
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


--rynp5u3443fr6mka
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 0/3] drm/bridge: debugfs: show refcount and list
 removed bridges
MIME-Version: 1.0

Hi,

On Fri, Sep 12, 2025 at 07:03:40PM +0200, Luca Ceresoli wrote:
> This series shows removed bridges to the global <debugfs>/dri/bridges fil=
e.
> Removed bridges are bridges after drm_bridges_remove() but before they are
> eventually freed on the last drm_bridge_put().
>=20
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [1].
> Here's the work breakdown (=E2=9E=9C marks the current series):
>=20
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [1].
> Here's the work breakdown (=E2=9E=9C marks the current series):
>=20
>  1. =E2=9E=9C add refcounting to DRM bridges (struct drm_bridge)
>     (based on devm_drm_bridge_alloc() [0])
>     A. =E2=9C=94 add new alloc API and refcounting (v6.16)
>     B. =E2=9C=94 convert all bridge drivers to new API (v6.17-rc1)
>     C. =E2=9C=94 kunit tests (v6.17-rc1)
>     D. =E2=9C=94 add get/put to drm_bridge_add/remove() + attach/detach()
>          and warn on old allocation pattern (v6.17-rc1)
>     E. =E2=80=A6 add get/put on drm_bridge accessors
>        1. =E2=9C=94 drm_bridge_chain_get_first_bridge() + add a cleanup a=
ction
>             (drm-misc-next)
>        2. =E2=9C=94 drm_bridge_get_prev_bridge() (drm-misc-next)
>        3. =E2=80=A6=E2=9C=94 drm_bridge_get_next_bridge() (partially in d=
rm-misc-next)
>        4. =E2=80=A6=E2=9C=94 drm_for_each_bridge_in_chain() (partially in=
 drm-misc-next)
>        5. drm_bridge_connector_init
>        6. of_drm_find_bridge
>        7. drm_of_find_panel_or_bridge, *_of_get_bridge
>     F. =E2=9E=9C debugfs improvements
>        1. =E2=9C=94 add top-level 'bridges' file (v6.16)
>        2. =E2=9E=9C show refcount and list removed bridges
>  2. =E2=80=A6 handle gracefully atomic updates during bridge removal
>  3. =E2=80=A6 DSI host-device driver interaction
>  4. finish the hotplug bridge work, removing the "always-disconnected"
>     connector, moving code to the core and potentially removing the
>     hotplug-bridge itself (this needs to be clarified as points 1-3 are
>     developed)
>=20
> To show the removed bridges we need to keep track of them, thus add a new
> global list to store them between drm_bridge_remove() and the eventual
> free. This is bit tricky in case a bridge is removed and then re-added
> before being freed. This is handled in patch 2.

Once the minor issue I've reported is fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--rynp5u3443fr6mka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMfKnAAKCRAnX84Zoj2+
dlKYAYD7SFCnv2TDp1PGc/l9hD3mYR4yR5P2m7uMrazIPw3WSqltarINhLE5NF9j
BvnyseYBf2lWvLrpKPDHBv3V68H4pUhX6zhFKx9mP3wzy+V0UpAseKYILndRQqry
urylVEvhpA==
=TSKv
-----END PGP SIGNATURE-----

--rynp5u3443fr6mka--
