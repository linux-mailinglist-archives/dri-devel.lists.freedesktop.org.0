Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47DB14AA3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 11:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40D10E5F7;
	Tue, 29 Jul 2025 09:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="YU4cE3td";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFC310E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1753779664;
 bh=cVsfyWOIHeXBsAv/pI+LuirkOLN75phRnl2QMAl6n60=;
 h=From:To:Subject:Date:Message-Id;
 b=YU4cE3tdvRwJweP0huY1LyxNEsq79/QZk5dW/nW1vReeOk5rGz7IcOuMz31rzM9Q2
 SCWs3BBaqn/LN/JyHNkOScw2Tk9HdDuavhT7sM5c90XaIojHguQyENktXU8h2mwjc2
 3DrLhRPsxWYkvYZBZp59GgR1PljbIvyr2IuJusmI=
X-QQ-mid: zesmtpgz1t1753779654t826cd32d
X-QQ-Originating-IP: jRSwjG6rFafhFW5ehktwFr25xj18ygtqPc25P+oepJE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 29 Jul 2025 17:00:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7649534104477773387
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/5] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Tue, 29 Jul 2025 17:00:31 +0800
Message-Id: <20250729090032.97-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250729090032.97-1-kernel@airkyi.com>
References: <20250729090032.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MZasx93lI99004yb0adgp4rjegQKICSDleX64XgHjNOZCLrmVgssmKWc
 FkCH8mtv7gUpxGuFRykKZgfFjE1t8YCKdLK+Y3HRx+O89/Se8FEe9/VG7ZUZMSRU+D2I+ga
 t4c1V3mW0zYLCiSisUzpf7DWmsLYm8cvbtsX0KBd/CQl9fJPViDvH0M2nxU0TV4+kVzW2Xp
 94dOPI9dAk9hlfug0CYXgd0tPgmEjw+d3ryrpw5YWcFiX3nTYsuA49eNBxurgdLpMGB0ok7
 AhoWpe/23or6t4dEBHSbkV4xytAW/+ToJfkajaqKJP/ViDM8c8vpwuDWsF6qj+zDLqaqBdX
 mafIB5hCdeA4TZCTxA41Hp54fXqRVF8dQmBapj0V/t40hd7q6elSaXwm5KJ3cGcx8I1UzDQ
 okYF2LO3lbjRtikVp6XlD6Y20yg4fYpf/d9k4KNmb4zjo/wH46CDCge1CE+fxp5HZg/imqD
 GbFnqe27sRLrqhFMYUKCYAhnxMK3+R0ylzaNC4K1yFhuPi3he8V2UodTtyMfkQA2MbPyAK8
 Q0xhzwNZwe9eeuTn8+TcskbpQjirFtWf/gLLx0UBwJKIwTbDTNUUhGpDZS/kz7qib/klnlL
 n1YA437FUxsCopBhBab0e6NqEo/0/P3hfmjMC8f14LzMwv4QHjP5+qGnjmcccUQJY4Gr9PN
 YYTZd9EqOp9nOi+A7Ev/HEMIKqGYNrvx8R41rB1Pv/ORKu1jE3m0/mzYWM2xmUyhe0pu2Cn
 JhLWLMn7/prYftxZHM0AdrQfwV4Dmp7hOnOgN+96f2H5ElF7cqaIgMGJzYDyL7MURJkmZJ8
 2owM710+ZFRRffE82JAbT9mm+SJul7uAriq+l/iQVevPXy1AijngIeLji1Bqxm/wCMlRord
 sSqB3goxUJT/JjqVKJufNKILR6O8TDS8nBm7VtZDAsp8B+aj6NSwQjGiPNzPn86yzRyow2S
 es4Cf9NMuj/2mJMWoRhm4OJH9Jag2R89ELgFi8gwWuHoEXn/I+u2Lubzlq1a1Q4BbtivoFW
 3vxHr9Ci/HgIkk2Llj
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 9d5f5b083e3c..edeb177bc433 100644
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
 
@@ -632,6 +636,12 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 	};
 
-- 
2.49.0

