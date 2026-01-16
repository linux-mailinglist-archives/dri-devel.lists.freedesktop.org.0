Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A13ED2B7C7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 05:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7695710E7F6;
	Fri, 16 Jan 2026 04:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE0D10E7F0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 04:38:37 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.83])
 by APP-01 (Coremail) with SMTP id qwCowADXfWmwwGlp9QjYBA--.45984S8;
 Fri, 16 Jan 2026 12:38:24 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v5 6/9] riscv: dts: thead: add DPU and HDMI device tree nodes
Date: Fri, 16 Jan 2026 12:37:43 +0800
Message-ID: <20260116043746.336328-7-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADXfWmwwGlp9QjYBA--.45984S8
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1xAr4xXFWkJrWrtF4rAFb_yoW5Gryfpw
 1Skr4ftFWvkF1S9a13JryIqrWrGFn5AFy8WwnxtryUCa1agFW2g3yIyr95XF1kJFyIvwnx
 AF1qvr1Fka13tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
 1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
 CTnIWIevJa73UjIFyTuYvjTRNdb1DUUUU
X-Originating-IP: [112.94.103.83]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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

From: Icenowy Zheng <uwu@icenowy.me>

T-Head TH1520 SoC contains a Verisilicon DC8200 display controller
(called DPU in manual) and a Synopsys DesignWare HDMI TX controller.

Add device tree nodes to them.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Tested-by: Han Gao <gaohan@iscas.ac.cn>
Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
No changes since v4.

Changes in v3:
- Adapting to the changed binding.

No changes in v2.

 arch/riscv/boot/dts/thead/th1520.dtsi | 66 +++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index bd5d33840884e..b663077428940 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -585,6 +585,72 @@ clk_vo: clock-controller@ffef528050 {
 			#clock-cells = <1>;
 		};
 
+		hdmi: hdmi@ffef540000 {
+			compatible = "thead,th1520-dw-hdmi";
+			reg = <0xff 0xef540000 0x0 0x40000>;
+			reg-io-width = <4>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_vo CLK_HDMI_PCLK>,
+				 <&clk_vo CLK_HDMI_SFR>,
+				 <&clk_vo CLK_HDMI_CEC>,
+				 <&clk_vo CLK_HDMI_PIXCLK>;
+			clock-names = "iahb", "isfr", "cec", "pix";
+			resets = <&rst TH1520_RESET_ID_HDMI>,
+				 <&rst TH1520_RESET_ID_HDMI_APB>;
+			reset-names = "main", "apb";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					hdmi_in: endpoint {
+						remote-endpoint = <&dpu_out_dp1>;
+					};
+				};
+
+				hdmi_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		dpu: display@ffef600000 {
+			compatible = "thead,th1520-dc8200", "verisilicon,dc";
+			reg = <0xff 0xef600000 0x0 0x100000>;
+			interrupts = <93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_vo CLK_DPU_CCLK>,
+				 <&clk_vo CLK_DPU_ACLK>,
+				 <&clk_vo CLK_DPU_HCLK>,
+				 <&clk_vo CLK_DPU_PIXELCLK0>,
+				 <&clk_vo CLK_DPU_PIXELCLK1>;
+			clock-names = "core", "axi", "ahb", "pix0", "pix1";
+			resets = <&rst TH1520_RESET_ID_DPU_CORE>,
+				 <&rst TH1520_RESET_ID_DPU_AXI>,
+				 <&rst TH1520_RESET_ID_DPU_AHB>;
+			reset-names = "core", "axi", "ahb";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dpu_port1: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dpu_out_dp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&hdmi_in>;
+					};
+				};
+			};
+		};
+
 		dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
-- 
2.52.0

