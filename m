Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CD5964133
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A26910E47D;
	Thu, 29 Aug 2024 10:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KtnZNMhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BB510E47F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:19:15 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7142a30e3bdso1209651b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926755; x=1725531555; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pm46gM0TTBbBdMjovlXNb5pnDJgcjv/io30h+9vcb2w=;
 b=KtnZNMhj5i4J4S9edb+MyKQWxCqN2jCOiIhAr5m0QjLVWUpGSFnAsbgIYzBzP2Fvt4
 Vf5b52Cka0Wax2ifPdrHsw6U/5JjW5q0yFxMy9zJ/OYFgQJK0WrJOHP+2VpT1Cuu/MS6
 a24p2sSnKRuHRCStaUKAkqCdSuvjB9YTXSgvN4B8eFxqJ5pf1uHPYXsSld0Zq4glLs3e
 fuaQyZR4ujmjT0pX851NyTlQoZhJ/VIf3k6t5gkLWBLptoqYq49La5ZP0b6AaExlL/r3
 HI9wHnXiCQI228DZDqrBW+5/SeRLqqa0LsfVGSGbfpfh0UVfYUP10wQqRJ9ZfBhV4VOf
 v/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926755; x=1725531555;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pm46gM0TTBbBdMjovlXNb5pnDJgcjv/io30h+9vcb2w=;
 b=JOknBQvskl0NkIa0NKdxOm9LVpLROuB0aBKfK6vjV1Pf4F6vd40+gY3EAScf4aK6zn
 VTY0GtIpR4BITM2g2i0dqup4kmtG0u2Ul+DZ2YmI6gxyn6NX+rHC/KlOd63iwmTtLLMl
 J6lGTdAqyo5g0JbN8Fv12T1BbEBs0SL9SO3eqUgBQrH4aca7dZHw+/DK6zevKn9U/jaT
 EDVN/i0sSqJiN9BgFyh9kWI1euxyticUD0921RHYtrGbpUpdWQcU0xUKn32eJeQqLtW2
 K8N/fQBLdWZt5/eXmmemt/2hn8tdv3kdIix1yF5uwIDMVWNtkoJbXIskEIm+QQTjSLex
 6CLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcQuS4n3MF4Zx4K6Ss9EJWUO8x1a/c98z+EUPY4ioC58p1uX2R3MRAWoVEEg31yqOsc+RRcNPfZY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq1LvtR5QTBB5ALTBo4Z3NvhT3IWcwkexEmzgWLeptTX/U0MSH
 /otSbyeWGNwHktENvF1/fJ+V3E2lTzybVGEXpQ3A/mdKsGseNXG7R2J8zZMmrWs=
X-Google-Smtp-Source: AGHT+IFIi/GI1xiHx4ikkWEaDUD/O7jnJJ9faqHg9EcKdEHEXIo+BEOFueQ/+R9j5m2bXWlUa+kVtA==
X-Received: by 2002:a05:6a21:458b:b0:1c4:85a2:9958 with SMTP id
 adf61e73a8af0-1cce58672eamr1524199637.25.1724926755196; 
 Thu, 29 Aug 2024 03:19:15 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:19:14 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:30 +0800
Subject: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1217;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=C1k3RPwM6WNScuAGLeEJNZ/C8SUXvF2SN04fTyxqBC4=;
 b=IL2p1n//a/cGjDAbXalP8f4Wm6zhrPhNJ5sIDGMkYy4qtn/Aw3KFCQjztAspCIV9D1mB87nyE
 sNLBBVEeWJmDVH9l6gal907ZbTHPctNj7XlZo4S7aFE/u3f8VHrLul4
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

Add support to DSI CTRL v2.8.0 with priority support

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 185d7de0bf376..6388bb12696ff 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
 	return ret;
 }
 
+#define DSI_VBIF_CTRL			(0x01CC - 4)
+#define DSI_VBIF_CTRL_PRIORITY		0x07
+
 void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
 				  u32 len)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
+	u32 reg;
 
 	dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
 	dsi_write(msm_host, REG_DSI_DMA_LEN, len);
+	if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
+		reg = dsi_read(msm_host, DSI_VBIF_CTRL);
+		reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
+		dsi_write(msm_host, DSI_VBIF_CTRL, reg);
+	}
 	dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
 
 	/* Make sure trigger happens */

-- 
2.34.1

