Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C8AB0B1F
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2E10E9C3;
	Fri,  9 May 2025 07:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="c9qn0n/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 87582 seconds by postgrey-1.36 at gabe;
 Fri, 09 May 2025 07:03:53 UTC
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A571D10E9C3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1746774186;
 bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=;
 h=From:To:Subject:Date:Message-Id;
 b=c9qn0n/WAT/5VUlIqf8yft1iSjjxxXC+DuqNGQ9E9c0w5IAmr7LiRP5gZ4TVVXokA
 VjPozpQgz9ToYVkQaUDKeNZHUuRZExDKF3FbM3eniULdgkPf1aUZ/tNtd+mgYSdWL0
 6J68ikeXh+JPbfCQABgmgz4L4PjnVOUIjcuMmtOY=
X-QQ-mid: zesmtpsz9t1746774184t6495fff1
X-QQ-Originating-IP: 72XqEkqkGIqj0oHxXYEJJIT73eX1FhATDdwbuVl96Fo=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 09 May 2025 15:03:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18013972026225453354
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
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Improve coding style for rk3399
 cdn_dp
Date: Fri,  9 May 2025 15:02:46 +0800
Message-Id: <20250509070247.868-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250509070247.868-1-kernel@airkyi.com>
References: <20250509070247.868-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: ORpsEWb2hdyl3Xg85DUhZGHVgKw/34d1DS8fdr7DfZncxXlsk7AhQEIb
 F/9rG3GxGsrfXrETmCc8c5SgKNc0T8eJGD8G3Sud6CLNqcZAHIp+ESs2emW6BF/gafrt2Po
 X/jokV4U1GDFxiPfUVEbwuUd4V5XmYAcUKTGW5ug7AKo9mb0QGCI6vVnCJqkzNmrKVQaWRJ
 shlX2EsGYjsrK4AdZA7lfcNyFRHetW/QEv85/3hGP4Nc54y8NYmAFa1uRbhfHgOPrnhFWd/
 JmEZbYzQQ4jCVjgS/KlM0HPecr1lWY0LaQKBBNG0TOIDzvX3WDSZx5rACMCVkZTC4tymDaV
 WOF/Zi64P5bcpVXNUuF+cnM/Ni4NOcnuHHrsQ5RRaSNMjbAK44nRQy5iPCSH6susdl17/fd
 l1nadC43Q29nJEStSM6zsrl4risb3V6uAF9+zJ5ZKLMISPF6nWeA3oBSeLL6mj/gZaMie/n
 43GJ6YDI5jM4IWUOYgNmsxdsuE8ehsbh3wOTClaNdesp+M6h9TDUW11W78WBXrphf+IVnHA
 6nLoVVEkS1VLRxnK8wcoOy5xdT6/hsqWwah9hN89rucsxwwEt+qfZY2Q+yFxXEgT0PBillt
 QMfHA3wcU4zwI+fBUVXr7SsFQO1aLTK1JIc+eXJs+FfVllzPe307cr/nenpax1rRhkDJf3s
 ikLRwBap4Xx4vfrdJ9GquEA/BFaZljKxHlXQ+In2brsSKZQmAgLFR7JFQopDh6Ab7TtgGt2
 hz/IPNmCJJ2b/KaP+1pU/ABd7eFHc/36/cGIvq42ORF6Flu7hel1lbblVT+/fR4ClzjPsPh
 8qFuaoN1PIpnxDLs+9CXk6AcpYrScIuzoQLHlcSx3tkOaAfSHPq/+WjdpLSRCcGUh/fCVdZ
 SubTaIX6zI7xZhzGB09vrlcwFesITAWqbv93J9eh4Kd/9VYP5FscaApiBzsGewGA4RXyUAI
 fxc8j5XU8KRqyT/L9KblbcDReCkcwjLDDl9iYxjs0KuwW+X5qeEKE+GLVw6O4iZZwbUp6DU
 RVEIHtVQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

