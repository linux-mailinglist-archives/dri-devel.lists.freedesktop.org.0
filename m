Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E276CA1BE24
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 22:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BDC10EA48;
	Fri, 24 Jan 2025 21:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mN3jSTHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C274110EA2C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 21:47:55 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so2296284e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737755274; x=1738360074; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IlR9NecrQCHXfPm/fpyP+/Z9eRiAzSSG5PW1LZdxCBM=;
 b=mN3jSTHFZkK7XFN0MXRAT3TcHHkUTSbZ3v1ZE4Mg6V4BKKL/QdOQBOXacm4lgSVV2t
 AVfzfDKGMmXsy34uIxbcG0vWyFVkDQKrXr9K+vkEcisegL33fuVEk2qJ1X+nY1QGBR6P
 ovyXON9ySOp5MqW9Z3puCyvd7O2ive3pS9XKdQE/oa/s+tz98j4UclVNqESCVtfeD7jF
 6YKK0occaF3d13ONHMB9PbMt7yta1LjBfreq5rsFGKWjwxNLFPe58FLAhL0//DEJMIzL
 e7fhigNL+7CcnT9+eVwTFXy8qU+HxRo8zfstbGH8lIeL02BdAF+QdZ6DYaEL9ihuNoDC
 Zp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737755274; x=1738360074;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IlR9NecrQCHXfPm/fpyP+/Z9eRiAzSSG5PW1LZdxCBM=;
 b=ieRs6QC7epYWu4znAPZSHw63gHE/BsYOjXFhfhRxjaHpCImKNt90mXK0LCDyUZ9pl9
 MX+jETg3QHSiH6shGFMyTumLlVBnWp9TGvDJzeG4gpGWfJdu51D8CaieCCyDjfB72jCT
 jd2pTB0JXGJDT33L+bP5zDR3Mfjzc4bf/iSfmQCmDOEmW+4kRwEZlL6pjsTDQZ6mCkCP
 YLv1bIyfVXw65plQYVZjmWjnCQ3bJD75K0OES6z31ZmQXHhVdixe2GCIyrxhPInFwT51
 VqBiMIgZhiKlcAnx+YtRckHWEJ81T6FmNfXCVIYfpEX3jiS8J9pE8dL614eZdK3fKmMl
 sJWg==
X-Gm-Message-State: AOJu0Yxc6iGTA/W6bFtSmz0JXqis04Rxxs8ekGQwW0gRJ9JPdmABuZNA
 n6tcPGUbL4zyLB2zzkRoAhatVmV3fl/c6GWa/z56xdhxb3q8VMer6qi+ve8w05E=
X-Gm-Gg: ASbGncvr49RrXc0vBOGH9KRsIiXLUsnCEPMOfDRgdabM62WdRqiS1yA7EWiaOpB8SE7
 89LQjyIbqulPYGN2afRFlmjHHmrqUnKJTVw62XbV2i9U3o1sand52Qg11JbWYrPgv4w2UJ1AZ9q
 +O7juQzPeXhf2W3ZdaT17+71McpztHm9Ej800gmBk3/xiNaB+vduCvoe8RtnpnzAzLoa4Dk2ue6
 N2u2jCExNQIaw7rKtRNPZykbvzgFAMoqTOIGlYLov94/CHJxgCfyfZNF2z/PBOWi8zHa7KdYBso
 7+Q404+9Z0sO
X-Google-Smtp-Source: AGHT+IGXL+mj9oYDRst1LN9GviPtKEUadsXKdC3ORUDf96ArRikq4g85LQu+uRln0PDevFa/gzjLMA==
X-Received: by 2002:a05:6512:281c:b0:542:2ef4:4884 with SMTP id
 2adb3069b0e04-5439c224ab8mr11127686e87.19.1737755273958; 
 Fri, 24 Jan 2025 13:47:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:47:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:44 +0200
Subject: [PATCH v6 4/7] drm/msm/hdmi: get rid of hdmi_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-4-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aou3NZ2IsnAD5iGdPhnxU9pcbpVRM8SciayIVBJPtQw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/oUrgbxWJ55MZdkS9mnekqdLJHVbzTZveFtmTCLsqCqW
 aRXgGsnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbSd5SDYYH05YleLerx68uc
 rGSavuRH8H3hNTjz6f+BcO5bOnt8FMs2CC9nvvJo9V+PN6UXEy+y+vx45cMiJHdXw231FinJQ//
 Pvf28Mvana49Sv8YZzxWF29S8tqktdbo48f7W1wcOi/vVfo3c9nVR1/bMfS3OEV/y6oLerNfRj+
 DKO9wz5cfcOQ8iCg57267yWlYmUV6nLTbj05bFm2eabNnWr5tervRhZnvcEw4+O46Dj5PO5rw42
 7HvX4awX3iUSHR/lHLY0awM5g1GZtHTkw+uldlzqeeB2PLW5Q66H65wtRfLfPi4ecbO4hKxcqMZ
 jx1z+yV/PcjVD41rYe3z1JWOF1j1uzcoOf4q8yTlb6rsAA==
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

Use connector->display_info.is_hdmi instead of manually using
drm_detect_hdmi_monitor().

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 11 -----------
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b14205cb9e977edd0d849e0eafe9b69c0da594bd..6b77e0fb8d5ec218dfbf58215e2e12ad1dfb1b85 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -25,7 +25,7 @@ void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	if (power_on) {
 		ctrl |= HDMI_CTRL_ENABLE;
-		if (!hdmi->hdmi_mode) {
+		if (!hdmi->connector->display_info.is_hdmi) {
 			ctrl |= HDMI_CTRL_HDMI;
 			hdmi_write(hdmi, REG_HDMI_CTRL, ctrl);
 			ctrl &= ~HDMI_CTRL_HDMI;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 53b52351d0eddf4a5c87a5290016bb53ed4d29f7..ab169b77377097dc22c0c718f65024cb8ad1d317 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -67,8 +67,6 @@ struct hdmi {
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-	bool hdmi_mode;               /* are we in hdmi mode? */
-
 	int irq;
 	struct workqueue_struct *workq;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 168b4104e705e8217f5d7ca5f902d7557c55ae24..d2b25bcd8eb8f5cf4623e11c87ac5eea6e4b363d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -331,17 +331,6 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: This should use connector->display_info.is_hdmi from a
-		 * path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
-	}
-
 	return drm_edid;
 }
 

-- 
2.39.5

