Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F82E07F3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029BD6E842;
	Tue, 22 Dec 2020 09:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0779B89AB3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 03:10:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh5eHFiq24clN2YkOpNV+IBm6AegTdzsqvLZ++PpIK/hPvq4vWLVno1/h3w5fGnTuEy5dR5J5O+ltJCs0x6veBxjm5gZr+vSyqucHB/RuN3h7TyauXfAQlTl+HMG4gjOvVqww9Pl+IaaQV+7TPbn0qMZaG1ceRvfaMtACvCSkGBTuDlZoP6iFwxsJE4Xk+73qGLece/Wy1Bj9IetOcO5Z8U4dI8dHPPfHSFgI9f7rRvp4tuvNRKrM9kA/A1uYNrvfK1gElhOWqJavDu4e4tog3TYz1Cx/5pfKbgyCEcuhKdVOI/wbvT8KL8Scu2eP740PjuZEnfiPipC4p7aRZk1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fvi3zyxbAFRqpB0ykgtWFL9tFmNGVUJzGRb6TCh/x+E=;
 b=GJFOBJ3df6qGfnCmDePBvqnsC/oWgihvWt0nutEPTcXpB2nkFJxelRNszDGPR4QYmXCGH4kTrI6eg6bnOdQLYEa9xJwn2hdy1AAreQG0KHI2GYxTUEcOSLop2GOtjub80m53E+nfF0SneyzPByb3cOSG+wrkLiLrHDsYPxt3y4OUFYiNlgKrg7MRLgdfHGhc/VduGIdG01RmLin7c1o9+ziAj4X80lxBGZ/tvuOSEsYU0/uPu2+4hdToNq+y/lIsdx0tzxIF2aWXXqRGNT4Fz7/TagMeIeA0ozzAJxtMkuDeGP5i1p8OgwtLDjf/+FYJe3rGDbGiTMe1zFxK2V7XSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fvi3zyxbAFRqpB0ykgtWFL9tFmNGVUJzGRb6TCh/x+E=;
 b=SMgnyvCBcoe9nw1zYqKopA8TRYgJI8ESDtG49UEyM6utczdFCGZi6qmkx/NnV+V9eZ+bO3f5RJ7Jdzw56giF/BTewR6VThNmls9Bu6S+y9JXLRbhH5MEtf3YpokM8NOQw60r+7qVsgfDJNLDnM64uvf+NfdM8nItVEtBOuRJHUI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 03:09:57 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 03:09:57 +0000
