Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8970349DB98
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087C210E549;
	Thu, 27 Jan 2022 07:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01on2131.outbound.protection.outlook.com [40.107.23.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA7D10E558
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 07:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXRL0R+abrGM5lfL3XlWvdTsOyOQOl7TMJuTdqfPsKAMBShFl9nHrdbFjSN/DLzXmmQUI/bSoocbNpgV/wOKeRn6chOtbSB47UBRNKySLmlgwyU+HHZkw5nI9uNjCRiDXgmMJlRi70Y2FmULZ7VmPt/UaGN2gMn/7xtCxuo5DYsgG6fLDLwKiD0dY4ytynrN8ZoR0dF0c6HYYbL9Qw11GUUPQLdu7IGOReF8ZM7rLlLZp+kRn8gxGM6BAhWOl43ddaY/Dr8VrCT4YAB35ijXlAY/4yPibPQhU004fNR07keBbR6WiqXeT8rohwC3OOUHjfWqGnH/PpQNmKSRfz70MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4W6z/w5SpIlyru/HK3/DpQfVuFsiJd7PNzp4/qTP4U=;
 b=J9OSWfWrwmpykQ2vGwyZbSiKhaDBm53hM3u/jtIBZ4hNEQr53PZ4bCE0LUZVRkf88ZKkcqZgfhJ2p1LpxTnxCMGixlVSt7vLmWCVMB/lAkJVDZXhdMXLb+3ujlT1SrCq0gAiGBbXWg8ok4cK5taZ6mdVcZs+voj+Zf+iviEX/wyMoHf0EEmUbJSEM37J0ClxmC93NgSPcbNMgVEKBXV/sRMWaa9A8QnDTDmdpq+ZgAUjUojxgbXSlrJsp2rTf7eaqWteOwvJzjy6UGjEsVitLrDF3q2yWDHQGl8sFUFXAER+8jWP2qCMXp7NHrOweEkPwQinU8fR43vBYv77ZFu6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4W6z/w5SpIlyru/HK3/DpQfVuFsiJd7PNzp4/qTP4U=;
 b=GazE3nq23yviAHHr4nSUttOMFdYXXrS4Y+SVemiMUSzXhjjRi19sb2+cHdWMCqe8EZmDYacCG/45UX+9Ipth1Z0cCku56pfGC0PXWl3l+Z3jr7sQ/Ib8DEGMZzMHkEO7tKSM4ZRWsM0HmALuUAcbEkqFTfqIT10J/23D0QKlCY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:42::9) by
 ZR0P278MB0203.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:36::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 07:29:51 +0000
