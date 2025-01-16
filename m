Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031DEA13553
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FAB10E58A;
	Thu, 16 Jan 2025 08:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G3diOp7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CEE10E58A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:31:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 82D4FA4116E;
 Thu, 16 Jan 2025 08:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E42C4CEDF;
 Thu, 16 Jan 2025 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737016261;
 bh=iPL99HrrIVpk8RHJIAiyhPeWc6S6JPESRrj4FnUf4aY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G3diOp7YbHVuKodULFmerQGjj235BtEB1BkITUBon46Fii4AnRV8gHsU0V9QTS/2S
 7DJd4XueuMaD+s14KGYwrDXWq28drAS0dTrGKkXas5DizKlOrDmIP4fOxJ7zMwJp7d
 KNWTY0aWhc/BGeh+Ca/aoVHpXR4vYMOJZrW4zCyI83C7HT6ZZqOaNHZA1bVCCQn+W1
 tGnk0FmxuLW4saxKHu3+tVe6N9n3HD7DY/NQ1us6EPUjq1fRXuxyem8Jto+H41/C5K
 CJa80OreTbQCKFgl15LiQn7cYP2+48ZkFeNXUUaUcyrXFld5APwo+9PNa7RO2AEfQQ
 Im2/17MxbSgtQ==
Date: Thu, 16 Jan 2025 09:30:58 +0100
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
Subject: Re: [PATCH 23/29] drm/bridge: Provide a helper to retrieve current
 bridge state
Message-ID: <20250116-steady-masterful-basilisk-6defca@houat>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-23-9a2fecd886a6@kernel.org>
 <opuc3fhvncg6rb3mtktirytr3jexun344bkaatv46sq3nvx3qm@qn54dhudksw4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hx3ahqxlgn7mm25k"
Content-Disposition: inline
In-Reply-To: <opuc3fhvncg6rb3mtktirytr3jexun344bkaatv46sq3nvx3qm@qn54dhudksw4>
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


--hx3ahqxlgn7mm25k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 23/29] drm/bridge: Provide a helper to retrieve current
 bridge state
MIME-Version: 1.0

Hi,

On Thu, Jan 16, 2025 at 02:43:37AM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 15, 2025 at 10:05:30PM +0100, Maxime Ripard wrote:
> > The current bridge state is accessible from the drm_bridge structure,
> > but since it's fairly indirect it's not easy to figure out.
> >=20
> > Provide a helper to retrieve it.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  include/drm/drm_bridge.h | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >=20
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 8e18130be8bb85fc2463917dde9bf1d281934184..95c5037a6335e4c1be511e6=
c31308202015c7754 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -955,10 +955,27 @@ static inline struct drm_bridge *of_drm_find_brid=
ge(struct device_node *np)
> >  {
> >  	return NULL;
> >  }
> >  #endif
> > =20
> > +/**
> > + * @drm_bridge_get_current_state() - Get the current bridge state
> > + * @bridge: bridge object
> > + *
> > + * RETURNS:
> > + *
> > + * The current bridge state, or NULL if there is none.
>=20
> Are there any kind of limitations on when and how this function can be
> used? I don't think we can be accessing the state randomly, as the
> framework can change it at some points. E.g. what if the driver uses
> this state from audio or cec callbacks, while the DRM framework performs
> atomic commit and changes / frees the state right concurrently?

The semantics are equivalent to drm_connector->state, drm_crtc->state,
etc, but I'm not sure we ever defined it clearly.

Also, it looks like I can never remember what the locking rules are :)
It looks like a good occasion to ask Sima and write some more
documentation.

Thanks!
Maxime

--hx3ahqxlgn7mm25k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4jDvgAKCRAnX84Zoj2+
dgwiAYD1DaMp71TgaWGD9ymP59or7qw3lZarX/uzUVqlih89/VcF7aDPouPtthvk
ioqw5p8BfRAGnvhWIPxsJV5FYr2jspHf05BXGFDeWdgDm9TgHx5je9/5/BjbXM9q
+Zi6WvODzA==
=rKLw
-----END PGP SIGNATURE-----

--hx3ahqxlgn7mm25k--
