Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AAE78CA98
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3606410E455;
	Tue, 29 Aug 2023 17:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E95410E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:28 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so71441941fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329446; x=1693934246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FenEPRzkF+fCLIr+dUsskF7AjB/E9ox5j4UlAbRUoQo=;
 b=Yo/oKwwdBrMUMDkG5wvtSq8crhNn4CVhpsSAkfHlafXQiHFiaNCwXonEMR1ZDxCS5m
 8YMbkPO77M/H+V8eGgHCiLqFyL8qhL3LoN424+kSeFvcy4Iw6OTRIVTpSCSdd9tCwDyf
 wK/8ORLWL2an1MTEX9kBbYFORB1c6srfOFu6kASEukKSZlOVd+rDH0qqXHzVYYUbjidp
 vAaJcoC5HbbSkmGx74F2zL0RGWprs9ssIYNMNeCUn3cIqf34INO4z4cFqNir0FJsujPG
 QLxlsOanjUlDMPVQsbzFmL8MlsHmUnyQ97SW1Iqn7dN1mY4qZODbo9MMtiCx+VK0783S
 3AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329446; x=1693934246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FenEPRzkF+fCLIr+dUsskF7AjB/E9ox5j4UlAbRUoQo=;
 b=NqgwcHbKGA4v1KQh/tJm4lBXplBt/O+sFkQguZoeirIOK2gPHgwu5xLb0QNSihnzkR
 rIlxldsEhvdPOp/DwWkr4W/YCrcV3M4hOPzntFv3VUfk9vw+0FgxQXKNqkurb78aItYK
 WrHC0EWEOX1deFQz30A79DHvY7EmjTw4h7sIIFNXUhFhSkczGYGNmRjd3YOevk9PRKST
 ZF5Rs/vXiHfl0q3z936AKx8/IfJcUWDHiE5azBcapAOs6VrJpvJ1dawivi3SpNn41zgo
 x/P8U0GYo+n2p6OgfetNm2OvAkOh69QWj4lRXC0V1bm3JBZLPU6iq6TzrxuPJAjlu+sI
 /dKA==
X-Gm-Message-State: AOJu0Yw5JP0cm+egg3e8SFQIgdKCGwiZ8lYCXfNLS9QvFxkUsRx6b/nY
 XsxjDEbob0OhyDMlD9Yw7Q==
X-Google-Smtp-Source: AGHT+IHBPt21/CoYA6gAD1CvzSK0qv2qopqh1SeqIwu0FZaxDbZLhuYzC+CMcy5Il7uIpCQK4RaODA==
X-Received: by 2002:a05:651c:1315:b0:2bd:1394:583f with SMTP id
 u21-20020a05651c131500b002bd1394583fmr3610948lja.3.1693329446179; 
 Tue, 29 Aug 2023 10:17:26 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:25 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 02/31] dt-bindings: gpu: mali-utgard: Add Rockchip RK3128
 compatible
Date: Tue, 29 Aug 2023 19:16:18 +0200
Message-ID: <20230829171647.187787-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rockchip RK312x SoC family has a Mali400 MP2.
Add a compatible for it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index 0fae1ef013be..abd4aa335fbc 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -29,6 +29,7 @@ properties:
               - allwinner,sun50i-a64-mali
               - rockchip,rk3036-mali
               - rockchip,rk3066-mali
+              - rockchip,rk3128-mali
               - rockchip,rk3188-mali
               - rockchip,rk3228-mali
               - samsung,exynos4210-mali
-- 
2.42.0

