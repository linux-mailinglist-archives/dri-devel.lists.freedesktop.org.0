Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EC6A1521E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 15:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9C910EAFD;
	Fri, 17 Jan 2025 14:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RV/NnJ9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B4F10EAFD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 14:50:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B00E5C62F5;
 Fri, 17 Jan 2025 14:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B89EC4CEDD;
 Fri, 17 Jan 2025 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737125411;
 bh=3BbYAw3G4hctOtTP8Gs/7fJiQf39z4/DkwOtTDFRB6k=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=RV/NnJ9vm2C/ZPlD3zZZWYC8WL7QfftbI4aVZ/fdLrUP4d2s29btCTrkTTITdYZUC
 wEDXYlaYEAGz9Vus1Lk4ksxWSbh18PAqg00CmjZypuDjMMTwC+osQU2qw118/5D4pR
 Q1tytURip2FVb8V5ncQrJa6UZogyt8bRPLwYs0xhluVFK9xYbrw5nBwBLXxXxqdRVz
 z8gwHRTxgPZZpzGoRX/vg1Tm+nfVG0s29fds45mKS8GT+5x0cV4z35UXnA6ez+925u
 iZTyNa8qEhtbRAlI/BNyShlFYklPZMPDKAMsmpFUGSdQod/NAnOPQogDXmFPKMRHQt
 1LOoTXhi9XYEw==
Date: Fri, 17 Jan 2025 15:50:09 +0100
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
Subject: Re: [PATCH 22/29] drm/bridge: Rename atomic hooks parameters to drop
 old prefix
Message-ID: <20250117-magpie-of-unreal-pride-efb244@houat>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-22-9a2fecd886a6@kernel.org>
 <Z4jutByAKEF0cPs3@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="pqpsvkdvhrq43osq"
Content-Disposition: inline
In-Reply-To: <Z4jutByAKEF0cPs3@phenom.ffwll.local>
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


--pqpsvkdvhrq43osq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 22/29] drm/bridge: Rename atomic hooks parameters to drop
 old prefix
MIME-Version: 1.0

On Thu, Jan 16, 2025 at 12:34:12PM +0100, Simona Vetter wrote:
> On Wed, Jan 15, 2025 at 10:05:29PM +0100, Maxime Ripard wrote:
> > All the bridge atomic hooks were using the old_bridge_state name for
> > their drm_bridge_state parameter. However, this state is the current
> > state being committed for all of them, which ends up being confusing.
> >=20
> > Let's rename it to bridge_state for all of them.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  include/drm/drm_bridge.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..8e18130be8bb85fc2463917=
dde9bf1d281934184 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -303,11 +303,11 @@ struct drm_bridge_funcs {
> >  	 * there is one) when this callback is called.
> >  	 *
> >  	 * The @atomic_pre_enable callback is optional.
> >  	 */
> >  	void (*atomic_pre_enable)(struct drm_bridge *bridge,
> > -				  struct drm_bridge_state *old_bridge_state);
> > +				  struct drm_bridge_state *bridge_state);
> > =20
> >  	/**
> >  	 * @atomic_enable:
> >  	 *
> >  	 * This callback should enable the bridge. It is called right after
> > @@ -323,11 +323,11 @@ struct drm_bridge_funcs {
> >  	 * chain if there is one.
> >  	 *
> >  	 * The @atomic_enable callback is optional.
> >  	 */
> >  	void (*atomic_enable)(struct drm_bridge *bridge,
> > -			      struct drm_bridge_state *old_bridge_state);
> > +			      struct drm_bridge_state *bridge_state);
>=20
> Checked this one, and it very clearly passes the old state.

Urgh, you're right

> Because the new state you can get by looking at bridge->state.

Bridge->state doesn't exist though.

> So this looks very wrong.
>=20
> If you want to fully update the pattern, pass the drm_atomic_state
> instead, and let callbacks lookup any additional states they use as
> needed.

Yeah, that's probably the best option. I think I still have the
coccinelle scripts I used for the others somewhere.

Thanks!
Maxime

--pqpsvkdvhrq43osq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4puIAAKCRAnX84Zoj2+
diXFAX9NNbfwvdac/AhA711cDRYnZQnpQjNGgvNoxzUYGGZxD5mYFzS2XP3kln7V
GxD6hVYBfApzz6LCgko2ccoAO9cEY76Nvkilh3y3L/p+guOESGNzPhJRAlk+3984
Zfsg8e1XDQ==
=WJBv
-----END PGP SIGNATURE-----

--pqpsvkdvhrq43osq--
