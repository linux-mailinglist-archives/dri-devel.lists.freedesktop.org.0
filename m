Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B580AA30CAC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 14:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EB710E6C5;
	Tue, 11 Feb 2025 13:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HKjnUSYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C8210E6C4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 13:17:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 578725C10BB;
 Tue, 11 Feb 2025 13:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24332C4CEDD;
 Tue, 11 Feb 2025 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739279853;
 bh=QW95HtSAyRWSgioqNcw892BFhWS6RVT2u9MZYi9Kl6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HKjnUSYnWyK4/IOzU7k7AtQp3oXjK2wwFAB5rJdK9V4L7STFUub7wIjG72IEmJo9/
 /GWeXN6u8D3Qdq1n0qv78tpj49rIUXtWLUkOUdMzwBM0es26sk6v7bQCaiE1dPqtdt
 y6bXJGiBSXZkEo98P1HVe7z9p+5gn8H4kkX1QrvceIlkWOWmiDPe91/Byy5pdlNkoy
 3GJlb9Vsu05VYFRL28xlvP4B/K0LunnDPV5EjoBaB5ng78fYF1px3Cn132uC8C+Bxs
 FUR2C13CD8GM9hFSyfvT5yF0l/Ec+nd/qeIjjTlZ0BB8/edNV9pXQh+X+OuVu6uChK
 VdNgQ6e2PSHfA==
Date: Tue, 11 Feb 2025 14:17:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 00/35] drm/bridge: Various quality of life improvements
Message-ID: <20250211-peculiar-misty-moose-639556@houat>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <yudkovtipwtnofr3o2qwqrmriwxlczrwploieh5i4ke3sx5zhk@5ktlrew7o6k2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="muzs5dl4zad52eyq"
Content-Disposition: inline
In-Reply-To: <yudkovtipwtnofr3o2qwqrmriwxlczrwploieh5i4ke3sx5zhk@5ktlrew7o6k2>
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


--muzs5dl4zad52eyq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/35] drm/bridge: Various quality of life improvements
MIME-Version: 1.0

On Sun, Feb 09, 2025 at 05:27:01AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 03:57:28PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's a series of changes after to the KMS helpers and bridge API
> > following a bunch of reviews I did.
> >=20
> > It's mostly centered across providing an easier time to deal with bridge
> > states, and a somewhat consistent with the other entities API.
> >=20
> > It's build tested only, with arm64 allmodconfig.
> >=20
> > Maxime
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes in v2:
> > - Pass the full atomic state to bridge atomic hooks
> > - Make attach take the encoder as a parameter
> > - Mark bridge->encoder as deprecated
> > - Rework the logic to detect if a bridge uses a state or not at
> >   atomic_check time
> > - Add lockdep assertion to drm_bridge_get_current_state()
> > - Link to v1: https://lore.kernel.org/r/20250115-bridge-connector-v1-0-=
9a2fecd886a6@kernel.org
> >=20
> > ---
> > Maxime Ripard (35):
> >       drm/atomic: Document history of drm_atomic_state
> >       drm/bridge: Pass full state to atomic_pre_enable
> >       drm/bridge: Pass full state to atomic_enable
> >       drm/bridge: Pass full state to atomic_disable
> >       drm/bridge: Pass full state to atomic_post_disable
> >       drm/atomic-helper: Fix commit_tail state variable name
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wai=
t_for_dependencies()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_tail()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_tail_rpm()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_mod=
eset_disables()
> >       drm/atomic-helper: Change parameter name of disable_outputs()
> >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_disa=
ble()
> >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_post=
_disable()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_upd=
ate_legacy_modeset_state()
> >       drm/atomic-helper: Change parameter name of crtc_set_mode()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_planes()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_modeset_enables()
> >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_=
enable()
> >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_enab=
le()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_writebacks()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_fak=
e_vblank()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_hw_done()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wai=
t_for_vblanks()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_cle=
anup_planes()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_cleanup_done()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wai=
t_for_flip_done()
>=20
> I agree that use of the old_state can be confusing (and it has been
> confusing to me for some time). The main question is, do we loose useful
> memo 'this is the state after swap'. Most likely it is useless now, just
> wanted to give it a second thought.

The drm_atomic_state doesn't change after a swap, only the
plane/crtc/connector/private_obj (and their state) state pointer do. And
if you meant that old_state mentions that the states have been swapped,
it's still a terrible name and we should change it still :)

Maxime

--muzs5dl4zad52eyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6tN6gAKCRAnX84Zoj2+
dsHkAX9u62jj0+j/VHr3l9CZUKWK1k/Ets8OAJ6Az0Hs6T8ojUXszlx+9rnb3PIX
+Q/vaWkBfRSJLYVl9IDLrivCRYdC7XrdCNjdLW4gILcZDmVgavVXbgZoq6MQXV3x
dtsdV+WWHA==
=+jX8
-----END PGP SIGNATURE-----

--muzs5dl4zad52eyq--
