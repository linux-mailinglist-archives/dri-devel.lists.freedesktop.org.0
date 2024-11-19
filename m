Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C039D2D41
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 18:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3929810E6A8;
	Tue, 19 Nov 2024 17:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G+Xh+Rlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E12510E6A3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 17:56:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38248b810ffso856756f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 09:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039016; x=1732643816; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5sOdhCwiSh3xkI7uU9B1Lb49u97b/k8HIRiPISm4XY8=;
 b=G+Xh+Rlz7hfbC5+iFcUpY7DeSz8lhfGZtnu4smZ0i9pHTTcbNaB0/1o/IHqMCUPMwO
 0lF8WAJ5TSgfmwIteD+tPKPNHKTAkHr04ll0c4XO2EK/Qxl/XO7FPyfSpUnPRamGayPh
 Xhs1dAf6RKDPzH3cNdFs5I8ZjS2mRzIGFK5i/oQvh+mXecheQ61YbtzYMEd/Tx64Xce6
 7Mgd5x0y4yd9eFVWFJ6sbX9a3AmiW1gWt4rZhpHqKLB3YesHivz5hLZ5pcYMJHHOeGMd
 nJiwuXiG7uE0MuLQGep8/vbDdFVt1YD+SXL+B9cfPEZRnCPvION6MKUAQgPv/6YX6GwZ
 7avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039016; x=1732643816;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5sOdhCwiSh3xkI7uU9B1Lb49u97b/k8HIRiPISm4XY8=;
 b=QhHcCa/+5TulSd2O/gN47GiWAQSR5Lw9YBoGjNqOBBaBgmStLMhshtHqShNLRBgoeh
 joHrKVH43++QOgxKFKzlYOp2U4wAxHeJnzQEzqYxjBf+42L9bnrXkPZ1BkvRHD0sNdwR
 V/fz+JzZP62F/5FfQDnSMRM/upsIXhR4KDpWR6/U9JVhfqk7bkD4VQwAMUmFgh9jwQLQ
 2OFtsK2hdRL4XSQzKuHW6BTOT2PUUD/zLFeLUbqAmsVGd9V2f/iW3R6amYaj5x+uz2Qv
 z+ZjjsWiJHdwwGB7/iyUYgxXnJas2BMT943wErObddYxzYJpeGKtbYi3la0+dnjROA0U
 /Iyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD/1DQKk1KlJXIh9624zmhXZosjOlQLsyN7LrpYF2MY7TKEYd8WcgiwvecfnosFBr7K6hwXUuK9EE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe1d6IlAJb30nv9vF+UJyKRz8vdRFfIzqnrPDBe/tprZaYaKqN
 r0sqdqbkm5jlxt5VW/xoEUi2OG6BVY85qyYDkBpfusINq2hbTyN86gfLS/Ypm/g=
X-Google-Smtp-Source: AGHT+IHApaxnzvnBHMhgfGhZ0ZVtiOtON2gIMaKaToPdOP4xBZY1h1uuKuZxErPzNHlrhhyIABadNw==
X-Received: by 2002:a5d:6484:0:b0:382:3e51:4b1d with SMTP id
 ffacd0b85a97d-3823e514deamr7632572f8f.20.1732039016495; 
 Tue, 19 Nov 2024 09:56:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:44 +0100
Subject: [PATCH v2 09/11] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-9-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=L856afxfFYTrzTjleMcDff0M5LSJvcUyglLdt4As0hg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFaONQvWVA4bP4yQAg2u1VE2uFOJH4JqIlyKjuL
 E+b5cDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRWgAKCRB33NvayMhJ0QTMD/
 9Ym4y6wn5ANBhacJSlVGVq+pieT1LNiuwmZiuqSYT3/FAUZxjXIcuGnBVPWROkU8WG/7Ea0BV6zx7G
 GaAg7kVOc6fwaAXUEgidaO+BO0d/C6XjOF75YoaVwNzEQ632acKIeBWDCPnPKv58KD+Nqw/LQTpl+2
 Pl+4ZitIKwP5OlbelgcghCk+KiNxKPRxpiOi4OXJeJPLGh2eAKQCWQae7uSKmHofFvSefqK3+3DIlJ
 HBQpyNslSFCzh5BZ/CPPCBfyc+rNP7TYAxZHT3EbolVv2Ti8Q2PuAcFJcKHVjZKAsQU5TB/y1Hikhx
 3900PeUp1zuXz+LiCiACvsOKvnDAQAEsHUtMwEj6rSyUdixVbGCZHOsCpCMxtfeVyxm/A7b7R96CNN
 xCIkhzd//K64UKDkLx/oARBg/KC5TWNblhqNWee2XVrc2civdB1OWbFWSk2mt6J8S2/TL6h17/Vb9v
 vJl1D4wrMkfcsQ+48D6qY8vzG4BYACQGe3qw7xXqmgaj24pHeBPGfRMTI5/3obZsMIzHSAWzenpqDT
 EccOZwyzZtuPN2FJzDiPPdkiqoQV82UdKrsyKgNjS6l9NYraZ+Pwc/G9njaCkRkMW8OSHPGulWOj3O
 8QmSiYESfdbe44ubCXHV1PNcAlfkTHDA1s/n1O9Q4+qzWx0rV5ujJhUziC8Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, declare the Bus Control Modules (BCMs) and the
corresponding parameters in the GPU info struct and add the
GMU_BW_VOTE feature bit to enable it.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 93f0d4bf50ba773ecde93e6c29a2fcec24ebb7b3..7cb96d524f76df67c6ee4377827a38384c1b343a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
 			  ADRENO_FEAT_HAS_HW_APRIV |
-			  ADRENO_FEAT_PREEMPTION,
+			  ADRENO_FEAT_PREEMPTION |
+			  ADRENO_FEAT_GMU_BW_VOTE,
 		.init = a6xx_gpu_init,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcm = {
+				[0] = { .name = "SH0", .buswidth = 16 },
+				[1] = { .name = "MC0", .buswidth = 4 },
+				[2] = {
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1424,7 +1435,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
 			  ADRENO_FEAT_HAS_HW_APRIV |
-			  ADRENO_FEAT_PREEMPTION,
+			  ADRENO_FEAT_PREEMPTION |
+			  ADRENO_FEAT_GMU_BW_VOTE,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -1432,6 +1444,16 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcm = {
+				[0] = { .name = "SH0", .buswidth = 16 },
+				[1] = { .name = "MC0", .buswidth = 4 },
+				[2] = {
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1

