Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB548AB8E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04F010E98F;
	Tue, 11 Jan 2022 10:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2830610EFF6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:39:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3B17C580440;
 Tue, 11 Jan 2022 05:39:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jan 2022 05:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=gg776tXA8MrKZ1cXF0F3Dyip/+v
 jNa++Du2FRMWtUoQ=; b=A9e3JqdzQ+AM9v6dooqwc5pNAgfMtpKNdQAEs2McwEL
 0b9RuVxJKA7VmBVRZKkYv5Q09udCqqFC/kK21JcKCOMHbd5oGuAWBa6y61hyC9v3
 LNFccyPzUoT5D8rTgbsHrAtLV0vznVSamwmloGYETY30uXbKGbY/FKS4i07tNUbP
 YMfxlUCgB/yVzPU/T7NxwcoQpQvwByIcgr6Qjrk0CYmE23yyWvNqyqCLVDywcIfo
 PxZ0gMmpWaKO8IrnxHduAZIIM4wsBsJqk1iwgAuxzuIQhefof+WVWjTfG1CU/FiT
 EvNrlMD0xbe+aPXUaXXqVwTuGkKluW22RDAIg9Ihgxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gg776t
 XA8MrKZ1cXF0F3Dyip/+vjNa++Du2FRMWtUoQ=; b=Jb0dU2h4bfYJIbG0JHy/8d
 sHLLKZWoFCEah79uNYjs0Y9ius72ELNdhy4sGuENwXrVpmn708YA+11Annh17v5x
 oTu1tIJTXMsL8nbIzaUw7j2zy3B8D8kEnTafkdOmTYxdkn4Hi3i90+oV7U9sa1n8
 k5oyIyh1iiQZWH42BUbgMKgbeYC11tHIbE9bmHW36+2CfcfZ5AszeEiDuawXfbNw
 b8MgptMYz6I52ozAL7nP+G+hOsWFNWkXi79Z2sVXZbhaIJFvYHGbwvoUOpy2Tdqn
 amnS6M8l0w9nVVn0I04lkrLDuPnFmqPkvGdFm5JcjX+2rxbEAY9EXhmx548bo26g
 ==
X-ME-Sender: <xms:fV7dYe4VM3AJFhD6Gv5dPqcA699UC05xJ5zDbmpIFOze9VLUSHOE5A>
 <xme:fV7dYX5G0o5-f216iTX9jOpOG3TwoLIxQJrkKjh9R1KDGYf8Wv7APkOisNJ55zDZy
 wvuWni4E-GHs3IR8wM>
X-ME-Received: <xmr:fV7dYdePZfK0WcGqFS79Da6fxR-Qe5lE-NhDDUm-USuXknvKiv9HLyVwjnjK1q7Teysvhcs_CGtA4Q-p4cai4yPBwN4m_kYcxIWh2sQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepkedvgfffhedutddvudfhveehtedtiefhteeuuedvudegtdehveejhfeffffg
 hedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghgvvghkfihorhhmrdgtohhmne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fV7dYbLUkMUgpIt0Z4Cx6vgHbtlt8G6t_3qFPus9xZ5wBDlPTQrG0g>
 <xmx:fV7dYSJAHuooY8SxbeaGSh_OW88UhVhInk0XD6eZQqvXNdhtorJ70w>
 <xmx:fV7dYcx2vvg5GkR5gsUE8lRGK6JyObs8_OB4UKhyywdunPRnyS7qyg>
 <xmx:fl7dYfAe_Q1Yypf6y6klQNjz7UVt3-pD--AmbziUm8PrruAOpvfIdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jan 2022 05:39:56 -0500 (EST)
Date: Tue, 11 Jan 2022 11:39:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: display: simple: add Geekworm MZP280
 Panel
Message-ID: <20220111103955.4ccgihlle7uwvyea@houat>
References: <20220103174106.907-1-macroalpha82@gmail.com>
 <20220103174106.907-4-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iqh7w42ju42ivzbb"
Content-Disposition: inline
In-Reply-To: <20220103174106.907-4-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iqh7w42ju42ivzbb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 03, 2022 at 11:41:04AM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> The Geekworm MZP280 panel is a 480x640 (portrait) panel with a
> capacitive touch interface and a 40 pin header meant to interface
> directly with the Raspberry Pi. The screen is 2.8 inches diagonally,
> and there appear to be at least 4 distinct versions all with the same
> panel timings.
>=20
> Timings were derived from drivers posted on the github located here:
> https://github.com/tianyoujian/MZDPI/tree/master/vga
>=20
> Additional details about this panel family can be found here:
> https://wiki.geekworm.com/2.8_inch_Touch_Screen_for_Pi_zero
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index f3c9395d23b6..659db7206c96 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -148,6 +148,8 @@ properties:
>        - frida,frd350h54004
>          # FriendlyELEC HD702E 800x1280 LCD panel
>        - friendlyarm,hd702e
> +        # Geekworm MZP280 2.8" 480x640 LCD panel with capacitive touch
> +      - geekworm,mzp280

The vendor prefix must be documented in Documentation/devicetree/bindings/v=
endor-prefixes.yaml

Maxime

--iqh7w42ju42ivzbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd1eewAKCRDj7w1vZxhR
xefIAQD910NzH834VBNiAuptITBo5GezbHXSKM7KLjcxZjaN3wD+ICpGITa9lR8u
dxK1tur/NUOzx5bW0L0cXV92zEy3UwE=
=v+CC
-----END PGP SIGNATURE-----

--iqh7w42ju42ivzbb--
