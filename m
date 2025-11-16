Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D4C612BF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 11:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAD410E137;
	Sun, 16 Nov 2025 10:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JjRwZItl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108A10E137
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 10:52:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5FF2446A5;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6552AC4CEF5;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763290345;
 bh=kOOrESOKkO5Fvrc8vbMcHuhjG+SM9roerxOVZim5y3Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=JjRwZItlDZcMOx9U1nyP+Wx4kmMYY3iW1E7beCk71DPn/LItplXYX7hQIgzr8RmQq
 hHXVmyf4rKLniptiXBUICauGe+KFNrEMw6UCXzbGkMEnGxbl7M2CF3YZooeSWu4McW
 IiQD/EBkeWgS7OWsqtqgyB7zzzQPLJMYy0ASSOo/TciddhXH369Y5YGRizekQkxsVB
 lsVpLNHxwiBRUZKUBVUnf9yTmv8Bp7+nLiCsjoyjKzjzob7Up0ZHPEUFOiMiiMXdpF
 nxwbTtUWCj1wxhz+iIrsbXEpAI1GIqdYUxWoW6e75VAowQNWGNS/SEWRNm7UxEZP61
 RxXWSEsJLl+Xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5E807CEBF93;
 Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 16 Nov 2025 11:52:09 +0100
Subject: [PATCH v2 4/6] arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-asus_usbc_dp-v2-4-cc8f51136c9f@hotmail.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=2707;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=gVch4ql8WxMYLsjUgpaWu128bM+DAmxfRg0AqEiDW8A=;
 b=/qzVZYxhAIXQblzRy4zCQeS+OA52oJ8R2sXQNnOCi5fUOZM9RTyHtYsnmtbYajtcz4BqqSvhV
 ++khk4bdDDSA8/ybAWHEa0yMBaeSWWDrsCksNgwfxw/1tai9hMTS1Vz
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maud_spierings@hotmail.com>

Enable the HDMI port on left side of the laptop.

The display signal is routed through a simple Displayport to HDMI
bridge.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index ea8ad67e511f..d5794189b98b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -37,6 +37,45 @@ switch-lid {
 		};
 	};
 
+	hdmi-bridge {
+		compatible = "parade,ps185hdm";
+
+		pinctrl-0 = <&hdmi_hpd_default>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_dp_in: endpoint {
+					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_tmds_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_tmds_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -814,6 +853,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -1047,6 +1094,12 @@ hall_int_n_default: hall-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
@@ -1243,6 +1296,34 @@ &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&retimer_ss1_ss_in>;
 };
 
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+
+			/* No USB3 lanes connected */
+		};
+	};
+};
+
 &usb_2 {
 	status = "okay";
 };

-- 
2.51.2


