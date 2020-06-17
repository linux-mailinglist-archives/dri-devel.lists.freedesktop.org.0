Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397941FEC4B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B3A6EB2F;
	Thu, 18 Jun 2020 07:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3106E1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:28:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a9so4855804ljn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKFzNibCd7jzC+wKme/62sVxJsUZsrptVvulkctN6fc=;
 b=sogBx8KF5qXKU6uIzglmpLtOwdnq8arZ4/R7HdxFWl9vEyg25TbvzNbcUG5pA7PTxu
 +Y21qITF5l2IeoGbX8+uDtgy295BPargj9NdUoojpbkgn1HjN2SCkttS5sEeV73w6saM
 lQut9MIEPs+qRJyP3MahcOMs7ZdAGaGGGpixTEHQfzJoUjI8IPCu6T/6Apst2DmMOBy/
 KUO8dzCcRhMPS2jxwmOYrUeLehzEENLkwHe15tzosdjPEL44iaqVVBabhJPAmHrJMz4M
 83Q694VYVrE3UFGfqvgWshqUx5wEp6r2E6qeGiZ5eA67Iax9eZVlDzkJJ/iD0iL2vq96
 QKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKFzNibCd7jzC+wKme/62sVxJsUZsrptVvulkctN6fc=;
 b=IaVy/mPidRXEXe7nVa13/BA1+ArZIXrJsrATgUTNnHs8dftfO2uELbbI3zepN0WLeE
 KrhmyQWMS9U3yNO8hwwHaROwryoUvj8ef/5+jlyUCL/NU5oX/sazN7Opzr5llLL3VUrr
 9XhwkwuOw4Hs3IOIM7p9vStyULFbxNifqUFcfIAnDCqomMUaNtMwwlC8mXIx5tKaU28U
 nlUItBUYGLZCq377H9u/496iXmyFHzSDBTIdsvi/0Ng+3i3vUQ2BNDQ5ozzAVOtRAgCs
 YBnAogBC2KbQaob2sp1VXwgrC2Xigf8OsSMUP/4syF59/HCtBYjg+pYywM5OwyBtzXba
 ia/w==
X-Gm-Message-State: AOAM530wCNE9PzM+TNRF+wPyZFLaSJX/Glyk8R8C5EXE5SVoX6Eub+lV
 SWvOewWlXtUJoeo4AZSwzZG12jUE
X-Google-Smtp-Source: ABdhPJwcUfeogdH2fdQoZn2uStj+lMY3N6d4lTg2ozcjT5sN41K76ccpr8S5r0ZJF0Z0vAo7B1CP+A==
X-Received: by 2002:a2e:9810:: with SMTP id a16mr648149ljj.157.1592432881697; 
 Wed, 17 Jun 2020 15:28:01 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id a1sm210378ljk.133.2020.06.17.15.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:28:01 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for some
 panels
Date: Thu, 18 Jun 2020 01:27:03 +0300
Message-Id: <20200617222703.17080-8-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617222703.17080-1-digetx@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM panel bridge core requires connector type to be set up properly,
otherwise it rejects the panel. The missing connector type problem popped
up while I was trying to wrap CLAA070WP03XG panel into a DRM bridge in
order to test whether panel's rotation property work properly using
panel-simple driver on NVIDIA Tegra30 Nexus 7 tablet device, which uses
CLAA070WP03XG display panel.

The NVIDIA Tegra DRM driver recently gained DRM bridges support for the
RGB output and now driver wraps directly-connected panels into DRM bridge.
Hence all panels should have connector type set properly now, otherwise
the panel's wrapping fails.

This patch adds missing connector types for the LVDS panels that are found
on NVIDIA Tegra devices:

  1. AUO B101AW03
  2. Chunghwa CLAA070WP03XG
  3. Chunghwa CLAA101WA01A
  4. Chunghwa CLAA101WB01
  5. EDT ET057090DHU
  6. Innolux N156BGE L21
  7. Samsung LTN101NT05

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6764ac630e22..9eb2dbb7bfa6 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -687,6 +687,7 @@ static const struct panel_desc auo_b101aw03 = {
 		.width = 223,
 		.height = 125,
 	},
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct display_timing auo_b101ean01_timing = {
@@ -1340,6 +1341,7 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
 		.width = 94,
 		.height = 150,
 	},
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode chunghwa_claa101wa01a_mode = {
@@ -1362,6 +1364,7 @@ static const struct panel_desc chunghwa_claa101wa01a = {
 		.width = 220,
 		.height = 120,
 	},
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode chunghwa_claa101wb01_mode = {
@@ -1384,6 +1387,7 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 		.width = 223,
 		.height = 125,
 	},
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode dataimage_scf0700c48ggu18_mode = {
@@ -1573,6 +1577,7 @@ static const struct panel_desc edt_et057090dhu = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode edt_etm0700g0dh6_mode = {
@@ -2055,6 +2060,7 @@ static const struct panel_desc innolux_n156bge_l21 = {
 		.width = 344,
 		.height = 193,
 	},
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
@@ -3001,6 +3007,7 @@ static const struct panel_desc samsung_ltn101nt05 = {
 		.width = 223,
 		.height = 125,
 	},
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode samsung_ltn140at29_301_mode = {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
