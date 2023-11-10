Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA77E7D01
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359AC10E089;
	Fri, 10 Nov 2023 14:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2103.outbound.protection.outlook.com [40.92.42.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B542010E089
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WISkBCNHuFbUEV7ObOii4NtpEmEaDox+kqWw51IhfQEEexYbn/DYi9D/7eawiKneBpTOAXyyJUWRtHB0K9hjeuCRToiZDCKXxCbJ2qn142QcW5keZOsPQHKcrBhWWPGYQDPjh7k81XSF24uP0BWlYqcBWfmaBhKcZA831ITDmedN/58iop3IqC9za6I0bUhYV/RvH+qNvVqETe5B1dbianGg3BCWoqxJCkgrIPE1670ql4cWI9L+yOJdEqPSTLZtUAjmYGAOd69TdIZoqX1VhIghICgZBsfifAyHUQSr9Lf5H94aE9rvL7LOHKOOTnknZMoZm0PdF0kKRaJea8diSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ddoa+CdxgRsB4CVxwjnslLnzWpN1S1sTf0mEL8RV/EY=;
 b=MHTyNooPL7VdVh9K4E/m3GmPBU88j1vDABJ9deK9Ny8UAQh/8E6EYzLyPRaRf+Uay0jtF+9eu9LAVOME1Cimn0gE/20Z+pA46cjsjhanZljfBr7vqXtPO/+IRsLcipZAFyVC740fAz03xdtl+8UqR7+3cDjb4U0KPZ0LNWMvTgadXlhDpneqB0EqOfd9bsYFptjz0BBtnxfBywnvXmJ7MRLysDOjiq0J0gHH7yQmgbGOqdPtBuyW987sOR24ZqxZr73mDNoOMVzneup0lrYRZkLREwXqz5/Fyh1Pvk0ddR6Myasz00XRZFhb87A1gMVReyPArVIvxWiY9BR6tnDzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ddoa+CdxgRsB4CVxwjnslLnzWpN1S1sTf0mEL8RV/EY=;
 b=sur81naqWUep2Ym/gnsUzTC6+X2VjN7u3/CHXEi++09StPDsSG2LgbA1QlhEEK1htnyS/YpHlyrmNF6LdEe6Z5aQeunf+AXa6B+ZZyMhIVWbcyXmhFpi6DTNnUOArCqpoRCVYOZo1bsuIatsZNoA365nlOgVtY77Wk+QYEPdpBLCYaq4trEhB6dqOTlY9nqpRxtqoF86fWY/ZA2dtCLFEvV9B9BCTfSZp28it4i0w+TeTNB3TXF50UDxWwX3HH8gojBG7mB9CxMga8Mq2yGDH66aiKO0BnTJ0yWTms+VZM8epwrKjo6vqz5KA+21sI2AiRnszpafxLvKidRAsXobew==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by PH7PR06MB9485.namprd06.prod.outlook.com (2603:10b6:510:2e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 14:30:42 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834%2]) with mapi id 15.20.6954.025; Fri, 10 Nov 2023
 14:30:42 +0000
Date: Fri, 10 Nov 2023 08:30:39 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V2 4/4] arm64: dts: rockchip: add Powkiddy RK2023
Message-ID: <SN6PR06MB5342CA386D24487297783A17A5AEA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231109215007.66826-1-macroalpha82@gmail.com>
 <20231109215007.66826-5-macroalpha82@gmail.com>
 <15be209c-753d-469b-a7c4-7403c7745a9f@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15be209c-753d-469b-a7c4-7403c7745a9f@linaro.org>
