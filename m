Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A015365ECF9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8142310E72B;
	Thu,  5 Jan 2023 13:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A5C10E72B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:25:57 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso2061194pjt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4TnZDkiAdm2M990ZX4snq2VicduUxXaOkuOV0xOjD0=;
 b=cm5iZeDvUah9kYQf7pPxwGx17VNk4BV+D/QZoATTIFhFXbkPYbeuvDNkSST19dMFkz
 wZqnehd7ofEZUuxaKuR7uD3J+DuhF0Gq7B3mtS0Q+hu5c80JGIdbgBFW45GQdSUOGU2Q
 R63EzR/nwmWIxlO+5V02qTGAczcAfoSN0fwwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P4TnZDkiAdm2M990ZX4snq2VicduUxXaOkuOV0xOjD0=;
 b=ML0Q9wzQ2ZS31JHQpGEfJkDcTMTFt596v58hpJ3j8Mk5R0jIqtaE9sWdPD2/nhB8bX
 9IgfmKDFNPflNVjmjC6rFyxIoVieWzjyUC0m2txYgfv+MhB2MEpal0Fm7mhcvNuKGv4d
 YzLQixgr+41jrhAbpsbTHwhtPX/2nPfZdUCYQienEWMm5TomJHlT4/k2EsKeZzQkowfp
 K3kPbFIhbclx80xdyd3Jae49qp6Zjm71UGCEFSr4ZHb7fALwsImBBnuvBjgQVk45lLaG
 F50tDxWwOesoaORNxOgB0ZJhCAyRoiDwFDBCcm00jnHEPkuK5Ko7RuTvK1yzag1AF6wd
 CTpA==
X-Gm-Message-State: AFqh2kqBPbdkUqvdjCluD4HdgAlzA6b5kBCMLJ5g6PenvmetE+/DvbdD
 kuh0wT4shIzUdln1JHRSpKF2uA==
X-Google-Smtp-Source: AMrXdXsncnR9wXOQ8G7aUTfbeoK21mOVWpCrGmhXxMOuFxRcBpn7LGrmpgN7UgsTPYWdU0u3CIvnPw==
X-Received: by 2002:a17:90a:3042:b0:226:c364:2d1d with SMTP id
 q2-20020a17090a304200b00226c3642d1dmr4079122pjl.41.1672925157074; 
 Thu, 05 Jan 2023 05:25:57 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:7a61:eb85:2e3:2bd0])
 by smtp.gmail.com with ESMTPSA id
 gk22-20020a17090b119600b00225e670e4c7sm1372682pjb.35.2023.01.05.05.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:25:56 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v7 8/9] drm/bridge: it6505: Fix Kconfig indentation
Date: Thu,  5 Jan 2023 21:24:56 +0800
Message-Id: <20230105132457.4125372-9-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230105132457.4125372-1-treapking@chromium.org>
References: <20230105132457.4125372-1-treapking@chromium.org>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Pin-yen Lin <treapking@chromium.org>,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the spaces with tab characters in the Kconfig file.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v7:
- New in v7

 drivers/gpu/drm/bridge/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 57946d80b02d..737578dd57ed 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -85,19 +85,19 @@ config DRM_FSL_LDB
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
 config DRM_ITE_IT6505
-        tristate "ITE IT6505 DisplayPort bridge"
-        depends on OF
+	tristate "ITE IT6505 DisplayPort bridge"
+	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
-        select DRM_DP_AUX_BUS
-        select DRM_KMS_HELPER
-        select DRM_DP_HELPER
-        select EXTCON
-        select CRYPTO
-        select CRYPTO_HASH
-        help
-          ITE IT6505 DisplayPort bridge chip driver.
+	select DRM_DP_AUX_BUS
+	select DRM_KMS_HELPER
+	select DRM_DP_HELPER
+	select EXTCON
+	select CRYPTO
+	select CRYPTO_HASH
+	help
+	  ITE IT6505 DisplayPort bridge chip driver.
 
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
-- 
2.39.0.314.g84b9a713c41-goog

