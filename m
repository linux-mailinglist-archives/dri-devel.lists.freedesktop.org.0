Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F3589C83
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E5695C0B;
	Thu,  4 Aug 2022 13:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18C96A89
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 11:48:03 +0000 (UTC)
X-QQ-mid: bizesmtp64t1659613676to75nwmc
Received: from localhost.localdomain ( [182.148.15.41])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Aug 2022 19:47:54 +0800 (CST)
X-QQ-SSF: 01000000008000F0U000B00A0000020
X-QQ-FEAT: D2GZf6M6C/jjswy3ORhVLlvpqecF+t4ix1O1Cutz9c0tIIu8jsNH991133ObA
 J5T+FYyaWHtvHYnKshQvwh2MA5PLjr2rka+y9IARyJVto+jmYFGdVNe1V9/E7R8Qrl7ATMH
 jOYW8rTV1wC2PnZ29/LK3C3QCP62nnKmDc5wjvEzF3GC1gHBnXQ4Tr0AWzikezNAjnsKY0r
 fjDq6tzgMA3hr99/lgqPi/iHrRblNijA+mIEMunbTOlW7kUampjVaVqt+MZHttj/cFDXzVk
 EAjjC+NPfMzCa+p02JHqYlu/BkUpivzjlSbQc2RU16o1cQwRR51bl1pytAQFHNaEMwryEsH
 YGwmCcC9Rt7DchalhX/0o8U7/6alnWJ4PTkJ//DbeHIMaRtt2gapDANho0DAEeqvZ1m1dBq
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: airlied@linux.ie
Subject: [PATCH] drm/gma500: Fix comment typo
Date: Thu,  4 Aug 2022 19:47:51 +0800
Message-Id: <20220804114751.46714-1-wangborong@cdjrlc.com>
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
Cc: dri-devel@lists.freedesktop.org, Jason Wang <wangborong@cdjrlc.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `the' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index bb2e9d64018a..53b967282d6a 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -115,7 +115,7 @@ i2c_algo_dp_aux_stop(struct i2c_adapter *adapter, bool reading)
 
 /*
  * Write a single byte to the current I2C address, the
- * the I2C link must be running or this returns -EIO
+ * I2C link must be running or this returns -EIO
  */
 static int
 i2c_algo_dp_aux_put_byte(struct i2c_adapter *adapter, u8 byte)
-- 
2.35.1

