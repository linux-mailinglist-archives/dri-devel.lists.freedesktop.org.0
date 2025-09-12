Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2DB54794
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 11:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F42910E037;
	Fri, 12 Sep 2025 09:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oDl2A0LO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA66310E037
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:31:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AD18860200;
 Fri, 12 Sep 2025 09:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB683C4CEF1;
 Fri, 12 Sep 2025 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757669506;
 bh=cZZSj/PLAmvPikniIesMdJfhqh3VOpUH71TpGrecZ8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oDl2A0LOXO/1X2zNKv7aRnP0NHdkbAsbDDgwtZzvwmo12fpeFM2E3/tK2+Vtp6jDf
 LtHjqH3FhqX9XCd49ZEoi9d2wFua1A1xl2NpXDXII2TJgNe2FaEGcY3H9R3K+d/kSk
 i5GbpzjLt0Me2HD69Wbc5uGIc3TwgDS6JZFlUf4XXoZCI/2uPJn9w8cEPAn3NjkatI
 mrNqigkcd6DbPU1UEsK3MA+M2bqLjMfjb8ArXgRSIyAq3CjGnxkE8s7LGICh/mIf7j
 5pUu4Qe144CAGGymifmDXQ3yvwNpleByOIrvrEZ2XoQVUNyLe8+LbR96tJeBNXKw/y
 Se8H2lBXfymbQ==
Date: Fri, 12 Sep 2025 11:31:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Michael Turquette <mturquette@baylibre.com>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 20/37] dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm
 compatible
Message-ID: <ahxdf3l6zvmjp2nlgklg3go7biaimuz7qh5upnhohrrbrg62e6@gmi3pmbccwwe>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-20-507ba4c4b98e@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hd4ybrkt7tr5jevb"
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-20-507ba4c4b98e@jannau.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hd4ybrkt7tr5jevb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 20/37] dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm
 compatible
MIME-Version: 1.0

Hello,

On Thu, Aug 28, 2025 at 04:01:39PM +0200, Janne Grunau wrote:
> The PWM controller on Apple's M2 Pro/Max SoCs behaves in the same way as
> on previous M1 and M2 SoCs. Add its per SoC compatible.
>=20
> At the same time fix the order of existing entries. The sort order logic
> is having SoC numeric code families in release order, and SoCs within
> each family in release order:
>=20
> - t8xxx (Apple HxxP/G series, "phone"/"tablet" chips)
>   - t8103 (Apple H13G/M1)
>   - t8112 (Apple H14G/M2)
> - t6xxx (Apple HxxJ series, "desktop" chips)
>   - t6000/t6001/t6002 (Apple H13J(S/C/D) / M1 Pro/Max/Ultra)
>   - t6020/t6021/t6022 (Apple H14J(S/C/D) / M2 Pro/Max/Ultra)
>=20
> Note that SoCs of the t600[0-2] / t602[0-2] family share the
> t6000 / t6020 compatible where the hardware is 100% compatible, which is
> usually the case in this highly related set of SoCs.
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/=
Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> index 142157bff0cd851c85fbf0132d734d470c5a0761..04519b0c581d0e9fb1ae6aa21=
9a4e850027de6a2 100644
> --- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> @@ -17,8 +17,9 @@ properties:
>      items:
>        - enum:
>            - apple,t8103-fpwm
> -          - apple,t6000-fpwm
>            - apple,t8112-fpwm
> +          - apple,t6000-fpwm
> +          - apple,t6020-fpwm
>        - const: apple,s5l-fpwm
> =20
>    reg:

The patch is fine for me. There was no merge plan sketched out in the
cover letter and I don't spot any dependencies this patch is a part of.
So I applied this patch to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

as 6.18-rc1 material.

Best regards
Uwe

--hd4ybrkt7tr5jevb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjD6HwACgkQj4D7WH0S
/k5dDwf/ZhdoZ04wcFscsQjfQPV9sY5Kzs8OxPgL+m4AV85SDwzSuZybeACCfsL2
U+r2uMlK/Q21DJwXbTJjmnyAe19XWYtcvtUfKd50OAsoPnpijd6XN/VzkpPwSI1v
MM1rZmYLCNhucLOPo87uqSwtHmOGOiHGefUgolr3pa9kl2VjNfe2U9byQTQegxaK
CxeDN6bZEPo8n7PoU1mmnwFDouEZD1xzQt3FdvPpL2XORk2Ye5r89n1q02uTLbkj
EsQ7IOSbpp2UDyIkxF0ESV6nWtpLn7AIB0rNABUH7JZA9FQ29vzAc9a3FRiLJsUa
2cvxXsdWOdhpncFiR4L1mRq39BoLAQ==
=7x/6
-----END PGP SIGNATURE-----

--hd4ybrkt7tr5jevb--
