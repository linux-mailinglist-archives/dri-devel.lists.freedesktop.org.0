Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1201290B615
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 18:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD4110E11A;
	Mon, 17 Jun 2024 16:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D1J+/GhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9F310E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 16:18:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 37F1ACE0EDE;
 Mon, 17 Jun 2024 16:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C98C2BD10;
 Mon, 17 Jun 2024 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718641104;
 bh=EY+4UcdN3SJN/tw5GnFXIR6zPGfQZjIPes1lgtjBBcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D1J+/GhH0m4XyRUQNnSuU3Kxibw7tmYI+Waa/ntddVGlbtdwgGBeq6oN1dpWNvdc7
 FmRYCGr1TlcBPDaJIz5JWtKB3CjeMzGuTJrw90/MbW8lfmzqcRvvjutifiUL66yCgD
 I2u5y36wMELOfIu3MLJ9FXlCE6RGQ+WjKWlP2oHhJYTgH8qtE/YtGtFPnCqMXoNDOJ
 5wkaxsWpZUpmMtobwDUuIljwwduUsmfqviY6ANfjfO6L1LyHlT4a4kYx1woyFHQ2c1
 KfCb/m+eGSo7F/d1O6wjn3A6lWFxwC5+UDn0jAquWmMxV1edmyyXrOZ7ZMmdBD1rMA
 yumfdjJeiV6Dg==
Date: Mon, 17 Jun 2024 17:18:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: simple-bridge: add ti,tdp158
Message-ID: <20240617-daydream-query-906923e8b12f@spud>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-1-df98ef7dec6d@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NgEG+8ha7KOidoBa"
Content-Disposition: inline
In-Reply-To: <20240617-tdp158-v1-1-df98ef7dec6d@freebox.fr>
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


--NgEG+8ha7KOidoBa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 06:02:59PM +0200, Marc Gonzalez wrote:
> In default mode, this device works transparently.

Please explain what makes this device incompatible with the existing
ones. For example, why not make the new compatible fall back to
ti,ths8134?

>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 4 =
++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-brid=
ge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.ya=
ml
> index 43cf4df9811a5..5f0c9687538bf 100644
> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> @@ -31,6 +31,7 @@ properties:
>            - ti,opa362
>            - ti,ths8134
>            - ti,ths8135
> +          - ti,tdp158
> =20
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -52,6 +53,9 @@ properties:
>      maxItems: 1
>      description: GPIO controlling bridge enable
> =20
> +  vcc-supply:
> +    description: Power supply for the bridge
> +
>    vdd-supply:
>      description: Power supply for the bridge
> =20
>=20
> --=20
> 2.34.1
>=20

--NgEG+8ha7KOidoBa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBhyQAKCRB4tDGHoIJi
0qQ2AQCtC7E2W++0bkEZqIyJfhekP6rN7C44pryIrjtcn7BHLwD/bthwuO4+enY6
60JTVuWhPa9fXCQ3sJeDHBZSXZiVrwM=
=rdsD
-----END PGP SIGNATURE-----

--NgEG+8ha7KOidoBa--
