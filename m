Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69DA06A28
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 02:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2C410E2B1;
	Thu,  9 Jan 2025 01:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Qwe5MEy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11020142.outbound.protection.outlook.com [52.101.128.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207E510E2B1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 01:22:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfuFexLPKEKv9Sc7P1P4zQgO5d1CV7FeJW2IULJCPkgfyuAwq6tRP0z5v3XRojVN5hL8rB3wRlRgnoYRI1o+QZNe7YqujuBJORomQFqdidszlbE1Mf0xqDYpYj9pP4fNzu82BVpdl51NuD3g70yIIu0lesxh5vDjNMQlIZeRtv5GJ8+QUmW+bYir7Vj/1yH8inWJx28cEX0soBV+kRn97BkvvgpYJtBTZVvG/zA+dhEUCOrCXdnPi9oOMcRcgg2P9/24tIbNvCcIcRaE9B6gSWzbT5gpN9wJ56ejF+4Qs13PcG+fJxoJ0V0qu2Ssnv6TP2vxNOab4L9iQjF9/UHvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8V7zEQ0dMWMiWy9pIPSGttjnXqlIP6IPtzfPsbhoSw=;
 b=gWrYSswuQtoDlEdiMuGQtvzeUEbnhKLv4bYrGfGCjFRlWj9xZdoOhfCNM95HhS0j6lZHE8ANd0LxEgw7aja4o2oryAl/4LHqeUhj54epA5FyyymiJPxrg2Ay34evE6nEisaKqrOkkMqxRUP+zfn7UZVQmGj6GY2kJ4LTjylWjPQuoluWcxuq4SXemjccmK0QIuuS4nn0evLbEcTxNEruNzzDEEW9GFtFMiA59GeknW/TJSkUjMtYx4Fr0p1g82YeHewOGcF+CAxMcjUfNPKLsMQZKk97aK3SxxVBDIxArdQsGYwAcoCPbTAfe157Di2ybpegoXC8IoqVvWx2bsr0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8V7zEQ0dMWMiWy9pIPSGttjnXqlIP6IPtzfPsbhoSw=;
 b=Qwe5MEy29O4jkCuqs8AFgDtLd+nUBMSxh+bkFezB04aPO1oN7ZdGOn1OVzD6Y4uoVTNQ0mIuLebaSezjHN+/z6CoPzSSrsE92WZ2hup/VYZb70pjnrvA67Z1vflKQ6Dbj45/hKcr4ukOUGS5aGpaZNaedTuZstsg5px7YbPIA5cF6UA+lWwOe182LmYJmcG/g1bzk/vR/r4w9KDPxbLLLmSQC2XhEk6IBIhSkixpP2SbP2LmUenOJmnr7WP4IHuF3jKiOwdT5B3/CChzqnKt5Qzm7Y/qqQ10Ypd/fk5bzuiAqmynrU1JogHQs7kkuIw1zdq7UFz2qGuE/eHY2EJwkw==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by TY0PR06MB5835.apcprd06.prod.outlook.com (2603:1096:400:31e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 01:06:49 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%6]) with mapi id 15.20.8335.007; Thu, 9 Jan 2025
 01:06:49 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@redhat.com" <airlied@redhat.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] drm/ast: Support timings, 1280x720/1280x960/1600x900
Thread-Topic: [PATCH v3] drm/ast: Support timings, 1280x720/1280x960/1600x900
Thread-Index: AQHbYBb14UToJjIoHECxhftkRSCWV7MNpP8Q
Date: Thu, 9 Jan 2025 01:06:49 +0000
Message-ID: <TYZPR06MB6568491FBCEE290907D5AB3FF1132@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20241225003215.1343996-1-jammy_huang@aspeedtech.com>
 <c7180207-e1be-45e3-a2e6-584ffb59ea50@suse.de>
