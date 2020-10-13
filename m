Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA4628C5A2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 02:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E706E863;
	Tue, 13 Oct 2020 00:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097AB6E862
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 00:24:48 +0000 (UTC)
IronPort-SDR: TLRbHuDmTeXiCkVhc+I5cszn4W9AJH94FW4oI97U6FxcGRy9fLotY9JW83f5I6RFQdFmqaFyy3
 g1ONJ1JzRgIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="183291787"
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="183291787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 17:24:47 -0700
IronPort-SDR: b/rjLi74jCcqz7O0qd5yxSMxshS2dYUGcrFtUXTx8Nio2bKbt14s2LZCDUmf+mMo5M98p5sZeK
 vTvJAPFLGXgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; d="scan'208";a="299437193"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2020 17:24:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Oct 2020 17:24:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 12 Oct 2020 17:24:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 12 Oct 2020 17:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6ocL3KHeXGxTdQ192tU/A2P4bMZTpeSvLN8u5b/hxxECg2Pmg2HAvdkRMUqUCnJrfI7FoSAP5dzBjjInGUI0SF7V0+69+/9ZFpiWrB/qUWdWOY/NrZoXWROmTsjnGJmJpA/fs2TtYP3T7arOz8NYzl8O0fhm8RL51o5vv6fG7A5SJDmlwyqdpHbBYuwmW6+qr/PKNKLxmLCkj1eOf2bKziydELDEioJZxfBYLBRnoS5hHy3pI6nhWgK08SOi1Q542++o/zLSmcnxG7gtOCru2eHXFnDMX45XHu1/dWA716olN9FoeCm4cZVfyJaNUXg0v1fDfBYLHK266j30NJBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+U8d/7U8HsyBdtEUOCFi+RDSikBFOI3ZXB6roH4jy8M=;
 b=iu2QlX8biVSR1VDQGq6vbHYuUmHbJKpJs+dgr4wLCTylp5gPzjlqx2M9U7lujfPA/lm3nGc1Lt1Bc60X55ESP6cft+T1PjLANKwsjaFMg4+xWYEUEZVwyJqOWZKXsU74myqbCEsoIJSNlFnwg/K9hYqiabK6NhwPuCVwx+ItP+6mkewaxz0oEQ2fNYHWbGm/4om5Smcc+nZZ0FRPkXAEFXHEnqnUCuOATp/oTB44oyvm8adpfmvu2r2PErxUYwyGnA15AngAi4evyClyHD4PUqzrsgkbGRy6bhKInaakaHy/La+hwbTv2h1sbMME4c81EdpEztifrvwbx3TkYzRoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+U8d/7U8HsyBdtEUOCFi+RDSikBFOI3ZXB6roH4jy8M=;
 b=HIN0S8p0N3x8fNtf7WrqaypRoQT1Qi0mDLTsoT7I4RgtlaZsA8/Aa7vpZXepQ56fC1lI8Jb+cfZ8EdB7KLZkK55ityh23DLo7ylitKiGYYn6BEbBpCfGQWfwBscMJQSdXpEA5Sh/plXquCF0MNBHEwn3t142K5n1rsry6/yHZto=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2599.namprd11.prod.outlook.com (2603:10b6:a02:c6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Tue, 13 Oct
 2020 00:24:38 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::890d:4fb5:9d54:4de5]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::890d:4fb5:9d54:4de5%6]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 00:24:38 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Vetter, Daniel"
 <daniel.vetter@intel.com>
Subject: RE: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
 KeemBay Display
Thread-Topic: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
 KeemBay Display
Thread-Index: AQHWndgiYWw6xeqrr0Kdi1tw4Hng3amO/CuAgAWu/mA=
Date: Tue, 13 Oct 2020 00:24:38 +0000
Message-ID: <BY5PR11MB41827BBE3556CD7972E6C4328C040@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <1602205443-9036-1-git-send-email-anitha.chrisanthus@intel.com>
 <1602205443-9036-2-git-send-email-anitha.chrisanthus@intel.com>
 <dc12f5ea-60bc-8a09-9b93-a4472183adc4@baylibre.com>
