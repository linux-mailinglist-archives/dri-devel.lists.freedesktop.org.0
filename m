Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9115FFA2D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 15:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D21910E49C;
	Sat, 15 Oct 2022 13:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915C310E496
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 13:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O94Xpq9paQFUKoiwADMvqo7KM98RCluKZv5vU8UZ+WKHzvpv9qsLJhqc9ehSLRJ9scYIuugA6M9vwdXIMSHfhDrPgEGP3Bst0pmYht1SVHVyYOU+g6X5OGJsDKXTGogXjKoWGjbC8EqyxWXjB0adqvp9oVZUemXGho9PWgTARguetVFuPy5GvYGxyEGS/xUxpbAbatUrkZZJCsgrz8I1NWGr5t4F1wasBCtYVfwRQNoXuOmcIn7qRfQh9TDo68if0tn+wb2OOYIzcUW2xkEDs80KiykkLcqq2sIlnI/VK6jR7Yt6VYkmBmQoq7L4+diICxsvSulGBfwQWKpRBWWonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbXLVLcdifbKrrFDiGPG5JvvZ2TOs7E7aEtYJJUxal0=;
 b=D6PcGNOtPG/ujx0fRT9gUkXRpGt537P73OMlFPm4HWByMzCknJHGwIVTnBgWMKTf0yDknCTypWwbrqIe+4KXY/HSbrALKSEqMg+Wm8v9HshElGnbS0sfe26z7dCRTGZMO7QsScYedqbwa69aVdlQl/gSUt4Xlcxy/lu6wloXEgzXIQ65rtllJha7N9WcYG6nHTMigHBzy4nnTu7IFW72icednRcxTX3ZNb2ctb1UXmh0+qvXsV0rbgIqi7tZ1tVT+MTVlQUdNXeYkqU91Ahky2glMNVOtaJYwVRkM2VWjIT3jdMKkUMVVr1tFN+Arb+RFM60yAZ0muLR8hgdHkBRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbXLVLcdifbKrrFDiGPG5JvvZ2TOs7E7aEtYJJUxal0=;
 b=NsbarDNv4QC2osRXX7G4T9qTDEJxipWioiXZtFX053bb8HDpAHX5zAfTsub67qiAWT1xuFMtk4A/jwo8TntynK+FveIbZk3qniqpk8DwqsZ1NQNqeOreusWdX1piYJTvfkXig9TpGJ0TP7aWNPFabudXAFXp71tHQ3y+66ijs4o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8590.jpnprd01.prod.outlook.com (2603:1096:400:13d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Sat, 15 Oct
 2022 13:11:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%8]) with mapi id 15.20.5723.030; Sat, 15 Oct 2022
 13:11:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Philipp
 Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v8 0/3] Add RZ/G2L DSI driver
