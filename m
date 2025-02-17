Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDADA389B5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB7210E565;
	Mon, 17 Feb 2025 16:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q96cwZI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA8310E566
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:42:14 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-abb9c8c4e59so25952566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810533; x=1740415333; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N8nOoi7/gmo0cWUkjWoW9KsdAcJb9kHFiSd6bM8xPlc=;
 b=Q96cwZI0RFI96rMGQknTqTVfFkA1djJW4yg/zGVMGXSqK9TyLjPPpgogKjxI9w9pSt
 b3eVzKkxSfzUBSc5XHvqKCELrQ4LiMM/qOo70mmXQiVPHlHW0QRuprabKgj+qbRndcit
 GaThmN2RMRNTmtkXp6bPo2j4repSIj54QraP0Q24O2KQYbxFj2RgxCQ1M3lab0vQo/3H
 pWKBVYejgyZmFkvlOh813soEHg/wk32btKpnuJuipePr5tgFpDWfFYNYhoC1h5UztUj0
 D8PA0zmL7GnpUpv6imAsLLh3yltqM7kNVhKcucP77mYkUE/vMrvuBn6s1EmA8dAcCAPI
 0yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810533; x=1740415333;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N8nOoi7/gmo0cWUkjWoW9KsdAcJb9kHFiSd6bM8xPlc=;
 b=GL/ToR3JwGYHGAcApKJH0I/CpF1PG4L11Qdz5p6R3iptdoSJi4X+ebNtRr552HnvJY
 jdp/pmd1g3ieTeTWU7VMealYTn0zOIv20yoVuDbRgx1gdzZJ43iCHgpAatWdWtley0+y
 paMLIN4grHfux7tdi0CVUPdaubeUaYxp1rWtjrFkOsV7ZHCsdX9jsWV3mwoOzHu8yEE/
 +9WTf/Sjn/ZjrGogS7QhcetCz6u0D4GQFx9esojLd/DyaSVTVLas9MdNyIs6KcZRv+Ag
 QX9resQ6xMcG1F/6DEjLdRUuWeyoudGvyFUbLx6pwE3AYyh5xskCKoqZYYc711npYkIT
 JOHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB9YgZFZ4wLwXwChvESmCwSE/rkFV7Qo4Q6LYsSXDry189vnD/kn7tIi48T7B2lal6Tp8QdJAIsJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5J5ZOWEX/x/PZfWNUPS0IV+N6aZrhcCJG5JrI5RF36mRq/JYD
 gVmFZYnaJKeBDs0dIFBR541iZqShERRR7+tnsmibwOaAmU+KLsKQfHVFNiSb+JE=
X-Gm-Gg: ASbGncsa6ruAA1Fu6mxujFc8EbQHnZ4KjQcu/FJAMO89ZpHnJ+qVZdJDwn43kN/X67b
 reC/7Yz4FEh/Vd1DKHSdVsk58jzw+1ZSInqI9nqGK0RfrhRnOvNZo8DNueiXIDyIL5ynvflAS3H
 16liCfgPNQ41TENDX4oM9YIwZlVucMtzEhni3/2QMWHOStIQX2xC2f4AfWQV/DNUSqEG8MXFp1U
 hMw79DEHoXzIpVtjyFseq6lGHSxqhU4GiMYROWvGlSOmEIcxGn4svGOCmne1toA9Q/8USc05CQt
 1cDAaU4pqGTCUVm4jIMay/QV3SYR3Ng=
X-Google-Smtp-Source: AGHT+IHvbDRkkAMa1vWNiKvSm78EVhBveMF8emVyRCP5+UYCqs2dQdsJcDTDXtVjnaDKUT4ZXiDzcQ==
X-Received: by 2002:a17:907:2da0:b0:aae:e684:cc75 with SMTP id
 a640c23a62f3a-abb70dac916mr386633166b.13.1739810532844; 
 Mon, 17 Feb 2025 08:42:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:42:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:35 +0100
