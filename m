Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7A9D5B84
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A030A10EAF5;
	Fri, 22 Nov 2024 09:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mivTKmfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3AE10E1E2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:13 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53d9ff8f1e4so2042469e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266792; x=1732871592; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6W3bqmSBPUsE+fVjxjecsCfWlJC1+mE/7mRAcZKJqvU=;
 b=mivTKmfVrJqQIZgLXnbqWQcHKcMmXXjlXBNfdL+3sDCSr7Zg/6WEeHp5GY+O9W0nux
 NmJksjzbHfRDwuSjj3mX8NT72/MUn2jJx2HyazuwPlE3dxTp4aQ+9ZCEpsrZv0MaD2pn
 TW8a1c4W1STahCswKawt2ssQOpLP4txXAAiG6pZHJwYMtHRBeug9xybxevyNRFZXfkPT
 Lfi2HqQeEkUliJfHYRRdmbmPlRQa6pMgrfsHtKCFGahy2dy2Y2Cxl+ur9IcO8NCLUbjB
 d5a9HQtrSdP8+XOHqzCTg9IczDODtO04V69HmzrMtK8Q7Xg22NitEFLmmpW4CRXaTMFQ
 fuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266792; x=1732871592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6W3bqmSBPUsE+fVjxjecsCfWlJC1+mE/7mRAcZKJqvU=;
 b=lAQLXRgLw9jOzKUlVWJdbR7XBBBkb1JutuKLBd7y1y25VAZixEN1HL7hjp36I//p5H
 u3nNEayKtgbsB+E9nRG6hmB7KVNF3LCE0Oy4HPxUO2Fu5BMynPRtjO6bVnQa2+auhzbE
 PJ3rgQpmsEwWRxxnqY3ZdLR9C2x7Fbtv2sUTiz6YtTOXvvkIjqSnRd7aI2DWfpdr2K0m
 IOyVqRs0RdqdoTaoewzUtlzcnqYHWCIbsBk2H97VHR16fl2qcqn+DiuT0RD+CCNoXtL6
 WsibKsyqzAzOviC0TZ0gzunndxD3jpY/wqh5Fj6I0hwD12oLgbeNDVT5CCiOWyDgDPyc
 SyuA==
X-Gm-Message-State: AOJu0YzBnOg4gwpIHON5WxQTYSVCkCDaaMigxUOtnKSB8XQM4gVksluh
 qkDglNNBth/ArGTBGhiBKBkC3ryJCZITHHIRmJcX1sVZLr3iXapUDaYmTiE+Sjw=
X-Gm-Gg: ASbGncuHKrhC99Wl4PyxJbjnGMR7eXsDYIgAd/R7XaNJggBvJrqQ26Bv8lhHKHjddp+
 Mr1tKBZeRjZ71SVc3bQTTnTumUmKubjCEX8M3kEZD8TsXfNBdoojLeVNaurvDeqX7vEAL8nOKF0
 +G3rsZ2QeYTIN47R2neG87cQ2esP73hF0nf8brBOG6ELIQ37CHdteu02pAMBL9qFTCRBpTIYL4o
 IsoOmj/SgYwnNqLXeilLqQQGYPy8hZd3queu20mjRhdaBkGZRXssB8a8g==
X-Google-Smtp-Source: AGHT+IF9ThfWnsEQI6UyED7pA9h6Wf7FpGWyg1saUJdib/WRVSKuqZ2ksQYV61QNiecHx3mAhZLedA==
X-Received: by 2002:ac2:568f:0:b0:53d:a024:ddb2 with SMTP id
 2adb3069b0e04-53dd37a6c3bmr1142300e87.24.1732266791780; 
 Fri, 22 Nov 2024 01:13:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:12:57 +0200
Subject: [PATCH v4 01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-1-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cHHtfh9y6/Xe5pWD0imwgSoaSzh5tOQpdFVxQZ5xP/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshW4nqOdXL0T4IVeWcFtdcIU865J/geaZOs
 dJST3YPq1iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1aCMB/4mAMbVULeSJaQKgD/thf0SdySNUWeV6CvGlRgfogZod1ZMqfju5iE0YiqI7xy28Ycv74E
 B0vuUvxyNt+MKQbKrGS8BTlEhjMqCpiI/CHQBw9F6k2HpfGFkrWHDIoMHaaoW5DaERqX6xacG/s
 DhPpiLyKV55OciJGf0cj7Okd9I+OzcIvE3aVDAo8uG6emEXX0UO2hya4rXHN74Rwop72ki1rJn+
 7Co2fSv5VYDWughxDBVCLzuLe6u6WeSCbhxlSg97MXogFyunITxmcV5RlLk5Z5TQWDhuX4634jq
 pnHjEf3jhAkLQer5IkvtUgJ1d8uMHBw5CJY0WH/gX/wWSOgj
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

If the connector->modes list is empty, then list_first_entry() returns a
bogus entry. Change that to use list_first_entry_or_null().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e710dc56772f839c2db9c2e487bbc1e..1e77689af6549f162eb3026c7bd2bbd59516ed98 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -46,7 +46,7 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	struct drm_display_mode *mode, *preferred;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	preferred = list_first_entry_or_null(&connector->modes, struct drm_display_mode, head);
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;

-- 
2.39.5

