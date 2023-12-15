Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA241814B07
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C05710E170;
	Fri, 15 Dec 2023 14:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A1F10E170
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:58:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E92fZh75Ykf7YoWD6wNUtS4I6dKrroMhnZaP3Lw0Gr31LTvN72fWVt3Gs7ytqGkmpWkTQ3N5QcbvU2y67+/5+/mBtJSU7twjTvOdsS5jJh/YDe4n6pPxRSsDe/iAOTSZC4LAhAgyBnYt1hgPQwh7dVE/0jUzxqYrZVzLN5k8ApHzbM1moFQxxTwGM4++gMhPKsFy5N54PLR9Y33zeohzEodNIbEBIyvdPbOYmr9gGQS/m1pEBM5f2imo6yDfMEsTBH2UTtAG1daWo9OHzWYLjeY32hCi1NwgAOcmqTGp6k5jZzdtyGGEq9egl/PUFOpccBjhSqQhHzDYAMClmS3jPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmGiryPWFYf744x4E2b6i+3HcAn46nRtQteTf7RUCb0=;
 b=DDrdbI59+jsIYKvbLA/g1UnzwMmSL4K32hSICmk+o7p/S/FPYYHWqBdKbHLoyWi9aAkmMJrx0no3pf9KgyiTxpbpu7nv8z9tqUtGnuLSOO7jBSlmq8OwgBPtwQ9mWq2E1dzWpezEOjnsdNufNuwOf8oUE8SmrThwboLAK3+1gaDOycWjC/AnCDEZDoam7PyBOSQIij/Zc8QsXqxvCu5es0HklwAKcXb4g4XWGmzYUyrSFbhVmOu9qZZtt68XUtLKeqVz1bVKWmOJkShltyqIxuUmLS4qOvVym7Vsv7xloWmsOMqNzy4kIg7qIUr90DVgsB6ul6yUNAY3pHAok2+7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmGiryPWFYf744x4E2b6i+3HcAn46nRtQteTf7RUCb0=;
 b=phiqXBkn86khvqzzrv3D4t/leepl+t8u+6IdbhONz3dPMmN91sX05lgVDAsHRFK734p1XmHFy4akKR09wERdLYl6rpGoJF+jqbJoLyBFeEtBc5SdReLNhX+aAKby698lXe8PaPDEmapvoXwSMnGOnJHrqqerjs73Ww4xHvaa/Lo=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYYPR01MB10497.jpnprd01.prod.outlook.com
 (2603:1096:400:2f6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.12; Fri, 15 Dec
 2023 14:58:06 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 14:58:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAEXwwgAAZsoCAAANogIAAEt4AgAADUYCAAAewQA==
Date: Fri, 15 Dec 2023 14:58:06 +0000
Message-ID: <TYCPR01MB11269F94CD7854904B196933B8693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <g4uqcavglw2md4ojiw7yxequy37ttozjazr3b4ypqzznlrsinv@zm6mvzaempwp>
 <TYCPR01MB11269BCE6CAEE3C5063C4D1728693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269BCE6CAEE3C5063C4D1728693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYYPR01MB10497:EE_
x-ms-office365-filtering-correlation-id: ddf7b2b9-6509-46d5-ec36-08dbfd7e3ebd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W+RQBr16YCrDm6fijrxO7IBRVnLSvRen19IssjemtyTv3rIhrMTaCBaCPtqrkWU9EDlYKL3sfUvV7s/o/jF0p4F0rEBst7Zw79YTRQ7kRQqZZwZhnEJ4+p5V25isdhpd4g+2GX2Eu8T5QvhGwHG6j6+cZPeKQUxFsxwrwSW647JfYhK1XQ9PX3mKr9eqzegUvdRCGsCRybBrzVaw0Gh5yKePQNvURUyh3/vErgi7ALjTBIecyW80va4Kqjp3LBla2SDXV7N0BP72ZHgwvj4ad7bRZyyMrdT3B0enYTrs9Deb+6Juyq6zMlNlCx88ZmVqN+mNvUe3gRBMsri0K4ssm0xD2xD8iYxzFR/2vcttiSL0f357cVhTLoQTgBDuTPESkCw1/j3qwzaL3V4t9DCSyjbHqdtCwdKE0/Wt2mdhfo0CHj24EZKn/2n6QNgRMAm25OyOQxLs+pqiwfM4sVNXWIFNR8x7DZFojkRmzDIot0fw2PGnt4srkgqRXF2XKeETjQsccAHuEXdW+NVqAy05U2a71piK4+KBFez4xFUwIlsGEypODSVwekp+bj/ivBbJ4/EJX9Wbsd9/ua7qqS30bTlJGAESWIF0yrQi71R74ZYoeiVUN09fIfCZ9Xyrv8Oo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(55016003)(26005)(7696005)(6506007)(33656002)(38070700009)(86362001)(38100700002)(122000001)(83380400001)(4326008)(52536014)(5660300002)(7416002)(53546011)(9686003)(2940100002)(71200400001)(76116006)(6916009)(316002)(66946007)(8676002)(8936002)(54906003)(66556008)(66476007)(66446008)(64756008)(2906002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1SQ26YdVCa70DOrpcK3qf//W3yqZ5PUL+3rfqXQc5ONqiK586L6ecwRiNBAv?=
 =?us-ascii?Q?2r+ppV9vEcq+OoJ8WJs4/XGkv8BhZEg+8qSTrXDKNZ8MP0/1zDo2DJNZyJe0?=
 =?us-ascii?Q?qKeTctwpDS5PDU6vIm95urbYwuXiCNj8zo3oCBHOzysAFrXOtAKi535Bq3Rb?=
 =?us-ascii?Q?nufnUSFJ19/XCYE+4NkMKj5boYdzgUUs3ok+Qq9TdGiOHZSDnDM4V5BWUWuv?=
 =?us-ascii?Q?plvUWV+wEi7ZdAweD1jGZTJKdTZju5d+KHN1udfcMQQcRLh9auyKZx506ZP9?=
 =?us-ascii?Q?TRlDVjic41fpCaABCOZImHLNn6LklZ9P8FxSsYxpWJDGQaCLzx4SspYkbmKQ?=
 =?us-ascii?Q?JMdDm+Z9DW+DydJARL6Q0A7MNGNEIgU5uMRXc9K91GOqiU8sNjt4FbQcS1o4?=
 =?us-ascii?Q?4Cy+87p7wyo2hNll/z4T7LWB2fEd6em0oAThwl/j9+CXIxYtU9pnSxZhQIPY?=
 =?us-ascii?Q?c+0WoLFEHPqRLApxHDLsurrWAFxZb3z5BEcO3zP+iJ3xkxdGkp0iL45KHqmM?=
 =?us-ascii?Q?KCvhF8+0J86QsuwHexBhKG1zrRgBbEfLkphdhJRLKp2ff+GCUQM8TRDfvaXb?=
 =?us-ascii?Q?O6vhlvibG3WNIKRG7fM8HJRAfbzNILjKMis4Vi41QJjL8HJXlFB2Yh+vY4It?=
 =?us-ascii?Q?6YespmLiu5TXFJ47tnmtr2SOk8HltW7WuhdsGS8tddX/5zV/YhWW3Su2SqPM?=
 =?us-ascii?Q?21tKeCD7U3FwolgUfunVaZHadl5MpwCi5ubHesmywXmAyt0IywDeMQiQNMzK?=
 =?us-ascii?Q?ULxYDpKLlnK3yevHh0wKa2XxUhgtBGsWCr7ggtxF92pPrEB/OJ8AXd6DN3AD?=
 =?us-ascii?Q?vg2QKPRRJMbbbdueXqaOA4zpAgykqQ53J1tD9ye4PAypMUWfeU85f4s5ouoM?=
 =?us-ascii?Q?4gqvP8FegOCiGkYJ+C/8o+P7sG6Xb5ePE+6cWRIgAyoA9s7fZOHBMKljj2hI?=
 =?us-ascii?Q?xFasqlot6VjDSj7fA4qateO0A/u9wtpjpaDPUR3PmbUBvIS5u6SjoH/C6PAP?=
 =?us-ascii?Q?MG2gHD2McmnW0cCxpBx/LrNzPEiMo/hixjqXpQR+8C0O+JCkhfF8+tSA3cUq?=
 =?us-ascii?Q?3RpX8kpk8dWztSuYfpip6gdOv7WSBNhyY82HJc0kfYNrneWOEKYHqgL2qMvN?=
 =?us-ascii?Q?XZyFQJfwd+bhxETZ8fBrI4NXc8OAFte9tOJ9cNJ41KUwcnVQLB6owHrH5H2p?=
 =?us-ascii?Q?RkNsjNmkFZmN8tKxwi1jNMyhPj95qqE8R5QyQgaCpkQjn6PyT73NmrFuBYzo?=
 =?us-ascii?Q?/Bp5vnzJixWgjZzrcD2vZlg0N45NGk6TPk7a34uUC1g666UTfnWG4/4cVcfs?=
 =?us-ascii?Q?Yi0Gte4giPktOyINwNZ3VvcFBTFylmFLgy0vBlOxDKNIe6g3v0FG5xmiSUwe?=
 =?us-ascii?Q?y7mqAcfdPkX+hgyNAFcTUN72bTlZqU0sR515P+qfYJMyIVVq52Cf7P6Nathl?=
 =?us-ascii?Q?3I3u0Be9kTt2HojIP9s1CKeXWmPJIvcI9RelwrgR4FEi/x9Go5DJ9A9XoCUl?=
 =?us-ascii?Q?nyhTdgaI5xUt+60xGiXINXQ6Z+CCcZlVOxURJwOv+wN5lGN1zqZa4ega2vTQ?=
 =?us-ascii?Q?G7bZy1ROAU42KQkYe92o97lDHj/8CzVjwzxt3bi4qnZ1GPGUDFGC0ub+b8Se?=
 =?us-ascii?Q?HA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf7b2b9-6509-46d5-ec36-08dbfd7e3ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 14:58:06.3075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+j7/4GIKCaLo7eH52vpja5fVUZwvaJaNIclwDKm0/ZtHkDOHehvQA3CcjLGaYrYuupjjUPbd6SZEIbJ+Di9XxN+Znj/X1+a/reZY2TkH/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10497
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
>=20
> Hi Maxime Ripard,
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Friday, December 15, 2023 2:18 PM
> > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >
> > On Fri, Dec 15, 2023 at 01:52:28PM +0000, Biju Das wrote:
> > > > > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc
> > *crtc) {
> > > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > > +
> > > > > > > > > +	rcrtc->vblank_enable =3D true;
> > > > > > > > > +
> > > > > > > > > +	return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void rzg2l_du_crtc_disable_vblank(struct
> > > > > > > > > +drm_crtc
> > > > > > > > > +*crtc)
> > > > {
> > > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > > +
> > > > > > > > > +	rcrtc->vblank_enable =3D false; }
> > > > > > > >
> > > > > > > > You should enable / disable your interrupts here
> > > > > > >
> > > > > > > We don't have dedicated vblank IRQ for enabling/disabling
> > vblank.
> > > > > > >
> > > > > > > vblank is handled by vspd.
> > > > > > >
> > > > > > > vspd is directly rendering images to display,
> > > > > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > > > > called in vspd's pageflip context.
> > > > > > >
> > > > > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > > > > >
> > > > > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > > > > reporting is going to work. Could you explain it a bit more?
> > > > >
> > > > > We just need to handle vertical blanking in the VSP frame end
> > handler.
> > > > > See the code below.
> > > > >
> > > > > static void rzg2l_du_vsp_complete(void *private, unsigned int
> > > > > status,
> > > > > u32 crc) {
> > > > > 	struct rzg2l_du_crtc *crtc =3D private;
> > > > >
> > > > > 	if (crtc->vblank_enable)
> > > > > 		drm_crtc_handle_vblank(&crtc->crtc);
> > > > >
> > > > > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > > > > 		rzg2l_du_crtc_finish_page_flip(crtc);
> > > > >
> > > > > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
> > > >
> > > > Then we're back to the same question :)
> > > >
> > > > Why can't you mask the frame end interrupt?
> > >
> > > We are masking interrupts.
> > >
> > > [   70.639139] #######rzg2l_du_crtc_disable_vblank#######
> > > [   70.650243] #########rzg2l_du_vsp_disable ############
> > > [   70.652003] ########## vsp1_wpf_stop###
> > >
> > > Unmask is,
> > >
> > > [ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
> > > [  176.354922] #########rzg2l_du_vsp_atomic_flush ############ [
> > > 176.355198] ########## wpf_configure_stream###
> >
> > Sorry, my question was why aren't you unmasking and masking them in
> > the enable/disable_vblank hooks of the CRTC.
>=20
> I have n't tried that. Will try and provide feedback.
>=20
> Currently the IRQ source belongs to VSPD in media subsystem.
> So I need to export an API though vsp1_drm and test it.
>=20
>=20
> Currently we disable IRQ in rzg2l_du_crtc_atomic_disable() context
>=20
> And enable IRQ in rzg2l_du_vsp_atomic_flush().


Typo, it is rzg2l_du_crtc_atomic_flush().

Cheers,
Biju
