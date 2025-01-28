Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476DBA2126A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B121210E706;
	Tue, 28 Jan 2025 19:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="o52tYm49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0074D10E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:29 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194828euoutp02195fb793127b9ef54b75409cc62f359f~e8wTo1E7E2670226702euoutp02C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194828euoutp02195fb793127b9ef54b75409cc62f359f~e8wTo1E7E2670226702euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093708;
 bh=j9l5aDCxr3DvU3/2cWqH3XQcq0oWDa3VyAGZPsGNHMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o52tYm49SKNdyWOhBFvW6/TLzFcLCn+YD84lzExi40BcY0V+sx9ELy/Z2E0FI7fxO
 iu0VHirErDDGUVIRCez8sWB4mduUtZSu5MYYPG9fh3yNLYdD6xURwj0CdIt0paeF/R
 9ULdaSyqmuXky0T597E8xg4v8dNEmpBxMwLx7rGw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250128194827eucas1p2ab121d8e6f920a042d87623a8e1c7b03~e8wSqtcau2211822118eucas1p2A;
 Tue, 28 Jan 2025 19:48:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F8.F8.20821.B8439976; Tue, 28
 Jan 2025 19:48:27 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194826eucas1p1b18e5af64e66b06da985b194d022273c~e8wRqSHFU1989019890eucas1p1m;
 Tue, 28 Jan 2025 19:48:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194826eusmtrp279bcbff1fdae98bf8f72216d19949843~e8wRn8wBU2963629636eusmtrp2k;
 Tue, 28 Jan 2025 19:48:26 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-87-6799348bbf2c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3E.AB.19654.A8439976; Tue, 28
 Jan 2025 19:48:26 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194824eusmtip1254d86ca0f63e60db4fa04696aac0927~e8wQNZfZy2620826208eusmtip1l;
 Tue, 28 Jan 2025 19:48:24 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: [PATCH v4 01/18] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
