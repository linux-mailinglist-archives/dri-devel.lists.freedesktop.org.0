Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E265662133
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C7810E389;
	Mon,  9 Jan 2023 09:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D9110E387
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkkcE53O+ikVzy9ehcYcIvO6Wg8uKsPUA0d1spPF0Lh6X2rk4yWPIzDfvkXYEZuldF/DeyV+5vU0UxqeViJzH/Su+oWQTuO0UVtCHcDRV/u/xLgJEWpmeXWLc2ymRl1tppkXj+2w8uVU5ShhKypSYOvp/j1Whgn1LAM0hfa+fQDT970YQfI8wDkFDXwufuLVbrBnmXXFQIL5zjSbzXgGr6lI8AtnJdrmWFKV7NzXbPeVC0RGkDjUNK/Y10dvWB+a3R6Dgn63VuXtqTK2FxnqzkuRZsU/A5kxtCdH30a448/N2dga+9QBoyZ/1a5FrSnJMl9JpKUNpcQ7jHi+QgnUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uj4AHyvB7lnpfqoMdMwVWSnA4hBI0re9XAHLCTIGUKI=;
 b=fCAl7WG2JrrZmutYSy+grSjbG0o5uqljBMcV2msP1TivX/XNusuV13xsiYg/Dxm7McdJNuKyz0nJTGjRmPWgaJ3FwEW3izMq+Bnkn7pD8URKLb/ONqvXG94ZBSoMfsqBD9iQhk+2HteIhD0CMmWyRmrY/MDICKQEum01znXgZpRxG8RLmIvD1rmmGw6hwIoZMwPbWZQ5A6JfEHTkK1eJaHqNgBl7h5BBSnk6JPfkhkS5M8BnqiqnmslHVTIWKY3wN/d4TX0vbSQnmuFrpFPQ1d6Lw9XCkVYeVWYLh5vMHJ711YveuTbI0dp513XN1D9gz5z/48tH86yvrDySZ0gvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj4AHyvB7lnpfqoMdMwVWSnA4hBI0re9XAHLCTIGUKI=;
 b=L2e7RlVnObYzISTjELA4XiBDsGGN6rxmRLnQGUDQoL3bsaFPqr9tzaSre1Ki7Wot2V6/G+QHukAnrhVlndQqwjUejMea/owA8ia5THy3gRObIChEk/DUab5i/e1cftG2hEr00szuamGWXZ2KQDGBrddPyoGtyxY0DIczYW5o9Ls=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYBPR01MB5376.jpnprd01.prod.outlook.com (2603:1096:404:8021::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 09:15:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 09:15:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH v6 00/19] Add RZ/G2L Display support
