Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274E2E07EE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D576E83A;
	Tue, 22 Dec 2020 09:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EC36E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHU2F+5GUOA5aBhs1iTuoGtVhoOEIZsUEijwStnSrteXtW+GlN0A9ec4STDknB7PEZYRF0wXbtnctzs+V/lloXlSaTirl6ETHvFifA/MKrDXBMGr1irPiQirlzoY52D+5keNr5BvDK9HMV5qpIEpoiRcUiV5BC3cwC8uIDAp+/dVO6p3YkxNVHkU64YJ0HKM+ZQDTMKR2MGV+XiLpPmEw8Ha4aA1hlDVbjmjntfZdAizGXerz5b5+jidsVyVNJz99IULLGJBZoy8eJmKNeT6gKni8G/ezEIIggBXBpyy9ckXj2BBZjOaQdhQwqP1ptM7NEqoVlkwxeVcSFXNB/zC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrhpasdiUy+6SuVdSJHqnDp5Ex6VDi9+RzaD7MwKjuk=;
 b=lKAtiI/OD1fP2hoQMWtgRCM7Z/mrFZC0pKwu+9uIB6PoJRRgKzvLnqOC5vYaSeyXFKjUbiByyVvn7EQWDsUWl3AiFNj13fWtbdOcTwC+7trydVB83fBxSFeb+rnzoKuXLX6e1XjKKhrKv1tp9CU75dW1j0M3pxGFkhPwO14NMmf3BC0bUpKsQeCn6JSbUN9VQhOg3vEqaKTqukFWdYbiIv/X5faSR1rgs75Ijt3bpZgYPqpRNtxmkrJbMz0/XB0sbR9fmtS7e9unNNLvcUN8lTmaTlyEIOL26Ns8eCIvkH4Dh/U7se7Hz+QY7FOuCKpGHMggVYU5qoZS2tOMHb0+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrhpasdiUy+6SuVdSJHqnDp5Ex6VDi9+RzaD7MwKjuk=;
 b=ngJYdCLPK0HeHpdM0eABlsUxT4sYAf85D0R6zNttSEZtiu0/XdW6CDiEqmVrV+OvOSY7G8AdNTT20TDjqlcC0XlYM2spucAUoC8nNQR++ldEMoxGJrekwyQyFZQRjET6+1mkZt7whYPJILVQRr7PhFMDxazwflFAWTrx/aAR5Wo=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Tue, 22 Dec
 2020 08:28:58 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 08:28:58 +0000
