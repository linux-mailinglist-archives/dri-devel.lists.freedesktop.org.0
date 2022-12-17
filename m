Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5E64F81D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 08:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E498210E00D;
	Sat, 17 Dec 2022 07:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1103110E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 07:41:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XE6X3UHwF9THpy9ogJx0CikDUaTdKEIr3nP1ux3N6onPXiOg4wwjZ5HUplA3lFSuLM/cuRBLGZuv56YIeTDqs1T+FYUzFA3quXEzTLpwTAmGhaaGfdyOIv//Tsa0BDYUCOJaFL21m0c6C+pe6RaFxMeDoLvHjkQCRpQvfm4YioZ64RVVYOaL/DAU4Bsh7+sD7pl1lHx0UfHz86ED8BpHq/cuw0PtUTxo/XQ//+trAuA1E23iIK2yaiLaEwheRCnHUAnjAZsu0ensPdFeouEwnwHNAvw92uG+nhIlOTaFzdE6WTQtZ8KXZGA0jR8rkijzgk3FZKypws1avqfbGBbUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNYDX9Q6lJ4RIe3aNtWzXPeEUgi6i8WJsdQLYkB8yfM=;
 b=jjEEsps6hdENhjRDQb17eDwvUZieFfmYDBrrN3kJagZROP+/6tfLTf3yKCYrfuzfaqY83EowWauT3uUXCGyh7vVN6f1LHnEo5B1YI4cBOAMMm1CRi+U86ucYUhwRc3eFJTb6ZcreSl44rfXFDX8RkuP8E9s7haa1yi/vFT7DALzypRUK04Ag/j91fG3qCPJgSote9OIPLjOnQ3PgTz2L9niNwfmUTMm3iF5xyP7W92RaCL4Nkjygcea5Cb3D73/ydt4HW7IEj4bFYThigonN/wDPBBHYVciHps2P5I1dxJ1K1dDB0YMl0+gQTlsHZPq2elmDbeQ//IUtDjLFCYmsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNYDX9Q6lJ4RIe3aNtWzXPeEUgi6i8WJsdQLYkB8yfM=;
 b=gsnZrcJmvxzRx3p+6X8mqclGvUzEf0cLjt5y5GrqqIps12Ajys9M9Adb2N1Vf0ALdJNEWHxZ+kKzmzJVz4uZHiQw751ca2HFVg9BB8rNbifGiexsxsH/j1Fk54f5Cw6IgSJaZVzR1Ovtm1ba3Z+G9HD9wQB1ZWx39CvEhDSYoCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9485.eurprd04.prod.outlook.com (2603:10a6:102:27d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Sat, 17 Dec
 2022 07:41:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ce5b:991d:5f5e:388]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ce5b:991d:5f5e:388%7]) with mapi id 15.20.5924.016; Sat, 17 Dec 2022
 07:41:02 +0000
