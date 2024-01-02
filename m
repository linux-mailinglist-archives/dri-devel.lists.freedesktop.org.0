Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA2821F53
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 17:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6B610E1E6;
	Tue,  2 Jan 2024 16:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id B093D10E1E6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1704212154; bh=KmSXwDj5qN37eap9r1SUCgCi6INjfFRFo5korwd9eb4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X11QH2ke6EFKLQ/jPTKsaSmhBLCuvetlWCJjDApdqK/LBJwKy9W5YyjKkyQ8HmQdp
 T6IAMHqgssxmPvA7jLb8Y+HRKtquaJ6q7L16gOsFV22MzC+kiIgfwTaTHueHGdOz5l
 FDLyKsrffCVYrdQNNHc36EXu78GeM6zoB77uhDPAgnmVGLwiCkssf3t+wnlXFvmXl8
 GkgWtA+EMfYCrJh/+se8qTXPctj1REmvQqYzMCSi1SaGxYF+2S6tTPb/59N+isRTni
 dD+GqKkXsqEo4Ohjlqq9PsaFRO8ZXMx6pqabAYAX5wP7NpPcNReR0zi83cgTaEd58s
 C/VAMVmigtRIg==
Received: from arthur.fritz.box (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 73A26377C55;
 Tue,  2 Jan 2024 17:15:53 +0100 (CET)
From: Manuel Traut <manut@mecka.net>
Date: Tue, 02 Jan 2024 17:15:46 +0100
Subject: [PATCH v3 3/4] dt-bindings: arm64: rockchip: Add Pine64 PineTab2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-pinetab2-v3-3-cb1aa69f8c30@mecka.net>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
In-Reply-To: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
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
index 5f7c6c4aad8f..96d54b0587ab 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -635,6 +635,14 @@ properties:
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

