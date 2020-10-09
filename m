Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1C288B84
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 16:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C406ED02;
	Fri,  9 Oct 2020 14:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632B76ED02
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 14:38:04 +0000 (UTC)
IronPort-SDR: QQHvuwSnkBkp5E5WrtJlu83yHgTRHPUDez/sdC3l5RaPxMXsXrxKKfgICIoxTP0pNDBmGKxQmu
 rGGrGrFZfk0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="227140863"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="227140863"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 07:38:03 -0700
IronPort-SDR: d0a0+EWQ5gtfFFW1pHeufLMBtlZlMY3g0lqaEuQ18rT2gvu5/zzX5syuy941igw+z4AtlZYXjS
 2pJSo6cosmPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="419467291"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 09 Oct 2020 07:38:03 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 9 Oct 2020 07:38:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 9 Oct 2020 07:38:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 9 Oct 2020 07:38:02 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.55) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 9 Oct 2020 07:38:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNlESGVRzacFbvth+n6nVdBICZGXmkGp4aPF/hEnc8EcJFlnsIQW+P80+mSSjrT2JxNi0027KUdq5iKJqBySMopDuC5GiHsfma15p8y+4nyiVPmBj89YvDgWaiNwQMEeqNrzqMibg9CEooE00re7UMrtYf/obrbJ8Fzvuc1dEL69eIZ34hY0KmmV+iT92xej28D8mM4dNLmbyj5wchLr0SQ6tl4cS9Id2AeIXw9AKMpE7Kr2EhrVJpFeVSq4eMKFCxFjtlPUTG4C26cwK2PfpW7sw8v+Uifp/HK3iWQgQ9XpadCLx1lCZzqL8D9yilVHnFH4WdnCBb2cpI0xidDWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DllsKjt6dvS6wZpbB5CCqt477IFPmn6LSORJxDWL+cM=;
 b=kX/mRV7NGuJhfQrBrBIkEEMwhHQHrVaRy2f9DoeFRL3Ue3bnRDP3lah+3U8YnM87KsPAVAfdkvkUT1fkReqF3M55NHzAG4WLVcD7A8qEfBzUT06mLwe29buikQnC7vHk/0c00fk1IQzUQ65w1avBVe6qETYVLvz4lX7bWVWRH0vwJZxh6yuq3YhVYB21llIhkW+j4uicb1UIh1pRNMuhemkmji5/DY/OudFDLQsLoY2WU/uOCOHYUbebclwB8cUU3KRrIenLdB/0Vhju5kKOVSfOo5B8iTMm+hZw6aGn7fe9WuTZVxAcIGApSs7VgklrbfV1d3VyKygQTY3lTCAozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DllsKjt6dvS6wZpbB5CCqt477IFPmn6LSORJxDWL+cM=;
 b=jy3endarTNSQZx9XevLRlh00dNd2kTRJaoh06tmcSFAKADtJyd1hfXpEfG+4FXv5CKF8vycwd0T4eTxZsA+2aaOAxcs2afZDIeqryFp1Rnz/A+6I8O/Ym0X2X6aerAFgEjRbAvvkF2QnGKrL7oguGUDdfAXYUJi7tlJ+sc1iymU=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 9 Oct
 2020 14:37:58 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::890d:4fb5:9d54:4de5]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::890d:4fb5:9d54:4de5%6]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 14:37:58 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Vetter, Daniel"
 <daniel.vetter@intel.com>
Subject: RE: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
 KeemBay Display
Thread-Topic: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
 KeemBay Display
Thread-Index: AQHWndgiYWw6xeqrr0Kdi1tw4Hng3amO/CuAgABasyA=
Date: Fri, 9 Oct 2020 14:37:58 +0000
Message-ID: <BY5PR11MB41826EBE4463D81663607EA08C080@BY5PR11MB4182.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: d6528348-1735-4825-718d-08d86c60eae9
x-ms-traffictypediagnostic: BYAPR11MB2806:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2806E31DF1803F342C96CC4B8C080@BYAPR11MB2806.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GcdVwAM9VertsdkNUxD5pxEkeCr9gBhFqtBqxyCTLW1z+rMXKJS//FnVH7222p02hveAsOJq9LRPMN6kAxDpgrhmbM6ya7jlC63Ob2zISb4K01/2du5IjIUVqkc7zvfcSJ+xW7Xe1KZsQSMGL0BrpeyGH1iaET6wA8kcUzHV49hDxJn23VBNkEO3qk7+l2yqWX8P2MDQIDq3MphTtCo66awvXUyoOIDpfLlSFjp8urh8VRzozYrigOpdAljSUvIu3yG+e+Iw5uSZApRKMUxPQdCjnxk5IYtD1YqRzJwDuONjEO0tJ2Sqdx1Jeeid3f5uwU5aA/YrIQ9EMM8fk1qRnkj9e7Bp5Km1dhLViQBIIe1jXrHqVVIRUTAuzVLE/8PhpAQECS39vpMQvKvBnU0tEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(53546011)(478600001)(2906002)(33656002)(86362001)(9686003)(186003)(76116006)(83380400001)(55016002)(4326008)(52536014)(54906003)(6506007)(8676002)(6636002)(83080400001)(71200400001)(7696005)(64756008)(316002)(5660300002)(26005)(66946007)(966005)(110136005)(66476007)(66556008)(66446008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aCnsZEd7KoMPWK59CW6/6Vh/omFyNhebGYmPQOiQGv5AxjFoH6s4llUnqo44SGEdFgFp754lwpYDGOZGj2GVhumiF8ruQ1pFLNx0xfIMjmZ4j7Hn1Xwmzmrypee0hcPAR5iEBGJFIcMYoMI0J6JAOxrl9lhSnOo6Y5DEzaXnfJRvrst9qb+sxEvcCWTPAd2egTh0S5Wjvm+ux4w0CVCX9yUtAxf0I+/+Dapt2kv7yxWF+kahuYI1pOeUvls3ZsnH3JUWnz6DSz0gnH/c/ZA8fVt0x/NFcZjv+jRL/oWdqRsggRoQ90MCqIo2eeC/FlKVAz3Ehb8HSPKmysAo7f60wUwpf8m27kgoPQQkA9Ibc97E22Z6FyUQfUL9yRXGNNF2zHBO0/WC+zsumijk14xD6YOMMR7kzA76dxYM2H7H0axwUBDM9yU1HKyiMrsfFt0fFm8/zdBKaRpdw0yXQhincoKxPSC7mEZJofZSpnqGKnPgn0xU5pNv8JKxyiKmh1VvxMQCYSRyGEMYuEWARiiQ2XxmfcGOZJXuNOLd0Wjw7dGeZGjqd1fBWcrbw70kfxm0FHupxQN0Z09CbWCHGSWFKdfMf8R3ZBr86W2R7i9jl6Q+XHs83NdfKEZQNxgbgOFrf6MrRHOfWAX26eJOwrEkKg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6528348-1735-4825-718d-08d86c60eae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 14:37:58.4424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qb1qU1PZefLYjceUvx7KNMNSMROM2nha/bNO93s+R/40/f+8CGD8aKf+6VfErBhdSqKV7vPgfEmvBUtL71urqh45jic+pMsOaiZsiMcFjRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
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
Mipi is not a separate IP, it is all part of one sub system in the Intel Movidius Soc.
> 
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

> Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
