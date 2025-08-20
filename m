Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C13B2D468
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E8910E6A2;
	Wed, 20 Aug 2025 07:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KOnNw3oj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5A110E6A2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:02:53 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-afdf393978eso1854166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 00:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755673372; x=1756278172; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DH177aI32fcw+0fi3Kr7cEylMFjtb1+kKdAUsXxCdWo=;
 b=KOnNw3oj2reReFGD+snmwTO4Xy5q+5cTn7OdZgsSBr9LZwLm7d2NYRwuqpwi4m/sa8
 Nh4mJaB6bQkjvo7wwQ4VstXp55D/sKnYWOAkm9EkeC5GNiHQRhXWcIh/8G/1k39EzFag
 a97Uonx/26tt8Hzv5OXQu9lYX1fSyQCSBeIQUMcBm6Alq5lZlkM4kpKJvcjlBWtK/iHO
 twy2Q/iIQh8rgcy0MjnwYc5vKX4JhrsHs60vnLKCFj/w1qXoWqsxKVQNwCA7hMkQ0WUD
 H9O2A0KsLMQcNN2ncSoMSbsL2bk7zbwjcWiy9qh2DhAbxEyj8J8wXsNJgSFpWS/atdPr
 mFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755673372; x=1756278172;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DH177aI32fcw+0fi3Kr7cEylMFjtb1+kKdAUsXxCdWo=;
 b=LLPcZ5E3PzHgLta5nR+0jsz7mTri8Js1tuJDXJtVZTnVACfgvckduvSVof733+tvQk
 kOOFu0+AISoVUUZGdRll5ICURPhazvRDJ0QXVIKFCDEj3OU/yzUE0laclNGN85f91clL
 4KP7+E/Lq6sOQeqzMRe9qc6jSUKCQOSktbgBjcDaVz6CXoLNfHdAK+qLOTnZ7RPJgVNr
 RBergdFWrh9/t5fX+PlxzR3Z6l858mVT5fInrvtHJs5c/EYhUmcW2pTmTfOMBbWfoKSw
 upNK8ah1rgAxDoEbOaKGLCam3hY1geIp/l+OiIzF8tQ3sqrl7M8KLHJdn3G9qQQjt4pG
 vdcw==
X-Gm-Message-State: AOJu0Yw90tX3Z74x3IbJAeygxwNZ90pUrzAKeHVXyd7NC0diehMd9kAF
 NsPFxS+I59LTKzpSFkp9LUDPgVW/E1feqPJgggYNAQhbTLt28pE7O56rkQIIREDqGYM=
X-Gm-Gg: ASbGnctMrb0oSy3HC70w3ee61wSRRdQHLzzRF/vpf2j5O4irZqQz0YoquX7Xb0NUpnb
 UaANu8SyeVMOezWZAgLgKn36IIcjC5sG7klcQA15pqhF6Vulp2q2L/OYdhWstS1PaqVZ1khb1Rh
 HD36Yp7VM4qsGIMO+b/wNqQMvYVkGZ/1bJ/zoKdUf7TfYUziHfii/sO3zBo0SXY/1aAuMO6JrvA
 JaORT6JWH3rEFKvAOXyjV6TTmJKAHRkexBfuBgkDvUcViUeZCTQAz3LMjbibeC0TUgIBP0gpqtQ
 LfHSQ0Rbscv4D2jb7/41X5/Vsu3lyPpUmw6B5K7KNt7t+xStFCG5MKzlGwSl8HdmXpXrhl+dW+F
 au0ClW0ezw5VVGzTvhanB0i7vaatkYVg5XQhoUvI=
X-Google-Smtp-Source: AGHT+IF9FNxgrgCt2MNISlOazft7efckRUUOCCyDUI6tMZE11GXZO0az7ewPiYnvvCxno2JpihA7NQ==
X-Received: by 2002:a17:906:7316:b0:aec:4f0a:f9ac with SMTP id
 a640c23a62f3a-afdf02106f1mr69015866b.6.1755673372063; 
 Wed, 20 Aug 2025 00:02:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf6ff14f8sm37756466b.67.2025.08.20.00.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 00:02:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 09:02:40 +0200
Subject: [PATCH 1/3] dt-bindings: display: ingenic,jz4780-hdmi: Add missing
 clock-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v1-1-d5b2555df51f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Pxy1ceX/K708ATMRkgiCl/qGBMScopnigW8cLcERjdY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopXMVT/M8Kz0Rj97OPMv9sVNcaz0uJrb0hpTH8
 kC19UClVTGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKVzFQAKCRDBN2bmhouD
 18JrD/0Q2MVyZwW9e4PQUvRkQCrJj1FZOoyd6meUdkZZCtOx5WXnCz6j7oqqPHzA84QftUJIEsb
 J4c4cgQf6k6PZn+zX7ck4MK2YbM5Z/ptaV6cyi5Q3nB+sNqkWxX2ZTEt2GFPbSjFVhmYB9G28K4
 Ov8uyjdeLuFnCQxWj9RtBVw0joZGfx5pEs5xI9dHfCJbMd95Qou4cqJtAbFwUnE8dLMROGaJyp0
 sxJYXnKH91zEJl+MxF5orITmFGsZsdBUfeBrzOlkJHZWSEDQHaJ5u8e6qzq6z3tVXu8wUWdL5kw
 PaiwcT8AQrcAndkVNiUDkjMc14HH383AyaT0//MGYrdZPxZmd03GC8hGGBAf/duk2GfNHN7ZifZ
 dGPbiOqW6FdyG5Hztz3myV2M9Tozh5G0/H5NHGpehXf3dgFqQTgWKp9xBiGUcsuPBLrJft2S0U9
 OC4BNjPaJ+KtIYYmMETw84dGimY/hECbjUO9Oo+d8z0fMtuPrSp2j4130edqJNQ5SrEPEfuEgDj
 +vk/PCpEVNFcSGXMqqrTfeewDXEfp+mdbh2t6yLFC6pnfcu7X85/2W7+8Qbcohm+mmv1EcpG6EP
 IPbnKFuQQIHsU4CgtjCPd4w0QEevG7ssarieYUB4hEUsO005lHEsQP8BMgUTZCPPdDUPAp//BRy
 HNJzhF/eT5axvSQ==
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

The binding references synopsys,dw-hdmi.yaml schema which defines both
'clocks' and 'clock-names' with variable length, therefore we need here
also same constraint for 'clock-names' as for 'clocks'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
index 0b27df429bdce0b7e080ab291ee0c4c6b51f8e1f..84df3cf239d5bedf8a5806bb48507fea207c7167 100644
--- a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
@@ -26,6 +26,9 @@ properties:
   clocks:
     maxItems: 2
 
+  clock-names:
+    maxItems: 2
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.48.1

