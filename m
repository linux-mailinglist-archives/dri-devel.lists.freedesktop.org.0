Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A225C97D51
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 15:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC51610E3E9;
	Mon,  1 Dec 2025 14:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="NDRmiP+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CD010E3E9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1764598931;
 bh=A46fsy9EF7CRu4Y9aOSl3UqvkUzQSeDu2M6rkC2ypzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NDRmiP+Hcd6r87ybCCNSUj6YbaT63/4VQg5jzkQUeExI1sMBpUHeCZlVDjrNbilTP
 PUAKIo4TJgqS+Kan6YzwS7LR6VwQIs2L7+Xfob66nahzTvJJQbccXBYFWTRoDGcgte
 Zoz0nE877kv2LG63bNjv7YvFeEMaRpd7S0kbdhgI=
Received: from localhost.localdomain ([171.223.167.52])
 by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
 id 587A4AE8; Mon, 01 Dec 2025 22:22:07 +0800
X-QQ-mid: xmsmtpt1764598927tshydvwaw
Message-ID: <tencent_FE5819B397B5ECC989623C67A7D68D246907@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uuUDTIspOO8xGFMp6qi3u4HWEUEueZopR9GNCDR6BsaRkVDtpT4
 KVY9zNFDdjT3GJW05DLcd2UuoIbeJBUTwMSMS4vPu/YATh3eyrkgucS8zwCYUIGw7XGJyO4VpAJM
 QBHR5Zqo5ggo4M/OdOSeV/YyK2WPd7wACC6axIuxpJ9VkfEfkXBQsr6HeB37SsZG2SNF12qYPLLX
 GHuApCYvFeMMPNaQBAmjeMqHQx8UNJk1fLhyzvamQjOl+Ot1bc4SKXTowidRPnESm1+cMijTflCn
 JOKvvYQ84HdjXjvVnWfTSeCFDXQ++zwb8AtO05ElPyGw0KfADYNsfbs7a3R8pcx9WaCmzAnSHwnJ
 kMx0N2+zDzsq12/PdviMV/c91hB3Yc1J0s0YrJ61w5ofHAY7IIfCW4VSQwBSPBLUPIFjW4znDV26
 efSZtEjSbnkYzhQ6PUqouarfDRWY6r2PhtvaGY7qDZGKJxk/K/0FMjMsX8BjwAjcZB0jyVU4ZAT0
 7JZweH7wELLKm3YsfUratOGFo75M4/hsb1wErbiHANGm5xPwe1Q+3LqWSsVZDUhWFZ8zAIUdrDOK
 4ubl9a2VVH2/0VpEskGX4WGSoRgnojRueFGTk0jOha5GiUqAgMzYAyPLIcd0FM/QCqtIdzgU+hTd
 SE0+MOB/IDUsQ3fiubaKYuluUkQLahiyibLltb4ZzxKOpBovJ70K1sae6/BiEuplXmAX1l8nRHGi
 yCUrVmk9AmfyBcIdiNy2uZowmy43VxGBq9hFkFsVMjdKMlHl/42kQneNDaARHf3pZzQuEtohu/Zq
 eK75V+L+DWENLCNOgSSJV4R0nW/BbIZzaKq2o1ZtMjOfgEDaUez2ZGZGUnsL3lb/UBlu54Ja10vT
 KTgddER8R0ty7syiSPzsD50xWNa2euvplQ1uDu6oDjwy13iVjxA4WrK/3D//yE56P+IDtSZHGnvQ
 fXOW2rkmwqds85xiMGLNeYmkHIGXtudUizKgZJskGxxa3B/sV68dhThlbdr6f4rY6Xq22GpH1KQw
 S+4SHnRItYHyl5Sm9A7x83k9J5dZ9iMW07LRBauUfxIC8E/CF+PItLERmuearhEeKMY3OxagyfMr
 lhmmdhnPYk20Z+Hhc=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Renjun Wang <renjunw0@foxmail.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH RESEND 2/2] drm/panel: simple: Add HannStar HSD156JUW2
Date: Mon,  1 Dec 2025 22:22:06 +0800
X-OQ-MSGID: <20251201142206.31180-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <tencent_D449AE627267BDD68BA41AD80EB3DFB5D407@qq.com>
References: <tencent_D449AE627267BDD68BA41AD80EB3DFB5D407@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add Hannstar HSD156JUW2 15.6" FHD (1920x1080) TFT LCD panel support.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0019de93be1b..057ae6735806 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2509,6 +2509,31 @@ static const struct panel_desc hannstar_hsd101pww2 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing hannstar_hsd156juw2_timing = {
+	.pixelclock = { 66000000, 72800000, 80500000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 20, 30, 30 },
+	.hback_porch = { 20, 30, 30 },
+	.hsync_len = { 50, 60, 90 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 1, 2, 4 },
+	.vback_porch = { 1, 2, 4 },
+	.vsync_len = { 3, 40, 80 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc hannstar_hsd156juw2 = {
+	.timings = &hannstar_hsd156juw2_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 344,
+		.height = 194,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode hitachi_tx23d38vm0caa_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -5166,6 +5191,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "hannstar,hsd101pww2",
 		.data = &hannstar_hsd101pww2,
+	}, {
+		.compatible = "hannstar,hsd156juw2",
+		.data = &hannstar_hsd156juw2,
 	}, {
 		.compatible = "hit,tx23d38vm0caa",
 		.data = &hitachi_tx23d38vm0caa
-- 
2.39.5