Thread-Topic: [PATCH v6 00/19] Add RZ/G2L Display support
Thread-Index: AQHY/2EcNH3yg8GNpEWJnvpILR9nRq6WFrsA
Date: Mon, 9 Jan 2023 09:15:11 +0000
Message-ID: <OS0PR01MB592245F239175EB4EC7CF76386FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYBPR01MB5376:EE_
x-ms-office365-filtering-correlation-id: d1f22685-f419-4252-6fcd-08daf22202b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v7cSJqDPBrdlPxm8d6QoWMPz+iYbF+i1M3cnXSQkN+Tq3tc5F0CXrRdfx17F1aPGObVRgJ25nkqAQN0L2+TSfzkwj6+t3Qqobg9my6rzu8kbOeEDdlE51fZDpUU/4ADCSQZIO9J8sGLvyVTzNYYHjUKDJEdzw+ZtapiUjsCpvytnvzjN6qmNkCmORjze3D2BnmhNElmDVI0a5NI+nb0lrlOwEGzpP4d5xSPLtCkbIbJ/vkF6cwv3//Ws6of4CCjitxm5ROv218Yl4dNb2jEBWOtW06LbXq4qXIkhjPpHTnKM/HCKi+nzRZBdFF5louz1a1qFT17d9yGHQpg/Q20PSRA0v8ew+S4RRObc7Gx5cJHZGaC6TIPbvREJbXOO3A3pUX1HQROtlNSU4tjNjaY6J6aIEtFJQQag7HoW9VbebaO87LQ/0jqO7TOEdEiut1dHebvm3/Aa4Ys+VaNGqetd/gq8SPbteU2IfaoybwrlrkymwaNQ+UUwb/gj/HbvADmPvJZUZWp4DSzXdZS/GHHJbHBpzDyBKy1G0p9ogUSnUcomctSJXWzDoO5KRdgaMM2L+uq0IwnutB5IJ5XyGdc48qOw3s+anFYAhXCeJ53x+5qgAPyAjkSd0el0j//cyPXbO4QjugicwnfeHownSMUF0IEOENAQjOyEWNEPQ9mCuGjEKP4+Y0rB9QpPNRGLWBqNFL+itDqSqaS8RBo/mILv1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(52536014)(41300700001)(8936002)(30864003)(5660300002)(2906002)(66946007)(8676002)(66446008)(64756008)(66556008)(66476007)(76116006)(45080400002)(316002)(7696005)(71200400001)(110136005)(40140700001)(54906003)(33656002)(966005)(6506007)(478600001)(53546011)(26005)(9686003)(4326008)(186003)(55016003)(86362001)(83380400001)(38100700002)(38070700005)(122000001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eHJrctH/WmMXryQnOIeQi4h/dPlC+79L0AI1AAgmP4Y/SQSjVedmUt27CowT?=
 =?us-ascii?Q?g8X5rcioKa9KK4GKU+ORhP1heGIHF+n2SFnZOpYungXMMGK6BJhbinfjqYkX?=
 =?us-ascii?Q?+rfd+D1ZOPPM7Tbg/e1HCaQAdnyOMH0nhef75JWrL1eq+UjwvemrDq+e4tdL?=
 =?us-ascii?Q?Gbpiv1yvkSqbk5+Cy4H1ES9P1HoXdqHm5YqzlSWKq7HqE2CfC0sLMtChcSke?=
 =?us-ascii?Q?KyW9mimUpGLrvvv3/0tkXGIOG5Gm0AWWITMXnDZ+2IY5joEuYC1IQn/ZHUNY?=
 =?us-ascii?Q?NFITBtfEPWj9FoGWjDMBw6Zu5otbh+glIaBgL/uOugzTpwcwAvyYg/UuYRYu?=
 =?us-ascii?Q?ToVjcSHfo2J/rUsqpCY0+Kt8x8z0CCoy2SJoLAYY8ZGAgS8VmIYxxXPpxWRG?=
 =?us-ascii?Q?YP5qnD80bxvW+qFyz+w54hsICfwjSUQbUZNT3oKiyLlGd9BUcI2K2osC4raU?=
 =?us-ascii?Q?lGtBb/0pe79pAdQElU3xoYEK5BU4uLqcNzG7he6z5LRI+mGNQGHkvy3ezbri?=
 =?us-ascii?Q?K63F9e0GyUONOsKVsc5HOttwjA8yEcOrw1KU3LLPKA6dNx7PxEm3FBWhfgCN?=
 =?us-ascii?Q?mO/JnG4IcaSZrySS+3wgrKs/B3HvC5EoSAbFuAHD5sSHa7LnLSmeUtAV6rq2?=
 =?us-ascii?Q?z8Tuy8rcoosv3LIEoVOHtsXjie9wE/bkRYHZ2yHA71kBHPdqCWZWOWGUFkiW?=
 =?us-ascii?Q?Cs1/H0GTZnl7r03yn28OFd9TtLHFKOuxE72v/1xMNdxagEQHUmTv8xoqsofb?=
 =?us-ascii?Q?Ywtlzapcz/ttAT9Nuua1gIFVUPMjtWqD9d8YxE9WEpBhZpI/+/U1P4p5uPdz?=
 =?us-ascii?Q?zFgdWZYTc9toiOiIHjZkDCrKtFGQzFMFBniWAyK+nvU8izG2Qatd7A4wg/wf?=
 =?us-ascii?Q?rYNWLWTYdgsE6ATwx6ZQJz2x3FWX5cH36nwOD2K0l2BDIZ4UvDlYi9Ds4L9O?=
 =?us-ascii?Q?nHJpRxcow9OYvm5B3IICkTCOvSy7GPS1vPa8CXDWCzfL5lY9moFplM7sNg1w?=
 =?us-ascii?Q?XuNO9r35KhhZLL4hB1vsqh2eF6C1+krU6h0mLlpZ3i7oChkXnT1Dumd3gPgq?=
 =?us-ascii?Q?U5mQ/5wRTYfNE5hgsMvXujni3Mcgli+sKmiNHNfRz6zu3RBO3zxqiQ8MoLu4?=
 =?us-ascii?Q?1Yt4hnf22+4+D7SHilnJu5GJgoK+5mK+nJLjwJAfCUM1sec+YtTOQv/d9vDW?=
 =?us-ascii?Q?DS/0lESsInR7svnRrzPyyUeo1KY98VidG4/cFUjXZSIW8AZn7f7SIB4EpqbS?=
 =?us-ascii?Q?KyAOdW8qGd3iAnMPqGc4rzNPR1gn8X4sCNtKRtYJ96/cx3fgEJIGR0GQXErN?=
 =?us-ascii?Q?48mqd8cTTnzK39TX2QjzKG1ypV/qEgBLWIwBPoBThocJJKHkQwuTJe2hDWdj?=
 =?us-ascii?Q?o4Cx22fkIb3C8SqPgqjg6aBLu4gW1PJIJce05k9oySCXe+J+1dG7F9Sb/bV/?=
 =?us-ascii?Q?dV6P8hLPhfagpRbeif2P2IGStZshrK3R+pDix0yi2ot/rMlO/4rl4PhO8tjs?=
 =?us-ascii?Q?8mK320yDVqwtqhoBKhHQoBfEV1SAHF6w5BKXNxUnmyYVeSurbOaoXBCmYlNT?=
 =?us-ascii?Q?UTaSKCPP76umVpfVmnLQkI6xzKSA5FVz4PHPdgEAHhp9FrmrCRGXBsE+jZMf?=
 =?us-ascii?Q?bQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f22685-f419-4252-6fcd-08daf22202b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 09:15:11.4707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71/UlrZv0Q7XRsnH3BfNJAFHHkaTJZye6qHrSJTbxAhFYbLecgO6sTb+Q3erd7xjkYWXSZifnfG1lBUMVxldScv77GjNRUjD3l2oWgh2xiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5376
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent and DRM folks,

