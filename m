Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B956EB48D1E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F0D10E4EB;
	Mon,  8 Sep 2025 12:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="ittK+z15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990C910E4EB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:15:50 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-772843b6057so3449419b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1757333750; x=1757938550;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3/Sq+vNgg4m+drlyeS3ftFb9OT2eAyB9c/v9D5qIQ0=;
 b=ittK+z152Y1/zmhYv22AD6EsOq1kqrePQSm9DOTWlUj3gLndLcl+uvFFXP74iY2vyE
 kua8JJeo7XRMPxhjXAIh8Z7Tsp0ejB9Q31IQmzBzZUlcnXl1k8ceocfAbpJlSlWPS+hw
 c8Dvh8LY3msJIJstBLhXAaBqw8cMuA5XWy1JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333750; x=1757938550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3/Sq+vNgg4m+drlyeS3ftFb9OT2eAyB9c/v9D5qIQ0=;
 b=Bq1THNld198QapG4lt91duVbtUZs1r2jR650ho3QI6YFNvu7q594qJ5HY2xJ5KC4wt
 b15rfuxe0ucgJuNm9Wd+mVkvIzBASAX19eQFa315qjaKM+1Mzek2qs1MkUiK3CWPfrX4
 o8nTe40AcRdZ5HUOhD+jA4TbHgX7XKk6LNnsjLZ7cJ2IpnfCkLePThRTL2h4nuU0T3Q4
 Tqrk9pBmQ1cF6r8IPp8byl8b4pwT6U317lhumBy5WvCtIsr/WMOoB+KLv831i6cnG5jO
 vWThA9CJ/6bQfIq/FdCKvdU//8sLZc+ztxjSjaE14l4KQXjMEN8r76f4Bj+KDNhRZ5E0
 U/Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR50Yz4J47j3V/FgE4aQyAJy4yS9sx24E5xcom+tDr2VBvmpDxWBB1ENkTAlHY9NSNXwJ9zrw1e2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfo1WrsxGvez2SMjtG3UWHEMJ3sNngCK0lqHmEa3UpdHBMHSms
 wDGF/UeaRG+bY6wJJ/GlKmciwyvgxqHw7ME0JCElzxQ5Tl5GdJF2ZojUdQ0rj4VK3co=
X-Gm-Gg: ASbGncuz1qIBTR3D4t9ENVOT0y1At9IEQAJO5ISBhd77oi2nHMTG9rvUo/7E5YURnQ/
 N+xqSxhmztyiAgj2oy6hLyH7Kz2xQItycqBkcnz1Bs6y3RRTeh+fNYf0Kjt9DpZjljjOkKVoGIZ
 wO+mm61aslzIUpG+JFpMeIA4Bfzl2zqU7UXrwAI3LCLTDWwcALpTv9Dorz1cwdVjCqV2kAutZvz
 YqhLU0VeNRXXxCbCczTvZ446Hy3MdXiNFvGUppeGTOFQVh5jNPo/STkn38fmtZ2njvmh56ymdgp
 VVp73xibEHb4Jld+mso60M4DZm0B01sgVAh9XeANIOsmkMhgiV0uYjbNEc1EE2IiQVC98h89d7u
 aGS8Y8jlwsZ6lSIMJaQ2mwfeYlCrgetxdA0qRc8KSo4o=
X-Google-Smtp-Source: AGHT+IF6VOuSVeyrb5NhQEAvWBO8/spLKmsABNvmUJGsSnK4sSB4famjs3m8g6bKGN1xPQVz8+Jw5Q==
X-Received: by 2002:a05:6a20:3d05:b0:251:2a11:e61 with SMTP id
 adf61e73a8af0-2533d226181mr10991779637.17.1757333750093; 
 Mon, 08 Sep 2025 05:15:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:943d::1709])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm28345188b3a.75.2025.09.08.05.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:15:49 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 4/9 v4] drm/i915: Replace struct_mutex in intel_guc_log
Date: Mon,  8 Sep 2025 09:15:12 -0400
Message-ID: <20250908131518.36625-5-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
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

