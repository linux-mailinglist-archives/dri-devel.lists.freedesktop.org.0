Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A0E877EDA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E21C112752;
	Mon, 11 Mar 2024 11:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x/7/0Yp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AF111260C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:20:41 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d09cf00214so43585641fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710156040; x=1710760840; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FOnGUUSPDhVt2hmPu4weKhalmHR2vV5a1NMlqOPGhZM=;
 b=x/7/0Yp2LpR4l9jIMKx5vf0EysocH2jRRWSiCbyd4TU6GriziDq0bY45esFLkZGrTW
 8OVT79Eh3PSulFIdXA8h9VAhtF2MWk96Wi//lTroU5XwAIpJYJJyHl49qt3IFPXdDRQs
 RsfZq/47dIAAfXb5I3gorJ2dQMl6JEziMzbsln82KfcEHKcKlNG3JqvnHc+lhj+pdIkM
 rCp8/lkjX1ghRN943KqZtRJi9nnyN1Y9JxOnvk0gXNTgzZ6dMleOlhgbtTI4weaGGchc
 L26ffClLa5JKJRpfiBLcsBa5bJa7XwZd8nRkZohiXa1k0VuTu+AbgI1WKChUS4hgWV03
 gF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710156040; x=1710760840;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOnGUUSPDhVt2hmPu4weKhalmHR2vV5a1NMlqOPGhZM=;
 b=sMPEJJqefHfBkMyca9fil97WfhOvPEFP4NFUys2BVwpKgL2lOce5dCyUbDizMmBEV4
 rhmSub3ACPCmpS9VjLFX8e0KF5ycC2hxKRNfhiHtvYOz2Qq5VUE2yJznKyNSloN3rdJV
 1Nwrf5aks+ZwYOYnXckI3oRDesH+NWSalKjjPkkGdl+T9fipqjZRVMCcvQ0XKVuPx2tx
 +edbd915hnmNF2dracHtmu+VWK1tBWhJD4kasJqxvne5JecBSVeFyB7NTUx22WkB4tCJ
 0acS1qqH9fOxwB0pzpqwhTWTJU7aVKUijHaBE5bX16L2rf+X6M6BDpb9eCGHNeB0b5G+
 jCTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl9r4dpStHlVCGR37dcRNBUXH0DFS3g4GgQnPDg8ztkLDff8BQSrEdB4KxCeHgyUs6XJVNQzZZfZeosKYO1hVVVqqaIlL/MGkBmvv0e1Cp
X-Gm-Message-State: AOJu0YxA4wtI0wQ/ZKBTNznzif46wKx2nb27Gmp/JeIhxpRlXlbGgV0S
 VbRjinaG2fPxlHKa7LpR5vG8GDJUWNCBK6p2VxJBUg1ZOG5znQG0kuHAG88Pxg72U+Ko228eMIJ
 Z
X-Google-Smtp-Source: AGHT+IHckBn7OVk6ZNbhFfGx+109UqdO7X75yFgk7cEh5ltxLP0S0lkQQAPlPytUbqRVpqfoZAqIOQ==
X-Received: by 2002:a2e:9153:0:b0:2d2:9e6b:27f8 with SMTP id
 q19-20020a2e9153000000b002d29e6b27f8mr3942230ljg.50.1710156039914; 
 Mon, 11 Mar 2024 04:20:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:20:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:10 +0200
Subject: [PATCH 02/12] dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-2-e104f05caa51@linaro.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
In-Reply-To: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HJWqx05Y7sFlh+0kSF4Jp43KRSRtmVmSwPbpig+Jz/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDPDKCwBOTTQDaMy+fAoU3+mAeWJ79vy8hZ
 HXiIFHMrqOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1Ud9B/48QbueaFlREX/3zgbkla7nTCKzXqKHUxFNfTU0aFAnEG+CUtAhb+6cCPIwi6oHD+mONx3
 rAkCur8LLUVLh9nVzExyPa2J8Q5BwXfN/Nkhesnp08Tf5l1PdYo5mAzE6yo0tfcmjZdHC8K9WcV
 w4g7PGdxRybCLJs8PlrR9Pr5xJLvylg29b9JTmugzVgK2y40F3xWWi0Zb+lbYHBQgguTOZapdYB
 foMN6HZnH1y+GbLZL3n/7/VwYRsYASaj3ALQs25mr62h/7lbUpy8sXtPEDvRvuAYVV2rpAOODJT
 b4Q3FFjDK2PKTczRrn62jy99/quRZ1HHaXCiyO0VsmrdQCO/
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

The in-kernel DT files do not use ddc-i2c-bus property with the iMX LVDS
Display Bridge. If in future a need arises to support such usecase, the
panel-simple should be used, which is able to handle the DDC bus.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/imx/ldb.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
index 8e6e7d797943..03653a291b54 100644
--- a/Documentation/devicetree/bindings/display/imx/ldb.txt
+++ b/Documentation/devicetree/bindings/display/imx/ldb.txt
@@ -62,7 +62,6 @@ Required properties:
    display-timings are used instead.
 
 Optional properties (required if display-timings are used):
- - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
  - display-timings : A node that describes the display timings as defined in
    Documentation/devicetree/bindings/display/panel/display-timing.txt.
  - fsl,data-mapping : should be "spwg" or "jeida"

-- 
2.39.2

