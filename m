Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715C3F0953
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 18:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B861E6E865;
	Wed, 18 Aug 2021 16:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12856E865
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 16:40:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l11so4511003wrx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ha7pIRXhU7lIgKM6iZl7/5MXUfps49I8x1mGTn2G/w8=;
 b=KvVZzPhz+mK5fc19evqC4zyHudK/Odr/0pbefoznRNp9+QKXFauQFrMCz9+7+IMGv+
 kBT6xIsXhtq4ROP1l6VWMA1dx1IYRqoR75xcdzZFFPyfOiUMhKKD1oCXTTLp3UteLJI0
 L1p/xE+6HgyXVTV1kzxgRHAfm/J+keZB2K5OqIUrX6OpC1HCNNxLJQnh8tkT/+0q/ii5
 wuWWneKMJAslsJCiQgTPjQEbhCM9ftXItQUKZ1kJ3H3EefS1r51+P5QEa/YMyrKiVhxc
 YfLhIihi1NKlPy13BlEamnLWcm0cvz9w708YrmMGl3JFy2/Yf6hzosfO1z0+Y2J9yfi4
 f6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ha7pIRXhU7lIgKM6iZl7/5MXUfps49I8x1mGTn2G/w8=;
 b=t/EAnjsObSGMIQppmEA5r+4nnbERej9gMPb2APB/UPLdb10tpngnTgCcPeJGjtQE3m
 5wE2L05+odff89VS/fXrqGW3Dagi4jOIoe23gDkuLrO+L/xq/DM3X4FQrWPnk73lYIxs
 2sXNE8tSjLP0suSmuHpijFtjSllL+fs+5NOyCWzPt45EvRZP7dPFXU+YP3hxxsDHm7Sr
 cyW11RZ2eqZd/4yfrYYe9wZpgjliszP2OQ9LLuXDd/qXBsaZkjP63ej3/u1YZ7XMneHi
 0wqKdumjE9MLNybkn0DNAyAxUlKi4CU9eUuPs7xfHswLDPPraqv8iKsvZ2gqCwa+TG/g
 JJXw==
X-Gm-Message-State: AOAM532IZoyLThFSA4W5Do/u2CtkpDRFjUUqj7Jd15uOGoT8xHtSRq59
 dBeo/6lZrSQf0NFRBtJQT0A=
X-Google-Smtp-Source: ABdhPJzWuDpzbJgtrsE3+I2RnhODHoXt0n5NIf7WHBWuFXM7MOXZc9rKkOXOo8zH1v4Xrx93tidQmg==
X-Received: by 2002:adf:f704:: with SMTP id r4mr12119842wrp.389.1629304801463; 
 Wed, 18 Aug 2021 09:40:01 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id g35sm6122212wmp.9.2021.08.18.09.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:40:00 -0700 (PDT)
Date: Wed, 18 Aug 2021 18:39:59 +0200
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
Message-ID: <YR033zuYWWLCeYpM@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com>
 <YR0SSz7KMh7TwaFW@orome.fritz.box>
 <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eFtPHN6cNJIzUPRB"
Content-Disposition: inline
In-Reply-To: <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
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


