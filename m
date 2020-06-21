Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70342203024
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81636E30C;
	Mon, 22 Jun 2020 07:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4CD89E8C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 22:28:06 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d7so8487199lfi.12
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 15:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gpWZvRfCvlHf7NtxX+3427d5thggZdJwdjj+htiUY4=;
 b=iYjGmbgbU5QQOVUlQlQWv4yfAS1JWsQPDOc/qaef/ipp10YQTroEhWpINX3UFQT0zJ
 ej3eXlmW6YzhDbFBIpiPSUXjnQ29a7rMfWPy+091pK5hKK00rKGN/+PVjsgGW21PFzfs
 CUXRcmVK7MVjE+Z7Z5/UCgX63yeryFgsoDNQehkJ1AiahFi/NXzQoOFGXxQJrWGtFd0l
 DuIoy/18NLVznVE1SAjd9HU1Lu4hepJMJoV0JwG1k1vxdp7sR1iKd+FK3e6YWr85BnCA
 K3cKaILKbp0HZHcp4wK791gtGBlhTjn05e9oioXiV4fZ9Q+aufiFGBb9bUlatKWNbuw9
 ebLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gpWZvRfCvlHf7NtxX+3427d5thggZdJwdjj+htiUY4=;
 b=A2bYrdYEfoJaaWD2yKqfjrSTw1W/hlsZY4oyefTN8m9R56B78Cez4Qfb5oxMQ95Bl0
 S1lsiZy3GWS1ZntXrSEiwcIPqwcLUiOFaNNIpy1HTzmqp5PQD1X0EhbdEmoVzumf52et
 pfIB+kDIaE9fmtQTPbeCmmkhWo5Sl8jgWsk+qP8wUMWu59T3R0V/P3VWRFUtkt9UQGfy
 UROE/pACJ+QjjJmfrbnCg/odnB1SGbGFvCLnE4QqMRR0LbJeho2XfJdG14EgLpCsZxsu
 q4TI1E2Rp6Vy8VBLx/6g9OKczeTFMfSSWmdrAOOFofizpyNg71kJcEhah/jxtPH3WgD1
 BkmQ==
X-Gm-Message-State: AOAM532IJtgn4PEfhdPrRbfyViYPZmppDd7qzjt3kM74+SXPTXNImU9g
 n52dqHPWtXlgyLJu87ubmJ0=
X-Google-Smtp-Source: ABdhPJxx90OzdENre2w/gS/55wOw8HSAbFai550KDVjSfFoglYrYNACk/U9n3Jr+2bVByFIJxWOj6w==
X-Received: by 2002:a19:87c2:: with SMTP id j185mr7700444lfd.183.1592778485052; 
 Sun, 21 Jun 2020 15:28:05 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id 11sm2361295lju.118.2020.06.21.15.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 15:28:04 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions for
 some panels
Date: Mon, 22 Jun 2020 01:27:42 +0300
Message-Id: <20200621222742.25695-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200621222742.25695-1-digetx@gmail.com>
References: <20200621222742.25695-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds missing BUS fields to the display panel descriptions of
the panels which are found on NVIDIA Tegra devices:

  1. AUO B101AW03
  2. Chunghwa CLAA070WP03XG
  3. Chunghwa CLAA101WA01A
  4. Chunghwa CLAA101WB01
  5. Innolux N156BGE L21
  6. Samsung LTN101NT05

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 87edd2bdf09a..986df9937650 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -698,6 +698,8 @@ static const struct panel_desc auo_b101aw03 = {
 		.width = 223,
 		.height = 125,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -1352,6 +1354,8 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
 		.width = 94,
 		.height = 150,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -1375,6 +1379,8 @@ static const struct panel_desc chunghwa_claa101wa01a = {
 		.width = 220,
 		.height = 120,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -1398,6 +1404,8 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 		.width = 223,
 		.height = 125,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -2071,6 +2079,8 @@ static const struct panel_desc innolux_n156bge_l21 = {
 		.width = 344,
 		.height = 193,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
@@ -3018,6 +3028,8 @@ static const struct panel_desc samsung_ltn101nt05 = {
 		.width = 223,
 		.height = 125,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
