Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B70BB71CC
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4727610E917;
	Fri,  3 Oct 2025 14:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DH4xTRGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ED610E917
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:04:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B7C686216F;
 Fri,  3 Oct 2025 14:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1637EC4CEF5;
 Fri,  3 Oct 2025 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759500293;
 bh=kyzVK8/+AQWL2YDAf2Uh/No9phkR9UlQlj4bn/NRLos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DH4xTRGNT9XbL7k7G2f9lqUohgmPxEIKr1EvuAkY8/L5AWFJKCrlB+0DWzLaGLzKz
 wgK2JnK8omSNMSEJ55MYpa8GNjxP/5ZFUhrAJuAzXme4sNpCPsqnubr7Q7AhUqp+xN
 adIBB31GOpanYT0/Xnaxn2a07A48V7QDBfGYm6b2yY06QKK4rxr/d1mkCEgqZ31Js8
 SGKgbzqQnW4yssefJN+/Crmb1UPl+J92S8m8nDljV1XhRU1sLEaf5+szwP/hfeopo5
 4NNO5/MG89Gfhsh2snKfSzj7PsIKL+hDreT+ZXuorK6+x6NrPlCefPfxr8pPEmlpIX
 65OG3y5m+8hDg==
Date: Fri, 3 Oct 2025 16:04:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/bridge: lock the encoder chain in scoped
 for_each loops
Message-ID: <20251003-dexterous-loose-guppy-45e1b3@houat>
References: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
 <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-4-78bf61580a06@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="j5nphwk6lufmqwdg"
Content-Disposition: inline
In-Reply-To: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-4-78bf61580a06@bootlin.com>
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


--j5nphwk6lufmqwdg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] drm/bridge: lock the encoder chain in scoped
 for_each loops
MIME-Version: 1.0

On Fri, Oct 03, 2025 at 12:39:26PM +0200, Luca Ceresoli wrote:
> drm_for_each_bridge_in_chain_scoped() and
> drm_for_each_bridge_in_chain_from() currently get/put the bridge at each
> iteration. But they don't protect the encoder chain, so it could change
> (bridges added/removed) while some code is iterating over the list
> itself. To make iterations safe, change the logic of these for_each macros
> to lock the encoder chain mutex at the beginning and unlock it at the end
> of the loop (be it at the end of the list, or earlier due to a 'break' or
> 'return' statement).
>=20
> Also remove the get/put on the current bridge because it is not needed
> anymore. In fact all bridges in the encoder chain are refcounted already
> thanks to the drm_bridge_get() in drm_bridge_attach() and the
> drm_bridge_put() in drm_bridge_detach(). So while iterating with the mutex
> held the list cannot change _and_ the refcount of all bridges in the list
> cannot drop to zero.

This second paragraph *really* needs to be its own patch. And I'm not
really sure playing games when it comes to refcounting is a good idea.

A strict, simple, rule is way easier to follow than trying to figure out
two years from now why this loop skips the refcounting.

Unless you have a performance issue that is, in which case you should
add a comment (and we will need a meaningful benchmark to back that
claim).

> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Changed in v2:
> - Fixed infinite loop in drm_for_each_bridge_in_chain_scoped() when
>   encoder->bridge_chain is empty, reported here:
>   https://lore.kernel.org/lkml/202509301358.38036b85-lkp@intel.com/
> - Slightly improved commit message
> ---
>  include/drm/drm_bridge.h | 62 ++++++++++++++++++++++++++----------------=
------
>  1 file changed, 33 insertions(+), 29 deletions(-)
>=20
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 0ff7ab4aa8689a022458f935a7ffb23a2b715802..5a72817f04a78f5379f69e72f=
e519c5eb3ea043e 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1440,26 +1440,29 @@ drm_bridge_chain_get_last_bridge(struct drm_encod=
er *encoder)
>  						      struct drm_bridge, chain_node));
>  }
> =20
> -/**
> - * drm_bridge_get_next_bridge_and_put - Get the next bridge in the chain
> - *                                      and put the previous
> - * @bridge: bridge object
> - *
> - * Same as drm_bridge_get_next_bridge() but additionally puts the @bridg=
e.
> - *
> - * RETURNS:
> - * the next bridge in the chain after @bridge, or NULL if @bridge is the=
 last.
> - */
> -static inline struct drm_bridge *
> -drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
> +static inline struct drm_bridge *drm_bridge_encoder_chain_lock(struct dr=
m_bridge *bridge)
>  {
> -	struct drm_bridge *next =3D drm_bridge_get_next_bridge(bridge);
> +	drm_encoder_chain_lock(bridge->encoder);
> +
> +	return bridge;
> +}

You create a public function, this needs to be documented.

Maxime

--j5nphwk6lufmqwdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/X/gAKCRAnX84Zoj2+
dluHAX9+iHftEivzE2LJNwNJGCZWyWzaBcxApHUfzojgzDbZ7fz/tTxjzUYNdnD+
/q+zHzQBf3ZeePphxx67zFkY/rK7Qr9r4UBlztteTw/EeFfxvGyyd60wO+X6u2YA
CfFD2gIoaQ==
=Ixen
-----END PGP SIGNATURE-----

--j5nphwk6lufmqwdg--
