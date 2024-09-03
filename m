Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9744496A29D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E359F10E5D3;
	Tue,  3 Sep 2024 15:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l7nIu0SG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92A410E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725377014;
 bh=q91nNqe25vY4zdGQ0jID+lBhXgdVdrS3Q9cXE35aK60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7nIu0SGrEf082PTCfZQvaCTfjPQsInJgpF0p1HU07ZiiQuo/2ji3dW5bHsh+CBY9
 6ws0rxNpDx/+76fqaJlh+mKxR4T9PFEymL+dNmm/p6jIW8JEzpBtU+bEnWHGHfRR94
 8kr2Bw54zosa7KwTfsDIp/9wWWQbAVy600Zg6x4sZazN+pFD3eIuTY3yao96pR+xYw
 J+ZR46h8zQLvEPRlNvfl1cHk/LCLzBNXizkgfoB4eA1/D4Bnf2H3Irh7ztDsW1G2ft
 KP3RPbYgYWqLFDWeijz/h2P/1RvUbTebqkwrOYA52pz1snORt/3DvFWlKewACTg4wR
 j3gjfC97XSgNA==
Received: from bootstrap.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EF4FA17E10CD;
 Tue,  3 Sep 2024 17:23:29 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ondrej Jirman <megi@xff.cz>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/9] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Date: Tue,  3 Sep 2024 11:22:33 -0400
Message-ID: <20240903152308.13565-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903152308.13565-1-detlev.casanova@collabora.com>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just like RK356x and RK3588, RK3576 is compatible to the existing
rk3399 binding.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 82b9d6682297..a9dae5b52f28 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -38,6 +38,7 @@ properties:
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
               - rockchip,rk3568-i2c
+              - rockchip,rk3576-i2c
               - rockchip,rk3588-i2c
               - rockchip,rv1126-i2c
           - const: rockchip,rk3399-i2c
-- 
2.46.0

