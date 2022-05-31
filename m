Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94314538FB9
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 13:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2043112ABA;
	Tue, 31 May 2022 11:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5C6112AB7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LN8Md7ytNlXQQ1QeUF/Sx9V8RYzulPoTWdl5ZBXKA5CKrw+JOy8SNErboyZlPYszIOoJ2IzLvmp5s3lHFc2cPHAHNqvsBjIdrByZQnevoUxPPSZseYLi8lZvob1lmPEayOeUgd3tISC8QkSBrAwszqHpSzUGbQc3OukvYmoOzGlj+GjtN7+IY27rL9NbW62xAH3NN4pNR4MwhiFvvKCMF+/uSv/2vVCk+/+THdWBJOFvUt2IJJyKJo9cSzNhhpsdQdUHFMa7unBixP8M7QVaLf3dNK3gC9w45aF33maN4kOfI3QA95nzoS01tOkTAv4TqRskgdZTHJ09ge3BiTJuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvlpUI1hPJL0aPbSRzbtn+3RtBg26hG8mCQDwGiNZgI=;
 b=i2rO3GGLHeEneSA65NOnKi7zLtLLcww7/js7tNo0tfNIlRMKfd1yA+YcoN4HCG4ylqejX2ERPPqcOzZt5TYIRJYQ2d5DbmihEzKZVbQ7N3TOX6AXYl4AeoUEo1yQjoDNrPKduTc2123JxjArrAthvfpWjh2vqHQXVd9Y4MXnGcll4Qd0y7ryJRKHDT6gGJu4HNtiNKnNPPPrNo82K2SEdxLyVJ5mi2RhvYYkKNLQivXiQhkZB/fhfYSx8Zgy49O4rDjvetX8gznUWsB5ymlkd3uvPBrsgcikFfZfD6n+TidCvnbqjGuUqwBkomgqZwlKjFJxCDkz0bzkc7K1nGSMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvlpUI1hPJL0aPbSRzbtn+3RtBg26hG8mCQDwGiNZgI=;
 b=U5D/GlSgxHMcC7xcLcAGDWt3NkAthaCXn/71p9Y/xvPxNLMOrwV2SCj4iPS33nBdqzjv+hjEEUW5HBc913eUAKTAmHeTkDiwlAJyNSXlaqOsNUs5o/f+r2eKHwQdDPpMf40Fi+4aaAlsIONMbuRIs8pUXuRN5/ZZF+Dz5EumEbc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB4205.jpnprd01.prod.outlook.com (2603:1096:404:cb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 11:20:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 11:20:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: RE: [PATCH v3 0/2] Add RZ/G2L DSI driver
Thread-Topic: [PATCH v3 0/2] Add RZ/G2L DSI driver
Thread-Index: AQHYVO/ektwqmqRzhkKFqrG5S+EPsa05FpTw
Date: Tue, 31 May 2022 11:20:31 +0000
Message-ID: <OS0PR01MB5922227434DC5FE5921F9B2D86DC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220420195011.73617-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220420195011.73617-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cd0162e-d088-46cc-0d8d-08da42f792f2
x-ms-traffictypediagnostic: TYAPR01MB4205:EE_
x-microsoft-antispam-prvs: <TYAPR01MB4205E0F322A35ABD2D7F17E186DC9@TYAPR01MB4205.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ACv0vAWqEuExF0RyyEsy9R7687WTSGAmayStKAP1fHkyh244CPz25CqGIJBfpHXqUcZZjEAWG95TCYoQqcZOfA4FZ8drX5ysn2nV9HxDUZbIqO/j37vb9fGWSenIZ9lndFkcGCYGH0epnIUTVrq+m5rmnz+aNXQiBFmxjUZ2waP+QfXhK31czs3lzPmV7fHVAdg7cA9YxlwJ+KsEShERlO3DYGJWt258wiKrBYPOCgNQPosIu4wMHmpyFkQmR/VGxuls/n9HFO+UTc1a58VyYMNQLGn/91RpvfoO9CY2GJ5uq+IWB2ZerqjYn5YC1pQV2MgCT1EGSd5FOecocbow5CmpHOdeQxiSPERrnC4WnjyP1cdMoZNvTkJsfUD9UCCHv1WhIVJMJzdVSUvRWqR/OCKJRHtUDeWQSPVIzWReloy9oOaZIQT4y+uhlV6rlhhSKVJy3oZtW9Jl3eWXmAP/wDKhxPl+xGHQ2wTmqf+7VlG9uzF8hfioCCFk2AkNWhyGcqL/eqxNi5BVb7Nb1jyHrHC0bY0Z462zYxgfIDYzIUhn9yYCZ1YXnMZLz4qnZ+V2ZbuiTMHLHy2vrjC4UF0sjMvBr9XQDgFli1htaHiSIvfa/NdRltFpJpJm7+Ih2FOTPsPTx2YkUtJxh8OgtI3m6K5Bft0mMvJ5s2swGodUzGP0LmFdIECO7tINiIuwaEmeAqSHyiCFFFH52dEchpdGVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(26005)(6506007)(55016003)(316002)(38070700005)(2906002)(110136005)(54906003)(33656002)(9686003)(508600001)(7696005)(71200400001)(122000001)(86362001)(186003)(38100700002)(52536014)(83380400001)(8936002)(107886003)(76116006)(64756008)(66446008)(4326008)(66946007)(66476007)(5660300002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?maMh8bI/eNPQTZh7pOggc5fdQ09hK/zWQWnv0OUJgmJQfEPmaLj2epqqph?=
 =?iso-8859-1?Q?crrJhYRpT7nPg1a6oKElvhFSyyUOIy8Qe6QrEUSCCtDo88wlaHRqbGvQfU?=
 =?iso-8859-1?Q?kaTveH0j0NJAJ7Q2coismyeZ/ojeJY55LiybNQ4Xt3kp0NDGY+9TNbZVOy?=
 =?iso-8859-1?Q?EgCLSWRGVJRdgPqVfPrpecE5qwKlK9qRCMnc2XLJCdQlSwIFuGlNSI3bkQ?=
 =?iso-8859-1?Q?V1cYidRI7aUZF5K+EcWvpTYxrs4Na7VavZ3UKvuz3J5KtYVNRxCS3Y2u9H?=
 =?iso-8859-1?Q?5ePJ7+Dt3RTj97OGnGxO1Mz+WihnEo1Yx8FphQEmpJCp9jQNma8uPbAT0/?=
 =?iso-8859-1?Q?GzQueyjVnToJJuXu9JapLWLd6WcvjFipprvHW+d02j5T3u9j/6ksXoSleL?=
 =?iso-8859-1?Q?Gn5c0FgrHoAzUyhCyJ57gacsss1Lo758oux6BXw465ceeiWrjwXuI5/AvC?=
 =?iso-8859-1?Q?tDcINOdpdQWomZKgpcd+//e6qV5383WDE55sDnJ/uL+6rCgxwfycJkmlgf?=
 =?iso-8859-1?Q?6x8+YUIvLrpr15+1mgOxPfQ3el/5odR3aUfMdNUdwg4X6cFmrR1UWff0hp?=
 =?iso-8859-1?Q?wFKizz3SoPnNSWvFWRGR5T7k1IqPcEMbg//wIjVqoElqpy5elBbv+zQxDK?=
 =?iso-8859-1?Q?EH6ZPkmTiud+ZREnueLsAhcmY5NH0jXN12/edGXn9s39NqIw2XHsWoK2on?=
 =?iso-8859-1?Q?W9bKUWTch2wofgGaCTJ8uZKvgWEzglTkMC5lDEszfBlXdeugYjqSIOlgNg?=
 =?iso-8859-1?Q?u40cfwO5zwuDCD48yEYg/5tB2AUFEGIeW9lCDa3WQMGgaN/NhmC+LpwzHm?=
 =?iso-8859-1?Q?jwPFC/xGvCYi0lhtuN6CJTurcgMDwm0lPJmauS6pxSE6VDm23qGHzW/4mi?=
 =?iso-8859-1?Q?L9zO+g/U8oKIcsOrJ+3CNd/xWllcir9jHf3BK6lPzYPde9cuhCujlkzHx+?=
 =?iso-8859-1?Q?69vKEKioSR/YoXg9PNwWWFwzG/B8OViyHgMA9MO4KFziAMFqALoIhF57+i?=
 =?iso-8859-1?Q?pU/2UhzJIuDq6Dgme24EFoNZcII2T0vTBC0HbP6ulAA4FLLwi1yf3zHZUw?=
 =?iso-8859-1?Q?7fWCfL4VRnKn9vyyPYZE3qc5mhDsiE4xwG8SjiPfR4LCNHVaj0gRKPkaG2?=
 =?iso-8859-1?Q?sHlPehCrXrJ1WpPOKS7ctUlFeLg0Gkujh1daLJGobaEWxARZl9/CZ4BkSl?=
 =?iso-8859-1?Q?KvNIYuozfeIjfXsVv8BznmXGcgamCCJS6Sw5Z4/upMSAzBIDbm8wYiW2t7?=
 =?iso-8859-1?Q?qcTprwVDPZXvwkJbBR/8uQqJfPF0GgmA7lA1RWNbUX+66kc7v/ntfEDVXF?=
 =?iso-8859-1?Q?dRivc9Zs195MNeD4T4IpCLWGg4HKfMy/p5ELMyiODE0TETm9UutwhY2ww8?=
 =?iso-8859-1?Q?qG0g+xNiYK1fHVey5yA3RCUlIDBMGfSlTK2Qo8ZbygvNA5ChBbmr55PTxx?=
 =?iso-8859-1?Q?ExVl1Mcqje7EZ1AKbNvlUEybTbSgE9kAEXC+gSCTv7R6GeBETGJTeXC7lR?=
 =?iso-8859-1?Q?6HcMbNBc6UMLZjSoeMkJNPoHNtOtKroOEQpaV1lw4tqOpNO0eWLeppfbMp?=
 =?iso-8859-1?Q?c9Ji/2ic7ADNQrFIWZkFGtt0eDdJeDOoyYnWv4pK5uF4z34dlrexKRMYJv?=
 =?iso-8859-1?Q?Gc9D5c0kihKY6LOZrYjiat8WCH0iFtGL/hWoMd0IxmgN3N5/BZKN04T/4y?=
 =?iso-8859-1?Q?kNlnVADrk66JoaC8BZIib9STRECXR0qHj+t6aL4i+rH26Pw0bFerg2ag8F?=
 =?iso-8859-1?Q?rhwd6adEVn3OkQ2pnl3mAet1tomP/aoZtih1994oPeiYlikv+WVDnGwD2Z?=
 =?iso-8859-1?Q?gAM7slciBWxuHfodMIUQriYAU2Ti+kc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd0162e-d088-46cc-0d8d-08da42f792f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 11:20:31.5882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrDEWF1p6MaSzPeF0btTkmHx0zSVpa2aDgA6U15iQk2Zli+WrP/5TNcuZ/6rzZ/gmvGgEd9FpdFU2nGDu+45u91/8ZIL5DNWduniMSMinqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4205
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping.

Are you ok with this patch series? Please let me know.

Cheers,
Biju

> Subject: [PATCH v3 0/2] Add RZ/G2L DSI driver
>=20
> This patch series aims to support the MIPI DSI encoder found in the RZ/G2=
L
> SoC. It currently supports DSI mode only.
>=20
> This unit supports MIPI Alliance Specification for Display Serial Interfa=
ce
> (DSI) Specification. This unit provides a solution for transmitting MIPI
> DSI compliant digital video and packets. Normative References are below.
> * MIPI Alliance Specification for Display Serial Interface Version 1.3.1
> * MIPI Alliance Specification for D-PHY Version 2.1
>=20
> The following are key features of this unit.
>=20
> * 1 channel
> * The number of Lane: 4-lane
> * Support up to Full HD (1920 =D7 1080), 60 fps (RGB888)
> * Maximum Bandwidth: 1.5 Gbps per lane
> * Support Output Data Format: RGB666 / RGB888
>=20
> v2->v3:
>  * Added Rb tag from Geert and Laurent for the binding patch.
>  * Fixed the typo "Receive" -> "transmit"
>  * Added accepible values for data-lanes
>  * Sorted Header file in the example
>  * Added SoC specific compaible along with generic one.
>  * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function
> instead
>    of the memory pointer
>  * Fixed the comment in rzg2l_mipi_dsi_startup()
>  * Removed unnecessary dbg message from rzg2l_mipi_dsi_start_video()
>  * DRM bridge parameter initialization moved to probe
>  * Replaced dev_dbg->dev_err in rzg2l_mipi_dsi_parse_dt()
>  * Inserted the missing blank lane after return in probe()
>  * Added missing MODULE_DEVICE_TABLE
>  * Added include linux/bits.h in header file
>  * Fixed various macros in header file.
>  * Reorder the make file for DSI, so that it is no more dependent
>    on RZ/G2L DU patch series.
> v1->v2:
>  * Added full path for dsi-controller.yaml
>  * Modeled DSI + D-PHY as single block and updated reg property
>  * Fixed typo D_PHY->D-PHY
>  * Updated description
>  * Added interrupts and interrupt-names and updated the example
>  * Driver rework based on dt-binding changes (DSI + D-PHY) as single bloc=
k
>  * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
>  * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
>    and rzg2l_mipi_dsi_link_write
>  * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
> RFC->v1:
>  * Added a ref to dsi-controller.yaml.
>  * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
>    and dropped DRM as it is implied by DRM_BRIDGE
>  * Used devm_reset_control_get_exclusive() for reset handle
>  * Removed bool hsclkmode from struct rzg2l_mipi_dsi
>  * Added error check for pm, using pm_runtime_resume_and_get() instead of
>    pm_runtime_get_sync()
>  * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
>  * Avoided read-modify-write stopping hsclock
>  * Used devm_platform_ioremap_resource for resource allocation
>  * Removed unnecessary assert call from probe and remove.
>  * wrap the line after the PTR_ERR() in probe()
>  * Updated reset failure messages in probe
>  * Fixed the typo arstc->prstc
>  * Made hex constants to lower case.
> RFC:
>  *
>=20
> Biju Das (2):
>   dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
>   drm: rcar-du: Add RZ/G2L DSI driver
>=20
>  .../bindings/display/bridge/renesas,dsi.yaml  | 182 +++++
>  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
>  drivers/gpu/drm/rcar-du/Makefile              |   2 +
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 690 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
>  5 files changed, 1033 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
>=20
> --
> 2.25.1

