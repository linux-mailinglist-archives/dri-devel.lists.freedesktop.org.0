Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8022B5B45
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1466E13C;
	Tue, 17 Nov 2020 08:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00054.outbound.protection.outlook.com [40.107.0.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF0E6E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 01:46:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeEqpB9xUC/NlDllHw5A1xwLRLKU4FfzRGWDRCHWyvy6is4bubT7hRYHIy8Mms9LeQeQUfrWjSfBcFQKnjG4PO7K9Qfv+XxoQx2qHUvLaFzx18+nZ2hXmlNRX7/djNkrwb4unqj11BECtm1sLkpb1az/gUn+KRTWJB0uvPZxgHuHP0QASjm/pC98wy8fmtVQhiD6ytg6S0nctdC6evucew0QzSAij/I1M/M76AHt/eSRePnD3A+1SA2uGK1IIZtbswttRm8tSTKCchwMW6QT1MqJ7JE/8tqo+iIc5hHMpVKCKoqXAexET0b9aofK+uEJemh66Xnjdw2Im98vBM40gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjrcQmZihyau4ZM1AHExasE3F2gTN3fn21wpc7hpGdw=;
 b=a0D/RYsuBVnn1QyIg0+ve7jtkafikXpc1Tmlruqm50EICGHN0lBJyx/p0Chk/enqjIvMQrjThPjd5+gdkZ5IReE1BQhIVpqBJUzeUaGHJtDc0nIVS3V8gO7aXa2vpz73X/D8SuUHWMEcUI+BQeIyRtsCPcdOI6/vvY8AT0yGXmtrDvw8/blCt5HjaoehqyrXzDRGaga7Ya+A8VqazjxRerN/qsarb7Gd4V3qdv+yqrGs7Wpi7sJWt1rssxiiUDLHu+8tBPc/q1HHlVsTJpgHhuTW6zaYdow9+wcf4WF9HUAFRnq4mj+H1ejHwD6DB9hGasWMA8M2ovUvxt/RhLGU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjrcQmZihyau4ZM1AHExasE3F2gTN3fn21wpc7hpGdw=;
 b=KNrVzNQxqyUa4IzSnAn7BX5LdcZHmKZrEeYMSsl4mAT9OBsKqHP/+3meQWLtUEjUyLzDLymdUE8u3tyac+mH/70UZFyFCsAQmkKUr4YVbStQfNO6AOd1dsxkjETbWUnVqghyXztMYFaEGJ42kwvHZRlVywgkd7Wdm6rnVNauZEE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 01:46:47 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 01:46:47 +0000
Message-ID: <03084845f931181a31dec2a06a36a2df828c6cfc.camel@nxp.com>
Subject: Re: [PATCH v3] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 17 Nov 2020 09:45:04 +0800
In-Reply-To: <20201116192345.GA1985442@bogus>
References: <1605161831-10740-1-git-send-email-victor.liu@nxp.com>
 <20201116192345.GA1985442@bogus>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:3:18::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR02CA0037.apcprd02.prod.outlook.com (2603:1096:3:18::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 01:46:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20fcdb8c-ef6b-40ce-cf39-08d88a9aa505
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2816:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2816C55DF65F903FFD98E35098E20@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9druN+FdfuRNkSGi2U9ZY3tiPTZ0DKpsNCCI3vB7JmBN4g5xZcims6QUPAm0Wu+WYRbcJBcJ8g1iYqnWCDkhSjPTPzeAUz05Qa05/hExloyk+yB8mzoIYfCwujKhlH0g7q/mnB7AHTHyQ/Vqxk4+atnx+jqQMNaWTjHe6MYnzvCBGBI4VBU7krWFFGXoIrzjeknZ4tuCxjZiiRK1aYBzjG2AaI3H/m0F2CAbfrJkoIxIv0dSWUkEFjQ9hZIWINZjk5CMfOkKUO0NVf5Mr6SOcxQezl1HNMcOmqRY8hikm+H5gBZmWxolrauUEOkaFTvREgZabe6mijynorghLYbOJwaeTKFicfVyWhsBdW2x4rh4IPdb45ellRLJYhrqDjQfBMmVP8p59UMqHCGmJhLdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(45080400002)(316002)(478600001)(6486002)(6916009)(54906003)(4326008)(966005)(26005)(2906002)(16526019)(186003)(8676002)(2616005)(8936002)(52116002)(6512007)(956004)(6506007)(36756003)(4001150100001)(86362001)(66946007)(5660300002)(6666004)(66476007)(66556008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YLuAL/Lks5I+rosva8OBzE/ZjexIFmdU9JbAxzdhAqeULmN7CNqorieCYFhfsoqSwS4x88fyvZwaj4yczlgLKmdvbrvBup/SweiHSFabH3LzfE2L96esZBo3h9zkIyWJJgI0Cr0CKX7S0RA03vfRTNMg4O4i7rNJ3eXyFMb5uF0U0SvKxWOaYM9thKdnTKl5cYbAgVbprxuEu2yubP+59fEMd7QuUAUpr3XzVoD42HZOyXYSRVCvWFabxfeKYhunvQkQHJfouxUxtSoBgBFxjJQi+jpVWcsbjT+dAVFGJy6ZqM8Z9uU+u5rpoKGuUct90rlzZ8zG4sPukhq0RQhmCB+hpVOymPJdSu9wZBWT1M4juzjDwW5N1pFaaOdbFPnZKzaxAzESMvXvry7nTKio+/AL8J2TM3UgjnQIr4i0oO7zRDkLR05utvOgFEY3Xmoky7HJa+qUkrV08REytbKdrRp5aP38g/Py8669KsS+syRuhjEzmkbuVHRVKIivH5V6ft/z7MnmX6LJQkVmEcowtkCNMRZXp4ysXS5zTCjLKZEw7WVsiDD95hzWMLbPYjLrNzhCcN/lAiCUVhWxoiVpkMkQLBz4x0VJraWx7P+TjOiY+61yJL7qXsTY4VPVxjocZYWHHH88W9EDK5iNx9sXvw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fcdb8c-ef6b-40ce-cf39-08d88a9aa505
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 01:46:47.6040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gS8uWpOE77/Ijumsr13l9I9PVXYsrOFZQTfcr6BlutSIC/2cUw+zWMJ9ZyBGIRX98yEDkhWRlfTnhi7EwOJ/uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-11-16 at 13:23 -0600, Rob Herring wrote:
> On Thu, Nov 12, 2020 at 02:17:11PM +0800, Liu Ying wrote:
> > To complement panel-simple.yaml, create panel-simple-lvds-dual-
> > ports.yaml.
> > panel-simple-lvds-dual-ports.yaml is for all simple LVDS panels
> > that
> > have dual LVDS ports and require only a single power-supply.
> > The first port receives odd pixels, and the second port receives
> > even pixels.
> > Optionally, a backlight and an enable GPIO can be specified as
> > properties.
> > 
> > Panels with swapped pixel order, if any, need dedicated bindings.
> > 
> > Migrate 'auo,g133han01', 'auo,g185han01', 'auo,g190ean01',
> > 'koe,tx26d202vm0bwa' and 'nlt,nl192108ac18-02d' over to the new
> > file.
> > 
> > The objectives with one file for all the simple LVDS panels with
> > dual ports are:
> > - Make it simpler to add bindings for this kind of LVDS panels
> > - Keep the number of bindings file lower
> > - Keep the binding documentation for this kind of LVDS panels more
> > consistent
> > - Make it possible for drivers to get pixel order via
> >   drm_of_lvds_get_dual_link_pixel_order(), as the optional 'ports'
> > property is
> >   allowed
> > 
> > Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2->v3:
> > * Do not allow 'port' property. (Rob)
> > * Define port number. (Rob)
> > * Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels'
> > properties. (Rob)
> > 
> > v1->v2:
> > * Correct pixel order in example LVDS panel node.
> > 
> >  .../panel/panel-simple-lvds-dual-ports.yaml        | 126
> > +++++++++++++++++++++
> >  .../bindings/display/panel/panel-simple.yaml       |  10 --
> >  2 files changed, 126 insertions(+), 10 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/panel-simple-lvds-
> > dual-ports.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > simple-lvds-dual-ports.yaml
> > b/Documentation/devicetree/bindings/display/panel/panel-simple-
> > lvds-dual-ports.yaml
> > new file mode 100644
> > index 00000000..d30ae82
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-
> > lvds-dual-ports.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fpanel%2Fpanel-simple-lvds-dual-ports.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Ce8617e47af5e4d939a3708d88a652499%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637411514310871830%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F5Jad81MpVVoRLGbEGAka5S4walK1UpsE8y6PGsgLiw%3D&amp;reserved=0
> > +$schema: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Ce8617e47af5e4d939a3708d88a652499%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637411514310871830%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3maA8Yc%2FoDzjSY2njq0bkM6%2FFo4J%2BFv0bEH4IbknM1w%3D&amp;reserved=0
> > +
> > +title: Simple LVDS panels with one power supply and dual LVDS
> > ports
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +
> > +description: |
> > +  This binding file is a collection of the LVDS panels that
> > +  has dual LVDS ports and requires only a single power-supply.
> > +  The first port receives odd pixels, and the second port receives
> > even pixels.
> > +  There are optionally a backlight and an enable GPIO.
> > +  The panel may use an OF graph binding for the association to the
> > display,
> > +  or it may be a direct child node of the display.
> > +
> > +  If the panel is more advanced a dedicated binding file is
> > required.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +
> > +  compatible:
> > +    enum:
> > +    # compatible must be listed in alphabetical order, ordered by
> > compatible.
> > +    # The description in the comment is mandatory for each
> > compatible.
> > +
> > +        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD
> > panel
> > +      - auo,g133han01
> > +        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD
> > panel
> > +      - auo,g185han01
> > +        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> > +      - auo,g190ean01
> > +        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x
> > 1200) LVDS TFT LCD panel
> > +      - koe,tx26d202vm0bwa
> > +        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT
> > LCD panel
> > +      - nlt,nl192108ac18-02d
> > +
> > +  ports:
> > +    type: object
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        description: The sink for odd pixels.
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          dual-lvds-odd-pixels: true
> 
> Needs a type and description.

Will do in v4.

> 
> > +
> > +        required:
> > +          - reg
> > +          - dual-lvds-odd-pixels
> > +
> > +      port@1:
> > +        type: object
> > +        description: The sink for even pixels.
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +          dual-lvds-even-pixels: true
> 
> Needs a type and description.

Ditto.

> 
> > +
> > +        required:
> > +          - reg
> > +          - dual-lvds-even-pixels
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +    additionalProperties: false
> > +
> > +  backlight: true
> > +  enable-gpios: true
> > +  power-supply: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - power-supply
> > +
> > +examples:
> > +  - |
> > +    panel: panel-lvds {
> > +      compatible = "koe,tx26d202vm0bwa";
> > +      power-supply = <&vdd_lcd_reg>;
> > +
> > +      ports {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 {
> > +          dual-lvds-odd-pixels;
> > +          reg = <0>;
> > +
> > +          panel_lvds0_in: endpoint {
> > +            remote-endpoint = <&lvds0_out>;
> > +          };
> > +        };
> > +
> > +        port@1 {
> > +          dual-lvds-even-pixels;
> > +          reg = <1>;
> > +
> > +          panel_lvds1_in: endpoint {
> > +            remote-endpoint = <&lvds1_out>;
> > +          };
> > +        };
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index f9750b0..62618e4 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > @@ -57,14 +57,8 @@ properties:
> >        - auo,g104sn02
> >          # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
> >        - auo,g121ean01
> > -        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD
> > panel
> > -      - auo,g133han01
> >          # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
> >        - auo,g156xtn01
> > -        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD
> > panel
> > -      - auo,g185han01
> > -        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> > -      - auo,g190ean01
> >          # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD
> > panel
> >        - auo,p320hvn03
> >          # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT
> > LCD panel
> > @@ -167,8 +161,6 @@ properties:
> >        - kingdisplay,kd116n21-30nv-a010
> >          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240)
> > TFT LCD panel
> >        - koe,tx14d24vm1bpa
> > -        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x
> > 1200) LVDS TFT LCD panel
> > -      - koe,tx26d202vm0bwa
> >          # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA
> > LVDS panel
> >        - koe,tx31d200vm0baa
> >          # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> > @@ -205,8 +197,6 @@ properties:
> >        - neweast,wjfh116008a
> >          # Newhaven Display International 480 x 272 TFT LCD panel
> >        - newhaven,nhd-4.3-480272ef-atxl
> > -        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT
> > LCD panel
> > -      - nlt,nl192108ac18-02d
> >          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> >        - nvd,9128
> >          # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD
> > panel
> > -- 
> > 2.7.4
> > 
-- 
 Liu Ying

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
