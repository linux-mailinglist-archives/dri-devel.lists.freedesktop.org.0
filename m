Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB29D5B91
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1142410EB0B;
	Fri, 22 Nov 2024 09:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TLBLh4/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BF610EB0B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:33 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ffab850d74so408881fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266812; x=1732871612; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
 b=TLBLh4/a9JE3tZNZLAyuXC8dqLyewqsL72BxRTu/TfqCPpzoCy8INbb6mrte6wzDb/
 pdiUp+t8MehkNqEc8aN7GjCmtlHxrg2RSfm+DQD89kqnLR6U7MjSimTNdzQR9B6l0FhY
 rBK3j7sebsxu4cmB3gvdvE5Ng4s5QG7zcnTrJfFs+n1oojEuWcOLnlX2WXis7v8wCHEp
 6QTNFPh+e/zTAKum46naLhc6d9s1zi1DoyJQEFosM0+SE7+XO+w8lRtaES0qDMu2uaH0
 O3kopBUnBAONX3WaeI/nM7C6jvTFEelGlOJNGqLsfAQS13d71kcN4HT8e9iCfaEqG8Xg
 dtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266812; x=1732871612;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
 b=PnNdTqgIJvhtrGLIzVe6m/1KpXbmUiWeo84bvOGE0qE2ddNpkL0IMFA3Wr2iZbm4ms
 WDXTgGrX/rQeJFky91nkPgiH4YeELDJxd48Nyhm6x1U3raUB/pakBlNbQWwaGuYMEamm
 B4x8Vaf0jdxSAI8RKIC2JIyW9CG5p44wTYOeOoU75kwed6gwaY7Cqrt55MxeoL2JUvzP
 M3bzKsYafyjpXjSNFriUJFoEqOhY1U7fHMrkCOJKHiJaNHNG0YNIkmgGua45geOsa1PG
 ouma0iVVI+e/kpB1EkQLP2tfwkLlH3FjZ4UukIPMG1EBgPs4NdrfBeOsVofoAOdY2qpj
 XfMw==
X-Gm-Message-State: AOJu0YxrvEpn2RNQm5j0i9x+OKFIZjCDR0wGhoDXT33tmTWfTk0/ra/j
 o/uBcG2v/eGb3EllQ8o3wJu3abTryXlX2MuYrMJ/FCd1Jl0zVmI/4OBN53fSsdU=
X-Gm-Gg: ASbGncvjRY5dQabjDWGCDHPhcyjLJ+iUPEqbU8+hpzV7FL1F6P5IZr4hFFw0jCnfSv2
 tfmRF36IRNP1J1BBuYrQXRqjlSdQQojZ8Rj5/dMRG05m2kYv7SEWjiiHELhbo+5vySqkgXDtS0I
 6nCpA8l1mo9oJ39z29gC4hVre3V6p8TaB2nNFPvM7BTRRAUajSxuxyvbW/5ZVC/9/2Ed+xyM9qr
 Em9IWmikfPOdBNYz3KNA8WtYF++p9rm1dEtdPtxDQPa839dclApfkjoSQ==
X-Google-Smtp-Source: AGHT+IGDeNFqG4MBKTEb+7vEM0EHIe+kSHIzZU4cqUcGBYdZXfjh6XYO9X/0YkMh3CxsrBHQKu0dXQ==
X-Received: by 2002:a05:6512:ea2:b0:53d:c9ae:a978 with SMTP id
 2adb3069b0e04-53dd29c2410mr650169e87.4.1732266811943; 
 Fri, 22 Nov 2024 01:13:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:05 +0200
Subject: [PATCH v4 09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-9-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsinpLwtf2P+iapQrUkEDkXySbQ1SEGNPG+E
 yMN1AXKzKeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1UAWB/wNkyuzaaWNjb3TQ3pzTEcHC7B/Rpy9L6BOjIvOeuTqTWll9d3zLo9QEE1PDxJLav2S509
 /GcNdsoEza+Au8Yx2/cJRv0J8J0BcqhPP6v01atHSxQ/lQESAhnjtbezigKj5F6augKx4qn+hBU
 05oVtI6caS1lItX/bI51kj0LEdFXBhJhBE6wQ8+jdC/YQiN6kTW7lFsat02wgdaeNGebhcNB3x5
 S4eJMeHGa15XNxAzBSWFbFzktMTFpbMpPra4zPxZpisIFGPMIpdwOSUiRLCP8Z24s4vpMhROld2
 EsX+4FEudWGB4pshKsMVn0Zbj+v8pVuawOqXGg9LMIj+ZYLn
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

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5

