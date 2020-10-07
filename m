Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B76CE2855AC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 03:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77556E84A;
	Wed,  7 Oct 2020 01:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F38F6E84A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 01:00:37 +0000 (UTC)
IronPort-SDR: F2gfTnyMcgl9JYK0/tqB1r3pXITNJIfyjdzSwxbxCjh1nYCCyDm+zkLeebmu7n4rzsPN5+D1BU
 j2d7Ylbtg1yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="249480467"
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; d="scan'208";a="249480467"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 18:00:36 -0700
IronPort-SDR: RFrvSRsTjEOkmWEYuys3nF/kFDeYN3CY02P3KLjw4RRe/fp08KNirHMT5O0ry6U35Nnh6zuDbc
 Ah7VLmlZJsOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; d="scan'208";a="388149542"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 06 Oct 2020 18:00:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 18:00:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 18:00:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 6 Oct 2020 18:00:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.54) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 6 Oct 2020 18:00:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTv3pcgv1Jsy702H+9CgfyotspWj9ap/aiinpnk+ulRUZt3VHM2dexznrNagqdNrryuxMbKwpfwqtdYEPyBWqJcyNihDsk0yGvYv+QCJRyjFHtkc2omgJ2CGfpZV4vHVs+eR/lUGT24RYkvwdXLurSr9Z3iHnrNhXHIbTPxiuWLlPVXpR8sye/gojy5TiCfc8t2CGQo/oQIiKQfmSYbJKdsWDc+RoSL6Y5oBXQDh1D5WjO3muQE+M5QJCOE6o4JNfAgJuoC3mA594Ad5QAErpKOTP8Ii6coYaZNVR/hMcUb6+AVEFbDVMv2U4nURn4J7JCkJuwwV504kp50F5oo7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7mvdg0yzbFXimkVf4TsH1Gv7BnI8HesLjpLcXLg3P0=;
 b=oZizRPldcbMdXK7nWytfOM4QmokNxbYngHxXMG+FXOda4LH9t0Y+Y6F22SNSAXrVHErmpspBN6zhneMX8GRXUmajv51ExujzuKpQImSU+zrL9AoHLA2AGI9Ob8bmjt3CjDpOIqAwaS7J0j4DFg8qBuoUmavNmjis/QrmoZ9nEon+GXIxmxQoOtTP7/R0vODg+YSFYQdvH0r8+LKBHl+WstjEnawoaGPSbY0tGNBSUzsDJj6qUYUzC8IQCqxp5aIf4noQfrJreb8vzfknNWVqXNiTu1xjJMAeCIz7siSA6jfbrxx9A4fHfvWZvBkjowx3+pxi28WrU2mOzoE3F7EFHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7mvdg0yzbFXimkVf4TsH1Gv7BnI8HesLjpLcXLg3P0=;
 b=cefvPBO9CPMy5zOu+GaXqdzvM3xlu9IVhIoSJFKrOvzlqkFuwH0MDp9nhoWe9XZajL81cY5LB5Q4HP0yCXh27Fsqbgf+3b7bLQmdolRZnSHsDImocr133cnGMF6mDhZgtNIACvtzfjPPrt6vAjbjcw79NDRyvbo0G70z20FicGM=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB4151.namprd11.prod.outlook.com (2603:10b6:a03:18f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Wed, 7 Oct
 2020 01:00:24 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::1d4e:2269:63d7:f2d6%6]) with mapi id 15.20.3433.044; Wed, 7 Oct 2020
 01:00:24 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v1] dt-bindings: display: Add support for Intel KeemBay
 Display
Thread-Topic: [PATCH v1] dt-bindings: display: Add support for Intel KeemBay
 Display
Thread-Index: AQHWmT9T+lZ2h4tsf0WrNmH6ew39CKmLFxuAgAA4mgA=
Date: Wed, 7 Oct 2020 01:00:24 +0000
Message-ID: <BY5PR11MB41827DE07436DD0454E24E6E8C0A0@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1601691662-12954-1-git-send-email-anitha.chrisanthus@intel.com>
 <20201006210813.GA2829155@bogus>
