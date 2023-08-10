Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A56177812D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 21:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AC310E5E6;
	Thu, 10 Aug 2023 19:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A8710E5E8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 19:16:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F360160C4B;
 Thu, 10 Aug 2023 19:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E284C433C8;
 Thu, 10 Aug 2023 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691695006;
 bh=ABbCZnqaHOMEf90aqEG/uJbFjwHMDbi8Eiuwkh1cz7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cSBhGzffw5L18ttbTOWjs5Obei0i0OCfy+Try87B2jrFtGrHR8rPlJSOrhj+0fJfR
 5hVTwHukXwBPl9wIVDDvlbcJjqsiv26D0/6npFwTzi7bO904VaNzc6oKdWXTvRosVB
 7azKIo7cge//Rd6wSWjLdHPoW3+3HLLV3RDHXEvNx3Zdc0brPavwuDG2CznN/f76d1
 X1B06c/xV6n5iTohjtepYLyfRV3rsPBTQbeVn/CT2JPUgD26DAZ4qnFYoAeZgvCz6M
 MYtMia5SfjzyPiA0YppYjxjja39vEMW++2eetEPL26n3WLmQO02UyTfaTN5GI25G07
 JLxOh76uGgQ/A==
Date: Thu, 10 Aug 2023 20:16:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 0/6] imx6q related DT binding fixes
Message-ID: <20230810-endearing-regime-55ef11e2eb10@spud>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="URlnTqj3lemnJ3lq"
Content-Disposition: inline
In-Reply-To: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--URlnTqj3lemnJ3lq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 04:44:45PM +0200, Alexander Stein wrote:
> Hi everyone,
>=20
> while working on i.MX6Q based board (arch/arm/boot/dts/nxp/imx/imx6q-mba6=
a.dts)
> I noticed several warnings on dtbs_check. The first 5 patches should be p=
retty
> much straight forward.
> I'm not 100% sure on the sixth patch, as it might be affected by incorrect
> compatible lists. Please refer to the note in that patch.
> I'm also no sure whether thse patches warrent a Fixes tag, so I only adde=
d that
> for patch 3. All of these patches are independent and can be picked up
> individually.

These all seem fine to me, with the last one being really a question for
those with knowledge of the hardware.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--URlnTqj3lemnJ3lq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNU3lgAKCRB4tDGHoIJi
0iDzAP9btbv433WunzUjWgavbWN4XYM2BmISvgmqPvWHzHBEGQD+O9uZXAvmB0sQ
bp9J69XKdJ8+MnisYcWMrLxgYZ6PSAk=
=bwwc
-----END PGP SIGNATURE-----

--URlnTqj3lemnJ3lq--
