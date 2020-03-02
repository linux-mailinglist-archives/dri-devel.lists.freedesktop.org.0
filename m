Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3F1770FA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B576E9D8;
	Tue,  3 Mar 2020 08:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213D16E25A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 10:32:30 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 83so7566990lfh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 02:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lA6XSsmPXQf5mrnzBqE57rsPnQlVgQ6Ap8oWgg7cT00=;
 b=MWfvCa6kEJXuqzXV+kdcxty1S6FBaGUOzTk1kthaaE069wtgI+P72vHB1qfIopivxZ
 gJnjPIXZssIAjc8d9yWRRd02fYWQ471YRC5NI9XMVu2XgWF/BUmJaS/TbvzIVy8PXdMe
 qx2VY3cvve2G/Te77pZjzix0EdrL9QeiNiv/lsHV/Ne8Bk63YQEv4IUd9alBuQd+oHyg
 BnTZWPFsRWSRCgo7I3PRDhVaFxe6pY7JSxzQQrcuIah8djX6u4wIx8mhlHvq+0xaCYOx
 WHoroY05ObJqdr+cXTp1nbklF7mBHcmNKw/W4CoEfVNIICla4LchTxlMy/FW/X2X0Ekr
 jsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lA6XSsmPXQf5mrnzBqE57rsPnQlVgQ6Ap8oWgg7cT00=;
 b=BY7hTWYx0x2JuFr7xd21xpsR+zbGxqAcnjUc6n0vGIAwAY3JO3KKT2dHvx/xbUOlIS
 tlF0ur274XoJ4K+qKeFZ7y0Z1ufK5wm459VLNWv8d0GjiIWxnlhGlLcr8bmvM8svBD14
 ETjd1ph5y8fL3Db2tN8gy3seaF3A0tizC/Snhsz+LaIENbmUR8zj2TSmjgpH7zY5L+pe
 cPhTTntXl1wpeDLJO4FvXGFTar2psYEtCbWUrVEo78z/Wbg9r8/MZWag8L0k/n8zh8Il
 HtqZIIwwXZBeeWM+HefqaIFR1ojnbuZiSx44tihZkELJCGM8qzXuzI3vcn1PfOOwcdjG
 1SOg==
X-Gm-Message-State: ANhLgQ1WqAsI/VRsJ59Oea+Gi+6C26kiv4vGWxE1BFO9Q9+8z6zPYeUZ
 eVe3va+G0I0cXKTLm+jAiJI=
X-Google-Smtp-Source: ADFU+vuNr0azHbfnA1i+aCmcAniY6aYZpgCbWZhAZTK4ySNU2/ubZ5sWytbt8JBkhYrTNwRVU8sN6A==
X-Received: by 2002:a19:915c:: with SMTP id y28mr10417617lfj.127.1583145148364; 
 Mon, 02 Mar 2020 02:32:28 -0800 (PST)
Received: from localhost.localdomain ([149.255.131.2])
 by smtp.gmail.com with ESMTPSA id n21sm3895328lfh.2.2020.03.02.02.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 02:32:27 -0800 (PST)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: jernej.skrabec@siol.net,
	mripard@kernel.org,
	wens@csie.org
Subject: [PATCH v4 1/4] drm/sun4i: Add alpha property for sun8i UI layer
Date: Mon,  2 Mar 2020 12:31:35 +0200
Message-Id: <20200302103138.17916-2-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302103138.17916-1-r.stratiienko@gmail.com>
References: <.>
 <20200302103138.17916-1-r.stratiienko@gmail.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: airlied@linux.ie, Roman Stratiienko <r.stratiienko@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
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
v2: Initial commit by mistake
v3:
- Picked `reviewed-by` line
V4:
- Changed author e-mail to avoid mail rejecting.
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 29 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 19f42004cebe..5278032567a3 100644
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
@@ -258,6 +279,8 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane, zpos);
+	sun8i_ui_layer_update_alpha(mixer, layer->channel,
+				    layer->overlay, plane);
 	sun8i_ui_layer_update_formats(mixer, layer->channel,
 				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
@@ -332,6 +355,12 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
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
