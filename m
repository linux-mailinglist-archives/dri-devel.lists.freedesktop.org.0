Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06FCB3F958
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A51A10E608;
	Tue,  2 Sep 2025 09:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XVMU0Bil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E7B10E601
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:00:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3cf991e8bb8so2339580f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756803634; x=1757408434; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NZJp+xAbTo2+0/zDtOg8BIzlYFDkHgZ1HyTvcor0XRg=;
 b=XVMU0BilGvmIsbfK7oE8XwvgDSxt2Ki3y0JOmmAOvPLVA2qug/5TGoUowBWuhySQhf
 IfLCcXUzk/1kRnJ9R7+DALrhmof8BRk85DkMI1iJL0UxSr/vYijkG9OzH0bwkR3M94+v
 TlayCiN32qu3tIo5HRz2GBI2yz5MoVQoyHEl8nZ8GSCUpNyuK7vY4O390qL++FVZZPeT
 pIzydG/KTwXl0eIIhECam2Sw/TGJbW61Jjt1n9twytjOArTuZIwAhRuM6jbXXhEqLUZT
 JA9BsXI5KZocOnK2xWppNIze/4/l0kvnMId9oiPIHj3PN8gWlPb040vIUv4SMwvx2+Vf
 IkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756803634; x=1757408434;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NZJp+xAbTo2+0/zDtOg8BIzlYFDkHgZ1HyTvcor0XRg=;
 b=uT974IiZKXfEOCtJSsKtT+UDNIoG/gtAh8pQHKdx0f8EKe86CMV/ddSd8kGuNKw1eE
 jIxK/kCFNZ0Ejku+YOnbLKP36fzERKZdgjBxRyzyW7Magga7j++pDmqJXV7BjIFcFh82
 GeL8/FrE95Qz0y0Bp/kVlu+4iZdShnO/10muzPWF2LYKRQjWE4kwJ9S8pcNyL8oyQhgq
 kDaulZRo6q3+NWZ2YFqN/QjHDHWJ7IpTuITztzY5cWZFyoZ2cfSmrcWiVHhYTIGyVuVo
 +MSbteZuMOTemCsaBiFDP2NpbQVT/KXwoqKU+i4YqinUq29UJaofx8IyCNlBdy50HHbX
 88FQ==
X-Gm-Message-State: AOJu0YzecE7TgKnCW6yWth4KArFZxILlyYIGym6S7OX/z3oz7DK1AHmX
 JU7i8U+08EP+UONfpvhkJlTaLl+Xbz0rZhkxR3Ir0BGIlXlcE/2hUbsjeqwLgNQiiUU=
X-Gm-Gg: ASbGncsZbxtqZCmxWwE40nvPHZL1sgVXnStKAZkcuUa2y0RSuQKKiv2MWYz3a8bT+VQ
 i5uMwISWTSDIvCLAf6H4hVfvc1QbHWaZ14lLt/TXCeV5BBqLrcSriGndu7uCFXvDMPyu86PX1tY
 E2+sWYdYApFP6otlY63rtonSXuBlZghAVQj5MQog2GaCL5yf9d7X4EaXve42YhdOaCLKXdWV1ke
 tn6vNElexRLsgakjZGwZ3quyei+qA9jBASvwazp29WwGaj9XxLpfmlE3GO/A5pPjoD+OYJ2AGEJ
 RXnf4KKcqMR3FpzV67XMTeiYH00vHM26qdWrwlh6R3+z5yKSUGeKS2vnNGSt0mhtvliH8hjxdGs
 /tsaJ8ihnd9EV4BmbFAeWroZNOvGxkcgJwjPRpDPjWh4=
X-Google-Smtp-Source: AGHT+IHfb9W6Hc9fhkbvwOEzR7R4xuMQPNSMx9xL8H2MM97h3jF8v3/LInCLpQSqbnItnP4BCrQ1Ww==
X-Received: by 2002:a5d:5846:0:b0:3cb:62c0:1eea with SMTP id
 ffacd0b85a97d-3d1dcf57a13mr8399840f8f.25.1756803634361; 
 Tue, 02 Sep 2025 02:00:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7271cd01sm261112045e9.23.2025.09.02.02.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:00:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 11:00:28 +0200
Subject: [PATCH v2 1/5] dt-bindings: display: bridge: simple: document the
 Realtek RTD2171 DP-to-HDMI bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-x1e80100-hdmi-v2-1-f4ccf0ef79ab@linaro.org>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KZG8o0WJ9Re/vKN3NPbu9QOtsOJJZv2uJocpkewtdKA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrIuFgDKkYXOkTv1ihPBQVWU3sfYnkAYl82ek1nL
 ewBnoz2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLayLgAKCRB33NvayMhJ0QzUD/
 9PMMy7AWl6efzDwVsG2jN0BEPfR1VI0fDO66I+6cU1tzE956HxCK+S5gajlWS4xawEEpMPGBP5WiEi
 e8LA1Qmnluy/AhBl4u9se3ZMQVXsordhS9sx/hpyzTNGoG5B2TfvYpp6tgiAkYwmqvspdegzKlv3Be
 Koo4hkRtxDo29dsV/wgyzdAcFk+uEIfVoEpfoCLzJqoywPYKLkfERA4y9X3i7ESZR4wPxN8UVamYlf
 fogG9RyGVGCOC5058UeQXY53LBoucMVj6D/edxlmBU1wrIhStDqk2WJpDuuf/fHUB/xL/WavDzW37k
 pGuj0424q4aflRUXcL6iBwQErUmovyP7Z+Pef8kznH4Pn6LXP/D9p4DgxyKLWq0E4bhBKkHQfyMLLz
 TMggt5ae3Z6coBtLcG6HhtXIQs+2oR6XU9RmvECIF2I00/CxPyiNQ0cZNVrOZKv9J1F9v0knlPkGM/
 TlHVG29OZd6o/n4C31kVQQI1O/gaYnt1lRDUM1GZSn/oNQvJ+De9DnSblO+6r9l0N4Yn2XYpCMCuKN
 46XiFIXtChk0WKr8c5de7O8RP2rSq6OLQkZu3qHiGflTCPpL4XXc+UCp4B2Quc7daok6pkRkq2PCGJ
 M+WMYwH8t0KsZF7SXtHzYkYLoe6GK8UuG/hYq4+j0AHSJtgi14XxcHSS8Z2g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Realtek RTD2171 chipset is a transparent DisplayPort 1.4 to
HDMI 2.0 bridge.

This chipset is usually found in USB-C To HDMI Adapters and Docks,
or laptops to provide HDMI display output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a5897843685727a49fd5a90096391..003a1c934f863864400d689cd784990cbc1de3de 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - realtek,rtd2171
           - ti,opa362
           - ti,ths8134
           - ti,ths8135

-- 
2.34.1

