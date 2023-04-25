Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C66EE548
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3102710E771;
	Tue, 25 Apr 2023 16:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEC810E771
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 16:10:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 60AF42B066F2;
 Tue, 25 Apr 2023 12:10:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Apr 2023 12:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1682439030; x=1682446230; bh=Ua
 ojCscwxi86AjVuIh2qCHuKpN/ZbtkSzMZy6PZ+dq0=; b=rs9Bvn6pjM1EZQb5/e
 0ew6BcvE534Wwf7Fzg9YF9G5XCPwkxWv/hHowRoqwoln8M3w6BS3FVaflLkpC/iw
 UnjfQZBhve3krhuivKbT0UBqx0TAkj7+4OQlO2irX93g5wn+D1JnfH8y1k7TjmIS
 bOPHVnyJC/TE/TE6+LwTclIrPAbVmxJg780W82bFwxtf2ZeS7VJT+Kg4wDQD3Hbs
 IqZ7qG30WK3dclE1EGXiMdmvSes9Mg4JZuBnoXpD+4gZClHEOU2eCYRAivfWwZWS
 DFvo8v7297lyTAvTFcoIBF8nk1vXy7STAQaI+M+sgHeRFGcShMbcOnwP0BTfNzRM
 2K5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1682439030; x=1682446230; bh=UaojCscwxi86A
 jVuIh2qCHuKpN/ZbtkSzMZy6PZ+dq0=; b=iRfpC/KUuKid9v5Vzv+Nd4uFvSOmv
 9Htvapj5EI3Et4MTXTMqhfAgGar2TOfcXCAp92v7w59J8Af/HjgMB+SpLoD2whu1
 +6B+zOXJOLpRbFCiES54J7AnESgWNWfBR9XMLAqA8cm+pasBqqjDZYEy2O3tRrxV
 05HeNsYYy5RxjMLSYZpwn+6IFLNEjwVITNM6+ALzGLZbBLh/cKlWliuznrRqh78d
 MP2LJZoFh/JdSBWc4M2412zL6CDbTBilhZlINlBlW4Msy2a0cfz88HNpDUa7KIRH
 3Y06ShqOzp3/tIrhGYbHW21lnTsnSkVPkJ0PuWBdhPwNaNfFS+Zp9pDcA==
X-ME-Sender: <xms:dvtHZERRfaU0QMkLYwj01ATOOt1tV4CZNOano-vE55h_mvXjxTHEHg>
 <xme:dvtHZBzOBDgCqomITd47pDyJdRVEREhLYAkO_FxLKOtryFKk8x9bsYTJQtANZ2oq1
 t3Zmikt5MqjVQ6hFgs>
X-ME-Received: <xmr:dvtHZB1CaWxHfHYGDX3jCUtQ8ud-eQfrwBcpiDn2orGEav4ztX6qByJkBR8y_e0flDDCL7J5FITU4tdehpawrRO4A-jk_1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dvtHZICg1hf_RrP49Zi1_AhugxGpaAgGWgcjeBGcexA4DETOmd6lMw>
 <xmx:dvtHZNga2Sx_rdmPqqyjyeq6RiP-XAK0SsBbrCFFZO16e-q_Sf_EOg>
 <xmx:dvtHZEoalbbm5lyqLNg6HKNezs9dr-IHd2gDEd1zkhj8KX8oSwBnAQ>
 <xmx:dvtHZMR29DgSlFWknbJFm84tT23VE-RXf5EPdHnaidpBhWQf0ZCd5NDsb6k>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 12:10:29 -0400 (EDT)
Date: Tue, 25 Apr 2023 18:10:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v2 4/7] arm64: dts: allwinner: a64: assign PLL_MIPI to
 CLK_TCON0
Message-ID: <loz3kx53jl56klgwpiwcmwub4flilgts6nxvdbxashed25c5m4@jqmgtcdw5z7a>
References: <20230418074008.69752-1-me@crly.cz>
 <20230418074008.69752-5-me@crly.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wfstf36tsrjcb6td"
Content-Disposition: inline
In-Reply-To: <20230418074008.69752-5-me@crly.cz>
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
Cc: Icenowy Zheng <icenowy@aosp.io>, Samuel Holland <samuel@sholland.org>,
 Frank Oltmanns <frank@oltmanns.dev>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wfstf36tsrjcb6td
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 09:40:05AM +0200, Roman Beranek wrote:
> Assign pll-mipi parent to tcon0's source clock via 'assigned-clocks'.
>=20
> Signed-off-by: Roman Beranek <me@crly.cz>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index 62f45f71ec65..e6a194db420d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -411,6 +411,8 @@ tcon0: lcd-controller@1c0c000 {
>  			#clock-cells =3D <0>;
>  			resets =3D <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
>  			reset-names =3D "lcd", "lvds";
> +			assigned-clocks =3D <&ccu CLK_TCON0>;
> +			assigned-clock-parents =3D <&ccu CLK_PLL_MIPI>;

assigned-clock-parents is fairly fragile, and it's essentially an OS
decision, so that doesn't have much to do with the platform.

Just force the parent in the clock driver, and prevent it from being
reparented. It will be more robust, and we will be able to change it in
the future easily.

Maxime

--wfstf36tsrjcb6td
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZEf7dAAKCRDj7w1vZxhR
xSYEAP9ufal853zPBswPlSP34CsO6Dbt8fsbiPRYUozvKqvluQD/Xizu/MNXPNTL
5be4XrGm/g+J+J6/+WtdZT9oLQQhwgI=
=CC4z
-----END PGP SIGNATURE-----

--wfstf36tsrjcb6td--
