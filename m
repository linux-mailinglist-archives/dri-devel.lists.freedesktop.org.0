Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7776568AA1B
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 14:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913EE10E1E0;
	Sat,  4 Feb 2023 13:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3A810E1E0
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 13:31:41 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id z1so5532842pfg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Feb 2023 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJHNnZjhyF9xP9t2anATW0hxAaKdfiKK9SSVPi+BG58=;
 b=RllsiPfUAZgN/YqUZ0I2+ghL8fV8veiD/KenKwqa9wFIY+XBFrzUDV7HjGqouhkbpc
 EQpLJHQtc2E6qAlaaKgmXBES8WdWpLXsSv9SSWR08yTlzhmx1Jf/6dBLG9f6yJ5cf6e4
 zibK6Rzk7xMcx+7epK/EzNXW3u2hJTOtnLc+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJHNnZjhyF9xP9t2anATW0hxAaKdfiKK9SSVPi+BG58=;
 b=fQvrprzVo6KSOn26Ps+QQ56MkuaudfdTWkeDWKgFMNwtO61KJAjQbAB9/fo1PMUxqq
 V2auIVuZ7mPnc93JaKbeWI+0PB28PUW4KYbzwAYTcvwTmVN5JIgm1/JsEvdUjOmG0Agu
 XhiB5yU3sgZdDyZ6p7umnVIQPKVGYugSLGdAARGC2D9+7mGjqn6g33CIC1rJTn0GEA+j
 8jsdhccl3JYhkJYGL5EisVYZSK6uprEcLHTqAHlOUN9eodvf9pUACPirL3/dF5qn0ltG
 82f7HLUf3id+qg/WtewyJdU2MOE1bDpimnmVuluk2G1pJHewlSzhChiDLQdCQkL8kFlu
 DqXw==
X-Gm-Message-State: AO0yUKWHoRnE47oxoQlKMrhtPWFyETJd7hE2hEe6wgwYc9cVbdunmGmT
 vUi1yDexZ3VFI8kVOlqUL0Dxiw==
X-Google-Smtp-Source: AK7set9qV3tVb6Wvb08ArkIYSv0QgI48jRd4FWDCy3A/7jgeGh3bAAtFFz45vVCuuiH+t10ceDEvvg==
X-Received: by 2002:a62:1541:0:b0:590:70e0:c6a9 with SMTP id
 62-20020a621541000000b0059070e0c6a9mr12602932pfv.32.1675517500923; 
 Sat, 04 Feb 2023 05:31:40 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
 by smtp.gmail.com with ESMTPSA id
 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 05:31:40 -0800 (PST)
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
Subject: [PATCH v11 8/9] drm/bridge: it6505: Fix Kconfig indentation
Date: Sat,  4 Feb 2023 21:30:39 +0800
Message-Id: <20230204133040.1236799-9-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
References: <20230204133040.1236799-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-acpi@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, chrome-platform@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the spaces with tab characters in the Kconfig file.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

(no changes since v10)

Changes in v10:
- Collected Reviewed-by tag

Changes in v7:
- New in v7

 drivers/gpu/drm/bridge/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 8b2226f72b24..46c35d34bd4f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -74,19 +74,19 @@ config DRM_FSL_LDB
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
2.39.1.519.gcb327c4b5f-goog

