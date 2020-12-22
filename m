Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4A2E07F8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C786E84F;
	Tue, 22 Dec 2020 09:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FF789B9E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 03:01:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgvkuibIz/J4Jc9WmH7IEPCAocWbyzvwomZWic9751J8Tlixhs4lmEhctV17b0kFm6hRvxte+N2qD0/ncjtl3yXBYeKFj68vOtCXEiuTIIC88+joTq1/sj/Zi91xnquZIgYx6k5PAx+V3i0o9pw2YCEpWjEDkDAMcwo4cMxj+4qBvEx7t0eHYDPlTWaYsNq6Ciqd8/G3B5uY64nZ8qpJ+A1rE19UMewglwIQ2QYEXU0ZcChfvnpz/S3FKu54TotkhFPC16pBr+IvEecTsaiDfYB6W0IMCTvWcKIhwOfAMJnqHb2u1+FqkbSLKjuhWJimThMgHe1gnKp2MWL2hbmxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WNtKJjf9avRxTyaO/ukfNAM0ZrAembR6x2ipuHs+YY=;
 b=gNkXu7tkcD1eEcfFNZR7fYzD2DJqj7Ux4YzF4xYXpIPfIsPPPcrL+u2b8xHXxg/OdaTo1scjbTy43KqxmZBzsOrQCZlDMf+q17qnWxEKxxZ7ZRiyetQozB/gAQWn2XVvbMJsH3JfXjjmEfDwphvBVYJdxnzkkDYudx3YPUfQdDEoSSWZRhfp5v7Uap4hxaXf0RTTQa9qOc6Pf9u9N98r2xj5/2wYgOOQyxUwGenNByVLzuQCbYfV2NzuycdtMcQAzswiXnDmaeKHmjmTgxiGP9eudfebEYqLz/fDZRwomGfj6ubGxnIodwGFG++UJQM/MLSeEnBx1FkhBwW/nJrIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WNtKJjf9avRxTyaO/ukfNAM0ZrAembR6x2ipuHs+YY=;
 b=KQO0nSFhc6Wik6M6oZIF511bR9NscxYg7jb/LKslDNp2v5WT6VOzTYCSY/U8h3tBPB5izEgPjOuR3+/O9FAis5JMLf89/bH1s5UBRnCWNZ+xj+DxbPyBbWCe+RYd4iMfL3BvBfQe40M5yXPYYEbxI+zSJ+QdiZ7s1K/FkkrnA/E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5182.eurprd04.prod.outlook.com (2603:10a6:803:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 03:01:51 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 03:01:51 +0000
Message-ID: <6acb4c0e2a9aa1fb9c67b36881ade4d0d264fcb1.camel@nxp.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 22 Dec 2020 10:59:57 +0800
In-Reply-To: <20201221220713.GA610096@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
 <20201221220713.GA610096@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Tue, 22 Dec 2020 03:01:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb5bb389-dd4f-4256-c2b9-08d8a625ee33
X-MS-TrafficTypeDiagnostic: VI1PR04MB5182:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB518218AA0B8CFDF9E48D9EBB98DF0@VI1PR04MB5182.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S09mJ76zSjBFy6ZNnTK+lRdwKpY/o8zyMuq9XnWPmYMFxTQMKIi9JM/Bq0kip6rS06dwdebVOH+h9xdtBbXw15PKVpatDE/sQfDeLLPBVVG1DnKxOs5BUpUZZkDoiGKSDdR5p8XCS8+L59RIgpUl/Xke2KKgC3Lcwf8pmB6PZMVEYSIjkK+fzjEvZ4jLmqRggP4SrzlpcXFfeQgdAuLfhEw8XIrBUnD5NLiiqRatHVI5O87njnsb5gk5tdhxtBkqct3vP/QQp2sITV00v6nkiJ1gN+xCPk9Xiw6MPfPDCADjEmahR/yTcOU68AXm9tBphlNpKIF8H7R/HT/Kl5ENe4AkRe9+bs/cREmKPFQGZMW/kjmMho4qtmoNCwBvNG3Fn1G3VhwGNA5NdUQXWE1uG9O5r8Pko1/a+hNK5y2qjZe5TqXzcr3CQTB/cEIhEldmXNaLiGgguY8tQ4402N66GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(2616005)(956004)(966005)(26005)(6506007)(45080400002)(478600001)(4326008)(6666004)(8936002)(83380400001)(66476007)(66946007)(66556008)(5660300002)(6512007)(6916009)(36756003)(16526019)(52116002)(186003)(86362001)(2906002)(7416002)(6486002)(8676002)(316002)(4001150100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjVpemUrQWhERFRld3J3UWJqN21JSUFDZnlEdVc0dW1aeWRsdnRJSXlHb0pD?=
 =?utf-8?B?WnFKZVZ1QkI4RlpoZW1IaHdrN1dGWDZ6emFPb3U3VTBvY0c0UndkMG5xbkVx?=
 =?utf-8?B?b3VQRDQvWllJNXdoS2FIYzcrajc5eU5vYmRGejByU0xuZ3NRUHhyWHAvUjky?=
 =?utf-8?B?dC94TXlBbE9MQXdsLytNbHV0bGd4VmxFaTEzdEZsdjQ4bVNOWVdxMC8zaldT?=
 =?utf-8?B?VGZocHVjaWNoM3E1MDB4cUtUL1IrUkVUaFJnWUh5TXpKcmpJdWpSdHFDcmNQ?=
 =?utf-8?B?Wkdqc1FyejNPWXRzRmRLY3lOTHh4dFhTM01namsrb3NYaitES1hLN3ZtUEhu?=
 =?utf-8?B?QzB2NXR3UnZ1R2xFN3dsTXpWTnY1M1QvcUNHalhFcEpFLyt6SmdmVmNIY1JB?=
 =?utf-8?B?QnRLS1F3SGZRNFIyRWVIK1FpNS9aVnBidDhyUXlnZ0hzTkF5UU9mQjNzWnI0?=
 =?utf-8?B?c3hBa0FpdlphQTRxWnFZQkhzTXFoRGwyMUE3K3JzZlk3cllCSldkT0FlYkhp?=
 =?utf-8?B?Z2dlOHljTFNxUHFESjZ3NFcvRzBjeVdxVzRwMjNlUkhVeDJFQ0xja0tsN1Zz?=
 =?utf-8?B?MUpXOUdCWnQ5NG9VUXAwKzVZWGxLUUNzZjJFdzBqeWJud3lNMWJKNU5BZnVu?=
 =?utf-8?B?UjVJMlV2bndNQU8yeXlteG9VSHR6TG1jcERtTU9iUE5qb1Fud1REdVJYWU9D?=
 =?utf-8?B?eDZtNE10Q3UrUDNzbSsrMGxDS09CYklGam1oeGs3YysveXV3WGp6dFlpSEhK?=
 =?utf-8?B?L3VLemIzTU56b3NBM2hneXJXNHZXd3VpbCtueDZGU3JEQlp0V0xVZFQ0SUtX?=
 =?utf-8?B?L0JtTkpDaWd3N3BIaXRMMU95TmtSa3hXeUlCRk4vVU9mSzRtV1dGbSt6NG1v?=
 =?utf-8?B?eHRtOHhRMXhCY2R2N3dDcmt4c1VyeE43SEpMdkhWR3EvTy93TFhJWjJyS2tr?=
 =?utf-8?B?aCtVdVhpcC9MYkkxQ3hCNVRCTmh0OCtJTGhSYmpqUkZsY3loUnl3dGcrVGlG?=
 =?utf-8?B?anBtUzdwTzVHTW5Eb1hTdUY4UjVUT0s3S2JjenNnRzhHWWUyazE0WUlkeU90?=
 =?utf-8?B?SDNXaWVhb3M0Y05aM0Z4NVFuOWJUb3grQXJMSExGT2hqUzBnYnB3cDVKRjZo?=
 =?utf-8?B?OWNoNGcrNEg3bndFSlFTMnBYaHpBcTIzb1hPOG9kTXhzbmxad20zanVnUXU2?=
 =?utf-8?B?MTZkcmd1QnNXUkN4ZWJQdE0rTTNNMmNHa0tCcEMwMmlXMFZxMHFaNzlNcGZ6?=
 =?utf-8?B?VjhVdWhNdmh1emxpbE9QTmlxS1N0OEZCNVVER25hblJoeFF3dXpqNjRldlAr?=
 =?utf-8?Q?s6/jzlg37f6Dn0CszrexGE1hMJKNWSbvTp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 03:01:51.2885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5bb389-dd4f-4256-c2b9-08d8a625ee33
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcLgbfbd+EV+mK1lkIdU9yBsVw5mGQMWNxZs+fe4lJa7cAcUPZcA3kbI08oQ0X/nsF0IfBRxqXIVfid4/5M1SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5182
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:47 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, linux-imx@nxp.com,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-12-21 at 15:07 -0700, Rob Herring wrote:
> On Thu, Dec 17, 2020 at 05:59:23PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > new file mode 100644
> > index 00000000..bacacd8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > @@ -0,0 +1,160 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pixel-combiner.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Ca98fcf2b328a42c15d1308d8a5fcc905%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637441852425445153%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2FvqD2n1aI5sBaXbCHhsWCjp91Zk1wB8q69xNEssRVvE%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Ca98fcf2b328a42c15d1308d8a5fcc905%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637441852425455147%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=h15%2FU7V8yTNeUPmnR%2FSGNolEHOYQwQ9gHyKwdoyg2q4%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qm/qxp Pixel Combiner
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp Pixel Combiner takes two output streams from a
> > +  single display controller and manipulates the two streams to support a number
> > +  of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured as
> > +  either one screen, two screens, or virtual screens.  The pixel combiner is
> > +  also responsible for generating some of the control signals for the pixel link
> > +  output channel.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-pixel-combiner
> > +      - fsl,imx8qxp-pixel-combiner
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: apb
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: Represents a display stream of pixel combiner.
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      reg:
> > +        description: The display stream index.
> > +        oneOf:
> > +          - const: 0
> > +          - const: 1
> 
> enum: [ 0, 1 ]

I forgot to modify this oneOf + const to enum.
Will do.  Thanks.

> 
> > +
> > +      port@0:
> > +        type: object
> > +        description: Input endpoint of the display stream.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +        required:
> > +          - reg
> 
> You can drop 'reg' parts. That's going to get covered by the graph 
> schema.

I'm assuming the 'const' numbers for 'reg' parts are still needed, so
I'll keep the 'const' parts.

I'll drop 'required' parts for 'reg'.

Liu Ying

> 
> > +
> > +      port@1:
> > +        type: object
> > +        description: Output endpoint of the display stream.
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +        required:
> > +          - reg
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - reg
> > +      - port@0
> > +      - port@1
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8-lpcg.h>
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +    pixel-combiner@56020000 {
> > +        compatible = "fsl,imx8qxp-pixel-combiner";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        reg = <0x56020000 0x10000>;
> > +        clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
> > +        clock-names = "apb";
> > +        power-domains = <&pd IMX_SC_R_DC_0>;
> > +
> > +        channel@0 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_combiner_ch0_dc0_dpu_disp0: endpoint {
> > +                    remote-endpoint = <&dc0_dpu_disp0_dc0_pixel_combiner_ch0>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +
> > +                dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
> > +                    remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
> > +                };
> > +            };
> > +        };
> > +
> > +        channel@1 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <1>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_combiner_ch1_dc0_dpu_disp1: endpoint {
> > +                    remote-endpoint = <&dc0_dpu_disp1_dc0_pixel_combiner_ch1>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +
> > +                dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
> > +                    remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
> > +                };
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
