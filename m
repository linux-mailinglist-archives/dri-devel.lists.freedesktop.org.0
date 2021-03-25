Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3935348C6D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FE26EB81;
	Thu, 25 Mar 2021 09:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743F6EB81
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS9KfxWICujeZbwPBONf+t6nZGPR34gH9Yc3al3bVeKlpgjb6mxb7ACYdQeQRd/hJonAT3DcSdJB/+SRuqOYnjeV/c+J7Hz0fh5912qeGNjft4aWVcsNZtglLVP0eLh1La+xYFmhkpaaSi6MyrT1z1pdgR8zPHTopCKofSNBS8AD/7ubzuJMQK3xJifKIBW/rYJmhZhmLfYDfy5VqHaWEj5ir0E6gdR/nIxBFrpA6Kl5s58xFevanarSL0ZahulVsmAL927D0utCpYbZu5KFEQmeMJY4W/BXNX2vnv2f5pLUM5hJfCJs+6q9bPtGhHX9BLYZS26w/6hNF+eLdMzhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruMk2lK0dyLF2YPXgjIMmcHuwgSAz6LJsghuIFeEitM=;
 b=agnduqyd6miWcK6ZyTTo3pzNgMCyKk3SIabVIijUssgl3y3qRBcINnnjHgVoDAWPoLU8i0OFd0TCG9srYVJoeRQQ9c4Vl8ARPd8EmDaAp9kGd2+29JqwiePa3gj/2rEyajJUFG3mUCespCyOpDygMM2D8QmU805S7q/mPiD7dqUnDbSZtyYeZe5Sn1rt/RlVtN/+Xdg6uKsOG8Kuk4Eb2bp49/E2gSbw8BDyRX2zsmHI0WD8t0Kdz/Pu70/u6xKa7bmKDL0Zb5jBF1u9ksq+/ASKp/y+Hbb+sa2j4Bik2tbT7rK8AXHscG1y5HxvBkym4oT/tdlQO62OaxqjHAoFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruMk2lK0dyLF2YPXgjIMmcHuwgSAz6LJsghuIFeEitM=;
 b=gl/TwzpI98p/QwYRmGxWKaQvyk73esc99xVa5cX/G1p/+gBkGEid9whDfZwUHVbbxl3OWK9JrZ9mqyygv8vyTvSQ8RNPv0YoRxSAdiFIQg9/szbVAYa8lXiVfSyYQtHpM0I7FE4T1O8oV/3i3O4ZNsFm65mHxaWlvor/H3g5Zhg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2976.eurprd04.prod.outlook.com (2603:10a6:802:8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 09:14:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 09:14:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
Date: Thu, 25 Mar 2021 17:00:27 +0800
Message-Id: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0164.apcprd02.prod.outlook.com (2603:1096:201:1f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 09:14:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f351a3ee-95d4-4c7c-2202-08d8ef6e6cf5
X-MS-TrafficTypeDiagnostic: VI1PR04MB2976:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297685848A298F94C2A6708698629@VI1PR04MB2976.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GS9S0QVpgYb4bS7Q+pX8tN9RtSAjch4nPOgZ8CzgD5Q84i60ylIL1R8DYxeNoTBtkxe4odi3C7xkchzaWj9nCTBirljsrhMZE7kOJ0iUiKmXeQt5pqVaYDnQCVoG0SBAItpJckLkIfO6UtuKMEWSBgn9VY9Ev7UTK8C009nslTSRnyuCj2Tdf0FBK4ObouK+6QF3l3XhJ7EWXPxM6OfnGy9hzO462rvbC9HbKlfS1v9fFvy9IyHhwYDKKN+IlUmt1vo+9vJHKcMnsdqsiGavzhEaG3MrirR6G8w4FZGYohUya6CVrlPA5X4oI0C9+bzsshkm40PJaacjPckm3zm1Wrv0zIMC4LnNZR6+CeH9ARIE99ZQrKw24oEpEHX/4wZjrDrljY6jI6f7xJ3qigx4BsjShFWa7c4xHW9YXbgW3tVQm9VbAR+3psFoqAnwyL5XG5Xd0ru9znV0ZXK9Rb+/McR8asT1u1kaCH0VFjvfn/PmcFi2zt9LiUlwZWgM425iYwhriYef/nMPwCcAC+rvjFc2sKDEW76VgONjzMgHhmaTFvKD6nxpZpZIqSwoVAllKjMK7Pdh8cUrUe/yeQerKJeqOEtWZ0y0GUSTr4aTKsgf89Z8upmWlLcB1HL35waWoaoU1L/N8xbZdDxM3eM46JWt2lYW/W2qlr6FFwPSvPeR/XJrRhCtswDXbjnfPEYE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(66556008)(86362001)(16526019)(26005)(316002)(7416002)(66476007)(5660300002)(186003)(6666004)(478600001)(956004)(2906002)(2616005)(6506007)(66946007)(38100700001)(8936002)(6512007)(6486002)(69590400012)(83380400001)(52116002)(8676002)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A9OV4ZdRHcxrp7vrw2ZQP2+C1Pgrq+5lhdWBtO3waVtQ3V2QLBG03aIXrBYx?=
 =?us-ascii?Q?TcHV9KEAbb3/E9/eyDRwR9xHuc3v4v66vTa0JjxjTCG0Jj+qhDQMC4MOutwE?=
 =?us-ascii?Q?iZ1zQLzdoFLfbbnOVjXdb5wtywqYQFLN+3kZe7QAl2Ca4dcmd0bzG7Joy+PW?=
 =?us-ascii?Q?8LjbAk1aMDOiJEkNtmYIUi6rsXNmnOhdihbDCdnlpERtalt0iUPFFSF2+dLD?=
 =?us-ascii?Q?TD0RrfEnTI9rqCzL/oCg8CZG0leAv2AR+3otBlAQuCGvlhk2KspHWdrpVULM?=
 =?us-ascii?Q?T7t4LBQpkk9xXF25b6s23L4jt45J7JWLx59Vg4kT4s9V206kI7un+xDW0u8m?=
 =?us-ascii?Q?/DoaMlS1mrrW6t9g1x3CZbT2sfAM9DyyFrdxVcXf3NzGS3L/p9uxziRdPuhw?=
 =?us-ascii?Q?GyM9wJI3witwz6WRN7wBeki4xlwj16pcbxG9Muc9Tt/0zOnkH9/1VrQTsFbr?=
 =?us-ascii?Q?wgnyTrtnd+m6uI8M7p9k/xysuqSNL7LyFNYGZ8TGC0S/YCY6kGG5V/YpcZzq?=
 =?us-ascii?Q?/wkOxrarawuhQgg6jPBfmP2pCCM7zYgMap/96M1AQ0i/2dsBgnvP0mUZ+Lfy?=
 =?us-ascii?Q?Vx3JvsSKwQ8msEjofDMb91Xw71UjRAeS2DJMcyXuaTevDQCjO9EIyc+mN8Yq?=
 =?us-ascii?Q?qmZC30Ny6Zd+3bNjztb98SD4jAEEwcl74p9+VAIVoKPHS5mYgFUw7wQaYasF?=
 =?us-ascii?Q?iszi6estmkMaSTqA2beMl7BcA2R+eE5tGG18oEnRqxGmziM/buUe7c0VKG4U?=
 =?us-ascii?Q?4pMVCnyFTeSah62J8sBd3oHWBSiEV8m9VGKCWRewYDILL6hM1bV2C8RlX01i?=
 =?us-ascii?Q?cRph1Vqt+7qKsr12X6h2EuOZqvDiW/ACSwo/EgRBvAWHLjl1AcoXhNKtEpX/?=
 =?us-ascii?Q?7ti/4MozbGOSKYgz/7fkE4rpy0V/uWF5TJMBU6kue40Ai1XBITuvqan6W0V0?=
 =?us-ascii?Q?lX0QI94ci1XJCxoR3dkwALctv9LaYbRXAJLwwhIxZobTOygfKu6v9semAS9H?=
 =?us-ascii?Q?mvfzTeGbEaJiNXpjgEsdako+IRtmu8NiEGeyjvngqvpcUatzxMqo9gU8mVCL?=
 =?us-ascii?Q?I9wYP6vfcq/v5hdZtEyzUpzkHv/yzU2nlDgpntoN3LcdnZenxl3TM24Pn8wu?=
 =?us-ascii?Q?tZyvOXezAEpDB72NkGXTyf3YEZkGS+L9kvcESAX+ULTczF0qFCdEpYeZH0lD?=
 =?us-ascii?Q?bo37orh0o1MlPBd9/w+GBmxLz0H6yGff7QW0YCSm6kr5LnOtqrPcmkVIZcZl?=
 =?us-ascii?Q?f3aUf2QNrYM9E34SOCG8oNn7Z9ivkFpWYLxg2N2EjPY5Y1qflrdeomGgVyoJ?=
 =?us-ascii?Q?jzZf2JF1F35bi71LghZtJlkG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f351a3ee-95d4-4c7c-2202-08d8ef6e6cf5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:14:43.2866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9elz4Zy8DcASONk5UIuxcglyXSLJ+PyikItYoplnaBCJJwBij0OGQ19Ro5HNld9Xfoio2kn1wNVTG+KGvqDbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2976
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds i.MX8qxp LVDS PHY mode support for the Mixel PHY in the
Freescale i.MX8qxp SoC.

The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in either
MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by i.MX8qxp
SCU firmware.  The PHY driver would call a SCU function to configure the
mode.

The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq SoC,
where it appears to be a single MIPI DPHY.


Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host controller
bridge driver, since i.MX8qxp SoC embeds this controller IP to support
MIPI DSI displays together with the Mixel PHY.

Patch 2/5 allows LVDS PHYs to be configured through the generic PHY functions
and through a custom structure added to the generic PHY configuration union.

Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to json-schema.

Patch 4/5 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.

Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.


Welcome comments, thanks.

v4->v5:
* Align kernel-doc style of include/linux/phy/phy-lvds.h to
  include/linux/phy/phy.h for patch 2/5. (Vinod)
* Trivial tweaks on patch 2/5.
* Drop Robert's R-b tag on patch 2/5.

v3->v4:
* Add all R-b tags received from v3 on relevant patches and respin. (Robert)

v2->v3:
* Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
* Improve the 'clock-names' property in the PHY dt binding.

v1->v2:
* Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
* Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
* Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.

Liu Ying (5):
  drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
  phy: Add LVDS configuration options
  dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
  dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
    i.MX8qxp
  phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
    support

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt |  29 ---
 .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 107 ++++++++
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   6 +
 drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     | 269 ++++++++++++++++++++-
 include/linux/phy/phy-lvds.h                       |  32 +++
 include/linux/phy/phy.h                            |   4 +
 6 files changed, 407 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
