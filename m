Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6DCC4D2FC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0B410E54C;
	Tue, 11 Nov 2025 10:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="GuOEd/Rz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999FE10E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762858294;
 bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
 h=From:To:Subject:Date:Message-Id;
 b=GuOEd/RzZKVauL9RE22Jun37P32CADUx8LslqLk68IcSmkIbcIKProj9OxzLUbfDV
 kWfwbRlOdU2EyMtP3GRd8mH2yRptWPuSn3OKzv4PaswoEfvzX36OGeRaic7ac4xOTa
 q/T864jm6PVFuZBpH5nUSkRfmqUIOdfB/IrobVWs=
X-QQ-mid: zesmtpsz9t1762858287t5941ed20
X-QQ-Originating-IP: oggRwoMydKBDH0LmcR8KzliYg47YhSd7rMeyclg9ztc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 11 Nov 2025 18:51:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15062605320672791780
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v9 09/10] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Tue, 11 Nov 2025 18:50:39 +0800
Message-Id: <20251111105040.94-10-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251111105040.94-1-kernel@airkyi.com>
References: <20251111105040.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NJ8AO1QhldfJoDDr/XkLuMY1LVIRQJMBVyeMyuYgLts/HGgoS2B9NTnn
 piM5XnUclVMh5nhEnK8Tb09cQ6ZyqrEHBH9aOrqV/aEb+rVBs0F9MtcsbeJtWuWfgSvnc8I
 zyGlydbvwnQKn+01M1lYvAMB6cmocuIZG3oWp84rhMUB0Rvo8VCh2U1pFzt1nZ0KUntyGaD
 XMxWwSx2sRvjWgT+wA9n4TbbV6bxeIaVr/rxcNoN5/h01nxWcKb3jy1hTXVmjx6uUaoUfXA
 1GhCPd/BedyaozTr8D9QIpTt+rapaVGbr7eSK+bsORIAPPFDwPWMhLM4l8sRh0AnSG+3FH3
 m/IT4njcE51xd1ScnL8/ZvGr4PPeecqh1GN+JIjoZ1Qp6iockS95vnY2fiYAcTSXRPq7xQO
 AN0s+8WjNpl3aUD6+lamGmyjdilN2/Y+DgfFmKSQyjUOOqi+lXB03DZA7xyuzX1Bx4H2Q0b
 GYkWmvA6wVRf0mFcSYlx7PvZBBq9HU9ngBmHv02mTEkoekL2+1tbGdLPSp50fzkFJtd2q0G
 Pkg7rqKDv3h7lfDp6xkAP8YZH22WHh8tgcWXIBLFtX3xIyzrCVeRBt5YeM0se+0gI2dqroQ
 hf1ODcoWPxs2cIjH4aXD2o7e0dH6UL6grfgCjDUk5CUhc3yrA0wLxtmIpEzOBZXU4A8SbS0
 ED78B+yXgk6tKR0U7CT427A+4O/59pPeelGDYcOlKeXth27CrDkA572HESLHt23kvMwNTi4
 G9xpIqrLxe/HKBYqwU0DGIOOtu2jnbAz1LDf2pMm6az016tWdvlBaRi7QhL6ovqxnLJ99LP
 QYNwxrmflOpV8KyKqCMy3KnqbUv+pew0ajS/jdpgIrGM5C9tFl8SoD2fgGsSqaRP4CKPztZ
 2ZbGcRXI8ytCMKOj5e1MxdFLoUJkraCqrKjLS4gmK6RmFjoHy41V/I0b6rj+RZVqr7PvJ3x
 3iN16yJTpRk9ZRsldLZyYkf7dpendSO5RAl9qdogID2PG9bRInaeqjxMoZqHKMFgffQoYaa
 qfl/YwhQ==
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
2.51.1

