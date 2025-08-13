Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56FB24B1F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4D10E72B;
	Wed, 13 Aug 2025 13:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="oSerxNgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF74110E72B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:51:26 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2430926b53eso9711235ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1755093086; x=1755697886;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLfVPUa0a/XKPWyHgMZmGFddaXL+XDxKy7ccOh+PzIU=;
 b=oSerxNgse9hoJzpmnWNhlt4xxx4FGkHcBxY/HyJ2Hqzn/Cqz2YINlCSpN+K7JG2E+F
 uH8KT1z7Dihxgb2KpvEly6Q/3OMiEy54qqcrItOOZQ5JaPqxtKQNndIVGxm8E5IGO/xP
 ygCaVcRdndlI1d31Wp99OfRVOi3lsq+cPvRIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755093086; x=1755697886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLfVPUa0a/XKPWyHgMZmGFddaXL+XDxKy7ccOh+PzIU=;
 b=B4LjR0CQASpiNv50ArlHMQSg+uwa0rW3wDOW9QJhSD1VzEPJuUrUAR/ny8s8l3z2ef
 iDzncQ6gCjNuzEDp9aUSYtfeCKu0n9baQaXmvekXus4x1LQzTngrnBv3eWANZapE2r2+
 T7DyRDCnEyfsNiAAkkdA8TDFSpfk1gJuZXdx9E8gKYpDM102zyHL8mCR44ORhWd6aPnV
 OhgJAQ5SOJSmF0Ea/cmH+S42S15uy9H3QeIMcTnIGLAbZXWI4ByOVzfNsUXHARWjcwXf
 nnOwjYYoVSB7naX83J1iKSV7lQN60oH4l5Ew9z8XKSTCQVSqM+N0ELA7hCY88oGIyQii
 lfAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyvBLzspNB5iAVvDebBMWUUgmOK91Lvk0gGHkqR6HrbiKBb5Eh3gZeEhX8cKH6HsEvpMsuHEc3Txw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSGlIc9R8o6q3OnO+zc3cf4h6awwM9uKA1IXT/fLhiaWFpwJwJ
 UQKhAlKeMzSuvJLEf80jRE+WQNPgeUzekfUAkq1ZsXc6P3+B1qZLhCib2Fj+PHiG3pc=
X-Gm-Gg: ASbGncubX6pSZyzXkssz2lS8v1qUdUJJ77JlgjV9K1F73HcCgQlNQ45vdL0wJ+VjOfU
 bkBb/gDgccYdM+6q/psgSmGspYWdr2sHjhi19ie7O3wP/VPqSGADLhI1okSM+p/q4azC4bFcoDO
 Dt0vvxPGegzbSMY6c8kdW5X7WKpP/HMrATqRyKkElHgVfzIZi4ZJLDERYMM3wD05GrqG6UTbJSe
 7KOqduzJlr4Se4AOAlU0QYj3sAEHxz7VtzKGLsevpfvZ6Vl2LCvZcqSTXJ89RqauM9XywbjzkpI
 V860zLeBYGPkiCuyQ122rWnISLREZNV1ysMOph44VWAhbwGdRdiQx+YxhJE5d9/iu3LssEII7O6
 YFLXnfUg9usrJBw79eJnBNPbql3MFNKD7
X-Google-Smtp-Source: AGHT+IGAkayIz8t0CZBjk7wfb2pPKlgakxlKu3zTR8lWijx7IvX/y3nldQek3T8RM0sh4ORFCUarWA==
X-Received: by 2002:a17:902:c409:b0:240:10dc:b7c9 with SMTP id
 d9443c01a7336-2430d10e3d7mr54335745ad.9.1755093086515; 
 Wed, 13 Aug 2025 06:51:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1709])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm326965955ad.168.2025.08.13.06.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:51:26 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 8/9 v3] drm/i915: Drop unused struct_mutex from
 drm_i915_private
Date: Wed, 13 Aug 2025 10:50:32 -0300
Message-ID: <20250813135035.144762-9-luiz.mello@estudante.ufscar.br>
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

The struct_mutex field in drm_i915_private is no longer used anywhere in
the driver. This patch removes it completely to clean up unused code and
avoid confusion.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d1559fd8ad3d..c6263c6d3384 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -233,7 +233,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_sbi_init(display);
 	vlv_iosf_sb_init(dev_priv);
-	mutex_init(&dev_priv->struct_mutex);
 	mutex_init(&dev_priv->sb_lock);
 
 	i915_memcpy_init_early(dev_priv);
@@ -292,7 +291,6 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	i915_workqueues_cleanup(dev_priv);
 
 	mutex_destroy(&dev_priv->sb_lock);
-	mutex_destroy(&dev_priv->struct_mutex);
 	vlv_iosf_sb_fini(dev_priv);
 	intel_sbi_fini(display);
 
-- 
2.50.1

