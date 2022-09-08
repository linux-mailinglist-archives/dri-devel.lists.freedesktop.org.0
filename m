Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3845A5B2EAD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E9D10EBD6;
	Fri,  9 Sep 2022 06:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7871E10E9C4;
 Thu,  8 Sep 2022 13:14:35 +0000 (UTC)
X-QQ-mid: bizesmtp65t1662642865tdvhoh5r
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 08 Sep 2022 21:14:24 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: V1jmEc92UabV16orn0KMa9TOp2pFaqc0uXI1iUUeNUmq4NhAzq9NWMVtOpdOB
 WPaOebP6QN0kS/BfqvC2K9I6vwP6bd6nPbCia6n4YXFxtzQx3hM767kUHZD0ElYcYKRvrNP
 ULrQQEyzV9gpkjXmiOYIwozSJJThZ/s40wwQJwcmVXdWso4zC3RoIkhx4pueQ+MmWD9d3U+
 WeLhsnhGNbPmTGWWO4OvtkDw2lClM/ZIVe5bOZulHyWp3hvz9lk/f5IWDE+8bmrp6SetrYM
 P63h3isqucPTJm92+5MNqYf+FHcCLYtsY81AfDxw5uvtUNzFFgJqckOl/VorkHSvwCiV18A
 cXF7oqt0VZxdxgLMEgdKDjXh6j5w+YwS5W0EoBegmZT4of7uyGL52nu3qK7Qg==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com
Subject: [PATCH] drm/i915: fix repeated words in comments
Date: Thu,  8 Sep 2022 21:14:17 +0800
Message-Id: <20220908131417.38720-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Fri, 09 Sep 2022 06:19:19 +0000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'to'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/i915/i915_memcpy.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_memcpy.h b/drivers/gpu/drm/i915/i915_memcpy.h
index 3df063a3293b..126dfb4352f0 100644
--- a/drivers/gpu/drm/i915/i915_memcpy.h
+++ b/drivers/gpu/drm/i915/i915_memcpy.h
@@ -18,7 +18,7 @@ void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len
 /* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
  * as well as SSE4.1 support. i915_memcpy_from_wc() will report if it cannot
  * perform the operation. To check beforehand, pass in the parameters to
- * to i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
+ * i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
  * you only need to pass in the minor offsets, page-aligned pointers are
  * always valid.
  *
-- 
2.36.1

