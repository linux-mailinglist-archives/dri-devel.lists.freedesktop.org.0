Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B369DEE70
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83F810ECF7;
	Sat, 30 Nov 2024 01:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="efsAXONI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DDD10ECF7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53de771c5ebso2831920e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931573; x=1733536373; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
 b=efsAXONIVZF6Nw4rIU+aPh8ooTEl4Q/ZVNsZ3OyAS6PaNe4zAqIxoTa1Mev0i+5984
 Disf2LKOxWq1bnwiMRDieV1Wt1rD7hdyULsUcCI9D3IxjCUG+4D84bD0iohHNkRdDcRn
 nMVqUklPF+0B/XJVgzhIUtwNPcn3O36rxw18bqVeMA+AKHAVaZr0n8Zud8/yBCkz3ti1
 FUMTQQIPAUAJBztqmQF4Oh3qJa1NiM8MPqYhUGeDDqoX+f5NIsQpyRKYnRQEGPk/xaiB
 yhWoSz1dOAH/2Qz3RQ0VzamgN+m4E+RwYwW80s0TrFKWDeObRBh3++utjkSzwUmZELxc
 4m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931573; x=1733536373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
 b=YZinEAXRqgLMn6fEbvPmI8KKzBKbJ3C+H3BnIkLrTWgor/3VHYlH7+7gbcGP1jg+UX
 Q8tUbj7QgKmrRQZvcNvqxLSbcWIleNAXDHYtEYA/vRqGMjsv0aA6islngkx4qssP663q
 xani8krc5Y53KKHpGHEFD/ZhHJHfccOSJV1ZBlhWYMMZF5mBBsRdRJovS43d5Io/9G8t
 7SbkyiReER9Zzt7/oYj8uZoXgDHEYWFcpVm5tLCAeL2T0TtqN7sqP0CVujERVkt9DJuX
 N59pBrc/lLiN5TltU5IGsyh47loSOQq+r0C98txA1+9haa4pGRu87/VzsfNnkyeDNHr+
 nROg==
X-Gm-Message-State: AOJu0Yz2ZEVzLh0Gb4PqsxVIxWzZ+kcdyaYLNcOb4kQOiE495d8PxWhC
 Fjq4kMY/+Mz0u0DLj2FhkUMsgUm/kneKXtNFUCNip3w6zpKVe0JbmL8qbOSus5M=
X-Gm-Gg: ASbGnctAFhCZYptmpMSEvYm56AwNU8tjV3DPhSRvVr3FFYEbvcidmJuf8OAfh/Dho0l
 gj/aUZs/uRAbFM/KgFbSQpYmFQdmWaqEfXOnGb4bEtKfFDkablc61BMxYRumKBkXMU9HpWYQqhY
 /0eoxzH7cIrfRjQPDvpfXnbyk+Yxc8v8RRfCyZ1IF7pHgXF3nzDUyN3T6CgjmlIwly3tMR2inX4
 g1a+euj1nODCZbH9PrFDRSfczbrtbJRrkaHjw+7y4YNGp8eaEWJTlMAOQ==
X-Google-Smtp-Source: AGHT+IHEYj74nFURYbWP3Egy7gi3UHFs7eYCLy23sHhESjuboylGOmyFITklL7Me2c+2Ybp446w/LA==
X-Received: by 2002:a05:6512:2309:b0:539:8a9a:4e63 with SMTP id
 2adb3069b0e04-53df01046eamr8488039e87.42.1732931573080; 
 Fri, 29 Nov 2024 17:52:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:32 +0200
Subject: [PATCH v5 07/10] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-7-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7pX/oMCB23f3Dl28T72F5rnzAu3MnESPs7t7BUhWRXw9
 1Lk0aJORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAExEYR77/zqjCu2Eb83GP2fZ
 /I0qDXeMSL5+ZYbQYbd19606OYpCjUwuXJVSWeoa81rz0QYu07WsVn16WVMTGYueu147XR13uNh
 T6nVdSniXWePDn3mXvlrKHK50mhW0c3t02pUchYWCVXP7qrKitdadmLXiWI+o8cfyYlXF02Eyly
 7cTX1bkJGqtlrte/5e5WlWG9zv7gkRnvf55p2Lfx++Pbnlt5WNd9oMfjsnb9ajO+81VjS/XP3dY
 SrHTqfmxbM9vTmF2xI8hFOWLHGOvlCeUKheLD/vQJrwwT1xHc6L65eUXfbzuar8Yva7pbNVep+6
 KVt/9+9yTnXT9hR+d2mlSIHMxvcmVV+3q8leDvuV/cYaAA==
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

Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
bridge in the bridge chain. This removes the need to perform TMDS char
rate check manually in the bridge driver.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..512ced87ea18c74e182a558a686ddd83de891814 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -299,9 +300,22 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+drm_bridge_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hdmi)
+		return drm_hdmi_connector_mode_valid(connector, mode);
+
+	return MODE_OK;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
-	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };

-- 
2.39.5

