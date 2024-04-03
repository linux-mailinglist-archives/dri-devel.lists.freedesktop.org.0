Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C480896A16
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852C1112909;
	Wed,  3 Apr 2024 09:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l2uxpM2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3B311290B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:11:23 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6eae2b57ff2so4934557b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712135483; x=1712740283; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cpjQAPGX7DRYeObxhpkzDQOHk6DN4GVEcESJCG1mUPs=;
 b=l2uxpM2Y7L7TPBt3QvkbZ2AHzg+mllWfXe9W8Hfj0LIqp1CPGEBEGDt31wEGaPEgsH
 xQ8YEa8ZYLDKzw+duaTSnIQJ3G6T8ojwmempJJJ4Jejfh/aFLbj5RMrn9cj7V+Qo3nLq
 EyK7b3vVFmUgAWUG1fs6KFuZA0xZs1tb7z87wHi4nZ2QnSzBgtgbBxnz/4vzd9fohDG4
 3AdcBWFFStX+8Aq4Bjg8vZEwQzIYJNtEPHHNp+tPrhu8rFwYs2Ex5fznBhTUbcJRaxRY
 yYN/8+P0ocdP6ciMhs5SqyZRscRHK54zRmxVcybXjkPtFpcNI/3GmQpqKg0oRzsmsEbZ
 6eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712135483; x=1712740283;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cpjQAPGX7DRYeObxhpkzDQOHk6DN4GVEcESJCG1mUPs=;
 b=jk+W7l6CmyjdggxtiT+FsZvjni1J09fnAC4OPmgG9NMOoHSg/QIxgGM6ACCEBANPTL
 Bf79OeVLW39SuUsynsyXlEDy9OY+8rfxxjLOsXnBuG6i1WR4vInGVr3FgwOnacwI3oap
 RSBP8ENM+WikcjvDzJuUeNcvAqTEQQvYFkoK1hkj789zx08Fw7cJr9D2hBZ9343PPkQK
 lm09bsdpzdmHD4JfHi0d4T+ovTwsuYqFIxA5YLhB5z9yF8baXoKdPHO7Kzar0UaTZeC2
 4SHgHltfomiZbTb6YObLGOxtkR+7JSFQ1oznScraNVID+6TnAyCtT5Tlmap/1zUumAD+
 NITg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe1oyYUnZtPsl0fwrxfJwVWnACJfVpyIWPnmI3/zZDnZqJPb2ZtJKqFB5+MZFP6nsaXz3x69OtYQfu54CWfPxV94k2wIfZNbuzYwiLzEZ1
X-Gm-Message-State: AOJu0Ywap7eu0htHvTvNVEsRvUeOCRCkLw2AEuQxrv19odHjIL/LurzP
 vJFv22Bmwbs0kASykWlTs3tp/FW/iBxnDDsvau5xSwWTR1aI4hJfeCPp4OPQQUg=
X-Google-Smtp-Source: AGHT+IHP8Wkk3WqZo2x4m5I0Y9pbkAk5VQE/2rUf71FZT7C/JxIaPYVwnEjbjC99Ufxm9f+YT9UumQ==
X-Received: by 2002:a05:6a21:7898:b0:1a1:6803:69a3 with SMTP id
 bf24-20020a056a21789800b001a1680369a3mr17535809pzc.0.1712135483394; 
 Wed, 03 Apr 2024 02:11:23 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66]) by smtp.gmail.com with ESMTPSA id
 lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:11:22 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:10:58 +0800
Subject: [PATCH v3 2/6] drm/msm/dsi: set video mode widebus enable bit when
 widebus is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-2-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=1740;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OZSNyzuYoscDY4/FYsSXzvtJ+R2/AlPvVZDPzdhQNoA=;
 b=JV2mcwgTSj/9QP/9nbeMkSLbKZiuDUzrcHQTKV/HDaoeIOw35XNohHWH854JH04Qap8uPz1qe
 a1wuJWYSr8AD07LuWLw9ySSkW0JSmM3hPE4pifrLGC76X4rSGz0MANz
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

From: Jonathan Marek <jonathan@marek.ca>

The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
driver is doing in video mode. Fix that by actually enabling widebus for
video mode.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 2a7d980e12c3..f0b3cdc020a1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
 #define DSI_VID_CFG0_HSA_POWER_STOP				0x00010000
 #define DSI_VID_CFG0_HBP_POWER_STOP				0x00100000
 #define DSI_VID_CFG0_HFP_POWER_STOP				0x01000000
+#define DSI_VID_CFG0_DATABUS_WIDEN				0x02000000
 #define DSI_VID_CFG0_PULSE_MODE_HSA_HE				0x10000000
 
 #define REG_DSI_VID_CFG1					0x0000001c
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9d86a6aca6f2..2a0422cad6de 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -754,6 +754,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
 		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
 		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
+		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
+			data |= DSI_VID_CFG0_DATABUS_WIDEN;
 		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
 
 		/* Do not swap RGB colors */

-- 
2.34.1