Message-ID: <42d603acd55df47818a5d49d4177c562e71fe57b.camel@nxp.com>
Subject: Re: [PATCH 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 LVDS display bridge binding
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 22 Dec 2020 16:27:06 +0800
In-Reply-To: <X+GlG3iEM2IXhVNP@pendragon.ideasonboard.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-12-git-send-email-victor.liu@nxp.com>
 <X+GiA4LqJTQR9vrz@pendragon.ideasonboard.com>
 <X+GlG3iEM2IXhVNP@pendragon.ideasonboard.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0126.apcprd03.prod.outlook.com
 (2603:1096:4:91::30) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR03CA0126.apcprd03.prod.outlook.com (2603:1096:4:91::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.21 via Frontend Transport; Tue, 22 Dec 2020 08:28:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 319bf368-8e6b-445d-e44f-08d8a653a0fa
X-MS-TrafficTypeDiagnostic: VI1PR04MB7117:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB711772EE4C97DB3DEF35868E98DF0@VI1PR04MB7117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /LBcWCun1uDDLS6PcgqwIMsiHURzgfHxIfcUsqduom2slDja8bHWJtaK0dqujqj1y7825Es3c4ub2f/9USZulgCUDs4YagI30OWUO47hDYOMrY+vHW4FtidMgogV2K4th+ToZPBcgmKTq3+UMWTVSKUKw/xReJWNkQlfV66M/4i0lI7gwFLQhYMdtqbhcgkxu3Xz/bpVDWzGnt6Lxvq8WRbr4vpOpKpj7yLk1ZC2Xph64oGWGPnmgaVDg6uK+P6MRyMwZxJEg/PwljSTXxsyaMG8/JHu2aaBQ6qAFMyGRGp55njrMlWb3TGSarK76M/SoM2Sje9HgLS/L9wxObKU4lnOXOzoVhMcDeKutQBfAxwWeae0gav0M6eBRWPaN8LHyJp73/xYxHdrewlj63C1VP6WzwTbu/Uy6chWeNt/pRcFEL6VtxpKQeYRsFTjZ2PDHth0S6GV76E5FdI1To1DgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(4001150100001)(478600001)(4326008)(316002)(8936002)(6666004)(2906002)(966005)(7416002)(6916009)(66476007)(66556008)(52116002)(45080400002)(5660300002)(8676002)(66946007)(6512007)(186003)(86362001)(6486002)(2616005)(6506007)(16526019)(956004)(26005)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3p2R2tjTUJWZlRHTy8zVVk2cjVkOEt5NEV0QzRQZVRkOTZoVVNYbVh4eE1T?=
 =?utf-8?B?Qm5rRXV2OUJGV0JhUTBISDhZWWFKSDd5NUZqc2N0dnZXWUtQc3VSZm1ab203?=
 =?utf-8?B?YWswUDJQSGtUQ1NBVjhWdG0va0tCc1MrOS8rUlVPV3R0d1ZLWEpBazlWQ3ZN?=
 =?utf-8?B?K3BMYmFjdHRTVTlPUEhlWmFZY1hqWEp2ejhnMXFiR0ozZlA1bTlZSXZUbE9t?=
 =?utf-8?B?SGNWa0pkcDVBWSs0WStUaDVIZy9OSjhuRUN6TytTblI3OEY3NE9VZ0VKWGV0?=
 =?utf-8?B?cTFOZnJGVWltaUNBZEJFTm1KVXM5SXNEa0dqZWxrRS9UeWJ5dmsvQ2FyUDVN?=
 =?utf-8?B?UmhYS2RRV1BBb0lrYmJTVDlpM2I0R1pJTkFaa2xRTVFZZlBubVZSV09LRFBB?=
 =?utf-8?B?dDA4aFQrYm1CSTNrRytqZmpVY2FaZjVWMmRqVCtJd25wVWFEL0oxVE42a2Vw?=
 =?utf-8?B?VGV4Q0tQcGRpWG1GczlvZVNIRXdQeGo3bVdyVlh3dDZJUzRVTmwzNlgvZExO?=
 =?utf-8?B?UWZjVWJPTkc4SnlPcXFTaldYMk9nNjNyRVZXNDRMc3drWUZOUWdXc3lyZ1hm?=
 =?utf-8?B?OG9Xd0RyR0JpdFNROHdBT1dZSW9Oai9uazhZajY4SHdvTTV0RHJiQ0pGSUt1?=
 =?utf-8?B?eFFsYnVpV2NFc1RwRUM1d21idHc0a3VjMWJVSXlEdWpJbDJsZkNrMjM0eDZL?=
 =?utf-8?B?N1E5MUdMYzI3K2d5MmZlL0MzVWpGUzNLMEhiTWJSUjdEWGNrZXZWd2xsWEJM?=
 =?utf-8?B?QUQ2U2p5ZjRPWXpYTHpWdWZRZWtib2paV1ZGeHROWlJscVMyYmFUcE0rdFJY?=
 =?utf-8?B?ajlZYk9KYStzcFRmMWlPcU5EKzcyV2xNNDA4cmJyeUNvZFJ4RThGL0RLaGk1?=
 =?utf-8?B?SlpDL05BaWRpY3ZRZWN2Q3NQbFpOUHcvaTVBSktjOGdjYjZzN3dlRUlWcWtS?=
 =?utf-8?B?Tm83TVA0cG1Lb2ltZ1dJdUZNWHhOeTdDZ0doMHJJWjlod3lrQzN5UGl5RytH?=
 =?utf-8?B?M2RaQmI0V2lqMlVWc1dKUG5iZUMrcml0WURmaFF4OU45K2cvK255MlljaHNa?=
 =?utf-8?B?bElNaUU1V1lVWVJDaWtac0NucWE5WkFkYkhCM3FkK2lTUUN5RXIrYUh5akhi?=
 =?utf-8?B?blZrdTgyKzBUc3lST1pCWkJCZkU2T0d6VXpvQXJrRkkyZ0R4WGhnTno4VkRl?=
 =?utf-8?B?UVNXWFZYcTRUak1NT1RtSEROU0VhVnBrSnh6elNJR1htOWpuUDJnR0dQS2th?=
 =?utf-8?B?V1REWWdlNEdaSXdzRjBBQlE1RTBrMnZrVVdCQkhFSWRXTDdUZVlQVjVKckFZ?=
 =?utf-8?Q?Nukqw1wvuyMluoov1rXqgYZTDICfmRwF0j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 08:28:58.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 319bf368-8e6b-445d-e44f-08d8a653a0fa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebzSQg7BYWthhnA4psBW4a5aRCAtFeGbZgXQxKP9ImSb8okXtbBYeW8IC3E7hSvtCqsn1F1XIfoHSu6S1sAC7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:48 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 linux-imx@nxp.com, mchehab@kernel.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, 2020-12-22 at 09:49 +0200, Laurent Pinchart wrote:
> Hi Liu,
> 
> On Tue, Dec 22, 2020 at 09:36:37AM +0200, Laurent Pinchart wrote:
> > On Thu, Dec 17, 2020 at 05:59:30PM +0800, Liu Ying wrote:
> > > This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> > > 
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > >  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 185 +++++++++++++++++++++
> > >  1 file changed, 185 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > > new file mode 100644
> > > index 00000000..4e5ff6f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > > @@ -0,0 +1,185 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-ldb.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C3c38a4426c5e40581a1c08d8a64e2e13%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637442201999086534%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fr9ARb0ct7BDgvzllfXENvJ5KKTLD63PNOaDSkVzqFQ%3D&amp;reserved=0
> > > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C3c38a4426c5e40581a1c08d8a64e2e13%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637442201999086534%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=LVh6NVTyid8M0%2FDPbBfJQ5%2BhuBxMKw4%2BK9u%2FSIkeaVw%3D&amp;reserved=0
> > > +
> > > +title: Freescale i.MX8qm/qxp LVDS Display Bridge
> > > +
> > > +maintainers:
> > > +  - Liu Ying <victor.liu@nxp.com>
> > > +
> > > +description: |
> > > +  The Freescale i.MX8qm/qxp LVDS Display Bridge(LDB) has two channels.
> > > +
> > > +  For i.MX8qxp LDB, each channel supports up to 24bpp parallel input color
> > > +  format and can map the input to VESA or JEIDA standards.  The two channels
> > > +  cannot be used simultaneously, that is to say, the user should pick one of
> > > +  them to use.  Two LDB channels from two LDB instances can work together in
> > > +  LDB split mode to support a dual link LVDS display.  The channel indexes
> > > +  have to be different.  Channel0 outputs odd pixels and channel1 outputs
> > > +  even pixels.
> > 
> > In this case, does the display controller output odd pixels and even
> > pixels separately to the two LVDS channels, with each channel
> > effectively be a separate LVDS encoder ? Could you give an example of DT
> > integration for dual-link LVDS support, with the display controller, two
> > LDB instances, and a dual-link LVDS panel ?
> 
> I also can't find any mention of the LDB in IMX8MDQLQRM or IMX8DQXPRM.
> Am I missing something ?

i.MX8mq doesn't has LDB.

The i.MX8qxp RM calls LDB as pixel mapper.

This binding calls it 'LDB' for below reasons:
1) 'LDB' is a shorter name.

2) Our internal i.MX8qm/qxp documentations do mention that pixel mapper
uses LDB logic and is based on i.MX6 LDB.

