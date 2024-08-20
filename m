Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C00D9588B0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 16:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8062810E7EA;
	Tue, 20 Aug 2024 14:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1155 seconds by postgrey-1.36 at gabe;
 Tue, 20 Aug 2024 12:43:48 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE8D10E770
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 12:43:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wp7nc1KrmzQqDM;
 Tue, 20 Aug 2024 20:19:48 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
 by mail.maildlp.com (Postfix) with ESMTPS id 423F2140133;
 Tue, 20 Aug 2024 20:24:29 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 20 Aug
 2024 20:24:29 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <lujianhua000@gmail.com>,
 <lee@kernel.org>, <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
 <deller@gmx.de>
Subject: [PATCH -next] backlight: ktz8866: fix module autoloading
Date: Tue, 20 Aug 2024 12:16:28 +0000
Message-ID: <20240820121628.42321-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500020.china.huawei.com (7.185.36.49)
X-Mailman-Approved-At: Tue, 20 Aug 2024 14:11:53 +0000
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

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/video/backlight/ktz8866.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index 2e508741c0af..351c2b4d63ed 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -190,6 +190,7 @@ static const struct of_device_id ktz8866_match_table[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, ktz8866_match_table);
 
 static struct i2c_driver ktz8866_driver = {
 	.driver = {
-- 
2.34.1

