Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A7A1D1D1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 08:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C900610E11C;
	Mon, 27 Jan 2025 07:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Lk366WVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C82D10E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=qNfD
 uv5rMMYaW5FNZ2ZLTr/gymkBxWpesCRuvwJAYvY=; b=Lk366WVXdnQUi45Pd6aM
 N6CFD2bvjHq1uUHRMbl8AtMnbu4S/bCgoXrcI4vH84Nn6JhSXpijlAALcfslxGRl
 u1ThoUZ09u7AAGACFFW6ijP0diLs5SOvHpal3nzKeJIOUfQPbFman8ivIHLc9G0O
 rFzzbRKaDPyPXCvM1vxvbBYiQZsW3yM374po0EYKbeHDaa5hVTO0s+W0BiM0w4d4
 eZxp8dp55rf7KVBv2Oh9dDwfF033gx8QiX/y3oJVBaOp+aAL4XXlhm/5X7S7zCIo
 Kk5Q8nlX+UunlV8U5G3v4AuG+1TU63L4UxLKiG2DUrlqlhMp/V+npKMBgcx8B+yw
 uw==
Received: (qmail 151753 invoked from network); 27 Jan 2025 08:54:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 27 Jan 2025 08:54:39 +0100
X-UD-Smtp-Session: l3s3148p1@xdJlY6ssfuQujnvm
Date: Mon, 27 Jan 2025 08:54:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Message-ID: <Z5c7vk_oa8HGt7sS@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UibA4pFHsH8a8/z6"
Content-Disposition: inline
In-Reply-To: <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
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


--UibA4pFHsH8a8/z6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

thanks for the review!

> > The I2C core now offers a debugfs-directory per client. Use it and
> > remove the custom handling in drm bridge drivers. I don't have the
> > hardware, so I hope I can find people willing to test here. Build bots
> > are happy. And for it6505, it even fixes a problem. See the patch
> > description there.
>
> I'd say, it should be done in a slightly different way: bridges have the
> debugfs_init() callback, which is used by drm_bridge_connector (and can
> be used by other bridge-created connetors) in order to create per-bridge
> debugfs data. Please consider using it to create per-bridge debugfs data.

ACK.

> Note, that callbacks gets connector's dentry as an argument, so bridges
> still should probably create a subdir for their own stuff.

I wonder if this is necessary (I just looked at the code and have no
hardware to test this, sadly). It looks to me as:

- DRM has already debugfs infrastructure, yet those drivers don't use it
- but they should
- the new I2C client debugfs infrastructure is, thus, not needed here
- DRM provides a dentry to the callbacks which drivers can "just use"
- all drivers I looked at just put files there and never clean up
  (because the subsystem does it)

So, from that, I should switch to the debugfs_init() callback and just
use the dentry provided? Or am I missing something?

Happy hacking,

   Wolfram


--UibA4pFHsH8a8/z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXO7sACgkQFA3kzBSg
KbYHaA//R1ii3BxbnP28iciDPXyj4gZ/3My7rEjKdOEd/kJp0+y0dcbmBC1fxlUF
8RRwi81WuVsLNZIyXsLz7dA/TZYTnsHAI42UYcgSw1tLsqGVLlxQ2PujDVWG6N26
TNxgxTTHgKs+IHN5ucK7Hhd2O5STzo1fAeNt39EhGhsyDGpfw/ioQWUxIw5Eo9hi
7Ii0lEgFmCxOpWLCOqZP005PYcqgYIy9Vr0Vjz6zVx+OnZyabvIaXOiMzTH7aLY8
S/XgG1xat8hrKMKg6N6CfdhocRo2X8y2/wqj46EmqcSaPhHObMLiyWhoWYJbtS8v
9RhA5ext4pv4IebPwZom09QbJH3c3QwTW/eh+WEQhz/3UUgttHIiyR5lC4a3AHuI
nDyT+QgtJFHeYIRCCF6cHF4D8ieUgq7qETZt8H2hRMAkFLQOtqta9UF+hhxYe6bT
C2hrKcEIT3bnrii6OHdTCxlllimj+cGugsRipVvkk5YI8TvehQ+blZmg+5A4BBnS
GbskysbF6apJzDTjYIJQ0MAMnAoqpNvtH+wL935GtA586DGVKfaKrILhBwLrIgFt
YiTBjv03lYyN8euSFNCLtPvEtHChpcgvSqFZSrq49OZ6iQYhXF7EbRxKApSa+YuN
QFxyUJ9L7D7S4tRJZxwuxP9H6CV0xRx5Eg3vLlyd8rgwP243BLE=
=V81z
-----END PGP SIGNATURE-----

--UibA4pFHsH8a8/z6--
