Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74381CD9F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E3D10E83B;
	Fri, 22 Dec 2023 17:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (unknown [IPv6:2a01:4f8:1c1c:934f::1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 309EC10E787
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1703243147; bh=BOl5n/LD2BBcBkSdOXNe2omY7nWrdquIwWyNKjcl3/o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DTaLgZ6qP86N7YKevWdWipg/yVZipTobTmGgmJCS2lxA+0Nro7QP9+oJB+XbxhYSk
 faQtPZVP3ecpRDl7BrGG6A80Ze22RmUZrl/DLvUr7yV5bfh2AkFP1KEi1UOxgrLFWG
 kkWpDBZeGHVgw3Rp6tsrOQipFWTI7uOT2d2/QNTvTc2aTn5xsE7tlA2IZ5mexvr2PZ
 FX1aFPKR05t47ugqMc7+vOa5Yolv3GDxcOpp8Xn8sxNXVBp58FsVV9J8yXQT8bj/2J
 oZOZIrv5cn9s3jO43jPpMKRVMZFawRfESb4DX0no8GEUWOyKrr/Mnuv7rJs/m1gMly
 9+F0cwf1qfQDg==
Received: from arthur.fritz.box (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 7A74E370D44;
 Fri, 22 Dec 2023 12:05:46 +0100 (CET)
From: Manuel Traut <manut@mecka.net>
Date: Fri, 22 Dec 2023 12:05:46 +0100
Subject: [PATCH 6/6] dt-bindings: display: rockchip: dw-hdmi: Add missing
 sound-dai-cells property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231222-pinetab2-v1-6-e148a7f61bd1@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
In-Reply-To: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
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
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>
X-Mailer: b4 0.12.4
X-Mailman-Approved-At: Fri, 22 Dec 2023 17:32:28 +0000
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
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sound-dai-cells property is used, e.g. in rk356x.dtsi

Signed-off-by: Manuel Traut <manut@mecka.net>
---
 .../devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 7e59dee15a5f..43250255fb6f 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -94,6 +94,9 @@ properties:
       - const: default
       - const: unwedge
 
+  '#sound-dai-cells':
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -145,6 +148,7 @@ examples:
         interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
         clock-names = "iahb", "isfr";
+        #sound-dai-cells = <0>;
 
         ports {
             port {

-- 
2.43.0

