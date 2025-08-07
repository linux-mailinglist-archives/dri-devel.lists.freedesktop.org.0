Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE97B1DC3A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEEA10E89D;
	Thu,  7 Aug 2025 17:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="tIDJEvU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117C910E89A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:24 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-af51596da56so965751a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586203; x=1755191003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GuPajkv8Rj4DGQtVUaBH/bpJ1pNQouNWTvzoOdjGMyo=;
 b=tIDJEvU0v1J13hhx2+9ti2Wemm9ErYnBE89F70s/MGe9Ftj2ATh/MaKczx8PI0ByHw
 uuB98l07dnG2AsAw710YAGmN3+0oM0k7sOdIIMsjzK5C3m1g4vsV6Za8bLK0mMY+LRgd
 xOVdfbabgeqz+7q6oI4cT7ZyVLdWFVt99j1B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586203; x=1755191003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GuPajkv8Rj4DGQtVUaBH/bpJ1pNQouNWTvzoOdjGMyo=;
 b=cJN4nVFKO+Obs4FIdEREgQb7Tqiejv7ItsM6Hp165jN4CVADtNinICx3M9zE2BhjTc
 iHkbCyzrN9hY+K3qcPflHh7BSXmk1K678hTEdsxA4Zd5wKebTwukAKvQszqA3hB9vIGL
 iD7jUD3/TjGtJd8q3nFgHEWwGcRfkTHVLKF2IFi2yut3RO8++FpSaydH9Qx0zfmJvqbC
 FuidtZro+VGHH3RDJTXSqVbtQe1uQl+8Th8hGC3mFDHCEaM+d0wOEoJZKRRp8gYyNjt2
 Ec+KKglLiqIZKZF/UJ6D0293E2VFIoPwVnKr0qBTSLKXklfl56wiU/E5+0HWAnpJHF0V
 TwpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfNIAVfRBc/qcjRASAycfzsnuakbHRY6QUnOw5WYb0EqmElLiKig1XmmAWmkjIANZ9j3X4cNWam0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZv+uVi1KyJ/wo9Hslh5IEXmBshOCXB/bj7abHiPTBkZttulkt
 kFMdvR665CAF5Ao17jxqolFHS+W3/Kyh4b3+i/2wP32TtWdxX2jz+Xf6QiR7QLy12lE=
X-Gm-Gg: ASbGncvsoQA6AhV4/R9xf6iAdt1OKiSj6I3T/QXWLv5XNN4zdGjNP8DcmVT3NUyVWhh
 Fe7YQmGoQOsy6fM5CaqoEJJhHsYUpHwwjXECKSwKTHFyf3cOS+aPJSb1cABxLZFrbYoiTGtlY71
 FPa33LpuS5G/SicZsGZsaU0TPLhr26UxNdS81+tnjGXtXMkV+mJN1D11Ukqa0dlXmuTZaRpBQes
 7d3qT+KaEQWwMGKv8oF/ktYge+C+5xDtB90H0nYARsEATerI5y7eaxc+D/Hsylev51woLxXgFfO
 T0Rxz44nuG29LXq71qPrw+AGZHeFao/KXWSRLBCzLqu66oRcYAGrZCPQFbp9V3iZfirjy6DgufW
 U+3TkX2F+dUB06MahB7PRpeZcCYJukHLrUxxDd16Gu5U=
X-Google-Smtp-Source: AGHT+IELxejrEAF3OtmrlY4OBEC06i/OSTIeEyG4BP7NxumGdCuXbdlcGsK0eX+BprjV4g0+1hcqFQ==
X-Received: by 2002:a17:902:ef46:b0:235:7c6:ebdb with SMTP id
 d9443c01a7336-242a0ae469dmr85328265ad.10.1754586203414; 
 Thu, 07 Aug 2025 10:03:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:23 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 4/9 v2] drm/i915: Replace struct_mutex in intel_guc_log.c
Date: Thu,  7 Aug 2025 14:02:03 -0300
Message-ID: <20250807170212.285385-5-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 5 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 469173791394..0104fffd5852 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -518,6 +518,7 @@ void intel_guc_log_init_early(struct intel_guc_log *log)
 	struct drm_i915_private *i915 = guc_to_i915(guc);
 
 	drmm_mutex_init(&i915->drm, &log->relay.lock);
+	drmm_mutex_init(&i915->drm, &log->guc_lock);
 	INIT_WORK(&log->relay.flush_work, copy_debug_logs_work);
 	log->relay.started = false;
 }
@@ -683,7 +684,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
 		return -EINVAL;
 
-	mutex_lock(&i915->struct_mutex);
+	mutex_lock(&log->guc_lock);
 
 	if (log->level == level)
 		goto out_unlock;
@@ -701,7 +702,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
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

