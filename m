Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B847A72790A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6D210E59B;
	Thu,  8 Jun 2023 07:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2117.outbound.protection.outlook.com [40.107.117.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4318710E587
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 03:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+VRc7YAHVZQGiIklcBlLHP/nNfjaAM+pn4r3OXvo9WLgwi7s+BksT2iZQpwBEVcmV+vjUEXe9+hj4YOiwQEsQ9h2WIvMhEOt8jsD1kwyZHeApD9ok+0dPMYIKIGMx+FgVbAGBx19hAUlX4njqAkPRr7Hnu6N9wkqnYJkXLVp2wXRBIl8J6QUhssVP1+zwNkPbqb6zXx6AGBN2mtFUiq52IYd2TlwMk0NdHpN/2LD3Hgu4HNXFd6UJCbpPJztRlF6rHpP+Pb7K4GZe73AAjNVOQAAHmQ0tyWfUErXuFCUO3zc2UIGBHopeRDf212tFwQXP7w+EA5VV/2gjvSikL3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj4d8GTPV4Tl7wg/T6mSlLT/xj/BoYa0Uha5ikZBUu0=;
 b=TWT2sMoW8KYdq2FHPgK2sYMpCOnjP+ulWvXbIMR7gOEvXGOGZSkF0yL7R/UAeX9ymqv4mUddQhHUKoM+NmYW96FtRRX/Sy6kXJ4lxL3Z6ku36rv1VuvLoKyQsxF2YYfgt+B9x3zLTE18IJL1qpUVG4o0YS6fKrPSmmFXMU51pTh+1n2Y3Qio9m4thqPqFkAtGBzk0OCFJyrtI2LPLx86CKywVUcme/sw2Zv1Hf7WjgElF5TfbEFGdd8YjCLVi4+lSBsvfMApvCN12Mi+pUXIQeisxemC6TYQhtPzrICRLZHtIi1UP5aXGodhg1suJYu5kWC400RWwU+K/2jP3xu+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj4d8GTPV4Tl7wg/T6mSlLT/xj/BoYa0Uha5ikZBUu0=;
 b=DDMD+qckyqhSewlYCYIvqHtsPLPpdWPyJz+3brXRk7wEpQvxJ1A8na9WDCr2tzR+cnHhw2s9/Ekw0Y4HPjncoC5w+vJcraMflNegeJQdvQPF58lH0CfNs+/r0uDrhgfETTeH0QTUcEwrlnmXl/BT/Q8DfI10mG/PbPFAaRb8huMDXKuylYblvKmaZJsvEd1U6o3z6bb/PTQS4kW5aTPqm6K74CNauWiB2XoXZzlEXnI9JyuGD7bWgJTZ3yAFXutpCfh6YgsBzR1S1kz5NjLLLp43J2xmgVMCnQTr88wW/SmXa+Qn+xAgPp5cl5alv77VJK1Oo7toxqZiqZRt/cibmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14) by PUZPR06MB5745.apcprd06.prod.outlook.com
 (2603:1096:301:f6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 03:35:19 +0000
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::dad2:4104:ee24:c5bf]) by KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::dad2:4104:ee24:c5bf%7]) with mapi id 15.20.6455.039; Thu, 8 Jun 2023
 03:35:18 +0000
From: Wang Jianzheng <wangjianzheng@vivo.com>
To: Artur Weber <aweber.kernel@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/panel: s6d7aa0: remove the unneeded variable in
 s6d7aa0_lock
