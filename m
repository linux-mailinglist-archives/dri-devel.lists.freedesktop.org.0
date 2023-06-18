Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C457B7346A2
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 16:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D0810E06A;
	Sun, 18 Jun 2023 14:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1E110E06A
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 14:38:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D4185C0151;
 Sun, 18 Jun 2023 10:38:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 18 Jun 2023 10:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1687099081; x=1687185481; bh=yH
 PTUvDEJzexGeFyXGlFy4j+8AWZoDxdix6s9FqPIHs=; b=XjWeHdw6sM5ayuW9JN
 Q+vEd5b/msGbtZ0G4YZa8kGWab0hY1Xl4Fk2wL6uDrFjzRkvubCV1+RzltObSRHU
 /SatV9aP+EvnvGQ61ReiFrk94aCMCM/v+DLIUdGGKJ3aa3kZI17/yGfLvPY41mDv
 7INoAYAvulKaX6PqqiS+LLCzfCTBv5ZHoRRE0/wWl++UGzhA0FIgRy9GaLmZsAQL
 WAnjfRM0CaGzvrW8b2Wlhw7vvRYMykWIiIqrCM0J8vWEz2YMOK2C1lOrHqhcI/Dr
 thaPKcfq6nIvpnG2J7oPb6C3uMcT1WwT8nihHwQN21y3W0g/krq9la/Md7roWo4H
 eeSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1687099081; x=1687185481; bh=yHPTUvDEJzexG
 eFyXGlFy4j+8AWZoDxdix6s9FqPIHs=; b=o7wnUfH5tsmL46BJoVnqf2HidewD3
 uV5SoOyjREuoZxLy7/aAhOd1JrlBMue2pqvWN/NTwWhwWBbIFvt9TVbBjEm3+N6f
 KfXRu5XxGvYwlyY/4FarqMavmlzkTwTcKKlnNrrPLKf2yKvZX5cxZoU06vrrR2W2
 GnPzdutkN6zWZm2Wj3N8PbqHCcLugewOs47GYOkbjWYQgIj2jrP5UedsRhB3hQcx
 5UCXW50ExYnJSlpiWgUb0h5yYOY7+J4SDJcEF9Q8dJ6TiU7PrWzKZHjz4tC/uTC4
 AeR/4jXxU1PaUB8PYIydRJd0rvJ/ovTnBT07dfXOxLvuPTmami6gpaa7A==
X-ME-Sender: <xms:yRaPZKeFGfwexWCQh_aeCWXju7UMmUNq_TjUxvV4x_K4OduqIMzY6Q>
 <xme:yRaPZEMO3JS484JbMHB-myJv4DZAtKuK7dBlm9faoAkQkcBwwKrky3q2W-KGabWiW
 uakLlYClkB0bojxsB4>
X-ME-Received: <xmr:yRaPZLicpk1jeeVkVuwKRX-ACY-9VPIVgYgYOZrUM04sUDizi_MSXV-bhuET2S0dsJk8qqGR2yCFUtdzt4BRsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeftddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yRaPZH92QQ-zJD8fHCiJ3uwaQe6EgJodXUZ0sbrq3S4B9fYrXIvZCw>
 <xmx:yRaPZGtSrepKc9Oajx0IfCTiLUcp87jGxzoVuXZjG-t-uj0XFWdhAA>
 <xmx:yRaPZOHVYukn0vYqyNGrOHvt2Bb9FaOg4YWh0GpFpcXNyq2F-xDCJg>
 <xmx:yRaPZHlViflruuuBRPx7aaBx68vH6gcLOzAjdZuDGsohOcQMM72Phw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Jun 2023 10:38:00 -0400 (EDT)
Date: Sun, 18 Jun 2023 16:37:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: display: st7789v: bound the number
 of Rx data lines
Message-ID: <tcxifa7ol3fukfsdw7hh3kl25dhpviu6lasdc6xasz4dvhjedx@mo2vae6smtok>
References: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
 <20230616163255.2804163-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="otms7pwhtdnr5mrv"
Content-Disposition: inline
In-Reply-To: <20230616163255.2804163-3-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--otms7pwhtdnr5mrv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 16, 2023 at 06:32:51PM +0200, Miquel Raynal wrote:
> The ST7789V LCD controller supports regular SPI wiring, as well as no Rx
> data line at all. The operating system needs to know whether it can read
> registers from the device or not. Let's detail this specific design
> possibility by bounding the spi-rx-bus-width property.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7=
789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789=
v.yaml
> index 0ccf0487fd8e..a25df7e1df88 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.ya=
ml
> @@ -29,6 +29,10 @@ properties:
>    spi-cpha: true
>    spi-cpol: true
> =20
> +  spi-rx-bus-width:
> +    minimum: 0
> +    maximum: 1
> +

It's not clear to me what the default would be?

Maxime

--otms7pwhtdnr5mrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZI8WxgAKCRDj7w1vZxhR
xc99AP9Ts/kjlHjrEnVxIWs+FQYB3wAKMrbjGvgwoEsK6sh7CQEA4vP8NKL9uarv
CstXKeIeibHyRFjG/QilV4JYFWDPswA=
=fqY3
-----END PGP SIGNATURE-----

--otms7pwhtdnr5mrv--
