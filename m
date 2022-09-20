Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B45BDDAD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 08:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFB910E2E8;
	Tue, 20 Sep 2022 06:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3600910E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 06:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuwnuYpqN3329eShtoC+ZccQijIKgjSE/nHudvCj7MYPjTiqk//HSdB+bcNmTbhAe9PYnOH0HbQO6RZCUuj8DrseLNJD8VWHQRv7A8LAx2Q+Nv1GV1B9svScSWv8stDylb520vHbufI7mI4xd673eDhmr608DG6yRV4PaM/gu0l01OKo8pN999KAN27TFEikUsEo4XTlT5nZ6E4915wITr1bBuBm0GbaT3zcLer2DVia8R/3nFkabBx9F31NapMAB5EnN41o6yWqbkiZH4fR0ItYhp8ASmNQFaYbiuJaJxlZq4ddVflhqXiagpI2jNlqwPfzfYf5OBzpWmIQi10+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg4Vbod6K3bJRGxuW1i81W6KQqtGbmJdqBVjTrnl4ro=;
 b=kot1Wocs5VENYy9RIvw84EyCanvzjerErrEMqRya01xFSv7D772U6ORJjvtezzwrqy92nFdf2gbDbr2VHTrrmvyogZv4OIHl41cdbeTVqn69GYdXx1JXQmS9dt8W13msuxvQ99rJvvxw+rjYfDWSRnbDZTS0L9VFJ/Z7mYtqHnZGJz7BLGuHO4Mu/VpTwshYrkQTClHqHUVchVCPJiPSltyTa1JwuH685X8GbivNnL4jZMLUGw6adU+uPm2pSzxqh/ixmylhtKu0tqDn+XOuVjxAB4tRcsZe9r/zOnNorIJxtaRjYTJDXqA2WvFrm5C8jgl2S+YxE81F5ZyY6mKcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg4Vbod6K3bJRGxuW1i81W6KQqtGbmJdqBVjTrnl4ro=;
 b=j5aHQOBjvkFgnNFGSBihTDGSxjepWxbmWkr0glucYVLvpGuZSpEBaux/CS4tkDeiiaJ85ti7YeVwFIFcEefYdVc3XzFrp42PQA1ws4YAwI9D4ncDFx0/bL3CpEj2QMgP//kwYEEtcL4JdAMuAOrkBKKBjUlcHYAm8xSnxPgtXFE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6302.jpnprd01.prod.outlook.com (2603:1096:400:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Tue, 20 Sep
 2022 06:54:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 06:54:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v7 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [PATCH v7 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHYyakZEmOMZRzilEO6w3DvyDPwMK3m/doAgADn85A=
Date: Tue, 20 Sep 2022 06:54:55 +0000
Message-ID: <OS0PR01MB5922802A5BD6824C2DD34CED864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220916084807.640225-1-biju.das.jz@bp.renesas.com>
 <20220916084807.640225-3-biju.das.jz@bp.renesas.com>
 <Yyie8tKZ4IioRuk5@pendragon.ideasonboard.com>
In-Reply-To: <Yyie8tKZ4IioRuk5@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB6302:EE_
x-ms-office365-filtering-correlation-id: afaf8421-faec-4f63-436e-08da9ad506b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /DVYEBFcB5IAyK+6sj6V2gqqt6bS8zUzxQHBkg5QG+IGmzvhPZT4yBhsj+ttVLgemDVvuC8KQX4kvqa04XU6S8DpfZM0VNBwmDy3eiqyXE3k3xsYT/RoPK13CY6qzB6ekQGPHR2i1Oo2nxMV/pW7EboMlIAelq4jPJVFN5/kZmr+sWjUBRYUyHHtWnQUgGWw3h48nrhbLyAw1B64KY6ZPnALXzja8SDlXOca9zBQTGeYNK49ReMV86OTS81RXkatkkx78qtbMKoOv7xrE+BsT9bGh6JziGnlWv/XMHmIUDaAxiJU9EhscV2m/l0Uz49UmYgZm8mwQdnzmMNJNxU6OiNVXxB1kvfnQewOU/rQxosw773CorhcozYOmDgaVYwC+TrKm4t1oOfhswQOjSWNOpP+OER+53raWx9CeexqbHf5NK9KYzuVqKSFgfNNJFoz28SbUHMDaBx0JLpKtJOybkZSIsJB7JZQMO21mQ2RokPufeLlHn8XvdivnOEtnU+eEKolTkz4cfBX3JCDVP4QBEH6iZpnCx5LQU4bysB6R76VHJips1oQUrmlgylyhnNsQe67BZ67LdkQftzztP5L9F3iQTo37Vf58Tg/fzF9iQ4duy+c5mD1YfWcj06eEV41CzC5rA5t/vtrXJI52pSwtIawWCpZHKBB29D8FniNjMoMq7WZGX03ttjL3B4jO0S0lwBF6RwK9gewu8jbAE2V0PHoKc0uytmWOZxPr7etLfkQzT/rD7YtpElwxM1OBgy/SiqEo8b96qqWgyLhOsZfog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(4326008)(66946007)(5660300002)(76116006)(8676002)(64756008)(66446008)(66476007)(86362001)(55016003)(8936002)(54906003)(66556008)(52536014)(316002)(6916009)(122000001)(38100700002)(33656002)(83380400001)(7696005)(41300700001)(71200400001)(478600001)(186003)(9686003)(6506007)(26005)(38070700005)(30864003)(2906002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+vvHX6878/heeWxMQMqARmsq+Oww4PgAnSqV71SZebJ0ohTjFbViAnqTcb3F?=
 =?us-ascii?Q?JCuPr6XkQWQIE821fnHNHpi2lyR2CRVTeuajnw6vqHnajKk7hgaGMe/I3siQ?=
 =?us-ascii?Q?kyJzpfD+HPAFBSMDvRiJpmni7VAhbkTc8xFjuo+jMckL4cXfvQiB1emQv+eO?=
 =?us-ascii?Q?0jNr2X/cQZ3Ty5+uEV4sIPmO0xi7xDF4ru5LFHWdu9uvMqzM3mx/tZh8chIU?=
 =?us-ascii?Q?CKbkt/+mtz1ULLiYskMv4iF3PTXmVDBsmzmN4nDUytZrCSQQC8lT5t5+2cfI?=
 =?us-ascii?Q?50ZjSp7VSEpRUJtIffEuawo/AFN3saC561+IUIIwyJwnALp8n1I4p60xEeQ8?=
 =?us-ascii?Q?crwRbjH+dhQnl9DEEq8GI2aLTxk3HB/O0SOgoU3pCzBPd3OwqGOq8B6zhP82?=
 =?us-ascii?Q?xE02PB5jP+iyv3VSL0vBZp94t6GIxv4mKSxXum7sau9YStqrItZFSLiTDU6t?=
 =?us-ascii?Q?WjLoDRT+frJA7gE3JEtNVMmahocOXkbXJukl9AYMAZSq6C3Ss8uWfB7R4Lpg?=
 =?us-ascii?Q?cKmsjjbyJi4ImF3Yd14BzPM81kXPU4HSgSs1gyw1XKeSiavm0dRuoqIP9SN0?=
 =?us-ascii?Q?IXnTjY3gnVJ0iKxlZ0GrR4bVJ95GQQKj4wwbcBXSLbmIQYtKXL+hoBTitRPg?=
 =?us-ascii?Q?OwwkW3e93GoAgm3rp8PYD2Fr0pmaYD28TBu3wHq/YAy1G46J/XBB3FtfXkjp?=
 =?us-ascii?Q?CMe9G5VhYQfnPHsj1+nETAstyZdzg6q6cmJseX3omfMriR+2Lrmy1ze6SQ6n?=
 =?us-ascii?Q?F/4Lyou6qRbwU6+bD2zHC++HVe/iMapkHnjy/y+T42IpUKJDfUAcwKIiv26T?=
 =?us-ascii?Q?zoF5C5uW4QeDIKlr9LI275JDUPhYF6eJilrZTroQ9UI0AdnuYuki3q5UVOYW?=
 =?us-ascii?Q?EFC0DXMObhwNGjuQ/aEsQDYus1Z8AJ4WiuW4TtRzwdzfY3zMDxcBdzeU5uBG?=
 =?us-ascii?Q?bE2VBcq1LP5g800WBzql/GoWSux0jsgglYnYxg4UHWpke4CFk+EsLRMjyjXe?=
 =?us-ascii?Q?hB5eaaQ+IhN8v3+dXDWZ+kFKPgM3sJzpCcZdytOdUTOPzh5Mz9cuNaMiIV/y?=
 =?us-ascii?Q?25kCszQgmkQAiFHjJBJDPXv29vgzVdw7F7jqS9R+pUEWjMdLNbAh4SL80NjY?=
 =?us-ascii?Q?DHuBH+1y02DYnjB1qYapxysB1lV44EBu0GX2wmV2WsCP72jZ1vRVLZZXeB6R?=
 =?us-ascii?Q?7YklyQxqI9IvCJaxEilf+n2NoteuNfpvmL7Buttf7tdEL47bTRiwi8M0xOsv?=
 =?us-ascii?Q?Scd6laesE+ldNm1GicGV7xjUMPhgJRrsOQmZd8SHea8aWaj1RtHyUoSZ0sGB?=
 =?us-ascii?Q?885V6c7ZsRxV70zGgLfajEpo3c+CUOELw9kKWjnnpk2ZeXFOtbmCrkW+dyUk?=
 =?us-ascii?Q?rIgw2ulY8T6IfU/LGl71ow3M4MMrv8xoLfwIu81mOvrPoQf8gMGImfu6ktP2?=
 =?us-ascii?Q?2cqUMiR1UEC1QIQ2Huzyz2gDdhvFLEir3AEz6HhwLt880u6/rZ7dWCm0rZw/?=
 =?us-ascii?Q?UnH64bX2b7aVk3pcTZnKeFJBIOikqYUxTBwwM/3WuGM/3IfIXT3IztjJ/h5L?=
 =?us-ascii?Q?5r6bKj4NDduKZkyY8rWJ7Kb8MCP5gRmdKhG8vh8C9lRCxlSdpBkktRk5thRb?=
 =?us-ascii?Q?vQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afaf8421-faec-4f63-436e-08da9ad506b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 06:54:55.7288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mfFTBZKMOLjMXIvOtOuvusqq9q3A/pnjknTbLgScZr/1Nza5/3E4YheeVULW2sX1Yt4mGdxfXDIIbSLd7fqdD32n5BCmlx0drwcBlmUfsYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6302
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v7 2/2] drm: rcar-du: Add RZ/G2L DSI driver
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Fri, Sep 16, 2022 at 09:48:07AM +0100, Biju Das wrote:
> > This driver supports the MIPI DSI encoder found in the RZ/G2L SoC.
> It
> > currently supports DSI video mode only.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > v6->v7:
> >  * Added rzg2l_mipi_dsi_stop_video() counterpart of
> rzg2l_mipi_dsi_start_video().
> >  * Error labels are named according to the cleanup operation they
> perform.
> >  * Restored Max lane capability read after dphy timing
> initialization
> >    as per the guide lines from SoC design team.
> >  * Added recommended lut values for the Global Operation Timing
> >    parameters for MIPI DPHY.
> > v5->v6:
> >  * Updated commit description
> >  * Moved handling of arst and prst from rzg2l_mipi_dsi_startup-
> >runtime
> >    PM suspend/resume handlers.
> >  * Max lane capability read at probe(), and enforced in
> >    rzg2l_mipi_dsi_host_attach()
> >  * Simplified vich1ppsetr setting.
> >  * Renamed hsclk_running_mode,hsclk_mode->is_clk_cont.
> >  * Fixed typo in probe error message(arst->rst).
> >  * Reordered DRM bridge initaization in probe()
> >  * Updated typo in e-mail address.
> > v4->v5:
> >  * Added Ack from Sam.
> >  * Added a trivial change, replaced rzg2l_mipi_dsi_parse_dt()
> >    with drm_of_get_data_lanes_count_ep() in probe.
> > v3->v4:
> >  * Updated error handling in rzg2l_mipi_dsi_startup() and
> > rzg2l_mipi_dsi_atomic_enable()
> > v2->v3:
> >  * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function
> instead
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
> >  * Rework based on dt-binding change (DSI + D-PHY) as single block
> >  * Replaced link_mmio and phy_mmio with mmio in struct
> rzg2l_mipi_dsi
> >  * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
> >    and rzg2l_mipi_dsi_link_write
> >  * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
> > RFC->v1:
> >  * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
> >    and dropped DRM as it is implied by DRM_BRIDGE
> >  * Used devm_reset_control_get_exclusive() for reset handle
> >  * Removed bool hsclkmode from struct rzg2l_mipi_dsi
> >  * Added error check for pm, using pm_runtime_resume_and_get()
> instead of
> >    pm_runtime_get_sync()
> >  * Added check for unsupported formats in
> rzg2l_mipi_dsi_host_attach()
> >  * Avoided read-modify-write stopping hsclock
> >  * Used devm_platform_ioremap_resource for resource allocation
> >  * Removed unnecessary assert call from probe and remove.
> >  * wrap the line after the PTR_ERR() in probe()
> >  * Updated reset failure messages in probe
> >  * Fixed the typo arstc->prstc
> >  * Made hex constants to lower case.
> > RFC:
> >  *
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
> >  drivers/gpu/drm/rcar-du/Makefile              |   2 +
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 782
> ++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
> >  4 files changed, 943 insertions(+)
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> > b/drivers/gpu/drm/rcar-du/Kconfig index c959e8c6be7d..58ffb8c2443b
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -51,6 +51,14 @@ config DRM_RCAR_MIPI_DSI
> >  	help
> >  	  Enable support for the R-Car Display Unit embedded MIPI DSI
> encoders.
> >
> > +config DRM_RZG2L_MIPI_DSI
> > +	tristate "RZ/G2L MIPI DSI Encoder Support"
> > +	depends on DRM_BRIDGE && OF
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	select DRM_MIPI_DSI
> > +	help
> > +	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI
> encoders.
> > +
> >  config DRM_RCAR_VSP
> >  	bool "R-Car DU VSP Compositor Support" if ARM
> >  	default y if ARM64
> > diff --git a/drivers/gpu/drm/rcar-du/Makefile
> > b/drivers/gpu/drm/rcar-du/Makefile
> > index 6f132325c8b7..b8f2c82651d9 100644
> > --- a/drivers/gpu/drm/rcar-du/Makefile
> > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > @@ -14,3 +14,5 @@ obj-$(CONFIG_DRM_RCAR_DU)		+=3D rcar-du-drm.o
> >  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+=3D rcar_dw_hdmi.o
> >  obj-$(CONFIG_DRM_RCAR_LVDS)		+=3D rcar_lvds.o
> >  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+=3D rcar_mipi_dsi.o
> > +
> > +obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
> > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > new file mode 100644
> > index 000000000000..59a9dc2f9c03
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > @@ -0,0 +1,782 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RZ/G2L MIPI DSI Encoder Driver
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation  */ #include
> > +<linux/clk.h> #include <linux/delay.h> #include <linux/io.h>
> #include
> > +<linux/iopoll.h> #include <linux/module.h> #include <linux/of.h>
> > +#include <linux/of_device.h> #include <linux/of_graph.h> #include
> > +<linux/platform_device.h> #include <linux/pm_runtime.h> #include
> > +<linux/reset.h> #include <linux/slab.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "rzg2l_mipi_dsi_regs.h"
> > +
> > +struct rzg2l_mipi_dsi {
> > +	struct device *dev;
> > +	void __iomem *mmio;
> > +
> > +	struct reset_control *rstc;
> > +	struct reset_control *arstc;
> > +	struct reset_control *prstc;
> > +
> > +	struct mipi_dsi_host host;
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +
> > +	struct clk *vclk;
> > +
> > +	enum mipi_dsi_pixel_format format;
> > +	unsigned int num_data_lanes;
> > +	unsigned int lanes;
> > +	unsigned long mode_flags;
> > +};
> > +
> > +static inline struct rzg2l_mipi_dsi *
> bridge_to_rzg2l_mipi_dsi(struct
> > +drm_bridge *bridge) {
> > +	return container_of(bridge, struct rzg2l_mipi_dsi, bridge); }
> > +
> > +static inline struct rzg2l_mipi_dsi * host_to_rzg2l_mipi_dsi(struct
> > +mipi_dsi_host *host) {
> > +	return container_of(host, struct rzg2l_mipi_dsi, host); }
> > +
> > +struct rzg2l_mipi_dsi_timings {
> > +	u32 t_init;
> > +	u32 tclk_prepare;
> > +	u32 ths_prepare;
> > +	u32 tclk_zero;
> > +	u32 tclk_pre;
> > +	u32 tclk_post;
> > +	u32 tclk_trail;
> > +	u32 ths_zero;
> > +	u32 ths_trail;
> > +	u32 ths_exit;
> > +	u32 tlpx;
> > +};
> > +
> > +enum rzg2l_mipi_dsi_dphy_timings {
> > +	RZG2L_MIPI_DSI_TRANSMISSION_RATE_80_MBPS =3D 0,
> > +	RZG2L_MIPI_DSI_TRANSMISSION_RATE_125_MBPS,
> > +	RZG2L_MIPI_DSI_TRANSMISSION_RATE_250_MBPS,
> > +	RZG2L_MIPI_DSI_TRANSMISSION_RATE_360_MBPS,
> > +	RZG2L_MIPI_DSI_TRANSMISSION_RATE_720_MBPS,
> > +	RZG2L_MIPI_DSI_TRANSMISSION_RATE_720_MBPS_PLUS,
> > +};
> > +
> > +static const struct rzg2l_mipi_dsi_timings
> rzg2l_mipi_dsi_global_timings[] =3D {
> > +	[RZG2L_MIPI_DSI_TRANSMISSION_RATE_80_MBPS] =3D {
> > +		.t_init =3D 79801,
> > +		.tclk_prepare =3D 8,
> > +		.ths_prepare =3D 13,
> > +		.tclk_zero =3D 33,
> > +		.tclk_pre =3D 24,
> > +		.tclk_post =3D 94,
> > +		.tclk_trail =3D 10,
> > +		.ths_zero =3D 23,
> > +		.ths_trail =3D 17,
> > +		.ths_exit =3D 13,
> > +		.tlpx =3D 6,
> > +	},
> > +	[RZG2L_MIPI_DSI_TRANSMISSION_RATE_125_MBPS] =3D {
> > +		.t_init =3D 79801,
> > +		.tclk_prepare =3D 8,
> > +		.ths_prepare =3D 12,
> > +		.tclk_zero =3D 33,
> > +		.tclk_pre =3D 15,
> > +		.tclk_post =3D 94,
> > +		.tclk_trail =3D 10,
> > +		.ths_zero =3D 23,
> > +		.ths_trail =3D 17,
> > +		.ths_exit =3D 13,
> > +		.tlpx =3D 6,
> > +	},
> > +	[RZG2L_MIPI_DSI_TRANSMISSION_RATE_250_MBPS] =3D {
> > +		.t_init =3D 79801,
> > +		.tclk_prepare =3D 8,
> > +		.ths_prepare =3D 12,
> > +		.tclk_zero =3D 33,
> > +		.tclk_pre =3D 13,
> > +		.tclk_post =3D 94,
> > +		.tclk_trail =3D 10,
> > +		.ths_zero =3D 23,
> > +		.ths_trail =3D 16,
> > +		.ths_exit =3D 13,
> > +		.tlpx =3D 6,
> > +	},
> > +	[RZG2L_MIPI_DSI_TRANSMISSION_RATE_360_MBPS] =3D {
> > +		.t_init =3D 79801,
> > +		.tclk_prepare =3D 8,
> > +		.ths_prepare =3D 10,
> > +		.tclk_zero =3D 33,
> > +		.tclk_pre =3D 4,
> > +		.tclk_post =3D 35,
> > +		.tclk_trail =3D 7,
> > +		.ths_zero =3D 16,
> > +		.ths_trail =3D 9,
> > +		.ths_exit =3D 13,
> > +		.tlpx =3D 6,
> > +	},
> > +	[RZG2L_MIPI_DSI_TRANSMISSION_RATE_720_MBPS] =3D {
> > +		.t_init =3D 79801,
> > +		.tclk_prepare =3D 8,
> > +		.ths_prepare =3D 9,
> > +		.tclk_zero =3D 33,
> > +		.tclk_pre =3D 4,
> > +		.tclk_post =3D 35,
> > +		.tclk_trail =3D 7,
> > +		.ths_zero =3D 16,
> > +		.ths_trail =3D 9,
> > +		.ths_exit =3D 13,
> > +		.tlpx =3D 6,
> > +	},
> > +	[RZG2L_MIPI_DSI_TRANSMISSION_RATE_720_MBPS_PLUS] =3D {
> > +		.t_init =3D 79801,
> > +		.tclk_prepare =3D 8,
> > +		.ths_prepare =3D 9,
> > +		.tclk_zero =3D 33,
> > +		.tclk_pre =3D 4,
> > +		.tclk_post =3D 35,
> > +		.tclk_trail =3D 7,
> > +		.ths_zero =3D 16,
> > +		.ths_trail =3D 9,
> > +		.ths_exit =3D 13,
> > +		.tlpx =3D 6,
> > +	},
> > +};
> > +
> > +static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi,
> u32
> > +reg, u32 data) {
> > +	iowrite32(data, dsi->mmio + reg);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi,
> u32
> > +reg, u32 data) {
> > +	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg); }
> > +
> > +static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32
> > +reg) {
> > +	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg); }
> > +
> > +/*
> > +-------------------------------------------------------------------
> --
> > +--------
> > + * Hardware Setup
> > + */
> > +
> > +static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> > +				  const struct drm_display_mode *mode) {
> > +	const struct rzg2l_mipi_dsi_timings *dphy_timings;
> > +	unsigned long hsfreq;
> > +	u32 txsetr;
> > +	u32 clstptsetr;
> > +	u32 lptrnstsetr;
> > +	u8 max_num_lanes;
> > +	u32 clkkpt;
> > +	u32 clkbfht;
> > +	u32 clkstpt;
> > +	u32 golpbkt;
> > +	unsigned int bpp;
> > +	u32 dphyctrl0;
> > +	u32 dphytim0;
> > +	u32 dphytim1;
> > +	u32 dphytim2;
> > +	u32 dphytim3;
> > +	int lut_index;
> > +	int ret;
> > +
> > +	/*
> > +	 * Relationship between hsclk and vclk must follow
> > +	 * vclk * bpp =3D hsclk * 8 * lanes
> > +	 * where vclk: video clock (Hz)
> > +	 *       bpp: video pixel bit depth
> > +	 *       hsclk: DSI HS Byte clock frequency (Hz)
> > +	 *       lanes: number of data lanes
> > +	 *
> > +	 * hsclk(bit) =3D hsclk(byte) * 8
> > +	 */
> > +	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +	hsfreq =3D (mode->clock * bpp * 8) / (8 * dsi->lanes);
> > +
> > +	/* All DSI global operation timings are set with recommended
> setting */
> > +	if (hsfreq <=3D 80000)
> > +		lut_index =3D RZG2L_MIPI_DSI_TRANSMISSION_RATE_80_MBPS;
> > +	else if (hsfreq <=3D 125000)
> > +		lut_index =3D RZG2L_MIPI_DSI_TRANSMISSION_RATE_125_MBPS;
> > +	else if (hsfreq <=3D 250000)
> > +		lut_index =3D RZG2L_MIPI_DSI_TRANSMISSION_RATE_250_MBPS;
> > +	else if (hsfreq <=3D 360000)
> > +		lut_index =3D RZG2L_MIPI_DSI_TRANSMISSION_RATE_360_MBPS;
> > +	else if (hsfreq <=3D 720000)
> > +		lut_index =3D RZG2L_MIPI_DSI_TRANSMISSION_RATE_720_MBPS;
> > +	else
> > +		lut_index =3D RZG2L_MIPI_DSI_TRANSMISSION_RATE_720_MBPS_PLUS;
> > +
> > +	dphy_timings =3D &rzg2l_mipi_dsi_global_timings[lut_index];
>=20
> How about adding an hsfreq_max field to the dphy_timings structure
> (set to the above values, 80000, 125000, ...) and writing
>=20
> 	for (i =3D 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
> 		dphy_timings =3D &rzg2l_mipi_dsi_global_timings[i];
> 		if (hsfreq <=3D dphy_timings->hsfreq_max)
> 			break;
> 	}

OK, will do with last entry as 1500mbps.

> You could then drop the rzg2l_mipi_dsi_dphy_timings enum.
OK.

>=20
> > +
> > +	ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +
> > +	/* Initializing DPHY before accessing LINK */
> > +	dphyctrl0 =3D DSIDPHYCTRL0_CAL_EN_HSRX_OFS |
> DSIDPHYCTRL0_CMN_MASTER_EN |
> > +		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
> > +
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > +	usleep_range(20, 30);
> > +
> > +	dphyctrl0 |=3D DSIDPHYCTRL0_EN_LDO1200;
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > +	usleep_range(10, 20);
> > +
> > +	dphytim0 =3D DSIDPHYTIM0_TCLK_MISS(0) |
> > +		   DSIDPHYTIM0_T_INIT(dphy_timings->t_init);
> > +	dphytim1 =3D DSIDPHYTIM1_THS_PREPARE(dphy_timings->ths_prepare) |
> > +		   DSIDPHYTIM1_TCLK_PREPARE(dphy_timings->tclk_prepare) |
> > +		   DSIDPHYTIM1_THS_SETTLE(0) |
> > +		   DSIDPHYTIM1_TCLK_SETTLE(0);
> > +	dphytim2 =3D DSIDPHYTIM2_TCLK_TRAIL(dphy_timings->tclk_trail) |
> > +		   DSIDPHYTIM2_TCLK_POST(dphy_timings->tclk_post) |
> > +		   DSIDPHYTIM2_TCLK_PRE(dphy_timings->tclk_pre) |
> > +		   DSIDPHYTIM2_TCLK_ZERO(dphy_timings->tclk_zero);
> > +	dphytim3 =3D DSIDPHYTIM3_TLPX(dphy_timings->tlpx) |
> > +		   DSIDPHYTIM3_THS_EXIT(dphy_timings->ths_exit) |
> > +		   DSIDPHYTIM3_THS_TRAIL(dphy_timings->ths_trail) |
> > +		   DSIDPHYTIM3_THS_ZERO(dphy_timings->ths_zero);
> > +
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM0, dphytim0);
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM1, dphytim1);
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
> > +
> > +	ret =3D reset_control_deassert(dsi->rstc);
> > +	if (ret < 0)
> > +		goto out_pm_put;
> > +
> > +	udelay(1);
> > +
> > +	/* Check number of lanes capability */
> > +	max_num_lanes =3D rzg2l_mipi_dsi_link_read(dsi, TXSETR) >> 16;
> > +	max_num_lanes =3D (max_num_lanes & 0x3) + 1;
> > +	if (max_num_lanes < dsi->lanes) {
> > +		dev_err(dsi->dev, "DPHY can not support %d lanes", dsi-
> >lanes);
> > +		ret =3D -EINVAL;
> > +		goto out_rst_assert;
> > +	}
>=20
> I'm still annoyed by this, but it's not a blocker, as
> rzg2l_mipi_dsi_host_attach() already validates that the device's
> number of lanes doesn't exceed the maximum specified in DT.
> Nonetheless, if it were possible to read this register at probe time
> by initializing the PHY there, I'd prefer that, but it can be done in
> a subsequent patch.

