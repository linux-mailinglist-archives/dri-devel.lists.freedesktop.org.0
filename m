Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A73F1306
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 08:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CCB88FAE;
	Thu, 19 Aug 2021 06:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2101.outbound.protection.outlook.com [40.107.94.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766D789128
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 06:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCbLLGZPJVrJu22SvtE/4UjdeoayqfxaCmRo7mWaQUUNrVIr54YfJqN1bXwRaPh52wwK3Wu801p+aXmKVGWYuz71AU+uUPePFIIVSYiDIc017L6eqY3sUoUNTd3vYgoBgXZzSzwANT20hdwZ68jmNIBiLmhspM+iOxCnQWZKGcW8JFmqj1L4TFedBC3wHisElyDKGh/7OMR1V1XxstWHiqes3oJnCfdEFeVTxwrtXHcB1UuifTH7m0zywK2etoF4qNO87nNKJqixlg8F3N4IW2EJtP1VVC/t6jtaT9Wwho4dJD68Jzm2ybwQvSgOp/XuqF7V5IDowxVLo/eMB4tF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgi/8DkE57x8xY+QICSMoC2VNElbmtZyAZhN2Vyshh0=;
 b=lcyHTAKwXai/lSypNFXWnzEG+D4+tOieh4usT+8tPjwFWtByB6mPMlukk+S/tf791VBcMovdzzngnQFIblGcB26L/p3L3vjleZc90mZE2/1AKpXX5/gLX4dnSV0XCarkrCBjQmQFlH3oiRknFnFIkJ2d9mSA8FUlS//tQdndPxFLxOHcn/7NMwy8XRVwamSP2Dz6g4TP/m3XiaBTB4Sr+TKrUhtOlktjoLdzYYuA2Y4pwZH3gZ1lKcb/jJi7lmguvp3QLLyJFIc49XDUU7iUeQdjfE8R0tq9CaUna52c01lv0/iZR5GgD4xRgnqyKJkJC448GuPFlceqUgZYnyFEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgi/8DkE57x8xY+QICSMoC2VNElbmtZyAZhN2Vyshh0=;
 b=HJuPardSgITvcv0hTwTuaTU1lI0FPZVS1pgzoKpKVc70+ZFFdKY7homvC2bwr3J/li0MkWCwb0rZfHWTv1x5JiIkYHSeHvKP+2CAuu5wyB6uo1xe39e/D0DUBa19+APYUVgGCDsYvaEAPhtabnu8zNURgRq3lBLDVdgbmVGaAFg=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5271.namprd04.prod.outlook.com (2603:10b6:a03:c6::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 06:01:22 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::51a6:9837:1d52:b16e]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::51a6:9837:1d52:b16e%8]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 06:01:21 +0000
From: Xin Ji <xji@analogixsemi.com>
To: robert.foss@linaro.org,
	drinkcat@google.com,
	a.hajda@samsung.com
Cc: narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, dan.carpenter@oracle.com, airlied@linux.ie,
 daniel@ffwll.ch, boris.brezillon@collabora.com, sam@ravnborg.org,
 hsinyi@chromium.org, duwe@lst.de, anarsoul@gmail.com,
 m.szyprowski@samsung.com, bliang@analogixsemi.com, qwen@analogixsemi.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devel@driverdev.osuosl.org, Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2] drm/bridge: anx7625: enable DSI EOTP
