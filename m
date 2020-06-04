Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55D1EE156
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 11:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D326E2BC;
	Thu,  4 Jun 2020 09:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9220D6E2BC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 09:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QezMdbf/XttnmSHmsTht33Z9VlHjuLp9BUreaRM9Yy9ZsZ6Z7dGwHYiBCBx14o2YJ8A9QU3f92Azg/orM4WxhWQAIOV3Q0GB2UitsnnrtN/kVX+UFVj3Wdtw4K4sDJxi8Ma24+xz87zH18W7EZ7y7ei7CXzVXBeAKI3SisePEPsiy0fCQvtv007kviYARhZ2OJ/u01ubLpHfFS/HBfPBIhG4Mvwlc4wb2gxtp0BsNuryFBq5iILFwHE1CPugfZE6QL8h1K2GTxD2+VO7vbiVSANgRmBpThnT3Ojoq7hUKrdgqG7jEoo+1AO8mZ76z0ddCO6XuZNtnaBW/mu/lLYhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCo+oBbDi05f/jdMMaaqlApUthShxtbch3uQ6TzVyBw=;
 b=BQVrwI92RADHVm/CCxSSZk4gTgbaX5cxofEISMovU7IU963dHm75DXr9pLBfj56RqaiFRvEb0qRgLmY4SCwXeS1t7/PV0aknB+NSXTNVmdxgY79CllYJPkRbPnOiySilUNgTfWTTBG8PQz6cC20AHIaXBsV09QyQf7pfh5QYKhGtuil98As3Wxvfi/+EnSBB2sEngGjfNKWKJenbkYn2TDeukgKPfBMEXXfjM/o43VkuOGBdXHFqzFolBPZFq4AJwtEuUKMX5gJZP4GbbAWUBY6pFj3SBPNB5MgIleiaXqMECasxhX/nBgLL0ayCjemycabzPmRbL6e/p1DTo8lvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCo+oBbDi05f/jdMMaaqlApUthShxtbch3uQ6TzVyBw=;
 b=ZVt/8bf340kvaZyy+1EY9XvX21E4voEe7YUr430mX0oWDjSz0gPBcDulF72miwwpz97CrjWrm+8B1ffoeCaTbfXY9fcW/0Ncu0SfKkAz4RmUbdkgzAYb76tV/afjed7zh+OfQqlyKIciwZtdp926V0UZ5O/3Vfn7Y4P2cpstS1Y=
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com (2603:10a6:10:113::21)
 by DB8PR04MB6507.eurprd04.prod.outlook.com (2603:10a6:10:104::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 09:32:16 +0000
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::58e6:c037:d476:da0d]) by DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::58e6:c037:d476:da0d%9]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 09:32:16 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [EXT] Re: [PATCH 7/7] dt-bindings: display: Document Cadence MHDP
 HDMI/DP bindings
Thread-Topic: [EXT] Re: [PATCH 7/7] dt-bindings: display: Document Cadence
 MHDP HDMI/DP bindings
Thread-Index: AQHWN8j41Pi6sgAFWU2sGu3JLQc686jF/+kAgACC6KA=
Date: Thu, 4 Jun 2020 09:32:16 +0000
Message-ID: <DB8PR04MB6828F1938EC4521B6CFDACB7F4890@DB8PR04MB6828.eurprd04.prod.outlook.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
 <9fa979f1099f7c02fd746f25002d8a652253d70f.1590982881.git.Sandor.yu@nxp.com>
 <20200602234422.GR6547@pendragon.ideasonboard.com>
