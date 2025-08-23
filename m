Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8F7B32775
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 09:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C5110E1B8;
	Sat, 23 Aug 2025 07:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YSWzCH04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7253F10E1B8
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 07:51:45 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45a1b004954so20751705e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755935504; x=1756540304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sz2f2QFTThl8V+w+SjkMsQ8CHMm6qM1hpnb1DkeVvE0=;
 b=YSWzCH04+QttWa+bWvkmUXiLksnV0Yt3IMUfO7Fj+7FpA9mWXNSmwJONuT3lzkWo5s
 vBaYJ4Kw26kFykbdjfydz0kpPLVU4lHA4u0KLVNRdJGank9QU9az0Lpo4I4+fv9tPLja
 3HSDqr7IxBQG5oWIrD5ENzobF55/z3sEXY5BpSmm+M/6EwIYUfhNczju3jOEXlLTgTT9
 yk79MQH8HIvrA9rjbiY7nXRYf7R44Zb1VA/1NSx946mPI1OLC5c7jwDhe1NRn+qQvoBz
 OaLIPRZ2n1n/LgRTfDOZ+O5WfIB+GJg6lffPWrcjUasRz/pusF9MjEOo0nrFFitlL51b
 M58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755935504; x=1756540304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sz2f2QFTThl8V+w+SjkMsQ8CHMm6qM1hpnb1DkeVvE0=;
 b=Ee5ZWS3Qw3Jymh5c8bzqJq7a64rTvNpP55BLHVs0qDinSO1RKlIxbJW8pzMTWOhEj+
 41YQGQ3V8DqFKmnfwucG3S9K1siS2N+T5NQS6H0Sris3Qr2GhHu+vNWtqJ7STH6/Bncz
 gpUlm3R2oEpXDzQ9d/LwtDyI+oGeF1szOfBGZ6fx0UaQrpMZQqcb0QuU1kEsZHNe2Nid
 aIf4WfSr4Ht340KdDrpi2z87uQJX5yGm8OBvHKiNottoakLmh37+65rvU9HgwjkOFuIs
 Okb5hir6ZCyuYCVFoyzxGu86h3dINTnnfY0yqYy0rFU225tsWUCtdb23yniwdcKbzmPg
 D2Tw==
X-Gm-Message-State: AOJu0Yx7PVxIyTruO0xgx8kpNG7rxCNlkq/uOvhVC+y+lx7ncRbv9yn7
 X249QImevi/vZuj2VFx473vIDhNBOyN5Q/8jJQ6ZuZHvWWe3m0z8R5P2
X-Gm-Gg: ASbGnctE+jBtLxxt7EVy6iaHgFmPXVFxbS7Q5wbJBjyGLl6vEXtnpBWwanMg71Qn1E7
 Z+CGL7gYoE4mP4nGQIgCp+CGARqj2RKt10bjhGEAx1Z3HC+Qh3b58fiOl1nZ7W4KaWoqRPnVoM4
 ZyRtxgIknTLyZa44ezqjHO7cNhweptFXtx1Ig+UMUJlcEdZsP8IrQQMzAWUcLq5sou4CXeMdGsA
 n6Eb/H5vknmmJTwYt2yFPhRjN6YpfixLO1wHi+CECZHmMMifFmwz6XUr6N9i6cMRoyf+Ezn+Syo
 zEk8oRI3C1LuW9mlOLKm2mdqtLdRXI79wc+dsb6tA95KLnHuGa5Mv5OL70/pEaE1SP5lzKKEJKh
 YcwWDfjjSs5chxZz5MQwmka7+h7J0QjzD40H8+UTkJMmiBKT2WVomUNE=
X-Google-Smtp-Source: AGHT+IE3RaqMrtRJ8FsQPb5ZzCK/iJZ86quiPA0MKkT6xRcXdlnZCzFL7JCYSdxXpZVPglPCYeosng==
X-Received: by 2002:a5d:6ac7:0:b0:3c6:cb4:e060 with SMTP id
 ffacd0b85a97d-3c60cb4e54amr2455902f8f.34.1755935503518; 
 Sat, 23 Aug 2025 00:51:43 -0700 (PDT)
Received: from dell (117.red-81-33-123.dynamicip.rima-tde.net. [81.33.123.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711211cd3sm2512295f8f.40.2025.08.23.00.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 00:51:43 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH 1/2] drm: fix kernel-doc struct tag for `drm_format_info`.
Date: Sat, 23 Aug 2025 09:51:38 +0200
Message-ID: <20250823075139.34797-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
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

- Add needed "@" to avoid warn messages about duplicated symbols
as there is function and struct with the same name.
- The fixed warning is:

	./Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:397: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
	Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'. [duplicate_declaration.c]

Fixes: 84770cc24f3a ("drm: Centralize format information")
Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
 include/drm/drm_fourcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 471784426857..ba25beeb28cb 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -56,7 +56,7 @@
 struct drm_device;
 
 /**
- * struct drm_format_info - information about a DRM format
+ * @struct drm_format_info - information about a DRM format
  */
 struct drm_format_info {
 	/** @format: 4CC format identifier (DRM_FORMAT_*) */
-- 
2.50.1

