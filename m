Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD573F0769
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 17:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED166E7EA;
	Wed, 18 Aug 2021 15:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD416E83C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 15:05:15 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y34so5282290lfa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EQRno5vnhRrA4KOIe4lh21xpnTcUCE7c8mZkK4K3e/s=;
 b=bctcyrsCVgDi+5GWndAxItidHxjnjBsVRd2v4YKwpkUHVQsHKnjigYdInqM2sgY1jW
 LU4Jh4S1KHwJCYIkKwBJjhzwLsETLbQkJYV1xEK2qpiOA9qIvjGJ85a1PWeULSrkn7ia
 r4YL+HceQmir1Ln3MEYBETrNrkGE0PBwh8aiSMQBVsqOxRDV4MqEJVC2Fc1LaStgvxPt
 W3s2UizOnemCr1DOdNPZ7ESGcn979rYje4A7UuCWFTbZSEZZ9derc8SEFxG1dwb3evmY
 p5hMm0n+7AZq9124uwrFB026HSrZdidoIm/IsypAkwON8b5y75L7iYAKeoihIJ13XqMQ
 VQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EQRno5vnhRrA4KOIe4lh21xpnTcUCE7c8mZkK4K3e/s=;
 b=QwTuga2CkPli0QFC7yob1G+q0J78DxWPCPA2AGPsdNvG/IAN64SG3VuFGR9M0ax4k2
 Ze+/KBEHmAs9d68Tz+KaGsQmR4l/vz2C7PJdSiWw2gx8eiigFAouxMz+SOXE680Ebdgp
 OeHhR10RP4zjF3q2NSnb7WELNrML1xfe+y6iy/1A3YAlDOSOBkSFPm4KfbDD4YbIYuh7
 vqhm8mYfaya62b4FV+tT8mburRDivTpp04IAvg15sLcuXfp77u0hXbWmgmHtWfBouYwN
 EJgDOiVfWqPrKd4LKZhIrLFppH1PiDKB+dX0yUnKF2LzCQxNw+qdBgufVOW/meUi5bCn
 jrKA==
X-Gm-Message-State: AOAM531r0hSDUQpKZnW3jHDTc67UB3o8/hSjV0MnMXxS3V8ToQuGlfjt
 yq3JWUAVCwLSIFo9xj8/Gz0=
X-Google-Smtp-Source: ABdhPJyr5YxrN+b1RGtkQEvSYdwTBm71o8Ulw3lRJisRIIBg/FeSpE62xIZBaNIXj4QafSUTN0OIhA==
X-Received: by 2002:a19:430a:: with SMTP id q10mr6797932lfa.378.1629299113790; 
 Wed, 18 Aug 2021 08:05:13 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id bn16sm12055ljb.74.2021.08.18.08.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:05:12 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com> <YR0SSz7KMh7TwaFW@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
Date: Wed, 18 Aug 2021 18:05:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR0SSz7KMh7TwaFW@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

18.08.2021 16:59, Thierry Reding пишет:
> On Tue, Aug 17, 2021 at 04:27:26AM +0300, Dmitry Osipenko wrote:
>> Document tegra-clocks sub-node which describes Tegra SoC clocks that
>> require a higher voltage of the core power domain in order to operate
>> properly on a higher clock rates.  Each node contains a phandle to OPP
>> table and power domain.
>>
>> The root PLLs and system clocks don't have any specific device dedicated
>> to them, clock controller is in charge of managing power for them.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/clock/nvidia,tegra20-car.yaml    | 51 +++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>> index 459d2a525393..7f5cd27e4ce0 100644
>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>> @@ -42,6 +42,48 @@ properties:
>>    "#reset-cells":
>>      const: 1
>>  
>> +  tegra-clocks:
>> +    description: child nodes are the output clocks from the CAR
>> +    type: object
>> +
>> +    patternProperties:
>> +      "^[a-z]+[0-9]+$":
>> +        type: object
>> +        properties:
>> +          compatible:
>> +            allOf:
>> +              - items:
>> +                  - enum:
>> +                      - nvidia,tegra20-sclk
>> +                      - nvidia,tegra30-sclk
>> +                      - nvidia,tegra30-pllc
>> +                      - nvidia,tegra30-plle
>> +                      - nvidia,tegra30-pllm
>> +              - const: nvidia,tegra-clock
>> +
>> +          operating-points-v2:
>> +            $ref: /schemas/types.yaml#/definitions/phandle
>> +            description:
>> +              Phandle to OPP table that contains frequencies, voltages and
>> +              opp-supported-hw property, which is a bitfield indicating
>> +              SoC process or speedo ID mask.
>> +
>> +          clocks:
>> +            items:
>> +              - description: node's clock
>> +
>> +          power-domains:
>> +            maxItems: 1
>> +            description: phandle to the core SoC power domain
>> +
>> +        required:
>> +          - compatible
>> +          - operating-points-v2
>> +          - clocks
>> +          - power-domains
>> +
>> +        additionalProperties: false
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -59,6 +101,15 @@ examples:
>>          reg = <0x60006000 0x1000>;
>>          #clock-cells = <1>;
>>          #reset-cells = <1>;
>> +
>> +        tegra-clocks {
>> +            sclk {
>> +                compatible = "nvidia,tegra20-sclk", "nvidia,tegra-clock";
>> +                operating-points-v2 = <&opp_table>;
>> +                clocks = <&tegra_car TEGRA20_CLK_SCLK>;
>> +                power-domains = <&domain>;
>> +            };
>> +        };
> 
> I wonder if it'd be better to match on the name of the node rather than
> add an artificial compatible string. We usually use the compatible
> string to match a device, but here you're really trying to add
> information about a resource provided by the CAR controller.
> 
> We do similar things for example in PMIC bindings where the individual
> regulators are represented in the device tree via nodes named after the
> regulator.
> 
> You could then also leave out the clocks property, which is weird as it
> is because it's basically a self-reference. But you don't really need
> the reference here in the first place because the CAR is already the
> parent of SCLK.

We don't have a platform device for CaR. I don't see how it's going to
work. We need to create a platform device for each RPM-capable clock
because that's how RPM works. The compatible string is required for
instantiating OF-devices from a node, otherwise we will have to
re-invent the OF core.

> Also, I don't think the tegra- prefix is necessary here. The parent node
> is already identified as Tegra via the compatible string.
> 
> In the case of CAR, I'd imagine something like:
> 
> 	clocks {
> 		sclk {
> 			operating-points-v2 = <&opp_table>;
> 			power-domains = <&domain>;
> 		};
> 	};
> 
> Now you've only got the bare minimum in here that you actually add. All
> the other data that you used to have is simply derived from the parent.

'clocks' is already a generic keyword in DT. It's probably not okay to
redefine it.
