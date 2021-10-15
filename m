Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1C42E946
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 08:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02636ECDC;
	Fri, 15 Oct 2021 06:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300098.outbound.protection.outlook.com [40.107.130.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE3B6ECDC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 06:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8Vp6GO6ql3okfO/GGwBEROMePJDlGLiOhg5R1iufpgTdUzxSa6Y281dvhUYh1S+ubwLgpXnsZ0Zk6PT6BhJewT01ERCZBht8X9xMvHZ0lMR5h5+gM64zdvWpKXEpISJUMDbe8imi6KxnGu9Oy1MiFIFQScXGaDEntB4UxUsb+eu+talPNynVpkxN2JIlYUe12gwkYqaz8WJDQghXYBALqcEQx6kLr9eUJZ/h1vB97GC//udFp9QDETgKaBJBy7+xWnCHduRuPAi8Ma6aWG4RXGSSpJBqXu6JVzuQ13X96sPOMJ4frOfE0kLBl2AadOv8MSsk4xme1Ksh6nuQR0RzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PrelIsoG7r+wBcj131V/cZ1XCcRe/nkHy6rb17nt0Q=;
 b=oFLB9jMylD+t7fbDOOb1If2ZdpuBmobcnj7ugf+34xTAw47nLcBsLezu3wIXUn0G2UZhbfy48vu9JzCO4pKCJbtZIz/6ZXObpJcw9HK1ReAWyPTgniwEB+MDbSf924XuV91I7E3XIWkEIYJboqV93n8NigADbFc9Ghuag+LO+Lk0M2zrpNbDX5D/j1Xfz24Oh96SN3pfMjSX99/8JOqMcWMA25cDZdZJ4++S7QtjlE6V9fG/+JRYeuHlf8/eKFQutNxSwqQ6jfJ3DFP6eyTqzlq9xcXOkA5QwekjUJ+7eoPc+kl4dM0dIeA1qK/3dpOZzVgQGgVpJOlbVeYQVu3y4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PrelIsoG7r+wBcj131V/cZ1XCcRe/nkHy6rb17nt0Q=;
 b=mQ2cJ7JcUpLFauHXdyitLJxpEq1HwZASJM1A+RCC+c3UHCUCDV6SlkLXH2Mw5EL1NbcvnLHu5qiQkArejjCGx+GZ1Ekz3ACDM5bQ7d2qr/ialWGmrpPdbCgnPjsj5TMsQ9bC1qHtaQlc7VC6nJ/q58XRiJY6WeGr3DAtFkpHawE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3388.apcprd06.prod.outlook.com (2603:1096:100:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 06:48:19 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:48:19 +0000
From: Qing Wang <wangqing@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Qing Wang <wangqing@vivo.com>
Subject: [PATCH] drm: panel: replace snprintf in show functions with sysfs_emit
Date: Thu, 14 Oct 2021 23:48:10 -0700
Message-Id: <1634280490-4429-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:202:2::19) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by
 HK2PR0401CA0009.apcprd04.prod.outlook.com (2603:1096:202:2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 06:48:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeae979f-6f2c-4fe5-8e40-08d98fa7c5ed
X-MS-TrafficTypeDiagnostic: SL2PR06MB3388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3388D4A1D7D2F1143DF068E7BDB99@SL2PR06MB3388.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TKcUupee65NDcyFPx4+cVn+bhd1i9gTihhkNhqtzHhAu2behz/033T8Q9R7znUhYvtw6d3F+OPIh8fKAFiBrzbxLf2rmjFZQ+deo+FgQyGYFcyA+W/6AXQ9bwIMciNhIIo1mOZpLW/vcLQOluNpwg0h2e0wFtZzxYW8SXMEHPIIDw8DMEXSkW4dKXBS7tcqNtdmByebuzIxVbrCE31KBvT4ti7hoUA85RBnZkS1RGIyHjIAPjCuEC3ZiM8UHNqPtSquPug0uNPYaffz7kBuzGB+5zxHYKsuDG+vVCC+powxJl0JsW3p+yuqDHn7UApt/GgnrIXsanizQL4attM39urmHJ64BSn2kiUgAkH8QB6CmqcKMTnl/+tHxEz67EnrZVDNaPm/qOz3O1UaAA8DzuTyZj6+8s56zUCJ3iWZ3pOyzKcnJku2DM/x5wB9oubY3BW01D5caDgFA/DhRiEMs9gHRuEYOC++TJCmKhfiUFgfjLiHB62Qlo6y9gV3a+VfZ3xJ1kkhTCFiIYjt8Vwnd2f9U7ily9u/oGURYOBJA8q2m8o0jallcCrZ/ptb+vvADYR/qdENECMImjfNEu4mUMkOt6eGl9vHvYrS03vtMagcyibPLuq6UZFF3jfOjWgXJbnWPDFJ6cTtagyegLEOqP6vifXhdPB40H0K6bQnR0Sbp77BJKlhMX7RFcb9bEzU9r9UrO+/F1ktCeHLDpnojg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(2616005)(316002)(2906002)(26005)(107886003)(8676002)(66556008)(83380400001)(186003)(66946007)(6486002)(956004)(508600001)(36756003)(4326008)(66476007)(6666004)(6506007)(8936002)(110136005)(5660300002)(86362001)(6512007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fgr35HKhp4jHpJ6KWcSN+sL7N+8w1dzoFLNNNPoevrW/91FRmNR/xOGLBQLK?=
 =?us-ascii?Q?4wDVj3RymwUI6NEpa2SNuoufdbSZw4LrcVxgZ7zVJBMDF203lFq6KJeMkpKW?=
 =?us-ascii?Q?wBFFgRBfwzS6vmeDaSLiSAhiKYnvDrr2CdirHuRlCr21YreAfi57QdI58w3w?=
 =?us-ascii?Q?i40QgvX+gP3XfD38xQ2X/PGBBpwHzqrR/kyBOoqxxbENWKZNsSqsL+J3Imhf?=
 =?us-ascii?Q?IdNJ54ytO27esMPkCMLJh+k6YKCxflAyejPPuhf2xHhlrEdZtNXeib8Zjid0?=
 =?us-ascii?Q?ptE05W5L+l8Z2KRNea7AaHwAcKQND4kJfq1FzBxCILD5AQMjIus4gi1pL3BE?=
 =?us-ascii?Q?zIVzI9pWr76VL54MilYfLmpAE5J5M/bqw1fsyn9N7B2hmtyNGl9ZTUSvUW3W?=
 =?us-ascii?Q?Gh1MqWxS/C+tPH3a5ypYTvX3ZKTmPVg/xUiCMvj5M3GGazssPujSrSAL+2LF?=
 =?us-ascii?Q?cN3w1ipjZ7WYPQotKrieKnRt+UUTgCnjV7M14qaeXh2k2nTZtJYH4Dbwn1Ez?=
 =?us-ascii?Q?HFO3OoTGFVSxOeWV4JI+U8laljhx2OUFAATAq15YoAGWLRjUMvQGwApgrQAU?=
 =?us-ascii?Q?XiTMi9NLR5ZstIx2rPF7cWyc5nZz5guVQK1htt+UtdGDKiJiqSPBoQHNDgRW?=
 =?us-ascii?Q?i5vQ91fd4K3XOv7eMZqxpGgr85+iY3Y+Nmvm6M5d7JPQyY5zTbNjJhpT56QC?=
 =?us-ascii?Q?n5pxpec/v9VOmCclOD3RmMiaCpJV3Qf4KxVJ5P7ng3tUS5AFgkQZciW+t8vu?=
 =?us-ascii?Q?MuXA7mDG0RirQPGNhoSJBBFuYELI5oueCz6pyFVC8Io/vkThMB1C2qzCJWKl?=
 =?us-ascii?Q?60iGIBMqrciSqs62cOM2dGqZr7i0h0/etZe7jtnjKcFlpIviXJpf9ntcHnfb?=
 =?us-ascii?Q?PcGiZo/OZGFkCQCOEINpFZa9eIaXoQLZCszNCfHQh5yybaZ71+7m8g3ji4wp?=
 =?us-ascii?Q?+oYAq9ijPcAf0wkgwjyb0MZC018lOhUhNK361o7N5Y3Acq3NZWG9ry2EEmOD?=
 =?us-ascii?Q?Eq7DBbcerq3XW4gIBz9hQ5BZUPkxqiytQmUfOq1bNrUSgTAG1XhWM7ERff2Z?=
 =?us-ascii?Q?c3rEPR/hkQ/dit8irYwJ8ZkH+KZ11N+zN+wihWCFvMnHXwhlNiUrMJ2mf7l1?=
 =?us-ascii?Q?1sFx/zSpVFHrQeRDXyR1c5H9VyEH4dVMCvXh2Hp0bqHxDRkI37ulSk6D2YBs?=
 =?us-ascii?Q?7Q4uJ1FUeuzFF1LURpGHo/fNzXWV5wQtem/kf9HbQqkYkpmN0vIx89lKpi/e?=
 =?us-ascii?Q?VcC1QAxfzM95uOW6MxGopzhjyFcaYjecYO/q6k4KCDA+/82ucWP7DHFc8DkI?=
 =?us-ascii?Q?UkOlH0garR6Vqs148RAHY4+E?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeae979f-6f2c-4fe5-8e40-08d98fa7c5ed
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:48:19.5214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RF0/FAWtIVs+MwnuFG98RmOJcvoxR2hdAfnMEVfIjeJQxGdMM0SQVl+r9QX3bFNVv2iNJDzrN5sh1X19Tfn3NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3388
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

show() must not use snprintf() when formatting the value to be
returned to user space.

Fix the following coccicheck warning:
drivers/gpu/drm/panel/panel-dsi-cm.c:251: WARNING: use scnprintf or sprintf.
drivers/gpu/drm/panel/panel-dsi-cm.c:271: WARNING: use scnprintf or sprintf.

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 5fbfb71..a8efb06 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -248,7 +248,7 @@ static ssize_t num_dsi_errors_show(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", errors);
+	return sysfs_emit(buf, "%d\n", errors);
 }
 
 static ssize_t hw_revision_show(struct device *dev,
@@ -268,7 +268,7 @@ static ssize_t hw_revision_show(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
+	return sysfs_emit(buf, "%02x.%02x.%02x\n", id1, id2, id3);
 }
 
 static DEVICE_ATTR_RO(num_dsi_errors);
-- 
2.7.4