Thread-Topic: [PATCH v8 0/3] Add RZ/G2L DSI driver
Thread-Index: AQHYzN90vuwfyOFCtEyXvr9R15v3X64PlUVg
Date: Sat, 15 Oct 2022 13:11:20 +0000
Message-ID: <OS0PR01MB592238A6FBE0BA8368EEE57C86279@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220920105501.396999-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220920105501.396999-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8590:EE_
x-ms-office365-filtering-correlation-id: f00f3b1f-8746-472a-a35e-08daaeaec05e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +CFsIMgLiMM/e8zsa+wOToJizrQ/qQokZ/zeNlLQBA0uDpR+g34PIshAcNgkb2m6ZiSY27KHiqZR0TLEP3UC7BROAuMPzvrJHfCcgbJmwk+gIjaOnhH4D2kXrVQACaL6vrBM2BZHI5EllxmXNSeXjolX2tkrGEBaiRMu2sUanmY/ayIs9WAf3KKi+nOSvWol7ZA7H6EzTUPsKVaQIddVxUuvoJpEr6FtwFBr51BAyG2K1aaaUnaOKg+qhsHfRn00RVVbCoiUMpK0no6viVTUME5DwXPze4Rtn3Aa4x9xvjyXdw28aqk5kXsxrELla63/o7dcg9A4N05PVRg87ilF8klCM4+Fl8wOkhNIARMg/2gWwn9w7dUoaxWpKbGSWGAfuFUGMgPFlYdaNDHEVJj4v8jeL02wwz+uGRsdjnjTkAhpoxOCEfjamPjcEvSkH7Zl5i+tT+Uywfbu3Rp4zHMXPkwQ/GkZZVl3Tv9JNmcq5a0TAcNC2W5fJsP19X8f2BNIdsykYCjXOFXO7rlJAgaH8I0O0l6aRrbjkWRTMLkl1iy4zm+rNSYGtq5NwKlMXWeZJEi6/Xe9J8a/OBzBRRXGEux7QChUqFHk8xRAdJV/qpONJtDK9Q5358fysEn+NOnMnjeYVP11Pu0OQuV2mQ9vPZIgPxLFWHMHZLYGBI7H9BtgpcQSL9koiMPImAAnRd3dp6b+u439I2P4ON0TvXD9kSdks86TCkoA7i4XZGDsXcwrQG0FIQb6Z6crgWWl0S+QVotFZ+gYhq+6Amv1Omtt1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(5660300002)(54906003)(316002)(76116006)(66946007)(110136005)(64756008)(66446008)(66476007)(66556008)(4326008)(8676002)(7696005)(41300700001)(9686003)(26005)(6506007)(8936002)(2906002)(52536014)(71200400001)(186003)(83380400001)(38070700005)(122000001)(38100700002)(107886003)(478600001)(86362001)(55016003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?h6U2s+HZihm0Jz+Mj6J9KTNft3og1lz0WxvoSznNtqtt1usBNaOuru8w0S?=
 =?iso-8859-1?Q?BuAHaBMKb3b5O+mp/nKSZ1mVxfc9bc1hUrKhQE7o9jCFMfGQb+0TixnzdQ?=
 =?iso-8859-1?Q?Wy6oFwOThuYCK8iTVRmReRD7CEYJwu1eNU7i3n9bmXN3Z1hgbZLLrrISa6?=
 =?iso-8859-1?Q?2fGsgowM2ODXKyPAQtxh4FAaNQUj3VpT6G2TQvKCf3uMgUawk+uYYwny+1?=
 =?iso-8859-1?Q?Ew0mgfxmSgKfNsASsp35EGEDKTCdnrPhUNfDxhRzUfIW0I9XZnxPksRTEe?=
 =?iso-8859-1?Q?zDvCPfh4ecVt1FtZhFqDtwM1caeSp/iE6rJ8/zIAaAHB79x63DaJik5NIq?=
 =?iso-8859-1?Q?AZAuAoDJsI2/79bZ4Y4I7wCIqqzSmqjLfNRkGzsFFUf7sJxB4QzpyMIIWa?=
 =?iso-8859-1?Q?3GLyJpRymgzz/F5a6cKWx18tKuHlSih7HWg0yPRDYVmbt1Ts8VUqEw0ceG?=
 =?iso-8859-1?Q?4kuKaeWepIu6rdXKvuUxnE4S8qdLiTh0VAUi1bgCayflCICxoHGWibY52Y?=
 =?iso-8859-1?Q?rPucb2kQD/7D7haoBOdNMqn8s1BMUPPEwCqmSbUo66ecIfsfiJUaKprO1F?=
 =?iso-8859-1?Q?ruZ5x7oSp5CNRJ/zG4ZEy8xWM7xJ4HwyzjJGoSW67+VEOe51cyZEKF0MzX?=
 =?iso-8859-1?Q?4Aq6X1bEDgXwolS3JuWeLCsL/hhlTg9iIsDM+KJkwiCsdNnI7zjeIUiyVy?=
 =?iso-8859-1?Q?BwhWUlXiJPjyRDdlKb+K3tN2tK+d3W3V+ym7qOlMBRlP51uUIg/Ec5KRE9?=
 =?iso-8859-1?Q?/3YAXC/6ecHYHEtHKqnIu13ET9r2uch3lSMd+r3o1gdhGyfHaytn5IlFkO?=
 =?iso-8859-1?Q?uxTtgL1+txW3mfC9crOvja6ic3JuhSni3deVOE6lasupGLEmr/VLGWXha5?=
 =?iso-8859-1?Q?0aNXiqC8zaNc9BaQo6BPIScmOIZms4tipvtnRZQh5MuVoLu6k3CNfmPp9H?=
 =?iso-8859-1?Q?f7RpM/H3AWBRpeGd+CNvefaqjrOCaV9vv/1hnmUN/AbOikxoJwIHyvGZLi?=
 =?iso-8859-1?Q?yKMaqB0ck6MuviLbhAFsZ5F4xRVM5KR1JKpqdn9RL+fOl28ijhmFWxwN4T?=
 =?iso-8859-1?Q?cdG4eMG00R/xMfjvlwdcZ8/jxxiTcbQ250aRJzLjqiO6Gxfie1Ql0pEqT8?=
 =?iso-8859-1?Q?ZrIapa/sL0h+FTuj8WL25Lkdojg6U7ekK5+h7YgX5Hkeq/OOnirAvIQA2f?=
 =?iso-8859-1?Q?9t977POYfNQeCC+h3hC/iZrZMXHo1/b8lP4GYTS9JyTbrmCb1Ma69xsnSK?=
 =?iso-8859-1?Q?olQck7esmIkdXw/Iwc/dmE6jspST1/jHiYSMjtrRYx//deoAxGKuUoZe7B?=
 =?iso-8859-1?Q?PV3rAxDr6sYagSkwc2dkadQTxO2klRPaaSsLXvC+jEb1M2gqAsZ2ZeP0e1?=
 =?iso-8859-1?Q?Af2S6j9Bm3I+Dcv5GoqnkwPTmS+rOU9ILLoowpVirRAZvjJDzWEL+h2V2e?=
 =?iso-8859-1?Q?SC023GE93CUCGctdUUCXnGlVjEznNJ9pyGdXaFisUiv/LmnQNRsQLDQXV2?=
 =?iso-8859-1?Q?//72PYRg9E7pjb6YKPgi8EMCqOU1O2i6GIxmvE5FGnHiXR6UAcgBFlAvPm?=
 =?iso-8859-1?Q?2q1R/YoKunpkFft7mcLrcfgOhe8vhjqw7jYS9MlFnHIKHC+CcTgZHi03x4?=
 =?iso-8859-1?Q?QjF7LmB3raC3GJ5fzZL2d/fAgtdZkkGDAM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00f3b1f-8746-472a-a35e-08daaeaec05e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2022 13:11:20.1004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iF3IwlSrJVhJeb3x5BNDl1TEboh0Fev9Lb9H3aCdd4uOJblrKjWYVyaxn42zVOm4pKB8j/daxDIUtGKUQUpgqzRLd1azon/u3Nvle+EMh74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8590
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

Gentle ping.

Cheers,
Biju

> Subject: [PATCH v8 0/3] Add RZ/G2L DSI driver
>=20
> This patch series aims to support the MIPI DSI encoder found in the
> RZ/G2L SoC. It currently supports DSI video mode only.
>=20
> This unit supports MIPI Alliance Specification for Display Serial
> Interface (DSI) Specification. This unit provides a solution for
> transmitting MIPI DSI compliant digital video and packets. Normative
> References are below.
> * MIPI Alliance Specification for Display Serial Interface Version
> 1.3.1
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
> This patch series is based on drm_misc and patches from drm/du/next
> [1]
>=20
>=20
> v7->v8:
>  * Added Rb tag from Laurent.
>  * Added hsfreq_max to struct rzg2l_mipi_dsi_timings.
>  * Removed enums rzg2l_mipi_dsi_dphy_timings.
>  * Replaced if else with for loop for finding dphy_timings
>    based on hsfreq.
>  * Removed checking "number of lanes capability" from rzg2l_mipi_dsi_
>    startup() and added patch#3 for handling it in probe() and
> enforcing
>    it in rzg2l_mipi_dsi_host_attach().
>  * Added Labels with an "err_" prefix.
> 	out_pm_put->err_pm_put
> 	out_assert_rst_and_stop_clocks->err_stop
> 	out_stop_hs_clock->err_stop_clock
> 	out_pm_disable->err_pm_disable
>  * Added error message for lane check in rzg2l_mipi_dsi_host_attach()
>  * Replaced dev_warn->dev_err for the format error in
> rzg2l_mipi_dsi_host
>    _attach(). Added missing "\n" and print the format for debugging.
> v6->v7:
>  * Added rzg2l_mipi_dsi_stop() counterpart of
> rzg2l_mipi_dsi_startup().
>  * Error labels are named according to the cleanup operation they
> perform.
>  * Restored Max lane capability read after dphy timing initialization
>    as per the guide lines from SoC design team.
>  * Added recommended lut values for the Global Operation Timing
>    parameters for MIPI DPHY.
> v5->v6:
>  * Updated commit description
>  * Moved handling of arst and prst from rzg2l_mipi_dsi_startup-
> >runtime
>    PM suspend/resume handlers.
>  * Max lane capability read at probe(), and enforced in
>    rzg2l_mipi_dsi_host_attach()
>  * Simplified vich1ppsetr setting.
>  * Renamed hsclk_running_mode,hsclk_mode->is_clk_cont.
>  * Fixed typo in probe error message(arst->rst).
>  * Reordered DRM bridge initaization in probe()
>  * Updated typo in e-mail address.
> v4->v5:
>  * Added Ack from Sam.
>  * Added a trivial change, replaced rzg2l_mipi_dsi_parse_dt()
>    with drm_of_get_data_lanes_count_ep() in probe.
> v3->v4:
>  * Updated error handling in rzg2l_mipi_dsi_startup() and
> rzg2l_mipi_dsi_atomic_enable().
> v2->v3:
>  * Added Rb tag from Geert and Laurent
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
>  * Driver rework based on dt-binding changes (DSI + D-PHY) as single
> block
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
>  * Added error check for pm, using pm_runtime_resume_and_get() instead
> of
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
>=20
> Biju Das (3):
>   dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
>   drm: rcar-du: Add RZ/G2L DSI driver
>   drm: rcar-du: rzg2l_mipi_dsi: Enhance device lanes check
>=20
>  .../bindings/display/bridge/renesas,dsi.yaml  | 182 ++++
>  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
>  drivers/gpu/drm/rcar-du/Makefile              |   2 +
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 816
> ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
>  5 files changed, 1159 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
>=20
> --
> 2.25.1

