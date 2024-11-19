Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729E9D2D39
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 18:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21AA10E6A2;
	Tue, 19 Nov 2024 17:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qwhJHThE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC07F10E69B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 17:56:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4319399a411so11382555e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039014; x=1732643814; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wn5aQ1VZ2cxhVTPH7fiwE992qDBRsZA9HeBuSYk4nmE=;
 b=qwhJHThEr/57v/e/R+07hBOJ1WLx0BpkjKlQz3jZAMbIqKlS+ODZsJtYWjTJzTF3HH
 VfbhNuRXEMXF+onztvv4VXwpqckk90lajZLtTH9laL3fsNc0jzFUeuv0iOuMlnyOrn8y
 2gUzi7bmlBhAuvjGEA9FvMix6ZDuVnuZjzhG8ileZ8M8ApUz7xcd8WBW9r70q2YQW69+
 xuU4U9Y5NgQ2bGkr/5GGcqbgDAX7Uh00QwjthhKvJRVQwP4UYN8T81E1cFYPBSETdPDn
 W2Hkn2SdGIz6dykxAqOUpEkodpDFdteh3tfey4YFbWO1rReWqtNHu03Hcf6c+2P/Ndkc
 45vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039014; x=1732643814;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wn5aQ1VZ2cxhVTPH7fiwE992qDBRsZA9HeBuSYk4nmE=;
 b=qLLAZVR4+b4Qv4cXXJRjwD7EDf4gYYOdZVR8LDvaM+CcvAqMMhgc+aPx6VTcm47WV2
 9tzTKLDyEHOwmm35wKmjmUbu0mYR8Ou/6pb57fwagWCfny/DV9NmeORZJWyUyP5PgYj/
 rioc0eP/4P2L+ux3erln+TjVwrsKiLfIYi8OccbV+MFLzwbpKh8AUz3eAID/GxI9Drc0
 sv14sBTE7j6Luu2BtQK1RAo1FzM3Cc/8yqccjRE+qabPfmrkO0lFRHNFfNjY9Clsb4c9
 f5mnCj5ETPhUVkyz4p8a2b8/4eUXXhrPInPa5xNaOqRKmC1/fnpiNMYnLf9RejJY6PDB
 908A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOqw2WoApGcI4mKkMzr4TtDDHf8KcNDISLZUJ3cB5GdlOpyfbK1PBPBfkvdVvfGz0z8MsjNNI4a5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO/vSzXPPSiRAFXm38pzm3MPp8jlH6fdFh8F0QeE+TOMv49Xfi
 J4o3thXK6lIDkAqAtPGfEdOpdnJxtpAulxwxkv3Rwf7mF+cAEsdkhT0o76ijYR8=
X-Google-Smtp-Source: AGHT+IGonSiK32KUAYzr3bXRvSM2l2jcCxpdauXS4D5r3lT1PjorSljA4zTM71dFsaYPCcA/f5gJEw==
X-Received: by 2002:a05:6000:1789:b0:382:4a75:57f4 with SMTP id
 ffacd0b85a97d-3824a755bd4mr5956661f8f.56.1732039014255; 
 Tue, 19 Nov 2024 09:56:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:42 +0100
