Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8929FC2D2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAE910E2B1;
	Tue, 24 Dec 2024 23:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o9TcrQYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0080710E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:11:30 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30167f4c1deso52030791fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081829; x=1735686629; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r1EY0TAniKnLpFn4xNvyIctQ/nFp584TbFvXHwDHEIc=;
 b=o9TcrQYeuWcW65q6+SBbSfXRLxPRh+1/7Rvq11UOSLTJEKCtxb8lxfwPVLOqKW6RER
 hz9ICxlBEca+8jVus7UAIXZ/KkG72SBInGQUcnB3Dv2qh0EUjFxWiyVw714wHkBzxfIu
 99fb/Neb1jRrp1mNpudhFM9fKurIQAQLmZhWZRhLQ4e+PvohTlmh9QtWN2KXKwV+1aRm
 Ch2ASzhpkEqqPy9/+4SBi3zNJdfe6F3+E7gbdjex4Onns6pz90dJttY6qvfyBgyeI2nn
 Wp7apjhmIAHam+kaNW3PKlAnVfyR0v3d/Fn8Zmf8cAhTjtQ6+wod2kxWR6bBI9GP0366
 IZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081829; x=1735686629;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1EY0TAniKnLpFn4xNvyIctQ/nFp584TbFvXHwDHEIc=;
 b=Ll80iRsTAnEAZ7LjuxN+6/3AizNSOsZwKnk+HOZmQ2M8Ly/fB8FujAcpBSNPVEVjNl
 BSyOOgJuobHDg1/A35XQCBDz+UBjcJXCN4dFcGmDGKsJZWAuI7CYrJm1I5JpHG1hYSDU
 FHcG/N3Lgxm1/Vssc66UTJjZ4YPvK/YBqKZdULa1VkmOVZd9aU3SzaDjVJqwbSyAbT3S
 c6ABr2qkgtWs18BjudePtuBZdbkBVyTJ5Lfb6pUVBNJeSaYF9G/OGGVn15WbiAo5/eva
 iyjoA3C4p8MQOO3ZYleLkMYCSuR2vJBWILCE0Cpipa1jLncnvuWLEoltOllRjddia3Jq
 FwJA==
X-Gm-Message-State: AOJu0Yx2FqIu+PFqLuqVmI5kdog+Mus4F882TVf+QC3F4qHISZyxcQCm
 3jYQ2xluqQ6bDMGlcVkRXWHrdq9eQ68qMdAEvroCk0du+VKMds2dm102xyiOQ2U=
X-Gm-Gg: ASbGnctAv9Zxo61hLeO5f0nQM3zsV773eiogMvo+OflJYLLQdp2DBiS59ex5r11y0K2
 lijk0fp21ziLR4euPR2plVToHb+T6rrA41Fj9nhpMPiHn5dza0uIXGp+IO8T+XGgZOH0f1eTX8e
 M56+RZJAbuRazUMgOh55pRgReoUy42TbyKGYxGezLHEgtONpt4H9llg1tyuYIZe56YWNz3moLgC
 s2hCRpX2doMY6LwOvKeD9OZf6T/d9pGpF9SeHkccoYdS2VAT5ZiP2jERw3zZ2Lx
X-Google-Smtp-Source: AGHT+IEhSnvY1Lvr+9QANPt7qjpETgM45/cQFbDwGgyPmxoRhRX07yjNQMX95QCriBppU0wUr6ahEA==
X-Received: by 2002:a05:6512:6411:b0:542:29a8:e8c7 with SMTP id
 2adb3069b0e04-54229a8edcemr6282315e87.3.1735081829327; 
 Tue, 24 Dec 2024 15:10:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:13 +0200
