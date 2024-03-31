Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE41E8935C9
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2348510EA02;
	Sun, 31 Mar 2024 20:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vt7r56DY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8B210E9EA
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:08 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-513cf9bacf1so4286392e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916946; x=1712521746; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pQWdjTwgnIdZS6takOhMDQQy8XjSBnwUC2ksC3WzZco=;
 b=Vt7r56DYDUA8L6srgyMdYNctkwxVyzmHWOVmabvHh51LA+MYlwlrbg7AiAJt8SAGIY
 bUweqq8+W9hlv+KT/cK46QLq4SMpPIT06XLY2+NIZ8oso1VSn6HKAZxKhK9ryqCXR73L
 9VKQKWbJ2F1VTULadq/SP7uMwHgb4Bbk0y2SfkhaTTvWqJysqFja9tnP1qFYvaimbi/r
 f7a5vENrr7g+JmjxhvCUcePYC5SbDkBRYFiAP1aASOsyqHTPqFWIBXC7xVhfEIS9n2qT
 uuCk+emErN/2/pHdUh4m//vlWS3vk5K7MHxKLStRw03CC04ouE14sgD6Ot2SszGKwJe0
 NuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916946; x=1712521746;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQWdjTwgnIdZS6takOhMDQQy8XjSBnwUC2ksC3WzZco=;
 b=i4NmqqZNceY0XxD8vSFpANipVtsDmv7Op8ea5DyZ5ObjSbRBU4IvOnXrdAdAc8ZG8Z
 jy3tlHyN6nqtwaCTR2WLAJIwENayBGUXUo7yVcHG797utqFmQDeWem25Sf9+8gI//huP
 OCmATHx2mfht0oCCLGv3RWVp9web6+CGipa+qfZu1deZCegJBiBLdbfIKQOA07jTpI4z
 jjgIBbp3F/5zKIs0kzNau7umytg8RQsfm1ijO7yLOLJfrO1Ua8hEHtcIuABvCjQYAKOX
 bnN9ZACH7/ZyDE1HMmQGcKTsQGhaM1xQY0BmxwaYShpCFqJxclJdqouLmMXUQnmoejvr
 KNCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3B6Wl7gywy0i4hP+h26j5wlXPNhMIt0kwt2Xfyih3wVwEhJhys0MDhABwMT1o3W0CQ0NTZ3stseizfpCAiR2ei0n7euomgFeRh5WCFkIQ
X-Gm-Message-State: AOJu0YzMjiKBCPQBe1Mnh0QbtUPCVsyjJqDRCP9GTCmInb1v7CqICEkD
 dcXxPmaAcrIxTmHXhCypkmOTCCZTxILGdHfIz4TAoL38+QsaDUmbPEoJ3XOFgdE=
X-Google-Smtp-Source: AGHT+IGQdqPZQuZrp4rMIkttCQZXwzzfHQ8qGULNfSAfqZZSLM5BQiVtoEAQJyL03sBpJPsmSiXibg==
X-Received: by 2002:ac2:465e:0:b0:515:d100:1650 with SMTP id
 s30-20020ac2465e000000b00515d1001650mr4831112lfo.57.1711916946553; 
 Sun, 31 Mar 2024 13:29:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:28:58 +0300
Subject: [PATCH v2 01/12] dt-bindings: display: fsl-imx-drm: drop edid
 property support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-1-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SFNXn1zh/yUH5lKBoXzlQkp+p1CQ7cqY5rYlPQmKP7Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceOu5x7edAmH8+j3eGaGmmWCs+FoRdo+9fSq
 UX49KHJUhWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjgAKCRCLPIo+Aiko
 1XkMB/4jYrMQ2Pto+iPk8j5wCQ3lBNRQBXOOxIa36gpTWGBLXN2GMgq4T7AeSxsn9W4uYJAhsST
 zHQ4WQaOaSHhKvVfvr6alCYvShW1Yffn7kru9PtHsb1YlYvbfyYV6GJy4r+eOitmea2us9BMgqd
 75bzb0KkIdLmVYWRygT8xARQ/AZ0RZRvmWJKAKq94B62Yj3eNCDbWUkpHtkte3s5Z1IawpY75jR
 RCDDAnQO9BSYH2we2tHqKiIbf4TJBGRQpIM3486HR19gxyNT2AVWyZVuMY2UxZ9drbNgwIfG20z
 311P8qvYPgPF4VXolTrtGq+n9JR6WwA+ID/jrmIaxce/aZRk
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

Acked-by: Rob Herring <robh@kernel.org>
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

