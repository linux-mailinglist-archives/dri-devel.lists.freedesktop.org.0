Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B083163D2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 11:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344556EC48;
	Wed, 10 Feb 2021 10:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318FB6EC48
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 10:29:32 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 33B34C41;
 Wed, 10 Feb 2021 05:29:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 10 Feb 2021 05:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oIa/2Qot3nAjg2o97/YX6K/oHZE
 bZ3WonfjT0JArODs=; b=l8yfqApM7aybXQ/4V2KFaP0E8A08zx33dGddvnt5mh2
 t403i7nKaKwXtlDbCAR1wHi+u+MoJ21lS/BDZagY0aHVbK4BoeYQAm9/Z+wNng3T
 f6mDzoYKJMa/ldtlFCOJt9e9I1e+THvpdYO3Q6+bOvQ8rMofoeHW+reWrLfL7z8G
 e+ZQpR3LyVktM4wBDIZ3lKDDQo5v93GuUHq1FshVSe4qJfhsPpLcgT7Wk17wZOIe
 EIOytHwRDWJGW9TnyjNiqvS0nkTeUUeeS0jCr7B2+av1jGKmyVmZawnvicmnoKs6
 cPxcx6YD45xX2OcXVHHbrun8oShgDs1cA4zCyLgWxJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oIa/2Q
 ot3nAjg2o97/YX6K/oHZEbZ3WonfjT0JArODs=; b=aM80EBujFemviFs1HPNFQX
 +Dj+kJ2DV1N5xzs/62T0zZz/Dm3el+9WiJJrbZZ626gdrfnVV3cGa7JoNNiClur0
 KcnwczuUpKG3r05qNezT99p3U7QsENJ2OKVAOwij4k7p3/sjU9bxZ/uS9Io3VxpR
 7MvOU3oqqvZPuVOrDTntwIFBOjHiNv6eUdbY5URSk848SxlmX+uYcHLiMl8Ok4Uw
 UQAJAe4QpriUpY2gSnCDk6k9mV3iyX6/Gu5WmYPH+5aiAMAEA6kYre8sDVtz5BNA
 aYR7xEvkk3HqttkA//76ff01rB++M3EOP7+M3ofNzZtyfsB5PnHU5Cn+KvCkVtYQ
 ==
X-ME-Sender: <xms:irUjYBUsfZ_5cF0rJ9gEAt0Y0N7DdXwxShcdimiPJDJGLUccF5GRAQ>
 <xme:irUjYBm_OH9ecLMV3vmUX2-BJPuI1fkN8Z3UNw8Y9qWxT8vwbmeatZiqaUK7oS58n
 Ikc3cyWN3Hqe7rIRso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:irUjYNYrRvdNSP7YW5A97BdTjmmZ4rosV4OmpeK86JZlorouK8LOWw>
 <xmx:irUjYEVabpaVHLFA7weG2AERutHpRqp0UcZkPTUdkIttQu7bbWtiGw>
 <xmx:irUjYLkx9nvHGORe_6ztSQmRUQ2PbMWRIklj-PpnM1U06ktoFZBWng>
 <xmx:irUjYN61z6kV13tJ8QyntRarhdV3c7JYPwxZuhW-vKhwGnhA7sOQWR6v134>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68119108005B;
 Wed, 10 Feb 2021 05:29:30 -0500 (EST)
Date: Wed, 10 Feb 2021 11:29:29 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v3 0/5] sunxi: fix H6 HDMI related issues
Message-ID: <20210210102929.mkmxrwyku3js2zvp@gilmour>
References: <20210209175900.7092-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20210209175900.7092-1-jernej.skrabec@siol.net>
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, wens@csie.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1728989137=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1728989137==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ju3jwli3ct6v5xkf"
Content-Disposition: inline


--ju3jwli3ct6v5xkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 06:58:55PM +0100, Jernej Skrabec wrote:
> Over the year I got plenty of reports of troubles with H6 HDMI signal.
> Sometimes monitor flickers, sometimes there was no image at all and
> sometimes it didn't play well with AVR.
>=20
> It turns out there are multiple issues. Patch 1 fixes clock issue,
> which didn't adjust parent rate, even if it is allowed to do so. Patch 2
> adds polarity config in tcon1. This is seemingly not needed for pre-HDMI2
> controllers, although BSP drivers set it accordingly every time. It
> turns out that HDMI2 controllers often don't work with monitors if
> polarity is not set correctly. Patch 3 always set clock rate for HDMI
> controller. Patch 4 fixes H6 HDMI PHY settings. Patch 5 fixes comment and
> clock rate limit (wrong reasoning).
>=20
> Please take a look.
>=20
> Best regards,
> Jernej
>=20
> Changes from v2:
> - use clk_hw_can_set_rate_parent() directly instead of checking flags
> Changes from v1:
> - collected Chen-Yu tags (except on replaced patch 4)
> - Added some comments in patch 2
> - Replaced patch 4 (see commit log for explanation)

Applied patches 2-5, thanks
Maxime

--ju3jwli3ct6v5xkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYCO1iAAKCRDj7w1vZxhR
xWI+AP9LVKht587rKqqvDF5OHytZ7rTIv7TkzV5PorCdpAl6CwEA3VVGL21fGO9l
0TtgdjhXMuTi5mmSoIsj/QQyNtubVQc=
=9wps
-----END PGP SIGNATURE-----

--ju3jwli3ct6v5xkf--

--===============1728989137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1728989137==--