Subject: [PATCH RFC/RFT 5/9] drm/vc4: hdmi: drop separate CEC
 unregistration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-5-b80380c67221@linaro.org>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3327;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bpU/QTzs/6e35Bs6BI4kFzNjxwYaRMD/cnt3/GPJ2Gc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3q2fWhpzI+yzW89hZV2uz5qz/xw+5u+yrIJn75LxgcF3
 U4/6LCuk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+XyN/Z+VcF/BYY0t5Rre
 a57rHwxZsEp5yYupEcHHj4nent/NHdIaqsT9fl3bqYjbB4r4nGIeWjBEW9zQdorKOptrw7XVYFv
 ltry/6Y7B9zvuL+142RlQWeb/4vX/IDfzq+FXFbQbj3QuecP/5FiH57ON+ftvGy7p0+3l6hZYa/
 zz+CO2902zmFeaT1vkt25hyIM2zjupQVNtts8RPCZToGtZ7lRZw/qEv0XeVjrUtMOfTeq3XklT7
 LbnL9Vyeduj9bSunwi0tg/QOLH64jW5Jba9h1pnCOq5ep9fb2zXG39XNWzaLG8Ls+55y3OVZFwn
 T2PfeZypwMhGzSxJndVdNjde6VHDMwfHr3nzQlKTIrYBAA==
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

CEC adapter functions are protected by drm_dev_enter() / _exit(), so it
is safe to keep CEC registered until DRM device is being torn down. Drop
custom CEC unsregistration code and rely on the DRM core to unregister
CEC adapter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 53 ++++++------------------------------------
 1 file changed, 7 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3086c2ad3bb2e8fafdc1f37ba985aa5785d49f9a..7b39000369e50f5368384575aa81919df5a7133c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2752,13 +2752,6 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
 	.adap_transmit = vc4_hdmi_cec_adap_transmit,
 };
 
-static void vc4_hdmi_cec_release(void *ptr)
-{
-	struct drm_connector *connector = ptr;
-
-	drm_connector_cec_unregister(connector);
-}
-
 static int vc4_hdmi_cec_init(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
@@ -2796,51 +2789,19 @@ static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
 {
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	if (!of_property_present(dev->of_node, "interrupts")) {
 		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
 		return 0;
 	}
 
-	ret = drm_connector_hdmi_cec_adapter_register(&vc4_hdmi->connector,
-						      &vc4_hdmi_cec_adap_ops,
-						      vc4_hdmi->variant->card_name,
-						      1,
-						      vc4_hdmi_cec_init,
-						      NULL,
-						      &pdev->dev);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * NOTE: Strictly speaking, we should probably use a DRM-managed
-	 * registration there to avoid removing the CEC adapter by the
-	 * time the DRM driver doesn't have any user anymore.
-	 *
-	 * However, the CEC framework already cleans up the CEC adapter
-	 * only when the last user has closed its file descriptor, so we
-	 * don't need to handle it in DRM.
-	 *
-	 * By the time the device-managed hook is executed, we will give
-	 * up our reference to the CEC adapter and therefore don't
-	 * really care when it's actually freed.
-	 *
-	 * There's still a problematic sequence: if we unregister our
-	 * CEC adapter, but the userspace keeps a handle on the CEC
-	 * adapter but not the DRM device for some reason. In such a
-	 * case, our vc4_hdmi structure will be freed, but the
-	 * cec_adapter structure will have a dangling pointer to what
-	 * used to be our HDMI controller. If we get a CEC call at that
-	 * moment, we could end up with a use-after-free. Fortunately,
-	 * the CEC framework already handles this too, by calling
-	 * cec_is_registered() in cec_ioctl() and cec_poll().
-	 */
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_cec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
-	return 0;
+	return drm_connector_hdmi_cec_adapter_register(&vc4_hdmi->connector,
+						       &vc4_hdmi_cec_adap_ops,
+						       vc4_hdmi->variant->card_name,
+						       1,
+						       vc4_hdmi_cec_init,
+						       NULL,
+						       &pdev->dev);
 }
 #else
 static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)

-- 
2.39.5

