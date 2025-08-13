Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C5B24B14
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E95D10E71E;
	Wed, 13 Aug 2025 13:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="V9uiWu0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7110E71E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:51:06 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-879d2e419b9so4537996a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1755093066; x=1755697866;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZvt23jTC//L1s+xy2OqHG+OBbKd/63f2P5APIJAICo=;
 b=V9uiWu0IRJX4AN5PCNu/olim6U5QaQiFU0IDoBXzY9WVRBfEGOz3eRRem0SpP7be4/
 xm6y9hXv/h6eba40YPNkDMzWDmxbB4/e9lz/bkQbdarLz08gEZAtvjn/CkjsGTiJpEHQ
 yGR0ZZCA+C4FRYWKKDe1eBzmXrycYLDy42Xx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755093066; x=1755697866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZvt23jTC//L1s+xy2OqHG+OBbKd/63f2P5APIJAICo=;
 b=UPHV0sxjLDjXArdPTPfSfWBqg9PnIznxfEeh8apgdMNoAhdfgJOqRzXMLJ3Homg1rS
 wCEq7jTn2Pj03xmDDW/qiJHqOYXqo7Svz+LtCy1GboBSMy1zskhf3GDV8T9dIJTP0fpa
 9jsl2C5J5GBV/x+6uxk0CW80mI6mXe0LK8xdViuEgR8u6GxUasAIsKNHO9gNcDax/s0o
 Tmn1i1MDDNBEaxTmoYUTtVT9n7sWe1Ttym05FlIMZpyn18JG53KUAjMEirBZgtnTFFpL
 dKT3AnYIFw5cKbvSi3REakZL4s0WmMOgdVwS1eywnnZfmbbo4sju+YykKayAK5f+BxMC
 CoAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWxb57wb2zDd55gzQ3uMYtgmu2vDh4y8EvpC9eN79gNSZABNtD9hd2hk4lqZhjuE/r2wv7Al7+t8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeAgsD0mEfELv7vp/LT33YI50diPZHHFo0Bdxkc1jeWQ3B7B8X
 yX/htvJnLf7DUV1fzn3HJVtotSlsLKLN3+VR1JGwz6+w77HUTPFO1DbA+SFkSFongrQ=
X-Gm-Gg: ASbGncuaSHlYYZLIBP/Bez/Qh7l+rX+6UeLBqFs5jWk8SBJvKHnY/1NREAPWpQnOA/r
 oTNxkdXeg+3EES3b5fsm+hxMtuTGgvNoJAEMzcgGnXcNjR2bqMe+VbRiAGgJ4rfxQjanDFZBH+o
 1OnkXSIGHpI88E16Dd+10KPoLkmL6e/3k3/52a/tffTRc09iulSqfXONl32HKGCJeBmYrqAMbN1
 NJPtMTGQH5iGi6DQbQ7WNgeyvWHO02jAIQnSo+ph6nABKYbYm0PXjoJPVTWjh6n0SO3ujOFWbVi
 xrw4cpzTMb5beXbaIQ8S8oxzoMBKeAFFQYRjYpTk9uYY80qzFF9rHloFkORyiog2lQsFYJtPCVq
 j02Jz45KRVkU/JyKzSctbLtXbj+CK+2qW
X-Google-Smtp-Source: AGHT+IFC0yocGob+HMnVvx7xjASuIGNLxbuQ+Pjy41YKrrwQN4oYcdSWJz67iBIe78Y8pyy7nXQkFA==
X-Received: by 2002:a17:903:98b:b0:240:63a9:30c9 with SMTP id
 d9443c01a7336-2430d0f0060mr50725235ad.17.1755093066147; 
 Wed, 13 Aug 2025 06:51:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1709])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm326965955ad.168.2025.08.13.06.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:51:05 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 3/9 v3] drm/i915: Change mutex initialization in intel_guc_log
Date: Wed, 13 Aug 2025 10:50:27 -0300
Message-ID: <20250813135035.144762-4-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
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

