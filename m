Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF98946407
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 21:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4310E10E1DC;
	Fri,  2 Aug 2024 19:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xvGrPEEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B540110E1B6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 19:47:39 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5a156557029so13020562a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722628058; x=1723232858; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wEhmfd96SA4u8ArVJ0CnfF56Mf7XuLe49/SsadrliSo=;
 b=xvGrPEENQwxf9pwBjN3X/8V4HQH28wPMbPz2YGehCaP3nYU+w3sg1D+2lUi4yJ27pK
 VcZVKY6qn3FAg4zUbB84u3Kf+KIIsTQl/yJKfM/2lpun4WcyaYb4Q3peOaT0gw/2jbR7
 hDApdcdYc9Np5kTl3yY72fyARBJ+0lKX+IE6tbzYmczaf3bI25aauhCXVV4aCftXk+pQ
 6xcVq5mvx1Xb6eOn+oBpmCmEhBaPeRLHQjDuuDn8MvFtwB+0VYR4bL1aWev+dXC0tEGs
 feC7J5qJU+FRBxxKoSF9QOi6QyWMJ3S3h/dXp2QQyS8WlllqN38L7R01Sdk1PhFPs4d4
 cmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722628058; x=1723232858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wEhmfd96SA4u8ArVJ0CnfF56Mf7XuLe49/SsadrliSo=;
 b=wvmvzpXSuF7b6q+GaSl2tig/Y1R2iBEdaV/LhHqIoqxwWNAPSmlyB66c2/JlFmmxyu
 0uLGTvVgvMQi8jrgCowgtPqIbD8MBQfFh0FhT3/t88zAQxavb3XwO0bruIhW7uj9BTfO
 lw/oYR4QBR/CyY465Fpm+otcGswmncMl4gl+Q2BE1QPXkkCg7OG6EHdBgCfBgBwJ1guo
 jm5Z4eCmFuWQTdVhZWRQStSkNs1HaDtE4lFRnyhktvH3UByfkZz+EDj6rSYvK5cxBDuU
 CstJ4JaBTUYPCrj0WVnUGscaMOeiGshCyZ40M8mtgYOY2J/jNuK3Zbl3g4Qw5nwKAOF7
 El7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUU/N/rQyixMHoG3krkFblf0akOUjij1NQTdsBliHbyySMpii5SKZcIMkI7Anot0JKitV2sGDisjl8MVzLhAHTgaD6NzJFhDF/TtYi05n1
X-Gm-Message-State: AOJu0Ywi+O3XhTSbDOk2ybzoggHtFkPhMon9jfppQ3I8ocdv37jkmrIw
 jot7tSKKwBCRXU6RpBfmZChaMk470VXrH3va5JeUSfloah+YdP7SAqHzCmeDtWU=
X-Google-Smtp-Source: AGHT+IGE4H1l5ZsQO9E8ceCmygqDIf/qjenXKaWKCLGw6BamqRCWYmwVW9jR+CpmmBFPOxP7jM8YAw==
X-Received: by 2002:a05:6402:22e5:b0:5b9:3eaf:5bc with SMTP id
 4fb4d7f45d1cf-5b93eaf0729mr1053960a12.10.1722628057999; 
 Fri, 02 Aug 2024 12:47:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839b2b556sm1440939a12.25.2024.08.02.12.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 12:47:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 02 Aug 2024 22:47:33 +0300
Subject: [PATCH v2 1/2] drm/msm/dpu1: don't choke on disabling the
 writeback connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
In-Reply-To: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org, 
 Leonard Lausen <leonard@lausen.nl>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CZjSqPH+rj057dW3MGJr9d/4aI78HIu7xqrI+Pszc6M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrTfXVU98v4RdmnOEY+K+nRJyLA96hWSyJIZSr
 MswZGwbrPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq031wAKCRCLPIo+Aiko
 1ZxzB/4gpy2NQ+2mx80O3Kz0q+HVUPc3URApbvAha2Yb7GvUpdAbK1nwua1IPGobkTXNh9v15ei
 lf+uzXbapFyKVZnkGIQ+X3bSZTkbmmLkJ/TkgCOUv2ucDVfz4DvvLZEb3Jplh7J6IoD9N8BQPYQ
 JsRmN3zHQvMQeeS1yMH4w9tVbaxo+P/G9y8bT2kJW2p4XTKs6DvG3kFgGW5bEyZz/uSySPxzjBM
 VOy1s55OHDe8smm7pqZd1lFxnERRK+7YyPddOSVRs42aCvkdpGXviUjQv8EfQnjO4689p8G0xBL
 ye8PxKGpZreVH5mlA7rRzii5EU58m8gRY/kLjQY4q7q/MIqz
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

During suspend/resume process all connectors are explicitly disabled and
then reenabled. However resume fails because of the connector_status check:

[ 1185.831970] [dpu error]connector not connected 3

It doesn't make sense to check for the Writeback connected status (and
other drivers don't perform such check), so drop the check.

Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
Cc: stable@vger.kernel.org
Reported-by: Leonard Lausen <leonard@lausen.nl>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 16f144cbc0c9..8ff496082902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
 		return -EINVAL;
-	} else if (conn_state->connector->status != connector_status_connected) {
-		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
-		return -EINVAL;
 	}
 
 	crtc = conn_state->crtc;

-- 
2.39.2