OK, will remove it from here and will add it in a subsequent patch
in probe(), This involves some investigation as mode->clock for
computing hsfreq is not available during probe().

>=20
> > +
> > +	/* Enable Data lanes and Clock lanes */
> > +	txsetr =3D TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) |
> TXSETR_CLEN;
> > +	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
> > +
> > +	/*
> > +	 * Global timings characteristic depends on high speed Clock
> Frequency
> > +	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
> > +	 * - videoclock =3D 148.5 (MHz)
> > +	 * - bpp: maximum 24bpp
> > +	 * - data lanes: maximum 4 lanes
> > +	 * Therefore maximum hsclk will be 891 Mbps.
> > +	 */
> > +	if (hsfreq > 445500) {
> > +		clkkpt =3D 12;
> > +		clkbfht =3D 15;
> > +		clkstpt =3D 48;
> > +		golpbkt =3D 75;
> > +	} else if (hsfreq > 250000) {
> > +		clkkpt =3D 7;
> > +		clkbfht =3D 8;
> > +		clkstpt =3D 27;
> > +		golpbkt =3D 40;
> > +	} else {
> > +		clkkpt =3D 8;
> > +		clkbfht =3D 6;
> > +		clkstpt =3D 24;
> > +		golpbkt =3D 29;
> > +	}
> > +
> > +	clstptsetr =3D CLSTPTSETR_CLKKPT(clkkpt) |
> CLSTPTSETR_CLKBFHT(clkbfht) |
> > +		     CLSTPTSETR_CLKSTPT(clkstpt);
> > +	rzg2l_mipi_dsi_link_write(dsi, CLSTPTSETR, clstptsetr);
> > +
> > +	lptrnstsetr =3D LPTRNSTSETR_GOLPBKT(golpbkt);
> > +	rzg2l_mipi_dsi_link_write(dsi, LPTRNSTSETR, lptrnstsetr);
> > +
> > +	return 0;
> > +
> > +out_rst_assert:
> > +	reset_control_assert(dsi->rstc);
> > +out_pm_put:
> > +	pm_runtime_put(dsi->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi) {
> > +	reset_control_assert(dsi->rstc);
> > +	pm_runtime_put(dsi->dev);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi
> *dsi,
> > +					      const struct drm_display_mode
> *mode) {
> > +	u32 vich1ppsetr;
> > +	u32 vich1vssetr;
> > +	u32 vich1vpsetr;
> > +	u32 vich1hssetr;
> > +	u32 vich1hpsetr;
> > +	int dsi_format;
> > +	u32 delay[2];
> > +	u8 index;
> > +
> > +	/* Configuration for Pixel Packet */
> > +	dsi_format =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +	switch (dsi_format) {
> > +	case 24:
> > +		vich1ppsetr =3D VICH1PPSETR_DT_RGB24;
> > +		break;
> > +	case 18:
> > +		vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
> > +		break;
> > +	}
> > +
> > +	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
> > +	    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
> > +		vich1ppsetr |=3D VICH1PPSETR_TXESYNC_PULSE;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
> > +
> > +	/* Configuration for Video Parameters */
> > +	vich1vssetr =3D VICH1VSSETR_VACTIVE(mode->vdisplay) |
> > +		      VICH1VSSETR_VSA(mode->vsync_end - mode->vsync_start);
> > +	vich1vssetr |=3D (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
> > +			VICH1VSSETR_VSPOL_HIGH : VICH1VSSETR_VSPOL_LOW;
> > +
> > +	vich1vpsetr =3D VICH1VPSETR_VFP(mode->vsync_start - mode->vdisplay)
> |
> > +		      VICH1VPSETR_VBP(mode->vtotal - mode->vsync_end);
> > +
> > +	vich1hssetr =3D VICH1HSSETR_HACTIVE(mode->hdisplay) |
> > +		      VICH1HSSETR_HSA(mode->hsync_end - mode->hsync_start);
> > +	vich1hssetr |=3D (mode->flags & DRM_MODE_FLAG_PHSYNC) ?
> > +			VICH1HSSETR_HSPOL_HIGH : VICH1HSSETR_HSPOL_LOW;
> > +
> > +	vich1hpsetr =3D VICH1HPSETR_HFP(mode->hsync_start - mode->hdisplay)
> |
> > +		      VICH1HPSETR_HBP(mode->htotal - mode->hsync_end);
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1VSSETR, vich1vssetr);
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1VPSETR, vich1vpsetr);
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
> > +
> > +	/*
> > +	 * Configuration for Delay Value
> > +	 * Delay value based on 2 ranges of video clock.
> > +	 * 74.25MHz is videoclock of HD@60p or FHD@30p
> > +	 */
> > +	if (mode->clock > 74250) {
> > +		delay[0] =3D 231;
> > +		delay[1] =3D 216;
> > +	} else {
> > +		delay[0] =3D 220;
> > +		delay[1] =3D 212;
> > +	}
> > +
> > +	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> > +		index =3D 0;
> > +	else
> > +		index =3D 1;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1SET1R,
> > +				  VICH1SET1R_DLY(delay[index]));
> > +}
> > +
> > +static int rzg2l_mipi_dsi_start_hs_clock(struct rzg2l_mipi_dsi
> *dsi)
> > +{
> > +	bool is_clk_cont;
> > +	u32 hsclksetr;
> > +	u32 status;
> > +	int ret;
> > +
> > +	is_clk_cont =3D !(dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > +
> > +	/* Start HS clock */
> > +	hsclksetr =3D HSCLKSETR_HSCLKRUN_HS | (is_clk_cont ?
> > +					     HSCLKSETR_HSCLKMODE_CONT :
> > +					     HSCLKSETR_HSCLKMODE_NON_CONT);
> > +	rzg2l_mipi_dsi_link_write(dsi, HSCLKSETR, hsclksetr);
> > +
> > +	if (is_clk_cont) {
> > +		ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +					status & PLSR_CLLP2HS,
> > +					2000, 20000, false, dsi, PLSR);
> > +		if (ret < 0) {
> > +			dev_err(dsi->dev, "failed to start HS clock\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	dev_dbg(dsi->dev, "Start High Speed Clock with %s clock mode",
> > +		is_clk_cont ? "continuous" : "non-continuous");
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_stop_hs_clock(struct rzg2l_mipi_dsi *dsi)
> {
> > +	bool is_clk_cont;
> > +	u32 status;
> > +	int ret;
> > +
> > +	is_clk_cont =3D !(dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > +
> > +	/* Stop HS clock */
> > +	rzg2l_mipi_dsi_link_write(dsi, HSCLKSETR,
> > +				  is_clk_cont ? HSCLKSETR_HSCLKMODE_CONT :
> > +				  HSCLKSETR_HSCLKMODE_NON_CONT);
> > +
> > +	if (is_clk_cont) {
> > +		ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +					status & PLSR_CLHS2LP,
> > +					2000, 20000, false, dsi, PLSR);
> > +		if (ret < 0) {
> > +			dev_err(dsi->dev, "failed to stop HS clock\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi) {
> > +	u32 vich1set0r;
> > +	u32 status;
> > +	int ret;
> > +
> > +	/* Configuration for Blanking sequence and start video input*/
> > +	vich1set0r =3D VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
> > +		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);
> > +
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				status & VICH1SR_VIRDY,
> > +				2000, 20000, false, dsi, VICH1SR);
> > +	if (ret < 0)
> > +		dev_err(dsi->dev, "Failed to start video signal input\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi) {
> > +	u32 status;
> > +	int ret;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, VICH1SET0R_VSTPAFT);
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				(status & VICH1SR_STOP) && (!(status &
> VICH1SR_RUNNING)),
> > +				2000, 20000, false, dsi, VICH1SR);
> > +	if (ret < 0)
> > +		goto err;
> > +
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				!(status & LINKSR_HSBUSY),
> > +				2000, 20000, false, dsi, LINKSR);
> > +	if (ret < 0)
> > +		goto err;
> > +
> > +	return 0;
> > +
> > +err:
> > +	dev_err(dsi->dev, "Failed to stop video signal input\n");
> > +	return ret;
> > +}
> > +
> > +/*
> > +-------------------------------------------------------------------
> --
> > +--------
> > + * Bridge
> > + */
> > +
> > +static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
> > +				 enum drm_bridge_attach_flags flags) {
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +
> > +	return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> bridge,
> > +				 flags);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> > +					 struct drm_bridge_state
> *old_bridge_state) {
> > +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +	const struct drm_display_mode *mode;
> > +	struct drm_connector *connector;
> > +	struct drm_crtc *crtc;
> > +	int ret;
> > +
> > +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> bridge->encoder);
> > +	crtc =3D drm_atomic_get_new_connector_state(state, connector)-
> >crtc;
> > +	mode =3D &drm_atomic_get_new_crtc_state(state, crtc)-
> >adjusted_mode;
> > +
> > +	ret =3D rzg2l_mipi_dsi_startup(dsi, mode);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > +
> > +	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
> > +	if (ret < 0)
> > +		goto out_assert_rst_and_stop_clocks;
> > +
> > +	ret =3D rzg2l_mipi_dsi_start_video(dsi);
> > +	if (ret < 0)
> > +		goto out_stop_hs_clock;
> > +
> > +	return;
> > +
> > +out_stop_hs_clock:
> > +	rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > +out_assert_rst_and_stop_clocks:
>=20
> Let's name these labels with an "err_" prefix. You can also shorten
> them to err_stop_clock and err_stop if desired.

