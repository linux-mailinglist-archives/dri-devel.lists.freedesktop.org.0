Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41DD772306
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 13:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F3E10E066;
	Mon,  7 Aug 2023 11:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D808410E066
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 11:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBPA5quMMbUVqQp4zcV2ltCmctSQlHXmqOEBFqLM0yK230ZwmxClvCk9ADKbCuF/YrRg266ODlV1ajz1hFU7nvCyI6VhsjYX/xM4Lpm78nt2UPc/2g2m/c9YK66KCHsTsE4sSe5GH3DH53azWNx+rWZXOhMyHTzl759x0jhh9155Zuc1iGixgnoCm+NBRhrb2sPVt8MFzZyHmJiYXn8/k6dmzwjDhTWePUvBfp2gt8NihLdtYUkriZQTsJNRgs+5HzKfao5ybswREhvhu6C884+PWGMVgqS8wXvOFEAD5vYsOgxHXilvG0NPNCAKiBxeg4zCspvqddpwOekFZjCVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rISpdXnm0vQz5Wxk9z+z45UeI3IWnzb6P069ON309og=;
 b=lZaz19C39IaCQUmfRRNHvUekatSkzE/wGrAWw3rTI1K0zSIN4hPjpaO069v/c3JKtNj9r/b7n/p1Sz5iJh34+t9Ba0xlWcNcMtCXws9iYpi3hHsQbHDtQMYIMPZY8PkKtigATpNJhiRCFzhVwWWfPdTWy8c1xkrqGiy2hoCGp3BjmH12Kb5jw6ZYu/8YCBiA6Q12acIkT1AnVLzc01d9oafCxky9FB4N5ES2QwU/XzE2dWZSlCJIST0FYTgCu9xgYinhij/2p1B1N2PUVX0XcG3ZCs3wpmDtJOEzTsSZFoSSWhjhkz5NXvrhSdi58d3FveZd+ofnIfloztLZK4Gm8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rISpdXnm0vQz5Wxk9z+z45UeI3IWnzb6P069ON309og=;
 b=XjP5m6lurCSqgFuXFfhNy1S2zAOgqoIXkgmVjxzwbWfZy976HXi5Ui4NK0y4SK4w9JgmS8eJo8eNXWBdIIiqoyoCAgI1nIiPavvsAqC/uNw/5rCZvGrVfEGASGwe4gBUA7e+GjQBU4X5DYMumHJtUddi2HV7R0E043BJJZjk75o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5991.jpnprd01.prod.outlook.com (2603:1096:604:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 11:49:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 11:49:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp
 Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v10 0/4] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit support