Date: Tue, 28 Jan 2025 20:47:59 +0100
Message-Id: <20250128194816.2185326-2-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxjG851zek5pVjxUjB/i0FXBsQyQBeaXzNsyZ45bxsSNmJHs0sCx
 ELm4VjYlZMJKgUKrUzc2C4zLuoFMhEFbKBSKWClQqQy5mAjoMpijgA2XkqlBRjm4+d/vfZ/3
 +Z73TT4+LmokN/ETU06yshRJkpgUEMbOR7dCCiIuSXfWZvmhruEKDBmeaCl0pdWBoVKrg4fG
 +vUYGnC7SHR1oo9Cf7dmEWioqoRCis5aEk1qx0g0qx7jodvNxSSa11gBMs5nk6jGOkqhWncp
 hspnDQTSNTUDlKP6hYd+73kbjY51EWjythpHOdp1aNncRKGnQ78RqOihhUL66fM8ZKs5irIt
 3xL7AxjXHSXFTE9OEsz1vAWKaV0sIxiTdpRi1KabgKmvVpHMyJCZZH7sjmbuFdgwpkF3hsmu
 6cSYc0s7GVfbIMmc1VcDpl8xTB0WxQp2x7NJiV+wsrC9nwkSKh/eI070vXgq93EblgkUMB94
 8SEdAQeu2Hj5QMAX0VUAXi9fJDyCiF4A0F38ESfMA5g3oiGfOfI1BowTKgFUFH69VkwDuGi2
 rNpJ+jV4v7J09V1fWklA5Y0s4Clw+gGAxvHi1bfW0zGwp0y36iDoQDja1svzsJDeB8cvewye
 vC3Qcq0X97AXvR/WL1UR3IwP7L40vsr4yozCUIR7AiBdI4C6qT6CMx+A3bmVFMfrodOmX+PN
 cNlUinGcCu8b5nCOM6BJbVvjN+CI4/HKovyVgGBY2xzGtd+ED8wKzNOGtDe8M+PDreANLxi/
 x7m2EObliLjpIPidWvNfqKPKuBbKwJbGEuob8JL2uWO0zx2j/T+3DODVYCObJk+WsvLwFPbL
 ULkkWZ6WIg2NS02uByt/2/7UNtcESpyzoR0A44MOAPm42Ff4seMHqUgYLzmdzspSP5WlJbHy
 DuDPJ8QbhRUWpVRESyUn2eMse4KVPVMxvtemTKyQTTEPs1+pu6JiXKq6Dw4HReyZqX4iiPlp
 YFr56HXfyHZvjcs65nc0Mv2t1EHK773Ciam6uq1FLa7Pt9gd706UH3/1T+XFhVgVWrdHrE1M
 93ZatbGfLM3BtIz0XOZ01GhgXOTmiPYYp/uFrl0+0X/08AdCWgpuDgUZeC0ZRxrUf8lcQYTJ
 KJg4F79tZvvVAwnF9q27/gk+eCivwJ3lPHLqvPdZf9+9LzdssAROg96i4O363XHBZT/b8YuH
 lj8cylE1tt9NFP+67eCxHTl+aQGZg7xb72+omN0313s5vKf/hs9y7JkWVUP0OzvU/pniMPtU
 SL9MY9OhuwG64Ypj10zRUYNiQp4gCX8Fl8kl/wIauOeoSgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7pdJjPTDTp+C1ucuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLWP7uPkvBBdmK9l/7mBoYmyW6GDk5JARMJLp6tzJ1MXJxCAksZZRo6L7G
 CpGQkbjW/ZIFwhaW+HOtiw2i6BWjxMmzm9lAEmwCRhIPls8HaxARWMwisXdfJUgRs8BbRonr
 MzeCdQsLBEv8X3CbCcRmEVCVuLvvLFgDr4C9xJOVjYwQG+Ql9h88ywxicwo4SGz6uwKsVwio
 5tHbGWwQ9YISJ2c+AYszA9U3b53NPIFRYBaS1CwkqQWMTKsYRVJLi3PTc4uN9IoTc4tL89L1
 kvNzNzECE8y2Yz+37GBc+eqj3iFGJg7GQ4wSHMxKIryx52akC/GmJFZWpRblxxeV5qQWH2I0
 Bbp7IrOUaHI+MMXllcQbmhmYGpqYWRqYWpoZK4nzsl05nyYkkJ5YkpqdmlqQWgTTx8TBKdXA
 pHuFcR/nvjRDlsU8pxaE/dZobt4rGPUhWif12+r4psNrZ1ZvMbbO+7/ijswUm2cZf16uvCR2
 lG/2Eo7CfXGPzvis+H55taxYxcQVMR5dgu/W/Xi1RbF4q9DButTAY38bP/5uaTl5vvLNzwj1
 opUlSW3Tb7hI8afrFDzJlKz5+fXzsfpcLemI+Z/Y9pp1Kkey3tzzwVxZvM5rkut75mn+3/om
 FVrEKB+vizzezz99ccMfZoserVC7hO9G5XnuC26UzOUw2zLps7F/56HoV+73FW415RdJL/su
 EcKTsKOGP+xt4LltPNW3De2nqk+a8GFHvfa2dd2Gcz4k6Spr2a7ou8q3qdp843HJ6DI9lsr9
 SizFGYmGWsxFxYkASnpl3LkDAAA=
X-CMS-MailID: 20250128194826eucas1p1b18e5af64e66b06da985b194d022273c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194826eucas1p1b18e5af64e66b06da985b194d022273c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194826eucas1p1b18e5af64e66b06da985b194d022273c
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194826eucas1p1b18e5af64e66b06da985b194d022273c@eucas1p1.samsung.com>
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

Add device tree bindings for the TH1520 Video Output (VO) subsystem
clock controller. The VO sub-system manages clock gates for multimedia
components including HDMI, MIPI, and GPU.

