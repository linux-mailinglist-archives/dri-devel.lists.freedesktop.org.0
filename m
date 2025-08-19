Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ADCB2C602
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614EB10E2B7;
	Tue, 19 Aug 2025 13:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dPgZ2hNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA26710E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:47:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EC62061428;
 Tue, 19 Aug 2025 13:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B93C4CEF1;
 Tue, 19 Aug 2025 13:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755611228;
 bh=0LlM/TmY7kun3N086n8nz+vfKY+G/rfvAUc/zm69FRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dPgZ2hNmMIAmn8WEoRRyYSL0sWizL9k1mu/g9r/NnRoHOSPlpeiJ3o3whMNP9Lc2/
 8QZmljYITrfXGaoXap3f7VE/lFEkXmTAhrrbeprQHzqjIjmrA65rUnQh9hAF0Ls71/
 uZfIytlhFXGqDFbt5++c3lol+M7XjdZuWDReMqlVUXSYKupFNZPjibjLg1VS6LeBsk
 naSvLVDju+/AD7mHNscAMZfjdMmGCUV6RHuOLOuf+OxOUiodI0CdAgVXev6GdtyQMG
 kr4ygb90tdI0nQM/k1q12LAKuCRLdTTM4m5F8oJspYlDovBPR6pWYlHZ1jKvQwicnp
 GkP6m5LDerV7g==
Date: Tue, 19 Aug 2025 15:47:06 +0200
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
Subject: Re: [PATCH v2 3/9] drm/bridge: add
 drm_for_each_bridge_in_chain_scoped()
Message-ID: <7gpqrxlxxuarbp5b7bycukbbjdcuonlhn4zm6xinnrlqzrbeu7@rrpcwxnxxrag>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
 <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-3-edb6ee81edf1@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="htlwy25bloclwdxh"
Content-Disposition: inline
In-Reply-To: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-3-edb6ee81edf1@bootlin.com>
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


--htlwy25bloclwdxh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/9] drm/bridge: add
 drm_for_each_bridge_in_chain_scoped()
MIME-Version: 1.0

On Fri, Aug 08, 2025 at 04:49:10PM +0200, Luca Ceresoli wrote:
> drm_for_each_bridge_in_chain() iterates ofer the bridges in an encoder
> chain without protecting the lifetime of the bridges using
> drm_bridge_get/put(). This creates a risk window where the bridge could be
> freed while iterating on it. Users of drm_for_each_bridge_in_chain() cann=
ot
> solve this reliably.
>=20
> Add variant of drm_for_each_bridge_in_chain() that gets/puts the bridge
> reference at the beginning/end of each iteration, and puts it if breaking
> ot of the loop.
>=20
> Note that this requires adding a new drm_bridge_get_next_bridge_and_put()
> function because, unlike similar functions as __of_get_next_child(),
> drm_bridge_get_next_bridge() gets the "next" pointer but does not put the
> "prev" pointer. Unfortunately drm_bridge_get_next_bridge() cannot be
> modified to put the "prev" pointer because some of its users rely on
> this, such as drm_atomic_bridge_propagate_bus_flags().
>=20
> Also deprecate drm_for_each_bridge_in_chain(), in preparation for removing
> it after converting all users to the scoped version.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Changes in v2:
> - clarified commit message and mention an example where the current
>   behaviour of drm_bridge_get_next_bridge() is wanted
>=20
> Note 1: drm_for_each_bridge_in_chain_scoped() could be renamed removing t=
he
>         _scoped suffix after removing all the users of the current macro
>         and eventually the current macro itself. Even though this series =
is
>         converting all users, I'd at least wait one kernel release before
>         renaming, to minimize issues with existing patches which would fa=
il
>         building.
>=20
> Note 2: Yes, the drm_bridge_get_next_bridge_and_put() name is ugly, but we
>         do need a "next_bridge" function that does not put the "prev"
>         bridge and one that does. Any proposal for a better name or a
>         different implementation is welcome.
> ---
>  .clang-format            |  1 +
>  include/drm/drm_bridge.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>=20
> diff --git a/.clang-format b/.clang-format
> index 48405c54ef271e9546da08893d200a4cf48f3a55..1cac7d4976644c8f083f801e9=
8f619782c2e23cc 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -168,6 +168,7 @@ ForEachMacros:
>    - 'drm_exec_for_each_locked_object'
>    - 'drm_exec_for_each_locked_object_reverse'
>    - 'drm_for_each_bridge_in_chain'
> +  - 'drm_for_each_bridge_in_chain_scoped'
>    - 'drm_for_each_connector_iter'
>    - 'drm_for_each_crtc'
>    - 'drm_for_each_crtc_reverse'
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 620e119cc24c3491c2be5f08efaf51dfa8f708b3..a8e2f599aea764c705da3582d=
f0ca428bb32f19c 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1365,10 +1365,51 @@ drm_bridge_chain_get_first_bridge(struct drm_enco=
der *encoder)
>   *	    iteration
>   *
>   * Iterate over all bridges present in the bridge chain attached to @enc=
oder.
> + *
> + * This is deprecated, do not use!
> + * New drivers shall use drm_for_each_bridge_in_chain_scoped().
>   */
>  #define drm_for_each_bridge_in_chain(encoder, bridge)			\
>  	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
> =20
> +/**
> + * drm_bridge_get_next_bridge_and_put - Get the next bridge in the chain
> + *                                      and put the previous
> + * @bridge: bridge object
> + *
> + * Same as drm_bridge_get_next_bridge() but additionally puts the @bridg=
e.
> + *
> + * RETURNS:
> + * the next bridge in the chain after @bridge, or NULL if @bridge is the=
 last.
> + */
> +static inline struct drm_bridge *
> +drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge *next =3D drm_bridge_get_next_bridge(bridge);
> +
> +	drm_bridge_put(bridge);
> +
> +	return next;
> +}
> +
> +/**
> + * drm_for_each_bridge_in_chain_scoped - iterate over all bridges attach=
ed
> + *                                       to an encoder
> + * @encoder: the encoder to iterate bridges on
> + * @bridge: a bridge pointer updated to point to the current bridge at e=
ach
> + *	    iteration
> + *
> + * Iterate over all bridges present in the bridge chain attached to @enc=
oder.
> + *
> + * Automatically gets/puts the bridge reference while iterating, and puts
> + * the reference even if returning or breaking in the middle of the loop.
> + */
> +#define drm_for_each_bridge_in_chain_scoped(encoder, bridge)		\
> +	for (struct drm_bridge *bridge __free(drm_bridge_put) =3D		\
> +	     drm_bridge_chain_get_first_bridge(encoder);		\

So my understanding is that the initial value of bridge would be cleaned
up with drm_bridge_put...

> +	     bridge;							\
> +	     bridge =3D drm_bridge_get_next_bridge_and_put(bridge))

=2E.. but also when iterating?

So if we have more than 0 values, we put two references?

Maxime

--htlwy25bloclwdxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKSAWQAKCRAnX84Zoj2+
dhA2AYDTGUPXjz2H7WiASyErvNCLeuaxLXCa7Wx66jEggdCDb0pq2kPxc01R6yvv
0YVIvSoBf3X67fAaK0eiAfBdd+jIsdplBNF+HcOHZp8Rq6mmtG7WTHeIIVqcRbK8
mLJO7cSOdA==
=eq2b
-----END PGP SIGNATURE-----

--htlwy25bloclwdxh--
