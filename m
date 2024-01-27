Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DAB83EC6A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 10:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EB811233A;
	Sat, 27 Jan 2024 09:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3336111233A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1706348925; bh=b8ZKwzuKSR+B8npDXbJdxQemMwTR+ciHyPfl/3VRGTg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RYFnCmvL6bDyP9Agh9Bv7DpCTWPQjzWgT12uEJLwrSQsMkqBZC4Le1W03EsfBAgeY
 9tvpENJ9qaQb3GaDE4CgvZw0j1Jy5vmWUGQEh7v2hRZ0+rJnAQrwxiNgzzhkAVjx6k
 61fUc+Kdh2xkPVgqt7jxnvMJEmWtV+Y/0Gz1V/6gClN6sSfNYS9av8mRrWD18QFfNn
 GeZmKdJ/oHIlxNTa3VvinbIvTz/X+ntqW30hNan8X+F5Tq0AZBxxxBBDm6kR2ZVDGc
 AsMgqNXg/JtPUFfRnhspYVAPvUFMKQUaNbMVfd1DBWmEZpvHSkjTPHNsocJblmWQcY
 F3Lc5ZS05aOjA==
Received: from arthur.fritz.box (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 0C7E63BF7A9;
 Sat, 27 Jan 2024 10:48:45 +0100 (CET)
From: Manuel Traut <manut@mecka.net>
Date: Sat, 27 Jan 2024 10:48:44 +0100
Subject: [PATCH v4 3/4] dt-bindings: arm64: rockchip: Add Pine64 PineTab2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240127-pinetab2-v4-3-37aab1c39194@mecka.net>
References: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
In-Reply-To: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>, 
 Danct12 <danct12@riseup.net>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devicvetree binding documentation for Pine64 PineTab2
which uses the Rockchip RK3566 SoC.

Signed-off-by: Manuel Traut <manut@mecka.net>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5cf5cbef2cf5..1b9740e2f3a1 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -650,6 +650,14 @@ properties:
           - const: pine64,pinenote
           - const: rockchip,rk3566
 
+      - description: Pine64 PineTab2
+        items:
+          - enum:
+              - pine64,pinetab2-v0.1
+              - pine64,pinetab2-v2.0
+          - const: pine64,pinetab2
+          - const: rockchip,rk3566
+
       - description: Pine64 PinePhonePro
         items:
           - const: pine64,pinephone-pro

-- 
2.43.0

