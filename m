Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C17441E5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 20:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C6010E4DF;
	Fri, 30 Jun 2023 18:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D1D10E4DF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 18:08:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 303F5616D7;
 Fri, 30 Jun 2023 18:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD727C433C0;
 Fri, 30 Jun 2023 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688148506;
 bh=7RgNICGUd57kbxZR+bdP1T3AWfyjL5MDZIC0ZkQs8bA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OHHHqacKZysWHbeof64j+ADM+POnBhML0hQ1kwQA+eigj6h3bmtNG8yZBdtlFOnJL
 74eJd5B9/flzIVC6UPWbFuVqFLJxS3mY1fT6GTIeOKc1FiLhtbptXAb52tBBzFrbh9
 iHS9sUtaTVgH4R7mlKBgSEveR/q4KGVXcOkTwDHZJhFMAn7KupSLpKsBFsU0Q9ONuN
 ukOk2NnBVYOKnbS2BMg9jfoP/TDKeJjrlZGw/YswtDPak35tFynIfFiq4TnI5KUYoh
 LLnnZQORjLWhelYVIOjo700vN5EJCdrEsBoN4xwVGcDV/KqqcUE5RbMb76oC0Onb30
 8GLYRenfsW4Qw==
Date: Fri, 30 Jun 2023 19:08:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 1/9] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
Message-ID: <20230630-unwashed-gothic-36201c97fa42@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-1-fd2ac9845472@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QFQMml9cy3EPdzM8"
Content-Disposition: inline
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-1-fd2ac9845472@linaro.org>
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


--QFQMml9cy3EPdzM8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 06:29:08PM +0200, Neil Armstrong wrote:
> Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
> on G12A compatible SoCs.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--QFQMml9cy3EPdzM8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8aFAAKCRB4tDGHoIJi
0pMdAP470puPbIEhFPzVh9r1odFpTvbwxCMSXUJcJ+ePo6UYXgEAt2GMNyLnDczi
4C+3TomZUq+P+WQKKiLXT9UKwHFlOAQ=
=hMX/
-----END PGP SIGNATURE-----

--QFQMml9cy3EPdzM8--
