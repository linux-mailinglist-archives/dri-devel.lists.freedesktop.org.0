Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E9A24DB7
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8376810E25F;
	Sun,  2 Feb 2025 12:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uJFDCIx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6115D10E25F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so3623585e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498041; x=1739102841; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F59sj0XNKbiGtLNc0GKb2ggGZoaV7/aeIrEMGH1u/DA=;
 b=uJFDCIx6MKqQQGx7p5oDmaTOAPbSrk/6hZBCJpwTFhIg2G5A7T95SdrNu16qb7B/E5
 lfzAJKFKJo1DoFgJMsiSeI0aA2+PJclwzeNc5JW+asfXrRnOQxjZywMlaz5wZe6Q58gA
 4R55ckr4JC3uwCjAP8702i64Iu8sVVtBTVHM+TSdvdmbVGuKRB+3ouNRXy32bhhrEdLp
 HdAGL1HF9By1G5oBuhm69SI9BfqxU6uvkAJ3VOme/IfFJCO4ejzcpYjUY3Bl3Oi65cu3
 ueDeYhgxb+JLA+4Nc74LFARsZSZs1O8BNEKLMFcd5C7qGjC0EEGe+lKJp2mlcLVM1GPW
 BRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498041; x=1739102841;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F59sj0XNKbiGtLNc0GKb2ggGZoaV7/aeIrEMGH1u/DA=;
 b=llEzw+bLbD1rv0P26sYWii/oETM47gGgh+wc2DEscCnjgtUWZUTdSh0nplS1UBBRL/
 ItsI/Wwn9YQH1u3gijUAstiUYt7NbN1/q9ywX8vVwQxf/597W6DptRRcObyu+R4JQ0xz
 moV0czRDXdGLGSGFQZgEKt2Sn2u6UtDIQXPSX77DmICAsJEnPEFjxlAVqNcugw0Eq6Te
 yNkrE4vkQeKF71p7/siHDCSvvQqLscHJ4oXeThOecoxDQJLGU/hH3sEk0xVYaIDBJoYM
 JZEreZi+25nFWXD1NAl32PI3lFPpUgOQtEto6/shykEGVebuvMaTAHJGU3632P818zzi
 zbxA==
X-Gm-Message-State: AOJu0YxcrpNd5tPHMR0aIdQhpQVLTqRD7ckF/Y748dSnOYRbIgX3GMF5
 Oo1vvF4+mvXUx6uf7xrORiSNabp5nrvqq1s0jGGWcRPMyaHExDoR/ZKLsxkfMwA=
X-Gm-Gg: ASbGncuFWygDn0aSSPjVcEXmRD7IPT+si0fMaeAPPaI99WaRF4z7gBRthP+tceoJIFl
 mXdl4qv24njZMdy88HHM06KJ14cQ1rilhjPeIgei08cqwCQ+8bVeBR9YAfCfynCR+ka3vp23ny0
 088AH71cZ6I9NYGzJfT50nZADaHTTHSBLUmKliAtpLhz6OKVVsubYjAdBrdrCEwjyy8zBq+ZI5t
 2fQ/4ASNZEhTIKDSLwrxHmb8TEbKXisUX3XwgZdH1y42L7sJ7KGSVUWoe4eAjIDQQ7yG/eBcel/
 jzgz+yGnfzeI6SvuXQMpYiE=
X-Google-Smtp-Source: AGHT+IHVYRDC4J4iYdmsbDvkkAZqI5KPrACpL/BZx5B/ZFeHipes2e1xGC3WGrn3XHqGwbLb5pLbxg==
X-Received: by 2002:a05:6512:102f:b0:543:e4ac:1df6 with SMTP id
 2adb3069b0e04-543e4bdff98mr5145760e87.5.1738498040651; 
 Sun, 02 Feb 2025 04:07:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:09 +0200
Subject: [PATCH v4 02/12] drm/connector: unregister CEC data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-2-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RjjhvUseWPk0WJktiUGr9igyfvy7Lala3huHY3iwjag=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/uOkPHmx9sBYxzjPWzemPGMPzzOqhkgC7Xu
 e6Vd/xrdy2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7gAKCRCLPIo+Aiko
 1Ze9B/0UqNqVk6rEOBuY8R/S2llohsLFWnYF4vZbOMuOFKEHwS8TxSdZzXX5gMO1qJj5R60aZU2
 X/yRTLBR48aitZUCoEjKS4x4X0VBgf5oU4vO3DMTrTLMnBxuQfjTOjVesDhenEpxfWWHPdXKo94
 wHWhh33axXAdAlJ9fZf+GDoqOKdctRFm8GxcSUgVM/GiW8xQa3mJQd2ybhNmWCPnZFX4UqyW1oC
 kafGoUEYeM1SKrFuu+olg0yZBA7EoK+/ax747+Ahw0iZSWOjFnKKw+nJCTrUCR45Lekq8c1ib9T
 vgEFAjSbTEG2rmoxTq/zcMX71GOPIWYAHaIQIdz/apLvUHXX
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

In order to make sure that CEC adapters or notifiers are unregistered
and CEC-related data is properly destroyed make drm_connector_cleanup()
call CEC's unregister() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9890b00e8f9be856f67cc2835733a056ddb98efb..fffb718b09eaaac200e6abc7524bbfe98c4741f4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -699,6 +699,16 @@ static void drm_mode_remove(struct drm_connector *connector,
 	drm_mode_destroy(connector->dev, mode);
 }
 
+static void drm_connector_cec_unregister(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs->unregister)
+		connector->cec.funcs->unregister(connector);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+
 /**
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
@@ -719,6 +729,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 
 	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
+	drm_connector_cec_unregister(connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;

-- 
2.39.5