Document the VIDEO_PLL requirements for the VO clock controller, which
receives its input from the AP clock controller. The VIDEO_PLL is a
Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
with maximum FOUTVCO of 2376 MHz.

This binding complements the existing AP sub-system clock controller
which manages CPU, DPU, GMAC and TEE PLLs.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/clock/thead,th1520-clk-ap.yaml   | 17 ++++++++--
 .../dt-bindings/clock/thead,th1520-clk-ap.h   | 33 +++++++++++++++++++
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
index 0129bd0ba4b3..9d058c00ab3d 100644
--- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
@@ -8,7 +8,8 @@ title: T-HEAD TH1520 AP sub-system clock controller
 
 description: |
   The T-HEAD TH1520 AP sub-system clock controller configures the
-  CPU, DPU, GMAC and TEE PLLs.
+  CPU, DPU, GMAC and TEE PLLs. Additionally the VO subsystem configures
+  the clock gates for the HDMI, MIPI and the GPU.
 
   SoC reference manual
   https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
@@ -20,14 +21,24 @@ maintainers:
 
 properties:
   compatible:
-    const: thead,th1520-clk-ap
+    enum:
+      - thead,th1520-clk-ap
+      - thead,th1520-clk-vo
 
   reg:
     maxItems: 1
 
   clocks:
     items:
-      - description: main oscillator (24MHz)
+      - description: |
+          One input clock:
+          - For "thead,th1520-clk-ap": the clock input must be the 24 MHz
+            main oscillator.
+          - For "thead,th1520-clk-vo": the clock input must be the VIDEO_PLL,
+            which is configured by the AP clock controller. According to the
+            TH1520 manual, VIDEO_PLL is a Silicon Creations Sigma-Delta PLL
+            (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
+            a maximum FOUTVCO of 2376 MHz.
 
   "#clock-cells":
     const: 1
diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt-bindings/clock/thead,th1520-clk-ap.h
index a199784b3512..470fa34f9a9d 100644
--- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
+++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
@@ -93,4 +93,37 @@
 #define CLK_SRAM3		83
 #define CLK_PLL_GMAC_100M	84
 #define CLK_UART_SCLK		85
+
+/* VO clocks */
+#define CLK_AXI4_VO_ACLK		0
+#define CLK_GPU_CORE			1
+#define CLK_GPU_CFG_ACLK		2
+#define CLK_DPU_PIXELCLK0		3
+#define CLK_DPU_PIXELCLK1		4
+#define CLK_DPU_HCLK			5
+#define CLK_DPU_ACLK			6
+#define CLK_DPU_CCLK			7
+#define CLK_HDMI_SFR			8
+#define CLK_HDMI_PCLK			9
+#define CLK_HDMI_CEC			10
+#define CLK_MIPI_DSI0_PCLK		11
+#define CLK_MIPI_DSI1_PCLK		12
+#define CLK_MIPI_DSI0_CFG		13
+#define CLK_MIPI_DSI1_CFG		14
+#define CLK_MIPI_DSI0_REFCLK		15
+#define CLK_MIPI_DSI1_REFCLK		16
+#define CLK_HDMI_I2S			17
+#define CLK_X2H_DPU1_ACLK		18
+#define CLK_X2H_DPU_ACLK		19
+#define CLK_AXI4_VO_PCLK		20
+#define CLK_IOPMP_VOSYS_DPU_PCLK	21
+#define CLK_IOPMP_VOSYS_DPU1_PCLK	22
+#define CLK_IOPMP_VOSYS_GPU_PCLK	23
+#define CLK_IOPMP_DPU1_ACLK		24
+#define CLK_IOPMP_DPU_ACLK		25
+#define CLK_IOPMP_GPU_ACLK		26
+#define CLK_MIPIDSI0_PIXCLK		27
+#define CLK_MIPIDSI1_PIXCLK		28
+#define CLK_HDMI_PIXCLK			29
+
 #endif
-- 
2.34.1

