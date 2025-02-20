Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C5FA3D5FF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF0610E90C;
	Thu, 20 Feb 2025 10:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x1q+8DZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAA010E90D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:08:17 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2f9b9c0088fso1305676a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740046097; x=1740650897; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K2bbvpaMxnQ9ItTta/5Hoc0GpndlEEH7ZCqt3McNEd4=;
 b=x1q+8DZCE99VZv3UPdOJ0SuKzvAVC6ZJXBKTINE7S8bgeEClUhMKhjDA2Q3ZV4m7NO
 q9E5mQ1M+/cvFGNKbzLjZSaPMJW9kOfb5CtAuwlPDnjwpzg4THz4xioMvVgodX/Qx8gd
 YbRI5fhYXI2NXQcByuyoqAvQEo021FRTbKr7+y/m/FHexqhsrmxHub4QJbEI+8/Agp/m
 b+Wo+78mmmvWgAbOZO6GcEbrRoEwsMwE2ibz0l6jezeAwdBsQmy+WIPJkVn7Buu5w+hh
 DAKsms0qePrIplMVqNrpZzdNdA14jhKGldGxwqljM+t2Q7qptQKzecFrAFFCDeAhoL/Z
 yy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740046097; x=1740650897;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2bbvpaMxnQ9ItTta/5Hoc0GpndlEEH7ZCqt3McNEd4=;
 b=Zdv8/tVF6lOlJ4UQBx7/eNNpTACu7nysK5qNsaIw/w9jXJpVaT+bArnDYI4Evh4Qq6
 twO93jrmgc4stL0xlVJVIKnPE90H5ersW03en4ou+rFvuSWM2Hu2WJ+qTcqMArExEqn2
 N8nTT8JFw/tqrTjWbODcefhmdrBQC4EOTh6K1tLsgFlLLA/d6BY8BamEXNoIvk+zBaKK
 rtYZbuZNb0z3TTZbNUCdwhVtWRBH290y1IU1FB201BwFBRY2NSxQ9pVoTrAFby/vVTx0
 56hj2XRPUX80kbuCycT1PaVdeHg6N+CyyPNbB5sOgiTChfSvbSgN6yoliM2p7EwkM8Dd
 njhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWLS8B0Ek/eKmaOvX0DMc3nplD79G/i8gK8SvHs0hCXyxovkk3NdTC9RiyIgRDwx8KJNrY8bCPjK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaxwL31IiD5teU7zJiG4h9MDxal8uKxfkjuTR3mDsQyVwwXWNU
 85mDcV5RWdOWDsx7PtY8gGiD8P+/FOrs8OM7MXG4Q4MTlI3suilLTou4w8DF7v4=
X-Gm-Gg: ASbGncsOG9mq/j8u2Qq7O77iWRGZX3rkWQBaHKaUKXGdYVQqmpOxyA4OUi0B9sdl/dz
 41Qs3v97kFJ24WTQyILxe2DjpQXOwaNukU70zmJ2kf1xYuHgThMGybFn+1WpBiiMpzSJCDWiPNJ
 oDygQXaBHLVIBqn4vlOKH5QberxBqamaWo3C7fctKwr2OgN7gY6G6BASHeBbJLEgav24gHXUCQD
 D3RLjQ/92v4LNZzNH+csWiWtFUZFyG/FcMUufVVlkzqo2TWS1g8JaE2bq4H953ELuTcR8b1uFDH
 2Dl8wwdHjWx3
X-Google-Smtp-Source: AGHT+IHCE4RtRNEXKZoOaSDN6mdrpoY8L7CkHQP/kzENk3sqFeSHV34QzJKi6JsrMhW9w9ua07iDCQ==
X-Received: by 2002:a17:90a:d445:b0:2fa:21d3:4332 with SMTP id
 98e67ed59e1d1-2fccc97dfe7mr4597618a91.12.1740046097223; 
 Thu, 20 Feb 2025 02:08:17 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:08:16 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 18:07:52 +0800
Subject: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
In-Reply-To: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=1578;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=lyKLAJr554JAOHjjCnxBQz5CBxEAxvVfUFObcdY1ag4=;
 b=m9wZrPVBSR+QFJ2DUz/SNoHz3xMrc85nVdPM1VuwlkkM2KmcuqsZt4IzPpcd3vqZEPukV8UFz
 Q1wZLZvkNnCDMVDPFv4QVErnUTSQ+9VvDwTKh1lvQQdWOSoY1Qs3jj7
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

This change originates from the Qualcomm Android Linux driver. It is
essential to support a dual-DSI configuration with two panels in
some circumstances per testing. As the name suggests, this modification
may enhance the bandwidth robustness of a bus.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8e3ff395486c0b4898 100644
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