Message-ID: <d0c9ecebc466f8e08a697cb041064199ff09fb44.camel@nxp.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
From: Liu Ying <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 17 Dec 2022 15:40:24 +0800
In-Reply-To: <20221216210742.3233382-1-l.stach@pengutronix.de>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0088.apcprd03.prod.outlook.com
 (2603:1096:4:7c::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: 8358093e-6016-4d8c-6410-08dae0020c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPy2VcqcPmSgyi5bFDl4NjR2R83gjksexsmyiw1nBMYkGIIT7KAVohKJbjB0mWtP6WFmnW258bXNH8msVL0B2lBeZsn2qhpTSCXXnMdVJY/iU3Z7v5NwPfEzGtwjZJT358GksBuJ/f2Y7yVhn3CQAqpuR3rcBzrQzhQR7N/DAIJjjKSu2q5Fjb1VHVIy1qZVXoDDs/gVRyw86GOau8bmRcG7Biw866OodKdZzilgsYXJPbPykzOxIA7npwAvG82H314NuK1S46Q0wFBIMiymZ3JrD71pclygQdr9gP+Jv5w9Jf1ts+VGk9UQkcmlGRR05w8L+if2zjfpYzDeGf0+mEke2tPanY96pdk2wzW8JGDfeDqzqIaH0OHbDxM0R1o9k/A1EFbXyoOh77QMkEsUbxLcwt+TbZ8p4Q9bVVx+ve+a5W5QBk8Ds4tfJ++rdy43EPoEmu3uGfexZ/R8BQTh24CekTmET14Y7JpTWfmsyzH6POFCGdemvPhph5pdC6AGtBBKMH2NMPn+t7RrTFU4c9DueOrdqFeh0fr/h/zzp4TfSTSpx4rsiK1tdHXDuJt7bFuWMSoFwaP5+jd/Gi3uhwwnCNR6FhWxy59zNaQlckUSQ4ylcZ8sT2UWUUv1dyk8zhIlU+XZpIcZnP9o0LCw7flJGOtZq1u710SqOCkSgXbEktibJ7znp8Z+iU5eP7mcjU+EZha42OWIJi2lUwc9I82J8l5LzLuSWxVT832mXMVWfxLg1/5M1NcQXecnbibUOxoBep4sYkINfpiyatbkC1wtPDsGeCjn9oJhr28ahTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199015)(36756003)(316002)(86362001)(54906003)(478600001)(38100700002)(52116002)(966005)(6486002)(7416002)(6666004)(4326008)(2906002)(66556008)(5660300002)(66476007)(66946007)(8936002)(41300700001)(8676002)(4001150100001)(38350700002)(6512007)(26005)(110136005)(186003)(6506007)(2616005)(83380400001)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZDd0p6OXJrK09teE4wRHV1cWthTjVrR21KcTJKamFDWm03MjZibjJRNFRQ?=
 =?utf-8?B?aVZuSjY0RmtsZXdLN0RIOUFMdk50QkdnQ1BxODZOMUgxKzBVV3hUR1ErRk9K?=
 =?utf-8?B?MFUwTW1aS1pyenFUWG56VDIvb1BkeHVIUWo5UUYrOUIwa0RGNXA5N05yS3Y1?=
 =?utf-8?B?enF4T2t2TkhheTNSNENsM3VGenRZdytHckdBNXc1YTU2M3I1eUl6a2RWUFRp?=
 =?utf-8?B?alRjb2k1aUNzK2NqVUhJck5tQUdpMHRvZ0cyNENqcDhNNVNTR1psSThuWHRa?=
 =?utf-8?B?R3EyVldYb0tKZFJBWUZ2TXBOcmUzeHVTZEtaQ05ZM2x4TEFvdzZOS08rbTZy?=
 =?utf-8?B?NDE4ZlJRb0w3Q1kxdm9LSFJLcVk5UWlWeDhnRys0ekV6SVBSWjZqTlpWYTZM?=
 =?utf-8?B?RE5XVUs5V1Axa0V3Qk1vb1g4Vm9YQkJjdnRmWTN0OEJVRXU1cTFnM1NERjNT?=
 =?utf-8?B?eGtHeWFpL2dZK0tzVFJDMzdTMndrZjA2L0gwRitTeUIvWW5WU2hoZzZKQ3Nq?=
 =?utf-8?B?dzE2aGdjaDE0R0dsWHgyRDhhKzJFNGVHaUFXdnlaT3dxd01qdFJpaFdQaytJ?=
 =?utf-8?B?WkZSZHIyS3h5Y01TL3Q3bnJEOXhzME43SGhib3VOQWIwcmh0ZzRWVzBHRExi?=
 =?utf-8?B?M2xENUtGbnFVSkZnd0FtUDkxOWQ3VldyWjdXanozWnpwUEYvak9wYlA2NTBG?=
 =?utf-8?B?RmlmeG5GNlY3c0hEVGF2ZkYyVm9lbUdsQ1hVby9CelllSWpXV2wxK0lkZkIr?=
 =?utf-8?B?ZVlwVmRDZ2dTVjBGOVhKYjM0alZvYnhVZXV1QWtHSGp1T0xtR1RZMWhmdjcv?=
 =?utf-8?B?REV0WG5LM3RIZDZkMXpzODRuYVd4bm90Tmh2TEJUU3NoMFpWTy91MVhyQ0J5?=
 =?utf-8?B?U1JNVXRONEFiTjhSNkttUDdic2lqQ2VHdElYY2VJcS9LeENhSzNucXU3eHMx?=
 =?utf-8?B?MFpvdHloK2NwaXU2a3FuUlBpVUpiMWFrTllCTHY4UkNqc2lOZjRMMjNQN0ZN?=
 =?utf-8?B?Vi9xZStMeXNtY3pOTEFoMElpa1VjL2gxRk92L0hjZmNVa2U4bXY3K1hxZTRr?=
 =?utf-8?B?N3hBTHRweHptNDB2a3gyQmJ2bjVwZTRCQm5hL1pMMEdhK1k5Q1dML2ZrSEV1?=
 =?utf-8?B?b2R5QlV4TTBRYmxNWW5LVm9aVlVFRUUwK1ZPd2JPbG94RE5oemo0cFViZTQ3?=
 =?utf-8?B?Sm1IdG9icWY3TENtSmxyN0hKRGhZUkZHbE9wZHEzSFFlWnZVanI5ckZTYlJO?=
 =?utf-8?B?bXBEelZIWDFyd3BuUXprcVJIZG9iTlRqQVI1cUhEcjM0RFVXUUtvY0hlY2Y1?=
 =?utf-8?B?SmhJdm1yREU5VDRZczhWdzBTSHNnZFpPVVl1Zy9aalBsL1FkcitISVVvbDNH?=
 =?utf-8?B?ek1uOTFTSy9HQzVzTWZxUlRqSlpLVHpySnluSmVVL01QaWV5NUo1Nm1jeFZy?=
 =?utf-8?B?S2NYeE8rM1VqVkJPcGViN1UwNGQzeElFY3oxNjd1YkZhVnFpMys1N1JEdnFN?=
 =?utf-8?B?VU9pNTFSN0ltMU9JUlV1eFFrM282T3AxY0wzVEtoZnlMTldOYUNCdUtCMUdw?=
 =?utf-8?B?bWowMFRGalQvSVltS2VVZjNoQTFwZ3NucXpQckEwdHZPQkZLMWdML1p3cXVp?=
 =?utf-8?B?elpWRTgrWHh1N256bWEvdkZ2Q25tdStkWU1PbUg1SlB4bHhjSTZPU3k3M0R4?=
 =?utf-8?B?VEpEL3JMeVI5cXExOVVleFA3MzN0eGRrdlZwTUxHQ1FFQ09Qby9JUjhZNVdu?=
 =?utf-8?B?SC9rMFcyZ0Y4QlFDWWgraSs4ckdKZWFwa3NwMlIrbTh1ZW9GMWYzVERKd2hi?=
 =?utf-8?B?TkxRQUgvcVNicEVFNTkwT2xDc2J3RTBDblpENjZQUEV5dTNENkVHVmkrd1NO?=
 =?utf-8?B?UE8wTklpaW9hdTRSR1J3WmRoemVtMzFpWlRvT3kvMlBNVVZaVE9McXBvOSts?=
 =?utf-8?B?U3BtY1JZOGdrUUJiaEowMWJJTEU4dGFsRDFIOHdpcklhWmZwbDFnU2RYKzkw?=
 =?utf-8?B?Q2dNSkwvemt6azVBajdPTXRZOUdUb1VhaWxVVE4vM3pJSDFTQlc4aGRzOFZz?=
 =?utf-8?B?OGZrOG81ZDVLRXlJdllJNmNWeitEWVEzamZ1QU9XYlNBd0o5RkNpblZ0ZXZJ?=
 =?utf-8?Q?hSrbZpoNrUO9Tg68SxCYSTI5f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8358093e-6016-4d8c-6410-08dae0020c06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 07:41:02.7034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9cCUXVPock0ctqxikUa3qYfVufCzwRH/TX85F6RSlJOG4cQza8Md8wFrFKegOmgRVAJPbmYdSKyjSQrTJ7DgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9485
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Sandor.yu@nxp.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, patchwork-lst@pengutronix.de,
 NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Fri, 2022-12-16 at 22:07 +0100, Lucas Stach wrote:
