Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F02B8EB16
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 03:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B5910E370;
	Mon, 22 Sep 2025 01:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="JDw50E+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C2C10E370
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1758504628;
 bh=FQiFCRapN/3mwb02ZP+dTFVgTrcEVb7y08IjRSvyuIY=;
 h=From:To:Subject:Date:Message-Id;
 b=JDw50E+LondM7KIWkt/grZknCNEB7e5S12JmjA6IgYaAX/0zFKfM+UV1ojQ9byIQq
 nvGrcWgBudq8PyFFNIpJGFcPxb+GOXGUhOKJ6Cdi0sYRD6wlZLs9Tayxnc12aOoa8u
 EN93of4lJ8NYHsUqWtHtfxi3yBKU0XQxi4YzvQdI=
X-QQ-mid: zesmtpgz1t1758504070tb08ab248
X-QQ-Originating-IP: irFhF1T+2Su/4ccgz1o9QWkx8RvanKgMn5pFCBUgAAg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 22 Sep 2025 09:21:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16934661695937755636
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
Subject: [PATCH v4 6/7] arm64: dts: rockchip: Add missing dp_out port for
 RK3399 CDN-DP
Date: Mon, 22 Sep 2025 09:20:38 +0800
Message-Id: <20250922012039.323-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MmPNY57tR1Xn6g0A9TeECUkzjX3E3YG6Wa2AS7E5JlOcQ23gdx+dZU6h
 rWaQv9hKaJ+LVuIoFvLik/GIPT/H7tAEhjaHJ3oXa34SKNF1J6vcqt7C3rDU3VZ4/U2MkLV
 5rBtHvmMNkmzAJ5yasoQkhHcl7USW2DSYMPxEIR6zt+ZhDSk/qbJFHmf30B0f00EJ22/sIV
 WOC6w5CJxhX/9wjTXoMQogAILFXGRnEScpRlEJERjQSD9dnqKbMkwPprg1ZAICCao633by2
 ipOjLnHJvJVgbZyG/zCk81u0OUlMx4X6b2yY97ytznIi0ed1bipV8x5DzQs+W3hR3DSy03F
 Gu5tWR8h6OI9YNANPUKR4vgaJntTW49+iyXgJE7O222Y9GlC5oioI9eqmy7h9yUbNv6eYQA
 qJ0N5NtnmIRTWC6eFDTV1MkHSUgDTOKahTuRgQ+qMHceEfym8fBr21dxCMrI5eFBlKxWkPQ
 OJWkBoVNWwEg5JgoU52Ei/WdPkJ7+8Rf0Ob7vUfPnfvANalRHPhP4GWYegfkFBvUa4Qh1JQ
 ij4QyAcI++YuoPw1f192Lj7obZ1nQKnTnHNDx+TosWM0hqSDw2PlK0UhXT3drRTfnEFXgWI
 7WVUEZVxyAE7/ab4iw9dXU7HpnbBSgPRtAD8TAuVdWnMuNEBWb5C3DU6PK/dASIJ/WvjQ//
 uR/eWtpd/oatI1rYzZEZXQRziL1dsCb/rh506/htibNuX3XFW7jVOreJmMY0PiAiurz05sH
 lrYMTCuAhDrLYHk7GeXWcoxPI76djNi381ScoNFix9NG7uZhrjvh+whXuBagYkI+AdATou3
 tGV0qgoLCHsfjiuy63cOLhRDGyC39nnahm5UrnRa0uL2T7krMowtcXTwiH3/Y0daEDwmEa8
 ST89Jd5E2K4a+N4xG8Xm4OLWnk29otoLs+IwYitt/B11FkgxZTwE7faMobsn510+blOy8BS
 /T34JA95dQBkTGPWmrJFo1dcg+LaoYeTDoJESisq0RPN3yplKzJa7Af0n+puKaq7pGhZfD3
 umw/hhOc3kGQpeN8ia
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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

