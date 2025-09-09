Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75525B4FB8F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 14:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D648510E6F3;
	Tue,  9 Sep 2025 12:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c4X4uqyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F9D10E6F3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 12:44:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 702876022C;
 Tue,  9 Sep 2025 12:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F702C4CEFA;
 Tue,  9 Sep 2025 12:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757421878;
 bh=G038WdmGog4EOZkMKmHCh7lB80pDgiLXpw68xAADWy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c4X4uqyvlp6gUsJ4r2eTVIpmXLfsAakB6LGSEO4rASOOqjyuijntUOt0spXPjEEcT
 b7PR10UZdAQM02yy0+sfuP+i1oDEcN7w8QWQbecb/MMUbY8F6bF4ZWFqLIh3uF0OVU
 tNuZA7/l57HjJvY85c2UBdr2yU9Y9REW5KghwrERmAuyGweHt9a6eryhsduhKltIik
 gt5jXrdYjcBGIaYRysVGXP1MVj61kG3QCXJhfxn4mdGKPeoEFaurJ8dXrX7PhnM3V7
 uM9YJcr2/xtvkr0aZ8Jg0GLn1+II+S7Iu+23aFwAamSQdoz+jtMBxtASiXJBBFx4nb
 xB7PGDv1VYdXg==
Date: Tue, 9 Sep 2025 14:44:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/29] drm/atomic: Implement drm_atomic_print_old_state
Message-ID: <20250909-visionary-unyielding-loon-b214d4@houat>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-7-14ad5315da3f@kernel.org>
 <42e891ee-87b8-448e-a0c7-4f3e3b790556@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="523zrlvehmcdve4w"
Content-Disposition: inline
In-Reply-To: <42e891ee-87b8-448e-a0c7-4f3e3b790556@suse.de>
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


--523zrlvehmcdve4w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 07/29] drm/atomic: Implement drm_atomic_print_old_state
MIME-Version: 1.0

Hi Thomas,

On Tue, Sep 02, 2025 at 03:26:49PM +0200, Thomas Zimmermann wrote:
> Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> > We currently have a helper to print the new states associated to a
> > drm_atomic_state, but we don't have a variant to print the old state.
> >=20
> > It's somewhat expected, since we almost never care about what the new
> > state looks like when we commit a new state, but we're about to change
> > that.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

> I assume something later in the series uses this code?

Yeah, the readout code calls it to print the state that was built from
the hardware state.

Maxime

--523zrlvehmcdve4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMAhLgAKCRAnX84Zoj2+
dsJGAYCBTlTkqCHclm5b+I28vqbLA3bm50x5sHbJsN+hVR8xn8a97ufHx9J1M9ss
g6yAMp4Bf2dsrNnKywO5o0l9amNLMh4RswJ0TNueZPOuRpfQamBueGlqrspsG1Zj
1ZaZney8ew==
=a6zA
-----END PGP SIGNATURE-----

--523zrlvehmcdve4w--
