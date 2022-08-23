Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9199A59F44B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC2B1128B1;
	Wed, 24 Aug 2022 07:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB2310F8C6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:04:11 +0000 (UTC)
X-QQ-mid: bizesmtp90t1661256243te08ayk5
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 20:04:01 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: QityeSR92A109gpJ54mVbw2f3kU8xWUS9YrEt9YHoZj/m8QuegRSwsytsJt9G
 PiugPdiJhCd0UDm1b2PKKLD0ObiV5B0qwL/4n+Czpt8xToPIzw/G2SlSXzyG+u+KmNBzEke
 yHZfV1jDW0w+Oimk6oaReqX46/20Hql4Si65eah/nZDLAWUI2kfJbkkJ8EAwpbWrS18ZuWB
 Zp9MmeHD1N8jNsPYrLAAa6OLmNrLTjeUiIWGHDZJt8do8v5gpFdsOc9am1YyhlvKRX24lYk
 aP7oA+vpdAnSGrKM6IrZzQzHUF5SIWoLuUN0mcSEHjM47BOzoumQtseN2HAZSRO2xRGW7LG
 khqU3YE9DG4pxJ55Ut2zVAVyRYYbxyZLQZngenAUUyxOKzyMqFZcKcJepiLtR5mHdlB+Fzl
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Tue, 23 Aug 2022 20:03:55 +0800
Message-Id: <20220823120355.64996-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'the'.
 Delete the redundant word 'this'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 4 ++--
 drivers/gpu/drm/drm_prime.c                    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4e853acfd1e8..63f002d5143a 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -187,7 +187,7 @@ static const struct dmi_system_id orientation_data[] = {
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/*
-		 * GPD Pocket, note that the the DMI data is less generic then
+		 * GPD Pocket, note that the DMI data is less generic then
 		 * it seems, devices with a board-vendor of "AMI Corporation"
 		 * are quite rare, as are devices which have both board- *and*
 		 * product-id set to "Default String"
@@ -328,7 +328,7 @@ static const struct dmi_system_id orientation_data[] = {
  * resolution expected by the quirk-table entry.
  *
  * Note this function is also used outside of the drm-subsys, by for example
- * the efifb code. Because of this this function gets compiled into its own
+ * the efifb code. Because of this function gets compiled into its own
  * kernel-module when built as a module.
  *
  * Returns:
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index e3f09f18110c..a3f180653b8b 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -839,7 +839,7 @@ EXPORT_SYMBOL(drm_prime_pages_to_sg);
  * @sgt: sg_table describing the buffer to check
  *
  * This helper calculates the contiguous size in the DMA address space
- * of the the buffer described by the provided sg_table.
+ * of the buffer described by the provided sg_table.
  *
  * This is useful for implementing
  * &drm_gem_object_funcs.gem_prime_import_sg_table.
-- 
2.36.1

