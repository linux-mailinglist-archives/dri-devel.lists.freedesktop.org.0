Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A59A3C439
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEEB10E340;
	Wed, 19 Feb 2025 15:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mISS3099";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46A010E340
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 15:56:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC4D65C5ADB;
 Wed, 19 Feb 2025 15:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC1FC4CEDD;
 Wed, 19 Feb 2025 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739980574;
 bh=ApwXho0m68u1DhlJYChvZUPmHHp6eWt+LncX53zYIXI=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=mISS30994wcIvAuOdwpjHKaL+UA+kom7ml3E5EIh5kJeQz8nu+02ClvRYzhpwDwl+
 KdgB1zcrJXLxY15k7AzzQnEmoHySG8ZaOCuwzuf31dNESdhZ3dD1ERA8D8HH6QJnl5
 ON/zcdKXc2B9Bhy48gfqW2jfYRvlIB1SEQbu08peTk5vMG1VWctqAqWgoU2Dif5/tK
 wFfuh1r8Dbpb+6Jx1QCmBJjx1SBTxcnjySww9B+YsGMvseQtms/6uTOWgU999xzH4L
 ITr9hoJm5/g5Y7bOTlDJsTng5Ojxmz5Q+cgfTrzk1kYPt+FRr8tYEGARUmfKFqYZNc
 fgmhQ/l594oHg==
Date: Wed, 19 Feb 2025 16:56:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <20250219-gregarious-condor-of-prestige-a6ce0c@houat>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
 <Z7NmtF83adILfasi@phenom.ffwll.local>
 <20250218-adamant-translucent-civet-aebcc5@houat>
 <Z7XeHaTmtS8ClOV-@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jbvhtr2ze3m7ltrg"
Content-Disposition: inline
In-Reply-To: <Z7XeHaTmtS8ClOV-@phenom.ffwll.local>
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


--jbvhtr2ze3m7ltrg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
MIME-Version: 1.0

On Wed, Feb 19, 2025 at 02:35:25PM +0100, Simona Vetter wrote:
> On Tue, Feb 18, 2025 at 11:23:00AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Thanks for your answer
> >=20
> > On Mon, Feb 17, 2025 at 05:41:24PM +0100, Simona Vetter wrote:
> > > On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
> > > > Now that connectors are no longer necessarily created by the bridges
> > > > drivers themselves but might be created by drm_bridge_connector, it=
's
> > > > pretty hard for bridge drivers to retrieve pointers to the connecto=
r and
> > > > CRTC they are attached to.
> > > >=20
> > > > Indeed, the only way to retrieve the CRTC is to follow the drm_brid=
ge
> > > > encoder field, and then the drm_encoder crtc field, both of them be=
ing
> > > > deprecated.
> > >=20
> > > Eh, this isn't quite how this works. So unless bridges have become ve=
ry
> > > dynamic and gained flexible routing the bridge(->bridge->...)->encoder
> > > chain is static. And the crtc for an encoder you find by walking the
> > > connector states in a drm_atomic_state, finding the right one that po=
ints
> > > at your encoder, and then return the ->crtc pointer from that connect=
or
> > > state.
> > >=20
> > > It's a bit bonkers, but I think it's better to compute this than addi=
ng
> > > more pointers that potentially diverge. Unless there's a grand plan h=
ere,
> > > but then I think we want some safety checks that all the pointers nev=
er
> > > get out of sync here.
> >=20
> > That work stemed from this series
> > https://lore.kernel.org/all/20250210132620.42263-1-herve.codina@bootlin=
=2Ecom/
> >=20
> > and in particular:
> > https://lore.kernel.org/all/20250210132620.42263-5-herve.codina@bootlin=
=2Ecom/
> >=20
> > Bridges, outside of the modesetting code path, don't have a way to
> > access the drm_atomic_state since drm_bridge_state->state is typically
> > cleared after swap_state. So accessing the connectors and CRTCs don't
> > work anymore.
> >=20
> > In this particular case, we needed to access those from the bridge
> > interrupt handler.
>=20
> Uh for interrupt handler you can't use anything stored in state objects
> anyway. So I'm even more confused.

Why not? As long as we're in a threaded handler, and take the proper
locks, what's wrong with it, and how is it fundamentally different than,
idk, cec or audio hooks?

Maxime

--jbvhtr2ze3m7ltrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7X/GwAKCRAnX84Zoj2+
dovgAYDaLy95Szw0goSs4A8B0L9N2C1APQgenh1IO8cpT0qH1iB7t3rUUehtTnSu
bpGAf58BfjylaF6OuSKoohRCcH5tlLojZeEqCylL3wLusZkZsJQRDyC59YdttQHr
ABJcNZA+1w==
=RX+0
-----END PGP SIGNATURE-----

--jbvhtr2ze3m7ltrg--
