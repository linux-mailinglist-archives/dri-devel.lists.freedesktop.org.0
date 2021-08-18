Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6120F3F0580
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 15:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15FF6E5BD;
	Wed, 18 Aug 2021 13:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1E06E5BD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:59:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k8so3718603wrn.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KNffZkosHqyXx54/Hpv5ZrGxbGQeRq47x+KeHOQn2D4=;
 b=ibuocWT93lqgP2jFTcmPxR3VZo0d3F1Xf1TvV8Ax8j9ydj7+q7Af1STuLQmp/w0lkJ
 CpUJcHGatD8/lifTM+iTTF8M3X6uRJyXK4+iwJDUgoSBuwu+iUzJ5etA3MOE7KZUuTiJ
 VzQNmTrzFh8jm/DNdhZmMnsQuBs7Y0JOvpqSKBnEaJQcwcgmozjoOtCe5IuoSXd3SJi5
 r+wu0oOp4C+CRCmSDJJzlhXYjyFGEyb15wd3WSAlduhqb0QrSHb4nByKv7J6xAJhYYj1
 Qxq9RpobYHQRwyH77A92zvewXitzMA7u8fnZPH3Ku++ZZxHLayWxduyBzjm6sr9p1an2
 A+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KNffZkosHqyXx54/Hpv5ZrGxbGQeRq47x+KeHOQn2D4=;
 b=sxU/b8EPg3OgPL/x6T5nbbE9t+k6g73M1Xo+5MVBPFvH+kjqAuNWaTFaLsG4YW49mK
 Zn1icTRL8EFBQ6bT3Jx/xdL2E28bftj2Vlr/yz5ItAasuR3DqSMcYMPjgSiNJZTquQr8
 V20NLgwhuhKgoFN4UE0JWQzJPm1KxJZ+jPeBONOiVVm5EozcfmQ2Wp99KxGOolLvywtS
 EalN68cFMtloftW50zOTYvgPHb2SBq3reS8f6TtfF3/58tLYgfvWb2nGGULXJfS6xuup
 n1I1Bm10+AV+NzvAnfZ7Ga/I+RcOJZ5yXCKYf/klF2FWMJvfnYx3i+5zoTrnI83rTovF
 +Nnw==
X-Gm-Message-State: AOAM5311nwtBgHfIZ1E5vIpEd8uMO6UHtWj/MpJFDJ9GT3up87e6bUuQ
 2kV6YOtfU7mnU3m/2bhnn40=
X-Google-Smtp-Source: ABdhPJxvF7WMaqSu8zeTy7i/rg84Q96ABr3QOSv6VnFi/zQqxYTwAuSffE52Els7OFHVChKGgH4lUQ==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr10789333wrz.36.1629295181628; 
 Wed, 18 Aug 2021 06:59:41 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id e4sm6166417wrw.74.2021.08.18.06.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 06:59:40 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:59:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
