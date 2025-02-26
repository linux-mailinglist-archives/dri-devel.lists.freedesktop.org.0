Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40FFA4592B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C53D10E180;
	Wed, 26 Feb 2025 08:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tv9so0/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86B810E279
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:59:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-546210287c1so6608465e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740560371; x=1741165171; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
 b=Tv9so0/br7esUuq3rQLKsHC23NPqR9oLlp16TIBXgbf1jAZSNNUzccHOvvbDlwVg8T
 ioUOuot/VCBIpU50ASK5TvK0LQ+aaHw5nFeF9RH2IWn7eESf+d/8ks4b6aVefOpqMe75
 Jt87UWz2rFCqymP+GYniMBBRk8+3qstkywegEPEt0YjlMB0X6wx850dlDLSakVritG4u
 f8iDeDTCOGDfIPXCL/nAiYjSeCJDall7mRJyWuBiYzUrkOnvHG5eKt1/Y3+QiqFut8Ek
 AUlUJ7laICpVEqzqr8wRZhY9AKlEB3AZKmvKKd2inDUrxVvYTbHvfVzYaVdu4BIwUk6i
 rh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560371; x=1741165171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
 b=ZqINtMVb74R+3zkylc+tl7JjWQ+aDCMqzm3eFNqstSrIbBwb50y+brzzN37apHKGbE
 lAG+OpGTFul6n5uiw2fGZCfy8tKMV3tZUbh7Q8fRxcZZLEHyOf5Xs9uV12C+PRL2Pr2C
 YImwnzm/z6Up0cPPLWDmq3/055oHMSe9wyogkGq+LQhwMFr9qK0UsxfvrVMaRzQXfA0v
 8FhQafp40hYhrLpp/okuUW+Kr5V9NbJpPzztKWaJJ8fr710brQUoqK2bXx7x7O1CiFa/
 IquKdIbq3FkFSi2B5IDRm1KwdrgdmEe6IkgoTziDoMdZoViQE7Jjf8pa5X0tsRrQMfye
 aEvg==
X-Gm-Message-State: AOJu0YzC9LftEm0hsytnOlytMWViQ3ESV/J0uutulPZsa4XWYMb8XCZa
 K4ODxXWDwVqlUQipTlKp7On6LNi+vAzRjcTyUH0XzrwsaiAhyKNYICWPB0w59wQ=
X-Gm-Gg: ASbGncvesV6IY6DYU5sUh4Xcc3mxU7oFmghFUAWFLR6m83v4i6zXb5ySj6aFcip4o47
 IOgs7vKN/IknevuOK4xOzMImxMLeO/G5Fb+q8jeGCBxgRxgOjMLC3g3CxWJwnDj7Iv688f8FR1F
 Spv7c+AK5+gN4lyO7OzSs1FE6Z9xFvuThLLIrBnE3BPZteJwZBVuGLH2bHlNOEjjFgOLq9vtStd
 yH8OAyZadeYY2j31CaQ+S1OcZN4JW1Ez2oLOw6bxMxcQtCR96kJVMZSSo2dbWojt7o+JjRaFJnv
 GeaLoYsMefmO3sDFqlSbvHnHvYjduzCA7A==
X-Google-Smtp-Source: AGHT+IHnyRZE9xXoxSH11WZO/mjHOb7FtOwcpzIW8SeHSDOj8wlDRd0QXQhax5YrxPLGfiQ8QHD+/g==
X-Received: by 2002:a05:6512:b98:b0:545:2c86:17e6 with SMTP id
 2adb3069b0e04-5483912fcc4mr10487208e87.5.1740560370919; 
 Wed, 26 Feb 2025 00:59:30 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:59:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:24 +0200
Subject: [PATCH v8 1/7] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-1-340af24b35cc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=f0rJpJCum+b7lqaI4sn4V9SXHt/v6K6WBKvJft3vbro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtfsfP5JOx4k9UNQsIABWXjlycLBo0B9VJPQr
 V2fMgIBoe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7AAKCRCLPIo+Aiko
 1fTVB/4gVuuKglGSNvRERQTsX298FmX2Q10UUHn8rmqstQrQ8oMQIL4EaDQp8VNkz1PLE/1bw9p
 ksul49Hd3DEFRM5mq8/7INGZ1FEwRZ7ZQr20Z1edKNZ7PUsgea7eUlODfTUbYlONna9hVUzi0yT
 t0QE8MLblgVWHsQ+oN0Wb0s64tF3dFG0Pk2n13YcIEjMvw/u6d5VEaY+ZrxkV1CV/Xs99XI/IiB
 2WhjKiDSBtHxwbDhn5hviSxdlcMDBOMhSIVKkizA6v3tscwuKGbmAAp7GIIS9skFTEo8icdswxq
 QciDiWte6IZK26X18olApN11vmF8XCRoM8ygHZC4jcZiIasf
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

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f516dfc4279d0f319ec1e5b17f240..d839c71091dcdc3b020fcbba8d698d58ee7fc749 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.5

