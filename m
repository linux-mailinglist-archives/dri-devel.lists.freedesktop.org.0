Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537003CC36F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 14:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59AA6EA7D;
	Sat, 17 Jul 2021 12:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D76C6EA78
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 12:40:28 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id l11so2728882ljq.4
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
 b=AdDsrFsBavFcY/O0/flrJgv9JEoRa5UhZxx49BPFfbSpIQF4V/s8Kddd7AShWVPdht
 RVYSsxlLl0K5e35LuBhlC6zeqMbUZqd3R5QiQfJ5AbYI+g4kMCvnZ/qhHeqDcV8r2Ffh
 5bDOW4L+3CxOZGuW/ls7H5684+sZ7FV8fo/YcLrs+I70md8BeOa7zFZE52l3+0rVvK53
 AL0RBz6o0VgiM1eUMfIH2iHXG2RzPnwLEOdRrBC1VY6E5MpkmZuYvAzrXJw3E6cw6PHP
 fBwSIrlBzLuUbrYxX7AyKbYrsnr215QMIUhTzr4vVL3BJrDf/NxMG3ImsqObbrpJgaJG
 xgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
 b=nZDF6xZY58senIBhazcjMEpYDKKvAekGi4QZCefDl81KuBrS3Vq0PlXmXw3JMLuoIK
 pC+kp2Ae1k51gPqQ+6z4QkKLat+r9sHOpdWsiuVHJ0F0yFYpbUZraZ7P0O7bqUFlipEm
 uBDlxUvlRF46oKJGwRTuHX5v0MRKhQ9hwcjzJMs1R7KYjf11tyaoT9EY4U6tqkAT23+J
 oweoAOFMY74wi9e9y3900q0kGJlO3leqbLzBHGLOxzWSPL5QRPRyGYdO+zrORopr3DKr
 wc23Ho97Q3b3ygdQXYAeJ7ouW+9eJcyFMB7++w5EHDp7hRZ6qMD2/BCbtqx7roSFaZTQ
 gOSA==
X-Gm-Message-State: AOAM531Kud4+ei89rmYn/61wUXGXTj93qCbdvXvHQotmpQ33AD+6LXEZ
 vldQOAPNHKIMyB7B0bOqLJARwQ==
X-Google-Smtp-Source: ABdhPJz4no6xCiLQzqpNWjoVZD3gLqB9Nsex4dsxAS1jFR+amC3j84JJm6zdcpIj3cIlQk9IJe52Lg==
X-Received: by 2002:a2e:911a:: with SMTP id m26mr13832763ljg.109.1626525626738; 
 Sat, 17 Jul 2021 05:40:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 05:40:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4 7/7] drm/msm/kms: drop set_encoder_mode callback
Date: Sat, 17 Jul 2021 15:40:16 +0300
Message-Id: <20210717124016.316020-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

set_encoder_mode callback is completely unused now. Drop it from
msm_kms_func().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..9484e8b62630 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -117,9 +117,6 @@ struct msm_kms_funcs {
 			struct drm_encoder *encoder,
 			struct drm_encoder *slave_encoder,
 			bool is_cmd_mode);
-	void (*set_encoder_mode)(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.30.2

