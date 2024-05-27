Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DB38D035E
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6FE10ED0D;
	Mon, 27 May 2024 14:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A0VOoaUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC1E10ED0D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:23:38 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6f8e98784b3so2441037b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716819818; x=1717424618; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=or9AvWwVuKmZ+9fVlUmm74FcJvOEhh8SwrrrpYlBRos=;
 b=A0VOoaUCkYq1+FruqzWNH6kFcTEdV1A7N3DdXPQcUVcVz8HhSCGVcnpLBh9Y6xc3+K
 YB4/7vms/zub+060kp1OYcQ7947t8jpGs1FdJ4a2f/ZbkVnryfQZpSrBmKeDv2zpvMSe
 WRT4kXCnsx8mcUJ1+rk35ThL2z0Qcot22wreqeV8CKpeVWA3lP3YifvqPsWA9NZ/Kfbd
 YRw8Dyq1tsBtBXexvVXjQbnWzF/aoy1GfDImpFDnDv7ibZPWGwLsbfRXbPhWQ2KgDMmp
 7dhw7hLIC5HbtXeHY1QA6xs7vxcolY6wiahZN6vL/g1q1lzAhj8a7Eey4AFAJI9Ncfvx
 Xkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716819818; x=1717424618;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=or9AvWwVuKmZ+9fVlUmm74FcJvOEhh8SwrrrpYlBRos=;
 b=EwYxWdFnFjjeaSYSkPFwJtyD8fuCkqYVnPDDlNlBRqSA+yQENXBo99nhb/wAp0ZG8I
 GLwpOTO2hFUXT0IM+Dn12aDb6sHcMMWIbPOXFXuVkqpTldQ1ivO7TZ5XW1CgjowRjejk
 X1dfYT2KdO3/4bUiXvRqdu8qNIVNRnAbJOEJ9XKpelyI/pcjbS5uAHHWQpUTXoK+5QW8
 u0eE2zHHOtwJxOq/YiPbWoT3Her0o41El+MSvWfhzHfASlkzXeJCEJL7u1NkovFbHrLx
 vrRNJDdTmyMW04TeqnA0UYxEXVpMpSl54Gw9zzAf+qCio2huCBY76OcjbqQf0OHhUWtK
 D3Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX61JhQ1uEuaHyBuaol2G+mj7oCpBUEeSN8sTMo3GRtWChCnUeGkKKFEGflB3NoEQYUtVLL5TwXJ/2UPltHrFVztRG+hraRvbk8bhfKqE3V
X-Gm-Message-State: AOJu0YxhiFrNLlW8ceRIrvisrizX+iBeCr2g30l3CKVIzVzHeaVIhPIg
 xAs5eZNLuP7XliH+5hO1D/PELvtqO6+3pcaaTUBhFUFshOYYgFlLrkOpHIw7Lbg=
X-Google-Smtp-Source: AGHT+IG5s0Nx0z1cNOvoX29tySD1dcKs02n2sVztOhjJ9jVpF8k3LNAXLHRmrH7DYpDq8Rlpg8Kfdw==
X-Received: by 2002:a05:6a00:1f0f:b0:6f8:c476:4a7c with SMTP id
 d2e1a72fcca58-6f8f2d6ad6amr9840061b3a.9.1716819818292; 
 Mon, 27 May 2024 07:23:38 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:23:37 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:48 +0800
Subject: [PATCH v5 2/6] drm/msm/dpu: adjust data width for widen bus case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-2-f797ffba4682@linaro.org>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=1032;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=jIW+hVQ5X0Zur669tpB4Gs4vZvbIu7XObZH+l6jhkHM=;
 b=ZW/KEuf6tsdQf0Sk0wk5BACoDmI2+DpY51Q4pwE0OKKXu364y9sAhtTGrFFKHEQ79OwXPuh2F
 xX2RHPQo34GDpKQvAZ4eNpMtIVTlQepkOvcKf8rkEpVIRCgHs6R/TDt
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

data is valid for only half the active window if widebus
is enabled

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 225c1c7768ff..f97221423249 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -168,6 +168,15 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	data_width = p->width;
 
+	/*
+	 * If widebus is enabled, data is valid for only half the active window
+	 * since the data rate is doubled in this mode. But for the compression
+	 * mode in DP case, the p->width is already adjusted in
+	 * drm_mode_to_intf_timing_params()
+	 */
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 

-- 
2.34.1

