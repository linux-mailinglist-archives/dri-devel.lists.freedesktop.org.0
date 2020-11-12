Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF752B0113
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E03C6E1D6;
	Thu, 12 Nov 2020 08:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B01A6E120
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 05:13:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlkQtrcfGXLvDgfAv7iwDO6pKKIb3dYnVO2NN7g0Lv3bcn/qeuAINitzwapzPWw28wyd1MI5pH/otlWLib5qUGC4dwgbR0aWPisB12tp7NG8+QjCAVFXvwaiNk1+leVPRItFHnGo0ZYL06Cnc8ts89utB34BcEPWlbCasOF4QMNosx5rlqdojWnE3oV6NUzDsfYtI8C48fQGgVSN1wcYKnC4bfRWAyN/KqxRoR0eavlkP2tj7kykHKqhkjES5iSc7nXA8U/+ZTWrwsZddxVHwCOdu1X+eHQjJITiN/zSjYHJJ8DSrJd74o86iHRUAup/Bry3Ytth2a+hJk0jSPFgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm+zw3CkJ50S5TG5KyT36kFXbzOkcz/F589H5Zuy+N8=;
 b=SsMtztFuTKunsMu1BwqC5O227BPZO6uP83xhRgIZknyGaixG1/+sjD9c8oZmu64p67M71iaWUYsBwEzSU3/13fV1/bBJFBoMtuda7DOka3qEb5Qk9haiHqZtHOPsyVIeIEOt68GKl0iou0vEHGML5KNDFGqJfJhBTAt/5UGZh8uYZT68H0K0MD6cw4cG+h2N+6bUexfFfRLrdylcxx3BvsN8xZYP2UsQ/E1qBOhM3CbJYZYQT8QvbrGO8s8tq/DIDSKZ0rqHBkhgXc7kNatQR+dCdqzIpau/ubvxXV+Kfy+hA99rKCzwAnozPZ3S53TLtMxeSgpG3n6aG5GhxtjpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm+zw3CkJ50S5TG5KyT36kFXbzOkcz/F589H5Zuy+N8=;
 b=GT5yMvRUpXbv2vtZwwDlqNzy/xs5z02/fscfNjgrjMDvyP0//HPGJb2UZVVs6PsScc9gSCRP+vzK/gnCpLLxTmbdhonyEsaCDvJcXhdcPVfx9LNTDZwSPHLF4RMbrBrpeV/GR7qtLABBfkxvLJzMoy58R7AEY83RJIMAgsRXMn0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5582.eurprd04.prod.outlook.com (2603:10a6:803:ca::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 05:13:47 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 05:13:47 +0000
Message-ID: <cee6916984b183c4a1955781afe6a35f0e6497b3.camel@nxp.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 12 Nov 2020 13:12:00 +0800
In-Reply-To: <20201111225527.GA2191793@bogus>
References: <1604993797-14240-1-git-send-email-victor.liu@nxp.com>
 <20201111225527.GA2191793@bogus>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::16)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SGAP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 05:13:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 31c06323-0bc4-46a3-c24b-08d886c9bbaa
