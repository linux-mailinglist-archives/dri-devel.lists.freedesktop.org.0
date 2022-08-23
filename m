Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028CF5A02CE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70F1C766F;
	Wed, 24 Aug 2022 20:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC5410FAA2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:07:50 +0000 (UTC)
X-QQ-mid: bizesmtp87t1661263662tvj9lbpn
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 22:07:41 +0800 (CST)
X-QQ-SSF: 0100000000200040B000B00A0000000
X-QQ-FEAT: ELPc6+jLxfZdNuojohCYMyVGUS982wGogZ+IzaOf97byt4LkxjRZfZ1FyZXp3
 rxu1nFOCLpyG0HtB6GyNBqvW7/ZZs3Ii8U63pMgZkzjujQ+vOUr2AxKKFIvuv4ESdB6UZP2
 I9mfA2v6kbQaSVbZ+OroXPHH7+jnlu7KmvD8EqYPYa97ryKy/pqwYmQJZdWNnfCIYcWquEb
 WMldmnAJT1HiIuduNv1PAyie6Vadl9MYxuUHlnWi6fVW1QfAQGYN67a83P2ecRC5rI8yuIH
 akyEA9t8hk2DEa+dqlzYy6BJKKDcY3qudvsgDq3+Ylfd3EXcRhv8BB1Tsf8nm+zq928pPTK
 7NCZpQNk4YRCTPvCS4YniqQ+LyLjD2ONLUoisAz3+9rqEG9CW39jVSsTxiSgw==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] gpu/drm/display: fix repeated words in comments
Date: Tue, 23 Aug 2022 22:07:34 +0800
Message-Id: <20220823140734.6826-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e7c22c2ca90c..499f75768523 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const struct drm_dp_aux_msg *msg)
  * Calculate the length of the i2c transfer in usec, assuming
  * the i2c bus speed is as specified. Gives the the "worst"
  * case estimate, ie. successful while as long as possible.
- * Doesn't account the the "MOT" bit, and instead assumes each
+ * Doesn't account the "MOT" bit, and instead assumes each
  * message includes a START, ADDRESS and STOP. Neither does it
  * account for additional random variables such as clock stretching.
  */
-- 
2.36.1

