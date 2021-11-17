Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4262454647
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 13:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3D56E21A;
	Wed, 17 Nov 2021 12:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2131.outbound.protection.outlook.com [40.107.215.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B796E21A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 12:18:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYpAobBUF3gqvTGir4Q+wli4xmn4FMRgJX0JWL5TjUcvRzc+zW0RoXJ1flLWNYk4qBNeVyoMhzWPxTEs1SPWPzS1JyGrHq3AjFwW7KvGj8uVyvo6BfWg1iZVqczmeL+fbafgWMFNoWyKyQr+sbfMvpFJz1swXa9uGf2WwnVrXLi1MgPrg9Naajw+F05xyo4iA4j8IL1+LQ44HylOfokF0kTISgvl0fIY47LQj7ONMHVBoEtZ6xyqmXpMMcj8qQ6Ljcq3DQSEkHhAGgGXX90qo3U7mkOFZcXRb1GweH3pQFMhr0Hd7hMhogRSXHCwFBixJVZ05LvxBD+EvANAwyz/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15VuHjSp6q7YbiCOqlzawGrhlRrQZiqoG9rw0z4ksRg=;
 b=WgVx3F8Dz6TrQmOEapdgSdxLa96rjuzxkS1ms9bQqnnOPobzXNlf2eYkQrX9dfcHNo2u2ue/GEh2dQSM+K3mkNb7ahxzo5pswp4sbccnMj9xe7nxg8BO56kYVObTeECpgzIGbr172yUgoPJgCelV3eon7n/D35bxi1WfuhiHkvRdWazARitL7TDH0DinPgywoG9kkNndBcNtBd9X4BSykNxr2PI33oEpYjF4TpOhUEKwq4tJ5WDNliMysxzdLvNcXhnfMZpyxQ7GjUh0uIO5HWTJnrlhyq3PMiHjNUQ+QoSMpnULorcP3TWtzZYnK+uu0fPeUWHIOLDl0UrbKOuCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15VuHjSp6q7YbiCOqlzawGrhlRrQZiqoG9rw0z4ksRg=;
 b=BDsdPeC/21WdJnq7S9po2GL8ttKHeScPm9M5CPxW0rbDA8FfcvLLK512wn8JLQvD34CONaY74NX8qK8kHGbcknsn7lT4kIG8k3xHyJLNh98y8SqSqKblNKqTVK+Rin5Rk9Wems3piYGoQvQcE0McEolMGoj7o5c891muOt05TGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK2PR06MB3282.apcprd06.prod.outlook.com (2603:1096:202:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 12:18:54 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768%7]) with mapi id 15.20.4713.021; Wed, 17 Nov 2021
 12:18:54 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Guo Zhengkui <guozhengkui@vivo.com>,
 linux-fbdev@vger.kernel.org (open list:OMAP FRAMEBUFFER SUPPORT),
 linux-omap@vger.kernel.org (open list:OMAP FRAMEBUFFER SUPPORT),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] video: omapfb: Use scnprintf() instead of snprintf()
