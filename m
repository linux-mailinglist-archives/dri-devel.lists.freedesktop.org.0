Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D0450A085
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1168F10E4A5;
	Thu, 21 Apr 2022 13:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602A610E2F6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 13:14:36 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id r13so9972042ejd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5AA//nz8eioK2obF5S6G7yI3Qq8Yz3xKC1cGsmA3bs8=;
 b=zA0HPeX+G3XppyfmI4v/W/W0aBnJtLr0AZF1FL68CpnUyfBynwJEnSO6+OSn26XvyY
 wuQp+JMaPUY2ruPSPmgCX+46EBvdblpAyKtG2EX64eMiWOzq4T4YABLG5YJzgNFWq0ZY
 PJsrV4S+RQJBZ2oHAsKnnhMZo0goSGciybgBiCXmweUN0sxEMK7DwZ1l/G0rYaTWHjA5
 F+YwZI1nrWS/vpJsHIzM17oeGQUn04c59jhSsViNCxqDCJAwt3nXUImNBI5rmbvizt/n
 5d/YjACevHEvoZSYflYhXExrz3ZCRDOZb+cPJ2peWF5FLugbgZT2roOO+BJGMmcACOuS
 r7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5AA//nz8eioK2obF5S6G7yI3Qq8Yz3xKC1cGsmA3bs8=;
 b=TaOH1NEaplt8FmRWsOZgxDABJq6DukbHBxYA4zMwkASCH0hGCqq/S8TfwJE1MWGMJK
 RuLk3V2X4FHDPkBWuMOEK2rweLna298O5Cv3EkeyjgX9cF+GGXtErGosAm01RPbbN4WM
 jk6KRm3Cvy3nF+7UwcALn5m7k/UDINQoJBV1yk+ngtLD5mCuvT0p0CEwgk6XmhrUQJr1
 CsvF2A6fl7n3acbebZTSbwuQ2SMvT0MWaep8hAxTIuIL3te9jSssjufdhfFtFUXyFxJY
 5fq8ii12qWO7bREeEeth47rhToRsUenh/h7GSjohKsgq7OMkPdpDwqI+ffT9rFZ5N10o
 Gdrg==
X-Gm-Message-State: AOAM532i50CQrk4+mB232GqfRShLrhrV1ceQ9cPPSWGX1LJDsFsS8Rz9
 5ZGWtYQaw7WWLE7F2s6zaiYnUA==
X-Google-Smtp-Source: ABdhPJyA8BdIM0wRS4oJgIe/AJBafd52nt4hkn/4fL4bly7jxM82GWK0bG+l6YbDzA5syjqD7m+4NQ==
X-Received: by 2002:a17:907:7ea4:b0:6f0:1205:fea9 with SMTP id
 qb36-20020a1709077ea400b006f01205fea9mr4527828ejc.534.1650546874555; 
 Thu, 21 Apr 2022 06:14:34 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a170906148100b006efa8a81a52sm4540605ejc.120.2022.04.21.06.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:14:33 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 hermes.wu@ite.com.tw, angelogioacchino.delregno@collabora.com,
 allen.chen@ite.com.tw, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v1] drm/bridge: Fix it6505 Kconfig DRM_DP_AUX_BUS dependency
Date: Thu, 21 Apr 2022 15:14:15 +0200
Message-Id: <20220421131415.1289469-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

it6505 depends on DRM_DP_AUX_BUS, the kconfig for it6505 should
reflect this dependency using 'select'.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c08ccb4b332b..4cff9206045b 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -78,6 +78,7 @@ config DRM_DISPLAY_CONNECTOR
 config DRM_ITE_IT6505
         tristate "ITE IT6505 DisplayPort bridge"
         depends on OF
+        select DRM_DP_AUX_BUS
 	select DRM_DP_HELPER
         select DRM_KMS_HELPER
         select EXTCON
-- 
2.32.0

