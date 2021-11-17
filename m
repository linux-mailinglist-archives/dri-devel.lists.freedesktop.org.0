Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14874454648
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 13:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C317A6E249;
	Wed, 17 Nov 2021 12:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2111.outbound.protection.outlook.com [40.107.215.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAC06E09E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 12:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eU5BSP/cR9otxIGZ4y0f05ZjZ0VeVVtFOWS9w7wM94IyP39mVm9BzLIRYfEXZEjJb7YU5PGjZdrw8skETIAf+3eE0Evb1wSyjPjCO6HV6RWZl/9jXjghg/CJ/HSBqIiM/9wagjUKpeSq9r7FmqaMg2NtcRk+ldTIXvk2jV0WA6R67yhUAWXPyNWotl8eccp5cWkpiub7BO0xSkFDwOql0gMZpIVaTtOfsVBi65XTZ9tAPZkz2kegqJvyOxiFxOwMt0q2Ww6WkYYNG6JsMQgG4mM5+D2gbqJrRnTVv2xqg6d3oqJnl7cAyKthN1XA8y0fBX9+dLUMdBEILS0GrMMw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15VuHjSp6q7YbiCOqlzawGrhlRrQZiqoG9rw0z4ksRg=;
 b=cIA0FNOIZdGAS4e7EpeSMC2swt/VX/8yAw2WXQE7d8TJsHxZ3G1KiNqldqu0tNimeoa5UVYfQO4T/zb7pMk2GRJ2h6bhPCBIylay214CkQbLRevEdfLZn2mGSePZZvUY6pMRe1CZkq+fSBEiIq12s6W+U+tN2ujlpw87cvVsUVFQ5CySyygDG9w6e+Dyq/4A6HrkDTtXNpqx0yV5TxxHJlM194h9GE6drqe50jQO2qBWlo8GMco/ls3LLp377z8A/5GoX27fmLRe4kcav7ldH24j/tOE6Mzf9RaSTyNBY4zKjAo/Ca9p58lJRKhNQS/KluIcsA6pZ+OhwuxjdZ9bBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15VuHjSp6q7YbiCOqlzawGrhlRrQZiqoG9rw0z4ksRg=;
 b=nHWMZNEZdi62zT+fDhsizBpWiZ2fsDA6k1ThKVY/4DeoAcDT3tHi0xBU3AtvmPfqgAx6Hy699GGc3+PqgBpnEzDnFv0P9iiJwYmE0CcytQIUc3c8lFhaQI950TwhPXWPgnaH7DgQ4/m4PBqHLNuqYCfItehGtL+pfPN/ngp1Bs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK2PR06MB3282.apcprd06.prod.outlook.com (2603:1096:202:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 12:19:00 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768%7]) with mapi id 15.20.4713.021; Wed, 17 Nov 2021
 12:19:00 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Guo Zhengkui <guozhengkui@vivo.com>,
 linux-fbdev@vger.kernel.org (open list:OMAP FRAMEBUFFER SUPPORT),
 linux-omap@vger.kernel.org (open list:OMAP FRAMEBUFFER SUPPORT),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] video: omapfb: Use scnprintf() instead of snprintf()
