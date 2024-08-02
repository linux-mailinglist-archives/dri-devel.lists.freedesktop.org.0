Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B994640A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 21:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4635010E1EB;
	Fri,  2 Aug 2024 19:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TgYQu9T3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D44F10E1DE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 19:47:41 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ef2cce8be8so105464971fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722628060; x=1723232860; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I0kj6XTh90iEEbA0uytJvfTg6LVq22XyHCEfhbdwFAc=;
 b=TgYQu9T3S7dmpN33ScL5p8PFDkGEfWiKtkgpnUjmBh3Sdum83wpVqhxIR14J3+dprK
 N8upNKvBc38Y+2n98ORyFJD2S6h9rhpD6R/LKUxeBa44KrLBbq1HYtKUfaWhEbFXJxt5
 rul/DLzFB18fFpfpr+oraFj5iWyUub7CZLAHZDRUFGisNY1tP/FE0iNnwfDy3vYwUe72
 +b0g9ogJKgr4w6EE8B2izLnyj602l5Ew9DhmNRF2f66WOXw8KV0T/78HYHaleki3RUhS
 20Uox62//zho3iPyU6Xb2s4V3xJozHddqyyQpKRyoxyrHky+AdPLGDxtUqv3O57FUber
 z/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722628060; x=1723232860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0kj6XTh90iEEbA0uytJvfTg6LVq22XyHCEfhbdwFAc=;
 b=hjZ+rWk16yAQcqJiA3D4H3lhqlYtwZR9J+FVo+OnIOcgjF1LrunkjEGzsjLm9N2WQ8
 jLh+4y5SD0jKyKJqG+IFBRxOhwpti0ggkXMPINEchG0pxQJSoKIlcgMqFD3jnnCt02hj
 CA5xnPyK7IZDcScqCyOthUsyNy1YKOOYkStXms9MjImilbRTPZ2WzvOHVBpzI/SfKtcJ
 gvVpd82KQeEetwGsOAPPX+XMobjeuOABAjZCQPB8X+oulGY6Q9IdU9pE5LsqMuEdlXjV
 G9g1F1h4TR5hEjG9cCBe7ID9Y4g0r3nKefAqHe34tRnTU6bZcmdrCovbcU4zFbZKZCdR
 bmpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0vbJghxjkNN2znvKmdzfb2GfDxk2tlPhz3EMiocnu2YylTCX6jFhevXaOAudUGeK+JY0owUN4TyVjYBUlNdzXzBLs1cvRGH9w5f6mVXDs
X-Gm-Message-State: AOJu0YzsHVTikiqVigsmy/7WtIaCBiJ/zOgjPPthdQeEskje9vdVexYk
 aZI5mCLJva89V2jzUts8zv2DfzQ1z4gsuPsw37SzF1z09J/9KRiEJGQkENt6v+4=
X-Google-Smtp-Source: AGHT+IHC5pWQV5sUThqfkpYlt5hVUslppx0/7sOiLjAwX+Cah1N052U8+NZUkk4YN5HoI/4FIhX3ng==
X-Received: by 2002:a2e:9107:0:b0:2ec:57c7:c737 with SMTP id
 38308e7fff4ca-2f15ab24bd2mr32139401fa.40.1722628059116; 
 Fri, 02 Aug 2024 12:47:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839b2b556sm1440939a12.25.2024.08.02.12.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 12:47:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 02 Aug 2024 22:47:34 +0300
Subject: [PATCH v2 2/2] drm/msm/dpu: don't play tricks with debug macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
In-Reply-To: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2b3yRHs49eX/1vL+P+Me3WH5qiaxmmgj2T78MMKIwZg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9pa8+s35u2WXFa2pm5rf9vtTZ2JXnH3Zy+0C47kqbxTW
 LSb8ezaTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMRHYRB0NfxVePmPnNa0+1
 pehX92+faVPQribE+KP6RvQjy4ju/SmFXzdu1/T/s5B1Lsc9LpW3gu/iU77+vmUcH361pKREo88
 wNYG9bO33qi/nvDaY7VjK/jTe4d8jh9KUpIyw5Ox4IT8L81WOu7bVbXLZPo2Nxa70YwlT+eWHHQ
 18fa0tcpf4r+ZxR27ZFra8VDVBPuLqsT79cqcvj3Rd64IN/2lvduL+uLko4CPfndhbdelp76ydl
 6p9feAn+UB//6r5Rv2LBYQyPR2kEuu/qDF5TlLt7Zv1IWRig0rH52DrLgV7W+mmpAPdE6dv/TE1
 Lsfw21SrafPiPm/cfdNlpWPndZm5loayJ7MTvpvWKEUDAA==
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

DPU debugging macros need to be converted to a proper drm_debug_*
macros, however this is a going an intrusive patch, not suitable for a
fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
to make sure that DPU debugging messages always end up in the drm debug
messages and are controlled via the usual drm.debug mask.

I don't think that it is a good idea for a generic DPU_DEBUG macro to be
tied to DRM_UT_KMS. It is used to report a debug message from driver, so by
default it should go to the DRM_UT_DRIVER channel. While refactoring
debug macros later on we might end up with particular messages going to
ATOMIC or KMS, but DRIVER should be the default.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e2adc937ea63..935ff6fd172c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,24 +31,14 @@
  * @fmt: Pointer to format string
  */
 #define DPU_DEBUG(fmt, ...)                                                \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_KMS))                         \
-			DRM_DEBUG(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
 
 /**
  * DPU_DEBUG_DRIVER - macro for hardware driver logging
  * @fmt: Pointer to format string
  */
 #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
-			DRM_ERROR(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
 
 #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
 #define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)

-- 
2.39.2

