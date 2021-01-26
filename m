Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F43055AE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F8B6E5D1;
	Wed, 27 Jan 2021 08:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80077.outbound.protection.outlook.com [40.107.8.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1323F6E055
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 09:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXMDSZ7TIXr2kYGKj0tno/4Zw1DFpeR8itrr+96gHKezIrKWy+CfmlFIrRZjuKAnSr3famFiCPBgsCKkhZ3BZRNbEpiBAZJYmmy4ImHC/zwX6mEkiKGfrjHKxVlbdVXoLeY8nl6dwZj3S5EcLncZ1Oib22SZteLv62V3IrBOkxKn3mSjEm+OIT7CjZjQsnc+lIc1Y7o7mVIZ/Zu2VYfbrcS0knr4yTYIt03WCmvQskHRG64u7gFiAxrvmjbXL6PHiUyAV1aqtF9PnYsxgnNsNBI8votoKzrTw1SPRPDhcqBEYXVbiBuwTDymvv9Eeqecns9/2nIL1x3C5sSDjkirow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQdYn1JdqkH7EJfZtIVXwZDBsvewaVHNQ/W6We4jDjY=;
 b=eYhmBGwojPFhRKhcnG0wtfSd6g4n/zF+RnsAGCuIEh7MXN5N1LP2f2hy/SyHaQYsVYjUy/RYaPzD5SbIlE3/iLm8GUXhRCocGKB/er325oMNLsCAYxfmYviPy376IDLOy8mGFeOcld9V3d4XVo6kEoesawDwn1oeCMbxldFTTKwIj51IzGc2gBkf0hwLiCuR0ZpuiyjD0+shynjRKIyupOz3LXXtv4nYXJZRY16COTSNuODy/70+UDifeGOrzRIWorsObVpTffca1npqrStGIDYpB+G+QIsJL6qL6smpnXOlV392MDxAGtV9V0DYhi/F/VZ/KTG1yzBCOkym4FPZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQdYn1JdqkH7EJfZtIVXwZDBsvewaVHNQ/W6We4jDjY=;
 b=GV8i22dlkxGJOfRf/95U6I+oC545pb9BHnQ4KZisi/6muRMfRMqZINK2nr9+0jLrj1fbIiHm801WwiA91gopNksO1/Qer2KpyK50KTJtAwWZl4W3pg5qZkl9DfNWIEP8iqGpAx3f8dcBS0uqQryK1MEa9wBM3qaAHLxAlkSFq90=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com (2603:10a6:209:50::12)
 by AS8PR04MB7878.eurprd04.prod.outlook.com (2603:10a6:20b:2af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 09:04:31 +0000
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::64a8:cb73:cfb:1674]) by AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::64a8:cb73:cfb:1674%5]) with mapi id 15.20.3784.012; Tue, 26 Jan 2021
 09:04:31 +0000
