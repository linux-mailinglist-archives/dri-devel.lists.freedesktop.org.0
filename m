Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B96A3C107
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EFC10E81A;
	Wed, 19 Feb 2025 14:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="rVak43kg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0802F10E490
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140254euoutp019cfd7ec1f92a5967c6d5aee67d972a97~loO3Z5V2k1473814738euoutp01J
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140254euoutp019cfd7ec1f92a5967c6d5aee67d972a97~loO3Z5V2k1473814738euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973774;
 bh=OXM2fKf2SgZdL8QFvjqFSeOIgpJMN90LmI9jfn1I+iM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rVak43kgdpgeGgYn7Gyn3xI7Fxbne7mQmpGlZ/D/sQdQ9XQelG4dP92cYoaIms0XR
 fot2uKKW9OamG9/pw9Vg8Oci8cfu0U56oujH9FISxVJogD2nUNLeR69wGS5NwzjHiF
 V9POx1mX7Sw2ajgxTfsLSbGJ7yMLXS7OXsU1a5RE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140254eucas1p12cdefcfd2b54f41f82a29f950bb85c47~loO2-Dm-K1247112471eucas1p1y;
 Wed, 19 Feb 2025 14:02:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5E.F0.20409.D84E5B76; Wed, 19
 Feb 2025 14:02:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140253eucas1p2a137df988b89e84b7e52c45521b5bb06~loO2bY-jr1561415614eucas1p2K;
 Wed, 19 Feb 2025 14:02:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140253eusmtrp1c0237ed2985c6b30ee5cdc9466f7ae31~loO2acM2c2416524165eusmtrp1Q;
 Wed, 19 Feb 2025 14:02:53 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-ec-67b5e48d21d1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 07.76.19920.D84E5B76; Wed, 19
 Feb 2025 14:02:53 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140251eusmtip2b10afb40cdb62706fd5ad2842d00f208~loO1GcWVN0084500845eusmtip2i;
 Wed, 19 Feb 2025 14:02:51 +0000 (GMT)
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
Subject: [PATCH v5 03/21] dt-bindings: firmware: thead,th1520: Add support
 for firmware node
