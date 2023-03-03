Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFABE6AA2AD
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 22:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3058D10E0B5;
	Fri,  3 Mar 2023 21:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC4110E0B5;
 Fri,  3 Mar 2023 21:51:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5090B81A34;
 Fri,  3 Mar 2023 21:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5195C433EF;
 Fri,  3 Mar 2023 21:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677880281;
 bh=Br50V+ZnNhKeUVmf1H88XflaSYA3zbjNUSaOrfbHpWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L0Wgj2qDMYr7AQFFunxAnGexnwRXj41XfheavwO4sQNH9ThQWN7YWlj2Dp73Ahdw/
 2uXKlv/22ez+DVr7ejBSi69+v/MiAkOp+L5BIU6bdV3QorAgVbad15r3DUWG3n/DEN
 M10p5eVyq7bMRTBYHiwIAV7dwH08VMMfs8aaRdkMd/hoae6WtB50Y8/GEMWE9hfPsr
 X7GJJ+ZO9cmyRf0HO7C4myHQ+bm9TdwZkTHEpy9iYruGmrWIunUXZc3w5CkIZpxxYi
 kXKl6tYBhJNPTsNy5u9kGPM7Uf/kIR6xDR/XGWpONnVXpZwWkjJ02fE/UU6YbDF9O8
 LSMB76p+PtvfA==
Date: Fri, 3 Mar 2023 21:51:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment '#'
Message-ID: <cdad5aa0-bd94-4137-9063-af45e94a25b7@spud>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mffVr3k4EP4yfp2t"
Content-Disposition: inline
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mffVr3k4EP4yfp2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 03:42:23PM -0600, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

> Cc: Conor Dooley <conor.dooley@microchip.com>

> diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yam=
l b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> index 1051690e3753..74a817cc7d94 100644
> --- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> @@ -22,7 +22,7 @@ properties:
>        - items:
>            - const: microchip,mpfs-qspi
>            - const: microchip,coreqspi-rtl-v2
> -      - const: microchip,coreqspi-rtl-v2 #FPGA QSPI
> +      - const: microchip,coreqspi-rtl-v2 # FPGA QSPI
>        - const: microchip,mpfs-spi

I had to think for a minute as to what that comment even meant...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--mffVr3k4EP4yfp2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAJr0AAKCRB4tDGHoIJi
0rHgAP9euC+7Ztk0BIMgxdrJzAjogpoZQH6UzawtcdI6SIq2nQD/d5Bvci5DVqMV
DWn8X2un+KM/vLbl8yUpHlGFB4QKwQY=
=v1U9
-----END PGP SIGNATURE-----

--mffVr3k4EP4yfp2t--
