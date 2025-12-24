Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A866CDD156
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 22:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3AC112C98;
	Wed, 24 Dec 2025 21:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54D911238D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 16:12:39 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.54])
 by APP-05 (Coremail) with SMTP id zQCowAA3yw7WEExpgGPNAQ--.14041S8;
 Thu, 25 Dec 2025 00:12:22 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v4 6/9] riscv: dts: thead: add DPU and HDMI device tree nodes
Date: Thu, 25 Dec 2025 00:12:02 +0800
Message-ID: <20251224161205.1132149-7-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3yw7WEExpgGPNAQ--.14041S8
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF47Gw43GFyxZF4DArWkZwb_yoW5JFyfp3
 WSkF4ftFWvkF1S9a13JryIqrWrGFn5AFy8WwnxtryUCay3WFW2g3yIyr95JFykJFy7Zwnx
 AF1qvr10ka13tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
 Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
 c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
 CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4U
 MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
 WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUv
 cSsGvfC2KfnxnUUI43ZEXa7sRRjg43UUUUU==
X-Originating-IP: [112.94.100.54]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Mailman-Approved-At: Wed, 24 Dec 2025 21:50:05 +0000
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
---
No changes in v4.

Changes in v3:
- Adapting to the changed binding.

No changes in v2.

 arch/riscv/boot/dts/thead/th1520.dtsi | 70 +++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index bd5d33840884e..5c0a7072f253a 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -585,6 +585,76 @@ clk_vo: clock-controller@ffef528050 {
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
+				dpu_port0: port@0 {
+					reg = <0>;
+				};
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

