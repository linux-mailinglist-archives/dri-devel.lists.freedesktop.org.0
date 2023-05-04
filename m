Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42376F690E
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 12:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735A610E426;
	Thu,  4 May 2023 10:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1963810E425;
 Thu,  4 May 2023 10:28:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f13a72ff53so355995e87.0; 
 Thu, 04 May 2023 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683196103; x=1685788103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7dDW6YW9g+BSy8J6K3KPtt7xboSismIsEGXDGzqEbfU=;
 b=ns4KDTuwcm3ZEZVHwP6j2ajVfMV7gUe4R9Grb3auZC5RsjrsdjxbGQOK6f+zvKUgk2
 o3T7kwayBrCZz9sw6oVEx/sE3Y0I4qp8I4dVCkp77qIEvQwXMb5T4P5DiEkBRqLS/Osb
 2XfPXbcGpKdR4ZosQ8PfsGdydexj5MnkyX8/hHFllicQ1CR8M5BLaGmC3/6qFPk6QKLX
 4+mESudou+shXAdLnm8HdXpA7JIPh/G1UGao56ylCE90dTOifNGi/NWw/H413hH2Bn4y
 RmuFdK3QVGmlZBJ5TeP8H+bmv/IVtTm8+7jlL/qptUo/yirOEXsokpJ201HdIS5wq0u7
 F0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683196103; x=1685788103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7dDW6YW9g+BSy8J6K3KPtt7xboSismIsEGXDGzqEbfU=;
 b=TL7JCyQi/lz4taei8UFeI7B66nox8nZ1MmcqrPtfW8W+3+kTFvClDZmXYeQJpqTLPx
 riFl0TOVAhlmMKgP7JEtYA8o2W19OFlDa+q0UsQSn8WBlsw+fxoCjeq1hHufztTrfoC2
 +DrICKdZf81Cfu9UfORnNCZdiRFqW9InSn9deqFx+06Wq4/uzDREieN3Ty1OfwglIsOG
 fHOW0egog64NodOXYxeVxn92YPY0zQADIyn0gNEcSsLdsuNcqtlg7MyABBnSS9zybfmK
 Mja3EvD5yms7qvrzOmrzTOzTaFy4jePjBcgN+gE3eW4jYJiFhvRqnafrkpkXJDlK2H2A
 FgRw==
X-Gm-Message-State: AC+VfDxdkJdxEXYv+DB+4KLfrdP78rfHkGQA6bB/17qPiH16zQXizack
 BkdvBhRaCZpR+1lUtJQLCjT1IMcy+s9aU+m3
X-Google-Smtp-Source: ACHHUZ6V4W7xkXqXZstaTBazVEFBr4ldkyeCIBxgUGKswKy3bmjqSAFOF2BbfF9MWHHeiA5taBEc1g==
X-Received: by 2002:ac2:44c5:0:b0:4dd:ac8d:671f with SMTP id
 d5-20020ac244c5000000b004ddac8d671fmr1487491lfm.34.1683196102590; 
 Thu, 04 May 2023 03:28:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:998:22:0:60cb:8180:a416:f400])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a056512049900b004eff32d6a21sm5097416lfq.121.2023.05.04.03.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 03:28:22 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/fourcc: define Intel Meteorlake related ccs modifiers
Date: Thu,  4 May 2023 13:28:04 +0300
Message-Id: <20230504102805.18645-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230504102805.18645-1-juhapekka.heikkila@gmail.com>
References: <20230504102805.18645-1-juhapekka.heikkila@gmail.com>
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

