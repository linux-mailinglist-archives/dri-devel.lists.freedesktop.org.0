Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546F6BB34F9
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 10:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B91C10E7A2;
	Thu,  2 Oct 2025 08:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="amW3cF3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC17C10E7A4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:48:34 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-36a6a39752bso8557251fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759394913; x=1759999713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z69FFVofVQpQbXPazzIrMIWvZw9YVt4e5mOAMA1/qQ0=;
 b=amW3cF3C6ZKw/q7Yx8thL8NgHr2N24pfoIvmC2f311h72cp+hbJgS0CZ3Ci99SRriQ
 MF8nac6sOi1f9UlgxkUp4RMUT8+71Zj5TkUUW8Sx/UUi28fYJtijlhipmdiJUR/4jXMv
 KnnOgdq81zE/+JFJuJ/kdb/DTuNopQRBewvP7qvFDrkkgsNmMk09SLoCPgV7lAtc1HZN
 J8BUKj0anytvichfyeSm/trtzkP1nXWPIy5P9urvOVe9vaWEo34dDEJ8xcm8XAaPLyeL
 sEuSNGpJx3T73zacSZzN7ObuUv1/Jz+NzOtfWFYR/cy/gRLTYAIiqPr0gwXofCnIYy/b
 SC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759394913; x=1759999713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z69FFVofVQpQbXPazzIrMIWvZw9YVt4e5mOAMA1/qQ0=;
 b=gGWJusRelLB2R+b4HLKenByRToOPOBXUtst5tHRClU+SgwGropQ2Z49C3qFGLOS77v
 nEsIniOsxvj5bj0NknlFRPDRk9lF6KYjpmMigLQdVTW/YjItHKsLgU7H4yveA+T83/Ht
 C0WEZA2nF3wAq5/LId4Bi5cUS48zMG99oMHDLEPJqg6jmFSmmvxGIGZ75IUCaD7y+1it
 vViX1+Ws+Olcf1AKoFC8K62PmITRSrljS8Jnc2g7OoObQTmhB1Sk1DBnfxyyhBBqUHSf
 upx/JRbyoPSeWiBqxEvM3dB80clmUKcGHJ7qFhIq98jeLvCNdCFYGFRYI6Vjrka/qvXs
 55Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOP5Ueue3+ak/9Wx/eHIrC+Hn9LWWtLy4ADReASDrPXqhmdvusCU23UMgc7BkuI0/23S2gAlw1+AU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp9IjfUtDjAUmdOTCnKKIiKmcZ1ZNDgmZstg7xeRYccONnkCft
 Ts2Wkf089asfrcZP/JsHNV9tOAVWipT+goj2nh3KOY6IVcZRhpvw3V+sJBlnQD9E
X-Gm-Gg: ASbGncsITk2H968wc4OTcxJy3/AD3WoL5NpOCye7wdr9dW7FhW/GYlpwJzZJWBmry/M
 s1yFRcSa8S7RASXN3gsPaCDbq5Gs2T9bvi7sMrVCeuLgTWshAL/dNBYFe/lnRvJPi4Qmd9uyNSI
 t/JiS5vmA4GTh5HAcvNzztYeucuS7tUlUcrTWLYp+JWaSRSleihXxQLil1YYSXSJmbPhfepM5Vg
 qwvm6rkCVC4dPTjhOIgAeWcKOF2zcYObhX2COM8+YihVEyVNzS1seiJOP8UTokp7dWZ+U7cMHVg
 n9JPRpK5rdhqutQWBD8TJ0x2FoNDH1QG5ll9QKVJBhciDQ1G4Hf4duBEqmmuDzezBXgjQ8P67U4
 zl9Dl772UVKfV8IwaPuculltbxXFbEkUdPXuQK0ubxFGiEvu0vos1pFgyH6CbrKTsHoHKZg6IYj
 hRM2imKiCtLFvHCbFRKezxu98yvr4VV8Y6PubjFoX4
X-Google-Smtp-Source: AGHT+IHSpWYO4jWecZ3WaJ5bbAKSHrzDEFpF/Bo9oTWfMoBxUJCFoeCGVTF74e3XeZ0egpGJ1oJ8eA==
X-Received: by 2002:a2e:a912:0:b0:36d:501:76d8 with SMTP id
 38308e7fff4ca-373a7430622mr20975301fa.31.1759394912620; 
 Thu, 02 Oct 2025 01:48:32 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba4cdf62sm5338621fa.51.2025.10.02.01.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 01:48:32 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Date: Thu,  2 Oct 2025 11:48:26 +0300
Message-ID: <20251002084828.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Alexandr Sapozhnikov <alsp705@gmail.com>

In the drm_vma_node_allow function, kmalloc may 
return NULL, in which case the file element will not be 
added to the mmo->vma_node list. It would be good to 
not ignore this event, but at least log an error message.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index a2195e28b625..adaef8f09d59 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	mmo = insert_mmo(obj, mmo);
 	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
 out:
-	if (file)
-		drm_vma_node_allow_once(&mmo->vma_node, file);
+	if (file) {
+		err = drm_vma_node_allow_once(&mmo->vma_node, file);
+		if (err)
+			goto err;
+	}
 	return mmo;
 
 err:
-- 
2.43.0

