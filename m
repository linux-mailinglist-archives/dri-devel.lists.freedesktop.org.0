Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2089AD87A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 01:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BECA10E08E;
	Wed, 23 Oct 2024 23:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="SI316MoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889A910E874
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 23:36:13 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-20c7edf2872so11066005ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729726573;
 x=1730331373; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2O3NkkjIemIsAieDahgo6WCW7UZHnrJROVrMuNKxroU=;
 b=SI316MoDh0Sc0yUpRaJKZ0KQQZWZ/QfQfZVqm12/7/jbWqKbZIIssZ57QlEha2l85O
 2imIDGULvA/6YLtyzfpG7oj7rw7FS2yFFO1k+Xt4gQ/+aLT/MPT8Mf7IdyInSbQIdvXC
 RMWJjPtUxTUQiWD04am5zl/TaKnztZtSJzbNgyIITY17XaDGBavvDMmAXZYShoEDBvX3
 CnUhVb+qCDlmhc2zLzSqzenPkB4KWkQxQXAjKE4tGxhUrSfmAhRFD43eZ/O8aKPBtOW+
 3h49pM4vk1jIMJVlMsfDGkV/bLqpSR4wVjWoFYdm6IhI9Wx87tLJ6ilJMhyvaPQosJI4
 hOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729726573; x=1730331373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2O3NkkjIemIsAieDahgo6WCW7UZHnrJROVrMuNKxroU=;
 b=epadIdBGgQe5qM+kEucmLl2ff7qbPnM7b9PcxQbXqu9HVuSlytElu43rQI4qpvrB4L
 PvFOqfDSdMLJMVt9pf2AkxHH83FqWXpz4AkHt8rQSeA+60aCQ1CoeQTezOytR24V4Zhb
 MRakKa3Aq/c8WPYd2L+RCoyln76s/n1GYvN39vSSdcWOGDuIc7hjH69wxfQWU08yOtxN
 ibTqQnZPTSp7aLKniKCckUxtinXC9C15j9+Mzy7/DBDlgfXPXvhZngtXkoBJszRpKY6M
 U8rJYz8NM6w+oMizUOic+IlbsM0/drkU4v4w5uw1ob30SSjxfnuyV4lr1k4EmALKwXih
 5QdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhOBUgC+8xYbx1/FtzFJV5S7bfzJ/uMe76BMQxUUdW2gLdtFJntW6l+TXfTw8capgJ42iGC3yLT9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9KSucM9yeDvLbcqGo0Sx5dpQiXW1YLQvJbIx7u7ttRwaQAdy0
 rwiITy42+ZoXa+JlzxR9A+yeqQ7KUHwptPnLvXHp3lrEBYMxlp35us9mJlrqRaM=
X-Google-Smtp-Source: AGHT+IHwaFUU21df+imHVfe6pTP9I9aELH11EYkAeXYd/RsFrtAI3BUr3gcBnM47ZiLm1gigdv3+Ug==
X-Received: by 2002:a17:902:ce8d:b0:20c:ea22:3317 with SMTP id
 d9443c01a7336-20fb89ffc5bmr2049015ad.29.1729726572793; 
 Wed, 23 Oct 2024 16:36:12 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.70])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e7eee89bfsm62534695ad.29.2024.10.23.16.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 16:36:12 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 dan.carpenter@linaro.org, michal.wajdeczko@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND] [next] drm/xe/guc: Fix dereference before NULL check
Date: Wed, 23 Oct 2024 17:33:55 -0600
Message-ID: <20241023233356.5479-1-everestkc@everestkc.com.np>
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

The pointer list->list is dereferenced before the NULL check.
Fix this by moving the NULL check outside the for loop, so that
the check is performed before the dereferencing.
The list->list pointer cannot be NULL so this has no effect on runtime.
It's just a correctness issue.

This issue was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335

Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
V3 -> V4: - Corrected the Fixes tag
          - Added Reviewed-by tag
V2 -> V3: - Changed Null to NULL in the changelog
          - Corrected typo in the changelong
          - Added more description to the changelong
	  - Fixed the link for Coverity Report
	  - Removed the space after the Fixes tag
V1 -> V2: - Combined the `!list->list` check in preexisting if statement
	  - Added Fixes tag 
	  - Added the link to the Coverity Scan report 

 drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 41262bda20ed..947c3a6d0e5a 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1531,7 +1531,7 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
 {
 	int i;
 
-	if (!list || list->num_regs == 0)
+	if (!list || !list->list || list->num_regs == 0)
 		return;
 
 	if (!regs)
@@ -1541,9 +1541,6 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
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
