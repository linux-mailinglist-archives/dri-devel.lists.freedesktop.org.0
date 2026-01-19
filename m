Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02956D39FE4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECA810E376;
	Mon, 19 Jan 2026 07:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="m0+VERdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-usa2.onexmail.com (smtp-usa2.onexmail.com [35.173.142.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC4A10E376
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1768807941;
 bh=6RKYrl9uKKYeoPLwxT7m43ODsBqPn7Ulx0XyJQsA0lM=;
 h=From:To:Subject:Date:Message-Id;
 b=m0+VERdEZM6EZ4VXwKxHdkutXvYXh0i86jixhGzmeNofFppwD87p1h23h+92MhTu7
 wmANYB4hSWh5PqdIBlvfl2kQ/jbcCKOObLU2dqHQzgW2eDnE1vO2accU0zQlb1O9+f
 tLggGOtOLAtVPmk3/5BvnrL2TUhzaRhZpTJs9+lQ=
X-QQ-mid: esmtpsz17t1768807939t4e3bec3b
X-QQ-Originating-IP: A7VIZcKkSbUgehWQYkOQDZdSzfyBv0nlR5sBVFW6EVM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 19 Jan 2026 15:32:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6769309788427873216
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
Subject: [PATCH v14 8/9] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Mon, 19 Jan 2026 15:30:59 +0800
Message-Id: <20260119073100.143-9-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N9DIJtFs/avn469pEPR1EF5Tkm/GPRY6gFxvvNcyPU1aPjp8XHRL2pw6
 PKY0b47EmpcR9mYUyVsekGpzLKLmZzn/UD2hh/AehmC0gU0Qx6F1FnonjzG+57LO/J1wl09
 0Uw4/QzAYow54sQcPKg2ecw+qsbSCrdtH/F+axpZemO4fzLH7UuXEEbuwYRNZFvj0G2ZETn
 kIiX1HyHRKdSNzAHDBiNYtn2PIZP12+QKLCGOVxArYe7o1V+v4+SmK2CR/RyAWUFFI97vCu
 TFE1Yi2t4d/qiRb/04DYYlwShEK6TcneHhsmug7eUds3G7QyHFU1CuYWizWx9taRn8+h9ud
 Fq3tgAn983eOTPbUFuvnj5DygKcGYTiEz6d+YSBNzMCR73PQbQZFeNoVu4Ti8GW8Lp67Nfp
 Uk4CjYUQ183luSUVSxxtIbntQFsFGi3n6ZS97HaVQ6RCOF/8RWFk4+psgE0j8RvOiGf2t6F
 HDAJdXy+AJUztjZfo2jbRHdPGN4N8Ds2/fN1v/1maJ7DdqzEP7PG+T8zJDRo6i/d1o2Aw9h
 ZCnebSMJI4E9LhFPijPQHf2dSwu9g5cxR977B0ZmK00bMCfs6Gv1WOehZXfg+V3451VRxhF
 9sZHpDspovHfNvT2Tyb9fQOESYG5eJmNSQRcy1w8IUq5mheflI8m2gRsYCdaB2J/5fo+YL+
 X/JBNWg/pGUwAskNtqyr9UmPLaKh6cs/HfoObdj3c4PNuP2XSo/vm9b9aRsOJ1yduJXhtcS
 LllKEpkJdakBnr+oT6uDPggm3z9xzZVzzGI1mqZdYEKAg68p+PbImi3pPAmTpRJbsUBxz13
 ylsD1xt+dAXsLAyK4BkK7EE72X+xmK875gxhMCpEj8k1zyqdT7jrgz7s1d9gNzd8nc5/1Th
 LCYvi5Ysoft42aaU1+oBhOwPyvMS6c3iYlyQGLe/P66IkoC7yHvSEfzMLdl3S1/pSLuC8dv
 EguWeN08Wgn4yLSQox1zbvG90UbS+OgVYxTfO+8cWBGD9hYqyweVcFNrzLekfYB5ihYCaVt
 1HFE60IOWiLd76fJW3b96CvboijzL+cSMXjFvdoQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
---

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

