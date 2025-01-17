Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6A3A15366
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8173010EB28;
	Fri, 17 Jan 2025 16:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RKi5vy4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6545310EB2F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:01:20 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2164b662090so44691465ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129680; x=1737734480; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J4/m7UKLS8mvjwXaHQw1bbd5jh22z0pui9nmetA6kaQ=;
 b=RKi5vy4MsA/t1/PsnBTRN8P1rSLL7hfGIPUi5rPr4LGF46Z8zOFLXl+bPn06enDsf4
 budsGTkmFNNtkB9qH9XHqvf2rLXkFs2LpMVzcnLcNJf48qaJVYxLih1MeJLZceg8n/7v
 OiLPmnkqKGK3mXyI6zm96dwTPsAZCJn8u24y0SoPi8cWogGQkMVJFPCAg/fXgMX7t5/J
 C+15HY4kwCHz7FHkE4aYAtA389I/Jv1DxTpTtUQn6DvUegPfQJjV0zGjPi5/5OdiY0u3
 2yCjV43p9gsvcPwzzt4LMQLVQQqEcsWrtaqZjYVj7Aghxu/XQOQBus0155QVP6wv0tkl
 37bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129680; x=1737734480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4/m7UKLS8mvjwXaHQw1bbd5jh22z0pui9nmetA6kaQ=;
 b=azH5go501OKpc2JXzHzir3HIuRjMgGagGo90jpQD4tQtfksWMg6gzxIX+yYA5mQjAG
 NlkP9iqxTk5/Za3HrR+dLo18CvSYhTcpiJPJ9DmXA+mGfHSjDMlQ8vMlb1s8arUki7sj
 9ASrXFp3yWtgl76y5r0fqS+m0UkFI9a4q6N80VXp7leSZ+DT5ZfTy1k4kjyquSN+D0lG
 0EcjruDjXCYv/LGMlKUQjc8kpBkLh0o1ocZYvCoJryJfkY9rBput0iYxqLVLD2tYum2t
 PaPUiw+c9z7PrrWDQd5VBIJOtzJ8ep867LDDUoqludCVr144i3LXh2A81KoAIPBbhsOp
 cuQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLB6C0HqOHS6CyB9Z3xnWhBqE6jVRL3Z5UX4n5lj/JI0vHKpJr5fySkpdOjQiCwmMfL7BE+nesTyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySnhKB4oqDQApYFMDx1zDrE2sjqqrutnYrKgDTPgeMoC50s1RI
 Jj7ujPM4MoHo5o1pb6oL4pjUibYpQ30qBdRXvyQeWiOxPdGdSGwVGDvIZ5+SUSUpKJNlFCzL19+
 AbxyRTA==
X-Gm-Gg: ASbGncv0xRVS0lpKTw4q7l7dRexA8ANsUvtamlVsNVPnbk672k7B054oodmJAjeqwm4
 doMy99jK7+mulQJH73TFZDE/kLB1Gc94xMK5Gmu0sxmvpYakkwkjUmVQ+G4Zrr4ftB/NyNUmH9x
 In71dl55ehpOfuRoFI2nBNAf5O+gABaljZlPr0TLGYlK9Z2VNv/ZpE1FRzcSTf2Ve3LrQYFHQ5N
 WLM/HQKV7tYNsR+CqS8HCLfa+K3DKOcYvMSHFLGcviwFzjQr5kQ5A==
X-Google-Smtp-Source: AGHT+IGQjujBJyRaB7I4nbdyg2wIuIFYhY+GNdgeAguj6DANGBgOYmrB/OJPa+SijOqWlOcJhfch4w==
X-Received: by 2002:a17:903:32c3:b0:21c:1462:17ae with SMTP id
 d9443c01a7336-21c3550e861mr47528435ad.19.1737129679553; 
 Fri, 17 Jan 2025 08:01:19 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:19 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:45 +0800
Subject: [PATCH v5 02/15] drm/msm/dpu: Do not fix number of DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-2-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=nXrugQ4ghuOyVc/9OeEaC3SJds/XYiqCarbg5CsF7CI=;
 b=CiFOXG7f9vj+cpMXdebx56haYC9huEIIxCvLKQac8eJkUdfWaMde67e/R9tnNNrAChrCLeApV
 JaDXnB4fWB2B/aTLWJxUAMrm4i/MIzK8lZvNuGWFJoT2LMm/M3F2PQf
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eaac172141ede..c734d2c5790d2 100644
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

