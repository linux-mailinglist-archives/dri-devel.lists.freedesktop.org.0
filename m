Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436CAFBCAD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 22:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A3F10E55B;
	Mon,  7 Jul 2025 20:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Go4ebuOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECD310E557
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 20:39:47 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7fd581c2bf4so3082466a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 13:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1751920787; x=1752525587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7Pwyu+TcrHbTH88xvec2KnRARhjHeFwLVDM62N+ORE=;
 b=Go4ebuOHOl5FIuY2TN6e44MrQYamDFnhian+sBQrlHpCfu2Sd/6cGrwQXp2TNhCdJv
 WE03DdpLp6WxUsv+2FlUf1Rh2kmkoiUvsTT4V+9dJ+0kkZu8poFuqj5XwbdBBEmO+l/v
 43D7s1blAKWRQfwGzlHp9brjkgJjZtkOvA+PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751920787; x=1752525587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f7Pwyu+TcrHbTH88xvec2KnRARhjHeFwLVDM62N+ORE=;
 b=Aekjyyp0s9dxJ+WZBOf6sIIbi3cvFbW3tEejvCXc0lObvCZ1t/k1W4PNFQCwynyQ+8
 LfTODqZAbaWGZ39PnLekLrHISEGczFIO0FMT5OZMMlQHH6QCcR/rqSCTsFjXnfmXdE0q
 AVsMJhKow1sFb8FvSNL99i+YE64jpLA9a+Ds5JpXkmlFEAgYP99ySoI7qfK2zMOhXuH/
 NaBBZEchc+4RhIUwT0oDbmN2RGGcdMT4NDjRRjIx/c/UNCvPxhAv2a8qQ/OfFkiDdpIp
 XbLvm2ephMWqXRhJQ+0P6Zc8uuow2ikzg/F8Rda6ygDgnJxvIEftq9iLWC+hjAMcjTeO
 hUsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Gf5WlqYq/ApXtFM2pRw73z/TwudDxgsqMnVyuPi/FPakrbiAH7cf+VWIkNKCf6gqwrOfLw5Irbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq8I1ZAQyMVjYK7NtEhCGoUNIVyzYixlm62Oo1N05WkUKxa22e
 rjM+F0lpGr5If6403DlWp/+S41cuKNfMxrjuNtlKDtnjz1p0gKcvn8JpREbOTZIU8g==
X-Gm-Gg: ASbGncuJTXIT+dW0O1VX/UaZmQbmjzzH2lFCwl/cUcyGQshn+rHAoYo4SegvQF6Dc5/
 aklEhXzyhnpAnJnpVfiXndb6q6BhtUiUqyu2uBL1O1HTlsXrcVQe80mYHDO1ai8ltZpkOCTrA/J
 IQ5CtfZGyF9angUqaLMT8yHV216SVcgSFfP7KXH+M4xXzHVDSpuEbg7OkspPemof2YyBllAsb8j
 +6J/HQLL6KgAnQ/7gDThpUdAkYNYfy8Y4fAF2xSuIXWQ3JQV8b4Uem1ExApv0HRxk/zdkflwrZM
 5JQrepwhPcLNSM29bzWI9C58ceRJ5AeXjIaC3njpdYqW7tolEWQ7zx7cu2DuHEQeYVQDhZRXYGv
 Ff4gyVD7S0mKkrG5gNAXU2jgUqVQNTpHS45dpEgAJ6pZxihJ2JwguGg==
X-Google-Smtp-Source: AGHT+IEWxy3ItjqWEV6kdkw2QKIjeohqwsGnkaBBwmSiEOrsVLsXeApoq/l5kOVcDJoUbrBNB3L2Gg==
X-Received: by 2002:a17:90b:3fcd:b0:313:db0b:75d7 with SMTP id
 98e67ed59e1d1-31aadd9fd3amr19071529a91.27.1751920787262; 
 Mon, 07 Jul 2025 13:39:47 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (206.138.168.34.bc.googleusercontent.com. [34.168.138.206])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c21eddf04sm171912a91.45.2025.07.07.13.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:39:46 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v5 2/2] drm/xe/bo: add GPU memory trace points
Date: Mon,  7 Jul 2025 13:38:23 -0700
Message-ID: <20250707203849.545312-2-justonli@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250707203849.545312-1-justonli@chromium.org>
References: <20250707203849.545312-1-justonli@chromium.org>
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

Add TRACE_GPU_MEM tracepoints for tracking global GPU memory usage.

These are required by VSR on Android 12+ for reporting GPU driver memory
allocations.

v5:
 - Drop process_mem tracking
 - Set the gpu_id field to dev->primary->index (Lucas, Tvrtko)
 - Formatting cleanup under 80 columns

v3:
 - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
   per-driver Kconfig (Lucas)

v2:
 - Use u64 as preferred by checkpatch (Tvrtko)
 - Fix errors in comments/Kconfig description (Tvrtko)
 - drop redundant "CONFIG" in Kconfig

Signed-off-by: Juston Li <justonli@chromium.org>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021ab..950eef514c11c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -19,6 +19,8 @@
 
 #include <kunit/static_stub.h>
 
+#include <trace/events/gpu_mem.h>
+
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
@@ -418,6 +420,24 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
 }
 
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+static void update_global_total_pages(struct ttm_device *ttm_dev,
+				      long num_pages)
+{
+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
+	u64 global_total_pages =
+		atomic64_add_return(num_pages, &xe->global_total_pages);
+
+	trace_gpu_mem_total(xe->drm.primary->index, 0,
+			    global_total_pages << PAGE_SHIFT);
+}
+#else
+static inline void update_global_total_pages(struct ttm_device *ttm_dev,
+					     long num_pages)
+{
+}
+#endif
+
 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 				       u32 page_flags)
 {
@@ -525,6 +545,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 	xe_tt->purgeable = false;
 	xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
+	update_global_total_pages(ttm_dev, tt->num_pages);
 
 	return 0;
 }
@@ -541,6 +562,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 
 	ttm_pool_free(&ttm_dev->pool, tt);
 	xe_ttm_tt_account_subtract(xe, tt);
+	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e5d02a47a5287..6f3698a0bc176 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -641,6 +641,14 @@ struct xe_device {
 		unsigned int fsb_freq, mem_freq, is_ddr3;
 	};
 #endif
+
+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
+	/**
+	 * @global_total_pages: global GPU page usage tracked for gpu_mem
+	 * tracepoints
+	 */
+	atomic64_t global_total_pages;
+#endif
 };
 
 /**
-- 
2.50.0.727.gbf7dc18ff4-goog