In-Reply-To: <20200602234422.GR6547@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d0b96ddf-e1c9-47b7-5ad9-08d8086a2b83
x-ms-traffictypediagnostic: DB8PR04MB6507:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB65070B743ABFEDB0A8C74F79F4890@DB8PR04MB6507.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vRzB7K8t33nHxqLSN5J9sZbb0heZBL9Gnm+rQFIDk9fRA/2jPUUKGQMnWzpckeh+dxaGlob0kT92KzBkeuW91qZwvlVC8INqm6B+Olyihy9cBEFOJ2dn0wjNHyvmBIL6BwIqOuUMsP2Qj/UR4taxnedaxpRZMd0PZuIdI2bZlziHfRIzffWSZKES4Cnkl6z8d4KOFRmdmW98JtBOsu2OYuOCCqO2uaWKYD6OmlAoVzp0Ayqz6oiIwCqsWR6msehnWbpv5IXm1QDsUk/X+/8imP3kPmiKIrfknhahcVfvskO9LGROfwH8/LHosHv6ACBFgR4aygRuR25ZRsN/r6ySYWc299y9MZl7IqjEwgpOyHdZIa6BEzTsdg8sPF1di4VDkd/FEFuw/6RZnHGHndj5jg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6828.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(76116006)(66476007)(6506007)(66446008)(26005)(9686003)(66556008)(53546011)(44832011)(45080400002)(55016002)(86362001)(66946007)(316002)(64756008)(54906003)(4326008)(186003)(33656002)(83080400001)(6916009)(478600001)(2906002)(71200400001)(52536014)(7416002)(8936002)(8676002)(7696005)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RRJ2HeOe1yAjg8kRNgr5QQNPcFpAQ72jO0AIcZT7nTh5oAY0gsH8uBd0SlnIMJUpYEGUwGhAFksvt4eQblTbQDwB6UyOF9pBX49UY3qhFaBMJZpXmn0Ryr/n+XEUNzKsMEo7pI7143JbhrGeRrNgz1ba7CfWX3QMLqYsQImi6ADHnXaUg2wG9gS9FfTUzdcJ5mCH+PlT+kbZ2lS//ILBlkXGWaY+Bh3gUZ7wKIm8H8eCE009XokHJY92oOhx3518QD0ZE99AjqBTST/zR1SagbC/T+tisE/fgIlXJ/rJpqXPL0MrQOSf7AZX++FBSXBSfpG/+p9n9XhiX7bw3uUe1HiegEVmQ9gawjqdVVwgBoZ7JQ5v6EpZaT/UyXR93NMRSAi7zMh+rkr55jz7HksTgmVzWfKKli02363it1P8b2E0ZLx1hqOw4ARPJpdolsAjuDpDP//ovbFHCXHUrOtPweJe4GykycsnIYKn7kAoPYM=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b96ddf-e1c9-47b7-5ad9-08d8086a2b83
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 09:32:16.0826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNico58e6uB/le3asMw4dojsWGokqToq/pGCQBZl1+ooyHwnDWLocwk+bX1PIRlrxbpc8z+3txN0WVVJA9iyWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6507
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dkos@cadence.com" <dkos@cadence.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks your review comments.

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Wednesday, June 3, 2020 7:44 AM
> To: Sandor Yu <sandor.yu@nxp.com>
> Cc: a.hajda@samsung.com; narmstrong@baylibre.com; jonas@kwiboo.se;
> jernej.skrabec@siol.net; heiko@sntech.de; hjc@rock-chips.com;
> dkos@cadence.com; dri-devel@lists.freedesktop.org;
> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-rockchip@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH 7/7] dt-bindings: display: Document Cadence MHDP
> HDMI/DP bindings
> 
> Caution: EXT Email
> 
> Hi Sandor,
> 
> Thank you for the patch.
> 
> On Mon, Jun 01, 2020 at 02:17:37PM +0800, sandor.yu@nxp.com wrote:
> > From: Sandor Yu <Sandor.yu@nxp.com>
> >
> > Document the bindings used for the Cadence MHDP HDMI/DP bridge.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> >  .../bindings/display/bridge/cdns,mhdp.yaml    | 46 +++++++++++++++
> >  .../devicetree/bindings/display/imx/mhdp.yaml | 59
> > +++++++++++++++++++
> 
> Please split the patch in two.
OK, I will split it later.
> 
> >  2 files changed, 105 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/imx/mhdp.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> > b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> > new file mode 100644
> > index 000000000000..aa23feba744a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)) %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> >
> +cetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fcdns%2Cmhdp.yaml%23&a
> mp;dat
> >
> +a=02%7C01%7Csandor.yu%40nxp.com%7C7862af2fa05b490b6fe908d8074eea
> 14%7C
> >
> +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637267382802978543&
> amp;sda
> >
> +ta=1AoEDe9F2v7fy0RRWkn%2BgEXWgvt78E1D8DqmCf8AsnU%3D&amp;reser
> ved=0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=02%7C01%7Csand
> or.yu
> >
> +%40nxp.com%7C7862af2fa05b490b6fe908d8074eea14%7C686ea1d3bc2b4c6f
> a92cd
> >
> +99c5c301635%7C0%7C0%7C637267382802988539&amp;sdata=X5HtTsR2roO
> %2FyqOI
> > +JbaLy3hEcxjmU5QL5b1UHXOdbLg%3D&amp;reserved=0
> > +
> > +title: Cadence MHDP TX Encoder
> > +
> > +maintainers:
> > +  - Sandor Yu <Sandoryu@nxp.com>
> > +
> > +description: |
> > +  Cadence MHDP Controller supports one or more of the protocols,
> > +  such as HDMI and DisplayPort.
> > +  Each protocol requires a different FW binaries.
> > +
> > +  This document defines device tree properties for the Cadence MHDP
> > + Encoder  (CDNS MHDP TX). It doesn't constitue a device tree binding
> > + specification by itself but is meant to be referenced by
> > + platform-specific  device tree bindings.
> > +
> > +  When referenced from platform device tree bindings the properties
> > + defined in  this document are defined as follows. The platform
> > + device tree bindings are  responsible for defining whether each property
> is required or optional.
> > +
> > +properties:
> > +  reg:
> > +    maxItems: 1
> > +    description: Memory mapped base address and length of the MHDP TX
> registers.
> > +
> > +  interrupts:
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    - const: plug_in
> > +      description: Hotplug detect interrupter for cable plugin event.
> > +    - const: plug_out
> > +      description: Hotplug detect interrupter for cable plugout event.
> 
> Does the IP core really have two different interrupt lines, one for hot-plug and
> one for hot-unplug ? That's a very unusual design.
> 
These two interrupter generated by SOC.
The IP Core haven't provide interrupt lines to SOC, it only provide HPD status in Firmware.
  
