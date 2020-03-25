Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7930619338A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 23:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A626E84A;
	Wed, 25 Mar 2020 22:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E966E6E84A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 22:07:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6641FB;
 Wed, 25 Mar 2020 15:07:51 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE6623F71E;
 Wed, 25 Mar 2020 15:07:50 -0700 (PDT)
Date: Wed, 25 Mar 2020 22:07:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Add missing 'additionalProperties: false'
Message-ID: <20200325220749.GF12169@sirena.org.uk>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-5-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200325220542.19189-5-robh@kernel.org>
X-Cookie: Do not stamp.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============1240120727=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1240120727==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sDKAb4OeUBrWWL6P"
Content-Disposition: inline


--sDKAb4OeUBrWWL6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 04:05:41PM -0600, Rob Herring wrote:
> Setting 'additionalProperties: false' is frequently omitted, but is
> important in order to check that there aren't extra undocumented
> properties in a binding.
>=20
> Ideally, we'd just add this automatically and make this the default, but
> there's some cases where it doesn't work. For example, if a common
> schema is referenced, then properties in the common schema aren't part
> of what's considered for 'additionalProperties'. Also, sometimes there
> are bus specific properties such as 'spi-max-frequency' that go into
> bus child nodes, but aren't defined in the child node's schema.

Acked-by: Mark Brown <broonie@kernel.org>

--sDKAb4OeUBrWWL6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl571jQACgkQJNaLcl1U
h9Afjwf/TlVFnvMm+meLOwlfTMDT7xvKv6i3g4S/t/OkkG/qfuDfUpRz0LarRYTg
8163ZrHY0aAQmLzyxMQR2cBhzM1tfANuY93djQNhe1ac6MUdNxTGLm1n+m9xh/o8
IsSrgrnEqXCNCgqkAvPcDY7qkeLi68p5VqJIfdOjjeJkusQL3Q0kQUv7kpi6cgXn
5Y+PlKm4cxLmOxFeUmCLQKocDSMttTCjxA/jm7jX+CWzKJjObhgsoHP9rg+uIO+1
VHCHKXwxl1a8dhfG9ZnUxXY9UqGqGINojiPmRtTBX5oZqY95zShlcNiJ2HNaRRsT
oIsZgkZuypvPpKies+jaVF2IuoSbcA==
=EzfV
-----END PGP SIGNATURE-----

--sDKAb4OeUBrWWL6P--

--===============1240120727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1240120727==--
