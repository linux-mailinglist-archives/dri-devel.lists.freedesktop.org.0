Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2554707A7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5921910E2E3;
	Fri, 10 Dec 2021 17:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8BA10E2E3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:49:02 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id q17so6727145plr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 09:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rizF6SQspxzLCdP3CjSaNCfkk6zM5V4SVHSi6B5RlY=;
 b=efryh0xRJUvLAkTjk8rcTuQxNNAq+ZT6D18XBsHqpl3oLZLjWZzkLzPCYH80F5y5Ee
 2s1eoRrSydKRv2QDCAccM2XsF3028pBNhnSRl7WxJpPPiiX4QXaHkoJI+sR/XskF2p1Y
 hbjdOtoKjV/tKfUCJZFKUUYfuY/7x7SPQZfWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rizF6SQspxzLCdP3CjSaNCfkk6zM5V4SVHSi6B5RlY=;
 b=jPZHaf12qUwf3iJb1WtYFpkqWGEMHOGXZ6DvEreH3kDISFgZwhPLD7kRPEtrkCScNh
 rcBniLlxpAtkU/ITzpfZuvgwzwgIvRV3Skf9vz2p9oEccj6THurvk7CFbQ1wirrBpCUW
 hOGO/tGy9KsS9MblUrcd8c7SvfNM0Z4xpsu8ycbLtIAP2kcZksiknvkfPIItQ0nHdHTJ
 iq689rHR0bv9QqqlXfugX/y5NXrhA4PYQL7mwtfNmn+m3WjxaRyGLX4kH65tc73FHg37
 /M1MjZ2f0QWgoHY3TgCOOHnJubXIySwMce4D8Vnc0L6CWhnmPPDd4Bc64H2RSTUrUEG1
 MQ1g==
X-Gm-Message-State: AOAM530RomysfepRjbgefpQgyEH20WF3vHtFwfecwzn4iXi1OGZUZOfF
 j2W3SrcaD0hUogK6U4L9Ie0zzg==
X-Google-Smtp-Source: ABdhPJw6D4Sw9ZXAUU2cCDfkecah7QHCPq4BMBCJvsEh/soIldjXBhw7aSCmWNiFyQ93KeD5Qr57iQ==
X-Received: by 2002:a17:90a:e60a:: with SMTP id
 j10mr25948578pjy.169.1639158542156; 
 Fri, 10 Dec 2021 09:49:02 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id w1sm4039644pfg.11.2021.12.10.09.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:49:01 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH 1/3] drm: bridge: nwl-dsi: Drop panel_bridge from nwl_dsi
Date: Fri, 10 Dec 2021 23:18:17 +0530
Message-Id: <20211210174819.2250178-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

panel_bridge pointer never used anywhere except the one it
looked up at nwl_dsi_bridge_attach.

Drop it from the nwl_dsi structure.

Cc: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index a7389a0facfb..6becdcdc99fe 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -65,7 +65,6 @@ struct nwl_dsi_transfer {
 struct nwl_dsi {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
-	struct drm_bridge *panel_bridge;
 	struct device *dev;
 	struct phy *phy;
 	union phy_configure_opts phy_cfg;
@@ -924,13 +923,11 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
 		if (IS_ERR(panel_bridge))
 			return PTR_ERR(panel_bridge);
 	}
-	dsi->panel_bridge = panel_bridge;
 
-	if (!dsi->panel_bridge)
+	if (!panel_bridge)
 		return -EPROBE_DEFER;
 
-	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
-				 flags);
+	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
 }
 
 static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
-- 
2.25.1

