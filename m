Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06F5ADE896
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 12:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA62F10E7FE;
	Wed, 18 Jun 2025 10:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ApxDq+q7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AAD10E7F7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:22:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250618102232euoutp028c27654790bd6d2b7dd386934b33ca16~KG-bn96f-2860828608euoutp02K
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:22:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250618102232euoutp028c27654790bd6d2b7dd386934b33ca16~KG-bn96f-2860828608euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750242152;
 bh=03clYuLUe6lZViLZ7J3QsFCYeiK6qNUgF531eyi5Uj4=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=ApxDq+q7YQ8RwciF1FUJBLaE/9u/BOkQbAR48Dk6iJzTtmqFEpHk4O7CXjpIUtjJB
 tQXuBxNbHQLPsjJog0QeABHnGwJ1rw8WWFBUvfi/KfppVTg7BtjSRW5Ux9ecCRHGZu
 +TxZ4x5c1tw4hzyTQJ3ec16qiSYMYz5sdgSDWwpo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb~KG-bGe0in2809028090eucas1p1_;
 Wed, 18 Jun 2025 10:22:31 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250618102230eusmtip198543fedf6efd80d3c0af56b4c5c4765~KG-aIXtgN1490914909eusmtip1I;
 Wed, 18 Jun 2025 10:22:30 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 18 Jun 2025 12:22:12 +0200
Subject: [PATCH v5 6/8] riscv: dts: thead: th1520: Add GPU clkgen reset to
 AON node
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-apr_14_for_sending-v5-6-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
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
X-CMS-MailID: 20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb
X-EPHeader: CA
X-CMS-RootMailID: 20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102231eucas1p1ec99058179825cb1250a1f189313b3eb@eucas1p1.samsung.com>
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

Add the "gpu-clkgen" reset property to the AON device tree node. This
allows the AON power domain driver to detect the capability to power
sequence the GPU and spawn the necessary pwrseq-thead-gpu auxiliary
driver for managing the GPU's complex power sequence.

This commit also adds the prerequisite
dt-bindings/reset/thead,th1520-reset.h include to make the
TH1520_RESET_ID_GPU_CLKGEN available. This include was previously
dropped during a conflict resolution [1].

Link: https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/ [1]

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..f3f5db0201ab8c0306d4d63072a1573431e51893 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
 #include <dt-bindings/power/thead,th1520-power.h>
+#include <dt-bindings/reset/thead,th1520-reset.h>
 
 / {
 	compatible = "thead,th1520";
@@ -234,6 +235,8 @@ aon: aon {
 		compatible = "thead,th1520-aon";
 		mboxes = <&mbox_910t 1>;
 		mbox-names = "aon";
+		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
+		reset-names = "gpu-clkgen";
 		#power-domain-cells = <1>;
 	};
 

-- 
2.34.1

