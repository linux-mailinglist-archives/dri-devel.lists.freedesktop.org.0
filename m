Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF35AC102C
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5F010E0E7;
	Thu, 22 May 2025 15:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n3EZwBJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A511210E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:43:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 40CB662A45;
 Thu, 22 May 2025 15:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73342C4CEE4;
 Thu, 22 May 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747928621;
 bh=c8OL6PpN47V/G4B7m2WiV8zHMTLMhBQlndjpc2oamTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n3EZwBJ3UKlMe0byRqGTTH1EGdfPEHEsRe/IxKBM+LkTo/EZOZ4FaBkwkoVySMthA
 L5vfVH7ru5EA4Bg8BcM33Xtq39aUOIrHqf5Cz6dkNolM3i/Hejf1ViGAYzUsRlmAjs
 3YmN2b0gR5D0Jh8NLm1aMhFo6aiTsCba5xgCJmjlHQ8mvtxACAMnEoPWxxmXhQ0LgS
 I6TYTHL6MlpQSYCkTp33fndSGsT9uD+xl8dnHNi+evrsHwm6bDRlhoj0J/7hJSQFc6
 rtIDUEFN/H9AMU0RkGEpMOJJtJn5J6bR2zwIkkESy/Mf3/9BgNhqEZQJ+vIo8EjKGB
 WYSvEnQBxdZwA==
Date: Thu, 22 May 2025 17:43:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] dmr/bridge: add a .destroy func
Message-ID: <20250522-hot-hopeful-smilodon-dfb5b6@houat>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
 <20250516-drm-bridge-alloc-doc-test-v8-2-7e356fd58ba5@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wagilyymp6isqxif"
Content-Disposition: inline
In-Reply-To: <20250516-drm-bridge-alloc-doc-test-v8-2-7e356fd58ba5@bootlin.com>
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


--wagilyymp6isqxif
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 2/3] dmr/bridge: add a .destroy func
MIME-Version: 1.0

On Fri, May 16, 2025 at 06:48:38PM +0200, Luca Ceresoli wrote:
> Some users of DRM bridges may need to execute specific code just before
> deallocation.
>=20
> As of now the only known user would be KUnit tests.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch is new in v8. The .destroy callback had appeared in v5 as well
> [5], but as part of a larger patch and for different reason that do not
> apply anymore.
>=20
> [5] https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-3-173065a1=
ece1@bootlin.com/#t
> ---
>  drivers/gpu/drm/drm_bridge.c |  2 ++
>  include/drm/drm_bridge.h     | 10 ++++++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b4c89ec01998b849018ce031c7cd84614e65e710..6185cb29fe3162264f0912c09=
c205fb467975dee 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -203,6 +203,8 @@ static void __drm_bridge_free(struct kref *kref)
>  {
>  	struct drm_bridge *bridge =3D container_of(kref, struct drm_bridge, ref=
count);
> =20
> +	if (bridge->funcs->destroy)
> +		bridge->funcs->destroy(bridge);
>  	kfree(bridge->container);
>  }
> =20
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..3ccd493faa580845c2ed1166f=
398eca27b464261 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -86,6 +86,16 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*detach)(struct drm_bridge *bridge);
> =20
> +	/**
> +	 * @destroy:
> +	 *
> +	 * This callback is invoked when the bridge is about to be
> +	 * deallocated.
> +	 *
> +	 * The @destroy callback is optional.
> +	 */
> +	void (*destroy)(struct drm_bridge *bridge);
> +

destroy is before detach in alphabetical order, but otherwise it looks
good to me.

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--wagilyymp6isqxif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC9GKAAKCRAnX84Zoj2+
dlrbAYCoHT8OaEnv8+xh/VR+KvYz5K5EAHovgvqTLDuo9f1Wc0zAF/YiqgfINEDS
w2CmeY4BgJBEARiEm8Z6K2XWJZrL/GpWDPS+7KKbiWSlZoAMs6EcYEOYXNlTWO4s
JP2ZfjitvA==
=5rIp
-----END PGP SIGNATURE-----

--wagilyymp6isqxif--