Agreed.

>=20
> > +	rzg2l_mipi_dsi_stop(dsi);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge
> *bridge,
> > +					  struct drm_bridge_state
> *old_bridge_state) {
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +
> > +	rzg2l_mipi_dsi_stop_video(dsi);
> > +	rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > +	rzg2l_mipi_dsi_stop(dsi);
> > +}
> > +
> > +static enum drm_mode_status
> > +rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> > +				 const struct drm_display_info *info,
> > +				 const struct drm_display_mode *mode) {
> > +	if (mode->clock > 148500)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops =3D {
> > +	.attach =3D rzg2l_mipi_dsi_attach,
> > +	.atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
> > +	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
> > +	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid, };
> > +
> > +/*
> > +-------------------------------------------------------------------
> --
> > +--------
> > + * Host setting
> > + */
> > +
> > +static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> > +				      struct mipi_dsi_device *device) {
> > +	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +	int ret;
> > +
> > +	if (device->lanes > dsi->num_data_lanes)
>=20
> The error message from v6 was useful for debugging purpose, I'd add it
> back:
>=20
> 		dev_err(dsi->dev,
> 			"Number of lines of device (%u) exceeds host (%u)\n",
> 			device->lanes, dsi->num_data_lanes);
>=20

OK. Agreed.

> or something like that.
>=20
> > +		return -EINVAL;
> > +
> > +	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
> > +	case 24:
> > +	case 18:
> > +		break;
> > +	default:
> > +		dev_warn(dsi->dev, "unsupported format");
>=20
> Missing \n. Also, this is an error, I'd use dev_err(), and print the
> format too, useful for debugging:
>=20
> 		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device-
> >format);

