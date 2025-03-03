Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A035AA4C47E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DD310E459;
	Mon,  3 Mar 2025 15:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vFJLV9KB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9827610E451
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:03 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-22349bb8605so87809605ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014903; x=1741619703; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rajdpuATf4cHrwTeJ8T+ZsyTPgo2DiGPUjAIn6iu1Wg=;
 b=vFJLV9KBqaDOSsrswTfXvxnYkFkFSNvqDrT1A7FnXMo+1yzK9OWV7hzxV2qrvz/DEQ
 wDqz6/Fo5vseDUlya6yhqvHyMCxY3U21YRNHpv/rZx3XxdnWaWtdNWewITU4Cjyvl344
 2HDFvDSfiProu8jgb9ReHcahHZxReQ7mfBMbc6DkM3yng5KcJyWIq+vcG7IEaN4XRaE5
 4/BhwYIEaDfnb9iQOTsfAS5ZI/QNkhtAFf4M6XrM2U+kbdWYCvKWP8JsdWVSkI1VM+NI
 CQlWVtYhBAEFAhDGHW/jfHUuLIzebw1Xq80rLhSAbXBKAY/NgYmc4xakfKZHhpNlHrf3
 RAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014903; x=1741619703;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rajdpuATf4cHrwTeJ8T+ZsyTPgo2DiGPUjAIn6iu1Wg=;
 b=BlBWa5Da8tOzUR5DYrEg2+oW48/9q1tlq+EY99iBZaZcNQZFjfXlCHpcMdl10OJQni
 Us2rvZbvX8cN+wTpT7YGV6vX+7QQoUJUjg3oNngIY5GydrYV0FEl/i2F6WrbQyAATyQI
 HMJU7wobsTSHpewOa6LnYJiAnIbH+iou09RDRk499BPAgfpEykGk9J9nCZLwTwz/rZRK
 2gI8B8sQiBTMiqJZpPE+Ttl6YuPOJSMNKx3Z/Gu64JCeArIwif5GYJgoM31JQpqnum/d
 kRt61NsEToSZYzmwnDd2aTM43p5G+snAXp2eOgFIN2At8urrC2bfVpsWnsFGP0YMTk9R
 euyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7JaZM/jV/IBqEOYgcSYGvG4B4AVVJjeO/m7dpiN0EyuMj35T9dwS8XFb7cIhRxfceDDwehxu7hfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSybTlQtuyjdpm8OF37OXMSusL+UZEuCXdK5zTCJ7nDn582CFf
 HaLeXLVauKogd0raIIrTk5blkUVIVRM/qBBn66qQrRjJ78EfiBEfezbITdE6ldc=
X-Gm-Gg: ASbGncuDUnwY+BgLxZZDkfRHGBj79Fzt5DavpsEOL9uIvtzWu9nqX8xkixdz6sfK+LD
 tRhsKuabTxzOX5iuGPwIZnnzFlYebCe3wMPidmGy2UDg4/E6ectV+ma94K1JP6wNdo9V7gCPKwg
 wO/6FeuhIqLZuReb6RWA5eSQGTBs3Ef7cU+yNY/LR5m9cTIj1JGGZ/vs+ieO2RS8gII9agba8Vk
 2OzRKyVJyuSRvx1/M/lSpOmtMsXmxUpbyqryWnfWsP94mSmuQiJEQFbau5qSWQ6vwVJyjvMInI6
 f3n/rD60k4DmSbdqK4OYP058BYzuaYf0yTMHU3sKvA==
X-Google-Smtp-Source: AGHT+IFfKobZR/YNthU8FSN4d6D3QQs8d0hcDUIFWNCkJQnXRThDPSI3iD8UnplSa5AFqtM/nye7ow==
X-Received: by 2002:a05:6a00:244d:b0:736:5b46:489b with SMTP id
 d2e1a72fcca58-7365b46531emr4180973b3a.1.1741014902949; 
 Mon, 03 Mar 2025 07:15:02 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:02 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:31 +0800
Subject: [PATCH v8 02/15] drm/msm/dpu: Do not fix number of DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-2-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WBM/p7IonF+GUTkphvNqY034IFJPvXxbXKnpEjol144=;
 b=Eo4AVl6PNa4Zuh1hIo1r0Z2SysdoISXYk+vp0YJpZ7OGVtradN62MDjOdok4y1ut0fVsHeHrf
 MoiLB40oGZeBnFVeoDof6wy9ApzZxL92NfBW9r0UNStUJzs1O5ddDmZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently, if DSC is enabled, only 2 DSC engines are supported so far.
More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
get the real number of DSCs to decide whether DSC merging is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eaac172141ede7bb4002ce1d0268b2f436fffc6c..c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1

