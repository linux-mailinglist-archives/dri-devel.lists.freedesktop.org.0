Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771FB64F859
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 09:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE5110E032;
	Sat, 17 Dec 2022 08:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2073.outbound.protection.outlook.com [40.107.6.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1278210E032
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 08:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5UEb1+G8lbcdLLpvmIwVu0J21VBcMJQZGNDlp0H81PNx4TOoN7Oti7IInrd6bdNBxUe8MmtOmvmT96N8pdQMPjKFJAn6cq5mOFUCTu6ESwkKQIYtseVAGfa9dbICCRKEWNWFI0mS16rbBpfLisGjGHl28H1a9VL+kluAhUfmGyDvkAGl9sDtbkaXF3bwjFfZsNiAEocls3Q50piJWjvG3eGswgampm9JOt1E5SOhM219qPq9H0nvajB6SYi1C4rGGN1lNPvrkatdMQTIyZpSlcfz/ZqZm2ZqY8mSXj/y0InB/0IOV6mnVb5xZoT5QwRiQKwlCT53BRuSsAjhDzUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQDpqcsB51RkvvPYdDEcZ8AwQio9zDX8JaHjpGIO9xI=;
 b=loz6O93DNDlxkuPG8P2HPLSxRofxTwkzBUYGSFSlZp9gn0Q67UuWLtmpjZ7hg0I802lMsO7JEvOcUm6WrPGoz1jr2ZqxDEX57X59+hsJW5ZH01+Z8tibmiVLBHHLoE5+lnmVaLqNcERk9f2gYFL4a/YLoePyLeOIZ/K9Vna+JI0UDB6OiN9BNrs5cKkS5hxtTYrhaF/MLz8NMMZYr9VLWliO2c9X6EL/xZnsS8VsjBbxVPP0dDUb0qQu675h5IS2vbzs0yFvg6JJiYpdguLt7IrVdvw/QZb/dhfRifIZJ77mSkSNBXCsGxcus5sYQH3pi/tgBQtrukMfhb89cGtf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQDpqcsB51RkvvPYdDEcZ8AwQio9zDX8JaHjpGIO9xI=;
 b=RnGwXUztUpzhyW1OQjP3VheVCb/C8FK+kOg8pazYvUwxkIfLTkrUnRirp4M4rmX9Cix4/S5XjuT3WjwtAgh1FCE2NDRx2gE2soE8PqaYRGcxmAYW+eqOocNyNIRdJXThKKGmAgxT1zBxo2Lc2ztoxZiuR9qwwH07lD4cMyh+Q/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU0PR04MB9321.eurprd04.prod.outlook.com (2603:10a6:10:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Sat, 17 Dec
 2022 08:58:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ce5b:991d:5f5e:388]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ce5b:991d:5f5e:388%7]) with mapi id 15.20.5924.016; Sat, 17 Dec 2022
 08:58:22 +0000
