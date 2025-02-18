Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13797A398AE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35AD10E660;
	Tue, 18 Feb 2025 10:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TF9DDByj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CDA10E660
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:23:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A077A41E6F;
 Tue, 18 Feb 2025 10:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2FFC4CEE2;
 Tue, 18 Feb 2025 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739874182;
 bh=J97cmWZxIhO2AD5DCW1yf5u2TgYTs8xKBisHCggs4Os=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=TF9DDByj9vNXRHA8paJjEUZv5cqyvKor3+yCurZ8UlXe0BXfnPK/GWJJrr9HM/FE6
 3Ct3nSCsGYGYUTxPkVKRiFMZuQZTIyaz/z7y706PlslfH06l92Ulg5zCgGj64yPyOF
 lQkQncqqdrO0JRDUjlTb24gBzoB3wfQUmMY4MP5UqkHqGtI90zOnehtWqBPeiODE1b
 pZSLNDOHM3hmF/l96itSYf54ilWMG/RATsfWzzodsJJF2mwQY5hdbprOhaO69QX8wy
 BVsd1YQrLTSx62vpUYKFQ3TqGcCpkuOdrDLBOjP5i+zYN+yGMBfnqvGh+t9V2850X6
 klyZKeFUuJ5tg==
Date: Tue, 18 Feb 2025 11:23:00 +0100
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
Message-ID: <20250218-adamant-translucent-civet-aebcc5@houat>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
 <Z7NmtF83adILfasi@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fjwpfvmnbqk5kxno"
Content-Disposition: inline
In-Reply-To: <Z7NmtF83adILfasi@phenom.ffwll.local>
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


--fjwpfvmnbqk5kxno
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
MIME-Version: 1.0

Hi,

Thanks for your answer

On Mon, Feb 17, 2025 at 05:41:24PM +0100, Simona Vetter wrote:
> On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
> > Now that connectors are no longer necessarily created by the bridges
> > drivers themselves but might be created by drm_bridge_connector, it's
> > pretty hard for bridge drivers to retrieve pointers to the connector and
> > CRTC they are attached to.
> >=20
> > Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> > encoder field, and then the drm_encoder crtc field, both of them being
> > deprecated.
>=20
> Eh, this isn't quite how this works. So unless bridges have become very
> dynamic and gained flexible routing the bridge(->bridge->...)->encoder
> chain is static. And the crtc for an encoder you find by walking the
> connector states in a drm_atomic_state, finding the right one that points
> at your encoder, and then return the ->crtc pointer from that connector
> state.
>=20
> It's a bit bonkers, but I think it's better to compute this than adding
> more pointers that potentially diverge. Unless there's a grand plan here,
> but then I think we want some safety checks that all the pointers never
> get out of sync here.

That work stemed from this series
https://lore.kernel.org/all/20250210132620.42263-1-herve.codina@bootlin.com/

and in particular:
https://lore.kernel.org/all/20250210132620.42263-5-herve.codina@bootlin.com/

Bridges, outside of the modesetting code path, don't have a way to
access the drm_atomic_state since drm_bridge_state->state is typically
cleared after swap_state. So accessing the connectors and CRTCs don't
work anymore.

In this particular case, we needed to access those from the bridge
interrupt handler.

Maxime

--fjwpfvmnbqk5kxno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7RfgwAKCRAnX84Zoj2+
dsY1AX4m3Y/rhtfrfL5pI16GfnzyxUJw2QAzb0L4622v2eq+g/W1fSXTAxY8KzW6
Wfbhq50BfjjytZiYw6O6WKEMflBVSv+Gc/VkyjXHS8b8meNQ7mNNuSLrxtbC3ijN
L5iN3mmqkw==
=2pcx
-----END PGP SIGNATURE-----

--fjwpfvmnbqk5kxno--
