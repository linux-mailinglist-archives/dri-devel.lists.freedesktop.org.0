Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5AFA35E56
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C8F10EC89;
	Fri, 14 Feb 2025 13:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kayZ6cfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBCB10EC6B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:06:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 72079A42A56;
 Fri, 14 Feb 2025 13:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EC1C4CED1;
 Fri, 14 Feb 2025 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739538397;
 bh=+HBCtDmxM3bsjsc+153z8rtLD8IR/a5aZsysqrirBFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kayZ6cfC0J4BlHHoh8NsJDt3mu/uhpqI9/8fAdyXNpOrNNZS4MNW8cHPqtjxw8ZFS
 qhs3re03NJkB0xxJVzPXsu4NSFuPXlxS+qo+TMgQ0ygEAyEhJ4xxMP5ZjiPfozKH9t
 Mefpa+Jj0uVtVtSKUX8q3WZRqnm+0UW6Wx9TRSLEpJ3Jwh4hktAKKMOUPBFLrGtqXr
 K5xyraHpmfxJDFbjl/BxmXn3n35RVrNQYyuxRaLDtudFG6HA5fcZ4DJJCWsALMAJA1
 ZjMai+oL3dtAZ7Dt72AeRoHVAMpWc3InY5QkNsHSrucWctti2TDFtutpje5ahpCh9b
 XvDdp0mJ54Zyg==
Date: Fri, 14 Feb 2025 14:06:34 +0100
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
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <20250214-evasive-eel-of-piety-d59e46@houat>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
 <gyfchljgrqamb26sot4c26gcwupbst2zuu5fw6el5wsl6gl5xp@ruqbpsn4lpvx>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="l5vd547bh5zkj7n4"
Content-Disposition: inline
In-Reply-To: <gyfchljgrqamb26sot4c26gcwupbst2zuu5fw6el5wsl6gl5xp@ruqbpsn4lpvx>
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


--l5vd547bh5zkj7n4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
MIME-Version: 1.0

On Thu, Feb 13, 2025 at 06:32:39PM +0200, Dmitry Baryshkov wrote:
> On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
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
>=20
> The same comment as for v2:
>=20
> It's not very precise:
>=20
>  connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->en=
coder);
>=20
> Is that unreliable somehow?

Then I'm not sure what you want here (and in v2) either. Do you want me
to drop this patch because it's redundant, drop it, something else?

Maxime

--l5vd547bh5zkj7n4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ68/2gAKCRAnX84Zoj2+
dhpvAYDrzil8TfZOQ7NkCln+BWZOVEAG3Kg6TzXmORNQDdKVya1lkq55HF4gIxYI
koOGeVABf1ySnHSKltS3DOGWJ3R8DTtX2FesBCEpLAW+uUDsddcdWgZVreOzgmok
l4tr2GTj7w==
=8XRK
-----END PGP SIGNATURE-----

--l5vd547bh5zkj7n4--
