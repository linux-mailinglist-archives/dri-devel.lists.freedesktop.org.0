Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C48A17148
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070AA10E45F;
	Mon, 20 Jan 2025 17:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="s88geY73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708B610E45A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:30 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172129euoutp02a63f4e48b2b57a18db92bcc94f317a2c~cdlrxhMWh1371113711euoutp02e
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250120172129euoutp02a63f4e48b2b57a18db92bcc94f317a2c~cdlrxhMWh1371113711euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393689;
 bh=1Pvy7Fc11yF5OqhQ5Tv7YibvPAx3L5KDY4LRtcrAd4Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s88geY73kz6FEhkdj4JcK6077DcxyzxAFVC/fMaFOAxtmaypgn5XPdz8QV+1X6RQL
 tHx6RfDQ3gxeQpehe15lUSDVmprtnvLmUVjXVGsd5KLweOxt5dzyeMSU+NcnkS0Kh4
 kREBQFnuTMo1AxjcoU26wY1jq/cS9rQE5j9E/AJw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250120172128eucas1p16cc46bf76c028b22b19a60ee8c4dfe59~cdlrfDmB01582415824eucas1p1J;
 Mon, 20 Jan 2025 17:21:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 45.76.20409.8168E876; Mon, 20
 Jan 2025 17:21:28 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298~cdlrFhs401089210892eucas1p2z;
 Mon, 20 Jan 2025 17:21:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172128eusmtrp227c2829d23ce8085af7f3b304dd8c2fd~cdlrEy_Ed0490804908eusmtrp2q;
 Mon, 20 Jan 2025 17:21:28 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-c9-678e8618d3cf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.95.19654.8168E876; Mon, 20
 Jan 2025 17:21:28 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172127eusmtip12d16271963874bf8d815bfd45018253b~cdlpwzuZb1346113461eusmtip1J;
 Mon, 20 Jan 2025 17:21:27 +0000 (GMT)
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
Subject: [RFC v3 07/18] dt-bindings: reset: Add T-HEAD TH1520 SoC Reset
 Controller