In-Reply-To: <c7180207-e1be-45e3-a2e6-584ffb59ea50@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|TY0PR06MB5835:EE_
x-ms-office365-filtering-correlation-id: 190a8259-913e-43ca-b153-08dd3049e567
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?63ZEFxYdEILQnInL0LFwEETCi/isioQMNXmsKFIz/Z19dj+oKwVQEHOdsDLO?=
 =?us-ascii?Q?KfTcBkyRf8DpSsBzXQI7O3Orzcj/Yswxp2pLjTkSNSA4NsNVFE5IY9QIICke?=
 =?us-ascii?Q?e46eUsgwySYrCIQWD1HQh7Q0T53BP6X+iYDy/IADl/GmYWTF5vtOPxFZ0l8J?=
 =?us-ascii?Q?5zP2KFrBj5F+3VNByq45rwU3IaJHovmluA4blRhiF/U4u6TP55Yf0QddaBG/?=
 =?us-ascii?Q?TZU1DJj35CEeka5camNqMQig93BuRp4QgyTrLI0JTRz/dVdF52h0NKeq8QWw?=
 =?us-ascii?Q?cRjlgWwoCr7W3CEHeXo6muNIgbp5D+1pX2Xm4hbHabSgePGAazUwR6ewW/fx?=
 =?us-ascii?Q?KfAOcRP+bi1Hv0m7F6hWNdL/M8Ad7r2SX+tYfu39TQs31N+tWmd2I8YmBRIe?=
 =?us-ascii?Q?Fs3hHiftuuHIWTsI9hpTW5LPCj2gILl8y1NdOafZmS7slq8oMiwG8oggM+80?=
 =?us-ascii?Q?wxmpB1pp+tbqKI375K+ZVl8ds/MFhwHcYdFFvS6lDEOLSgzglZw+1vTWGNhk?=
 =?us-ascii?Q?Rid8Y2vJeNmTyu7sRZb2VelnN4LjUj8Ygncjri8J4/KMcfJQoDpfo6d2jTYk?=
 =?us-ascii?Q?EtTMZlFoqKMlfHpKIoLUkBItsqO81OoqY3Fz++t8vfLnav0a6gH9f1vDZEvx?=
 =?us-ascii?Q?jvX1TjhzxHIWZItF2Wl/lXB2dFkF+K5MdchHs5CGKvyATkNLCpk/Jfcqbo7M?=
 =?us-ascii?Q?cFtxkYrBFH727AG9EZ77nFMRPA3QuRICeBaejkUkZZENpdNiBtL1cXGfjW1I?=
 =?us-ascii?Q?uuMMGkxUaR0rXD7RFi4Zh1lrBag/ROA+iN2sdF4xDB9xhpZrZ2hd/Gf23bd8?=
 =?us-ascii?Q?X2Jdy7M+am2gagOibpIVnNjTXITsM77HoVFqaW7UhbDUvYluuX7luauhy+eM?=
 =?us-ascii?Q?nahMcmgfnGnVszTxVjW/W98Y+HBcmt/DGFAqc+c9Uwr5DxWLVQyTsC/sxQnk?=
 =?us-ascii?Q?WfQV9GO9n0FQFTdEsbLqwd6P3ALqUOteOmA9ZKGU7coaw/3yxYDBmdTViT0B?=
 =?us-ascii?Q?w0R8TBPO+uv4clwIFuOLKKPMWlFdtrF/k/s0z7zKxC0Asao4qKicz3ujMwVS?=
 =?us-ascii?Q?xscB3o44flDiflZDzC9QzV4VquQERtFj2NYnIAD7OIQ83hrChYtqIUBloPPV?=
 =?us-ascii?Q?GbvXKO7FVa0afiX/J1voH3/iKHuNXv+tjfJ24t7FU+TjoNmQ5gs+l2kgW2I3?=
 =?us-ascii?Q?wg8/krSfBepjnSmcmwhjQP39bKOiTsO62x4mFEt4eDX1mn8c8IX80gQrV1jI?=
 =?us-ascii?Q?KlCFknU1LZMPlK/FIvLDlSVTNRYhDpfAj+KUvnD/UYJ5Qm24wxJxV66KsZJj?=
 =?us-ascii?Q?SY/Y21Aw0MJIYFfX+r/v15zh5k0ZRCe96zwi9y13E4wvRmhORnIlJ0eooXzg?=
 =?us-ascii?Q?EtEPbEzEbBaU1xZhm7y0jdwlM6eKd0Rap7zXHI7ZL63X11TlHA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6568.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8/Z4CwhIMWi6RHIFXi1vuO7E0nEHyChB/rZi0JMwQbb5iBUybW49LO3rv1TX?=
 =?us-ascii?Q?XuM4lekI0iNaEr2PHAeYFZsnRlRxPxkmm7CYB8HpBl2pJCI3WVqiG5R5FD7v?=
 =?us-ascii?Q?JV0kD8/uePo+XYIZq+QMTDUuobBSOnN+2fOhPB2El8jBtGK424Nls5skHC0Y?=
 =?us-ascii?Q?NfMlKGlZDmDign0JNV1iCY0vol6yK4sMkFr+lF+XSyKvRcyM+8MOV4UKnGsY?=
 =?us-ascii?Q?vRqGG5voXU+Sa5eKiE0xbccmyL1IMoMAVvl4/qeTp+pH6UzeVRUi+DWzVLXv?=
 =?us-ascii?Q?nMm0FakilDe1fnFG8JqbOgUFROXdInfBjz3jd3H10TMesxKhPFic2jdaj4Ie?=
 =?us-ascii?Q?LFSLdxeAfIZm18DCRXWEA+N2BvH/ZVX4LP9fb3zQaPooysOmwDeZBpfKjR+h?=
 =?us-ascii?Q?vgyvBFkGDWDhgsnTCDjmw9UZUmZ0ostlCkUXu6XES3ZvXK/Yyzy4xTUGhrmQ?=
 =?us-ascii?Q?NE9jP/2apsl+j+vASvPX8uGEJJrXX47tT0qwXSFwhFgKszMHIsCwYltAF2T+?=
 =?us-ascii?Q?8yB5gxrlmrz74+YYLqNtwsi2Gazs8ArAta6aFKoLDqIxQT6gDa0Jzfcs5MnA?=
 =?us-ascii?Q?f6mTfY+F987tvT5s5p4gcyOSM5k4HE2NiU1CsmFg9YQAE7mMHNA68+YN8R/a?=
 =?us-ascii?Q?HF4wv6ygGS5SWgZ+PhMv0KZkPhmpt0pMiLAlJU5I0pmf88+cRzsoNZAWxmjk?=
 =?us-ascii?Q?FgBjJlGpL8+T1yWFMooFHU1SPGoBCK1ccAYd+9kr0AipMMyjZ779uDAMxahb?=
 =?us-ascii?Q?7PodOkNBKbycZQIg7LFtWyogo4Aqt3CXJBOClLx1yyNtPiQKtjU2Ud19bHwW?=
 =?us-ascii?Q?3LkhkrQ9scxnqNxAn4nXsLOgkCBTAulxEtibZAoCt3XXSM4ycshIcKbAJaIk?=
 =?us-ascii?Q?0uYPo1mLewvCpqr/Nngw+/KFGZb8/oRZz8pBz/vuliNnt0qgNg4dkciwczKf?=
 =?us-ascii?Q?6ZNK6xBdtcIzc6vKFP3advQCbTSvgJobW+fcuN3Q3gNEAKfi4cDZYHJa3hdg?=
 =?us-ascii?Q?2WEoM3hqjN57mcBnt0ZKCKFKCUOMAZVZ5pizRi7q5+H7WcESZuQiLVVIIWww?=
 =?us-ascii?Q?Ppp2AiqRM5slQypbLcnK3K1gTKqT/Z0ZpaFFmCws+wP0X/MwfhoUxcqqCdH3?=
 =?us-ascii?Q?0k73XQbiQesA2e2yp38ZaK5rQCyNLS9sVWeUIe4PdTqsztDnxfMVV5KOkKYW?=
 =?us-ascii?Q?GbxPMrxkycfxIZKt2K/KDn63pyu8t6dIaD2tTdFUOhUuaqQl0fzHvljqx6Vp?=
 =?us-ascii?Q?pWBQisA2xFu+m9G3AVR6PMeRaeFhNC8NuK7Pf2lfTnuSmld3wSDu13SRAad4?=
 =?us-ascii?Q?1V6jZLP6pvAdc8n3rZOynoXhSNiACu7KYLFRezNa8mo0ys+OQu4fLTNSTXKz?=
 =?us-ascii?Q?GSNIWWgE/KiFjBtjRckdCoCmtw15uLVGkjDq3ixN9QTAArJ7MYsUvtGH3zb/?=
 =?us-ascii?Q?K2rYwnLGpjTJGprUwjk93CbxNStQQLCcsS9LEO13MUfscwu6pnNRdTRTpGyN?=
 =?us-ascii?Q?T8d51qjTU9sIDWCcDJTzcKg7/DOCRelZDuURlTQZnPvEjGeeDxzFxK+jK3Si?=
 =?us-ascii?Q?rBtiXJ+uLmjrDvhLpMdLSvxh/hxR74YViLeDDLSPUoSG3dgb3sPsP6j7hdMz?=
 =?us-ascii?Q?PA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190a8259-913e-43ca-b153-08dd3049e567
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 01:06:49.5415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDm4u34HEj1Qyep/0x1+bxFFOStCJqPDJG9AL3HH2viFiJo0V3BmBBCKCGDbm1csXQKiXuksDb/yHxGUo7zmybdgAqzWyMaLkgEHnP/53GY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5835
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for the feedback. Let me consider how to achieve your suggestion.

