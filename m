Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA657A4592E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FC210E86C;
	Wed, 26 Feb 2025 08:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V1ozgRN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABFE10E180
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:59:35 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30a3092a9ebso74652721fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740560373; x=1741165173; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a0zF5icXRhGBS22oaTFCfeFkUWLVA/EPLQBHYWMqBLg=;
 b=V1ozgRN1r7d2jk4g1c2V9oe1RlqNS0lx5Yb6WkZpT8JrQWKv8qgXCTBP5ByGpIwPyJ
 IfbF1vSKv4lqa4YLQvLMmgRIF6dUjwrQMRn7lMG2WxZurmbS/HjGeVQbTTU2/aodRmRu
 49tm2FaZjb4BGsXmX8nBhhkCuWdCQTPWCDAwwp2SS7iUUGnrWbvYlGvarLWNQGsmvooK
 gzwxZYEo4xuLbU3ibyajCp3WZ0nqVA63rdBmg+yUcMrLh7cdqd/hQYXSNgWvBFte3Sns
 Uv/C8D+rN86TTe5bkQc0JTZoWuxhq91/ZyFLp5zOsT9pRWbnaJWbLAbLh4qW9/kazevI
 2krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560373; x=1741165173;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0zF5icXRhGBS22oaTFCfeFkUWLVA/EPLQBHYWMqBLg=;
 b=TZqa/eEnL9ZPChrpm/yqchLqCCvjTsYyXaXOUtyfrgs1dZdR/XqQDJEDmQqTDk5VKw
 UXrzI7BsI27Ya5CxYC5chHihOuEAF/c9C0u2Wu2qp+5D63eQ+UuMYFcQl/ZlZx3MHpax
 uxPJlotSGcXciln6ib++39aN5ZcesLV6JAwfiROl7q+yBvH+QHA+lJLCYinWTfEw4rXq
 P0Vt1drjFeTe8quFsBm895i2CsmdIggKpOjn13MBFXAtrlj0Ifd91sB+MSMPDgnXw3vD
 osvBUMNHiKKn6wJbAb54bnyh5b66rOXfNvX15m6K2y473JFd/Xb3Vf/HTr07bWjyXOUw
 1hlg==
X-Gm-Message-State: AOJu0YwelZsWWNnna4/R4a6H4Kw9WL8kGyWw2bK4seYh1vU733v/6U3x
 sZlf05sZVyYL4LYrRoZK7dHtSXfwf5lYIRpCVQ34jyvcNOcpasbQqJdzSdmuRGw=
X-Gm-Gg: ASbGnctXOun92pDvFXEItdKl6Kmvge0y1Z18LMT4lvoEeLgllVPbN8asXINSXnEADFe
 aY9SyzDynlZTDcMiBqtt9fwjlE5jY3AecmCUYs9X0WMfaiuIbDMjsSBiedgVFWzQDrNniEdkgGR
 4tRL6wzExUWf96l+h/N9vUM6pXaG4c+evFVm67OF1tNZnhEEPe5ZcJzEUesaykIQYVxk4NXJJD3
 Jn3WFH2DX2oOTTHFFdI+i6gEALFd61HhS9Jo0dFor4BsBn4IyZOsn9Ok66lOBdqtieGoKXfz3PD
 3nWnb0YrFbqCqxdGFzea1PBbIRNVnJfAnQ==
X-Google-Smtp-Source: AGHT+IHD8l95g4vI1vyQEz00LSL+SoA+aEIpEPr9+UtIPsacpfC1JVUKJm5+nMQSBt4UshFzPla3jA==
X-Received: by 2002:a2e:96d0:0:b0:309:22ae:a6b3 with SMTP id
 38308e7fff4ca-30a5b1a091amr89275911fa.18.1740560373370; 
 Wed, 26 Feb 2025 00:59:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:59:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:25 +0200
Subject: [PATCH v8 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-2-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m2TAoFMN3euF4DkEUBd426Xr5dS2tnI3Q7ZEQxtygnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtfsOMZUZw+aUfLC3KFwKH0V9adcdPsnFq/AF
 fHNBmGlMgKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7AAKCRCLPIo+Aiko
 1QaeCACEYYfh387FH+3M3cQHalQXk1AtFjbNI6xiNZkRNKKopeEywYblNV5zpUeCbgo0mARh2Mf
 hI68MqC8xQYbyIbvHvDpdUG3IQUxTgsdFOsUuYTxyw//MR3HqEvHlAe3RrOaIWboglM1kI2xemN
 akRMDiF+u4GzVp8FuwJcrZxPREePgMkEBOUCF9vjzqlqoi1svME1LLCUOQkq2XSnYXskH/eAzSD
 K+1MBc65J+fYPhW8cRWvNOhsty9KRBCngYpXpaHwggnC0XRbtUV2Nlix/IKOrnp/m7ywA3gf4Rm
 Kg58VWf8Vl0rggm5UUNuQ2kAGLUWXUT5OAKtZ3NYlMO5pfsA
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

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
that HDMI timings should be programmed before setting up HDMI PHY and
PLL. Rework the code to program HDMI timings at the start of
atomic_pre_enable().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dcdc3b020fcbba8d698d58ee7fc749..bd94b3a70f0e5e457a88f089b491103a8c09567b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,15 +126,29 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
+static void msm_hdmi_set_timings(struct hdmi *hdmi,
+				 const struct drm_display_mode *mode);
+
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 
 	DBG("power up");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+
+	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
+
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
@@ -177,17 +191,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	}
 }
 
-static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-		 const struct drm_display_mode *mode,
-		 const struct drm_display_mode *adjusted_mode)
+static void msm_hdmi_set_timings(struct hdmi *hdmi,
+				 const struct drm_display_mode *mode)
 {
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	int hstart, hend, vstart, vend;
 	uint32_t frame_ctrl;
 
-	mode = adjusted_mode;
-
 	hdmi->pixclock = mode->clock * 1000;
 
 	hstart = mode->htotal - mode->hsync_start;
@@ -306,7 +315,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.5

