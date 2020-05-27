Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4661E5956
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8352B6E41D;
	Thu, 28 May 2020 07:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410130.outbound.protection.outlook.com [40.107.141.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF0D6E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGxkBzWVRIGpXu5xg60cZ5ZNxVR85J/pJpuxKrYMGKj+SNFBXCK3pav14N8ikakjN8MeshctnY3xdxZM9mWOoic/4BRqgob5DkyJx3m1wUwU/P1xdExACbh7KwnR539yIMxOFMN9eYRuC66Xb8+vVQtLKTCCebTnjGS5RtUto95QWu2W+Ul+al7cLycmlhG6aNjsPas9E6Akh0bzz4Y3Kl/cmNcvcRYWpiH9uVN425AuBJNa9IC1YHzc84Y48y0/w7ZV8avCmZX2HzOYPC8hBlDa+L7PyHcQe8A9AHj+qfuPr5CMbO3YXUTdB9dBYc0MX6JN0s1oIUVxHTPH7eHcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RlMt1IIV+0Tb9BN+ly15+dljxe6TeB6pfhFK52Nj8Y=;
 b=EjcTQhaG4nBFS6mL3loROMhOvv9QfWEfJ+0B+Hs/8m6mB/KOw4MaEIqJhdCfZ3PCieHqYKhAXAwc9t0ghocSDIjn0Ug97c1zCpEqlSKxPtvR+oBIN2fWUeWvRvIwzMXKRiuzW6K/BtX3FJYCZ0OeK54icAT0GtW6Dl6RH4bPXgV6UeSe8hqD7clrGEYPYv0q6y5I5ggFzUMIrz7e89D4+64oEgrmHNh47H4enzwzKRqyx2YET97dSP1EVV2B/J9br14a8NezAVxymrpg5YNUaDOXEPrIGZmlObAU52ov06/bP+UbQS7ZusKkOjHSoZyO0ancTaN47riIUqlRqCj/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RlMt1IIV+0Tb9BN+ly15+dljxe6TeB6pfhFK52Nj8Y=;
 b=pqEbnn3GDLEfguyHo4PrU4E10TTy2fZefOa88iTwBvochodCRljBax2Wj2Q+U/Vy1i/g7syY04yKuGOdi59TbmyfC1RfNxc5bUH9D1JkMg9Vl26fHgS3GSCCsYpXo+soySfz4SXFRPtJBimtEovHBjaGipQdhazMKd2/qPaBkNw=
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com (2603:1096:603:1b::19)
 by OSAPR01MB2179.jpnprd01.prod.outlook.com (2603:1096:603:15::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.25; Wed, 27 May
 2020 07:40:14 +0000
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::2cc4:72d3:1ade:f467]) by OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::2cc4:72d3:1ade:f467%3]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 07:40:14 +0000
From: Gotthard Voellmeke <gotthard.voellmeke@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "REE erosca@DE.ADIT-JV.COM"
 <erosca@DE.ADIT-JV.COM>
