Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9476589DD1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 16:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE339A604;
	Thu,  4 Aug 2022 14:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF4F9A5CD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 14:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB5+MxERBvfAWyqy1CWAYdmQYp1n1GO79P2NVRsX1XiBZGmpkKKY2d7fOi7PW6Uk0gwyOpctcwiyrzyd7WB+UH+F55Aj88hXu/+adaYNeFRouXQe3jlyWAi1K+55+r6j7fOThmZMiigSWUllatUr4YCV5LvW57DqUVp7cSGUdOMXwvYdszZ9VbyWZu/7hvSEknFdmpVmodSi9jAdsCFD7jOscCjfy57RCuR26AG4q+jbjWQrbwbwi5bO6PHcXRrmHhq9qb8GLGfhML/NhCd0uPQ8sDNu7rkCJ9XJqbxxHW65e3ZBbYyVgl/g48mWoCAxaogVF5wykEGivQpLt1Mijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XprwdouLjSNEGrkkRJRb9T/oPJxyUGB6RZ0R2+HO/0E=;
 b=mAktPLTyYdreS1Q0mM0a2F/iOjPzsbmpm7QVhQb/A4b4hNtqs6lvstwMvIfsmwdu72v6/uRrmlr4Q/hrDFUeolWaxlvwFOnIgm2mARBNYRzIWJ5Zocp7D9KPmp/KAz24wSn/7tBeJiweA9Od6CWsx/SjltxiT5cjlIngYMzcPsqQRvlW2fehHfUNZShiR2VTzfiwF+zMk144gbo6c5WPDreKu+h0CuLqrheI4KnAdeanLN9BV2XkH8TKqvk48owqmU0Hy9TqCO4QnqBxGI4fBRosO0L6adX3yhcgYTFlN/AWzW0cOnZbyfdvy0Zpws0eDg0NTCBtt8NCGzZ+dNOnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XprwdouLjSNEGrkkRJRb9T/oPJxyUGB6RZ0R2+HO/0E=;
 b=sRFJN1LDImuaVsxQWCKpz+mZIq6vxWNNo2QN3IKpBOOVRv93avyKoua/rB8a5TMY+JqBWBhncMEGTY5K+AR+mFrpyq7kxLrOGMQ9b7+XoZNlhNr/Pke4U491LAfbs9jZx2/+BNLnlbM5Q3s9qZUApdMtyCwqwjWd0I3IE1ra59U=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSAPR01MB3778.jpnprd01.prod.outlook.com (2603:1096:604:5e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Thu, 4 Aug
 2022 14:43:43 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8187:a328:f53a:8142]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8187:a328:f53a:8142%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 14:43:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Adam Ford <aford173@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: RE: imx8mm lcdif->dsi->adv7535 no video, no errors
Thread-Topic: imx8mm lcdif->dsi->adv7535 no video, no errors
Thread-Index: AQHYpChafRNyOjpBj0WPdhAcG0oEYa2acueAgAA4agCAAASNgIAAKSYAgAAD44CAAAo3AIAAXp8AgABEnoCAABtjgIAAz2aAgABExgCAAE7agIAAFOqAgAFl6YCAAB9xgIAAFpcAgAAFoYCAABgYkA==
Date: Thu, 4 Aug 2022 14:43:43 +0000
Message-ID: <TYCPR01MB59336A94BA5156C49E14578B869F9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <20220804093829.42kdelp7u4r743nv@pengutronix.de>
 <CAPY8ntBovVq1HVt_UneDF8OB9KBdEBv52o=4BCTmf9VpiODxVg@mail.gmail.com>
 <20220804125152.idyzetjqkjzgbbm2@pengutronix.de>
 <CAHCN7xKXe14z1QxrdLHNkNOmpR=txUZAt3BsEry7TymbjtDsjA@mail.gmail.com>
