Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DA25006D4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E98410E242;
	Thu, 14 Apr 2022 07:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1B010E09A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:22:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlWeZ6FQQzIQVvGtLc19NwretIArgwGVOSOs9OR8DPJ5pdPiVs/bEmhvsDyw236xNKKUXUJnZCUSkRu2dtoxWBqQxxHk/pV7JIBnKmeBHoWt2Dn+fxtoiCabWNlep8VpGlbChUflUe6OoIMxb371J6nXp/jM/cDivt9fS8+Ya0bq4G1GhS4i8aWmpr1yKvHAQp8eIeO6EajLGXcUDXPgAAQyRYsJgTh0A6eEAp6X0UOOPAGIbPhdu3yMZ6kyQaTbnWwOE0iQGMmR/7sB1McHw3qPc8QyIGtnnTS/oVm7MrgKhgedjR+mA2F7vil7sQQh5JtoJZ++yuzmr21uOGf3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8wzaha5lJPSyp1glFtnjw8UmqzmkyXX4+nGT+hsw8M=;
 b=OKl2tOUUQETvMmiKSmr6p5JJVtkQGwqCRNfa9HSGmExO9E0MYmchgRjzD4QTQNx36L5WyY1yP93SquLR5Mm6+uu7x9tYZi+Tgx6+2chArsGUgSY9XQKRWmfx0CHpJrL6Yis0e7kLT3o9tMl9sR0OKKbTuZLofJBORGberFOpFXfELnXZTBSVNGwfCTmuKBCVMVyUrmKXbQEq/mQXhdCX3tZ9m7ZLMs5R1Hc8XNk06LYphlbyDWIo/hoMB0plRx5iYQkhfZwcJBFuL78cgfefRUxoGYVlRsKzJe/sK5LUuaP2JFREBsQhNSsiHZyv4WqosFZVtZ4+NF4flQrh2kwfpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8wzaha5lJPSyp1glFtnjw8UmqzmkyXX4+nGT+hsw8M=;
 b=DUMPunoTWbdC+lhndllpVMykL/yWfcp3HYemFlz9G6WsCT7NE+UGbiMR0gDpgIY2mUmLCiCAf3qN3V7VXlM9VOdUZLhYUaM1n6u/CvzEnr0lJfWYxY32lxoGNXlB+AxQ2gBFBxu1tdJMGdmKpvDG/cJrxSYCHbaqoedyX4BRp/s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2815.jpnprd01.prod.outlook.com (2603:1096:404:90::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:22:14 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 07:22:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>
Subject: RE: [PATCH v2 0/2] Add RZ/G2L DSI driver
Thread-Topic: [PATCH v2 0/2] Add RZ/G2L DSI driver
Thread-Index: AQHYQnABNcCTmLd1XUuI/Tq6B/6smazvGzbQ
Date: Thu, 14 Apr 2022 07:22:14 +0000
Message-ID: <OS0PR01MB5922B8CFC0879176295DBD7A86EF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 612e75ce-1cec-4d0e-2c35-08da1de77fc9
x-ms-traffictypediagnostic: TYAPR01MB2815:EE_
x-microsoft-antispam-prvs: <TYAPR01MB2815C8BA9B2A78E01ACD887986EF9@TYAPR01MB2815.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j8MmZGwp7lzt3qDT2uKqqBoMFM8486L7N2AxCx5/eMyp5KjM43sHfDGHYhM+JUj4QiYx93JZfjygj/wIeUX/5tlHH7mMuJXNANtGTp/iP96RISqFa2iMZ7OvNyD+CIgN5yXPiEWJE+Y8Nkj+lNRT2zApXaGw6NtQC0tAw+GhV4tldbL8Ta52OmuvcM1P5ScEwo6IbwBDBtqvznPh7/5Wu5znt9VRjxcQWsedrsdYb4yS+hc4C46/GkfD0Pr5Xjsb7p+TaPWTE0bEK9qLVte5Ac8hQ2TNEOBO2CsrdCdY3858njfki71atsSjgOXqpdAePbhOtv5pNC4Sz7u13L/vfdEQmy//ss41Xa/YDox7N2YaXKqw1Hjd5huIY0Mod6Af3fYlv1xerDa7hO0br/UNJweMHQWlYMCwcT458kiwBUr2vpyl6E3kxtCwQEvXzBQlQ6BmJCdW2b12KANOatjBxE7InLjedFFvVqXnhbAb7cS/WFcnwcmU41YH2kji6iaJH9aWrsdi6TLqx1rcjlUEtlUMmGtHwFOVgwsRdMPAtdXaECbwOxJ1gMR0sqOC2WeHvnJyLGlFsPyc2JoqjtC5uWFYfXU1ZrFlgMFcNJ9xJEckMERT1Pwm9aoYVWPqvIR7miXCIv4/1QiwTrGPzA4EGiiMs6u03mVZvLxz80rblq3u8nHVmR6ujiveriXMDYocADWGaJdkC6m66eUjeXnyxg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(316002)(86362001)(2906002)(83380400001)(122000001)(38100700002)(76116006)(26005)(107886003)(4326008)(508600001)(66946007)(52536014)(66556008)(66446008)(64756008)(66476007)(71200400001)(33656002)(55016003)(38070700005)(8936002)(186003)(8676002)(7696005)(9686003)(110136005)(6506007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fYqlpSJN9ryog360GSKfXzt4cpEmtd9wW5rqqSLh1Mgss1H4BOXLXZyZSx?=
 =?iso-8859-1?Q?34tV+071sWR9JbUgAsJwtucyJWGc+mfwcdXmAeluKo2XMOvcyvstGc8kRR?=
 =?iso-8859-1?Q?0gMT5vvst/ieBwneGopEMlSF+xP22lR2A/S82K88ZVhLIjk/xBKEb8UuXF?=
 =?iso-8859-1?Q?zaIkqEXW624hHXxAIr/yS1jHHCY89nYecLz2HJj/zJkZCXgLTALvy3XXh7?=
 =?iso-8859-1?Q?XYNI3uofst1J2cPowo52/9pgQ+TbUnO+JutVOOKpwxhQBEK4T7oiY/tO0z?=
 =?iso-8859-1?Q?vaG/OawmWYJWgUzJrKSCtb31XQOutbvRYwQKhYHrbLowwR3vvTRIfcczOx?=
 =?iso-8859-1?Q?pXWivX8ETNJOjIsLPrEUNM46tUEfwrL96IejNJpJpd/jgtZy4EAMYloxL8?=
 =?iso-8859-1?Q?GRUTw/OLWXKFVOCRg0dgaUruqfGF/0gI359yooTaeM3MR7VbVijV/bA/TK?=
 =?iso-8859-1?Q?nhwp8V1r58KJONLkLM4FXjCYltnkBdsiOc4HoKV+6wqzcvMm9ItWVfKd9d?=
 =?iso-8859-1?Q?PzQ8bxa+p2pJenos5//u+DtcdmhJsmrQwfF/E+Ip+CZ1Wf/qB10Kjym/Wi?=
 =?iso-8859-1?Q?URTEjGxELcMjhoCRSDnselcbub89Iioxe1peo38Yozc8+HOsKhxWvdfvyc?=
 =?iso-8859-1?Q?Ek6wQ7wltStcd9GOxv0p7asVW7IzbYyMv+eH2UDifNfbj/NcSUzFcOX3hp?=
 =?iso-8859-1?Q?EGb9TM3MdOvlatzcc0TVdTBdmIMRNBp4xKoUDUqSPX7uairEzswtiStWFS?=
 =?iso-8859-1?Q?sQhNm+F/4RWwleYnmIhfcwzRccezvvb0MsWPMWznSUDUkQRtcWAT/HWxeZ?=
 =?iso-8859-1?Q?3HsV2q3MFypQ5J3LNi6wq629rlOfQjnvHp0oMTjirsA48G8JsJ18E03d26?=
 =?iso-8859-1?Q?x9ET5BW1gbedSYtYTV32xTj4akyVe3hX4s0AD906jd8TjxKLJn91+h8IFp?=
 =?iso-8859-1?Q?q4C/VPNnt+csO6rpekj89RKnC/Fj2AGv7Ex1Pcru2JGuos7fHdzxeTQe2C?=
 =?iso-8859-1?Q?BTYfmPL2MbLov38SPd0M8XEaWjDWITeHMHrJFWy2JbooGVrXHwsDOcKrcE?=
 =?iso-8859-1?Q?D7fV3r16GOujfADSFC/JaAcgzgW2ZyIUZSwxeNnEOdWpRjS3uBtWT45ssY?=
 =?iso-8859-1?Q?/JL6xiAOA7y0fOrk9r/mLUmyBwOgy8O50UTwPCFCFd+BBFzlzP7zRI/aPt?=
 =?iso-8859-1?Q?Vx85TXMGHEaoi4PycOzsLpz7NO/KEF0knoic7BD2+YGPiFQRNVfZPCUTAl?=
 =?iso-8859-1?Q?FXgPhH6C5iRFd40WsTacNYdMTP88ijMm5hlTRBClHlHJeNFL+AwKdVmx7a?=
 =?iso-8859-1?Q?tSxL91U2BWGqCsGsrmywkmoUwRG69VI6Y8EotPUgCitvpbPFF3Ka3zlWKt?=
 =?iso-8859-1?Q?f7cdo99ux92AM1BKMSVi3No5WLveJ8kufUT+4sdpdt+1OYvIqxFcIfuvVb?=
 =?iso-8859-1?Q?NkRZx755Ch0UMbA7eco2ol0gT+9tlQAEMVdxXmpxB0e9kXOnBkkWAo2Axj?=
 =?iso-8859-1?Q?MUZox4xDfqpYvEjBQWPf7pMyib5SjXMpWSm4+gA17abyyAYFKZbmAAF5ej?=
 =?iso-8859-1?Q?jALsNY21RPUeDwfskDnzJsSOb1CsNxmxA/VsOhNaccrJNUae1YGhd4nEki?=
 =?iso-8859-1?Q?lt0QY+omfxziYiBAUvjBPDNR8iFOIz/unkUlq7aPys8RLlsvj1B8dhR7+e?=
 =?iso-8859-1?Q?t/WvpJaJI2ybjLXVtXxPxKP4JI0Q6RuxxFZSoDEZNB+lb3Sm1TjNsOECNo?=
 =?iso-8859-1?Q?j+oyiJdYv0CtbgW6k/lvZxmdSE9XfXtWorn3V2FZnGXEcZajp2ejqZPWou?=
 =?iso-8859-1?Q?yeIsUT2ArCukU+COWaHx1eFoFWLG3XQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612e75ce-1cec-4d0e-2c35-08da1de77fc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 07:22:14.0513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dBpzjX7T1VTyer4vyTWehvS2lZETEX/hCdh9VQ3lbveKSgPG16aaQ1W3YRJb2t7C7hbuXb9Dtu1n3KZBzBHtxarruN5L3BVs3+iRLup54c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2815
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

Gentle ping. Are we happy with this patch series?
Please let me know.

Cheers,
Biju

> Subject: [PATCH v2 0/2] Add RZ/G2L DSI driver
>=20
> This patch series aims to support the MIPI DSI encoder found in the RZ/G2=
L
> SoC. It currently supports DSI mode only.
>=20
> This unit supports MIPI Alliance Specification for Display Serial
> Interface (DSI) Specification. This unit provides a solution for
> transmitting MIPI DSI compliant digital video and packets. Normative
> References are below.
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
>  .../bindings/display/bridge/renesas,dsi.yaml  | 175 +++++
>  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
>  drivers/gpu/drm/rcar-du/Makefile              |   1 +
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 686 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 149 ++++
>  5 files changed, 1019 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
>=20
> --
> 2.17.1

