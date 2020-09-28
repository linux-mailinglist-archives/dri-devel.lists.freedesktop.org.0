Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C4627BDBC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78DA89E98;
	Tue, 29 Sep 2020 07:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410107.outbound.protection.outlook.com [40.107.141.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A246E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 07:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIzKVzy2MaJidaA+50jWJmzOgng+ziCPVUFB113AC+BR3h+oRwk+XLxLfsLvQP4Z3EqVwVZd5dvXKa1I6jbRToHXL7xu/Pg3/dMbkF4R4qwjB0307Jqnx6npS9PAE2kgm01yXNNYWz91tBArRTIjUKSPTVjOSISWsAyNOi40kXwzY2lNouSg1jSsckp+zkLWMdIB0IrHYjtfeDCRChunrI6ujjSmnx9E8OVCPU77pPrD69Bjb1RV1x9heAX+tFQ6ZzY1rKlD90aXqW4OvwjdpHYrFHvPRzl+kcWmfmolELJgbwBKFF1WFzJM6yKzUfIJuX6e1Of9DxBrewQtDXWuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T+ogERlU9jGMXsyyIuikuHy2ttcMqsInrU6bEu0TfM=;
 b=gHwaVU2AK+uVeEzArBveWfhUwa5N6oNJOteEnS8/VwUBgNomRbX+HhMA7Dsr+ABKm2vZhsoGFTk9kCUOuxaA2zfTZMcZrS/BgPOhxQYlqClzVuOiS7Bw54FZEO3qmtYOK1/qz8wVBGH2hyR73+o7qH9SF4Q391sigNnF+WEQAC4SbvR8BKklWuLAMpQGUPGjz8xJ+0iouQ2wg4gNnVhp6c+MvFRONUNjbykjSSeDz7OJikIkKG6b3upbzmqOirMUWELyOJ0yvpJcpFnYuQDXGrO4J7s/LXWYFCTr7QeHjgSR9SHCQeTEQWVUt4hvOgOCVOQ8JgBhxxIItqvKeW/NBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T+ogERlU9jGMXsyyIuikuHy2ttcMqsInrU6bEu0TfM=;
 b=lsdJvGDDJ9cQMMo06zLHxrCWY9T0nB+7NLztu9HDKEb1aYXMTzZDc5KvHLY9LeaIGDHCC6mejhufwtu4FfVUsJMpp94oUJipC89CsmT277kqxJMGZrnCFtVF1FfGlpPLor+ZseAGgL8bDjGiP+du911dzhf0nxNYR3geOTWoM4w=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSAPR01MB4452.jpnprd01.prod.outlook.com (2603:1096:604:6a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Mon, 28 Sep
 2020 07:52:38 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3%6]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 07:52:38 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Thread-Topic: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Thread-Index: AQHWcXolwARwMJAfD0yrEvn6QqsGnalGfY0AgDY8OACAAHYKAIAAvoiAgAAGmdA=
Date: Mon, 28 Sep 2020 07:52:37 +0000
Message-ID: <OSBPR01MB5048ABBC3F74E1DF49374E7DAA350@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824004816.GS6002@pendragon.ideasonboard.com>
 <CA+V-a8uq44hKOxbwBXZ_90q6e4JjCEPwOWp4BDY7BJJaP1Cg6g@mail.gmail.com>
 <20200927200418.GA3986@pendragon.ideasonboard.com>
 <CAMuHMdX0_VDVw41ZuGy0M+d6sgNMujSas4x+YqZMWwpF-TvOZg@mail.gmail.com>
In-Reply-To: <CAMuHMdX0_VDVw41ZuGy0M+d6sgNMujSas4x+YqZMWwpF-TvOZg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eb353f8b-7602-4d86-7639-08d863837826
x-ms-traffictypediagnostic: OSAPR01MB4452:
x-microsoft-antispam-prvs: <OSAPR01MB445294B97DE7B302F192878DAA350@OSAPR01MB4452.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T929nZQUv1BOU0jFMX6Hc+Qfd8zaNyrUcAuyY5rafXxdkADDc4Bf5XrPRspYIK9qIg0jM+acjLNBZ3tabFItZLGq2drtHakIuHkriQWB8cl+iaR/1KDdakz7DjOHL0pO20oCUGzVXa0Wr6XSOKVamEibkW9s8tIP12Jol/sEstlASGH2w5T/yxTmCMir09lZmUu9sJuM5NDBOOLBZY3E3C4fVB73ZaLCdBqIe+Fe7oHgrv4dy5ziuUelF5XshtkM67vXyFAzzCspbeBw5I062Qot/SfCE7o38Z7ON/oNUZZdjfBdSkRE11e1OxjT8j4bFCMko9cTf+Sj+tdNoF1+cjsrskExSDGrkxEFBP9279heNvrp1RTQNr3xg9642hPzQyAY1i0lWm01NLtIyYAf17Fj6nzu+2neTvgK7W1zssYUKutHOfySbSn+FjZHIwrnSPTnFc1l7+LXuf9pfsTBow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB5048.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(52536014)(186003)(64756008)(66556008)(66476007)(478600001)(66446008)(8676002)(53546011)(7696005)(2906002)(6506007)(26005)(83380400001)(33656002)(71200400001)(316002)(66946007)(54906003)(76116006)(966005)(8936002)(9686003)(86362001)(4326008)(55016002)(110136005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: LbLepFYNRr3bgxaK1tDkMcS/p7TNln7Cu4UguZYpNeO73Ha/+RNHKxHIWkygixMJWzchaatzNZX8IzsjRhFcyLsgnQp60CVTSnL0QX+6q2ZrWunqFrU5TGA/4rd+yCISlW8ZSZ8kLbWCXRdvHHwhOO+c5qxC0UI2iK+GlSSbOmurv93uLDSlvr+oxqbtmP1FV3SBohAwNRVVlip9hAqKdyPQxwoxEvh739fCyoylB8FGRybGm2YXS/i+bpPaNf7OiW/kZM6VKqy8fFcoFp0BGBcPj9x45CjQGKyhQ40BKKbnCKCJiWZoMm3WN430J13Eavu6SgBnrA5QYbcQYG5v5/kXWh/dI3rQR5A7hIIuXPqStWBtADLnC3YDjjwwuYHfNdxuYI+a+HIl2CNOcDh/Iv/sO8CfsxosQvGPk/guH2V9RdvLBzER9Np/XlYjVdeu2LsSd2a6yjKnxms51YFmOknMWPWOM6x/CnOVekoV7skJaUFICEjb+2SsRedvIE9jO1rKt3WohxJLJ7ATE4tD5q+t05ai5DSzwQs74zQfiDIiqd1f4iFB8kcWeVoZwAZvTY4RdosvBZeMx4pwJTrEc9Qkm+AQKC/4BlF3mujTxoulfzfNlBy/sqHJeU/jUNNpW9mUwU+pDwHdesjPdsG0hg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb353f8b-7602-4d86-7639-08d863837826
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 07:52:37.8458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1l865A22iMSs1JfYsQr8l4Pg2v6FM0Iap1/nz8uIWCUyBvUPO1SKArv50gAL/YVp/nSpIo9FM4apx9PUOHrgvOrx8rWCfhypd0s3sJPYLEd4SJN4qwuqW5mfZrUzPfui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4452
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: 28 September 2020 08:26
> To: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Magnus Damm <magnus.damm@gmail.com>; Rob Herring
> <robh+dt@kernel.org>; DRI Development <dri-devel@lists.freedesktop.org>; Linux-Renesas <linux-renesas-soc@vger.kernel.org>; open
> list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>;
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Subject: Re: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
>
> Hi Prabhakar,
>
> On Sun, Sep 27, 2020 at 10:04 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Sun, Sep 27, 2020 at 02:01:50PM +0100, Lad, Prabhakar wrote:
> > > On Mon, Aug 24, 2020 at 1:48 AM Laurent Pinchart wrote:
> > > > On Thu, Aug 13, 2020 at 03:00:41PM +0100, Lad Prabhakar wrote:
> > > > > The iwg21d comes with a 7" capacitive touch screen, therefore
> > > > > add support for it.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > >
> > > > Everything seems to match the schematics :-)
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > > > ---
> > > > > v1->v2
> > > > > * This patch is part of series [1] (rest of the patches have be accepted
> > > > >   by Geert [2]).
> > > > > * Added regulator for lvds
> > > > > * Added reset pin for touchpanel
> > > > > * This patch is based on series [3]
> > > > >
> > > > > [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > > >     ?series=330277
> > > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> > > > >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> > > > > [3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > > >     ?series=330957
> > > > > ---
> > > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
> > > > >  1 file changed, 99 insertions(+)
> > >
> > > Would you be queueing this patch along with DRM driver patches for v5.10 ?
> >
> > No, I expect Geert to do so, DT patches go through his tree. I handle
> > the drivers and DT bindings.
>
> Indeed.
>
> As the dependencies are now in linux-next, I'm queueing this in
> renesas-devel for v5.11, after fixing all conflicts due to recent
> additions, and sorting &lvds0 before &pfc.
>
This also needs changing vcc-supply to power-supply for lvds receiver due to recent binding changes, probably Ill do the above and post a v3.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE reg. no.: DE 14978647
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
