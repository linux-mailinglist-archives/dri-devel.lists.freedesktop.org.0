Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B0A3C109
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F8F10E80D;
	Wed, 19 Feb 2025 14:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="tNxf2CxE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A931310E490
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140257euoutp01ead68bf7dabfa32395b48d172485798e~loO6L_gpu1464314643euoutp01a
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140257euoutp01ead68bf7dabfa32395b48d172485798e~loO6L_gpu1464314643euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973777;
 bh=WnNTtK4UqUpVNFsv+gdN6XHhmKBgOeWWQN5mo20i5Kg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tNxf2CxE7W/rQnkLt0Ewd7HwDea7Y6vCVXWcqRW6w1fAyqJB0GUHHgfaiRDdoyQl1
 2iAw/a5TdYTXnH9fk+Vl7K2HXfMXWELUYX73V3gL9PTYe0m3UXmQ5UwZjgghRx7MzH
 oIr7uiSYoYrNrxtI1u22cgr519sopc1z3HkDI+2g=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140256eucas1p1c1d4c84e0a4a9753c3312cf481895bb2~loO5uoLSE2959629596eucas1p1g;
 Wed, 19 Feb 2025 14:02:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A4.73.20821.094E5B76; Wed, 19
 Feb 2025 14:02:56 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250219140256eucas1p13aa7f19867f88185739552f116ef0fc1~loO45yeoM1049010490eucas1p1C;
 Wed, 19 Feb 2025 14:02:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140256eusmtrp197c44c19e009b34954ee854b0ca61387~loO44y0_G2416524165eusmtrp1U;
 Wed, 19 Feb 2025 14:02:56 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-27-67b5e49043ac
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FD.42.19654.F84E5B76; Wed, 19
 Feb 2025 14:02:55 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140254eusmtip2d7608f91caeda22a5cb42989a93fdceb~loO3ipXEQ0084200842eusmtip2-;
 Wed, 19 Feb 2025 14:02:54 +0000 (GMT)
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
 <m.wilczynski@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 05/21] dt-bindings: power: Add TH1520 SoC power domains
