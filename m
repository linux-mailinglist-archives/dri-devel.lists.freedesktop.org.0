Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E2A4DAAD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EC010E56B;
	Tue,  4 Mar 2025 10:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g197VdAA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF03510E581
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B0245C49BD;
 Tue,  4 Mar 2025 10:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4778CC4CEE5;
 Tue,  4 Mar 2025 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741084426;
 bh=oxfH1b29Jy5NXagTLRaZznTNYVx5Cxlh0iPVEkxx5ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g197VdAAYYTjRZKbfgFXGAvD7HV6HNzMZEtn3V+Uq4SVwSAu9q4joTn3fDjaC/4gZ
 QAa69KyTC+qhSiCefQwEw77zkBzKMYQZ2XrDeqoyckA5Yj6EBSlwYSy0QPSGJ25pl2
 Xad8txPvgBLyyShLVUlmx32yUvyahXcY+qT+fLX4p6dqpJgPLVLaUBI4WG+1DKWIaT
 NNq3ao2mEHd5kXSwhDKQdVJ9AhBRwiMysYB6umTjCWmB6btNVBdvsgvKFdCGQ3iH6A
 NDoDcGk++yJPE8OgUK1Lhdc85EUR6zIN7c9rRUS6bCZVz48MHivhnM+Nj7xGvLLUUQ
 UharaEHU2clxw==
Date: Tue, 4 Mar 2025 11:33:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch
Subject: Re: [PATCH 1/5] dt-bindings: display: Document DPI color codings
Message-ID: <20250304-deer-of-striking-pride-ff6e86@houat>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cj2zylo7nvilgql5"
Content-Disposition: inline
In-Reply-To: <20250304101530.969920-2-victor.liu@nxp.com>
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


--cj2zylo7nvilgql5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] dt-bindings: display: Document DPI color codings
MIME-Version: 1.0

On Tue, Mar 04, 2025 at 06:15:26PM +0800, Liu Ying wrote:
> Document DPI color codings according to MIPI Alliance Standard for
> Display Pixel Interface(DPI-2) Version 2.00(15 September 2005).
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/display/dpi-color-coding.yaml    | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/dpi-color-c=
oding.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/dpi-color-coding.y=
aml b/Documentation/devicetree/bindings/display/dpi-color-coding.yaml
> new file mode 100644
> index 000000000000..6430d6f1ddd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/dpi-color-coding.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/dpi-color-coding.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI DPI Interface Color Coding
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description:
> +  MIPI Alliance Standard for Display Pixel Interface(DPI-2) Version 2.00=
(15
> +  September 2005) specifies color codings at the DPI interface.
> +
> +properties:
> +  dpi-color-coding:
> +    enum:
> +      - 16bit-configuration1
> +      - 16bit-configuration2
> +      - 16bit-configuration3
> +      - 18bit-configuration1
> +      - 18bit-configuration2
> +      - 24bit

Do we really needs strings there? It would be much better to use an int
plus a header

Maxime

--cj2zylo7nvilgql5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8bXBwAKCRAnX84Zoj2+
dt1IAX9V1mlAI1Gl75oEmrf11qBXqppa8x3GWIJnJLuNlT9ukdKeaLCrQX1wn479
eHm4Ol4BegL0L7cndLVYuxBHxQPptolpuxW4+J/3gbKcG28DPUVdqmmu2icZfev0
HafXHYBLEg==
=Pg8P
-----END PGP SIGNATURE-----

--cj2zylo7nvilgql5--
