Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C4223E69
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 16:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04206EC87;
	Fri, 17 Jul 2020 14:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223BE6EC87
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 14:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klda8smGDPhkyiSvjtjhm7/T3MtOWuhhhfoFhGeEchfdpx5rVpqVX24G1Fi2n9BhBMtzRqiTz3fmxktG2lYuKgVpCsjrQ+pxMzMvYaH83GH/duF5PSdqTXt7HPfQjlfj7wgVLavTsNavq4zV0H5e2AYC1zWOtoWDww9VeQj/pkbQw44OCJtMQk/BK3WCQNSu42EpHTi+ptZsrjWrgDxbCKa7wiWDipPo24Nzz8K3idEn5U2IiWN+hBrNASgK5NKNiEIGgkXFLpHDEZBEKfCPxHeRiJ6N6FsnAva9BhGIh0W/t/bOhhQPY8ggtnepOE961OZbbyG6wY6Go7nAeIhrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7m5N/zleAtbPtD2p0lIjJN+NnDakaeTkYggM7+aLWQ=;
 b=byKcT4tpySlPOZ6/nKu2PjoQMwNpQK1Ogu3jVOAV7nvbcz0D/CXYVQS2AHfQ0fLwKgreR2qF4vGOrN0yoKG8eC1G+uwbLwx6UIoX13Kz78+5e/kXEHVWohCcLeU/rlwY6s2Tc6CUjpz/4ZNwJ1s8+k3PlCMAxIsocZxLPKeGGlw7DQGFMFL7j8no8DEyMJyYVcMEURJ7262XivryD+3uECO22EPigKRngfn63XCE1/OwaWs1ABk8FvCiB2pv8JhC0BAT/x//erI+3AT2TYIxWE2tGvUd2yuC32UeIMdLy63L/82iw1E152bt2mI/uyKTd+kvAVrPHsFtX4SbkSIHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7m5N/zleAtbPtD2p0lIjJN+NnDakaeTkYggM7+aLWQ=;
 b=Dw4Q9aoklBMwc6aOU7YDNUCM/pyiY1B1dUfIpw5LpJMgDRIgLTLTrw3615kNpd2tpbT91ELhrEgilY6eyytwHcfj0/zCkSHYeLr0SBFFWPiaSui0OTTNmYhb88e8RTjUgT+OuDisU0CMg9tFSkeezURvI1NQp8Ue9lKcuojCxWY=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6959.eurprd04.prod.outlook.com
 (2603:10a6:803:139::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 14:42:25 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3174.029; Fri, 17 Jul 2020
 14:42:25 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 1/4] drm/imx: compile imx directory by default
Date: Fri, 17 Jul 2020 17:41:26 +0300
Message-Id: <20200717144132.2206-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717144132.2206-1-laurentiu.palcu@oss.nxp.com>
References: <20200717144132.2206-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.19 via Frontend Transport; Fri, 17 Jul 2020 14:42:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da14504c-35ef-4bb8-d1b0-08d82a5f9ed6
X-MS-TrafficTypeDiagnostic: VI1PR04MB6959:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6959F786008E38B2998788BDBE7C0@VI1PR04MB6959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNk/zm5aOKi/RgQJgRiQxJBgxI2XeIIZyHWh5KRg9XnKyPNBoXcdPCCW2kSaLas0KmVUcFT+BBxlRcLm2UCkDrHWswDuQp8F8BjajcjaEYmPKpYgg3aA9vHeFq2L4XBq69AsAalJ0uiWNrbgCw5B2PaNXiwHBTMoJnnhRwzMjV8LzxMCNabyc9HQ5bFx1yZu9e2FjFw4cu2jC4fawGe/YzebmA2e1X/jQdX/4nBigjByI/mysGkHsEvUnKURkauOAl8ypzWiawFPX0CDUbbIY9kY0eRQtyJ9I7c0bn5WDvwM1imTUOBX6UhUMP2Jz67u2QbQsjIg25Al523X0OLn0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(110136005)(186003)(44832011)(16526019)(1076003)(8936002)(2906002)(6506007)(86362001)(26005)(6486002)(2616005)(5660300002)(66946007)(478600001)(66476007)(7416002)(66556008)(6512007)(4326008)(316002)(83380400001)(956004)(8676002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mV4bEhWkDJeKIEZs8AdB9jnlvnK5uLTqnZHeOnm4BeVb5cWGZIW2wYvuDXRAgTAz5mRZ30wmikZRZlKaB9WP3DMHBN60LoWZJbBjcWXShK4P2ZyMoCPc4mVAfPBxIvgZ4D8nzEIftNrao0t5u93JMUlEfmqUAlz/OjeOkURKPrtfYcNVKC4qug777BSl+KiFqFWFCPe9Q+jkZuj71oDobKOcwGL49AoCquoa8PrHie+bg/p3Fdof39qJY48uvsGdvHavwX1PVBbRWQ0Ec9Bmhv6okjzmhdWxRx8HSr2BlBmR+A+mbAtOkffHiJS4TzdcoO7GESA9S0fYayg2sqeb4/Dqou3YZ+z59Qkf4C23GJpImRW4Ob/qRBi/7OMftnp18nhpIFDHQU5DwyFDK4rezy86wYaOQOGCivARbYeRynEBCDYW7/YU+mX4rxNKknSCxyxOK53HbdcCuXN/9D8L5I57+Jg50dwpwrklC0SPuqY=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da14504c-35ef-4bb8-d1b0-08d82a5f9ed6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 14:42:25.0661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S71kXxfO8e04Ure747OZII6DcIrx5qVndgaQz+2ViS4s6PyH84kfBYUdqscUGOJpVlXKjaE8XGCS17OalRwpIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6959
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Currently the drm/imx/ directory is compiled only if DRM_IMX is set. Adding a
new IMX related IP in the same directory would need DRM_IMX to be set, which would
bring in also IPUv3 core driver...

The current patch would allow adding new IPs in the imx/ directory without needing
to set DRM_IMX.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c0e5a7e5953..c4d12e756c63 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -100,7 +100,7 @@ obj-$(CONFIG_DRM_MSM) += msm/
 obj-$(CONFIG_DRM_TEGRA) += tegra/
 obj-$(CONFIG_DRM_STM) += stm/
 obj-$(CONFIG_DRM_STI) += sti/
-obj-$(CONFIG_DRM_IMX) += imx/
+obj-y 			+= imx/
 obj-$(CONFIG_DRM_INGENIC) += ingenic/
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
 obj-$(CONFIG_DRM_MESON)	+= meson/
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
