Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899E995FEF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 08:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E93110E654;
	Wed,  9 Oct 2024 06:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RDaGTxrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB0110E658
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 06:39:31 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-71dea49e808so4053780b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728455970; x=1729060770; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4MVeW6UV3ttbqJXjuqBIKlAx6utQGRVi7urFzdcOAgg=;
 b=RDaGTxrXblUWV5JxVOYGq96woQQMWmiUBAsWd2KbnCJGComf4OhN9Jkz7bhya6zxSh
 LGtRnEQwxg1B83dMGFljoIKK7RcVF69H6xSh0jutA2ijmRY5I1jFlq1OKnMY6zAqZ72c
 ZGuRYS6yRcZEcQ4hWAhqQpu5eD+JB3gQkMBKUbzhXSomjdzor6q3Z9W/9lpyvIAN43ao
 oqCnoKMLZLnjY72pqE92cNhP0cAHoKulD5z7M8bwhgn9lFiuPVioIpKx+ZyXCBHZJvD2
 b7JOQ5go9ZjYH8Bs6HDy1H+gGLa85JuOGfdCCZ+w00VWG7Brp2INOWWXlF+3OEjrVhh+
 gCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728455970; x=1729060770;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4MVeW6UV3ttbqJXjuqBIKlAx6utQGRVi7urFzdcOAgg=;
 b=LIMrSkI8yKfEXbikSmhhNqf1zEo8XP7+j/6i0N/SU1AyFDFo490QGle+A4pyy8UCar
 wPNnJ29NpkoQer4T/thEghRs1JbAw7FV/Ll7uFLOfXPIK2AX31DpUL58TR942qmnyjdi
 TaOKd5A0IiWmZAdJ2IewGuYsqEgU8ibI8DaGMX8Cttlj9csyl/Zi0PVrgCkN93g8wfm6
 v0SXX7Tn/HR34Ck0wggOXdP6w8kfXki5dTfJ4dSotp6Tr3imxpld2bmfEWlaeswP79bs
 sg8OZA/c5JlnGU4ScX9eS+PFsBXX0RKWpKJE63XFx1LNnMn7LULT2txfODUkCcmbicf4
 a1+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9LmnV46pZhlyX3xKiDxu9T0l4cpaoQzbFHwdT7rrWw3V9QfdZv899c7zdg+3g4/4x4HF1RQWcGoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+ISWESRoaC/5lUVVKG6hJgWWZxPbSAfPDTdlkyMRJCF9pIcjz
 4JbJ5kefJiBxGDhW5F3nsd2EbasaZOv1yolpbmXJfc8T4ItFiwBe/WrCAlcG4/7vDHCEsgZ77ZP
 AgwayBw==
X-Google-Smtp-Source: AGHT+IHTy7xygv7al/EQDOvd0D+Ec9evKh4dzfTL1Zh+wZCn/Dr6FM8OvtntTMFlrHrE7LAlVuVcVw==
X-Received: by 2002:a05:6a00:228d:b0:71e:c0c:5996 with SMTP id
 d2e1a72fcca58-71e1db7a9f1mr2487895b3a.7.1728455970551; 
 Tue, 08 Oct 2024 23:39:30 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7d209sm7077396b3a.208.2024.10.08.23.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 23:39:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 14:38:42 +0800
Subject: [PATCH 1/2] drm/msm/dpu: Do not fix number of DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-1-139511076a9f@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728455958; l=2308;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=6lRuPczLurNQ81XiNhe8Vb57IXR2f8Atr3eozl9XC1Y=;
 b=QcS5lFSo6pkfbk6zvBqAr8UaXW1dq4zBfJMN779ItJSZ/oiaM2Z+0FkXD4/qUZ7dt11NGnGRc
 KUN519ZCaiUCUD2nGzf0SurKixxBS87ojFtFaVhWDxcRuCMSGtYdWoO
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

If DSC is enabled, the only case is with 2 DSC engines so far. More
usage case will be added, such as 4 DSC in 4:4:2 topoplogy.
So get real number of DSCs to decide whether DSC merge is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b26d5fe40c721..5260e2440f059 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -202,6 +202,7 @@ struct dpu_crtc {
  * @mixers        : List of active mixers
  * @num_ctls      : Number of ctl paths in use
  * @hw_ctls       : List of active ctl paths
+ * @num_dscs      : Number of DSCs in use
  * @crc_source    : CRC source
  * @crc_frame_skip_count: Number of frames skipped before getting CRC
  */
@@ -223,6 +224,7 @@ struct dpu_crtc_state {
 	u32 num_ctls;
 	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
 
+	u32 num_dscs;
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6bdd9c21ff3ed..39700b13e92f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -548,14 +548,14 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i, intf_count = 0, num_dsc = 0;
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(drm_enc->crtc->state);
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = cstate->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1169,6 +1169,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
 	}
 
+	cstate->num_dscs = num_dsc;
 	cstate->num_mixers = num_lm;
 
 	dpu_enc->connector = conn_state->connector;

-- 
2.34.1

