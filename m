Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06AB7846DC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F85210E3A2;
	Tue, 22 Aug 2023 16:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F23510E3A2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:17:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2ytI8WcVp6riEEU2DkeOTtu7o99nnSNyHQy6KNeahNDf81NKrQZMd58nhc/nYAepG/JnntAJFUsEsS1JlQA4Fy59uDeEGJMbgIWAFrV3ekiCw5TGGBlWQiuKGALZAwvAq5NzQGjqQFpWr2sRjIF9bTwevbobMeTMjFutNR83tEulzPk/KxwvcK5rRmoyyF0Vk4Io9g6YrZc1ePhpuoPoSHJkG/0K3NBEg1rNnZflWjhC/bWQC/CjJQkp+BfABwh8oIwfvLDDb34WA8STyeJvRQq5s675m1/kgU+UXwPkCs+DcII1tNf5HzvHt9egOFSuLyGW0tcRzr7e//l+XhmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s5QjcYAuMllfyaHdoY7cYBjkTS26RM5dGWMhw4azVs=;
 b=eHsbuNfT6oDeTE+FoxlRESP1mx+QCZkWFoucsWI59lIHB5E9NWBzcrfXSSifThXfXCXbGIrOlHpX2MahKxW/ZkWuoU1dYWwjcX1dyNjxo1GQmolAo+fiK7WFZrX4rkSgbqktzkUI6k0guMuJiyBNJ1j2PiaBqhbXXcG9TZmY4QuTApWY2krlm85I15BA1gNsC7iL4v5yyVtYS2f9S/g0T73CWPtLyKkABBr1B2I27sTtGqFWg1+qy8fltPFsWiyHCZ9HmGK04TcVaR3vZNrnt9gGd+snCF9VftdQ8fXDkqAS8Lk9S+2Mez83ThrpXF0kwk+pSH22wHaMxMvVjwtZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s5QjcYAuMllfyaHdoY7cYBjkTS26RM5dGWMhw4azVs=;
 b=kLyNaim3QTnp2ECiz7FmxlQLAmvSh6+cGxFrfUvJE4qIHk3OtWeGAYabdwnzyRr/d3Q27iwVlgTSZh3OcyaRYYnaeM2cYlTNlEJBX5A7nBM36nxyCZHB4bGKyXdE0r8IvLhbe1oxEyjYw7Ngad6zDRPOspxePl++fANfg/SAKZU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8872.jpnprd01.prod.outlook.com (2603:1096:400:16f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 16:17:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 16:17:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp
 Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v10 0/4] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit support
