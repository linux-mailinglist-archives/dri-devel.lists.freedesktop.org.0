Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C940C57456B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 09:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CD5A235D;
	Thu, 14 Jul 2022 07:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFABAA235D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 07:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewFG5yNlRGW83X4jgVNZ9eHh+riD9UYIH/BNL1NMrBk4Vm02l2PtHoZVjJDTZFQF90nnNL3xKB4GElES3tMKE/qjG5Rl0afJlOw9KF/QtPR/LyC8RvIPxS4M7kiIDFAI0MXRR9wDGX36Wi8gdZRhee+VhFqxxMJ4HKauLfYLfmqzqmUBJB1G3OiKTsZZe5QvR6MKpH3DRcqAYrMeQoUYGVxueRBAt4fDUDR8CdKp4P2uZ9kK6MBVAKg/NIZsLS7UJ9qYtaJF/3r9XWCAR8aOv1xvNsdlzomp/Wph0s3EeRyL+hZRlbT/fXU0oPWOBwxjpjKthH16Wf0Ga5ZrJBzPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BT0Yk8OY538D82RJoJJA90244KGOWbD9SnfXn1QtRXg=;
 b=nIG1AP3gJbPHPCuB4WUtl7jbQRzT/J20Fhp0dtVjdqx+E+oba3X4xrlUa5fAQJ+lZdDi82pDBmvV2nYOWAP1TEjzPQ+jDwcxtEj/nzn2ypL4P6reLIWirTBiyyecYVnFIhFLcFmYZl+S3f7BgxgDjuq7jzEbxeQo6XhaL7vbHKX2ehQV8Gu0Lt7vOapM55c+z7iO6UQG//hABqzFVoyoCooj+CL07Q5+cKlJjW0UVBTlGR7xlDhnJHtdoQ77kKI4ZXBWIP1f4lhQPAvj89tGWRCqjUn0oqsZVkfzDKxsr5wmxSkhv4RrBR5vbOAS33xFiin4yfw9owyIhZnRuE0HNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT0Yk8OY538D82RJoJJA90244KGOWbD9SnfXn1QtRXg=;
 b=Wl5j+9ppg618gSEIHRegA3pMueoMO+izLvULx6/jLwFB/VR+wGjhLmAE/KPTyqJ7jvjDrRMlPxV4xmL2+I5iZbjbGu+M3i/A9/81AntLZkzmWDCN6V4xhAWOYO1yKT5TQKeitRb4KscIj8PRC2uszCgC513qvz8GvWmKw8YfHD0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2015.jpnprd01.prod.outlook.com (2603:1096:404:2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 14 Jul
 2022 07:01:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%8]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 07:01:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Philipp
 Zabel <p.zabel@pengutronix.de>