Thread-Topic: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Thread-Index: AQHZrlaa38MndGA920+57Yp0DiWkBq/e7VYw
Date: Mon, 7 Aug 2023 11:49:27 +0000
Message-ID: <OS0PR01MB5922C1FDA4200E067957EBC0860CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230704090447.27420-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230704090447.27420-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5991:EE_
x-ms-office365-filtering-correlation-id: 6f1fe9a9-590e-4f4d-d981-08db973c5a47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8IUqQIzMK14g9XHmMdSmLhwkpDtXDsfX7NrRYp93RhZBBi+OfKokeRDgInocwTZ5TuyhKAlc59Uz+6on+gPMHb5MRa/on/O6JtV/v65Emuycf7be6L1s9sTvfxpwArLQxBLoePV/xe+ICdTBG4Tpsxc+hUbm1WtuR8LwVWMVq1bfsTLRjy+va6SfGj2vS5XiES5JijXPat8iHK8PZlJVzt2yNZaFHmzIM8ToKMkTZ89hQ5LoC3MxYEftO/dCouEfdPa2Lfjk/OoOOqHs1mp2/xiSnNSWwVJgxqxbGKCirTMNzip9n4oTUl0SKLBil0r0Qgcko7Wjo6K3tgoqzjLMU4kiBbJCPIunau86IzF9A23WQY+Z46fmwrfeG7vdKNxLDMo/M49qr45jEfknILbjk74E0dbMdrH8G2SfmwUcVUw8PupSbrUwkdJpj/M+gMs0RtyM1LyivA7Jpiq2bLNN2us51Pd3ESypXHoT0O4DlK/v4FPFCYWLyFIX0emrXX5oL6RBEfM1XPWEzNERgvlhb31OCfAtZleGZxdttam0/aeHBR19Dog/0gstSAsrYDi+OU1xxfH5xJ5ITWxfhB49+UQ0mg41LTz9x3F32jKLoi4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(1800799003)(186006)(9686003)(966005)(55016003)(6506007)(107886003)(54906003)(110136005)(38100700002)(5660300002)(38070700005)(52536014)(86362001)(4326008)(2906002)(66946007)(64756008)(66556008)(76116006)(66476007)(41300700001)(33656002)(66446008)(8936002)(8676002)(316002)(71200400001)(7696005)(122000001)(45080400002)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CnZAS0cX8RGW9OYB+xOIzFfQ5u5aJvcNk/ggsmEzarz3UDAhIvn6+e7TQzBM?=
 =?us-ascii?Q?tjGTN0RIxGbz19RfIt9FNt9PjHxpvuE2wCMMCsFKiDW5JFHjbLs0j/G+qtx+?=
 =?us-ascii?Q?j2of21Bc+nELylRux9BbWRNXxp8HHFyBmW7N/RHrShCiIlc5uLhrf6fYEkLR?=
 =?us-ascii?Q?DHRttTW57YxYdnLRM5SLrsCq/HpsxVACMeUUZJWczBIL9/SmariAnpolmPoS?=
 =?us-ascii?Q?I8q+wYJsFDEeyCjJhlV8bitp6qtgZCMUiiQqSFQDlmL51kR4sE9ogQAPLZAR?=
 =?us-ascii?Q?9zcSnXd1RfvtARpHuV2azjZPMMbESd9jRBmfzGTlloF7S/vaW4b8ZqmeogAh?=
 =?us-ascii?Q?HGdoK6bq821oPvXR1+MGWw5QKIIXSZSt2Qleb+6DXZ2m8GWTI8bQugtMEKYg?=
 =?us-ascii?Q?LiulBzwxnla5/MKNp/VobNnqHOHox0cfuQwho/pBLj/M51HtBtVBGWhBWri4?=
 =?us-ascii?Q?KDpusfDKYsLgoIfhXu8omfct6GuwWjUyFX/QapIrsiakIQTXvogg0QbJFRF7?=
 =?us-ascii?Q?wxAZhAoNJxDbZfk/VMMngofu1ZZSV66Bh7Ptn9T1Pee+eikkQ9YPfZpRVpcV?=
 =?us-ascii?Q?0BjVZXbzsQa89z9KvB4lb8gFhjHigaSTfd4Gfe5wYfGhG+5Q2a3CJAL/EmR/?=
 =?us-ascii?Q?TfqFqS0yKe6vx9fU/lmFC7rI34NU63TRt+GOcX7rJLYEFfDYn2k8fGIhFC+A?=
 =?us-ascii?Q?ITdMFpLRakiBPld0c7nCkv48vlB1eYanWcPn+/8w2Ps6jlbRGA+fLvQm4k/G?=
 =?us-ascii?Q?+1xEMknbkiiyd/g+PIo3D7sL8cBuHqwQCkZhIBigEJoDlTfSR0jVzfu3fpbq?=
 =?us-ascii?Q?7alxV7AtGNltj+z/MugISFxmWbDUODfb6aCuc02RZ+fopC6XX067u7gzu6TG?=
 =?us-ascii?Q?YpM/LZUGBVi7rtqc1ibfm8FFVUwecx3L7o+5TOgDsibYRvs6kz9f9Y5cEQTx?=
 =?us-ascii?Q?LMrBCDHFTX7fSWee9zb+lcn3V0vDOd3FscvJ/nnYrh6gTb/2AB+6ZqhnhRlA?=
 =?us-ascii?Q?m0x8mp+V+nmWNlDdHK6g4o215X8zc93fwXkwcawBdBbQ+o0xKOEVNxMxL1RM?=
 =?us-ascii?Q?AE5+RKDWOykSsGDF0KuWqrLmKT/1Ty9AVqtZcgcR+LNrYkBwsqDsXywDaxmY?=
 =?us-ascii?Q?h+FKyMHfK1X8z9mqNkCCRmQlWi5ymZ2dNkdrsVo2if6Kcv5nOUD+Nxw8fUU1?=
 =?us-ascii?Q?oTQMaovjpM8GJDUKceoGcmFxMXhfAhah/LZpSSQ0ee/GuwZNoEchvNFh/2m/?=
 =?us-ascii?Q?IU7/Avx6PD4LFiuX9sjvgCcfxNfXYIlplDhZHG7PZMqXRYQX+SQ0Ex/eiDv0?=
 =?us-ascii?Q?WLJGUghS0ozwGSWkUbnxtKQkDKjddlE8FAFAa2dR3kmc42TgMAS4GX6lDNsh?=
 =?us-ascii?Q?E5PHWM9OxR7myIz3CR0VZduC057Y6l8prEa1oezstrerH/AW/D1KCF908bXe?=
 =?us-ascii?Q?xr62y9pumkxtPc918HyIwL48YRxvRVP53pjgi7j939nsi+ToNIS+4WljmPCA?=
 =?us-ascii?Q?cHiAvKyIlBH1yFLrft1YCxfw2Mj47UCuci+b4n4bzoIAVlAr5UM/bG8R2LUc?=
 =?us-ascii?Q?Qbxim+fT/w0OlHLJ23k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1fe9a9-590e-4f4d-d981-08db973c5a47
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 11:49:27.1312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbKsXu2YTG37NR2xWMMC7f3bCasXHQ3eYAwtQ6/ZNJniNQuop6yX3Ey+NBCIuPUzvmebZrR4U2nIAyVDObGftNJIJcnfCQHGMuMUAnY/KOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5991
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

