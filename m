Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7053FC8D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 12:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F8B12AE1F;
	Tue,  7 Jun 2022 10:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C67112AE1B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 10:58:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGBn41c7YGPRaT+rMW3kRpMowC+1b8gk+QYLAkg+juX/gRLCwfB8Q+JOwgOBZ57aFem2DV183hWwUStlCWAkKkiDYrB7mn4KS+zlwjJvOBjgwI9jMZDCK1UFUvcLbbTVtTrjK2h14f8ONaTk75eUX98bU/9aWoWGcLmw2G4cWYC60TDZC+tC0zRBBphBZXc/MmSKdHCkyRHI+yah1JkBOPKIiy9rZFSmtTaMSX0r80pIY3Gs3ZDiKdEyglcAhd8Ru3aA/lZsnh1pZ6orha9/KQaSPKtNATvxoA0VwWKWGwipUTWyMCULH8tpWYhYNbZvRWLQ8u62uTlK2BRoTAN1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIweypqHkNzoaMkOGRCxsx1kwGholCyIgiUSdDz8lWw=;
 b=MYPCFVXN2obOI0uOs2DLjb6+J/O72d5xdhZ7B3aU2UZWTmO9vitFHERc9rMrqmHg3ayciGfad7BunwsMRxe78rzd0U4ZB2NUAffAfBN0Xf82K7gvOwckdKoNMvLIUEpuHk33++I9mnHZz+Zg1vUdk5DiObVz2AceGs9W2OuMfEqiKXEjj4yUc6XjO9Eq6gt8fj5EZIwF3jDl9bhdIz7x7enVv2mBXvqC6w44zH63fuvvKUd3NeMmgmYWV9OOPMvlUYoxUX5sISB+c6nIzmwksPpBu5s+0S8p5p9pYfxRyejiPcNtlTH1zfZMofUpRfSmQEVRc9TPpVOGplS++Vy2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIweypqHkNzoaMkOGRCxsx1kwGholCyIgiUSdDz8lWw=;
 b=UpNFo4CEOsKsmOlXCvEMw/j/H8lBvTbCAgdeHP2AfQmIP+itWJ48nJSwzJg3m8d94sBTmS3Py73L6sP1RMlsi7ToLWPDJ7WCMY5fD+w48+suITeSQiNI18jV4Locsb0nrvusWheuRyxOK+56SPZRHMATGJSl8N3H6qJ/In03KXk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8256.jpnprd01.prod.outlook.com (2603:1096:604:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.18; Tue, 7 Jun
 2022 10:58:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 10:58:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 3/4] drm: rcar-du: Add num_rpf to struct
 rcar_du_device_info
Thread-Topic: [PATCH v3 3/4] drm: rcar-du: Add num_rpf to struct
 rcar_du_device_info