3) Patch 10/14 creates a 'imx-ldb-helper' which can be potentially used
by i.MX6qdl/sx LDBs. So, it will be a consistent name.

Do you think if it will be ok if I mention 'pixel mapper' as a side
note in the next version?

Liu Ying

> 
> > > +
> > > +  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
> > > +  input color format.  The two channels can be used simultaneously, either
> > > +  in dual mode or split mode.  In dual mode, the two channels output identical
> > > +  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
> > > +  pixels.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx8qm-ldb
> > > +      - fsl,imx8qxp-ldb
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: pixel clock
> > > +      - description: bypass clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: pixel
> > > +      - const: bypass
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  fsl,syscon:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: |
> > > +      A phandle which points to Control and Status Registers(CSR) module.
> > > +
> > > +  fsl,companion-ldb:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: |
> > > +      A phandle which points to companion LDB which is used in LDB split mode.
> > > +
> > > +patternProperties:
> > > +  "^channel@[0-1]$":
> > > +    type: object
> > > +    description: Represents a channel of LDB.
> > > +
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      reg:
> > > +        description: The channel index.
> > > +        enum: [ 0, 1 ]
> > > +
> > > +      phys:
> > > +        description: A phandle to the phy module representing the LVDS PHY.
> > > +        maxItems: 1
> > > +
> > > +      phy-names:
> > > +        const: lvds_phy
> > > +
> > > +      port@0:
> > > +        type: object
> > > +        description: Input port of the channel.
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: Output port of the channel.
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 1
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +    required:
> > > +      - "#address-cells"
> > > +      - "#size-cells"
> > > +      - reg
> > > +      - phys
> > > +      - phy-names
> > > +
> > > +    additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - fsl,syscon
> > > +  - channel@0
> > > +  - channel@1
> > > +
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: fsl,imx8qm-ldb
> > > +    then:
> > > +      properties:
> > > +        fsl,companion-ldb: false
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > > +    ldb {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +        compatible = "fsl,imx8qxp-ldb";
> > > +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> > > +                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> > > +        clock-names = "pixel", "bypass";
> > > +        power-domains = <&pd IMX_SC_R_LVDS_0>;
> > > +        fsl,syscon = <&mipi_lvds_0_csr>;
> > > +
> > > +        channel@0 {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +            reg = <0>;
> > > +            phys = <&mipi_lvds_0_phy>;
> > > +            phy-names = "lvds_phy";
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +
> > > +                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> > > +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> > > +                };
> > > +            };
> > > +        };
> > > +
> > > +        channel@1 {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +            reg = <1>;
> > > +            phys = <&mipi_lvds_0_phy>;
> > > +            phy-names = "lvds_phy";
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +
> > > +                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> > > +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
