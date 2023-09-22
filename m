Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33307AB515
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40DC10E69A;
	Fri, 22 Sep 2023 15:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A78110E69A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:48:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDE98622A9;
 Fri, 22 Sep 2023 15:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015D2C433C7;
 Fri, 22 Sep 2023 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695397699;
 bh=8w9Ujvja964fuDGqWLgM5V4eKnCcfYA0NVGZFXl15sQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5HBOrsKFey9p3dAJ7MRKC4083LY/P8a1poYb+aB+21SUWlseDbNpfcTHVARIsvzP
 bvAHEgggwV3hJIjwvIKjTZcqqlfuXL2McNpwAQNu0CMy6lEcv9fk5RdJ506CrBpyzN
 eC9qTCgvxVSLfBwR6cU+X3FK88hzghXxWn9CAA4uuu9GjBNURsbcbsGCiZycJsoQ3U
 XZzBV1p7lDlrtSDkaqjt3ddSfG0Bfnju60iQas+EBypsB+Wtfb0vKfCaze/24k3lcz
 7tw6xUPNREoIda8qU4Goa2vQfK4LfgcE2trgVMVwoedmM2pt/kVUaCvg/BA45mEJZR
 T1AKzKqMHNzNA==
Date: Fri, 22 Sep 2023 16:48:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 11/16] dt-bindings: display: mediatek: aal: add
 compatible for MT8195
Message-ID: <20230922-copilot-blinks-9792fbb03f98@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-12-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jaBhXNzcCjVRYW/j"
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-12-moudy.ho@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jaBhXNzcCjVRYW/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:21:11PM +0800, Moudy Ho wrote:
> Add a compatible string for the AAL block in MediaTek MT8195 that
> is controlled by MDP3.
>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index 7fd42c8fdc32..b4c28e96dd55 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
> +          - mediatek,mt8195-mdp3-aal
>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> --=20
> 2.18.0
>=20

--jaBhXNzcCjVRYW/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ23PQAKCRB4tDGHoIJi
0j37AQC9UwbCC8s2QULJCGVr5HCywVwaJT5fLfW7JjIum7PnRwD9FhdX5hZHQxDX
q3jxn4X/g9f90EQyLRTLqwpHbwF3eA4=
=kIb2
-----END PGP SIGNATURE-----

--jaBhXNzcCjVRYW/j--
