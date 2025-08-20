Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB552B2DEEC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B17110E045;
	Wed, 20 Aug 2025 14:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sz9daWg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515D410E045
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:17:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-afcb7aecf92so87867166b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755699467; x=1756304267; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=idm/KKu2Ca8SRF7L+P8XLw2Sm8cV7IELEUwwZ+skCzo=;
 b=Sz9daWg5fZJn0ColvGV+SxVkNRo1/Z5kF74WgTqAfOB2eqagof9NfzW2pUglMowBP9
 mgIjNC7U6tRaZiHMZ21O2BllVsNGeaym4iskS9ZAU5SC13tESnFGzymcBw0iG8gJuVPz
 JtRxkWILVEya8gVjXnwYR01B3vUeyZ9D3CBu4I5BwmR28wv+HzbBh9Or3x4m8GpU7nbi
 2c+nmMWzCNPbhcIOfW0lECmmfakEuRVdmXbsg0a3PSTjKir6/KMkOCA0O0uiwV/4aHf2
 SedqhGoK7iYHsapS82AlKaVqAT+c4tgZSFlGXuniWrCsaab1qerUFE3a9myhL32YEQ+p
 QJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755699467; x=1756304267;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=idm/KKu2Ca8SRF7L+P8XLw2Sm8cV7IELEUwwZ+skCzo=;
 b=B2cD35aA8uA/U2HaTTHLx2E0bmadhOpfv3uyK8o/4VutyowXpYkuDtYkL4xaiUD/CN
 CzJZfFBTzELua1bHCUqhTVE2BlMTdd5rgb5pRhWEmV2iaqtNEbr+YiUQ44PWo9VTtLY8
 CTEv+tPMNvKNTIIcnNYAZuFVZiZz8Z4Dsz1GGhvehq99AtsVzQpKVLccjXXDWJqut2Ls
 L4CpVU0F4pebwBawW74qotHfY79/QrxwsgLH/zkxV4kDgQBwM67a8qVyyxwTA7Jl5fmF
 evqQGCTN+8Ati1VprPVZCbRigAl9T+L1MVz8ABDQBfHDSGu6bcsgGCqFutw1YAGbYoCv
 Ubnw==
X-Gm-Message-State: AOJu0YwhFbEzA04wdJ39uhC+VvYn8xu0PCjuWnXOhDlQnUlZsWdSLsot
 cmKOVPA7B4DFt8c1VwKVkssgo6sBbklZ8gfme4ZC2RRUEhqcHQQLeVlfvpYJM1co/10=
X-Gm-Gg: ASbGncsX39SrSfnxDU4obJ+rRV3O+724rN0JoibMMvC2jCRxFmBnN4NtV2ieBjMnX5z
 QAHhfpZWdpsAC5D7lLm0FxBw8sf+OHaRTPOftG4wNRW8hDHTXkoq1OD4xhW0rpRildK8Nryr82Y
 EnwY6NqW4yMb153RuJEqfwHgUb13QtM5MX8OxRiJAX51iIv36OGaT5VZlHGd1L/1fp8hyAyP3jw
 yasUonRG119MNtVA6LgKa1cNS4DynuqWfZSKunRP0p2V2O3oC+0Tdl0g7ylWrZMz7s0ql3DAmYf
 RJUGVqkBdrCvY4EH2FgnhRPJ1Xzq7O4EXDbqkbTUla/MFmdMyaK2+dQq3G+w2PIaHMqxTd7EWFg
 IT+DhY/vrydUKMw5pw0DdR+tlgb64wwCpJgwhQKD++UrmytV1GA==
X-Google-Smtp-Source: AGHT+IHaPUVFcc04OVpsf0ZuU3+RTTx10mue8NcUtiq8d0XqEJtDgxMexyu56RdMDeLF78O4BSmLNw==
X-Received: by 2002:a17:907:6d0b:b0:af9:6666:4acb with SMTP id
 a640c23a62f3a-afdf0284f7amr121034966b.10.1755699466673; 
 Wed, 20 Aug 2025 07:17:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4796f3sm186541066b.61.2025.08.20.07.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:17:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] dt-bindings: display: Few cleanups
Date: Wed, 20 Aug 2025 16:17:35 +0200
Message-Id: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/YpWgC/32NQQ6DIBREr2L+ujRAi9GuvEfjAv2APzFgwJAaw
 91LPUCXbybz5oRkIpkEr+aEaDIlCr6CvDUwL9o7wwgrg+RS8U5yhjubyCN5lxhS2lZ9sL5vtXg
 +5q7VCHW5RWPpc1nfY+WF0h7icZ1k8Uv/+7JgtVCTVEqhVcIOK3kdwz1EB2Mp5QummM8ktwAAA
 A==
X-Change-ID: 20250820-dt-bindings-display-996a143c86ad
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oB8dIVv772U3FjyT8hwtDeOa1n4Kz8C5WHwIQxNF56Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdkFFX9cVJd6R5kRcdJyWNeW8phvfrUFyZvky
 c7O0B46Z76JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXZBQAKCRDBN2bmhouD
 14V/EACaWKZnwFKpJN9lLx5+T8AvWwAzgkOcpXvf56f5kFn2bPSGrQBlnke++fV4S4LaZeLKD+j
 RNS/SKkb1UrH8ApcexnLjnJ8wXNsFb2ezwUx4ZfPNNq9xTrexoH0ucdW7PxWO3+fEUi1VI+Merk
 V513f1Bq0galRpDcsLCVjiT4vxTjtQmBfUayw2FIijw11JgpNq8l75sepw9rO3UdUjR8uidIwxd
 90FazyGUdtQA7oSWKaH4p0OchouEApC24D8fHRo1SSR66d7aiKNfty5gFEqWc3seDnsG+CbdSv0
 OCRm8NY3QuvoYiGGQCLb944NQYv+A5Jf9mMUhz1yTRbIyzus7gaywh5xCEJbhu1N1Qv6LmsOESi
 pCoGYnFfrWEszEexkxl45XNeqd7gtkvVUQAfD+m/It/RfHE1GsQw4IT9mz9PSVOqtmGKpVMCkgE
 DAQ+mM3bahogaj2Zjcnj7RUOeOTc2BfLl9Dq4B161jRwKsSZEJcdIqM/U+Nsk7AFfIQ9+tXQbcv
 q6fmAeAu1Sq03EjLmTdsPokNT+wkTBob4sDeg08VO1xDDBWZ9iPDQbzp8EnlGkkdn1Trm1g5W4j
 nyvYDMDoiXYNg6W5c9auHrqzpiD/RLXXOE1SbDLRk2WSab6M+LNAVxCZDiR+/e8Oud6RLdMu24P
 Btij8qdVePtogvw==
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

Changes in v2:
- See individual changelogs
- Link to v1: https://lore.kernel.org/r/20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org

Few minor issues fixed.
Rob, can you take them directly? Display bindings are pretty often not
picked up.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: display: ingenic,jz4780-hdmi: Add missing clock-names
      dt-bindings: display: ti,tdp158: Add missing reg constraint
      dt-bindings: display: rockchip,dw-mipi-dsi: Narrow clocks for rockchip,rk3288-mipi-dsi

 .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml        | 1 +
 .../devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml     | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: d5b9a4f227e7d13a60f7704cc0d8e16be4bed157
change-id: 20250820-dt-bindings-display-996a143c86ad

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

