Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD905B5985
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 13:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BEF10E3CD;
	Mon, 12 Sep 2022 11:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD9110E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:43:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lz22so19516533ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 04:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=5DjokmpV3k9SoLQWbK3SspAhFstW23qXKfJK8mBzCBg=;
 b=D/lDKI0l23XwhLAYCcrkyBtwrm4J5SeXL71y5Qo4KLIuXoE8M0QeZl0pMn30hoprwT
 6iRzntwSYzQ8XYA+Qjr91spOZi5pzmXAhJirk6KmQVFLaVVNPDEVlsYqbtDG8uA0SCpT
 4z6L4g5R+WHOXBfyXOCWO4nZRKtvg8C2CdKSSBHDA3O+c72gHLLN3DBksetQCq6mI4DJ
 HOHPhyn2G+f/EYezadRhyGzwWNt/dtv0pMLefUFldlVpEGFZ7T74d8bDcSWfkdFM02pf
 Ox62FbUaph83n/hw4aSHVlgBfgMGL8KkBOoZBRG3cMOJwJwfOCPV/YFvJeE+o4KfcULZ
 qE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5DjokmpV3k9SoLQWbK3SspAhFstW23qXKfJK8mBzCBg=;
 b=iYXT8JtjVW7YLnO6Ctdxa0wntpScDvmUki/mpZBnzIfSdGn3Iw2rvK7sqZMeLluOdf
 GIsWPrXSMvK4xYEfa8kMgqTSXXiTPa17ZJ/36jYQu5JH9OtspwpROj4VOD4gTNA8hkX3
 lWRyPszFdri0rN3BovjId2xSVQ7KNIiM4Ay/J5sR65+jdhfe3SI2Ji1PoN97ptnUDoGu
 zmonivmeAOd1i71Z9pwGonk62YYYp0jquHfZZMtTcfFxURrX0ICIe77MPAtB/ZJTlG/t
 /Q/UH0YEFhyIFRny4zmFn+wBXmSHspCLV+9fRhxPGhrFEO9q+d5IdHkncWG/ckyLGSGk
 6bjg==
X-Gm-Message-State: ACgBeo2JfE44pGPH6kZRyHZNlPYy/V5VLkLy4C6t21u26CcSG6RDu1Bl
 lWjp135IfZ7lPsfgxrEzj8F6aQ==
X-Google-Smtp-Source: AA6agR43zpqq3RoiLc14fD5HjSyaVpW+7AGgtCjP5ojWmC0IEP8qOycwCgTwEWkjnjexKAF7hJ748Q==
X-Received: by 2002:a17:907:6e1c:b0:73d:7806:3c5e with SMTP id
 sd28-20020a1709076e1c00b0073d78063c5emr19049286ejc.36.1662983004956; 
 Mon, 12 Sep 2022 04:43:24 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906310900b00779cde476e4sm4314368ejx.62.2022.09.12.04.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 04:43:23 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dianders@chromium.org, lkundrak@v3.sk, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, tzimmermann@suse.de,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v1 2/2] Revert "drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations for DP"
Date: Mon, 12 Sep 2022 13:38:59 +0200
Message-Id: <20220912113856.817188-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912113856.817188-1-robert.foss@linaro.org>
References: <20220912113856.817188-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported by Laurent in response to this commit[1], this functionality should
not be implemented using the devicetree, because of this let's revert this series
for now.

This reverts commit c312b0df3b13e4c533743bb2c37fd1bc237368e5.

[1] https://lore.kernel.org/all/20220902153906.31000-2-macroalpha82@gmail.com/

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 ---------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 3c3561942eb6..6e053e2af229 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -29,7 +29,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -69,7 +68,6 @@
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
-#define  HPD_DEBOUNCED_STATE			BIT(4)
 #define SN_GPIO_IO_REG				0x5E
 #define  SN_GPIO_INPUT_SHIFT			4
 #define  SN_GPIO_OUTPUT_SHIFT			0
@@ -1160,33 +1158,10 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(pdata->dev);
 }
 
-static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
-{
-	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
-	int val = 0;
-
-	pm_runtime_get_sync(pdata->dev);
-	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
-	pm_runtime_put_autosuspend(pdata->dev);
-
-	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
-					 : connector_status_disconnected;
-}
-
-static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
-					  struct drm_connector *connector)
-{
-	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
-
-	return drm_get_edid(connector, &pdata->aux.ddc);
-}
-
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
-	.get_edid = ti_sn_bridge_get_edid,
-	.detect = ti_sn_bridge_detect,
 	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
 	.atomic_enable = ti_sn_bridge_atomic_enable,
 	.atomic_disable = ti_sn_bridge_atomic_disable,
@@ -1282,9 +1257,6 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
-	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
-		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
-
 	drm_bridge_add(&pdata->bridge);
 
 	ret = ti_sn_attach_host(pdata);
-- 
2.34.1

