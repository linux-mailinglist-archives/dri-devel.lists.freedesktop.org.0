Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02E194AA9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A3E6E941;
	Thu, 26 Mar 2020 21:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C4B89DBA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 08:41:21 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02Q7rKGx031329; Thu, 26 Mar 2020 03:58:36 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0a-00128a01.pphosted.com with ESMTP id 2ywcs689qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 03:58:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqHlnoOSPAfd4U4SqHkLCBw90vkwGHjT0GKq0l2QBmh9XFqxyxjvayAPcnrXURcC1tSPttLT3+Sj8ktH5xQiR+F6HCDc7gRl51qfflyYpQWiA9lxFimn/nKrRZBflasddTOZuirx2AYruXISYHMRO04Q9dUNi8SV7OogOPoq03+b8nzG2TdQmP4Q/UqoCEPtip4tYyalQykeZWUINi/V1fQid4wgO5k9WWtjRSFsCzzdkZR40Mmhk5z5zTP/Y1nXBD7Dhmk8jMdyJXZMLVnRLLliHHTOjjKkdlGbE/WgAn9PjHOIOMeXOatN4y13HFYnQfNlt9BxyVXS40DJ0rK+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSZmEsd/xqqBRJ5BljdLs+fhcIpieF3qSVS9oZL5664=;
 b=bfLIssJRxGhAX1H8cj3VyVYUdD9esN3623ChHvkS9loK5iVoX8TO1FhKGYCRpnRR+rCbTldc9Ey4JzzTaIcmy7b/v1ts4xyhh5wcmc1Z8LqyqsPUfj+UU4cB88bSoKRsZ4QmB8viO2rJ07DW85+fMpRGf3oNfm2pdA8lXEyadQUTryjoVx28fBQKoG9E/kM2Z3N1eYDMEfmf/GQyxA0Ocogs8G5L0Rlvj5Eoz/jqtvF6R43BB3HabY44RfwPg58voWBKoGPf52a+x4sp7cgT2bjrf8JH189qA2LT18Q3AKMSlRKKLlOOizIWDGzAjn828yGby//OQiRd4gr6l4lBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSZmEsd/xqqBRJ5BljdLs+fhcIpieF3qSVS9oZL5664=;
 b=7nPKE6tS2KdwyqzBWd2FGNa5gBIYXudEaYO8rs0Ur88uCOzcSS9xAjwyV0mTzUoq01bQOe60MAz/PQwoUtVZAnYMW17FW+RuXs54+G152hbhoxOxQm2dc+oVvf/kP+dJcHY47PbyUrPTIB3XFsil7LgtpdC+OSHQXSPN6y9Sohs=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB4874.namprd03.prod.outlook.com (2603:10b6:5:18c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Thu, 26 Mar
 2020 07:58:35 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f%3]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 07:58:35 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
