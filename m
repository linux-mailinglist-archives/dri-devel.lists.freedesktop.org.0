Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171259F28CE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 04:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873DB10E507;
	Mon, 16 Dec 2024 03:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="hYMi7ukz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m118216.qiye.163.com (mail-m118216.qiye.163.com
 [115.236.118.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63CA10E120
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 03:28:01 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 5cf798f4;
 Mon, 16 Dec 2024 11:12:52 +0800 (GMT+08:00)
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
Subject: [PATCH v2 02/11] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
Date: Mon, 16 Dec 2024 11:12:16 +0800
Message-Id: <20241216031225.3746-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216031225.3746-1-damon.ding@rock-chips.com>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxKSFZNSB4dSkhNTkJMT05WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93cd7451d403a3kunm5cf798f4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ojo6PTo5MzIJPiFDSU5DQgsU
 MEgaCxpVSlVKTEhPSEpDTExPT0pJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKS0JNNwY+
DKIM-Signature: a=rsa-sha256;
 b=hYMi7ukzIZWFpyFu6Iwm6hPJ6LejSbJ97UgKRHvlaNjJhKerhKinToMt0vQECV45v9SQrm43CKeVd4UPROw6mtRBG6yM/nOCICLSXJCUGvv+q1Qv1Ajx19Olqo44tXN/qZ7L3BeMkXSXKwyTyz2askbPZrQjaYDah1OS4TGuRT8=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=xAQCDy2qVtRDAgBc2wWc3aI8DLegvBvIK3ABW6tP2ng=;
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

Compared with RK3288/RK3399, the HBR2 link rate support is the main
improvement of RK3588 eDP TX controller, and there are also two
independent eDP display interfaces on RK3588 Soc.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Add the main defferences of the RK3588 eDP and the previous versions
  in commit message
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index 60dedf9b2be7..b82b693532e1 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - rockchip,rk3288-dp
       - rockchip,rk3399-edp
+      - rockchip,rk3588-edp
 
   clocks:
     minItems: 2
-- 
2.34.1

