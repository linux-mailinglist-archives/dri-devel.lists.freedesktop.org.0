Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B51B48D1B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA81F10E4EA;
	Mon,  8 Sep 2025 12:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="pvxi/lIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BA910E4E3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:15:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7725fb32e1bso4769013b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1757333746; x=1757938546;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZvt23jTC//L1s+xy2OqHG+OBbKd/63f2P5APIJAICo=;
 b=pvxi/lIRjsbPycetspSxanpPcWxWbIoBOpm+0Vp01Y6tP1BzM+PRdFxVJ5IYf7u8m4
 Q1Ui6LoybpmpKD9UpuUQs4BRWv8y+vlM9PtUJb9zC9/UK/p+r5YcRWclZZZZfWNj9Yg+
 3fKYMqPmKtQARbE5agbkj9Se1kbiEV7Jn0Vik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333746; x=1757938546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZvt23jTC//L1s+xy2OqHG+OBbKd/63f2P5APIJAICo=;
 b=kVUogywDt+6i0tqy9Z41vv/Tfi+xvt3hHklY4HsORR+Nj2M5h47JfL1iuHhtfSacjR
 CJ1YK6e01vKuBwouh2Hls4H/kLOvwnFVsbubTzwfNHCaE1lhetm7XHda95AcEL8ODyTf
 T9Z7kvO6Fv8furrVCQY/Z7HWUYEYmRvGvuGxfvTdmu1+zFHVslBaxY6Zn6IxbX2nvZ1f
 LYryOJX2H/xoENkB/QlfMKdDyo+vXWgKu6/h9NbSixsxt/Y2eOIjvMoYGt72XP12VzcD
 oqDR/D3pMDaL73IX5HLpOTiIabhANoGzQBKtb3PrJ2d83OP4d0lFdIcoe7Je9jJlGjEf
 3GwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV5ubXkyzzsuzQPJqJLTugUSXD55cOwB6tJ7dv7Gcsvdasr1i5hQVdnrHKZhyk7eVQ2ruJDA/D06A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuNSxmgzBVzBpPiP9SemOPe3Qt4LtVurYrtpdHcxqgCVnoOszU
 lk1e6c/GmcgD6z+n4tIpemvfoyx0cQESXHap3NbL1eP1xSssdu9PZHc9aMq9r2+6hMg=
X-Gm-Gg: ASbGnctM4mTayNxMPFtiRI3dFW+k7zH1VjUF1e7wtJKyJlnubTFH9qIEvmqehIFPZkG
 EWNxsvXhNcxxIwIJ9Hu0S2p8ayC6n/0O1d9/8n7wVMwrpYVWm3m4Pa1QzSAnnqxNxQ/T53JCyPx
 td2Uq7ky5zG7jmdW9WIXc2em5k01gj/R+bf5ponCs6GYsNeJ4fF8mjN49sUMLsKoOpRrsVz5WJ5
 8OJr/JF0QramTse2HYiQz/ogIsDGt6C5+fwuPwrHuB8KAR5G3Qd0D4QB4AV9zpnIKTr9zPk96hx
 btWew89N026OY56zj/i4tYb800YYLO09EEeQUuOP2Xm3v0vRnaIQ74CcmlnIGppheEX9OdU5a+f
 Kq3kPZQGvV44DoPmZHZoAZwSMweiMtmLd
X-Google-Smtp-Source: AGHT+IEUtoeih6zFpWNvve92FAkDQEbsUiuW9CjOjdxgTWiM8Mao09T7b173nfeETmP93uwnjNZSgQ==
X-Received: by 2002:a05:6a20:3943:b0:246:458:854f with SMTP id
 adf61e73a8af0-2533e5766a6mr12050892637.6.1757333745712; 
 Mon, 08 Sep 2025 05:15:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:943d::1709])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm28345188b3a.75.2025.09.08.05.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:15:45 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 3/9 v4] drm/i915: Change mutex initialization in intel_guc_log
Date: Mon,  8 Sep 2025 09:15:11 -0400
Message-ID: <20250908131518.36625-4-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
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

The intel_guc_log->relay.lock is currently initialized in
intel_guc_log_init_early(), but it lacks a corresponding destructor,
which can lead to a memory leak.

This patch replaces the use of mutex_init() with drmm_mutex_init(),
which ensures the lock is properly destroyed when the driver is
unloaded.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 65ffcaeee4b9..bfa02a17038f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -6,6 +6,8 @@
 #include <linux/debugfs.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_managed.h>
+
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
 #include "i915_irq.h"
@@ -511,7 +513,10 @@ static void guc_log_relay_unmap(struct intel_guc_log *log)
 
 void intel_guc_log_init_early(struct intel_guc_log *log)
 {
-	mutex_init(&log->relay.lock);
+	struct intel_guc *guc = log_to_guc(log);
+	struct drm_i915_private *i915 = guc_to_i915(guc);
+
+	drmm_mutex_init(&i915->drm, &log->relay.lock);
 	INIT_WORK(&log->relay.flush_work, copy_debug_logs_work);
 	log->relay.started = false;
 }
-- 
2.50.1

