Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECE6907FFB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 02:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D519610EBE0;
	Fri, 14 Jun 2024 00:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bJYN0KCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D5210EBE7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:02:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52c819f6146so2326114e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718323350; x=1718928150; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O6Pigrl3YMiYV0L2puz2MCBrwA4BsCn0v5eH3hYPj3M=;
 b=bJYN0KCBAntnriGf1Y+kzP/tKxcVsY4ShZn1Rl1BmizAy0CgRdSAO5kfGJC1v3xYuA
 BJdixq0zA0MSkGsXUCBtevdYQMmqLHxVx9os19Ve3cD9RGRtkWb2zOUiLUdc2vinu5t3
 8PU0sJOAJV7/t3p/WrG86Kziqc5EbjyopqhKqY2ERrMPir+eQZ5kGim/vLlerRTBZySh
 C25Qx6kooIO6seSl0rgAjXDtqfpy0qJ3R4UB2RcRKFv1KqHeq1rMzoZeYtMk2Dv7erM4
 p6Rd8RAAam/I41BVMQKajPMIZ7BVqp8I73MX8QKyOX9h6sE2dVQVxSIkgPmkvCEUV4kn
 0J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718323350; x=1718928150;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6Pigrl3YMiYV0L2puz2MCBrwA4BsCn0v5eH3hYPj3M=;
 b=fY0GGXXWNVFcav+/VqmyzflQUWtsowWVCOgjGnaVgoYoHnZINWxMelBxpYEl/GJXx9
 I6cEPnkQh7cK257nyKXawtP8W0FwvVS07Lxy7b+msubQKKw5JZh/Bk2ntp3bA/PMMV5e
 g6mdqM8/QwpEEWEQCdcY1dP/wKqB2YU9PJDDcrwl1fvCvr9ZIodNEqwDXXJBvbCL0/HT
 ZCySXAGZLpHs+6kmCB2KJ1OEJXgRFHvESRLwW6QSqS1hBG4zfItfk5+6RoGpeQUKxy/c
 x4qCz47/psfjTKkrkm3l35/ufI2hRfaoKfy/k2ekOh7FrYXpcacvA46AsDj4voTSkR1r
 s33w==
X-Gm-Message-State: AOJu0YyhoaNsI95MqU/MQdOhYHyuyyVBg+pwMIab2p7DEToN7FY+4CuL
 lssN3cYd81/DG5HxEPs8xd49NHX+rn3Jx4aSO4a4sTsAzcWUVAGZ/neL0CU5mlQ=
X-Google-Smtp-Source: AGHT+IH5UIwXjKfdAlrtgtsP/gSAJqsbdrJZUJutPq0mL+YKqAKX7hdu9dO+j3gNoMNN5f3Ra3X8wg==
X-Received: by 2002:a05:6512:2204:b0:52c:8a3a:fe2c with SMTP id
 2adb3069b0e04-52ca6e9418bmr803193e87.45.1718323350643; 
 Thu, 13 Jun 2024 17:02:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca288804dsm374797e87.262.2024.06.13.17.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 17:02:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 03:02:21 +0300
Subject: [PATCH v4 2/3] dt-bindings: display: panel-edp-legacy: drop
 several eDP panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-edp-panel-drop-v4-2-4e0a112eec46@linaro.org>
References: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
In-Reply-To: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bwFTYS1LXMHaETrXdK5thhWhFT5+sEKZ6Z1fZtNY+wI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma4iSZsRNQHJbZ2W+MlzIjjpWcJvGuGGSRSBPl
 oP3J++Uqg6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmuIkgAKCRCLPIo+Aiko
 1c4ICACTV5xKxTeR4arRjMWq6WVUa4a11qDoeZstp6WyrpASyxBgyXbvip2HW1SwbJxXFOhuUlq
 E9kJZMdQp1ENLl3oO482umdp3DMsEXlqlivUDazOSuVXt9NffF6tL5L15vxLd+eWSg/7USAY3zU
 xRlO66Y02jrnuYV6WJ4/xBXZl57y0rKQeFcQqSbQ0eYq7XFgq5TCN6iHB2o6k8/gUagTxdUEk+b
 BkhTxoZ1lYwwqdZJV9FHijzdRFqpRbZcyvfh5eUVs0BTlyZrjVBw25iEpaVLtjPNO6E6FXlt2Dw
 sGW1cCncmCkFnU6RVYWKZjaqIKIcLifZev9xXLuGGabDlJUb
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

The panel-edp-legacy.yaml includes legacy bindings for several eDP
panels which were never used in DT files present in Linux tree and most
likely have never been used with the upstream kernel. Drop compatibles
for these panels in favour of using a generic "edp-panel" device on the
AUX bus.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-edp-legacy.yaml    | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
index 9e5864de49e7..b308047c1edf 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-edp-legacy.yaml
@@ -31,13 +31,9 @@ properties:
         # AUO B116XAK01 eDP TFT LCD panel
       - auo,b116xa01
         # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
-      - auo,b133han05
-        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
       - auo,b133htn01
         # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
       - auo,b133xtn01
-        # AU Optronics Corporation 14.0" FHD (1920x1080) color TFT-LCD panel
-      - auo,b140han06
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
       - boe,nv101wxmn51
         # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
@@ -56,8 +52,6 @@ properties:
       - innolux,n125hce-gn1
         # Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
       - innolux,p120zdg-bf1
-        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-      - ivo,m133nwf4-r0
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
@@ -78,10 +72,6 @@ properties:
       - sharp,ld-d5116z01b
         # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
       - sharp,lq123p1jx31
-        # Sharp 14" (1920x1080 pixels) TFT LCD panel
-      - sharp,lq140m1jw46
-        # Starry 12.2" (1920x1200 pixels) TFT LCD panel
-      - starry,kr122ea0sra
 
   backlight: true
   ddc-i2c-bus: true

-- 
2.39.2

