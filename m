Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032B5453FA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01890113FA4;
	Thu,  9 Jun 2022 18:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB6B113F7B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 18:19:22 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id e9so11512066pju.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x3m9ez4cM4hiYs276hV/EUX/qeGe+tzFYgA9QX32RhM=;
 b=jkK73066+UxvJ5xFs1AtNV3sHc9/h6S8mJVHGO3CFCC+9KuwpwXefPlSAW5U2xfllr
 HHaHLrfTss2GcS9nAoLug0IHIr9n1zKvu6SDZlqz3j3Ft+SZouLsl5pqvJiWJBd4aULj
 ocBiWRPWQMUCK/Q7DmcT66O517yBB8lA5ti2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x3m9ez4cM4hiYs276hV/EUX/qeGe+tzFYgA9QX32RhM=;
 b=sDuQlP3QjZqER0SvG3l37+TUD22AcEPIIAf9AHb9o2RI/j1OQelthkl+9YlVe35goK
 eQYJaLP/p/RPGoVWRwwr0k+s5v5TGAy2E72AZMHNNXkWXvxW5O34c+eULwsLY9ShxGra
 T4ye+j4XmKcI7pGgSkIvVdWRD+EkksxO3EtD7tqwdgt0fghcRGxAIy5N+15iQD/uEVJl
 tLgFWxhsmwxK8+XgGmzTuqGUJKzpixPZgjGhCntFZfyWfona56dkOrhtfI/CqG8F88yS
 iP7XkYW7eFshcVlPyxPT9rmmn/Z++44+PJDuhQUhcViyVP15EGaTzShHaEp6f/Irk2Rd
 QtaQ==
X-Gm-Message-State: AOAM533oqj/aLzzc4KVOHJa7oSejL69j98pLTtmadLc2h79Z09uf63qQ
 WgUHX0HESMFFIUcBsCqmpv6rpX5+aT1NwA==
X-Google-Smtp-Source: ABdhPJzhlzTGKke4dLwYx4GBwR8EWUUrWbpjJrMKK7ZTUdjPnXvKfnhCIFdSOp1vZlUMaDGMYuXWDg==
X-Received: by 2002:a17:902:edd7:b0:168:b0b2:f0a3 with SMTP id
 q23-20020a170902edd700b00168b0b2f0a3mr2412619plk.20.1654798761971; 
 Thu, 09 Jun 2022 11:19:21 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a63ec4e000000b003fb0354c43asm17728049pgj.32.2022.06.09.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 11:19:21 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 5/7] drm/bridge: anx7625: Register number of Type C switches
Date: Thu,  9 Jun 2022 18:09:44 +0000
Message-Id: <20220609181106.3695103-6-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220609181106.3695103-1-pmalani@chromium.org>
References: <20220609181106.3695103-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Parse the "switches" node, if available, and count and store the number
of Type-C switches within it. Since we currently don't do anything with
this info, no functional changes are expected from this change.

This patch sets a foundation for the actual registering of Type-C
switches with the Type-C connector class framework.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- No changes.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 53a5da6c49dd..07ed44c6b839 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2581,6 +2581,22 @@ static void anx7625_runtime_disable(void *data)
 	pm_runtime_disable(data);
 }
 
+static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
+{
+	struct device_node *of = NULL;
+	int ret = 0;
+
+	of = of_get_child_by_name(device->of_node, "switches");
+	if (!of)
+		return -ENODEV;
+
+	ctx->num_typec_switches = of_get_child_count(of);
+	if (ctx->num_typec_switches <= 0)
+		return -ENODEV;
+
+	return ret;
+}
+
 static int anx7625_i2c_probe(struct i2c_client *client,
 			     const struct i2c_device_id *id)
 {
@@ -2686,6 +2702,10 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (platform->pdata.intp_irq)
 		queue_work(platform->workqueue, &platform->work);
 
+	ret = anx7625_register_typec_switches(dev, platform);
+	if (ret)
+		dev_info(dev, "Didn't register Type C switches, err: %d\n", ret);
+
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
 	if (!anx7625_of_panel_on_aux_bus(&client->dev))
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index e257a84db962..d5cbca708842 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -473,6 +473,7 @@ struct anx7625_data {
 	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
 	struct drm_dp_aux aux;
+	int num_typec_switches;
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.36.1.476.g0c4daa206d-goog