> The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> core with a little bit of SoC integration around it.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/display/imx/fsl,imx8mp-hdmi.yaml | 69
> +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> new file mode 100644
> index 000000000000..75ebeaa8c9d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-
> hdmi.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi.yaml#

Better to put the binding documentation under the display/bridge
umbrella as the corresponding linux driver is a DRM bridge driver, not
a DRM encoder driver.

Regarding the file name, I would use 'fsl,imx8mp-hdmi-tx.yaml' to
explicitly tell it's a TX controller(not a RX controller), which
matches the chapter name 'HDMI TX controller' in i.MX8mp RM.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Lucas Stach <l.stach@pengutronix.de>
> +
> +description: |
> +  The i.MX8MP HDMI transmitter is a Synopsys DesignWare
> +  HDMI 2.0 TX controller IP.

i.MX8mp RM says it is compatible with the HDMI v2.0a spec, so better to
mention 2.0a instead of 2.0.

> +
> +allOf:
> +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mp-hdmi

Like the file name, I would use 'fsl,imx8mp-hdmi-tx'.

It seems that the i.MX6q DW HDMI TX controller will not easily use this
binding since it's corresponding driver is a DRM encoder driver, and no
other i.MX SoCs embed the controller, so use const instead of enum(It
can be changed to enum when necessary later.)?
 
> +
> +  reg-io-width:
> +    const: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: iahb
> +      - const: isfr
> +      - const: fdcc
> +      - const: cec
> +      - const: pix
> +
> +  power-domains:
> +    maxItems: 1

Missing 'ports' property?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>

Sort the header files alphabetically.

I'm cc'ing Sandor to be aware of the patch set.

Regards,
Liu Ying

> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    hdmi@32fd8000 {
> +        compatible = "fsl,imx8mp-hdmi";
> +        reg = <0x32fd8000 0x7eff>;
> +        interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
> +                 <&clk IMX8MP_CLK_HDMI_REF_266M>,
> +                 <&clk IMX8MP_CLK_HDMI_FDCC_TST>,
> +                 <&clk IMX8MP_CLK_32K>,
> +                 <&hdmi_tx_phy>;
> +        clock-names = "iahb", "isfr", "fdcc", "cec", "pix";
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
> +        reg-io-width = <1>;
> +    };

