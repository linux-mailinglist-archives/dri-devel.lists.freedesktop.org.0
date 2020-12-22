Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD352E07EA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81A06E830;
	Tue, 22 Dec 2020 09:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40088.outbound.protection.outlook.com [40.107.4.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AB06E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 03:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2FyBnc34cevPVCQepaQHVAXm2zsJexR7J9XMW+9VzPifBlIXIgvip+eTPPGf5bHd++/UXB/5mmMkH+bOQhtnk6lVEiPbkQ6evWfbEBAtg54LSkc9KgsqVwiul7ny60WOT9T/UgM9K2nTxVjYWgw/hLc6K1ppSWBv6CSqYLeNfOQYs/APZf92nwQI0azJIrAldkvIlgp37RiWkiCQ+56Kz4D62qeRk91MQOY0p7VKPyAhijHvVF+Zd4hwhOgRMagLqyQtKrbJ1zeQOhEWKuA4rmxnzc3zqrTGEqnx1skPNrFIyU6HQhpW2hrLwE8n5gw6XmvVIA5A43DMsqkswxwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQS7QtcYJy1fqK0jlmFS8hTmYmpiyUa9cW93BWuETpk=;
 b=exYGN8fL3ya5xmr2AQyH6B3Xva2ga7KVCv1mvdsv5xRLBLFIRMPh9CRUC7uxz8Qd2GxVFtP+NSYuz8+zpq7yRDftqTLlwz9sYmnHzOhlZplp7Ct9Y89f58TQI75geGLQy/9qQ516nGsxGg9EscGbZAzQg2JBswh1304H4R62hpHu/tMRmA0fpvymKv8m42GsrjtkvCXpFSu2PBU/Z2IcbU3yWNanYl74H+1luU6DC/rhZslj3y6649I6r//8rJnVZ3PFbV+lq9+gaXYos+5XXZ4xvR9KzjAKRhKAXdyAZivYRgJL2mcYNjLbiQ6vJH16MJ9xT52XqrTyWiMxEqrt3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQS7QtcYJy1fqK0jlmFS8hTmYmpiyUa9cW93BWuETpk=;
 b=I7LUeJMjnTeETLvsPjoH9h+vUm9KEY4fq1bcvePzQ1W782XFhYkDj688DkurEU7DLUxlhuWgMDN30rl7NsWyni/LKUECBbCEl/U1SVrFupefizlCQ6B7szlr3k2s8733UpG4UU7yE1LbpQAzdMvy+OBax9iC2RAfOIPAA6wmacQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7231.eurprd04.prod.outlook.com (2603:10a6:800:1a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 03:50:20 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 03:50:20 +0000
Message-ID: <0b29c5a61750b14a2714eba881d352c7cad36b46.camel@nxp.com>
Subject: Re: [PATCH 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 LVDS display bridge binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 22 Dec 2020 11:48:29 +0800
In-Reply-To: <20201221223329.GA691090@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-12-git-send-email-victor.liu@nxp.com>
 <20201221223329.GA691090@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0128.apcprd03.prod.outlook.com
 (2603:1096:4:91::32) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR03CA0128.apcprd03.prod.outlook.com (2603:1096:4:91::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.22 via Frontend Transport; Tue, 22 Dec 2020 03:50:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 765d7b6b-b1fc-49d9-209b-08d8a62cb44a
X-MS-TrafficTypeDiagnostic: VE1PR04MB7231:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB723106B918F6994CABD6345098DF0@VE1PR04MB7231.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mE4g0p2Ujk7CXJUNLIHV9o3iLhqPaW1mPWoL1fvWHjwpNXKT6GCWtOCuVoVFL/B/F6iDmDcyyyQu7BNxA9hFrf/ymcvrJpnFxvU2dWvRU7YiO1PxQVQ4viYKzRfBBS1lSqThG8nx6pMcXvpF4FVl9s98XwUalxKDS9JihK2tbvSEyq7vVDaMXvUDpfePaVfpP9QzDuJ4amq0bBIAqhTGbMnWLsX1Xe/LATUrEfRbMQr+McmHlA8iUscxDPvlmnmfjXjKtrS8LUHdFLTflZ5uSsyUxDGqxZxFpl9EiZIBtr4NFubqFAsOBVG7brG1jZQoEhiw72oVOYgEjQgtVzuDfQyyF0i8NdNph+IWQZgHn7aqOglpK9ZCC36wOxex3QRgELhfTxO1gFTYg+QVgWllRwd4m3gqBeSw/UOY/SFM7GQ+nM21FlbyG/tFubBMxN1AZ/52ZCguDPe4ZxxqEy30Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(8936002)(6506007)(52116002)(478600001)(6512007)(16526019)(83380400001)(316002)(66476007)(956004)(66556008)(6486002)(6666004)(86362001)(6916009)(26005)(66946007)(8676002)(2616005)(186003)(7416002)(2906002)(4001150100001)(36756003)(966005)(4326008)(45080400002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUVzaGtWK0lvWGtjeHlOWkx0d0FYS2liQWFMWmd4WW9HWXBzM3NKanNQNVFM?=
 =?utf-8?B?MDJWdStLMWtFSWNwZ3FsMCtHYXNCcE5xUHF0c2VMTkd6RzlaUElmN2VuUVJn?=
 =?utf-8?B?ZUt3dEVUS1czbm9uNnBTcW9nUTUyVUNZR3RObXp1VmZucUJNYXA1YWJSNGMz?=
 =?utf-8?B?NkRCMTVET1lLYlp3SFVMRzhzeWJRSVBDZGQyV1NnNThEdUc4NW9TS090VGhz?=
 =?utf-8?B?MmNBeU5MNFJIRThWVG54V092NzRLNkxwbGVSUkR4T2c5YzJ2Q3MxOVIva2g4?=
 =?utf-8?B?NEcwY21XdGFKblhKaGRxTnVSQVNCZ3VQUUdoQkVrMWZGL3B5YUpOczhrRjNJ?=
 =?utf-8?B?K2YvaTQ0eGFRVmFORTl4M3U3NEd2WUY1Um8wRndUSTBHUUN1amZrUHVRUXM2?=
 =?utf-8?B?QmU2dmpycnlIZFlnWXhZOHNQU2xzZ2FaWUsyOE1PU0MyRXl0a1RjU3FMVG1U?=
 =?utf-8?B?dTR5MHFHNkxWSHB3cUdISjVCUTFWWmM4cTEwNFdBRVBqM0xnMGxvVzlZNEVn?=
 =?utf-8?B?bm1zYlU0Y0hFdmduU0dkVG41dTNmVy8wek9FM0NIM1BuUk0xOWxXMmE2MEhh?=
 =?utf-8?B?WkxtSnJ1MTVxeHBWOUJYM3dvQTBWbkFHQzBrY3R3K0tGaXRzU0gvZ0U2VFBB?=
 =?utf-8?B?SW5kcWs2RE5oaHdLa2FYL3RrSUVWWmNOUVR5Y2ErVHFkbWRDMEg1MzZXTUlP?=
 =?utf-8?B?aCt6SHlqZDlYbGd3MXlWRCtSa09kczF5TDBmVk9qaU9xak5ORTdhR29nQWxn?=
 =?utf-8?B?WVAvOU5aKzY0YXJVcDZsMFdsNDlvQ2N1RGU3bEJsUnJvTUl4bjdXaE9MZUw5?=
 =?utf-8?B?VnFyckhUZlVxR3FKeHhTUzFoZVB5RFBhKzdwUGtMSUpOMThmTEQ3T0orbEo1?=
 =?utf-8?B?cCs1OVQ3akhDWWtQcE9ZMTE1d3lDMi9WU1pSRTVSRnhkaFFxY25hZ2lrK290?=
 =?utf-8?B?c0k5dkpia1l5Z3Z5UzJpZ0x6OUNZejJhSll4VVNzQmo3eTBCT3hOSEVMbzgz?=
 =?utf-8?B?M3F0bzFYL1hFQW1Pb1ByNGNqa2VBNWsyNmZ5Z2dSZmMvemZ3TUR3QjlGS3Qx?=
 =?utf-8?B?Q2d4VlFiR0pweDAyWmdiVDhxbWJsaUZNV3hTdWdRajlYTmhSejlFUERqUHRO?=
 =?utf-8?B?ajFCWnphSGJEZDdaWmFTamVYd00rbjhrbm5OMzlLZjZ0cTl4QnpIVHpQOVVT?=
 =?utf-8?B?S1JaUWM1OWVoakwwZlJsNjlVb1FiNGhXb0phdkc2UzZVdGJWWVh4Vk8zMW1R?=
 =?utf-8?B?V01XOG9DOCtpbVpyVDdNL1diYkpVSXFSVkRxdU5vZmZUa1pTUkpQSStJVjJN?=
 =?utf-8?Q?Yz48TMJoEPkQC+Sjgz0swVIFGTqYIjXCXv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 03:50:20.5274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 765d7b6b-b1fc-49d9-209b-08d8a62cb44a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jscF/LhkMEEa1qgeAXXwLe1zIWa9eiZbv97g2PCsMeL0+Ptzqd2H7N00SLHXAo06e4dsG03QcpfyZ/7oqvzMNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7231
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

On Mon, 2020-12-21 at 15:33 -0700, Rob Herring wrote:
> On Thu, Dec 17, 2020 at 05:59:30PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 185 +++++++++++++++++++++
> >  1 file changed, 185 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > new file mode 100644
> > index 00000000..4e5ff6f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > @@ -0,0 +1,185 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-ldb.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C8d8e65cd4f0e45494d6408d8a60076d4%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637441868260775770%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tvsqI6VbnO9Qe4CBJAcoHHK8uzszYWmy5hBSGaeqPmc%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C8d8e65cd4f0e45494d6408d8a60076d4%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637441868260775770%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2FTDhBQJLEFxWH2Nm0zTodKEhajtCRoVJilT9jBtbUfA%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qm/qxp LVDS Display Bridge
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp LVDS Display Bridge(LDB) has two channels.
> > +
> > +  For i.MX8qxp LDB, each channel supports up to 24bpp parallel input color
> > +  format and can map the input to VESA or JEIDA standards.  The two channels
> > +  cannot be used simultaneously, that is to say, the user should pick one of
> > +  them to use.  Two LDB channels from two LDB instances can work together in
> > +  LDB split mode to support a dual link LVDS display.  The channel indexes
> > +  have to be different.  Channel0 outputs odd pixels and channel1 outputs
> > +  even pixels.
> > +
> > +  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
> > +  input color format.  The two channels can be used simultaneously, either
> > +  in dual mode or split mode.  In dual mode, the two channels output identical
> > +  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
> > +  pixels.
> 
> This LDB doesn't share anything with prior ones?

i.MX53/6qdl/6sx/8mp/8qm/8qxp SoCs embed LDB.
Bridge drivers for them should be able to use the 'imx-ldb-helper'
added by patch 10/14, so they do share those logics.

i.MX53/6qdl LDB encoder driver is at drivers/gpu/drm/imx/imx-ldb.c.
It's essentially a drm encoder driver.  Efforts are needed to convert
it to be a pure drm bridge driver, just like the patch 12/14 and 13/14
for i.MX8qm/qxp LDB which live in drivers/gpu/drm/bridge. 'imx-drm' is
also needed to create drm encoders and connectors. So, a fair amount of
work. With that done, the
binding Documentation/devicetree/bindings/display/imx/ldb.txt for
i.MX53/6dql LDBs can be dropped and we can probably cover them by this
binding, though I see quite a few new/inconsitent propeties.

i.MX6sx and i.MX8mp LDBs have no drivers yet. They can be potentially
covered by this binding.

Liu Ying

> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-ldb
> > +      - fsl,imx8qxp-ldb
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    items:
> > +      - description: pixel clock
> > +      - description: bypass clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pixel
> > +      - const: bypass
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  fsl,syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      A phandle which points to Control and Status Registers(CSR) module.
> > +
> > +  fsl,companion-ldb:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      A phandle which points to companion LDB which is used in LDB split mode.
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: Represents a channel of LDB.
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      reg:
> > +        description: The channel index.
> > +        enum: [ 0, 1 ]
> > +
> > +      phys:
> > +        description: A phandle to the phy module representing the LVDS PHY.
> > +        maxItems: 1
> > +
> > +      phy-names:
> > +        const: lvds_phy
> > +
> > +      port@0:
> > +        type: object
> > +        description: Input port of the channel.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +        required:
> > +          - reg
> > +
> > +      port@1:
> > +        type: object
> > +        description: Output port of the channel.
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
> > +      - phys
> > +      - phy-names
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - fsl,syscon
> > +  - channel@0
> > +  - channel@1
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8qm-ldb
> > +    then:
> > +      properties:
> > +        fsl,companion-ldb: false
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +    ldb {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        compatible = "fsl,imx8qxp-ldb";
> > +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> > +                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> > +        clock-names = "pixel", "bypass";
> > +        power-domains = <&pd IMX_SC_R_LVDS_0>;
> > +        fsl,syscon = <&mipi_lvds_0_csr>;
> > +
> > +        channel@0 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <0>;
> > +            phys = <&mipi_lvds_0_phy>;
> > +            phy-names = "lvds_phy";
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> > +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> > +                };
> > +            };
> > +        };
> > +
> > +        channel@1 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <1>;
> > +            phys = <&mipi_lvds_0_phy>;
> > +            phy-names = "lvds_phy";
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> > +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
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
