Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDF978CA89
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B3710E3EC;
	Tue, 29 Aug 2023 17:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B692110E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:28 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99cdb0fd093so612622766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329447; x=1693934247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwaGmtZUPA/dwS41wMl1NXhL27pNtpsYsBs+oXIwgzU=;
 b=HWwZSJR7G5j/UlzgJ/xk2k5cG0brSXt+VPqGoGnypzwtKwlkY10UxvRwUP+LqtPTLb
 /gSA3sT/uvZwI16Ta7YRBOgqw315u4p38rJzQ1ARmo41k3TgI5bh9Q+2NYWq20txZ46j
 mNrmVV6dQrvyn3tWzsy85kHN3SA9rjmJySwAlKu+cRXAnYBTfZTXyqHEjmUpfORjofM2
 bJvoWqHaoFrHmL+gIQClU6YikQJUwBQraSsVNwP9bLl8qVZCVa4J9tBF0LJedLPNFf6s
 3CAeOwU/qcU9eUyUvDzocAqVbWYEyQIbo35bgDFKUnm1gqcDXkeTQQdfzncZ+h/VFzdM
 S3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329447; x=1693934247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwaGmtZUPA/dwS41wMl1NXhL27pNtpsYsBs+oXIwgzU=;
 b=Vq8aLNXVc3oDVEDoR4ND/9sI09PWhUPiHc2mkd2G58Eo3Lt4ccRR+C4MQQJZBVENpC
 pSN2/4WEEX47cFstyjn2BeRjoZVU1cH8GVkQnDCv3EJGd4TBNTktVFuODBHOETj4bzDW
 89smRhnNgE1x69T9iM004iMQnubCXPweAN42loQlYqxqO/v5FfAhP1vbaRu+jEopwrWn
 A+svT2alqGEO/zf9O8Ld+bXx4wTeJMEvrjRnofVbmLP1dRd0UDj569G/7KEL+0PEx0yo
 07SpxmyQDm1pSkXg2a9k2JYfP83p1BR8/nHOCVl7y3ABtdWlavNk+9YjJAoR3MJiYVQy
 mJ+Q==
X-Gm-Message-State: AOJu0YwvZNDPzHPpy1+L7qUGWsO/bx5nw+pueIm69Mra2Kz/MD0rwHT9
 xoBTk8Ro3FxNoZwfMozG3g==
X-Google-Smtp-Source: AGHT+IHgDpcosA9S74bQEeR2hEnEpLMTHmHxkazGsrlnCTREbmknY2DDkcIyWAd5FuMN90wtDYQDVw==
X-Received: by 2002:a17:906:3195:b0:9a5:d657:47e8 with SMTP id
 21-20020a170906319500b009a5d65747e8mr1405316ejy.52.1693329447156; 
 Tue, 29 Aug 2023 10:17:27 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:26 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 03/31] dt-bindings: ASoC: rockchip: Add compatible for RK3128
 spdif
Date: Tue, 29 Aug 2023 19:16:19 +0200
Message-ID: <20230829171647.187787-4-knaerzche@gmail.com>
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

Add compatible for RK3128's S/PDIF.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 4f51b2fa82db..c3c989ef2a2c 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -26,6 +26,7 @@ properties:
       - const: rockchip,rk3568-spdif
       - items:
           - enum:
+              - rockchip,rk3128-spdif
               - rockchip,rk3188-spdif
               - rockchip,rk3288-spdif
               - rockchip,rk3308-spdif
-- 
2.42.0

