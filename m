Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29697124C07
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4569D6E7E2;
	Wed, 18 Dec 2019 15:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A822F6E7DA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:46:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b19so2333256wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYTni/YaBkgYSQUn7nXBaoqEYGtf4zrlvskOsHha/TE=;
 b=HHYoHbnhUWLFFtVMUKXFDrSEywXbuf608rVEp57miIwEjlpxnsvNbm1u8VukondcRV
 9flKq3octdI14JuIpljxK99P8A6DckOYeaNUjPPleS+9+uaanNayErhrj30E+X2BnvQV
 /liqc6+Ayuz45jEXIcrRRX40LKqfDEtzL7VL3/qr91f5UsWU7pA5ck0tVzdRX0LZuuOE
 REf+UqGMpTVgTmvX3dsYnq1Uc4Ey5uvP7cGQrUFknZM/tKGsNGU8TvTt7wsX759bp77Z
 EDjl2ocu9PjPbSP2reodNoZ6Ju/FSLjVQlFV7ZeC8AW1GAp63Km+K0Qu58aL+MQpXjnC
 XD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYTni/YaBkgYSQUn7nXBaoqEYGtf4zrlvskOsHha/TE=;
 b=Dtr3egf//hkmKz2YJOGFweTnXX6ae3Wu9F71/uvo79Ddy7ebzOBti16L06pRkGwnEt
 EJ/TXBiuL5P6vhoZFBhdpETBjO4ctGaq3C752+TErK37htGCC1mnSWyw8rI8eaoD8eLq
 ay8mdJNOKEba2f6YwGvJpcBJ7iyQ1C0ZNlpkoA+l81hfUq+E/c4+HV6Jn6/HMNcAqltX
 l83fPK8MlcVWNO5UsZi9sJ+9TJIVls8B8nI3GObFuKB0ZUTAJFVytzAutQAC7+El+JgI
 ITH/I2z/OxThZlpW1TWLd7hirRVLGKHieYR8DJQ0K6XNKHCFy1mmH+fHGeEfi1H1czFp
 CZnw==
X-Gm-Message-State: APjAAAUYhoTRzFK1FrYWVkEjsTdrxkzNNx9m3w8M4kOyUycFQjVNSk8y
 DoV08of9/tP+MjoHYoHgkJEbfw==
X-Google-Smtp-Source: APXvYqxa+ljjpYhoTTPolZyT1O82GeyIErtwIxBIE6ffnaCrj6aZtlCicLWADM3U6oPJnQUwthrdUQ==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr3800521wme.133.1576684005160; 
 Wed, 18 Dec 2019 07:46:45 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:44 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 05/10] drm/meson: venc: make drm_display_mode const
Date: Wed, 18 Dec 2019 16:46:32 +0100
Message-Id: <20191218154637.17509-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
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
