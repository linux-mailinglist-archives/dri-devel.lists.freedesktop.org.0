Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AAFA135A0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22E610E8F4;
	Thu, 16 Jan 2025 08:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aanm/jwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE1110E8FC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:42:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CF96AA41260;
 Thu, 16 Jan 2025 08:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075A8C4CED6;
 Thu, 16 Jan 2025 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737016977;
 bh=bQ0iqrh+Blu5EKlpzEiEPYh/jU17tgHkzYqMj5oYJVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aanm/jwpjdbXg7oSojQyMqX0GeLN7LLplQAhkmHzjfUMz108deKGyznIGfTkqFAni
 F6MY1Yc96KP6Pgi3MoX56rbtPy7htXC8KYP4Xe2I25khcb0DCt39lIKvX/gN/srAPx
 xc/+r/2AeNRn9LpbMAGtSZXhW8Ztdosihr7IO3/Kw6n0NPUAnKaQBnnLTg/CdVwRlM
 JOvn3NuOONu24SyqVzC5fxY8UKxPhigvP7vvNTTNMjz1QBrfkMQVIb7V7PUv27dT05
 VkwoAFfSYjm/WZymW4XXUxKVIk498bVV8Hf8Y8IoMBzXicLLOaeMtp9hMMKEEhIDLZ
 JwHjxVIfZT5mg==
Date: Thu, 16 Jan 2025 09:42:54 +0100
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 25/29] drm/bridge: Provide pointers to the connector and
 crtc in bridge state
Message-ID: <20250116-energetic-fine-worm-c2460a@houat>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org>
 <eaardp55onpuqxneh4q6a7tmujglp2pu7kubwisoubjbyuqbt3@zttu7txp34xx>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kgzaht2b4s6kf5ti"
Content-Disposition: inline
In-Reply-To: <eaardp55onpuqxneh4q6a7tmujglp2pu7kubwisoubjbyuqbt3@zttu7txp34xx>
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


--kgzaht2b4s6kf5ti
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 25/29] drm/bridge: Provide pointers to the connector and
 crtc in bridge state
MIME-Version: 1.0

Hi,

On Thu, Jan 16, 2025 at 03:04:19AM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 15, 2025 at 10:05:32PM +0100, Maxime Ripard wrote:
> > Now that connectors are no longer necessarily created by the bridges
> > drivers themselves but might be created by drm_bridge_connector, it's
> > pretty hard for bridge drivers to retrieve pointers to the connector and
> > CRTC they are attached to.
> >=20
> > Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> > encoder field, and then the drm_encoder crtc field, both of them being
> > deprecated.
> >=20
> > And for the connector, since we can have multiple connectors attached to
> > a CRTC, we don't really have a reliable way to get it.
> >=20
> > Let's provide both pointers in the drm_bridge_state structure so we
> > don't have to follow deprecated, non-atomic, pointers, and be more
> > consistent with the other KMS entities.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++++
> >  drivers/gpu/drm/drm_bridge.c              | 21 +++++++++++++--------
> >  include/drm/drm_atomic.h                  | 14 ++++++++++++++
> >  3 files changed, 32 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index 519228eb109533d2596e899a57b571fa0995824f..66661dca077215b78dffca7=
bc1712f56d35e3918 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -777,10 +777,15 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_=
state);
> >   * that don't subclass the bridge state.
> >   */
> >  void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
> >  					    struct drm_bridge_state *state)
> >  {
> > +	if (state->connector) {
> > +		drm_connector_put(state->connector);
> > +		state->connector =3D NULL;
> > +	}
> > +
> >  	kfree(state);
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
> > =20
> >  /**
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index c937980d6591fd98e33e37d799ebf84e7e6c5529..069c105aa59636c64caffbe=
fcf482133b0db97d9 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -829,19 +829,24 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
> > =20
> >  static int drm_atomic_bridge_check(struct drm_bridge *bridge,
> >  				   struct drm_crtc_state *crtc_state,
> >  				   struct drm_connector_state *conn_state)
> >  {
> > +	struct drm_bridge_state *bridge_state;
> > +	int ret;
> > +
> > +	bridge_state =3D drm_atomic_get_new_bridge_state(crtc_state->state,
> > +						       bridge);
>=20
> It felt like an error to me to call this function for a non-atomic
> bridges, until I fully followed the code path to find that it will
> return NULL if the bridge isn't registered as a private object.

Yeah.. I wasn't too sure what to do about this one either. I think it
would be more consistent to always have a state properly filled, even if
we have !atomic drivers. It's what happens with the rest of the
framework.

But also, I have no idea what the side-effects might be.

One thing though: a driver having an atomic_check callback is not an
indication of whether it supports atomic mode-setting or not.
atomic_check is optional, so we can have atomic drivers without
atomic_check.

> BTW: if my grep-foo isn't deceiving me, we currently have 34 non-atomic
> bridges out of 90. Should we start forcebly updating them to use atomic
> interface in attempt to drop the mode_fixup() and other non-atomic
> callbacks?

Maybe? I'm not sure forcing anyone to anything really helps. sii8620 for
example is going to be a fun one, and I'd rather stay away from it :)

Maxime

--kgzaht2b4s6kf5ti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4jGjgAKCRAnX84Zoj2+
dlbQAYDgZbw7j+Le14hud8Dp0+/rC0Dj+NZGAFpk3VXaLHIfqCmozlV9zi/keLkb
KBWxcpsBgO9vlKv79mevoOZxGBwoRDYmtY3ICK7l4Z0/WZilow4gMG25l/r85vIr
Lk1wZjH6ew==
=itLr
-----END PGP SIGNATURE-----

--kgzaht2b4s6kf5ti--
