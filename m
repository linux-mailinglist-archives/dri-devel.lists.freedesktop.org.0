Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2066D5C9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 06:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC16B10E2C7;
	Tue, 17 Jan 2023 05:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-6.freemail.mail.aliyun.com
 (out30-6.freemail.mail.aliyun.com [115.124.30.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C27110E2C7;
 Tue, 17 Jan 2023 05:59:46 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VZluILG_1673935178; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VZluILG_1673935178) by smtp.aliyun-inc.com;
 Tue, 17 Jan 2023 13:59:42 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 3/3] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 17 Jan 2023 13:59:22 +0800
Message-Id: <20230117055922.53911-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230117055922.53911-1-jiapeng.chong@linux.alibaba.com>
References: <20230117055922.53911-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hpd.c:140 get_hpd_line() warn: inconsistent indenting.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3787
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/link/link_hpd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_hpd.c b/drivers/gpu/drm/amd/display/dc/link/link_hpd.c
index 5f39dfe06e9a..4746ea623354 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_hpd.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_hpd.c
@@ -137,10 +137,9 @@ enum hpd_source_id get_hpd_line(struct dc_link *link)
 	struct gpio *hpd;
 	enum hpd_source_id hpd_id;
 
-		hpd_id = HPD_SOURCEID_UNKNOWN;
-
+	hpd_id = HPD_SOURCEID_UNKNOWN;
 	hpd = link_get_hpd_gpio(link->ctx->dc_bios, link->link_id,
-			   link->ctx->gpio_service);
+				link->ctx->gpio_service);
 
 	if (hpd) {
 		switch (dal_irq_get_source(hpd)) {
-- 
2.20.1.7.g153144c

