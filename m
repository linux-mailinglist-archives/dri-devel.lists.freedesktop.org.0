Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCDCA3D682
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E5310E91B;
	Thu, 20 Feb 2025 10:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IwTxxxq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751C010E919
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:26:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5452ed5b5b2so846482e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047183; x=1740651983; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BHG5/92JHG16RLprBRzXgLa8hI+3p50zsk7zJC6YSjI=;
 b=IwTxxxq00dZFzA4PUcfrceo2TjGueC3RyOOPrbY/BUnDYO9uwoVjo9wDbmU6uLi3Hc
 kjcFOIBYou6QPemHJiG+iiW//4+1DhdTUn2RSacKzZq/mM/EuFHVZlWsMlPFHyn5A7yx
 KROcsGEecotGivrNHZKlTBTk+w5CrKmaXdEYU21udsGxLcSPR4VTIp5WXaEYYoxmrm1Z
 S3lRMEkWr7FMvX3/52g5bnMb5q9opE9Z29C1lyCOd4IUI268AKjXdHElZy1tuISmd+zI
 WcRracLYuLtARr1R6ZHmberx0gJXPMnyH9GuyfajSwTbPqQx45JpSMNvl9RqbbUKBlTQ
 238g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047183; x=1740651983;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHG5/92JHG16RLprBRzXgLa8hI+3p50zsk7zJC6YSjI=;
 b=uzpDocNtlyiG+SMsyZ2pPDKd8ReCunNVvS2d5rMsnnQ/80fyJzqzox/GftBNlCKGoh
 ClaYuVihLFJzeM3zcqL4lU6SOE7cZbOQEr+QyB6glK81+B+CPC+kgQvGxfAPtr4y/UnF
 LT+z2VrZ6flhFhp/UjtnurHsDMqKylSzntVZWR543kFZ+V5ZID/Wp4EwuyrhYJM6s50J
 FFMa3j5YyiHAqHdHKFrht+UQPX19rqZffqSplcfUz6/w4gNf7A7MnFTDyEPqo6OP2YnS
 XSJbXZ4MeTn9Dst1toXX8000pnYVnZGwbAOfaHRSvonQ+RONSSIkq2xPtzIBOeD3l/hQ
 vJRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY2I9MThCAmhGq9+Jtim6uf/RtPCu6Lg13+y3h2CBZEghfvj0+VEr4fYmAeKEn/0sXGb42ub92wZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmZ2njl0mvgWnwv4GBDeCyl8/8J0h81ozTXdk5DzabTobbSbGz
 NZocBazGgJebJH3yc108Cu6tXXOxibdGDhkvq+EkFPm/Qu9vJqavwS+62rT29og=
X-Gm-Gg: ASbGncuKSSZqzVtxvV3kw13Ow9tPtAxlWkwZMqQZFKGGPlWRTPk+zSfekyjb7qq+iED
 qCorM2QJ/t3HU0I4WfdYd5rxIhLHO38Z1q5zY+/Sr0slHU5Dk7YIzwV0rCccS4QbWYGf4+3iGec
 tm5zrTwgbuliVw37OO3TAAWYBCPVa0rMqGTGtRO0dyLCvjgRaRrl6DNkfWOfIGKmFQO/Q6LAkH1
 /JvRMJsD5+RkB66CMVrL19++kcflTd51hq52WuR+BR+eWzfyd5Eao+61XRvoQhQuT/yeba/Ps/a
 UB39nAixdK+Z9xr1/E/Ep5w=
X-Google-Smtp-Source: AGHT+IHoB8cGAPCGqCy5Ys3Z/ClpL2nQWVmYQHHBfQ6tZBAycg+fN9nJybcNHcZmN/tcLAhsEfwZzQ==
X-Received: by 2002:a05:6512:308d:b0:545:2f09:a3fc with SMTP id
 2adb3069b0e04-5452fe26402mr9020270e87.3.1740047182645; 
 Thu, 20 Feb 2025 02:26:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:26:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:18 +0200
Subject: [PATCH 1/7] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-1-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=w10ZfN4br6Ap7llW/HC7sm0zGLP894PWSldkoISRy7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKGB2SRGw4F+CCKnh3jnyyk4Z50hcLkYJZL
 WDHvV06OyuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1dz1B/9E+EDZuiyFKbu+SOvzfZfWbAo0fN+Z7dtd6euH0aZu3Xj0jlLMVWKP5Gp98xq1o+/fBQw
 mSvUCdUuEsf4Dx1B8IDw0NCpJq0SpYCgZFjQo7jy3jNGrM0s2dYkT/+ZDRzQQtIu34oiYi0AFLK
 lvPc8qzUidfSVyfB/LarXGTT/HPKmqn7uFjrDVOqFJeQLV8PNLTjQbjNp+Mc17t3dYlv+hXXnSU
 mj30TPmuI6n0Y0GFklZBoHHtNHaUZVJXsRHm1q2V8emUk6Y+8cnCQ+PO3xm1qSb7PNSl8Wi0ZIM
 CXxZrghI2QOhgosSlmSjvUD2JTpAKq91N3VTX1O6/N/HZIfC
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

In case of complex pipelines (e.g. the forthcoming quad-pipe) the DPU
might use more that one MERGE_3D block for a single output.  Follow the
pattern and extend the CTL_MERGE_3D_ACTIVE active register instead of
simply writing new value there. Currently at most one MERGE_3D block is
being used, so this has no impact on existing targets.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4893f10d6a5832521808c0f4d8b231c356dbdc41..321a89e6400d2824ebda2c08be5e6943cb0f6b11 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -548,6 +548,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 dsc_active = 0;
 	u32 wb_active = 0;
 	u32 mode_sel = 0;
+	u32 merge_3d_active = 0;
 
 	/* CTL_TOP[31:28] carries group_id to collate CTL paths
 	 * per VM. Explicitly disable it until VM support is
@@ -562,6 +563,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
 	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
+	merge_3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
 
 	if (cfg->intf)
 		intf_active |= BIT(cfg->intf - INTF_0);
@@ -572,14 +574,16 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->dsc)
 		dsc_active |= cfg->dsc;
 
+	if (cfg->merge_3d)
+		merge_3d_active |= BIT(cfg->merge_3d - MERGE_3D_0);
+
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
 	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 
 	if (cfg->merge_3d)
-		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
-			      BIT(cfg->merge_3d - MERGE_3D_0));
+		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);

-- 
2.39.5