Subject: RE: [PATCH v3 0/2] Add RZ/G2L DSI driver
Thread-Topic: [PATCH v3 0/2] Add RZ/G2L DSI driver
Thread-Index: AQHYVO/ektwqmqRzhkKFqrG5S+EPsa05FpTwgETddNA=
Date: Thu, 14 Jul 2022 07:01:18 +0000
Message-ID: <OS0PR01MB5922BA0C61A4BFB0BA02940086889@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220420195011.73617-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922227434DC5FE5921F9B2D86DC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922227434DC5FE5921F9B2D86DC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbb90c0b-3e2e-4c1f-6706-08da6566a69e
x-ms-traffictypediagnostic: TYAPR01MB2015:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g7AFeyZfNPO8xEfZD7Z50ttFqIljOnsrI9GA5w19S6XgyilsXl9v5AN620Rhez57WqbTOjwzzoVDMmeMjgi6n7F4ucL2wjz3C69mcOtDiglwe2N5NtZSDHypFbLLgosBUDrm5wDKSsH2UtsZIkqmbWZ0pfODlFgksryZy1sMgpZhruNN7merYB373Dt2JAZRKtsx7PHhLLnOW3FpiSw2IsoDTmuEoJ37VAVObchFIfKjbf0eppqcX6gsxBTFiUYc7na+MyuJvck3shjy5UXLxcBwJLtto6tpMxvILBy5OROUr7YUhn4ts0jb1jAq5yL4Kk1WbsHZibuRRbSc7GUMNIWjUtf1hrL0RSl4RCx2jk50/zLFbtw8XrbekYgdVdkQr8G9j6edjJIAIVecGi8joC7/oWoGibV/zh0s/dFq5IGRujQif92Z2Xe9tcjpg2c2G2L2ut8uC/sOsBQ4dTdK5/NeGCIBJSEJK8ok6DTOSmqIV1WQ4y9RgcDJEU/UgUEHmyBNKlYHCmXdJfZs8W7MYeDe/u9uKhBtiZE82Vp6n6KtXc4geUW9/eTT6AlIYiqE5U8kIoW5U5aN17Jkg+1oQ5CQzLycdODcXpLqafAK3KrnLeVxgAa4k/g3JlajMGFS6UPEqgrchyJ9reMuwEp9iZowWVc8Wv1EGKnRFxe32HfryLQAXsSRMkljspQyFLd5U1NqOnOUjWFKvtFlELNYggPNy11trbq25xjK7Rn6Hy7nSlCE0k4vjOqE+neIdbbj4wRyyz9a4QSwstJPBWnwroIUJLZhnM7PTDF3TGfGW1mgjL+H2Le6IPK/4Q/5meX3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(9686003)(26005)(83380400001)(7696005)(55016003)(6506007)(41300700001)(186003)(107886003)(122000001)(33656002)(2906002)(38070700005)(86362001)(38100700002)(316002)(54906003)(71200400001)(4326008)(8676002)(110136005)(66946007)(66446008)(478600001)(66476007)(76116006)(8936002)(66556008)(5660300002)(52536014)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SpA2u6SQ88qgzAuBz+gst6Bhhwz+sPOF+zdQ0pwjM2w8QhGHYLXY4eVsjX?=
 =?iso-8859-1?Q?r26NxPKe4GcTD6Do2N9jlldq8WsTnq1z34rI/x/ZCCI8+52Q1nhIG6uV+g?=
 =?iso-8859-1?Q?KaKjSwioOe+s8DsVcZb+mkfxqF4plTApQkfZ33TnQvB5avxEdyu6sh4DKs?=
 =?iso-8859-1?Q?cZm94qgXbsiYJucN1nLW8gs1iDgWcC+P6V3BXRKG1SSr+DuKGgG7tP14V4?=
 =?iso-8859-1?Q?rltTDBWw/HKZZvCDmJ2rZZyK5rC/WPFab593DBAFC/VxhNhwelOzZ777zJ?=
 =?iso-8859-1?Q?RN/yzhRHlQxUlM0oDpmY1CQDUscR/sgbDs8WU2QD5DZwPlmIgYH8LabrOb?=
 =?iso-8859-1?Q?A2HTXRYEyxGYdZxhaLVx+H6B6bFLlVMsfDCNEX/t7Cz3I2gaVJkxxnGCkh?=
 =?iso-8859-1?Q?dYjE15JKt9hgkydfmbvy/9Eh6u4JHzdMV2Q1uBzdvlf+WpDM6ZcDHcKHfi?=
 =?iso-8859-1?Q?gFKMpm8aOHF1hQxm/dVVS2lBQ3mmu54eiOuHLjHL9CpkM7dWDE+EOaQ3V3?=
 =?iso-8859-1?Q?K+sZcn/PmYnLAxPiWY00u2qwEMMFcE8z5JJdbYCXWUcM3zHvBq28I3kljy?=
 =?iso-8859-1?Q?cWj30OBmYHHgmNCFYdS/SgVqzzmx56K/aqRIc8xBVF/jEfZLfN2rOtpFDO?=
 =?iso-8859-1?Q?EkmOjL9CFyCvI4HmgGzeiyTfleLev3BLOQaE/wkjIZK0KJKEfxaBz/5jIE?=
 =?iso-8859-1?Q?cJc6aV7bo6eiaWWiY4B1awgLwZvozjq/OfeJE9KkFtSaAdV4ReaR89yv0F?=
 =?iso-8859-1?Q?SC7Zha7fbQZHaS8+FYg8BuGCVO+1aAR2iIJfaZWTwyf+Ha3E7qEzKntNT7?=
 =?iso-8859-1?Q?JDhKQNaDepMzmuywS6CZ9Ov3KTNfLVKm145Fj7VlN+/UD3rd7tN3WzMUN3?=
 =?iso-8859-1?Q?xCN2mLdM5/m40W5ZGopnjL6uy86shbLPlkwi8xOi5Yf+iEtrylIxg9PgUX?=
 =?iso-8859-1?Q?XaYGBAKVFKlay256EALijFmkrwJfCqcqHb0rNcxyFrMash5G1MwlRPZi4S?=
 =?iso-8859-1?Q?x/oGGvYDIby0CYu/rrTbKCldfjBCj27zGTIOXWGW4fgP3JW6sBq8u75WY/?=
 =?iso-8859-1?Q?rejE6E1J0TdJD0Y67gnsPa/FTOfyyb8iPfiBx9ia8KcAbdx2wjrDmywXTf?=
 =?iso-8859-1?Q?laFM2VAi1AwzJMN6+Hidywo3pgplY5aRIEHF1/pau9rB7t/UbKqNItGVyD?=
 =?iso-8859-1?Q?JpsYSKHv5/7QzVB6Nsl2tXf0/Mu26Yzv4sjc+oL3NnSWohqrdxNLqFtc19?=
 =?iso-8859-1?Q?q714a+oXVv/6Es/g4lBwK/o5e1bMG5H9+DbBEcO/VIYMfbvVMXpD0uTEaK?=
 =?iso-8859-1?Q?27k5Sc8AxAXHcxldwezAUBdej2b3BqZmGU0AiVhzKAFWXeFm9N2Z3CVg5j?=
 =?iso-8859-1?Q?s82UCoexT2usZOYN8P02CzNMQprPKr+yoIkGbXEWNLW5BwGq8oSP6hDRxl?=
 =?iso-8859-1?Q?Yc+ZTEnU7WZzfow+7dr3hYq3gQtW6IRF4vNyeAr0uvSGUlwpyg1i0zCmem?=
 =?iso-8859-1?Q?UTQ0Kt71MjtUxktTqd+YfXh5RitF66995Ze17/jYi+aczHlZd32aHunxHh?=
 =?iso-8859-1?Q?a+IDc7V9IK5QFpadsJ+qSjjWm1oOYSO3baYLs5s3vTANXc3xc0p85/jgjp?=
 =?iso-8859-1?Q?dz+hunMBxFj1+iG23oHB4/5VEzxvsRppQBUNDaDooFz71E69G3gOos/A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb90c0b-3e2e-4c1f-6706-08da6566a69e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 07:01:18.1252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B61STEbMPifDQSruV1vK4HxBUmVMKVyGU2tIJRbgNoLNRr9/qCiWGGh7xN6R05AwOc/yTYAjQyrOtO3oH+g+U1nAV8yEpKvR5mFeuRzRw6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2015
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

