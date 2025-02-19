Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67BA3C10D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D36510E811;
	Wed, 19 Feb 2025 14:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="dQdNq5qW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEAB10E810
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:06 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140305euoutp02eadb96d6e8254b8c8c2f958f9b47d98f~loPBtq8v70214002140euoutp02C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250219140305euoutp02eadb96d6e8254b8c8c2f958f9b47d98f~loPBtq8v70214002140euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973785;
 bh=jVZ5nqMUcHkMSF5q4NF0ZDob3npe9EZcPVY0lveTg7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dQdNq5qWXD3Pig9+lTsp9zIcD8p4n72MXNj/yrdRENTbGOI3gICS7Rmiy2Qto40SR
 acKC+CALP/sR2ysu8/aRUlnMM0TCR1MLgpSZ8QY+n0uTwaNxIWEAAURMYDKtPk/hp9
 BX/2bwQ3RpJTVhpf4L97GlYsXknOpHya9Oty0sxo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140305eucas1p118dc8585d4ddf57e3461001bc604a7a0~loPBPJ6An2176121761eucas1p1M;
 Wed, 19 Feb 2025 14:03:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AC.82.20397.894E5B76; Wed, 19
 Feb 2025 14:03:04 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140304eucas1p21c5e28e2497bb4046f8f2a26b4f47299~loPAjzIwm2649626496eucas1p2r;
 Wed, 19 Feb 2025 14:03:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250219140304eusmtrp22e370d543a3e71c0292a5ee9e7b0d942~loPAi49zj2432224322eusmtrp27;
 Wed, 19 Feb 2025 14:03:04 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-ef-67b5e4982ef6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6C.52.19654.894E5B76; Wed, 19
 Feb 2025 14:03:04 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140302eusmtip2e962ec567b6034bccede56df87c3fc28~loO-J8neI0723207232eusmtip2C;
 Wed, 19 Feb 2025 14:03:02 +0000 (GMT)
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
Subject: [PATCH v5 11/21] dt-bindings: reset: Add T-HEAD TH1520 SoC Reset
 Controller
Date: Wed, 19 Feb 2025 15:02:29 +0100
Message-Id: <20250219140239.1378758-12-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTGfe+9vbfUFK+Fre8YxKzZyIYZIM7wLhiGcS7XGceITg1bsjVy
 V2G0kFYYQzMkbQmyikAojPpRMCgfE4is7VoUKlBAnHQC2rIECnOC8jEYK7ioTEa5uPnf75zz
 nPOckxw+LrpKBvGTFUdZpUKaKiEFhKX7sfPt7++bZZGjpnfRDfcFDJmfGih0udWJIaPDyUOe
 AROG7izOkahx/DaFHrbmEshVe45C6u4mEk0aPCRqnTZTaF7n4aHBlrMk8p5yAGTxakjU4Bih
 UNOiEUNV82YCVVtbAMo7eYmH+m/uQiOeGwSaHNThKM+wAS1fs1LomesKgc7M2ilkminmoZ6G
 g0hjLyXiNjFzQ1qKmZmcJJjO/AWKaX1USTA2wwjF6Gy3ANNcf5Jkhl3XSOZ8bwIz+l0PxvxY
 ncNoGrox5vQ/kcxc212SKTTVA2ZA7aY+FiUKtiexqcmZrDIi9gvBEU2FE083Bme1dRnACTAt
 LgB+fEi/A0uuu7ECIOCL6FoAGwcu4lywAKC2qhNwgRfApvJ26nnL7JKd4Ao1AP5qGOVxwQyA
 nrp7wKci6Sg4VmNcLQTSWgJqu3JXZ+G0EYM/PKnAfaoA+gCc/m1qlQn6DWgrLsV8LKTjoE2v
 5XF+m6C9vW9Fw+f7reTb+oM4yUbYW3Gf8DG+IlGbz6wuDulWASwqPg243vdh2T3H2t4BcKrH
 tMbBcNlmxDhOg2Pmv3COj0ObrmeNY+Cw8wnp88Xpt2BTS4QPIb0DDnZmc+gPh/7YyG3gD0ss
 5TiXFsL8PBE3IxTqdaf+83TWWtY8GVjdb8GKwGuGF24xvHCL4X/bSoDXAzGboZLLWNVWBft1
 uEoqV2UoZOGH0+TNYOW/f37Ws2gFtVPz4R0A44MOAPm4JFCYl2OSiYRJ0m+yWWXa58qMVFbV
 AV7lExKx8IJdKxPRMulR9iuWTWeVz6sY3y/oBLYzpzE/QxMZH1vXoOiXZelLtlLJihBL5aGx
 K/7Hr+4nRTW8pD0/obDpcwm3ipbMdTyz+HGQI6SrcOgY9qXk9rhqXWL/76kv7XqUzpsRpeSq
 sg26vzc3D+ucCnHo7vY+TPtnlef8dLtVHf7yrONy+N6AMu02eYxVlMZ69xfc1Q+H7Mjcpl4/
 GP1K/HX1xHuHOg9j7aGu9JRPha7y0Qmj3PHmwcKFxAiFMkZycyJHHf3BwCc7H3Q+yGXDita9
 nuW3ITDa7c78pdQTtXxsX1vKZ3FLces/DNo3sqdxt6Aq6tstZ9PityfEfvQQ0++dy43ZfCBs
 Irj06XiZ+06fXNW7jLoJr4RQHZFuCcOVKum/3Rpjmk4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsVy+t/xe7oznmxNN1i6jNPixPVFTBZbf89i
 t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZrH39VZ2
 i48991gtLu+aw2bxufcIo8W2zy1sFmuP3GW3WP91PpPFwo9bWSyW7NjFaNHWuYzV4uIpV4u7
 906wWLy83MNs0TaL3+L/nh3sFv+ubWSxmP1uP7vFljcTWS2Orw23aNk/hcVB3uP9jVZ2jzcv
 X7J4HO74wu6x99sCFo+ds+6ye/TsPMPosWlVJ5vHnWt72DzmnQz0uN99nMlj85J6j5a1x5g8
 +v8aeLzfd5XNo2/LKkaPS83X2QOEovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
 jEyV9O1sUlJzMstSi/TtEvQyWmaeYy6YL1Ox7+gsxgbG1+JdjJwcEgImEu/+7GfpYuTiEBJY
 yijxf8kuRoiEjMS17pcsELawxJ9rXWwQRa8YJZpPHWMHSbAJGEk8WD6fFcQWEVjMIrF3XyVI
 EbPAUiaJR/8PsIEkhAVCJH4v+80EYrMIqErsnDgFzOYVcJDYObWVFWKDvMT+g2eZuxg5ODiB
 4vsuSoGEhQTsJc713WeFKBeUODnzCdhBzEDlzVtnM09gFJiFJDULSWoBI9MqRpHU0uLc9Nxi
 I73ixNzi0rx0veT83E2MwESz7djPLTsYV776qHeIkYmD8RCjBAezkghvW/2WdCHelMTKqtSi
 /Pii0pzU4kOMpkBnT2SWEk3OB6a6vJJ4QzMDU0MTM0sDU0szYyVxXrYr59OEBNITS1KzU1ML
 Uotg+pg4OKUamAKbzixZKvxM2WMTz+KjNdabi+dqevSc+XVyxnyn/nntbx2fNVdLH7/Ke1Fn
 ZuJE+xPnJ0681tZ5dcnqSK41oSaiBeaiTI1/CmxlSszap9UcYtCtlluyKPJ/e4rq3Vc/FnN3
 dQZsLemXZX40N+L3BtU9G/cJ6+5ZKfmx1aZ75a68SYo5P57HO2Vt6w+7uYKZzfJhXL3W5KNB
 nDtXv4h0LzvyfT3PhHtzSjgUaryUOC5smDR7wsyY2Zn6XnfdV4d/4+iLvHT70MX0S6f+Pmm4
 yCO9e6IR88oPJw03tcls2rJH+/WOBcfWl0ru1oyyVBd49Y57/3PhOdp3Tt400/kz6/1CRY3+
 6+87v2VvyKsQiX2hxFKckWioxVxUnAgAaSaPlr0DAAA=
