Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42AC189EA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D48610E703;
	Wed, 29 Oct 2025 07:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="Sy8c4HFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395F810E703
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1761722134;
 bh=cDiOxEFqYuonRjIga1t9o2u02p12TN3hXALWFcjKD9c=;
 h=From:To:Subject:Date:Message-Id;
 b=Sy8c4HFWY5o434CVWL0VrQJSlxNoGws2p1QMXxoUelIpGbivpBwhf5/a5Jr8im875
 kH2jpeoYpUwuE1sAOL/MyOPUobEewdcbkErQWAOYH0hZB3tXE0E87CIhIPATZ1BdC7
 5GE/s47fIDAD22YVOi0FzSFonZM8v87ugQ0r0Vxs=
X-QQ-mid: zesmtpsz6t1761722132t2011f568
X-QQ-Originating-IP: 7NBRw7TbdpqiA0XMn9RW6Owy6xUxWMzzgSSAg2TdaX4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 29 Oct 2025 15:15:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1472557446544160381
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v8 09/10] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Wed, 29 Oct 2025 15:14:34 +0800
Message-Id: <20251029071435.88-10-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OAowhIcaKHQtd6oVjnadb7aZlVx2kEzBnMWiCBA0evMlFcXz1CuEM/5+
 mBculbqO7TOTvHfDikQuz+YelxP/70MaAmd1w7j/K42WpBc+2GuRMb8MUebMgVboDYh43Pc
 DvfnoXyoXLbS38GStzFVdRbmTs3bHn1MheC8dID6gpYWEySAbKhFinWsozXjY2Dc/72SGod
 kWsPQqSEACaHlLp4j+I722Imt8i62kN30qX1V5emLsvkcasSL1Hdns/wf/g6xjatU2t3qEh
 AA3/vTNslFvc6WnRSUfLkHpM6TQadPxs69ZYhSyoGIb2Q1N+Gr3puSjJLaIVLbmEpErtZmL
 QMyyj7bU0ZMxY23RqvNdr6ZWytM+54jM6MI41Cpr3lIev9N6xgQQbLS6SQdKTDIpPhmZSXz
 HS27CDBxjpi7cWc5FGw3hpWyyXFRm7ocxRUYUPz23uQJeQ/yTJXLnLB+7WEypSni+2wZABK
 ov+mIXmBGSjSYYJtn011aU5T4P1B/bOgNuionFatXdvurjmNOJCKSmSFYsp7BpJmZ1BL4CL
 ML4jSTMxk8iOXTNRD7zJx9y64CxwvUdyzJ4ccl5VnWiBMOFxshBCbLkrwI7jkVlitzh7IEi
 BbOqbmAVQkn7LUBiquWElXnxjgETY4416cDUIFPlMV9N+3MdUStGIQMFwFUH1VgBBXrELl7
 v49VNsFkAHsbAp1WlfwDelrGwPTvc3Po8x2WeVmqes64ThNXpAHKC/Ib1hODj0ZTgpxpG71
 4OsAGVcRPGguoLNBZ5U7Q4E0oXKb9p30B4bZQOuiR7wBXqf+MZjqe3bcab2llDGWi9p9iaH
 UaRnW1GlvxKWZqynQc6jAp+pesBGbynCjjCoVsknZuHXweBXYgTwBQmauVt4wEBIhnJobcr
 oJHbPP05E0gn77cDmQujJn1suO+5gfQVPymtwPe8gtngTvrKwm8UUXZ60D5HxofOe02mqz3
 Pgq+WR9qMY1gFAZf2i8PnQDq6vILGQeCRnaKNsvGZTWDbZVkxxRkBxGhx+1xELkmpyQIPQP
 KmuBGL37hVXY7erEVSe3dcOBNn5zuWYRMXu9PHXg==
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
2.49.0