Message-ID: <1bf7a341d5c09c8f3b535f6d3325a68cd3aa4fc3.camel@nxp.com>
Subject: Re: [PATCH v2 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 LVDS display bridge binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 26 Jan 2021 17:02:50 +0800
In-Reply-To: <20210125211910.GA1004310@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-12-git-send-email-victor.liu@nxp.com>
 <20210125211910.GA1004310@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To AM6PR04MB3974.eurprd04.prod.outlook.com
 (2603:10a6:209:50::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR03CA0089.apcprd03.prod.outlook.com (2603:1096:4:7c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 09:04:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: df51b692-e3a3-498b-0395-08d8c1d9646d
X-MS-TrafficTypeDiagnostic: AS8PR04MB7878:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7878DBBA1C551A59AAE7BBD998BC0@AS8PR04MB7878.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtR+SRAHwbGE9jdnMFA2Lr1LUUwErLL2XCadxzyXNKz+pT4onzuZG2dHu0CGz3wZBOliiK7lrSTMck6rTRjeOFrsJDgGeMNUOOSQ8wCHa+4KkejqdOAtr+ZZKznDjBW2JafTILcylrta9MKc0PQHL8LNvZlPRR8y+1yFHRBbfMXE0+fyToGWGGpfwzFuYoNRad0l2lWqKWFWF2AyfyT6igUqasAGX/oLezHMBOfwT0Q58k86onNkQVaiOelaE2+Mf/YZHPJ+jVlsJchwxTWUIlr1H+D4WWTTN0+uxGNejXdHcOARySK4XBAox6XPy0H58kvXfZeVHLymLFXW6daCJR9g01QaNIGathZ38hKNU0ki2JOiCLm4TVZkq7KMGIRij4okhgTAyYOdwrSf5ydklt/IeNxH7RfQVbL0hIhz9rMPJbUZ2wIsr44wmSGSIOBvhiBQIIH3olj9eBQdKfhU02zjAV/aAHNydqfDljwh7rqKfmwvVeEm56ufSW8keEHJLdXnj9Wc13k6BPZL9z4Vp+xo5TXgGgZ5UqDECg4lLGjB8ySwBfL3nMCdxb1HAZXS8LJTxdh6MXaTuafpwnHtT3zKRLY4XNtgrGxGZGRIx8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB3974.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(4326008)(26005)(6512007)(86362001)(52116002)(8936002)(7416002)(66556008)(66946007)(36756003)(316002)(2906002)(478600001)(966005)(6916009)(6506007)(8676002)(66476007)(186003)(2616005)(956004)(6486002)(83380400001)(6666004)(45080400002)(5660300002)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGhWaXp5YU1tekx6c1VESVJvK1ZQOUdqZzk4QysvOURGOW5abTBjKys2c1Jm?=
 =?utf-8?B?NEhGVzBUeEdpTjZBTElzV3JLYjU2TWNaTlJseWd0MEZyaWZXRHpyOVNUcVNk?=
 =?utf-8?B?K3l3MllnUnVJWFNDQUs5Qis1Zm15d2lkRC9XajlvQmgzTVljRm9KaVordnRD?=
 =?utf-8?B?bk9QQ3VOZGFDbE1jZGNLT2tGZkxCMkdWTFR4M1hJdDNVaThJNVpHUThQUzVj?=
 =?utf-8?B?TmJQTW5lUndFaDlUdXZvcW1RMXh0UWtZdEN4Znc4OHQxNStHZEZXenUrM1lC?=
 =?utf-8?B?Y2MybGN2WHFodEcyRTBSUUI2RVcvcGh2TzJyU04vRXFiRmg3N0x1cmlQUEhR?=
 =?utf-8?B?OE1uaUJVM1FrMFpVdFdGQ1NvYm0rMFhqTEVEN0tJUDNCdFkwUDlzSUtmOUVJ?=
 =?utf-8?B?ZUVVcytLek01Nzh4N2JMK3EzanlFRUpHK1VERHJlRnFGYi9SWGhVQ1YyS3hD?=
 =?utf-8?B?ODhmMm90b2pJTTZvcVZBNHo2S001N0JWdWFSZDJGYURpQ3I2K0RNdFAwdnk1?=
 =?utf-8?B?MHU5eEFuWDdLUitGTlBra2JTdWxmMEFvU0ZiRUxOTDlSb01FeXVsalloTEU5?=
 =?utf-8?B?TnZveDBlRnUxdEFkQkJlVlNyc1d6NUNrTHhsdERSTXJvVkpUWnpsMWdNUW52?=
 =?utf-8?B?S1k3MHlUWUN0K1VCdVNPQW1GYzdEVlNKeXgxa1pFZFQ1elVsS0h3aVQ3WktS?=
 =?utf-8?B?anZPTHNGL3l0NlFURUp3cFAvWkY3QWhQU0pHamIwNjdtbW5id3hnWmlJdWJM?=
 =?utf-8?B?VDFnZ0VPNzNscGRqNERKODBTOUJ1WmJSRkh0T1RBS3JyS01QUlZTeWk1TTFq?=
 =?utf-8?B?WlhTQ09CQ1Q3TWxuUVVXeHZRa01Qdk5QWGRHMDBuR1lZZWgwVWFOdmk2Tmtv?=
 =?utf-8?B?MVVnMEVHVmVLL29RcmFhWTRhYllvNWpFWEk3OWFFY1hEUGxoQjZ0THNEdkRj?=
 =?utf-8?B?N3Q2QTZ0MDdmdTlQTHFVT2xTeUhMd0V5TGxvTFNDdEVFeDlGd2NieS9FcEtD?=
 =?utf-8?B?MzZXUEVCV2xrSHMwWm1XbE1NQlBZNDBGOXFSeFgwYUR2TUtUdkM2bWgzdjJ0?=
 =?utf-8?B?bCtIQlg5Ukx2MWtvTjZLNlQ3TWdNQkRYOStaTUhFUXNpaElDcEdVNkNOaWFH?=
 =?utf-8?B?N1VmZ0taZDBpSEtjaUdhS2N5djdMaHN3VS81b1BiUWFiWWQxMklualhpMkFr?=
 =?utf-8?B?UnFYY0RhbGNyRitDb0xCTTZPcGh1K3lBVngrR1JBOXpzU1ZOcUtQZDFJc3Vv?=
 =?utf-8?B?U0ZzNXJYQXZzNVIvZzdkSTR5TkM0WTFSNDE0WnVvMWpjWVBOcWdTMHI0d2sr?=
 =?utf-8?B?Q1N5d3JtTmVrbTVJTzY4S0pRSXBRTytIV2Naa3p0cU5TNE82MkdLbVUwbW1Z?=
 =?utf-8?B?YmZNbTNOZFIxd2g0ZkVKa0w0NmhDVDRCWnNIKzRFOWRNeGpQbUEwVkxIQWJ1?=
 =?utf-8?Q?lv0KEKVx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df51b692-e3a3-498b-0395-08d8c1d9646d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB3974.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 09:04:31.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vohRGquFyyiGLVrjLZSbguLueBkgojvQ/Dj0MlQjJQ5fzHFQpyRQlMgoIxSr0EpRve6Q6UgJdUREnLDygwMAkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7878
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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

On Mon, 2021-01-25 at 15:19 -0600, Rob Herring wrote:
> On Thu, Jan 14, 2021 at 05:22:09PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v1->v2:
> > * Use graph schema. (Laurent)
> > * Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)
> > 
> >  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 176 +++++++++++++++++++++
> >  1 file changed, 176 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > new file mode 100644
> > index 00000000..514ac90
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > @@ -0,0 +1,176 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-ldb.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Cd0b03e396918477bc51d08d8c176df8d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637472063608912397%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=utcLOZodmKCEAcBi8vuTHpqiDrRqlia09LpcDDT%2Bm1s%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Cd0b03e396918477bc51d08d8c176df8d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637472063608912397%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=aB4XwL7EjuHcIvbPJSUhzyqizpiUA2%2BOenkWmcpIkX0%3D&amp;reserved=0
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
> > +
> > +  A side note is that i.MX8qm/qxp LDB is officially called pixel mapper in
> > +  the SoC reference manuals.  The pixel mapper uses logic of LDBs embedded in
> > +  i.MX6qdl/sx SoCs, i.e., it is essentially based on them.  To keep the naming
> > +  consistency, this binding calls it LDB.
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
> 
> Again, seems like this binding should be a child of the syscon.

Will do.

Thanks,
Liu Ying

> 
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
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input port of the channel.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output port of the channel.
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
