Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F68935DC
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF9410E9F2;
	Sun, 31 Mar 2024 20:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t9yiUp8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034CF10E9EF
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:11 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so43704991fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916950; x=1712521750; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wz3UhJ4xYSdgm48WihXb5Ur775HB6HGFpy/cnlygSBk=;
 b=t9yiUp8H+E4RHXjNbUkwSTkzDNpvXryA+a6tv7s/04m4kfsE/K0dbvvJRTEvYrWEk9
 VM4+OOgB3uS6AFIDQ4BqLnmWLkVzR2R3Iy0kWKLxzPvrsvCkGsXk8ZaCJdduicyhs/n7
 vP6fqJT3aEiX0YlUGMA6IpDQFb03tLAbI5f8s/MAgokEzxGc4fqEfHVuX8fF4uG9Gk10
 X9DBfN3dmRY6lkPQ01emTZzZvU+y1SFm/OhwgYUM/d5jLZwhQMfb+LlUM8NDfpmdiSKi
 f5D1Ty3gC8qWKSMYIPLO7UQCece1eYS+X6VGmKLpXEgix+dvag81sq8pWA+h8UxwmkEs
 g2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916950; x=1712521750;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wz3UhJ4xYSdgm48WihXb5Ur775HB6HGFpy/cnlygSBk=;
 b=MOlx7kRl1T+/F3hE76r7BU5TmwMX6qHue1m3wVu6+ZFpIIktiotOALTrJqZwoEzPyX
 0oA9t6wg3ejdKxRiWsjSOAErhoqCQk/bvIYQosBQp0Dk35Z60b3SMo2D6qhkc3dNrlBW
 BD2QfD6I3p2twHkrDPCyRL4WK9ssOkDQncZE6aD61ENiXZoZMBSdt+NR+aaA7s9ltDqP
 zaIlveS6dQ0ihGsKIE8C3lNzYY0Exi3g6G0wRTvJvh/ZibKqGox1euNtO1aRkgOtpt+b
 I08bFQX3dFaQFkLS7y7ZaEe8SSoOOcbn9He2IkKkKOSUfXf7cCRv/JTLCZjRib5+aLaJ
 3iYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3f6EwGN8mnQm3jNwx31rYRKofhUJ5zI8PfuhvgPL90FaUYhxSI6mNxVnwwUnO0OzfXZCdDGbl/AdoDijWwJKQ8hvWF0ygTqiUOAwSK9gl
X-Gm-Message-State: AOJu0Yy/dzHQI7kUvi7cCzDk1NdCiDfnTmNFKFSEFYAyBs4oNuJqgbOD
 KyOY6E5P/xDtedGIwINHWVyMDfswLeuMiXUtJKkuQput8/pnMdwREYOBCt+2kAU=
X-Google-Smtp-Source: AGHT+IEHzVhYaRRfQunRUBg2nCTXUyrkKpKE02mf9SlmjzQqNUi1YakpduPB5hr25gvxrP4GEqAn5A==
X-Received: by 2002:a05:6512:3102:b0:515:a360:1d92 with SMTP id
 n2-20020a056512310200b00515a3601d92mr6829117lfb.67.1711916950154; 
 Sun, 31 Mar 2024 13:29:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:02 +0300
Subject: [PATCH v2 05/12] drm/imx: ldb: drop custom EDID support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-5-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2635;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yY+O3A74gJfvweSEVBsGsRQtsdkU2oXgLZzLvkdvTv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCcePbH5Zjxnk0aodoAfmic8b1WXU85H/o8MAs
 QI1cw0GV9KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjwAKCRCLPIo+Aiko
 1eExB/9cHiJt7nCx5nPTg7TnqIDd4FGePmdaBsugHRvPqtnlcVLqQdlMqObc2812P0w01JTq4wx
 FGg2hfiOrpEzl7cNzqiXOeUbLkjCUG9nR78g74zKhuQM/OdwCSbiZ13rXNdWsDTheAeKPgWI0VY
 k4SMxFvLfT5xNiILgF5szhgNToFdF7Qsji5jH52IHwvWRnnkXvQS2jZnY0fv4NTgkryrDK7QcN4
 ETbkPipoMRHe8pVtl2vYcqyTCh75mwlkUrQBRLiyoC71/K15SIcl8KMvH2038c2KeetqGZEGDFD
 3V878u/Mos78tzrehAXNkCNSNFiS/wlAbD/ZvShtWwTiB/GX
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

Bindings for the imx-ldb never allowed specifying the EDID in DT. None
of the existing DT files use it. Drop it now in favour of using debugfs
overrides or the drm.edid_firmware support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 71d70194fcbd..1924d8921c62 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -72,7 +72,6 @@ struct imx_ldb_channel {
 	struct device_node *child;
 	struct i2c_adapter *ddc;
 	int chno;
-	void *edid;
 	struct drm_display_mode mode;
 	int mode_valid;
 	u32 bus_format;
@@ -142,13 +141,16 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (!imx_ldb_ch->edid && imx_ldb_ch->ddc)
-		imx_ldb_ch->edid = drm_get_edid(connector, imx_ldb_ch->ddc);
+	if (imx_ldb_ch->ddc) {
+		const struct drm_edid *edid = drm_edid_read_ddc(connector,
+								imx_ldb_ch->ddc);
 
-	if (imx_ldb_ch->edid) {
-		drm_connector_update_edid_property(connector,
-							imx_ldb_ch->edid);
-		num_modes = drm_add_edid_modes(connector, imx_ldb_ch->edid);
+		if (edid) {
+			drm_edid_connector_update(connector, edid);
+			drm_edid_free(edid);
+
+			return drm_edid_connector_add_modes(connector);
+		}
 	}
 
 	if (imx_ldb_ch->mode_valid) {
@@ -553,7 +555,6 @@ static int imx_ldb_panel_ddc(struct device *dev,
 		struct imx_ldb_channel *channel, struct device_node *child)
 {
 	struct device_node *ddc_node;
-	const u8 *edidp;
 	int ret;
 
 	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
@@ -567,17 +568,10 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	}
 
 	if (!channel->ddc) {
-		int edid_len;
-
 		/* if no DDC available, fallback to hardcoded EDID */
 		dev_dbg(dev, "no ddc available\n");
 
-		edidp = of_get_property(child, "edid", &edid_len);
-		if (edidp) {
-			channel->edid = kmemdup(edidp, edid_len, GFP_KERNEL);
-			if (!channel->edid)
-				return -ENOMEM;
-		} else if (!channel->panel) {
+		if (!channel->panel) {
 			/* fallback to display-timings node */
 			ret = of_get_drm_display_mode(child,
 						      &channel->mode,
@@ -744,7 +738,6 @@ static void imx_ldb_remove(struct platform_device *pdev)
 	for (i = 0; i < 2; i++) {
 		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
 
-		kfree(channel->edid);
 		i2c_put_adapter(channel->ddc);
 	}
 

-- 
2.39.2

