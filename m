Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE82616F8DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 08:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265986E13A;
	Wed, 26 Feb 2020 07:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CAF6E13A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 07:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNdQaBvaEH6o+vSRlaOm4O2/aeb11nshQiTO9h1t4/LWZBC2ysZlAo4p/8w3rqy8DjYQaFmisv/mlhiSa5toEaL0zveasr+SotEQagdVvI6sbDGc4hinI/fAVf59x7HB9fKoR6vxC57xc9GSpLDhSHHrGeAduJlwZXqVXUtGc5YcX2x6P+a7vznaCyviqsBPRAtaW5VJ+A0Dx3y9HBLWPnVNHLCVbZSrAKvVxxlgg4F1nQkb8X55SrPKs1mrwJWtDbosdXAKooNB+th+BZz2KP9vGzv+46h2MGPtfw3VlQURrRjbW9Zsh+gnjQBzVBZbcU81KCpsbFLy/g/0IRW2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhFb0ud6XCDs9DHZfgRnImIeWJ/Z4iG7EsTqihKvLFc=;
 b=OZ4zesyeF0YG+GIWkvqvTGhsSZv11O85iuBsGDc1eA9d0jPh4A9/pKcqJJvGn+7tRtVOqJ6sxqXGsHJwp/Rle0AEmoFehxE17EohqUMPst1HhmDiV5tQ4WTLpl6H301MMcTb1mjZgm32Q7AjN+lHOUUrdr7sDGoB0SHl8n3EaBzF2NvMOgXExZExV9yxM+O+GJdURUa5klvVbaKXyqilsXhi8GfQmMCIv2dOdkTioGlqAN0znIrqUPEp9ux8ZBdlaS0VpidR0ImLgIAhHc+iz+fbsNCF4StN4C7MN4aRJr8HpkHln2iYnBMhc3W9GNV4rpPL7yvD8qk+J/Z1lOKppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhFb0ud6XCDs9DHZfgRnImIeWJ/Z4iG7EsTqihKvLFc=;
 b=XsgK3ZV0qZJ+YJdv6P/f8L5d0xrIaV4h2ULPBt/4IxPP2QavPfUVzhuL1apVdftdmU4v3NwU+807fcSZfYEEFlqewiHoyyVn1kphjrG9T6R4kI08mP/u+duyMtcsFT9DxirWfnubo1x9KaY/QDw7jfUXE9OMahTvWttsmvTuNdo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@oss.nxp.com; 