Message-ID: <6b9475dba642417e32a971c56bfed41738f0ce78.camel@nxp.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI PVI
From: Liu Ying <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 17 Dec 2022 16:57:42 +0800
In-Reply-To: <20221216210742.3233382-3-l.stach@pengutronix.de>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-3-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU0PR04MB9321:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d585b9-1e10-4574-6c90-08dae00cd93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n91v+Q5Jphrxm9xfU6oPTmTcHlzPhrnokcOgW0T4VPTscHqYSVTt88WxGVbvSFqDLO++to/fkEGjWYl2gndqVprnFyTH3u0ohGdzcA3EDur8FCjtBgjV28VCuTl7ytIFkee3g5WBVjR33YsjR0O2hjtb1Tu198flu5RWtls+qpRLslvRjsAlV67FkgkmytvnR96RTU8EUpqC6cTu4STF87hlL82vkNNW3Fhot5gMJ24S4mDqPoj+ljSmLAe8+/oN9rQmfRNFzLMP1QsybmpEDKlor/MFtwY6JowHIv0ZRT+j3U14x+Jsy4Rr4WXOp2ejrerQmxeEkhsvhpDj1gWRMAEwZCkZdZxl4eFUxVXLAP9fMqOliHB8WaC2ZdY7n1pvB7M4v/N9LMg/yh87wK5CWWtSxWuyMc384ZM8ND0yMBSrJt4rNGLZKh1Xx5dRzA5R/t+Ru8bWJNmgkib/ZFMiQNDVxA7dZ9+Jtoo0x/2KiXBfIWYpa+8SW0PLZTpHRu59nKreTyFs3roBcGQm+Ub14WBc6KyFwb7waJc0vj9gdygwc4duZfaqBFjJkiXSMTFnQyRrZosa9zk4hCyIYnvX7qm3dqRvRGvONBnBJ6+hq87Ee49YKSrcIeSKDaxZSAKmZlLZW5iFCEGB/l4N2Yc2sNMz05L0M0rAzkJVVBSSrz5aZ+6opE8JDzOIBUDNqOlBVNIkwjWz4t1VHTfUrfCNIWNtqJg/X2vY81wk8KfiiAWjy34vi6GPyeiq5ofNNUKeFvdvvUUVeqkDf3cohV9BvrXxc1WDwHtL1vl6C0dMaPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(38350700002)(38100700002)(8936002)(7416002)(5660300002)(2906002)(6486002)(66946007)(26005)(186003)(66476007)(8676002)(36756003)(4326008)(83380400001)(41300700001)(66556008)(2616005)(6506007)(86362001)(4001150100001)(6512007)(6666004)(54906003)(52116002)(966005)(316002)(110136005)(478600001)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3lMRXpGN2xLMmE0WmdPQUVwdEQ4U2tTRStNRm85bWdlckYrZFZGTERKTEFF?=
 =?utf-8?B?d0p5S0JRdHhuOEx5a25FNjVxT1A0enFtMkF1YTA0dUpCS3NlZG83VVozZVUw?=
 =?utf-8?B?b2RWYmNwUGdYeloyZDZrNWFjVzRJc1lVd0xuZ2xNMTB5dUh1Tlp4d3NCeFp1?=
 =?utf-8?B?elJ6RmplQlBlcHh3WW0xemd4MjVVUHFodEpVMU5aUWVidU56ZndSTUlkY1lO?=
 =?utf-8?B?SUh3Z0JuQk9SRUVOT1FvejYvZ0U2SkFGT1BWdFJzSWZxQUp4NEdQNTZaR0xN?=
 =?utf-8?B?MFNqL0tVRWo3OG5FNjU5amlIMHhpeXAzSmlEeEFibjE4a2ExQnpoR0gySnNR?=
 =?utf-8?B?c3p3L0M2WlpTNm1TMEZINm5CYmRjUytzb2cydS85Mk8xTHRNeVFmd0JydFc5?=
 =?utf-8?B?M3FHeHc2Yk1YbzVweWorVUN2VXVPeThWSTQxODMzZGJjQXU4UjJUNjFSeHha?=
 =?utf-8?B?MTV2eFAraEJ1MC95cVhLZkxHSWsyaVkyK2VCT0dQWVlMbjFSYThQbXMrd3F2?=
 =?utf-8?B?NVlCQy9WQzlSWmdWMm1lNU1pZU5LV0xsUUpqeHU2VjRTUmliWGwxTmVSaVVU?=
 =?utf-8?B?c09RUGEwMEh4TGJiMzJXSGZYTnVjaDk0WVp5WmRSY3luNGVSbEl0UE5EQXJ1?=
 =?utf-8?B?SHRNSC9MNXlvR0krTGFDSjd6dWhJNGw5OUk0dVorMUhGbWRiVzdsN0FKTHpL?=
 =?utf-8?B?UHgzSTZlVDVCdjBCZE5nOUR5R2xBTVFmNCtmQXRpUjJuNWpTb0RVVkxtZFFZ?=
 =?utf-8?B?Vy85eHpLaDM4cGFwNFM5b1RNUlUwelhQUDhKZC9xczF3dnIyNkpQNW1IYWdx?=
 =?utf-8?B?bCtySFgzenB6R0EwR3VHdXl6dlVmcDlLT1NITi9pQUp6K0QxaHZTZTJBVDd6?=
 =?utf-8?B?Tm9QWEF3UWVHU0EvZjkzLy9wSXBoTTkvc09FZUVTNGQ4YWp4UFVmLzVmTU1P?=
 =?utf-8?B?TG11UkMwVllhV3VUQTNXWEF2Uyt1cmlKZ0xCTlBkdElLRzJ4dHR0ZXFENGN1?=
 =?utf-8?B?eVRQbFZmS0N0U0x4K1BjbmdBRVF2Zm8zcFFXbEd0VGlFOHVaQllaN2RUVCtY?=
 =?utf-8?B?cWlwSWJ3VmlNWnpTQUY3MHNGc0FqR0p5U1R2OVpSWFpPZ2FJM1dnYXJvWS94?=
 =?utf-8?B?K3JKRHNNQUNLYUtsQlptTnRia2ZrMHZvUHZ3a1lEeXlEbmhBbDFBdlAyNjgz?=
 =?utf-8?B?WVlrcUU4VStKOCtJUnJKaWhweHhwUnJtclFuTHVuU1p5RXFpSXY4NHhvS1Rx?=
 =?utf-8?B?VGFhQlBPMUtLL1BKT1VsdlRjUVlYU0lYRjJ4S09pTEV2NVFtb1p1b3BSa0RF?=
 =?utf-8?B?Mm5mMUZQUjB0T1VWL3dDcy9VZTlPbzl1bXhoOGJoSmZkQkVBcDY4c3RtV1B5?=
 =?utf-8?B?V2hOSEZadXZnTGtPN2lPeEthRktJMU4wT0xHSGljOUpIZnZPQ2dVY2FoREFM?=
 =?utf-8?B?aEhISVZVZEpoeGlpaUYyb1dRYWNtbW9BdTdlT3VxTkdOZll1eVpJOEJhNlpm?=
 =?utf-8?B?YjV2NTJoNmRvTjhMaC90UVd6RFF0UWt6c3MyS2FuQVhaNXh3aGwvRWp5dkY0?=
 =?utf-8?B?NnNHWk5nSUh2MVJBRkVCcUZ6VCtjTS9pVWpwTzdpV1d5U3hIdzNTSVZxNGoy?=
 =?utf-8?B?OXZDY2xucFlHV21nVlBGeWhCZTJuZk5aWHBtaFhpSkRZZ1dKbzBhdm5MYncv?=
 =?utf-8?B?QUJDbXBqUVdzV0ZaUkphcjFBa0tBWVlPS25qZ3dhY2MyL1hHMytyYzU5a1VM?=
 =?utf-8?B?OFUyb0U0eG1TNCs0TlZYUUU0QWZxZjZkQTJ3OFAzQzd3WW1ZMWJCYStzZFhL?=
 =?utf-8?B?a1hrSUFWNFUvZWYxci8yVktQUDgxTHpOckFZU09JajA4cFE1cnYrY2hmdEp0?=
 =?utf-8?B?MXQ3NUNxNUtZSzJMbytUQzVqQlJZS1dYYytaVnJkL0FaM1VGejBQa1BYRVJJ?=
 =?utf-8?B?U3orS3Z2VVZMbGlpNElncVAvYzUrRDNScTRZVGRNK0FwVnhoTS9CU1p0eXZJ?=
 =?utf-8?B?ZzNOVDFwS0pRQlJWMXFLS2VWUTY4NGZIOGRnN1FHUmUzRVFPS2lCYlRIWTQz?=
 =?utf-8?B?US9ON0Z0SVZyVy9SN2RjYWNwVXA4ZlpZTCtIR3JxSllpbEhtNlUybGFtOUFx?=
 =?utf-8?Q?4We3QchPYhP0CdXm4ID53zaVI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d585b9-1e10-4574-6c90-08dae00cd93a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 08:58:21.9278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WmkADhjYhsRiFbGo+pxYlSnh6JAdCUODAeAG0VW4k2H3+bZMKrFjkFpTncqhlAPVH0xiVEutt3ocgoCe6gqcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9321
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

