Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBF7B24B16
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155F310E71F;
	Wed, 13 Aug 2025 13:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="ON9cHFDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0F810E722
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:51:10 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b271f3ae786so5439713a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1755093070; x=1755697870;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3/Sq+vNgg4m+drlyeS3ftFb9OT2eAyB9c/v9D5qIQ0=;
 b=ON9cHFDhwgrkORtcRyEMBLk0qE7xcZhzukNXcIe+H145tHp83dPl2TGJuBL5C3UgPT
 k1MhG2Yem0uFEHOxSu7WJoc4r1e+kHSRjcuffPwDLCP9efQgiPiqN9KdNVnJrqM4vh82
 Fg5+sm2vzt8US5vKeD9NM7GEBJGcP5aONhsHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755093070; x=1755697870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3/Sq+vNgg4m+drlyeS3ftFb9OT2eAyB9c/v9D5qIQ0=;
 b=iAgPB8Dg5BwdSYTLm7SkIDGNm3Da4fd5lP3dZNLnR2FPzWz9C+KGKTVURgnla6HHVb
 qdADIZ7ZWekMhBQEEA2M8C4NuFl1jaDqysvlrG00+Xp10205hiI2K6mmeX570MXu0e6u
 XuASYnnrpLi5d7daQLfyMLVq0lHASMRx8I+IEF/rhb28fvCf/x0BXRtFCGjxlUgtpli2
 39deL60VjEcDr+lEV3HtVT+rBvP/QlrVTWI68Z2eh4zprUtStkk2sqGOUSaG8t40OvQa
 Ga7EIGIaKnZFLQdD4QsK1gzHm33T1iTHp/o8pD0syMiQjv7CnDiwe+4i8Rvn8DpQbhOi
 LDtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm6lrUUQR1BS5LSNua2IkuwG52l4W6PUSbQngQLNLkrw60j8vrd44D6ywnwlqxNKk78bFJCb2S60E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBDZgL0ck+Ztxsmj71RPk7HeSoVwNdazIcj/FmU1QedO7WtVml
 USCKuU7l1ja9yF3qPjPWVfDdfA5XiSTppepVWZ7cJA6bwtS35+OXiTebR06nPiQs4jM=
X-Gm-Gg: ASbGnctXImrObA6K4w/vgq4k6xo4s6EBArhM9cIjrp/3mxNSr8dlf6JImWz4GTnVqFu
 BJ+JXT1keK02b1i9/lIUC/i6zLEAxWiZ3SJukW+CJuV/1d90Ddqf168ELa2z9Wc+YqBcv/qs2o5
 DDWoatyUKC0DvTjvrLiQ1Dp1d2LrCP8Q7P5qA8A/AWD54SfKzGIkQqay+JzWREoSvTg7JIvvd6g
 9N6ERsNnMBFsAaccoxafRSP79icEGfMbzO5mqzW+v18FMXF+UKAc4g05TssYl5RvDQo2z9d24OV
 m2RTyDvXxO5Wia8urCEkGvi7g5Rt+jTUa7OGOsyOOQBZ8U2DM7y6OzxYOC40KP30FiX0ohEJkOg
 O25NxcooItztr4hCjYtwDACuZjdRZ1kDG
X-Google-Smtp-Source: AGHT+IEABtrLeErGGK9z50OhHjjqXVJ7tkjFy2ZSHzdNWk0l0GI1AsZNKqAwIoHFv5vKo76excQqAQ==
X-Received: by 2002:a17:903:2446:b0:240:981d:a4f5 with SMTP id
 d9443c01a7336-2430d23384amr47165255ad.42.1755093070035; 
 Wed, 13 Aug 2025 06:51:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1709])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm326965955ad.168.2025.08.13.06.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:51:09 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 4/9 v3] drm/i915: Replace struct_mutex in intel_guc_log
Date: Wed, 13 Aug 2025 10:50:28 -0300
Message-ID: <20250813135035.144762-5-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove the use of struct_mutex from intel_guc_log.c and replace it with
a dedicated lock, guc_lock, defined within the intel_guc_log struct.
    
The struct_mutex was previously used to protect concurrent access and
modification of intel_guc_log->level in intel_guc_log_set_level().
However, it was suggested that the lock should reside within the
intel_guc_log struct itself.
    
Initialize the new guc_lock in intel_guc_log_init_early(), alongside the
existing relay.lock. The lock is initialized using drmm_mutex_init(),
which also ensures it is properly destroyed when the driver is unloaded.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 5 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index bfa02a17038f..cdff48920ee6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -517,6 +517,7 @@ void intel_guc_log_init_early(struct intel_guc_log *log)
 	struct drm_i915_private *i915 = guc_to_i915(guc);
 
 	drmm_mutex_init(&i915->drm, &log->relay.lock);
+	drmm_mutex_init(&i915->drm, &log->guc_lock);
 	INIT_WORK(&log->relay.flush_work, copy_debug_logs_work);
 	log->relay.started = false;
 }
@@ -682,7 +683,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
 		return -EINVAL;
 
-	mutex_lock(&i915->struct_mutex);
+	mutex_lock(&log->guc_lock);
 
 	if (log->level == level)
 		goto out_unlock;
@@ -700,7 +701,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 	log->level = level;
 
 out_unlock:
-	mutex_unlock(&i915->struct_mutex);
+	mutex_unlock(&log->guc_lock);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
index 02127703be80..13cb93ad0710 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
@@ -42,6 +42,14 @@ enum {
 struct intel_guc_log {
 	u32 level;
 
+	/*
+	 * Protects concurrent access and modification of intel_guc_log->level.
+	 *
+	 * This lock replaces the legacy struct_mutex usage in
+	 * intel_guc_log system.
+	 */
+	struct mutex guc_lock;
+
 	/* Allocation settings */
 	struct {
 		s32 bytes;	/* Size in bytes */
-- 
2.50.1

