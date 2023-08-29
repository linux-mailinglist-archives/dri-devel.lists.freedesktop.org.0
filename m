Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3DD78CA8E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7A10E41B;
	Tue, 29 Aug 2023 17:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A5010E3E0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:26 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so598938566b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329445; x=1693934245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21iVkiyaMhIOgRnviPspvm+tAmKdNHJ4HpDL49p+DgE=;
 b=NKjq2NpTIzwWtsb4WQ8JGYvGWyLJPvx0NmmkaWHXoHsK2bUZZOLSZlh09hYMZQjyNe
 YRJebTQvSlvRhwarjHsEhi0stN7D8UajKYGCZ3BbcZfLWAg1RK5gHyP0IqpmY0cDuAU4
 aRbXPvPTgdpOt7wC7BTaeD6lmV+1idIhZ3g3RGmvQYqFI+CrnXPcrkLweYOID+NGHEK0
 DRBRLt+Bdc5LLin7QH6zusukVIw5lnnj3z/4E/VDQxPCdazNNIdrT7quG/nRuF3Z/XWt
 gj9SKxmkGlyI3H22Mf9FhJKBQhVJqGWFmcuHK0PaZwCl5qNDJY2RuX5Mr/GDdzGX5RL4
 9TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329445; x=1693934245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21iVkiyaMhIOgRnviPspvm+tAmKdNHJ4HpDL49p+DgE=;
 b=jMLWmYw7u8OaSwETbZRk6n4geb3VEOKFQ7aAQk4AJzexMv9LBf1949LFSKvH8jorzM
 S30CNOsSU5TDiem+ufVQ/EHM2QX5Efjzjt735B4b4+iriCqfzAzHSoGTITyKV2pcwF1u
 xOV0Dk7lndp1Wmo1GbIrEQlVoExU2OIm0ZMuvXkR0OGU18rzPD+Qkrzhm+MADf5+DkBH
 1J3OnvZKvuAIVJiBAaxeW0kyLyWsBbcgWNvvTtYx+uuftwAMIdeQWxQc4meTgxjt2oEj
 CSZP1Lw341b+uRn9A3iIibVcxA7waMVGPbv7ubAfSjmYPhDeK44jNT7ZRjLX2dWNGPui
 NTvQ==
X-Gm-Message-State: AOJu0YyKxJT0y9890Z4ZOyBWxnIwd0FqGpp8z8HsdF35VWh7NzGFHgln
 oxhWRtXTc6q50or2ig77BocDSPpPOg==
X-Google-Smtp-Source: AGHT+IE47kgzk515LSlCQdCMRZcljVGwTMt+S3yLZvAE50B+UB6aWy1SLTFd1oolF0G2c8xX/aHgtw==
X-Received: by 2002:a17:907:7788:b0:993:d617:bdc5 with SMTP id
 ky8-20020a170907778800b00993d617bdc5mr22834649ejc.37.1693329444970; 
 Tue, 29 Aug 2023 10:17:24 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:24 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 01/31] dt-bindings: mfd: syscon: Add rockchip,
 rk3128-qos compatible
Date: Tue, 29 Aug 2023 19:16:17 +0200
Message-ID: <20230829171647.187787-2-knaerzche@gmail.com>
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

Document Rockchip RK3128 SoC compatible for qos registers.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 8103154bbb52..089ad6bf58c5 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -61,6 +61,7 @@ properties:
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos
+              - rockchip,rk3128-qos
               - rockchip,rk3228-qos
               - rockchip,rk3288-qos
               - rockchip,rk3368-qos
-- 
2.42.0

