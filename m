Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DA710E5B
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 16:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EF410E16D;
	Thu, 25 May 2023 14:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3984610E16F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 14:30:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEfpkOPIOQOy9Etk/AeCjUyMYd5XJz2FbIMluFU1nAdEUkD9k2XI+LDpkZNAaEQ9bQH9Sh0Gj7fqTA2ty7qOBMff1eBUWGNnYXimtmECefvPF9agLJkHGUxzMFAzWywmSY1WxY3UDkdKiZnM6aH5eMtK1DFdN2CD++6C2bTdjp6BjKgWOc/fJkx9ot1j9FoQ55xQzQzYz1ZDKKkNgv9IRDzelwWibDCVpqC0DRAo3EJ3GUzsx91NUP7o700yW5L7x79EYvT24iGf1Hgdv0mlkySmPVyp0B4ncgeg+E0SFe1YLbvG6UVfudfkBSFP0HUlCByXHigawqPJTmxyQQfJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFgIf+VJoiO/4T2jo0d7y5UsIKpW2pajszveTAt44f4=;
 b=WHoTDSLGMPlOGEIXNVWPVUDPDrS11zu3UjlheQjxuHM+uNWzUDKuvZBFm/fas757qgKAmr5ge8kRWnh8aTMHHx5w6JxIS2DPABEzTWeaPVDdd+xWKmJFfKEWjvUlXkVJntNQtycXjQ6YdLEz/l6Jul4KfI1OsUiy8ptnU/09VJGYa8BDKtj2I6CzFsFw4F6AMRcSA8PsFdBQiDAB52cgUEnYk1rkRzQH8girZJnQrnoott88hx5tY5Vp1aVvtMc+kMQ38v5EGwre4DlrYc9PDj1Kqycb7b+Ov1nAydm3hLrbYZ+T22i1SK3qgaT9pdLktfmtLUj06BrEMWPlqxTVeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFgIf+VJoiO/4T2jo0d7y5UsIKpW2pajszveTAt44f4=;
 b=OXzaFS+GsN3O1+ce2U2T9FM5RvKspBPkQTzsX7+QexTXFZPjjfbFP9eS8GSUYDlBQO0Bh9gdBiRPLEcnNMl4jSrZ4mojo4emxpvsxXs8qeHNfGbmbd3J6a99nJOm7qeypp41kfuIgIGhKrwOU7eDc4rZ+wcWUU6Y501EkYYomSQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8439.jpnprd01.prod.outlook.com (2603:1096:400:159::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 14:30:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 14:30:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp
 Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
 support
Thread-Topic: [PATCH v9 RESEND 0/5] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit
 support
Thread-Index: AQHZfN4p/b5orSrwk0ai5QpLpQqzGK9bCteAgBAjuzA=
Date: Thu, 25 May 2023 14:30:10 +0000
Message-ID: <OS0PR01MB5922CC640A93CF85033FB47086469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB59220E8306506F3E0B17968A86789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59220E8306506F3E0B17968A86789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8439:EE_
x-ms-office365-filtering-correlation-id: 529884fe-1e14-43dc-ca83-08db5d2c8b65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1xhsD/PIWs2SanhsetkEfDrqi6w7GP5/A1ISd+iBvbbP0l9oUZyG6UvOkgQ8TBhOH87SbyHWO/BLBgR+mg522trCoP8TELd4S8MK2Vf3KAOyFpR530/1whBeHKBju5ikOOl029D3dxMLpXGQisRABdagi1xVAS/p1pilSRCK2tR5BjvAwmKYhZoDoU2MfMB+K3Y6FfKamBGQh4RZwewo1z6tPPXZJcn+0mO6ULjEQNau0cLKWpUZR8Qzy/3VnNdj3luTqOHouHDN2gm9scCQUqy8QW2RwY9D1gE4fjO/muoqgrN5vVsYFi4h1IeknJw4+qQdV26o6G+ZSuLLusckyBEKGbO9H1W6MG1wZn5Cqln1s7vkpNiWHuA/BZbIgTKsUi2Ds3Mz9miuHcx2qoVJ9kib1+9VGEnKa6ZxgxAGiHZoR5GyOpSuaQnbtmEKWYrsiiFQ9UFLvRv3cNqHvlNegG8H7lTuBWJol2WNXT92vVc6BNnc7TYKEkOvGEq6FG0+RDTUILx07IrULD+qfIFo1R0oWrq0sAOfI1HTwW6H5lMNcXfknJ5N7fA7R57qY4nOwJl3t3fF/yp09QZavhW+124SMR+KZ3zujvipdmjN+XHq5ZhNIi2TcF2ww7GfHLcN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199021)(83380400001)(30864003)(2906002)(186003)(33656002)(38070700005)(86362001)(38100700002)(122000001)(55016003)(41300700001)(8676002)(7696005)(5660300002)(54906003)(478600001)(52536014)(110136005)(64756008)(4326008)(66476007)(316002)(71200400001)(66446008)(66946007)(66556008)(76116006)(8936002)(6506007)(9686003)(53546011)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?atfQVzmVgBsu2Hl761Y+7CCuBtgLhQb0PZ5DQz/9rUHHijqTknUmTm1imU/3?=
 =?us-ascii?Q?toiRzTWP9gWdkGmIXo4osYfG/cCueSizz6KuV5cyjLnq/NwpXrig6RTyE8qo?=
 =?us-ascii?Q?DSPIj1boXKoJkLKg8QoWJgkVB+O2Vt3jFDwi0Ez+/bv0NQFG9WVKxOJSOSfz?=
 =?us-ascii?Q?d0tD0OJJVvXwE0d5y5gWquqzlAniq0jGi2Eq2RcubdMxYHwOiFo3B1ZftaBl?=
 =?us-ascii?Q?gxGzsFlHUyu8u7oGDka54BSlqVYkpmUCyFZXQ1258tybhP40pDQMkJc0SYIW?=
 =?us-ascii?Q?6kJ43yLDWZW1yFbuYumTLdVD/kiLOv0X+Lu7Qm6+v64Sav+FOcEWqNwqXgp5?=
 =?us-ascii?Q?D3UolzilHIinHhwKSU4Oj+mN+4ozBdKFPVpjWJURRsOvRDKXYxnfA7tuITMK?=
 =?us-ascii?Q?A7C10sjrWADZ3R2gfM/rBqR98lX8rSPtnSwaQpRq1xpmR3AfvNqZUUKJvRnX?=
 =?us-ascii?Q?6P92PUArY3/wMhto0KN1ig1BldiyLs5RkOUcWQeOtuMeBSdX+zC4lXvXNiU7?=
 =?us-ascii?Q?FRN6e8sJMle/62hKsbqrp85fVnKvcnvec9nkh/hWhVYVOB8czi4tUZANnPgm?=
 =?us-ascii?Q?mE6BkN7eheBEgZolYstpxbwYzIkcmNBfS3K4vg08N+C2l2GlnBwwFK0pdTf9?=
 =?us-ascii?Q?oyDqbrdrx838UWmMCevfSuVv3VxYjtMkNPWE0cfgV1ZFm0f5jFG2lz8TmK+s?=
 =?us-ascii?Q?zlzoSwlx4tyg3qUV3fML+f9dP2VQXyB3FbOyyFRVLG5RSy9ch6Y8ncTY5y1C?=
 =?us-ascii?Q?377Cbty6XKFrMmexq9g3an4f10wqU1x9gYByzLUByXTGPJbcq0KcqE/n+Dec?=
 =?us-ascii?Q?BJ/1C+7g3PgpdZ2EDtr0aLOBeDl0Cf+FC6i0+kEj4E2JslPlv6scoV/a1zgp?=
 =?us-ascii?Q?zWo5PaFCFtpXwSFrAyM2lsmfJ/HxjLS4WwG86Hf+johmo582rDCCPMUjBshe?=
 =?us-ascii?Q?xSGplg51Imqz4zIyAtMTenEhAOItwgj2g4J0zfLZ6N0wXAEy5wnFZA/e0maA?=
 =?us-ascii?Q?G16+AI8oaZNK3qR1iNR39IJho5w/ZjyUV8VghOiwL6x7rtFjdgU02xqtNgc9?=
 =?us-ascii?Q?3WXLwKoEL1vMwIGUZdmei5Gh26kbUICVHyfhGLEdxUZ/epey8Tj9gGJqe+AO?=
 =?us-ascii?Q?HK44cZVZ/qD4Jqua5lu71nESs0CNLxxyGdN30c6Jts9M/5ZXIwQ4LWy/kL6T?=
 =?us-ascii?Q?nmxqImYNnSvfjlOjUeUhJvoAJ92bAlDoR87DSBW/enNXyMnV1XuEwOP5Jvhu?=
 =?us-ascii?Q?5yxUlaVSHuQUmcbdGBm/EUgMF74xXr4emK8TMwJUfefdAI7vT6ZOVtNgMB42?=
 =?us-ascii?Q?Jfoo9mHcdjyfOCxcU9UayNr5dTMpRc5ziajzPWrvQjCjY/mSBKUi9HEcSqc1?=
 =?us-ascii?Q?1ziKOL8utdQrRQzGY7J6mS89URGknuteZ8rIXNk/DwRtiYLTRPNxKjSLx6gV?=
 =?us-ascii?Q?phe8jOyXpAJEcBtYzRteXYnNhudXf8Hl+tuUtLygCiXFEjbPifo92PJe4tz1?=
 =?us-ascii?Q?z3lDDykBRIK4iYszWhBfwTdDfAiRkMW7JBlUbSaw6J4OTHbp7eIKzebc45lj?=
 =?us-ascii?Q?QWbV8cjtX4AkDNhkilfQ10oHlf1uHJBDzWdA+rk2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529884fe-1e14-43dc-ca83-08db5d2c8b65
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 14:30:10.1568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKyvXaNtQv6cXoTzzlvDS3cB64HjfA1Hlx0XZPFbgp3+r9UVOpskvmyHopLGA2Gdq/94UOzQ9eA58rT3/2ZrDGAftuSpqQFHbnIjQGOLUfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8439
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi DRM maintainers,

