Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16298182A99
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E544D6EA5C;
	Thu, 12 Mar 2020 08:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410093.outbound.protection.outlook.com [40.107.141.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFE86E972
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:49:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArbMXksAdMjH71GTkJLU7+cDAsZikNYaWV/R9PJR3Jt9XpuKjFJ8TGrn3O3GFU5TZZ262mk1qzHt9d3i9CnxLugMMTv2zuJNJP392u9MSXKupweZa/wiiKrJNwsyigcfuVkbmN4EVwpfMVq4ziD9m7tl2z4suf8JRCW5Z9gh1KKA30fVjMpbkQNZLFTaxRJjq3/03R2MBPxnT98onx1ONtHOkJonYk24qW9OloMbYpxgGJvYY1rbbbVF8xl+skkgF1Eorc0feZz+5wGMIyu6UEgecoE9A5GTDk3TYaPuCx9Df5O2PmZF7gkBLPR1zpoPBsneSFlUCbqD4qzFv8ZOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMXbZYQQb8m0Y8Qy8wJLAS0Skd/dIIb09fC0Fvcvt2E=;
 b=j6TRcUhPPvueyuJB+uzvKE5Yqr0XftJTI6s9PzyIqeY/bbw0RdIKujpezqplopugyKHAJVieCz2Mt69Zmn47QfazsNY/yMggCPgOU0hapZp4qqZh/xK3Nn+HzVVmZuylV8A/a66YqhAw4ms7fID3GpahO6pKDcZ417oWaT49xHOqLGRnFWam2GDyrHoB8jOZWUWg1MMo61Zh4FIgmC38aROFY6v1wq0pjiM+9ziqAfIenaOsZ3/8DAZ4S3gErC1UPCwmeGCqikl1Isr+FEtiLHdxuf96tY/pH0OCj1GwKX/uuhTQIp0DsRR76WE4WWD6X0wgcSUT/iaonbSnWi1D/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMXbZYQQb8m0Y8Qy8wJLAS0Skd/dIIb09fC0Fvcvt2E=;
 b=hYgmeJaCTBZFBieHkGniwlXLVw/+wqsDLBsn/nR6S4TLqyR9c9xzJddVP+Cco94SGUl/lfUg9b9bPR289TnpN3ezuIs7uU/44tGqRg0TjMVAuD/d99vYu8zq6GbyPTTGwsB4t5ScFyae8T+3nrU16caIpmxxRZVoEtvOLgA4Bfc=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3557.jpnprd01.prod.outlook.com (20.178.98.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Wed, 11 Mar 2020 10:48:56 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.018; Wed, 11 Mar 2020
 10:48:56 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v3 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Thread-Topic: [PATCH v3 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Thread-Index: AQHV9xxgNgWVqJ/znkuQrjrqPZBb+6hDK7qAgAAJnFA=
Date: Wed, 11 Mar 2020 10:48:56 +0000
Message-ID: <OSBPR01MB35902F7A2B38C875C731318EAAFC0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1583872919-7757-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583872919-7757-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVqwLEavjnPgZaevFqjTytAPMmT042yRrcDw9YpkjE3bg@mail.gmail.com>
In-Reply-To: <CAMuHMdVqwLEavjnPgZaevFqjTytAPMmT042yRrcDw9YpkjE3bg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7efc6479-6174-4517-2725-08d7c5a9cc78
x-ms-traffictypediagnostic: OSBPR01MB3557:
x-microsoft-antispam-prvs: <OSBPR01MB355702F7351648482A66DFF7AAFC0@OSBPR01MB3557.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(6029001)(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(199004)(26005)(52536014)(66476007)(64756008)(66446008)(186003)(76116006)(66946007)(66556008)(316002)(8676002)(81156014)(81166006)(2906002)(478600001)(86362001)(8936002)(54906003)(5660300002)(53546011)(6506007)(7416002)(71200400001)(6916009)(7696005)(9686003)(55016002)(4326008)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB3557;
 H:OSBPR01MB3590.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p9nBI6v7XTdg1g7q3GbQGfM0EY+ToUOXbJHVlTpv9nUR7VNq4/G/LL+UBy2h6rOguzMBNMiEcL2ljdrjATSr5olDBMBdSWxhaHv8E1oPlrthsOQHOcM+3YEDNvnzaPYPj0KLuwzdYc2MrsT3lEp5907HPJPs2B6aE0N1nwgWBpTZTSiljnqFbW88qZSswKUMdzoxzSUQvd2dQq8xo8AWd1F40hJizwcrZ2Hl9N/nHdtJ/bQlt6CcjWrqUK8wUmkAhfPiJpL0lBCQSfdYVx8R98Itit18O60P7P3tRsVLoxGixorS4DGJXB82sBecepA6P766Nbh4+jCUFvUtSy6V3WDKJ3BCUessbE0ofm1a8I1QLtVQyGmlHZRG931PrkbrLNZtGPAxb3NCQK+StMVwyfUGvzafiOGSFXKQiafpctCzw39fYvlOjmp4oWNoGRVe
x-ms-exchange-antispam-messagedata: gLZTFtqWpXW27+I6+AQXm1xQgi27FbfgKF+/Owxtt3bGm8c3bgNb1birDBdFF9oQsRx1b4a6FJhux7I0YK3WCZRmvkH5hQt9HbqU26uP/fWYy4j1vXUKsV0fRD6A2yjCdXuuxX1j5CmbxvZJ8oZcog==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efc6479-6174-4517-2725-08d7c5a9cc78
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 10:48:56.4746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mRpIrd/mv/jZ3geNd+9N7zPa69WG90pjelK6yNYrsGVDTbiyX4yl+lL812O1KVjLsEMc27RI0jdzyTItDmUdbaKp4q6DO6WB1EaD9OoTpQFbdB0JOwMYXY/giY+KW3I8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3557
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the review.

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: 11 March 2020 10:08
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>; Sam Ravnborg
> <sam@ravnborg.org>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> DRI Development <dri-devel@lists.freedesktop.org>; open list:OPEN
> FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Linux-Renesas <linux-renesas-
> soc@vger.kernel.org>
> Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board
> with idk-1110wr display
>
> Hi Lad,
>
> On Tue, Mar 10, 2020 at 9:42 PM Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com> wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > The HiHope RZ/G2M is advertised as compatible with panel idk-1110wr
> > from Advantech, however the panel isn't sold alongside the board.
> > A new dts, adding everything that's required to get the panel to work
> > the HiHope RZ/G2M, is the most convenient way to support the HiHope
> > RZ/G2M when it's connected to the idk-1110wr.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
>
> Thanks for picking up this patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-
> 1110wr.
> > +++ dts
> > @@ -0,0 +1,86 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the HiHope RZ/G2M sub board connected to an
> > + * Advantech IDK-1110WR 10.1" LVDS panel
> > + *
> > + * Copyright (C) 2020 Renesas Electronics Corp.
> > + */
> > +
> > +#include "r8a774a1-hihope-rzg2m-ex.dts"
> > +
> > +/ {
> > +       backlight {
> > +               compatible = "pwm-backlight";
> > +               pwms = <&pwm0 0 50000>;
> > +
> > +               brightness-levels = <0 2 8 16 32 64 128 255>;
> > +               default-brightness-level = <6>;
> > +       };
> > +
> > +       panel-lvds {
> > +               compatible = "advantech,idk-1110wr", "panel-lvds";
> > +
> > +               width-mm = <223>;
> > +               height-mm = <125>;
> > +
> > +               data-mapping = "jeida-24";
> > +
> > +               panel-timing {
> > +                       /* 1024x600 @60Hz */
> > +                       clock-frequency = <51200000>;
> > +                       hactive = <1024>;
> > +                       vactive = <600>;
> > +                       hsync-len = <240>;
> > +                       hfront-porch = <40>;
> > +                       hback-porch = <40>;
> > +                       vfront-porch = <15>;
> > +                       vback-porch = <10>;
> > +                       vsync-len = <10>;
> > +               };
> > +
> > +               port {
> > +                       panel_in: endpoint {
> > +                               remote-endpoint = <&lvds0_out>;
> > +                       };
> > +               };
> > +       };
>
> I believe the plan was to include the existing rzg2-advantech-idk-1110wr-
> panel.dtsi instead, to provide the panel-lvds node...
>
Ahha missed it, I'll quickly respin the series fixing it.

> > +};
> > +
> > +&gpio1 {
> > +       /*
> > +        * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
> > +        * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
> > +        */
> > +       lvds-connector-en-gpio {
> > +               gpio-hog;
> > +               gpios = <20 GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +               line-name = "lvds-connector-en-gpio";
> > +       };
> > +};
> > +
> > +&lvds0 {
> > +       status = "okay";
> > +
> > +       ports {
> > +               port@1 {
> > +                       lvds0_out: endpoint {
> > +                               remote-endpoint = <&panel_in>;
> > +                       };
> > +               };
> > +       };
> > +};
>
> ... and the lvds_connector endpoint configuration.
>
Agreed.

Cheers,
--Prabhakar

> The rest looks good to me.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-
> m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE reg. no.: DE 14978647
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