Subject: RE: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Thread-Topic: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Thread-Index: AQHWM/az9Wj0IB2es0azt72Olaa0j6i7ipYAgAABNVA=
Date: Wed, 27 May 2020 07:40:14 +0000
Message-ID: <OSAPR01MB2114E435BCF6B1F47F331F298BB10@OSAPR01MB2114.jpnprd01.prod.outlook.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none; linux-m68k.org; dmarc=none action=none header.from=renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 13638679-aa40-44ac-8ba5-08d8021131dc
x-ms-traffictypediagnostic: OSAPR01MB2179:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2179312E6709C83FCF4D01F98BB10@OSAPR01MB2179.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ridWxV1DJh4hWQaJz/QvB2smLZbzqRS+ZEnU2TDRtir07BYalPD7ig7zrfXlXWJYXDCp7RJaqjV10lU3uH71fWyygLNbErsebe6wARuNRrHSQFB9j4jyZS3tYhx6zPluP3MqtTZKm4Sov/7u4SrwewtBoXrqtH0Mh1iz/Vbkoxn46jEC+vJpBRUrk8f1a285COac7zsHWNLRTfyle4WlS8r5/B8ZfbR50A2o+ydjiw5HKPeIZaZRE0VeBLA+MXGtDq1tlxb+Sw0Zs5DhcYdDhGIdOdzdIe9WQXXGvPL5Vajw9/NgEGDuyfZzIuDlXavGnF00VFS+XTPjuiIr8Oplpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB2114.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(6506007)(64756008)(44832011)(66946007)(66446008)(66556008)(66476007)(33656002)(76116006)(8936002)(4326008)(54906003)(83380400001)(110136005)(7696005)(107886003)(316002)(52536014)(8676002)(478600001)(186003)(53546011)(7416002)(55016002)(86362001)(2906002)(9686003)(26005)(5660300002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 41w9GU2X+UqhIdldCAAmROuZHLJbqyD6LiVoE2IJir6/1Mf7SAYawBCmkRjvRTS2yO+CsaGJHpM0luWPAyqytIhf1AR/sJ9JdfSE1P4oaI80syX51067GwzbsAUfsWIj+tOLUGaWdydaDjGqw0vk5TvB9myTM94UmFoE9kAIqtFLR823ce9c24xS7NxZBCVgfVxLmq6UAyEziq42DpM7hmdzghHuaXih6uzTqSyNOuvPZYQEpjzXZuLL9DM9qvA8GiwdV4gI7G3hXoXxgO1C4mncxyb6y6pyY1MlaModBalDtpBYQJBlNaND2f0kHulUpa/QR9WBadRtWNz3lOpAYcGRRTH9j4SCZWVbjxtr8TiCOFGUjPF5TYCkw9OFbWMOTC/aZPCVfQdnKcvTbeZdi/VhnBP1Q6AtA9CxuassXZziSxW/0gsI57ZhQ8DrzFuH3CpBYYVmz47zS7sQ/17S4nNm39AhUexS8mJJiiNZ+IyyiO2PQkqd6Kfcz8DhiF2x
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13638679-aa40-44ac-8ba5-08d8021131dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 07:40:14.2294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVB/JSFfC7rA5UoSbAVYbZKxkw5yB65xe6+bhopZMwkmqwueHlQ7srfs64WrVfGQdOJNEJfUpMQSamGSPlHio4iEJptUMdEkBih1EopLBaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2179
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: "muroya@ksk.co.jp" <muroya@ksk.co.jp>, David Airlie <airlied@linux.ie>,
 Michael Rodin <mrodin@de.adit-jv.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hien Dang <hien.dang.eb@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>,
 Simon Horman <horms@verge.net.au>, Sean Paul <seanpaul@chromium.org>,
 Michael Dege <michael.dege@renesas.com>,
 Michael Klein <michael.klein@renesas.com>,
 "Harsha.ManjulaMallikarjun@in.bosch.com"
 <Harsha.ManjulaMallikarjun@in.bosch.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, "REE
 efriedrich@DE.ADIT-JV.COM" <efriedrich@DE.ADIT-JV.COM>,
 "ChaitanyaKumar.Borah@in.bosch.com" <ChaitanyaKumar.Borah@in.bosch.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "VenkataRajesh.Kalakodima@in.bosch.com"
 <VenkataRajesh.Kalakodima@in.bosch.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added Hien-san, Michael K. from Renesas.

-----Original Message-----
From: Geert Uytterhoeven <geert@linux-m68k.org>
Sent: Mittwoch, 27. Mai 2020 09:35
To: REE erosca@DE.ADIT-JV.COM <erosca@DE.ADIT-JV.COM>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>; Simon Horman <horms@verge.net.au>; Ulrich Hecht <uli+renesas@fpond.eu>; VenkataRajesh.Kalakodima@in.bosch.com; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>; muroya@ksk.co.jp; Harsha.ManjulaMallikarjun@in.bosch.com; Ezequiel Garcia <ezequiel@collabora.com>; Sean Paul <seanpaul@chromium.org>; Linux-Renesas <linux-renesas-soc@vger.kernel.org>; DRI Development <dri-devel@lists.freedesktop.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Michael Dege <michael.dege@renesas.com>; Gotthard Voellmeke <gotthard.voellmeke@renesas.com>; REE efriedrich@DE.ADIT-JV.COM <efriedrich@DE.ADIT-JV.COM>; Michael Rodin <mrodin@de.adit-jv.com>; ChaitanyaKumar.Borah@in.bosch.com; Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)

Hi Eugeniu,

On Wed, May 27, 2020 at 9:16 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
> > CMM functionalities are retained between suspend/resume cycles (tested with
> > suspend-to-idle) without requiring a re-programming of the LUT tables.
>
> Hmm. Is this backed up by any statement in the HW User's manual?
> This comes in contrast with the original Renesas CMM implementation [**]
> which does make use of suspend (where the freeze actually happens).
>
> Can we infer, based on your statement, that we could also get rid of
> the suspend callback in [**]?

While the CMM state will be retained across suspend-to-idle, I'm quite
sure it will be lost by suspend-to-RAM, at least on the Salvator-X(S),
ULCB, and Ebisu development boards, as PSCI will ask the BD9571WMV
regulator to power down the R-Car SoC.

So IMHO we do need suspend/resume handling.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE reg. no.: DE 14978647
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