Gentle ping.

Are we happy with moving all Renesas drm drivers to Renesas specific
directory or preference is for separate one??

If it is later, I can send RZ/G2L drm driver separate.

Otherwise, I need to rebase and resend.

Please let me know your preference.

Cheers,
Biju


> -----Original Message-----
> From: Biju Das
> Sent: Monday, May 15, 2023 8:58 AM
> To: David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>;
> Philipp Zabel <p.zabel@pengutronix.de>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: RE: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display
> Unit support
>=20
> Hi All,
>=20
> Gentle ping. Are we happy with this patch series?
>=20
> Cheers,
> Biju
>=20
> > Subject: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display
> > Unit support
> >
> > RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
> > Video signal processor (VSPD) and Display unit(DU). The output of LCDC
> > is connected to Display parallel interface and MIPI link video
> > interface.
> >
> > The output from DSI is connected to ADV7535.
> >
> > Created a vendor specific directory renesas and moved all renesas drm
> > drivers to it (rcar-du and shmobile). Then added support for RZ/G2L DU
> > DRM driver by creating rz_du directory.
> >
> > Ref:
> >
> >
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
> > SoCs.
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
> > renesas,du-r9a07g044->renesas,r9a07g044-
> > du
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
> >  * Based on [1], all references to 'rzg2l_lcdc' replaced with
> 'rzg2l_du'
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
> >
> > Biju Das (5):
> >   drm: Place Renesas drivers in a separate dir
> >   dt-bindings: display: Document Renesas RZ/G2L DU bindings
> >   dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
> >   drm: Add RZ/G2L DU Support
> >   MAINTAINERS: Add maintainer for RZ DU drivers
> >
> >  .../bindings/display/renesas,rzg2l-du.yaml    | 129 +++
> >  MAINTAINERS                                   |  16 +-
> >  drivers/gpu/drm/Kconfig                       |   4 +-
> >  drivers/gpu/drm/Makefile                      |   3 +-
> >  drivers/gpu/drm/renesas/Kconfig               |   5 +
> >  drivers/gpu/drm/renesas/Makefile              |   5 +
> >  drivers/gpu/drm/{ =3D> renesas}/rcar-du/Kconfig |   0
> >  .../gpu/drm/{ =3D> renesas}/rcar-du/Makefile    |   0
> >  .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_cmm.c  |   0
> >  .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_cmm.h  |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_crtc.c  |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_crtc.h  |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_drv.c   |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_drv.h   |   0
> >  .../{ =3D> renesas}/rcar-du/rcar_du_encoder.c   |   0
> >  .../{ =3D> renesas}/rcar-du/rcar_du_encoder.h   |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_group.c |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_group.h |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_kms.c   |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_kms.h   |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_plane.c |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_plane.h |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_regs.h  |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_vsp.c   |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_du_vsp.h   |   0
> >  .../{ =3D> renesas}/rcar-du/rcar_du_writeback.c |   0
> >  .../{ =3D> renesas}/rcar-du/rcar_du_writeback.h |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_dw_hdmi.c  |   0
> >  .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.c |   0
> >  .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.h |   0
> >  .../{ =3D> renesas}/rcar-du/rcar_lvds_regs.h    |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.c |   0
> >  .../drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.h |   0
> >  .../rcar-du/rcar_mipi_dsi_regs.h              |   0
> >  .../{ =3D> renesas}/rcar-du/rzg2l_mipi_dsi.c    |   0
> >  .../rcar-du/rzg2l_mipi_dsi_regs.h             |   0
> >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  20 +
> >  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 714 ++++++++++++++++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  99 +++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 188 +++++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  89 ++
> > .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 112 +++
> > .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  28 +
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 770 ++++++++++++++++++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 430 ++++++++++
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  94 +++
> >  .../gpu/drm/{ =3D> renesas}/shmobile/Kconfig    |   0
> >  .../gpu/drm/{ =3D> renesas}/shmobile/Makefile   |   0
> >  .../shmobile/shmob_drm_backlight.c            |   0
> >  .../shmobile/shmob_drm_backlight.h            |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_crtc.c   |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_crtc.h   |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_drv.c    |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_drv.h    |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_kms.c    |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_kms.h    |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_plane.c  |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_plane.h  |   0
> >  .../{ =3D> renesas}/shmobile/shmob_drm_regs.h   |   0
> >  62 files changed, 2816 insertions(+), 8 deletions(-)  create mode
> > 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> >  create mode 100644 drivers/gpu/drm/renesas/Kconfig  create mode
> > 100644 drivers/gpu/drm/renesas/Makefile  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/Kconfig (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/Makefile (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_cmm.c (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_cmm.h (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_crtc.c (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_crtc.h (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_drv.c (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_drv.h (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_encoder.c (100%)  rename drivers/gpu/drm/{ =3D=
>
> > renesas}/rcar-du/rcar_du_encoder.h (100%)  rename drivers/gpu/drm/{ =3D=
>
> > renesas}/rcar-du/rcar_du_group.c (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_group.h (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_kms.c (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_kms.h (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_plane.c (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_plane.h (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_regs.h (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_vsp.c (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_vsp.h (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/rcar-du/rcar_du_writeback.c (100%)  rename drivers/gpu/drm/{
> > =3D> renesas}/rcar-du/rcar_du_writeback.h (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_dw_hdmi.c (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.c (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.h (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds_regs.h (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.c (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.h (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi_regs.h (100%)
> > rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rzg2l_mipi_dsi.c (100%)
> > rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rzg2l_mipi_dsi_regs.h
> > (100%)  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
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
> >  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/Kconfig (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/shmobile/Makefile (100%)  rename
> > drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_backlight.c (100%)
> > rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_backlight.h
> > (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_crtc.=
c
> > (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_crtc.=
h
> > (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_drv.c
> > (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_drv.h
> > (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_kms.c
> > (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_kms.h
> > (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/shmobile/shmob_drm_plane.c
> > (100%)  rename drivers/gpu/drm/{ =3D>
> > renesas}/shmobile/shmob_drm_plane.h
> > (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_regs.=
h
> > (100%)
> >
> > --
> > 2.25.1

