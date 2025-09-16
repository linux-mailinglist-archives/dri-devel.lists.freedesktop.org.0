Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81EB5919D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE5210E73E;
	Tue, 16 Sep 2025 09:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iL7oN6ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B34E10E73E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 09:03:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 98ECB600AE;
 Tue, 16 Sep 2025 09:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CFBC4CEEB;
 Tue, 16 Sep 2025 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758013424;
 bh=MZwGrBHn7fPx6J7jWScTagGw2ALfjMRVbO4DtaIYdUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iL7oN6ibPnr6d7GQE8OAHny60zW/mzn/tDXnzQgFQR7+vf2SJVb4P4Pq5N2+VyJUG
 q7ANJyAG8L2AIho1rgjoEgGTOQJcmfJXQWpXocWsG+Q+e4sHI13OChBO2D2azFuFyu
 MlfXpicvnoSPlFkzfLAZK14fWTbrgOHxOyyYsM5qH/gWjyj+BDmKa2LBV0mXJxThxC
 hoFfQB1gsnY0bax6j42NeJNHVcN/fQsf72WZGC8iJFwJC4U2a8d4Lv3+1lQeUZzWhJ
 N0EtDzFu/OAo5+Wy/9GuV0qie36ilqZ1A4xlnZPNmvCLdSqERVsiMEWq+XUPC2bdYm
 8JOGBUzdFdIjQ==
Date: Tue, 16 Sep 2025 11:03:41 +0200
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
Message-ID: <20250916-jade-seal-of-cleaning-5ee2bd@houat>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
 <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-7-edb6ee81edf1@bootlin.com>
 <20250915-optimal-hornet-of-potency-efa54a@penduick>
 <20250915175805.6e8df6ef@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="j5gg2kqgg6e4zl3s"
Content-Disposition: inline
In-Reply-To: <20250915175805.6e8df6ef@booty>
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


--j5gg2kqgg6e4zl3s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 7/9] drm/bridge: remove drm_for_each_bridge_in_chain()
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 05:58:05PM +0200, Luca Ceresoli wrote:
> On Mon, 15 Sep 2025 14:22:24 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> > On Fri, Aug 08, 2025 at 04:49:14PM +0200, Luca Ceresoli wrote:
> > > All users have been replaced by drm_for_each_bridge_in_chain_scoped().
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > ---
> > >  .clang-format            |  1 -
> > >  include/drm/drm_bridge.h | 14 --------------
> > >  2 files changed, 15 deletions(-)
> > >=20
> > > diff --git a/.clang-format b/.clang-format
> > > index 1cac7d4976644c8f083f801e98f619782c2e23cc..d5c05db1a0d96476b711b=
95912d2b82b2e780397 100644
> > > --- a/.clang-format
> > > +++ b/.clang-format
> > > @@ -167,7 +167,6 @@ ForEachMacros:
> > >    - 'drm_connector_for_each_possible_encoder'
> > >    - 'drm_exec_for_each_locked_object'
> > >    - 'drm_exec_for_each_locked_object_reverse'
> > > -  - 'drm_for_each_bridge_in_chain'
> > >    - 'drm_for_each_bridge_in_chain_scoped'
> > >    - 'drm_for_each_connector_iter'
> > >    - 'drm_for_each_crtc'
> > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > index a8e2f599aea764c705da3582df0ca428bb32f19c..6adf9221c2d462ec8e0e4=
e281c97b39081b3da24 100644
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -1358,20 +1358,6 @@ drm_bridge_chain_get_first_bridge(struct drm_e=
ncoder *encoder)
> > >  						       struct drm_bridge, chain_node));
> > >  }
> > > =20
> > > -/**
> > > - * drm_for_each_bridge_in_chain() - Iterate over all bridges present=
 in a chain
> > > - * @encoder: the encoder to iterate bridges on
> > > - * @bridge: a bridge pointer updated to point to the current bridge =
at each
> > > - *	    iteration
> > > - *
> > > - * Iterate over all bridges present in the bridge chain attached to =
@encoder.
> > > - *
> > > - * This is deprecated, do not use!
> > > - * New drivers shall use drm_for_each_bridge_in_chain_scoped().
> > > - */
> > > -#define drm_for_each_bridge_in_chain(encoder, bridge)			\
> > > -	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
> > > - =20
> >=20
> > I think I'd go a step further and rename
> > drm_for_each_bridge_in_chain_scoped to drm_for_each_bridge_in_chain,
> > there's no need to have a "scoped" variant if it's our only variant.
> >=20
> > It can be done in a subsequent patch though.
>=20
> Sure, that's the plan. There's a note in patch 3:
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

No need to wait that long, and the best time to do it is right now
actually, about the time we start collecting the patches for a new
release.

Maxime

--j5gg2kqgg6e4zl3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMkn4gAKCRAnX84Zoj2+
diPbAYCE0rN0Hys4v3lgLLkZRuYYI0Gb8t/xeW3MGR8DoeSuRalFsZbza8OQj62I
uKDA+8ABgMfMlLq3E2nNIB21uXhtaO+otkyU/nIntjQV4yQTEzi8wU1GnNHMU2H9
nilJreknJg==
=KvpI
-----END PGP SIGNATURE-----

--j5gg2kqgg6e4zl3s--
