Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F59EB2EC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8370610E3BF;
	Tue, 10 Dec 2024 14:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jNlecyOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3F510E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:16:54 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso5700569a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 06:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733840213; x=1734445013; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YDx6hbMot9hPe7Zgw4rNyld1Z3a4kDtP9bTMjfYhMss=;
 b=jNlecyOwjF5RigDWInf11PF4eylyEYylrYxaEwlHV2+ua0X6VbOXDS+KlWc0+tTcyM
 OUS0vH5cnRuYbV2DJLSGfgkLFAYyLu5xXHg8tiI4ISAZA+mNpsoJdJL+o23xk3uMpxJn
 cahR3/BZ214qiKlBsI0dnKhxyR+Ht7dv1kEJr07wZxgu0DDFv/F5eGl8MjVXs+I4lIVN
 OxAHJ7+2ZWsSvHVenSFoSO0C/xbyQf0jvnm96j/W7Z54ZbSvMMqMm1Q8JqYR5OTIJTyb
 GxXCE12E2zThAgNm7In0X3eheZCJMJBKw0zWZqUh688RVNmR7Nw+9Gd72LmCsJbgwhf5
 ye8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733840213; x=1734445013;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YDx6hbMot9hPe7Zgw4rNyld1Z3a4kDtP9bTMjfYhMss=;
 b=GaXypxA23de3H6zijCbgmARYORnFbrqotsoIRJHv0MOhK2RoEs46X9Bt4zVQchUlE3
 BriEYYwBCaaO0erSsV8bHInNAtpG9Imq/nv2urUB06GVT02zSQ4oAcUuRWqHY5t9fQwi
 pLPd/KF34EJnE1CPQlYQC3D+WgLgJZKrTUU/VFo1/F0s2Gm+6Aq1I68Zw8PwNkkB07Ml
 LVjOp2GVo8iL6YHpCjlOG3szknxECFr+JM4lXbL9MRWcAWupK3J7i2/hyKi/sVHulg3e
 /i25Ynol71CtwcmWm4LW5OSuUZURZQPjswezNMvJFVwukD5BsPXZzKABPCyMZE8pwYNi
 +IAg==
X-Gm-Message-State: AOJu0YzlmjlXp+cZC9qVg+4An2ccriONplStYv2Hnrtra3mn7sl3SMyS
 T8tZpnm+OUROS800Ecp0UrJvV/8nsv4GZUT2rzVkzzORUFW/Uid1s+ZxSQ95zMs=
X-Gm-Gg: ASbGncuMbkA8VEfMBm2UDnvABzkr4/fSPe3qP0d1a6pGFuwy1iY68Ag+KCXv4pI10yb
 ByU9u9Pgt4n12RnHpUgEZR9SJnlooVSyfcnNVrP1tZKAXb1cqJd4ad+OIAZt09q9oHfi868NHho
 WWydw/jvx7TkFwLsuWdE2Uqq6X/K9UyJ7bO5u+wJ1cCrvb9lKPaODDrHbUJoBA9AJZasCmQTiLq
 Slo6aixpzXQIH0DNk+SAhfEv73C9QfzMISUAt+StRwlIy5jUY6Qi5Qbz2FRGQ==
X-Google-Smtp-Source: AGHT+IGWT8mMHqxsdN4hdP58Pe8rJU3Stb8+4FvxSrZ3iQfKkTBWo2xyAfZGSkKZNrpT0n9roYgJVA==
X-Received: by 2002:a05:6402:5212:b0:5d0:b1c4:7081 with SMTP id
 4fb4d7f45d1cf-5d41e163a48mr3441285a12.4.1733840213072; 
 Tue, 10 Dec 2024 06:16:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3dc2602b0sm5104362a12.18.2024.12.10.06.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 06:16:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 16:16:47 +0200
Subject: [PATCH 1/4] drm/display: bridge_connector: provide atomic_check
 for HDMI bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-bridge_hdmi_check-v1-1-a8fdd8c5afa5@linaro.org>
References: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
In-Reply-To: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=w8Xw25H9E0EowRWue4E3JonkkP8YUynIV0Mvq3TC5nw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWE1R5NPKL4rqV+jR0KPOXn80x27rRanZM+VQ5
 Q4r9GgPzaKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1hNUQAKCRCLPIo+Aiko
 1atnB/9dz6pBR9aU669+5H2pdnKug29xlZBRPLZmzo+E5oJewM3cZD09he4jEBfGB6H63phwgKT
 PCpN6NcXKee8q0yILHUXjqQPoq0+AETXNH6uHzI0+4meAAff39OFtOxfONhTOBikdBNVu1/L126
 34Smslj0Au4U5ptSosFI37VyPtgVeA3YkXyr762Thi+gFQikGCujFrG4rmoYiMn7YiCtGjO2kHo
 bAYnERIBIUqUoLvx/uC1WeTp2w3aS+e4u4SjSuB5yGIiPaOyqOw5Fwn0eyiotVWCwsbb0E6Oc6E
 XV7eLYsE+JEFYPpHPhaLSGyysWCYM1XeqIHTJMgcP4HrwECy
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

The bridges using HDMI connector framework have a call to
drm_atomic_helper_connector_hdmi_check() in their atomic_check()
callback. In order to reduce boilerplate and make simplify bridge's
code, use drm_atomic_helper_connector_hdmi_check() to implement
drm_connector.atomic_check() for HDMI bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 512ced87ea18c74e182a558a686ddd83de891814..f6e0b6f1ffdd392ee15ddfd9ec85452a88122d42 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -313,11 +313,24 @@ drm_bridge_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
+static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_state *state)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hdmi)
+		return drm_atomic_helper_connector_hdmi_check(connector, state);
+
+	return 0;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
+	.atomic_check = drm_bridge_connector_atomic_check,
 };
 
 static enum drm_mode_status

-- 
2.39.5

