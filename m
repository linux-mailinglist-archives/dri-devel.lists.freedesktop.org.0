Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE150B5C0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 12:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C68310F42D;
	Fri, 22 Apr 2022 10:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1610F443
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:57:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id CB776580F59;
 Fri, 22 Apr 2022 06:57:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 22 Apr 2022 06:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650625035; x=1650632235; bh=t0Vm9xILeM
 tEm0+ZRmoAPUxhxs4H3KoDqpfSFpCeFCw=; b=YyohwOWwHOsgUBEhklxIw81jQH
 9k7QTlQ/m1chfbM67m+0hW+J9gC6M6REt0RZOv0kxcV3mVU0ScXWAtz8bTJoRWfr
 h39uvBYqPEsgR7nFb0qijB/+vstZUi0TZ/how9i+VZQaoGnq2HsUShd/DZjOM72Y
 UbnN0SFcAOLXFNkmucRsE7gGWzHf/I8SXDQN841DdKmdE9P+1T0UqTQn74Vi2pm9
 /b13SwhKwJOQaaABmogrWklj6+cOSFo6dwcSWlMJIipbLw2teTqkYit9CbvlQsHx
 /2bmmHf76lj9iXG9hJRVNy5Yt8FDk3ftKcfgEw2cx0UoIH9ztTjiHZ/MdTOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650625035; x=
 1650632235; bh=t0Vm9xILeMtEm0+ZRmoAPUxhxs4H3KoDqpfSFpCeFCw=; b=i
 U8nPM70ubfTAq9JEpnksZSiKccgJS/v8kX9pGTdKcgUiBHN4rDQM/c4Lgq4JL2HR
 iDy00wOWuSCQAZXoDyWtLxu1Utf5X88aPC0doymtVSzDLd4/S2Ep2Jj6cHBekpTG
 2KZkDoTxrrlmJNmgj449qTFBH3KZS9w2tLHkCrodp5EGzuuDP6/3hLw1mQSAdjb3
 vF3oeIRT3hw/ReJoP7uA6fQkrPBGSbt9Ygbsgu7hVv2UgL2mdrMmSkVY9ABIAUMC
 X2hou/ZnmrbeIWf6MhaZEYnc30U7xcYJ5cRUuwMU3+tTmOc3CpYO5qaufhDCnjhF
 YPdaRylLN7MKSl4PYIogw==
X-ME-Sender: <xms:CopiYvpMg8hB7wNpmcKj2c9-fUTff0aV2fB5qx5MxUk88lFsfRZuXA>
 <xme:CopiYpp-fmHr5lxSrNy6k0HXJwDwH2MfQqaD6w-jP_5XDLZehoZDf5xqH0_9PwF2D
 _3Q7UW1zdGwZMDyILI>
X-ME-Received: <xmr:CopiYsOb8mHfLnR-4-ETneMFMMtqW8Xf_gwFS7tf9GX0HylDPpLpF5Xhk194DVmeXTKHVfvIXDostCKkkkARyFRA6elGSxqRXSK26Ws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdeggdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepledvueduvdegleeufeetjeeuvefhieehjedutddtffekleekgeduiefgffdt
 hffgnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:CopiYi7w5KJVhVmQgmTJeLJvfycuQZkbrISLSqb7SB_NXdvUAZyoPA>
 <xmx:CopiYu5b75WZpoAisop1NSRQcW46FVY3pRultQY6ns1ZPAx292OLXA>
 <xmx:CopiYqiU0Ie1XFuc5PcX1rrVtTeSuAFCCFvXYu8cAeqaid2zrKOvxQ>
 <xmx:C4piYhwlFs3WkiNwqadkyWiP3PYOKVYUrZAEDGBE5fWMd4iufn3zFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Apr 2022 06:57:14 -0400 (EDT)
Date: Fri, 22 Apr 2022 12:57:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Message-ID: <20220422105712.bdpbwliificvon4j@houat>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-2-granquet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="anrqwesp6j2b4lfg"
Content-Disposition: inline
In-Reply-To: <20220327223927.20848-2-granquet@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, Markus Schneider-Pargmann <msp@baylibre.com>,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--anrqwesp6j2b4lfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 28, 2022 at 12:39:06AM +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
>=20
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
>=20
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index dd2896a40ff0..2dba80ad3b18 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DP_INTF Controller
> =20
>  maintainers:
>    - CK Hu <ck.hu@mediatek.com>
>    - Jitao shi <jitao.shi@mediatek.com>
> =20
>  description: |
> -  The Mediatek DPI function block is a sink of the display subsystem and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parall=
el
> -  output bus.
> +  The Mediatek DPI and DP_INTF function blocks are a sink of the display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel da=
ta on a
> +  parallel output bus.
> =20
>  properties:
>    compatible:
> @@ -23,6 +23,7 @@ properties:
>        - mediatek,mt8173-dpi
>        - mediatek,mt8183-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpintf

It seems a bit weird to have all instances of DP_INTF with a separator
but the compatible doesn't have one?

Is there a reason to not use dp-intf?

Maxime

--anrqwesp6j2b4lfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmKKCAAKCRDj7w1vZxhR
xWHVAP9XOs5mllTpT84nKFlJqhBvEdANoAc/yLINNdL4rTwK/AEA2W/abW6SXtii
kYk/IHsQm/a6SEpxbGGVFYXWq6N3fQE=
=Cd+2
-----END PGP SIGNATURE-----

--anrqwesp6j2b4lfg--
