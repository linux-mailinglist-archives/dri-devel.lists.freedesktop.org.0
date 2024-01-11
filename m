Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF79682A9BF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75510E864;
	Thu, 11 Jan 2024 08:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09EF510E864;
 Thu, 11 Jan 2024 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=JGjOI0pGms5sQl5zTT
 jHvC0Qm+8jY0XcDQ67QqyuX1s=; b=n6Y3QPvhNgO2Yd8GeHd6kWK1Z5Rv+h7RN7
 Pyi9t1tMuWRi6aIYJItzcmvUWhsQ4sBZXpGyyv51YONYlLF2CAQ0RoBv+S67aXC2
 mdJ1IAPB+ES1twP/e+9lQVWtwdL9EVoUG0Shr+BC6e0fxIBuvN+pMseKDheyjpw6
 BZsNUVlbs=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wDnT+WBrJ9lBxKXAA--.817S2; 
 Thu, 11 Jan 2024 16:53:21 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] gpu/drm/radeon: Clean up errors in evergreen.c
Date: Thu, 11 Jan 2024 08:53:19 +0000
Message-Id: <20240111085319.12805-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnT+WBrJ9lBxKXAA--.817S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1xXrWxXFWrCw1UZF18Xwb_yoWDCFc_uF
 43Xw1qqFyIvFZaga47CFWUAayIyF13uayUCrs5K39rAry8JFn7X3yrCFZ7Xa15Jw4qkF98
 Aaykta4Fy3ZFqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUtC7UUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEh5i1mVOBlBu0QAAs6
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited after that open parenthesis '('
ERROR: space prohibited before that close parenthesis ')'

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/r300_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r300_reg.h b/drivers/gpu/drm/radeon/r300_reg.h
index 9d341cff63ee..d776f929d5c3 100644
--- a/drivers/gpu/drm/radeon/r300_reg.h
+++ b/drivers/gpu/drm/radeon/r300_reg.h
@@ -825,7 +825,7 @@
 #	define R300_TX_MIN_FILTER_ANISO_LINEAR              (0 << 13)
 #	define R300_TX_MIN_FILTER_ANISO_NEAREST_MIP_NEAREST (1 << 13)
 #	define R300_TX_MIN_FILTER_ANISO_NEAREST_MIP_LINEAR  (2 << 13)
-#       define R300_TX_MIN_FILTER_MASK   ( (15 << 11) | (3 << 13) )
+#       define R300_TX_MIN_FILTER_MASK   ((15 << 11) | (3 << 13))
 #	define R300_TX_MAX_ANISO_1_TO_1  (0 << 21)
 #	define R300_TX_MAX_ANISO_2_TO_1  (2 << 21)
 #	define R300_TX_MAX_ANISO_4_TO_1  (4 << 21)
-- 
2.17.1

