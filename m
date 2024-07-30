Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6B8941273
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FDF10E515;
	Tue, 30 Jul 2024 12:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UaZGouby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC59210E515
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so26935295e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343839; x=1722948639;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nb/qSKjbB/ZuPlpTHCI0SwTZiwfEpxk2uiLYY2slQL4=;
 b=UaZGoubyZmzZdox2M8nJU31eupy7CyGv9XvZkKW8FMxABCLCCy7v0rSp+lDipArZcS
 gGgxcgnfGhHU9Ne8WbIvlevVa/b8DQN7f+0625gc9RhhkKh/HHY0qPWeO4V9oUOSYyYu
 5E79sUDNs9Y8r9+u3fi+gtjkD425Ec2LwSxMfHohioyJZD9T9q8O5Rc1hZ8FgRu7TsKQ
 MkBzAVlvTUHQuptrF933jjw8nQ9zC6mf4CnF78iFsW8ZCTeItgpwaqqmFGwVBNXeIw7V
 JLEOBqIGOFoNDAs6ZriWSAPgrQwFwdtPtB7JVd6SmDlMgdXXX5QpNuhhKFNsXGIlca6o
 fQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343839; x=1722948639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nb/qSKjbB/ZuPlpTHCI0SwTZiwfEpxk2uiLYY2slQL4=;
 b=A58HrjtXRuFOeK1FUFLFkogkzwdEW3UXh24DzIfLWNl9VXDZF5NvSLQhBbn9+5rasr
 qVrFs7MtAcuu9pKrasRaZP1nT7nbSUC51i2n5KuFJps4R+hDYCCRffh7gNH1pj9JbY84
 TkWVFIEuf6cP400eLP7k1OPf6zsbOv/gtdutOC4609NGlxOdEzVr7BLs4jk7NzN1Bxq1
 JcOjaWnv8ZF+HEaVuVtDTSm5hUH2NqZsk1ptfWf9qz+QbU0Usk3ByM/nS8onaQ8B1h9Q
 gdn5Ux07VSgWcyeHBZqyodAG3D/n0hwQbdJ4cbt1WIfIPvjkXrHtRhdOp11b1Zd2AoRb
 Q8Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVovJITVMVWcdD3VAL5xwW0Klxt73mw5XHRyqFkbV7nSdDIPzDiUz4kXAQH5tLSnCLenFGgj6T9dbs+dJh0UAqcPVctliawoHxtdF/+yU06
X-Gm-Message-State: AOJu0YwIsbTzXx5fnkz6Jhh9TTRCX8bz0UnYvQjVKkxcKZsilG/mg/1l
 xTkGZXHrC9/Ee4FoZP4MvSysK3HHpnSIqD8RuImEoxWC1a/le5Zi2UgIpzbR7p8=
X-Google-Smtp-Source: AGHT+IGtrN/qyndOtU5EbVTBBPgvlT3scXPmXKI31g3Y8pvJ2hEwbqVrraWIOB4B+x6XQNOoMWE1ow==
X-Received: by 2002:a05:600c:1ca3:b0:427:dac4:d36 with SMTP id
 5b1f17b1804b1-42811d73a0cmr67316145e9.7.1722343838742; 
 Tue, 30 Jul 2024 05:50:38 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] drm/meson: dw-hdmi: split resets out of hw init.
Date: Tue, 30 Jul 2024 14:50:15 +0200
Message-ID: <20240730125023.710237-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This prepares the migration to regmap usage.

To properly setup regmap, the APB needs to be in working order.
This is easier handled if the resets are not mixed with hw init.

More checks are required to determine if the resets are needed
on resume or not. Add a note for this.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5cd3264ab874..47aa3e184e98 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -581,11 +581,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	/* Bring HDMITX MEM output of power down */
 	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
 
-	/* Reset HDMITX APB & TX & PHY */
-	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
-	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
-	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
-
 	/* Enable APB3 fail on error */
 	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		writel_bits_relaxed(BIT(15), BIT(15),
@@ -675,6 +670,10 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(meson_dw_hdmi->hdmitx_phy);
 	}
 
+	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
+	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
+	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+
 	meson_dw_hdmi->hdmitx = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
@@ -765,6 +764,11 @@ static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
 	if (!meson_dw_hdmi)
 		return 0;
 
+	/* TODO: Is this really necessary/desirable on resume ? */
+	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
+	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
+	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+
 	meson_dw_hdmi_init(meson_dw_hdmi);
 
 	dw_hdmi_resume(meson_dw_hdmi->hdmi);
-- 
2.43.0

