Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB352307EC9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6337E6E9FA;
	Thu, 28 Jan 2021 19:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E3B6E176
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:39:52 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id r14so5931231ljc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GwaK0ImJaC9c729h1o/PYM4X2HOiHraHW9/VM2R/O6o=;
 b=Q25E3kmtsgjZS2WHGCmhD0UbDB5COo4hjuuoI5Rbw6WQQy3jLJsEjeILxTWNEE4AeE
 C9DyR7wiMzwZShVXNZh/z3cYFQJOAgJf/N42K5hawJd2DONxTZh0rSFzhWARxboxKppr
 jiaNtOcIHfge2ypZO+lT6KDS8MvKBMky0FFAjbOgB6sY20kK8mZfkAQynD/HUD8aVA1e
 htibBP4OGWH07eXzBvn//EYu1ij/dqe3XKdcU20B/TIo/033jiq1p8r5hzumL0UJnMbL
 Mlq279uKlaKVIy4UuYIumMg7RjFsSyYvhQAsOyUXCMn4YQ2CgUDdyOHFoUWGzCkwsO11
 6BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GwaK0ImJaC9c729h1o/PYM4X2HOiHraHW9/VM2R/O6o=;
 b=i1PePy1CC9v2D/oEf7qMof/g0HDIy9bFahjbt4mUOk1uXhAcOIBXsYsB4vSR5Npk6w
 dSR5AXUzDIloMaElVl64sz7vZL7H1y33KTh43E9TOgH3DB8n6akh24TEtTztTRekSxS9
 XXTFtYZ5Jy0t1N+bap8dR4BCRgoM/gTk5hdUuprp/E9DoFx5nWWToZU7xjICC1e7U9tH
 u6NCHKOW07oR6pBjBpjjF2COf0rOjgrqMbFY0ccbIMofrI6ejenBarOCk4/pBeukWPQk
 OAvmzFS4o3yfWImUehRbzJJV9qDKWKGiMHJJv9EAQ4YFCTBFhC2m4rl5DvTJhh7PleAd
 6SrA==
X-Gm-Message-State: AOAM533V9bqfwQRr+dEjLiKluz8PfIgvB7LRbhm21JH5VPfHP+/8W3pT
 QCt8OdOl98V8pzu8YNq2PEI=
X-Google-Smtp-Source: ABdhPJzwCLaVLwtBPURsCwIT7hYOp1mbLY8rHXJ2rMJkyoLxQSmNnppCuPCbOuXb1VJ7ONI7GDkpGA==
X-Received: by 2002:a2e:3515:: with SMTP id z21mr7941384ljz.73.1611833990610; 
 Thu, 28 Jan 2021 03:39:50 -0800 (PST)
Received: from localhost.localdomain ([188.163.52.44])
 by smtp.gmail.com with ESMTPSA id t4sm1934697ljc.50.2021.01.28.03.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:39:50 -0800 (PST)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] drm/sun4i: Add alpha property for sun8i UI layer
Date: Thu, 28 Jan 2021 13:39:39 +0200
Message-Id: <20210128113940.347013-2-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210128113940.347013-1-r.stratiienko@gmail.com>
References: <20210128113940.347013-1-r.stratiienko@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: megous@megous.com, jernej.skrabec@siol.net, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Roman Stratiienko <r.stratiienko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DE2.0 and DE3.0 UI layers supports plane-global alpha channel.
Add alpha property to the DRM plane and connect it to the
corresponding registers in mixer.

Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 29 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 816ad4ce8996..e64f30595f64 100644
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
@@ -290,6 +311,8 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane, zpos);
+	sun8i_ui_layer_update_alpha(mixer, layer->channel,
+				    layer->overlay, plane);
 	sun8i_ui_layer_update_formats(mixer, layer->channel,
 				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
@@ -367,6 +390,12 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
