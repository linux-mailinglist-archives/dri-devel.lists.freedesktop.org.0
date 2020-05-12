Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7B1D0B8C
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876A26E9A8;
	Wed, 13 May 2020 09:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765C6E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:31:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnUhZi3bP0pFjc7ld3unyeq2FOWRZ+dR5sOx2S5zc0zw4MfHfmxooFPo1M9DyhzgzkNKed3k2QEoKNgM2d98TXkipUgL80mz4hLN9hqw+V6tnmE25nfho/nsZNyFxE4Q4tfXrEUvPrI64/BCuCMv7ym9VfO23bWPwyoASaU4GUa7VltiMryPrwtpfgkqvQiQqfa8J7GqlRc/YAI8F9lQ2i1RKuyln1NzFUsotfE0HJYbfLaAB02YrWTQRjesZY9tV+xozNuX5sco035lmmWM5mI6jk8/sTmfAWHlbf5OH8b5F3vlWHZ5ZhZnzqNCdYeTZW9BCny3aCQpKdDwDfjCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcMZqS/zJ9c87uH+3vYD4qmPTiHrOw8YeOe6mHvCMWU=;
 b=OQOQ1Lb/IhlbqZo/OZFNr/2jBSHPS0r3zD0CWSDkQ2/wT6Rpu3ihsZCmHzTwPx+ey5DaB+kxVJJ/zKP05WhMu3b+GinmsyTVnaVl0VVryduFfvBIW91ks3fPxCMN3fxUf6Kigzfh5fOEGhvj+P/VO8cMit1vIyZ14s4HgCE0bTwCm18dNG4TJQpuj6dncNVpmyc3hqFANnMwkG0upuI6ebaYWtRm2c5mQw6A43tLEEtZK5KGHU7G6zSy93OGcJ9wTVEPDirmhBI//ohEOmKoGyYE7TpoPKs8z20Ghbwq+i27l4wsZHIxjR39bDTIEu7Qjjsx0EnITERssWgDt/pS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcMZqS/zJ9c87uH+3vYD4qmPTiHrOw8YeOe6mHvCMWU=;
 b=NILroCzA9vzc0F/G0+U2sPHLNyQvX67PjNZsAHa6Nqilgh/kV5PKhw80aNGpWN6i3nwbFrzoOuqDfE66H+pzZ67f39SBmF9XMjnVSuJqHtl3bwQdcBdpTr9swvfx1HPQVOmfQK+w5AKMumXavyV4/xzFaFCq/9g1LYaGa+bZ4qE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6831.eurprd04.prod.outlook.com (2603:10a6:803:135::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Tue, 12 May
 2020 07:31:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::8c3e:70ad:d975:441c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::8c3e:70ad:d975:441c%3]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 07:31:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/imx: imx-ldb: Remove the leftover LVDS_BIT_MAP_SPWG/JEIDA
 enums
Date: Tue, 12 May 2020 15:21:18 +0800
Message-Id: <1589268078-19905-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0112.apcprd02.prod.outlook.com (2603:1096:4:92::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 07:31:41 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c95d6577-a77d-43b6-e701-08d7f6468496
X-MS-TrafficTypeDiagnostic: VI1PR04MB6831:|VI1PR04MB6831:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6831D151787E1BCDD70C819398BE0@VI1PR04MB6831.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hSzK1j2npvXKTrpGSOkirWFnoH4jaXSlwTJz7gd/Ms0jCMqDUt/OWnCBcb8hgxz9MsMyDowDXaQQ9ukQy3yubN2NnAlQC3xCD8X3eh/+JjOmJ3evK4IKZ1Q7ZcgBCHSA4S+BpZgtMlLQdlc8lvxonGT/6N5l38tBxkUDj72AsF1ilBxEKLFyIeSY/n7tFrIGpOOInlJGF5Yp4VfYHbzWWcB5fupZChXdUagmNo2z0mmcYsFl4JQ6RDb4IDYiCzIR1HeE4nXb2o7DMntypPImItebyoEVcYrqfZrUIgkLq6jkVWHqXqZdGXISkyTJ28acTBh7r75DxGTYyGldSd9x3/0ggNTnpHOyhSQO1a3D7uEWYHeV2VGyibuVltPKj5rzsupadtJLNVKYeq1Qat1Vdp7RunfxkKa/mqGmoqQh+FG6OQaUwc6Zxf3ybB4XCB1KC2jHxd1wAHitfCj33w80isOMnTgRmkXlZ2K9Vs5syjoxF20j+3CIOzubnuqTswEcMWf/EqLcQXvEXqbPRBaphb6Cm11hb3zv/hEF4oUrsEUMSpn977Vd9PeyMzg7yyu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(33430700001)(33440700001)(6506007)(69590400007)(186003)(16526019)(26005)(2906002)(6486002)(956004)(316002)(2616005)(4744005)(6916009)(8676002)(66946007)(36756003)(478600001)(66556008)(8936002)(86362001)(5660300002)(6512007)(4326008)(6666004)(52116002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: V3updASU+rzvxYaHdgpwayLWd0N4fDGKBWRFV0YWBHrJL+fa5idsKDgMROJtSirigU7B1SJw2PjR1NJ2lGD5GPcdxyUX4CIWNuppRireKgsAk/DQFt28DoNQCq5JTV+fRqLmjsebyfeGXkwNCbSB6XyZIYVld9J1Pcb1UtGDkU++mHib0iu4O97A0XPtxkTraC9uuh7XrIasSZi28SlDd/6pf07YiCxI+l3W9IXlqsTdY//eiGx/xaACitddsMkO4ehhJxCBkP3QcKhLC9JcRYe3S2jlrrLxscxNOqDF4sgR0oUouufwYerxs9l7KpqRSqEgu/4knQA1Yr+F/1Xowd/gBqE+nZ5n8NjdAn8bDss8/+iqywX795+Qi8aACgSKX9OpMq86MVevpiOaEToO/s9TT0edm3n9X67EM4jNt1lzHaVkoqH9cs7sRtdMZD6XphxO/oIG4EZkJhAWLyOgWtwMZuE8l0+2Mz9yblHcxzA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95d6577-a77d-43b6-e701-08d7f6468496
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 07:31:43.3907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EoZHwXO6AOgpQ+ka03dGtczIN6iypRBwTSgVQjX9fhu0s4w3c/ahBYZlJRieBwQahqnmBpUNg04ntrOMuowOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6831
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No one is using the LVDS_BIT_MAP_SPWG/JEIDA enums since a previous
commit which changes the imx_ldb_bit_mappings[] array definition,
so let's remove them.

Fixes: 5e501ed7253b ("drm/imx: imx-ldb: allow to determine bus format from the connected panel")
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/imx-ldb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 4da22a9..19a00eb 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -477,11 +477,6 @@ static int imx_ldb_register(struct drm_device *drm,
 	return 0;
 }
 
-enum {
-	LVDS_BIT_MAP_SPWG,
-	LVDS_BIT_MAP_JEIDA
-};
-
 struct imx_ldb_bit_mapping {
 	u32 bus_format;
 	u32 datawidth;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
