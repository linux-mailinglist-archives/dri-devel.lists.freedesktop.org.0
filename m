Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4EABCD6B
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 04:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A48310E45E;
	Tue, 20 May 2025 02:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="mkM7xDda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133B010E486
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 02:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1747709275;
 bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=;
 h=From:To:Subject:Date:Message-Id;
 b=mkM7xDdaH0y6I6R4g02anci2qkHgfa9eyRV2I05TN6eA+3ATjXyIYUA/cULtHj9En
 odewUybff2ZpMQMDWaOPjp181x84xSh8NwFidYG+GYn8/Yus39tJ9NnSv53if0XNTk
 h4+3BPAV397Un1dSHhu63IUfatmuNGJo7dnJAd3w=
X-QQ-mid: zesmtpgz1t1747709273t11c1660b
X-QQ-Originating-IP: j08/Knoc5sKowREV0R+oKB6ClVB4MQa1mQa6PVd9N1Y=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 20 May 2025 10:47:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12805088329180934383
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
Subject: [PATCH v5 1/2] arm64: dts: rockchip: Improve coding style for rk3399
 cdn_dp
Date: Tue, 20 May 2025 10:47:17 +0800
Message-Id: <20250520024718.142-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250520024718.142-1-kernel@airkyi.com>
References: <20250520024718.142-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MbZKK1WA8nFuo4NFU6pFKIRpfg0WfgbW3eILhu67M66CTZZYratAPdVZ
 VTmW2IoIQt0u35t/nySEwTnik9QaxAjkrbauvGDg/D+CCJoZ1XzdxvhfdUOUOQgwpHNofPm
 jeEjvdMh2qRZYecV6lAAhAvMLnjCGft5gIfvWpLwdGb4Xea2tf3/zVAF9MkqHCPQ/Ts+umu
 QhtFVtmUnJaaXetz0U7zcCF7Zo1GkycKHzedwTChCVIoroq1PQYBk4Yvwt8FJ7tRmV3Bnil
 q9u50R5w2438p0G4HbDiSuDmpplAOQhRKIPCapZPgNXbG1RuN/QmBNivsB0Sf0KLxinQ3CJ
 3n5iwgEewhqbDY8vjHb4Wco1ArV+uXdZvcdYq9oWtMlvduYbTJfPm+PCpJwL+c2zSSqqJni
 Bqjdngz85kNjuK648O9StIqGla284DIApbJAmAQAG4mTekSPSOLlQCdb4otHS8AiLqq9xZN
 0Dlsli7STIrds6al9AWolrC67HtviY9paFZ/6bTrziH+2s7EyPftz971UlsC23/cG1va4WK
 obdaUot/qR94hWtfsXxAF5OlIwZwz0w9+CHoMxQfteThDCvG/Nyr5O/PfUsDqH8xkUCYMup
 2Lpb2wRWM46vPr3Fe2K53/wKLhtqnT37uCK3588o1oAslDZUF2d1xgF5IM8KdTFaIvuoW4E
 guBW4YTbRMw3khWDh1aT6cTO73kGvZQtx6/fURaddbK25lKdp1Z2kM5Rpg7ctHm1gtiKFFr
 7eRy3NWq8L5TcENYLbLFVRJtxEt9F3qjkbPjJbvTnuXc2vhg5CETRZnL+qq67DR1IA9IY5M
 QCma/DPDdBme0iX88K5fzAJV/ytHRR15iprwdhYbQe/Suq69fyrfRALjQrycqBFz8z0CsU2
 ajLLM+DSDOQzIZ5xzaNdjOKKrEMWbfIkO/VYfxRtWg4G9gnGhgkcHmO919Gr3yYQV2tWkzI
 h+NyttvwctbFLkkTyZEEbSBraPhMn+hwQ2bIfAwG5efRGWUx/l67E8S+nJ+TVcNJLbjjy2d
 8OSOwiDg==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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