Subject: [PATCH v2 14/16] drm/msm/dpu: Add missing "fetch" name to
 set_active_pipes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-14-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3984;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MRN/ryi+pMGgkQFSG+NX2HFCuyWv6SXBLRgehaGG5PI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2bDHVydNVYpXSL+Ug0+oBX/FfYHsQrUWyOPQ
 Ako0B13CUWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmwwAKCRDBN2bmhouD
 1+ooD/97+K/YLW3t+RwvAHJQk/mC1Yi7hSFimM+NNoceCV3YhSkyt2Cl9W/PEkn0NOZO/ZgibiQ
 66pYtOLCVNmK3izL1Gj775sFdhyKX2MT/omTGIEx7/WaqGzBj6R+xqobVDBxkfBsGYsLaLi8PLd
 0ROu6u+6CbbiyUPVvieFlQF0N4W4WbQ7BdweI7UdZd3XJ6WrE3EsedVHUweCfMdVhrSka4A8XAw
 SsQN1mrnAuU0fY/CLaFg1OcSND0uIrQCxO/T3fe2Tetajv6k08LunoYwODO5M9yW4rOzQULOtv4
 2HKgOK6tUZSbYobV76tKMz9410G/w/Ap6CvLreebbEi7dvct+SQh9ciZIsBNqr1uqsp7moyfNB2
 CEbmhhl0wq0Gph6khzPIz3RcGuQhN6/iwn/mT/n+jsyf1A40LONg2k8bacZKNwu38jh+F0ZvW3p
 tX7Gb3ovjkQTfrFeDuOVqnOLunKKsaO6+/lJykiuxoHnvQsvkkls3O1fAVx0qI7Kj4kWqC6KMzk
 KdXaFkitss7d8/pp/PFfcLyVjTiKNmrAFh+I0vwdACzIqAAWO+XZDbUM7HGKvr8CFYd3wHlmM5a
 sqIjywaAXll96UGyYCdfjzRJfy3wGFdIvEt1r1ojelM9XtJWPbS9ku6jbilMzecWNccpDWswpm7
 OciF5ZrjZbDV7UQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

The set_active_pipes() callback configures CTL_FETCH_PIPE_ACTIVE and
newer DPU v12.0 comes with CTL_PIPE_ACTIVE, thus rename it to
set_active_fetch_pipes() to better match the purpose.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..7de79696a21e58a4c640f00265610ccce8b5d253 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -445,9 +445,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
-	DECLARE_BITMAP(fetch_active, SSPP_MAX);
+	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 
-	memset(fetch_active, 0, sizeof(fetch_active));
+	memset(active_fetch, 0, sizeof(active_fetch));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -464,7 +464,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		set_bit(pstate->pipe.sspp->idx, fetch_active);
+		set_bit(pstate->pipe.sspp->idx, active_fetch);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -472,7 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   &pstate->pipe, 0, stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
-			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
+			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -492,8 +492,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		}
 	}
 
-	if (ctl->ops.set_active_pipes)
-		ctl->ops.set_active_pipes(ctl, fetch_active);
+	if (ctl->ops.set_active_fetch_pipes)
+		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 9d4866509e97c262006e15cf3e02a2f1ca851784..2e1e22589f730d1a60c3cbf6ad6b6aeaea38c6fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -675,8 +675,8 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	}
 }
 
-static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
-	unsigned long *fetch_active)
+static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
+					      unsigned long *fetch_active)
 {
 	int i;
 	u32 val = 0;
@@ -764,7 +764,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
 	if (mdss_ver->core_major_ver >= 7)
-		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index f04ae0b1d986fa8f73e5bf96babfca3b4f3a0bf5..b8bd5b22c5f8dadd01c16c352efef4063f2614a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -243,7 +243,7 @@ struct dpu_hw_ctl_ops {
 	void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
 		enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
 
-	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
 };
 

-- 
2.43.0