OK. Agreed. Will send v8 with these changes.

Cheers,
Biju

>=20
> With these small issues addressed,
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> > +		return -EINVAL;
> > +	}
> > +
> > +	dsi->lanes =3D device->lanes;
> > +	dsi->format =3D device->format;
> > +	dsi->mode_flags =3D device->mode_flags;
> > +
> > +	dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev-
> >of_node,
> > +						  1, 0);
> > +	if (IS_ERR(dsi->next_bridge)) {
> > +		ret =3D PTR_ERR(dsi->next_bridge);
> > +		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	drm_bridge_add(&dsi->bridge);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> > +				      struct mipi_dsi_device *device) {
> > +	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +
> > +	drm_bridge_remove(&dsi->bridge);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops =3D {
> > +	.attach =3D rzg2l_mipi_dsi_host_attach,
> > +	.detach =3D rzg2l_mipi_dsi_host_detach, };
> > +
> > +/*
> > +-------------------------------------------------------------------
> --
> > +--------
> > + * Power Management
> > + */
> > +
> > +static int __maybe_unused rzg2l_mipi_pm_runtime_suspend(struct
> device
> > +*dev) {
> > +	struct rzg2l_mipi_dsi *dsi =3D dev_get_drvdata(dev);
> > +
> > +	reset_control_assert(dsi->prstc);
> > +	reset_control_assert(dsi->arstc);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused rzg2l_mipi_pm_runtime_resume(struct
> device
> > +*dev) {
> > +	struct rzg2l_mipi_dsi *dsi =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D reset_control_deassert(dsi->arstc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D reset_control_deassert(dsi->prstc);
> > +	if (ret < 0)
> > +		reset_control_assert(dsi->arstc);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops rzg2l_mipi_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(rzg2l_mipi_pm_runtime_suspend,
> > +rzg2l_mipi_pm_runtime_resume, NULL) };
> > +
> > +/*
> > +-------------------------------------------------------------------
> --
> > +--------
> > + * Probe & Remove
> > + */
> > +
> > +static int rzg2l_mipi_dsi_probe(struct platform_device *pdev) {
> > +	struct rzg2l_mipi_dsi *dsi;
> > +	int ret;
> > +
> > +	dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> > +	if (!dsi)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, dsi);
> > +	dsi->dev =3D &pdev->dev;
> > +
> > +	ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1,
> 4);
> > +	if (ret < 0)
> > +		return dev_err_probe(dsi->dev, ret,
> > +				     "missing or invalid data-lanes
> property\n");
> > +
> > +	dsi->num_data_lanes =3D ret;
> > +
> > +	dsi->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(dsi->mmio))
> > +		return PTR_ERR(dsi->mmio);
> > +
> > +	dsi->vclk =3D devm_clk_get(dsi->dev, "vclk");
> > +	if (IS_ERR(dsi->vclk))
> > +		return PTR_ERR(dsi->vclk);
> > +
> > +	dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> > +	if (IS_ERR(dsi->rstc))
> > +		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> > +				     "failed to get rst\n");
> > +
> > +	dsi->arstc =3D devm_reset_control_get_exclusive(dsi->dev, "arst");
> > +	if (IS_ERR(dsi->arstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dsi->arstc),
> > +				     "failed to get arst\n");
> > +
> > +	dsi->prstc =3D devm_reset_control_get_exclusive(dsi->dev, "prst");
> > +	if (IS_ERR(dsi->prstc))
> > +		return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
> > +				     "failed to get prst\n");
> > +
> > +	platform_set_drvdata(pdev, dsi);
> > +
> > +	pm_runtime_enable(dsi->dev);
> > +
> > +	/* Initialize the DRM bridge. */
> > +	dsi->bridge.funcs =3D &rzg2l_mipi_dsi_bridge_ops;
> > +	dsi->bridge.of_node =3D dsi->dev->of_node;
> > +
> > +	/* Init host device */
> > +	dsi->host.dev =3D dsi->dev;
> > +	dsi->host.ops =3D &rzg2l_mipi_dsi_host_ops;
> > +	ret =3D mipi_dsi_host_register(&dsi->host);
> > +	if (ret < 0)
> > +		goto out_pm_disable;
> > +
> > +	return 0;
> > +
> > +out_pm_disable:
> > +	pm_runtime_disable(dsi->dev);
> > +	return ret;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_remove(struct platform_device *pdev) {
> > +	struct rzg2l_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
> > +
> > +	mipi_dsi_host_unregister(&dsi->host);
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> > +	{ .compatible =3D "renesas,rzg2l-mipi-dsi" },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, rzg2l_mipi_dsi_of_table);
> > +
> > +static struct platform_driver rzg2l_mipi_dsi_platform_driver =3D {
> > +	.probe	=3D rzg2l_mipi_dsi_probe,
> > +	.remove	=3D rzg2l_mipi_dsi_remove,
> > +	.driver	=3D {
> > +		.name =3D "rzg2l-mipi-dsi",
> > +		.pm =3D &rzg2l_mipi_pm_ops,
> > +		.of_match_table =3D rzg2l_mipi_dsi_of_table,
> > +	},
> > +};
> > +
> > +module_platform_driver(rzg2l_mipi_dsi_platform_driver);
> > +
> > +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> > +MODULE_DESCRIPTION("Renesas RZ/G2L MIPI DSI Encoder Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > new file mode 100644
> > index 000000000000..1dbc16ec64a4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > @@ -0,0 +1,151 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RZ/G2L MIPI DSI Interface Registers Definitions
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation  */
> > +
> > +#ifndef __RZG2L_MIPI_DSI_REGS_H__
> > +#define __RZG2L_MIPI_DSI_REGS_H__
> > +
> > +#include <linux/bits.h>
> > +
> > +/* DPHY Registers */
> > +#define DSIDPHYCTRL0			0x00
> > +#define DSIDPHYCTRL0_CAL_EN_HSRX_OFS	BIT(16)
> > +#define DSIDPHYCTRL0_CMN_MASTER_EN	BIT(8)
> > +#define DSIDPHYCTRL0_RE_VDD_DETVCCQLV18	BIT(2)
> > +#define DSIDPHYCTRL0_EN_LDO1200		BIT(1)
> > +#define DSIDPHYCTRL0_EN_BGR		BIT(0)
> > +
> > +#define DSIDPHYTIM0			0x04
> > +#define DSIDPHYTIM0_TCLK_MISS(x)	((x) << 24)
> > +#define DSIDPHYTIM0_T_INIT(x)		((x) << 0)
> > +
> > +#define DSIDPHYTIM1			0x08
> > +#define DSIDPHYTIM1_THS_PREPARE(x)	((x) << 24)
> > +#define DSIDPHYTIM1_TCLK_PREPARE(x)	((x) << 16)
> > +#define DSIDPHYTIM1_THS_SETTLE(x)	((x) << 8)
> > +#define DSIDPHYTIM1_TCLK_SETTLE(x)	((x) << 0)
> > +
> > +#define DSIDPHYTIM2			0x0c
> > +#define DSIDPHYTIM2_TCLK_TRAIL(x)	((x) << 24)
> > +#define DSIDPHYTIM2_TCLK_POST(x)	((x) << 16)
> > +#define DSIDPHYTIM2_TCLK_PRE(x)		((x) << 8)
> > +#define DSIDPHYTIM2_TCLK_ZERO(x)	((x) << 0)
> > +
> > +#define DSIDPHYTIM3			0x10
> > +#define DSIDPHYTIM3_TLPX(x)		((x) << 24)
> > +#define DSIDPHYTIM3_THS_EXIT(x)		((x) << 16)
> > +#define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
> > +#define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
> > +
> > +/* --------------------------------------------------------*/
> > +/* Link Registers */
> > +#define LINK_REG_OFFSET			0x10000
> > +
> > +/* Link Status Register */
> > +#define LINKSR				0x10
> > +#define LINKSR_LPBUSY			BIT(13)
> > +#define LINKSR_HSBUSY			BIT(12)
> > +#define LINKSR_VICHRUN1			BIT(8)
> > +#define LINKSR_SQCHRUN1			BIT(4)
> > +#define LINKSR_SQCHRUN0			BIT(0)
> > +
> > +/* Tx Set Register */
> > +#define TXSETR				0x100
> > +#define TXSETR_NUMLANECAP		(0x3 << 16)
> > +#define TXSETR_DLEN			(1 << 9)
> > +#define TXSETR_CLEN			(1 << 8)
> > +#define TXSETR_NUMLANEUSE(x)		(((x) & 0x3) << 0)
> > +
> > +/* HS Clock Set Register */
> > +#define HSCLKSETR			0x104
> > +#define HSCLKSETR_HSCLKMODE_CONT	(1 << 1)
> > +#define HSCLKSETR_HSCLKMODE_NON_CONT	(0 << 1)
> > +#define HSCLKSETR_HSCLKRUN_HS		(1 << 0)
> > +#define HSCLKSETR_HSCLKRUN_LP		(0 << 0)
> > +
> > +/* Reset Control Register */
> > +#define RSTCR				0x110
> > +#define RSTCR_SWRST			BIT(0)
> > +#define RSTCR_FCETXSTP			BIT(16)
> > +
> > +/* Reset Status Register */
> > +#define RSTSR				0x114
> > +#define RSTSR_DL0DIR			(1 << 15)
> > +#define RSTSR_DLSTPST			(0xf << 8)
> > +#define RSTSR_SWRSTV1			(1 << 4)
> > +#define RSTSR_SWRSTIB			(1 << 3)
> > +#define RSTSR_SWRSTAPB			(1 << 2)
> > +#define RSTSR_SWRSTLP			(1 << 1)
> > +#define RSTSR_SWRSTHS			(1 << 0)
> > +
> > +/* Clock Lane Stop Time Set Register */
> > +#define CLSTPTSETR			0x314
> > +#define CLSTPTSETR_CLKKPT(x)		((x) << 24)
> > +#define CLSTPTSETR_CLKBFHT(x)		((x) << 16)
> > +#define CLSTPTSETR_CLKSTPT(x)		((x) << 2)
> > +
> > +/* LP Transition Time Set Register */
> > +#define LPTRNSTSETR			0x318
> > +#define LPTRNSTSETR_GOLPBKT(x)		((x) << 0)
> > +
> > +/* Physical Lane Status Register */
> > +#define PLSR				0x320
> > +#define PLSR_CLHS2LP			BIT(27)
> > +#define PLSR_CLLP2HS			BIT(26)
> > +
> > +/* Video-Input Channel 1 Set 0 Register */
> > +#define VICH1SET0R			0x400
> > +#define VICH1SET0R_VSEN			BIT(12)
> > +#define VICH1SET0R_HFPNOLP		BIT(10)
> > +#define VICH1SET0R_HBPNOLP		BIT(9)
> > +#define VICH1SET0R_HSANOLP		BIT(8)
> > +#define VICH1SET0R_VSTPAFT		BIT(1)
> > +#define VICH1SET0R_VSTART		BIT(0)
> > +
> > +/* Video-Input Channel 1 Set 1 Register */
> > +#define VICH1SET1R			0x404
> > +#define VICH1SET1R_DLY(x)		(((x) & 0xfff) << 2)
> > +
> > +/* Video-Input Channel 1 Status Register */
> > +#define VICH1SR				0x410
> > +#define VICH1SR_VIRDY			BIT(3)
> > +#define VICH1SR_RUNNING			BIT(2)
> > +#define VICH1SR_STOP			BIT(1)
> > +#define VICH1SR_START			BIT(0)
> > +
> > +/* Video-Input Channel 1 Pixel Packet Set Register */
> > +#define VICH1PPSETR			0x420
> > +#define VICH1PPSETR_DT_RGB18		(0x1e << 16)
> > +#define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
> > +#define VICH1PPSETR_DT_RGB24		(0x3e << 16)
> > +#define VICH1PPSETR_TXESYNC_PULSE	(1 << 15)
> > +#define VICH1PPSETR_VC(x)		((x) << 22)
> > +
> > +/* Video-Input Channel 1 Vertical Size Set Register */
> > +#define VICH1VSSETR			0x428
> > +#define VICH1VSSETR_VACTIVE(x)		(((x) & 0x7fff) << 16)
> > +#define VICH1VSSETR_VSPOL_LOW		(1 << 15)
> > +#define VICH1VSSETR_VSPOL_HIGH		(0 << 15)
> > +#define VICH1VSSETR_VSA(x)		(((x) & 0xfff) << 0)
> > +
> > +/* Video-Input Channel 1 Vertical Porch Set Register */
> > +#define VICH1VPSETR			0x42c
> > +#define VICH1VPSETR_VFP(x)		(((x) & 0x1fff) << 16)
> > +#define VICH1VPSETR_VBP(x)		(((x) & 0x1fff) << 0)
> > +
> > +/* Video-Input Channel 1 Horizontal Size Set Register */
> > +#define VICH1HSSETR			0x430
> > +#define VICH1HSSETR_HACTIVE(x)		(((x) & 0x7fff) << 16)
> > +#define VICH1HSSETR_HSPOL_LOW		(1 << 15)
> > +#define VICH1HSSETR_HSPOL_HIGH		(0 << 15)
> > +#define VICH1HSSETR_HSA(x)		(((x) & 0xfff) << 0)
> > +
> > +/* Video-Input Channel 1 Horizontal Porch Set Register */
> > +#define VICH1HPSETR			0x434
> > +#define VICH1HPSETR_HFP(x)		(((x) & 0x1fff) << 16)
> > +#define VICH1HPSETR_HBP(x)		(((x) & 0x1fff) << 0)
> > +
> > +#endif /* __RZG2L_MIPI_DSI_REGS_H__ */
>=20
> --
> Regards,
>=20
> Laurent Pinchart
