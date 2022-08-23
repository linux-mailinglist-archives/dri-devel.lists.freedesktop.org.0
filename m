Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2868F59F44A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3921E1126D9;
	Wed, 24 Aug 2022 07:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B7C113A94
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:09:10 +0000 (UTC)
X-QQ-mid: bizesmtp85t1661263742t9yhkbf8
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 22:09:01 +0800 (CST)
X-QQ-SSF: 0100000000200040B000B00A0000000
X-QQ-FEAT: 7jw2iSiCazoA2CrqQzokZA/mgo4Jlhw0CJqSq4DNXNufw5oX8LuejuTp7IYpJ
 FIs2fiQaJ/SeQUTGibUx6g0cwM6pbaMkoQ5rnaF0hDwKRCQR/yiMAe0EyXGQiW8nKpssBf3
 7Epy3HILmQ/zzxE4zCKN11KVxYHz2ffoW7MAPGAiy/u2hn2qvXGeKl7L6RFv/yCMbBQUSe+
 A9IA1RYusTO4xKN85ZRGvA8y7wh5Cwj0APfXFYIfOKSMFhmwbN2VXYjnNVeYV3nsABxdZlN
 YwmXxdlivp/Maw9izMq+kx/Ug6JZg2UvXuZP6Y5jOlW2HTQQQN7svidDDy23o4erTTP2nWO
 uGHBzhtIvr7lNYb9gN8DBXlpGv2TOaa9+64qgxRc8jw8TekGwY=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	aniel@ffwll.ch
Subject: [PATCH] drm/gma500: fix repeated words in comments
Date: Tue, 23 Aug 2022 22:08:54 +0800
Message-Id: <20220823140854.8045-1-wangjianli@cdjrlc.com>
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
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 9ee99a7d4fbe..a286861ffa3f 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -114,7 +114,7 @@ i2c_algo_dp_aux_stop(struct i2c_adapter *adapter, bool reading)
 
 /*
  * Write a single byte to the current I2C address, the
- * the I2C link must be running or this returns -EIO
+ * I2C link must be running or this returns -EIO
  */
 static int
 i2c_algo_dp_aux_put_byte(struct i2c_adapter *adapter, u8 byte)
-- 
2.36.1