Gentle ping for review.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 23 November 2022 17:29
> To: David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Ro=
b
> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>; dri-
> devel@lists.freedesktop.org; devicetree@vger.kernel.org; Geert Uytterhoev=
en
> <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> renesas-soc@vger.kernel.org
> Subject: [PATCH v6 00/19] Add RZ/G2L Display support
>=20
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Vid=
eo
> signal processor (VSPD) and Display unit(DU). The output of LCDC is
> connected to Display parallel interface and MIPI link video interface.
>=20
> The output from DSI is connected to ADV7535.
>=20
> The DU controller on RZ/G2L LCDC is similar to R-Car as it is connected t=
o
> VSPD. RCar DU lib is created for sharing kms, vsp and encoder driver code
> between both RCar and RZ/G2L and created new CRTC/DRM driver specific to
> RZ/G2L.
>=20
> v5->v6:
>  * Merged DU lib and RZ/G2L du driver in same patch series
>  * Rebased to latest drm-misc.
>  * Merged patch#1 to RZ/G2L Driver patch.
>  * Updated KConfig dependency from ARCH_RENESAS->ARCH_RZG2L.
>  * Optimized rzg2l_du_output_name() by removing unsupported outputs.
>  * Fixed checkpatch warnings
>  * Updated rcar_du_vsp_plane_setup()
>  * Updated rcar_du_fb_create() for the pixel fmt error.
>  * Updated commit description for RZ/G2UL driver patch
>  * Updated Kconfig
>  * Replaced drm_fb_cma_helper->drm_gem_dma_helper
>  * Updated header files.
> v4->v5:
>  * Added Rb tag from Rob for binding patch.
>  * Started using RCar DU libs(kms, vsp and encoder)
>  * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
>    rcar_du_format_info and rcar_du_encoder.
> v3->v4:
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-d=
u
>  * started using same compatible for RZ/G2{L,LC}
>  * Removed rzg2l_du_group.h and struct rzg2l_du_group
>  * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
>  * Removed rzg2l_du_group_restart
>  * Updated rzg2l_du_crtc_set_display_timing
>  * Removed mode_valid callback.
>  * Updated rzg2l_du_crtc_create() parameters
>  * Updated compatible
>  * Removed RZG2L_DU_MAX_GROUPS
> V2->v3:
>  * Added new bindings for RZ/G2L DU
>  * Removed indirection and created new DRM driver based on R-Car DU
> v1->v2:
>  * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
>  * Updated commit description for bindings
>  * Removed LCDC references from bindings
>  * Changed clock name from du.0->aclk from bindings
>  * Changed reset name from du.0->du from bindings
>  * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
>  * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
>  * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
>  * Added forward declaration for struct reset_control
>=20
> [1]
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.
> kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220312084205.31462-2=
-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D05%7C01%7Cbiju.das.jz%40bp.ren=
esas.
> com%7C188b5bb9959c455feddd08dacd783d30%7C53d82571da1947e49cb4625a166a4a2a=
%7C
> 0%7C0%7C638048213567344079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQI
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DIMf=
szHaw
> IRmRJzVhVxvRyWI9%2FJQAJ5UJ7mjJsCVWCZY%3D&amp;reserved=3D0
>=20
> RFC->v1:
>  * Changed  minItems->maxItems for renesas,vsps.
>  * Added RZ/G2L LCDC driver with special handling for CRTC reusing
>    most of RCar DU code
>  * Fixed the comments for num_rpf from rpf's->RPFs/ and vsp->VSP.
> RFC:
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.
> kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220112174612.10773-1=
8-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D05%7C01%7Cbiju.das.jz%40bp.ren=
esas.
> com%7C188b5bb9959c455feddd08dacd783d30%7C53d82571da1947e49cb4625a166a4a2a=
%7C
> 0%7C0%7C638048213567344079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQI
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dj4V=
AFXNz
> bRYcEnVYegtYyIs917yfivurp8YCuNs26kI%3D&amp;reserved=3D0
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.
> kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220112174612.10773-1=
2-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D05%7C01%7Cbiju.das.jz%40bp.ren=
esas.
> com%7C188b5bb9959c455feddd08dacd783d30%7C53d82571da1947e49cb4625a166a4a2a=
%7C
> 0%7C0%7C638048213567344079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQI
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DIuT=
kYbVY
> zBkRIVEalsm%2BDt8yfkdbRnyvYXO%2B5tBNFQw%3D&amp;reserved=3D0
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.
> kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220112174612.10773-1=
3-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D05%7C01%7Cbiju.das.jz%40bp.ren=
esas.
> com%7C188b5bb9959c455feddd08dacd783d30%7C53d82571da1947e49cb4625a166a4a2a=
%7C
> 0%7C0%7C638048213567344079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQI
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DPwD=
mpSsm
> Yr9xnHDc1R%2FeljaeDDaCeIKUUjs7ak6cu3A%3D&amp;reserved=3D0
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.
> kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220112174612.10773-1=
9-
> biju.das.jz%40bp.renesas.com%2F&amp;data=3D05%7C01%7Cbiju.das.jz%40bp.ren=
esas.
> com%7C188b5bb9959c455feddd08dacd783d30%7C53d82571da1947e49cb4625a166a4a2a=
%7C
> 0%7C0%7C638048213567344079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQI
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D%2B=
8Koz6
> XdxLSbvRgJ7o319aTShHiPbod%2FA0TVl9%2FqYSE%3D&amp;reserved=3D0
>=20
> Modetest output:-
> root@smarc-rzg2l:~# modetest -M rzg2l-du
> Encoders:
> id      crtc    type    possible crtcs  possible clones
> 43      42      none    0x00000001      0x00000001
> 45      0       Virtual 0x00000001      0x00000002
>=20
> Connectors:
> id      encoder status          name            size (mm)       modes
> encoders
> 44      43      connected       HDMI-A-1        520x320         30      4=
3
>   modes:
>         index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>   #0 1920x1080 59.72 1920 1968 2000 2080 1080 1082 1087 1111 138000 flags=
:
> phsync, nvsync; type: preferred, driver
>   #1 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags=
:
> phsync, pvsync; type: driver
>   #2 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags=
:
> phsync, pvsync; type: driver
>   #3 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags=
:
> phsync, pvsync; type: driver
>   #4 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000 flags=
:
> phsync, pvsync; type: driver
>   #5 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags=
:
> phsync, pvsync; type: driver
>   #6 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags:
> phsync, pvsync; type: driver
>   #7 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags: phsy=
nc,
> pvsync; type: driver
>   #8 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags: phsy=
nc,
> pvsync; type: driver
>   #9 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsy=
nc,
> pvsync; type: driver
>   #10 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags:
> phsync, pvsync; type: driver
>   #11 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags:
> phsync, pvsync; type: driver
>   #12 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags:
> nhsync, nvsync; type: driver
>   #13 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags:
> nhsync, nvsync; type: driver
>   #14 1080x607 59.97 1080 1120 1232 1384 607 608 611 629 52210 flags:
> nhsync, pvsync; type:
>   #15 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags: nhsync,
> nvsync; type: driver
>   #16 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags: phsync,
> pvsync; type: driver
>   #17 800x600 72.19 800 856 976 1040 600 637 643 666 50000 flags: phsync,
> pvsync; type: driver
>   #18 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags: phsync,
> pvsync; type: driver
>   #19 800x600 56.25 800 824 896 1024 600 601 603 625 36000 flags: phsync,
> pvsync; type: driver
>   #20 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync,
> nvsync; type: driver
>   #21 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync,
> nvsync; type: driver
>   #22 720x480 60.00 720 736 798 858 480 489 495 525 27027 flags: nhsync,
> nvsync; type: driver
>   #23 720x480 59.94 720 736 798 858 480 489 495 525 27000 flags: nhsync,
> nvsync; type: driver
>   #24 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags: nhsync,
> nvsync; type: driver
>   #25 640x480 72.81 640 664 704 832 480 489 492 520 31500 flags: nhsync,
> nvsync; type: driver
>   #26 640x480 66.67 640 704 768 864 480 483 486 525 30240 flags: nhsync,
> nvsync; type: driver
>   #27 640x480 60.00 640 656 752 800 480 490 492 525 25200 flags: nhsync,
> nvsync; type: driver
>   #28 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: nhsync,
> nvsync; type: driver
>   #29 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags: nhsync,
> pvsync; type: driver
>   props:
>         1 EDID:
>                 flags: immutable blob
>                 blobs:
>=20
>                 value:
>                         00ffffffffffff003683832410101010
>                         1416010380342078eeb725ac5130b426
>                         105054bfef8068c0714f818001010101
>                         010101010101e83580a070381f403020
>                         250044682100001a000000ff00303031
>                         30310a20202020202020000000fc0048
>                         444d490a2020202020202020000000fd
>                         00384c1e5317000a20202020202001cf
>                         02031a71471003140513841223090707
>                         8301000065030c0010008c0ad0902040
>                         31200c40550036d431000018011d8018
>                         711c1620582c250036d43100009e011d
>                         80d0721c1620102c258036d43100009e
>                         011d00bc52d01e20b828554036d43100
>                         001ef339801871382d40582c4500c48e
>                         2100001e000000000000000000000054
>         2 DPMS:
>                 flags: enum
>                 enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
>                 value: 0
>         5 link-status:
>                 flags: enum
>                 enums: Good=3D0 Bad=3D1
>                 value: 0
>         6 non-desktop:
>                 flags: immutable range
>                 values: 0 1
>                 value: 0
>         4 TILE:
>                 flags: immutable blob
>                 blobs:
>=20
>                 value:
>         20 CRTC_ID:
>                 flags: object
>                 value: 42
>=20
> CRTCs:
> id      fb      pos     size
> 42      52      (0,0)   (1920x1080)
>   #0 1920x1080 59.72 1920 1968 2000 2080 1080 1082 1087 1111 138000 flags=
:
> phsync, nvsync; type: preferred, driver
>   props:
>         22 ACTIVE:
>                 flags: range
>                 values: 0 1
>                 value: 1
>         23 MODE_ID:
>                 flags: blob
>                 blobs:
>=20
>                 value:
>                         101b02008007b007d007200800003804
>                         3a043f04570400003c00000009000000
>                         48000000313932307831303830000000
>                         00000000000000000000000000000000
>                         00000000
>         19 OUT_FENCE_PTR:
>                 flags: range
>                 values: 0 18446744073709551615
>                 value: 0
>         24 VRR_ENABLED:
>                 flags: range
>                 values: 0 1
>                 value: 0
>=20
> Planes:
> id      crtc    fb      CRTC x,y        x,y     gamma size      possible
> crtcs
> 32      42      52      0,0             0,0     0               0x0000000=
1
>   formats: RGB8 AR12 XR12 AR15 XR15 RG16 BG24 RG24 BA24 BX24 AR24 XR24 UY=
VY
> YUYV YVYU NV12 NV21 NV16 NV61 YU12 YV12 YU16 YV16 YU24 YV24
>   props:
>         8 type:
>                 flags: immutable enum
>                 enums: Overlay=3D0 Primary=3D1 Cursor=3D2
>                 value: 1
>         17 FB_ID:
>                 flags: object
>                 value: 52
>         18 IN_FENCE_FD:
>                 flags: signed range
>                 values: -1 2147483647
>                 value: -1
>         20 CRTC_ID:
>                 flags: object
>                 value: 42
>         13 CRTC_X:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         14 CRTC_Y:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         15 CRTC_W:
>                 flags: range
>                 values: 0 2147483647
>                 value: 1920
>         16 CRTC_H:
>                 flags: range
>                 values: 0 2147483647
>                 value: 1080
>         9 SRC_X:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         10 SRC_Y:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         11 SRC_W:
>                 flags: range
>                 values: 0 4294967295
>                 value: 125829120
>         12 SRC_H:
>                 flags: range
>                 values: 0 4294967295
>                 value: 70778880
>         30 IN_FORMATS:
>                 flags: immutable blob
>                 blobs:
>=20
>                 value:
>                         01000000000000001900000018000000
>                         01000000800000005247423841523132
>                         58523132415231355852313552473136
>                         42473234524732344241323442583234
>                         41523234585232345559565959555956
>                         595659554e5631324e5632314e563136
>                         4e563631595531325956313259553136
>                         59563136595532345956323400000000
>                         ffffff01000000000000000000000000
>                         0000000000000000
>                 in_formats blob decoded:
>                          RGB8:  LINEAR
>                          AR12:  LINEAR
>                          XR12:  LINEAR
>                          AR15:  LINEAR
>                          XR15:  LINEAR
>                          RG16:  LINEAR
>                          BG24:  LINEAR
>                          RG24:  LINEAR
>                          BA24:  LINEAR
>                          BX24:  LINEAR
>                          AR24:  LINEAR
>                          XR24:  LINEAR
>                          UYVY:  LINEAR
>                          YUYV:  LINEAR
>                          YVYU:  LINEAR
>                          NV12:  LINEAR
>                          NV21:  LINEAR
>                          NV16:  LINEAR
>                          NV61:  LINEAR
>                          YU12:  LINEAR
>                          YV12:  LINEAR
>                          YU16:  LINEAR
>                          YV16:  LINEAR
>                          YU24:  LINEAR
>                          YV24:  LINEAR
>         34 alpha:
>                 flags: range
>                 values: 0 65535
>                 value: 65535
>         35 zpos:
>                 flags: range
>                 values: 0 1
>                 value: 0
>         36 pixel blend mode:
>                 flags: enum
>                 enums: None=3D2 Pre-multiplied=3D0 Coverage=3D1
>                 value: 0
> 37      0       0       0,0             0,0     0               0x0000000=
1
>   formats: RGB8 AR12 XR12 AR15 XR15 RG16 BG24 RG24 BA24 BX24 AR24 XR24 UY=
VY
> YUYV YVYU NV12 NV21 NV16 NV61 YU12 YV12 YU16 YV16 YU24 YV24
>   props:
>         8 type:
>                 flags: immutable enum
>                 enums: Overlay=3D0 Primary=3D1 Cursor=3D2
>                 value: 0
>         17 FB_ID:
>                 flags: object
>                 value: 0
>         18 IN_FENCE_FD:
>                 flags: signed range
>                 values: -1 2147483647
>                 value: -1
>         20 CRTC_ID:
>                 flags: object
>                 value: 0
>         13 CRTC_X:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         14 CRTC_Y:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         15 CRTC_W:
>                 flags: range
>                 values: 0 2147483647
>                 value: 0
>         16 CRTC_H:
>                 flags: range
>                 values: 0 2147483647
>                 value: 0
>         9 SRC_X:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         10 SRC_Y:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         11 SRC_W:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         12 SRC_H:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         30 IN_FORMATS:
>                 flags: immutable blob
>                 blobs:
>=20
>                 value:
>                         01000000000000001900000018000000
>                         01000000800000005247423841523132
>                         58523132415231355852313552473136
>                         42473234524732344241323442583234
>                         41523234585232345559565959555956
>                         595659554e5631324e5632314e563136
>                         4e563631595531325956313259553136
>                         59563136595532345956323400000000
>                         ffffff01000000000000000000000000
>                         0000000000000000
>                 in_formats blob decoded:
>                          RGB8:  LINEAR
>                          AR12:  LINEAR
>                          XR12:  LINEAR
>                          AR15:  LINEAR
>                          XR15:  LINEAR
>                          RG16:  LINEAR
>                          BG24:  LINEAR
>                          RG24:  LINEAR
>                          BA24:  LINEAR
>                          BX24:  LINEAR
>                          AR24:  LINEAR
>                          XR24:  LINEAR
>                          UYVY:  LINEAR
>                          YUYV:  LINEAR
>                          YVYU:  LINEAR
>                          NV12:  LINEAR
>                          NV21:  LINEAR
>                          NV16:  LINEAR
>                          NV61:  LINEAR
>                          YU12:  LINEAR
>                          YV12:  LINEAR
>                          YU16:  LINEAR
>                          YV16:  LINEAR
>                          YU24:  LINEAR
>                          YV24:  LINEAR
>         39 alpha:
>                 flags: range
>                 values: 0 65535
>                 value: 65535
>         40 zpos:
>                 flags: range
>                 values: 0 1
>                 value: 1
>         41 pixel blend mode:
>                 flags: enum
>                 enums: None=3D2 Pre-multiplied=3D0 Coverage=3D1
>                 value: 0
>=20
> Frame buffers:
> id      size    pitch
>=20
> root@smarc-rzg2l:~#
>=20
> Biju Das (19):
>   drm: rcar-du: Add encoder lib support
>   drm: rcar-du: Add kms lib support
>   drm: rcar-du: Add vsp lib support
>   drm: rcar-du: Move rcar_du_vsp_atomic_begin()
>   drm: rcar-du: Move rcar_du_vsp_atomic_flush()
>   drm: rcar-du: Move vsp rcar_du_vsp_{map,unmap}_fb()
>   drm: rcar-du: Move rcar_du_dumb_create()
>   drm: rcar-du: Move rcar_du_gem_prime_import_sg_table()
>   drm: rcar-du: Add rcar_du_lib_vsp_init()
>   drm: rcar-du: Move rcar_du_vsp_plane_prepare_fb()
>   drm: rcar-du: Move rcar_du_vsp_plane_cleanup_fb()
>   drm: rcar-du: Move rcar_du_vsp_plane_atomic_update()
>   drm: rcar-du: Add rcar_du_lib_fb_create()
>   drm: rcar-du: Add rcar_du_lib_mode_cfg_helper_get()
>   drm: rcar-du: Move rcar_du_encoders_init()
>   drm: rcar-du: Move rcar_du_properties_init()
>   drm: rcar-du: Add rcar_du_lib_vsps_init()
>   dt-bindings: display: Document Renesas RZ/G2L DU bindings
>   drm: rcar-du: Add RZ/G2L DU Support
>=20
>  .../bindings/display/renesas,rzg2l-du.yaml    | 124 +++
>  drivers/gpu/drm/rcar-du/Kconfig               |  25 +-
>  drivers/gpu/drm/rcar-du/Makefile              |  17 +
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  10 +
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 117 +--
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  14 +-
>  drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c | 138 ++++
> drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h |  30 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 664 +---------------
>  drivers/gpu/drm/rcar-du/rcar_du_kms.h         |  29 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c     | 715 +++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h     |  62 ++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 361 +--------
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h         |  26 +-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c     | 390 ++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h     |  76 ++
>  drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c       | 716 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h       |  26 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_drv.c        | 196 +++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_drv.h        |  20 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c    |  26 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h    |  19 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_kms.c        | 157 ++++
>  drivers/gpu/drm/rcar-du/rzg2l_du_kms.h        |  17 +
>  drivers/gpu/drm/rcar-du/rzg2l_du_regs.h       |  67 ++
>  drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c        |  82 ++
>  drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h        |  30 +
>  27 files changed, 2958 insertions(+), 1196 deletions(-)  create mode 100=
644
> Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
>=20
> --
> 2.25.1

