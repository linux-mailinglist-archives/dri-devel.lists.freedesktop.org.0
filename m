Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACC209B82
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 10:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACEC6E290;
	Thu, 25 Jun 2020 08:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DFA6E290
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 08:50:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahWGfLI+APi6ezOlM+dnMaydykCtZI0B3HhS1+PhesCbALCx4AkrkRwV98S4DBLiS7JuvFKwm85/+Z02m8YHtwXnWHU37G95k7wnjQJyPLiSvXkPj6bM4EHtYUs2/KHaWCzJETc5H9IyYB3AaTOy0aVb+k9aqOj+0fJAHeX5Ghm56hgfo0AzltW1NrDBZFRg6vnlqqwK/18RhxZ7z2eR54X9Bah9JvG0uMGwnanLnveptcwCUJWX8hAVUd0ys33Bzi7ysMv+AQwcpKxgVwgEtD2iM/j9a6C49FF4/qpYQYrBJN61Yn0gz7icten6bnGsQX8Z+A/z0miH3hgOZsNyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Krchh6CUTk69GpRX+8cWpJKFcq4Yt6lqIfjV/aTOdrQ=;
 b=DfOgT1qotPFN3nNnStTIzojOPmn4Ibg6oHP3HP7H/bIAmkXROY+yzqCt3RxruSGso84VbOLolLwdYdIBGygEX9x1DK89Je1Py6XATa+SvFeDeYcR2kbQG/uyaYUFZ97dhKKTGMGM6M22OzjiazyV7CpWHKr5ZiCQap7N2AqfcOwYzMdnFi50+SAuSsbTvQWxZyTgZaUgDjNqEx2cO+QpSR+qh5IDnQzyZL0WV4DydUS5S4mxrVAsee1I6xFDOtA8oQg95MEVStgINKgrwmh7sHN52WuAflixmo84Nze5h9WJ+q0y+cfymCgh3rTHggEH7NPY/B+lk8SqG1H+fa7tzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Krchh6CUTk69GpRX+8cWpJKFcq4Yt6lqIfjV/aTOdrQ=;
 b=D4In2xZ6V69/1eQXSAJZIqlHCag5QW3wvn49MQkgdTY8fbogaZixETudis1KpSb78UIVkhw5VKtTL5tG8kmEDB8jKIZU+RP/Yy0cQvOD8f9cxoVLofEOZJIi0msXMkgAqozfg9BlI1hcfuP+noYX70gCgUB7ZX9lU0CpXDof6j8=