> > +
> > +  port:
> > +    type: object
> > +    description: |
> > +      The connectivity of the MHDP TX with the rest of the system is
> > +      expressed in using ports as specified in the device graph bindings
> defined
> > +      in Documentation/devicetree/bindings/graph.txt. The numbering of
> the ports
> > +      is platform-specific.
> > diff --git a/Documentation/devicetree/bindings/display/imx/mhdp.yaml
> > b/Documentation/devicetree/bindings/display/imx/mhdp.yaml
> > new file mode 100644
> > index 000000000000..17850cfd1cb1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/mhdp.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> >
> +cetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fmhdp.yaml%23&amp;data=0
> 2%7C
> >
> +01%7Csandor.yu%40nxp.com%7C7862af2fa05b490b6fe908d8074eea14%7C68
> 6ea1d
> >
> +3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637267382802988539&amp;sdat
> a=88VM
> > +M6TP6Sd%2FwGnKsZ7REO1S5FNY5UJ6ll0H5pecNrY%3D&amp;reserved=0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=02%7C01%7Csand
> or.yu
> >
> +%40nxp.com%7C7862af2fa05b490b6fe908d8074eea14%7C686ea1d3bc2b4c6f
> a92cd
> >
> +99c5c301635%7C0%7C0%7C637267382802988539&amp;sdata=X5HtTsR2roO
> %2FyqOI
> > +JbaLy3hEcxjmU5QL5b1UHXOdbLg%3D&amp;reserved=0
> > +
> > +title: Cadence MHDP Encoder
> > +
> > +maintainers:
> > +  - Sandor Yu <Sandoryu@nxp.com>
> > +
> > +description: |
> > +  The MHDP transmitter is a Cadence HD Display TX controller IP
> > +  with a companion PHY IP.
> > +  The MHDP supports one or more of the protocols,
> > +  such as HDMI(1.4 & 2.0), DisplayPort(1.2).
> > +  switching between the two modes (HDMI and DisplayPort)
> > +  requires reloading the appropriate FW
> 
> Does the IP core integrated in the imx8mp SoCs (as that is what this binding
> targets) support both HDMI and DP ? If not this should be reworded to be
> more specific to the SoC.
> 
Yes, the IP core have one MCU, it could run different firmware to support HDMI or DP. 
> > +
> > +  These DT bindings follow the Cadence MHDP TX bindings defined in
> > + Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml with
> > + the  following device-specific properties.
> > +
> > +Properties:
> 
> Have you tried validating this with make dt_binding_check ? See
> Documentation/devicetree/writing-schema.rst for more information.
> 
I have run the online yaml checker, I will check it with make dt_binding_check, thanks.
> > +  compatible:
> > +    enum:
> > +      - nxp,imx8mq-cdns-hdmi
> > +      - nxp,imx8mq-cdns-dp
> > +
> > +  reg: See cdns,mhdp.yaml.
> 
> This isn't how bindings are referenced. You need to reference the parent
> binding with $ref, either globally, or on an individual property basis.
OK
> 
> > +
> > +  interrupts: See cdns,mhdp.yaml.
> > +
> > +  interrupt-names: See cdns,mhdp.yaml.
> 
> That's it ? No clocks, no power domains, no resets, no PHYs (especially given
> that you mention a PHY companion IP above) ?
> 
Yes, iMX8MQ HDMI/DP firmware loaded by ROM code for security check,
IP core clock and power will management by ROM code, it will keep in ON status when device bootup.
The PHY configurated in platform files, it will generate pixel clock for HDMI controller. 
So no clocks, power, reset and PHY.
> > +
> > +  ports: See cdns,mhdp.yaml.
> 
> This isn't correct. Please soo of-graph.txt. If can have either one port node, or
> one ports node that contains one of more port subnodes. In this case you
> need at least two ports, one for the input to the HDMI encoder, and one for
> the HDMI output. The latter should be connected to a DT node representing
> the HDMI connector. Yuo can search for "hdmi-connector" in the .dts files in
> the kernel for plenty of examples.
OK, I will add more information later.
> 
> > +
> > +Required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - ports
> > +
> > +Example:
> > +  - |
> > +    mhdp: mhdp@32c00000 {
> > +      compatible = "nxp,imx8mq-cdns-hdmi";
> > +      reg = <0x32c00000 0x100000>;
> > +      interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +      interrupt-names = "plug_in", "plug_out";
> > +
> > +      ports {
> > +        mhdp_in: endpoint {
> > +          remote-endpoint = <&dcss_out>;
> > +        };
> > +      };
> > +    };
> 
> --
> Regards,
> 
> Laurent Pinchart

Regards,
Sandor
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
