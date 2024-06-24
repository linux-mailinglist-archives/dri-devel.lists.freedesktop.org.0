Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8C0915092
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE5010E48F;
	Mon, 24 Jun 2024 14:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mGuMyACO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3AC10E485
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52caebc6137so4271298e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240439; x=1719845239; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EqToHdwoMaw/kv+eoY0j/pTtTd0pz39pRc2HfSbi9b8=;
 b=mGuMyACOey7YsD4kOuBH5ux2EFnh95ricZMyFS3/+ck2McbxN+GG5FZlOBHFtbTtVJ
 u9kyG8VfVM39Dq4DkhMKxjvKg0DGjQa5rYJxFudOwkUudFhx1krgFzl5UqxHetnYOSP9
 sTHdR27pl+/+1gMjuOIg1/xFoN6etNFz80+NXCVuvXtgR6+r8xCbNtH7+N77jqlk2dnB
 ZII/wX3gU6MSE7gyr5gvs/TG5QAblsK84eMxHe7srTOi19Rbrj7axU+EnRXB+d8SzjDO
 875wQjWTUXFUJsuFOsQzzgLUv18zulkxIbWjKwjX4M0KhsN9O2V/JgffYL564xOA3D1q
 l+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240439; x=1719845239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqToHdwoMaw/kv+eoY0j/pTtTd0pz39pRc2HfSbi9b8=;
 b=iZBeU2rBSaEwTm/b41KDogTpTiFxhpM7REr6r+lLtxlUCJUkRbO1JTEqd35i3UQGlE
 XHFJlmvnZwbakglgudkYD/WywBLQpdV2Tf7wtm4tqEE/q9g7dPrh5NCgKNRrrtRBF+WG
 d4Bkxuuugbm6YyLQgbuhXfSB55l1y/UG/iBqMdUy8oFRAboQUTYQZi5OXkkyASSyTFai
 AF1yK+G6CSQ78Grbbi3zRnpoQ77r51n//g4Ci4PY4dyS04t+lJdAJFpIVWpUPA9iynjL
 ytH8wYSJs1S700eG8e2lTSmsuXK/a/sMZ8udzAsD6TjX2nXgDmi/SrlQr/nw6B8kAyzi
 Gm2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFNwUEJRGNZ5cbHXo98lHA4fDEvR4A7KPm63PYT4X//H+9AIFUEf4U3Ph055Y/EOT3SM3diDBUh1AjLAckGO0VLV+m/+U9yijgBSzD1eOq
X-Gm-Message-State: AOJu0YyvavKqpzKXTqVFleeNX47a5WTfyG984sWoU4UbpMyQU36qr60z
 2MtPXas90dPdlj0Hw3u0wXmOMzcUl64/lSV61x0+bEQNFLGi8x8V+lrPpqBfFlU=
X-Google-Smtp-Source: AGHT+IFo0+mMu75zJsoc9saWGs2TMZTXLwFCHVCfi7bX+JMa6h2za2Gs063bgucAWT7eFH/l/fHgoQ==
X-Received: by 2002:a05:6512:10d1:b0:52c:e982:8457 with SMTP id
 2adb3069b0e04-52ce9828502mr1762990e87.32.1719240438806; 
 Mon, 24 Jun 2024 07:47:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:13 +0300
Subject: [PATCH v4 07/16] drm/msm/dpu: drop extra aspace checks in dpu_formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-7-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BXjW3vQxsmZuyH1IlNRwIHSsrpZblZLTmW9M+NxSCGU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbv084XpneWPffyXo4xAWuPs5p8u2l9ugMFU
 bL+pUaBr2uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7wAKCRCLPIo+Aiko
 1bxfCACR9EzuNAh0cZysy87aKSG7MkjSjyEdt/RZsPW/aaLTwYXAfah8bhHwMuWeF0M957zNJFl
 jiZNivfmAYo615w2F507VQG5nhoM1xlZZXYNrOsfCu2pUegu6LPz49ov52QZDeQb5VIRK/0Z0RQ
 Znj63lqLU6qkX1jpGb9dJ92LNWT5QMzKnZJwv4fqKnICXYcvMmGOqgIKHzAxm9YG0Ivawa2+1L5
 Z3FZH0PqhfkJmpAa4g35+9ZQL/smVan9AO1csAW+22Dp3pZHZGhjFswd5qH8krfToolUcyJjeLo
 WOnEPTc2lKqnljPmBf2vKqCXxTHKe8JuRvj7NIjbIUiC8YDx
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

The DPU driver isn't expected to be used without an IOMMU. Thus the
aspace will be always present. Not to mention that mdp4/mdp5 drivers
call msm_framebuffer_iova() without such checks, as the whole
msm_framebuffer layer is expected to support both IOMMU and IOMMU-less
configurations.

Drop these useless if (aspace) checks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 027eb5ecff08..8c2dc5b59bb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -280,8 +280,7 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EINVAL;
 	}
 
-	if (aspace)
-		base_addr = msm_framebuffer_iova(fb, aspace, 0);
+	base_addr = msm_framebuffer_iova(fb, aspace, 0);
 	if (!base_addr) {
 		DRM_ERROR("failed to retrieve base addr\n");
 		return -EFAULT;
@@ -376,9 +375,7 @@ static int _dpu_format_populate_addrs_linear(
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
-		if (aspace)
-			layout->plane_addr[i] =
-				msm_framebuffer_iova(fb, aspace, i);
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
 		if (!layout->plane_addr[i]) {
 			DRM_ERROR("failed to retrieve base addr\n");
 			return -EFAULT;

-- 
2.39.2