Regards,
Jammy Huang

>=20
> Hi Jamie
>=20
>=20
> Am 25.12.24 um 01:32 schrieb Jammy Huang:
> > In this patch, 3 new timings are added into support list.
> >
> > If you want to have new timings, 1280x720 and 1280x960 on DisplayPort,
> > your dp-fw should be newer than version, 20240502.
>=20
> Thank you for the patch.
>=20
> What happens if the firmware is not at the required version?
>=20
> As it seems unreasonable to expect everyone to upgrade their DP firmware =
(or
> even be able to), we 'll likely need a test against the firmware version.=
 So that
> the additional display modes are optional within the driver. My proposal =
is to
> get the firmware version at the end of
> ast_dp_launch() [1]. Then implement drm_encoder_helper_funcs.mode_valid
> [2] to filter out unsupported modes on older firmwares. Does that make se=
nse?
>=20
> Best regards
> Thomas
>=20
> [1]
> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/gpu/drm/ast/ast=
_dp.c
> #L148
> [2]
> https://elixir.bootlin.com/linux/v6.13-rc3/source/include/drm/drm_modeset=
_h
> elper_vtables.h#L562
>=20
> >
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > ---
> > v2:
> >   - Fix build errors.
> > v3:
> >   - Fix typo.
> > ---
> >   drivers/gpu/drm/ast/ast_dp.c     |  9 ++++++++-
> >   drivers/gpu/drm/ast/ast_drv.h    |  3 +++
> >   drivers/gpu/drm/ast/ast_mode.c   | 14 ++++++++++++++
> >   drivers/gpu/drm/ast/ast_tables.h | 18 ++++++++++++++++++
> >   4 files changed, 43 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.=
c
> > index 0e282b7b167c..0b56f0335871 100644
> > --- a/drivers/gpu/drm/ast/ast_dp.c
> > +++ b/drivers/gpu/drm/ast/ast_dp.c
> > @@ -255,6 +255,10 @@ static void ast_dp_set_mode(struct drm_crtc *crtc,
> struct ast_vbios_mode_info *v
> >   	case 1280:
> >   		if (crtc->mode.crtc_vdisplay =3D=3D 800)
> >   			ModeIdx =3D (ASTDP_1280x800_60_RB - (u8)
> ulRefreshRateIndex);
> > +		else if (crtc->mode.crtc_vdisplay =3D=3D 720)
> > +			ModeIdx =3D ASTDP_1280x720_60;
> > +		else if (crtc->mode.crtc_vdisplay =3D=3D 960)
> > +			ModeIdx =3D ASTDP_1280x960_60;
> >   		else		// 1024
> >   			ModeIdx =3D (ASTDP_1280x1024_60 + (u8)
> ulRefreshRateIndex);
> >   		break;
> > @@ -267,7 +271,10 @@ static void ast_dp_set_mode(struct drm_crtc *crtc,
> struct ast_vbios_mode_info *v
> >   		break;
> >   	case 1600:
> >   		if (crtc->mode.crtc_vdisplay =3D=3D 900)
> > -			ModeIdx =3D (ASTDP_1600x900_60_RB - (u8)
> ulRefreshRateIndex);
> > +			if (ulRefreshRateIndex =3D=3D 2)
> > +				ModeIdx =3D ASTDP_1600x900_60_DMT;
> > +			else
> > +				ModeIdx =3D (ASTDP_1600x900_60_RB - (u8)
> ulRefreshRateIndex);
> >   		else		//1200
> >   			ModeIdx =3D ASTDP_1600x1200_60;
> >   		break;
> > diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> > index 21ce3769bf0d..e7cef334b3ec 100644
> > --- a/drivers/gpu/drm/ast/ast_drv.h
> > +++ b/drivers/gpu/drm/ast/ast_drv.h
> > @@ -442,6 +442,9 @@ int ast_mode_config_init(struct ast_device *ast);
> >   #define ASTDP_1600x900_60_RB	0x1D
> >   #define ASTDP_1366x768_60		0x1E
> >   #define ASTDP_1152x864_75		0x1F
> > +#define ASTDP_1600x900_60_DMT		0x51
> > +#define ASTDP_1280x720_60		0x52
> > +#define ASTDP_1280x960_60		0x53
> >
> >   int ast_mm_init(struct ast_device *ast);
> >
> > diff --git a/drivers/gpu/drm/ast/ast_mode.c
> b/drivers/gpu/drm/ast/ast_mode.c
> > index 9d5321c81e68..48d1065846a2 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -147,6 +147,10 @@ static bool ast_get_vbios_mode_info(const struct
> drm_format_info *format,
> >   	case 1280:
> >   		if (mode->crtc_vdisplay =3D=3D 800)
> >   			vbios_mode->enh_table =3D
> &res_1280x800[refresh_rate_index];
> > +		else if (mode->crtc_vdisplay =3D=3D 720)
> > +			vbios_mode->enh_table =3D &res_1280x720[refresh_rate_index];
> > +		else if (mode->crtc_vdisplay =3D=3D 960)
> > +			vbios_mode->enh_table =3D &res_1280x960[refresh_rate_index];
> >   		else
> >   			vbios_mode->enh_table =3D
> &res_1280x1024[refresh_rate_index];
> >   		break;
> > @@ -475,6 +479,12 @@ static void ast_set_dclk_reg(struct ast_device *as=
t,
> >   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xbb, 0x0f,
> >   			       (clk_info->param3 & 0xc0) |
> >   			       ((clk_info->param3 & 0x3) << 4));
> > +
> > +	/* Set SEQ; Half dclk for this timing */
> > +	if (vbios_mode->enh_table->flags & HalfDCLK)
> > +		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xff, 0x08);
> > +	else
> > +		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xf7, 0x00);
> >   }
> >
> >   static void ast_set_color_reg(struct ast_device *ast,
> > @@ -1027,8 +1037,12 @@ ast_crtc_helper_mode_valid(struct drm_crtc
> *crtc, const struct drm_display_mode
> >   	if (ast->support_wide_screen) {
> >   		if ((mode->hdisplay =3D=3D 1680) && (mode->vdisplay =3D=3D 1050))
> >   			return MODE_OK;
> > +		if ((mode->hdisplay =3D=3D 1280) && (mode->vdisplay =3D=3D 960))
> > +			return MODE_OK;
> >   		if ((mode->hdisplay =3D=3D 1280) && (mode->vdisplay =3D=3D 800))
> >   			return MODE_OK;
> > +		if ((mode->hdisplay =3D=3D 1280) && (mode->vdisplay =3D=3D 720))
> > +			return MODE_OK;
> >   		if ((mode->hdisplay =3D=3D 1440) && (mode->vdisplay =3D=3D 900))
> >   			return MODE_OK;
> >   		if ((mode->hdisplay =3D=3D 1360) && (mode->vdisplay =3D=3D 768))
> > diff --git a/drivers/gpu/drm/ast/ast_tables.h
> b/drivers/gpu/drm/ast/ast_tables.h
> > index 0378c9bc079b..329d6bac867b 100644
> > --- a/drivers/gpu/drm/ast/ast_tables.h
> > +++ b/drivers/gpu/drm/ast/ast_tables.h
> > @@ -254,6 +254,13 @@ static const struct ast_vbios_enhtable
> res_1024x768[] =3D {
> >   	 (SyncPP | Charx8Dot), 0xFF, 4, 0x31 },
> >   };
> >
> > +static const struct ast_vbios_enhtable res_1280x960[] =3D {
> > +	{1800, 1280, 96, 112, 1000, 960, 1, 3, VCLK108, /* 60Hz */
> > +	 (SyncPP | Charx8Dot), 60, 1, 0x3E },
> > +	{1800, 1280, 96, 112, 1000, 960, 1, 3, VCLK108, /* end */
> > +	 (SyncPP | Charx8Dot), 0xFF, 1, 0x3E },
> > +};
> > +
> >   static const struct ast_vbios_enhtable res_1280x1024[] =3D {
> >   	{1688, 1280, 48, 112, 1066, 1024, 1, 3, VCLK108,	/* 60Hz */
> >   	 (SyncPP | Charx8Dot), 60, 1, 0x32 },
> > @@ -280,6 +287,15 @@ static const struct ast_vbios_enhtable
> res_1152x864[] =3D {
> >   };
> >
> >   /* 16:9 */
> > +static const struct ast_vbios_enhtable res_1280x720[] =3D {
> > +	{1650, 1280, 110, 40, 750, 720, 5, 5, VCLK148_5,	/* 60Hz */
> > +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode |
> NewModeInfo |
> > +	  HalfDCLK), 60, 1, 0x3D },
> > +	{1650, 1280, 110, 40, 750, 720, 5, 5, VCLK148_5,	/* end */
> > +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode |
> NewModeInfo |
> > +	  HalfDCLK), 0xFF, 1, 0x3D },
> > +};
> > +
> >   static const struct ast_vbios_enhtable res_1360x768[] =3D {
> >   	{1792, 1360, 64, 112, 795, 768, 3, 6, VCLK85_5,		/* 60Hz */
> >   	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode |
> NewModeInfo), 60, 1, 0x39 },
> > @@ -294,6 +310,8 @@ static const struct ast_vbios_enhtable res_1600x900=
[]
> =3D {
> >   	  AST2500PreCatchCRT), 60, 1, 0x3A },
> >   	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT
> */
> >   	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode |
> NewModeInfo), 60, 2, 0x3A },
> > +	{1800, 1600, 24, 80, 1000, 900, 1, 3, VCLK108,		/* 60Hz DMT */
> > +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode |
> NewModeInfo), 60, 3, 0x3A },
> >   	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT
> */
> >   	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode |
> NewModeInfo), 0xFF, 2, 0x3A },
> >   };
> >
> > base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
>=20
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

