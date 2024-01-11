Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A0682AED8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 13:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22FF10E8E4;
	Thu, 11 Jan 2024 12:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D5510E8E4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 12:38:08 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cd1ca52f31so60565691fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 04:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704976687; x=1705581487; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ete2pqNcnu2TXhEIiwhI0CAEIAFmjp8VA7JbkeZ2gsc=;
 b=GGs504jAceLsMqYYZ8+zOfW/MJN/SQd8nxLXivR7NE9/00GipSjQAxtR/HUKPLT6mC
 c1Q3c8rCrd2hTMLSqtfSM9raHfA8mJ95kF/tQcfCAqiLugVi/6HQ7rm25D3jMAK1TEvW
 BDlJAFmIZzHo9I0xFGBpicmbNwQldvoJtYBdg5iKxWS2N8XyB8YfqwPTrpTGdYISzno6
 7mSYMg4slMk0PWLEmzb9DF93T3uvDEhqH/FIqSEU2yFaOhlTLkSADkYp9GspG+2O8AEJ
 y9b7f9U5jIXF/kE371imObxhYTOmWM/M3XkfYR2dLuv54gzNsxpG+Pc/Dex8e16x5pJz
 W7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704976687; x=1705581487;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ete2pqNcnu2TXhEIiwhI0CAEIAFmjp8VA7JbkeZ2gsc=;
 b=DgSgtAu4YfMSnFC6akyFehwaTl2sFTrHdb7u9yjZ/Xyx/wjsc+lbccSgK0fkdB5Xem
 QeIvVJLO1IxEIWoJGC/5eimceEnkvmsaUztWxaLgAXz0fQTn4gJ/cJUlUfeAWXYWxI7T
 kBqofKN02pIki3of1fh4j88Ot5Tdy3AeO3i2SH37qco02zWUVjEMrOEqSsbOING8bxWc
 OQ453+8WMARrRH42azTyqM0p90or8q2DmlQoTsXbkssfpl4RH+BofNWIRCD+4OIiOvxH
 L+RrNq8qVaQnBm0JRORCPpO/BTtIxoRP/lIdBkmGtnC0fS0EwUiJOMBpkh2uGmssRYQj
 edaA==
X-Gm-Message-State: AOJu0Yxo2uxNxRRog1kTnN3eYPvH9RCQ2zqKvWD0YaP3zWk7cwKyHqcJ
 hTB8SwOAWWgYV7oUPeGT2j5C3+UnkQDWVQ==
X-Google-Smtp-Source: AGHT+IFTsRjfKAYEB1WoIzCnUMVluvPztCiMvi0dNrHcRqljUomoEzLhD3e7B7ZU/QBhuo7P3pyMMA==
X-Received: by 2002:a2e:2a83:0:b0:2cd:8276:933b with SMTP id
 q125-20020a2e2a83000000b002cd8276933bmr354940ljq.97.1704976686890; 
 Thu, 11 Jan 2024 04:38:06 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a056402185700b005578654b081sm567335edy.23.2024.01.11.04.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 04:38:06 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 11 Jan 2024 13:38:04 +0100
Subject: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
X-B4-Tracking: v=1; b=H4sIACvhn2UC/x2MSwqFMAwAryJZG7DFD31XERdqUw34aklRBPHuB
 pfDMHNDJmHK8CtuEDo58x4VTFnAvI5xIWSvDLaydWWMQS9/TGOkDSdhrz7wdSRsZuu6LkyudQE
 0TkIqvnE/PM8LcW1MbGgAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
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
Cc: Luca Weiss <luca.weiss@fairphone.com>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
bridge/panel.o to drm_kms_helper object, we need to select
DRM_KMS_HELPER to make sure the file is actually getting built.

Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
be properly available:

  aarch64-linux-gnu-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.o: in function `qmp_combo_bridge_attach':
  drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3204:(.text+0x8f4): undefined reference to `devm_drm_of_get_bridge'

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
I can see "depends on DRM_KMS_HELPER" was removed with commit
3c3384050d68 ("drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS")

I'm not too familiar with Kconfig but it feels more correct if
PHY_QCOM_QMP_COMBO selects DRM_PANEL_BRIDGE that that's enough; and it
doesn't also has to explicitly select DRM_KMS_HELPER because of how the
objects are built in the Makefile.

Alternatively solution to this patch could be adjusting this line in
include/drm/drm_bridge.h:

  -#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
  +#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE) && defined(CONFIG_DRM_KMS_HELPER)
   struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
                                            u32 port, u32 endpoint);

.. and then selecting DRM_KMS_HELPER for PHY_QCOM_QMP_COMBO.

But I think the solution in this patch is better. Let me know what you
think.
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index ac9ec5073619..ae782b427829 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -8,6 +8,7 @@ config DRM_BRIDGE
 config DRM_PANEL_BRIDGE
 	def_bool y
 	depends on DRM_BRIDGE
+	select DRM_KMS_HELPER
 	select DRM_PANEL
 	help
 	  DRM bridge wrapper of DRM panels

---
base-commit: b9c3a1fa6fb324e691a03cf124b79f4842e65d76
change-id: 20240111-drm-panel-bridge-fixup-5c2977fb969f

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

