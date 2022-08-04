Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7A589C81
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76BC95A70;
	Thu,  4 Aug 2022 13:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E1A969A8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 11:46:12 +0000 (UTC)
X-QQ-mid: bizesmtp74t1659613563terev2cc
Received: from localhost.localdomain ( [182.148.15.41])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Aug 2022 19:46:01 +0800 (CST)
X-QQ-SSF: 01000000008000F0U000B00A0000020
X-QQ-FEAT: ao4JQgu0M390dh+71ddRRaTCN8uGOsNtawusObnIeQCE1w8TRXhmU8lp1Be4l
 GAwB/xWbHL7Y0KHsjwsgUf/DsykXWZBQxQes3FkY7/BGwTfJDoje2ds6o1hAI22loqgreQo
 vxCxPv4tyS3mFZ1YLfxJ/ROosL5mZsK6a7PYk5GyXw445gUc5Imup4h8fhwDWxTNIVuLsF0
 C5WqoQnJBzx/lu/yCjPsie/SG0w8ugb1K46Jxgj9fDnptZDAzVzZq3qFzWQ3HDjl00tPf0S
 baCkRNjSbwbGqWQPmSL4SiDIOZHVESR9cTo0fDl2KlQc8VJ5yrKFcKg0Mb63mH5PmcGCmee
 EustQVJQ6KVaaEOfLaGSm/cdI/3w4LzfP/L2/vSc+OXkV7c9vGnkzcv9uGEZrCS/BIOGX6D
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/display: Fix comment typo
Date: Thu,  4 Aug 2022 19:45:57 +0800
Message-Id: <20220804114557.44714-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Thu, 04 Aug 2022 13:20:57 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 Jason Wang <wangborong@cdjrlc.com>, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `the' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e5bab236b3ae..32b295003f49 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const struct drm_dp_aux_msg *msg)
 
 /*
  * Calculate the length of the i2c transfer in usec, assuming
- * the i2c bus speed is as specified. Gives the the "worst"
+ * the i2c bus speed is as specified. Gives the "worst"
  * case estimate, ie. successful while as long as possible.
  * Doesn't account the "MOT" bit, and instead assumes each
  * message includes a START, ADDRESS and STOP. Neither does it
-- 
2.35.1

