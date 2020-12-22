Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4F42E07FA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E92F6E84C;
	Tue, 22 Dec 2020 09:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2726E830
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3gU8lgVz+fDLdyD+1wvqif2FLO2lqZ/V9KX0W6LD2cPq3/HaSeCB3soXER65CNj3r7wo39goOyBbeUn+0mz/Qor05hPw3zCxPJn6UpQUkyi1SwOGoFyItEmUK1fSmSEg8sUGM746oWjLllzDOXN07LMPP4dtE3CM100H1x3n9dt/o2Nc6CrpSZkJREVzgS4eLx57nXZMEFOarDJaRCuXbj6cb+SgarWmxAssXqY8G8nWYmDEKqsZ4Ffz491x1ADiqMZhnZoluN5NtC+7qxL/wWTphFYLew+CzTz4lSWGK+kjKeioC+Dokr0gkSermNWcy6J8rfYnCsfE0PNfY5RLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8kIXqR/flt5c7NhFDQ7KbDKjeoRK0DRfyIkjUCHWTg=;
 b=lYrXc1ZPebuGlkRRQ12WhcdLl8uO7ctwAt1yvn4oQpntVKctGxEu8LVDjGWN1R52BruWcn97hsw/j8T9h1xFd7QFXchomYZ9/74j57OHIfIt35BGF8Xj0ZAUVv4A425ih9lKlie3Q4Ghb5CXwaayV8+Z7ulR0FIk2k0bbxeiA7U0/C69Pw8YG1brBB4Nd+4wJdzWIgm63BlE4dmO/EENKWm6X6IqGnG4eA7wxE7HV/4He9VHvAHslBzPmxafT03evi+epKYT8vjkvcbYJc1OAoJOdUSGEhsJTsgfys6+SRYqfliis12ZNtMfQZmZdlsindzQqtUFKUCSXegk9HVEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8kIXqR/flt5c7NhFDQ7KbDKjeoRK0DRfyIkjUCHWTg=;
 b=NEGlPZEgdndsoDgLusGq3L82sX3pYGrhI4PW5jyhORJ4jABCEaPEGT0DPtUOasyFuRE5pp4T+nLO0MZUwRNMjCl4pXdPnGsqQ8vbJpgrG2Kf0d5/xfURVu39B6bvPKbvODGrm9r+UFyxmXGEK5xtvvOkyxplaPS3Ok+1eMs+2A4=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7070.eurprd04.prod.outlook.com (2603:10a6:800:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 22 Dec
 2020 09:02:18 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:02:18 +0000
Message-ID: <f80179f0d7be9d1915a53184523b87e9f320246f.camel@nxp.com>
Subject: Re: [PATCH 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 LVDS display bridge binding
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 22 Dec 2020 17:00:25 +0800
In-Reply-To: <X+GiA4LqJTQR9vrz@pendragon.ideasonboard.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-12-git-send-email-victor.liu@nxp.com>
 <X+GiA4LqJTQR9vrz@pendragon.ideasonboard.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR02CA0107.apcprd02.prod.outlook.com (2603:1096:4:92::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Tue, 22 Dec 2020 09:02:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6749a2b6-d1b5-409c-1e5f-08d8a6584919
X-MS-TrafficTypeDiagnostic: VI1PR04MB7070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7070BE30829D577C954F027F98DF0@VI1PR04MB7070.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G1f4NW/0m1Z528uLxsKsySLORm60YysfPhN8/fzD4dLw3+sobacCXGxb87gDKOoCrWENbZD3rmpZaGdtG8QpRUdIdD+bPRjD+bOKioVdmBaH3CU4jex92FOrydhmnhqsLf9zrkDA+m+kLcJTl6hogzSQ9Nc+qhMdX7fJSUQsvhbYRSWtDAQvypKVaDQWe8+Jf8vFcsag4XbAmc/6WDuarSTqriPXOtTYhIFdWXFfp7wLonZF7C57j3t6nMUX4+6EHwr8cZsQjk04PZAAWlroHgKpHGY0Uu0lU2nSLeVsK9BOSHyUAl+gJfTe1tHxnDZozxziq7CPUA72rpTnzd+JEq1v5YZsmFxkJgpGB0BbD52xtrquvrqloSpcMV01h/4IuYF5TaYkYgKLYooHA0zyTDpCp1P53zagPI2Ub2UnfpISN6eLwTc9yUCwjUvpIH7XkmfZ9l51o5r8kgy7AiIUuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(52116002)(966005)(45080400002)(478600001)(2906002)(186003)(6486002)(956004)(6512007)(16526019)(6666004)(26005)(5660300002)(8676002)(2616005)(66556008)(66476007)(66946007)(4001150100001)(8936002)(4326008)(86362001)(6506007)(7416002)(83380400001)(316002)(36756003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXZBMUVBUWRmWjRoVzkvRTc0MStwVXZZUlBhTnZ4ekRZWi93RkJCSnlPWjZW?=
 =?utf-8?B?dXRLMUVXOUsyRHhQSFJHUmh3QmdDbnBjcFRKYVN5d0UzU1hlcXB0KzYycGxj?=
 =?utf-8?B?WUFDSUIzd0c3L0JQRFl4bnVhYk81eVFoYUZneGg1eWcvcWRndkEveWpmQlRj?=
 =?utf-8?B?a2NINHNZd1N3UEY4elZnRWRhZGRSVUliUGxXRHJLREdoMWRKSmcwSmlPclJQ?=
 =?utf-8?B?Y3RoTGpMTlM5bFM4K3BsMDg1TE1ZZkVVSUZpSE9FNkN3LzNoVDJGUTZjRWE5?=
 =?utf-8?B?cVlYQXZZbzBYZUwxM1lFRXJFamZCdEtCUC92eUNwRkhGQkt3VWJWMVgvWExi?=
 =?utf-8?B?NC9yOHprQ3FpWElwYlVlUGlPY2x3bDkvcnlyMXNoSkNLN2JaS21sV3Q2NE5R?=
 =?utf-8?B?Qm5LVDloRVluUWh0UG5Mcy9MMkh4VCs5eXVmWmtiK25NL0FGUVNQaTlVRUJV?=
 =?utf-8?B?TFJDczgraytLd041TXZYL3Z3akF4NHozQ2FQWGNObXVQc1gyL3BwdHJZYUNp?=
 =?utf-8?B?dEZsUk5XcDVaSFdMcG1lUW5FNHN3NnB6eVVaVDJNOVFoMHBETUZBMFh4RVFL?=
 =?utf-8?B?RGYvbTlpTU4wMm55VHRsU1MrWmxkcFUveHBFVUNpM29zY0JxZVI0ZjkxWkN1?=
 =?utf-8?B?NldpazA4aW43RENhMFV4R0Z6MVZTRXIrSUxSc0V5T2NuakE0M0VRR1pxOXZi?=
 =?utf-8?B?cE5FZDBJUVpkeFpkUGRDUWFBMVFZd1QwczNQYStQa2hRWFZrNDAvYVNYSUxj?=
 =?utf-8?B?dUF5M1o1U082Mm4xSFU5Nk1zNzh3N2U1RFc4dEYrU3JoL3E2WVBtUWs1dmdq?=
 =?utf-8?B?OXBZYStickh2R04xZ3dTcm5LYnNJaUhCc0tiejZuMGVYWXdWbldRN0JNeG4y?=
 =?utf-8?B?VHRTWjNQbWU5VHd6YzdEMkxXYTVaVmtMUWwvdmlRdlFSZUNFOGIya2w5eVIr?=
 =?utf-8?B?TE1mUTNWZnlPbW5KZm1jd2hqWUl2UmVHR3Z2ajA0RER1c2NWdVdORlRMdEhZ?=
 =?utf-8?B?SVlGVjVPeDYrQ1pkbkJZdVl5SEsxVm9qelRTaytYb2VxeEJNTk5CVTZVMzBJ?=
 =?utf-8?B?YmN3S3lLYjlUK2o2a29tNGtvNkZJaE13cGRzNWs0ZitMc1ZYSUFJYXQ4YkIw?=
 =?utf-8?B?NVA2RUdjdnJHdlZuRkIwNXJUbS85Vi9nY1Y5SGxzUnBaTDFMQS9Da3VRR1oz?=
 =?utf-8?B?WitnK1V5dWxEZnMwNmFMcmR2dFk1aWJCaFVQRkFKdVNnYXQ5dm5IYlZLVzlR?=
 =?utf-8?B?N0Z0SXYycFN1NEtFaHFHTm1YVHZJZHJKVVZ6dThkRHZlWWh4dDlVeUNhdko0?=
 =?utf-8?Q?BqZMxaD5DwnEH+NiWKV7yLEwyKveUCDE3S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 09:02:18.5351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 6749a2b6-d1b5-409c-1e5f-08d8a6584919
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFnhJOj9w3wNLXmYWZvFF6MrTWQapz+e0fBbc3pohDjzBJVfbjdEyz7nLlQtoGPXV9p/QHGafEpwb8bS+tEodg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7070
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

On Tue, 2020-12-22 at 09:36 +0200, Laurent Pinchart wrote:
> Hi Liu,
> 
> Thank you for the patch.
> 
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
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-ldb.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C8548efc7a1cd47907a7f08d8a64c5570%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637442194086922596%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ejDrgwOktws%2BdElmBSyvKLws1Kx3YvPSfFDFghvpnaI%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C8548efc7a1cd47907a7f08d8a64c5570%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637442194086922596%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=lM09SU3NM5A3ogCzoOMowF%2FCdIOQrQO%2Fhoy2kUQZqYg%3D&amp;reserved=0
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
> 
> In this case, does the display controller output odd pixels and even
> pixels separately to the two LVDS channels, with each channel
> effectively be a separate LVDS encoder ? Could you give an example of DT

The display controller just outputs frames without odd/even pixels
concept.

The frames reach two LDBs through pixel combiner, display pixel link
and PXL2DPI. 

Each LDB would split out odd/even pixels and just use either odd pixels
or even pixels.

> integration for dual-link LVDS support, with the display controller, two
> LDB instances, and a dual-link LVDS panel ?

https://pastebin.ubuntu.com/p/HmzxV6PpvH/

Liu Ying

> 
> > +
> > +  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
> > +  input color format.  The two channels can be used simultaneously, either
> > +  in dual mode or split mode.  In dual mode, the two channels output identical
> > +  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
> > +  pixels.
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
