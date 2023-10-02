Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7327B4C6E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC8389D60;
	Mon,  2 Oct 2023 07:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E01F89D60
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAAPm6wwMbCGsWT0B3ZuF7EX5AW2M7V+xgwlnv3nffdO3cFXH9SO5hndJ0V/Pn3Qh5EOhbL4Osn3V7Z6+F1+RWL6MiuwQ970EeImDv7HfdZftWeo16v8iATtTop6wP3b4pUOCgjz0scXTEuD5c4o0ipuqiIvfKQbG54ZYV/cVkhpCx6hHsV4JypKz8f2plcxrqyyIbAKNa7O6//PY2xm3pk+8kMFZdN6OGh713qft91psUeLx7mOLnXYZSPeyFbJxuOWCVYxUjfrlE4/Kz9hfaiywH+59JglYe1inDgiv4UogQdANkJdCZ3EF1axX1oSBnLwkL9YSwBeAXidFqajLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WfwQ4IPPXNKDQ9ma6lr0wzgP1CNSzgqYuwBv7R226M=;
 b=aCbrq3avpRRY6/TXEtJf21xYDFDTFsJNk/9nky6/eYb0ZYtlaNPWJjuWd1DbMdg7T1FwNkgkNVlvESj42Mm6CugS+OEmvD+TyC5alDIMfmF0RBNt341BTVZNiH0NGq8g4NNSHU1Z1Mbn8YrznVLrA+vUNa573uKf50pEXMCno++lI7KV7ijb4/eJdw6BrbdEIGtcAoljLWSh+TKgDJKK0gVgUXHq5kxiD7FqhdA4WwMbE+s573gwOMpMPcut0ChdMPbr6nLyBjJPgRJSf1Eb5LMHsisuvr/acpsm/lrk6cbmfopwoU1xDi5JJJhLIsd9kPubscQ2YXk+WtPrXt/2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WfwQ4IPPXNKDQ9ma6lr0wzgP1CNSzgqYuwBv7R226M=;
 b=iUMlwwVz6O6psYml+6KZIApY7oqISNPB/96mjWfWtu32ojIad2PU9CH5g973Cq2nMW24B+MwIp62BiQ4NPOtOiDooPmrNp2zsNsqC/hLA36RaLbCTNBw8LbW7dbJmyWj4m38Txv2dviLUMl6QUoTAJMdXFWm9M+9CyZJ2cXaOTc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10972.jpnprd01.prod.outlook.com (2603:1096:400:3a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Mon, 2 Oct
 2023 07:14:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fb78:2e8c:f7f9:5629]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fb78:2e8c:f7f9:5629%7]) with mapi id 15.20.6838.028; Mon, 2 Oct 2023
 07:14:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2 0/8] ADV7511 driver enhancements
