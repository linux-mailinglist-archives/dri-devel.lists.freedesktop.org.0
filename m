Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9A89372A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 04:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1410EDEA;
	Mon,  1 Apr 2024 02:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XNWKbJ7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDA510EDEA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 02:42:54 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-513e10a4083so4161644e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 19:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711939372; x=1712544172; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KTN/5zXbYSDvoflBwey+wQVzVgLTpokSf84Ta9NbOAk=;
 b=XNWKbJ7I45JqG+//r+qHydDUAuq+2KRHwI1Y+/E/PKRKDWyGPmFQSe7I0cZgtCY+9N
 xMWc94yclHGebwyoCkECi9EzvIpOH41YMsj0bqL99KF2DagLAMCawMxszQ3dvX3I5//H
 j2atmqiD0vPMnDzdh41blkr56ctYmmKhm0zuTdYHadTe5p4QQteiFoBfpmU/LQ22cGWd
 mEj/rKpNVDFjbsQ6WIOUQMoxPlo88brjCvE6bxD3qnEsalga4/w1Q8MdnBAihXrJB9iF
 SVw64gfFq9zQBWO33tQiEnaIGuNeB8KkS2llVrh1FPfzAiErBLgXibqmOseexx/F/E8P
 ZZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711939372; x=1712544172;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTN/5zXbYSDvoflBwey+wQVzVgLTpokSf84Ta9NbOAk=;
 b=wkaPcH9fxXk2vePBwE6fA0SYNHrwxdVyAkcIs69WAzHo8HjecQCAn0SCeKTRW5TLuq
 HGis0squeu7RmcU0gnqlBoA0lsqbm9PyTlJPjx6n198OM6nOXyPtc1YfbvO/EGB0uIjn
 cnh8A2gFXsPGXcBvxWa48nQ+S7Uc4MCtVDRkFlKMwR/bS3JQYDs2Lag8AaKY62Hqtm0Q
 khzM6g6TN92opvidhFOIoigNg0LwLXd/+JyIpTUvglUsMz+TYCro3q2Q647e5sBBC2ny
 1GWpstQCaoy4Sm4rvi7YTXViasVGoK2Lkcxyy6ejPw1zi+GhqdScbyZ/TvY8YgCbANHW
 v1oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc2fMBfNZpE/QMsfeRlHySE6Zv37iVcSN1TKSUoWYYwx8mbWjh+FadWPn63DmSd+0JX3yAEm1db3h05NW9xAxy7h0K1pv1H9+ookTzb8uH
X-Gm-Message-State: AOJu0YyXGtb4HRO5HvQxA7Af3xYFaYVwSaQW0quHj/pNJM5P2/5/peeP
 67uoUfcBBpHAm5Ho+IStdStafv7zMABV7Wj34iZlz9sZSDaoq4UKAa0/EWnesno=
X-Google-Smtp-Source: AGHT+IFP9REyObCpwP8FfKQocxrhzrzBK9nbQ5+418k2IPcnyV2JEBBHMBvUz4tSIQcCtBA5qBI0hg==
X-Received: by 2002:ac2:5a5a:0:b0:515:a62a:8e3d with SMTP id
 r26-20020ac25a5a000000b00515a62a8e3dmr4752003lfn.11.1711939372499; 
 Sun, 31 Mar 2024 19:42:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:35 +0300
Subject: [PATCH v5 05/18] drm/msm: remove dependencies from core onto
 adreno headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-5-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FIA5gSDDGcNdfXmQ+N4A6AdhW2aI4yM0uElb16UbaLo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8ld2FKnFCLZUvEq0yUrry1GXgy/a3PIXADW
 eEHKZqNmduJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJQAKCRCLPIo+Aiko
 1bJPB/9KZHd4lJk1+EI/9hjBKp7kR3q8yMlmjIjf94oTgYj1cN+OlX6i/R8+JNs56tTpLBbxb0n
 Kkg1Zt19tY6TxGqOGhEr1jqL15deeffMt8A8GbGm3560EIM0Ec5ozFcNg/Tr80hkL0B/Mv51Mo/
 SYtxt9gho7yuTIjwUxolxYXSkPzKNVXWmIemwWtKrV6w4FUOKnKJ0oG/8YShZfL5lLkI98ENMUj
 Cvjb3dK1pQNtAp0/E52OBRkwmD8PW4LOcnwyz8cl8vlWOgXeFMSrFKe76yEeVILvYV9FJviBUmo
 9jLm/Oj80FKCS39ckDsC6LVizI73F6ddlufo1uXp3d2uzMha
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Two core driver files include headers from Adreno subdir, which also
brings dependency on the Adreno register headers. Rework those includes
to remove unnecessary dependency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 97790faffd23..9c33f4e3f822 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -17,8 +17,9 @@
 
 #include "msm_drv.h"
 #include "msm_debugfs.h"
+#include "msm_gem.h"
+#include "msm_gpu.h"
 #include "msm_kms.h"
-#include "adreno/adreno_gpu.h"
 
 /*
  * MSM driver version:
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 655002b21b0d..cd185b9636d2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -11,7 +11,7 @@
 #include "msm_mmu.h"
 #include "msm_fence.h"
 #include "msm_gpu_trace.h"
-#include "adreno/adreno_gpu.h"
+//#include "adreno/adreno_gpu.h"
 
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>

-- 
2.39.2

