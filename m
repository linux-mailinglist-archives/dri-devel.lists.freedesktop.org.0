Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F228D0362
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E007110F450;
	Mon, 27 May 2024 14:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dFbFVzRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F9010EEBE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:23:45 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6f8ecafd28cso2629592b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716819825; x=1717424625; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9zZvfy4gBMpippgmQ5wbc8/FSu6Fg33BHDu+XbQ+New=;
 b=dFbFVzRonwodbZ401VfzXYhe3jyd8HXaX2lK1oOru0ANRjvevGHJfhoNodGvHBNFJC
 FRxjqh3WQ6ioaKth8xXhG9PhFCaY/VWK3xrPjFsR+un6+HRy0njc9DtAZJ8DNZBWFVWN
 U2S6BAhUalocQGCDT6UKYe7OBcix8orZbqn0ZHvWMPZQ73DdGSVRJ8iTPQ20Gyre2x+Z
 WJ3CwbDAa6mY+mLPV0+Wd8QC90n9lXHG+Wl/eHV7Jr1YH1de4DOFxAtGTjTtY13zsd5g
 vT0LOd3eGnzOT/rY4okYzFeOBx4QyoJie11MWNlxrd9uxmH9viMvplmSoGddIMGsTi9U
 f2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716819825; x=1717424625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zZvfy4gBMpippgmQ5wbc8/FSu6Fg33BHDu+XbQ+New=;
 b=MQjnKZNgGpdz3EYoBIzXQko7F/6TyTFq93nAyM69670vo1SscyLnGmPzIpkid5mFNP
 k5T/xaL59jfndqCnr+rW3b0PZ5zoDsiME7QBX2ObKqJbOcJy3qmGIxHyAtq4299iiaGz
 /6mOJfGXfS+9S7cWNT1YknDXbO1PnPmS4d41s7vdJ6+jn+9ANKty117OTDBvlTRBEnXs
 y+Txeb81ao+P6474DfCCZILVDg+i/eeAMqG7xWm/tA2fAPNm/pq9qJIqrGlQoz0stAlM
 0cBAuq00Q6e1WqqZ1HNQIwI68hknd0mGdg59qF/f6Cs93InVBxJUoXdgM44Yl7tC9Mm4
 4szw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUocQb8aLRcZ9Hf+itGsxQYiv8ghaZv1DnaCeFl1jEOiReFbWx3/lzEgk35P3GGmj8vY8X5r/fXgOMeDeioVeCosd3GEV8qHQMmalz7p/u4
X-Gm-Message-State: AOJu0Yw6WeGLh2h2RerSHA+FiHyD+ynpc0hkNP7tXemceGAbjIEbD1Sc
 zinzXXV5bjvMn+i5V/axijb9IO+dzFcZ1kogX8xDn7ow137h6a0rT2PbF48TNbk=
X-Google-Smtp-Source: AGHT+IFNKaRSlZszopjikYU0pMskYc/ekBfYriMXVMO/i95lcWdRC6YJKq+hsm5J3tzzdDaM/zWi/Q==
X-Received: by 2002:a05:6a20:72a6:b0:1af:a45a:a8de with SMTP id
 adf61e73a8af0-1b212d5aa97mr11310422637.5.1716819824793; 
 Mon, 27 May 2024 07:23:44 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:23:44 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:49 +0800
Subject: [PATCH v5 3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=886;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=puwV6VMl3Gje+6cIe4adoHwyL8CXWB3PvIs7MINp1lg=;
 b=ZogImoZXzCH580LPFWHl29ocg7xqFmLTY0xbQUs0QVH/Rf4R1calGI+KqzyIgCRbmiPD8fn9V
 6qwpylPoVrBBEX6cdG8aua9l2xblGmOgNFwbUeRWLLOM6Wl0yuwy7Ny
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

Enable compression bit in cfg2 register for DSC in the DSI case

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index f97221423249..34bfcfba3df2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -177,6 +177,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	if (p->wide_bus_en && !dp_intf)
 		data_width = p->width >> 1;
 
+	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
+	if (p->compression_en && !dp_intf)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 

-- 
2.34.1

