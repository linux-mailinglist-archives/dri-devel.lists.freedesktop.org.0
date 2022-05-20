Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59F852E772
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 10:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642B811ADC0;
	Fri, 20 May 2022 08:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F45811ADC0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 08:30:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 69F5E5C01A4;
 Fri, 20 May 2022 04:30:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 20 May 2022 04:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1653035456; x=1653121856; bh=JrboHXWXmW
 g+Ajlsh4OSWnUOyEnSMZHY/Hyt6MK1IVs=; b=Tq8jyW9C0ubsdhKdvAIGjkLNIv
 pPKSreQ3hoNBAPdrdg8i+u6vV+WO6fkN/YUc77xU6GCYR05AZ0jKa/+hTC63Hy9S
 4qpG7nXTayi0YngAWhVyyhGfjS+F1SPnR13oATJ0BC+x8N1UDThAN3HV0S70qrS3
 6B2fg57tc7v2cJeUoabpwqVjQQGinq+KwdCzwLVCwcxoM5Mx97rGG5pjaK2cf3yc
 uKuzxZ5IEo79JflieNDjm7e2N6XRjDN+E/o+HRJ+67n/xldkgn2OrMs9sMhcbjI3
 iGKR6VZJn9L+efGSYmjLzHLb4T/QKGBA7kzIBzzIQ6y2MIhBIHtBZA9PJoeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653035456; x=1653121856; bh=JrboHXWXmWg+Ajlsh4OSWnUOyEnS
 MZHY/Hyt6MK1IVs=; b=jEsB6rvWLAokXqgNJH4u7Zx7etU7MIs5pFvIQ3IyZIis
 NgKQdFXskcfa2Jc1uJdni003vaH7sclEal5EpsaNCXvQ6I1x+lyYbkw91et/VDz4
 x02JHsxwnMCVi3o1ggzFTjrBGDtMDlkkaurDhj2BJmRe4MhgnQJGkI9ciQ/A33iS
 dtsSKEGkDGUKV+YKp4zYzmmX8Vll01x3s41voYVbluJPl14D7SbYaIb6l+DouFDM
 BDoQsuD9hUc/VALwyD8SBs2WgashpRnTw5qchBvRXb1Qz0/imUPcxFhrokSFnUbD
 La640Mtxio/MJEdIrOguo9Adk6ZD21U+zQzs8LZwQQ==
X-ME-Sender: <xms:v1GHYrS7mvQACgdXEjczqhwXSr0rhP9AUZNQvnvCeM7ttDGbIEQyqg>
 <xme:v1GHYsy_a5RxqkJU_ZioSQOeJ75XWk8rUViGXCGcRxXdNKkXOvL74ysgEs6Dng00B
 rWlH9yZsCZ6BzE0JNI>
X-ME-Received: <xmr:v1GHYg1Koq_UdP5h1Qi2DmW7EMf1fvpCwTzH2gTw0oiYo7BOO_rwlVZHdub7mFf8_Q_IYpWyv8lQaatmqWaB4oulUgaYh4EbZLtiQ2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:v1GHYrChgGUyTShyOPQdtrrCOh52ebHwBgBPMdF68RZ-lev284oysA>
 <xmx:v1GHYki8jLPzTCEyvfIFtrWKldWvvg_iVlJCulx5_fdeoTaAxuKO1w>
 <xmx:v1GHYvp2W2eKzwyQ0Ow8NS-5lNsNdVDeMY8tIXcVGgQnfZXam41Caw>
 <xmx:wFGHYvV1vokLvNka_NhYL00HfslUJGACkIljue_IbA6AwXAza0ROMw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 04:30:55 -0400 (EDT)
Date: Fri, 20 May 2022 10:30:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3] drm/bridge: tc358767: Make sure Refclk clock are
 enabled
Message-ID: <20220520083053.qnyeuasyedyr2oza@houat>
References: <20220519122912.93536-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uhgnbm6o5hmlpkdf"
Content-Disposition: inline
In-Reply-To: <20220519122912.93536-1-marex@denx.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, robert.foss@linaro.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uhgnbm6o5hmlpkdf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 02:29:12PM +0200, Marek Vasut wrote:
> The Refclk may be supplied by SoC clock output instead of crystal
> oscillator, make sure the clock are enabled before any other action
> is performed with the bridge chip, otherwise it may either fail to
> operate at all, or miss reset GPIO toggle.
>=20
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Fixes: 7caff0fc4296e ("drm/bridge: tc358767: Add DPI to eDP bridge driver=
")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
> V2: - Use devm_add_action_or_reset() to add clock disable hook instead
>       of wall of failpath
> V3: - Swap devm_add_action_or_reset()/clk_prepare_enable() to avoid
>       clock disable imbalance
>     - Add RB from Lucas
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 45ea829d56601..7d4035ca26b19 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2033,6 +2033,13 @@ static int tc_probe_bridge_endpoint(struct tc_data=
 *tc)
>  	return -EINVAL;
>  }
> =20
> +static void tc_clk_disable(void *data)
> +{
> +	struct clk *refclk =3D data;
> +
> +	clk_disable_unprepare(refclk);
> +}
> +
>  static int tc_probe(struct i2c_client *client, const struct i2c_device_i=
d *id)
>  {
>  	struct device *dev =3D &client->dev;
> @@ -2049,6 +2056,22 @@ static int tc_probe(struct i2c_client *client, con=
st struct i2c_device_id *id)
>  	if (ret)
>  		return ret;
> =20
> +	tc->refclk =3D devm_clk_get(dev, "ref");
> +	if (IS_ERR(tc->refclk)) {
> +		ret =3D PTR_ERR(tc->refclk);
> +		dev_err(dev, "Failed to get refclk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	clk_prepare_enable(tc->refclk);
> +
> +	ret =3D devm_add_action_or_reset(dev, tc_clk_disable, tc->refclk);
> +	if (ret)
> +		return ret;

We'll also have the imbalance if clk_prepare_enable fails.

Maxime

--uhgnbm6o5hmlpkdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYodRvQAKCRDj7w1vZxhR
xaAcAQDbdU2SmxrLTxJQ/eblqX8TZzsG9oUtlThNOLlgNCLLEgD+PmsFdU2lKW+1
qCBm3TQWSdXV9XqCgGkNDGlzuqw60wg=
=97zy
-----END PGP SIGNATURE-----

--uhgnbm6o5hmlpkdf--
