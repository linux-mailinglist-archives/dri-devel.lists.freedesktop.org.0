Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323E978B4B8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC68B10E308;
	Mon, 28 Aug 2023 15:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B859A10E308
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:45:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2178A61F6A;
 Mon, 28 Aug 2023 15:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE142C433C7;
 Mon, 28 Aug 2023 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693237528;
 bh=22zan3LNz2H33JhtkJSkiYBWNyPOb6W/h/TpkacBBaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B11atfqZ0gIHkh6C+4j+EXmlYdTpFYCoConGTrbTUwXRskY0SI3o8QesluLVR9NKs
 xrNU71Dqu24nbsmnZ7csybOKdeXN2QiD4RGdpFAAQM03RW6/NLGKJoxaaedH2yJflX
 d9/xhx7tEK+3BqG38uJgrK0+WxrKorPGLGBhu65SkNO8PNQNGLQlT4CfTcT4Fa+sFC
 JN2hHicAs5A2yhB28/G6gpWAXkTEPfXZG1u3aLDtbXS8RUl3Eoa/BsTu59cFIgqS4X
 V3p1CPz3dsnDaCejTSjlVtRoMx5CR85BinDobk1fEupS4SfpiiQXNW5Z3H5pZ6ORAM
 C+Y9CirFskpGQ==
Date: Mon, 28 Aug 2023 16:45:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/lvds-codec: add ti,sn65lvds94
Message-ID: <20230828-rants-corporate-99f98395c0d4@spud>
References: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
 <20230827-drum-food-09e417962032@spud>
 <4411dbf4-a7f5-7608-6b93-3eef2f4fcb90@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u9mpOLpTBY4mK3QK"
Content-Disposition: inline
In-Reply-To: <4411dbf4-a7f5-7608-6b93-3eef2f4fcb90@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u9mpOLpTBY4mK3QK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 02:45:30PM +0200, Krzysztof Kozlowski wrote:
> On 27/08/2023 14:19, Conor Dooley wrote:
> > On Sun, Aug 27, 2023 at 12:54:28AM +0300, Dmitry Baryshkov wrote:
> >> Add compatible strings for TI sn65lvds94, LVDS serdes receiver.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> For the record, patch looks good, but was not tested by automation.
> Missing Cc-list.

Ah crap, I saw it land in the wrong place the night prior but didn't
remember while going back through my queue the following morning. Sorry
about that!

--u9mpOLpTBY4mK3QK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOzBEgAKCRB4tDGHoIJi
0n++AQDSSQiPfhzwlF7qmxeuaH+H1BwvVyFy/Ql6swEjFZOzoAD/ciLEB38pw4E8
8hL/jtIIJwVR2dp/rmgaYNnGJcjkoAw=
=JY2e
-----END PGP SIGNATURE-----

--u9mpOLpTBY4mK3QK--
