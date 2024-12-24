Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F5C9FB896
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 02:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6803010E5C5;
	Tue, 24 Dec 2024 01:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u1364vi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D1310E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 01:49:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso5011480e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735004905; x=1735609705; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=;
 b=u1364vi29cDbCAkfbdjEnpMHnbWicfgj+GnmZ1MCK8xtRrXHOPKS/oiztzihVNsABc
 ExeWhJhDTBx+pz8dpYq+VDu7MRhvwZvdztKc9GztoZL576ajqRuYNVJM1l/AG7nHRN+d
 JDpFbv9a0XvIm/OO++CYQsZQImIdArojA5BPXz52l9fANndfGEXmASWmJMHOACV4eg/6
 wNhDGSsqNVjoVjXoOAKZn44xfRbs3NhbiXYxJDfKOvASWZoedSWnSVX7fBPpynprVbVC
 oV4oiHudsfyTTODuNjl4hX8ub07QCFxd3cvRSI0hq3FcMBlbPOVYYtqj6le+WQbBUco2
 Is8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735004905; x=1735609705;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=;
 b=BEY38XWW351yraez5iCNuQjpV7uh9/fa6YOV73bnjttke+zSOpTbWlBtgZkl9+GVuR
 8L/bhVktXuNrOTV4rF3ltsTS9cGEi8W+CE25n8StGZOUPp1+wQY1XJTAC2xz4l5RDgMR
 sn/iSFJxP3qZwprYi1LmXlvnpHAB/ieYcdBOMq8CXH9Tbv8i48B+jHqdf+FV0Vg9xSQI
 5uiGqoKuiomTuK6RGgQbtK07tmpf1H4SGq00tXAsFvJFeAioAkYZ9OW/m5g3WWKWjQN+
 DCE/OdXLWVZ4SIRIUuhNRguqs5x739/qyVeQhYqAM3/+chFyBM+69cvYf6yksA/EcTqb
 YZ0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAsQhJKoIJl8VPdsuVQS2GfdQKOCBFmeGsGkm5Xv3ZpUUHtpwzlzNBzLTUYooX3+b8gi4GeUmee38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhQW8AdfGyqxtovOty7qxIdM+NMmvoMkTXCliZHezLf3IGD65d
 XXXxEfxowYWf4tDJ5mnimCAEyx3YjeHJrI+9ohUrN/Guy1anFPllsVhEvKeM4WE=
X-Gm-Gg: ASbGnctsQxllkZRIbnpLFy3Cvl9IDkk+mreXeDyYOS2CYTZqnROCJjj+4LY//m6Ju2S
 hJO6Xek93lcZI5eauCF35d0RIELTtTVlffA7cIXBWuoDn9xvJWOcCf35jknck0J5KZ6Jg/gJA0b
 vu8TWldXEYLV9Z8Eswggng0iS3SYrRwcQDMlVtMIZUAK3iF2OS74f2vpHbLw41nhIDjTpU03Fh6
 CD1I7rMOJvSmLaxcZRBi/wqN+MJZJBZirknJI/SZ8lPpHVKCpLbjRSYoUAurola
X-Google-Smtp-Source: AGHT+IGxywAHlZ5biHokHnOEm3MPf0yFL5QnCm6g8X8iUKGFmxEoXLpi8MebkWFCTzgOs9+bQfvDzA==
X-Received: by 2002:a05:6512:1245:b0:53e:395c:688b with SMTP id
 2adb3069b0e04-5422956b5b1mr5020537e87.47.1735004905376; 
 Mon, 23 Dec 2024 17:48:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 17:48:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:48:02 +0200
Subject: [PATCH v10 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-10-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=B+VyVi47xGS5Rgo1fXAf2iMXQyx6B0hUm57mitVwu5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLO/eNo/39x/HJrv+HFXwG6d8BCBlotDoJCU
 qqGZkD6mo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzgAKCRCLPIo+Aiko
 1TWHCACeIhaoB+aD1Id5dsTO6uA+nC/AVkJRJD/7UYmW8Ex7Zn2qDhEmWtBdITotMWW3ByYkUvj
 uWd356HEakck9NA8ieyZDfqWEWxIYpA8KfFQcvIFiYtmcFLi8kJSZDn50oFIpYvQaj2/gM0dAUN
 p8u9lmdLuAdFhoJjHaZawfbQ74cmm6k0F0FhKKbhW+u/RzdcsQu+fDZ+GzwQfElhQt5Cabh9VTD
 9m+cMW8Yv8g3rD7N8BgPs/xSnrX5W/1NqXWaD3O5GzP50Iks3oWr3bfaQmjdOpjCu4PWuKpHVmB
 5WNoz9+G5V+lgNo6KogfIsR04KOp+MyB/Lr4QH+DuZNDR5I1
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

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4949171c28876a9145ddf03e99c00feff4df255a..47d9ada98430634cfd8c1e21c2a4d00d501bab7e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -384,7 +384,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -406,17 +405,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -550,6 +546,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5

