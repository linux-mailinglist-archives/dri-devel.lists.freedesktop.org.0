Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3627A49009
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980C10EBEF;
	Fri, 28 Feb 2025 04:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TIcwVvUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D320810EBEF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:16 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54527a7270eso1639315e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716055; x=1741320855; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=229LaQQs3AtVYpVY7CYXwuqYuFTusa/OnRSCiJVHHMQ=;
 b=TIcwVvUFVWGT5UTjfFDhoYTaQz6tMlrWRwt9+8lqeU546DWoBR8D8xblQJKAe+zpmN
 CZuqsmwia0lXS2MPSMrHjxMRXDFyKLditwhbjYWPBdK0hEFJcGKI5FZVm+hKaNV3xcwN
 NVWHcUMCXVxiek6/PztYuviKaA84YZLFd64SLvVohmfetquezzgYBan1CS5/ngZNv0H5
 Z+T7PPIXMVPUAG6fqHiqpm6aVE7UNElueibiFvtwCyWMNiA5XEXkz1yO8nadOIaAWgFi
 OTgFP/ZehMqtw8fTvnD+s9nFgwP1+BuZEqSpNon982thwL/yKQqLx/3Q5Za2jMjOAfVL
 2Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716055; x=1741320855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=229LaQQs3AtVYpVY7CYXwuqYuFTusa/OnRSCiJVHHMQ=;
 b=Z4mQAq2CUZSFJ/WsffIuDKJu5EGXBOFcoMJRRjcfB+vKRIXRJ4WqQaSI7O1Fcwba1k
 zpk77MzTKJAclCstWO7GHWUVHhFI8cNOzaQriXbCoQ4nHk3vTI2nBv+W/I/Xyaq0F8UG
 gznR8inozCfG4yquKOA+Z+GZ2jp3IRVg+vlT4rkp3elNVGh9a2Y9aehrkq5gncZISxlX
 ksyWInPJtqv2IW8InvqQiptvJ4jDgxguonh33smIfATNoxs5il33i54jwslpPF7kLQpe
 SOMoSaVFG98cbgS6LyCSaTG59genUAAm8/8+Anla3+xNngC390q2/iSUEB86rYbKtaLZ
 /mIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN7mibcIytjzw4ItmPYv6i5+UkHoYFUP4F7GXkUM6IBKHhwTEbALPamskDYjYjtgJdH4JJUBuxL8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMRq3pMPVJKsfkgZYA6yD3sPghRewxOcQJKQQRDwTd2gt26rrC
 LXt4mVMOIyMw2kL8N4pxsFIxxFJadSLLvCue9px74cMlVXb2iXKSoX2KjXLmjxE=
X-Gm-Gg: ASbGncttn7Mv5SIeJFbUd2wJkqZWrduQrUSFvI7Uu+mrGDWwhf5B8kRGJgVLRFKq2H9
 vi+OwNuw7yV0kTvnRvAhHq19/ri0wg7dZ763VjtKtBzJpejNqEc2WmcAdBvV9T5KIAjvGRTi0cA
 IuvK2yesNZwpQj5tnLLLquGP29R/bHJQb7AtLp08u/HeaP0iFmFg8qyyHfktWnmnwHqtEzrKl6J
 su+w0f4rJ/wOAPosPIpr6ggZIWbuDkW731JH5tq7ngHYMjS8NJ/tTiLiA/qX1WM8eldBwvnQfY+
 GTbRcKbyVTxo7rKluX0tuvSQqbGxlhKLOA==
X-Google-Smtp-Source: AGHT+IESa8qolAMTFNqWbMDxjYResyR5kPLAkWzhjfwsqrBTG4hn9eOwmrwmXsP01jgv8LizRkO9Kw==
X-Received: by 2002:a05:6512:3ca8:b0:545:1dea:7b2f with SMTP id
 2adb3069b0e04-5494c38bd76mr634215e87.45.1740716055177; 
 Thu, 27 Feb 2025 20:14:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:06 +0200
Subject: [PATCH v2 2/8] drm/msm/dpu: program master INTF value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-2-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2935;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AoDhO2t+dIdRoZkxxXCA28rPq8VTkQxMjsmlolETDOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgOI2a12c5nnpkFzuRBe/F8av9QAf5AGQdLt
 PAmBneIexiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1c/NB/4ld7gG0gXOmNt1fY0qrRWkykgxbJC059ytvMKjIFROSR3D9yGOy2W6VW5i3SVUU4RWYD5
 4HDjTvWuaP9iBjO/AqntSMDzuAS3xupXntxShitM4JcZDrRSXk2Gdy8C1B3TYfnArBSQOJOTyA7
 R3krlOq4v3n9me4V0BBsdQMbYzpTZIm11r6T2diA9NLtyXPoTPL3K8qj704t2d3ngq6hXjV7+et
 c6g/uznC+99Z8AbvtxmJ8ZciTFk5CaZofU4sqSOvoMUH5jVzkFiVesvv2oA4lT5zfv9L8uNxRca
 I1ELPXN4oFJVMUE30IPHTEP9+NYsOocTtEOF5QBMAOJKmTUa
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

Co-developed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 32ab33b314fc44e12ccb935c1695d2eea5c7d9b2..ffff60c4206c6f2833293fdcc56b653f7d3124a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -583,6 +583,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
 
+	if (cfg->intf_master)
+		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
+
 	if (cfg->cdm)
 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
 }
@@ -625,6 +628,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 intf_active = 0;
+	u32 intf_master = 0;
 	u32 wb_active = 0;
 	u32 merge3d_active = 0;
 	u32 dsc_active;
@@ -651,6 +655,14 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);
 		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+
+		intf_master = DPU_REG_READ(c, CTL_INTF_MASTER);
+
+		/* Unset this intf as master, if it is the current master */
+		if (intf_master == BIT(cfg->intf - INTF_0)) {
+			DPU_DEBUG_DRIVER("Unsetting INTF_%d master\n", cfg->intf - INTF_0);
+			DPU_REG_WRITE(c, CTL_INTF_MASTER, 0);
+		}
 	}
 
 	if (cfg->wb) {
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

