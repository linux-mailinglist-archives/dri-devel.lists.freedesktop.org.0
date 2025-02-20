Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1BCA3D688
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B7C10E91C;
	Thu, 20 Feb 2025 10:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CylNF4Ja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DBF10E917
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:26:29 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so878010e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047187; x=1740651987; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wJNAJ9S8ZhpIeOStYgLD52jkOeAB/llU9h9KOXd2yuE=;
 b=CylNF4Ja9yZiIUrJYy3FuP7xlE7DXPReX3L2N7byuMTP480IoNCmRC77Mh96HWVdVT
 w5jUhI6nj8BWy/3SSQq3pkdRK2TBqqI/qxevnlhQtbGXJQc3uVKQ/1mYTv3TP9ZK0Wcd
 ZdzsjLo0aBwCnlzXcFlQca/fK4ZHyAD96zLuVEX2uc8fZRoU/0Rue+CuQZAQWwwp4gUT
 fHKoaxr9WcnAlE37RCSynnSjhA+WlAEtwXEQq/cXZX89dhJKdTiLQT5B9wXi4ai98iXT
 eo33vyThVwSCh3jrn0yKRqEu2fBkCqREDkjVV2glSNNTvx9tE797FyW6Yj3rocmoBN2o
 ugmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047187; x=1740651987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJNAJ9S8ZhpIeOStYgLD52jkOeAB/llU9h9KOXd2yuE=;
 b=IQ7VpyGc55ou5oeHCMgIIhIzLNNPquE7vVqHPxeW+e0L7tccBtI5HtXi71teYOT6Rv
 qefoWKJwFDi74Tye4peB43HMj/I+7p9HMh8wWXakJ/POQRhZuUfxQnyMkA8TT2DWaYdM
 hUSBJC3aEuJbHu31498iincqbAxBGiDdZAOQcxcVHZtKbFbiAZ9oJpVdoEH9vZog5CSF
 YKXu98WpKcHs6Xhb9Kr0VbmJIQorcFxLUgASShUpCBAmhwL79bXUJvOcPBkRVf6RnsX4
 nsbJ5m4zUzLiyOR5cWmbra0WzrlFpZbk/3Mo+f5ZkB6NPQfKs6A3wnEsq9HiA8RiHicA
 bE7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvWnwDMwNCGjLhW8A4K+zWZurWNMCZ80u/ureNS0X/AwqgjkTt/k1jroO6c0ZEIJf3BEa3bTd2RXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZxyhvYI2QNWjRYo+s6Ch6IEGygLVRJEAd9zufORwSH26bxsTv
 fzsBhrDqcOSwzl7fQQLCP9kzYeuKiA285kJMFIp7gQoAwVK9RrLDlfZjq80y+uQ=
X-Gm-Gg: ASbGncswLtlj+QHKp0jwiG8a0clptoDs0bohthqKAAmvnCNvGnUaeSnvImv2DABzBkZ
 MTnmB+EmdzzN9TPdczTg+hFlk2/mfn3PwOJcQ3uaMW5LwzdPhPcojJgiGnFFNmiunfj8zC/RQJY
 9TkCTmEeCMW8tsMHa3YLqI28qHz+g2Jj12a2Cyp+CMWeOmIRYraiHMrbTVN93UovlvzlJwy2W11
 xlVsp2Yah4ISuvaeleONJXzEPLMQY2A0drQsPisPNcUNFcL8i8Kg6xl+k+ZXYTnZ5qtSsQ14Iu/
 xOvEVq+A/pY8ulv2fTyCXfQ=
X-Google-Smtp-Source: AGHT+IF331MiMfKkOmnrNILcorNZpHZK9yLwRpgvYJ7WEviZijKR1lVKHGb4C+1ru/+g/xzWTNOJhg==
X-Received: by 2002:a05:6512:2399:b0:546:2109:1efb with SMTP id
 2adb3069b0e04-546e4662c70mr1044724e87.11.1740047187568; 
 Thu, 20 Feb 2025 02:26:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:26:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:20 +0200
Subject: [PATCH 3/7] drm/msm/dpu: pass master interface to CTL
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-3-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/O+unDh5T1VFusnWXWTP7rs8hDxFqzKuCi3hJ4pCKbA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKBFIT3AwoFKTScXTNMjZQ2C302xc/Ih6ae
 /0vg1jl0m6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1S44B/wIvkjQwHjwie/PsatFKnwZx+EoYi3i/LW0hl9ylAvK2w6DmmfzL+Bmj4+LW93FtBaWvII
 tP8iTCLrVfaXjq+uWjGpkkQydL4uIwTggZex6YpzVf2VqUBrbJEFDrx8alY+FsZY7qA8WG5yn6p
 gWQo603hoUZhG/GxzpU9Yd5HC/ubu7x33LFa9EplSqI7Dm6UKWyUXeUaz7NDZC9hgu7pNRM2jJb
 Si+E5E2Gln050Ey0XAONMApWO8p+x2JtqMef+yI6aqeJfMhK5rjvaizXgvyGGVGKh7U1GtByGwc
 qp2uKF8QeV0QGDWzBjhDSFAet+8SMpKhy7tBdjtITtGsOYkJ
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

Active controls require setup of the master interface. Pass the selected
interface to CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index e9bbccc44dad8b391cd51daf902307105b2598fc..d1e16da00529de35cf4e205077c4264bdb70de16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -59,6 +59,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		return;
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_cdm)
 		intf_cfg.cdm = phys_enc->hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
2.39.5