Date: Thu, 19 Aug 2021 14:01:10 +0800
Message-Id: <20210819060110.3427256-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0034.apcprd03.prod.outlook.com
 (2603:1096:203:c9::21) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR03CA0034.apcprd03.prod.outlook.com (2603:1096:203:c9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Thu, 19 Aug 2021 06:01:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 651bee6f-2b98-4539-f89d-08d962d6c4ef
X-MS-TrafficTypeDiagnostic: BYAPR04MB5271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB5271F24359875BCBF68D1F1BC7C09@BYAPR04MB5271.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FkkpYDccAZJU3V2Z12HvBZVAcKXyw1PsEwRggI0BIyZIbpBcDz8PWn9sNPTNSkVT4O+tpO6nSr3qYK2ylIuxc+M5XK4ZyJaTfDsj1WKgGbi23/hGlExhBiaVFeJOK5BtqayqN0vwgsBBS35FQSSrGqz0JI/vm+UflVrImQ9tkWwSTiPKYmIL4cyQ0yyeX10iOeimoIHP1s2y3iPXvzQ/k7ZzDInRaXYJxmpf988vK0EX8NxrauKBOjo/w8QjGOZG7Dyn3JVquOfmV+Pr2/oowgkSFr1s18JVCI1yTOWM5udjYqrdnJJWa6FToHo8WTjGwJ6bat1DWqbc9TcF2TLc6P83CDh4njpL5Nhq4rFYiTezEHXtes6CxYuHna4qJnCpFOW+h5ftwOBoGnZOxxkuAxdDtKRkUAkZxhV91efNLsgDosJvQcp2HIy6wSY1xbLhDvc8c3izyLJqwNtuie3w5mIwu8IZY3C2HIGVaaFdo/3lCNU9rY4HufaJ6AlVPe2blqmaSNthAzryJQzcDXOGUhltqRl1WegZ4PyspmhVglQ8sGrGGav0Z13+9wHs6Tg1eLTQvMFdOJCjHPFN/edFpO7EQ+ICKcMbBriSfq91NnIbko7AJ79o5AP7smtFHtGicjeWH8FWpqCIc1gbOCgXK6Cj8TII0ePrR8vbvCJ6MGABq9N1c1ziKW3QpQf3f5h2gKzaz58AXERY1O0kFrF32A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(8936002)(107886003)(316002)(26005)(7416002)(2906002)(83380400001)(2616005)(956004)(86362001)(38100700002)(38350700002)(6496006)(55236004)(5660300002)(4326008)(4744005)(6666004)(508600001)(66946007)(6486002)(1076003)(66556008)(66476007)(186003)(36756003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvpTCoISItlUAHmYpHL69FxSJf8NAfQF7cv1Wx53menWSf0GIu5k7k/9vgxg?=
 =?us-ascii?Q?0cc0bzzNbc3YZt7P6jlD7zfnBr1RyNiopH6MV3xgLD2K7KVbpzgWkQPQCemG?=
 =?us-ascii?Q?vaUT9jUCqC5/HNmvI0+xTxCSczVHKoh0kikEi6aP8dxuyIiqzkt/C1w76TbZ?=
 =?us-ascii?Q?xSuFNbRq2H1m0Ifhzp14qW3CNnKjgZELWxU7Ez9GWpepe7FdHG/YcuvtcpBA?=
 =?us-ascii?Q?gTa4W8WAGD29i6v6m2JBUMKFCkz39NuRzHY6wK/9ZaPEa1wRs1CIVFhZvIHX?=
 =?us-ascii?Q?sNLZGideMgTASIh/ILiy+/qDaYmqrRnAV/ftKakR4Tl/Gn3aAEzs0/x+1YKE?=
 =?us-ascii?Q?Cswn2ikt/i+iIy/HYesngkXEVtHf6g7tgMqL/43WTwk+y7SMHutZa+TId5vI?=
 =?us-ascii?Q?wqRrzR7Nbyl3v/Vm/sod/EC+mhrmLXguO3hm8u5UwBi5JOd9GHznLoCgbzzq?=
 =?us-ascii?Q?Nw7Uu+VJh6hqhIuggkSfGkSyzkaKqHzW0AnHQ4qUk/7RxOcc6YSaXXT/tamy?=
 =?us-ascii?Q?aJ9O9JQJFhxmZXgj8mg7CTELsQ5rdlGs1Z2AYvr0Nmt2dXgfjK7i6skql0g4?=
 =?us-ascii?Q?moStbWtRt7oRCmrucSFNvijNtOjtpwtYvDiE0fF4ccgEry5HmM1kQu69hnaH?=
 =?us-ascii?Q?rMkjjJVlHNkdun4JmQetOAgcy14PfAE3ASlb+jQw4SozgoASt8KgBQv8nCav?=
 =?us-ascii?Q?CYcyRA7f0roj1NEqK4093gzcPii6EdIFUi4VvTncCM2xV1pqY4/aw3QcX4hW?=
 =?us-ascii?Q?LfZh8ACHUrUtaNVMV83NYwTL5kOILA1pHOP9Uwshzc8rZrAhbAbyiZq+a9cc?=
 =?us-ascii?Q?O6X/UZqYPtQzlOz3k+gjyTwR7FOeKzoKgwxNKGE8nolXylsEulvH35eODSSe?=
 =?us-ascii?Q?p4KUhj/QW7YFlsgQaCST38RVfNpW7GgzHv27ECJlsIJzjFv4sV6vFqC717OM?=
 =?us-ascii?Q?7QtpXQve77SQguVJ831R8Fh/TI/80RTdIEQkyy39HRpMbgk3/BX0/FC9W+BH?=
 =?us-ascii?Q?RE0MXsHlpd93O7GHuFSHcmFAohjFnbpPBVKnnf1LXtLEmQ7LW4djt5k1CqmJ?=
 =?us-ascii?Q?FhjeAQ87YUfSzm1FZf/MNAkl/roLQO7iKNIZyWtA0Px9nd7CZrxMlRhgbCJR?=
 =?us-ascii?Q?rrwdLncyHbrm8/+MZKS6t5y78mnL+IIVhKboYmxSfEyxgwIWZ993Jj+eWs4/?=
 =?us-ascii?Q?+ccs2RLKdabUeRCfsm18PoIO8oYLz3DFN2w/YpFw0uXGhPC6VFES5ey2471R?=
 =?us-ascii?Q?PzQr6qVG635DtUeX6Ldnrqqbi/yzboUjJc0DTNzToZPl/J/V5TcHEUksKl0D?=
 =?us-ascii?Q?1M0QfAxN4TOdhHoYrLyU5o4Z?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651bee6f-2b98-4539-f89d-08d962d6c4ef
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 06:01:21.7833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAcLCtTziCIbk/PFstJi06MlVkCEvdat5WQcn3C0dRnRrkV1+HiOuBQE1YvwHhF7PKy917qI4zVhNkHOoHBw9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5271
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable DSI EOTP feature for fixing some panel screen constant shift issue.
Removing MIPI flag MIPI_DSI_MODE_NO_EOT_PACKET to enable DSI EOTP.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index abc8db77bfd3..1a871f6b6822 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1335,7 +1335,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
-		MIPI_DSI_MODE_NO_EOT_PACKET	|
 		MIPI_DSI_MODE_VIDEO_HSE;
 
 	if (mipi_dsi_attach(dsi) < 0) {
-- 
2.25.1

