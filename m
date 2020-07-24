Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA0322C1AF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 11:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B986E4D2;
	Fri, 24 Jul 2020 09:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343E6E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLHuh4Y0TR4MG21wClWlt4eSgRqdhY6yBc7aDWC4y9e6dWlCuEF3B+8mpUAPOx7lnVQwy5+9JoCNP1m42j0CjBttBWDOiMuno10LEPtWCCAoOdNlFHxFB4fzAO0WUnMYCO6hFHsUJeJ29lgtA2G3SOWG7R16y4J1FpxaUgOrfTiP5f6ZL95NTjOCIV7/iVuowg3FqTwfAExx79PcX36xpDR3saMbYjD7QB09lb5Zc97MWwnhT2N+WB/PE6AWEfSyCsllbN1Q6OR3OYaB+96r2lc7gnSp46bEutBozb4f+uzAEBCN/uLtKyxxkcUJ7m/ZAlt00zzsMkH17mkuIxsOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmRfCO8DfQpqrXVtGTBUyw7wV25yp0MALyRAGwEitWw=;
 b=VlkSmYbhsYZFJ3m/4GDnzvt6eTs0SE6yrLsy3zaamZGRsnIOQvobGCFEdUXR+RQ7TS1J7av8lzc/dlLY4glLQ2xERhvoMazw5ygBjurgpjo7DMVPXNIKlZxiU95tB9Dw1vLchZjTGJ1eZdevovBT5qJvfqUsqAY6pV27oDdsmQUWDgSmQQUoaFXjTF9cYl5mId2CXY3K+nm8pKcWWOYZCVdfUnWLcIcXmV0YcteZg0LHGDxbob21JFMmZ/lXkhnmHJAoFh+3kRsdFtJfNW2wTDL9cBxeXJN5/42c20dhMjRhEvJ5zI9ljonnIECXumv9jvxpGKa5UsmTP7HBEuzm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmRfCO8DfQpqrXVtGTBUyw7wV25yp0MALyRAGwEitWw=;
 b=kuWYM9UkV3Ch9zQoiCkzypWbmKrPnzQr3X+r85yH0AHnB0y0PXENVQSZMW9G/OolNsUlAm7mGiI67gKB2Sycnno2Q/r72UZ2EOOY0sSlqCWfqkNrcQkPNCvltGJYGMLLlUPNn5Abvyld3Db3Y1r3TUOM6m0CFUiRUjSOgFDJV6I=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6960.eurprd04.prod.outlook.com
 (2603:10a6:803:12d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Fri, 24 Jul
 2020 09:08:21 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.028; Fri, 24 Jul 2020
 09:08:21 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v8 1/5] drm/imx: compile imx directory by default
Date: Fri, 24 Jul 2020 12:07:30 +0300
Message-Id: <20200724090736.12228-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
References: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::45) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Fri, 24 Jul 2020 09:08:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7a32a3d-9cbe-4020-a51a-08d82fb11ca1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6960:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB696008C96A3304490917BEB9BE770@VI1PR04MB6960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qB3avSsjntxZ+s54PzFMEylvkmNR296ghTtMI+ia61k6wqzTMEPhgkOhZ8kv7lyuTfj8kIUWn+CA7fyon41bZiECtUT3UXlNBw0bYe725kYQkd22RB2JKXYjyLo5ZPV1MGVavaNTBxgQWE1mZJX1bKR2Q3HPrPhIjNhYF8l9KtttS/j7npXGDZP67buh+fnO6973Odaa677PhSQGQXdDgIFr681MvhZQkbPRFN7MO/2le6pz893yQ3aEHc8K5n353dxdVG4zEAxhRYCfyTGJOB1iOWLmpa4PXAYBviy9w1eP45khFHhs7hNO6XdDN8RVJbFLBtucqY/gJnfOS7mjLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(26005)(5660300002)(186003)(86362001)(6506007)(83380400001)(478600001)(1076003)(16526019)(52116002)(2616005)(66556008)(66946007)(66476007)(6512007)(6666004)(956004)(8676002)(2906002)(6486002)(4326008)(7416002)(44832011)(8936002)(110136005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qjme+u51V+J+/AfEjkd5RNcjS1Qwms1zMzbC+bhdeFL6jHL1L+lXEBSEmqdjAar8M+5laVamgqP4Xefkxisze9ldnUlEAd7oDbdY2zNWppA720o+QBuTssrmcsw8MG3uflxWR6LQeaAiR7DXBKMG2UHY4PKoL0psfKtdaTPiXht9sVaNz6TPjHcxqUrT3aeYfvP442jx1+qEtL5UFMhuJw0/dfUhiREp9wzMp4WG2DBJkQg+10HLXll12PjX0znvH8aoMG1YYKFC2OYnw61JFBcCFBE9Ub5AJWq8z6OrLkEWr2+wyL/X1/gdXTAzf+uiYzfsQ6Ps29azFshZl/Te/4+5JOA/9KnzA7B+5ujTYX+KQXGEV6R3lpCpAlyu/ibwl1i0vuNUvPJDdcr+oEsscUX6M837eB51TJUpfACd/h3pR7mTmdaFDJD4VGy0hM2GlkJGvyUUOojDFykI0S/NH8LrI9nsnFyUwmXSpIJNdHo=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a32a3d-9cbe-4020-a51a-08d82fb11ca1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 09:08:21.1356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgWRFdcUMYnFo2Kz5bULr6XtJDcmTwTHbwU+7xrFhmLGmek5b2Oy4X3JKUI4rAUOJLCdSnLeCby5fD11Cv0Qlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6960
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
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
