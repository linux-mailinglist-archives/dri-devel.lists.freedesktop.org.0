Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5E4F2651
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 10:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2E810EF9D;
	Tue,  5 Apr 2022 08:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4799710EF9B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 08:02:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2E7833201F68;
 Tue,  5 Apr 2022 04:02:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 05 Apr 2022 04:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=9seaBYjHM2MwwOvuZVbvVKcMOxVEXIMnlH1nB8
 b2x44=; b=Posq5w0NAsHAkq+jAyObQijeDPx4K6Te516Alr1vz9+k/zV6RlfpeI
 5p0gImngozzINW9AmBVX/MjpuebAYu9c7dYP+F2CwmNThnIE2MacdXyrQhbdfYHF
 sJaCI2+On+mE/1CsCdff3Ef7IZdbOl8JQfbhoVLy+EGlw+EQJ/CeIskFGRfvaW6d
 fAQS3fodiNcfa88gQnei0u3j6p47twFoj0sM4kdV0u1akw/hQcq36TLiG1Wb2WTp
 PpJ7V5V1a0hhwV1ljwtTEkSlQJcrhim9u3qu3X4HWo1KwrgNpnNTzVcc2hzwfXm9
 M+IbZOd5hGADma5TiB4cxroVRfVgtEGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9seaBYjHM2MwwOvuZ
 VbvVKcMOxVEXIMnlH1nB8b2x44=; b=DCaCV4Pu68yJjyb0ORE46t579Zaz9rntp
 lJjfCrBe7kPk2vTgZR9f5FgdrdEPB1x0NljUoO1JIhmIyi+aS7BUH/UAOwJV+7Fu
 7+7Q8jGw0JOdi2AvWwStfDI81lvHzTZlHL9WVhtHrJbxbJ2Bj8JSZHT7yqYfCHSJ
 3PEh5oWOtQHGe7DBvqTr9sUQn7bScNuwkAxQ9Pu47WrRMOFAMAMXtSDFY2vXeOUo
 LH1IlhLjv62dwnqLv5t8ItYnGz+xQTOTRx0hzU/+a1KdtFDkFPSq71XqAdTVOE1e
 xo1ekUSrYCpGZbWycMKOoLITkrHHLleh253NP9dm2aCdoyjEQTmDQ==
X-ME-Sender: <xms:sPdLYh0UqMS0ZgXEUug7dC9PtXt7cJgCcHmDpSABi4244q5W4NYbzA>
 <xme:sPdLYoG6VLa7YI84jKe03DjCamHt9kN2xbrGOd_CS62_XVeFXL0g5XQqzhQDzuSv4
 iqw2X4uOSg-3PwX4-c>
X-ME-Received: <xmr:sPdLYh6n74X4yvvNhHgG1tG0CRUW2FkDFydQd9f8SRiqUKygPpZ6EjhYoXBQxjJKdsqlhkHx-h0BfYjlwz9jBGTgjnJYERdKMeOxsPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevgeduteektefhtefggfdtkeekgfehhffffeegudelheegheeiueevfeeg
 vdeigeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:sPdLYu2Huq-aqg_FBsNhRqImUtAvsMucNjxA1WU6jx1QSIrPNGPG3g>
 <xmx:sPdLYkGSSnlMwryGmV4ID0WdXjKuDiVEiLuKB3fUBK81YGoN9D1axg>
 <xmx:sPdLYv9H-VaJ4IkknUUaIgEDJu6jwlrKWzaTuEjReSjsBrDNmshnMQ>
 <xmx:sPdLYgjMOVGm2RiKX-npGONp-g6EQlCBsFQfXDvzhzlCYpirO-riKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 04:02:55 -0400 (EDT)
Date: Tue, 5 Apr 2022 10:02:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: bridge: icn6211: Fix DSI-to-DPI PLL configuration
Message-ID: <20220405080254.omlrpoebvjku4exi@houat>
References: <20220402004118.897014-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="22ay5avoqsgeo7my"
Content-Disposition: inline
In-Reply-To: <20220402004118.897014-1-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--22ay5avoqsgeo7my
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 02, 2022 at 02:41:18AM +0200, Marek Vasut wrote:
> The datasheet for this bridge is not available, the PLL behavior has been
> inferred from [1] and [2] and by analyzing the DPI pixel clock with scope.
> After further testing with other displays and different DSI data lane cou=
nt,
> it turns out the P-factor is not 1/2^N divider, but rather only 1/N divid=
er.
> It also turns out the input into the PLL seem to be ByteClock instead of =
DSI
> HS clock.
>=20
> Rework the P-factor calculation such that the PLL calculation code handles
> P-factor from 1..32 with P-factors above 16 must be even. In case P-factor
> is even, enable built-in 1:2 divider and program P-factor/2 to PLL_REF_DI=
V,
> otherwise configure only the P-factor into PLL_REF_DIV register.
>=20
> Switch the PLL factor calculation from kHz to Hz to maintain precision.
>=20
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gp=
u/drm/bridge/icn6211.c
> [2] https://github.com/tdjastrzebski/ICN6211-Configurator
>=20
> Fixes: f30cf0ece691 ("drm: bridge: icn6211: Add generic DSI-to-DPI PLL co=
nfiguration")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--22ay5avoqsgeo7my
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkv3rgAKCRDj7w1vZxhR
xRGpAQDxWrNV/rXD/apnsvspIaJWfUErXNmdghXYm6TCDyYtuwEA0XE1rh1l9Lh+
74SUQNyCUnaYqieFiUiZQ+35uLtEgAY=
=YwoU
-----END PGP SIGNATURE-----

--22ay5avoqsgeo7my--
