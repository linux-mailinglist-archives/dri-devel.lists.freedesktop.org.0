Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96884A24DBB
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0385010E266;
	Sun,  2 Feb 2025 12:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wqQzGuIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0109010E266
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:29 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so3557065e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498048; x=1739102848; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3jL3SY1S6z4Uid1XoM99vjSrcwjC3Oh5zHftbBQD0pk=;
 b=wqQzGuIiqcMDy/9f1HNIEIxUTNQqmbt32rFtT8/rrr0OsyZnrbNgGBxZUXPJYYgBaG
 vr/+Tu1812wZgstFt3jb6rrZCBbsX1dGsG14EBSKOV07bJkfjBXrlUiZV1pU/rCJDomL
 iFsOa0VE186SE9DDtULclasJqBlBwdkkPE3b1aHr8yWDhC4GZo10ajbzG3yJ0nOk0IjP
 7oQu5gQr977PQxqHQoE/58yYBbiZkGm2Bax6mKS9gfbYeCvO0pxeqgn4tQzK12Ve2JXN
 oKYiqw+JVWDwxp99Q2dEMMt1Q/M1ZcWe1wUqjiB9bx+oN8258hmAtYVaTG9tqaXJI5S8
 FClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498048; x=1739102848;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jL3SY1S6z4Uid1XoM99vjSrcwjC3Oh5zHftbBQD0pk=;
 b=IFiXoBVnlEB6HSY/S7qu1sl3NeZEhLqenYsU6RjWS++JrOyp6F8agKDjU6yUUNtmz+
 TduXKf92bW8vvAqVQ6X0QZ8XVnJCxRyk5Jr7hbSGoV5d7A4VUj/cXfVlRPgRNRiZE4Sw
 2LSWQW3Md0P6VAbRpFD+DLUY41/cTVj3C4p+uQna8LpJFLRgwyUUlXtx4OxwFQU7xfbs
 Zh2JVlSGjjTtInc/CRAUOjXArIFy+LYDnuQO8idbiQY/ERuTvuxIXyugf3A3/BV5A428
 oidkwC91g8kGumTcpIVL3WqznE7ha//gfbbhg4GOuCR/dcMLmsp2wF1P4JRXy9ASPGZj
 swyw==
X-Gm-Message-State: AOJu0YyPY0l95HhJ9ogdQzPF5LJeT95RzQ+YaLdN4d8NuYvwEYYeL26M
 3y+lxn7LczlJrC07nEafItSWMdHDFEDLFNlxpAZRVPEGpEx7VB/bYK5DEKEyHmk=
X-Gm-Gg: ASbGncvwZux4SBGTCBSSGLkYvsWs3UDLnY9dFKHjI1TQWfNpNvBlqgamrDAFN9EBzLK
 ASHpA4umnTeuAyveEZg9/2yf67TtXIo/V21/CO6xwREbMBYcKFjNU9szAlr2aAW+4lGsCgJTYfk
 +Mj4c1lJTXsMgGqUdgK6w7tuihFK0T4ltkC4qU0xDSVLrhN2do8rLr9W6+vffqYYoeE7eAlFjTU
 Vki0BiwBTk/fSzM8f7MVD01TxKHlPT36SJZHai++vIdwfOvoF0/s1ahLisihT1L0Yoi592axzx+
 cy80MKTykGkXYDB2qlSxEgE=
X-Google-Smtp-Source: AGHT+IFQ2qvN181ZDuhcMPZNSJiVwciarLswp3cHLOkosjzsrof5La2FVo7LVxq/uWfUgjgWG7L/7A==
X-Received: by 2002:a05:6512:3d21:b0:540:1fae:b355 with SMTP id
 2adb3069b0e04-543e4c37a94mr5458133e87.52.1738498048159; 
 Sun, 02 Feb 2025 04:07:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:12 +0200
Subject: [PATCH v4 05/12] drm/display: hdmi-state-helper: handle CEC
 physical address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-5-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/bwxxqot5Orp4aaO3bhvKAHJmqfOaxqag+YV2Q0Zeak=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/r8+Pd/VIo6maxyb8aGPtbn4tUp4Ky8ccFgXr7SvcSdv
 6WtDEM7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARzhYOhjls1duOsutql9vs
 K94rcSku8rn9TR5tI+49u6xmvFPw8gifKsD1PWL+zpsTdZ4Y8R3YnPXO+LpnaHvpDU3DmEQ+hec
 3wowf72A11nIzStpdsqj485aXulZ/25wj625sC7KRPy5TeW1HZp+t7Ix+hlaOl+br30x7+olxWs
 OE6QotMe9v5882LzRpKFI7bfDITF5Hc8mr+bxOTBY5aQrvy7pS7mrGmcv/tV80h99+TUa/0L7Gl
 JqkK+XSV3cq/q7QzlSX6num0/nAsXvaB+F/8wUOLZgwMUHbpr3TsPmo7qbVBtvX8v3sauvKTeH8
 WFmQaSLi0S9Qm+rYd/76FZ98EeW05wK7Xz/ZIdSmvwQA
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

Call HDMI CEC helpers in order to update physical address of the
adapter.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ca3c99b3805fbd78fb3162818b3877450d72b178..1e7ea9b387088d5f407b647a9a3fead7a2929a30 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -786,9 +787,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		// TODO: also handle scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
 		drm_edid_connector_update(connector, NULL);
+		drm_connector_hdmi_cec_phys_addr_invalidate(connector);
 		return;
 	}
 
@@ -802,8 +804,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		// TODO: also handle scramber, HDMI sink is now connected.
 		drm_connector_hdmi_audio_plugged_notify(connector, true);
+		drm_connector_hdmi_cec_phys_addr_set(connector);
 	}
 }
 

-- 
2.39.5