Thread-Index: AQHYVZ1MRU0Yq2qUu0e09VqfzPfo+61EDr5g
Date: Tue, 7 Jun 2022 10:58:08 +0000
Message-ID: <OS0PR01MB5922168B367D861B8653668786A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220421163128.101520-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e119569c-0932-4283-4a1d-08da48749b99
x-ms-traffictypediagnostic: OSZPR01MB8256:EE_
x-microsoft-antispam-prvs: <OSZPR01MB8256F439AB72DE8FD2B0877386A59@OSZPR01MB8256.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xAfDmTYRSViOcuxfRApoJZvfVX2oIPTb9vsHZAC50iRZiDdNK7p/RZX+RV/xLqpucYMa3loJcUtkNfq9m53ihuFOA9TxOfsVfL868P5PTcNbIIRhKVEZLTUKlIy1u9gutUa6N1Y+qxFuDEuh7Cn3CnhXkSj9J5mbKwi4vla0keENWJExHhJfVoZTMudvbC6654ogdCLvER5Ov4EolteA9hTZaF2oxoEVX8ZEYt/HksF3yyAjo9Ci5qbtEBKW8BNMGaQ6Tt63YF/m5tL15gk59p7VaC6EgG0UAjJwIc8a4Sx98tp4tpLqGPO4Ym12xnSNKyJ06mdi3XLw+XQbColTIB/eCgYFmpVzqaF/nezFl/4jsM51/iE29ezEARWDveiNU8eftIb9dbBm5fB9n7x2Jr+Wdf4mL/AxdOIsceg0vaSp1+N4hcU+fi4J2UgEMBUpVaw/35fv2ZIcrg/GXpC88IJ8BNVyeASJMmxXUg4HRrY1OcjTN8u2VwnAC5kMgMm3j8ZX1PDDN57oPP49OVXXYjtxULpwPEareht6OvH6gVQF1dig3wKSrc8H54ZkI4LhUwYIVYKquqpULtL/GVfb1idNUht+T+L9+AxgsNLXafbzfRYKi19745XPzgkK9pPdF9X34UMb1Y757oekn4npZgWAV8UnvBeCY/KsmpNtGahdmGvalFW5HmaVaFY8d71iJDofQ7KN/nTfJ4nXAyY+/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(66446008)(8936002)(110136005)(2906002)(76116006)(54906003)(71200400001)(107886003)(316002)(66476007)(5660300002)(38070700005)(26005)(122000001)(55016003)(9686003)(52536014)(66946007)(4326008)(64756008)(83380400001)(7696005)(8676002)(6506007)(66556008)(33656002)(508600001)(186003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GTSBwgd1FKGXgWykqvcPGsvADZ980MHfmNLqPQa60jSrp3qiAWLaGfcZtQJm?=
 =?us-ascii?Q?bNwm9ppGM7z4c5Ib7KlmjDexLSiKtt/O0Ti70m/g+pFgPDA2pYwOcn8ON/RG?=
 =?us-ascii?Q?TKlQprI6tC8x5WJ21smYGHftBkwjUl3MYzVLVN+s/E6jJdn3dEQ+vJbqNRPE?=
 =?us-ascii?Q?LhefvMqd91+VF8j0qxBkSepcivmqZ4pzGl0ViZ3qcBRCP8mc05S910cB/AoV?=
 =?us-ascii?Q?PfU2gnmoJrIrwkGY8VjxyRKnsZOeWlFGMrWG9xbpHuvHCdv4ry6x0el2Y2kQ?=
 =?us-ascii?Q?qsjpmzxn/ujzRChN01waF/pRoaRpdBelX9ABbs6uNDWLEX8W34lgH+UAIy43?=
 =?us-ascii?Q?UZtt89a7VZ2qQKhLHdE/CU7iYqpVXnzQtgj8kmZY6xopjjelRuvGFPrcdYED?=
 =?us-ascii?Q?gjJSqkKm81K7cdyDS8deOs1sR0JKtLqD7h1gsu6S6U+OQNV6WWVsg8yPp361?=
 =?us-ascii?Q?lg+zPHGBX9aAPWxC9AXB7yMzBj3CdqQPNTNPknqZXuVA3tng4tAjMjdWuxkG?=
 =?us-ascii?Q?nE2/7uYTcp81JTj9cJYmisM52RyGyglfzzMljclYGa5ATwjWLRD2cm6e1aVk?=
 =?us-ascii?Q?tla876oJd2aU+AAICbU+9WUWW2n6WV1KQNaopjS2+AXYOq/nLozllESHQ7XT?=
 =?us-ascii?Q?Sg07FvHoeYuTBrmC3DnCftXOkLfxsDpsnIR6ct+6nLr8R4rvbfVTROvAoAfd?=
 =?us-ascii?Q?BwV7Rljqt1iLouHzkRNGaoYC1XHWIiPxkRzGb9RHH9CbS4ufTo2FM6iOeze2?=
 =?us-ascii?Q?I7UbrFN4g3HUxKtsQEu0f+SMCeYIY5k0rPTZHOT+dfmVwqEW+evtE4UUCyMp?=
 =?us-ascii?Q?1chlRthVtk9ngLqwAHC9c8lFfDu7zyu0X4Adb83GzxYJYzC0hu0cMeq6qX9R?=
 =?us-ascii?Q?m8zRut0LvEI2XA9acrzxCx0QLrda5ff89OuFn1hWlXDZJD5TkX7wJ3kGteAO?=
 =?us-ascii?Q?+FtUZ6vqPGhpvUF9k9piUOX0PbmsX9Tab2JdbRL6zGV0HAbirttnRI6/wsSd?=
 =?us-ascii?Q?fq10itVi1T2FFn14blsL9OYJAQ2+kftKbb5AbJjqEk5GH7fjw+vGQVuZewJH?=
 =?us-ascii?Q?S5WkvhX0vwuuOTjum+tEw935+EaLyx3jWBwRkGsYxWZliDWsIhvjd9cEAHTS?=
 =?us-ascii?Q?nEDRudZLrlg9haQsd9yIMSqAJ/X3FjIOhXPkUfqTucNDqncSXvm0xB+xGDuo?=
 =?us-ascii?Q?JlF0u3szmcgEf89u4phFtJ1MfxevMB+Z1wsgvdE358XDzMoQqQQCAA9U2VPw?=
 =?us-ascii?Q?agxnFkCLDLDr2RpPchW1PPWqi7q41KaK6G6S+D7Gd+/l3EefGJr5csPiqxPN?=
 =?us-ascii?Q?1s6MnHhE215Dh4q2xK2IVnIzpDicabqGyMc2PmtDWQHrP7YnmxQwFJBJQ1MI?=
 =?us-ascii?Q?EmKxSmRc6so9Rl001yGSLCCM/y/C1wC82MqAdi33ApubnQLSArV0bv6WTIk/?=
 =?us-ascii?Q?hhcW/sCos0uIw21Tqf0t4t5rrkWQWETBP9JocraL6uCqp3hdT/Lnt9eSVTqN?=
 =?us-ascii?Q?nrM7xGJC97wg9ScAbcmOSGPLk5Eqt83A7WhvIq4dTJhgJ38ykcJ+NEvBTr/X?=
 =?us-ascii?Q?8sK/LenNNE2My5uykqs5cXWcj/+XkN+eycX8kL3YyVrLZeRnNx2jp3udTPB1?=
 =?us-ascii?Q?uqKMt+Udc4N0YoMkc0cYIYWegQU2y9nAGhZuaY4PI6Jy1K/d5kPIgdULAl9h?=
 =?us-ascii?Q?0BLCIG3O9//N6Bi+NSM5Wy2VzNtTs9i0HPG0R09y5jv+VN1jCQ7oaQjr3jc0?=
 =?us-ascii?Q?4C6o4Psl2RMSYhj9oBsMYe0t3WzljZo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e119569c-0932-4283-4a1d-08da48749b99
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 10:58:08.9954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0VqEQ3rAAepjJMqn3AKlXORJvHsA8Sgf/cw8sUlixTA3rPJi2fN2hapWGc7D3xPBOrdX/ceyo3O+yt8QQVWy6R3aFQ63jSr7MjFSaIWvkuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8256
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping. Are we happy with this patch?

Since RZ/G2L is using separate drm driver,
I can drop this patch, if needed.

Please let me know.

Cheers,
Biju

> Subject: [PATCH v3 3/4] drm: rcar-du: Add num_rpf to struct
> rcar_du_device_info
>=20
> Number of RPF's VSP is different on R-Car and RZ/G2L  R-Car Gen3 -> 5
> RPFs  R-Car Gen2 -> 4 RPFs  RZ/G2L -> 2 RPFs
>=20
> Add num_rpf to struct rcar_du_device_info to support later SoC without
> any code changes.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v2->v3:
>  * Added Rb tag from Laurent.
>  * Fixed the comment "max num"->"num"
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 17 +++++++++++++++++
> drivers/gpu/drm/rcar-du/rcar_du_drv.h |  2 ++  drivers/gpu/drm/rcar-
> du/rcar_du_vsp.c |  6 +-----
>  3 files changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 957ea97541d5..1bc7325aa356 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -55,6 +55,7 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7743_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 4,
>  };
>=20
>  static const struct rcar_du_device_info rzg1_du_r8a7745_info =3D { @@ -
> 77,6 +78,7 @@ static const struct rcar_du_device_info
> rzg1_du_r8a7745_info =3D {
>  			.port =3D 1,
>  		},
>  	},
> +	.num_rpf =3D 4,
>  };
>=20
>  static const struct rcar_du_device_info rzg1_du_r8a77470_info =3D { @@ -
> 104,6 +106,7 @@ static const struct rcar_du_device_info
> rzg1_du_r8a77470_info =3D {
>  			.port =3D 2,
>  		},
>  	},
> +	.num_rpf =3D 4,
>  };
>=20
>  static const struct rcar_du_device_info rcar_du_r8a774a1_info =3D { @@ -
> 133,6 +136,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774a1_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 5,
>  	.dpll_mask =3D  BIT(1),
>  };
>=20
> @@ -163,6 +167,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774b1_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 5,
>  	.dpll_mask =3D  BIT(1),
>  };
>=20
> @@ -190,6 +195,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774c0_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 2,
> +	.num_rpf =3D 4,
>  	.lvds_clk_mask =3D  BIT(1) | BIT(0),
>  };
>=20
> @@ -220,6 +226,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774e1_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 5,
>  	.dpll_mask =3D  BIT(1),
>  };
>=20
> @@ -272,6 +279,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7790_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 2,
> +	.num_rpf =3D 4,
>  };
>=20
>  /* M2-W (r8a7791) and M2-N (r8a7793) are identical */ @@ -297,6 +305,7
> @@ static const struct rcar_du_device_info rcar_du_r8a7791_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 4,
>  };
>=20
>  static const struct rcar_du_device_info rcar_du_r8a7792_info =3D { @@ -
> 317,6 +326,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7792_info =3D {
>  			.port =3D 1,
>  		},
>  	},
> +	.num_rpf =3D 4,
>  };
>=20
>  static const struct rcar_du_device_info rcar_du_r8a7794_info =3D { @@ -
> 340,6 +350,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7794_info =3D {
>  			.port =3D 1,
>  		},
>  	},
> +	.num_rpf =3D 4,
>  };
>=20
>  static const struct rcar_du_device_info rcar_du_r8a7795_info =3D { @@ -
> 373,6 +384,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7795_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 5,
>  	.dpll_mask =3D  BIT(2) | BIT(1),
>  };
>=20
> @@ -403,6 +415,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7796_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 5,
>  	.dpll_mask =3D  BIT(1),
>  };
>=20
> @@ -433,6 +446,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a77965_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 5,
>  	.dpll_mask =3D  BIT(1),
>  };
>=20
> @@ -459,6 +473,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a77970_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 1,
> +	.num_rpf =3D 5,
>  };
>=20
>  static const struct rcar_du_device_info rcar_du_r8a7799x_info =3D { @@ -
> 486,6 +501,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a7799x_info =3D {
>  		},
>  	},
>  	.num_lvds =3D 2,
> +	.num_rpf =3D 5,
>  	.lvds_clk_mask =3D  BIT(1) | BIT(0),
>  };
>=20
> @@ -505,6 +521,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a779a0_info =3D {
>  			.port =3D 1,
>  		},
>  	},
> +	.num_rpf =3D 5,
>  	.dsi_clk_mask =3D  BIT(1) | BIT(0),
>  };
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 101f42df86ea..83530721e373 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -69,6 +69,7 @@ struct rcar_du_output_routing {
>   * @channels_mask: bit mask of available DU channels
>   * @routes: array of CRTC to output routes, indexed by output
> (RCAR_DU_OUTPUT_*)
>   * @num_lvds: number of internal LVDS encoders
> + * @num_rpf: number of RPFs in VSP
>   * @dpll_mask: bit mask of DU channels equipped with a DPLL
>   * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot
> clock
>   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as
> dot clock @@ -80,6 +81,7 @@ struct rcar_du_device_info {
>  	unsigned int channels_mask;
>  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
>  	unsigned int num_lvds;
> +	unsigned int num_rpf;
>  	unsigned int dpll_mask;
>  	unsigned int dsi_clk_mask;
>  	unsigned int lvds_clk_mask;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 9c4d1d1be1d4..abd31fd1e979 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -405,11 +405,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
> struct device_node *np,
>  	if (ret < 0)
>  		return ret;
>=20
> -	 /*
> -	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited
> to
> -	  * 4 RPFs.
> -	  */
> -	num_planes =3D rcdu->info->gen >=3D 3 ? 5 : 4;
> +	num_planes =3D rcdu->info->num_rpf;
>=20
>  	vsp->planes =3D kcalloc(num_planes, sizeof(*vsp->planes),
> GFP_KERNEL);
>  	if (!vsp->planes)
> --
> 2.25.1

