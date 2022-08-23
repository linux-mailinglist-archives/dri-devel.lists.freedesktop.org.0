Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF459F44C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696BD1124A4;
	Wed, 24 Aug 2022 07:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25D010E94A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:19:24 +0000 (UTC)
X-QQ-mid: bizesmtp90t1661257156t9gmmv7c
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 20:19:15 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: 5q30pvLz2icLKpNbf+F1dZ4MtBijbcMDlPnAwkmzhoH2yxFy/xuKFyBhHsTZ5
 TwCt164T3CdsA4/Epucm3SLsK4EO6HKvM8zPknLYfJDOB3oY9U1BXog2DkbON76lVDovrL5
 UUqd2FzkZ5YjNyBAGxNrjKOru77MFSlkbGHpBRy5/zkbhfl3PIV4mAyjPv750bDFav9n9B2
 3C61hZxszng8QbVOt+KW6f/EAzoXnd/wKp1PZt0fwurfN+aIFgZ7W2fc9gd+DLl7rIHCUMh
 PRWIdMs2KQTE+AEos88bA3fwzvG2Fd6ed6y+JwCC2TcWvcIXMYWZq0XUq40KWcerFKzl++q
 Ajg8eBVEA2b4PPW4neDlv8TGb7o0AhF3Wp/nrZ0mlSa6jFOvMclgi7G214Xs1OcLWUP6WWG
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/display: fix repeated words in comments
Date: Tue, 23 Aug 2022 20:19:09 +0800
Message-Id: <20220823121909.13553-1-yuanjilin@cdjrlc.com>
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

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e7c22c2ca90c..c258cbd6857b 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1595,9 +1595,9 @@ static int drm_dp_aux_reply_duration(const struct drm_dp_aux_msg *msg)
 
 /*
  * Calculate the length of the i2c transfer in usec, assuming
- * the i2c bus speed is as specified. Gives the the "worst"
+ * the i2c bus speed is as specified. Gives the "worst"
  * case estimate, ie. successful while as long as possible.
- * Doesn't account the the "MOT" bit, and instead assumes each
+ * Doesn't account the "MOT" bit, and instead assumes each
  * message includes a START, ADDRESS and STOP. Neither does it
  * account for additional random variables such as clock stretching.
  */
-- 
2.36.1

