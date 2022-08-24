Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABEA59FDF8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D54B703B;
	Wed, 24 Aug 2022 15:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886B810E19E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 12:56:12 +0000 (UTC)
X-QQ-mid: bizesmtp62t1661345762t10p0fcg
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 24 Aug 2022 20:56:01 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: ZdHcY4j9T+K94SWBB3cuuxFtymFLVJ+fL1aGmbrpiFQTCt1Idp1t1648ssCy/
 ea0PqgdPHEKLUC6+1pcecIQBTH2VZuk85JsX2HybE2tv4SwdIfQvy3XmMm1KkUxnMtywtS1
 5nBYeR9rb0YnQn3tx5WxsX0UY6h5DsCQTB+ttCDJv9bJhtXIrnZ4SUeSbQZ20HY4tKYdgHz
 /AlpcfPNPZdMMZbvJEFkvFKTcIA56MK9/RuE+UVIJFaa7bxXcq0BBJwIOmCxgRBwTGKw4N2
 3AfbGOZd3Gc5ZpQlTgAWUokXRukY2a9xQoOXyYaZJeAgPMs/hl/FJ2Vf+rnCQg0IPMt1xW7
 OLVllQ4d+wHhkYcfET9U2SVD/PYPdVJn2Pqv6/e
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: fix repeated words in comments
Date: Wed, 24 Aug 2022 20:55:54 +0800
Message-Id: <20220824125554.27901-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 24 Aug 2022 15:12:27 +0000
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

 Delete the redundant word 'to'.
 Delete the redundant word 'should'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index d49de4905efa..82b9d33ecc84 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -381,7 +381,7 @@ static int vmw_execbuf_res_noctx_val_add(struct vmw_sw_context *sw_context,
 }
 
 /**
- * vmw_view_res_val_add - Add a view and the surface it's pointing to to the
+ * vmw_view_res_val_add - Add a view and the surface it's pointing to the
  * validation list
  *
  * @sw_context: The software context holding the validation list.
@@ -409,7 +409,7 @@ static int vmw_view_res_val_add(struct vmw_sw_context *sw_context,
 
 /**
  * vmw_view_id_val_add - Look up a view and add it and the surface it's pointing
- * to to the validation list.
+ * to the validation list.
  *
  * @sw_context: The software context holding the validation list.
  * @view_type: The view type to look up.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 1d1c8b82c898..7c04e8150fe2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -69,7 +69,7 @@ struct vmw_du_update_plane {
 	 *
 	 * Some surface resource or buffer object need some extra cmd submission
 	 * like update GB image for proxy surface and define a GMRFB for screen
-	 * object. That should should be done here as this callback will be
+	 * object. That should be done here as this callback will be
 	 * called after FIFO allocation with the address of command buufer.
 	 *
 	 * This callback is optional.
-- 
2.36.1

