Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D50CFE896
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B89110E61C;
	Wed,  7 Jan 2026 15:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="V4Dj6xzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f98.google.com (mail-yx1-f98.google.com
 [74.125.224.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214E310E61C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:21:14 +0000 (UTC)
Received: by mail-yx1-f98.google.com with SMTP id
 956f58d0204a3-640d4f2f13dso2006523d50.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 07:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767799273; x=1768404073;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTcD2ri22S3g0U4H6Hn0z+kqnMfuL6/VwWw5oEbZ+Uc=;
 b=DZEIyCENc5sSgqlSk++iR2jYrd+XNVHJZqHWV5VuOP05wYdKzVwJTPvEbBr7lGeEp2
 oQL8inqTTBJ1ajYe4ngJHi9vVXaMP0xgfXG4jr2DA18IymDe+GhDFaqbIZvvHvrufZGx
 8nQJemKAQ0xB7gyLnyHd1J+XPLwJE+xb1OiUTb1K72iGDz6zdfpk9yktEM5bEydSgyFF
 Ef59wsKu/2kjiKWuHSCnLvpgtp+5Y7CDNktIQpaPHYPhKd2Quqgg1mewgnOAnH9gXsGp
 LO30cicXDAOrMGAr2NVHhqKHVDhec5MjeihFll5VRVBPwkT8PrzB5e66nigSL6Pb/6bR
 tmHA==
X-Gm-Message-State: AOJu0Yyi3dv3ncmDv0gPNeTt6qDbevuOektKdvsut8ysZnzUcCeKt5Ca
 8m804MTAh4CzH5uUgAvHmtjGCVWVqgjYFj0iuMWAlUNekVlbM0Rpfk00asRPQrNXJBu6eVp/DzN
 +TK9f6sQjdsDxGrQHK1vn+Wv383iZljbY/oGoPzHMLEsgSRbARwbkxUU50nah/Mdqp+4sqmBPdK
 pt9z52p9Gj91gBb1njpDa5xd4fYcjaLKv/sh8x1Dhy2/ssbtT9ecl4b5UoPV4slQBZegJKWWS9r
 UYfllGMFj7ISLVoU5Ph
X-Gm-Gg: AY/fxX77occD0vRlQp0NW8AhZVsK8O4QdZJUTKyG9PRBlkVaryUpc8KzdY94sN0Rm8e
 QO5OUPL10WQyvbgXQlgiMOiCr50uU2UxXZ37Vp1Hm0v8XME544Ctbg26QVXdaO7E/X4lWlo5b9W
 TJOF86/Lx8gSJjVDTNG/sGs6r3UxPOggYHVx+LGNpyVpkJtn+kld1zkGmKOracFlXjLJKL9yZef
 evQVNT7EHUqN7L4FB7FGROl4w1N8OcQo35sIZrVeVSbO+cVkNFriYT/9Yn//X0VQawpAQEuKOd3
 xqcM2Q3xqQ8XkfOs5EXLDmmId5IOpJnSdInK4v5XUhp/eF+ePGeLDqS8bPLVapO1A0hlYnPZeqj
 09nVo2m1Z3FACa25/Zd4CfugcEq2/VUxrPslpuyC+ohDDKMfUgEBl3iDS9/xPg+h47GTf0P6+xc
 ILnHyqzmlQ0qyG/smFQN9gZBs6O6Yyqgx0YQywPgVh4u9m
X-Google-Smtp-Source: AGHT+IEu/qY9yzRFTXN44yYETUIwYJlR9P8Oxw/EELd56BelaPh0QGyQFNbBs9dTjlLJjVgpXtVe3lD86/Zt
X-Received: by 2002:a05:690e:4195:b0:641:f5bc:69a6 with SMTP id
 956f58d0204a3-64716cad31bmr2420737d50.84.1767799272806; 
 Wed, 07 Jan 2026 07:21:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 956f58d0204a3-6470d8c4d07sm478219d50.13.2026.01.07.07.21.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Jan 2026 07:21:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2b0530846d3so1381173eec.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 07:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767799271; x=1768404071;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QTcD2ri22S3g0U4H6Hn0z+kqnMfuL6/VwWw5oEbZ+Uc=;
 b=V4Dj6xzztzXQ31lNBJhN//vEtEWbguavOb/AisTxbrI+wfLSbRC+W5vS5AKx8N2eB/
 7SGYIONYxqrDa0ItOnAf/kaVOQgS8kk/QNH7+XNcjQndkK4zgBdA9HPrKobmklTjREVh
 LwI9duRMQcSWzgijfSTMCyyGkYzfrrZU8K6+s=
X-Received: by 2002:a05:7300:a897:b0:2ab:ca55:b760 with SMTP id
 5a478bee46e88-2b17d2f0d70mr2106043eec.43.1767799271236; 
 Wed, 07 Jan 2026 07:21:11 -0800 (PST)
X-Received: by 2002:a05:7300:a897:b0:2ab:ca55:b760 with SMTP id
 5a478bee46e88-2b17d2f0d70mr2106018eec.43.1767799270605; 
 Wed, 07 Jan 2026 07:21:10 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b1706a53cdsm6795206eec.11.2026.01.07.07.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 07:21:09 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Merge vmw_bo_release and vmw_bo_free functions
Date: Wed,  7 Jan 2026 09:20:59 -0600
Message-ID: <20260107152059.3048329-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of the warnings need to be reordered between these two functions
in order to be correct. This has happened multiple times.
Merging them solves this problem once and for all.

Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index f031a312c783..b22887e8c881 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -32,9 +32,15 @@
 
 #include <drm/ttm/ttm_placement.h>
 
-static void vmw_bo_release(struct vmw_bo *vbo)
+/**
+ * vmw_bo_free - vmw_bo destructor
+ *
+ * @bo: Pointer to the embedded struct ttm_buffer_object
+ */
+static void vmw_bo_free(struct ttm_buffer_object *bo)
 {
 	struct vmw_resource *res;
+	struct vmw_bo *vbo = to_vmw_bo(&bo->base);
 
 	WARN_ON(kref_read(&vbo->tbo.base.refcount) != 0);
 	vmw_bo_unmap(vbo);
@@ -62,20 +68,8 @@ static void vmw_bo_release(struct vmw_bo *vbo)
 		}
 		vmw_surface_unreference(&vbo->dumb_surface);
 	}
-	drm_gem_object_release(&vbo->tbo.base);
-}
-
-/**
- * vmw_bo_free - vmw_bo destructor
- *
- * @bo: Pointer to the embedded struct ttm_buffer_object
- */
-static void vmw_bo_free(struct ttm_buffer_object *bo)
-{
-	struct vmw_bo *vbo = to_vmw_bo(&bo->base);
-
 	WARN_ON(!RB_EMPTY_ROOT(&vbo->res_tree));
-	vmw_bo_release(vbo);
+	drm_gem_object_release(&vbo->tbo.base);
 	WARN_ON(vbo->dirty);
 	kfree(vbo);
 }
-- 
2.52.0

