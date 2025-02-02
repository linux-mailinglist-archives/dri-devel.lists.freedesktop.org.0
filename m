Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD10CA24DBE
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87410E31E;
	Sun,  2 Feb 2025 12:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QWSzeY/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D4710E2DE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:36 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so3557113e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498055; x=1739102855; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZgAVEoNSYZyEjLuTE1oB7V3YJmMK3i9hrDmIRjnWJHg=;
 b=QWSzeY/LC5xostKQEXmY+JSyt1QNlpSSMPl1onC+Ckz2Gnd7R+PanXxz+QhT2TOT+m
 GcKOQ3trlTPo+I/+ArsicQ4lL+JTLtVmjYixk6rxhkgs0IKlpwCbTGT7nhSRT0UsWI3j
 s2D+tXE+JsHCC9jDP/nuzLGhLTElsb85windjowGWsfPz+CH+IP32v86EdeDNwTQRzXM
 Cd+uH+gfCnzqGmLpPvV10emkuJjo14+JwMkWjHAJDtfx6mNeWQt4Au3g0KNMGXYSmlfj
 z/2IsT9W3IFrAHkmu+LQ4H5RiqtYLvICqsJmCHdZa5fQLFEb2QypRNpQjq15q1BXvNW/
 nEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498055; x=1739102855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZgAVEoNSYZyEjLuTE1oB7V3YJmMK3i9hrDmIRjnWJHg=;
 b=SCgEAh+7QoPaU660xxtgyqUwu3neikRtWXHtu0wZ3FXDDRnTWozxAsm5O9okcT9yM6
 UxBcFJ2biChWc/vfNkIXDwtzfsmIKJCB/scE5LcYn55K/gnPmUZM0bq2x/W0HHN4vfWz
 2VQEYKKmivvIN6hesZrFnrMq0lxHNE8f38otxCh6MHs335DVl/vnM6rWDf6euJOWkWIt
 yOKyaJDwkVOk8GEnL5DPDxdWRTkeqMVtCEb17kArkLpIWsGPwZoCyb2DP2bEBoIIpkNB
 OPLjYmauDq3T4OpNhdehju8TgtFMHc6euYBR0u67vtuz4Npt+WOd5c7BNt1QNlooalxW
 wQdw==
X-Gm-Message-State: AOJu0YzPhRx2umANVTcCl0FWSyT8boc30W8tz0cVXRKTG60xLZduJ+dJ
 MX4zgrlvveuv5BpPbkDudcHjvqt9fB29OsWmIi7jtdCKiM+QbLXVr55KTC6RGxc=
X-Gm-Gg: ASbGncu3j0j+eKILQtZYrdZJtz2rtkgBy4eTkNyXoeljY08zP28xSGQG88l5bhMdVqH
 QJVHr1FwlPgCS21xsPogHdAizPyqMlp6C1Mzv14h8FMHKQmKIhGi6yjyE9f8y8dntKKV9WsNqbc
 WbXOSwelCYHx1EQYh+FlJ/5ciVWeFZQp7vp8ClaP5X2abZk4zMUjTMIbfPiSSjOVFl8sDwnxi9/
 7ey0DID0pr8rxEd/clCKTdIZATWqZTd+cbk8636Icyvi4TJIvz717JeRoKX7NNpe1fVGZo8p9H5
 HcOmZwVxWPLdKB5tj8N6gEM=
X-Google-Smtp-Source: AGHT+IFOrkSnrb0EMOZSD3f2+JhY3H6H4djvQ9Cngu8qQR0jXh4YrgCDc8p21Qjtyk4TkLK5BPjAiA==
X-Received: by 2002:a05:6512:15a5:b0:540:251e:b2b9 with SMTP id
 2adb3069b0e04-543e4c2966amr5607513e87.41.1738498054836; 
 Sun, 02 Feb 2025 04:07:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:15 +0200
Subject: [PATCH v4 08/12] drm/bridge: move private data to the end of the
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-8-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8WlbJltbqK/InBjSkxjv8tslfatfI2kL2pKEGE9R5LI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/vB+CdW60aRQrg/SfxiyTccxBejN5Z8BgD7
 3nntMf02q6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7wAKCRCLPIo+Aiko
 1fF9B/9bM6P3l8/EMpoAwseVEvg2NuykTNvmxRhTvIGk+cljuVHczEdCTGyy1w8WuAvLUL1FFly
 EZnQxQGOWK/bp1H769ZVsj/Je+2GxD2pp3Q+bPMojWNOCbmw80zxwJarVnS6OKuZ2uzJlklTYNh
 Fa0o27p+gjtUXnaX3C+4W92uxVqPVam3uuGlv5H8x93aMnyLTYmofm5lFn//1iHFuUV8SYZBtVP
 8o98nDxFqSLvepCgEj0lezWyf9CX9JJVU1jEKF7KUZc6oMYGwSt26dkMa9/yZvRZJO5ElqoNEln
 2t1cGfh96jZG6Ks8vn1qyUUOm12tAgZTKy/4iYeUax/geqbW
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