Received: from GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM
 ([fe80::bc7a:d19a:3cbe:30c5]) by GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM
 ([fe80::bc7a:d19a:3cbe:30c5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 07:29:51 +0000
Resent-From: Francesco Dolcini <francesco.dolcini@toradex.com>
Resent-Date: Thu, 27 Jan 2022 08:29:50 +0100
Resent-Message-ID: <20220127072950.GA233558@francesco-nb.int.toradex.com>
Resent-To: dri-devel@lists.freedesktop.org
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/panel: simple: Tune timing for ET057090DHU
Date: Wed, 26 Jan 2022 17:55:06 +0100
Message-Id: <20220126165506.222331-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVAP278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:20::17) To ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:3d::11)
X-MS-Office365-Filtering-Correlation-Id: 4b1e0eae-4940-4174-f246-08d9e166ce2b
X-MS-TrafficTypeDiagnostic: ZRAP278MB0580:EE_|GV0P278MB0655:EE_|ZR0P278MB0203:EE_
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;OLM:1265;
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(39850400004)(136003)(396003)(376002)(346002)(5660300002)(6512007)(2616005)(107886003)(37630700001)(44832011)(6486002)(2906002)(110136005)(36756003)(508600001)(54906003)(26005)(1076003)(86362001)(186003)(6666004)(83380400001)(316002)(66476007)(66556008)(66946007)(52116002)(38350700002)(38100700002)(4326008)(6506007)(8936002)(8676002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d44c42-fa61-4d68-6d4c-08d9e0ec9c44
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:55:08.9225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VyQ1QtZCCg5Isjccr6aS1gYf3rXxi5nGValqxzBc9ji1QgwMU2nrjJuv0Dd/oSGXmg0l73IGe+kciO58zBrYukUDFdEK4if3PtYftQhJkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0580
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.4650020
X-MS-Exchange-Processed-By-BccFoldering: 15.20.4909.019
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506458)(944626604)(920097)(425001)(930097); 
X-Microsoft-Antispam-Message-Info: Jt/T42s0XTVyPUTkziW8x89QTIPkdzHv1oR80rU6G8BRj1Kuf8+LbJwf10ezR9xUjypRj0h1JM5HZ56wop5Y8f/f96INLn4ljTLnIPWhaWjZ87uPFtig5vk7YY09tvXVg3UTKMn+DrDfeqFdhvoFA1NB5jnNYHPLN5NbQTzTuoYYNJDbRNSR+tW7SCbaGTM/23jh3wEu22//XRzo5RLzakUFKecHyG4j/liZVmCXMpMokVjC6V9k5NV2aOOS7aMQ8aC7IOzCxzdmvflbwBxUxQPNeY14eEdKCR8mMtoiCedbsO6oN8tvEqWp29ZWzvQVEaS4027pJOdJUChF+Yd/IOwx0YsJ0Rmp8tqlSUh9VUHYe5Mj6sxGNJd5hL0MkYo99fVkQHpfC+se4Zd7vx0JXMqOjWcOYCPX08tQGVTjPxCG0M4UAVpSxyOfT8PYuCO+7ZLUBMWHtB68qYExVwo5ZKp0jsf0NOlLTkO2rj1YoN6egyTGTN/9gxdOfo9Hd6XsMfKsGKZi29r+/wNrN38aTScfI4qCptn85Xrl+B5SjPK40IeWOQB1klq9yD3bYHwKEOo/u6IngWkU39j3DYiQP2jYUeNeYPR9ix+5h6nHi2HmrvPPiF0DV+C+HvE0ZfAQViXsIzUtKS3LWLb8ClXjC+3Sn9si7Xxi4xl+WI47w9YMi6WknqNrDms2trRMinTFPpMM+vt/W0L5XxXKWDeKHA==
X-ClientProxiedBy: GV0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:28::8) To GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:42::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c0d44c42-fa61-4d68-6d4c-08d9e0ec9c44
X-Microsoft-Antispam-PRVS: <ZR0P278MB0203ED31BE8D57D82CFE36C3E2219@ZR0P278MB0203.CHEP278.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9vkvLj8O9wrWyvGJPG2k4kW75y3fMufJDjLuRB4iefm7Uc95HKq1dJpfu2z4?=
 =?us-ascii?Q?n/jQis3Qc32bQF+kGV//4G80NACj/Ex2aOZQUUAYE86z9hdydlJMx3/6LGQO?=
 =?us-ascii?Q?c+bnscxWGRYfM/gXPhutOO4XfbP6D3LC8/UHkF7jPBYbQjAI5uIZ5gXYVHDZ?=
 =?us-ascii?Q?fVG59U4Gk6AFpZo7fP1vu+oznp1rWdijFlLnk/cF1nJuYdwT1XttfajTiuKg?=
 =?us-ascii?Q?IYFJChgosOeRgc9dGm3DL3iR070r1+xAPrKIclsiPwzQf3Md1PAptfUZ0HUo?=
 =?us-ascii?Q?v0FPB7hgjcD2dT3CdaJZV94t4xttmNOYMqd0OH9TOCKLIR1r1oxFzi7jHT4r?=
 =?us-ascii?Q?fVE5xfFJkJtkmRpB70Wr0z3tx1GyHhw8hhrXK9imSNcGJGAvlQ9rC5YM5nrj?=
 =?us-ascii?Q?hOLKctALrq5vPklyjNPT4JfOmgL2cJlyoZ5zycyXJ75eQfLiyfjUgQVgtlG7?=
 =?us-ascii?Q?ukl9am1iDDSsl5hlw3UT1E0+1os0abZHxyZpCFkZ3TGh5Vr0OiUsQQdg7EoF?=
 =?us-ascii?Q?BZrl2pjJmMUHIrjgkntZdO+og2glkEnTlcP/LSlteVIraZoXzDLaGs00Kr7X?=
 =?us-ascii?Q?QxXJKXWnyyBvzrMdW74vc0pTji3HX5r7EUeRxnnmsjy29cOpAEJbbHzfeVJ0?=
 =?us-ascii?Q?i281Vt4O11tp3mkxYSfqVvVE0nZyGQ2hOcFG0fB3s/cI3U2mhNr6mZW3Er8V?=
 =?us-ascii?Q?Xn0GSgZb3uCMwOhHcknCmltkxddNBVLaqXcdd+zIPl/p8dXKf+5/ZQfy8+S5?=
 =?us-ascii?Q?qWRP3zGoK/PO5yhTpF4S9l+Rwu4FNwzKDF0z27ItFzORkC5f0YqwSciQ8Iir?=
 =?us-ascii?Q?JsQ7p94JmgeIJ1JckhJbX/TqrUDXvyrQwh4OpL1z8Siy5n0+Njl9AEjpyOCO?=
 =?us-ascii?Q?dfm/nu6qQwLc2AdYlyFAEiVzEVlEy56au2rV1MU9Xw35i6F2ogmqYrGtAA0i?=
 =?us-ascii?Q?nlZ115tVYHXh0YFqQe5opGdtlcf/af9pNwbg9K6kx88MUVeEuXp4LVg27pLC?=
 =?us-ascii?Q?uGhtEduc1DAwDbR5jV/EPdp4S3YAteUE3UN+0+WsZSfDxagjknLxLof3EpNx?=
 =?us-ascii?Q?XKg0mWGjJ8JZkDM+qA+9nq2sxd/d4e+XOsMI9hAbKYUd1uah4Zt39Evk5+U5?=
 =?us-ascii?Q?T16Uf42SWNvuI/ZRf71krgypJyhCyqnzD50uDDk4OivoUl6uBeSGYlyc80Qs?=
 =?us-ascii?Q?j50Yy73pVcLLxob9/tsFsSwKfBG5xmQViO001qzyY09nHkW9RNKKnVEqDVLG?=
 =?us-ascii?Q?Axi+2OsrhlpryasyqpqpM1WQdBV0bORTQiKtsdsqLNxIdaEobeUTijyNKchR?=
 =?us-ascii?Q?98rb+z3NZ68kWVjA5RRBqxky8L5p3OJ/OEryIlc0Gtc/5nqRpX65RFRO8QtD?=
 =?us-ascii?Q?9AUwS1K+TYghLfQudiBuYO5Ou+KD2pclUr2RrihaVd4ZAWrxIv0YjhuBUCOD?=
 =?us-ascii?Q?SdywLmcUkLpaN7YKHKWBozHwZjSOIBQPCQrSMWyAfB3QMlsVlqPjOI4eyV85?=
 =?us-ascii?Q?MqCeR4tlV71yzll7yVfsR97Dv7ZJxLcu9XP5OV6VrHaYsp/tQSeBH57oJJK8?=
 =?us-ascii?Q?LXiBBuO/Py2Rf8d5HevOjg0bbxNZXZKjAFICQdp+c+BSmz0PQbRmIanpQaRM?=
 =?us-ascii?Q?sOEhvgK8hl1b+CvjOzhnjFPElyHdkIgBNnsjxMefUroTJ6+DtnIhzcX2u9nZ?=
 =?us-ascii?Q?X169Ag=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1e0eae-4940-4174-f246-08d9e166ce2b
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:29:51.2473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvanb17DhGE4ragWRorT6vaXZb3IwIScdoqH+c0jaRrZ3dhpp4P/b1iK8sJr7vSAkfZ9X+KWU9XRyJxjKwVYOyPbplfrVa3Lc//SYbFs1t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0203
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
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

VESA Display Monitor Timing v1.13 has recommendations for the historical
VGA mode 640x480 60Hz. These parameters are compatible with EDT
ET057090DHU recommended timings.

Use VESA DMT timing parameters for EDT ET057090DHU panel.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e46db5e359c..c11427f94ac5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1598,12 +1598,13 @@ static const struct drm_display_mode edt_et057090dhu_mode = {
 	.clock = 25175,
 	.hdisplay = 640,
 	.hsync_start = 640 + 16,
-	.hsync_end = 640 + 16 + 30,
-	.htotal = 640 + 16 + 30 + 114,
+	.hsync_end = 640 + 16 + 48,
+	.htotal = 640 + 16 + 48 + 96,
 	.vdisplay = 480,
 	.vsync_start = 480 + 10,
-	.vsync_end = 480 + 10 + 3,
-	.vtotal = 480 + 10 + 3 + 32,
+	.vsync_end = 480 + 10 + 2,
+	.vtotal = 480 + 10 + 2 + 33,
+	.vrefresh = 60,
 	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
 
-- 
2.25.1

