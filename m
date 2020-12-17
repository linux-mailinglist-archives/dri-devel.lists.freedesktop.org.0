Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47272DDF93
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044E989994;
	Fri, 18 Dec 2020 08:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150085.outbound.protection.outlook.com [40.107.15.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F8A6E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Smx2yu9+J7GBn7MBVPEqfHhZrzaBpGj+ZDz3WRyijbfSXDkcF6mIYWj0/wennWVJsYF/CSNQFwCnlEwTIWO+yDbOzed5G0JEFexMUiJG9bnL28EFFHh/4WA6F4BYUfDgeO+Unv3Fyrt5YqoJUOqukBL6yrLNgcR4xlkDXCbcXWGX7Wm5jMajHtXdpV8jtEHQ//EajiRe6efbZ0DVFDCfUyJD4UOaOTHXgv7IaoFYChd+cW4rrW8xrzyBXgYo7gHMOfzUquxCZNLKns8sJ/mi3Fv7bNonKWsp8cJh1avkIcGFJxJ7CQmBuBhziF1hvrOzUkImkThw1XQVH0XWukrMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzKolXi9qw3ZoHNjHBWPEzanckTPknfoKyOK+LEC9Ro=;
 b=Lf4PIvIZaSfM+GCwxP4UPQFXtHNTie3YKMdE6j1t5BPfGKUrnZ2VkpSxrDFxi9kGss6Se+04Uc9oQuaNnSC5xUgQ7y94F2FO5ZRccrLHEkuJts6gVkN3jZIpckasi91Q+gsf1ebFR54GJrrPY6pApcsjjUfc6UEtHRynbH7YFfQxKowBNhyk+VmWulHMkDTeUAAf+Uo6gtUDdPrq2B9M81yg6PXG9U6sP4UKRLPuJ6c4nbdCiMq/Hy9X+pSWA3qrKx4zkf6a7V1rsCF4aFxSRYOEJGbnsn0LetvNsTeNRla6TB9ywuHcz/DcLlIfXztrIsZbuJQYYjlF4bmDagozMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzKolXi9qw3ZoHNjHBWPEzanckTPknfoKyOK+LEC9Ro=;
 b=Wep6mJhzPzxSz0w+XxmVkT6ILSEY9pdxrfP910UoW05MAN+Mohb9L9yoKKYkyuKMhKS/mNYzHftGXibVJ2W43HtaUxoQmKTQvey4bEY24y9F5yYb+YDwistTsGohmot/k86Vl65Tlkus+upt6Z8VpgAGtB7h7En0VcjF/t7FKYY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:08:20 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:08:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp SoCs
Date: Thu, 17 Dec 2020 17:59:19 +0800
Message-Id: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:08:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b18318c4-05a9-4bdc-39a9-08d8a273ae40
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73120744548B4F764271F48B98C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zi6jzezgWsUjht6tYpLhdOMU8t65VXdvNQu/Jcx5BrSMwVePtXhFidIPm6kBhHr3ukrprjOOAMCbU4vPphgjihy+qwFOnZxLtU+HNLiHmcH4pmpCnw4FFvMRR0HD8E3s9IMG9MzYRt/MW4qMu0A5ik082npTcBNccabaUAqyW6QT9aTf8rCKGkFQtmid+97NPuDThaoawoFJD6ImU8kT+TucuwUGMOcVjNTLrSyudngofLDJWppfgmY1uymY+B5JD5fDK2CvfUWQvjifUDHzTeI0XWTKPRnajBCbJWFv5OM27IU9hDrwt7WfosHDVvk18ATu5AxmrKMy0Wto7Kv+6oHzQuCAsLi4IiefYuo/7i9SGwAkze73iaJ/zJyzFx6pKivbtR++DBO1v/m6ca4+CZVvmUUo5E/efQJgHXgfU9zvhgHo6sauCNZQF1Y5gWuKFC7+ddRwawqFeuqbS8Pmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(83380400001)(966005)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?86BKOxhJvCCQrk05/SBHWJChuKWIyJocIEGBfk5C/Z39nxsVR2JBWk9HlIMM?=
 =?us-ascii?Q?sJeaNmdo4FgRf+iVvkUc4AF0F6JML3XnYrcy6z0gl41s334uohn0uZy93stj?=
 =?us-ascii?Q?vmm6T3cWnwdhC9jTbjbCLRtUVrXVTyqUEnnU34W9TcTGX5DJ+nGKdJmK3S72?=
 =?us-ascii?Q?uZ9w2sB2t/fGcsaGcZ8J/R3vVK+3C1SzrZrkPcmg2DYcaBvLKLFXkiJGtcVi?=
 =?us-ascii?Q?2rf/awXhFxIE4XSDxn6Zj1UMRpem6cp9DJUfXi/ePx+/SWKqGOCl4TTj/Jiq?=
 =?us-ascii?Q?x8WKIgNwtb6VE5HgCEZE1asHvY/J8ewIe9j6ToWyfcGVyd4SRUIq4TUEDGlE?=
 =?us-ascii?Q?Rdql12L4MBAXaI1tGp5e8cPzCJO7p9tzQ8xhwqDDxnMuxLfn0qNq0bLYi5Ak?=
 =?us-ascii?Q?CQ4AQBCJc5mmH6iaYsVvrN3CJgI8ZbpH9ia3XkQFQbrPqUcIwuxQOZcLjIv/?=
 =?us-ascii?Q?8j613BYFEm5EIWzvrVfrTbkisioz4cDqn3JVwhntV99xm5goL9lyIxQo3kMK?=
 =?us-ascii?Q?kBBTaHTLX6rterR+57Fa1fVocKBxl+60tfpLmezB5qOhj8DesRwElmXyAF5w?=
 =?us-ascii?Q?QZdcOMbHWhYEMwqkAOoOBOgUMnGXChm7ubN1jJsGuZpr7Cf4dcmld1iYKD/j?=
 =?us-ascii?Q?ZdWYUhuS2XqzpSgMJ1z83nDvT0A2Q41Hba6BVbUYMNWdHxuOeFZQhQ+XZQz9?=
 =?us-ascii?Q?+LdYEwBCq1r7f0SdVq64kk6KIR9x75uXpHL+eWlXUVEucOgKLaVknwuwgGAZ?=
 =?us-ascii?Q?n+5kJmR7HlXTZdvdi1eWUFjVHzBZwmA5YkqpL+ZBnD7CMcS3hQD83J8B3kRm?=
 =?us-ascii?Q?5RfbijPUYNBrGCriev28FwZP1iROIqt+8/+/A2GA3dzg1sBYqjpda8Vici5E?=
 =?us-ascii?Q?hIWuU7fc7S47MjaVHoldUcqbOhkAnherGP1CjvYsi92Jd9/SQRALK7JbNTbW?=
 =?us-ascii?Q?NNp1e4iDK0ZDqkBVdWmp33efHYiQw77DBcTO9M2ExvPOjTR6E12r8tsytZs1?=
 =?us-ascii?Q?HUJM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:08:20.0039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b18318c4-05a9-4bdc-39a9-08d8a273ae40
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1g4ZDiTmuN5kXGRlkI0WHD2rgYePBCOC+UO2tzI5uDBnAkZv03ifLwlR8emzib/cqn1+wf4iP8OINJhBe/1Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds some DRM bridge drivers support for i.MX8qm/qxp SoCs.

The bridges may chain one by one to form display pipes to support
LVDS displays.  The relevant display controller is DPU embedded in
i.MX8qm/qxp SoCs.

The DPU KMS driver can be found at:
https://www.spinics.net/lists/arm-kernel/msg862106.html

This series supports the following display pipes:
1) i.MX8qxp:
prefetch eng -> DPU -> pixel combiner -> pixel link ->
pixel link to DPI(PXL2DPI) -> LVDS display bridge(LDB)

