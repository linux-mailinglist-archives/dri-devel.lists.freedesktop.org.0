Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A963BB1DC37
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D2110E899;
	Thu,  7 Aug 2025 17:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="rLcnI8OO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4928010E896
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:18 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-23fe2be6061so8533415ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586198; x=1755190998;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmaAeFFWA6mt3OmAOl1hmXirLGR6yM9w72q3d5laiXI=;
 b=rLcnI8OOLqJhgdrUgEoMuyjG96cthW/uCsHyrfQMisL27tvQR3t45geCEeXsuEBzMe
 qRXqb9EJ7ybqKEW1spQvGDbMPjyhACkbtAVfFGeC1bIBl4gU0TQnKThWe3I4aimEpe0p
 az4auNb1UKgNd70Nn9Byr7klgC6Yoqe9VwSDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586198; x=1755190998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmaAeFFWA6mt3OmAOl1hmXirLGR6yM9w72q3d5laiXI=;
 b=msxCB636f5eMwcng8K+lfQc5RBDzr9w52M1Mm5i1BmB9GfRjrhGaAFgiqaXWRfoJc2
 sxD0lN8xiGG6SMDSITbd6PzkNLGsyvSuRhP74yTa6yVit0uE5FNGLxNew/t5Dee68r2A
 v+vlPtMjjkA6XmF7OEkVG5zOQ8K2uPBoAijIH4xfnxEa1PbjNZpV4Mx9Um9ViU6mO0BT
 OnURXypWB58PhbMfx+YLxEkTkt8c6OZIsob0tUi6R0t/QFu0ovwZNoqkWZWvxym8mYxo
 I03UKC3f65f2YP6E88hXRAiu6plNgjVWFZijGHJSavEecDmGg4VWlBgPbthZmfTDyAol
 yi2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQfpQlrEKw4Wz7mPveR+M/4a1rOZyoasZ9nVKKGn+L2s5yNyU259R+NoEr+24YvNih0XdcSlQZnzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxndEYFQI4I0zpixoWCBZGYsThEH3EJn0tLxSMNpHO9lQJMDLS4
 Cw5nfypxNbDteWOeccLmf67OZEk9TBh7Fb3Q+SczlJiGhyopxt1Yw6aAfBJKMwQgw3s=
X-Gm-Gg: ASbGncv697XnERJ5/PWu90H0DnUyLfhJ2DgB7kGUXDymOsuKvryD9JRMUB9nj9DFvyn
 xidDEJsyornxyaFG93YemBrxnvUz+vVMm9qlrIGZIqaWalc6pXO+JaZcvOzOTQCV3Wo/UFvNF3X
 1cw6N4aXnezz7fa12nDsBwxRoK2tApYA0I9DaDXZL4k5yvMmTVvvixuBYd78RiC9spLSH4bLBS0
 Vqay3nmbJQ3ErXk84QXuE2eGtv9n3xWEKt7KEDk6Nn58cBe6QI8mMWLBOptKosDwQOTcs27lYyP
 41dXOOR6VsgEAFcynQDSPYFtB3Gfr1efVpDC9AuVRfhMO9CoWTfbZVZh0qhfknS+SV1VMcn5OrY
 h3ojl7gAJrGpoIC/H0hBOUTE/ghK/yKq1jZeK1FXQJBU=
X-Google-Smtp-Source: AGHT+IEI+JqvxbyxwILUffJ1WOEQOIA2orP1uY5gZpeHknGUKbCPNXTGJJqdNmt208+XJ303Y0DxaQ==
X-Received: by 2002:a17:902:c943:b0:240:8381:45b9 with SMTP id
 d9443c01a7336-242b0640515mr71168295ad.8.1754586197488; 
 Thu, 07 Aug 2025 10:03:17 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:17 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 3/9 v2] drm/i915: Change mutex initialization in intel_guc_log
Date: Thu,  7 Aug 2025 14:02:02 -0300
Message-ID: <20250807170212.285385-4-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 7135fdb0ebb4..469173791394 100644
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
@@ -512,7 +514,10 @@ static void guc_log_relay_unmap(struct intel_guc_log *log)
 
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

