Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B1B09B58
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC07B10E8BB;
	Fri, 18 Jul 2025 06:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="bPalwIRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9203210E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1752820008;
 bh=cVsfyWOIHeXBsAv/pI+LuirkOLN75phRnl2QMAl6n60=;
 h=From:To:Subject:Date:Message-Id;
 b=bPalwIREVrxRNGjlNfYXW18k6P+jDgQ4MZ4kFjbsbx2kuPjXGo+epl3zdKEL/U/mw
 1U89FUnJ7YEQ/jzCCE5p/iNcTweuRUh9qZCfsoE89sseqbSNNO4wfz9FDH6AbSRY2A
 otVxzlicVZaRYh8jF+bNwFWjcSKZj94uNskQB/vQ=
X-QQ-mid: zesmtpgz7t1752820000tf3acf635
X-QQ-Originating-IP: 3Esvg81Z8Km/8FLlclkdOlva9JVeBii6w+oXvk+xVbQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 18 Jul 2025 14:26:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15425296164838630341
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/5] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Fri, 18 Jul 2025 14:26:18 +0800
Message-Id: <20250718062619.99-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718062619.99-1-kernel@airkyi.com>
References: <20250718062619.99-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NzOHSugmTg7XLu9UWWkvov13lQqOYXEiQ0lH8b9sT6W2U/rGBDogo0eP
 vo2EbGiOK7BMFdIvWWFC7OjiVAVGTJD3G7NEZWHjw2sS2s3nwC1xy8suQJx9nY0k44Rr2RV
 /akLNhrFhSyXV0F4AetccpAqRccFOLPLQE8NUTWZbbjx3dEaRc8JtV6ZVmeXkwhWBV+GYwa
 jvq7Sz+X2z/E0Ni855li4WqbAvw2VXTATuTJ6E7S7M5+9TjV8jAtDGWgvdIHOgPqsactm60
 HdzYB/wNZpNO+GHWq17RDEB3rfGlVVPfNJkKb9Lt9RaWdRQeZ6+KgwEJpu5Fxo2C/UMTRYY
 at0lXrnhqV1f29c0ZIE96bX45+8XJR7u3DsLTWKiE+mUyGJvQy+q2ZQoL5w2LMYTPuM8Ju7
 V6G+rdmHGSt8JqJgXyKGg3PfwjDmjNk8Z1OkbiZJJ6uwzyqi1VB+2aBVfh71fJX1E5tE2+o
 MVoy4Dpu01Pia0dBJJftQuGvtlt72qvLlXOM1Qs41qB7GfGL2VbS+glYUbd1JE26sTxfAAf
 /AU0Xod//t/h9nnhE8MYzqZ4Qqv9qPpIULvmxl5/AH2Iu9KNuG6c3OYsLJYfMf8e081H7X8
 Fk2SL3Exbx7VzhF0qEWJI7o9d9TH4vIpbx8yRl6+xE1v+51IPou8KHsWLsXsCO8qvSjdaWP
 6PQwNStmSHcigLWyOylH/hJzdqUc+ntfTToZZ8AZyCn0itEzQtvKH8tkTbErLhj7QjUxWmE
 Eqbs5ez3XHNM44WQxZiM6Vs8NWUFzf4DY8GHnz60rhcXuawWbvnOUIUfa+7LtcxO3bZZgxe
 FRbN6EY/m2OlM7tDgMWQUCCuPIbok6lU+cr2OFKJ1Wa8uAFnD7wckK1CIJkNQpN4NvKeMXJ
 +rmRa2sFdRuy6vlyADQQyGaK9aZHSah4Y25Nnoa31zLxOeOmHIf7IXDjPtX+X62M+gudyfi
 Bh0NOo1AcmqwSH/BsT9I4JPHNPQdt6LjJq61Fqy0aL67vjC/KyTPMvjqJO6/iUTpbKgo=
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

