Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F6074D754
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542710E140;
	Mon, 10 Jul 2023 13:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2104.outbound.protection.outlook.com [40.107.215.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0DE10E299
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 13:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN8Pk6UmfAmCOi/yV9UApqR7xOjvTuHu69XwHIgfIwKeHUFWNryN+JcXzCRZ7oh25Q1DfYfLDuubzJcoMf8E+0z2/hEpENlfqwzCyIqr61KgCKgfFlGyMp/Fp77rk6PciP6cLuD/aAyaOYNNm/38n9Vbz6Dg2PbQfTRl3OLtSJgC0A+tpSgWwSFERsRPTbRxrHbyXqkx2luxnqloKZ/pLZcMfLYvSArH63FWrifwgYFSVwZ8FTtPyn9T6jNKsysUfEdFGY0RgSuKlFAG4Gh6Wt2IAxC73XA6tUPJW7stic7t4CZRfMb9E/ct472QuMjK+fZCIDe7uUJCMne3pnzUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWZj1Nag3gBRifYS71xzwmE9Gz0lr0/Mqy+4hbv/PI0=;
 b=A7yy07US4rsP9PrphwzWIecoZI+thBNePXxLmM1kJ2TsbFZK8dGoPMvLRk4xEhUz/gIWlH2iMRCCwcIUdQtfLvvuWVdUs4tg+pqH/+djFlNGHkv5lDa0B4U8q1wzjjP96Gw+pHRb6vMzjuUx1AT2hHluUEtwJqaq43MAZbmSi5830BzckiDljevBvfmTu03r27eFnkulssQl5cvnYAitPsTRX4LKp8bmbKA+riqS0vfswYVPh0+nC2tbonvi4GuMaK0ZAmpSf3JtlihQtD4uaBmwv/BMAkFXJnSAdhG5pQI/TFQkZfWIYjztpDsm80Ik2+lwmI2nXCSVYFVM8MTFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWZj1Nag3gBRifYS71xzwmE9Gz0lr0/Mqy+4hbv/PI0=;
 b=IW+3KkjTzy2i+s6iOlRY9VSu3cJNLkFBBNxiN6k7LxBrXlREHPx+yRuA0iAa8gXHokt5WlC3gYR4lI3rqZ4PSmTFAkBx0XwEi9W+nYDP5jUcpy3Bn4UpbBD0vBW7ft39YDMRjrLwrlaQMfw6T7lbSlUhwOURaXumvZaBR/cJSeG71smo4kdZFMBuaoMgBtCMT7xEXGy2MpZoHSNH8bdBBteBvVgoATnAOFRUL3KUvPyxckhp4pmxmeOJQmUHs/p489njvOj+K9hK3zrnkXKOzgC78jzSJszaKsDdER2WPqD2/Zdv6cpTGtxrphkJNGxhSYP1GRCKQCoB75pg/DLuHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5131.apcprd06.prod.outlook.com (2603:1096:4:1ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 13:20:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 13:20:16 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Helge Deller <deller@gmx.de>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v2 3/4] fbdev: imxfb: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 21:20:00 +0800
Message-Id: <20230710132001.50764-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710132001.50764-1-frank.li@vivo.com>
References: <20230710132001.50764-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 2034c2e6-bb90-4771-1dbe-08db81486688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xJEoGisALoOZhGS0l5YX627AgWmElhFTSpO2LEpUcfWoZjFdFqoviR/lKMJbuC1clPROmmSELvf95rShz8DMpxZvMZJ15IVgfIeUlxEVmKM5qjoaHD8SFQme4XGzuLeRPNwwapfFoukLCJo9wCKkIt6KHzlUtcX5YKu5NopquxMtmEO9qCitwHbhrbRJxsbWhOXlOyRitlGcHac6s/ijCtK0xeZCrQz+HQtCVdwq9VWY0h62id1Eepk+2rR7F9W+IECdJ+argJDCRRjzUnZVNvMqaSOfP9sPlicoYsgmaVOcsxwb7vYDX6eC/UUdMFQQCASVQmuYoTE24UvZki+Fp0zVhVvIwnM7SqM670PtugSszdBOnzDSkOfQ2hDlkc6WTRB9L9U8OAH/FVFE35ns6HL5ByZTm6Kz1G7DdQ7l8JAuix/8NqiQa15xL5bHTtCOsTIb4HEIh4CVXehHUvr+6QxvjUS+rHEIwGTwJmrBmKlX3HtRG3KAA1KgGE6v+NY1mXV3yY8dbrdJ07uGrx82hiWt7D5ffc6xQpJ0umUMYNejqHcULtVTuTOVRQDckSF65ho4Jc456Yep0jwZru9HiE6XFqwCW7f7X4G+q7/1DYMCyDDjlByQ89gsuOc6uDet
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(38350700002)(86362001)(38100700002)(36756003)(6666004)(6486002)(52116002)(110136005)(26005)(6506007)(186003)(6512007)(1076003)(2616005)(7416002)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xylkbb01x1myo3KuV0eseSgfQrIkFzybxTeozMC1qMFNH0mOWu6AV6HK07+Y?=
 =?us-ascii?Q?8LqZHRAz+NSDGe/SWSdVjwlg4/yIfJ9dVJyKCxnJR2+GXmz6sWn797Nv29xa?=
 =?us-ascii?Q?MLZwGXTZw6SVf0vek19RTFyK1RTAxJZDBbkdh42Cl3Ee+/dnG95a3NUDnp/D?=
 =?us-ascii?Q?E6h7IGtWB5AdUREyYNwMelLGvVByt4pGtRR33sqmcvd/S7QVo1DijAZYC3fY?=
 =?us-ascii?Q?DFrySxe4IIXWfwL1CHrWKKSFdMZVz0ltXdNrZAqXA6cpTuuq9Z2INgu9Ii+T?=
 =?us-ascii?Q?JwMfXgSXozUWkkBXuK/5WZuXFAuKS4HH28QRy7iTzeSRBV2hYHzNPfays7I/?=
 =?us-ascii?Q?nKwo5WUcjUOny65Lty2Xkq3rQNkdddVv5f18oXA7L3Ny7w4332hEleg1l71L?=
 =?us-ascii?Q?jwLlRxuQtbSycWlPMQ9R0EUD1I7SSVKlDwGTSrauoqLDk06gBecJSCd3g1e1?=
 =?us-ascii?Q?ayztx9SDNGi7MuGIHVhv1v2YWKTtXIrgzYyagesZ8/MyI8VNmKrvvQfYyOh8?=
 =?us-ascii?Q?WMqPDaZ+knV+1ndlX5Fb+h3WfBdYVfY/5OKP5oC/b+YxGUATYpc4Hw/P3Ove?=
 =?us-ascii?Q?xD4ZYCf/lE+zcLmXeD1cAmajoDlJIVsec3uSs5SziEcpRM8YQc/aeiR5IkJA?=
 =?us-ascii?Q?tBDPN/TStv5urUugsDb0UWCGHXMESEmSj3KCeKxzvmHGWVuQy1Ta/aQgIf7b?=
 =?us-ascii?Q?m0UlV0Fv89DmuTUxluXempVyBNQV9ddbCQwdaGAKey4xGXQkZQ+WubLVxVqG?=
 =?us-ascii?Q?Exnw4FjrLUOo87J2McP6QYA6fQVhTRlzqvwmnRNL9BdhYlCnQzPb0s+HD8gK?=
 =?us-ascii?Q?0HGpvukRU4eAFchLISBLy/bACg7M2en0WjBkEVugU7pDKN3fl6bCdKuq8t0E?=
 =?us-ascii?Q?MOhNEGZYO/tgTMu4IXamPLL1o6cktT2r9mcGeNMfkxba4PLpgi8EQSnXkJTn?=
 =?us-ascii?Q?BieBhLMRwQFfB3OEwF3+7g7EzWorgGWLAgq0qIBafyfFBTW/TfH/gzBQOOUZ?=
 =?us-ascii?Q?o+YE053tBV1HWYiXL++snx5W5h7b3Y1d9X7lBTqnjEU/1rmUQezJD5PbeOdG?=
 =?us-ascii?Q?53adHUk/MzidUcV6baavzfIusuL7x5vrdcmGHYp+vDBpJ9VaSJdPc6E/AZ3X?=
 =?us-ascii?Q?N/h02sW+jImJ/t287FTCLXfuOp6kzJsWNbhJckWzGsGK+WTAj7Z0fWSIHnY5?=
 =?us-ascii?Q?0ob5nfMgalJ1pHFQgz0V/Ehxu25N7pIsQJ7IzV2JPxHn/hxas39ebLVJNpl2?=
 =?us-ascii?Q?smyj/QOC7+P8ho770nKnA9wWuumSSoS6QgDM8h3+XAy8X2uA4kdnKPZrfT0F?=
 =?us-ascii?Q?vxF4Q0HSwwBywiBqRKxK9DvZ7h3E0EKWj4FAQdXB8vSSeQ3/RWUnFtVKbKnD?=
 =?us-ascii?Q?cI/KrtEVPwlxGQknFFGK7CQztORaAFQuQJx78ieHZB1bHjGWOL/KcExC2qG7?=
 =?us-ascii?Q?I71LSH8i3eURK9ColqTxoYS6Yf6vJ9iJZ5be2917ccZzF33bFwMMvZgH3iAA?=
 =?us-ascii?Q?yyd5S2u1JDWYInGISHSO2u8MrzkeuEN6QAJBw5QT3j5glomLFmaUkEbRHuSC?=
 =?us-ascii?Q?8sufAECj8AtxpNHXKKyLECC05GP7lq+IIlp9vTAQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2034c2e6-bb90-4771-1dbe-08db81486688
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 13:20:16.2867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+rVaRplNv0Yacc4aP2JgmdK/wcVr9Wnge24w6CYMV4op7KrJKehLaaCNiZFG+d/GF19WdiyhGmm8ahU6a5wiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5131
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
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/video/fbdev/imxfb.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 7020b5f6434d..4582ea801121 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -869,7 +869,6 @@ static int imxfb_probe(struct platform_device *pdev)
 	struct imxfb_info *fbi;
 	struct lcd_device *lcd;
 	struct fb_info *info;
-	struct resource *res;
 	struct imx_fb_videomode *m;
 	const struct of_device_id *of_id;
 	struct device_node *display_np;
@@ -886,10 +885,6 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (of_id)
 		pdev->id_entry = of_id->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
 	info = framebuffer_alloc(sizeof(struct imxfb_info), &pdev->dev);
 	if (!info)
 		return -ENOMEM;
@@ -971,7 +966,7 @@ static int imxfb_probe(struct platform_device *pdev)
 		goto failed_getclock;
 	}
 
-	fbi->regs = devm_ioremap_resource(&pdev->dev, res);
+	fbi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(fbi->regs)) {
 		ret = PTR_ERR(fbi->regs);
 		goto failed_ioremap;
-- 
2.39.0

