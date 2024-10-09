Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4BB99751D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 20:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974A410E040;
	Wed,  9 Oct 2024 18:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="llaSCUp3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C709710E040
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 18:51:12 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20b93887decso542585ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc.com.np; s=everest; t=1728499871; x=1729104671;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+0QE2yWoVqIEzNKM/3F/Lnwv5evjqB7rUXVgq/OQiuw=;
 b=llaSCUp3BQGZsdnJGYyMX2gPa9Yb7Pzro/8l/ciGcA9kT/yCl8JkaM64idKJDu99iM
 pgtvxXpz/p/tM8tYyFCgKCwGr1RymN+L+nbJo/Q0hyZbOcR+p3fKEfBBCjbzhm1NPQ4X
 MVnOzam5DRGLbOVapsDtcL3y9GzRY9BciDcBUv28arcQxVvGy/D9YJuVtiG8Lojyk4xf
 vxCBJRbtddOFmXkTTmi48eRtZJ88K58Qxm7DjLxwdbzRAxslixdvcqQ2TLQoWLrky2v8
 yMIicAU2pcIB+a6WVgd/WAY5bJY+EtZecxum/YFvzOkve8cP7RBwK4FQImKuyTr72Jsq
 SLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728499871; x=1729104671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+0QE2yWoVqIEzNKM/3F/Lnwv5evjqB7rUXVgq/OQiuw=;
 b=XwGi9LN7c8B4XvyYZflURq1BauTP6QwccJrjcCESldgE8EaYPqgwDR7/3kOYEsW1S/
 7Km72qTQcldx51EvWhOyfytnyavGN4PQQ4fnWL4K80Us04GWIooyQRcAC1nyRgDu8XzV
 M+Wwk5jma1XIRKiFQQv18RK8z/v9G1Un/3CnueqUtGl+8rQ0qPhfFlRgS9o0rG3mLFvJ
 MXq9USU6xmqfquJCS61Ye4P4BIt6Hmd3ikmrK1ZEKv5DT1Hc/pdfwAvr1t2To5j96sWx
 hd77BgJLHisXzRZ8WyC/Cpm3WM9tOX3BNm6SzAEYZ9aQWG2Hqgcm+QoDX1lhsdU57miX
 Wndg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjpVxcNp38C1M68Hj5bfl9D3TUIKscFulelZgosI46KimwlJHi6KeyPqJ5skjvTrr1zvRtAUXMbKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytl3cpVZfTdiqb1RfKqbwpBSMSLZluQ4AZcJtNFKlHnja5sYnC
 Adjpz+qSdBeGjugbhvtOjZrCZI8fnGXM3gWV0Wh/aPRAiUGJ9eiuLR9b/VfTo2o=
X-Google-Smtp-Source: AGHT+IHpQGViTVc+tm/tkjno8glkT35adg2V8Ycv4zbgyv863j7Td5NNgYxT1CIZMuESuswQ3Zwc8g==
X-Received: by 2002:a17:902:dacc:b0:20b:7ece:322c with SMTP id
 d9443c01a7336-20c63742f31mr54388955ad.29.1728499871390; 
 Wed, 09 Oct 2024 11:51:11 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.158])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20c54056b07sm29864905ad.64.2024.10.09.11.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:51:10 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/guc: Fix dereference before Null check
Date: Wed,  9 Oct 2024 12:49:49 -0600
Message-ID: <20241009184951.4991-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
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

The pointer list->list was derefrenced before the Null check
resulting in possibility of Null pointer derefrencing.
This patch moves the Null check outside the for loop, so that
the check is performed before the derefrencing.

This issue was reported by Coverity Scan.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 41262bda20ed..de63c622747d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1537,13 +1537,13 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
 	if (!regs)
 		return;
 
+	if (!list->list)
+		return;
+
 	for (i = 0; i < list->num_regs; i++) {
 		struct __guc_mmio_reg_descr desc = list->list[i];
 		u32 value;
 
-		if (!list->list)
-			return;
-
 		if (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) {
 			value = xe_hw_engine_mmio_read32(hwe, desc.reg);
 		} else {
-- 
2.43.0