X-CMS-MailID: 20250219140304eucas1p21c5e28e2497bb4046f8f2a26b4f47299
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140304eucas1p21c5e28e2497bb4046f8f2a26b4f47299
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140304eucas1p21c5e28e2497bb4046f8f2a26b4f47299
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140304eucas1p21c5e28e2497bb4046f8f2a26b4f47299@eucas1p2.samsung.com>
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

Add a YAML schema for the T-HEAD TH1520 SoC reset controller. This
controller manages resets for subsystems such as the GPU within the
TH1520 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 .../dt-bindings/reset/thead,th1520-reset.h    | 16 +++++++
 3 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h

diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
new file mode 100644
index 000000000000..f2e91d0add7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/thead,th1520-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 SoC Reset Controller
+
+description:
+  The T-HEAD TH1520 reset controller is a hardware block that asserts/deasserts
+  resets for SoC subsystems.
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+properties:
+  compatible:
+    enum:
+      - thead,th1520-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      rst: reset-controller@ffef528000 {
+        compatible = "thead,th1520-reset";
+        reg = <0xff 0xef528000 0x0 0x1000>;
+        #reset-cells = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 18f0eb293519..819686e98214 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20417,6 +20417,7 @@ F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
+F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	drivers/firmware/thead,th1520-aon.c
@@ -20426,6 +20427,7 @@ F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/power/thead,th1520-power.h
+F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
 RNBD BLOCK DRIVERS
diff --git a/include/dt-bindings/reset/thead,th1520-reset.h b/include/dt-bindings/reset/thead,th1520-reset.h
new file mode 100644
index 000000000000..00459f160489
--- /dev/null
+++ b/include/dt-bindings/reset/thead,th1520-reset.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#ifndef _DT_BINDINGS_TH1520_RESET_H
+#define _DT_BINDINGS_TH1520_RESET_H
+
+#define TH1520_RESET_ID_GPU		0
+#define TH1520_RESET_ID_GPU_CLKGEN	1
+#define TH1520_RESET_ID_NPU		2
+#define TH1520_RESET_ID_WDT0		3
+#define TH1520_RESET_ID_WDT1		4
+
+#endif /* _DT_BINDINGS_TH1520_RESET_H */
-- 
2.34.1