Gentle ping. Are we ok this patch series?

Cheers,
Biju

> Subject: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit suppor=
t
>=20
> This path series aims to add support for RZ/G2L DU DRM driver.
>=20
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
> Video signal processor (VSPD) and Display unit(DU). The output of LCDC is
> connected to Display parallel interface and MIPI link video interface.
>=20
> The output from DSI is connected to ADV7535.
>=20
> Ref:
>=20
>=20
>=20
> This patch series is tested with [2]
> [2]
>=20
> v9->v10:
>  * patch#1 is mainlined, so dropped from this series.
>  * Added Rb tag from Laurent for the binding patch.
>  * Updated the commit description.
>  * Updated description of the port by dropping the text "specified in
>    Documentation/devicetree/bindings/graph.txt."
>  * Dropped empty endpoint from example.
>  * Dropped ARM64 dependency from Kconfig.
>  * Sorted the configs alphabetically in Kconfig.
>  * Dropped DRM_RCAR_VSP config option and make DRM_RZG2L_DU depend on
>    VIDEO_RENESAS_VSP1.
>  * On rzg2l_du_crtc_set_display_timing() replaced the setting of parent
>    clk rate with dclk rate.
>  * Added rzg2l_du_write() wrapper function.
>  * Updated the comment atomic_begin->atomic_flush.
>  * Dropped .atomic_check and .atomic_begin callback
>  * Renamed __rzg2l_du_crtc_plane_atomic_check->__rzg2l_du_vsp_plane_atomi=
c
>    _check and moved it to rzg2l_du_vsp.c
>  * Added struct clk in rzg2l_du_crtc.h
>  * Dropped the variables mmio_offset,index,vblank_lock,vblank_wait,
>    vblank_count from struct rzg2l_du_crtc.
>  * Replaced the macro to_rzg2l_crtc with static inline functions.
>  * Dropped the unneeded header files clk.h, io.h, mm.h, pm.h, slab.h,
>    wait.h and drm_managed.h from rzg2l_du_drv.c.
>  * Replaced DRM_INFO->drm_info
>  * Dropped the callbacks prime_handle_to_fd, prime_fd_to_handle and
>    gem_prime_mmap.
>  * Replaced the callback remove->remove_new.
>  * Dropped header file wait.h and added forward declarations struct clk
> and
>    rzg2l_du_device from rzg2l_du_drv.h.
>  * Dropped the dsi and dpad0_source variables from struct rzg2l_du_device=
.
>  * Replaced the macro to_rzg2l_encoder with static inline functions.
>  * Dropped header files dma-buf.h and wait.h from rzg2l_du_kms.c.
>  * Dropped struct sg_table and added the scatterlist.h header file in
>    rzg2l_du_vsp.h
>  * Added container_of.h header file, forward declarations struct device
> and
>    struct rzg2l_du_device in rzg2l_du_vsp.h.
> v8->v9:
>  * Added Rb tag from Laurent and Acked-by tag from Kieran for patch#1.
>  * Added Rb tag from Laurent and Geert for patch#3.
>  * Dropped reset_control_assert() from error patch for rzg2l_du_crtc_get(=
)
> as
>    suggested by Philipp Zabel.
>  * Added Rb tag from Laurent oatch#5.
>  * Updated MAINTAINERS entries for common parts(Makefile and Kconfig).
> v7->v8:
>  * Moved rcar-du and shmobile DRM drivers to renesas specific vendor
> directory.
>  * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
>  * Added Rb tag from Rob for RZ/V2L DU bindings patch.
>  * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating rz_du
> folder.
>  * Updated MAINTAINERS entries.
> v6->v7:
>  * Split DU lib and  RZ/G2L du driver as separate patch series as
>    DU support added to more platforms based on RZ/G2L alike SoCs.
>  * Rebased to latest drm-tip.
>  * Added patch #2 for binding support for RZ/V2L DU
>  * Added patch #4 for driver support for RZ/V2L DU
>  * Added patch #5 for SoC DTSI support for RZ/G2L DU
>  * Added patch #6 for SoC DTSI support for RZ/V2L DU
>  * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L} SoCs=
.
>  * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
> v5->v6:
>  * Merged DU lib and RZ/G2L du driver in same patch series
>  * Rebased to latest drm-misc.
>  * Merged patch#1 to RZ/G2L Driver patch.
>  * Updated KConfig dependency from ARCH_RENESAS->ARCH_RZG2L.
>  * Optimized rzg2l_du_output_name() by removing unsupported outputs.
>=20
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
wor
> k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220312084205.31462=
-
> 2-
> biju.das.jz%40bp.renesas.com%2F&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas=
.co
> m%7C8e48927180a7413aaa7308db7c6dbc04%7C53d82571da1947e49cb4625a166a4a2a%7=
C
> 0%7C0%7C638240582971112471%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
J
> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXsp0k=
hWV
> DyFkR%2F5Ww4%2B9NlE0RWC5w%2B2tSWcPp8cpbEo%3D&reserved=3D0
>=20
> Biju Das (4):
>   dt-bindings: display: Document Renesas RZ/G2L DU bindings
>   dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
>   drm: renesas: Add RZ/G2L DU Support
>   MAINTAINERS: Add maintainer for RZ DU drivers
>=20
>  .../bindings/display/renesas,rzg2l-du.yaml    | 126 +++
>  MAINTAINERS                                   |  15 +-
>  drivers/gpu/drm/renesas/Kconfig               |   1 +
>  drivers/gpu/drm/renesas/Makefile              |   1 +
>  drivers/gpu/drm/renesas/rz-du/Kconfig         |  12 +
>  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 599 ++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  92 +++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 180 +++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  84
> ++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 109
> +++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  32 +
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 741 ++++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 469 +++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  97 +++
>  17 files changed, 2674 insertions(+), 2 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>=20
> --
> 2.25.1

