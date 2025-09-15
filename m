Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB7CB57A94
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1121F10E474;
	Mon, 15 Sep 2025 12:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YR0oFdra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5B610E474
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:22:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D3C2A43DC9;
 Mon, 15 Sep 2025 12:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BB6C4CEF1;
 Mon, 15 Sep 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757938946;
 bh=FKVkG4C4oH+uDoMxkzKUOeBroeHY1VEkpWtFbrJ0Ebo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YR0oFdraz436JEJnenk5HpdHkRfEds1AH0sa2zyzJZuq7tiOOO0B9joXj7JjacVUS
 1fzCTXHyunRUxXoAEg3vaCt/o2os5eIm34A7/cuPjZ9EASkatz+Ab7eNayXSezZd/Q
 S+JBZP5W1G+569oB6UBYRRwP8TD14i6Lo34SmMYd9w2b3NrfPRZwobO+2MSxu839s7
 eg8/RsJdgfIrzM9a9ohIDVWQRcQWMuqsMCcfSq9pLvlJW1vt7shfVfuuiTBeo/bf46
 7bJY5uRdP9i/LAEM+VNH8offpC4QZjP2Ab+FCCz095Q4afe2mn1KGfZNDQmljatAyi
 f9OQnq14oIapg==
Date: Mon, 15 Sep 2025 14:22:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
Subject: Re: [PATCH v2 7/9] drm/bridge: remove drm_for_each_bridge_in_chain()
Message-ID: <20250915-optimal-hornet-of-potency-efa54a@penduick>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
 <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-7-edb6ee81edf1@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="v3gkwdalz6qod435"
Content-Disposition: inline
In-Reply-To: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-7-edb6ee81edf1@bootlin.com>
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


--v3gkwdalz6qod435
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 7/9] drm/bridge: remove drm_for_each_bridge_in_chain()
MIME-Version: 1.0

Hi,

On Fri, Aug 08, 2025 at 04:49:14PM +0200, Luca Ceresoli wrote:
> All users have been replaced by drm_for_each_bridge_in_chain_scoped().
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  .clang-format            |  1 -
>  include/drm/drm_bridge.h | 14 --------------
>  2 files changed, 15 deletions(-)
>=20
> diff --git a/.clang-format b/.clang-format
> index 1cac7d4976644c8f083f801e98f619782c2e23cc..d5c05db1a0d96476b711b9591=
2d2b82b2e780397 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -167,7 +167,6 @@ ForEachMacros:
>    - 'drm_connector_for_each_possible_encoder'
>    - 'drm_exec_for_each_locked_object'
>    - 'drm_exec_for_each_locked_object_reverse'
> -  - 'drm_for_each_bridge_in_chain'
>    - 'drm_for_each_bridge_in_chain_scoped'
>    - 'drm_for_each_connector_iter'
>    - 'drm_for_each_crtc'
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index a8e2f599aea764c705da3582df0ca428bb32f19c..6adf9221c2d462ec8e0e4e281=
c97b39081b3da24 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1358,20 +1358,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encod=
er *encoder)
>  						       struct drm_bridge, chain_node));
>  }
> =20
> -/**
> - * drm_for_each_bridge_in_chain() - Iterate over all bridges present in =
a chain
> - * @encoder: the encoder to iterate bridges on
> - * @bridge: a bridge pointer updated to point to the current bridge at e=
ach
> - *	    iteration
> - *
> - * Iterate over all bridges present in the bridge chain attached to @enc=
oder.
> - *
> - * This is deprecated, do not use!
> - * New drivers shall use drm_for_each_bridge_in_chain_scoped().
> - */
> -#define drm_for_each_bridge_in_chain(encoder, bridge)			\
> -	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
> -

I think I'd go a step further and rename
drm_for_each_bridge_in_chain_scoped to drm_for_each_bridge_in_chain,
there's no need to have a "scoped" variant if it's our only variant.

It can be done in a subsequent patch though. For the entire series:
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--v3gkwdalz6qod435
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMgE/wAKCRAnX84Zoj2+
di/qAYDfeehcZRhSD9nPzRZywT4IJ9tVramjER+mQFmcxnzW135nvgo5BDHuzEAy
hCixHRQBgLAjBilX6Yvty8T7vW8bMlb/31uEYvwRfOtV8xp/qKLcI/6lNDz0lFNE
J/A7Urt/IA==
=lRVm
-----END PGP SIGNATURE-----

--v3gkwdalz6qod435--