Subject: [PATCH v2 07/11] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-7-4deb87be2498@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4053;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=c7fkpIfYHl8TuODfNcVaZw49taK0J/XE1pU9iIsovJs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFasiiUa76I7e45RA1Hi7Q21xQOjgCMFbyW66oO
 L9CsJWiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRWgAKCRB33NvayMhJ0U1ID/
 9TgCEMSBNEoWaJNnj7wI7ZeW8V0mFeGvJuZbG+m0iDktGvAgf48GWNp32l2ez1Ae2hlcTT/ipCedq+
 KX3gG7jEthsl4UJK54VwuKNobkGuTWAUOGnEUJ4dmS48nGKzq1lGLAedYW09jAlP/VL8eU5DflyZ88
 mVuTFgv1sUkArErC/hYLXIAJvS4XHrKWBlxjAOwD5ntq+/1QTN+DWdpeOcAx+DT/7/FKXAZGOntZoa
 TC+8v2VeBUaKdlkycdGOiW/ja5YhxzgyvGwA0GTu8Lx+/sAG9MPknUzrX/NX0odjFilaJwYaeD91QJ
 VSvWijltOjhC9zG7xwisx67iNp7n2zpYTWj+/E82teMa+Kg2cY3l1coBqf6E6Hz4u0Y9qOnzgkMc3S
 cY8X+Yfrz5ZoBB1fSYLbczhJC42JdHDn9Qxus6lDZaIXcPdhDJz+E/x0iQ/WfIx57FEFpAaIxf/8iW
 WZFDvnqaOf82kMr1Z00A+fQuaEkstUEs106qjUmzVtj5Z5snqph8WXr4UrlRNe8lHGga4/xO/tJHAZ
 prZ4OHjmO8VDlSxaLHXk18wbA5vNavwpG4twgbMpkI4wMLCZB0D65lNfxe6cj7zFwIYIkSogwJx9zO
 Mai061ny1cuNbLBBAjIf02c91+tWBreDcn5/cDa528U2c/yNNf/UIFtcyPhg==
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

The Adreno GMU Management Unit (GMU) can also scale the DDR Bandwidth
along the Frequency and Power Domain level, until now we left the OPP
core scale the OPP bandwidth via the interconnect path.

In order to enable bandwidth voting via the GPU Management
Unit (GMU), when an opp is set by devfreq we also look for
the corresponding bandwidth index in the previously generated
bw_table and pass this value along the frequency index to the GMU.

Since we now vote for all resources via the GMU, setting the OPP
is no more needed, so we can completely skip calling
dev_pm_opp_set_opp() in this situation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 17 +++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f6814d92a4edb29ba8a34a34aabb8b2324e9c6a4..dc2d0035544e7848e5c4ea27f1ea9a191f9c4991 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -113,6 +113,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 perf_index;
+	u32 bw_index = 0;
 	unsigned long gpu_freq;
 	int ret = 0;
 
@@ -125,6 +126,16 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		if (gpu_freq == gmu->gpu_freqs[perf_index])
 			break;
 
+	/* If enabled, find the corresponding DDR bandwidth index */
+	if ((adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE) && gmu->nr_gpu_bws) {
+		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
+
+		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
+			if (bw == gmu->gpu_bw_table[bw_index])
+				break;
+		}
+	}
+
 	gmu->current_perf_index = perf_index;
 	gmu->freq = gmu->gpu_freqs[perf_index];
 
@@ -140,8 +151,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		return;
 
 	if (!gmu->legacy) {
-		a6xx_hfi_set_freq(gmu, perf_index);
-		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
+		a6xx_hfi_set_freq(gmu, perf_index, bw_index);
+		/* With Bandwidth voting, we now vote for all resources, so skip OPP set */
+		if (!bw_index)
+			dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 03603eadc0f9ed866899c95e99f333a511ebc3c1..a42cdd0261872a08033a368af1434492c075b3fd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -207,7 +207,7 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu);
 int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
 void a6xx_hfi_stop(struct a6xx_gmu *gmu);
 int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int perf_index, int bw_index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 0c8aa9f8cabe1d9cb20445a4274b728236a99fad..2d8e144e3453b30e7d3a22c9252e516763c39b83 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -759,13 +759,13 @@ static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
 		sizeof(msg), NULL, 0);
 }
 
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index)
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int freq_index, int bw_index)
 {
 	struct a6xx_hfi_gx_bw_perf_vote_cmd msg = { 0 };
 
 	msg.ack_type = 1; /* blocking */
-	msg.freq = index;
-	msg.bw = 0; /* TODO: bus scaling */
+	msg.freq = freq_index;
+	msg.bw = bw_index;
 
 	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_GX_BW_PERF_VOTE, &msg,
 		sizeof(msg), NULL, 0);

-- 
2.34.1