Date: Wed, 19 Feb 2025 15:02:23 +0100
Message-Id: <20250219140239.1378758-6-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xbZRjG851zek7pUjwUtJ+IImQa8QKDzezTLXMzM5xoNLIo7GI2yziU
 OW5pYdONZCCXsNlyEYHQjpUhAkMqjLaMItBQGN24dKwwboGOJaAWC8hlkGFkUg7T/fe8z/t7
 v+d9k4+Pi5pJb/6p+CRWFi+J9ScFRGPXI+tbeVMG6Y6qtJ3o1nA5hgx/qyhU22rFkKbTykN2
 mx5Dgw/nSfTLdD+F/mhNI9BQdSmF0rvqSORQ2UnU+qeBQgsKOw8NNF8m0ZKyE6DGpQwSaTsn
 KFT3UIOhqwsGAlU0NQOUdbGSh+52f4Am7LcI5BhQ4ChL9Qx63NJEofWh6wRSz5kopHfm85BF
 G4EyTD8Q+32Z+ZFMinE6HATTkb1MMa0rZQRjVE1QjMLYC5iGmoskMz7UQjJXbocx97+zYIyu
 4gKToe3CmNx/djDzbfdIJkdfAxhb+jD1qeioYG8UG3vqDCsL2velIObBHS2emCv8eqqyg5cK
 lNsuATc+pHfBmWktz6VFdDWA1vpPLgHBhl4G0Dg6TnLFEoBjTUrekwlzbiaPa1QB2DZ3A+MK
 J4BKnYZwUSQdAierNJuUF51JwMybacBV4LQGgz+vleAuypP+ENYXLWyE8PkE/QpMtX/msoX0
 e3Dsuo3k4nyhqb0PdyFu9H7YdtebQzzg7ZKpzSx8A0k3qHHX85A2CGDZb9UYN3sQ9q4uE5z2
 hDMWPcVpH9hToNjyE+CkYRHndAo0Kixbeg8ct65trobTAbCuOYizD0C9vgJz2ZB2hyOzHtwK
 7vD7xmKcs4UwO0vE0a/CQoXyv1BrdePWYgzs+vEvKg/4qZ46RvXUMar/c8sAXgPEbLI8TsrK
 g+PZs4FySZw8OV4aeDIhrgFsfO+edctiEyidWQg0A4wPzADycX8vYdYFvVQkjJJ8c46VJZyQ
 JceycjN4gU/4i4XlpkypiJZKktjTLJvIyp50Mb6bdyoWVzSuTzky5f521/v31N268KoSz549
 oSMBE1fP8gcLj8vsN31GCTY/O++LMKG6+Kcj3h1R6oCcE6H1fSFJ0p2S06n+EaaU59NyS60H
 dnsxv88enzfXoL4IZ/i7hwJ0sb0DeQvzh7Gcus9PVr7p0T7uaxoY9CsperklerWm9qtcpRqX
 NNjmkinxUtO1j6thaeSd84/P8HwmW4rfGKuLodsDQq/FTHhM/1pVb1mL3Lt+LJp4tr/Sy3Ys
 2vmROiZ8X35UgTHxxm7N5ZfI1945rF4dzT86K8gP1uGTz6k1D17cbhUfDBoWT0UWfLsSlr1t
 pbaw22EOXnTeLw85n/DonN+uQ9H9/oQ8RhL8Oi6TS/4Fum8SVk0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0yTdxjF895bZ8NrqfEdM8N1WWLYVmml7N8NmB82/Qc/6LLJtMZBg6/F
 UVrTljEWhizc5I6Jl1A6YBs4ZBQntqygLVIIlDnpCqxVBsUh6KpVVgUTN2fX2izx28k5vyfP
 +XA4GP8sEcc5rNazWrVCJSTX4FeejvnebFi0KBPnK2XA6f0WBZZ/DBTotk2goHVkggC+STMK
 pleXSdCz9CsF/rR9hQNP59cUKB09RwK/wUcC210LBYK1PgJMDRhJ8LBuBAF9D8tIYBqZo8C5
 1VYUfBO04KDdOoCAiqozBHD//D6Y8zlx4J+qxUCFIQaELlkp8NRzHgfN9wcpYA4cJ8CY6WNQ
 NngC3xYPl6+VUzDg9+Nw+NgKBW2P2nDYb5ijYG3/Lwjs7aoi4aznEglbxj+A8zVjKLzQfhSW
 mUZR2PBvIly2/0bCenMXAidLvdRuvlyUotXk69lNORqdPlW4XwwkIrEMiCRJMpF461sH3pZI
 hVvSUg6yqsOfsdotaVminD9cJuxIA+/zxTPDRAlS90I1wuUwdBLjaCgnqpE1HD7dgTCPLyyg
 0WAj46nx41EdyzzxVJNR6A7CtF259wwiaQlz4/tWIqIF9Hc4Y7MXRiCM7kCZhdBlMhLE0unM
 j6eCYc3h4PRrTInvo4jNo99lZs5PktEH8czg0FUsgnDpbYzdHRex+WFkon6eiOLrmPGmxWd9
 sDBeamnGGhHa8FxkeC5qQ9AuRMDm6/KUeTqJSKfI0+WrlaJsTV4vEt5M3+hjsxU5eycociAo
 B3EgDAcTCngVR81KPu+govALVqvJ1OarWJ0DkYZbH8fi1mdrwqNT6zPFyYlScVKyLFEqS94q
 3MAjp12H+LRSoWdzWfYIq/3/DuVw40pQY0fRrsr4pr6/lqyZt4pj0gqOVRXQn9ze2d/JQ1+/
 VoxImgKpN3JPje1qGlVu31zz3ofrGh0bG4uvE9y9LZtjH1DdK6f3da/OFlt6jLl/O6+adR0L
 Xt9w8zvTuhzNUtlPLeqbih1yuSEpI+PBgdudKcv7NgX0MXpniBdq2a5qPOTmmlwJRX3398hP
 qgp4P2hk9nQoBnuN7nuK38dfVmYNtrfPCFQJk1jGi9WXZy6yt3xZzsonZij31qdPDRXdrYJD
 n+54CXnldDbRuz7Qj7YWupfqgvtny1c2vFG5+6Zg7cUQrPGuTR1IfmR0vTqFyifsvda56z1f
 KoIn9rjE0pNCXJejECdgWp3iP9GWR4W8AwAA
X-CMS-MailID: 20250219140256eucas1p13aa7f19867f88185739552f116ef0fc1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140256eucas1p13aa7f19867f88185739552f116ef0fc1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140256eucas1p13aa7f19867f88185739552f116ef0fc1
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140256eucas1p13aa7f19867f88185739552f116ef0fc1@eucas1p1.samsung.com>
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

Add power domain ID's for the TH1520 SoC power domains.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                   |  1 +
 .../dt-bindings/power/thead,th1520-power.h    | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/power/thead,th1520-power.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ee5a2f6cdee..781129d60349 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20424,6 +20424,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
+F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
 RNBD BLOCK DRIVERS
diff --git a/include/dt-bindings/power/thead,th1520-power.h b/include/dt-bindings/power/thead,th1520-power.h
new file mode 100644
index 000000000000..8395bd1459f3
--- /dev/null
+++ b/include/dt-bindings/power/thead,th1520-power.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#ifndef __DT_BINDINGS_POWER_TH1520_H
+#define __DT_BINDINGS_POWER_TH1520_H
+
+#define TH1520_AUDIO_PD		0
+#define TH1520_VDEC_PD		1
+#define TH1520_NPU_PD		2
+#define TH1520_VENC_PD		3
+#define TH1520_GPU_PD		4
+#define TH1520_DSP0_PD		5
+#define TH1520_DSP1_PD		6
+
+#endif
-- 
2.34.1

