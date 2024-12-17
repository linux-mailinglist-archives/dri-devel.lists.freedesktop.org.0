Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370509F4B08
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8845210E2F4;
	Tue, 17 Dec 2024 12:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FgTeD6tq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6D10E2F4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:35:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5401c52000dso5654294e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734438944; x=1735043744; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EqFVcsq/1P38IrP8o1pPFwny5Xr5j1nP95SEUyFOxg4=;
 b=FgTeD6tqrVLIwNvWD9me4yWcfXAFp+2O2wQGzuCrH3qUWqVrS6kRiGx+wHChjjfbb6
 fwcD3zjd2rUMCCwWvn7Ko32vPR24VoLDuJQBm5LZWfGfpuHIu0HgFc2FLg9JTkIN01Np
 ydFJgoVlpGjGQHbhOa518hIUPzkCw97nmlYwQ6pMx/Ns9gNnxGB5TTQ/39JR6aQLWcPr
 aXeHndp9z3XfCI7TD0BCD7M9/hDGjPCWYFI867wRD44EJYOepzk/S3aej5CmKRuxUCwq
 wmD+q38gqGcGJn6cGPcRugLdgZnEJLuX1VV4MscZ6QJa4kBTksS7qQq0VaIzouOGPTBt
 pQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734438944; x=1735043744;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EqFVcsq/1P38IrP8o1pPFwny5Xr5j1nP95SEUyFOxg4=;
 b=YSbQaE+w6C4h8IsA23vnbQibrsMZU1OVjNOvU/xEDEnB06Qls/1BxZ/gwngxUKS3ni
 JiccCleMEpAj3TUQ4TKEaQMvgubfY2TuqxnBEF17QAd8DMSyQMOFR8o0AwPoe5U0Fusc
 ycq2C8rp1QyTpceC9FzdkHAXUV6my9/4TIsiOyY0wu9TtICV6idmS+dsmxyiI+cVm2vS
 EWbRYcgmSWh+Ww1u0K44QBJa44gpWOiL3z3kbc0wJMnUYoveIfGB/xUmcWcNRhTtjCqv
 c0wVQ8RV79v9lvueyWs68hSq/T1FO7C73xMegWUcA0ZgD+bqZvyGjfXtzWPtkRqiRJBR
 +FwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU08jb9AWBZys2nEAEyqt4IElJzCnt4hbDT3ItMRyCaFxFKFdeLt4blbmOqbMEBeTqwd2wCmXDBD4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtwT6Pa1B/YGSeUrGYWSN1+XK3eeVYcjfHnS324s1/SI7oMXbz
 imFApQIWwXGt8qW128wlHbx0nhlrylIvK8VnPu/BxzPBC6OzpMABPTG8CdJo96c=
X-Gm-Gg: ASbGncsMYaoxs5FkHsQfFRILM7Ac9YNon3BNTbIVw8kueWdrOl+Nce4SjtKr5jFADWk
 KBknpHZwCB2ZeK3h6S6SyYcuV+TuDC8RLTmLv4QQ6lmNlT0Bijxqd6WXLejbmvGubkAvcCXbj2H
 Mq6NIOZGAErblTj0d+6Y6pfwqj4oBQ92RW3Ddck3H0+QvEq7ytxSClYTxvrp9J0oBH3bs4RvF/U
 NkR0h9509YeZoSSbyqcyzYZTVJ45uaaTI/EMNB8EGy11dctVk3t/VIUFMzOaJh1
X-Google-Smtp-Source: AGHT+IGwO6ExXNEcA0R2FoxKWS83ev2naGxk2+ZyD+jgIUG5jEqO7Ox1e2tGWV3q6r+L5CxjhdwD1g==
X-Received: by 2002:a05:6512:158e:b0:540:3566:5397 with SMTP id
 2adb3069b0e04-5409054f33fmr4655941e87.22.1734438943729; 
 Tue, 17 Dec 2024 04:35:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c164b1sm1137065e87.223.2024.12.17.04.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 04:35:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 14:35:40 +0200
Subject: [PATCH v2] drm/msm/dpu: correct LM pairing for SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
X-B4-Tracking: v=1; b=H4sIABtwYWcC/3WMQQ6CMBBFr0Jm7ZhO1VZceQ/DgtAZmEQpaZVoC
 He3snf5/s97C2ROyhku1QKJZ80axwJ2V0E3tGPPqKEwWGOPZMlhmF4o+sb8cHQySF6MP9RyFjZ
 QpClxebfgrSk8aH7G9Nn6M/3Wv6mZkLCW4Du2Is64613HNsV9TD0067p+AYimqTetAAAA
X-Change-ID: 20241216-dpu-fix-sm6150-17f0739f8fe0
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=P72G89o/YCMWCzZLIM5D+qksevbQkKdaRlhBYiPrFaw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYXAdGjNdaXabT0YqQhED4A+ccplPzuyiib3mB
 0PMvSkpahGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2FwHQAKCRCLPIo+Aiko
 1ePjCACAduQzUrmv2UvoKsCLEFcnmXD4PjXKpskER7W/cYTmm1XdZPXFmTk5RY0EqzMl5GaIMEW
 VRMx14YUs0iTTFUk9ihEWyZ+bg2+N9wownr+WOw57pwuHLR0/0BWQJ/9rK5oDGsIn0Vvj6ZnpGn
 X+ufNaMY5tVD6tGqy7oX5g7wD3VOQ6Z28aIYIW6bNu3dtC1VCIEs5mmqBsx2TJ2kfF/XHekHG94
 /CzLIy973QNfb2sk7/f4rwsq5LuyOOmMuTBrzu5L4VoPRVYj1CJcwCxjlyHBASAZviWPlTPBkQP
 b+cqywM+uIjO4zlF1MYJMPvdy47FqhyjBc7UFU7g0/8qTOaF
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

The SM6150 platform doesn't have 3DMux (MERGE_3D) block, so it can not
split the screen between two LMs. Drop lm_pair fields as they don't make
sense for this platform.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped lm_pair field as recommended by Abhinav.
- Link to v1: https://lore.kernel.org/r/20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 621a2140f675fa28b3a7fcd8573e59b306cd6832..d761ed705bac30d9ffef3c0c9140e5e8a5e930ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -116,14 +116,12 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
-		.lm_pair = LM_1,
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
 		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
-		.lm_pair = LM_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,

---
base-commit: a3d570eace66b4016f2692a6f1045742ee70c6b1
change-id: 20241216-dpu-fix-sm6150-17f0739f8fe0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

