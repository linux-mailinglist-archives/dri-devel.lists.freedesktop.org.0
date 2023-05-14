Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015B701F0A
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 20:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ECB8911F;
	Sun, 14 May 2023 18:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785E10E033;
 Sun, 14 May 2023 18:43:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f2510b2b98so9445804e87.3; 
 Sun, 14 May 2023 11:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684089798; x=1686681798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wIbnvgmJCDQh9UHtsuRNkB0HCn83qO85MVUMP60gjIE=;
 b=kjV0uaXcPYLTGQvCeLALCIjuGNxIgWU+OQiEPGiN81CvvcrShdwbFYfq3wYf9LrEY/
 HFNkHmzViZf6uaOv7YNvevIW1HdmnPubQ6LSiGrtbqCKD2QtZQ5fKsYoP721h9eLy3C9
 PMOwqCpkaCwZG8fCUvZXlO4Bl9jZhuyXOysMs4DOpmAU/6t3PhPFmN8LDJtyh6ONxnb/
 GtO5el/QZOyLs4XYmRKyFOUhlxqdbwlJHlLQ5JlwnKk9zOtAnyUUrDb3SqCiPEU4rgkB
 JvLsYIkEBNMZfb/eGKGQYyPZbvyUSH8QWhf4iAxkzv33FCj+339AOib/kwtTg2P8A1Xi
 RDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684089798; x=1686681798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wIbnvgmJCDQh9UHtsuRNkB0HCn83qO85MVUMP60gjIE=;
 b=MmProqMwOpIW+SrnMI8JysgLYssLs4FlWe/k92qnm9dWbbp7iEYDjpn6u44J3psQmw
 o9Sv42xjXDqLiAWulgOs12TI4OQR1Hh2O8n9PD6OMvtNg2sQ6Pe1KCCLG+vU7SadulM5
 t6Eypn4qcOK78aBifob8av+jaJEcsv7NU6SFN2dk94eXxFDrzYp5qu4KFlaUWSXKH5YH
 c7RY2TUsNhb3lGbkjrV6uCyjOo2t0qYhVnu1HvFXngOozqfiEq0pR2SMp5TlMfygYalB
 MY81wnscuDAfxra9TPC7gwvP0VvxSLO2dbITh0sKor1fb8JxmJTOEVtu1nG0lf0Qpf+7
 kb6g==
X-Gm-Message-State: AC+VfDwgTZGcKe0Ezy9HbcaFcx1oVrZXBPDbykbXEuljYjgdc8LduCuF
 JsIp/sLNTmAe86paVA2dhXfSbCEtAa2c/w==
X-Google-Smtp-Source: ACHHUZ7PGcdsEvSS4/GYTyWxrZXI+WGSVbAqmv19un9LM4YpyX5mbOqVnMrLY4YjLR6Oabua9TD4yg==
X-Received: by 2002:a05:6512:943:b0:4f1:496a:de8e with SMTP id
 u3-20020a056512094300b004f1496ade8emr4238540lft.27.1684089797437; 
 Sun, 14 May 2023 11:43:17 -0700 (PDT)
Received: from localhost.localdomain (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 g11-20020a19ac0b000000b004efd3c2b746sm2254332lfc.162.2023.05.14.11.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 11:43:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/fourcc: define Intel Meteorlake related ccs modifiers
Date: Sun, 14 May 2023 21:42:39 +0300
Message-Id: <20230514184240.6184-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.40.0
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
Cc: Matt Atwood <matthew.s.atwood@intel.com>, dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Tile4 type ccs modifiers with aux buffer needed for MTL

Bspec: 49251, 49252, 49253
Cc: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index de703c6be969..8db7fd3f743e 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -657,6 +657,49 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
 
+/*
+ * Intel Color Control Surfaces (CCS) for display ver. 14 render compression.
+ *
+ * The main surface is tile4 and at plane index 0, the CCS is linear and
+ * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
+ * main surface. In other words, 4 bits in CCS map to a main surface cache
+ * line pair. The main surface pitch is required to be a multiple of four
+ * tile4 widths.
+ */
+#define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS fourcc_mod_code(INTEL, 13)
+
+/*
+ * Intel Color Control Surfaces (CCS) for display ver. 14 media compression
+ *
+ * The main surface is tile4 and at plane index 0, the CCS is linear and
+ * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
+ * main surface. In other words, 4 bits in CCS map to a main surface cache
+ * line pair. The main surface pitch is required to be a multiple of four
+ * tile4 widths. For semi-planar formats like NV12, CCS planes follow the
+ * Y and UV planes i.e., planes 0 and 1 are used for Y and UV surfaces,
+ * planes 2 and 3 for the respective CCS.
+ */
+#define I915_FORMAT_MOD_4_TILED_MTL_MC_CCS fourcc_mod_code(INTEL, 14)
+
+/*
+ * Intel Color Control Surface with Clear Color (CCS) for display ver. 14 render
+ * compression.
+ *
+ * The main surface is tile4 and is at plane index 0 whereas CCS is linear
+ * and at index 1. The clear color is stored at index 2, and the pitch should
+ * be ignored. The clear color structure is 256 bits. The first 128 bits
+ * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
+ * by 32 bits. The raw clear color is consumed by the 3d engine and generates
+ * the converted clear color of size 64 bits. The first 32 bits store the Lower
+ * Converted Clear Color value and the next 32 bits store the Higher Converted
+ * Clear Color value when applicable. The Converted Clear Color values are
+ * consumed by the DE. The last 64 bits are used to store Color Discard Enable
+ * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
+ * corresponds to an area of 4x1 tiles in the main surface. The main surface
+ * pitch is required to be a multiple of 4 tile widths.
+ */
+#define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.25.1

