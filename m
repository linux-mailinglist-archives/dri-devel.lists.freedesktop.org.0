Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE572E1B21
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16526E90D;
	Wed, 23 Dec 2020 10:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245D6E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLadow7fT26LyduZzeiBe+rWJ/G6OK57IE2vcJVVgDNJd0ZLn6kcVVNnJFb+EtNpWlMVBZlB0Lc6ceMyCb6szqGHq94i7eWvQWDmMP+96YEWftvTjb3CH1AiftTx5hhkcvYFD7q2H3t2ggWRwIF7e6mzjWLkuKDg4KUkUvtboZ7kBYO/1PLzEGFp40DXW1KsckQ3p4tmLs3DpeXOZVl0LinBRPpbcArxM03YziGrHhaOtND/EIecv6wWLJfcWtyL6cxXOpEBlpKGxcbgMsM6i2kzf78zCpNn+s0bMpA3y6QD6eeT7Piz2jI7ZM3dkAH3DGexKYWX9rokISssYorV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laojtXwu0QJXsLq2uCyyHI+Y85GCmW6FBoC04mAmbCc=;
 b=P6zjwhezM0xnXqmie1ZvH/weO+BAwYR8tFigPOJa8RQismzsVJVHvncKODoiksaVCm0n7ZXN/Ez/QEaweHwvkxTU1Uyppw+vD58wD1hGZgU7YG4Hp2y1FmXr0Iyqy312jusnhNWl29NerciDXLoDP+lEk8EiJuXQ0jHCbqh4cAL9Ch/yHDxYPaUbJN9C686tmMOWajen1wi5VNZLLrja8SLvwObEEek78O7cR5ve0tLY56/dyfybdAZrFBq8ZlxEhhOvoFlYdPeJBLNsB9WXzogJr/+PoAIh+xL6BDRU0GP2btJ9BNH/u0YkLjOEgUcKTcSwyZsIrjZkSEVD5HeZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laojtXwu0QJXsLq2uCyyHI+Y85GCmW6FBoC04mAmbCc=;
 b=K0B2nFGd6vV3ajG6Koah71a4GXW5sURSCwMlXgYMjOnX3WyAaIpabdfmEk/38s+hKj/mVISxJKTdLIV4lxSEWgozAyZLXHFEu8MSrcdt+bpOiH2HzokK16w3+OwoWpji4yjCQ8OvbQiS3SvKbZh/f3y7dlscU2GJ2rllf05spdI=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3950.eurprd04.prod.outlook.com (2603:10a6:803:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 09:14:27 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:14:27 +0000
Message-ID: <59b92081f2d1e80097e09a9498ef889935166f8b.camel@nxp.com>
Subject: Re: [PATCH 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 22 Dec 2020 17:12:37 +0800
In-Reply-To: <X+Gbk3uN870B/B7P@pendragon.ideasonboard.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-7-git-send-email-victor.liu@nxp.com>
 <X+Gbk3uN870B/B7P@pendragon.ideasonboard.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0103.apcprd06.prod.outlook.com
 (2603:1096:3:14::29) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR06CA0103.apcprd06.prod.outlook.com (2603:1096:3:14::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Tue, 22 Dec 2020 09:14:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b21d78a1-e7fc-4ccf-6eb4-08d8a659fb54
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB39503F95DAB70239D41B528C98DF0@VI1PR0402MB3950.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rkjW5RmiktL7hrOuaHgEcuLjkXVcp15jm9ncNs6/ZcuZvVtOcJmm6biOdE/a6FgmlghSewE+7iLGyISPXIaLjsCElqarwSxU23rVjF3enkqAOSjIBllRqs8FNskQo2Bm4Y1e+ahjgcg1zfnAdfFBlTiKboZBA6BayafQBAE/CLec4QevgyErokSGKJBvw1htJ32NWqy9yL7VcLnpIKizHpqEBeXX3CHZrQzELy3QrjZpZV6DxlvDyCdwaHMNq8wbBNf4Bepi/hrIW0w07er3ZiR7YarTcUeJYjogiwN9qitSUXPTmOsMzVB6kB2ysddE5HrLt1Dckx8WK7u41J8LijHap39rvRYaFzTJt4pga232l6Uhx6QgXBSZRCy/cfb1GZ7mgyqAZzqpGmUEOvys7OihwvPIs+NUAEV9fFmk9N474A81Bx17BFlKWgibmLkWlOlggHv+YBhTw2FLhGmvsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(956004)(8936002)(5660300002)(66946007)(2616005)(66556008)(6506007)(52116002)(498600001)(66476007)(7416002)(2906002)(4001150100001)(966005)(6486002)(186003)(45080400002)(36756003)(4326008)(8676002)(16526019)(6916009)(6666004)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2l2RWlEZEMwWStnd1FBMzBvODNrQXc2OHRGOG12UWx5SEFoR0hGd2xkVkUx?=
 =?utf-8?B?b2RkMG9ablBNWS9FbG55VHB2TzlLRkEzc2V2RVVTWlNOMUE0d1dheUwyTW1u?=
 =?utf-8?B?cGM2MytqM2hpZW9VU3ZIN2d3WkM0ZThneGcxY2VpY3RxcEFUbmgwd0tsSVVM?=
 =?utf-8?B?MGJQT0twN2tWMjZVd0JaQ0lFNllQT3BLS0NCSmJUUEZRWStGeDZyR0pFTTkz?=
 =?utf-8?B?UEJ5R3dMT2VlRFFvcXl0ZVFrRURaZFNqOUNjTXMyZVIxUm40U1dmK0NhWWpp?=
 =?utf-8?B?clpMVlBYY1ZRNkNxRSt6dVNubUFzY0tLclJ3czJPZzFnS3hYbFp5QW5Fcm4z?=
 =?utf-8?B?T2hJbFFFUnhsVm40cXFYSUcxKzh5TzdvVFVsOWNtU1pISjY2ZVdXWXNIYjB6?=
 =?utf-8?B?cWFJelVMN2RiWnpuay9ad2VPcWs0QmtJYnZ2RXQrMjBmd3ZpUyt2d1U3ZkJC?=
 =?utf-8?B?ZFFRY1Z4OHc3cWZDUU55NzNrSE1mekhVdk9GaWMyTHhzZjF6bTFnZy90dUh1?=
 =?utf-8?B?MlFiK3RIOXhoRXBpdTZka0hqSWRHU0NSUjZPdnd0U3lGVGdwQlBGYjhQNEZV?=
 =?utf-8?B?YU5XaXliN0VVVi9iMnlsTms0SG9hZjdqSnE4UmMzT1l0NmlkVWFSL1dlYmJq?=
 =?utf-8?B?WC9vRWs1U1BnRnBXelh4STRBSVJZRVRsYkxRQWthODArYkRQeWZPWlZoN1dE?=
 =?utf-8?B?cjBkRUM2V2ZpeHJvdDZORFl3TW1taHczRFNwQ0NKOXRQNVlQMW9BUHVHdjlU?=
 =?utf-8?B?RmNHK3dGSUtSYy9RU3lvbHBzcTZud0tXc0VwOEcrS2tMcDdacGNKTnd0bGo5?=
 =?utf-8?B?WFlkWktRTXpuM0hiOFZrWXN6QzFJUVRNWWF0amQwbEZKZkRSQzM0WDF3dis2?=
 =?utf-8?B?NDlOWkxiRitjMnVXN2UrWTAwZllnSjhwbWIrTlhnQmt1ZW5icCtnb2Joampk?=
 =?utf-8?B?Uy9GT0N5bEZFSGZRaXZ0MXRwVU9UY2tuckZrUzlPOXdDNzR2QmpLOFdPTENi?=
 =?utf-8?B?dE1ZZmtFaTNscFNwSldhdG8vL1FyclZ4c2xaSFF4NENhWTgvZnRDRDF2Y0Zy?=
 =?utf-8?B?STlPUlU2U09YQng0c1g2cXBvMGpqWjQwWFZxaWt3UFVJb0g2ZHEzK2N6OWFY?=
 =?utf-8?B?N1FVc0tTQ1hoTVROeFZBdUFzRzYxRTVvUGl2NDFBdW1uelIwdWFNSWdYMW1P?=
 =?utf-8?B?ZXp6WEJHZTdjSmNWcjVUNkp3M0pYeFNYcUcxb1V4d1pPdDlQQURQaEhEemZ5?=
 =?utf-8?B?dDJyL2JaY01wY1RraFQ5d05ndThBMUNlYnEyZ2VhRkx1UmxueitTOWZVVS9j?=
 =?utf-8?Q?UhJLPfoG+xzzf0tFbAcjBIG6Lw5frTZELr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 09:14:27.0860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b21d78a1-e7fc-4ccf-6eb4-08d8a659fb54
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgokr+v/OqZJfTy9hdzUk8tGEyCmxy72pNEwgdDvY9x8EzfA1KnYdzyxFbUIUjLcToCHcM9JXERGau5W9putcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3950
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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

Hi,

On Tue, 2020-12-22 at 09:09 +0200, Laurent Pinchart wrote:
> Hi Liu,
> 
> Thank you for the patch.
> 
> On Thu, Dec 17, 2020 at 05:59:25PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp display pixel link.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 128 +++++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > new file mode 100644
> > index 00000000..fd24a0e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > @@ -0,0 +1,128 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pixel-link.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C2a48e2bf99364191d8c508d8a6487e41%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637442177591124452%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=T0GTZ7sjDeVGb52%2Bo4V%2BgL5FZ0OVbJcf95F5fqzm9tg%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C2a48e2bf99364191d8c508d8a6487e41%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637442177591124452%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=k0gxlP9o6T1AORaXXGH9fW5o9EeOTFGPAEDjoltrEuQ%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qm/qxp Display Pixel Link
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp Display Pixel Link(DPL) forms a standard
> > +  asynchronous linkage between pixel sources(display controller or
> > +  camera module) and pixel consumers(imaging or displays).
> > +  It consists of two distinct functions, a pixel transfer function and a
> > +  control interface.  Multiple pixel channels can exist per one control channel.
> > +  This binding documentation is only for pixel links whose pixel sources are
> > +  display controllers.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-dc-pixel-link
> > +      - fsl,imx8qxp-dc-pixel-link
> > +
> > +  ports:
> > +    type: object
> > +    description: |
> > +      A node containing pixel link input & output port nodes with endpoint
> > +      definitions as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +      Documentation/devicetree/bindings/graph.txt
> 
> With Rob's patch that convert both of these to YAML, I think you can
> drop the references to these documents, and use
> 
>   $ref: /schemas/graph.yaml#/properties/ports
> 
> in the ports node, and
> 
>   $ref: /schemas/graph.yaml#/$defs/port-base
>   unevaluatedProperties: false
> 
> in the port nodes, dropping the type property. You will also be able to
> drop
> 
>   additionalProperties: false
> 
> for the ports node.

Thanks for the suggestion.

Rob looked this binding and provided some comments without requiring to
reference the new graph.yaml.

Rob, do you think it is needed for now?

> 
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        description: The pixel link input port node from upstream video source.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +        required:
> > +          - reg
> > +
> > +    patternProperties:
> > +      "^port@[1-4]$":
> > +        type: object
> > +        description: The pixel link output port node to downstream bridge.
> > +
> > +        properties:
> > +          reg:
> > +            enum: [ 1, 2, 3, 4 ]
> > +
> > +        required:
> > +          - reg
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +
> > +    anyOf:
> > +      - required:
> > +          - port@1
> > +      - required:
> > +          - port@2
> > +      - required:
> > +          - port@3
> > +      - required:
> > +          - port@4
> 
> Do all DPL instances have four output ports ? If so I would make all of
> them mandatory, as they describe the hardware. They can be left without
> any endpoing if they're not connected to anything.

Yes, I think all DPL instances have 4 output ports and some don't
connect to anything.  I'll require all of them in the next version.

Thanks,
Liu Ying

> 
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dc0-pixel-link0 {
> > +        compatible = "fsl,imx8qxp-dc-pixel-link";
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            /* from dc0 pixel combiner channel0 */
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
> > +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
> > +                };
> > +            };
> > +
> > +            /* to PXL2DPIs in MIPI/LVDS combo subsystems */
> > +            port@1 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <1>;
> > +
> > +                dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
> > +                    reg = <0>;
> > +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
> > +                };
> > +
> > +                dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
> > +                    reg = <1>;
> > +                    remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
> > +                };
> > +            };
> > +
> > +            /* to imaging subsystem */
> > +            port@4 {
> > +                reg = <4>;
> > +            };
> > +        };
> > +    };

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
