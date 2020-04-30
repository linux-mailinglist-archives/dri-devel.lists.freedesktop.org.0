Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24F51BF16E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2B66EB57;
	Thu, 30 Apr 2020 07:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2119.outbound.protection.outlook.com [40.107.237.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9510E6EA8D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 06:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Je7izg2x4U70dG19t9RZWnWuUoIz4kJcbZmzwJRoHQE0pbZwmvimRiZkKkDoDsok5wbBFTLT7gU0Kw23oFFptGKNxknaj6+bDtijST42T3M4dyFJuuQiz0ANHqfdWCV7xopJJ2I6cn4MkcAZrhHr1jUT+9tFAYU8iXPgdKx6t6i/HF0HrIK3fgAsUEQWxVTIRKkKSbm8FEhKVcibwPNIRgrj71hv8NlUQnI4ATfMmdhMNTQdsgzeGCInNJmvCHSOsTmyl0WCbsEbniMgAnVEh/6sRWQmQXgR8Yg9zt4WAcO8yLmqq2dMU/sxUCdSJy2Yk+Usaz0EmBW2a3UjKno1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qQ/yx6abKRIL0FsJwS93t9eFiymJD6IOqEolKEMHSc=;
 b=KqVx1zu+cEtV7QoFhRHs9uzQKEKdp9kYPcJMTygx4x7mPdV+bJyyNDiZyYxgC+pFwzr+HXcKdHzlrqG5djM04O9RqwNGuDkUEqasb5MllXVZyhZcFSzBQEow5dBysasg+lSYO8EewyBfVU2/slYzthAw3KAkrGtgXvjoduH9MpKlSexjs2b6gsPk/gHDDFu1Sz63uw+cZk1YhEN9tifG4ftmZs7uJ927H43UloebwwRmd2XauUqiYiB/m/cXAxLD77miO/TsRoyx6OAnSl4o/SRoMStEwEzbsy1NfZ5xf8zcdjWImeNzoevjVPdot0OJFNFx/U8sQ/63gYD8ToiOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qQ/yx6abKRIL0FsJwS93t9eFiymJD6IOqEolKEMHSc=;
 b=GAq8Py8eNemiPtRXyVx9KrccuDl78mU1IVzgeSa3Gu4bu3rnqMRn1k563jW4f/INZYpVZTPQqv68Y7j0GOs1ARquJMpA/oSNVqKOAPibhAxiuv9w7shnistGzBMgthu41tL2LS7DfeLWRSRD+oYtbTAMA286i/u7lxQzAhqts4c=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6996.namprd04.prod.outlook.com (2603:10b6:a03:224::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 06:01:40 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 06:01:40 +0000
Date: Thu, 30 Apr 2020 14:01:32 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Message-ID: <20200430060132.GB6645@xin-VirtualBox>
References: <cover.1587880280.git.xji@analogixsemi.com>
 <67ccead807b7d0a50df479cab2c9d325041224bc.1587880280.git.xji@analogixsemi.com>
 <20200427184909.GA15880@ravnborg.org>
Content-Disposition: inline
In-Reply-To: <20200427184909.GA15880@ravnborg.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR0302CA0008.apcprd03.prod.outlook.com
 (2603:1096:202::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR0302CA0008.apcprd03.prod.outlook.com (2603:1096:202::18) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2979.14 via Frontend Transport; Thu, 30 Apr 2020 06:01:39 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dd22024-81d2-4e30-5a7f-08d7eccbf34c
X-MS-TrafficTypeDiagnostic: BY5PR04MB6996:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB69961C26C836FCE568FD4156C7AA0@BY5PR04MB6996.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p1wKTUCAorEQzSmWXb16+TfXpi7ak4u6Uo9yDI4N/9w50fl9MTf/bALCd8xUOq7I2uo8r82yoC18GzEcxS2auKQXtyCCQZBcI2+ln159Rg0UDz+Fdz+WrpAIQIT8apCnJx0XQ3nFLYS9EnQrI8lr9mJdAGLz4vzNa44l5kNRwUxfZeGhktKxP39nc3zm48TGN+Skj00DHPv+DD9ESitvnTfMkptc2CjJTbPCiORLYp8uHPoG9I6NUiYQUYjpuFwCroX+olTmsvXfZAN62wcTiPpANZSZ3WYXbq9dYP3wjnL0mOXrm5roulmad9irsHWXW+Pax4eq9qtHAPQKJtGLjNA/hFe2z+EILL1seMm13p4Puqm1QL+lFnSsvkJ1SNBF/OC3bNc7fhcdS+84e3be2lw2Tq4AjN9cI0yBEKgyvVjnCQS4raYWjgJCr44Ctqkg+GC3UdDMIk/zc/V+huRI+5C1A0Oj/tx1YA2qkl2dEQBGS2Nj9YONValHbHFn8lE2CWWlD6fIxY0fJcLP75AIqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(346002)(39840400004)(396003)(376002)(1076003)(66556008)(4326008)(66476007)(186003)(66946007)(55016002)(7416002)(16526019)(26005)(956004)(9686003)(2906002)(6666004)(54906003)(6916009)(8936002)(6496006)(86362001)(33656002)(8676002)(107886003)(33716001)(478600001)(5660300002)(52116002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: nSvanHTZKE2srxNW9ynwr+/C978IjFo8Euit5SYaVmg17h3RVK+ylFxz2Dl/1v5n56/fGzlzaUQQap/KXcY799KAUlNhi3tpziwAnVk2QG0l9T8oSjjBiXQrt/M5QmqlZbzFcDkAKLJr7XRXmdrSBHXd6Lu/I3J6ly2dx5+cxsUl8slI8IZKPr4B4cfCOTs/lXpHcp4ym/kgtTlgd/dufyTOwMAAMg4/YeIVk5/nJQZazYmpPw3PN8zuJ2sUso93LGVp6KnPWSXLl9yhcbRra7LBTpjbuP3Usc9s+AJkOCSSdaDZ8BDCfoZXxB/2y41X7HW+jtlGGhGDBCDhB+M8twhV4FwWDvjxeTXHRs5o4CHbqV/9p7JKN3ackUJifTCj8KHeMPQSda4KT75p571vdk4iA2Tj2kEvDKHdMXwd/KUx/yuDn1ZR1bvUZ/N85YlUF9Y8+zj96EvFYdfpvOSSF2UB38vqzkbXcD0BQCPoMWxW+Xa4z5OeQxkDWuPVg77zfbJIrrY4/zPD+M5TIIN/duDj0gju3JL7BwcEjcWoV6JXDom+t9NBHZUvajVcTXTEznPlZDC6j/a+fYgf6YbWGAmRxNPn4Bp4xJT2hJL2M3s1Xqpd9XXAmzeGqGtBDSF+w+xMyPxfcHNPLgqRxjYgjv1gCKykmDwT+jUwVI2GTTX98sYjAwk/RUPj75jK8mq7TdhKZBZCkpKdqhDl+uHpphfb34PppQceaL9oQx4V09YFQMLXZn+iZROm9AP3v1G9FZQq3tePhvq/nYvdR0NUs+lWSqDkUlZKPL0uUt25FyqvEUFAJy5B2tulGUZUKjH8
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd22024-81d2-4e30-5a7f-08d7eccbf34c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 06:01:40.6422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAVPU8Me5UJF7/8kK/IXKTOCyZHLJE9JYvbRUvi2uXMw8LSxvb/454Gqo3Q4nBrHN24imSUQ5bSHfiuXhRpwZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6996
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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

Hi Sam, thanks for your comments.

On Mon, Apr 27, 2020 at 08:49:09PM +0200, Sam Ravnborg wrote:
> Hi Xin Ji
> 
> On Mon, Apr 27, 2020 at 02:17:46PM +0800, Xin Ji wrote:
> > The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> > for portable device. It converts MIPI to DisplayPort 1.3 4K.
> 
> Thanks for providing this binding.
> When you re-submit please also send to devicetree@vger.kernel.org.
OK
> 
> Running the binding through dt_binding_check gives me:
> 
> /home/sam/drm/linux.git/Documentation/devicetree/bindings/display/bridge/anx7625.yaml: ignoring, error in schema:
> warning: no schema found in file: /home/sam/drm/linux.git/Documentation/devicetree/bindings/display/bridge/anx7625.yaml
> make[2]: *** [/home/sam/drm/linux.git/Documentation/devicetree/bindings/Makefile:42: Documentation/devicetree/bindings/processed-schema.yaml] Error 255
> make[2]: *** Waiting for unfinished jobs....
> /home/sam/drm/linux.git/Documentation/devicetree/bindings/display/bridge/anx7625.yaml: Additional properties are not allowed ('example' was unexpected)
> /home/sam/drm/linux.git/Documentation/devicetree/bindings/display/bridge/anx7625.yaml: Additional properties are not allowed ('example' was unexpected)
> 
> See writing-schemas.rst for instruction installing tools etc.
OK
> 
> > 
> > You can add support to your board with binding.
> > 
> > Example:
> > 	anx7625_bridge: encoder@58 {
> > 		compatible = "analogix,anx7625";
> > 		reg = <0x58>;
> > 		status = "okay";
> > 		panel-flags = <1>;
> > 		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > 		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 
> > 		port@0 {
> > 		  reg = <0>;
> > 		  anx_1_in: endpoint {
> > 		    remote-endpoint = <&mipi_dsi>;
> > 		  };
> > 		};
> > 
> > 		port@2 {
> > 		  reg = <2>;
> > 		  anx_1_out: endpoint {
> > 		    remote-endpoint = <&panel_in>;
> > 		  };
> > 		};
> > 	};
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/anx7625.yaml           | 91 ++++++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7625.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/anx7625.yaml
> > new file mode 100644
> > index 0000000..1149ebb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/anx7625.yaml
> 
> Name the file "analogix,anx7625.yaml".
> (We should rename anx6345.yaml, so others do not omit the company name)
OK
> 
> > @@ -0,0 +1,91 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2019 Analogix Semiconductor, Inc.
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/display/bridge/anx7625.yaml#"
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
> > +
> > +  compatible:
> > +    items:
> > +      - const: analogix,anx7625
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  panel-flags:
> > +    description: indicate the panel is internal or external.
> > +    maxItems: 1
> This property hint at something needs to be modelled in a different way.
> I do not recall other bindings need similar info.
I'll change it to vendor,int-property
> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> A description would be nice.
OK
> 
> > +
> > +  enable-gpios:
> > +    description: used for power on chip control, POWER_EN pin D2.
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description: used for reset chip control, RESET_N pin B7.
> > +    maxItems: 1
> > +
> > +  port@0:
> > +    type: object
> > +    description:
> > +      A port node pointing to MIPI DSI host port node.
> > +
> > +  port@1:
> > +    type: object
> > +    description:
> > +      A port node pointing to MIPI DPI host port node.
> Maybe explain how it differs from port@0 and why it is optional.
It seems this port is not need any more, I'll remove this port.
> 
> > +
> > +  port@2:
> > +    type: object
> > +    description:
> > +      A port node pointing to panel port node.
> Unless there is a good reason not to then please use a ports node, like
> you see in almost (all?) other bridge bindings.
I'll use ports node.
> 
> > +
> > +required:
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - compatible
> > +  - reg
> > +  - port@0
> > +  - port@2
> 
> additionalProperties: false??
OK
> 
> 
> > +
> > +example:
> It must be named "examples:" - this is what dt_binding_check complains
> about.
OK
> 
> > +  - |
> > +    anx7625_bridge: encoder@58 {
> > +        compatible = "analogix,anx7625";
> > +        reg = <0x58>;
> > +        status = "okay";
> No status in examples.
OK
> 
> > +        panel-flags = <1>;
> > +        enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> You need to include a header file to pull in GPIO_ACTIVE_HIGH - see what
> other bindings do.
> > +        reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 {
> > +          reg = <0>;
> Be consistent with indent. My personal preference is 4 spaces.
OK
> 
> > +          anx_1_in: endpoint {
> > +            remote-endpoint = <&mipi_dsi>;
> > +          };
> > +        };
> > +
> > +        port@2 {
> > +          reg = <2>;
> > +          anx_1_out: endpoint {
> > +            remote-endpoint = <&panel_in>;
> > +          };
> > +        };
> > +    };
> 
> Lot's of small comments. But if this is your first binding then this is
> expected.
> Looks forward for v2.
> 
> 	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
