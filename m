Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DDC554270
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375C8113892;
	Wed, 22 Jun 2022 05:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jun 2022 13:25:57 UTC
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913BB10F8ED
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:25:57 +0000 (UTC)
X-QQ-mid: bizesmtp69t1655817287tdqron2j
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:14:42 +0800 (CST)
X-QQ-SSF: 0100000000700050B000D00A0000000
X-QQ-FEAT: SAUrQiVpIXHQMzoCLy0eLou0ycRUvuLnhWbf9L7EYcUhX8tzBvtxBl6X2+PA2
 5im8ZgI7qSktRHij7vuxwshfpVqwIR5kR3txOW6rkYMtAFFfGSSEpMv7sKYauhuldKTcTKF
 Pzx+UoOzqTvwSYNQfU35hkMLL+OkCyPoq0cUKN4jAh0TzMFjt7wDTke/KHloEi5wuCUMQHz
 AZQB1wkjARRCAk52SVPOLNamjRrPjeeBjlfvme9qu0yLalATxjK/ztbkk74iCkmfd0nGjLW
 qTsyHye5UvBIDg687N2sOYARW7ZYmnYrvKPjX8mc/jxt+pdxbC5qKLvj5ABpOeZfbMWoFou
 pGA3J4LzNdrsUzPB7p5atiX51yqog==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/display: drop unexpected word "the" in the comments
Date: Tue, 21 Jun 2022 21:14:40 +0800
Message-Id: <20220621131440.1512-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
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
Cc: jani.nikula@intel.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Jiang Jian <jiangjian@cdjrlc.com>,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/display/drm_dp_helper.c
line: 1600
  * Doesn't account the the "MOT" bit, and instead assumes each
changed to
  * Doesn't account the "MOT" bit, and instead assumes each

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
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
2.17.1

