Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C13A4726B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD4710E1FA;
	Thu, 27 Feb 2025 02:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AvaqfsNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4798710E066
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:18 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5461f2ca386so343650e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623117; x=1741227917; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q5U2PqqsAittXp536ew/SvCsut9jyzjmr2ENiR9whTM=;
 b=AvaqfsNaf6gopj5zPycm6J15DPm4gefpkUBiulyBEymtYI08IYTWndWy7ZEm5u2DTT
 ij35dJexbuEbbYgareyDL1gWYOgoUVCSJ/pApGV0NEsVGEKYEHheJM4+cY1oNqx80ZEn
 kEGksWWjQ1/ISFpyD1/24YRm4fIcV+yYspwdBmNiierybul6Ya/SWXsjoWCScWJYeGsc
 KyVo+mFMW0PcFre+8nNXSe5HakAjjlPyfeQOd2hqnk+qF1ssTLeNE6Ka8RSCMbMcw4vB
 7dEpmAQt06bA2hfhNrtQXaDRi0wzfexJ4Ptnz7hhMN7VHugEa2n9DhDx92rG/kdNZC6K
 6COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623117; x=1741227917;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5U2PqqsAittXp536ew/SvCsut9jyzjmr2ENiR9whTM=;
 b=nprBg3pZppmkayOGunfKgUxkWgq/8fljqpjthVnURwjc4v90hoV3LUpDNdMW6zrjOU
 1xyR4FTCkUeQlF0bZF13rCxw81koD/YypfoWC6GgVqZ55Qyrej+uZ+n29sBbX+3ZmTGM
 PcNuJP0ZUCw6KdEJ2iZtVp8xAym+h5f4DdEVAyNtIN2yzazML9ZCSskr+nPQD8jO/nwn
 T6B/d0I/lIfk3qRLv09yhBZ0SuKxx4HxcvkLKZTaZDY52VzWb+MfCXpO1wjCJH/0CFIE
 3p12swYXkFF9tg9fZbvWsDajtm3+cakBfJyHOPtkL0gSR57ZTslSlOmT1u2lluHyZ91B
 jTkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEbHjcrnG2tE/PaTyOwI3VSf1IKrCHHu1hqqpN6utgimogVDupjaIfOMI10D8VltQTC9+87DCmT30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNb5VIziHLvfZ1gZnrshMhY8G5FoGOLsip07bZg9ExQXEXrz+O
 /doY3A1szsAR5nYO3IKRjih6Z0lypp0TPPhNrUUyyJ/A11R/oPn1/8pUA5dnKRk=
X-Gm-Gg: ASbGncsnl2qeL/Z3Yrz7HEKnPm6Y9d2nR11tcGMT1+/Ie8zbXPDQ1FVhIA5HNDqe+Cx
 rdNPhlIBgp4aFGdFl/zaLopJcP3IOWIyEvOeDO/eTtkXVfzVqITKVuBhqH4m/SFi1sLGgrG85vx
 K1yoj/PoY4pBv0U7uw5g4bYBMyiAlRMmWYwzN4gBM0u39k+ApO/YQ8gduth9Fvy9Ms16/njB0fm
 6d0+nF47Tmysd3sSfWnGyOnh6/vgQ/kBkRhNLY33UvfRdW4/0AsYU1C1r+VPySzxzFQkobvEnVW
 YzQzLRAqE3pkEKiwTvArCWDiMxHrPOyGmw==
X-Google-Smtp-Source: AGHT+IGGp9KrMaDyRbIC/wTKqo5mY4JxnEPl4O+DeJ+ybSnTzA3m+DKpiJplqcNL8wwlCZUgExesLg==
X-Received: by 2002:a05:6512:2347:b0:545:27f0:7b6f with SMTP id
 2adb3069b0e04-5483912fc82mr11153371e87.11.1740623116670; 
 Wed, 26 Feb 2025 18:25:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:09 +0200
Subject: [PATCH v3 1/7] dt-bindings: display: msm: mdp4: add LCDC clock and
 PLL source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-1-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nAUeCQaacPy4eDcat81zyQ4FPPYgERyNRUqIhBqqdZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80G1AVXjPfLNQ8ur8MgA/B8hG0n9UdJwoFEA
 3JcymoX9+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1UNWCAChp9UJAPMKWIwQHWroB0P5YvcwUfqq3siqgw9PBarSlLO0xCgLeBDo/2zRn2E+OHq7oxB
 EmRoXMsWHJwSDbHd8/uyWb66SkpVKZH+xtYPJyBTBj7it/qpWjOMK7EZM75sHAWwwTnGgaimA+a
 /cW/3uQeNEnukCV2+c6OzEV5W5tkVLvoMuvzzMcoraJPl4sTKCU5++fBGoSYx5ZgR+Wih7rOQ/C
 l8v7QSCRHn0omGtFc4ZyVSG/jdTn1bcAFVzUXf954MGo5XJwxeRwGPM4dTCFt4kD3iBzdMoSO1f
 Z+5iseXm/gQaIZ2W5cMZcQ5bKfMJYmBK4k8CM0b554psYjFr
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

Add the LCDC / LVDS clock input and the XO used to drive internal LVDS
PLL to MDP4 controller bindings. The controller also provides LVDS PHY
PLL, so add optional #clock-cells to the device.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdp4.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
index 35204a2875795e2c1f7582c8fab227f8a9107ed9..03ee09faa335f332259b64a42eefa3ec199b8e03 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
@@ -18,9 +18,10 @@ properties:
 
   clocks:
     minItems: 6
-    maxItems: 6
+    maxItems: 8
 
   clock-names:
+    minItems: 6
     items:
       - const: core_clk
       - const: iface_clk
@@ -28,6 +29,12 @@ properties:
       - const: lut_clk
       - const: hdmi_clk
       - const: tv_clk
+      - const: lcdc_clk
+      - const: pxo
+        description: XO used to drive the internal LVDS PLL
+
+  '#clock-cells':
+    const: 0
 
   reg:
     maxItems: 1

-- 
2.39.5

