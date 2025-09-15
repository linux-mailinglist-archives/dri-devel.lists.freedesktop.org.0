Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE5B57885
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2085310E45A;
	Mon, 15 Sep 2025 11:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R0snSTnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1742410E45A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:37:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E832740555;
 Mon, 15 Sep 2025 11:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B54C4CEF1;
 Mon, 15 Sep 2025 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757936251;
 bh=pTLgLrWjvJcI34WEgogI5pmVGE1Q2782+yLOnrPimjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R0snSTnILeSLhn46HJ2y2eQj0k1bRnyhA1W0oj5xji+Ou/ci3A0F7SjmUtDuLFdIW
 77yb8qpz5p03ARqJzYuv9nRjUHCE6i0KkpubanHHEliniagxirOAJONZxe+IlhLEqF
 1Af8EipwRsHcQPhMAQg5Z96sFFluWWXjbKg/vth8wRYLM/ZBqMobFOAX79khBTGHfu
 6JJ1VmZfVk+ErOjyGvRzpntVyXofYE9U5cf6aZrfe2M02D2kDRw3XgwnxwQaC9NfGP
 E0ZzRvo4nHVjwdTz3xzfZaULH4R6IRHEEnEXSfXS3MQ7W7AtaFCCVHDNBQo7s9HyiP
 NH+I0GFQ2gZyg==
Date: Mon, 15 Sep 2025 13:37:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/29] drm/modeset: Create atomic_reset hook
Message-ID: <20250915-radical-vagabond-jaguar-b45157@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-9-14ad5315da3f@kernel.org>
 <20250902210445.GX13448@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="pfit7i5w3kasuvbx"
Content-Disposition: inline
In-Reply-To: <20250902210445.GX13448@pendragon.ideasonboard.com>
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


--pfit7i5w3kasuvbx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 09/29] drm/modeset: Create atomic_reset hook
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 11:04:45PM +0200, Laurent Pinchart wrote:
> On Tue, Sep 02, 2025 at 10:32:37AM +0200, Maxime Ripard wrote:
> > Since we're about to integrate some infrastructure to implement hardware
> > state readout, we need a way to differentiate between drivers wanting to
> > start from a pristine state, with the classic reset sequence, and
> > drivers that want to pickup their initial state from reading out the
> > hardware state.
> >=20
> > To do so we can create an optional reset hook in
> > drm_mode_config_helper_funcs that will default to the classic reset
> > implementation, and can be setup to a helper we will provide in a later
> > patch to read the hardware state.
>=20
> I'm a bit puzzled by this. Isn't the whole point of the existing reset
> operations to allow drivers to read out the hardware state if they wish
> ? Why do we need something new ?

I'm creating a callback for drivers to select whether they want the
current reset behaviour (ie, start from a pristine, default state) or
implement readout through a set of helpers.

What's puzzling you?

--pfit7i5w3kasuvbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMf6eAAKCRAnX84Zoj2+
doi/AXi7tycst9EqlH6loakkYlWwONQc8IvQ3qxh9G6ZzE0XZ+AV3Qr7t5hFK9Yi
8nmrcwGAiJDAmS1g3/DYYDz11gaokXqbL3adEyP+aXZhldbavVAfmcoKyUzY6n2w
QLM61AOT
=NGUq
-----END PGP SIGNATURE-----

--pfit7i5w3kasuvbx--
