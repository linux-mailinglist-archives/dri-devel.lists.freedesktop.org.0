Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C5FB57A63
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADFB10E470;
	Mon, 15 Sep 2025 12:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X9QcWGS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D52410E470
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:21:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CDAB943BE9;
 Mon, 15 Sep 2025 12:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCDEC4CEF1;
 Mon, 15 Sep 2025 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757938867;
 bh=LEyuDfqznR2YHQ87wE74oJBcoUDxPxiAciNx30pZ9iA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X9QcWGS2tL1F1aC9Gp3/fvIYoALDYWpziM54JiXpaXM00YY3oQK//lq4ebb8uDNCj
 RPjGc5LT0rUYAOHUNxTVOVqwkCac0eYe2/4rNrtLpI7oT25chOGBVZMvBcKOQTFAyy
 MMb4tc6bed/HgN7Sg2GvIPa6cMb+Aq0WzMxq7fZjn2ikxQB8nJiAjIncNUJeDJ2n3X
 0m8MtsHrhrugwNGpF3DLumhse2ihyQK//LCb3RrOtzRc/9dSv/BMmDpmVruwCK93Zd
 Fm+E382bgrF6ZBf4rUDh6rzufpNmEK2wNmrOoOQHIj3OtQuNj9pdtY0Ag/VvpI7YdM
 6X2CMS5L/8yOg==
Date: Mon, 15 Sep 2025 14:21:04 +0200
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
Message-ID: <20250915-bulky-visionary-hamster-3a6c10@penduick>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
 <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-3-edb6ee81edf1@bootlin.com>
 <7gpqrxlxxuarbp5b7bycukbbjdcuonlhn4zm6xinnrlqzrbeu7@rrpcwxnxxrag>
 <20250819180137.28ca89c0@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="c573rpqk2yt63efe"
Content-Disposition: inline
In-Reply-To: <20250819180137.28ca89c0@booty>
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


--c573rpqk2yt63efe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/9] drm/bridge: add
 drm_for_each_bridge_in_chain_scoped()
MIME-Version: 1.0

On Tue, Aug 19, 2025 at 06:01:37PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Tue, 19 Aug 2025 15:47:06 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > > +/**
> > > + * drm_for_each_bridge_in_chain_scoped - iterate over all bridges at=
tached
> > > + *                                       to an encoder
> > > + * @encoder: the encoder to iterate bridges on
> > > + * @bridge: a bridge pointer updated to point to the current bridge =
at each
> > > + *	    iteration
> > > + *
> > > + * Iterate over all bridges present in the bridge chain attached to =
@encoder.
> > > + *
> > > + * Automatically gets/puts the bridge reference while iterating, and=
 puts
> > > + * the reference even if returning or breaking in the middle of the =
loop.
> > > + */
> > > +#define drm_for_each_bridge_in_chain_scoped(encoder, bridge)		\
> > > +	for (struct drm_bridge *bridge __free(drm_bridge_put) =3D		\
> > > +	     drm_bridge_chain_get_first_bridge(encoder);		\ =20
> >=20
> > So my understanding is that the initial value of bridge would be cleaned
> > up with drm_bridge_put...
> >=20
> > > +	     bridge;							\
> > > +	     bridge =3D drm_bridge_get_next_bridge_and_put(bridge)) =20
> >=20
> > ... but also when iterating?
> >=20
> > So if we have more than 0 values, we put two references?
>=20
> No, this is not the case. The __free action is executed only when
> exiting the entire for loop, not a single iteration.
>
> This is consistent with the fact that the loop variable is persistent
> across iterations.
>
> I tested this macro in both cases:
>=20
>  * looping over the entire chain the final value of @bridge will be
>    NULL and the cleanup action won't call drm_bridge_put()
>  * breaking before the last element, @bridge is non-NULL and the
>    cleanup action does call drm_bridge_put()
>=20
> See examples such as for_each_child_of_node_scoped() and other OF
> iterators which work in the same way (which is no coincidence, I used
> them as starting point for writing this patch).

Ack,

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--c573rpqk2yt63efe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMgEsAAKCRAnX84Zoj2+
dtUdAX0Ss+hGq7VrYz+ksbTuiMAsW9D+O2++YU47lAvqHIAMAc1e7jjPGmuF3ahL
CqPHyuQBfRsjFIOqpvdLfTChXYNowymVsrkgjdBpszrb1mTtQ3i5fiM0NLbZ4dth
vca3U9CAtQ==
=Xe1C
-----END PGP SIGNATURE-----

--c573rpqk2yt63efe--