Thread-Topic: [PATCH v2 0/8] ADV7511 driver enhancements
Thread-Index: AQHZ202jCBNL1aKlyEaWSc1tCd8m3rA2SVNg
Date: Mon, 2 Oct 2023 07:14:43 +0000
Message-ID: <OS0PR01MB5922B6B282401FDB42135F1086C5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10972:EE_
x-ms-office365-filtering-correlation-id: e60f3848-edc0-4fe1-b716-08dbc3174091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WB4jam2JYVP3VDRR1mbXbNJBOymWDHx9GTZJeG7pnyFv+76a9ZLKzQvW10h/BM6NIqZGYrM1ju/Rk6EEvJo9227OI3wpnEHqc+JqZw/HkZ5Nxcl3xKj5Aie4MWS4Y2V/G6/o6CxUBuNpCMANdaZ2a+m56wdlyH6lJ576t8R/jj8PRjEybpjoB84vt7QPoTF7zplDa30TFuheEBBFqgwViZCs+PKl1BAJcNM/Ut3AXgFyNn4++Q7fgnM2khNaVZlklElKFNb+Toy3l+N+IzVDrGXhMJ+xUsMNfWz6l8wZG3THM1CzZuaiWviLPPv0U8PAcgtT/EcKhKa1ldBO8W7Ew3Xx5DzqLzDk7ZqnhNPvH/gEYtxTfu45WpcrbNWnTDlWNQ5ZYH3Gb3yTa45OB584OSJZtydtn7QVZmqq8AarPrm3ZVf0HRo66PwTLsWY6TaNE8ZhfdxTEZJEtRSYcM1wkVHiNv3K1Ce88Plz9zjRMHeuegpii/bLOjLkAULygiNoInHTR1uG2LDy9fMhc45LFvKGlr18oKCltvkOp6mJIsCzsBlJw6YrqHADikaQduriQfbqxlWTyhSJBCDLs6JLT13Kh9vapuHW0nTWAV5NDOCPrWZvZhWBC/ttJvh50LAl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(53546011)(71200400001)(38070700005)(66556008)(122000001)(38100700002)(26005)(7696005)(33656002)(86362001)(66476007)(110136005)(6506007)(478600001)(76116006)(66446008)(54906003)(316002)(2906002)(41300700001)(4326008)(8676002)(55016003)(8936002)(66946007)(7416002)(83380400001)(5660300002)(64756008)(52536014)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A8z0AxKQQBQlhRWx4HhAGUOpdA78/hkVKkqCq+9nchwaGMAnJc24e3p/iM?=
 =?iso-8859-1?Q?YG7PHnxyIpKH08+7Nz2vMVTLczQhaG0NyY+Vi8oif+0uRK7Gbl5T3pgVky?=
 =?iso-8859-1?Q?a5fEXy9yfp2Ad2Fu/yIJ1K6oMtPsXH58jWYpdj7fUI05igT8v07YiQJx+z?=
 =?iso-8859-1?Q?LynJsUjuPsC4nMyUzmTjTcBcviEwd1ONvZGObSpGWJ1vKY0EaOrIJengdV?=
 =?iso-8859-1?Q?WVCFaxY9hzyZuiehvRQiI7hynrXN03rGdc+LS74rSXA3mg/tA15gPHdrt/?=
 =?iso-8859-1?Q?xvh0+sVp+H59zCdcJonnreuOCWTrWZBJwyfDUenEU8Yw6MuMbFyrZh/H99?=
 =?iso-8859-1?Q?8oVqvmjbdLE0rG4GOGrk7Et+7fszVjlUVQt15XW44w4x9ruVf+ZjYfJNFs?=
 =?iso-8859-1?Q?yqZyT2lmi1JRVO+wGS8bW6iHDmc7eh/18hL8ayJKoStzWbluJnklcC9hzU?=
 =?iso-8859-1?Q?DA+3pVVbRyOUkU2PcV2ofTxw3BmLK80LevVI/v3e2q3LmSEtreyEUITHk2?=
 =?iso-8859-1?Q?9lYhSOlVVVw8xqHe7BnzLU7xdIt1QLMLudEzszah4E4JtOO8WU6pYI9+Ef?=
 =?iso-8859-1?Q?6Z1dQQfLhhvQqCoUzpXFrZVIQX0D9lSfP5pnTPGvYAB5YaifQIWbXow+Jv?=
 =?iso-8859-1?Q?OrVVACz++Idk3BVkH14Ksf3tjERtEmOI++yKYBqXpGNEVEla4yhzeybWW6?=
 =?iso-8859-1?Q?jIEKdv8Y9VwDlFtsMOV1oXzqGoK/0fwliHiJg6I7uaat0W8MedkbAHmz16?=
 =?iso-8859-1?Q?hzHXWcwjGH3782AFnm2CviErxPSpzVSVETeIt17sRZNrOHi2YyH6HcBHG0?=
 =?iso-8859-1?Q?pM2I8uieMo2jgCnDME+CTTxMVybhpmd+rXrnNfHsFW9gMnnA5xJza7buAd?=
 =?iso-8859-1?Q?VRVsYtJFTdo2Q+b6118p62ooXrYmXHuBXy3C8hbDcV0q/TLclzIGWA6aKW?=
 =?iso-8859-1?Q?Dkt7YswTG+jv4yiw1StFFjJSSMkVhgQOl8+puXXvPxIGxBE8BDNIpwLnU3?=
 =?iso-8859-1?Q?HBOBEAbIRxZN5ZnLosFI6keF/MPhfF+Zt3Fj6Q4LoDvi+Wjuc1T7T2B5Nz?=
 =?iso-8859-1?Q?ERKvWHGZpeq2Iv8xjAQJ3q126fz0wefz2cwuAO0XicqiuP7CSiFOERZqeB?=
 =?iso-8859-1?Q?haVfEYB9ysUHIi78k3OVSFjnVeCiYY9hSBAjEIcyTeU2uDMSV+qq0S4Tz8?=
 =?iso-8859-1?Q?XddgEYsEC9plvZTLBn5CRSc0e4CwhZmXpcAZC2rOE+87ka9Brn3mjArjxf?=
 =?iso-8859-1?Q?1G3Psuv5OK3JgPBVjwO2qQrZIrkhsJsCtoVD4RCk0H+7E55w7ZoOURjSkk?=
 =?iso-8859-1?Q?yJfV7N9vQduYPb62s4sjCzbou1E3Xcu8EN4s8RodaxKc1c7uS0n+KSmo5A?=
 =?iso-8859-1?Q?ymrBitTbwbdzGPvezMMU/K9IhCs3sLDSj1aOoubTxNIZDg9LCIc1tj6+V1?=
 =?iso-8859-1?Q?io3Zl/ZT2WeT7ZP1conHy/uJzsxoLdFsuKO0kHz79a6lBaZQpepAdF7ANX?=
 =?iso-8859-1?Q?9JbulnDZA9gf8/pcYP65swE+UJ0c5Na01RujEdLzB38blf+BDX5asracbH?=
 =?iso-8859-1?Q?c5ln/oT7f6uL8pGXVaNsBJ6c1o+Z++7hDvtVnWMPPd7BkaLvFP4Ztw9TNs?=
 =?iso-8859-1?Q?1d5x1c74KnSe24imouHPwgCT4DUlvwH6ywZOI+WnirzdoIsQPYzdE1eQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60f3848-edc0-4fe1-b716-08dbc3174091
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 07:14:43.7638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPIJ/7zhoEFtAO7yMxiMCc8vxAb5zf26HRs/QcmFzCCp3cCJWcen/lLht4rnuvgUk/5oME+TXW1TJFnqepk/AsglsK1SJDZOMEmSpYetQ3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10972
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
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Adam Ford <aford173@gmail.com>, Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping. Are we happy with this patch serries?

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Wednesday, August 30, 2023 3:24 PM
> Subject: [PATCH v2 0/8] ADV7511 driver enhancements
>=20
> This patch series aims to improve ADV7511 driver by adding feature bits a=
nd
> data instead of comparing enum adv7511_type for various hardware
> differences between ADV7511, ADV7533 and ADV7535.
>=20
> This patch series tested with[1] on RZ/G2L SMARC EVK which embeds ADV7535=
.
>=20
> [1]
>=20
> v1->v2:
>  * Added Rb tag from Adam and Laurent.
>  * Added tested by tag from Adam and Fabio.
>  * Updated commit description with reason *why* the change is needed.
>  * Dropped the local info variable and instead started using
>    adv7511->info->type in probe().
>  * Replaced max_mode_clock->max_mode_clock_khz in struct adv7511_chip_inf=
o
>  * Replaced variable type for max_mode_clock_khz from
>    unsigned int->unsigned long.
>  * Replaced max_lane_freq->max_lane_freq_khz in struct adv7511_chip_info.
>  * Replaced max_lane_freq_khz variable type from
>    unsigned long->unsigned int.
>  * Added trailing commas for num_supplies in adv753{3,5}_chip_info.
>  * Added patch#5 for adding the reg_cec_offset variable to struct
>    adv7511_chip_info.
>  * Replaced has_dsi variable type from unsigned->bool.
>  * Restored check using type for low_refresh_rate and
>    regmap_register_patch().
>  * Replaced link_config variable type from unsigned->bool.
>  * Restored enum adv7511_type as there are users.
>  * Replaced hpd_override_enable variable type from unsigned->bool.
>=20
> Biju Das (8):
>   drm: adv7511: Add struct adv7511_chip_info and use
>     i2c_get_match_data()
>   drm: adv7511: Add max_mode_clock_khz variable to struct
>     adv7511_chip_info
>   drm: adv7511: Add max_lane_freq_khz variable to struct
>     adv7511_chip_info
>   drm: adv7511: Add supply_names and num_supplies variables to struct
>     adv7511_chip_info
>   drm: adv7511: Add reg_cec_offset variable to struct adv7511_chip_info
>   drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
>   drm: adv7511: Add link_config variable to struct adv7511_chip_info
>   drm: adv7511: Add hpd_override_enable variable to struct
>     adv7511_chip_info
>=20
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  16 ++-
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c |  14 +--
> drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 104 +++++++++++--------
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     |   7 +-
>  4 files changed, 81 insertions(+), 60 deletions(-)
>=20
> --
> 2.25.1