Message-ID: <YR0SSz7KMh7TwaFW@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rawOBESmF2Gu2Spy"
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-7-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--rawOBESmF2Gu2Spy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 04:27:26AM +0300, Dmitry Osipenko wrote:
> Document tegra-clocks sub-node which describes Tegra SoC clocks that
> require a higher voltage of the core power domain in order to operate
> properly on a higher clock rates.  Each node contains a phandle to OPP
> table and power domain.
>=20
> The root PLLs and system clocks don't have any specific device dedicated
> to them, clock controller is in charge of managing power for them.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra20-car.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.y=
aml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> index 459d2a525393..7f5cd27e4ce0 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> @@ -42,6 +42,48 @@ properties:
>    "#reset-cells":
>      const: 1
> =20
> +  tegra-clocks:
> +    description: child nodes are the output clocks from the CAR
> +    type: object
> +
> +    patternProperties:
> +      "^[a-z]+[0-9]+$":
> +        type: object
> +        properties:
> +          compatible:
> +            allOf:
> +              - items:
> +                  - enum:
> +                      - nvidia,tegra20-sclk
> +                      - nvidia,tegra30-sclk
> +                      - nvidia,tegra30-pllc
> +                      - nvidia,tegra30-plle
> +                      - nvidia,tegra30-pllm
> +              - const: nvidia,tegra-clock
> +
> +          operating-points-v2:
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +            description:
> +              Phandle to OPP table that contains frequencies, voltages a=
nd
> +              opp-supported-hw property, which is a bitfield indicating
> +              SoC process or speedo ID mask.
> +
> +          clocks:
> +            items:
> +              - description: node's clock
> +
> +          power-domains:
> +            maxItems: 1
> +            description: phandle to the core SoC power domain
> +
> +        required:
> +          - compatible
> +          - operating-points-v2
> +          - clocks
> +          - power-domains
> +
> +        additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -59,6 +101,15 @@ examples:
>          reg =3D <0x60006000 0x1000>;
>          #clock-cells =3D <1>;
>          #reset-cells =3D <1>;
> +
> +        tegra-clocks {
> +            sclk {
> +                compatible =3D "nvidia,tegra20-sclk", "nvidia,tegra-cloc=
k";
> +                operating-points-v2 =3D <&opp_table>;
> +                clocks =3D <&tegra_car TEGRA20_CLK_SCLK>;
> +                power-domains =3D <&domain>;
> +            };
> +        };

I wonder if it'd be better to match on the name of the node rather than
add an artificial compatible string. We usually use the compatible
string to match a device, but here you're really trying to add
information about a resource provided by the CAR controller.

We do similar things for example in PMIC bindings where the individual
regulators are represented in the device tree via nodes named after the
regulator.

You could then also leave out the clocks property, which is weird as it
is because it's basically a self-reference. But you don't really need
the reference here in the first place because the CAR is already the
parent of SCLK.

Also, I don't think the tegra- prefix is necessary here. The parent node
is already identified as Tegra via the compatible string.

In the case of CAR, I'd imagine something like:

	clocks {
		sclk {
			operating-points-v2 =3D <&opp_table>;
			power-domains =3D <&domain>;
		};
	};

Now you've only got the bare minimum in here that you actually add. All
the other data that you used to have is simply derived from the parent.

Thierry

>      };
> =20
>      usb-controller@c5004000 {
> --=20
> 2.32.0
>=20

--rawOBESmF2Gu2Spy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEdEksACgkQ3SOs138+
s6HP0Q/+La/49DtiMYKwipA8LeYUP5rVqDJT7F0fxC9HA4NLuzMTMUyDN3r1as5D
5YPP2qMQ+ASzE9RWtl5MLh+yBAJ8z3xsw8lz9CE+VMPTDbbrYboz5emtaE6omzrq
hnx7QwqMgbUGL9RPFyN9TVPE+Ku5e398ASVBNadBEIGQufI6xVe7sjs85rAjlVfY
fpZOtuFoca7anBdWd2M7xUdIJFNQ1RBoCFcMN9xWN4I/ETvHnzcLThIWU9eyBu4/
5ySzXXBtK3w5MVCXLR/48lTaNY2CqpXWprl3Sf7mcb69IuNLc8WHUQknh7ETAoVR
F5GmeuXhQgJGxg4weOHxD0bUsy6rYfZIYSqF+oHnjNlmfaSfu/yv0H4jmDJL+WhC
uYWkWHdT+OEgZPBm5LePnOAOvI1SEppNEy/gzib6QxafL+KioWQoUMQXQO14mbOs
vIknf5KOVA5bhDsqBvd+PU9sI+f0EQodHIH0Ki2YGzIM/YSdRZi7oKsxB4AvHYPp
MO0JpyJlh3BbeV/d54EXNR61RI+vxGUT2ae5W995GddFkKKwR6OyEIIJUAuZDtiM
7naeRRPQgroHFFvzd1Z+sF+8pH3PN6qDwCfwksUKnBmMftuhXMSV2eyixURGvQaa
oG3qz1liUA8vmPu8h4+JUeLh+VK23CdzQn9kXuKSDMe0L1ngDnc=
=29ra
-----END PGP SIGNATURE-----

--rawOBESmF2Gu2Spy--
