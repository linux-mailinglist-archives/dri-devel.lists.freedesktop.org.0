Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4F84A839D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 13:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3C10F3C0;
	Thu,  3 Feb 2022 12:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6004810F3C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 12:13:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B46D15C021E;
 Thu,  3 Feb 2022 07:13:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 03 Feb 2022 07:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=V8Ao9I0MdiW2ENSGu0dnqaYDSRvrv3wjjWtm8T
 vT2wU=; b=VxXgOYHEObdn/M38WaiFhgvzXm2CdHDVWh3pBGj8XNksP44bvjL494
 eaObd8uS/JpJRoPgYbRL8tsV8PhfT4sFYBo+yZNll9JNdrXhN/vopHsDbtZr1aph
 TRaGvlc5nyg1CU3mJuUV+R5ii+e4I1Lf6MsuPX6YW9g7XFYyJJPMdvjSkXpa2RqM
 g1BNiq79gvqwLoEx2KYnZAm+8xx/nWe7jqrpggjQo2nSRMi78YXR2evNzafy21nh
 rHrMeCLdaCrL+G7Kzw9rgjCIC3aZD8loG+5lM7dZ1EjEKxydE9oKUKbJMYhL6T01
 aGzo+WNsrTrk9gQoRLZHpxAsC0D8HLfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=V8Ao9I0MdiW2ENSGu
 0dnqaYDSRvrv3wjjWtm8TvT2wU=; b=C4VykM6Vo/XUqPadqbySat6kNVRs6CiVX
 /xiIUmSGKqAF2DbEff39HYqDQb0IGYbw9FBuZoRNdBF1SodbAXnDUkful4+gJXwe
 neYwdOqVlonPgI+84bhG/GHkEsf/Gd923DbK/bo2zOFLjr1cOFTbpd+Dk+oHhzIR
 Srd+IQAgIX5MB/dgWim1fIpjuf8ScXfyZsEwEzw/prpqSJ5lJjGxOr3bi4ZQZ6Ss
 JDgAzz2gcluv1W10UEswMGLt1HvXCSTGWx7pk6wPC9XnnR6xRAKC4XpxyjvXmLxe
 FVesa6OIic7ja+TEcuwXF0+A7oSpPGyQG2xIeP2pVTljw6ZfQQp1w==
X-ME-Sender: <xms:3cb7YSXIu_a6gkgrZ7v0yJYzqnVy51hpzny7VB_-Foubq2ndz8dF9g>
 <xme:3cb7YemR16NrMHvivcyG6zkZqppFgiP5KIrAvdPrF21LuWDgqgof0Z_gY2NXjdPTr
 8j9SHf112udKOCGpHw>
X-ME-Received: <xmr:3cb7YWbODPgJ93aCqd-8KnCcqM2ivDh4MeNxTxfJKosSThKwPyGiS1ilpiDVM8aLXTLo0i-a654YJsupwTuDKd_3rF90-JpdQg2-VvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3cb7YZXxzh2jz-FTxW823qdFtkMSsQD7oof6zxjjaNPalgfjGpUbaw>
 <xmx:3cb7Ycl-yMULSXC5NXeyGaZV807OyPKpF7IcEKosbRx66Ejgucxjjg>
 <xmx:3cb7YecteQgIX-KoICmCDbv4U-MywcZERvNNnpuZiB5pSrLRReZ97w>
 <xmx:3cb7YdDQeDAQ0LOWDCOAcLXBt07IfStlMVYSULbForNgZd3j6FxETg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 07:13:16 -0500 (EST)
Date: Thu, 3 Feb 2022 13:13:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 07/14] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220203121315.zo27qg37n2euy2d4@houat>
References: <20220114034838.546267-1-marex@denx.de>
 <20220114034838.546267-7-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tgcfcscwcxxsohir"
Content-Disposition: inline
In-Reply-To: <20220114034838.546267-7-marex@denx.de>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tgcfcscwcxxsohir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 04:48:31AM +0100, Marek Vasut wrote:
> The driver currently hard-codes DSI lane count to two, however the chip
> is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
> property and program the result into DSI_CTRL register.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 35 ++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index 3ad082c1d2bfd..400a566026ab4 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -135,10 +135,12 @@ struct chipone {
>  	struct device *dev;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
> +	struct device_node *host_node;
>  	struct gpio_desc *enable_gpio;
>  	struct regulator *vdd1;
>  	struct regulator *vdd2;
>  	struct regulator *vdd3;
> +	int dsi_lanes;
>  };
> =20
>  static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridg=
e)
> @@ -235,6 +237,11 @@ static void chipone_atomic_enable(struct drm_bridge =
*bridge,
>  	/* dsi specific sequence */
>  	ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
>  	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
> +
> +	/* DSI data lane count */
> +	ICN6211_DSI(icn, DSI_CTRL,
> +		    DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi_lanes - 1));
> +
>  	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
>  	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
> =20
> @@ -354,6 +361,8 @@ static const struct drm_bridge_funcs chipone_bridge_f=
uncs =3D {
>  static int chipone_parse_dt(struct chipone *icn)
>  {
>  	struct device *dev =3D icn->dev;
> +	struct drm_bridge *panel_bridge;
> +	struct device_node *endpoint;
>  	struct drm_panel *panel;
>  	int ret;
> =20
> @@ -390,13 +399,26 @@ static int chipone_parse_dt(struct chipone *icn)
>  		return PTR_ERR(icn->enable_gpio);
>  	}
> =20
> -	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> -	if (ret)
> +	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +	icn->dsi_lanes =3D of_property_count_u32_elems(endpoint, "data-lanes");
> +	icn->host_node =3D of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
> +
> +	if (icn->dsi_lanes < 0 || icn->dsi_lanes > 4)
> +		return -EINVAL;
> +	if (!icn->host_node)
> +		return -ENODEV;
> +
> +	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &panel_=
bridge);
> +	if (ret < 0)
>  		return ret;
> +	if (panel) {
> +		panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(panel_bridge))
> +			return PTR_ERR(panel_bridge);
> +	}
>
> -	icn->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(icn->panel_bridge))
> -		return PTR_ERR(icn->panel_bridge);
> +	icn->panel_bridge =3D panel_bridge;

It looks like you're doing more than what you said in the commit log
here? There's at least a change on the error condition for
drm_of_find_panel_or_bridge, some reworking of the drm_panel_bridge_add
call, plus the data-lanes property parsing you were mentioning.

All those should be separate patches

Maxime

--tgcfcscwcxxsohir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfvG2wAKCRDj7w1vZxhR
xbPnAP9R1weAluS7PLL2/xJSUP47bU1L35lRp3F4gXqF/xAeNgD+MiQRtfe0k+SA
4hCh8tZ8c8Qy611JsW5P1yuJxnX1hA4=
=Jswj
-----END PGP SIGNATURE-----

--tgcfcscwcxxsohir--
