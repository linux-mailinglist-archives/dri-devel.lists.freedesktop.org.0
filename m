Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4583252D205
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 14:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D8611A281;
	Thu, 19 May 2022 12:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE8A11A27E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 12:08:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D2CE3320092C;
 Thu, 19 May 2022 08:08:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 19 May 2022 08:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1652962096; x=
 1653048496; bh=mTLl3jzUYQtu6KYcZGlZls7NlsnT7nhVLEnZjPB6lsE=; b=u
 W8VYfmI+/oqYXB819AQ4zBcwcdAKyrN0RB4VhCN5gTWRYD0PbCWvVfV2XLePu4ET
 XgvA7idiCI9XqFhJDvoLV3cYK5UhXbQJcuG8axBBM0GuoY8PKoKAad8I5RWBbkmX
 fKbv0VX+Ryz8LotMBCRINvwjKU4bhnuIi2WcZFvEZ70McKCN3TpOfgh0+a3S1DOT
 RJ1uzXZrCCMtYYPkTpNoXwa6xTSWIpRFBic38VN0KpgnYVLH0yj3+xaKdvd+lDZV
 InBfHXc8kwWNN2Sq/9hBZt8Lwg+pacwVMsUbK1jC0XdzPyaNh2e3md8y56TvHWyv
 gWKu+XmsaJKXCaKRxyQ6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652962096; x=
 1653048496; bh=mTLl3jzUYQtu6KYcZGlZls7NlsnT7nhVLEnZjPB6lsE=; b=z
 U6Y199qAaoKsBpU4UPndVLw2wXZnFGK7zDO0DG+IvbYbnccwzQTalicKuU95feZI
 kwecWohcgtyar0jWG6CFW3YRifVRMHSNlASd3kToAVkPx5RAKwtoWHhwzw5Qu5Kt
 y1uqAE+/H3R/Z4LPX3Ifj/w/VF0tzMTuhf702fIqDynk1tRmNvq4XPJQ9RtmH9yS
 fWRG1lF8gljrSAIBM9bhSj/QP08iFW9eOwuSeZwJtOBY1UCyCaql5Ty3GmOeY974
 uTaA4zoh4E6Gd6folRtSJc70dnOb7bnFDqWzTn1h6Y07u5MJsGysukCD9YxgIfjB
 3dpMNB6BdkrklBN67AtHQ==
X-ME-Sender: <xms:LzOGYmfURuncYCCs_k27xD_Fc8VXss09qFA5z1boKWJ2duyyIN59CQ>
 <xme:LzOGYgMW5151wiyVbxO0YYJcizq8fK1YhiCIQ5L2rJD02kJZhS3ZYufy35bhujES8
 OqrAbYKGpM4BZmF9us>
X-ME-Received: <xmr:LzOGYnhpT-KqmEITHWqTLmCDmVfKrr4SVTj-ZP_14JqTd3Da7ml6hOyi4SnKuSEKK4hxB3-O71cJsqoLSFvZ2RGFw2LqNhQ4gt2q8Us>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedugdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LzOGYj8kFUQQKIBNGamTlzgG3hzoxUjGjKue4iPm7J2oRpncw1I51w>
 <xmx:LzOGYivN6EN1sprbkCGIzCFflXp7yEsnSbHeVLivYq9Czq-cVq0JRg>
 <xmx:LzOGYqGZ_gDUcuhreA7mXGtpCKDCT5WT3tobxwDqwkrqoz4E5GZvpw>
 <xmx:MDOGYmghvlKRkIz1wKVR2GbrpJ23Z60Sl6oShDH9rbDqNYYBlk1nMw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 May 2022 08:08:14 -0400 (EDT)
Date: Thu, 19 May 2022 14:08:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] drm/bridge: tc358767: Make sure Refclk clock are
 enabled
Message-ID: <20220519120813.e4mgdyxxgnpe7mhj@houat>
References: <20220519114751.69852-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220519114751.69852-1-marex@denx.de>
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

On Thu, May 19, 2022 at 01:47:51PM +0200, Marek Vasut wrote:
> The Refclk may be supplied by SoC clock output instead of crystal
> oscillator, make sure the clock are enabled before any other action
> is performed with the bridge chip, otherwise it may either fail to
> operate at all, or miss reset GPIO toggle.
>=20
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
> V2: Use devm_add_action_or_reset() to add clock disable hook instead
>     of wall of failpath
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 45ea829d56601..b2ef01303be23 100644
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
> +	ret =3D devm_add_action_or_reset(dev, tc_clk_disable, tc->refclk);
> +	if (ret)
> +		return ret;

if devm_add_action_or_reset fails, tc_clk_disable will be called
resulting in an unbalanced enable count for refclk. it should be called
after the clk_prepare_enable() call.

Maxime
