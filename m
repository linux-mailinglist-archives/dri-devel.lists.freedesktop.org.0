Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A275AC842A
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 00:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696A10E79D;
	Thu, 29 May 2025 22:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="PdlwNPOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D94F10E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 22:24:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250529222405euoutp01065ed8b5f3d833ea1337d4eddb7584af~EH7uCA2OH0344303443euoutp01D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 22:24:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250529222405euoutp01065ed8b5f3d833ea1337d4eddb7584af~EH7uCA2OH0344303443euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748557445;
 bh=YWgZEAPcMH46NIGH2/oSKhwnvWs2dOgmME8UVmfVxfk=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=PdlwNPOP7Bq6mAnKXwUUKOtMzeH42uNn7zWl+n5xLfLi4AmEtVSivsrBSDR/3kAhM
 wPFrUy503C1TVlyEuXqJo/BRIgCHm1/2YKxlRUOQZCbGwPP0QsecSm0y7i1Yh2DE0p
 JJuXDfCPTdFS49H/jNLU1o7vwoAnJHKiRfzaaqA8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75~EH7sXLUlv2958729587eucas1p1j;
 Thu, 29 May 2025 22:24:03 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529222402eusmtip2d7d50774a6c6e15081addf3fce030b9c~EH7reGp5Y3031530315eusmtip2K;
 Thu, 29 May 2025 22:24:02 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 30 May 2025 00:23:48 +0200
Subject: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
 Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
X-EPHeader: CA
X-CMS-RootMailID: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
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

Introduce device tree bindings for a new power sequencer provider
dedicated to the T-HEAD TH1520 SoC's GPU.

The thead,th1520-gpu-pwrseq compatible designates a node that will
manage the complex power-up and power-down sequence for the GPU. This
sequencer requires a handle to the GPU's clock generator reset line
(gpu-clkgen), which is specified in its device tree node.

This binding will be used by a new pwrseq driver to abstract the
SoC specific power management details from the generic GPU driver.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/power/thead,th1520-pwrseq.yaml        | 42 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml b/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4c302abfb76fb9e243946f4eefa333c6b02e59d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/thead,th1520-pwrseq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 GPU Power Sequencer
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description: |
+  This binding describes the power sequencer for the T-HEAD TH1520 GPU.
+  This sequencer handles the specific power-up and power-down sequences
+  required by the GPU, including managing clocks and resets from both the
+  sequencer and the GPU device itself.
+
+properties:
+  compatible:
+    const: thead,th1520-gpu-pwrseq
+
+  resets:
+    description: A phandle to the GPU clock generator reset.
+    maxItems: 1
+
+  reset-names:
+    const: gpu-clkgen
+
+required:
+  - compatible
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    gpu_pwrseq: pwrseq {
+        compatible = "thead,th1520-gpu-pwrseq";
+        resets = <&rst 0>;
+        reset-names = "gpu-clkgen";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0d59a5910e632350a4d72a761c6c5ce1d3a1bc34..78e3067df1152929de638244b03264733d08556e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21355,6 +21355,7 @@ F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
+F:	Documentation/devicetree/bindings/power/thead,th1520-pwrseq.yaml
 F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c

-- 
2.34.1

