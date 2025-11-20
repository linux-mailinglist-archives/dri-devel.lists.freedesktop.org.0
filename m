Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E1C71D30
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9E410E6D0;
	Thu, 20 Nov 2025 02:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="VU9kbrHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8F310E6D0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1763605511;
 bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
 h=From:To:Subject:Date:Message-Id;
 b=VU9kbrHXhzZAxkouhsjAqUccvQznKiVnHK0jZTSQuwyhp9sUunEhpwqLI0lBMCzn6
 Pd125BRmVFAJQqUZ/1dc8gxyyXA/skEv0a6EWYhmR+j9G1DCMiSpKXYT5VeAWFbmVK
 0FxBzIGHxnPu3AFM0uDDet3wfT64ynf7VgFp6YFs=
X-QQ-mid: zesmtpsz5t1763605475t5758b803
X-QQ-Originating-IP: pDz7EWZhJzQQujm3af9e2JLj4n12gmSAhoVFGhYNXPk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 20 Nov 2025 10:24:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15460230959253220818
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v10 10/11] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Thu, 20 Nov 2025 10:23:42 +0800
Message-Id: <20251120022343.250-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MVbvI5amSZ2YjBsber5S6w8jHcZ3/IlNnwnZbx/OYeKH5DE1NqWv5ki/
 8DyqQkcCf/YohZXXEcy1ltHUJdvlGx8irD0tjfaD+AfOofcYGEp5U3tafYqp8bnXj0Jp9yR
 rUh9n1mRsBCZUaCV//cUGHXpXzOdF5KU4zKsaZcZIK8canA8hmoT0g6fEeWqVw/rAnjy25Z
 ME18BrAU2GXEYyG2ARtU32o3B6M9H23utbxR4AvXg9NCtCO1unRhTr6YXF6ZgsqfBKFXv9K
 zX5pHSTbI137xPPWKfQcdml1MQQfQiomK7pYN4nGBiOc3wIlywOeqJs0RbYib42j91UeD5f
 w2CxS6b9lqXQ4bMVM2TsnpAeBwb5k2yIzhm7x8RyEQr4to/8+7ri8E6p80eS6aA6o2+D1eD
 jMWOcHq1DIe2AfaaDx9affYqicA4cYyDNtGx/3Ywbzq/YC8C1EKTtf4ohghNSwRwEScVuvk
 wNhd53c/lM1JwTrjRK+ODIfRDjJhu8ROEnsdfsl9x4WfHhh2k8EQGG5axi119xCtAAw9xC1
 shjH6x3y+iDU6LWOyBrNXf3S4ZgBqvWzlnJ7xW2bP1fAslC1BCrgtgBsyODP0xrGD3ifmyX
 C9qBLbpG2nkITl9ec6nnwi6R+69bnVTDkLdxhBzAs8AhWctcNIkTMqG4cq0Iq5K10ZrNM7x
 dxYpJyyxS1Lid/G0tEai2TpFmQHHij7pwAfnU8nDODVD83NuqlX5psitJH1Nz/Pwc2qyu97
 oEmAv+xuIlV8xzpTTTFKPlGdGudB21mGe8pasAx6jJNdTzLOL7WFndaTT2hw8UWyovDa23E
 KD6KV8b3NGIsWtQaO+vFR9pC/LbtCa3tS8PXZ5BQ4lyV3tvoXIqXdt7QC6kYV5n4223W/LW
 3sJencajobmEsL6uTyTk1gl93vXlHe7RfjtggQuSFsy6kHsbc4gpyfQIYNoJ1T7mp1tYtv3
 Dw1EzNNoUyKHg+3vLIdigEqcObTW+A8RmsKprA+VwL3HnzMrshUow2OO2OUpUTM05wteOXM
 jZuNjW7NaidIk0mPQT
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

(no changes since v5)

Changes in v4:
- Remove unnecessary #address/#size-cells

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..93b42820998f 100644
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
2.51.1