2) i.MX8qm:
prefetch eng -> DPU -> pixel combiner -> pixel link -> LVDS display bridge(LDB)


Patch 1/14 adds LVDS PHY configuration options, which has already been sent
with the following series to add Mixel combo PHY found in i.MX8qxp:
https://www.spinics.net/lists/arm-kernel/msg862560.html

Patch 2/14 and 3/14 add bus formats used by PXL2DPI.

Patch 4/14 ~ 13/14 add drm bridge drivers and dt-bindings support for the bridges.

Patch 14/14 updates MAINTAINERS.


I've tested this series with a koe,tx26d202vm0bwa dual link LVDS panel and
a LVDS to HDMI bridge(with a downstream drm bridge driver).


Welcome comments, thanks.

Liu Ying (14):
  phy: Add LVDS configuration options
  media: uapi: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
  media: docs: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
  dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding
  drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
  dt-bindings: display: bridge: Add i.MX8qm/qxp display pixel link
    binding
  drm/bridge: imx: Add i.MX8qm/qxp display pixel link support
  dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
  drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
  drm/bridge: imx: Add LDB driver helper support
  dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge
    binding
  drm/bridge: imx: Add LDB support for i.MX8qxp
  drm/bridge: imx: Add LDB support for i.MX8qm
  MAINTAINERS: add maintainer for DRM bridge drivers for i.MX SoCs

 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 185 +++++
 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++
 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 128 ++++
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 134 ++++
 .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++
 MAINTAINERS                                        |  10 +
 drivers/gpu/drm/bridge/Kconfig                     |   2 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |  52 ++
 drivers/gpu/drm/bridge/imx/Makefile                |   6 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        | 248 +++++++
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            | 589 ++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           | 762 +++++++++++++++++++++
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 452 ++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 411 +++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       | 494 +++++++++++++
 include/drm/bridge/imx_ldb_helper.h                |  98 +++
 include/linux/phy/phy-lvds.h                       |  48 ++
 include/linux/phy/phy.h                            |   4 +
 include/uapi/linux/media-bus-format.h              |   6 +-
 20 files changed, 3945 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
 create mode 100644 include/drm/bridge/imx_ldb_helper.h
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