X-MS-TrafficTypeDiagnostic: VI1PR04MB5582:
X-Microsoft-Antispam-PRVS: <VI1PR04MB558200E7085C674E8F96E60D98E70@VI1PR04MB5582.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lu1rZ4IlMo1MKAJwPJcl4NyFkkJ2SoxYVqyURgvm9ZP1UzdN/39zI5/YAarEOuPIYD48Fo7YulvDeOWK8I8KjggV9YIdbLNHqaZvJmN0d74eABw4QNyHgjrYXqZEZ5z0G+hDYmDRCW69Tn7ysJA1OP9hB0w/WCauHbhafNdNq4LNgHy6z1l9O0qsfHrXdgVFh7sJTnGwZ8kqSQcLHDVKGNjkvEbonPnOyplFGiI0xuImygcz95Xa3JGPXPtdYQfiBHzAHfRUPNCyoZ541zunAOfphYGBDi+TixJOePdkSGPOzT+8wMcE++koW2Q8jA/nMA6k5yP4sc1umUVeY0g4QoDfxO0E+gqQpU6kAVaXa575qIhFOkZxP4mB6rP49KuLPouFYoFw6J596GWkcfwZ8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(4001150100001)(6486002)(8936002)(8676002)(478600001)(26005)(6666004)(6506007)(86362001)(83380400001)(52116002)(66946007)(66476007)(2906002)(6916009)(66556008)(36756003)(186003)(16526019)(6512007)(5660300002)(966005)(956004)(316002)(54906003)(2616005)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: kpbbfPBI/m6US6GPNZWbHnLcmS+ps2L6j9GF/QTIM72fZQAH9cKBOMRVgcmkQQ/c3JSXEafzkNIra9AaNCwDInVF7LNRj88j2mxgbD67IzbDZpWcKgnCFd6t2zxEumBLzxOJIbkkJ5w1qHVGxYHykQeIQ5e3PoaHnlpyAplhjvtEsA3GulEsYnqAVUeBf0fb43LwTxPizzOBZ0t89LyoWUBiBGwG0BAsoqx0u+LqvVua09QayDqcnj191ej/cRh/54VL2o11xk1/RkwvpMvVbIzsuaMXwRbcXVMhYD3wHzxAyc1iYvDkeR3M3fXzGOiVKST1GFwttWuLj5YJiaabZsnmH4y+hOU5iMq+JUizoEJZlWf/fF1B/2Eqe0Y69hPM6zW2kTJEZ7JoZZJRUrLye4SbTo6BS4X1NDyQyeo694lFQJKmJ+rlOAsfdaofgpMRud4DwkOH85CKDp5RRAQgWuNNJpLJxRiujv/jpz1/2dO8CeRmWx215QH8S0CRYFCAPzuvbf5mB6FedJ7z6/uAg808uOQAdoScNA5lCbk1qKng/17wuoTqxDK7BAY0Sm89wviDc112f5X5rf9zcHB+JbENP1vnd0kBBsHK49hCFzHV6qTX9TftYP+ZfuhMla+6XR8ry+9M+uwtc1MYJPHuAA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c06323-0bc4-46a3-c24b-08d886c9bbaa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 05:13:47.6468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ys+XsSXXQHfBFOAFaJJtzPHgOQFq1ePHZtSGDmnQk9KgTzj3aQi8P7q2QURoz+MMC4HOzyvRULcTczUVAiRgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5582
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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

On Wed, 2020-11-11 at 16:55 -0600, Rob Herring wrote:
> On Tue, Nov 10, 2020 at 03:36:37PM +0800, Liu Ying wrote:
> > To complement panel-simple.yaml, create panel-simple-lvds-dual-
> > ports.yaml.
> > panel-simple-lvds-dual-ports.yaml is for all simple LVDS panels
> > that
> > has dual LVDS ports and requires only a single power-supply.
> > One LVDS port receives even pixels, and the other receives odd
> > pixels.
> > Optionally, a backlight and an enable GPIO can be specified as
> > properties.
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
> > v1->v2:
> > * Correct pixel order in example LVDS panel node.
> > 
> >  .../panel/panel-simple-lvds-dual-ports.yaml        | 85
> > ++++++++++++++++++++++
> >  .../bindings/display/panel/panel-simple.yaml       | 10 ---
> >  2 files changed, 85 insertions(+), 10 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/panel-simple-lvds-
> > dual-ports.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > simple-lvds-dual-ports.yaml
> > b/Documentation/devicetree/bindings/display/panel/panel-simple-
> > lvds-dual-ports.yaml
> > new file mode 100644
> > index 00000000..58774ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-
> > lvds-dual-ports.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
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
> > +  One LVDS port receives even pixels, and the other receives odd
> > pixels.
> 
> You have to define which port number is which in the schema.

Ok.  It looks that most planes receive odd pixels via the first port
and even pixels via the second port, at least all the planes to be
migrated do, so I'll specify that in v3.

> 
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
> > +  backlight: true
> > +  enable-gpios: true
> > +  port: true
> 
> A single port shouldn't be valid.

This is inherited from panel-simple.yaml, but I assume it can dropped
in v3 because it looks that the panels to be migrated are NOT
referenced in any in-tree devicetree.

> 
> > +  ports: true
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
> 
> This needs to be documented. Though really, this property seems 
> pointless if the port numbering is fixed (though 0 for even and 1
> for 
> odd would be a bit more logical).

Will do in v3.

Not sure if there is any panel swaps the pixel order or not.
If there is, a dedicated binding is needed perhaps.

> 
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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
-- 
 Liu Ying

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