In-Reply-To: <dc12f5ea-60bc-8a09-9b93-a4472183adc4@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a20d5b9-abbd-4a51-f683-08d86f0e5eaf
x-ms-traffictypediagnostic: BYAPR11MB2599:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB25999AB3834E6BE27AD0AD888C040@BYAPR11MB2599.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ChFcbTmjeKLSLjT6+i8Io76mGfzl9rAZTtiTiaOS8V2TSZMb4LTb3eXszI4Er7Vg2ExxJBOHIJZcgAVyXOtBM+khwp432ceJq4SJhkMqKarRhQowbfxDYAe+kF3iEtFI3DZUnNs87KpGJ4AsWnGOkjj2Vu7lDSnh7CVb1xTXIhuZFMH15MJ0hmVkWwh42EXSBG9UxyRYBuhE3ReA4WQac68WuKmOSfLpZhbsdu6prBImfzzhbn/yBkBI2KjHM5G7skXIwr0AZPaPyIXDU9MatedlADvyHfFj1Kk2LyaW1cA9NXO0mYcqcIqdKZwUJcHrR4rP+DymiY9m9EzTRapKcpWo9JqdX2DXyMm98HZ/KgS+2dHCxmbQPfkuYQ+fxQmHq/YtZS6tzeHTEoj3Qrg2qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(55016002)(8936002)(86362001)(83380400001)(5660300002)(26005)(2906002)(6506007)(53546011)(6636002)(83080400001)(7696005)(64756008)(52536014)(478600001)(4326008)(110136005)(186003)(71200400001)(33656002)(9686003)(66946007)(76116006)(8676002)(966005)(66446008)(316002)(54906003)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Aqe18pzghnRv64IvXMc0H/j/qIHUmTXuLZ2UGR1FmkZ/gbZWC9l2f9CPT0/+OcnswymA4rED2jqlH75WXrKLv8cvB+lD0YBwPpwr2B+BD2hjEYxnxxZpZWWJxsnSMFj2ppVX2Y5AHL/3qSMUXMOw0rsBG0h6sWqpVq78Q2qT8Nxl3xWqK+5yt+cRYZM4KRinIt+AH78AkVJ17Ea8FdW8H89hsDFebCjx6bFECUOT5NC0N3y/rq/F32CZb9xQQXVJ1gpTjVlub7C9gDYyv2tXDjry6NaMWAbRwcrQ18+j7h45IAN7SmMvM0Q5MKjL28W8yZyli3XsD9K5W84ajQ2onalT+DvXf+u2CLnvNNMdixh38N08q2xsmbTZaCy1i5MGwSOQ7HEA1O8ngbTMOD4MUI7Qo/pzLGGCx0voSwVBFPyG4eUumdC25ltpA+OngeM6kRYhemeD7cVdJeDIXdl9UxUXaGW1XE6ueYqdu8nMBWpcq8/9VeCpIsOqGc6ffetIOguqZLDsO5/P3mRd/mqOumM+4LQZp0fBFFbpJTd7lFC73LHFhXzV5iOhTph18JtybvZewe1Q3NqtacDAcum1rUmeWcEyBxHzZXszMF+gQnefg+kCkTueXR6O+tCPHezRhKyhRbMrZTtKAI4omnknIA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a20d5b9-abbd-4a51-f683-08d86f0e5eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 00:24:38.0561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KaVFqQ36mqUeJYgG5qsI8Lp1cI2KWGtlm+HUjnq8fcu5nfK0uvTMEhiLxPx4LfiUr/6Q4h0Q19I+1cc+LNcC494RAxGKNe4OIbuTXvYxzKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2599
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
Cc: "sam@ravnborg.org" <sam@ravnborg.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

 Thanks for your review, please see my reply inline.

> -----Original Message-----
> From: Neil Armstrong <narmstrong@baylibre.com>
> Sent: Friday, October 9, 2020 2:10 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; dri-
> devel@lists.freedesktop.org; devicetree@vger.kernel.org; Vetter, Daniel
> <daniel.vetter@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; sam@ravnborg.org
> Subject: Re: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
> KeemBay Display
> 
> Hi,
> 
> On 09/10/2020 03:03, Anitha Chrisanthus wrote:
> > This patch adds bindings for Intel KeemBay Display
> >
> > v2: review changes from Rob Herring
> >
> > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > ---
> >  .../bindings/display/intel,keembay-display.yaml    | 99
> ++++++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/intel,keembay-
> display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-
> display.yaml
> > new file mode 100644
> > index 0000000..a38493d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/intel,keembay-
> display.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/intel,keembay-
> display.yaml#
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
> > +
> > +  reg:
> > +    items:
> > +      - description: Lcd registers range
> > +      - description: Mipi registers range
> 
> Looking at the registers, the MIPI transceiver seems to be a separate IP,
> same for D-PHY which should have a proper PHY driver instead of beeing
> handled
> here.
> 
The LCD, MIPI DSI, DPHY and MSSCAM as a group, are considered the display subsystem for Keem Bay. As such, there are several interdependencies that make splitting them up next to impossible and currently we do not have the resources available for that effort.
> > +      - description: Msscam registers range
> 
> MSScam here seems to be a clock and reset controller for the LCD and MIPI
> IPs,
> thus should be handler out of DRM.
> 
> > +
> > +  reg-names:
> > +    items:
> > +      - const: lcd
> > +      - const: mipi
> > +      - const: msscam
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
> > +  encoder-slave:
> > +    description: bridge node entry for mipi to hdmi converter
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
> > +  - encoder-slave
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #define MOVISOC_KMB_MSS_AUX_LCD
> > +    #define MOVISOC_KMB_MSS_AUX_MIPI_TX0
> > +    #define MOVISOC_KMB_MSS_AUX_MIPI_ECFG
> > +    #define MOVISOC_KMB_MSS_AUX_MIPI_CFG
> > +    #define MOVISOC_KMB_A53_PLL_0_OUT_0
> > +    display@20900000 {
> > +      compatible = "intel,keembay-display";
> > +      reg = <0x20930000 0x3000>,
> > +            <0x20900000 0x4000>,
> > +            <0x20910000 0x30>;
> > +      reg-names = "lcd", "mipi", "msscam";
> > +      interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
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
> >
> 
> Anitha, Daniel, this keembay driver should be architectured like other ARM-
> like display
> controllers, with separate drivers for MIPI DSI bridge and msscam clock &
> reset controller.
> 
This driver was developed as part of the Keem Bay BSP targeting the LTS 5.4 Yocto kernel.  It is part of our current production BSP release after extensive testing.

At this time there are no plans to incorporate the display IP used in Keem Bay in any future products. Our goal is to get this driver into the mainline kernel so that we don't have to continuously rebase it as newer kernels are released.  As mentioned above, we don't have the resources to re-architect and then re-develop a display driver for this product and see very little benefit in doing so.

If we were expecting these IP blocks to be re-used in the future, creating individual drivers for each would make sense.  

Thanks again for taking the time to review the driver.
Anitha
> Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
