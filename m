Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705087B60A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 02:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCFE10E518;
	Thu, 14 Mar 2024 01:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V/RH5nEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0DC10E396
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:10:47 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d09cf00214so4721091fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710378646; x=1710983446; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zxdr/mpui1hYVgn1hATuqyEXzqZWkDVcTe72ce1oxoA=;
 b=V/RH5nEVXu99PyCL0K9TYpv9aG5HujTAsS1oZ6o687lzUVJnDN1sfS5xF+1YMJMEsd
 Zg4bbjgau8JcmDYMNBW18tiOzbN4DpLQdqpRYyCtRKjseeulpYx35MSD2Q4EmdfbOhX0
 8SJ6FCf7DZe2B5NU4ioMx01tmomp+Kt2JI7jc+MmgwGpDUfL1IFaiENx+5Ws4c92nzPZ
 hJBl3wKHURrqgW9lDvYrgYh8e18+9qZ5clXJvKEquCFIHKsehC+VfoyHs1lgM/dW5vD/
 aTs0tG0eRa1DbHOqNkw+jXveKWF3bpSMfAsx28gYJ3RQfPdIejbrnHnVN256XP3/lWOz
 //nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710378646; x=1710983446;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zxdr/mpui1hYVgn1hATuqyEXzqZWkDVcTe72ce1oxoA=;
 b=QnASAE2X51hN5ArG8R49zP5haM84GIJBXUt1vC5FbBAltS8A7o7yRmhQcr8v/dVE1R
 +3gPHHLShOSP86VgjouPX6QhUiihB+HIXFIPq03P1RzdRocvfCiJrKx2r+WAFkZr/nqu
 j4qVyj8oHlnwkiw17Yk5vohawJ53LCpDBJ5XgseHzt/0IBKoqC+zwFS1fhitx6iOHOx1
 6Eicn7jWfzLhlKDhymMuYMiT2LCtur6fBXOplLpS/JDQrbC25tfPMrNfGiQ9F5xa2Vfh
 EUSBpTg5h07PHIQNKyeq4RMo1/6K+LqX+ied6jNEA4swPvCL+kxMqyMS5AbaGOVag2hl
 98Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHkIv/EsglNQJ98KZXrs6460o2nuhEyJA6QrkuYu7vQgPz1zgN7P6zfDn3fsCUPt2QRmiegNm/YKoSf1xETJ0k7XUvNTo5RD62IsHWgkrR
X-Gm-Message-State: AOJu0YyiltXdm/p+t6WK3q0S8CAw57F/BRbAYiNVGjdVVXsz9kldEDRY
 /4KfSfYR99ZZzZRE7fW3ogspuVKCAWm3x0eO1ZD7yoIghTKldt/Sr4o0aGEBnyY=
X-Google-Smtp-Source: AGHT+IHCUJmoYn9jI50GYYIrQhEEZr2dXcfoR+wFJNhsonpJAZ8FGcHSZtzK/NG5ppzW2cGCp28OgQ==
X-Received: by 2002:a2e:9b99:0:b0:2d4:7756:3549 with SMTP id
 z25-20020a2e9b99000000b002d477563549mr110990lji.16.1710378645969; 
 Wed, 13 Mar 2024 18:10:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 18:10:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:41 +0200
Subject: [PATCH v3 1/5] drm/msm/dpu: don't allow overriding data from catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-1-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jkx8QeT632cJYJKjDVA7lP5qA9kMxj5ChekVZ1pgV/A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6SaiBAo9biqgSROXWBG9JOaT2gSR6NNM1gh
 rLTYn6o59CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkgAKCRCLPIo+Aiko
 1TYsCACm/8pvdQnme+edeFf6jF9cCNURSjDk4BGjb7bgjZKUe9tXt33VNrUPfjO0bhwsako1KR3
 obQmzwXxfZy6NcTFP4FxqyJBUsAqpyADelajr+98gbDM45cU+KgXN+/P7poEjnUAh0MMeAx5EH+
 TYKZY6PfJJ3DR0+RF1Ns5s3iFPljn7to7/iR+8v1FJDPauYU1uiQSA/pGLWaYGJdhB30K0hyffk
 66e0UDmS49YG093eSEHaMJg93YLO6xYeHZBuzR4UYsrD3+17FZd3hazxJ1AGFFIEaF9vC2zxvvR
 r2ok0315QhHToQeoL+6xkvY7NHEFizL6ZxatKwH9tsY20eZK
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

The data from catalog is marked as const, so it is a part of the RO
segment. Allowing userspace to write to it through debugfs can cause
protection faults. Set debugfs file mode to read-only for debug entries
corresponding to perf_cfg coming from catalog.

Fixes: abda0d925f9c ("drm/msm/dpu: Mark various data tables as const")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index ef871239adb2..68fae048a9a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -459,15 +459,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->core_clk_rate);
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
-	debugfs_create_u32("threshold_low", 0600, entry,
+	debugfs_create_u32("threshold_low", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_low);
-	debugfs_create_u32("threshold_high", 0600, entry,
+	debugfs_create_u32("threshold_high", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_high);
-	debugfs_create_u32("min_core_ib", 0600, entry,
+	debugfs_create_u32("min_core_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_core_ib);
-	debugfs_create_u32("min_llcc_ib", 0600, entry,
+	debugfs_create_u32("min_llcc_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_llcc_ib);
-	debugfs_create_u32("min_dram_ib", 0600, entry,
+	debugfs_create_u32("min_dram_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_dram_ib);
 	debugfs_create_file("perf_mode", 0600, entry,
 			(u32 *)perf, &dpu_core_perf_mode_fops);

-- 
2.39.2