Message-ID: <7e808e05b79b4730b99da868c9255c3b76608f3a.camel@nxp.com>
Subject: Re: [PATCH 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 22 Dec 2020 11:08:06 +0800
In-Reply-To: <20201221223140.GA687317@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-7-git-send-email-victor.liu@nxp.com>
 <20201221223140.GA687317@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0090.apcprd06.prod.outlook.com
 (2603:1096:3:14::16) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR06CA0090.apcprd06.prod.outlook.com (2603:1096:3:14::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Tue, 22 Dec 2020 03:09:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b704294-e95a-4a16-7093-08d8a6270fee
X-MS-TrafficTypeDiagnostic: VI1PR04MB6813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6813132527A65966AA75EA3098DF0@VI1PR04MB6813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzhSLNBet+/PVjlG1mVuR0w3H3RKT/H0S8qcb9f1D4r4gGKXJxaw5AU53NGOyEoKfezez+GE/R8pM//jjLC0Bi/hrJPKbhTvBYVkigj8k5FZ5RH/GYqmMh2Q8tA9wnyMdgyVlV/0XaxBq8fXvhwmN9T9irbcNHlC227FM5s+k0TUu1yWGH0kEjnPe2HX8rblEyLbVhIBhhUeezvuEenqadHC+AZaX4xfYwpz31X8uUYpY7KfWPMDMSxW8KnzW/fAIOWKQacCAT4jgn8FQIAO7Pxng/aL91VxLXregqBvAQ9bUvhXORvERh+vrDQNA3v8qux1lmdRh/MNCI5P1w32/t5J0N0FGbIGHOVPJ7GRygTRSNrcsXU8RZ1OAo/UEFDOk3YcKAqgj8tnNpATj89/c09EvjH4aww7ioxl4B6Q39aIkPqFoDh6I1yBqPEbVeXFkYixTz9tW1F8kIV9MMpGWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(8936002)(956004)(26005)(5660300002)(6512007)(66556008)(66476007)(6916009)(2616005)(6506007)(66946007)(4326008)(45080400002)(83380400001)(7416002)(316002)(478600001)(52116002)(8676002)(6486002)(4001150100001)(86362001)(36756003)(16526019)(6666004)(186003)(2906002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TVN5VFdnaExDdnZRbXZjdDZ4NXRDWCt2TVVrS0JHTzVHL1UyZWZmMm1ic1dO?=
 =?utf-8?B?QVNkeTRxVWZyaDArM09Sc0w5cnUzWC9KZDJLcDN6RmpKdWczMno3bWppR2tu?=
 =?utf-8?B?RTdERGNPK3QyTXpZV2xmckdUSXB3RzJqejRhbCtmK2VDQmxQRU1nbmZvSEJT?=
 =?utf-8?B?SXB1ak1kMmxTbXc3OVZGOXpwWU5aN2NPMGZ6WWJjK3h5VzFtWDFlbWpCKzV3?=
 =?utf-8?B?VjhlK2Nlaml6RzZLZ2R2dVo1M2J3WHlheUpDSmt1OGZXMmZ0dWtVWVVXTklB?=
 =?utf-8?B?ZTlRZHdPK1NoTGFCZTBzWFk5aVBhcm9RT0NNOTIwU3QzMGV5bm1ZK2tudXBQ?=
 =?utf-8?B?cHFzS0J3TzF1dDFqWUZOUkhwc0V5ejVrbktZY3ZpOFg2Q0lISU5pNWxJMGgy?=
 =?utf-8?B?YjBXUkszekhOZGw2ZG13T2k1S2hYakhNQWlhVEY1KzJvd2pXUHdrb1VIb1lL?=
 =?utf-8?B?REc4OHBjbWZKc0VYSE0zMEIybzVzdThtWHk2Z3BTbEU4azRaaU9yRSt2NkFC?=
 =?utf-8?B?Q3FRMjR1WENUaVovZEM2UHF0cUEza1JpZCtyZzBxR0xreGdORE5SZCtzTStH?=
 =?utf-8?B?RG5TeHZ2Umk3NWRWWVY2NnY5d1Y4cVUvSEJZNUpnaDdGbmZndjRPdnk5OWR6?=
 =?utf-8?B?Yk5CNDZBbkRITkJ3aWJDeHJPRkorUDZ2UmFUeWwvcGozVzBDNWxQRC9VRmZh?=
 =?utf-8?B?MnJQNnFxSGFvekVVZytKalZMdVJpN29DNnlXUmdXTUlkaGYyL29uc2I4K0d6?=
 =?utf-8?B?V0hXOWExVkJ2a2tNRmFHeXh0L0VxZkt6RWFIdkpKczVSRGZJQm9OTUs3TExn?=
 =?utf-8?B?Zk5KelhudUN1c0liUkVIOGMydVhpRHZVNm5peSsyMWo1eDIzWUlyZTRwTFJq?=
 =?utf-8?B?S2IwdE5hSDMxZTRlS1Nxc1paekhLbXBERE9jYnBTMmo4YVVRQkJnRXhLK1hF?=
 =?utf-8?B?QmhYbVBjN2RocWRlMDZqSmJmR0VuTUw4RXZPd0RIZVZNcXoyMjQ2OWZpWHJF?=
 =?utf-8?B?Wm9oRGxCRUhUazhwM3E5SDYwZlh6c1NrVHU0OCtsNFdCMmdOa2RvYWpNSTZH?=
 =?utf-8?B?Zys1Nkw0VDA5eVQvdzJXSDNlK3QxL2xCTzJsS3RId0grRDcyeGM4TEpQWEJz?=
 =?utf-8?B?aVRMTXk2d1l1Y0pZUlZIYWx4aE92djhVUFZLWTlDMFpETkEzVUliNGVrc00w?=
 =?utf-8?B?cnplNUk3WkxqVWtVYkNOdllFUHFEN0g3UXNBSm0va0xFRE5rTnhxYndkY1R0?=
 =?utf-8?B?WWhsUDVIcFhjajNUcVAyOTFpNEphbGFXRXp6dDhOMmx4MENNdmFtS3E1QVo5?=
 =?utf-8?Q?B/haSzvNYHcW9c9Bw3OuHOr2EuKjZxoLa8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 03:09:57.3535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b704294-e95a-4a16-7093-08d8a6270fee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Qoe2GX5gWcc+ABZVJprwfZ8a11D7M9gTcbXwvAeMllqVOz3G/r8l4o+xHgPMSmwjcRbXVfFMULg+gubvZdTXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813
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

On Mon, 2020-12-21 at 15:31 -0700, Rob Herring wrote:
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
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pixel-link.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C2c8f001f28de46450bba08d8a60032d5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637441867070310997%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Qg5M4UJqHKJy5W4%2FB2hOpeEu8mHtp8rXcyN35TCUukw%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C2c8f001f28de46450bba08d8a60032d5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637441867070310997%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Zjvx9NBDFvqBxXqJItSP6smPdWsQUFYssJpNyVr48uE%3D&amp;reserved=0
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
> 
> Perhaps some information about how this 'device' is accessed because you 
> have no control interface.

The i.MX8qm/qxp Display Pixel Link is controlled by SCU firmare.
Will add the information.

> 
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
> 
> You can drop 'reg' parts.

Will drop the 'required' parts for 'reg'.
Also, will drop the '#address-cells' and '#size-cells' parts if no
objections.

Thanks,
Liu Ying

> 
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
> > -- 
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
