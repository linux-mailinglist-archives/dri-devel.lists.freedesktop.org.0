Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F40AB48D3
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 03:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0BE10E4C1;
	Tue, 13 May 2025 01:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="V1cT9NaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Tue, 13 May 2025 01:28:46 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD64210E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 01:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1747099718;
 bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=;
 h=From:To:Subject:Date:Message-Id;
 b=V1cT9NaZ6+t97WLACDibYGkiefAmpAOmuqp0sRYOqU62LmfJbvAqVGPGc6DC2l7hV
 lTbIsCIv5xmfjkkVHgYmzvvReNjqLcSibIeG5NqZ+4Kq/rNRqSCBhaM+EuegE1z4GL
 fCk+ILWeh49HPrVYcS2s59f5XN6kqrxJJDFnr0mY=
X-QQ-mid: zesmtpgz8t1747099216t17baa3c6
X-QQ-Originating-IP: ogzTGvVk3wO9+hitY6L5I6pPS+CPHubTZFIWMmaa6Gw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 13 May 2025 09:20:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8353147344841585000
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: rockchip: Improve coding style for rk3399
 cdn_dp
Date: Tue, 13 May 2025 09:19:03 +0800
Message-Id: <20250513011904.102-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513011904.102-1-kernel@airkyi.com>
References: <20250513011904.102-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NDxI9psdf3YV3/yzX3Wcj/arsR2ZY52Bhqlczl8MgdvIV1aKmgRGnUBr
 leuUv4GJj0A6dZsqqoWX5D4OOAWs3FVRV1kg15fcg14+QoryvGMJ3OfRs7Qb1WZbBuaS6fk
 8Sya9n1x3+pH+qhCobLaP/b2+NQxRnq7kQW5bVwZ8PvqOxx4FKyC1LHh6hCFUWwlhin+Ut3
 ceIl5DAhmcRgatj7mKLpXkc3OzOmwOqwEJ6nuVf4omLK5KJzVEfNuoHcO5XADL3s1TLLVTW
 J7cJ8Cp7K80AJPmao52wdaV9npgXg6DtPmtpLQo882JRFNfcWAJaMqgpoXdDLbxx8BwY9dB
 Mz1AwDn7FOviKooTtS9OTRO2Sk8GprHFx9QLkKYtR40xz1g2rKYcfG83yDHIWCueLhKHmLt
 LvoxhbhaZqANXm+jIFyo1lZHh6pma6pQXP9SKjcCZwS91fcxxdS4Tzzu9sCB3/4T4cPACcn
 qA0UEosuh/CnCsOPZ3V3scg663T5osnMzzS+f3jcWavofVbcbxzwyjfSqha7xZbpKzniWmT
 Owp83pRvp/RTeRLMVLWMn5B7u4OJuiQBx9GCzN7GLOEhfli9HkRXyAJjugnkah+60f6KpD3
 9yL7Ojiot45gc+pYA4l1CiZy7lv+gU4+JuXN3TFxYGAxogfCwB5w6ML0zOCjB5sFAP941Hp
 ppU0EXnapoYIWW5NpQGn2rb0vqp3hkbpdvL6kp6ins9m4ngx8zdzGWmQvsGHxBZvpPPaE+6
 5e75vURWC9kxX18RtbBQgvw0HVJktvfmIjL96tEdWiHgShpNx45d4w3EoR1GHg6Q0InmPlQ
 Fi+bsOMHBYb6d/m5XRXNAkqv9AW9notV9TTt4g5bVlaorbyJF1/ZriiHYU9yxYqD4AfIKD3
 UV45eoc+2TDFFppWWV0mqG+R1AH9pDyEzgN+Mqx1FcMgHz74mRGD9Qn1dz5eVK8lWuHpDJI
 NP8aU+JjzfRbALxg7G7K4uvgE
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 9d5f5b083e3c..e340b6df7445 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";

 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;

@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.49.0

