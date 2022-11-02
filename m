Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2AD615E9F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 10:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103D489A88;
	Wed,  2 Nov 2022 09:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF49389A88
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 09:02:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2303F3200909;
 Wed,  2 Nov 2022 05:01:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 02 Nov 2022 05:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1667379716; x=1667466116; bh=48VenoOPol
 gMO139tezfkS2fXuf8/WKG9H0qot9z5VY=; b=Jmz2uxkX8LspX9gsCjI+UgokQU
 B4jdfxcVaO8tilJN8wiOlE/nMhwNR/dyxDy+lhWtrOrfC7bvdOano80yspJRTr22
 a/zSeQ3KFu6bN7GEcJ7QT/0y0GpybjjKbzO0rl+SIAiWTsaVI20WGrL6qwGRvPHJ
 PJtLZfl/Msa4LGh139y/8hcIXt8rZZQ/nMDLy1rEHueAIpjMDv9xyf8ElBAQZBhE
 otba3eOEuDnhKBfL8WDAdKkQAjHqMg47ZsMQ4VA4zGxUjKIUXzmggYna/r/syaDu
 k6TjRkbTsDibFbybjH8hHctJd/+vOL2zNb3IUARB4qNEvZqAJfjmptwXPlvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667379716; x=1667466116; bh=48VenoOPolgMO139tezfkS2fXuf8
 /WKG9H0qot9z5VY=; b=BfKnTLpp3/fwmxWOpdJfLd3PgUMOFkY7QswAA8qUZC8H
 aX8Y7x5UdnTvj2geJ4KWu5kex/cZDf37f7cOTH7pzqSjekc9wgTlnbG8bM/V7DFZ
 nQn0QiFL9pp0kkaU4bSLl1Tlv/SdgEpPLOQRKC9C3Ly4CLSHx883VbyIaFR5A14p
 /0EoEZ5CnDTeVp8leE3u8WwTKYhh6YCe+it7OzdbwHUp2R2xurJ8TbnnTjyARAHN
 3C4QUac1oVBxjyviiBda+KNWB2JigGFCR7F5Cpy7hY9n1FoWz25Ur5C28OfKtnPe
 qelrM368KKv1Ygat5o92ZVxiPrfdUqCsvNuKmt4J3Q==
X-ME-Sender: <xms:BDJiY2At2Bk4KnZ64rT2kArsofpSjrBCyNzQ5u3t4PCz5IKLp8Dw8Q>
 <xme:BDJiYwiuRZbbNvtenNvfU2639XCiZyulNfpf7KSxsIMTs9wU-1xL36EQYX5YzbXae
 IquCLRyGcq1CgQghgQ>
X-ME-Received: <xmr:BDJiY5mhxuxsCvj9dYUwWXqOXNXCy4Uo5Uh5HplbCatP4HeB6okXQrGrkksBwpO82s52HxZwkjtifLJ9EmR0hpWJVSB6T0J5ON6-Pxj_roVPQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudeigdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BDJiY0ywsTGRzR5iKOzmk8neUh_SO-0iR8WXzRRjUoNeGZK6GsRWJw>
 <xmx:BDJiY7QcYHc90Y__5tokjUbWlb3nz9phu9WwZsnuRUDnrMIa4I50lA>
 <xmx:BDJiY_aMjDwmM-Y3RR2Ww3RMdkB-uGU-Cnm8fNtds8j2c54yNU2JIA>
 <xmx:BDJiYwJElyHPKfMA3qgShq9XQIHCYWU-mFMXr2s2OLf2lI4MiqNbQA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 05:01:55 -0400 (EDT)
Date: Wed, 2 Nov 2022 10:01:53 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Fix pointer dereference before check
Message-ID: <20221102090153.tujblkvd3jlhdtxr@houat>
References: <20221029093413.546103-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2piuzv5jj7zmiqf3"
Content-Disposition: inline
In-Reply-To: <20221029093413.546103-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, emma@anholt.net,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2piuzv5jj7zmiqf3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 29, 2022 at 11:34:13AM +0200, Jos=E9 Exp=F3sito wrote:
> Commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug") introduced
> the vc4_hdmi_reset_link() function. This function dereferences the
> "connector" pointer before checking whether it is NULL or not.
>=20
> Rework variable assignment to avoid this issue.
>=20
> Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 4a73fafca51b..07d058b6afb7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -319,9 +319,9 @@ static int reset_pipe(struct drm_crtc *crtc,
>  static int vc4_hdmi_reset_link(struct drm_connector *connector,
>  			       struct drm_modeset_acquire_ctx *ctx)
>  {
> -	struct drm_device *drm =3D connector->dev;
> -	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
> -	struct drm_encoder *encoder =3D &vc4_hdmi->encoder.base;
> +	struct drm_device *drm;
> +	struct vc4_hdmi *vc4_hdmi;
> +	struct drm_encoder *encoder;
>  	struct drm_connector_state *conn_state;
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_crtc *crtc;
> @@ -332,6 +332,10 @@ static int vc4_hdmi_reset_link(struct drm_connector =
*connector,
>  	if (!connector)
>  		return 0;
> =20
> +	drm =3D connector->dev;
> +	vc4_hdmi =3D connector_to_vc4_hdmi(connector);
> +	encoder =3D &vc4_hdmi->encoder.base;
> +

I don't think that's right. Connector shouldn't be NULL to begin with,
how did you notice this?

Maxime

--2piuzv5jj7zmiqf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2IyAQAKCRDj7w1vZxhR
xclpAQDwusHvGhXtWLqUZjV4oaBclOlKnVClFcnplMVjERHSHAD+MZOvuaDd+PPh
thSlYBgAKiDk4ReeyGf+XLKy4NCa0QE=
=T/lW
-----END PGP SIGNATURE-----

--2piuzv5jj7zmiqf3--
