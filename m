Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87C9F2344
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 12:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BFC10E14B;
	Sun, 15 Dec 2024 11:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GoQHM82f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDB310E14B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 11:09:14 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30227ccf803so35005931fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 03:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734260952; x=1734865752; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ok2Fb7LkB/RM1ucE2UZDhgpxrMCyHz4b6tMDMVk3i8I=;
 b=GoQHM82fe1WLNcCmYoETNGmaLXd0P+AwIy75J1vqf1qdHgqLU4eqXYqu0HG0Fotbw9
 wtNxnR88CNPT8xKEZXMuD4GLlQbo9en8E9xt+2N3dqgCJ5keC1JIHhjA+w5V3RwPO89c
 SUKcCKtzoapkXL+8VI2BBJgGfIh84+or1Ew6RsV6DNq4YCdwRXNNxij3H3pwoziPhTSO
 fa4JPpcY24zeDStynNbz7A8Yj4UhWXRD3WeIpbdgqwonKkMHbLWNtdwdnLY/RN9QjuVk
 p7PzNTDCRYVyQUfLHTIdftF7OVI4YYv9aY9Z8JcFCiwqJiuJtbc//PYAo9PanfYavoss
 jCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734260952; x=1734865752;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ok2Fb7LkB/RM1ucE2UZDhgpxrMCyHz4b6tMDMVk3i8I=;
 b=RBgrudWeLmamTZvwvzBN4w74dvl1yWfYx9RTBg+28V6D9Mcx7DFjUeGX5PHN2LPtVC
 oxiLkuTjbNtPPxvWC2WCjbabWg1cENR6U2doM26r/zfFyiv0g2I15suFvi5msb8ogWt4
 /fUddlxfAqs5hjEjmfpmsD/4ROzqxUzAPdgkkDE27QmXLsTJXtxu1vrrupGIW+ylLaFb
 Ftf94Sw9yOGau/yUtxSQyNWRl/jbvID1Urk8Op1TDjNubCDfAtUeJBclgVz4y4zcJ0Gx
 RiNHnNirtHLR2EfOfGawqLh4cfdeUfsM+HqUboHx58a2HdMzFusTX/edjeCQjMTDFalv
 6OyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsjWilypjGO2mCI84SmDIXf5aXdBxZO3cbp4ZKNq5sVbquT1Tn4AwKlbWoX20GlIE960mMRPjqspo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLD82htBG19nwQut+8DAbSFUEGUOqoTOe8WSvnnPyDoI4dN/qV
 es/vfP8RduNJRHEm3U+zAH/uQrSPwpyU/ha323cMqbJuMghVtvLGAnIEk3ZmADw=
X-Gm-Gg: ASbGncuqE7lUkmPtG5URbwTujqhSGj+39kgs5FclG/9er7y8g6eFHG3KYMTNJGMJrVo
 yb8XDOWRhU6E8sBw1Fm0qyMV1TrF3xiuDSPooheE6L1OmaPwYByAqKBrHXQM+ekVp+6oyRwAVl8
 liaoTest7UH54xoUzXfpVmM3WGcAm61SUIlsTsR7pCubQ2LiNX8hOk4Qn//iDdZFzUjpnP263G/
 AcpJTBExGj2iH/5Uj9YIBYf7jakMBlxWp36hBep9LBPIULXOB3U/AIbZYl98POU
X-Google-Smtp-Source: AGHT+IEBzRsf5g8lUjmxBKo0iQDL4bb/EE6SCLkY7sXa+6eAEE1l7IImuCOS5tCrIREpHBVdYnUlCw==
X-Received: by 2002:a2e:be1c:0:b0:302:244a:da2c with SMTP id
 38308e7fff4ca-3025459ceaamr33115551fa.31.1734260952563; 
 Sun, 15 Dec 2024 03:09:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3034404544csm5261531fa.29.2024.12.15.03.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 03:09:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 13:09:07 +0200
Subject: [PATCH 1/2] drm/i2c: tda998x: drop support for platform_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-drm-move-tda998x-v1-1-7817122b1d73@linaro.org>
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
In-Reply-To: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4972;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o+xrs1mABCZ1wQWMUhylhusFC7U0FTHkooDzXrbcyDs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXrjU0utfw/UC8ok+JazFP4KUBh/53nG0wPqFi
 St95xMwwNSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1641AAKCRCLPIo+Aiko
 1Y+/B/0bJvQ3SWSCCuB0+2XWWD+0s5yR24CN6cTI09fAuwx3miRMzh1o35X7MOMrA3azcmWW+iu
 xndFHLucB64yNdbXLZlaw87XKNU6h2MSZzW5z0pMkSS9CVsbdKS6GMNVPcRYjYymxexgOVeERw3
 7b/54REFzgLcDms+GZxCXs8BmHCTI1hnsDbiBdF8VlcwuXsOHQcalurRBLTHW+L3mieGm54vxgX
 yeJLaZS8GWMBnzE8wAqLUUKm8hqlSK6lLglXdBr46HrDvsJW+dPNTZYUaopxF0wlZ60R1tCEqQO
 KQi6a/W9qt6tnGy9n/tdM/Tl3kf0lS8v0Ml+/CiZd5aBXrFV
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

