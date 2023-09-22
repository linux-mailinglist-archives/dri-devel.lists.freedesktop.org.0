Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBA77AB4F3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649FC10E696;
	Fri, 22 Sep 2023 15:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA86610E696
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:42:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1052622A9;
 Fri, 22 Sep 2023 15:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27BCC433C7;
 Fri, 22 Sep 2023 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695397350;
 bh=5BvJFP59LWR6oDRO5gYLA3PtHEwbDC1l69qhCgYKVCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NwsOSugG4TV4Em3gjHEeJTTBmwRPpa/KkLiCEpocihXimquuECxT7ntrra1bg34sv
 Mn6IpapFxVVsN0FIQ22ZPXKmMRDLNHnSHrnB/7ktVv0g4D34g/2RNsW4vThxRipxSp
 i7PIBY8Og6q/LRgorpaw+lTPueWenBahnUH44XEhz4d1SVmAPiQcLaCB0LvRrK23DK
 68wqByJglzf2t++qUiqD9akiPztmS/k0n89j82VOMrSpBiX5e6Wm8r3Kq5cnhg3sVo
 siLaiwRJxNjwS/yTy16nYT/jzinn4diKN61G9ihnFg69ZQCapWeIQF+8RQM4dIXNST
 jvXebT3Osxqhg==
Date: Fri, 22 Sep 2023 16:42:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 03/16] dt-bindings: media: mediatek: mdp3: include
 common properties
Message-ID: <20230922-grope-yield-46767aa32a3d@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t3id+nrX22G9XF03"
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-4-moudy.ho@mediatek.com>
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


--t3id+nrX22G9XF03
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:21:03PM +0800, Moudy Ho wrote:
> To minimize duplication and standardize the document style,
> include the common properties for MT8183 RDMA.

Duplication that you created in the previous patch? Why not combine
patches 2 & 3?

Cheers,
Conor.

>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 43 ++-----------------
>  1 file changed, 4 insertions(+), 39 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 3e128733ef53..0539badc9821 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: MediaTek Read Direct Memory Access
> +title: MediaTek MT8183 Read Direct Memory Access
> =20
>  maintainers:
>    - Matthias Brugger <matthias.bgg@gmail.com>
> @@ -18,62 +18,27 @@ description: |
>    Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>    for details.
> =20
> +allOf:
> +  - $ref: mediatek,mdp3-rdma-common.yaml#
> +
>  properties:
>    compatible:
>      items:
>        - const: mediatek,mt8183-mdp3-rdma
> =20
> -  reg:
> -    maxItems: 1
> -
> -  mediatek,gce-client-reg:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      items:
> -        - description: phandle of GCE
> -        - description: GCE subsys id
> -        - description: register offset
> -        - description: register size
> -    description: The register of client driver can be configured by gce =
with
> -      4 arguments defined in this property. Each GCE subsys id is mappin=
g to
> -      a client defined in the header include/dt-bindings/gce/<chip>-gce.=
h.
> -
> -  mediatek,gce-events:
> -    description:
> -      The event id which is mapping to the specific hardware event signal
> -      to gce. The event id is defined in the gce header
> -      include/dt-bindings/gce/<chip>-gce.h of each chips.
> -    $ref: /schemas/types.yaml#/definitions/uint32-array
> -
> -  power-domains:
> -    maxItems: 1
> -
>    clocks:
>      items:
>        - description: RDMA clock
>        - description: RSZ clock
> =20
> -  iommus:
> -    maxItems: 1
> -
>    mboxes:
>      items:
>        - description: used for 1st data pipe from RDMA
>        - description: used for 2nd data pipe from RDMA
> =20
> -  '#dma-cells':
> -    const: 1
> -
>  required:
>    - compatible
> -  - reg
> -  - mediatek,gce-client-reg
> -  - mediatek,gce-events
> -  - power-domains
> -  - clocks
> -  - iommus
>    - mboxes
> -  - '#dma-cells'
> =20
>  additionalProperties: false
> =20
> --=20
> 2.18.0
>=20

--t3id+nrX22G9XF03
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ214AAKCRB4tDGHoIJi
0pjhAQDqYFJMcVq5Ru7Q8gVzeuDVj+gKssFalhT0d+Clke4nqQD/VPXvz8K458L1
KJs20bZWY09DDbrl5qDCY9BMQs7IQQc=
=F41u
-----END PGP SIGNATURE-----

--t3id+nrX22G9XF03--
