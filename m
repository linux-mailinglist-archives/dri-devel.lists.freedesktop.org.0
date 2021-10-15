Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6F342E561
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 02:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ABB6ECAD;
	Fri, 15 Oct 2021 00:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CF46ECAD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 00:45:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95BA861139;
 Fri, 15 Oct 2021 00:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634258746;
 bh=/cGUNPRumW5g4NtZnw/TZ7a5zAOOWtph9g3h6h3+tl8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=PDLNZVFqTtqdsi7F/5aHfz8OjFU2hoe+4+XEy/wqvWt7D1AGFoStAqarfiKP5SMdz
 lbIE+NLWRxDJdaPfdzlHF/WRWe84x9eiu8W1DheLHJgqRh5nOCIsyLFmf5KDTVTJOn
 9xrBuzZuO8OY8x8bQK2J4V2RoQr6/8UQXtNQzdL+hgkrCcw8mPjcnUlFzQn47RvKOs
 g/RzbVEJbKUjwOFmHH8XkhhQYxN7pT/TDL3CQHN+W/q9j/CHLgn1iYobveKeiG47aH
 oVSQmDS/kZdfc4rQMVGyXg48eJikByueFcYK0W0/zNkEQKVbpTsLaZpRT2fnGO6l8+
 69xH9cwt0b5HQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4090acf8-c8af-d98c-2121-9fd105365e55@gmail.com>
References: <20210920181145.19543-1-digetx@gmail.com>
 <20210920181145.19543-6-digetx@gmail.com>
 <163425700766.1688384.4481739110941660602@swboyd.mtv.corp.google.com>
 <4090acf8-c8af-d98c-2121-9fd105365e55@gmail.com>
Subject: Re: [PATCH v12 05/35] dt-bindings: clock: tegra-car: Document new
 clock sub-nodes
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, David Heidelberg <david@ixit.cz>
To: Adrian Hunter <adrian.hunter@intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Nishanth Menon <nm@ti.com>,
 Peter Chen <peter.chen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>
Date: Thu, 14 Oct 2021 17:45:45 -0700
Message-ID: <163425874534.1688384.5636050222516713710@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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

Quoting Dmitry Osipenko (2021-10-14 17:43:49)
> 15.10.2021 03:16, Stephen Boyd =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Quoting Dmitry Osipenko (2021-09-20 11:11:15)
> >> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-ca=
r.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> >> index 459d2a525393..f832abb7f11a 100644
> >> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> >> @@ -42,6 +42,36 @@ properties:
> >>    "#reset-cells":
> >>      const: 1
> >> =20
> >> +patternProperties:
> >> +  "^(sclk)|(pll-[cem])$":
> >> +    type: object
> >> +    properties:
> >> +      compatible:
> >> +        enum:
> >> +          - nvidia,tegra20-sclk
> >> +          - nvidia,tegra30-sclk
> >> +          - nvidia,tegra30-pllc
> >> +          - nvidia,tegra30-plle
> >> +          - nvidia,tegra30-pllm
> >> +
> >> +      operating-points-v2: true
> >> +
> >> +      clocks:
> >> +        items:
> >> +          - description: node's clock
> >> +
> >> +      power-domains:
> >> +        maxItems: 1
> >> +        description: phandle to the core SoC power domain
> >=20
> > Is this done to associate the power domain with a particular clk? And an
> > OPP table with a particular clk?
>=20
> Yes
>=20

Ok. Can Ulf/Viresh review this patch series?