Date: Thu,  8 Jun 2023 11:34:46 +0800
Message-Id: <20230608033446.18412-1-wangjianzheng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:404::17)
 To KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4211:EE_|PUZPR06MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: e3721fab-77b4-4991-033f-08db67d1611d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nXgEZkPsYUrXJmc8gGyv+2ck2PIpBxJtG+pLR4wQqX0unqGI2jko6PLFmv98sOigKBf9DF+CM/ZKSg/IKRwnu0t92L5wNiQTm+hxmZIQ/253nRYslwInoRazGV2nMuSE2WZILpR8Ogya2v0ehQVj6b7cVHtTK3MQYgyZwByZQVqmD8Owx+Nm94n2C0CC9QBzLWGQk8uEeJLVZRqoq5Kdg707+VuLuq/LcPHsYKLsmJxa6aJUb/DQiIOC7JyEodogquWJ18a/FUbkqvCRyDX8C2ndibBauZt9IDt1gIOeZiTsNTvcliGenwC5UjbVixhc8Qokz/pPfv05kGe5r3paliHwJeKz6pafMNuv0uCiptbhJl8AiV+mONVEE5bRqUYvS3MH/2L07nwZV67GwfkrW6BJ26op1LR6aDdxe9SMESU9DRikG5irN/8HqDDeY1ppm9osUrhiGhFk2KuwIkcezIVT/Nba7bEJ/cNj+FUKIWYVrd3JE2KGRX95XgGuZ1ynrK9eH7Dv2W7N5byg7DpQuZuJcyeI4tBHcuKnod7GHWRsvclv3mjEYOsggiLQu49bTtzXpT7z2/wUHf0td7EsfGpFfPfAAkOBHIzYcoIBbo6Nz5pibs+RMHcqw4WC+cME
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4211.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(5660300002)(478600001)(36756003)(110136005)(6666004)(8936002)(8676002)(316002)(4326008)(66476007)(66556008)(41300700001)(66946007)(38350700002)(38100700002)(4744005)(2906002)(26005)(6506007)(6512007)(107886003)(86362001)(186003)(1076003)(2616005)(83380400001)(52116002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5KuunmFgBxWvv7pXLrn4R1SeFAolmnoO94sfA8IQ5k5yrUZDxpvVvyEXAnmV?=
 =?us-ascii?Q?I1bt3oOY8Jx64R1hb6Q1vuZDCI0OzXRuhZtzSZZQFpL+82muFlI6ESdi3B2P?=
 =?us-ascii?Q?5oghCtBRuqMSuTiXv22gI6SbJeBC3uuSq1s3ag8VYVpNJE0Enq9KpqWhBVwG?=
 =?us-ascii?Q?OsEnd8V0NYF76hypVd6bzeXMRkw5locAes1zWGJG/Ak0CvZLWakd41uizMSm?=
 =?us-ascii?Q?+a1IbLixw9C6ANKuhrcWjIFgvsncWqyAhe5cgL6F4QHVeawEDoCHMKOWxCgM?=
 =?us-ascii?Q?vJ2l9ptlixX07d+sxE3lZNZQlnNF/bJRLUYcc5KyL7dacvmFwbrNzDs92ePe?=
 =?us-ascii?Q?Afrrm1Vwyzte+GWU5VpfwM4kpIW57RyZhtR+O/UrEiZlG6Bcyl8UdW9yuKm/?=
 =?us-ascii?Q?83kAL132aDfVcw45TBVRXoyk6x4AaYKSLpqH3RwUZFEnIRMblQNAZXcAjiC4?=
 =?us-ascii?Q?gyCoV3FJTFxM5tZgx85qgb1KsYuWIVCOlnR0Mse9lCjSOBdzZEhKwoCG/7ca?=
 =?us-ascii?Q?B4FZRqq4ruAjqcSGZh1xW2z+Xm+6EfyRB15aIFoamg0lJwTDyo6CuKe25fDo?=
 =?us-ascii?Q?9BjVKqLe7tjG1ORgLi8JtpUzNPID0EgNz2qgDqMwBuISbSx5OGYN5+IKDII3?=
 =?us-ascii?Q?7//oPPVopkZHW/tdq0g/dYcqnpzPnME8rx8oTfrReh8xmylcGC7eaa6VDubz?=
 =?us-ascii?Q?yCaXsiHmp43i+BTxuC76MY3JM+Aef0GMEbs9WvWRlcLaFEPCG5mkXNw3/NHf?=
 =?us-ascii?Q?XEzKxC2eHPwqYd7IN4PPK5HUpwiUDylExieVhFYkEKKzELVPvAbgTjEKSJpD?=
 =?us-ascii?Q?6bqtvkOQ3Ea9QKWw+g47RwcDD9/Zy5MHjwxe/4x5JMSoKpPSyITnWbOWm8aY?=
 =?us-ascii?Q?BI6Gh1ul6pm+60zS3Y2jnO9Mogdb6/tloc9eCV4IkxvHlpsNW86Prk1ZdmEL?=
 =?us-ascii?Q?ZsNdc85SJpwdnYvVyop5DsPTsCuxRDOpiQbCU7y2IdffxkaeaUvv+pgemLqJ?=
 =?us-ascii?Q?QGR6EJNJgoB3wGAEPzGCJMQbsxmNWxTcckNFQF2Qq4TC/+aT6Ldc9UmNHs8r?=
 =?us-ascii?Q?5dUeSRPUPkSXZ7T+/uzy1TJ7xjg0tNFG5EIW39vfN6WtYZTs7AVQMbZKASmz?=
 =?us-ascii?Q?rftH7j84Y906GK9o3obO0HZtTQMgxgFPMOkT+h8KPX7yKOtwNHJpMzayVp9z?=
 =?us-ascii?Q?QgVBR1x0wQR6HNzRcvQxgYaS2sV7CckuOjNaTduUIMx4DlKcNm/a8S7AEfK4?=
 =?us-ascii?Q?zGbItd655nPspK3xc/cv2rtgiLfWcOLuU1NhV+xhl0fEpHHpXJ1cyd7smMXg?=
 =?us-ascii?Q?7rwxkXxUgNnVbp8wCNmPr4F10tfPdmu0SILXDXRJiMQKIlgaf+f8N3Fi4a2U?=
 =?us-ascii?Q?SZey9EDzrWEFUIWrC+1CVRmiN1ShEeeFc6aeKubff79tjBmtjOidsvWUOpku?=
 =?us-ascii?Q?7XrstzKew02fk4AB3U7z2aYvT0jnXfN4juvE3UFmtdSq56KRMo9vX3eavQZo?=
 =?us-ascii?Q?AmNzrW4CS7dcDzBdTOgr/m7kk/1jH/9CejAZIUbzbhkQutXNpOKuzO1P0w37?=
 =?us-ascii?Q?ag7F5qnGdZwxvinYAb5JNagkvfyK/WW2P+X6jlsO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3721fab-77b4-4991-033f-08db67d1611d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4211.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 03:35:18.1602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8F9ceTrwDsNAtSY+/XoqqYto+lc/R+x2sCkJThuo5rGnIv1RoXFrRyRy8d3M1htFgTZA8V3AaZny/fKoyMnHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5745
X-Mailman-Approved-At: Thu, 08 Jun 2023 07:44:49 +0000
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
Cc: opensource.kernel@vivo.com, wangjianzheng@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unneeded variable and directly return 0.

Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index 102e1fc7ee38..fec0d014fd0e 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -66,7 +66,6 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
 static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret = 0;
 
 	if (lock) {
 		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
@@ -80,7 +79,7 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int s6d7aa0_on(struct s6d7aa0 *ctx)
-- 
2.39.0

