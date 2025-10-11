Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB679BCEEFD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 05:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F069710E2C6;
	Sat, 11 Oct 2025 03:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="ULzbKR7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6640510E2C8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 03:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1760153587;
 bh=cDiOxEFqYuonRjIga1t9o2u02p12TN3hXALWFcjKD9c=;
 h=From:To:Subject:Date:Message-Id;
 b=ULzbKR7QcbMf0nqC2RApmSGAa83W4Fcpxw5GOgeoJGTcfRtYTvBjdZS1uDF9wL/yk
 zHm1l9mTjFd1maOSE8+iUxnqzAkuq7Gqr8ml4i8UJDA5WGijwKEzJZdjDtjVhaXId+
 8M+0wvuqeSj82wTJ7LjVRr5kM9HrZ4oUBpDcggCw=
X-QQ-mid: zesmtpgz4t1760153586t91072ef4
X-QQ-Originating-IP: aEg4UWYxB0z7r83n8X2tWwn2jWviUUfrqwKQvlQMsCk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 11 Oct 2025 11:33:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15608153798208442778
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 7/8] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Sat, 11 Oct 2025 11:32:32 +0800
Message-Id: <20251011033233.97-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011033233.97-1-kernel@airkyi.com>
References: <20251011033233.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NafziRg7Bx69LfuY1FvhTM8dyyKGJ539o8EgMEvAJa0Z3/n2Zdvt+ikM
 R95CWDMfgvcahPhDB3zpYrospcrZLysz1dU5Ay0Nlbn36FrEKQxw3AsSHuhDZSWUEVQhFRC
 a1maIL+tc2oKwucfHquYUFeJG1uJI7Q5qly5MOVQjmpnKV1QACPwG+rz18jEEXSFYSaYPa5
 1fUEb6c6qJz4UTvS2jTopFto4eHxEEcJqlQdVDKG/V2qMX+8YxE6bdV8BvO3Z7uKLQElaeF
 Xm9ijS7OiNw4C/drU9cxB4NMmw/0vkrUQvHXXvYvtfZwwJxbewU6XXrSerAHw5YAM/+GtwB
 G8NnBnv5uMt5E+JnloiEfDuSb3hzfNaM3sXxfOPxLRzIH5oP5YfX/LR6qs5NUyvtSiy9hdt
 9IAGXNCQLpYJa0adYFOQx3tov5bAm+PL7TmkdiJkk7gPXtpwwRr5Ye0M58y+h1Z6M77vCnO
 nyYIThiRkAACkYdoQytuURAFCwv7uwt70yQYeKrstyE6uhW/zQMf3S+14fuWVjWJyfQe7J6
 ygVHHd34SIwObLK67XOsLZ5WPHLPFE9lVQBeu4Qj2vT2wutAxA2pOKof1FQUgfNIHx+76Iv
 X5WW9Pz920x1s7ZP55F0Te16mylz99AYjrqfD94aI6TjZo2VOGFbyjYkep/PxZ25mxbSWpQ
 NNPd9UoIxTtBLuwORYoC9ls/NLi9zEyDZr7pN8iIFSyYwdrrk4Q6ttq12GzmM+9SmBeieFZ
 W4zjDbEAOPypAfDElI2HV737YkFQugl7jHyfYUYNodZ/DMlMA7N3eyYeM8Jo4lWKqplWz99
 B1QLJEt4wauZaC6ZngnxevqBSOuAhBKM7ac/iYGvZcg134X30dZeQYKeOj5pq0rj78MaeYo
 2URn27h/yH+U5TooHTcoDNbpnjMQ2kQtGIy1ntJoVcy8MmvcT0j98xpXgq3DeG0O4YSgErA
 6es4gj1VW2D9+iYR0OQ6z0I++RXAHoRwwkACagkxu1RrDSOs39x5ZqfCVLvMwRuR0ZLgqkQ
 7ZyBiAThcw01y5H3tMJhvYNGBWzqGKQj8JLl32y0l59HzrW9y1
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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
2.49.0

