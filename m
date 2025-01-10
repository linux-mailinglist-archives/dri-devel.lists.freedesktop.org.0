Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D5A08F65
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081F110F07E;
	Fri, 10 Jan 2025 11:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xW8njn1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836A310F079
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:30:05 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-300392cc4caso16509481fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508544; x=1737113344; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=efhfp+4qW1iSmQeuDMr+e/8ImYQLWTnZeSHC6Pg4yQI=;
 b=xW8njn1Ss6/eJZ6dg85NDOh8DQ2dP8BmNDSfFSlmIR3/lJT7tcivuQP0RivVokt18Q
 2uFC15dfxv1enQpC86s5T0jEymqpHUg5h2wyuW7/p/u/ovNyewMj/JI1ER3eQ1VAjHlk
 +wob09RZGNdgtDqZOc+L8gcWedTEwp+E7BTLUfzZn4dOAHNt9o8+vO8KkIlP64zeUiQr
 woIBU2eANtdpz2IBN80CJutDMdNQP4Jh3ivEsFDFZ1C5WufES8S6jve72mQJsYauqYIK
 fR+da91b09CyWrxmOkJ264OGpfzKqhCW/CLKUy2BNW2cj4ASs4kUVQguR046Zu5Fh+QG
 XZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508544; x=1737113344;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=efhfp+4qW1iSmQeuDMr+e/8ImYQLWTnZeSHC6Pg4yQI=;
 b=p6deTACYIAWUAH8WC474ZJ7xwKJMdTGPNyMgTFRk+UzS6Sc5ViaSYnDSRHtzh9WiIh
 xPp5dt/errclqFBOuwL0YJV2z1uqwBysunNGtL1JNhSaHEjvfIec2lxQjjd06qlszbsi
 6Zo8Awo4QzVb5jHvi+2Kv2yfAdFgpdaMNqp8hKW5zywctNkZ9HuibR+9TXEX42x62a+Z
 CpnWeFE6cF/YHRIQDzmPOv6w++Bnqbluldl8dsXmp9wXOQg26fLEVfVDgsqyQ1Zk4N+A
 KIL70ZAL3KRT5IXv/D2oIoNW9YqhYGiRnwPO6uYw3zIzyGVmLTyMFbByjRovaBMq7jAb
 lmfQ==
X-Gm-Message-State: AOJu0Yw7r2H29H4Dw++faZnE187VmF/3u7KQtpERW3/px8uwk7PVtSym
 jiz6q40AQ+24Wn6AfSFzySv7zd8PiYPFUV0730ymzwczJW6viUuCz/HWecOmi5M=
X-Gm-Gg: ASbGncszmJZQaW2/qY3FlHsqlaG7+SfHXeigq+j6fhIbyrn2gluf7ORQs72LEHY7yFX
 IBh9cxtPktJ2+e1+cYDuSSVSDM4toInNCo1iKw0/Idz2/ZyPlCdboxfxAKh627//+EBBKPJOJOr
 FQBDPj9r7BfnKkcGhEYJdlxmq5XjfLE4E4WCQLNNfWVCnoVGdpSgCOKgVoFw8u+oWwyQzpMmkrQ
 1RLvyQ0o4w9cyGROjEXtRJm3TKSy+bUb8ft9Ka1l2l981IeNz/T8RaX5I2fKJd/
X-Google-Smtp-Source: AGHT+IELKchtP92aOpFw3XM5wlsKG8Uevo4+w3dzN0oJeZ9l75FlDd5o6YCfnywwrTl8ztwdLrA8dQ==
X-Received: by 2002:a2e:be1d:0:b0:2ff:d81f:2d33 with SMTP id
 38308e7fff4ca-305f4626544mr37979751fa.28.1736508543908; 
 Fri, 10 Jan 2025 03:29:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:29:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 13:28:49 +0200
Subject: [PATCH RFC/RFT v2 6/8] drm/bridge: move private data to the end of
 the struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-hdmi-connector-cec-v2-6-9067c8f34663@linaro.org>
References: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
In-Reply-To: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Bh587iD2fc71HoCxezk2yuAVtboO7fHMro855SCGYPU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngQRuvIK7/M5jESK6eq77ENHck1AvXhAiBpC1H
 Dlcg9pu5O6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4EEbgAKCRCLPIo+Aiko
 1V6WCACbF6mVItphA6yzidODsi++Cdnh365y83JVCTos76UZogo92z63gmq5yauLNtzbWrBJSpG
 FmUZG9WMrnpZvw0hlP6JVBKOpevS5bLLPiBCaA484esl7a7I9miciJ4zyxwwAs6Mn9FIqcHoPZE
 FxmRepqFRt73zTUywYwR+7nyJLT9MEGWkOPa8/vZYloqBDmGUU8UZgUbjpJmyk5+35sNia60JM6
 K+WiuzYSoVEC6rsoU/RJXvUcV1RBz905Tdva/pk4bTK0TkYGbYKky/7l/FULo9GTkWVaWj5BVIC
 8ytuBAlcmOiPyHHIK2mjw2jDnQwf7Yt9QSdOyO1/FXmpCETe
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

WHen adding HDMI fields I didn't notice the private: declaration for HPD
fields. Move private fields to the end of the struct drm_bride to have
clear distinction between private and public fields.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_bridge.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1f1670e3c6aac39b8b891b0d5e7e91254eb0d3a1..348778f233b06265a6ae577762c6558e69cdb396 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -872,21 +872,6 @@ struct drm_bridge {
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
 	struct i2c_adapter *ddc;
-	/** private: */
-	/**
-	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
-	 */
-	struct mutex hpd_mutex;
-	/**
-	 * @hpd_cb: Hot plug detection callback, registered with
-	 * drm_bridge_hpd_enable().
-	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
-	/**
-	 * @hpd_data: Private data passed to the Hot plug detection callback
-	 * @hpd_cb.
-	 */
-	void *hpd_data;
 
 	/**
 	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
@@ -938,6 +923,22 @@ struct drm_bridge {
 	 * @hdmi_cec_notifier: use this bridge to register a CEC notifier
 	 */
 	bool hdmi_cec_notifier;
+
+	/** private: */
+	/**
+	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
+	 */
+	struct mutex hpd_mutex;
+	/**
+	 * @hpd_cb: Hot plug detection callback, registered with
+	 * drm_bridge_hpd_enable().
+	 */
+	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	/**
+	 * @hpd_data: Private data passed to the Hot plug detection callback
+	 * @hpd_cb.
+	 */
+	void *hpd_data;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

