Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904B09FC8F2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 07:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EC010E751;
	Thu, 26 Dec 2024 06:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="JFIJFFgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155105.qiye.163.com (mail-m155105.qiye.163.com
 [101.71.155.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3606A10E751
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 06:33:49 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6dc5117a;
 Thu, 26 Dec 2024 14:33:45 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 10/17] dt-bindings: display: rockchip: analogix-dp: Add
 support to get panel from the DP AUX bus
Date: Thu, 26 Dec 2024 14:33:06 +0800
Message-Id: <20241226063313.3267515-11-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpCT1ZITx9NS04ZT08YSxlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9401abd44e03a3kunm6dc5117a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NlE6Qyo5MTISTUxPCTkpKwJP
 TAoKCi1VSlVKTEhOSkJPQ0lMTElJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS0hINwY+
DKIM-Signature: a=rsa-sha256;
 b=JFIJFFgVPs6Cx1B22KzFWGq4xm5Gl3WjI+KFpjywZkCsTlnVnQaNJcISBQwA/NkQMw2a65ICbow/Se/vU7xqSId1vruvi29/mqhHMS9smz4B6ooaZ5Vt2u0w/4tn2AhlR2cGnxrFl0LAXo2LOJF6QyfgvaNmJboJsnr8Bi1wDpM=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=FUoPGB2ofRkGg6bFBe+sKON64GQupCz5j3eQ7S5zDIs=;
 h=date:mime-version:subject:message-id:from;
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

According to Documentation/devicetree/bindings/display/dp-aux-bus.yaml,
it is a good way to get panel through the DP AUX bus.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Changes in v4:
- Move the dt-bindings commit before related driver commits
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 200703905b29..e0434cc6e43a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -46,6 +46,9 @@ properties:
     description:
       This SoC makes use of GRF regs.
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
 required:
   - compatible
   - clocks
-- 
2.34.1

