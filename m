Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26FC9091F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 03:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CC910E893;
	Fri, 28 Nov 2025 02:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="BjntW1/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B6610E893
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764295587;
 bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
 h=From:To:Subject:Date:Message-Id;
 b=BjntW1/dPs0QuYwjDsEpHJKbnnU3XQT5pExWDAMeQsG0+j+n3Nf1vpUMLCdzN8gJs
 iPoep6jzSrsW4SskOmgmEgr3JkPLuU99t6TP2L1ypHdUpwztOnu5U6mK9gylvA8MJ6
 AqCb3wYVV44+kJtM5dn0Uv54Ix9nMpGux7jMH/5M=
X-QQ-mid: esmtpsz21t1764295500te85580f9
X-QQ-Originating-IP: mJI2PEDtqc428+UDr15mULFM3tVFMG2XEZtF0eDz1FM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 28 Nov 2025 10:04:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17121756573935767410
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
Subject: [PATCH v11 10/11] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Fri, 28 Nov 2025 10:04:04 +0800
Message-Id: <20251128020405.90-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MPAlP4yRn0xg5Ydww/1Q8zcChfoH9CA+8ZPcQ3p9hXyl1YV4Y5kU3EQG
 PwJAZT6oflnuVE7lb5GXmcnpPWJXlBP3jxr9kZ6TnmoRLubykrEfoUcmOxOchoRWIMXVPgh
 ufRhECkTbuGS5UVC5T+mSD7YLY0P8RqjtqMyMkLvOIuD5Gng4DjpGw6y5AFgtkx6hY70iU/
 fs0gMTLhk9FlWSCBuNnAw3NKLBZRP/WzZUOneqrV1/Ec/gEsamUOqcf1CULyHn2ROXnU6nG
 Izkxxh5kbYw1zdbzoGf38NSV5/QQ+HpvGXfZ99h1VRsH9KSIraPSIVhsi/iqut5eKnu0VMi
 +rsVn/g1HVvfdnUxSIzxMbMckrlPsvYeyWwxeU62LREjeeelOsDVZImxBT3QA5UIQdQEFEM
 /PKCMSXoqvWoC9NxOvjPR3cJnWgr222IKE5Yp5VEq7sWisi8g6VcioNGSDaU/angX+V9WDh
 LzFS30tebTV/O67NJDt7/W0tKvQvNPdom1v+m9Jp1SNaOHvE5qOc6AWb+zp7bUiJ0rOmgEy
 T3QI9Wi1obMXLEDete7iFX9mFOAjop7pBnVTdbsM6ywwTgmDtlA7u877FhuCb8aylowWFW4
 vtZSGqVnuQVd5duEM4IoEGb2dioaNysQEb/0zwRS+PVzbVvQ5B/OHV/xhmhICLJTsWzwSkK
 0PHh6a4hJ1JO34wjMZn65p/aUb72fDU5skMQfDcTr4e/D19C2Y1ey4CFEjFEHxAnHAb9Jm1
 SzybTPsC69vxuli6VCKdeHkQioeGC7oK0BXcl22R3gxhJlLcWC5Yr/nevJyM7iJ0Hvf1/2w
 UXwwa8gOm77MkW/IAji405hPtJ+MoFZdnj//mWtijPq8SizvkDD6sckPDOCvXlRFewCWz45
 eF8oFz49wawfdRCsl676+bhVnflC+jPhycsjHV5JE3VSFLfDwsUVXCTTFn0R/NrPjZFPwl1
 quszMhtZLeFSNJCuhw0urYGPM8aK9ZcKmhE5JtXv1lSwoCsgGqLCnzb9AdweowoDWJcHSif
 33YMl9thQFtTPRXY1z
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

