Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC9716AED
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 19:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDEC10E109;
	Tue, 30 May 2023 17:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E0B10E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 17:29:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3696063118;
 Tue, 30 May 2023 17:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDFCC4339B;
 Tue, 30 May 2023 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685467742;
 bh=2bODZqzDsUoTQkh2zMk1nEE+wHElsvjQpmoMsf7f/Qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hHOGYhzLNSVRW2KA0PSbdr+3tO52BK5i2Wf+B9H6AQC08PA1PFm0Bkwly4Xk+Zy6s
 fpjQGhv3AcA21h6GnNPWiSEPN3pI7J/t9TpNrcOlySMQHRr5sjkbiDF2yt71sn1ClN
 6FBrIyVa0KMjPrG6KZ6KmrmVvn+o9Il5gH1wEptuV+dQ6LmxKVh80QOdChihjaG2jt
 2j3mtGq60eXLP8Ralhy/kmZTikzXW7Vt7XQBRLdCD/ol94LsWHuNNhjZf+KyZMBetT
 cw6lGHcV7QJ9iBnCmUwTCh4/AatytoU1t2wjMpW7vK3IKmvAd2dVDvDTQNXAg0NkfD
 mWfjQxCFTIQUw==
Date: Tue, 30 May 2023 18:28:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 06/17] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Message-ID: <20230530-hankering-trident-9cab74e59591@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-6-56eb7a4d5b8e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yUiZQebBLS7labwP"
Content-Disposition: inline
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-6-56eb7a4d5b8e@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Nicolas Belin <nbelin@baylibre.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yUiZQebBLS7labwP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 09:38:07AM +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI
> transceiver (ver 1.21a) with a custom glue managing the IP resets,
> clock and data inputs similar to the DW-HDMI Glue on the same
> Amlogic SoC families.
>=20
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Welp, I was happy with it last time around before Krzysztof took a look,
and the things he pointed out seem to be fixed, so you can have my R-b
back.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--yUiZQebBLS7labwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYyVwAKCRB4tDGHoIJi
0mZYAQDW0DCO9lI9BrijwwOdNaACzk5HrgyW4ZHkJfjAmf3d6AD/cQb89WQt5+7E
yfiA12g1wqL5SmEpqaTBIFYHn1cucAo=
=v6gU
-----END PGP SIGNATURE-----

--yUiZQebBLS7labwP--
