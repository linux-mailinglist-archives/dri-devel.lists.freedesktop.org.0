Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE3877ECE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDDD11258A;
	Mon, 11 Mar 2024 11:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PQ5qEanL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB37211258A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:20:40 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d4360ab3daso17880781fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710156039; x=1710760839; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5K+8RS+ahU3ghC9Eek+RlKhdxsgzsxyDagZOon3+/co=;
 b=PQ5qEanLWhxDyjGRFa+eRYKfXJBLDVtULsbqUODwKQiZdrUQ6JkAWtOLCV3WSaLFel
 bmKzRmioLIIy6P2G58HZlmv0oBpAQURQAcFB9T+2gOvjpoYWYqByEz6mgMLmKzFrvID0
 /Vy1Gi7hZPRPCsUsI9/sXFP6OeEn+yvLru8WzMbuTwl6nCqsvGJ+kAliP6ixE6aO2M5B
 s1I8FUfbfPgJRgL71m6AGdvQDt6NxhNSh/KIId3M3CogpKJTa53peqXRF/UW4yKgMNnK
 hf+dP5sGCuYFERF9sRNi2j7yntjtMwQ/TNbfwhvYRkrukSJKGxWEFoU6OG0HeeQABsir
 sF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710156039; x=1710760839;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5K+8RS+ahU3ghC9Eek+RlKhdxsgzsxyDagZOon3+/co=;
 b=UfFEb1APZe2G9ZSyN4oK3320aDfUfHmx33eo4pZrt/D1GWDA5vZg8TYbmKAtgCxHML
 mR7JOHiL5xShjq3Ws6n+B9TtDtVAMLztUW3Knz9qt7sH8iYrKDFQFeuMWGt8X0zWxRQo
 k5GN/3ZCUgW2cYddoV2x/50Zn0EmF7L/R/zFzo/HTgM2kOPkA6sZ8iiQJmzMArMCa9WT
 1ZvMhnGFVBkd+OmSg3Cf9BJPLZDpRvzBXB8Q+MXy4iZ0LsmJb/2Z2nHyh72r8WR60pIu
 TADQSRwT9ClCPqHPv46WeRzdnTKUPwb5c5eH6yjFQ03HDBdJJqw7Vz51cv2NTwtv1jWA
 Jn1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsWde2OmsYWhciUnr2HJZj+F5ca/4RqpieUkhrdnsMTgEXQSP3HqXc2b9VVvZ2YOErNUeVj8YAm+yI6LHH61kv+x7ZQXM1CG+PS2YscXpt
X-Gm-Message-State: AOJu0Yx9DxKfeYQFIJAYyEbLWwu1Gv8g52O19RCZn+tgaL/zxNflch3x
 AuDV512dUVzV51xAlZ23tUd9Sam6uCNcjXwcAzB3VHku+WBeBD1NvhL7t1RE/ws=
X-Google-Smtp-Source: AGHT+IEJhMAtLOGdKJeKecm7sYEKvYcwwx9duwSC/xm8nUskzRXaHqSqFQNqsYJ+HOB9PEoneZGAlw==
X-Received: by 2002:a2e:bc17:0:b0:2d4:2651:1483 with SMTP id
 b23-20020a2ebc17000000b002d426511483mr4965661ljf.35.1710156039078; 
 Mon, 11 Mar 2024 04:20:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:20:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:09 +0200
Subject: [PATCH 01/12] dt-bindings: display: fsl-imx-drm: drop edid
 property support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-1-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qEtbmPTQ1hWUAljrEFOM5fEpd9T1vWp4LF7YuGb47NU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDR8/XphsjX9E6ftv7NHIwcR6vVy3NYlC/d
 zXcBG5F1AKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1S/TB/9vuXwtn84QJjHwWRO7IIGZ4o7Fqk8/BZcRorA2Fibr15CVuzrPG05KtxepCR49FHcaL3o
 G4d8QEWJTkQDEdZge69TTVqoSWw1GyhXhSc4G3Fwwa8ZOiz8KRjjjfrU2hxcFbqH7iRn1/cJCtk
 70J7bqowfyNagfeYY9+cyAzLGxG73o5my1xA5NmcILa/IwDguTDE3TFvfV2RLUVPFfeRSPmTiaU
 HTYUs7p0BgIoClf9wen96Ee/SZQ9lbbYlcNx2D0vNTe/EgUVSycN/80gkxjVxcteUUGIDLx/ibh
 kJ7Ypvg9Ti7aOhkeSWy65CdQpiACyht6VgF/WLPThx5CcM2z
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

None of the in-kernel DT files ever used edid override with the
fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
core allows one to either override it via the debugfs or to load it via
request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
EDID and/or modes are to be provided as a part of the panel driver.

Drop the edid property from the fsl-imx-drm bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index 3c35338a2867..269b1ae2fca9 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -119,7 +119,6 @@ Optional properties:
 - interface-pix-fmt: How this display is connected to the
   display interface. Currently supported types: "rgb24", "rgb565", "bgr666"
   and "lvds666".
-- edid: verbatim EDID data block describing attached display.
 - ddc: phandle describing the i2c bus handling the display data
   channel
 - port@[0-1]: Port nodes with endpoint definitions as defined in
@@ -131,7 +130,6 @@ example:
 
 disp0 {
 	compatible = "fsl,imx-parallel-display";
-	edid = [edid-data];
 	interface-pix-fmt = "rgb24";
 
 	port@0 {

-- 
2.39.2

