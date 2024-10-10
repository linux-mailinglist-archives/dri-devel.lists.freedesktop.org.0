Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76174997D8F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 08:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2110E0DB;
	Thu, 10 Oct 2024 06:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="p9wI0917";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AA910E876
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:47:49 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id
 41be03b00d2f7-656d8b346d2so356636a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728542868;
 x=1729147668; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=33F/qO1jWhb/z9QZCc7vqOINV1AdFFbOfnQtd2l6oAE=;
 b=p9wI0917CsWn1G00yghbMXNAiRE+PX58iwmoc+mPH7dJwAiYYVUI4XJnwJgOO4nT4N
 HXnMekSrPTuefUCsZMZ32biqIBlAfw+PmJVRn9D7dtvHxPuxO3g9KF3/ye17t5+UzeYH
 718scN4g7CND0rNTc9E6jMfotCcjbuyrWMNBZqJhrxM9W2M88CA+Tzyw83sXvjpXm9LV
 rnZ/dZLhOYtLFgk3p9kmHek2hT8sE/aYiFRQRlQm5XlDIfgMi3BsBoTkxB50nG3wqa7e
 fI5lEKEt9BCHRbDlkgNWWm5YZDgOTu2pw6DMao8NU3HjCoq+cg565kA6i+7/iSegC4Sn
 OAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728542868; x=1729147668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33F/qO1jWhb/z9QZCc7vqOINV1AdFFbOfnQtd2l6oAE=;
 b=YYQbiRZGcy4b+5+t6PW+bF+BiwRXhA+uzmwp1JI7uAA2aCXdGku3OPAZuF4m29nsVK
 yyiKpjZe9OBDfO9MqJfRvrjQB4tdKWHPIAVcO+e4atVNcJdiPUj/Lj5yX6HPBySKA30p
 lwbPYG2M20idK1xykNTi7994fsAYI1Ob9nyLYjA2jwznR1tHtUtgPeHaiHkWGBa/hDYQ
 +HlCWl5776cWT4KSGGt2Zw2HnLulsFPNTVZLrDyk4cBqSSeX8vwVWdklJutAnG4XJ4OI
 YgrNMgQDTfLMfAxAa6frH4nlvTK/5Wa2120fRVhme/HSgKnFMCXdVmu/YaBv+yQEvqbg
 iz8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfITgLQPfQhYDOVu0A6RNLxsR4E8ICPY1kWHBdEcbqACgbPVZ4M7aJao2iE6iL8/btwsZwsvGtfs8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfXpsHBV8ULtOERD+TSLX5VGiv1VPI+7dOWbeIY059sl0G48gM
 nuHYa0HQj+SxaM47HjRJ5sBjdw1MGgUNJhJ/uBTnKQ2FN9cFJ70hPFv5K05vyG4=
X-Google-Smtp-Source: AGHT+IEgUc4JwOQEFIr4+Uu9TrvsM9ik9NQZ6rVUYqg5KibEvwonxSBx64smuK3WsnJ9Ka0B0r8fYA==
X-Received: by 2002:a05:6a21:1583:b0:1d7:11af:6a with SMTP id
 adf61e73a8af0-1d8a3c4be3amr7324895637.37.1728542868540; 
 Wed, 09 Oct 2024 23:47:48 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71e2aa93dd2sm424402b3a.119.2024.10.09.23.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 23:47:48 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 dan.carpenter@linaro.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V3] drm/xe/guc: Fix dereference before NULL check
Date: Thu, 10 Oct 2024 00:46:34 -0600
Message-ID: <20241010064636.3970-1-everestkc@everestkc.com.np>
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

Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
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

