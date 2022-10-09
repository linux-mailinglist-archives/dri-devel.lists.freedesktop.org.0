Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD6A5F88EA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 04:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0E810E31A;
	Sun,  9 Oct 2022 02:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1102110E30B
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 02:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6GHEabDm31QvdmB0BjXp3pHgnuyrmOpEjEPztv2lqkBdIQN5BW0QtnShDjuNF6I4wzHK0dDhis2rj6PvZTikjq21nSny/q/y1FcrX0DXTdYNOkcGIpGFP+uijYHc6ZIFOb7NrUk81zqzolEyOxpGUxzcFSKqG/NLn/GwbheDg1q2C676KrZdpLTXj6QXVwm/OgMoVxb4vKXx4D6NtnBn2cQsTCAmbsNL3upQG7oRxW2B1p2qJrUIglaSW5ZouabdV4eWYZUBKfwDYcJJwKFensf5m6xPcAgp/kKz2z0rp/tPY6I1zkrCkBnuN1JejfLefAvB1RrWEAdvPcbpD5hYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X6/GXy1Llzv/9ki8+XdQOhq+ONYkO4HR3wJ1puQ/J4=;
 b=kKU3v49zj790UeOa+X1gqH5RGfiOXzn7/dqDP5btm2mbX+Kk6txzxgQR2J1tpbvCGDBJ4ppFqtt0zEVccG9mdTPn5PBfqksxEBLxNZeHkRzwGDji0Y304ce2Rfpn0EN6Zlu0tYBIJ1LhBQbcpNWicAwJcoARipeDzEukIRquuVafxt6XpfDB5KEjPxIM6h3I564s6NP+p5O7cv0hI6FQQfxBiluLPIPuTFnT4pk3dhQW2zH2pumVnntsbVXKy9bbSM6d9Rny3X3jEFxlEIOBl0Iu7E6HJF5VdM5a+p218kfXhnf6l+fWMRn/SC5a5V/wh3/KjmykKWverNUi+pXeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X6/GXy1Llzv/9ki8+XdQOhq+ONYkO4HR3wJ1puQ/J4=;
 b=bw2thLH8IozThbfc7hj41douWXX8Ke8BDLy3XvRxhFTQ8SnX9Zcmo3v8CqOJG1f7todvKUWSD0PYo36FV8LHYrCVyjUDhzH73gkU6oN8OiYDOTM2TICn4ayAdSxYTRKTv70DRigq+FRygGpvA/ItIox0aICx5lxZ0K1CO1dJPX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6833.eurprd04.prod.outlook.com (2603:10a6:208:17d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Sun, 9 Oct
 2022 02:34:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%7]) with mapi id 15.20.5709.015; Sun, 9 Oct 2022
 02:34:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: Kconfig: Remove duplicated 'select DRM_KMS_HELPER'
 line
