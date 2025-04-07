Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63928A7E5B7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDD310E457;
	Mon,  7 Apr 2025 16:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uCSADcsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753C610E457
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 16:10:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 946625C1ECA;
 Mon,  7 Apr 2025 16:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA86C4CEDD;
 Mon,  7 Apr 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744042219;
 bh=T/icUZNKagvrKD/XyMsdV5kUXZvHz0F432ZQ6gD6/bc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCSADcswQIgmHv9oHsLj9h4sGt3gtocSsO3jdUKpd+jKaOH8nQfKzmfm4woAno6NN
 ymVchZUBmmnbhQhN7zMQl1h1dAo44xBd6sGtcOBjGNqkkSKdNVPB38ZJAqNU4AjjGL
 MbKC5udI1PomP+E/ZbVSHRCt4sPTm4UWgGMqkZ6St3oRwyOBthcc6DRtqbvfMRSpKt
 d+wbjuc13tikm6zQvxnVYfiI7CqHsk0+CYdXDIMqzFLrOXjkH2UEUT0RJ6rjFSMdNi
 gdf1JrW62iBFzpwTZX8WG/lapMNvFFii1nDV6XANfrjE94Umjn5ZUHwYgI9gIfuhxC
 RGy9BJ5DsapnA==
Date: Mon, 7 Apr 2025 17:10:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Bincai Liu <bincai.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: mediatek: add mipi yaml for MT8196
Message-ID: <20250407-cramp-fidelity-b3a6db245938@spud>
References: <20250407133138.22449-1-bincai.liu@mediatek.com>
 <20250407133138.22449-2-bincai.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8xUyRlIlJRn2Mb1P"
Content-Disposition: inline
In-Reply-To: <20250407133138.22449-2-bincai.liu@mediatek.com>
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


--8xUyRlIlJRn2Mb1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 09:31:22PM +0800, Bincai Liu wrote:
> Add compatible string to support mipi for MT8196.

You need to point out in your commit message here and in the mipi
binding patch, why a fallback compatible is not suitable.

Cheers,
Conor.

>=20
> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml =
b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index f6e494d0d89b..ed99e959bf4b 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -37,6 +37,7 @@ properties:
>        - const: mediatek,mt2701-mipi-tx
>        - const: mediatek,mt8173-mipi-tx
>        - const: mediatek,mt8183-mipi-tx
> +      - const: mediatek,mt8196-mipi-tx
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.2
>=20

--8xUyRlIlJRn2Mb1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/P45QAKCRB4tDGHoIJi
0uZ2AQCmQRddIAahlK8Ed+uZbLQZVr9L4zCTUWXg3FZUCLVczwD+KTSQUSVEAcAA
ytubYwzhw6MZqL5MEKTRb+4e+b1dCA0=
=3pKV
-----END PGP SIGNATURE-----

--8xUyRlIlJRn2Mb1P--