Date: Mon, 20 Jan 2025 18:21:00 +0100
Message-Id: <20250120172111.3492708-8-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxjG+c45PefQrHooLHxhC7p62RQFdP7xjZEJCbIvMZjpbmQXXTdO
 ipGLtsI2XKZcg67cGt1G6SgwNgiChK603AoZt4JoM2FCTQBxlkAbNixUmTJglNbN/57nfX/v
 97xv8rGkuIUOYk+mnOXlKdIkCS2kDP2PLXthXqEs3DmzDw2MVRGoeVnNoHqThUDaXosATQ7r
 CfT7w3kaXZv+jUGzpkwKjdb+wKDs/kYa2dWTNHIqJwVopE1Do8WCXoAMizk0auidYFDjQy2B
 Kp3NFKpuaQMo7+LPAnTr+iE0MTlAIfuIkkR56s1oraOFQaujTRQq+6uLQfq5EgEyN7yPcrou
 U1HBeN6ay+A5u53CPfkuBpseVVC4VT3BYGXrDYB1dRdpPD7aQePywaP47jdmAv9SfR7nNPQT
 uGglHM933qZxob4O4OHsMeYt8QfCyAQ+6WQ6Lw974xNh4g29DZzWib8orZ4mLwDV5kvAl4Xc
 AXjLoaYuASEr5moBLOpTCzzGBWDbioHwmEUAzaofBU9Hlm0mL1UD4EybkfaYOQC/z1ncoGhu
 P5yq0W5QAVwuBXP7MoHbkNwMgAabhnZT/tw7UDPwZENT3A54daEduLWIOwjrm43evC2w69eb
 pFv7clFw6baJ8TB+cLDURrk1uc5kN5eR7gDINQmhfbac8AzHwPb2Iu9D/tBh1jMe/SJca9V6
 mVQ41bxAevRXsFVp9urX4bjFvRy7HrALNraFecrRsFN/hXGXIbcJWv/086ywCaoM35Gesgjm
 54k99E54RVnwX6il1uANxTBfZyWKwUvqZ45RP3OM+v/cCkDWgUA+TZEs4xX7U/jPQxXSZEVa
 iiz0s9RkHVj/3EOrZlcLqHE4Q7sBwYJuAFlSEiB6/oFSJhYlSL/M4OWpJ+RpSbyiG7zAUpJA
 UVVXrkzMyaRn+VM8f5qXP+0SrG/QBSLyVewIDS8s5rRr8RX32/fuCJEUyaI/ZI7s0QQtiXz7
 sDVEkFJes8uY8+A5+Icg2Hqk0TVVnq5la2J1nOrlEv+l1Ujh4EfndmYGflqiGlaP2c+EaXoe
 rbw5dC+E0Z6fKdk+YvTriYs/FX9iOCvBaOWTsoLj3o0NvVfoU5x+/agjC9//qWko05ZxtaRg
 +K7k8DmbD/vP9PGvDy0e3hpjqQsMSSLTIgocsY+3VB6LHhj59ljQa5Wu9Fc6th9ciDuePVuf
 +MRnt2+0qytvLvZamWbbe86qO4bxjIhSU5o///EZ4zbsn3En2OeAqfBvNmBGvAx6dBFRN8Hb
 uk5uK3bG7AmUUIpE6b7dpFwh/RcLWxw0SwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7oSbX3pBgceiFqcuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLOLPlCWPBJqGKmUueMjcwTuLvYuTkkBAwkfj9ZC9rFyMXh5DAUkaJM3/6
 mCASMhLXul+yQNjCEn+udbFBFL1ilHjVOIsVJMEmYCTxYPl8MFtEYDGLxN59lSBFzAJvGSWu
 z9wI1i0sECRx6eohZhCbRUBVYvWn3YwgNq+AvcSardtZITbIS+w/eBashlPAQeL71b3sILYQ
 UM2dq91Q9YISJ2c+AZvJDFTfvHU28wRGgVlIUrOQpBYwMq1iFEktLc5Nzy020itOzC0uzUvX
 S87P3cQITDDbjv3csoNx5auPeocYmTgYDzFKcDArifCKfuhJF+JNSaysSi3Kjy8qzUktPsRo
 CnT3RGYp0eR8YIrLK4k3NDMwNTQxszQwtTQzVhLnZbtyPk1IID2xJDU7NbUgtQimj4mDU6qB
 qSrwJSvr9bcV5iHBtiy7/KdmrTMTfL8l/7t64Naa5bsdLpg/eeXGEdD6d4GVWuac6xciH+80
 Nnt3w5ijuVTtT1b4vo6d/2I4kr/xXja6ULerZnFB+AS3NQUXd6+aeZfpp6+6qdECa/WJO54p
 b17LeD3OKqD+YmPb816eKuv5ibJ8e1j3d26f63z75uenf488+vxBUOCkUMRxtWVxO9hWHprh
 xFC2PSNIPEPuyyu7V685jrZeeO9wOrJSbf/yGH+93GCPxVM+unyUTy379WQz6/U7MxjEqvJf
 vFARtA9gD312rU5glcIXHsWIH6d0Z9rdWj1v3qYL68qMWX10Njhf2f7aaNaUFSyZpiEHRE/P
 OqDEUpyRaKjFXFScCADlvV6auQMAAA==
X-CMS-MailID: 20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172128eucas1p2847f0863524b53d2d5029e5e9d238298@eucas1p2.samsung.com>
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

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
new file mode 100644
index 000000000000..c15a80e00935
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
+    const: 0
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
+        #reset-cells = <0>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 363bb3471a33..1b6e894500ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20189,6 +20189,7 @@ F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
+F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	drivers/firmware/thead,th1520-aon.c
-- 
2.34.1

