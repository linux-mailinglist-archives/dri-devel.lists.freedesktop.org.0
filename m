Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE0E13020E
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245D06E416;
	Sat,  4 Jan 2020 11:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB2E6E348
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 21:19:14 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u1so45082435ljk.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 13:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Pcy26vAFryVufR6iah3Cz6DzS4v146tdiFC6eZgHfpw=;
 b=Ro7d1Rb2XfZUPny5iHS7M6G4mMWZsWQkDt3mq/qzNZ4XlGUVTfqLy72PCANZ0c4duB
 jv8O8AqUUKGigh/N3ztiINWsugq7IxoQaqieFBLWqxxtcbO3wAzxCiJ6kJvyABsESXzS
 AxOnstvdOC8fx/wKtDfb4m97gUd4qJB4YPvvlQ0y8gL8EIMiIhUoVL8IqEswtFGYmCs/
 z7nLVfVB4Z2MKpFHG33fX65kIg2RQY+t3ZO7EcQOwqOJq/AUk6kuJ5O6yzX9rNg0H4n8
 7JxBh6nrA90TAfGZ68IDQZZZLQOfSZaM5L8lv6MUw6JbhZjHUJvh5YglLrI0buTMns3I
 L82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Pcy26vAFryVufR6iah3Cz6DzS4v146tdiFC6eZgHfpw=;
 b=j28f0/1TIqs4PN/GN/wMI8Si1WKJglUielMO1t3oI8IO57MXs7R8m+kNEEa4jAr1PK
 LiOKiDUlMfWHqZeK+L3TKh0Pav/mt6niiH8ow8vXjpmnQ7HQKOTceoXamY7U+IF/G0nu
 OF6idJl7yDzi/+u+ATJNwufBZmxfjdZAWO09azQB1WqRBZcFaAVpJa0sGpywyh+o+If6
 IlicrxNCcj1MQd3nFnXtGDc4ck4HriFPwCoDRCm8Xjqivzu1OMQHdmDTBM+dvMDecnIN
 fJZ9gfozLWyUVt1TYEkzr/5NoimG7wEN9sT+7dYmJCUt1yEexeYNT0IBneR/eipbCVHd
 HXVw==
X-Gm-Message-State: APjAAAWXL0bNEY0zenMH1BOiyYD7z0N15zVK0XRoPBHvOfuGMqCVLkb1
 onwL50d1CFVsbw8V32vidR4RDw==
X-Google-Smtp-Source: APXvYqycQrpbkGFvM2ianZgH2VEUnxOneZBSi6h6ThLUUNlzVzXlDqn3VgkF6JwHys+i0Gj9b5zfFA==
X-Received: by 2002:a2e:7405:: with SMTP id p5mr54050383ljc.34.1578086352951; 
 Fri, 03 Jan 2020 13:19:12 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id e9sm18107683ljp.75.2020.01.03.13.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 13:19:12 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [PATCH v3 1/2] drm/sun4i: Add alpha property for sun8i UI layer
Date: Fri,  3 Jan 2020 23:19:00 +0200
Message-Id: <20200103211901.44201-1-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

DE2.0 and DE3.0 UI layers supports plane-global alpha channel.
Add alpha property to the DRM plane and connect it to the
corresponding registers in mixer.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
v2: Initial commit by mistake
v3:
- Picked `reviewed-by` line
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 29 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index c87fd842918e..4343ea9f8cf8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -72,6 +72,27 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
+static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
+					int overlay, struct drm_plane *plane)
+{
+	u32 mask, val, ch_base;
+
+	ch_base = sun8i_channel_base(mixer, channel);
+
+	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
+		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
+
+	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 8);
+
+	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
+		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+
+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
+			   mask, val);
+}
+
 static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 				       int overlay, struct drm_plane *plane,
 				       unsigned int zpos)
@@ -288,6 +309,8 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane, zpos);
+	sun8i_ui_layer_update_alpha(mixer, layer->channel,
+				    layer->overlay, plane);
 	sun8i_ui_layer_update_formats(mixer, layer->channel,
 				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
@@ -365,6 +388,12 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
 	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 
+	ret = drm_plane_create_alpha_property(&layer->plane);
+	if (ret) {
+		dev_err(drm->dev, "Couldn't add alpha property\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = drm_plane_create_zpos_property(&layer->plane, channel,
 					     0, plane_cnt - 1);
 	if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index f4ab1cf6cded..e3e32ee1178d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -40,6 +40,11 @@
 #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK	GENMASK(12, 8)
 #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET	8
 #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK	GENMASK(31, 24)
+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(x)		((x) << 24)
+
+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL		((0) << 1)
+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER		((1) << 1)
+#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED	((2) << 1)
 
 struct sun8i_mixer;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