Date: Sun,  9 Oct 2022 10:35:27 +0800
Message-Id: <20221009023527.3669647-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0085.apcprd03.prod.outlook.com
 (2603:1096:4:7c::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ace01f-fb4f-4272-416b-08daa99ebd14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SCqVYGCsIb5Ul8yw6xpPCJ4FVxgwHRL/97oH8oXMVRz95KQuLWdXW7jhIifHyFsLgAyXXdsStTXW6WAVF8Ei2EaezzIq9uihkULSCBlL8+MIrTyXLucWJps2CehYGnXXGqFj1nTXE8iXeNOQ1Bczz+1CTm1vSjW4RFl/SVeGHi7kNojGj4HkdEILaixYxTzZEp6C+6Jj8HoS/YOhpVlA+aFg/FOiXXN29THNXSMyFhSYImiT6DE1C6UYWO5sD9f6EZ9GrdWrE1uk+H5/1jic2KRqWQspPAuTK6uW/pwIko/wKbrD+kwRrQHtTJ0BsDMXaMAA+YpSsUrwa5ODxEsmY+6qWb4EtQcGFAEa3D16P+OiQ8iVgDCuDnQbIdtTQ9OYk0egxIp2PkX6U8JaSMDK4a/zCJGJFnEJqc8EXIhxlZJgYJAfqbq4MClVZNLxPSDoIo41HjrCt9dZ+d+SJCc+aXDugqsooQms/f2uhLRCX2B3lMtqevTc/OS/htkE8r459EsCbxa+SKv0eU4R0rGECe/FsEfkJ19iA0jQWk43galnPyTT/Qg5e28Eb2e7/LvMQCwNT2mtWZH3NpMQr5Gek33Qq5zGinS57eSmrfpDpemBTwCe72+dd8pyDD0ADCjCSuK5S2JxU+gmfmmBdJlbEJY3kCLWoSF6xg7RfhMTxKQmsTM4DZrvV+lX8FhxcmNHLEPC4nlb06TtpULOp92J2yfI3bi/xaUA5rdNIDcRwFkGtFgbFMa/DJiX4DUw6sUsUiszTzHlMNAiuqb3xcz2xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199015)(1076003)(66476007)(41300700001)(66946007)(8676002)(36756003)(4744005)(316002)(7416002)(66556008)(5660300002)(2906002)(4326008)(86362001)(6486002)(38100700002)(83380400001)(26005)(8936002)(478600001)(186003)(6666004)(52116002)(6512007)(38350700002)(6506007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C6o1PxAIRloFRHqRjGWCP6jk3JR+Mhs1OBOZwpP7aNf2VodrpNJXRiQ69yev?=
 =?us-ascii?Q?UDTAclfV0so7y5Lr5QtJp3gRZdouV+ijRrZHjXyxA90dOLRn8e4yte8ozNzp?=
 =?us-ascii?Q?hvfsaGOv1yfSumrBDcPnSzqf0VQhcTKkQS0kajBDpAUDkx615B6JB36R5hnQ?=
 =?us-ascii?Q?dBZ9w//k8htMO6cgNAyZuw3vi6v3Cp31e71IAuluujmNG3wWrdKy4T5HrDTJ?=
 =?us-ascii?Q?4SuYPUUTMCn1rG7NZk6lmMrPN3YkaJernooliJuXfQ1/bRpzDpa97S79h3YB?=
 =?us-ascii?Q?naf+eGF54HvVg4OS1+kdV+QqElPmxqp/pt2MWAirsiMZZbHSfhxwyglSWDKa?=
 =?us-ascii?Q?tDi7QX1HnBIkeMqMl4XYd1mcp3n2kSmiI7kdsQ7+Lf1oAYLd41WeEnekKXxx?=
 =?us-ascii?Q?GtYfh1xnb7uE6ielRfebyS4jcfnqC94cQNS8fGAimuEtTWQJEKFBX5JKqO9i?=
 =?us-ascii?Q?7tmWBe+OaxeYFcsuZWvYNn5MzdIhbbvpsQ5xmiksBf8mcp8D944D9F+kmJWa?=
 =?us-ascii?Q?qcTeWEFQzF24XRx/pnoWwQ2Vh0wnHJJhI88jm4QdBD0dQTz2f9jRmadAtCHt?=
 =?us-ascii?Q?rTV64BJaOqegHFkUUU6ffuXa4uuRCeq/ns0+Mb9k1Di2wpVtzAWREuMVuFBm?=
 =?us-ascii?Q?ljrXh/MZtdcn6XsIGVpQecFImjOAuNwiGieuIr+r1/U+AckPag9+8qJJOEIc?=
 =?us-ascii?Q?yb3rdhSwa7A7mMudU7lIAejjpwIa1zkyiS56iCS+A3dRUaYePh+BRcpjVmqZ?=
 =?us-ascii?Q?E5HTbvaytVfc/+hWw+7qNESAr3gnoiH3PgZxgNnE9zRCOFEy5ad6BeafpHpa?=
 =?us-ascii?Q?87AUGCgXKpiy2/j1ZEQRFq8DL5DbuT2SZBZIlCiFfdqnO/iJrnTUmy9T1Hny?=
 =?us-ascii?Q?KI5rN0eTUqALcmyqgZAJ1hXbJtSdKIdBrbGl3o3usoGjRuJzyAh0Y+OhB23S?=
 =?us-ascii?Q?7gYzWkqQ7vU1jhFiMfek4ULV95YpktTSWI4KygVgPXR2fS975cZi5OSiAERg?=
 =?us-ascii?Q?GXIiw3l4qOpTqmplCrlKKUR2n1thWqWfYfxh3KrxpFyJIyd2tfgBhjN7AGwK?=
 =?us-ascii?Q?8umDx8tyIsakvFwhQoBlR1DZybCNz5PpH3gBe6GZAxju9FYOyZj85raHzMHJ?=
 =?us-ascii?Q?Ba0DCZwgpYpDlD53i75o+9+9aRi7jzeyZaThLSMfgPFAaPhPg/9Kz3MfOc6a?=
 =?us-ascii?Q?nUYrqwQxhU1dE9p89Zd1BiXYiNPLhiB4oQBfXLKMhyG4QAxGa1lRlZLO5oUs?=
 =?us-ascii?Q?Uz27tKzkKnEANUrtfK8WJ1P9BqeO0LosGXgJ1k9sfiRm+9BeCzaVyFCemCGX?=
 =?us-ascii?Q?K50egAq4EyzRH7Zeg+5nIYnbmCNAX/N0hg0XYgs6mJRFviFkf3LVbhwueo3Z?=
 =?us-ascii?Q?AaCzuhDBy83Uqm7NHig07Ej3a1QECxPYvJDxNrx9oe0AgcdcG2P+mZwR5jbh?=
 =?us-ascii?Q?aVkAPQk4shv6lOVbEYBxKYTh6fo9kRO6x9x3BNVrzbFQXSVJ+6mbSy120Iji?=
 =?us-ascii?Q?jW4PGYZNj1R+T8ESZroVrrtbrA7yGhp9bb3kLGQ+oZCOzh9bTmj2Ut43EeAv?=
 =?us-ascii?Q?TwtEgh+8r4xXiVeH/z1fz4Dn39hrqRFQ3g1RG+E7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ace01f-fb4f-4272-416b-08daa99ebd14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 02:34:07.1931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOZl639Ck9fJV8y0UW3a44KaF2W6hMpXiFDSnvF8UD2bs0y/Lq1VL5TpXpWNoO83TgDnyLDXZb95DFKxtvOvrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6833
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
Cc: tzimmermann@suse.de, s.hauer@pengutronix.de, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A duplicated line 'select DRM_KMS_HELPER' was introduced in Kconfig file
by commit 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option"),
so remove it.

Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 975de4ff7313..fd5b2471fdf0 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -4,7 +4,6 @@ config DRM_IMX
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select DRM_GEM_DMA_HELPER
-	select DRM_KMS_HELPER
 	depends on DRM && (ARCH_MXC || ARCH_MULTIPLATFORM || COMPILE_TEST)
 	depends on IMX_IPUV3_CORE
 	help
-- 
2.37.1

