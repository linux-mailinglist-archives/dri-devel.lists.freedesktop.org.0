Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3C7441E2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 20:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC85B10E165;
	Fri, 30 Jun 2023 18:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4B010E165
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 18:08:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F07B3617C1;
 Fri, 30 Jun 2023 18:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7925C433C0;
 Fri, 30 Jun 2023 18:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688148481;
 bh=0Or+SFZ0SHOUTDSagR5mJ/56XhzgF/qhUAA6D6CG8t4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHpnGiVlZmskeHYt7wuTO34HaXpPdQdYTc3PeOuRC3/odSA4wD3u4gPgw82PneuRF
 05A2PuS8P+Wsldhi+0EvtI4jk1+WfkA9h5lnUUknpUFZJ+3OjhRWgw4MGDdDeiQ9Xy
 m20Pcz8w92UJJ6XIYL0FtvKkZ+EKHzww2+h5cp+jkxtqUzF9MojybXxyYl7iMJPNfp
 TfteMeJrHfpzlaTzjg2HJid9XRBWvFUCeqfJKlo6TRZ7rso3JlqlcAz9EcNy100JNW
 UibqojsSB5X3Rvw3aB9fLrz+i+aBqUME4GHlHYQNedppf1u6zlVVZ5bgRtlYFFB34f
 vjgaEXC7phnhg==
Date: Fri, 30 Jun 2023 19:07:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 8/9] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
Message-ID: <20230630-serve-annuity-1ee92993e42e@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-8-fd2ac9845472@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PIC40N/CDnE3uSF8"
Content-Disposition: inline
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-8-fd2ac9845472@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PIC40N/CDnE3uSF8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 06:29:15PM +0200, Neil Armstrong wrote:
> The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
> compatible module such as a BPI-CM4 Module, document that.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--PIC40N/CDnE3uSF8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8Z+wAKCRB4tDGHoIJi
0qDcAQCqzCa/eZq9IhbI1ejK8z9NQ/ZJ2bRUJdMcmMQ+wg4wpgEAsbauVpLse9T4
0BGhgecOD97mZqVrA2Sltk3hQBSIGQk=
=4s+I
-----END PGP SIGNATURE-----

--PIC40N/CDnE3uSF8--
