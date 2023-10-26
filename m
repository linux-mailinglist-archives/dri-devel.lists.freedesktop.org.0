Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5E47D7D56
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 09:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D82E10E607;
	Thu, 26 Oct 2023 07:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F4C10E756;
 Thu, 26 Oct 2023 04:45:17 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68fb85afef4so426189b3a.1; 
 Wed, 25 Oct 2023 21:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698295517; x=1698900317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vu8QLeYUjZNbSnkixSTXmF2Y28p223rbJ5vKgFenCLg=;
 b=TxdOOcKtpvtJQ5hT3e6Va7OmUPfYuycOPMff9Ce3U0R4/BWF5dVRmuD4hr+p0NZQN+
 maTn7AxFX1bX/k/4kn6/5OOG7eriNfQQtYTP/VjaldLDQRYA3Ym4E9mIc3dpJmzur8d3
 hxX4yTl+G7NELaAiIltGMJFdg6HU11SrfavDpoYQbg1aAdFitKCyXGlxaqjXAIXMLKV8
 ipEgSlE16G5cfYHMLpDHkj5OvZbir31FhL30pqW2d0sLUGFRFjvCfKeoZT8O95EilBmR
 2Mg15BS7tYYT4lPSGyK3Fp5SsbEC3Ca6dhQ/p31msySbayyfmBYmE3BUE34EPkZD2nA6
 MerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698295517; x=1698900317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vu8QLeYUjZNbSnkixSTXmF2Y28p223rbJ5vKgFenCLg=;
 b=E5O/rafnTLEKLwDS1Vo1cEAV6Ius/wwVJGucRej+XWzzo46z7CXt1qkCMOdZys+t+S
 6BJ9vk+ETdw32RF61RqOie0UXGy1hIcYm1cD8AbppoN21LgpRAQksa9DOyXqjcnhufFe
 E6d3DxoYIc4UcwSbR9g/Yp0y+TmFTCfBGFp36irEC/5hOmDNgR8Exljz6ayEKB1dRJZo
 0nU8yZIkN4sbSwtqlPNqT76vhhIrzI8Mt2S1sFOlHb71fuGuI82H11OwCNsF5w10EcKb
 o8fHFcnNW+RVNgL35m1vrlYjlvsfhFzcDNY3hvgMOaeAApGd4fYOICj+YrkwyUKwo6Ow
 kA7Q==
X-Gm-Message-State: AOJu0YyJTTGAttrUlAVzX5361L60g00f1CRiP04uPaUrtu5XJSf5eoof
 vAvCbjCladBxQk/hW6nxf/A=
X-Google-Smtp-Source: AGHT+IHmLx1vjbCUmM6pGN0s+FyIMFfTEfVvUbiEiM3526beXxMOKxTQqToByDEvSkrLS32RNXfE8A==
X-Received: by 2002:a05:6a00:24cd:b0:6be:5367:2131 with SMTP id
 d13-20020a056a0024cd00b006be53672131mr18403694pfv.24.1698295517258; 
 Wed, 25 Oct 2023 21:45:17 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-3476-69a5-23d3-7dbd.res6.spectrum.com.
 [2603:8000:b93d:20a0:3476:69a5:23d3:7dbd])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a63f006000000b005b6c1972c99sm9680031pgh.7.2023.10.25.21.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 21:45:16 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/gt: Remove {} from if-else
Date: Wed, 25 Oct 2023 21:43:08 -0700
Message-ID: <20231026044309.17213-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Oct 2023 07:08:03 +0000
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
Cc: Soumya Negi <soumya.negi97@gmail.com>, Andi Shyti <andi.shyti@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In accordance to Linux coding style(Documentation/process/4.Coding.rst),
remove unneeded braces from if-else block as all arms of this block
contain single statements.

Suggested-by: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 1c93e84278a0..9f6f9e138532 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -226,16 +226,15 @@ static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
 	gen8_ggtt_invalidate(ggtt);
 
 	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
-		if (intel_guc_tlb_invalidation_is_available(&gt->uc.guc)) {
+		if (intel_guc_tlb_invalidation_is_available(&gt->uc.guc))
 			guc_ggtt_ct_invalidate(gt);
-		} else if (GRAPHICS_VER(i915) >= 12) {
+		else if (GRAPHICS_VER(i915) >= 12)
 			intel_uncore_write_fw(gt->uncore,
 					      GEN12_GUC_TLB_INV_CR,
 					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
-		} else {
+		else
 			intel_uncore_write_fw(gt->uncore,
 					      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
-		}
 	}
 }
 
-- 
2.42.0

