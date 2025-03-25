Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650FA6EC76
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA3110E039;
	Tue, 25 Mar 2025 09:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ivr42c1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B008210E039
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:29:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 99DB3439AC;
 Tue, 25 Mar 2025 09:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766B2C4CEE4;
 Tue, 25 Mar 2025 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742894964;
 bh=pQJrDsIRCGcaaAOV8R2YCpZCdN6goihWB6J8Dl3Ulgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ivr42c1q3TF/Ref7GLfnx6ku/lWFi6YTjMADcS4+j5HlJRoR6WlK1Si9vGi8spEWc
 3tj+modCybXkdT89qZc3LEaNcZkQrKt1xmIny27eGo61yrPMqzbJMKxRBLMHTlAA+T
 Fbeernee2cE/MUkgn7sSo3/u/FZsoowco6IoN5FVQHEo/ZKI5SA47HVNISlQyEzjdR
 Pi/805PKncGuqPVgihrGWqyifkfiDxQ5u+QFFo4ZdUJbtnnNFOHTfHhgIys6TCnLYU
 HnqfNm+RH4MwcL1cxrPE21JtX2su2QMZ6sZcVOKW2NZqdq3LattlqdGhoQ7X9UqL7g
 U23wM7Rh5EUEg==
Date: Tue, 25 Mar 2025 10:29:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: devbrones <jonas.cronholm@protonmail.com>, 
 maarten.lankhorst@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
Message-ID: <20250325-inquisitive-ebony-mouse-bdf185@houat>
References: <20250322122048.28677-1-jonas.cronholm@protonmail.com>
 <875xjxa2rk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7qo75eqjhxv6bcp6"
Content-Disposition: inline
In-Reply-To: <875xjxa2rk.fsf@intel.com>
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


--7qo75eqjhxv6bcp6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
MIME-Version: 1.0

On Tue, Mar 25, 2025 at 11:16:47AM +0200, Jani Nikula wrote:
> On Sat, 22 Mar 2025, devbrones <jonas.cronholm@protonmail.com> wrote:
> > This fixes a bug where some Playstation VR Headsets would not be assign=
ed
> > the EDID_QUIRK_NON_DESKTOP quirk, causing them to be inaccessible by
> > certain software under Wayland.
>=20
> Please file a bug over at [1], and attach the EDID on that bug, so we
> have some clue what's going on.
>
> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new

I'd rather have them in the commit log. Nobody uses gitlab issues for
drm-misc, and those kind of issues are just lingering around and
becoming stale.

Maxime

--7qo75eqjhxv6bcp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+J3cQAKCRDj7w1vZxhR
xVu5AQCE0X6uHOBYnSGbZVafc3oq1zchZWFptDTLm8soyrkaTwEA871ESHNjC/Rb
Liqf9nI8u9d/aG0iVns6ui7AspsgQgs=
=ijSu
-----END PGP SIGNATURE-----

--7qo75eqjhxv6bcp6--
