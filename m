Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BFEB2D46A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E480510E6A4;
	Wed, 20 Aug 2025 07:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EBjWswm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D9D10E6A7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:02:58 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-afdefc9b005so10672066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 00:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755673377; x=1756278177; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ftElaWDs76SxbU5UXNsnZBygKAXPkr+qMloZ0Jeef7M=;
 b=EBjWswm0wq11NwOUL0yYwnRlAUJ8MoMFZBcwgdU1XoqDLJyVCMFY+ocBwI0j008+Vq
 8N4rklvSVDv/OfnDtS9xgpNCZuEqw7UmuijCEkDUadkbDZcDZq4ELvOE5ifpMSCIKCvj
 pmM11nQkn4B7vDLmDAfLPSxLY95UmvXKGkrquQNZk3+DX6wOUv31JUCBM9iW64jtTmbE
 R5BdUTLPiYVdVUMJk1DkEoj5rAG0MoD6xYBc6sjdC34b1OM/aPoYJ0QEXl8TzKtFD3tP
 UdPxH5neKR0PtwHtlihfQQcnzAa4AVGMDZZmOzWUmwpDcqOp+CPpOJB+PnhV2S1+kwN2
 uTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755673377; x=1756278177;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ftElaWDs76SxbU5UXNsnZBygKAXPkr+qMloZ0Jeef7M=;
 b=YcjVuOaxpY6noK9bWB7H5oe3Xl+7Qd+N191UDe8EvTK92PJk1PNtJ4vbfWF64DlTg3
 7HR6EEUQM2Tj5qNw1mzHTc4ICiSr4i9gctk36OqFUFFw56lqTfmtZNT5UkxcqImaufiH
 QgGfcqzsDm8cI6ISHbU0ycaZ7QFT/07JT/43jn+A5erCOLF1sL1/SRF9xtt5EPa7KgpU
 2890wKeLB2GmN8HQEz7IhDbbfKBchk7QBQgb9ZJoLMjOWqFqE5bgf3F0qrLFpk+aVK1m
 8UW5fHfSRvQTLKEvo3aPYYzShNHTO+8WhRFSSRA+XrhwUzjSh1sg1KOyWXdfJtyErbkZ
 l6DA==
X-Gm-Message-State: AOJu0YwhtvpOKQI4//Ku01mWYbyE+MvfciNler3fIdr7zkv2vHjFH7it
 ZtPyp4zOUz2z1nwk7TgsGmVwBL1WjiAHWkpQGgaTMVulBc5e/nFAV1z+j9U3wxhFpg0=
X-Gm-Gg: ASbGncuaDujXePSUj0dq3nXUfSJGAGEiowCduzicgX6u8bRgiQmOmshOsFmkpMd1hDo
 e8iLhWaSN7vz+Xx0zznmQ2ovQZLPikXTeyjWdtEvsbsQ9NL0coHD0g2Ty5SrbjAxDHmmguEb1NG
 Nb3hcb/VndsI77VuFKYXLGyTLHjD5I20z/6JEWSvpu00WL1Sjb82NboiqTcKiAnamE4irPtnWop
 m9Y0r0sVikFQ1O+dK9CR0xnkItUYiskvaAOYuIN1xFal1uFymx6mHLUOerTJVqmS4BtKllcB7M1
 xcnddC18TeRHIiIaWj5e/LzoytN3jnyTzXNjFoDeZsDAPqkrp9z1lGgXEunmhv1FD2197jfb7Qg
 6RQwp1xFZo9hK+Vh3WgWK5Z+qmp5r2LuM7AyETBc=
X-Google-Smtp-Source: AGHT+IGzfjQq1LjJ7ggzhlchsb+Gf7jF7ybHUUX6hqr66XtQog29EL3V/Chhryj5RJeGuJiIjRa24Q==
X-Received: by 2002:a17:907:7e8b:b0:af9:3397:ee9d with SMTP id
 a640c23a62f3a-afdf00a8954mr69459366b.3.1755673376560; 
 Wed, 20 Aug 2025 00:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf6ff14f8sm37756466b.67.2025.08.20.00.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 00:02:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 09:02:42 +0200
Subject: [PATCH 3/3] dt-bindings: display: rockchip,dw-mipi-ds: Narrow
 clocks for rockchip,rk3288-mipi-dsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v1-3-d5b2555df51f@linaro.org>
References: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HbkuPHQO9jhKV8ffqBrLXqJ13Z1bPzLyMUmFXKOeato=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopXMWpPbr64E/k0zg+O3azP2p8KtOcS4cXs8UK
 kxOJqi0BAeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKVzFgAKCRDBN2bmhouD
 13LSD/9IQvUF5G4t0gW3smruaTu9Lu+S7YS+HVDySWD1gSsXPgb4rnghh3t0QVcd9X4pv8u+5Pe
 0Z1bb/YZTTRhdte/mruSY+AWm04RLEAmMuANTR2OLJE1q3pM0NasI1i/nDME+KRbTcbY5acZCHa
 oNbxYAQ2RGTT1mzq0FrvUDbAJNP4qt1bJHr9mHceexS0ZikYyOwiJI5iMrxc3P2nhUvn/ANW2w2
 exCEVwjKr48QJUqEcAyi5obb3i+S+pjzkPHsejmoLZiXiHPbzZKboO1U7cONJO3xihpeCXHUvO+
 2feirvTp4or1YS5/oGfbNKbk4jqn3pPdRv23ELlPfNYzzzGCNm4WMk7j6/3qPzxRk1ZSFPmnmrg
 Oj7Qyc4QM0VXyWJog6Z7kCLPjLyA3/t1fisq9WlB6JHimLpAa7qAwicFwRuwDhXPg0BjPN8KP9Y
 EBy/BDqiHCvBW2C4IKBbjlBmTC4tzWnB/+YMMNG/aazNWx92d7rb6ESMtm6+Sf2dlEx9O3WXmgY
 zB3PNZvuCqDtJp/FZL+D5fdGNTXJxgT228graq/ykbqNZh2ASKYiASXdGNPUJ3cicneVwuH5mjj
 qGyOBsivQS7Q97vJ9OXlDM5nv6DOtOleVnlRnlKv3/G3W1XCAEzbYLiMqDrOHGA2yr+tUBCyDWe
 b8FF+yr43g/UALA==
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