In-Reply-To: <20201006210813.GA2829155@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2956b31-00ee-4ef7-e08c-08d86a5c5fab
x-ms-traffictypediagnostic: BY5PR11MB4151:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4151014206C82FC47242722F8C0A0@BY5PR11MB4151.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mUCrjJ21VNLU527HSx7oxwCrLSA0CxfUC4KY2H/bxj7AeGGG9KcvpJy9Cx28kKT2udlKaMsFWT5MX/YDn8TD+aahttYo2RtEO7k1GpAOT71xDIdpEd/PV73Pmm2yChXAs5a8YLTKAQBr63QlgmFNiTwZomCN9GUHyi4+xFvOpR/Tfu6yMv2mKhK/ocYCrvNbx6Dznl0aukv2tVI3QcR09YU6MlYRhXdqKb3LRnOHRPYekvtUfo6jLZtUNPPcLGS9Fi69WsltwB86wtMGCIpFLUrKbtcS2/jnz9hWDLlObOTpGUhkZ06TeFuEJzhl73fzcoehJAiV97N7E1l+z27TnLfAoc3AqARqF6gcY7UrOnfctzTv5j1wXV8uQnsHqsOi6NbsFpspZxOZi4YIdMVwOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(66556008)(64756008)(66946007)(8676002)(9686003)(66446008)(66476007)(966005)(76116006)(71200400001)(478600001)(52536014)(5660300002)(4326008)(54906003)(33656002)(7696005)(55016002)(8936002)(6916009)(6506007)(316002)(53546011)(86362001)(26005)(2906002)(186003)(83380400001)(83080400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: z+LJBASZYNUFKDg3U8/9Um4yXcSPg6VliNufv5YffVo85szMSUdOV4LwHiP79CgI09b3qz4bHsujQwym6MkN3sXMZvkBMaaEjCFi13DLAYgg2CSp2OWnTnmrVAv9ZPBzpptljcfVV6jC+dKTvnz3D2dOf6YqKVMZh1BY9DC26/eWOgAmYWTXE4KoQPIh8shZaPbCcc283lUyuVmdhhAY5ti4J9f+fNUuF9sINGK5kMXTGZGJQBiEzKFz5asX35WEyb8B+urhouUh0o6reTadBmiNYMiskzW+NzN83+bkzBhlIY6bQ3FrwxCy8j1MPmpQ6CE/Gc8MwdmWBmvkZHMebztBiOuoLMEvZXMJ8SZaEcpznBehQnLKU+lSTYu+qzjbrnDH/I0ooPQG+Car7oRl2rnxZXrQTe5ipCNOonHUTl5+HQIqLHjK3dWTq1T1bGDAC6gwx/TFPd/y0ya2GMRI1lya8sSEjKogglHaoVI2X+LJVHFmA8sRPlSt+mf01vv2ZWlYH1VNGNsDY8PyoOxQY9fTh0KyzQeYswVGFVIsCGxbfNRt8bbfLlqemK5Iogaf6N7eMZuLXKUKvHyTwL7+PbFLCZQvk0KRMw4sLgV6YS2RxIa9WefYlGzq34bAhrewfX5oW0KWvSLnIchdndTi9w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2956b31-00ee-4ef7-e08c-08d86a5c5fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 01:00:24.6720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vp/PEE0a6xDYh5ffUA/MXbKBmqYOl/KBOYKwV9jHXftptlvsR3giP8htsZLzdwEZocitn9OqFkEGrP7E5OSAZZxyjm+HewONotgiVxSnWCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
X-OriginatorOrg: intel.com
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,
Thanks for the your prompt review. Please see my comments/questions inline.
For everything else, I can incorporate the changes in v2.
Anitha

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, October 6, 2020 2:08 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: devicetree@vger.kernel.org; Paauwe, Bob J <bob.j.paauwe@intel.com>;
> Dea, Edmund J <edmund.j.dea@intel.com>; sam@ravnborg.org;
> narmstrong@baylibre.com
> Subject: Re: [PATCH v1] dt-bindings: display: Add support for Intel KeemBay
> Display
> 
> On Fri, Oct 02, 2020 at 07:21:02PM -0700, Anitha Chrisanthus wrote:
> > This patch adds bindings for Intel KeemBay Display
> >
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > ---
> >  .../bindings/display/intel,kmb_display.yaml        | 106
> +++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> >
> > diff --git
> a/Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> b/Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> > new file mode 100644
> > index 0000000..65835cb
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> 
> check checkpatch.pl
> 
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/intel,kmb_display.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Devicetree bindings for Intel Keem Bay display controller
> > +
> > +maintainers:
> > +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > +  - Edmond J Dea <edmund.j.dea@intel.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: intel,kmb_display
> 
> 'keembay' was used elsewhere. Please be consistent.
> 
> Don't use '_' either.
Please note that I cannot change the name at this point as there is a dependency on the u-boot firmware which loads the device tree. I can change the name to kmb-drm or keembay-display when updated firmware becomes available.
> 
> > +
> > +  reg:
> > +    maxItems: 3
> 
> Can drop, implied.
> 
> > +    items:
> > +      - description: Lcd registers range
> > +      - description: Mipi registers range
> > +      - description: Msscam registers range
> 
> Is this really 1 h/w block? Don't really seem like it given addresses
> aren't adjacent, separate clocks, and MIPI blocks are often licensed IP.
Yes, these are part of the camera subsystem block of Intel Movidius Keembay SOC.
Please see  https://lwn.net/Articles/833540/

> 
> > +
> > +  reg-names:
> > +    items:
> > +      - const: lcd_regs
> > +      - const: mipi_regs
> > +      - const: msscam_regs
> 
> '_regs' is redundant.
> 
> > +
> > +  clocks:
> > +    items:
> > +      - description: LCD controller clock
> > +      - description: Mipi DSI clock
> > +      - description: Mipi DSI econfig clock
> > +      - description: Mipi DSI config clock
> > +      - description: System clock or pll0 clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: clk_lcd
> > +      - const: clk_mipi
> > +      - const: clk_mipi_ecfg
> > +      - const: clk_mipi_cfg
> > +      - const: clk_pll0
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: irq_lcd
> 
> You don't really need *-names when there's only 1 entry.
> 
> > +
> > +  encoder-slave:
> > +    description: bridge node entry for mipi to hdmi converter
> 
> No, this is what 'port' is for.
Driver calls this
encoder_node = of_parse_phandle(dev->of_node, "encoder-slave", 0)
And  bridge = of_drm_find_bridge(encoder_node); to locate the bridge driver.
How do I do this without this entry? Please advise.
This was tested and it works.
> 
> > +
> > +  port:
> > +    type: object
> > +    description: >
> > +          Port node with one endpoint connected to mipi to hdmi converter
> node.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - encoder-slave
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #define GIC_SPI
> 
> There's a header for this.
> 
> > +    #define MOVISOC_KMB_MSS_AUX_LCD
> > +    #define MOVISOC_KMB_MSS_AUX_MIPI_TX0
> > +    #define MOVISOC_KMB_MSS_AUX_MIPI_ECFG
> > +    #define MOVISOC_KMB_MSS_AUX_MIPI_CFG
> > +    #define MOVISOC_KMB_A53_PLL_0_OUT_0
> > +    display: display@20900000 {
> 
> Drop unused labels.
> 
> > +      compatible = "intel,kmb_display";
> > +      reg = <0x20930000 0x3000>,
> > +            <0x20900000 0x4000>,
> > +            <0x20910000 0x30>;
> > +      reg-names = "lcd_regs", "mipi_regs", "msscam_regs";
> > +      interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> > +      interrupt-names = "irq_lcd";
> > +      clocks = <&scmi_clk MOVISOC_KMB_MSS_AUX_LCD>,
> > +               <&scmi_clk MOVISOC_KMB_MSS_AUX_MIPI_TX0>,
> > +               <&scmi_clk MOVISOC_KMB_MSS_AUX_MIPI_ECFG>,
> > +               <&scmi_clk MOVISOC_KMB_MSS_AUX_MIPI_CFG>,
> > +               <&scmi_clk MOVISOC_KMB_A53_PLL_0_OUT_0>;
> > +      clock-names = "clk_lcd", "clk_mipi", "clk_mipi_ecfg",
> > +                    "clk_mipi_cfg", "clk_pll0";
> > +
> > +      encoder-slave = <&adv7535>;
> > +
> > +      port {
> > +            dsi_output: endpoint {
> > +                remote-endpoint = <&adv7535_input>;
> > +            };
> > +      };
> > +    };
> > --
> > 2.7.4
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