X-TMN: [zph1UVW1RyQjnrG2VSAGGQVnPkbcLa4W]
X-ClientProxiedBy: DM5PR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:4:ae::19) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZU4+j+fn2TLQtUhX@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|PH7PR06MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: 18484da4-245c-45f3-7d67-08dbe1f99e08
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOijKvGal9CgIIVBX4SZWNHK6jKy2gHqz33p6gUI2iTEDEkVkTBPMnU4nnV6uvECaVUni8HY9ivYGEAPWhqbhzus5pvPVavGXdCmbHH6/ki1tPkOA0jDW/cV9v/YY6yqdOa+6KMPQgxhRUEKwBbaJBlqRbJ4geYs8d3xt5HJyE3dKoJ6zy50ZdaUO8thJ8VkzONd3KAFrYAj5cJPVRmZlNeTWqU2jnEVrqQcWk2UsXPINsh2NPmOuVmWKv6cxjbVCegIFP/OYixIxmTCGaGjW6+5uFCACdkoCjFxB5MPLj5pmqATDm7udUHzimLZPKkocMJIWqwLKzOV1/seFp1cLhCEFQLlzGtQ/Dte7+zXlTA5M2l5qkqxQ4dMpvUejpOl1ZhRZIT3uuueorP9D0v2Py+A2jPZ1Mr4Uaw41NEDHKbBCieoJsF09x75J1Pzp8sfRxummpr80GU+KZlcCFCoI0aoz2NiCOqtQcdwxaAxnI9VAviWKoOYGKeyHIBIwFbKHkGxlQ03a0wDVIEcnPejqdwLxIiTiAqh9XTp4Dy58EQPvnURiDXN7yHioKvBKNB2
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5QI4htUHThtTYViIedcot3BY2LPgONgl3VhWjQJI9GiX8gejP6vJJihbL27+?=
 =?us-ascii?Q?07zKkx8MoAgucvWsMSNH2jViIvooO/tuAZMkMSq4JHJK8V8fVnzwTqr+orKY?=
 =?us-ascii?Q?7B/yWWLDEydKLLbmSMLDiUnjgCaUZmYtby9nT5YDofu7VDgbAi7rEryC50yC?=
 =?us-ascii?Q?hs45HLkpcf4XCgt0sztffq51h8yHo99pGb3/UrMmPyjrd0FuID0/LwrQcbhM?=
 =?us-ascii?Q?oMxygnDl7WcJ46kWA0e8a09E2yZipIFW1H8flTB2BUIXC1P1pvOk3wLAkdV2?=
 =?us-ascii?Q?qjHdtx4m2noCN3LbcjdQPCt8cj+TOB+Vz0h5+bY06aoOLi+qNSjfIDyvK8H0?=
 =?us-ascii?Q?LPFHOb4tWDYA5G7y/rp1KWHbGca1WD1DPTN9Q0in6xbxzJEIT0ZswCZxAKEt?=
 =?us-ascii?Q?YHG5gOmO4l/b2RUNE9btTL9Ev3d8jWlUQHyORk2mXUWMh0pwpgztYzEs9UGr?=
 =?us-ascii?Q?qDY2Ph5vBIL8Kh/xUsHjIFAZ1Ph1+evsSU2v0CLxeWAF24PdCrUfEcAO7LHz?=
 =?us-ascii?Q?OXLC9a8hIDDQPBx5Vb4yb+I1ay2nCuXbkcEpOVLQKOLAcrrPxq62rS9Bjwz7?=
 =?us-ascii?Q?Le+pOxEYpiSo1jwGR94YNb5o5YbAaCTcgFYimGDN+sighLO0d9HDlEqTGs7a?=
 =?us-ascii?Q?AnCcPX+sP9OT2t5ELi6YGh+MAPQjjD0iCt0PcIcJEz7QvkHhVRBV/ByY3pIM?=
 =?us-ascii?Q?tLkZ7hlKg34R/Jsb/wJFuHXN7G7+wyeUf1gg/+sDmLpLHibXyYJJVTnc4BwW?=
 =?us-ascii?Q?DL2UspjBx28/BUZHPG2SVfaodUTeIvZ3/poriCHBuQYCmcvTfOZ22ZiM9wdo?=
 =?us-ascii?Q?I3fDGpGKYAC0aJvBV3+UC0rZ/CtOQWmajBVpoZaEt8FLan/e6x9EIQlLX2dy?=
 =?us-ascii?Q?GMokywR73LzZ/IvxajzpbNogS3961qYYoDziAQjnihl3Y8rl+XElVd/L/KDX?=
 =?us-ascii?Q?k3VJKCu7O6q1A/xcDVw2KpEaCv0F5k2MyFV4dkTHQRRrzLYpb5mfAqJQq9eF?=
 =?us-ascii?Q?aoACqvdnE4MERvy1s6JzxEfMtMmCCCF22hmML2wMICsLEPc1ApBLVCbKq1Bp?=
 =?us-ascii?Q?4JPJi3o4T7RMfMoBrsXMMp2rNZva7VmDGstogoaSFbOhFCFWLj0nDeOpgHBY?=
 =?us-ascii?Q?y0nYYn9Ejlu0JU4uk6+UgfVTMoFlGB2oyEWFahDwNcNdOL0o5f8+Oqu4qIFD?=
 =?us-ascii?Q?FFtQOZpvsG4KnIcwQY+jrrkW0MQDksXEa5OrdridBnYU8TPQ1W3sW526bWE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 18484da4-245c-45f3-7d67-08dbe1f99e08
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 14:30:42.3838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR06MB9485
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 02:14:23PM +0100, Krzysztof Kozlowski wrote:
> On 09/11/2023 22:50, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add support for the Powkiddy RK2023. The Powkiddy RK2023 is a handheld
> > gaming device with a 3.5 inch screen powered by the Rockchip RK3566
> > SoC. The device is almost identical to the Anbernic RG353P except it
> > lacks eMMC, a function button, a touch screen, no UART headers on the
> > board, and the panel has slightly different timings.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3566-powkiddy-rk2023.dts   | 161 ++++++++++++++++++
> >  2 files changed, 162 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> > index a18f33bf0c0e..f969618da352 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.2.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb30.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rk2023.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-a.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-b.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-radxa-cm3-io.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
> > new file mode 100644
> > index 000000000000..5740412f6b2b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
> > @@ -0,0 +1,161 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/pinctrl/rockchip.h>
> > +#include "rk3566-anbernic-rg353x.dtsi"
> > +
> > +/ {
> > +	model = "RK2023";
> > +	compatible = "powkiddy,rk2023", "rockchip,rk3566";
> > +
> > +	aliases {
> > +		mmc1 = &sdmmc0;
> > +		mmc2 = &sdmmc1;
> > +		mmc3 = &sdmmc2;
> > +	};
> > +
> > +	battery: battery {
> > +		compatible = "simple-battery";
> > +		charge-full-design-microamp-hours = <3151000>;
> > +		charge-term-current-microamp = <300000>;
> > +		constant-charge-current-max-microamp = <2000000>;
> > +		constant-charge-voltage-max-microvolt = <4250000>;
> > +		factory-internal-resistance-micro-ohms = <117000>;
> > +		voltage-max-design-microvolt = <4172000>;
> > +		voltage-min-design-microvolt = <3400000>;
> > +
> > +		ocv-capacity-celsius = <20>;
> > +		ocv-capacity-table-0 =  <4172000 100>, <4092000 95>, <4035000 90>, <3990000 85>,
> > +					<3939000 80>, <3895000 75>, <3852000 70>, <3807000 65>,
> > +					<3762000 60>, <3713000 55>, <3672000 50>, <3647000 45>,
> > +					<3629000 40>, <3613000 35>, <3598000 30>, <3578000 25>,
> > +					<3550000 20>, <3519000 15>, <3479000 10>, <3438000 5>,
> > +					<3400000 0>;
> > +	};
> > +
> > +	/* Channels reversed for headphones. */
> > +	sound {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,name = "rk817_int";
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
> > +		simple-audio-card,mclk-fs = <256>;
> > +		simple-audio-card,widgets =
> > +			"Microphone", "Mic Jack",
> > +			"Headphone", "Headphones",
> > +			"Speaker", "Internal Speakers";
> > +		simple-audio-card,routing =
> > +			"MICL", "Mic Jack",
> > +			"Headphones", "HPOL",
> > +			"Headphones", "HPOR",
> > +			"Internal Speakers", "SPKO";
> > +
> > +		simple-audio-card,codec {
> > +			sound-dai = <&rk817>;
> > +		};
> > +
> > +		simple-audio-card,cpu {
> > +			sound-dai = <&i2s1_8ch>;
> > +		};
> > +	};
> > +
> > +};
> > +
> > +/delete-node/ &adc_keys;
> > +
> > +&chosen {
> > +	/delete-property/ stdout-path;
> > +};
> 
> If you have to delete so many nodes and properties, this means your
> common DTSI is not that common.
> 
> Common DTSI means there is shared hardware. If you take shared hardware
> and put it into another board, pieces of the shared hardware do not
> disappear.
> 
> 
> Best regards,
> Krzysztof
> 

I can redo this with a different top-level dtsi so I won't have to
delete so much if that helps. I'll redo both the RGB30 and RK2023
so that they use a common dtsi and no longer rely on the Anberic
one. I'll do that and submit a V3.

Thank you.
