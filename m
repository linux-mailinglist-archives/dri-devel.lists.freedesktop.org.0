Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F008042B973
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 09:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138B189A72;
	Wed, 13 Oct 2021 07:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFD589A72
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:47:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 65F465805C3;
 Wed, 13 Oct 2021 03:47:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 13 Oct 2021 03:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=v15lPKXxuQD+O/mquKtYB7JjF4u
 gAueL/sChMoTCJG8=; b=PUIiLRQJqVtY3Jpq113nXt4rVnoX30/o5V0Rec0fBAs
 Qn9UDTPsRBsfSxiCGVZtXWNWK72k2rbpMxr+Db81tc+tOvT3wHWJ7Fo+pMz4ALEI
 zcGiNLMjNp0ApdfTN0rtzAzweVjxDa54wbSiGbCJKCI7eKwjLB/hpOzskEfrGCV+
 eLhSliX2EELZWiZfCzlC6XP0pRekKGrbwb2BE9U9mJRI2MObZUQsnpSNlh794iQj
 sAm0xAJbRjmUuaTEyb4oHKoMEo+2oug8+Wl4TviWeFliCVojyr91/ZIlio7YT+3f
 pul6qvRRxEXefeaE93MkJGIrp4qp0BovdaKz8Yk0R5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=v15lPK
 XxuQD+O/mquKtYB7JjF4ugAueL/sChMoTCJG8=; b=YzC2ur6078WJTpNOE9LCOi
 rOhqjhCqcsAJxzevA1UT6qhpk7lg2yRwzptqdpJO/q8sjCbIK6wPjqDHmJXnf00z
 F7ekL/9Sk5tp8fBdCdG4rYq42PNGKmSjX1akzyT7LHe/z0WTVodmxAtAQaA8k0ao
 HSQwjpU7se5Cbgq+Zahmr5yVYLGaOwQy1ehK4t7pUpO7deEC5KMjD5CvzytCKqcG
 MUq6EJbCF3oZrb88vijVbsbHEIUD0uxAPNON3DIM5hAF+goCou6evWWYzkYqrPdt
 of8zxTB4uff19vnHUxDVo/I/taqlRamH5PYC1XFbzEC2LLpSiJ5A3HaKdztNOkNw
 ==
X-ME-Sender: <xms:DI9mYTHvg9OzL8ZTUQONbHHqSgAwjW0OCZKN2mt5iUgTif5_XfK0aA>
 <xme:DI9mYQX6NN_7PbBEWLdicGktrZ0KbwioK2Rdu_b04FQUTGA07M10gJMN4HG88nZ33
 8MGXT1KDdhJhNDFfe0>
X-ME-Received: <xmr:DI9mYVJKK2x1HGVvKNmYcSkPXk8uFyaq6uLfj0D6gHCz6m_MgDyDqYQNEOISK1AV-15xb-7owgKVX2M1hNLrismpCyUPyD7AQzmS1zBu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtledguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DI9mYRG9r9f79Ym7E2EIBC4zITzYzJhsoXPjmv1n46f_jP7MryXLxQ>
 <xmx:DI9mYZWKoP8WskL9Ty4je749hu1mcualY9QB3X3GKmVyqBrier4npw>
 <xmx:DI9mYcN7H4ywQEMpTerT_itaRZGiSFtC6d9ewYx7AHEJxcKrsg-mgg>
 <xmx:Fo9mYfxInuprPBZRElEi9JzyvKWA35D2z-X5I4-iEl3lNL2xIVKdiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 03:47:23 -0400 (EDT)
Date: Wed, 13 Oct 2021 09:47:22 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc
 supply bindings
Message-ID: <20211013074722.7y7ug3eri4euknza@gilmour>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
 <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="to54f4mrku7omawu"
Content-Disposition: inline
In-Reply-To: <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
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


--to54f4mrku7omawu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 12, 2021 at 08:48:42AM +0200, Alexander Stein wrote:
> Add a VCC regulator which needs to be enabled before the EN pin is
> released.
>=20
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
3.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index a5779bf17849..49ace6f312d5 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -32,6 +32,9 @@ properties:
>      maxItems: 1
>      description: GPIO specifier for bridge_en pin (active high).
> =20
> +  vcc-supply:
> +    description: A 1.8V power supply (see regulator/regulator.yaml).
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> =20
> @@ -93,6 +96,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vcc-supply

This isn't a backward-compatible change. All the previous users of that
binding will now require a vcc-supply property even though it was
working fine for them before.

You handle that nicely in the code, but you can't make that new property
required.

Maxime

--to54f4mrku7omawu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYWaPCgAKCRDj7w1vZxhR
xURoAQDm8IvPUi5vzyUHpQ1t/FoKSZIKEtor9+FYGCY+QX5naQEAlTcI9cbK61fo
8MqjindSabWT6jCKa/uGOXOtF3LSNwY=
=6P+T
-----END PGP SIGNATURE-----

--to54f4mrku7omawu--
