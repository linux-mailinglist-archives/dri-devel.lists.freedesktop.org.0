Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D66FF000
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 12:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA50110E5D1;
	Thu, 11 May 2023 10:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E915210E219;
 Thu, 11 May 2023 10:37:22 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4ec8149907aso9784504e87.1; 
 Thu, 11 May 2023 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683801440; x=1686393440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q0wiMX47tfUWeNg3duzwzyAu2wMRvaFF756FNcokCYk=;
 b=rk58LmN6d6WDVVF1xzh2A9cxDkoyRTPhzSRqa52gmmjLc50hwWIGl99DVwOqHbXIEr
 BC2m56EoTv25wCYVyoUCWKGePfoAYABgbaPfIWeHuDcFLeiQwP/IN6Dq1gTQw48C49Qm
 TAoSwokLthrFYZDWGfR1f4qDtzSVest/IijpDs956/z8ctLfZgBRCixJMjLOlNj/OWup
 IYcY74CP1v3Pv96tbvarlN6d/0Rth/nr+vH2Y1gkdl8KUQgrq9wgNaaT5yA+PipwteP2
 q9h62jGeg5f5GaBe7zoL+PB0vw79Yd94FZ4PoOSAvpS+0ihgJs4vf2lbBaPjPzcT00FJ
 n2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683801440; x=1686393440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q0wiMX47tfUWeNg3duzwzyAu2wMRvaFF756FNcokCYk=;
 b=E7mX2Rgnmw2hD2RwI5lzzvVlI/vju0L9AjRLDllGOcSW3aOvs2XnmjWX+Km9+bw9mL
 oqgtzURYa1OQaTZnSOxzLafZ4vqkRbMNZh6xccMa56JUHZoEQVJQt36D7j9LEiFCjLa5
 kh5qS7qt2IckrX/KFDD+FEmaMEyVxOrYCeWvMUAu7plPuUnG3v1NxSIAjLbXwUh03G0n
 x1RJ6yoYv8reodFZI+c3BckY6lHGanGkuVvBkjE5Y+VXX1dwNccwXIbDPZGO6TXHdfHf
 9TrBNxJIF7EjN1c88qxOy9zVznSYTBiQJmgnxTYX0Fs1oDQ3+ErTJFjjgrWivpbQMYE/
 gvfg==
X-Gm-Message-State: AC+VfDyQICLTyazt3X2Z54FUr9vOVWKvE/2MqVAeAQoZePmRxmjPTbo/
 WXaMBOBHYfs/xt9EBqEuNgZ9CxXRQ+PYBwwK
X-Google-Smtp-Source: ACHHUZ63BJNm4qir9GzkztmxXSDvucWpCp0BmoEslJAI5FfqG1RJ4vnl4unVr7FPSqjjZsKo2ex26A==
X-Received: by 2002:a19:f602:0:b0:4f1:8dfa:aec9 with SMTP id
 x2-20020a19f602000000b004f18dfaaec9mr1962068lfe.69.1683801440009; 
 Thu, 11 May 2023 03:37:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:998:22:0:e4f1:43bf:23ee:cc40])
 by smtp.gmail.com with ESMTPSA id
 y11-20020ac2446b000000b004d40e22c1eesm1064446lfl.252.2023.05.11.03.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 03:37:19 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/fourcc: define Intel Meteorlake related ccs modifiers
Date: Thu, 11 May 2023 13:37:13 +0300
Message-Id: <20230511103714.5194-1-juhapekka.heikkila@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Tile4 type ccs modifiers with aux buffer needed for MTL

Cc: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 include/uapi/drm/drm_fourcc.h | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index de703c6be969..cbe214adf1e4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -657,6 +657,49 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
 
+/*
+ * Intel color control surfaces (CCS) for display ver 14 render compression.
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
+ * Intel color control surfaces (CCS) for display ver 14 media compression
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
+ * Intel Color Control Surface with Clear Color (CCS) for display ver 14 render
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