Hi David and Laurent,

Gentle Ping.

Are you happy with this series?

Cheers,
Biju


> Subject: RE: [PATCH v3 0/2] Add RZ/G2L DSI driver
>=20
> Hi All,
>=20
> Gentle ping.
>=20
> Are you ok with this patch series? Please let me know.
>=20
> Cheers,
> Biju
>=20
> > Subject: [PATCH v3 0/2] Add RZ/G2L DSI driver
> >
> > This patch series aims to support the MIPI DSI encoder found in the
> > RZ/G2L SoC. It currently supports DSI mode only.
> >
> > This unit supports MIPI Alliance Specification for Display Serial
> > Interface
> > (DSI) Specification. This unit provides a solution for transmitting
> > MIPI DSI compliant digital video and packets. Normative References are
> below.
> > * MIPI Alliance Specification for Display Serial Interface Version
> > 1.3.1
> > * MIPI Alliance Specification for D-PHY Version 2.1
> >
> > The following are key features of this unit.
> >
> > * 1 channel
> > * The number of Lane: 4-lane
> > * Support up to Full HD (1920 =D7 1080), 60 fps (RGB888)
> > * Maximum Bandwidth: 1.5 Gbps per lane
> > * Support Output Data Format: RGB666 / RGB888
> >
> > v2->v3:
> >  * Added Rb tag from Geert and Laurent for the binding patch.
> >  * Fixed the typo "Receive" -> "transmit"
> >  * Added accepible values for data-lanes
> >  * Sorted Header file in the example
> >  * Added SoC specific compaible along with generic one.
> >  * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function
> > instead
> >    of the memory pointer
> >  * Fixed the comment in rzg2l_mipi_dsi_startup()
> >  * Removed unnecessary dbg message from rzg2l_mipi_dsi_start_video()
> >  * DRM bridge parameter initialization moved to probe
> >  * Replaced dev_dbg->dev_err in rzg2l_mipi_dsi_parse_dt()
> >  * Inserted the missing blank lane after return in probe()
> >  * Added missing MODULE_DEVICE_TABLE
> >  * Added include linux/bits.h in header file
> >  * Fixed various macros in header file.
> >  * Reorder the make file for DSI, so that it is no more dependent
> >    on RZ/G2L DU patch series.
> > v1->v2:
> >  * Added full path for dsi-controller.yaml
> >  * Modeled DSI + D-PHY as single block and updated reg property
> >  * Fixed typo D_PHY->D-PHY
> >  * Updated description
> >  * Added interrupts and interrupt-names and updated the example
> >  * Driver rework based on dt-binding changes (DSI + D-PHY) as single
> > block
> >  * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
> >  * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
> >    and rzg2l_mipi_dsi_link_write
> >  * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
> > RFC->v1:
> >  * Added a ref to dsi-controller.yaml.
> >  * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
> >    and dropped DRM as it is implied by DRM_BRIDGE
> >  * Used devm_reset_control_get_exclusive() for reset handle
> >  * Removed bool hsclkmode from struct rzg2l_mipi_dsi
> >  * Added error check for pm, using pm_runtime_resume_and_get() instead
> of
> >    pm_runtime_get_sync()
> >  * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
> >  * Avoided read-modify-write stopping hsclock
> >  * Used devm_platform_ioremap_resource for resource allocation
> >  * Removed unnecessary assert call from probe and remove.
> >  * wrap the line after the PTR_ERR() in probe()
> >  * Updated reset failure messages in probe
> >  * Fixed the typo arstc->prstc
> >  * Made hex constants to lower case.
> > RFC:
> >  *
> >
> > Biju Das (2):
> >   dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
> >   drm: rcar-du: Add RZ/G2L DSI driver
> >
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 182 +++++
> >  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
> >  drivers/gpu/drm/rcar-du/Makefile              |   2 +
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 690 ++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
> >  5 files changed, 1033 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> >
> > --
> > 2.25.1