Authentication-Results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4045.eurprd04.prod.outlook.com (2603:10a6:803:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 25 Jun
 2020 08:50:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3131.023; Thu, 25 Jun 2020
 08:50:08 +0000
Message-ID: <a44094302002ab99a0b524dc87132198433d2c10.camel@oss.nxp.com>
Subject: Re: [PATCH 00/27] Converter R-Car DU to the DRM bridge connector
 helper
From: Liu Ying <victor.liu@oss.nxp.com>
To: Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>
Date: Thu, 25 Jun 2020 16:48:01 +0800
In-Reply-To: <20200623185522.GA1795323@ravnborg.org>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200623185522.GA1795323@ravnborg.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-ClientProxiedBy: HK2PR02CA0213.apcprd02.prod.outlook.com
 (2603:1096:201:20::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vbox (183.232.44.32) by HK2PR02CA0213.apcprd02.prod.outlook.com
 (2603:1096:201:20::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Thu, 25 Jun 2020 08:50:03 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-Originating-IP: [183.232.44.32]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ccce2f39-709d-4c4d-c6fa-08d818e4c233
X-MS-TrafficTypeDiagnostic: VI1PR04MB4045:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4045FC2803941575705133F7D9920@VI1PR04MB4045.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrM70wqJBEtqCyQJKPHUR+Eh269kc0jYJkeNXl0EDl7HPL6Utm6iHeGz5491NPAfSwbu46tDTzDTX1KnsA7HLHSg15CKXXuMdp6aJnjEU6Ln7i9Ls5ybeOLMbg1NHQO1ieCnpFbJ50pc6bm8T8Nda1okBhBApVvWPpEMpzC7wZgCK63IXQm0sv8QlkQikswdnxvqb+WCmHQTgZ290UniOgTRen4Kd9/BtcoGbbmHa+sxFlScz9C4MV8cvdGBi2BY63vPkkeLW7FanD2F+mhvSPSUamHSbVCKqmBm2xWqmXpg82UzgrdSUNC/4uVhyyhKJWi7E81a0Xa3/r2OcS0zEyzg2WmLcD//pJ7TTrMkGEpFKbCV3IKS1sGcUTAQMKsm1J+UE6nudtqEYB8NYdfRvslVfGcZIBzimWkfS4Yo0k03VNRLszd/Md8lMG77dS6RsTvcNJL+WsCTHqVRTwbEkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(6496006)(26005)(8676002)(966005)(52116002)(66556008)(5660300002)(478600001)(66476007)(86362001)(4326008)(316002)(66946007)(54906003)(110136005)(6486002)(186003)(8936002)(83380400001)(2906002)(2616005)(956004)(16526019)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +JABHj87y4RVk21MUV3zyT3DKZ9B3hm9sFS4gVRsY6HGAlJpZGA9TsmYWfZLrhiRuWnbMN/7M5hk57wQ2OTxi4uOFiD+tnyiyCyLxbH9AcNGAScpMFqczCFPtbqXvDZZutoa8L6KC2Pg8axOwLXzeNalzmYprgovNVjQ0EIUL+XANsK7DvV432t0J9syPQx5wwKtHe1boyxjwbPy9nik0mXB7mIrILIbCmM5Ogkfwd7s5joKjsGfbzeg0L50JdXDBnUkXpqhbZTQ04FKNUZlhcrLlLTy8GoFuVfQ3VFMtU0UeQVHgAVBxLrtdmbLTEUM8GWOQh16hdvd3curOgxgSukOyyAvcx3fwt12y28MSVFd80orLrmPkOIpXoqX9Ak22fwowKSk8+C4dgrrfzZOPUACZ14EVp7XdWM9pY+GHsFCdrAMPOcGwFG5QKCJBTN5X9Noo5YHaMvxcMORWbOEFFQNVA0n6hpaK5wa90vYI9E=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccce2f39-709d-4c4d-c6fa-08d818e4c233
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 08:50:07.9778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNpGlW98Zj0xlj2H/XcRb1Nw5wdsn4gIbOY7d8d47f1XS3jAYP9tWrW9RDrbNZ2Ryzf0TYNn+vYOtlCxwDwHLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4045
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Tue, 2020-06-23 at 20:55 +0200, Sam Ravnborg wrote:
> Hi Laurent.
> 
> On Tue, May 26, 2020 at 04:14:38AM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series converts the R-Car DU driver to use the DRM
> > bridge
> > connector helper drm_bridge_connector_init().
> > 
> > The bulk of the series is conversion of the adv7511, simple-bridge,
> > rcar-lbds and dw-hdmi drivers to make connector creation optional
> > (through the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag).
> > 
> > The series starts with the adv7511 driver, previously posted as
> > "[PATCH
> > 0/4] drm: bridge: adv7511: Enable usage with DRM bridge connector
> > helper" ([1]). Patches 01/27 to 04/27 incorporate all the received
> > review comments.
> > 
> > The next three patches address the simple-bridge driver, previously
> > posted as "[PATCH 0/2] drm: bridge: simple-bridge: Enable usage
> > with DRM
> > bridge connector helper". Patch 05/27 is an additional fix that
> > stems
> > from the review, and patches 06/27 and 07/27 incorporate all the
> > received review comments.
> > 
> > Patch 08/27 is a new patch that addresses the rcar-lvds driver.
> > Instead
> > of implementing direct support for DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> > it
> > simply removes code that shouldn't have been in the driver in the
> > first
> > place by switching to the panel bridge helper.
> > 
> > Patches 09/27 to 22/27 then address the dw-hdmi driver. That's a
> > more
> > sizeable rework, due to the fact that the driver implements a mid-
> > layer
> > for platform-specific glue, with the internal drm_connector being
> > used
> > throughout the whole code. There's no rocket science there, but
> > patch
> > 10/27 should be noted for adding a new argument to the
> > drm_bridge_funcs.mode_valid() function. Please see individual
> > patches
> > for details.
> > 
> > Patch 23/27 adds support to the dw-hdmi driver to attach to a
> > downstream
> > bridge if one is specified in DT. As the DT port number
> > corresponding to
> > the video output differs between platforms that integrate the dw-
> > hdmi
> > (some of them even don't have a video output port, which should
> > probably
> > be fixed, but that's out of scope for this series), the port number
> > has
> > to be specified by the platform glue layer. Patch 24/27 does so for
> > the
> > R-Car dw-hdmi driver.
> > 
> > Patch 25/27 is a drive-by fix for an error path issue in the rcar-
> > du
> > driver. Patch 26/27 finally makes use of the
> > drm_bridge_connector_init()
> > helper.
> > 
> > Unfortunately, this breaks the VGA output on R-Car Gen3 platforms.
> > On
> > those platforms, the VGA DDC lines are not connected, and there is
> > no
> > mean for software to detect the VGA output connection status. When
> > the
> > simple-bridge driver creates a connector, it automatically adds
> > default
> > modes when no DDC is available. This behavious is also present int
> > the
> > DRM probe helper drm_helper_probe_single_connector_modes(), but
> > only
> > when the connector status is connector_status_connected. As the
> > driver
> > (rightfully) reports connector_status_unconnected, no modes are
> > added.
> > Patch 27/27 fixes this issue by extending addition of default modes
> > in
> > drm_helper_probe_single_connector_modes() when the output status is
> > unknown. An alternative approach would be to implement this
> > behaviour in
> > the bridge connector helper (drm_bridge_connector.c).
> > 
> > All the modified drivers have been compile-tested, and the series
> > has
> > been tested on a Renesas R-Car Salvator-XS board with the VGA, HDMI
> > and
> > LVDS outputs.
> > 
> > [1] 
> > https://lore.kernel.org/dri-devel/20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com/
> > [2] 
> > https://lore.kernel.org/dri-devel/20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com/
> 
> As we briefly discussed on IRC the first 21 patches are now applied
> to
> drm-misc-next.

I see patch '[22/27] drm: bridge: dw-hdmi: Make connector creation
optional' is applied to drm-misc-next.
That patch would introduce an uninitialized mutex accessing issue as I
mentioned in the patch[1]. And, the patch intends to fix the issue in
the first place.

[1] https://patchwork.freedesktop.org/patch/370560/


Regards,
Liu Ying

> The rcar-du specific patches was left out and the last patch was
> likewise not applied in this round- mostly because it was the coming
> after several rcar-du patches and I was not sure if there was some
> dependencies to consider.
> 
> With this set in we have more examples in the tree how to do proper
> bridges which is good.
> 
> While applying the new r-bs was ofc added.
> 
> 	Sam
> 
> > 
> > Laurent Pinchart (27):
> >   drm: bridge: adv7511: Split EDID read to a separate function
> >   drm: bridge: adv7511: Split connector creation to a separate
> > function
> >   drm: bridge: adv7511: Implement bridge connector operations
> >   drm: bridge: adv7511: Make connector creation optional
> >   drm: bridge: Return NULL on error from drm_bridge_get_edid()
> >   drm: bridge: simple-bridge: Delegate operations to next bridge
> >   drm: bridge: simple-bridge: Make connector creation optional
> >   drm: rcar-du: lvds: Convert to DRM panel bridge helper
> >   drm: edid: Constify connector argument to infoframe functions
> >   drm: bridge: Pass drm_display_info to drm_bridge_funcs
> > .mode_valid()
> >   drm: bridge: dw-hdmi: Pass private data pointer to .mode_valid()
> >   drm: bridge: dw-hdmi: Pass private data pointer to
> > .configure_phy()
> >   drm: bridge: dw-hdmi: Remove unused field from dw_hdmi_plat_data
> >   drm: meson: dw-hdmi: Use dw_hdmi context to replace hack
> >   drm: bridge: dw-hdmi: Pass drm_display_info to .mode_valid()
> >   drm: bridge: dw-hdmi: Constify mode argument to dw_hdmi_phy_ops
> >     .init()
> >   drm: bridge: dw-hdmi: Constify mode argument to internal
> > functions
> >   drm: bridge: dw-hdmi: Pass drm_display_info to
> > dw_hdmi_support_scdc()
> >   drm: bridge: dw-hdmi: Split connector creation to a separate
> > function
> >   drm: bridge: dw-hdmi: Store current connector in struct dw_hdmi
> >   drm: bridge: dw-hdmi: Pass drm_connector to internal functions as
> >     needed
> >   drm: bridge: dw-hdmi: Make connector creation optional
> >   drm: bridge: dw-hdmi: Attach to next bridge if available
> >   drm: rcar-du: dw-hdmi: Set output port number
> >   drm: rcar-du: Fix error handling in rcar_du_encoder_init()
> >   drm: rcar-du: Use drm_bridge_connector_init() helper
> >   drm: Add default modes for connectors in unknown state
> > 
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  | 159 +++++---
> >  .../drm/bridge/analogix/analogix-anx6345.c    |   1 +
> >  .../drm/bridge/analogix/analogix-anx78xx.c    |   1 +
> >  drivers/gpu/drm/bridge/cdns-dsi.c             |   1 +
> >  drivers/gpu/drm/bridge/chrontel-ch7033.c      |   1 +
> >  drivers/gpu/drm/bridge/nwl-dsi.c              |   1 +
> >  drivers/gpu/drm/bridge/sii9234.c              |   1 +
> >  drivers/gpu/drm/bridge/sil-sii8620.c          |   1 +
> >  drivers/gpu/drm/bridge/simple-bridge.c        | 113 +++---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 357 ++++++++++++
> > ------
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |   1 +
> >  drivers/gpu/drm/bridge/tc358767.c             |   1 +
> >  drivers/gpu/drm/bridge/tc358768.c             |   1 +
> >  drivers/gpu/drm/bridge/thc63lvd1024.c         |   1 +
> >  drivers/gpu/drm/bridge/ti-tfp410.c            |  11 +-
> >  drivers/gpu/drm/drm_atomic_helper.c           |   3 +-
> >  drivers/gpu/drm/drm_bridge.c                  |  10 +-
> >  drivers/gpu/drm/drm_edid.c                    |  12 +-
> >  drivers/gpu/drm/drm_probe_helper.c            |   7 +-
> >  drivers/gpu/drm/i2c/tda998x_drv.c             |   1 +
> >  drivers/gpu/drm/imx/dw_hdmi-imx.c             |   6 +-
> >  drivers/gpu/drm/meson/meson_dw_hdmi.c         |  34 +-
> >  drivers/gpu/drm/omapdrm/dss/dpi.c             |   1 +
> >  drivers/gpu/drm/omapdrm/dss/sdi.c             |   1 +
> >  drivers/gpu/drm/omapdrm/dss/venc.c            |   1 +
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  26 +-
> >  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c        |   7 +-
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           | 124 +-----
> >  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |   6 +-
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |   6 +-
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |   3 +-
> >  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        |   3 +-
> >  include/drm/bridge/dw_hdmi.h                  |  28 +-
> >  include/drm/drm_bridge.h                      |   3 +
> >  include/drm/drm_edid.h                        |   6 +-
> >  include/drm/drm_modeset_helper_vtables.h      |   8 +-
> >  36 files changed, 541 insertions(+), 406 deletions(-)
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