Thread-Topic: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Thread-Index: AQHZrlaa38MndGA920+57Yp0DiWkBq/e7VYwgBfdjsA=
Date: Tue, 22 Aug 2023 16:17:53 +0000
Message-ID: <OS0PR01MB59229075D5C1E201C210FF53861FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230704090447.27420-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922C1FDA4200E067957EBC0860CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922C1FDA4200E067957EBC0860CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8872:EE_
x-ms-office365-filtering-correlation-id: 951d8b3b-9b08-401f-08b9-08dba32b565f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C2IhFjwA3txoEecXJXuFoLUs/3IQ+c7/dTEe8I1Zs+AE3+vh1/mvhhPiEblCys1oVaJgLEKGBC3Pka1frPjRzDKfGevYdZN7cx3XcbqLKlx4CejWr3s3/hG4NJLahNzJx4HalZLEaKMM/2sRXiN6qEaRr4oab7sJfHj/T2+k0Z9HOecnKJWwBNSa1baqdwWp7+zqqRHhYC7dcK2XoQnm9L/WSYTa4d+NZIsWk6paOGjmAZqaR57lqLQsi20AKq4XardHaERizZDYjrOq9Keh+oTVDa2hlJXu8v/JZG/WBTRs0iDFMV6UzkeMoxXwmBB9kugmd8Tmsrd1yDTPtodxwkmPh6Bv+biNH1ILOcRYcR663aZi6a1ymE1lLJM8qhlbMaGlDJVvXVCoFBJ5ghEu1Yp70uCoMZttAmNdgGWBoOQAmaihAzIqsAJuhVbw2i7QOKgwh9dC4YvVGhEmPe2efzltjPNSF2RJ/A4fFwAlSyf3X5xTl/Ckch+9eiwM+CWqTUYn382P4HFcGS2pAJrVW6mKB2MRdVMrS6sljiExGDE2gSBi4sGpRx0PsoX9iCEJxFqo/9Io8h5YRTq6T8Sj1VagtCDltH5mf8ZmdsFnf9k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199024)(186009)(1800799009)(66946007)(122000001)(316002)(26005)(107886003)(45080400002)(9686003)(7696005)(71200400001)(6506007)(5660300002)(83380400001)(8676002)(8936002)(52536014)(2906002)(4326008)(110136005)(76116006)(478600001)(66446008)(66556008)(66476007)(966005)(64756008)(54906003)(38070700005)(38100700002)(41300700001)(55016003)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mbe3ec8GPmf89A4xGNvSAbKh6HBaH0g9BmJ776/SYzRce/6jeiuDFcV6EIhX?=
 =?us-ascii?Q?U6JyL5FQ6aPmkZXZLoPHySL1ekUE0OyKWD7NlfEyo30fYokCg3CIwYfIBLU9?=
 =?us-ascii?Q?gEUX6CJKbCJHnHaI7TH/6Uf52INYCAOfiQ9leFZfARKdxFsfZJntlpNcgpnt?=
 =?us-ascii?Q?fPrURbskWFTusyOWAc3hlqEOMw7BmHy+Hw68mxVdb63QgTpF8pl5I//bmfJw?=
 =?us-ascii?Q?FwdIjNyk/HEj35OvJh1xZTU64mDMGnIXy5esOBNghSW87nuXR/VKXNr/4wBG?=
 =?us-ascii?Q?/z5ZUPBYlqqbmdqYDdtFMIspiIS+Tevfd+83lWZXcwY7Cryi8xg7hc5KXXjG?=
 =?us-ascii?Q?2IbHkygmxNcA6HypqOH2DqgXurLK37k7zjcjztSMkTckWjZE7Y3p1aGM5992?=
 =?us-ascii?Q?rZvLhvGyaOslOVps5/7B7oRYrCrgS3QP2u48rLoPDMGxaJKug3/PYilFyQvr?=
 =?us-ascii?Q?PSGRxE0exbStg2QDQF4GnxOr+ETVtrjelFabzm6KkHhEXE3V7t/R2WaWXxxV?=
 =?us-ascii?Q?XCX9nkzF5Vv6i/XRv4tTA0P05lWr2KEahPrIg9qNfcbDeLcy30whV62fg2hZ?=
 =?us-ascii?Q?3MrDSdj03BnY0U2fJM1G9glqby2s1jCosJnTItREy3zBRlnwBBfRN0bV2wta?=
 =?us-ascii?Q?5oEV8lyGkuKjEFQXZEXND98t88sdg2jElHZ6Kkr1gLuI1XIjo6DXB9y2gXqK?=
 =?us-ascii?Q?wYskxHL2Qb2AFe6jxrOwqIg3Ub9YAO/eUn0JRwKjzrxldW+DVL4ldJrRHaNy?=
 =?us-ascii?Q?1R8qSF+OinKj1tIoe8IPTBCv68jN+gzihO5vaAFS7Oy0zuYM2bF1LzCkbXiV?=
 =?us-ascii?Q?jFQ6LKnAFs4TdQ8JvTZaOnYl049a2oqIiPXwrORg1vZD4gEdkQQyh4yD9V7L?=
 =?us-ascii?Q?OQk/rvh04KpggY1vKOjQmA6XHaEm6ZwPOuR60qofjv02s+mOhIwmKtOdo7xZ?=
 =?us-ascii?Q?q1QEJ23B4XHhopR1atbe9/SPvnGfAw2odBMAOJWCw3D8kkOBgMvDHJzgfyqT?=
 =?us-ascii?Q?JEmydzPAatHyjmhEcNw6tyfy/Dylly5579/V8LBsmPjP5HchWMo9JB0x8ttq?=
 =?us-ascii?Q?99msEBuNAC28zhlgx7evWUHtPi2s9D6OEnxuOpx0T3aUvkLw/e83qEgqbRJA?=
 =?us-ascii?Q?TUYD10gFlIHXSKKfhVsw32DzLrupQym1u34a8B17/BO3oIx7MoRfuwH+oelZ?=
 =?us-ascii?Q?nj0MIkE3myVUU/mjgnvzkiw5TTxnHylA0ezsfXjpgEpcZKYaeHNq8JGx2paG?=
 =?us-ascii?Q?5Cj1LzvmonWfhMFwMBPikecZK5rryKw0rNz2RAJVAY4cSNXwEFEJgII41kZC?=
 =?us-ascii?Q?+pSVT76LWoeH6XYKz3V2QmQ9ywZVkbQnOEV7q2gnwtKmwwHSID7gbIPaU+dO?=
 =?us-ascii?Q?/Xon9cQ8zKrPoquo/1mETjjSZo1PoVgyAziN6YE6lVhAmbOziW7DBCA6LP2G?=
 =?us-ascii?Q?yfNTw5m6BMh7h3Zu6qO1MiL54KvdyYnXhtZxiBxhTlf5/wsqUjOeSY1XRW2E?=
 =?us-ascii?Q?lJgHxlh8QcV51Wj8PtDaW7oUfyfDcx5Dav5lrJYzmKMww3xKYzbbVxKww0I6?=
 =?us-ascii?Q?JS5Q4DNRJmkqeWejYfRjE14474TomiMhfAQ9s/1Ajd3+88NzqXfqq3T6a0AZ?=
 =?us-ascii?Q?kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951d8b3b-9b08-401f-08b9-08dba32b565f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 16:17:53.1013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P374v2AvFvho/tJxxpANjwe+EaJCHWDnoZIHKe1IGpEggb/Fc2PwxSRX4kdxBlM7dsxkdK6K8soBjZQV5DfGkLeZZcQj6Qp1aC5S8fDx3XA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8872
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent and all,

