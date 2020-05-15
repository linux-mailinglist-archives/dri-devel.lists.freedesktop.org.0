Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204361D4647
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB88C6EBF1;
	Fri, 15 May 2020 06:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700139.outbound.protection.outlook.com [40.107.70.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51576E3DB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WenjPcFGgg2hvr8fgTL422xlnzXkX8PeDUuqlFYR+xb+iHP6QbO66kzajp61pOKSu7AZW+YG2AgjwMnDxCpFr2DtbDD7d2kUg28HXQoua7+mRBJbbYc06/9tvjy3LnVOKVHZSOkjaFKDdTupgllmTeEVEFvmfi+wlBdt8AO3jwM/BPiZ//Y/Ce6GS/8F1dbALAXxd9CYvcs3cmiXO9OTPVE4hhetREX8RBP+eWT6lL+XuYFurTokaIxvkWpqFvk57YoNyA+tpMz+HJONE8LzSvbh/Rkj6wLCR6bwYdVJOcfVT33rpqX8FCZOwZgnBmv46RFsydzPhJ7L1NqDVP3JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugfZ6U/q5VakCvs/r70vo820Lx99Y5fQA/SjnrGWhrY=;
 b=gy2fi5TC4ihS1KTG1P4rUd9ybE2NfgoCF+SeWdHq3xthu5xdZYbKoXyRu2OvvDsFdhaXi3kqLnqyKxYdg55b8Z3kYTV96gtZigk91iMoxmeKBEZMgFeZS/6HxA7TWP3oBZq2mZbP4jVPvCEfJKFKIhizWqQRm7nZToipZs9weUPlHq1NgMwSxaENzh//Z26RR0G5mNwAilfLY81VIReKarOB/aQ7WGnal7EVYN6cR0ULULtN5IfqcXtR+wmNnNI4qUb0QZ4PiSC9wRFoWGFyXx4wtV8GA+n+782nCafWuotjJ3cTFcNxFfc8hDX3Irk1eZu1w9DmcDVcc7zPni42XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugfZ6U/q5VakCvs/r70vo820Lx99Y5fQA/SjnrGWhrY=;
 b=fsq4n7q77zFlKWZHhuM9CcW0gtQ87Nu9UhKpJrhEd8zl5ikgvqotOj72CPr3viMaxpIqJ3eFocccc5WSP1V8L4FuGEmGNAR3yBUKx0+vv3HqynQ0Xn/ooUFypcnCvMicBIsbdrKNiCpvpWFhvM/WXCdbfbUCGq45yhOIH9RMchk=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6583.namprd04.prod.outlook.com (2603:10b6:a03:1d3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Fri, 15 May
 2020 02:45:59 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 02:45:58 +0000
Date: Fri, 15 May 2020 10:45:52 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Message-ID: <20200515024552.GA11753@xin-VirtualBox>
References: <cover.1588747998.git.xji@analogixsemi.com>
 <b720f7d2c5338813d31b7f715f59ca68c367d5a8.1588747998.git.xji@analogixsemi.com>
 <20200514145432.GA6091@bogus>
Content-Disposition: inline
In-Reply-To: <20200514145432.GA6091@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:202:2e::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR06CA0016.apcprd06.prod.outlook.com (2603:1096:202:2e::28) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3000.25 via Frontend Transport; Fri, 15 May 2020 02:45:58 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ccce5ed-8c26-4624-543e-08d7f87a18f0
X-MS-TrafficTypeDiagnostic: BY5PR04MB6583:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB65837A370268722E5C0FC8A7C7BD0@BY5PR04MB6583.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UqEWEg/X8iIa+znI8yLYOZX0/TAl9tbeVRAaOhyvknmkKVsG3gyzWZqBxIXJNml2enKYlBgTvdAvR0h2JZWh1Ex5rbBuNpBxXZ/ruYJr5g0aKhIfkWRlgRZ93F8KEb1NSqhOhaC8oTFbXOn95FpOKrW1qA2ImvWmb2uA/Vff75vApYKkXiv787wNoNYiRvTw4NoY3vcUW1H50+WobQZkP8Yi10kv2jJhQ1uimWPhhv+Q+fhycTNxI3N50PzHaa5UrCf7MpAHkePHoHMbeY2ac0rIgtzggKr7Jw03nNTLo7oHKF0o94nz+YHdTgmqPStqezGLElzQURAb5YCq1M2rs/2o5j6PBPCSQjJRfQjG+wFMYyZ829xgbHa0DIyTgo7Kj0uHq/GdCbpDH8fIDjnRf+01Nm3jjYba5UcHYXc/L/z0Zvlc5kRZNFXtqNcteAbLh0aXt0z6I+OV9VpuhSSCI7a+762lfDW0Gzj8m+qNe9kgIa41k/ejJieZXK0wdNwbNAT3AeyNQly0KuyMLxk3QA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(136003)(376002)(366004)(396003)(39840400004)(8936002)(2906002)(6496006)(52116002)(8676002)(316002)(6916009)(86362001)(54906003)(16526019)(7416002)(26005)(186003)(956004)(55016002)(4326008)(66946007)(1076003)(33716001)(5660300002)(9686003)(66556008)(478600001)(107886003)(33656002)(66476007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: y976YP3kawGNAFPOYmD+WLiJCIsmiMQqB7LOsHSvp6wFlEdsrgu2yvkXdqLbbUaPCYqKSQX8B8l4hd2QmS7FtQ5RDy5AEFXrS7mv+klnpYfdu2cAVI7XHETV6V7Zadaxhiib07mEHDrdhPXxNM3jFdt/vfl20DQLhNofnEjZyXuL9xOozrvqu/mo/TqjENIvlJvQXN3ZvNYe5Us7U+jGqTf8QefMOZybBS7MJVn/NaLsyR0VcAWNZ7U7w2pxu6FiUjjW2HxXtypUfmpt9HdK0Pn/pQO1Qx9tKQXxdBJJnzN4gNNF/oCeIdMOf46P2V6wrsYEy4jAUJLPr/faTBZidoRUuIChxESq6pU5NzHRDGcLqSfMf+ZFjc2JffC1ELyPpGB8akPQ7ELrT3l8HE9ECJh4bQKqZm4BGlYelAUKLT4Adk3eBK7FAtKZAJBXqe3c5RWIceCghodoaGuolH8rlwo4tu9+GwyhunMKiri/n/ZT4rgRbdSxyPj4rBHyIoCg
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccce5ed-8c26-4624-543e-08d7f87a18f0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 02:45:58.7233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqz+qU3xje6GJ9oXnD5pPlqfdh+FloccM0M4DdPzd0TsHNyust/7ilgxysseOqNncuS8zRd0UtuWleUpb1DRIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6583
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob Herring,

Thanks for your comments.

On Thu, May 14, 2020 at 09:54:32AM -0500, Rob Herring wrote:
> On Wed, May 06, 2020 at 03:04:20PM +0800, Xin Ji wrote:
> > The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> > for portable device. It converts MIPI to DisplayPort 1.3 4K.
> > 
> > You can add support to your board with binding.
> 
> We have an example in the binding, no reason to also put in the commit 
> msg.
OK
> 
> > 
> > Example:
> > 	anx7625_bridge: encoder@58 {
> > 		compatible = "analogix,anx7625";
> > 		reg = <0x58>;
> > 		status = "okay";
> > 		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > 		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > 
> > 		ports {
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			mipi2dp_bridge_in: port@0 {
> > 				reg = <0>;
> > 				anx7625_in: endpoint {
> > 					remote-endpoint = <&mipi_dsi>;
> > 				};
> > 			};
> > 
> > 			mipi2dp_bridge_out: port@1 {
> > 				reg = <1>;
> > 				anx7625_out: endpoint {
> > 					remote-endpoint = <&panel_in>;
> > 				};
> > 			};
> > 		};
> > 	};
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/analogix,anx7625.yaml  | 98 ++++++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > new file mode 100644
> > index 0000000..6e54176
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2019 Analogix Semiconductor, Inc.
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Analogix ANX7625 SlimPort (4K Mobile HD Transmitter)
> > +
> > +maintainers:
> > +  - Xin Ji <xji@analogixsemi.com>
> > +
> > +description: |
> > +  The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> > +  designed for portable devices.
> > +
> > +properties:
> > +  "#address-cells": true
> > +  "#size-cells": true
> 
> These don't belong here.
OK
> 
> > +
> > +  compatible:
> > +    items:
> > +      - const: analogix,anx7625
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: used for interrupt pin B8.
> > +    maxItems: 1
> > +
> > +  enable-gpios:
> > +    description: used for power on chip control, POWER_EN pin D2.
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description: used for reset chip control, RESET_N pin B7.
> > +    maxItems: 1
> > +
> > +  ports:
> > +    type: object
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description:
> > +          Video port for MIPI DSI input.
> > +
> > +      port@1:
> > +        type: object
> > +        description:
> > +          Video port for panel or connector.
> > +
> > +    required:
> > +        - port@0
> > +        - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        anx7625_bridge: encoder@58 {
> 
> Drop any unused labels.
OK
> 
> > +            compatible = "analogix,anx7625";
> > +            reg = <0x58>;
> > +            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > +            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                mipi2dp_bridge_in: port@0 {
> > +                    reg = <0>;
> > +                    anx7625_in: endpoint {
> > +                        remote-endpoint = <&mipi_dsi>;
> > +                    };
> > +                };
> > +
> > +                mipi2dp_bridge_out: port@1 {
> > +                    reg = <1>;
> > +                    anx7625_out: endpoint {
> > +                        remote-endpoint = <&panel_in>;
> > +                    };
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
