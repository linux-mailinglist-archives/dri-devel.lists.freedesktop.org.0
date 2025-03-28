Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E498A7495B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177F710E9EC;
	Fri, 28 Mar 2025 11:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NzFwnl/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5071C10E9EC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:42:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4394a823036so20442025e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743162121; x=1743766921; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8qU5AiWpbN3KM74t30WidB9pTNIUeBMiW8GyuUSbcvA=;
 b=NzFwnl/g7OZ9GHLIkDujAAMPh9y2tJSCGNSxoaFwh/zYh5yoWGyZxs7SXgZ1OonKKq
 5Tui0skjlC55wp7BKWJCaNy0aTXOiGU8A9Yr9Jz0KSCSmmVNbL5iYhJ2geWi7urlTyNM
 yH8v5K+FIQ8dTra2+bmgKgszuBbt/+q4INSTtkNoutFVBMs5jckcWwB2PAU4fh/b0NLS
 zRtetOyY1GkiXmVdzjEi8WCcXst6AWIej7PR4msOeqkYBzhYa56+gVh1qdRB058ov3Pu
 iNMgtQJlTvhETyRbcczOdnDZYjU6sGukxhxVLO1wMY+x6CvgHbxDED5Dt5fG6mVd8NeZ
 0kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743162121; x=1743766921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8qU5AiWpbN3KM74t30WidB9pTNIUeBMiW8GyuUSbcvA=;
 b=c7k1Cy1E69fnQ5RZf1K/DNnvUgRBviXRxippeXBRa6DeOwQBdITulbR16sRrpGM1iV
 8jAwaEIDbjiKlirA9SNXHNqgLyTGPS6JT64S4rXTYcWHYSdNpJP4HJvR/915THmaGQO3
 vhfqpa0Oc23u+U6hUxSOj0qlyvjQl+kokRy7y84qW9KKyGgll4qxs4dXIJfBBEY78ZaS
 RiSAb3CigFNEe58s0Wj6KanwuWOjrnrV/zMnA3D+Muo/g53Y86/21JrC64f6tE9kRwva
 hPaVxhra5NiAbzwI+f1KuapD60I7CJ4ShzI38wTBlgsw/aeHEDb0/qAXkt6E2b2645EC
 1dsQ==
X-Gm-Message-State: AOJu0Yw7usQy9oV+dg2oISmqYfp/Ikkl6m7VT/98AO2suK0ILJ0dzjId
 0HhgQVfWXyIIBxo/Riaz0REwl0u23euRgLW8XyZNK4SKTVTPsoK6
X-Gm-Gg: ASbGncueXkUZRXLzvV7QjcKit8NR9B8KbJVoPEScoASSje15d/15K3GuDrR8gWtbv9p
 WJQhyrgiPbBv3+xl4mr+8czc0wVgTtinK4lA2h2H389Jss2PRFIbAiC3YO5dIOaShxmWChC2D3N
 K5outb0Prd4KnD8mNhULwcZbcf+m23CyJNIJc6zUfmxxIyzwdk0gFHn6aL2qVF4TN9D26tsocNO
 C7dlwzv9IfdhCdmPrW59+pM2aXVFAF5BRPohCna7LvSb40EdLnogifoZT0noo8xOQYOR6KCgjaR
 oaj2ethAd97esJmvAeOQUaOIuGSxxKjUcpEHnsoO73vd
X-Google-Smtp-Source: AGHT+IE6NyaKSWsufmYH5cuBADybmG03r6oOy5QuUTP68hFuOh3PEqtETMHUqZz02lhy8vWkbThYlA==
X-Received: by 2002:a05:600c:354a:b0:43c:eec7:eab7 with SMTP id
 5b1f17b1804b1-43d91789e8bmr24547425e9.11.1743162121507; 
 Fri, 28 Mar 2025 04:42:01 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b6656afsm2335864f8f.40.2025.03.28.04.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 04:42:01 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: of: fix documentation reference
Date: Fri, 28 Mar 2025 12:41:48 +0100
Message-ID: <20250328114148.260322-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Documentation/devicetree/bindings/graph.txt content has move directly to
the dt-schema repo.

Point to the YAML of the official repo instead of the old file.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/gpu/drm/drm_of.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 5530919e0ba0..964a746e90aa 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -55,7 +55,8 @@ EXPORT_SYMBOL(drm_of_crtc_port_mask);
  * and generate the DRM mask of CRTCs which may be attached to this
  * encoder.
  *
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
+ * for the bindings.
  */
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port)
@@ -106,7 +107,9 @@ EXPORT_SYMBOL_GPL(drm_of_component_match_add);
  * Parse the platform device OF node and bind all the components associated
  * with the master. Interface ports are added before the encoders in order to
  * satisfy their .bind requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
+ * for the bindings.
  *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */
-- 
2.49.0