On Fri, 2022-12-16 at 22:07 +0100, Lucas Stach wrote:
> Add binding for the i.MX8MP HDMI parallel video interface block.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      | 79
> +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-
> pvi.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-
> pvi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-
> hdmi-pvi.yaml
> new file mode 100644
> index 000000000000..aa369721ac99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-
> pvi.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: 
> http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pvi.yaml#

Similar to my comment on patch 1/4, it's better to put the binding
documentation in the display/bridge umbrella as the corresponding
driver is a DRM bridge driver, not a DRM encoder driver.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Video Interface
> +
> +maintainers:
> +  - Lucas Stach <l.stach@pengutronix.de>
> +
> +description: |
> +  The HDMI parallel video interface is a timing and sync generator
> block in the
> +  i.MX8MP SoC, that sits between the video source and the HDMI TX
> controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mp-hdmi-pvi

Consider to use const instead?  It can be changed to enum when
necessary.

> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input from the LCDIF controller.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the HDMI TX controller

Nitpick: missing full stop '.'.

> +
> +    required:
> +      - port@0
> +      - port@1

i.MX8mp RM mentions a 'htx_p_clock(pixel clock)' in HTX_PVI Block
Diagram as an input clock to the HDMI PVI.  It looks like the same
pixel clock generated by LCDIF, not sure.  Maybe, list it as a required
'clocks' property?

Moreover, according to i.MX8mp RM, it seems that the HDMI PVI may
generate interrupts which map to u_irq_steer.irq_in[12] in HDMI TX
subsystem.  So, list it as an 'interrupts' property?

> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>

This is not needed if the example node doesn't contain 'clocks'
property.

Regards,
Liu Ying

> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    display-bridge@32fc4000 {
> +        compatible = "fsl,imx8mp-hdmi-pvi";
> +        reg = <0x32fc4000 0x40>;
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                pvi_from_lcdif3: endpoint {
> +                    remote-endpoint = <&lcdif3_to_pvi>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                pvi_to_hdmi_tx: endpoint {
> +                    remote-endpoint = <&hdmi_tx_from_pvi>;
> +                };
> +            };
> +        };
> +    };

