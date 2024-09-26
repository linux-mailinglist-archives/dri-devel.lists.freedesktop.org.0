Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F7987725
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 18:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D4410EB86;
	Thu, 26 Sep 2024 15:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GEauHDz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EF810EB78
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 15:59:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3288E5C04AC;
 Thu, 26 Sep 2024 15:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2596DC4CEC5;
 Thu, 26 Sep 2024 15:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727366387;
 bh=5WPiZotTJNjDA/yWMHXdhILtKuuGmQdF3mrjZNA821k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GEauHDz/vBRh7M8Li+EvWJ4ck1kr2Is+EqOj9sPiez6/KYucxWXoVT1x40jwiRhef
 SkdDhc63WWETfh82y06j5gywdfdpE/K9C3RqdiqfFy2XNhHdvLIL5UIK0v31NpxkgD
 63H9Amiwokhi7Jzk9BjiyrwgFxN+pLHppfNyqQYbo6SxWX4hTF/MppGveN3p6sBhYN
 SXT87+siB6j3SV8VUh8tI6EHMfqREe4POKBt7P8DiPFH/UQscKZQ1rMtvFClXK0Y5l
 eDjQLnMqfHLOBN4kwc/I4slu0Mp5Ry9f4NWAtugJWqYY3f9foMZph03OeDmBUGrxxD
 y7kr8m7kRvbMQ==
Date: Thu, 26 Sep 2024 16:59:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, Ben Lok <ben.lok@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Bear Wang <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 Sen Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: display: mediatek: dpi: Add mt8195
 support in power domains
Message-ID: <20240926-visible-harmonica-a7cda103ff70@spud>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
 <20240926111449.9245-5-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IMup/vqcFMn6Sn9a"
Content-Disposition: inline
In-Reply-To: <20240926111449.9245-5-macpaul.lin@mediatek.com>
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


--IMup/vqcFMn6Sn9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 07:14:49PM +0800, Macpaul Lin wrote:
> Add power domain binding to the mediatek DPI controller for MT8185.

This wording is confusing, no binding is being added here, you're just
allowing one property.

> The dpi node in mt8195.dtsi was triggering a dtbs_check error:
>   dp-intf@1c113000: power-domains: False schema does not allow [[44, 18]]

And while it is good to have the warning, it would be better to explain
here that there are actually power domains, since the dts could be wrong
here also.

Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power doma=
ins")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>=20
> Changes for v2:
>  - Because of the corresponding dts fix has been reviewed with a Reviewed=
-by: tag.
>    [1] https://lore.kernel.org/all/20240925080515.16377-1-macpaul.lin@med=
iatek.com/
>    We still need this change to fix the 2 dtbs_check errors.
>    So keeps no change here.
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 3a82aec9021c..07acc8a76bfc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -89,6 +89,7 @@ allOf:
>                  - mediatek,mt6795-dpi
>                  - mediatek,mt8173-dpi
>                  - mediatek,mt8186-dpi
> +                - mediatek,mt8195-dp-intf
>      then:
>        properties:
>          power-domains: false
> --=20
> 2.45.2
>=20

--IMup/vqcFMn6Sn9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWE6gAKCRB4tDGHoIJi
0o8/AQDZGYmuC7hP+2xaTqwKXghh85TysD+qSjWhvV4FfeR+gQD8DbK1R1oHhLRL
a08ypff9VkE92E4iJH4I3W5M8tHjQQc=
=C4PU
-----END PGP SIGNATURE-----

--IMup/vqcFMn6Sn9a--
