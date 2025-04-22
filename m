Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63767A95EDB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DF410E50B;
	Tue, 22 Apr 2025 07:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="cy05G8sW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6EF3C10E507
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=SNu0F
 4yGXjEea7fLM5tg1tfl9TwC9mxjxgn2oB/nJL4=; b=cy05G8sWi7XSUH8ptoiyZ
 2KmiAYxmn2B39ZaZDFI1DeJIY6uUHj/MM83SRC1CuX2cf0cboEqENBXp3FQCbdsU
 lQOLLHf3fZUD9yWkdxiiNKVXA2reU/EAO63jzn5OoNj9gH7AZcuIKxi3A6bE9hT+
 5T6cZgMeDjmst9baHtVqG0=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wCHACaZPwdowMxzBg--.7474S3; 
 Tue, 22 Apr 2025 15:05:03 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 1/7] dt-bindings: display: rockchip,
 inno-hdmi: Fix Document of RK3036 compatible
Date: Tue, 22 Apr 2025 15:04:40 +0800
Message-ID: <20250422070455.432666-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHACaZPwdowMxzBg--.7474S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45GrW5ur4xJFyrWF45Wrg_yoW8Ar4Dpa
 93C3WkXr1xur1UX34Dtr18CrWkta4kAa1YkFy2q3W8Gr1j9a1DKa1agr4DZay3ArsrAa9F
 vFsFgry8A34SvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0388UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBE3XmgHPY1Z9wAAsZ
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

From: Andy Yan <andy.yan@rock-chips.com>

The RK3036 HDMI DDC bus requires it's PHY's reference clock to be enabled
first before normal DDC communication can be carried out.

Therefore, both RK3036 and RK3128 HDMI require two identical clocks.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---

(no changes since v1)

 .../bindings/display/rockchip/rockchip,inno-hdmi.yaml | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 5b87b0f1963e1..9d1e7f894ea54 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -23,13 +23,11 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
     items:
       - description: The HDMI controller main clock
       - description: The HDMI PHY reference clock
 
   clock-names:
-    minItems: 1
     items:
       - const: pclk
       - const: ref
@@ -87,11 +85,6 @@ allOf:
             const: rockchip,rk3128-inno-hdmi
 
     then:
-      properties:
-        clocks:
-          minItems: 2
-        clock-names:
-          minItems: 2
       required:
         - power-domains
 
@@ -106,8 +99,8 @@ examples:
       compatible = "rockchip,rk3036-inno-hdmi";
       reg = <0x20034000 0x4000>;
       interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-      clocks = <&cru  PCLK_HDMI>;
-      clock-names = "pclk";
+      clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
+      clock-names = "pclk", "ref";
       pinctrl-names = "default";
       pinctrl-0 = <&hdmi_ctl>;
       #sound-dai-cells = <0>;
-- 
2.43.0

