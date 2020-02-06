Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4E154BDB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFF96FB1E;
	Thu,  6 Feb 2020 19:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FF06FB1E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:18:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u6so8610325wrt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYTni/YaBkgYSQUn7nXBaoqEYGtf4zrlvskOsHha/TE=;
 b=bmdEfnPnck6nyJBX1ADt368GsRzqd4CbXNpRlPtBo14FVVOOROz0eUc6IapgJNTBwM
 xcfeQxcyE+uODfH2zu2aCS3Uo0jcRZ+YAH94rhk45tk0+ATLvcma94RKPGRE3hEQ9J9p
 /j6iWX/esvHtxwJy7Y5G3lJMGt9dGPGPHb0yRj6n62bS/OAF9Vjy6W8bTrK2uX+G6tN+
 ailRf0TH67OMFrt7Q0SKGEzZUGDQGs6RtOIELCL/Nn53VIhlgVbjc93mTQb2R5PcXo3e
 Am5rL0zAnodwNstQ4AA8fNadUMjwbI/qojOC2lJYz3BnUJXAdFKS/klFxMpXdlORMdVe
 Fzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYTni/YaBkgYSQUn7nXBaoqEYGtf4zrlvskOsHha/TE=;
 b=alHs3/AfcDgfrEOpKa7Z9akE4J2ijQ0XU/XQr21gB5novetrEqGrOXCvGLTvvbx0mG
 un+D3U1R8VBgaQReC4TNkhQv9pfvF2udc0YIvm6YLguiNKc3GDcyzGw7DlcOGsWjf0eL
 kSK6s0V1SK8Pa97n/5I38n2VlBojICAaP8bAuC0NQk8hVIF0F/sZtRZLRvUi/3rNVXXI
 7nIucjaPsMiF+hF3aLqERdWNVHTXgR5TxBBdBNzPj4bVYYGWIEgXfANIG2T9ZVtJnE46
 v7ynvs6X13WvF7mGHaBjl9KynwIgmz0CJWWOgPGHl6/odsmUkYyzvQ3C5NAljj1Bemku
 iymg==
X-Gm-Message-State: APjAAAX6pbWFkR1PYu260jy1fd76gnQEM3QOLhq+RSbZSNG3Vm4R6Bgr
 nvKV1+eqVX5/rtgbAd/Vxiv6rQ==
X-Google-Smtp-Source: APXvYqwQ2YaIscLYLTZlPv5SR3uwVCyWbeNrLfCxatvYPEfxDKBWb2zLGGXHVocZnr1kFsNujoV31w==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr5253101wrv.196.1581016725325; 
 Thu, 06 Feb 2020 11:18:45 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:44 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 06/11] drm/meson: venc: make drm_display_mode const
Date: Thu,  6 Feb 2020 20:18:29 +0100
Message-Id: <20200206191834.6125-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before switching to bridge funcs, make sure drm_display_mode is passed
as const to the venc functions.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 +-
 drivers/gpu/drm/meson/meson_venc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 4efd7864d5bf..a9ab78970bfe 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -946,7 +946,7 @@ bool meson_venc_hdmi_venc_repeat(int vic)
 EXPORT_SYMBOL_GPL(meson_venc_hdmi_venc_repeat);
 
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
-			      struct drm_display_mode *mode)
+			      const struct drm_display_mode *mode)
 {
 	union meson_hdmi_venc_mode *vmode = NULL;
 	union meson_hdmi_venc_mode vmode_dmt;
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 576768bdd08d..1abdcbdf51c0 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -60,7 +60,7 @@ extern struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc;
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode);
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
-			      struct drm_display_mode *mode);
+			      const struct drm_display_mode *mode);
 unsigned int meson_venci_get_field(struct meson_drm *priv);
 
 void meson_venc_enable_vsync(struct meson_drm *priv);
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
