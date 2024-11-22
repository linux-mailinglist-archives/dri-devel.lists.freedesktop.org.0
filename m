Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361B9D5B8B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A9B10EB14;
	Fri, 22 Nov 2024 09:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YmNrzQWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE42510EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:28 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53da07b78dfso2093321e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266807; x=1732871607; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
 b=YmNrzQWTPfCqLhhNS+X44vHDkwLi9iZSBhIiF2Tw7zy7uidfhmAPHfe9tykZRuLkpo
 5DRb1hF6u51jpYG4okSs/ehVNMljDr/ZQzKEtIqUTYQAj10e8bPHYEeUy927I4G2FvYb
 bPQnLBXKxBwlfXSk/68cziKuTwwNOjc5mJ0KTLgE9cg7dNUcKAKmJwSRsnrHMevv98jd
 GgQN/0yreJoQLKQoE6qIvSTeFvMkUTQoOg2C4cyh6q29kg4G/PR5NZa2cLFT9Z5RG+6l
 8BA3FyyP3oHXXes/fkPDlBEuD9G8WOkcaFhr2dA73tYBdqRT5hm9XVAjMYpH96Ubiynm
 quTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266807; x=1732871607;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
 b=kXpW4TujmGE8BwMOpyp7sHxBS9tM653G8z+ODXStcS5B+q8cA86mLXkePdMwsYwaFU
 CfLOmZhw/PZqQk8ue+Ih1UPstSgxbGoB4fwTsqvZmTiDyLRaLEbXIlFblMAU5J8WwpRb
 u2es1cfWrxqYXtwoDZbLBPgJ390Vd+vS1VlZi7cnsX0u8P4TGYOB2258ySuzHXncL1ST
 j2hOxXD+ICvXbxIppqXFgiZ1YKwfSBY5d7OhVq1rw4Sobl6JQH82tuojjn/2bccCUwiY
 w9796yp5gyIG8tmEyGiXgkKnoa8bp8gPYTxX+aX53FB8+9Tz+VDFuYTgJGlBphAyJvxu
 KKiA==
X-Gm-Message-State: AOJu0Yz3PCmdFqrdxXfjnjoYKCi9E6vUN4TXD+99+4iz09vb5A0Rkp4n
 /cqAB71MCLCdzHp9ZLQwjXJa+zYv6RdrIa0rvu2eInemGvdl29QpbONUIzwjQ9U=
X-Gm-Gg: ASbGnctDRnT5U3TOA5krihNtrG99FeWeCvPsUMo4pag5VRMXzcLvwDR9G4SSigbpIkR
 86j3SZpXTdtjeroOnFdytiadE02xNR6SiHWjdw3uy4HnKb6rMBnbjB/+zR+BQ8nQpbGPQnH06Mk
 ZRABCvEBIsg4oE0WVsgjkWceWTN7rAfBLRmRJymsdQZhtnQwpD3agdcQ1D5Mg58EAV72vIJa0s7
 Gc3tPcy/WzqNnD7QZuKnfsJpUEerMhMItw/3OVLaov2yEQ3yWilTvIxkA==
X-Google-Smtp-Source: AGHT+IGP0twniqH2U7ywDpdM5USOAfTTfwclZMuf64h3sSsbdQOKH5VgJsG4NoD2/EPGUBvock6QuA==
X-Received: by 2002:a05:6512:3c96:b0:53d:a27a:2106 with SMTP id
 2adb3069b0e04-53dd3ab0eebmr902104e87.55.1732266806968; 
 Fri, 22 Nov 2024 01:13:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:03 +0200
Subject: [PATCH v4 07/10] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-7-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsipUZxr2L4H1CSYJPqrSWitJVJYT8cvGGNx
 VzJVBpVLQiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1Wg8CACUh+Qp1wI3QCkqrRc4xvtyhadjSchb8neePNvcL0EeS3MTH3BWZCvgSLpKslneK9k6yVL
 9DTKhgzCmZL0UPCkBx9as8mvdKQBUN1m/r3gplfEUsQe2bFoVBzI24JWS3ZAVJbe0RlQe5A+N4X
 EOOFCw+LkSv89UJBKWSvUvCm4ez0JYCuuQEDWX2MivOuHLjIzOHKXnubiYcFK9u3+KsRADnp1mi
 RBNUHr/fnJw+uvGlqRKuh3Z3pa9ig+V2gAlc7T2X4/0rhodFgbNr3XmxnOOKnL3E4DJ7eP9ejOS
 8KSZ5CU2TIorVoGQxGUAz2vtTDQ5bGJWekzxiEE6bqzE6v0O
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

