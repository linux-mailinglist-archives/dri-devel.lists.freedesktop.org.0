Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFFCACE3FF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 19:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A5C10E225;
	Wed,  4 Jun 2025 17:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YrdmOJW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2094D10E011;
 Wed,  4 Jun 2025 17:56:19 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-309fac646adso1274787a91.1; 
 Wed, 04 Jun 2025 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749059778; x=1749664578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Euwi8cH8s0mdwA2LRTqEh1pB7vpHN6OEAf9ObZHDik=;
 b=YrdmOJW+9c81bCReUt/gB6S81crV3drm9qBupg6uvzXj+My++5oa7mehWghEDG1gsS
 FPU/QPEYGV0/mz3O5xC2b+XVjvr9PeF2dLNAe9G6RNeeiUSzoUbT9Z+mXADeGXpuatJ+
 X+JfqSAWeLDKhBI7FOqAr4rjFJCDN1HdKmD+T9cCVu50sJep4VJfhe+96sg0F2+kHF3a
 jsclahRqJsygsVFwH696p34MTx/ai/V92W4MzxzdT5gCN+D1Eupfvm7WI/2iIVoZkSoK
 eGENpSqBcNqgBHQJJoooNcMg7Kr+czBkqnibkWxbZdDRkJkq3GEr3wTfjbc2uYksiwTt
 Wt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749059778; x=1749664578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Euwi8cH8s0mdwA2LRTqEh1pB7vpHN6OEAf9ObZHDik=;
 b=eVMyL4qnrJQsnq1GM0sRKW9H0KNBMQTptGe4SbRV2WqDCb6/aWTWeT+Vl3cpXWqacR
 RUso1OWDggLzAeT4d+/p4wpIXXp5kBWQV8rCe6CAQNsSZcm4J1i+xGfyG0MfiCTS0Ukk
 1lawPgCJLFgZSCtg026kRlQuM9uJ19RYplGROO2BLF9utSruZYUeFASgJARDDCqj1+Vf
 Kj+nELCR5Qg30FI4wgq6iqjaHBfcE6Zxa6sQobVzdobKuuQkyDdPCacseu6MzsnmB+4l
 A87D7xxyqmFgNEnnzt3ZsBRROaCbeaoJ/zu6WVSlI3q18a5gmbC+p42sxzZFF8MZtXpU
 VhwA==
X-Gm-Message-State: AOJu0YwCoN3KP3yIIbFAlDO0mNeJJ0veU4TZ+QK+u+okcsGZBQjd+0pw
 QkMjSL1EJR5IEcgdC8xAzqrofWzYY/DB2mCxNLTcvaV457JI+8+m6mtgZXSd9A==
X-Gm-Gg: ASbGncvPxN3+8vvaA6iWHW6KL/INptXnyWmAtBW3/ywmRptHsXvx5m1kSvoHOQLhGaZ
 s8R8UzyvEBioIabfl52d+2fJd6C0G5moHOrhMtE2c3gwZU8vImt+P4EaLZLszIhjZpx7VgCgLg2
 UEVbXC9w6xmpi19DLWNYvCEXtbJf6SuwYOEVfNaXW9Hr76zyEpKhvpq3zWLuUs7zCGv+jE8Nao+
 fkVsyzLp+sVSB9tICIju/GJx6wb8kCo5+qkyYuJNOl8rpXVP0VUQ5T9bUAoXs7v7ADHV/KS/+MS
 MrUamu2S34QjXSkK3YLQ8aL6GRtSnv7NZZEyDkFBeXtAvnSleA==
X-Google-Smtp-Source: AGHT+IHblasMKmm6BcsNSe9ySzE24cboKqnKZUZq5n3QdEBR7VgbwEyc17E0jOQpdWgdihRXEusRnA==
X-Received: by 2002:a17:90b:55c7:b0:311:be43:f09a with SMTP id
 98e67ed59e1d1-31328fa028emr519168a91.9.1749059778060; 
 Wed, 04 Jun 2025 10:56:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2b67f4sm9232208a91.3.2025.06.04.10.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:56:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MAINTAINERS: .mailmap: update Rob Clark's email address
Date: Wed,  4 Jun 2025 10:55:58 -0700
Message-ID: <20250604175600.89902-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
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

From: Rob Clark <robin.clark@oss.qualcomm.com>

Remap historical email addresses to @oss.qualcomm.com.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 .mailmap    | 2 ++
 MAINTAINERS | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 6a6aa09e244b..b72a164280ea 100644
--- a/.mailmap
+++ b/.mailmap
@@ -633,6 +633,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
 Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
 Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
 Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
+Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
+Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>
 Robert Foss <rfoss@kernel.org> <robert.foss@linaro.org>
 Rocky Liao <quic_rjliao@quicinc.com> <rjliao@codeaurora.org>
 Rodrigo Siqueira <siqueira@igalia.com> <rodrigosiqueiramelo@gmail.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index ee57fc5d48f8..5dd1a3234cc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7567,7 +7567,7 @@ F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 
 DRM DRIVER for Qualcomm Adreno GPUs
-M:	Rob Clark <robdclark@gmail.com>
+M:	Rob Clark <robin.clark@oss.qualcomm.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
@@ -7586,7 +7586,7 @@ F:	drivers/gpu/drm/msm/registers/adreno/
 F:	include/uapi/drm/msm_drm.h
 
 DRM DRIVER for Qualcomm display hardware
-M:	Rob Clark <robdclark@gmail.com>
+M:	Rob Clark <robin.clark@oss.qualcomm.com>
 M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
 R:	Sean Paul <sean@poorly.run>
@@ -20287,7 +20287,7 @@ F:	drivers/soc/qcom/icc-bwmon.c
 F:	drivers/soc/qcom/trace_icc-bwmon.h
 
 QUALCOMM IOMMU
-M:	Rob Clark <robdclark@gmail.com>
+M:	Rob Clark <robin.clark@oss.qualcomm.com>
 L:	iommu@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.49.0