Received: from AM6PR04MB5766.eurprd04.prod.outlook.com (20.179.2.143) by
 AM6PR04MB4774.eurprd04.prod.outlook.com (20.177.33.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Wed, 26 Feb 2020 07:58:26 +0000
Received: from AM6PR04MB5766.eurprd04.prod.outlook.com
 ([fe80::4c26:a809:e360:5864]) by AM6PR04MB5766.eurprd04.prod.outlook.com
 ([fe80::4c26:a809:e360:5864%3]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 07:58:26 +0000
Date: Wed, 26 Feb 2020 09:58:23 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: imx: add bindings for DCSS
Message-ID: <20200226075823.rxaw75gsnpbrcalf@fsr-ub1864-141>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
 <1575625964-27102-4-git-send-email-laurentiu.palcu@nxp.com>
 <7716263db71ca07a52e5a562882f0ae7f35fee48.camel@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <7716263db71ca07a52e5a562882f0ae7f35fee48.camel@pengutronix.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: LNXP265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::16) To AM6PR04MB5766.eurprd04.prod.outlook.com
 (2603:10a6:20b:ab::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (89.37.124.34) by
 LNXP265CA0028.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Wed, 26 Feb 2020 07:58:25 +0000
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4815793-2f41-4f1d-dc0e-08d7ba91a8f5
X-MS-TrafficTypeDiagnostic: AM6PR04MB4774:|AM6PR04MB4774:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB477460B2D4AE4A6E230AD024BEEA0@AM6PR04MB4774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(199004)(189003)(54906003)(478600001)(4326008)(6916009)(316002)(81166006)(81156014)(6496006)(966005)(8676002)(52116002)(55016002)(8936002)(86362001)(186003)(9686003)(26005)(16526019)(1076003)(956004)(5660300002)(7416002)(66946007)(44832011)(33716001)(2906002)(66476007)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4774;
 H:AM6PR04MB5766.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dfTmCWX5x7n7wkqGa7l6l7SaJesI1f5hCDSsaFxXlza7QJ54oeYO2Dmsu4pgHEGqUAkr6Rw7EubCjdtJXXbl1uLTQ/lY8qUqUgrit2kKS8ST0ojrVUUTRYEhmsXNtm9YmkLjLF929EeaT4sHiPAXVyZXv2AL9k3/5HoTJ2cAzuySuVvnxY7DlmaLouhOw4ub9JiTncC8co10YtD/gD16yNB1UbigW7zn235cSzEhpV9IBDKMeQaNUPrg8Sb6UoLfemjooqOdXW3qXJ/Q8PrKpc4Uf3kffLFudZa3ybzdNmMOCbjeIPxKZQyYRQQ1szJagjvkHinHR2C//Mz5aE+JRdrBCI3Uiq/O3weQwq69qhxcOoSh35Xm1b1RmTyN3W0nR8GEJdsL79ALVmLl1INXj5LoSREs14K6xdCLwKtwp14BGOdvc4ehSa8jEE4OsPvL/LoyGS6LMz3fbacs3bB2gJrHk1OINgzMaf8TchDFnErHBcWP9IxKTpgVBu1cZCH7fT1U7opaRIlsuAOCAWNPbQ==
X-MS-Exchange-AntiSpam-MessageData: /f7SiSCnQRCaoi+jt5xBXhEKApykHk8nu//dmN5jFsy/m2Q480coUiqndwzZSMU9nGc7p2zeyaAv4J0jYpY8/1TZWieeuW+BH6nJJ9RztebunjmJjN8yEjyWYS8kXK8KiZ2L9wPWordlIqzsA8zPCQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4815793-2f41-4f1d-dc0e-08d7ba91a8f5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 07:58:26.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D35gpFBZz+/vpJrieUvsIgy/ijqMs7nYnhlJC0ChPkYBPr9PuSYU/Hcdr+7BZVQzyjQI7DJf1hNcnVzOB12WkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4774
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 lukas@mntmn.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Mon, Feb 24, 2020 at 06:21:57PM +0100, Lucas Stach wrote:
> On Fr, 2019-12-06 at 11:52 +0200, Laurentiu Palcu wrote:
> > Add bindings for iMX8MQ Display Controller Subsystem.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml      | 86 ++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > new file mode 100644
> > index 00000000..efd2494
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2019 NXP
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/display/imx/nxp,imx8mq-dcss.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: iMX8MQ Display Controller Subsystem (DCSS)
> > +
> > +maintainers:
> > +  - Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > +
> > +description:
> > +
> > +  The DCSS (display controller sub system) is used to source up to three
> > +  display buffers, compose them, and drive a display using HDMI 2.0a(with HDCP
> > +  2.2) or MIPI-DSI.
> 
> HDMI 2.0a and MIPI_DSI are not really properties of the DCSS, but
> rather the connected bridges. Maybe just drop them here?

I'm a bit confused... Drop what here?

> 
> >  The DCSS is intended to support up to 4kp60 displays. HDR10
> > +  image processing capabilities are included to provide a solution capable of
> > +  driving next generation high dynamic range displays.
> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,imx8mq-dcss
> > +
> > +  reg:
> > +    maxItems: 2
> > +
> > +  interrupts:
> > +    maxItems: 3
> > +    items:
> > +      - description: Context loader completion and error interrupt
> > +      - description: DTG interrupt used to signal context loader trigger time
> > +      - description: DTG interrupt for Vblank
> > +
> > +  interrupt-names:
> > +    maxItems: 3
> > +    items:
> > +      - const: ctx_ld
> 
> Can we make this just "ctxld" for a bit more consistency with the name
> below?

Fair enough. Will change.

> 
> > +      - const: ctxld_kick
> > +      - const: vblank
> > +
> > +  clocks:
> > +    maxItems: 5
> > +    items:
> > +      - description: Display APB clock for all peripheral PIO access interfaces
> > +      - description: Display AXI clock needed by DPR, Scaler, RTRAM_CTRL
> > +      - description: RTRAM clock
> > +      - description: Pixel clock, can be driver either by HDMI phy clock or MIPI
> > +      - description: DTRC clock, needed by video decompressor
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: axi
> > +      - const: rtrm
> > +      - const: pix
> > +      - const: dtrc
> > +
> > +  port@0:
> > +    type: object
> > +    description: A port node pointing to a hdmi_in or mipi_in port node.
> 
> "A port node pointing to the input port of a HDMI/DP or MIPI display
> bridge".

Okay, your description's sounds better. I'll add it in the next revision.

Thanks,
laurentiu

> 
> > +
> > +examples:
> > +  - |
> > +    dcss: display-controller@32e00000 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        compatible = "nxp,imx8mq-dcss";
> > +        reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
> > +        interrupts = <6>, <8>, <9>;
> > +        interrupt-names = "ctx_ld", "ctxld_kick", "vblank";
> > +        interrupt-parent = <&irqsteer>;
> > +        clocks = <&clk 248>, <&clk 247>, <&clk 249>,
> > +                 <&clk 254>,<&clk 122>;
> > +        clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
> > +        assigned-clocks = <&clk 107>, <&clk 109>, <&clk 266>;
> > +        assigned-clock-parents = <&clk 78>, <&clk 78>, <&clk 3>;
> > +        assigned-clock-rates = <800000000>,
> > +                               <400000000>;
> > +        port@0 {
> > +            dcss_out: endpoint {
> > +                remote-endpoint = <&hdmi_in>;
> > +            };
> > +        };
> > +    };
> > +
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Laurentiu
NXP
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
