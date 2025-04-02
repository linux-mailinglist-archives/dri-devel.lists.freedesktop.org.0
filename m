Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF83A78E6F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FE510E772;
	Wed,  2 Apr 2025 12:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jz30fZ3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id B977610E770
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=jvJrC
 JlXKu0zyBhFzDwypCRXXkJB5PHy1URiAxDBM28=; b=jz30fZ3v9aBAfxkd5mqMl
 jkHWm5hKKsL+mYZErNFNeJjOJ6oSukaEG2MpzVhhWIKpfAKDC/Cudfjd1bAKvxZn
 PdfRkYOd93NPhfUyzRIWUKyJYHb+IemVxCndB7vnGWlTII2TNkZX0HsStTg/3MA9
 TB+PKwuMm3mk2Uc1xOPz+w=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S4;
 Wed, 02 Apr 2025 20:31:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 2/7] dt-bindings: display: rockchip,
 inno-hdmi: Document GRF for RK3036 HDMI
Date: Wed,  2 Apr 2025 20:31:36 +0800
Message-ID: <20250402123150.238234-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402123150.238234-1-andyshrk@163.com>
References: <20250402123150.238234-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDnd405Lu1nJwOJBA--.36321S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxWw47XF1UAFyxtFyrZwb_yoW8Gw15pa
 sxC3srWFyxGFy7X34ktr1kCrWYgF97Aa15GFW2qr17tr12gan5Ka1agwn8ZF4UAFs7ZFyS
 9ay7GFy5Aw1Ivr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrjjgUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkA0jXmftKOaFiAABso
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

HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
is missing when it first landing upstream.

Document that it is mandatory for RK3036 HDMI.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v2)

Changes in v2:
- First included in v2

 .../bindings/display/rockchip/rockchip,inno-hdmi.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 9d1e7f894ea54..290376bec079a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -56,6 +56,12 @@ properties:
       - port@0
       - port@1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to GRF used for control the polarity of hsync/vsync of rk3036
+      HDMI.
+
 required:
   - compatible
   - reg
@@ -75,6 +81,8 @@ allOf:
             const: rockchip,rk3036-inno-hdmi
 
     then:
+      required:
+        - rockchip,grf
       properties:
         power-domains: false
 
@@ -103,6 +111,7 @@ examples:
       clock-names = "pclk", "ref";
       pinctrl-names = "default";
       pinctrl-0 = <&hdmi_ctl>;
+      rockchip,grf = <&grf>;
       #sound-dai-cells = <0>;
 
       ports {
-- 
2.43.0