In-Reply-To: <CAHCN7xKXe14z1QxrdLHNkNOmpR=txUZAt3BsEry7TymbjtDsjA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c7fe8e3-6f1a-404a-b72e-08da7627bacd
x-ms-traffictypediagnostic: OSAPR01MB3778:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FdmOs2uWSV6oh+h6BtI30of468UpRGVqyGP6o1D1P+CNHuz3gBhPKhJxzkFlMBLZtBFJhBs13JM7lDFOUdVj6IuAIgbeG9oiHbfV6sX6BbXb81nlXsGmnx+Xjw5+7iMjPw5xr0kGj0swVZcKGzaddu5BXZmduQdDHAjPjTjyICkpi7jzWp0xmIcgLLtBwgX/tFDo2GXCdu3Uit/9uaJ7kusZCtpc1e7Mk7Yykte6dVcM3/PWfe0b9+FkTirGrjXQ3Gx/MwTP4FOKOVc9Huza5b2PO6innnxgiUwcn3eNaFJuUCIZ8C+PRQebZ+WDF7P4GvcedRWCTc7FKPF8ahWKWidgGyOw36f9N7GSkTYkOfAzaYpl/leYoS+l8s3kR6RtZvoNk0ErtB9kOGgTk5XYrPolYXU4DcUgbxmuaXRBCpnHmZdzPXGrvnpWeSGCtSiXLcUZKVagNyn1MVWFvMwR1ZH4NKp1/6/1qT6+gza2gW6CNHlBwIU7ESMXLuIvynBgOCqIf2j95CwOxxEiSkDZwmbIRcrbvlBu6tGtsukZyBSvJZQvwni2WrIE3ZEmynUmzDgTUNnzh3H4SmLJbzNSPHeLVvKf1ZDnXtlpifbTHxq0CnvKVA2y7trS04Anhxh9w72aeGsTU87CjzjEFOA3KbrC49uEuQcTvArYLwtc0fF9LcqgjyG7MGlI+qxyqjKiwodfFGOTKYjF7TOllBrYKyELdFDrFrrjna8tdiceUJDKHuiK9M4237Hm91Ty1uQi8BO8DW9fpZmLjqjZwH7qtB7Mf6Cu+PuXXbo+0y4br/PN68NfCUa1nm2LmC3//fyLFtMo7Nk4jIy6hQ8iL6iygTTcdG6WVVa9av61tihUyW0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5933.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(53546011)(7696005)(41300700001)(6506007)(2906002)(26005)(86362001)(9686003)(38070700005)(33656002)(122000001)(55016003)(38100700002)(186003)(83380400001)(5660300002)(76116006)(7416002)(966005)(66946007)(52536014)(478600001)(4326008)(71200400001)(66556008)(66476007)(66446008)(8936002)(64756008)(8676002)(54906003)(110136005)(316002)(32563001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UsqBZFMXMqeY5uOIQDXbw7AylEAPJyspmccWweGda4LY8qo+Xz/ZMLLRPMUY?=
 =?us-ascii?Q?8tNd/aHtysCLpohjGdPZyhFh/rRYnU/cGURXQBMXZyTaxNCHTntDQA9xKg9S?=
 =?us-ascii?Q?C8PZ57y/VQ/X2DT4CesBh0WYCDd90ZxA/P5PWY207oLanMagzm6DYwQzwZSs?=
 =?us-ascii?Q?Pi9/oOmsFtb7A1K2rnJbyrhLjmd2u2VkFR8519mm+MlHHkXiNLjLKquyDTwf?=
 =?us-ascii?Q?1l2WfvORW7FTmG8wRoVaupxY0jp1b5Q5g4W/PW8ggQCNP3Ece6AfJum9fvnT?=
 =?us-ascii?Q?VhSR+kohxCxinMAh1p0ybZzp8oi7xNAkB6pf7ojbgqmnBO18c5ixuIrwoAJ6?=
 =?us-ascii?Q?Jt5/DjzhEXGXHGGOvSDBtuJi6oLvN5Lokfqgvynx6+LvJ7DlzDlkfWKy3ylU?=
 =?us-ascii?Q?V3LKoLzpkXsfe66ufLhQs2jFUAwGQgsKAraLzG+4sDrpGQFh9mGCja0gnAuV?=
 =?us-ascii?Q?lJwDoQRRcTKeGdVExs9Ajuh4LizgQnOfjig3mc09BG96DGgZT+7ag9oifuDB?=
 =?us-ascii?Q?tfAnyNJUTpAy3Wug2Y9yzhbfVe56GZlXls8YuzMzCum4s4a3Dh0Ue3Wt33ph?=
 =?us-ascii?Q?dvYVZKXoRKj70/iVDW+tDJEHJMz1k7yeSa7sPx9CfLKvsadA/h8SBUbxfks4?=
 =?us-ascii?Q?gzGUgPsujYbGvAA9i+l8xOB7qAM4gChF/uavcMEjV0KdOwXK32CmHWVcK4Tt?=
 =?us-ascii?Q?bZvIIE0YxGtqDbM/6uIofAiYnDwiHPZTpnDggYBgsFkAq+zS5028+qMb8ZfL?=
 =?us-ascii?Q?56tiE8tXAGlYbPsmhZ9C/mfHhSLEF4TyIHayICdwu1z7S6QrK8hwhuKNczXz?=
 =?us-ascii?Q?J963nJJ6yvW8hIEL5tZBareElCnDUzfAPuB4r2aGqwP9Xj3T8bqEB6KTc0SF?=
 =?us-ascii?Q?zrKZ7iysTFGYC+WScLFWPmBPzsTJIQUXz5fWymXCVP4BfBnb31NSeu0Es5/l?=
 =?us-ascii?Q?T4FMenvpBdejkKBMXSNnUbAyJMY67OUPuCjAfzwU3rKW7+lI6shlonyt9IE2?=
 =?us-ascii?Q?UUwhDU5//DXkhhD9ySqFcCWQsi2NPIt4Wds3yEAb7Kty4neBnKjk4Cx+CseX?=
 =?us-ascii?Q?Xl7uXebIl8qq5PKirJB/rK9JyBf4zTZTH6dgDpZ2El2lrtY6/slsK8Zx2b+n?=
 =?us-ascii?Q?DDIM/8Msz/dLTyvc1qrvIiht//ygivx2sxMlXhXLbVf8XgEZ1yChLW1+Gd4N?=
 =?us-ascii?Q?EdaNouslhfno88IKnPKOuU3FH8UfS1DbPB6A97i3IQZZKkg2yd1Q5mLqMfn6?=
 =?us-ascii?Q?dASALXnCBbHHa87h5fYtEX4tXc8vdOzHJui6Y+oQ2GUFERsRkOzsHHw/eNxw?=
 =?us-ascii?Q?3ER2S6dQPO/H/LYh1LNeUVEgxqBWBXNw235dgeaBUd9Q4LJJiSTU30y+0PfI?=
 =?us-ascii?Q?XJ7RMNCofFV7fAFvyKiTHduLb/J0zEYd6gQVH1MKr2BsvQfLjU92EqIQ0N7M?=
 =?us-ascii?Q?EFwjFce2J3j8Ou3gej2AWoLnKfjrMB4hfKVPhlSgYGZduvJW5uN6/UWPLqJT?=
 =?us-ascii?Q?/CKEHjg9VIXMOcevDmToZFO8L9xK9rJfoZun+sUq/qWsJQE3Fje2xXL3LMeV?=
 =?us-ascii?Q?Gc7gl0BXwDDRYDUOwjMxGFhYkhhYZi2FWlBeAP8YReBDoZKv4Q+Qpc8xk83B?=
 =?us-ascii?Q?eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7fe8e3-6f1a-404a-b72e-08da7627bacd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2022 14:43:43.6036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQB2zSM/NoaQqD95wtdZ4xLILm7iu+nwiuybrCeHkOO2mQ9E/FWB2U7h+bzE3Bz1+mVf6FW/Qgk1B3X5IjZbrsw2YfwP54eRwfO0+ZxMUew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3778
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "robert.chiras@nxp.com" <robert.chiras@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "laurentiu.palcu@nxp.com" <laurentiu.palcu@nxp.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

> Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
>=20
> On Thu, Aug 4, 2022 at 7:52 AM Marco Felsch <m.felsch@pengutronix.de>
> wrote:
> >
> > Hi Dave,
> >
> > On 22-08-04, Dave Stevenson wrote:
> > > Hi Marco
> > >
> > > On Thu, 4 Aug 2022 at 10:38, Marco Felsch <m.felsch@pengutronix.de>
> wrote:
> > > >
> > > > Hi Dave, Adam,
> > > >
> > > > On 22-08-03, Dave Stevenson wrote:
> > > > > Hi Adam
> > > > >
> > > > > On Wed, 3 Aug 2022 at 12:03, Adam Ford <aford173@gmail.com>
> wrote:
> > > >
> > > > ...
> > > >
> > > > > > > Did managed to get access to the ADV7535 programming guide?
> > > > > > > This is the black box here. Let me check if I can provide
> > > > > > > you a link with our repo so you can test our current DSIM
> state if you want.
> > > > > >
> > > > > > I do have access to the programming guide, but it's under NDA,
> > > > > > but I'll try to answer questions if I can.
> > > > >
> > > > > Not meaning to butt in, but I have datasheets for ADV7533 and
> > > > > 7535 from previously looking at these chips.
> > > >
> > > > Thanks for stepping into :)
> > > >
> > > > > Mine fairly plainly states:
> > > > > "The DSI receiver input supports DSI video mode operation only,
> > > > > and specifically, only supports nonburst mode with sync pulses".
> > > >
> > > > I've read this also, and we are working in nonburst mode with sync
> > > > pulses. I have no access to an MIPI-DSI analyzer therefore I can't
> > > > verify it.
> > > >
> > > > > Non-burst mode meaning that the DSI pixel rate MUST be the same
> > > > > as the HDMI pixel rate.
> > > >
> > > > On DSI side you don't have a pixel-clock instead there is bit-
> clock.
> > >
> > > You have an effective pixel clock, with a fixed conversion for the
> > > configuration.
> > >
> > > DSI bit-clock * number of lanes / bits_per_pixel =3D pixel rate.
> > > 891Mbit/s * 4 lanes / 24bpp =3D 148.5 Mpixels/s
> >
> > Okay, I just checked the bandwidth which must equal.
> >
> > > As noted elsewhere, the DSI is DDR, so the clock lane itself is only
> > > running at 891 / 2 =3D 445.5MHz.
> > >
> > > > > Section 6.1.1 "DSI Input Modes" of adv7533_hardware_user_s_guide
> > > > > is even more explicit about the requirement of DSI timing
> > > > > matching
> > > >
> > > > Is it possible to share the key points of the requirements?
> > >
> > > "Specifically the ADV7533 supports the Non-Burst Mode with syncs.
> > > This mode requires real time data generation as a pulse packet
> > > received becomes a pulse generated. Therefore this mode requires a
> > > continuous stream of data with correct video timing to avoid any
> > > visual artifacts."
> > >
> > > LP mode is supported on data lanes. Clock lane must remain in HS
> mode.
> > >
> > > "... the goal is to accurately convey DPI-type timing over DSI. This
> > > includes matching DPI pixel-transmission rates, and widths of timing
> > > events."
> >
> > Thanks for sharing.
> >
> > > > > The NXP kernel switching down to an hs_clk of 445.5MHz would
> > > > > therefore be correct for 720p operation.
> > > >
> > > > It should be absolute no difference if you work on 891MHz with 2
> > > > lanes or on 445.5 MHz with 4 lanes. What must be ensured is that
> > > > you need the minimum required bandwidth which is roughly:
> > > > 1280*720*24*60 =3D 1.327 GBps.
> > >
> > > Has someone changed the number of lanes in use? I'd missed that if
> > > so, but I'll agree that 891MHz over 2 lanes should work for 720p60.
> >
> > The ADV driver is changing it autom. but this logic is somehow odd and
> > there was already a approach to stop the driver doing this.
> >
> > To sync up: we have two problems:
> >   1) The 720P mode with static DSI host configuration isn't working
> >      without hacks.
>=20
> can you share your hacks with me about getting 720p to work?  I've been
> struggling to get 720 to work.

I have problems with 720p working on 3 lanes. Then I switch to 4 lanes [1]
and it starts working on Renesas RZ/G2L SMARC EVK.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2022030915=
1109.20957-2-biju.das.jz@bp.renesas.com/

Cheers,
Biju
