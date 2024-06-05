Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398198FD33C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC6B10E0F9;
	Wed,  5 Jun 2024 16:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UnIbfvXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED5710E0F9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 16:56:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 636576188F;
 Wed,  5 Jun 2024 16:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFA2C2BD11;
 Wed,  5 Jun 2024 16:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717606565;
 bh=DY2nt+yBAcKyIj1DY6uk3CsThucW/03Qo/Lo9LSgM1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UnIbfvXzPkP/kZ49+TPd7h9bSGyyF6qc+IZppDOt7SYp4aPPsN0fNiLA/uc0eg4m2
 x2QanzgKHq4fl6UJsFobyTqveNEw1kP8IU+uQcEshNTgiUEGdho29tEIGm8azVqCBQ
 TSsHlrov+912usOc4wDUIy0URbHcPgzvn79Ej9JHhPjGRSYUPaeDSS3SxhUMrPCg51
 h0ilW7gVXLZq41jkxzF1tEE2aPBsQ07YgWfGhdhta6fIMKXb03kIS/pAYayzlQDrTl
 n2ZbTVXrAkI4NU8pxyz85cy03/e+fVpgVcquTc7EDmBXwFRuawOmG5uonBNGh6L5c8
 EKWm8ypMYQS7A==
Date: Wed, 5 Jun 2024 17:55:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Wronek <david@mainlining.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: panel: constrain 'reg' in DSI
 panels (part two)
Message-ID: <20240605-onyx-gloomily-835e383c7be7@spud>
References: <20240605105659.27433-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LcKx6aW3d2vGZ/ji"
Content-Disposition: inline
In-Reply-To: <20240605105659.27433-1-krzysztof.kozlowski@linaro.org>
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


--LcKx6aW3d2vGZ/ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2024 at 12:56:59PM +0200, Krzysztof Kozlowski wrote:
> DSI-attached devices could respond to more than one virtual channel
> number, thus their bindings are supposed to constrain the 'reg' property
> to match hardware.  Add missing 'reg' constrain for DSI-attached display
> panels, based on DTS sources in Linux kernel (assume all devices take
> only one channel number).
>=20
> Few bindings missed previous fixup: LG SW43408 and Raydium RM69380.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--LcKx6aW3d2vGZ/ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCYnwAKCRB4tDGHoIJi
0i4wAQDQf0XShqF8XmyalzFwEDtX/8sM8MP1yBrYStOZ0Cxs2AEA0uIX9W82pvO5
S2c0+9zOWtJ0bnh5sC8u7nNIqxhMVQI=
=zN4v
-----END PGP SIGNATURE-----

--LcKx6aW3d2vGZ/ji--