Date: Wed, 17 Nov 2021 20:17:45 +0800
Message-Id: <20211117121829.11141-2-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117121829.11141-1-guozhengkui@vivo.com>
References: <20211117121829.11141-1-guozhengkui@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0200.apcprd02.prod.outlook.com
 (2603:1096:201:20::12) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by
 HK2PR02CA0200.apcprd02.prod.outlook.com (2603:1096:201:20::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 12:18:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 364a57db-6904-417b-ca77-08d9a9c46fa6
X-MS-TrafficTypeDiagnostic: HK2PR06MB3282:
X-Microsoft-Antispam-PRVS: <HK2PR06MB3282652C953DDD37CC35F99BC79A9@HK2PR06MB3282.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQW/BFf4DtdVs8GC+nXY1BQ4jXItzIj92sZzEelxxWzB86VvVRy33NmpTfWoFQKFo2Ga48EHcMEV2DZsUpXjo2OZYCPi/691BFUPLzudnDtWTAdp+K0jz+i1BFlGWWq455HNX5Khg6XxcDYEYfTO1twNLimViG+a9eY5f0qwq17iSryeQxExZL/XayA03bMbVCAER4INqPlcMEUuzSR/KMQAewZVCr7XW4me88F7gSnGv6UY9ZSFq/LkHdFQmdYbemqK7jYqDsOaLk4/oJ1FXnIvKrxR4GRdDcT0kksMXGrOFrZeOms7UGQ+dOsUY4QuDE87OpV0iEjLdHIorRlbiUlecqXFIc5RQYtsFGg7bcZcx/ngZdjyCDuB+LL6Tdhx8E/EGCoVuPjt6Odhy8le583HXd5++5JWPHRwVW7jnyLiakLgnuWZVSL4a52oVOnNcFVLuROx8bp1KjicuEFr77mE4hl9929HC33GoYpC22nGKiaAJ9ZpVg7TtBElhWiVx/vOyL4RfzScqeDlSRyHtMWKXayAdXTMUcdaNgU5gfffaXB8NHrM+zJWJQU3OJoYwcFvccI5moJ4PG1TixNXc9XLOt6I7/aYjhaNPvz/Ibz4kT3p227AJLSqIX3lq1MYoLHxoIdttrdyeX7OKd0RRkuZ7Y/7uGLs6VKPAIfc21NG1sVWIbVuO90hnYwdNvqtq/zNaRTCgz8KG6+HZj0ICw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(86362001)(4326008)(8676002)(5660300002)(26005)(8936002)(36756003)(6512007)(6506007)(52116002)(186003)(66476007)(83380400001)(66946007)(107886003)(66556008)(508600001)(2906002)(2616005)(316002)(1076003)(38350700002)(38100700002)(6486002)(110136005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O68PMCk6Ji3GCPNeF7WaWt+o8tv6LZaJi/8dOLixpsUbG0S29i11LIfFligI?=
 =?us-ascii?Q?4VuAaCJerwUy/zRQpglnyVxyJiqqSBAQi8GkRiSJ7cPOCeqPEv2DIJaQTNtW?=
 =?us-ascii?Q?EsDwBil+93/P9j+MNEAiGX1ScUipG9Hd+JcH832cNuaOyDaVMiTc0fmW6k5S?=
 =?us-ascii?Q?8hecSyU5MXj5w3Mjy95rjihWyes1jHK4Jjxy5IgGg/vTDQu+TskpNl1cH/DN?=
 =?us-ascii?Q?xgoTHIFDVLkpp5Y/vCvkpEH74gYjO1L3w/IAeJO/8BWB/bKSbHVxlv0naIyr?=
 =?us-ascii?Q?9VEc90ACkMfCylHp/plfGKywzpuWsVUTOTlhK4+Q2qMdYT7BobXPslKZStgr?=
 =?us-ascii?Q?b1Xw/lD8N5cG+Rcg1ufiplsfG00aUb6YvKT1nIUu0xtjtS39IhHEeptX+38Z?=
 =?us-ascii?Q?Tbrk5lk5Z8V3D+Sha6jV2dA3GiRTevF9o7iAp8KcGXaVEx0/dvOF0O4Le8dc?=
 =?us-ascii?Q?KF0+jG1hEV8iZhaE9qkt93mk3WuCYby1KJ/WWF2LMRjswXpUoQD++Jv3ol3q?=
 =?us-ascii?Q?pAwRE9uhYGqPat6HztVngn9yPmyF95nt5kAgcs8ex/DBewWzSN878qtJKhVv?=
 =?us-ascii?Q?ILtS74rBKaFOLLcEQffqUWCF8E5ae9sJ0fymPMoGwPP4YMBrlDsxPIe+DP0d?=
 =?us-ascii?Q?Z/hR4dgSCapMn0vpkqTHD0AVVvkz2uT6VSx5HqWA2bTEnbQLto4gjqIml7Ol?=
 =?us-ascii?Q?rZhoXRME9Zo92bgt0YlaJriv42cA9tJnWTSkxMi212lklc1DDCqgS/Q53xmj?=
 =?us-ascii?Q?jdq0HiemMFip/iZI9ZyFE/9rC7R0rvxWbUxuWjyF6/FOIxWrPa0wghiQwyVx?=
 =?us-ascii?Q?hO31izk4yEq84TgjK+e574E2TCLjULIKVB7LTlQglfJHQwUg/6nWmGxtzvpf?=
 =?us-ascii?Q?PGXVlb8N/3JVrOuwqTFGWruRgB9ykPJweb5tEM8RC5xdv/uZ7R4WvPwgtppE?=
 =?us-ascii?Q?JGkYRqAuMLH+j0b0XO53CC9B8E/Jo8WfT98+B/rZ0b9O4IAGG3vPwTp4CBND?=
 =?us-ascii?Q?ZQy8+I3Y3Ongf6v1YEu5iNj3yZFCqJ4Zao6nImdgxwy3yZlkiksFZAzyEoa7?=
 =?us-ascii?Q?o8XZ8gYzLYlziEJBRgJKjHsOwBSHm3aQZFtsSZGWPtMvCTinLC0iuMAQTBEo?=
 =?us-ascii?Q?L8KHVW4Qon9/EUvvsoz+lzaL608Pesn1hoIt8NCHt4qT0ZvXYvC37R2esQYd?=
 =?us-ascii?Q?TUhwVHdLveJvWAtN8mX6MKcBNDRWm5Ve+YOAd1PTvQS5ApX2oAtGzQEHwycI?=
 =?us-ascii?Q?NAxKYy/NthLHqwC8M7ZGjIId7arOTzFwcsBhZ41JnUtccTSZL4RWtcAkdV67?=
 =?us-ascii?Q?5qwgKHCPTAxYy7kXWQbmqpPLQQ31KwSyQb/KMqFcSgvA+0j68jZWRzQ6sQHc?=
 =?us-ascii?Q?8cqdaTGS45XZDqhY6xSDwP2Ea8O4hxhDWu55noGuHlpx2cMIYoYk5z5Kj32y?=
 =?us-ascii?Q?xPALKK+0ZqEZDx4N3/4MOQqx66nePtoEHqsIPXeEvJlUCU9ABTyCoVOLQ3/O?=
 =?us-ascii?Q?4Y3c1AnaBhiAF2RUCYAtk/v0cOwtlqsW1L4SDwGRGA0lld1HIpQ7F+Dy44/U?=
 =?us-ascii?Q?CtkJI7m1istYmS+QBkomXbVxIw/+UpYCPkEo7ZtMTuWNasgrKWl5kVhFQjDZ?=
 =?us-ascii?Q?jPVF44E0PxZGfFtQ4TdVyv0=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364a57db-6904-417b-ca77-08d9a9c46fa6
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 12:19:00.3760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGsv/FWlFqOVk0DUc6T0/Ex2yH5soLMBjV57CNJYDznyiK+wJ8DqJYHwpLjbTyrtZJQI5m/UmSlAuPxMTfBOBg==
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

