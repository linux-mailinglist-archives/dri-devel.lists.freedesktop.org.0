Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01953A24DB6
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B784A10E190;
	Sun,  2 Feb 2025 12:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kg28nvcU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AFE10E190
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:20 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-540215984f0so3728846e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498038; x=1739102838; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xhw5N6hu1mAiszBnZTb89OhX/h/jTmadLA2Ac168sA0=;
 b=kg28nvcUd/gHzlMxGTPwnMW7NPSdpKs9306jfSVt4OHft7ZXXjSmguNX0QUaSf5QHI
 +e79zkRI8DA8RsEQJc0cS/2B3vlcR8xoT4Z7N5CM5xUHSry5G2xUsuImKL6/iUfHucmT
 YD3iLZVxVeiEJQbLb+mtVaL1S60MhHqjBR9xHqZBL+ubCNefx1CNKX4hBCW5NPMVMaK0
 zMhNZ03JuGosfNN5AGQopQzzK5hwfc0vcF1GOPhX9ud4qO1TIOELBZbBycaCYHmbPSgr
 ZSfSq05OY/ezaL1qqEr+dANjBLHyjwwOKKKHtMdU0gPpVkunN4KXFOwehAOH3PcPjFe8
 1/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498038; x=1739102838;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xhw5N6hu1mAiszBnZTb89OhX/h/jTmadLA2Ac168sA0=;
 b=f8uYr97R76Sr/PwU8iG+HfZRfNzlb3OKvgwqEzC6PhieZRlzxeQBClXUA74aywQ/ul
 NQBTGdSpUV46GFtoXaC+VEZ8OH34zqKdPFZ87t331cISKLi+c9pZrSotsNfnx8Tn+ig2
 e9nKo4H73dJ7Nsi4L5CbCBLS25ZNyTK+yLWbNhfSOe1PPL7yjqPV+k2vSoZ6g207ZUsl
 bGh1nHimfKAwlb/5991goHObWwnztDBsFb4+1ewZBVr1UzjnbQlozayhxbiJpifNFDED
 3UTq9NtbEiBBitoWAypuQgdtrxkFjTas0FXli9JvcpNT9fyiqlEOH63S93OuzvtmWL+L
 eDsw==
X-Gm-Message-State: AOJu0Yy90JtkSqUoyYg4EBFU81+r26c7Rxm2/n0HoTgNGgev31yYquxr
 DdhNL93AgeQmBPeuWPyknCCgOEnNbxoxkLsZIoVZ2B4I7qRD0KCnYTISX8J4ysE=
X-Gm-Gg: ASbGncvgMgEY+qJrv7xyf62f7pBaCLoZEhIO+HX56J9x3LxyY6+T1HpSwDhj6XaWdPZ
 RmC+DgSJSrAMbs0PF4HOooYMM8u0HNfAXyjjhj+bM/46HPZP1s7OQnL6KIVDfhFqcsto1hUH/bq
 xLbfHHNEe07HqoGwG6dkSepGHsLlLg9jwoG8bdeJsQWSZaUav5qDDFhyWpnITxsifh3KTCNEli7
 AHqChP3iy3GkJJtCgEuBuXRLSHW4GdyhRVHn4/rfCoXOvX4ftyCKBbAw1HyPylytnduxolw7kAx
 6AhxKy0SU6xW4QELT1UFiKA=
X-Google-Smtp-Source: AGHT+IFKxqh5RzRr7EynRmlZdOMQxYF98ueum1lpXp6uhGzXBycMfXIfxbOZE8sRaPbWGVtxWKLsLA==
X-Received: by 2002:a05:6512:2311:b0:540:1d0a:581e with SMTP id
 2adb3069b0e04-543e4c01840mr6466809e87.28.1738498038133; 
 Sun, 02 Feb 2025 04:07:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:08 +0200
Subject: [PATCH v4 01/12] drm/connector: add CEC-related fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-1-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3396;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ap0yDjP6kDXZa+LMpowMdXjr2vFMubs2IUYLPT/y4wI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/uPICuG7Dl1z2vtRP2DAhfWXYDYzZ5xvAZi
 FLVShdhsCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7gAKCRCLPIo+Aiko
 1aZNB/9viZ7oSe7tqC3ymZ+zjbPI3JmDZgQBp4KG8RcUmjqA0ZvQ7YrVp+6dH7BFj0GA0akBZ2F
 xRF0L58sJQuRUPFlyhsOgjhhRkNg+doYDS4jHJwplm8p9JrHyEKbJAC16824VBrzYxiVnzRRhA2
 kP4AO8fD2FCl/q/ip1E8AlbEalkvzgpe238+aIX8nt2BKTOzFdk/eB2dNT1DOP3fYtSF4CE+skb
 cNDeygAkt+DmFPfPAWhTohRjuL/uSAU2qqgcOI5wdwaD9D4K8yTGXPz/sqvOPTsIjaConmYo3Vp
 JQdB89sqJ501S8eBDQLpUMN0hV9U+P7+CWRjqm5nhqig9dPA
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

As a preparation to adding HDMI CEC helper code, add CEC-related fields
to the struct drm_connector. Include both cec_adapter and cec_notifier,
allowing drivers to select which one to use. The unregister callback
is provided to let drivers unregister CEC-related data in a generic way
without polluting drm_connector.c with dependencies on the CEC
functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c |  1 +
 include/drm/drm_connector.h     | 46 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..9890b00e8f9be856f67cc2835733a056ddb98efb 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
+	mutex_init(&connector->cec.mutex);
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a30dc1b14c630ee00145256052ba56..790a4d6266436b1853ba458456529403e5597a3b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -46,6 +46,7 @@ struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
 struct drm_edid;
+struct cec_adapter;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1191,6 +1192,21 @@ struct drm_connector_hdmi_audio_funcs {
 			   bool enable, int direction);
 };
 
+/**
+ * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_cec_funcs {
+	/**
+	 * @adap_unregister: unregister CEC adapter / notifier.
+	 *
+	 * The callback to unregister CEC adapter or notifier, so that the core
+	 * DRM layer doesn't depend on the CEC_CORE. The callback should also
+	 * clean all data in the @drm_connector_cec struct, including the
+	 * 'funcs' field.
+	 */
+	void (*unregister)(struct drm_connector *connector);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1832,6 +1848,31 @@ struct drm_connector_hdmi {
 	} infoframes;
 };
 
+/**
+ * struct drm_connector_cec - DRM Connector CEC-related structure
+ */
+struct drm_connector_cec {
+	/**
+	 * @mutex: protects all fields in this structure.
+	 */
+	struct mutex mutex;
+
+	/**
+	 * @adap: CEC adapter corresponding to the DRM connector.
+	 */
+	struct cec_adapter *adapter;
+
+	/**
+	 * @notifier: CEC notifier corresponding to the DRM connector.
+	 */
+	struct cec_notifier *notifier;
+
+	/**
+	 * @funcs: CEC Control Functions
+	 */
+	const struct drm_connector_cec_funcs *funcs;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2253,6 +2294,11 @@ struct drm_connector {
 	 * @hdmi_audio: HDMI codec properties and non-DRM state.
 	 */
 	struct drm_connector_hdmi_audio hdmi_audio;
+
+	/**
+	 * @cec: CEC-related data.
+	 */
+	struct drm_connector_cec cec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
2.39.5