--eFtPHN6cNJIzUPRB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 06:05:11PM +0300, Dmitry Osipenko wrote:
> 18.08.2021 16:59, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Aug 17, 2021 at 04:27:26AM +0300, Dmitry Osipenko wrote:
> >> Document tegra-clocks sub-node which describes Tegra SoC clocks that
> >> require a higher voltage of the core power domain in order to operate
> >> properly on a higher clock rates.  Each node contains a phandle to OPP
> >> table and power domain.
> >>
> >> The root PLLs and system clocks don't have any specific device dedicat=
ed
> >> to them, clock controller is in charge of managing power for them.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  .../bindings/clock/nvidia,tegra20-car.yaml    | 51 +++++++++++++++++++
> >>  1 file changed, 51 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-ca=
r.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> >> index 459d2a525393..7f5cd27e4ce0 100644
> >> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> >> @@ -42,6 +42,48 @@ properties:
> >>    "#reset-cells":
> >>      const: 1
> >> =20
> >> +  tegra-clocks:
> >> +    description: child nodes are the output clocks from the CAR
> >> +    type: object
> >> +
> >> +    patternProperties:
> >> +      "^[a-z]+[0-9]+$":
> >> +        type: object
> >> +        properties:
> >> +          compatible:
> >> +            allOf:
> >> +              - items:
> >> +                  - enum:
> >> +                      - nvidia,tegra20-sclk
> >> +                      - nvidia,tegra30-sclk
> >> +                      - nvidia,tegra30-pllc
> >> +                      - nvidia,tegra30-plle
> >> +                      - nvidia,tegra30-pllm
> >> +              - const: nvidia,tegra-clock
> >> +
> >> +          operating-points-v2:
> >> +            $ref: /schemas/types.yaml#/definitions/phandle
> >> +            description:
> >> +              Phandle to OPP table that contains frequencies, voltage=
s and
> >> +              opp-supported-hw property, which is a bitfield indicati=
ng
> >> +              SoC process or speedo ID mask.
> >> +
> >> +          clocks:
> >> +            items:
> >> +              - description: node's clock
> >> +
> >> +          power-domains:
> >> +            maxItems: 1
> >> +            description: phandle to the core SoC power domain
> >> +
> >> +        required:
> >> +          - compatible
> >> +          - operating-points-v2
> >> +          - clocks
> >> +          - power-domains
> >> +
> >> +        additionalProperties: false
> >> +
> >>  required:
> >>    - compatible
> >>    - reg
> >> @@ -59,6 +101,15 @@ examples:
> >>          reg =3D <0x60006000 0x1000>;
> >>          #clock-cells =3D <1>;
> >>          #reset-cells =3D <1>;
> >> +
> >> +        tegra-clocks {
> >> +            sclk {
> >> +                compatible =3D "nvidia,tegra20-sclk", "nvidia,tegra-c=
lock";
> >> +                operating-points-v2 =3D <&opp_table>;
> >> +                clocks =3D <&tegra_car TEGRA20_CLK_SCLK>;
> >> +                power-domains =3D <&domain>;
> >> +            };
> >> +        };
> >=20
> > I wonder if it'd be better to match on the name of the node rather than
> > add an artificial compatible string. We usually use the compatible
> > string to match a device, but here you're really trying to add
> > information about a resource provided by the CAR controller.
> >=20
> > We do similar things for example in PMIC bindings where the individual
> > regulators are represented in the device tree via nodes named after the
> > regulator.
> >=20
> > You could then also leave out the clocks property, which is weird as it
> > is because it's basically a self-reference. But you don't really need
> > the reference here in the first place because the CAR is already the
> > parent of SCLK.
>=20
> We don't have a platform device for CaR. I don't see how it's going to
> work. We need to create a platform device for each RPM-capable clock
> because that's how RPM works. The compatible string is required for
> instantiating OF-devices from a node, otherwise we will have to
> re-invent the OF core.

I think we do have a platform device for CAR. It's just not bound
against by the driver because these clock drivers are "special". But
=66rom other parts of the series you're already trying to fix that, at
least partially.

But it doesn't seem right to create a platform device for each RPM-
capable clock. Why do they need to be devices? They aren't, so why
pretend? Is it that some API that we want to use here requires the
struct device?

> > Also, I don't think the tegra- prefix is necessary here. The parent node
> > is already identified as Tegra via the compatible string.
> >=20
> > In the case of CAR, I'd imagine something like:
> >=20
> > 	clocks {
> > 		sclk {
> > 			operating-points-v2 =3D <&opp_table>;
> > 			power-domains =3D <&domain>;
> > 		};
> > 	};
> >=20
> > Now you've only got the bare minimum in here that you actually add. All
> > the other data that you used to have is simply derived from the parent.
>=20
> 'clocks' is already a generic keyword in DT. It's probably not okay to
> redefine it.

"clocks" is not a generic keyword. It's the name of a property and given
that we're talking about the clock provider here, it doesn't need a
clocks property of its own, so it should be fine to use that for the
node.

Thierry

--eFtPHN6cNJIzUPRB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEdN9wACgkQ3SOs138+
s6FSERAAi00u9umOi2kRPzgNx22NK4zXmCFm25TyZE0+c/u4y+m5z3W7btG7C5qF
JedyqJ/SAA8aKttuEimSsNOiMDcQiGRpWQDR3uiv5wwk2u/0T3bdam6E3I9gBCFI
1i50Q2BISzTsiYKEu/2HTdwk8RKHZ8WRuddyc/+BjGtgto1RS975yZr/Ou1B7prp
QSZCsIy9Y2ZEdVLkdnXNYauYiUqeNbigF9O/cD1bkfYfHEjS71jRMmqR05Di7Les
11yc/jftF4N2o1+nh3ziQUV5EPmEt0Q+KtphSA1FuncuwMYrcL1tpI26P2ma25zP
o+MqXTst7xl3iM5HQtJqGiteFX4Z7ZF9W66DsKOoKc/C9yx+gBOJBk/7WAq9CYHK
EmR0lun02aVE9/jdpWhDIiTioP6NKudMKSF8prZJVc1gnLnjfhzKWNDzqJknwB1Z
Pq0sUtE25GZjmidSWpOuzi8vQtUmJB+kQsHqeKtD1kM/nV4eF5428ar+LqFp1QKi
+6AS6oH/23bgFGMBvlQMSmuoNz09nZlLW2AUdPxXA3PL/Ga7c+EJlTtS8L5/L0Ik
zZ5NiDwI/wgedxo8GiUTA9TaSpzFtFL3abt3+5cOXihde+0lhyLeAMYMZi4R/UDv
yTBta0D48QPXz7t8EHc4D7qMDA+Igs/jGuNrNlX6k76CY+V8lXU=
=wpRa
-----END PGP SIGNATURE-----

--eFtPHN6cNJIzUPRB--
