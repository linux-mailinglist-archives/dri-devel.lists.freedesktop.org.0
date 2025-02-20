Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6465A3D685
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E21F10E917;
	Thu, 20 Feb 2025 10:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dD8njV75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06F610E91A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:26:26 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-546210287c1so887748e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047185; x=1740651985; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6MXT2UHEqR4mXPV5rukuE4Ox5VYKDfzTrqOVamfQ/v4=;
 b=dD8njV75RLg2iVZFFCQM5N2FlAf2OhsuV5BaArwxktY0N7Ee97Mfz7Ng5E+Ky3oJO9
 nEnE6YZZeLLj5Ty5zUvqV5UDqxa+nYa+fSorF8h7v8T9sHTCr0BeEi1FPqH6rGGESTfX
 aPZO5N9HR4ua9Acf1Cw8UD5ABJC5aw8rxjKQX7/ufOszCz0DD47IkEYFBGitGKmbSsZY
 Dt5C9B1h7S/4GGPNv5SEJaZ2ORa7q5zVnGF77MbKzZldyZRCBQlY8ckql0PHpvvayjC7
 1o8UCADupJUAgNmElsRWNup678wlAY4WaBdE90JbQCsIfa4puMd6yR31ZXJu5o8Etnxv
 wNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047185; x=1740651985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MXT2UHEqR4mXPV5rukuE4Ox5VYKDfzTrqOVamfQ/v4=;
 b=vt6O5GVABxNjm6QhKzscF0QSCLFluia0FklomD+vO7veUPRv5kMj+BR5Kn1RMT3Nn4
 dOYM6XyZAoyJ6B8HIrF9elXgK7PUB/WuD2A6boDcgV5fKdWMgWKBLV4q70caQu3w6yTf
 sUWzgzlwpXjlh3puT/SzwqfBGb+rzMJy6MDRnzqFuGO0HAQ5kK0kVBejhXX4myb+EsMf
 IY2Rq2MwbQkJ34quLl993X4mf+ZG0YS29K+lX10+O06YcH0v5Jps1FmsQuhjE0G/2hAZ
 Brm24Yt+2EcjASVIo7h9cEZ7+/gbjoOFvZSNxfkJQonNvY8l1JjYRGemFAR9jel9y5NG
 jZNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuElEYzWddSdDpQWr/76CJRg/0d74ET5WUfeD0TV/YfVStT9ERW39UrDsZq96rQVQoYQq3CrzYgbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ7/q+8JIrXjBQv09sAxKWr97NExBX4a4FdfETX40q3j+4ypZk
 cYu0Ln0UdLsA182lo5DR2abpK26pxdZOo/Gzw9vznXP3pt+zKQ9NdoE9ui76Ixs=
X-Gm-Gg: ASbGncuR9VcWT8TLifENe2IRNc/qMzHYhaGI7x8sm2UNueozwBVIVW3TYlo6+6x55ft
 V+JeEOjyNgmSOKMfw7EvXjT0iVfIbMANbO8U9FE2ZOrD7tXGmEcN7JRbnJhD7sUgsgXWxbTqbOl
 doiUbAEfr43d1sDByU6P3wPBk6yEwIPem9KUiFOmWNY1XCv1TJZxrbpMx963FgvVu/kO4pgdnch
 D2aPNYlBNsOFHLQvm51OHASER0LGeSKdjzji32ciCiPzzRENIHLQo9pz8bq+WqCufdxnC0k6MW+
 1vbPy9VabKY8DUewca6HiFc=
X-Google-Smtp-Source: AGHT+IHVs7/HB47jqAC6EzTTnNTZAfzg+x9KZYaVr4/z6kRTIYCgC/Ny36xPicgL5AjVTPvk7mAqow==
X-Received: by 2002:a05:6512:3d8a:b0:545:2ab1:3de with SMTP id
 2adb3069b0e04-5452fe3a020mr7735223e87.13.1740047185105; 
 Thu, 20 Feb 2025 02:26:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:26:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:19 +0200
Subject: [PATCH 2/7] drm/msm/dpu: program master INTF value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-2-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Zeu2WMMg3KSN6/su6MRFquf4B/jwSUnZPPK7KQNFjVE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKFKkzsD3IaKYWEHR+cLcNe4qWLzmyk7+Rt
 Q1BXnwf2LeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1dnnB/9INNm7rqUorusuSFff9lMPBp5yiIpIzWu28DU9UfuKT/GZSDwpGxHhwpVllxYm6SaoRUA
 JsIxGieMq8CZxRFUboUzZnWVk4RIFIz1KasecaOaj+u/Wy7r9ZP65ngf8eexv4uVkPGhQudKtNT
 61ciN5o1CqshJMBxtf2jjNiLbERRmtQvFYl7zt07KxSfjzUP2Jp029aB/oHcLV7AIbSikxNO5g2
 2V5mkBLUTfomKKWU7YN6F6V6NmHllQuGWYBLPiwgxt/JFxxX2CCFol+diApEB9EFMu1KR/wifhT
 DsTnkQisTC5CZXzpEDK04jKAD2PKgtr1r4VTCo/kHKUtoYlO
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

If several interfaces are being handled through a single CTL, a main
('master') INTF needs to be programmed into a separate register. Write
corresponding value into that register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 321a89e6400d2824ebda2c08be5e6943cb0f6b11..db36bfa98fc310c1bf35c4817d601ae6cf88d151 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -582,6 +582,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 
+	if (cfg->intf_master)
+		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
+
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 85c6c835cc8780e6cb66f3a262d9897c91962935..e95989a2fdda6344d0cb9d3036e6ed22a0458675 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -36,6 +36,7 @@ struct dpu_hw_stage_cfg {
 /**
  * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output interface
  * @intf :                 Interface id
+ * @intf_master:           Master interface id in the dual pipe topology
  * @mode_3d:               3d mux configuration
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
@@ -45,6 +46,7 @@ struct dpu_hw_stage_cfg {
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
+	enum dpu_intf intf_master;
 	enum dpu_wb wb;
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;

-- 
2.39.5

