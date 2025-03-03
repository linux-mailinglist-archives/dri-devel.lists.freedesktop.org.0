Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B632DA4B6DE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 04:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64CF10E065;
	Mon,  3 Mar 2025 03:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CA7EffsL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6581B10E34A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 03:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=x5wpq
 KJUmSg4bQV96jwM4c9cPSXvq7N01GUYeXUKlfk=; b=CA7EffsLWpedAONWrpiKw
 EGFJh76138yfLmZ3tK1S4h7TKKMsE6zWfHm/znJ5gFtpUYZKuc9R5GUdm5RzivDz
 MbLgduQXrf33Abzsuwc1UHGEMqJAvBtq+gtHSlt6AQydtxt2H/LHUiBNkZWJ9IzQ
 QPADEAYo4KweVp1pWWGjKo=
Received: from ProDesk.. (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgC3Oc2lJcVnaJliJg--.43523S7;
 Mon, 03 Mar 2025 11:44:48 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v16 5/7] dt-bindings: display: vop2: Add missing rockchip,
 grf property for rk3566/8
Date: Mon,  3 Mar 2025 11:44:19 +0800
Message-ID: <20250303034436.192400-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303034436.192400-1-andyshrk@163.com>
References: <20250303034436.192400-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgC3Oc2lJcVnaJliJg--.43523S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4fZw43KFWxury3JF43KFg_yoW8Gr43pa
 93CFWDWay0gr12qw1DtFn5Cr4v9F97Ca1UJFs3G3WIywnIgFn8Ka4agrn8XF4UGF4xZFWf
 ua1Ygry5trs2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jz0PfUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gMFXmfFIit2JAAAsz
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

The clock polarity of RGB signal output is controlled by GRF, this
property is already being used in the current device tree, but
forgot to describe it as a required property in the binding file.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v13)

Changes in v13:
- typo fix
- Explain the function of this property.

Changes in v12:
- Split from patch 10/13

 .../devicetree/bindings/display/rockchip/rockchip-vop2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index a5771edd83b5..083eadcf0588 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -146,6 +146,9 @@ allOf:
         rockchip,vop-grf: false
         rockchip,pmu: false
 
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -200,6 +203,7 @@ examples:
                               "dclk_vp1",
                               "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
+                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
                     #address-cells = <1>;
-- 
2.34.1

