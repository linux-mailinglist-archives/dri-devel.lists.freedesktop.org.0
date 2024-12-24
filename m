Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB06E9FC2CD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EED210E2AD;
	Tue, 24 Dec 2024 23:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lPppI7KK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E54510E2A1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:10:26 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5401c52000dso6193028e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081824; x=1735686624; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+lCA58zl22vmnlxhnNGgCm+vw5K42PZ70YAVZOIIBqQ=;
 b=lPppI7KK96tQ7yajKiN54qlJ1uvuc0/Ijs/V11tFG1sGDKjD90VaS2sXz1IsLxpvMU
 mDWL4XbP8sk5Fl8GGJB7OGnk26X8lL6jDgZrSqy865rcIgvf9WOBIpAIuR3TSxf3zuCQ
 43rylfDS8cJZRpuJvi3X+gNXq9ydPu/ds0g2esAuv1UxSnMuG1EBxp/riNZVHMVa64AS
 qbKhQn29x+nZmCQIeu5M18l5fJGrOFh9U4ihers3bRGJzEB3wwi4sG/OrIlKUOkkhhrE
 KCpZw2cXgrTGp6yh70FoqkWiCR/oe+OB7J5m94Aw3F0Tp4ACwsRd7QfUmFvw0qhJ4lSN
 etKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081824; x=1735686624;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lCA58zl22vmnlxhnNGgCm+vw5K42PZ70YAVZOIIBqQ=;
 b=eK4G4FwxVFBvwbzpQnPjAzr04PMUS6AGmsObDfOoFc7H4uS2HxYWnKnFr5VSzlAnjX
 Uoe2/cNirfjYzW/P+nfIcgx1Ye9Tc3QsrlDu4iiwlfIQ64hPJAqh+if2a+GoZ3TODQrt
 KLt9KZRsAuNGBstNmHKHsIMK8XOq/I8ZeQv/ksmt8T2nGw4+Jovd76NkwMV6fTp0EySt
 5ZlqSnmRW6MpEDxfghrg9Zz9Jz7BwPa5inTIAn3JT2YT8CRhW8ZRj57gs+o3qHIM/eXx
 SJzC60lVwB7/+4z/pZaa7pIdT5nn1E3idw9yUF0YSWpk8248Wm+9YztwK7xK8/NNo7ek
 wTYQ==
X-Gm-Message-State: AOJu0YyRVxcyQe+WjPMQpk6BVx7Uipl0e5QcBHXFr5eW4nTQ+/oI8Bmr
 Ewlqx2ST1z7Jq1BY+3LUiR0APnawdvI7TZyIrNNTIQmnulR2HpsYppr9NrsEWlQ=
X-Gm-Gg: ASbGncumQjMOWp1F9ulFXQ8082UQ0BlPuisPcIjxAhJkc/0FO4pwSBPvh0+hwHt0+p3
 X2NfqdzAxllkYTELTQbVFwWEJci/gg97yQ6+l1qx+HRRs2B7xWtjMu5hoJv+67epd6yi8jIiRlI
 yt09OyGjrYPGxuCOCSmIzywiO8NYSx4cot4E9zcBrwG1GrFIjYrUDdTBvAUUQJX34YxCJL7Iy71
 HoVE27nwLjnXKYrQu0q0az+ZrhmrQomGA2naEbDOO+S8SlriESt3l6mzZKZJ1ME
X-Google-Smtp-Source: AGHT+IEqVd0zSQub31oV2g65K9x/pjyEkinx0KbkdvnnKPyCFsvSxarjDL/hYDMYWbVAGaCyIhNstA==
X-Received: by 2002:a05:6512:3a90:b0:53e:3a73:6ddc with SMTP id
 2adb3069b0e04-5422953c384mr5965630e87.33.1735081824409; 
 Tue, 24 Dec 2024 15:10:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:11 +0200
Subject: [PATCH RFC/RFT 3/9] drm/display: hdmi-state-helper: handle CEC
 physicall address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-3-b80380c67221@linaro.org>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j8/VCHgmb1raNVFOKXZe7b5PFQfOvnrzhw7RbdPY+gs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9V7pF8AmPHdoSaF6VBQtkkwzHsayf+rKMgP
 P+HfcDklDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VQAKCRCLPIo+Aiko
 1S0pCACOQ4XE7VYVMUKjPFSrgvVqFk9iSmwZpK8Dtwv1Vy08pv5j1GB1fJC9MZhVRUd9KMjlJF1
 wGd0R4RLFh6kJ0I0o1dWtmUwyh02bpZISXzErwCRlnJsW+i+cCO9WpN6aTvGd0Ry4gq/A+EK9n5
 kP6n9tGPGZVNTx4akZwBFj8elQ3k+/DXRmtNfKevHmvfpETzPh3dvIyqV43jebnQnAvVhiifQB7
 ttYx2pyDX6Jyc+/8h9dOyBTjONVQA2DR9ZlnYN34Lx+MN8LDk03d1kcXBA3h0qNv1Xnhe15k9Tg
 ks5YVeFi//+jfUz+he55nKsHSgYld+YXwYQ7AhvCYu5/yOv9
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index cfc2aaee1da08a103cbf933c891d5cc31b0886a8..b060cc265221049f5509e852903bd0a4ca651e80 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -786,8 +787,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		// TODO: also handle scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
+		drm_connector_hdmi_cec_phys_addr_invalidate(connector);
 	}
 
 	if (connector->hdmi.funcs->read_edid)
@@ -800,8 +802,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
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

