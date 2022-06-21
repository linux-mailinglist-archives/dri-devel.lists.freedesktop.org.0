Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA755426E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D605113891;
	Wed, 22 Jun 2022 05:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ACE10E4C8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:06:31 +0000 (UTC)
X-QQ-mid: bizesmtp82t1655816536tegru2l3
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:02:12 +0800 (CST)
X-QQ-SSF: 0100000000700050B000B00A0000000
X-QQ-FEAT: xoS364mEyr2lrJLrObarZ620j5HzhnGsAxRGEt30W2QTeCOW0f4X+LfQXscqK
 f+JJxJBcSHehUERB7aUQzczaJeG7LmUbUFgTpMcKsMVMrCxL5IhHfe6ZPBqsE6XX8hVdcHV
 FnfkxIFR4nADKqxvescYikqkjJr6ebnWk6+DIdvBvwkkqWfBHh3qD+fTVPpdTVLsf8in2nW
 plK8W1V85hYCxJVz82AsbN6FPd4gtDuLrcN7SjwBPIhBJY4CfsWczOBSUxxaiqXe/gwtQjr
 VSVmAB6Ryd+50MmnCLH+Ncpu1C8eYRMQdQ3aoxcQJ+DNfKO2R9gCCQV2Wi/uOg3y/K2BWc1
 9+g/dhGfs2e63I6GxDz3aq1Y0eg3A==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH] drm/prime: drop unexpected word "the" in the comments
Date: Tue, 21 Jun 2022 21:02:10 +0800
Message-Id: <20220621130210.125461-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: airlied@linux.ie, Jiang Jian <jiangjian@cdjrlc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/drm_prime.c
line: 842
* of the the buffer described by the provided sg_table.
changed to
* of the buffer described by the provided sg_table.

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
2.17.1

