Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289B2B0104
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A271B6E198;
	Thu, 12 Nov 2020 08:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00046.outbound.protection.outlook.com [40.107.0.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B16C89CE0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 05:19:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kd55wmE5G84xjA0F8IDfII+ex9NhNHb8pMj3fR4rqTZJISFBXkWwB3SlOIlooNYDujV4Iz7yP41EUgHulBVHgwvnJ7P3htD94xpmmTAv5qtVsC4yjJA0e020OW5auihk3rtoe1WNEwCO1BqOxfmGOC/b3J/l1nXhvAguHsfNHXdxWY5rvG3v/TupNhTE/HLQeuMPRIG8psMq8yh6FKJarNJzn5J2sPQL4iyoIvJZeGHNJzsT4psTYGi7vAbyIjVm2fGOZb763b5Fkue//OTQk/8li8lX8EMa+21EwiAwu3JrvSmM+oTV4NSsrKV3qghCJJzm0g4qLk06WBS/+qt27g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4Q8eqPf0YZf3L1Yp3sqKYcObpzgHAXzcfYIBtVVwnU=;
 b=MiNO0crzLyaKcudW8LiOcu5RIEUfKBjJGZh1UQ+PrE1ru3pmWvczobcNPhr/yXd3/rV4CEOiFn77NAn6fsOAy7XcmbsMWHNIsWH5HaSexI9FopoyYr11cU774hMF0YF6uZTW/8LJ7pxZBMbkW6g13rY4ZvcTujzxErjRYlvT4B3ZV+9NaU6q3YJmk7DENCgbyQuVibS+Iwl0uYvoZn1Y1nmK6n2fGQHrh6kdIsOTBLfvMq5Rc7f5cGfZbYTq3GXToh4s+D93MapwK58rhnF9UFgzTW6TN6Qm8ZvfvRnHrX4aUlA6wZF67ZmzRoq+6TrEJ5o1MbolM5SBDgjCQuxKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4Q8eqPf0YZf3L1Yp3sqKYcObpzgHAXzcfYIBtVVwnU=;
 b=I9K2eLqIbk63Y/lWPsDc+PyrMc5hmDxlyP3brodUaMg9f7AcUgZ3a+yOjO6TrrbIE41uI8OHIWmXzJbX+IjaH/NHFkVeDboDwptroXzdnAu5OiZwvH6oI4oCRYtH1ARzRdRHMzB9OPPm1HmWzcyWQCsub8G3EQHHEop2PdR/RAg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6352.eurprd04.prod.outlook.com (2603:10a6:803:129::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Thu, 12 Nov
 2020 05:19:22 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 05:19:22 +0000
Message-ID: <1004a547603facca1d01c7456a5079fcc5353828.camel@nxp.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 12 Nov 2020 13:17:34 +0800
In-Reply-To: <20201111225751.GA2198243@bogus>
References: <1604993797-14240-1-git-send-email-victor.liu@nxp.com>
 <20201111225751.GA2198243@bogus>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.13 via Frontend Transport; Thu, 12 Nov 2020 05:19:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 998f72e5-e809-43aa-1fc9-08d886ca838e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6352:
X-Microsoft-Antispam-PRVS: <VE1PR04MB6352F7638BF4D1F9EA8D074698E70@VE1PR04MB6352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SUBd5ReHwYGdSDRbMpojV+KVIBmgUnEQHcGCH4mBQaCPt2wwqcansNahgJ5joLLQB9BFiYPZz+4jnVBq9AAP5RGJgX1qRv914oN170jNWPioZ9PPAymXsenT1rcth1Tn43m6mbDxKclmP7B4dkObgceNdUXx3qz5+Jg771TDdMuGEcQzKG9h6o8N9Yp6KKYVzuPAogZ5FuCz+ewUcLcs7p1xLuA4JUjMbeF0DFXS4uCsBFwgSi+RRgFrDyAkkENKNf6ezEzUkpc2W+ligF0WCOL8tRp3G/LtS5vQGd6xOuMxBHnmVPFrD16mWiGESrwSoTISHrvfawhaqa7/bV09xiDFvjVTkab6GL2E1Gr/LVktG0ZCQcSh/iuQWjfb8YvhaOOlECd/T24kNNc90kVVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(36756003)(966005)(6916009)(16526019)(186003)(54906003)(956004)(66556008)(2616005)(6486002)(52116002)(6506007)(4001150100001)(4326008)(478600001)(83380400001)(66946007)(2906002)(316002)(86362001)(8676002)(6512007)(26005)(5660300002)(8936002)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: //epY5H1k3Z8HxJ+k4EyG89xxBa4cDkjWKjv3FNAbQpu8sZTF9r+45hPyHBFFlPYX6cRaS1Ep4yi2x8i+zsui6epT16ZlHm/hwJIrOCTACXVH68Pp3T4dSh/lCbnG/6cKXw9vsjcUZBcvpJfPUpzoByKl0rRizO0xnyQLTifa4VVq24id9OXA6q6ES4Ejekfl85zUrXFQNEAbX+j1tHXGOyk0o6SadHRw9S+IfujqJ8VAoPDOwRaWf4UN0b2QqoY5qK3MDThm0vRw8yOEd9M6wk+hH0YdEsk2gPS39ilq8vwK/mUnlbitYxDmmcARzUNPAjTXR/U47aj5lEclFdcFvSug6Saglyqvtg9K+u6Trl78BA0AGA839YJQEVel/98oCwVAkcADU71Odtf1dkUU1LQOeOT3DrpEk3di9Oq0RXv9/0qI4ugVh3Ce1ume6lVHGI2MlEAkCAgERkSz+jOlaX6KrFuifhneqcYG4rfgNm6t2hIXWbNbZMwn02RZ/VlYCGTbbtoAplgTogP0yyLOD2OPojR2/KG2N42je7o2WCpfQ3gUZLuxNApTG364Ph+10AQIKetVvoIT0JSruSKrzTpB8GEPAS14x8i1kUThRh4+d2PPHkyGuoyGhnXUK3p7kZRLN7ZbXotdVmxIhiqfQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 998f72e5-e809-43aa-1fc9-08d886ca838e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 05:19:22.3759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqwuqZ+ttVvdfjdDKyEnhzjLRlfZrSobvmQcSO5K4YwvOPyJNVNqbZfh5Va/lmGceiGsTTsc2cSutpsrwOkm9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6352
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:50 +0000
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

On Wed, 2020-11-11 at 16:57 -0600, Rob Herring wrote:
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
> 
> Also, what about advantech,idk-2121wr?

It won't be migrated, because it is compatible with 'panel-
lvds'(covered by lvds.yaml) and it requires some properties which are
NOT allowed in this binding doc, like width-mm, data-mapping, panel-
timing.

> 
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
