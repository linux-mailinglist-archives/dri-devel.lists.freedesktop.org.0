Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956238947FE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 01:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7275B10F6B7;
	Mon,  1 Apr 2024 23:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sm2Nb8sS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440A210F69A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 23:51:18 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-513e89d0816so5322463e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 16:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712015476; x=1712620276; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aWH1PpmsAIit2qpLVPFipp6RvFkcic0ChCVLomLjuIA=;
 b=sm2Nb8sSl7x7kPvu3m+WYrP+xYO75knbyE+yx0jiw+goBSSMi1FfD9RujKnUlqxSXB
 KNEcrhOEq3NMW9Y4wDLolFhkTwD6Z2Y2kTG8MyZGyT0JNvE4/IrclQsKLfHphvFXpFGY
 Hm4MkPpQ4ONJEiHOlg8Zep6ZlzxiM57pcWfgTkp5Q8mufob36/OSMNVSpUz0V2PfyaYR
 8PNNe2j0POLrb1UMhXe+yDQ7vC7yQAMfAeUwgs9/niNZfxuoRcAMhLqTqHR0+RrFVl8S
 cFrKaDy/8msYKUNmVslRUok96G/wvzKPqXww6DA30RsQwf6zMFgKnl1sZOXajt44xw69
 H6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712015476; x=1712620276;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWH1PpmsAIit2qpLVPFipp6RvFkcic0ChCVLomLjuIA=;
 b=Pj0M6CPai/Mj4i1Td2oe++cNhhCK/l1D0EyHKZIvEhc9htwc9+4Qo6aXjXDn8rAZ38
 dD7Y2dedPcFi1PLvCiY5Chb1i3xkZMCCNQIoxiCa5WLPTcfS0uWjVaZnaU+eHZwl4Qus
 D3/ca4lA2ArYksZYL7xL52jeMYwsiW60GdNnGkHTg4mlfhLNYhSIw9pE24YUaAiUFNXa
 yN8ArC4vUHm6M/wDOEu06UO97kXf+UYNVyjtgmxgf/i4RKc513G11qM3W+5EHq1n2V8m
 3jTtbzMerxLSGM8/4Ha6F9o392qTOUJx0OrCyBBqYFHh9sxHyY0cnhWei8OrdpxZKaBu
 /njQ==
X-Gm-Message-State: AOJu0YzeH7XvCa8ImJ/6X0gRuwQzr81m7iGHEMbHJeNMgJGxzR0KjPa3
 dZGnKwg0+CHTm1cycE+QAQF3tA7HTeWCcUBvQrg8B7ENe0EKWU3JH2Qz6gHKN4nMKv9d/rl9CNG
 I
X-Google-Smtp-Source: AGHT+IHU8mhblcnj0F+VJOhDLMZHAjM00+bPIg7rgW4CAgCcVLhJ1LgBJh1dQJEcXWjzKc7YQu5jtA==
X-Received: by 2002:a05:6512:400c:b0:513:2b35:2520 with SMTP id
 br12-20020a056512400c00b005132b352520mr7110658lfb.58.1712015476466; 
 Mon, 01 Apr 2024 16:51:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 g28-20020a0565123b9c00b00515d127a399sm1176135lfv.58.2024.04.01.16.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 16:51:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 02:51:14 +0300
Subject: [PATCH v3 3/4] drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-lg-sw43408-panel-v3-3-144f17a11a56@linaro.org>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
In-Reply-To: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3789;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WTwI7tKciTN5NWHCt4BqSsgA7bUxADqHjwO+LN7NrqI=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBmC0hwJvacY4ehW/Ceu7lfTrySVrrn13d1CLQyM
 ZRQJ/KbnwuJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtIcAAKCRCLPIo+Aiko
 1U7vB/dh2BGQN/Mm6O0WkvrdCXjfTFIvnx8fEkf+KBWt4phogk6quGH/qbIOx9BrjKb4QLG6o4d
 4nwaEtlFEsxntWlts4n04MRDmIkj0l8f61WG0D+3V5oIOlYbUqHqkRLfZkvKamNMRQWpJJ8w8IG
 oo+FwMm0BRsWdv6jKZS7NSgbIUeL3ujuwobCdeuKSnZBioObB00bmPsSVBM7nms6EYGdHyMBLoC
 EXRijraGYfsQL9Z90AA/vFsQRYUkCvJxrfS2nc5adbnFzDjZBCP550wPMIY5KP6y7tQmK9Q1TQF
 HO6tLOu8r16FqZIE5SDgVR3K1++eJqWJF0wesdt87aomAHc=
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

Add the extended version of mipi_dsi_compression_mode(). It provides
a way to specify the algorithm and PPS selector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 33 +++++++++++++++++++++++++++------
 include/drm/drm_mipi_dsi.h     |  9 +++++++++
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 9874ff6d4718..0ecbc811eb7a 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -645,19 +645,24 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
 
 /**
- * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
+ * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
  * @dsi: DSI peripheral device
  * @enable: Whether to enable or disable the DSC
+ * @algo: Selected algorithm
+ * @pps_selector: The PPS selector
  *
- * Enable or disable Display Stream Compression on the peripheral using the
- * default Picture Parameter Set and VESA DSC 1.1 algorithm.
+ * Enable or disable Display Stream Compression on the peripheral.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
+				  enum mipi_dsi_compression_algo algo,
+				  unsigned int pps_selector)
 {
-	/* Note: Needs updating for non-default PPS or algorithm */
-	u8 tx[2] = { enable << 0, 0 };
+	u8 data = (enable << 0) |
+		(algo << 1) |
+		(pps_selector << 4);
+	u8 tx[2] = { data, 0 };
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
 		.type = MIPI_DSI_COMPRESSION_MODE,
@@ -668,6 +673,22 @@ int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
 
 	return (ret < 0) ? ret : 0;
 }
+EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
+
+/**
+ * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
+ * @dsi: DSI peripheral device
+ * @enable: Whether to enable or disable the DSC
+ *
+ * Enable or disable Display Stream Compression on the peripheral using the
+ * default Picture Parameter Set and VESA DSC 1.1 algorithm.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+{
+	return mipi_dsi_compression_mode_ext(dsi, enable, 0, MIPI_DSI_COMPRESSION_DSC);
+}
 EXPORT_SYMBOL(mipi_dsi_compression_mode);
 
 /**
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3011d33eccbd..78cb7b688b1d 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -226,6 +226,12 @@ static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format fmt)
 	return -EINVAL;
 }
 
+enum mipi_dsi_compression_algo {
+	MIPI_DSI_COMPRESSION_DSC = 0,
+	MIPI_DSI_COMPRESSION_VENDOR = 3,
+	/* other two values are reserved, DSI 1.3 */
+};
+
 struct mipi_dsi_device *
 mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 			      const struct mipi_dsi_device_info *info);
@@ -242,6 +248,9 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
 int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
+				  unsigned int pps_selector,
+				  enum mipi_dsi_compression_algo algo);
 int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
 				   const struct drm_dsc_picture_parameter_set *pps);
 

-- 
2.39.2

