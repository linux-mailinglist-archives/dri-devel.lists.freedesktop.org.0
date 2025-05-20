Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B18ABDF89
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939A210E5FF;
	Tue, 20 May 2025 15:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M+ax18VU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED0210E5C0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 15:49:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 30E484ADDC;
 Tue, 20 May 2025 15:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DB1C4CEEB;
 Tue, 20 May 2025 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747756184;
 bh=x/xcA2v5rT9pwMsxq/8r5xiUmJQA9aym0rnhAdmD3Yk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+ax18VU+RapQy1TPRGI7d0iNYYDgrm9n4D23yzzpavnmHlIoBx3UDsNGB28r6Zlv
 Txx/bUModBFHoFNXdzBUFtZi8/L716fwB8mPvmeWfA8kfZHRkX0nkjL5pgzdelYj20
 Bx1UQ6uFLAsAYwGa1M7p9NvBkSYt//xnEEF5xK+BG/LzsJroxLOkpqv5Q1ywhsSZ+G
 RMe5y+mcakhck0stZrOzJ1cEmaYy6r8RQdkdzm9Q7vbLV9OvIAs1DBhz5wGhwwraYV
 L6iGRdjZV5N0Ti/S5tAyzzOFMuRmFOZ5GL+Xip4Yp4vH44pdIGiZ1iQELQnC5eCL30
 lQTjgebaFPo5A==
Date: Tue, 20 May 2025 16:49:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add AUO P238HAN01 panel
Message-ID: <20250520-certify-womanhood-678edc4a37a5@spud>
References: <20250520074439.655749-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bTHU5tE0Xeo7TnAi"
Content-Disposition: inline
In-Reply-To: <20250520074439.655749-1-mwalle@kernel.org>
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


--bTHU5tE0Xeo7TnAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 09:44:38AM +0200, Michael Walle wrote:
> Add AUO P238HAN01 23.8" 1920x1080 LVDS panel compatible string.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 5542c9229d54..1ac1f0219079 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -57,6 +57,8 @@ properties:
>        - auo,g121ean01
>          # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
>        - auo,g156xtn01
> +        # AU Optronics Corporation 23.8" FHD (1920x1080) TFT LCD panel
> +      - auo,p238han01
>          # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
>        - auo,p320hvn03
>          # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD p=
anel

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--bTHU5tE0Xeo7TnAi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCykkgAKCRB4tDGHoIJi
0tKCAP9ow8y7bFpTF9AFOfz3Q47pX+fn3qmAmfaO2AAm4BuOlAD/XKSPjiHCNN0s
ft5UMQAypauFLdS+TlIB4DgD2yquRQQ=
=r6Sy
-----END PGP SIGNATURE-----

--bTHU5tE0Xeo7TnAi--
