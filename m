Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3E7000D1
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB7B10E642;
	Fri, 12 May 2023 06:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4F710E637
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:47:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0ViO5x46_1683874015; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0ViO5x46_1683874015) by smtp.aliyun-inc.com;
 Fri, 12 May 2023 14:46:56 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: ogabbay@kernel.org
Subject: [PATCH -next] habanalabs: Fix some kernel-doc comments
Date: Fri, 12 May 2023 14:46:55 +0800
Message-Id: <20230512064655.82246-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the description of @regs_range_array and @regs_range_array_size
to @user_regs_range_array and @user_regs_range_array_size  to silence
the warnings:

drivers/accel/habanalabs/common/security.c:506: warning: Function parameter or member 'user_regs_range_array' not described in 'hl_init_pb_ranges_single_dcore'
drivers/accel/habanalabs/common/security.c:506: warning: Function parameter or member 'user_regs_range_array_size' not described in 'hl_init_pb_ranges_single_dcore'
drivers/accel/habanalabs/common/security.c:506: warning: Excess function parameter 'regs_range_array' description in 'hl_init_pb_ranges_single_dcore'
drivers/accel/habanalabs/common/security.c:506: warning: Excess function parameter 'regs_range_array_size' description in 'hl_init_pb_ranges_single_dcore'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4940
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/accel/habanalabs/common/security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/security.c b/drivers/accel/habanalabs/common/security.c
index 297e6e44fd0c..dc23ff57c91a 100644
--- a/drivers/accel/habanalabs/common/security.c
+++ b/drivers/accel/habanalabs/common/security.c
@@ -495,8 +495,8 @@ int hl_init_pb_single_dcore(struct hl_device *hdev, u32 dcore_offset,
  * @instance_offset: offset between instances
  * @pb_blocks: blocks array
  * @blocks_array_size: blocks array size
- * @regs_range_array: register range array
- * @regs_range_array_size: register range array size
+ * @user_regs_range_array: register range array
+ * @user_regs_range_array_size: register range array size
  *
  */
 int hl_init_pb_ranges_single_dcore(struct hl_device *hdev, u32 dcore_offset,
-- 
2.20.1.7.g153144c

