Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DEC645903
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7BF10E03A;
	Wed,  7 Dec 2022 11:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3FF10E03A;
 Wed,  7 Dec 2022 11:29:20 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so1304667pjm.2; 
 Wed, 07 Dec 2022 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xt0s6DqATufn0DNLjv/Y4V9qqe/cu6nc3D6m36jdz8E=;
 b=crhz935DKX64Fr36S335EHU59RoazmPtGrt0qI7BOOSH1fCM5gIZyS2SJVdSAfEMZn
 qhRJwfUb/mhUoVszPDEUSZgu/FRX7M45GIrzgQSvZyDZb18DjRD+mI80hb5WJaFzTWeZ
 QdSZ5tmvS0X9Vf2fN4vkKKiZ1SmxNGsZRJy5zKkAR3Am52rr37KeEkYjj8wyJMDBraCl
 mvq76fS+bZXXPsLM3p7dYRhP1WbAbbJ1FnLoNAFGcSYcaoF2nt9aAnXK1xjZBfIFylSI
 1r3K2GR6x0gwHRJRDO/vil6BECqyAycgw6Aok/SMwE3NnNhBvl+1j7QKULNKtT7E6zjD
 HEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xt0s6DqATufn0DNLjv/Y4V9qqe/cu6nc3D6m36jdz8E=;
 b=YQCRz+61y15EWleQVikubw0Tw2flQFpLEzziojd5hApCBr6AFagTTVY05KT5Edd+cg
 AGBCVN62RXJxTzKepnW2aBiLFVkT3qgKwU6JE7WG4eK7AOCghf2nkM2+IA+p3lVaiLPs
 P4I2uJBPmyRzpgDqs356uULouEQdQQrmW/zD8Kr6awkGFKfT53QuCedBlJX3tcoVt2TB
 VDkH4bmkMFNzrSa9pFKuLM1yCCldYawngrjey4AuXbnMHAkb1fbQG++WyBXARkocYSP+
 u5JPGJPJloDgefqjyxKoeHf8ZZLpKrVU1glPuZkkZJu8L/wTApd9d+x5mhVpnZ4Hc3uJ
 zfsQ==
X-Gm-Message-State: ANoB5pkChQCFX9kzs/1bTtLDoB5Bqqr94Ux7ablq4BTg6htOqm0uWGik
 vxMfaH+gMhCkUnGyTohedtY=
X-Google-Smtp-Source: AA0mqf4K2lKCaERMfu5mWJUHG4BGTld9gSMyUjyjjBecCE6g9XzI/uw9U8eXqqVsJLU8pXDrjybYZQ==
X-Received: by 2002:a17:90a:e648:b0:219:2567:dc1e with SMTP id
 ep8-20020a17090ae64800b002192567dc1emr54697020pjb.237.1670412560302; 
 Wed, 07 Dec 2022 03:29:20 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 i15-20020a63130f000000b00478eb777d18sm1372807pgl.72.2022.12.07.03.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 03:29:19 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Fix documentation for
 intel_uncore_forcewake_put__locked
Date: Wed,  7 Dec 2022 15:29:09 +0400
Message-Id: <20221207112909.2655251-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

intel_uncore_forcewake_put__locked() is used to release a reference.

Fixes: a6111f7b6604 ("drm/i915: Reduce locking in execlist command submission")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 5cd423c7b646..acb40543eb32 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -819,9 +819,9 @@ void intel_uncore_forcewake_flush(struct intel_uncore *uncore,
 }
 
 /**
- * intel_uncore_forcewake_put__locked - grab forcewake domain references
+ * intel_uncore_forcewake_put__locked - release forcewake domain references
  * @uncore: the intel_uncore structure
- * @fw_domains: forcewake domains to get reference on
+ * @fw_domains: forcewake domains to put references
  *
  * See intel_uncore_forcewake_put(). This variant places the onus
  * on the caller to explicitly handle the dev_priv->uncore.lock spinlock.
-- 
2.25.1

