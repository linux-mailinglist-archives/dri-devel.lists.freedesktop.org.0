Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA189962BE8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9831910E587;
	Wed, 28 Aug 2024 15:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QlfvOkPV";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="UjWt2XV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 402 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2024 15:17:30 UTC
Received: from a7-32.smtp-out.eu-west-1.amazonses.com
 (a7-32.smtp-out.eu-west-1.amazonses.com [54.240.7.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3A110E585
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857846;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=IyIiAOZwHngz0sn8kGrxdHkaHK6p3xqpx6CKa/ulcSM=;
 b=QlfvOkPVy0KuXiYeHlBm28+ywYF5rQbLoYUfdk2JIHuSKgaUslSdN25eBP+1L+FK
 9ECp5rZvyrOHOEtK4PKnM98y3hT7yiiftkp5Nt/bGCdhxgwYA+3LRhvCJb5H6FaLugG
 6Ur5GsaFKiulMAInfYMyeWTTtWaagEf63e8VDaj5sA+xulBkgtJhVyBG+R+RYlU4kPZ
 rMoL4vfTBa4LqnHk0dR1ZMEUdG/8XfLOjxWMlOy8gqdX9q1hMHYO4f9F+gh5aLgFAjU
 Ls9raPsPnaN4TDKXa8FEzaYj+Agc4glxtpQkSg7KPSyXTsdebY7us/qC4FgVqp18duI
 0UZBj6V/gg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857846;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=IyIiAOZwHngz0sn8kGrxdHkaHK6p3xqpx6CKa/ulcSM=;
 b=UjWt2XV2jTy21TDQrOiog0+5MIj64XuGW0PDfuGFHrmAuEnVF0KpgM51Q5kwsIln
 Mk+brKUf8XqkR4tHQbJ3m3J4DEqPKZLCjIAJSADqo6DO8caruH1fYqxFNaUDvlpgcic
 MazD18RUezRAB8R8ZrpgMXqaKrj6EQdFjdnIugQM=
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
 Chukun Pan <amadeus@jmu.edu.cn>, 
 Muhammed Efe Cetin <efectn@protonmail.com>, 
 Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, 
 Dragan Simic <dsimic@manjaro.org>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ondrej Jirman <megi@xff.cz>, Jimmy Hon <honyuenkwun@gmail.com>, 
 Elon Zhang <zhangzj@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 02/11] dt-bindings: arm: rockchip: Add rk3576 compatible
 string to pmu.yaml
Date: Wed, 28 Aug 2024 15:10:46 +0000
Message-ID: <01020191998a0a28-80397901-7846-43c8-8593-7521bffcdcf6-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828151028.41255-1-detlev.casanova@collabora.com>
References: <20240828151028.41255-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.28-54.240.7.32
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

Add the compatible for the pmu mfd on rk3576.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index b79c81cd9f0e..932f981265cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -26,6 +26,7 @@ select:
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
           - rockchip,rk3568-pmu
+          - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
           - rockchip,rv1126-pmu
 
@@ -43,6 +44,7 @@ properties:
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
           - rockchip,rk3568-pmu
+          - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
           - rockchip,rv1126-pmu
       - const: syscon
-- 
2.46.0