Date: Wed, 19 Feb 2025 15:02:21 +0100
Message-Id: <20250219140239.1378758-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxiHc+69vbfUFK6FyQlbQkTATB0C44/jdM4t4O4ShW0mMzHBrepd
 dYMivcXJZvhIy5eUTdRJrFU+JJaPUTb6IVSQCUhlOJCClBmoDnBSxobQ6gZOHOXi5n/POe9z
 fu95T44Ql1jJIOEhuZJVyKVJIaSIsHTO9b5WNG6WRRonNqEbjgoMmZ9oKfRdSw+GSjt6BMhp
 N2Fo4NE0iQz3b1FooiWbQINV5ymk6qwnkUvrJFHL72YKzWicAtRv1ZHIXdQBkMWtJlFdxwiF
 6h+VYqh8xkygykYrQLkFlwSo76c4NOK8QSBXvwZHuVo/9Ky5kUILgz8Q6NyfrRQyTRULkK1u
 N1K3nia2BTPTQzkUM+VyEUx7vodiWh6XEUyTdoRiNE03AdNQU0Ayw4PNJHOh6wPmbqENY4yV
 mYy6rhNjvnkayUxfvU0yX5tqAGNXOaj3JXtEWw6wSYeOsIqNWz8RHcyfGCUO1wQetVc/w7NA
 pf9x4COEdAy8NFoMvCyhqwAsGMOOA9EiewAczRsA/MIN4JXJEez5iQnLRYov6AEszJldtqYA
 dI2dEngtko6G9/SlAm8hgM4hYM717CULp0sxWDt/Fvda/vReeH5YT3iZoMPgnXzVEovpt2B1
 fxfJ9wuGrdd+XvSFQh96G7zaF8QrK2HX2fElHV9UVOZzuDcf0mYRXOj+kfD6kI6Fxmtr+Bh/
 OGkzUTy/ArtPaQieU+A98yzO8zHYpLEt82Y43DNPemNw+lVYb93Ib78Nu/RTy+m+cOiPlfwN
 fOFJSwnOb4thfq6Et8Pht5qi/5r2VFmW35CB1vIS4gRYrX1hFu0Ls2j/71sG8BoQyKZxyTKW
 i5azX0Rw0mQuTS6L2J+S3AAWv3f3gs3TCPSTMxFtABOCNgCFeEiAODfTJJOID0jTv2QVKR8r
 0pJYrg28LCRCAsUVrTkyCS2TKtnPWfYwq3hexYQ+QVlY/YORUFQRadE5QtV/Ky+knVgROmeV
 Ns/tCnqvVu2RxoW/kep46K882eDzPdPv/sxp5/bm7fPJY2uNVnHG6cfFhrCCieu+s8PgyJhH
 +vo49asuyRPDNd3/aOquLn5LrMHQsr28b6E0eE/XpsqtqRtekicMUO+U7AyXs5tXpK4v0+17
 uOaXW1zWb+lqv6iIMDtLCUi7X9vlgL82ZHz65JjK3rw+L+aMa21KQOjQTfrDwvaShDtPrzx4
 M9UQJVpl7FW8206vk1dq/ZVNhpnL6fFrq+2ZcQs7YjO6ezoHHL417gQ1p9/5z+74VWeMRYm3
 9/cenU8zfRWaHT2YuH11+zCxIzGE4A5Ko9bhCk76L9xBYBtNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUwTdxjH87u73l01yNmi3OoStur+WWahvP5YkJEssktWki06CGxOGz0K
 jlJzbYkSDW7UroVacDMjXBVwVKaNaBSKFSwMRLC+gFCHo5HWOVxoZ4YIGMm2skKzxP+ePJ/P
 8/LHl0RFDoGELC3XsVy5skyKr8HuhIf9W49PO1VJ9YNx8NbDHxHo/Jsn4AX3CAKbB0cE0D/e
 icAHi7M4vPj0PgFn3F9jcOLcaQJWD13CYZD349D9p5OAcxa/AHq7T+Fw/vgggF3zBhy2D04R
 8NJiMwLPzDkxaHd1A2g0twng2O3tcMp/C4NBrwWFRj4WLl93ETA8cRmDtr/6CNj57IQADrcX
 QEPfSSwngZn99RjBPAsGMeaGaYFg3C9bMOYaP0Uwlmt3AXPFYcaZRxPXcabJ8ykTqB1GmA57
 FWNoH0KYun+TmNneX3DG2ukAzHj1Q+ITUZEsi9PodexbJRqtbpv0czlMlskzoSw5NVMmT8nY
 9X5ymjQxO2sfW1ZawXKJ2XtkJaaZJ9gBR/zB8fPL6FFgF9cAIUlTqfRMVytRA9aQIuosoE1W
 KxoFb9ITtUEsWovpfyZq8KgUAvRTY5tgBeBUMv34p+bVOo5qxWh376EVCaXOIvST5Z/xFSCm
 vqBrTZZVCaPeoX2m6tWtMdQH9HmvB49eSKD7+u9FLpOkkMqhe8ckK21RRBmxBgRRfT3taZxe
 HUUjerXThtYDin8N8a+hFoA4QByr16pVaq1cplWqtfpylWyvRn0FRELTNbTU4QJNoTnZAEBI
 MABoEpXGxRirOlWimH3KQ5Usp9nN6ctY7QBIi7x9ApVs2KuJpK5ct1uenpQmT03PTErLTE+R
 xsfkekeLRZRKqWO/YtkDLPf/HEIKJUcRkIufPilVB9ZOZnP3vhcezLFnGYt31KTG5m4cPbwQ
 Fj8QxH5IWoNzChf9eIs/mK/Lw3f+3jFpqj+X/94ZxZGK58X8R8degUa48F2xz7K+4dvJHWX2
 utthX1eCmEtpp/JKf+hYuC8MLnkUr/gNoYqrlacSfaJtDYXmeKteodgk6f4y11F09076i7qd
 Hz/aL3f1b33e4zWGQoU3RWut3vpwv7Jte+umaXNG403+8sseR5Ws7+3Ghjc83NLhxT12yR8X
 s22B4YKeShKG8r/ZWLCuJS8UP780GvjM15ShQgqdF4K7XvSPFYlv2PJ+22yw7d9sazPbUsJ1
 M4arR/h1W6SYtkQpfxfltMr/AAD2YAy9AwAA
X-CMS-MailID: 20250219140253eucas1p2a137df988b89e84b7e52c45521b5bb06
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140253eucas1p2a137df988b89e84b7e52c45521b5bb06
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140253eucas1p2a137df988b89e84b7e52c45521b5bb06
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140253eucas1p2a137df988b89e84b7e52c45521b5bb06@eucas1p2.samsung.com>
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

The kernel communicates with the E902 core through the mailbox
transport using AON firmware protocol. Add dt-bindings to document it
the dt node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/firmware/thead,th1520-aon.yaml   | 53 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml

diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
new file mode 100644
index 000000000000..bbc183200400
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/thead,th1520-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 AON (Always-On) Firmware
+
+description: |
+  The Always-On (AON) subsystem in the TH1520 SoC is responsible for managing
+  low-power states, system wakeup events, and power management tasks. It is
+  designed to operate independently in a dedicated power domain, allowing it to
+  remain functional even during the SoC's deep sleep states.
+
+  At the heart of the AON subsystem is the E902, a low-power core that executes
+  firmware responsible for coordinating tasks such as power domain control,
+  clock management, and system wakeup signaling. Communication between the main
+  SoC and the AON subsystem is handled through a mailbox interface, which
+  enables message-based interactions with the AON firmware.
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+properties:
+  compatible:
+    const: thead,th1520-aon
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    items:
+      - const: aon
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    aon: aon {
+        compatible = "thead,th1520-aon";
+        mboxes = <&mbox_910t 1>;
+        mbox-names = "aon";
+        #power-domain-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..0934f9791fe9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20413,6 +20413,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
-- 
2.34.1

