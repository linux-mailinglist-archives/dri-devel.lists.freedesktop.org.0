Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88317A5E0B0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98C610E31B;
	Wed, 12 Mar 2025 15:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AQ/6K4m3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47CA10E31B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 15:41:22 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso698714f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1741794081; x=1742398881;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gb46eQM7+CVkQmzVbS3/lfDcFEqWkPNQKqTN3kDSSdM=;
 b=AQ/6K4m3zMwTsu2r7Eoz3/k68Dt1miOvYGZjemM03SIZW6FZClxdkDsf3ArLE8QdvA
 0RV0Y9ZKvhKPIFTmMAAlFAzrGoeNLhiZTJjIyQ0IN5P5h0OmkbNGU2ZE9b/xzpDFvpM4
 CRPtzuO1YPbOrW+Kgsiqk7WP8CiWat34F0ukP4u9xOfabGkkYDDGyLoXNgxuaO5/ci/4
 fDIUWM3atFts7c7NxWdy7Hg1WsF3yq/R+lQaJZw2qIHyYRqorCzoGHe9pmDBoWVbF6E1
 Oi8zLebY71J9hC3t/LwCAXalqSxsGqyx1CLFW2XTu4bXaP2hv2n89NOA95bFGCbJjzVM
 lqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741794081; x=1742398881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gb46eQM7+CVkQmzVbS3/lfDcFEqWkPNQKqTN3kDSSdM=;
 b=AQ8G+CSemI5cRnZicnIKnmmOHtKcHKrI/abfpIIhtIzrHc50knrtYDRJclQPh7CDHj
 SU0LQaTJPnaopw12YMwkoIYPMp5imcaU/9rCyV8gCPF2QLJjC08YemUM+PffYKSdKJQ1
 gHLd0CFf0ik+zoPdnxznRdGMxSA5ftRHgrS3csRc2Mf9ofp58DQAhZHOpsGXGKOzlwR1
 aYZlCoyGPEH2vwCpbNtduLvTR79zoKXeAhQq7Hft1WinqMxjckA+/jTcZnrRBS53tlT8
 gPoLIscekX0Ttxe7hM6xXQpn15xcemcvl/f8De6kHe20pibwm3WDNroK11fB2XeT7Alf
 vIsw==
X-Gm-Message-State: AOJu0YxewearsrBhEMvES8Cwwe/ufK/CrkFF4OmJehYp7lygbWmVwkvo
 t93nxQewvQjPngw9CSFfBqb/i8Xgxo71hwpxwrsjhjFt9I/Dbs2n37+loqjeLkE=
X-Gm-Gg: ASbGncvtVyCceVldbehEfh02U6FsrgfT+P7m9WDC77wT03tEy5o2gXYIOcCE0B49aK+
 49JoyG7txOHp8fXcHmwQ2+uycGW2wh2Cqr8iC77e7tFQQ+VsN+JiLKPkIHenD/zQv+7L3wfOHPn
 7fstVenqmNtIegbIL4yan0xoHFsRMOIwRU7ltzfq9Hxvu67IMyjgtccFip/zqyeXouNo+alI0Y3
 EDjKdEffVpbfF8ZZeT5iukAgV1mOPJd9d8HYrhB8Q276oFrTMhozwr4xBgnJhEi/DGXjYvq2oIK
 cEfxFboTAFDqoZj8chiEbJqECqMb3NEu+g==
X-Google-Smtp-Source: AGHT+IHO2xtqa0eKA3kIWpS01nWKqjAWxmL8m4XDQ+natRRteVkEJfnmAkGJbqtsK8K6YGcTWKcKdw==
X-Received: by 2002:a05:6000:186b:b0:391:2884:9dfa with SMTP id
 ffacd0b85a97d-395677a841dmr101808f8f.13.1741794081200; 
 Wed, 12 Mar 2025 08:41:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a78bdbfsm24374915e9.25.2025.03.12.08.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 08:41:20 -0700 (PDT)
From: David Turner <david.turner@raspberrypi.com>
Date: Wed, 12 Mar 2025 15:40:55 +0000
Subject: [PATCH v3 1/2] drm/vc4: hdmi: Call HDMI hotplug helper on disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-vc4_hotplug-v3-1-d75878677de8@raspberrypi.com>
References: <20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com>
In-Reply-To: <20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Turner <david.turner@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>
X-Mailer: b4 0.14.2
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

From: Stefan Wahren <wahrenst@gmx.net>

drm_atomic_helper_connector_hdmi_hotplug() must be called
regardless of the connection status, otherwise the HDMI audio
disconnect event won't be notified.  Also update the comment on
drm_atomic_helper_connector_hdmi_hotplug() to explain that this is
necessary.

Fixes: 2ea9ec5d2c20 ("drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: David Turner <david.turner@raspberrypi.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index c205f37da1e12b11c384670db83e43613e031340..d26d51902ba1a73175b23eec71562a30ceda1082 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -816,7 +816,8 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
  * @status: Connection status
  *
  * This function should be called as a part of the .detect() / .detect_ctx()
- * callbacks, updating the HDMI-specific connector's data.
+ * callbacks, updating the HDMI-specific connector's data. It also needs to be
+ * called for disconnects to notify audio users of the unplug.
  */
 void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
 					      enum drm_connector_status status)
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 37238a12baa58a06a5d6f40d1ab64abc7fac60d7..37a7d45695f236d3ab281d9a8676921fd434955c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -372,13 +372,13 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 * the lock for now.
 	 */
 
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 	if (status == connector_status_disconnected) {
 		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return;
 	}
 
-	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
-
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 

-- 
2.34.1

