Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725B4B1DC3F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB46910E8AA;
	Thu,  7 Aug 2025 17:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="CiL7S3kg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC8A10E8A3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:38 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-24063eac495so10404105ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586217; x=1755191017;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZiTawsNty9h+99yOb8KIpC+axpRTSXewrJjYttsLoU=;
 b=CiL7S3kgAaUAIyd9J7Xt8uSjy43JBSJfxrhA+L/KbjvxY6MrG/n3M2Mko0O5wBsCwx
 cHWCvxrdT7ciFvZbiq/d2egCoukv9XOkp6jrAiv87MBOJlOMIi263oBkjwfMJ/c0BBQk
 RfkIMttqoNDzTuKN3Wec+jQ1Iuvj7vqDiGg4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586217; x=1755191017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZiTawsNty9h+99yOb8KIpC+axpRTSXewrJjYttsLoU=;
 b=UM/2Q0uaKRVCkwns9Q1zDi3azcm6QxgVgb203L15AuHPHrUp9Kz2D3oOiyLM9hgFzt
 2LQPfwXxykQ29eI1aPMbzTrcDD47No96DjNDjd3Gg0l14rlvnFBD8a49ZvuE1G/2buPz
 5vnVkeiTbhbhpRVZmKY4dGpksVg9pW8WHuqc9v0bfdYw4s1Lv1WN6I8mEXrX/0y8wSyH
 po8tBTkSjU9o4GcO+0KCAN/Bw+fEkXonnzIUA9KaRXPrA8mBySczESnfllqWDOns9aAL
 N7HpilZmY2JZgr6uUNOcxDq8UAOOax1dosKwfBc+T4XIujg0rw5Y8fkcHlrGdSVYer8w
 LtTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr9n4Je1RaTyrCWFYssEoqpGCfxGm7+AYk8+Ks7F+LQLx7qgGSJZo8+A7Rj9Idf6jUT7Y7eYISJg0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLg7cI7P+4Dw7Ew+CkCUKyeWMtdygpjBzHbf1u4vENC1F0DT/5
 Feeky6W4w+lmyO25socCD+BZledslwf/3f4ajzcyAwROoMr3wzogygrdIjdDFBeeEyo=
X-Gm-Gg: ASbGncvbjzdmzz0IzmK1kLZyJdppNfRBeKo/ucMD1A9Fd8q8hMPG7qNkLLqiY1rDUGV
 /Hbyj8Ww7XY0p7NRsCSVvpW5wTbAobV7bbgheo10Xqlgey6f6a+YqfMPCYLZeU4h3EFqcVYucBk
 oYARaDoojs/qNH+CdCzTszedon5hjrVHlo9CcJEGUq8W1PCp4/1xELADTaQQ5NVegwvotDEMmU/
 fmItDnLAoEeUgbg0n1/VeQrH4sdnyZAkeQK02PCzDiARdEm6XVo9yJm+Sjj/zn11a2BrOq6c0P1
 fsVEEM4fYkpidZxEZ81VLOveoLpzhJsxLTDCPzjKSJjanFGA9fCP24T7n3zDJaTXFts81S0+eMj
 hyuuhmnfHDdiSbtkyHtUgbDPTFAv9Ne2q
X-Google-Smtp-Source: AGHT+IE/Quu9771YvMy2Yspf77hfiYo2Jll59NF1OJagaIwjOshMnePxHTArM42crEdfWMHZlWtOlA==
X-Received: by 2002:a17:902:e944:b0:23f:d47a:c9d3 with SMTP id
 d9443c01a7336-242a0b00209mr90298105ad.15.1754586217339; 
 Thu, 07 Aug 2025 10:03:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:36 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 6/9 v2] drm/i915/display: Remove outdated struct_mutex comments
Date: Thu,  7 Aug 2025 14:02:05 -0300
Message-ID: <20250807170212.285385-7-luiz.mello@estudante.ufscar.br>
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

The struct_mutex will be removed from the DRM subsystem, as it was a
legacy BKL that was only used by i915 driver. After review, it was
concluded that its usage was no longer necessary

This patch update a comment about struct_mutex in i915/display, in order
to prevent future misunderstandings.

* intel_fbc.c: Removed the statement that intel_fbc->lock is the inner
  lock when overlapping with struct_mutex, since struct_mutex is no
  longer used anywhere in the driver.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index d4c5deff9cbe..aaaabba77b88 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -98,11 +98,7 @@ struct intel_fbc {
 	struct intel_display *display;
 	const struct intel_fbc_funcs *funcs;
 
-	/*
-	 * This is always the inner lock when overlapping with
-	 * struct_mutex and it's the outer lock when overlapping
-	 * with stolen_lock.
-	 */
+	/* This is always the outer lock when overlapping with stolen_lock */
 	struct mutex lock;
 	unsigned int busy_bits;
 
-- 
2.50.1

