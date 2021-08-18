Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B193EF73F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 03:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789936E2B4;
	Wed, 18 Aug 2021 01:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BFF6E2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 01:15:10 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so848195oti.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RM2dmchpI6KmQKuD+RgubJedkIA6WkX9t/jyVLdUt3Q=;
 b=pKZPZqRbhGX/wIjzkmlU8Ar5s+lCZ10Fxl4rIj4/Zk+Ge1+FP2O1a/ERQfHnYhFp/W
 k45IMzeCPCTlznIymhgdWDmIjvLrOOIeD+fwG0Z1lv2VW1ObfuIPwGMp4DhmvFKRKLjR
 6MhYQRDEO9VlPkCuIkRqHpshP65yL3cHUsuqBaXJFt0ezRLBPZBM2bYMYuAetFCdEeFC
 h1pWaOjKLMns6f5JpD0ai9+3aU0pmNrAlPSbjcECek9tzZYalx1UEPcGMxLg1XvBZsx9
 UC1BR2z5hUJig6F6wvjWSbkqmv4SKeAtDwffvzIH6O1UQiWHJFUopM+G1h+fhMbmZ2a7
 +39w==
X-Gm-Message-State: AOAM533zHfcCyL3pJD9JGWvr6wKGYM6+aSoJJoQraMp3wkhEKDVA1E/r
 AuUfN+Izdk3cJPKNFvrPsw==
X-Google-Smtp-Source: ABdhPJydb95sxSyCE8JTQ37Yp3+d+zCUT2I4Mgdlk82Qz5QqNFm3xA06SoTPwD6X93TSb4zbZLUInw==
X-Received: by 2002:a05:6830:1f54:: with SMTP id
 u20mr4796930oth.320.1629249309809; 
 Tue, 17 Aug 2021 18:15:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o7sm662196oih.34.2021.08.17.18.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:15:08 -0700 (PDT)
Received: (nullmailer pid 1174643 invoked by uid 1000);
 Wed, 18 Aug 2021 01:15:06 -0000
Date: Tue, 17 Aug 2021 20:15:06 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Message-ID: <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-7-digetx@gmail.com>
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

On Tue, Aug 17, 2021 at 04:27:26AM +0300, Dmitry Osipenko wrote:
> Document tegra-clocks sub-node which describes Tegra SoC clocks that
> require a higher voltage of the core power domain in order to operate
> properly on a higher clock rates.  Each node contains a phandle to OPP
> table and power domain.
> 
> The root PLLs and system clocks don't have any specific device dedicated
> to them, clock controller is in charge of managing power for them.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra20-car.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> index 459d2a525393..7f5cd27e4ce0 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> @@ -42,6 +42,48 @@ properties:
>    "#reset-cells":
>      const: 1
>  
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

You are saying the first string must be both one of the enums and 
'nvidia,tegra-clock'. You don't get an error because your pattern 
doesn't match 'sclk'.

> +
> +          operating-points-v2:
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +            description:
> +              Phandle to OPP table that contains frequencies, voltages and
> +              opp-supported-hw property, which is a bitfield indicating
> +              SoC process or speedo ID mask.

Just 'operating-points-v2: true' is enough.

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
>          reg = <0x60006000 0x1000>;
>          #clock-cells = <1>;
>          #reset-cells = <1>;
> +
> +        tegra-clocks {
> +            sclk {
> +                compatible = "nvidia,tegra20-sclk", "nvidia,tegra-clock";
> +                operating-points-v2 = <&opp_table>;
> +                clocks = <&tegra_car TEGRA20_CLK_SCLK>;
> +                power-domains = <&domain>;
> +            };
> +        };
>      };
>  
>      usb-controller@c5004000 {
> -- 
> 2.32.0
> 
> 
