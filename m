Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FDA92D382
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D849110E7D7;
	Wed, 10 Jul 2024 13:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QEenr21p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CCE10E7D6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:54:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2C2DFCE16C3;
 Wed, 10 Jul 2024 13:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD26DC32781;
 Wed, 10 Jul 2024 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720619694;
 bh=y2gmS34Q778sKnc3UY4lw/NDrvv5SpWlH3ZR36Y0R1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QEenr21pF9ItOW6whCxqpxVQR5dscccyC+fUJq2SoJ0JKToYLDcRIK41jNGFQZYKl
 OsMq/AIaec9MWsYlhR+nFXLqBS1DNFMETYGcS4U86Na3kmiwQkrL3wAWMx3BPt/AFj
 En1qw7YpBF2x0qjn/KTTzbpQA81J4qGLz84XecmVoC9aJbi8CQBG9V+V4jEOBdahFE
 ZHtFhiYacbcw33jMJRUzj6eArGoVO8ePZv3O519ydSI0XhJNfmjq1lKazZeOcYPSJL
 Csed9E3jVTGuzzBGTbMMMUBrcaaLhoSFPrkGo0j1ymXo/A8TL+Pb1I82sl1wOvsSI0
 YfUPRkqPmM8Dg==
Date: Wed, 10 Jul 2024 14:54:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document BOE
 TV101WUM-LL2 DSI Display Panel
Message-ID: <20240710-console-dodgy-d7d48667eb96@spud>
References: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
 <20240709-topic-sdm450-upstream-tbx605f-panel-v1-1-af473397835d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MEX5X5+p8+Bv5NnH"
Content-Disposition: inline
In-Reply-To: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-1-af473397835d@linaro.org>
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


--MEX5X5+p8+Bv5NnH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 03:05:44PM +0200, Neil Armstrong wrote:
> Document the 1200x1920 BOE TV101WUM-LL2 DSI Display Panel found
> in the Lenovo Smart Tab M10 tablet. The controller is unknown.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--MEX5X5+p8+Bv5NnH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo6SqQAKCRB4tDGHoIJi
0m8lAQCDsd9XInZIae0ukgPefMVHdfVotzljYPbRmEP+1BP27AEAv4A0Vqu2vrbA
w0lGgrSbFErSHtc63vpQ2guyYxoYvwc=
=tWU0
-----END PGP SIGNATURE-----

--MEX5X5+p8+Bv5NnH--