Thread-Topic: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
Thread-Index: AQHWAvGhOBU1O86iSUqxt5U4FLeAd6hag8OA
Date: Thu, 26 Mar 2020 07:58:34 +0000
Message-ID: <8353c7e327370d0067edd59f0af270ec13a2ecae.camel@analog.com>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-4-robh@kernel.org>
In-Reply-To: <20200325220542.19189-4-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.26.73.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4b76a95-4e30-4013-7c4f-08d7d15b7c1a
x-ms-traffictypediagnostic: DM6PR03MB4874:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB4874901DC520AA16AA126720F9CF0@DM6PR03MB4874.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(136003)(396003)(39860400002)(91956017)(76116006)(26005)(71200400001)(66476007)(66446008)(2616005)(186003)(64756008)(7416002)(5660300002)(66556008)(86362001)(66946007)(316002)(7406005)(4326008)(54906003)(110136005)(81166006)(6486002)(81156014)(8936002)(8676002)(6506007)(478600001)(6512007)(2906002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR03MB4874;
 H:DM6PR03MB4411.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AsFRUCdWUX4T3r5C+efxU4JrXeqCG7nKusu+06gPPFQ7Tjnu1elqgozSs5lBoG2nj/v/IM+EpJD+Bk55/n4mhDtSADba+gDcnggemg76so9YLZxsIVkDUXvwlOWXgWeDhqy8O8T6X3GkqMrnsjxFnwZlwE7JmGqXKsXNbKPqhvoTVci+hrMswr97wAyYkRyI1fSbdjQ8S7K4JRF5GBoEI7wyKoHa7CCuQbQVajv+As8mfnq7RUU/qCfsB0Ip7zIEPlvq7bAZp+f5JbET9jMNn8tiWpYae4y3JBOKHp0ocP+FoAJMmQU/gJaH4InJhXEAbMgdpwS6WuDhR5ZETsBQ2eb+MRpDTFENts+u0Z9+EVCsKBEpxZddhR61GA04sFvoRDvA+QY1y5ev4eLPoH3UmHmUdVWZPZ2foC7YF9rwV7tZ8hdM+jEIHGVIOzsY3VfD
x-ms-exchange-antispam-messagedata: drqSJ4RzwpHIFbZATItKJyiViwiZDVcZipORl3odLCiqGyKXlEGPvR2OoBGAuIAKr2ZSw3ShYEvkH3wXfx1oiKD7FexjGeoVCHZAPNclTG9lncLsAvzPj28IX1wSFuNp4JVBvltewXtH+7V2kjvdvw==
Content-ID: <1E2194FFB46A1242BDB4F20BE47F6FE7@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b76a95-4e30-4013-7c4f-08d7d15b7c1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 07:58:34.9135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: si32NA3lnhDkk7yQEBaPdNPH7LqBq8s1tP+Fa4e+E1rEEhYr+2dSYdMVX/VTrtwWJH2yJwIuw2IU27h1Lmhy/G04GRhkzY1f+8G652XAhTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4874
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_15:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260055
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "glaroque@baylibre.com" <glaroque@baylibre.com>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Hennerich, 
 Michael" <Michael.Hennerich@analog.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "masneyb@onstation.org" <masneyb@onstation.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-03-25 at 16:05 -0600, Rob Herring wrote:
> Numerous schemas are missing 'additionalProperties: false' statements which
> ensures a binding doesn't have any extra undocumented properties or child
> nodes. Fixing this reveals various missing properties, so let's fix all
> those occurrences.
> 

For 'bindings/iio/adc/adi,ad7192.yaml'

Acked-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Guillaume La Roque <glaroque@baylibre.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/fsl,plldig.yaml |  3 +++
>  .../gpio/socionext,uniphier-gpio.yaml         |  2 ++
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  6 ++---
>  .../bindings/gpu/arm,mali-midgard.yaml        |  3 +++
>  .../bindings/iio/adc/adi,ad7192.yaml          |  1 -
>  .../bindings/iio/pressure/bmp085.yaml         |  3 +++
>  .../media/amlogic,meson-gx-ao-cec.yaml        |  9 +++++---
>  .../bindings/mfd/rohm,bd71828-pmic.yaml       |  3 +++
>  .../bindings/net/ti,cpsw-switch.yaml          | 23 ++++++++++++-------
>  .../regulator/max77650-regulator.yaml         |  2 +-
>  .../bindings/thermal/amlogic,thermal.yaml     |  2 ++
>  .../bindings/timer/arm,arch_timer_mmio.yaml   |  2 ++
>  12 files changed, 43 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/fsl,plldig.yaml
> b/Documentation/devicetree/bindings/clock/fsl,plldig.yaml
> index c8350030b374..d1c040228cf7 100644
> --- a/Documentation/devicetree/bindings/clock/fsl,plldig.yaml
> +++ b/Documentation/devicetree/bindings/clock/fsl,plldig.yaml
> @@ -21,6 +21,9 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
>    '#clock-cells':
>      const: 0
>  
> diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-
> gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-
> gpio.yaml
> index 580a39e09d39..c58ff9a94f45 100644
> --- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
> @@ -41,6 +41,8 @@ properties:
>      minimum: 0
>      maximum: 512
>  
> +  gpio-ranges: true
> +
>    gpio-ranges-group-names:
>      $ref: /schemas/types.yaml#/definitions/string-array
>  
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index e8b99adcb1bd..05fd9a404ff7 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -43,6 +43,9 @@ properties:
>  
>    operating-points-v2: true
>  
> +  resets:
> +    maxItems: 2
> +
>  required:
>    - compatible
>    - reg
> @@ -57,9 +60,6 @@ allOf:
>            contains:
>              const: amlogic,meson-g12a-mali
>      then:
> -      properties:
> -        resets:
> -          minItems: 2
>        required:
>          - resets
>  
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> index 8d966f3ff3db..6819cde050df 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> @@ -75,6 +75,9 @@ properties:
>  
>    mali-supply: true
>  
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      minItems: 1
>      maxItems: 2
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> index 84d25bd39488..d0913034b1d8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> @@ -106,7 +106,6 @@ examples:
>          spi-cpha;
>          clocks = <&ad7192_mclk>;
>          clock-names = "mclk";
> -        #interrupt-cells = <2>;
>          interrupts = <25 0x2>;
>          interrupt-parent = <&gpio>;
>          dvdd-supply = <&dvdd>;
> diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> index 519137e5c170..5d4aec0e0d24 100644
> --- a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> +++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> @@ -25,6 +25,9 @@ properties:
>        - bosch,bmp280
>        - bosch,bme280
>  
> +  reg:
> +    maxItems: 1
> +
>    vddd-supply:
>      description:
>        digital voltage regulator (see regulator/regulator.txt)
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-
> cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-
> cec.yaml
> index 41197578f19a..e8ce37fcbfec 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> @@ -24,6 +24,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1
> +
>    interrupts:
>      maxItems: 1
>  
> @@ -47,7 +53,6 @@ allOf:
>              - description: AO-CEC clock
>  
>          clock-names:
> -          maxItems: 1
>            items:
>              - const: core
>  
> @@ -66,7 +71,6 @@ allOf:
>              - description: AO-CEC clock generator source
>  
>          clock-names:
> -          maxItems: 1
>            items:
>              - const: oscin
>  
> @@ -88,4 +92,3 @@ examples:
>          clock-names = "core";
>          hdmi-phandle = <&hdmi_tx>;
>      };
> -
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> index 4fbb9e734284..38dc4f8b0ceb 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> @@ -41,6 +41,9 @@ properties:
>    "#clock-cells":
>      const: 0
>  
> +  clock-output-names:
> +    const: bd71828-32k-out
> +
>    rohm,charger-sense-resistor-ohms:
>      minimum: 10000000
>      maximum: 50000000
> diff --git a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
> b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
> index ac8c76369a86..b9e9696da5be 100644
> --- a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
> @@ -37,6 +37,12 @@ properties:
>      description:
>         The physical base address and size of full the CPSW module IO range
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    ranges: true
>  
>    clocks:
> @@ -111,13 +117,6 @@ properties:
>              - reg
>              - phys
>  
> -  mdio:
> -    type: object
> -    allOf:
> -      - $ref: "ti,davinci-mdio.yaml#"
> -    description:
> -      CPSW MDIO bus.
> -
>    cpts:
>      type: object
>      description:
> @@ -148,6 +147,15 @@ properties:
>        - clocks
>        - clock-names
>  
> +patternProperties:
> +  "^mdio@":
> +    type: object
> +    allOf:
> +      - $ref: "ti,davinci-mdio.yaml#"
> +    description:
> +      CPSW MDIO bus.
> +
> +
>  required:
>    - compatible
>    - reg
> @@ -174,7 +182,6 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <1>;
>          syscon = <&scm_conf>;
> -        inctrl-names = "default", "sleep";
>  
>          interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
> diff --git a/Documentation/devicetree/bindings/regulator/max77650-
> regulator.yaml b/Documentation/devicetree/bindings/regulator/max77650-
> regulator.yaml
> index 7d724159f890..50690487edc8 100644
> --- a/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
> @@ -24,7 +24,7 @@ properties:
>      const: maxim,max77650-regulator
>  
>  patternProperties:
> -  "^regulator@[0-3]$":
> +  "^regulator-(ldo|sbb[0-2])$":
>      $ref: "regulator.yaml#"
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index f761681e4c0d..93fe7b10a82e 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -32,6 +32,8 @@ properties:
>      description: phandle to the ao-secure syscon
>      $ref: '/schemas/types.yaml#/definitions/phandle'
>  
> +  '#thermal-sensor-cells':
> +    const: 0
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
> b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
> index 102f319833d9..f7ef6646bade 100644
> --- a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
> +++ b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
> @@ -32,6 +32,8 @@ properties:
>    '#size-cells':
>      const: 1
>  
> +  ranges: true
> +
>    clock-frequency:
>      description: The frequency of the main counter, in Hz. Should be present
>        only where necessary to work around broken firmware which does not
> configure
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
