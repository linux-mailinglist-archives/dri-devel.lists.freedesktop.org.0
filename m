Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72E8B9A795
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6C310E751;
	Wed, 24 Sep 2025 15:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ICD0vnNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0364510E752
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 15:08:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-267facf9b58so50846745ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758726529; x=1759331329; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Mtm7YfP7BSI3RTZ9+FG8XqmZhlh22m357qfVk/qkxE8=;
 b=ICD0vnNKu2dtpNpU2YxV/VUHAdK7g1p6tU3YjDmGLB2OxjEQNSYCpqFWqLcziZLCwS
 c50tlOEo2o+Q5olB6MrVh7vriMBIS1CTcWJc8LTJ51oXV6FhceqOgJl9wyqFxXSSR/h6
 tyGw6YuoslmURVI32FEmb+edjOr6pfPvT4J6SXoM3FlV/B2O1GxK6mCEWherRV0YJ3Ru
 zsAexAinfVnTrsf95FNvYtfKFZuPUOt9YrwnxjAhCuUu/zoxYK6lK67wb3yhYR41QVcD
 pYy9TQAyVnLf4L9GhEW4um+WFEF59FAvFy3L/JPchVkhKTU6VOPQMT0CPyDyroWjalLl
 SzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758726529; x=1759331329;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mtm7YfP7BSI3RTZ9+FG8XqmZhlh22m357qfVk/qkxE8=;
 b=dvDCZdudKJ/7hWUn4akPgPAvXnuJYmpxWiEuOB+W0dPdb2yAhhkzD1WKj/HH6hvgQd
 cMciVtLKfh3yhlXvN5SVbiSO8OgXZ1oZJyfzC7Mvi6lePNFeX4CuwPchFkgYxyyDmyrS
 bVHS4s6iQThJIKACTJrjfIirp+7CYgaWECCDfaO9UCMt8oFjS9wU2d/FWDNpCm1CvLZ8
 yLWTmHctJmMs2tH4SuqhyIdUbVUECpsrBjPLVI9+2tUUzZoxEIDJtXFW3ck0FYq7skUn
 ZyPFfuAa5pg2gIoBAZ/T7+sfV1w5V7y8pff1rJj3fSjSk/H0r8rP4utLHGyacjy4IUSN
 ++Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoXWbELQK1U5ahHphQ8zpx+fmLlNQdRGYF+Fm9phxwUCERFPYPDjbEvHBwQv/Rka3jldtvkdUPJmI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVsu0OjFtHKuJdrAdzhD3kPLkaXFg8qYKOgjI6QVXCcwQdP8zs
 WHy9gOj9BEk7YCyHjDJ/leI2dgVZPoIj1H79bwVdak9G1+Sf/vkBj9fCpH1vJ+Y5WUE=
X-Gm-Gg: ASbGncth52dJkyoODE0x2KlvALsYaPe2hy0OXGAa73pET21NtXfb1dUKgcdX04tIL0+
 VQivRVbtN+zc3/1WE2IZRaIpSABxnu3WyZ6cfjIlkxKSY8YRRV456wuCFVt4UNhK1RIjC38XXLj
 kFzih7TLtqiq3uCq1JL9uP1wALD7rJzUYdoc9ZI1e0ajr8msI2BHd+amqUdOR72MBKCoZkbub/o
 eEXZyWHjMaF+khVxu9mU6BonYSixE8amhee5q4VoPgOfRxMKzdP+8NSdix5jYqIy2ebxnRLLnNf
 zAaTmxgQainbJJAH8YvKpnQvUhu+eaOfb9FxvUSnokDEG0ug0zhi+029BQ4c7aRvQllGziu0ucg
 Zh6fRBQDWco/lMkm0
X-Google-Smtp-Source: AGHT+IEEfbkQbo6VyHZL6DNe6uKS5V8miS4VoGJIvm14SbYPZxktKLOnaj7fLoQ1xnJPrs48EB5euw==
X-Received: by 2002:a17:902:c409:b0:269:96db:939 with SMTP id
 d9443c01a7336-27ed4af3882mr21675ad.58.1758726529408; 
 Wed, 24 Sep 2025 08:08:49 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26b59d6538bsm158717445ad.82.2025.09.24.08.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 08:08:49 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 24 Sep 2025 23:08:12 +0800
Subject: [PATCH v3 3/3] drm/msm/dsi: Support dual panel use case with
 single CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-dsi-dual-panel-upstream-v3-3-6927284f1098@linaro.org>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726499; l=3407;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=uv//tTQkdWUOMylUjOz31Zc7MGTY0kN4NR2rEqP2pKI=;
 b=cbwhi38kXfeCUrP4iZc3vGzSS+7SXsK87SMxbLuZ9SDfEikysPiAQH8mgdl2o1BXHWxilRTI6
 p1c+UJbkOexAxVBPSqmtKoMbjP0ZBRrXe9yAPnK5V74UKYdfcPyy0MI
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

Support a hardware configuration where two independent DSI panels are
driven by a single, synchronous CRTC. This configuration uses a bonded
DSI link to provide a unified vblank for both displays.

This allows application software to treat the two displays as a single,
wide framebuffer with a synchronized refresh cycle, simplifying rendering
logic for side-by-side panel arrangements.

At the DSI host level, the frame width for each link must be that of an
individual panel. The driver therefore halves the CRTC's horizontal
resolution before configuring the DSI host and any DSC encoders, ensuring
each panel receives the correct half of the framebuffer.

While the DSI panel driver should manage two panels togehter.
1. During probe, the driver finds the sibling dsi host via device tree
phandle and register the 2nd panel to get another mipi_dsi_device.
2. Set dual_panel flag on both mipi_dsi_device.
3. Prepare DSC data per requirement from single panel.
4. All DSI commands should be send on every DSI link.
5. Handle power supply for 2 panels in one shot, the same is true to
   brightness.
6. From the CRTC's perspective, the two panels appear as one wide display.
   The driver exposes a DRM mode where the horizontal timings (hdisplay,
   hsync_start, etc.) are doubled, while the vertical timings remain those
   of a single panel. Because 2 panels are expected to be mounted in
   left/right position.

To maintain synchronization, both DSI links are configured to share a
single clock source, with the DSI1 controller using the clock provided
to DSI0 as below.

&mdss_dsi1 {
   assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
		     <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
   assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
}

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index de51cb02f267205320c5a94fc4188413e05907e6..1fddcea7f86547258be18a51a0a3e3f96f6c3838 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -177,6 +177,7 @@ struct msm_dsi_host {
 	bool registered;
 	bool power_on;
 	bool enabled;
+	bool is_dual_panel;
 	int irq;
 };
 
@@ -935,7 +936,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			return;
 		}
 
-		dsc->pic_width = mode->hdisplay;
+		if (msm_host->is_dual_panel)
+			dsc->pic_width = hdisplay;
+		else
+			dsc->pic_width = mode->hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
@@ -1609,6 +1613,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (dsi->lanes > msm_host->num_data_lanes)
 		return -EINVAL;
 
+	msm_host->is_dual_panel = dsi->dual_panel;
 	msm_host->channel = dsi->channel;
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
@@ -2492,6 +2497,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 	if (!msm_host->dsc)
 		return MODE_OK;
 
+	if (msm_host->is_dual_panel)
+		pic_width = mode->hdisplay / 2;
+
 	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
 		       pic_width, dsc->slice_width);

-- 
2.34.1

