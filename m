Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D57C41224
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85710EB44;
	Fri,  7 Nov 2025 17:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="liDl2Xni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505A310EB44
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:45:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9128761922;
 Fri,  7 Nov 2025 17:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC82EC4CEF8;
 Fri,  7 Nov 2025 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762537509;
 bh=8UBP4r5CsBAmdMBC7TGsubOEbdmbQ9s7WdxZkROZk/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=liDl2XninbWYIcqybmOwmVOzJLQd/CoAGBZLnfDn3BSnQlhAmpHku3GmkbZDBWCsF
 ej3bn4e0fR7wpfU60f+u2Zy+BNdbyS+NTlfS/NkMFfIJ2o3IuEfhrnlHj0bcztYHb7
 NZ7G+o3qUwk0quMF+K+pMXl6sWa8l4eZWbGxR3/BxnihXtdXjeW7nMtEHED7v7i/Cy
 I3CaF9gPPpcZi8m/A/UVDF0Yzt7PsOIpBAkRVu31XQ/hXxgIbeBYf+M+m/1IRl5HTn
 A2eTVfG/MxD9XTEdJ8fGDZ05KCZoEQV/iyGlIjqmMh/StX0+ujfcarDZEPeX2UyElz
 Zu++h6f3uhhbQ==
Date: Fri, 7 Nov 2025 17:45:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: bridge: lt9211c: Add bindings
Message-ID: <20251107-batting-wimp-b98f79cf6318@spud>
References: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
 <20251107-add-lt9211c-bridge-v2-1-b0616e23407c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J84/gdKCYWS1iHDH"
Content-Disposition: inline
In-Reply-To: <20251107-add-lt9211c-bridge-v2-1-b0616e23407c@oss.qualcomm.com>
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


--J84/gdKCYWS1iHDH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 06:32:58PM +0530, Nilesh Laad wrote:
> From: Yi Zhang <zhanyi@qti.qualcomm.com>
>=20
> Add bindings for lt9211c.
>=20
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> ---
>  .../bindings/display/bridge/lontium,lt9211c.yaml   | 113 +++++++++++++++=
++++++
>  1 file changed, 113 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9=
211c.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211=
c.yaml
> new file mode 100644
> index 000000000000..619f718618d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.ya=
ml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt9211c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>

Why is Marek here?
The patch seems fine, but this is confusing.

--J84/gdKCYWS1iHDH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4wHgAKCRB4tDGHoIJi
0mh7AQDLr/nyRgvC1Ynncg3iPh/plfKOkx0hTqa5hBFd+ADX7QD9GZ0tkFjapgio
gGLJ2bq5QYL2qjNC3za8P8n5yFrcXAc=
=AjS0
-----END PGP SIGNATURE-----

--J84/gdKCYWS1iHDH--
