Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8316AAC56
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 21:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A2B10E2B1;
	Sat,  4 Mar 2023 20:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A93910E20B;
 Sat,  4 Mar 2023 20:14:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D8A960A55;
 Sat,  4 Mar 2023 20:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BEFC433EF;
 Sat,  4 Mar 2023 20:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677960896;
 bh=3r578BL7TwpWHlpQ0on74A4ds7yYrKerlhknBqHE0IQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Of74lGgrQfr/3MT85Mry+dk98AnwqBx/+IKkV8dz7hpunpG/juil6jblXMxLIcXBH
 otDFXzf26WX1vIQfjtEdOfRcHdWgRJ6boGHh/XsJsH/L1/dtv7Z5jnzlaj2op2B4o4
 nGMfOtYx0YzF4FQmz+EBu9ckLQPtV3mUYeJDCdB5elK/H55dP2tJpt/pvCT6I8ESZS
 EYIJw0pgzfvvru+19Oo2drthgeVkF5beApFrnmEAqghgBqsbpzQmm5hoht9HFoxh3N
 3kN6/VWB+pginmwR+OoqxqA0Q70T/VI0WywY3cn/oA7H6RmGx2NYH+NcaRO0HJUqAa
 NE+vFF1/bWCDg==
Date: Sat, 4 Mar 2023 20:14:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment '#'
Message-ID: <ZAOmvQMn+7R9KcVx@sirena.org.uk>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DpC9JxmBtx/VM1Dr"
Content-Disposition: inline
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
X-Cookie: Single tasking: Just Say No.
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
 linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DpC9JxmBtx/VM1Dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 03, 2023 at 03:42:23PM -0600, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.

Acked-by: Mark Brown <broonie@kernel.org>

--DpC9JxmBtx/VM1Dr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQDprwACgkQJNaLcl1U
h9AqEQf+Ki9N0115CHG31rvFs9RFMaV3z2FBkTIO1Zs9u9jJ0UFONa8aS8bq8aPQ
gm3UuhyofZ4p+tqg6Y6nKHVWZalcU4N95+sNm/ZzjCvDKR66x0O+uPlCXd8pfREU
kNoKd5CFtP+fjtXf0oEscR6C4Pu/I20EuDWUyrfNii3oFMAuDeVS2wgXadAxOJ6d
fSPFcja3GW9gJ4EE0LacuhUM5ZUtW25HeTc7vmBynRd7tTqjc4FQgPSyt8tvUe0Y
VodxCsoIvcS9vx94nDyo1USMh/HFKAtRlJNuuWj1+kWcrRUfBuJVlSSzZt6o9M+k
6cA73SE3SJ8RJIFe8Bz9r6ULWYSY6A==
=/n6h
-----END PGP SIGNATURE-----

--DpC9JxmBtx/VM1Dr--