Gentle ping. Are we happy with this patch series?

I will send follow up fixes if we find any issues later.

Cheers,
Biju

> Subject: RE: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
> support
>=20
> Hi Laurent and all,
>=20
> Gentle ping. Are we ok this patch series?
>=20
> Cheers,
> Biju
>=20
> > Subject: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
> > support
> >
> > This path series aims to add support for RZ/G2L DU DRM driver.
> >
> > RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
> > Video signal processor (VSPD) and Display unit(DU). The output of LCDC
> > is connected to Display parallel interface and MIPI link video interfac=
e.
> >
> > The output from DSI is connected to ADV7535.
> >
> > Ref:
> >
> >
> >
> > This patch series is tested with [2]
> > [2]
> >
> > v9->v10:
> >  * patch#1 is mainlined, so dropped from this series.
> >  * Added Rb tag from Laurent for the binding patch.
> >  * Updated the commit description.
> >  * Updated description of the port by dropping the text "specified in
> >    Documentation/devicetree/bindings/graph.txt."
> >  * Dropped empty endpoint from example.
> >  * Dropped ARM64 dependency from Kconfig.
> >  * Sorted the configs alphabetically in Kconfig.
> >  * Dropped DRM_RCAR_VSP config option and make DRM_RZG2L_DU depend on
> >    VIDEO_RENESAS_VSP1.
> >  * On rzg2l_du_crtc_set_display_timing() replaced the setting of parent
> >    clk rate with dclk rate.
> >  * Added rzg2l_du_write() wrapper function.
> >  * Updated the comment atomic_begin->atomic_flush.
> >  * Dropped .atomic_check and .atomic_begin callback
> >  * Renamed __rzg2l_du_crtc_plane_atomic_check-
> >__rzg2l_du_vsp_plane_atomic
> >    _check and moved it to rzg2l_du_vsp.c
> >  * Added struct clk in rzg2l_du_crtc.h
> >  * Dropped the variables mmio_offset,index,vblank_lock,vblank_wait,
> >    vblank_count from struct rzg2l_du_crtc.
> >  * Replaced the macro to_rzg2l_crtc with static inline functions.
> >  * Dropped the unneeded header files clk.h, io.h, mm.h, pm.h, slab.h,
> >    wait.h and drm_managed.h from rzg2l_du_drv.c.
> >  * Replaced DRM_INFO->drm_info
> >  * Dropped the callbacks prime_handle_to_fd, prime_fd_to_handle and
> >    gem_prime_mmap.
> >  * Replaced the callback remove->remove_new.
> >  * Dropped header file wait.h and added forward declarations struct
> > clk and
> >    rzg2l_du_device from rzg2l_du_drv.h.
> >  * Dropped the dsi and dpad0_source variables from struct
> rzg2l_du_device.
> >  * Replaced the macro to_rzg2l_encoder with static inline functions.
> >  * Dropped header files dma-buf.h and wait.h from rzg2l_du_kms.c.
> >  * Dropped struct sg_table and added the scatterlist.h header file in
> >    rzg2l_du_vsp.h
> >  * Added container_of.h header file, forward declarations struct
> > device and
> >    struct rzg2l_du_device in rzg2l_du_vsp.h.
> > v8->v9:
> >  * Added Rb tag from Laurent and Acked-by tag from Kieran for patch#1.
> >  * Added Rb tag from Laurent and Geert for patch#3.
> >  * Dropped reset_control_assert() from error patch for
> > rzg2l_du_crtc_get() as
> >    suggested by Philipp Zabel.
> >  * Added Rb tag from Laurent oatch#5.
> >  * Updated MAINTAINERS entries for common parts(Makefile and Kconfig).
> > v7->v8:
> >  * Moved rcar-du and shmobile DRM drivers to renesas specific vendor
> > directory.
> >  * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
> >  * Added Rb tag from Rob for RZ/V2L DU bindings patch.
> >  * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating
> > rz_du folder.
> >  * Updated MAINTAINERS entries.
> > v6->v7:
> >  * Split DU lib and  RZ/G2L du driver as separate patch series as
> >    DU support added to more platforms based on RZ/G2L alike SoCs.
> >  * Rebased to latest drm-tip.
> >  * Added patch #2 for binding support for RZ/V2L DU
> >  * Added patch #4 for driver support for RZ/V2L DU
> >  * Added patch #5 for SoC DTSI support for RZ/G2L DU
> >  * Added patch #6 for SoC DTSI support for RZ/V2L DU
> >  * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L}
> SoCs.
> >  * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
> > v5->v6:
> >  * Merged DU lib and RZ/G2L du driver in same patch series
> >  * Rebased to latest drm-misc.
> >  * Merged patch#1 to RZ/G2L Driver patch.
> >  * Updated KConfig dependency from ARCH_RENESAS->ARCH_RZG2L.
> >  * Optimized rzg2l_du_output_name() by removing unsupported outputs.
> >
> > v4->v5:
> >  * Added Rb tag from Rob for binding patch.
> >  * Started using RCar DU libs(kms, vsp and encoder)
> >  * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
> >    rcar_du_format_info and rcar_du_encoder.
> > v3->v4:
> >  * Changed compatible name from
> > renesas,du-r9a07g044->renesas,r9a07g044-du
> >  * started using same compatible for RZ/G2{L,LC}
> >  * Removed rzg2l_du_group.h and struct rzg2l_du_group
> >  * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
> >  * Removed rzg2l_du_group_restart
> >  * Updated rzg2l_du_crtc_set_display_timing
> >  * Removed mode_valid callback.
> >  * Updated rzg2l_du_crtc_create() parameters
> >  * Updated compatible
> >  * Removed RZG2L_DU_MAX_GROUPS
> > V2->v3:
> >  * Added new bindings for RZ/G2L DU
> >  * Removed indirection and created new DRM driver based on R-Car DU
> > v1->v2:
> >  * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du=
'
> >  * Updated commit description for bindings
> >  * Removed LCDC references from bindings
> >  * Changed clock name from du.0->aclk from bindings
> >  * Changed reset name from du.0->du from bindings
> >  * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
> >  * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
> >  * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
> >  * Added forward declaration for struct reset_control
> >
> > [1]
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> > hwor
> > k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220312084205.31
> > 462-
> > 2-
> > biju.das.jz%40bp.renesas.com%2F&data=3D05%7C01%7Cbiju.das.jz%40bp.renes=
a
> > s.co
> > m%7C8e48927180a7413aaa7308db7c6dbc04%7C53d82571da1947e49cb4625a166a4a2
> > a%7C
> > 0%7C0%7C638240582971112471%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA
> > iLCJ
> > QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXsp=
0
> > khWV
> > DyFkR%2F5Ww4%2B9NlE0RWC5w%2B2tSWcPp8cpbEo%3D&reserved=3D0
> >
> > Biju Das (4):
> >   dt-bindings: display: Document Renesas RZ/G2L DU bindings
> >   dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
> >   drm: renesas: Add RZ/G2L DU Support
> >   MAINTAINERS: Add maintainer for RZ DU drivers
> >
> >  .../bindings/display/renesas,rzg2l-du.yaml    | 126 +++
> >  MAINTAINERS                                   |  15 +-
> >  drivers/gpu/drm/renesas/Kconfig               |   1 +
> >  drivers/gpu/drm/renesas/Makefile              |   1 +
> >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  12 +
> >  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 599 ++++++++++++++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  92 +++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 180 +++++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  84
> > ++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 109
> > +++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  32 +
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 741 ++++++++++++++++++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 469 +++++++++++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  97 +++
> >  17 files changed, 2674 insertions(+), 2 deletions(-)  create mode
> > 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> >
> > --
> > 2.25.1

