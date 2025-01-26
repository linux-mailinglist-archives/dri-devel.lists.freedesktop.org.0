Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3185A1C7FD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CA710E1D2;
	Sun, 26 Jan 2025 13:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jJyYKNB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697CB10E1D2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:25 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso32932041fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898163; x=1738502963; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=efhfp+4qW1iSmQeuDMr+e/8ImYQLWTnZeSHC6Pg4yQI=;
 b=jJyYKNB+f1h+WTEMGG5un8J96KseKbyOrC3J+CDW+UTsW9qMQ5n9fXqVmfug290dh0
 r3Bd5snsKATAuxhljoR4iNtAye+/ZLdGdgO+zJu7n+FJcfkzDiVWDfqlmodRVCL7Qy1U
 LuiyqdTPc/+rInKvuVPbY57Tkb4jxADiy2oCjiRf3wRtf7yobQldwmTMOiJK6CRhLCyz
 lHLZqpUR3yTI6gvfUsUb5wuCAKyJecjWCivd8eDHrQimi7RV8B8pSCMHZ+u/sR2K+VgT
 VRAf2pG94qjZlg9i4tUNZ1b8Qb/y+qlDYM0MSBlWjMhpDG1I/UNX/mO7WGVfAl4Fx4cl
 DElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898163; x=1738502963;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=efhfp+4qW1iSmQeuDMr+e/8ImYQLWTnZeSHC6Pg4yQI=;
 b=aHDNt0Revg7mujELEHWFwmsXMJOSBmvukL3uNIkc7MBTwtyxveaUDyZ/dJg/SZdwI5
 5AYUuj6TvaUziQaIB2X8fkMwRM3xSU0N35hQZdWgztnsIqJM0NLKgeHNwqtdpVNxG/0T
 oyjjafdN/ETwIWy7YaU7uVbwSKMUYLdPOk6TlbuZnuaFlXO7olAdnZn9FDSP5x+UzmG9
 Zw52Mw/RfDjRQ3rMcRg5rD9hCaAecgWk2qith0dX3JOQ3voK63wBog4PRpI83uonR9Od
 2iEHqolEkEE9m+rqHHGybVyuEcMuyYIznL/EvldiVTz87lCu1RzzJjxZkFtn5dJy1+Lz
 fexA==
X-Gm-Message-State: AOJu0YyzGRCvaDGHZegi/9nDskjk+WIjnSjjAMjRO8oM+/eLkDO9cDbx
 E3wo5epFm8fm6/prCJI/6F6H7CXknf+E0vQAJ0524ATSsPXhiXJDnCYPlUYELGE=
X-Gm-Gg: ASbGncuwIodILCvwJaAHuVJ5M9J6g6HPIbdGe3XO8vah5gvfofJr8jbXPR0ptgM385Q
 ozZzr24UMFHjM/hHMvf+8eYIQ86uuMi+QfvxkXouJfAbqmlpx3dBkjbEM9PeCPp34ShAP/uQaNm
 zPNKx+N+15fuyQKj7kJy+oym9SlGy1RwN5TbSw1dOH0aZvxO+zghheDX8JMiNpUuq0BWEwHajpS
 8IQVFNzQSjRukWhzxwwI3NyNofQMhf9yYjkhx96t+r1J8BjXGCxhgVJE4tjcJvCEgPh6DIwAxVT
 c87wEisJRXtb
X-Google-Smtp-Source: AGHT+IGRFVavtCP2oHUG3cWkJln79H03XgQNclX1sBSU4i0U6FM+nxYetEFqwINGPmVUjLm2/ld5oQ==
X-Received: by 2002:ac2:5497:0:b0:542:2a20:e699 with SMTP id
 2adb3069b0e04-5439c21f31fmr9969294e87.9.1737898163506; 
 Sun, 26 Jan 2025 05:29:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Jan 2025 15:29:11 +0200
Subject: [PATCH v3 06/10] drm/bridge: move private data to the end of the
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-drm-hdmi-connector-cec-v3-6-5b5b2d4956da@linaro.org>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnljikKPA9DA3frChDr5cC8Ud5cvJdTqCYznd+J
 5AmlRoZ5Z2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5Y4pAAKCRCLPIo+Aiko
 1Sz/CACtnEd7Pc0822JrjUoq6+RwZyPotsnDptSEdfECF9jiRDPxncN19071vyguqmutGjgtUOH
 LeW+kdl82VIQJGyxkPUb49s3ZPRUHA5/Aqe1Wlr8xHagTq1K1iyCsi02KTMCk4fYBbe/E+OOnkK
 1gPLYH/iOBu1vJd4PwvYVh4JNJeynmCet1a1Op1MuAwoUhNO31GgepazWzuRizxbjFxkuFXyqJW
 mGsaN2v2w2Rl/AlFopd6JnAjS6DuqRAkrJV6DFA3ea4xA7FS5XYl9XKIBisAUi+Px6p9FskRNNQ
 igUckx2Qk0mELpvZ7VkFw5x2inT9H89HhjT3/vuH3IsEUjUO
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