Date: Wed, 17 Nov 2021 20:17:44 +0800
Message-Id: <20211117121829.11141-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0200.apcprd02.prod.outlook.com
 (2603:1096:201:20::12) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by
 HK2PR02CA0200.apcprd02.prod.outlook.com (2603:1096:201:20::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 12:18:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2bed1e2-c158-4698-0f28-08d9a9c46be7
X-MS-TrafficTypeDiagnostic: HK2PR06MB3282:
X-Microsoft-Antispam-PRVS: <HK2PR06MB3282E5B00233C81F50C280DDC79A9@HK2PR06MB3282.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NrRo9HOJqgjQSmFjhVo108yu57hAAGxMcmRD/3erhbIV39pr2mI1H5cpFLn5xE53PjvUMTjIf/QefLuC50qWW5nSQIKwNDwGPKnaEWHgmjeJAzPOS0MLogXd7vxBBiTysmNXfatK4xlzFhqxP6OFDgNXWRWZnWmpK0nVzRb0bn89Q4+uWp515xxVdWb6LBl6rIRUBKBSuuNMPNnGV9X4ySfisqCnAje5Rgo2qBkRDFnx5Qs2OS4UhURcaDevajPaJjIx04Lg8Vl7Ohk0XLXSi2EyGyvWhjCsY+6M3xxJfCbPB44QMXvZl052/FyNnmXEJe2bxIM1RezCkWxuZSgNC6qTig5+a1KZu0WdHWCqnaVeB0FzmAMPMX4g69IY97B2Ca+NxgdDdMDn9kOREBMCkr5kbXy0gSCXVk4RLUqBGCurUggt0880QLF+Evmr9ePzDp4pLBXQ+DjVto8/Xjr95pG43ETh945lyJbe/3m57Db0KbAH1qisIHishKCXMQhuAOB+ocvq/+akd7k/bKfssEon02qtWLi/HJOBujhVcJX4EqRq0PedSSHHSOy5kusZQqTJeQSs7m5w9ETpJrO43325SldaQo+fUQOln7iVVcxLj39Ru2RDenhKc+WezkNlrIzPTSS1Mnu5gJ6hB+KU8CY4kL4CZALDJupLg+foY6fKwptL1+LjMWSvVWQD+fiepFCXNLxrpNeX50gNs2tPPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(86362001)(4326008)(8676002)(5660300002)(26005)(8936002)(36756003)(6512007)(6506007)(52116002)(186003)(66476007)(83380400001)(66946007)(107886003)(66556008)(508600001)(2906002)(2616005)(316002)(1076003)(38350700002)(38100700002)(6486002)(110136005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7M6uOWMugcm6pXf03RycBmFs4LoxIvRPNlNqpZlq9FD8cYGgNsNGvtA2BdI4?=
 =?us-ascii?Q?8Fb9t1Q710RF1HFCvxBab8r66uie0DOzInLwWBL5WWip4i/vU+U6oiW/1OW8?=
 =?us-ascii?Q?JWVuXwVuouxuMe0lOB+zpgGTP2MyYzJSEC3CeQaxbql5LT4X8V8iGfn87js3?=
 =?us-ascii?Q?tfMB1B1AEjiNJqeQ+eNSd33IX4shxYuIkXxGmhsvGlp/67mpaRAB2aGq6B0x?=
 =?us-ascii?Q?ugcMsbpPjRRZ7uhbtys+vW8ANM+8Ay1y9H2qz5XGzAaYlaEok1SiGc73vN8S?=
 =?us-ascii?Q?KUtriEog9ePFMeeQJQ7RaBi4wRy2AqplP2A+fXGO4wUzY2Xc9h7NQ+umkzIW?=
 =?us-ascii?Q?lhYsZZnBKIAIkc/Ts8ng05aLEx9FOU3fQGgg5JpGhp0qh3OQg2of/3GpCtUC?=
 =?us-ascii?Q?5yYR4xK/9LvpvwV38zMTMESmMDT8ujTlkEKhT/hM5qWINJH6GmVjzEw9cA/H?=
 =?us-ascii?Q?OIP5Vlyj8PDP8XUS++koa93ZDSWXCWSDVHkUqdt/TC0JZYAHoqdMR01jNIYl?=
 =?us-ascii?Q?9ORm9VXDxzNwZonY9tV6mUOxC6tTP7ubia2XoPI4K++fV31TrYWyJGpJxCif?=
 =?us-ascii?Q?iA8dkvdxHoeFR9fyaneFv4TFc7OA0paHQ6z7xYrOPfRK1SUJgGXScnx5d7Eh?=
 =?us-ascii?Q?ihpE4gQA4ZXTdlfeRlQAhSzy/Sv3nbbEzUI2V1zz8/3uPVKLttRdzDityaNV?=
 =?us-ascii?Q?mNwhziowlu7IQYXLw99CgaI3Ill1m+28RzqJOyCsLrzITBZ/wVPjkoP5gL3V?=
 =?us-ascii?Q?BgLhefRNuVbIwH5JLTAqvlezaLL+bk4FKqZt4+evcdI4S4ZWbL3brF7l8Gdz?=
 =?us-ascii?Q?IPe3SSrpL7jy92r7Qg5zkPwpFBALSM5GqjY4K76UwcEOJdpi3T6S4agr6CVv?=
 =?us-ascii?Q?h3gymHDaxd2pwoEqbrG7GbnB5r152cZKENtamANgNVUwOdBGHIY3zINMirk1?=
 =?us-ascii?Q?0YHEZvn3JS7WLyLtQ5CuPsOIH2xTMOrQPQMdlx6RIdf3iowXJc96ZM9mU72g?=
 =?us-ascii?Q?ug3Kgpld5lV4YFpUiB19gnhEa/3/GEaZldsuR1mJ/o2/frWhLM3EBhHq/Mbg?=
 =?us-ascii?Q?OUtgSKayFUndKpdYM/1hy8hQp55Xzd+FxX227fR6uEbqbRUQGa9/4E93+noN?=
 =?us-ascii?Q?dgyTnC1hSM7uc4KvUMg1rEw9gC2CHgnKq+88X4fY/jARfDl0clEJzCz3+scq?=
 =?us-ascii?Q?wIfqQa2Rm+f7dXn1/uZQXbaeoujeoa8pV0a95EJ7Zih+cQPpEh9cMNpI3tb4?=
 =?us-ascii?Q?ZzTzcmNAJZScLJJiyZnPKzvd/OFscdZqvmN7GrIQfUuCxQqz5YUbqqbt0XvB?=
 =?us-ascii?Q?wnRIs10oyCtXdsGkdw1EKrzYY19YL3Nnf80tnpwXI55ZBXs31twsDbxFp/qg?=
 =?us-ascii?Q?AYlP4Qza3P/v4LolHnjGVqRuILVcUkXEtzjeBEtUi1efF3cCvu3r6zOihv/N?=
 =?us-ascii?Q?E0HiA5tF2SNlaxCvxW3wo3QiFJZvYg5kk4pJBby9wZNwn3xPH623pKo/EfWi?=
 =?us-ascii?Q?aZbT5LQ9SwKK+EZpwQXGLA2IAFsyowmKTG1ZEXEZKXoHYjpJKIveicUjp2Xp?=
 =?us-ascii?Q?TYNstJ1FE6REjKNY8n+G4YCd95xHZUNn0i9CCgGwQkGRDDVsPbOziCJa3g2R?=
 =?us-ascii?Q?BGIjHpq7ivHIoKthlSEN67U=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bed1e2-c158-4698-0f28-08d9a9c46be7
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 12:18:54.0863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXvQk2bPaW+URX+ivaEirxeD9HJ2mYE9ReoP79oMBUBHxE7rcZdxB5aYu2EECQl3eCDW91QtDi+O7ATh+XZb1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3282
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
Cc: kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following warnings:
./drivers/video/fbdev/omap/omapfb_main.c:1382:8-16:
WARNING: use scnprintf or sprintf
./drivers/video/fbdev/omap/omapfb_main.c:1306:8-16:
WARNING: use scnprintf or sprintf

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/video/fbdev/omap/omapfb_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index b495c09e6102..a0d472943c60 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1303,7 +1303,7 @@ static ssize_t omapfb_show_panel_name(struct device *dev,
 {
 	struct omapfb_device *fbdev = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", fbdev->panel->name);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", fbdev->panel->name);
 }
 
 static ssize_t omapfb_show_bklight_level(struct device *dev,
@@ -1314,7 +1314,7 @@ static ssize_t omapfb_show_bklight_level(struct device *dev,
 	int r;
 
 	if (fbdev->panel->get_bklight_level) {
-		r = snprintf(buf, PAGE_SIZE, "%d\n",
+		r = scnprintf(buf, PAGE_SIZE, "%d\n",
 			     fbdev->panel->get_bklight_level(fbdev->panel));
 	} else
 		r = -ENODEV;
@@ -1348,7 +1348,7 @@ static ssize_t omapfb_show_bklight_max(struct device *dev,
 	int r;
 
 	if (fbdev->panel->get_bklight_level) {
-		r = snprintf(buf, PAGE_SIZE, "%d\n",
+		r = scnprintf(buf, PAGE_SIZE, "%d\n",
 			     fbdev->panel->get_bklight_max(fbdev->panel));
 	} else
 		r = -ENODEV;
@@ -1379,7 +1379,7 @@ static ssize_t omapfb_show_ctrl_name(struct device *dev,
 {
 	struct omapfb_device *fbdev = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", fbdev->ctrl->name);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", fbdev->ctrl->name);
 }
 
 static struct device_attribute dev_attr_ctrl_name =
-- 
2.20.1

