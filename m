Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E006D803A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427B610E0A3;
	Wed,  5 Apr 2023 15:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33410E0A3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:01:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 63922320031A;
 Wed,  5 Apr 2023 11:01:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 05 Apr 2023 11:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680706889; x=1680793289; bh=QJ
 L8kruNqpnU3ciJpzabnkEsxgv2FytG75yCcU3W/5A=; b=ori40a6yjrumQN+QpS
 twsnnpOyY0XZFZgXzcV323I2xrb8tq+3ugZ2Hwgla4DGgKg5+72bzAbHlT07lYDg
 8ECtCtD71CYbPx1qZf+w8U1Dtxn97KAi7xH7MbkzvYNc12B3RvdrQP9kmiAbcHpz
 0EsJFcqZ8/RKkkCmRX/BX3uN4NU7+ApS0Ms+o0zf/sLMhUgx1p+bZcJ/oeWOeCGi
 MQxi4RdgoTd9ga4THNuTJs11y+QhgmuBdpkW5gMjdJnMG6tH+HPPgQKMZTUbqZ/S
 /1itP5hj9z4QXL18vPukLm3VSUWpPMZWAw9xoBnSpClf0/cZ/P5FOGieNk9UkoxX
 nWAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680706889; x=1680793289; bh=QJL8kruNqpnU3
 ciJpzabnkEsxgv2FytG75yCcU3W/5A=; b=nnn8TVnC++0k4aTM9GXIQp5yL6N9e
 CJyMbl6Ea4MJLJkhiQJk96wJqU7u2QsGUFgeiq3YFIxtvy77dV+AsKqsFr0qbLrH
 aewSDtJu+7Yro2kDsL5RziJMh+btTMwxBK2S+awpQtmBDeKrKPiHVfmgBFX0JNRl
 UC+lThGaMAzAqCN/TYYfcVqbkgLCnk+J2CRNGyk8UExZNewCH2tzkkR5j75/8hYC
 07d+kok9epFSTrxV5btmKLIXmH4fYJkymjsT/AOVs4nf1NvkIC30l6TjAUBX1oBO
 oxn0U6gwxiGycGlnc9A8ad8bc0k7wiiS09M9cez99tpDwRM1Hmp7zdnLg==
X-ME-Sender: <xms:SI0tZJnhpS047e-aQCA53jeB_NuS6Uma_EFn0nN5TUojShodAHD6eQ>
 <xme:SI0tZE2gUmdK0is8xJiUTO1itJRp4KSYtjM5Drgt2vynJhoGDtNZN6dQcWwrokcap
 xLxG4p1LgobiMvFqiE>
X-ME-Received: <xmr:SI0tZPrGj7573KcBg8vrSuljcTRhwgy-Xb9RoIaS1BhqEZSNvttBIcvA7YlP2nqECFN0ab5WdYcFfeMN-P1Je6G3jxEVLFs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SI0tZJnAV880vctHO3cTZBt1T2h7PBKrm1mVdCArS8GwuLI7Xaq96w>
 <xmx:SI0tZH07tpY1p5lcqBUrE9NIYA01hzsqzvm4ybLp0ncxc8xmEXvi2Q>
 <xmx:SI0tZIs-LKOubOo0350bqkn99Zf6takSCvy_FljGRjSy40mDBDFN4w>
 <xmx:SI0tZFm80BbguG3rPX46x3lJYv7veP-pnO0Yx074npAn_g6Prby3Zg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:01:27 -0400 (EDT)
Date: Wed, 5 Apr 2023 17:01:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
Message-ID: <d3d3cnpoeiozaqvbgy4e767omkjqi5vywj6jkxcl6pzgwu654k@kebuuk6irse4>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
 <20230316215735.GA3940832-robh@kernel.org>
 <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
 <20230329091636.mu6ml3gvw5mvkhm4@penduick>
 <d5a31f75-eb93-0ff2-cd5b-19cdec58e103@wolfvision.net>
 <20230330145811.asot2cvux4ebbeqy@penduick>
 <5f1f90e2-eee8-d941-e4b0-7f2411a9d415@wolfvision.net>
 <20230404160419.xlnlxq7sbsqopfwo@houat>
 <2c3fa5ee-78a9-8359-01fc-3137f3cb1b9b@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uqdnhsc2u25qcidy"
Content-Disposition: inline
In-Reply-To: <2c3fa5ee-78a9-8359-01fc-3137f3cb1b9b@wolfvision.net>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uqdnhsc2u25qcidy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 06:26:25PM +0200, Michael Riesch wrote:
> >>>> A different question is the partial mode, for which (IIUC) you sugge=
st
> >>>> the overscan feature. As I have never heard of this before, it would=
 be
> >>>> very nice if you could point me to some examples. Where would the
> >>>> effective resolution be set in this case?
> >>>
> >>> So, back when CRT were a thing the edges of the tube were masked by t=
he
> >>> plastic case. HDMI inherited from that and that's why you still have
> >>> some UI on some devices (like consoles) to setup the active area of t=
he
> >>> display.
> >>>
> >>> The underlying issue is exactly what you describe: the active area is
> >>> larger than what the plastic case allows to see. I don't think anyone
> >>> ever had the usecase you have, but it would be the right solution to =
me
> >>> to solve essentially the same issue the same way we do on other output
> >>> types.
> >>
> >> OK, we'll look into the overscan feature. But still the information
> >> about the active area should come from the driver, right?
> >=20
> > No, the userspace is in charge there.
>=20
> I'd prefer not to have the hardware description in user space. But we
> can continue this discussing once our v2 is out.

I'm not sure if it's worth doing something if you don't agree with it :)

At the end of the day, "the hardware" is a matter of semantics, and you
would argue that it's only the (user) visible part of the display, and I
would argue that it's the whole panel and we would both be somewhat
right.

The thing is: having the margins definition allows the userspace to be
aware that there's overscan to deal with, and for example setup the
scaler to properly display whatever you put in there.

If you just report a weird mode that doesn't match any kind of standard,
well, you could still do that, but you would need to tell the compositor
which mode you would need to scale down from.

In both case the userspace is involved. One is generic, the other isn't
and probably requires some extra development.

Maxime

--uqdnhsc2u25qcidy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2NRgAKCRDj7w1vZxhR
xUKjAP0bosIXR0c4/QGmXsVFAriJBRNXL74WtMDPDn1tfpDQaAD+N1650T66iI7O
gnDqW/1Wwe83g8aBarlnGNN9YWcSNw0=
=hGRX
-----END PGP SIGNATURE-----

--uqdnhsc2u25qcidy--
