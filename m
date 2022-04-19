Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A98C507113
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AA610E280;
	Tue, 19 Apr 2022 14:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5FF10E280
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLk4g1ZBsPf2lgnRZsPcpXOlbsfTa7x3kNt/d6Akrivu0TMJFdB/JQnyIEErhEGjF8+B/jsodyzWUv67X+pTChYQzNXBlSLyxt/L4YowRWIXCJuT2O/RfoQgWtrlRy2dB4Eb0H94iuPLuUc0h8KOyYpmLI3T+gMNbRl6s6xya2ZrWlzlpg1wmcvV7v/4HRvjf6knapjRpFEP2QSphR5vKYf3mCR2fOrg4bV0Y7aKmu7XlWFtFbReWeBwjwftqe0tdeHLebuBZMPJl378aZ+XyL0er6JFkVBX4ncNNJ4AVBY0iHhZZPOOuICNbsZhX0CUfEIeorVHm+DA/6asKeidJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfBnPwEUV7TzIK5o338ku4i9W+Fo4KHPx9KQR0RFAIs=;
 b=NAR6GWPb+a0KhS02dBAKwr50VioKrTCBvTbQvxoZoZBn5ezptwqcABAmGwq+SGfnBTN++PqnPHqQCCkiEtw+9BPV0uWM9eaejlRN26hgXmh35vMIh7YsykY9DLJxm46mAN+hWJyh0lNOA4v7oX9afwqH0MaKNLOdorKYoXytCGi1iBXQdmFSuJIjfTQ82wjIBv01Pc0/7V5UlxWS6gCMZtoR82tFFNJkxqC90aFV3WQF3vYMFtulBrn2NO230v2X17LSxHAKwPxXbLb2sHHuN0gtzah65mNkcn1thtXaBzj3yu0YJcGvzWAGv5zvLW/Vslnb3I9mPRNuP6AewR1S2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfBnPwEUV7TzIK5o338ku4i9W+Fo4KHPx9KQR0RFAIs=;
 b=o4g6FK/bPFMvNLI0f3ltPP3CVNpsaBl9s6ZdRdbMAyn4blJr/bGIde0fqV4zplmBtPy0oZ1gHrrLBab8xfLzbyYlCOEl4TvYr4ZbNDQO+ygIZazo4VWNlqbulJYlg70E6JjzimLHm9aFCE0u3M/S98eGNcvLXVZ2u2knvQMzouI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3256.jpnprd01.prod.outlook.com (2603:1096:604:16::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 14:53:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 14:53:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Thread-Topic: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L
 MIPI DSI TX bindings
Thread-Index: AQHYQnADgNCsAhZFrEWrZICvhJcRYaz3EcoAgABhqWA=
Date: Tue, 19 Apr 2022 14:53:48 +0000
Message-ID: <OS0PR01MB5922605DD52515A67780AF4E86F29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
 <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWcsJDbbVrh9Uoe7Fv4o55_T=yNKh_ZGxzRgLzwURmYrQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWcsJDbbVrh9Uoe7Fv4o55_T=yNKh_ZGxzRgLzwURmYrQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cf44514-0203-4e9c-86fc-08da2214697c
x-ms-traffictypediagnostic: OSBPR01MB3256:EE_
x-microsoft-antispam-prvs: <OSBPR01MB325685176A60A6047C256E3286F29@OSBPR01MB3256.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LaWpjw8jbourtxVdDtrr9B36LR5xynx1Vb+rCuVSkoMR1FSg3V6FMKyNxd07h0gYPCTpOtq1oUZF0Yht3y4apEkqihpctkO0D96s5J0leo4bUhW4zo/ibYlWQTSEZOeCQvGh3K6w37GiIEX6LP14RiJKqIxLU5uZNFT+Mwh8VOVS5Blc+7vNZsViFl9y60Ggb1iloamd7K3AbFwge3yDMgP9qXem61G4WknG1FwDqyPOK2vOqu5AYCNOyTAqluvhwJoLiBdhhED2KJBhQkQdDdt/oBLTvV+HaXjKoZWDtI1TFopyPDvpPfYg4hDpPSmg+4SVLKbE0QcbnxYPmDjQJw3nJnHGJXZRQoCmJCFUAhuUvv1avp5sLDVJPKt8n561dD/rr24PEdPK0V+HmOk29uRspjtocwXsjY+mJvUMbAvchuXAKcR09o/GPm3jUzLtqShH05Ibcgs2xNbO5COIIuuNhf+Pf7TlgO/H3cu/jq3xc9UAnmSUfBnCZni/CsaQLNTH0vKz4rjBtWzlGfe9HoM4mbutrFCxahT6rrgWShjp/2MUhTfINk1mLb8ge3WNcg5v2uYu5hvwMDYvngxRp6Hj1mi4Si7t1SV+Hnm4/9HuFyKJtcJRSr3mgG4QP8i3PbGdzfGnrDgip1OfqdQiTJ2nJB6v+XWfj+pQocOaS8eM/U2dYah0qPiL4854c238EZB4a3arMAVDb9BeXsb7Tw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(53546011)(122000001)(6506007)(186003)(26005)(33656002)(54906003)(6916009)(9686003)(2906002)(316002)(508600001)(7696005)(86362001)(55016003)(8936002)(8676002)(76116006)(71200400001)(66476007)(66556008)(66946007)(66446008)(52536014)(64756008)(4326008)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+NlyFCSET1RGyUjcgNEtnXF9FuONhmQZpQ0NY1dAUDEliCFWqQi3Be0Q4osh?=
 =?us-ascii?Q?rpRw5tyaGhlLZSlHtHa6IdCEr+h/hTonky6VQfckoCMnh+fcasNbI2plUKjR?=
 =?us-ascii?Q?R0jiTk0LKlyUNAYoAkp8lkC3LMjLaYUMgf5ur/9dIuI2I3UGf95hJ6XW/pqr?=
 =?us-ascii?Q?9tjxCdEvthojtnb0eYjk6jia2SLyS88MisLiUNtBrnIHvS9+c1AXLgJ4dAXl?=
 =?us-ascii?Q?p3SQENkCiRaNK2mx73kHVnnUGhxr+2S8F+9SxM64scrnPZI1fz7r8Vo29tNs?=
 =?us-ascii?Q?PWayNJyMvu5Bi/vPJyon5DnwXj7oBoHJPT2AiyPiWDXw4BHfTwcktf0jYZvS?=
 =?us-ascii?Q?nD2me+ckT20Q9Pz+03qecJ5HvHdVWye4+DFCflW1atsl4ECgOKA50WcJgZU2?=
 =?us-ascii?Q?U5BV3B7ATqpREmM7+FF2rg+7u5ABL6SAMFUmcdJGIn0Aalt70jHbLhbOSlqi?=
 =?us-ascii?Q?uC0Ignl8GSAIEX08tB/RElyNqXL0fs4AK28DOZWFeFPvvxr61Gw53xO5TkZD?=
 =?us-ascii?Q?e3s2KLKnPvqAtaUOcQvV3eNu6eGCBs+bMDo407ao/0Q3ra6I5QEsfbxUV6ru?=
 =?us-ascii?Q?7SiO89bYPEuc0A5XLWH0QWBNwHMgndnB0GNdLFy5jzgal7VoMzVm68C9iHhq?=
 =?us-ascii?Q?LLOl5NF43a9shEQyVNO6bgfiQq9GtgM+VGaeLm4r5/46txI0NMavKvma6IUm?=
 =?us-ascii?Q?RYmNfr5Nrf0oC5BmQUZugAG5Y5JBB+0aOM2AtSzfkn5AdsVg+ksEgg6KfZGS?=
 =?us-ascii?Q?bU2OESxBKpGQMf0pfYVChKDnmmWdKNmry2aFc6C7qlX7ktYb7897D5CEW0tc?=
 =?us-ascii?Q?Zq7UPUngNKXP6G33c1pbSo01pA6JoPZ+5p4NIWnf+CEgscYBhZ4d8hiN6Ub+?=
 =?us-ascii?Q?fQRXz8cmJkmtPvL2ASqHdsNotgpfq765D4wW+rt4O1kcxLm7tPZwUlxh1nt0?=
 =?us-ascii?Q?qqRzkhZL4ElBaAPr94AaJ5l/NSRSLAHxo4g1uyk3v5Q1L21uBww1zFQT5Pwg?=
 =?us-ascii?Q?Dv1XAyj4asll++QYm8sIqcbpXYUmhTWc/dRAGpcf1w/7k7AM7m+7OxOOdGQK?=
 =?us-ascii?Q?gvieYXMcQat1xDm7ssy6FiQHJCiJHFIeCmXmi2p6cwnJ1XN0QaLKRlCGBBk8?=
 =?us-ascii?Q?DrCHfZu1ZD0hXsFE2eiAyv73Ma6Z8MUZ7bE7YnghC9m0C8KhmnrO7+y+CB6q?=
 =?us-ascii?Q?xdBzR07Ik62c/eq6s1xNiJpRM/Qx6Cs0BetDZxPCjgjanTcXvgMCz1PaROyn?=
 =?us-ascii?Q?DAbXJmB15RX6npXshpsL7NDJ5El4r9lfwuxONATKwwU02XK+6pNpwLAf747P?=
 =?us-ascii?Q?+Rgr4hDUEbN2kwsDzaxu+4IzOiPdYC7xBhk4ioJB/lfZpdWD0QSXn4wbT5Yc?=
 =?us-ascii?Q?sqbROx1Vn0KdUorqMKTIfWeTznFJyCEbh/cs4Xx3o6/2XRosfr8PO62ozJ9l?=
 =?us-ascii?Q?3L1/ariD0mxDG3b88Lw2ib+gcjnk4S9LVX+6WvD3vtsAJtb9zQM9yGhPPvNX?=
 =?us-ascii?Q?ntDRez3tTAH5fN/QrDgU9xBxOSyPwcUsWOuZU9ONLiYP3Xh5A5dzhYRn9Axa?=
 =?us-ascii?Q?NlH5cvRx1EWYAedzIppnuo34NFtvLh7qsVuILF1qxbyWBX8AIfvhBZn6ZsIV?=
 =?us-ascii?Q?yGOa6SZWqZRgYOVLasfGE86pPtlJIU6hsc0XFcPZaNsKJr+RrrtYHRARoZI4?=
 =?us-ascii?Q?k+9Egs9/xJy67CcGdCpueVJxCbOlZIODYhUddMRPeEAyqLjC1Mqx/NyX4d9q?=
 =?us-ascii?Q?n1aWW2kZIDYizZgwXI8XwH8bDHpw1Dg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf44514-0203-4e9c-86fc-08da2214697c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 14:53:49.0180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zd5dmG/RpxxmgGqOOq2ZSFvLDniRd3CKtdzKhkVv78Fz1Rub9WnP0RkzehAbekWnJKsnhqwUrfC7UCxFpdfFrg3XpSgdAJmnrKzjI4w5zt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3256
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thanks for the feedback.

> Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L
> MIPI DSI TX bindings
>=20
> Hi Biju,
>=20
> On Mon, Mar 28, 2022 at 8:49 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's.
> > It can operate in DSI mode, with up to four data lanes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yam
> > +++ l
> > @@ -0,0 +1,175 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +
> > +title: Renesas RZ/G2L MIPI DSI Encoder
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  This binding describes the MIPI DSI encoder embedded in the Renesas
> > +  RZ/G2L alike family of SoC's. The encoder can operate in DSI mode,
> > +with
> > +  up to four data lanes.
> > +
> > +allOf:
> > +  - $ref: /schemas/display/dsi-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L
>=20
> Do you want to define SoC-specific compatible values, or can the IP
> revision be read from the hardware?

There is no IP revision register for DSI. "rzg2l-mipi-dsi" is generic
Compatible for both RZ/G2L and RZ/V2L.

So I can add SoC compatible for both these SoC's along with generic one.

Regards,
Biju

>=20
> The rest LGTM (I'm no MIPI-DSI expert), so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-
> m68k.org
>=20
> In personal conversations with technical people, I call myself a hacker.
> But when I'm talking to journalists I just say "programmer" or something
> like that.
>                                 -- Linus Torvalds
