Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F43B2DEEE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D8210E753;
	Wed, 20 Aug 2025 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BGTzfgqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DA510E753
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:17:54 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f5f9aso1045085a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755699472; x=1756304272; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=URpbi4pDupU0ar37Ye27L+XUpBCcJFcEEzJPkVZbTwU=;
 b=BGTzfgqPUtfu/9A/lLIaHhtjYt3i9Ne7tAdaAhUFkRYADGNGOvzWUAkSiLNuBMF9lC
 uh7MK5mHAJZcDUv0a4AXG1TpuM0w+z+kaEc9q5XBIkjg3d09U4s9dv71iwxy2oDl3xLr
 POcZitAdo0hhnS0W7UOuITM33DNcwghHqsYGjiacZBxmghomdCFaa5VFytWPSsZZwG2L
 pBE/LMK7hldoZ4tNN26CjiGtWiIkPDJfI3Z/X/SrVInETkyUVlVWxOwoNxyVwVoCgTz0
 eI++tDiDP9ctmJjt3K7/lo7/jyLyk28+VEtOFZe/CAPhR/bMUTcBztCX1jSOerCg488f
 Es2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755699472; x=1756304272;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URpbi4pDupU0ar37Ye27L+XUpBCcJFcEEzJPkVZbTwU=;
 b=pLcPhFEM1t79zNsuMeXyhwP7iITy4peIi5L3gAkf37dhJdwIUui7/KC5GOi6MGsFV6
 PARuu/7DpOZBG1GC4LgSHeFt7ZGyXsZXQgNrsMlB2RjbsQOtvZx3X9pQMUxpfCbL3NAm
 GNG2d10S2hDserEWU/OBDgxwX3/Dr0nOKa/9TV+p5LpO6wXvzOYacI/TWGSM+SyE6LnS
 /PGXU42qoL+nOk3IGpBrt/cBjUTTe0s/Sb2QtJpIVcxUFkhZ84s3y40p9vtrJ5KA6s4Y
 8euweOmt6CUdEqLpQNkcKQff9VBFsj+gES5mQNQEACCOqPkq7evN7nG1Bkkz5zDpeMph
 c79g==
X-Gm-Message-State: AOJu0Yx96ZP1/ADdlDBndGw/psvWbGkfDrO5fWRpwLeml7NhwZ0vVlWA
 senw9+m8LZ4z5X87W1MgxW1sBi73o7buJmtAKBbOS62uaCcmspuTrSP6QLhNvoRmCQM=
X-Gm-Gg: ASbGncsrDl2zep8i3gH2t53/+LkRyQWpKvd6n4RWXX91mwUrfXkjikF0Y/qMuqugOda
 usjbmqaU84YgcdZ5ST7biZxEpsCxd0juvh2RfZ+0Lp4AxVRTQ8GpXhxrN1b5gqxu67GvX4uY1NT
 KkN7TwZi5RaBep2+thv/IuXvdNfJBOsSr5h+syD+3Go+JW4Bh8v7bSF/V9YYKjbyBU8/4UWCc3q
 440CfC+9Jarf7KMIzaPLEa81sSIhqlpsh+xP3VsjQ4cNqvxFnG8KitQ9UJCN9X3GWE6k1DApYgq
 bofCtwZydJ8LwKkdbBBgtPFC+wb8lPGcvPQq42Qjl5cZJlkbHLo0RB97wUmFnrIvIZSFJjSxDkk
 gR5sAy40RWpQvoX3VxN9zEh7IrFgPJuqlAnTNY0E=
X-Google-Smtp-Source: AGHT+IES/Jpr2bblhYPYlVvqT4FUQdP5A1r73/aT+walwE4It2pGENTB8ZRS/pZIeQZcjJUqlIBmrw==
X-Received: by 2002:a05:6402:3553:b0:618:227b:8848 with SMTP id
 4fb4d7f45d1cf-61a978521f9mr1217721a12.7.1755699472423; 
 Wed, 20 Aug 2025 07:17:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4796f3sm186541066b.61.2025.08.20.07.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:17:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 16:17:38 +0200
Subject: [PATCH v2 3/3] dt-bindings: display: rockchip,dw-mipi-dsi: Narrow
 clocks for rockchip,rk3288-mipi-dsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v2-3-91e2ccba3d4e@linaro.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/izB6gBIA3K/m3qcFUJBSak3FLjzHZUWp+/J02pD0ac=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdkHcAbOwcQtqQgqj7ZYeVzJwPpe0IzMwnRAd
 uYCfwZnO0CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXZBwAKCRDBN2bmhouD
 1wg0D/9GLhAD7MQiXQ7UofV+rdMNcDfh8bSRGHzYgh0CW1ZfMD8B+RvKKD4E95jNLL9hAuECz0v
 ovPUq9BoXz/WW6WfgIobTk3angg8dY30rG59XdQGmsdxouZ8s7Hbn94Or3nan3LLC0CChJqBAPA
 5fSzIQMsm1rZ6cfIP/ZF22ZEHF11eMcK/bRE3Jg6+6aZbFhVQ94X0AWHhY3OezSwClM148lwnLW
 oiPop0xxBGVJqNegBJFeL3HbnVHj47geT53xq5Cg5FW7wD18sjwX1r4RutWrR2rs1E+W2W93L8P
 6zlsOQBGAG2dH4kd2NkeVGbnembzaE9TAe9eb5p3QhEafEJVo8N3E29cGqQMtr1+cu2NWckPgVq
 HuLtBwuUaYsrSKbbPc8yrLiJPcvuSKycZtoI8EoH45A/slz+8NYm+K14kDejdLFt7vRC6Y4z8yG
 Ef59nXFgGEj1IssG80ofef1C2dm8c7i6WfQvH7pMj6oiBuqGfsu7yoPTw8TIStF6jGTJMYfVc8r
 6bzMS5NlISJSmvIbMphzbZ6Rs3n6ZqyMKZzOglCbIxEYm1h1DlGO10auQm10ib6/zVrfA/pfSIa
 w1yzKXXO8Syn+jtNF1y5a44WKVMe+xSKydRTpiFZP+1+J+nToDDVLKFJwR9J8Qzh+s5FQhs9Nwl
 veFTqiQi3OAnk7Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

The binding allows in top-level from one to four clocks and each variant
narrows the choice, but rockchip,rk3288-mipi-dsi missed the minItems.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix subject typo
2. Rb tag
---
 .../devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index 0881e82deb1105e4f92843380c0183569f688f08..c59df3c1a3f78ae0d345dc725f4dfb3eedb3de22 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -97,9 +97,11 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 2
           maxItems: 2
 
         clock-names:
+          minItems: 2
           maxItems: 2
 
   - if:

-- 
2.48.1

