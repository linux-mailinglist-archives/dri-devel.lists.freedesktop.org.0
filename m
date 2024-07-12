Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2292FBB2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 15:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EF110ED0C;
	Fri, 12 Jul 2024 13:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FC5E/aW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08A710ED0C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 13:46:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A2EDBCE0EB5;
 Fri, 12 Jul 2024 13:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0576EC32782;
 Fri, 12 Jul 2024 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720791977;
 bh=u1Ze5I7DNb1Vy+REe2aJrWH406ajYpumnP0nla0bqYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FC5E/aW6GcyW9YN1lenwmb36WQJaucuizd5Uako/1/qalRDZz+1M1+Wn2DpsH//ke
 gNkG0zlnmznRJcTGvM8D0I5tBOoXtyZX4OWTC4lsc/rgfUzFUOjxtW3aAv+oIBOnvk
 XbeTJK5tmqP0aa1dM44GCcsYtD/4Ha25gCSSzZXxJIadrlrkdlPuGoIqg6XpHatmky
 gKGfmc09ntKfVjFutXWKaKPWR0v3oznU/qNdQSOuNLWApDieYcCzTbsv3RwxFYDPq9
 BaptYnt0SP6Z2QXhtoZlzGfoy+vlWd5JgCDv4wI947oD59wgFHVuYUqzZOW2o9OoVX
 oxezNgTKPOYkA==
Date: Fri, 12 Jul 2024 14:46:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Document support for
 Innolux G070ACE-LH3
Message-ID: <20240712-prewashed-helmet-42fa3bb3a273@spud>
References: <20240712-b4-v6-10-topic-innolux-v1-0-bb0acf273d0d@pengutronix.de>
 <20240712-b4-v6-10-topic-innolux-v1-1-bb0acf273d0d@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CvcruEIadur+7RjH"
Content-Disposition: inline
In-Reply-To: <20240712-b4-v6-10-topic-innolux-v1-1-bb0acf273d0d@pengutronix.de>
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


--CvcruEIadur+7RjH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 01:05:55PM +0200, Steffen Trumtrar wrote:
> Add Innolux G070ACE-LH3 7" WVGA (800x480) TFT LCD panel compatible string.
>=20
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CvcruEIadur+7RjH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpEzowAKCRB4tDGHoIJi
0mNGAP0fUUlEOXMsE1rO4gudxzQUpqN7bYljrncEDZ5iReEVFgEAmuB5hL6C0UOy
gX+xWGJIfms+nnhstNjfbvdqdAE6JQU=
=4o+I
-----END PGP SIGNATURE-----

--CvcruEIadur+7RjH--