After the commit 0fb2970b4b6b ("drm/armada: remove non-component
support") there are no remaining users of the struct
tda998x_encoder_params. Drop the header and corresponding API from the
TDA998x driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                       |  1 -
 drivers/gpu/drm/i2c/tda998x_drv.c | 49 ++++-----------------------------------
 include/drm/i2c/tda998x.h         | 40 --------------------------------
 3 files changed, 4 insertions(+), 86 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81348dbce8ca7c877bd9c2d88cb093368eca5a0a..9a23e80abf309cbd918a74683895f8dbe0507a6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16983,7 +16983,6 @@ S:	Maintained
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
 F:	drivers/gpu/drm/i2c/tda998x_drv.c
-F:	include/drm/i2c/tda998x.h
 F:	include/dt-bindings/display/tda998x.h
 K:	"nxp,tda998x"
 
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 2160f05bbd16d2346e27365e5549b75ad26fdcb9..67480dcbbfde4da68ffaeaf20935af467d4da92a 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -21,10 +21,11 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/i2c/tda998x.h>
 
 #include <media/cec-notifier.h>
 
+#include <dt-bindings/display/tda998x.h>
+
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
 enum {
@@ -1717,10 +1718,10 @@ static int tda998x_get_audio_ports(struct tda998x_priv *priv,
 		u8 ena_ap = be32_to_cpup(&port_data[2*i+1]);
 
 		switch (afmt) {
-		case AFMT_I2S:
+		case TDA998x_I2S:
 			route = AUDIO_ROUTE_I2S;
 			break;
-		case AFMT_SPDIF:
+		case TDA998x_SPDIF:
 			route = AUDIO_ROUTE_SPDIF;
 			break;
 		default:
@@ -1746,44 +1747,6 @@ static int tda998x_get_audio_ports(struct tda998x_priv *priv,
 	return 0;
 }
 
-static int tda998x_set_config(struct tda998x_priv *priv,
-			      const struct tda998x_encoder_params *p)
-{
-	priv->vip_cntrl_0 = VIP_CNTRL_0_SWAP_A(p->swap_a) |
-			    (p->mirr_a ? VIP_CNTRL_0_MIRR_A : 0) |
-			    VIP_CNTRL_0_SWAP_B(p->swap_b) |
-			    (p->mirr_b ? VIP_CNTRL_0_MIRR_B : 0);
-	priv->vip_cntrl_1 = VIP_CNTRL_1_SWAP_C(p->swap_c) |
-			    (p->mirr_c ? VIP_CNTRL_1_MIRR_C : 0) |
-			    VIP_CNTRL_1_SWAP_D(p->swap_d) |
-			    (p->mirr_d ? VIP_CNTRL_1_MIRR_D : 0);
-	priv->vip_cntrl_2 = VIP_CNTRL_2_SWAP_E(p->swap_e) |
-			    (p->mirr_e ? VIP_CNTRL_2_MIRR_E : 0) |
-			    VIP_CNTRL_2_SWAP_F(p->swap_f) |
-			    (p->mirr_f ? VIP_CNTRL_2_MIRR_F : 0);
-
-	if (p->audio_params.format != AFMT_UNUSED) {
-		unsigned int ratio, route;
-		bool spdif = p->audio_params.format == AFMT_SPDIF;
-
-		route = AUDIO_ROUTE_I2S + spdif;
-
-		priv->audio.route = &tda998x_audio_route[route];
-		priv->audio.cea = p->audio_params.cea;
-		priv->audio.sample_rate = p->audio_params.sample_rate;
-		memcpy(priv->audio.status, p->audio_params.status,
-		       min(sizeof(priv->audio.status),
-			   sizeof(p->audio_params.status)));
-		priv->audio.ena_ap = p->audio_params.config;
-		priv->audio.i2s_format = I2S_FORMAT_PHILIPS;
-
-		ratio = spdif ? 64 : p->audio_params.sample_width * 2;
-		return tda998x_derive_cts_n(priv, &priv->audio, ratio);
-	}
-
-	return 0;
-}
-
 static void tda998x_destroy(struct device *dev)
 {
 	struct tda998x_priv *priv = dev_get_drvdata(dev);
@@ -1982,10 +1945,6 @@ static int tda998x_create(struct device *dev)
 		if (priv->audio_port_enable[AUDIO_ROUTE_I2S] ||
 		    priv->audio_port_enable[AUDIO_ROUTE_SPDIF])
 			tda998x_audio_codec_init(priv, &client->dev);
-	} else if (dev->platform_data) {
-		ret = tda998x_set_config(priv, dev->platform_data);
-		if (ret)
-			goto fail;
 	}
 
 	priv->bridge.funcs = &tda998x_bridge_funcs;
diff --git a/include/drm/i2c/tda998x.h b/include/drm/i2c/tda998x.h
deleted file mode 100644
index 3cb25ccbe5e68bf95ce13249f15549b7e2582281..0000000000000000000000000000000000000000
--- a/include/drm/i2c/tda998x.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DRM_I2C_TDA998X_H__
-#define __DRM_I2C_TDA998X_H__
-
-#include <linux/hdmi.h>
-#include <dt-bindings/display/tda998x.h>
-
-enum {
-	AFMT_UNUSED =	0,
-	AFMT_SPDIF =	TDA998x_SPDIF,
-	AFMT_I2S =	TDA998x_I2S,
-};
-
-struct tda998x_audio_params {
-	u8 config;
-	u8 format;
-	unsigned sample_width;
-	unsigned sample_rate;
-	struct hdmi_audio_infoframe cea;
-	u8 status[5];
-};
-
-struct tda998x_encoder_params {
-	u8 swap_b:3;
-	u8 mirr_b:1;
-	u8 swap_a:3;
-	u8 mirr_a:1;
-	u8 swap_d:3;
-	u8 mirr_d:1;
-	u8 swap_c:3;
-	u8 mirr_c:1;
-	u8 swap_f:3;
-	u8 mirr_f:1;
-	u8 swap_e:3;
-	u8 mirr_e:1;
-
-	struct tda998x_audio_params audio_params;
-};
-
-#endif

-- 
2.39.5

