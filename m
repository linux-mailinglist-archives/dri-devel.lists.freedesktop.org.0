Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1FAA21273
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120AA10E6FC;
	Tue, 28 Jan 2025 19:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ZEEnRZqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4375A10E701
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194842euoutp024bb4d96662ea460c71caf9b67019d9b8~e8whA1-gy0773407734euoutp02M
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194842euoutp024bb4d96662ea460c71caf9b67019d9b8~e8whA1-gy0773407734euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093723;
 bh=6Q/QNlMCTriCvzeA7Mje8ZR0ApP00xbkr1cn0iGDJwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZEEnRZqm4uUFI1eqZmiVnIlqGNdFFQMHkIHB5dGQ9066+rowIkyrgLjEJRUROltIg
 4GbSeBRcD3EtEMQBfviMBJ9snAYYPkC6NSs0q53tdaD6/Jxs9IBoev3Yfh15o5FhvE
 h3Kr8/wez9n8FpKhHrpvm4oxSGr6GN1jqaKRZv4A=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194842eucas1p1635d9790d5197098fd2453f0c58cd65a~e8wgREm-Z1601116011eucas1p1z;
 Tue, 28 Jan 2025 19:48:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8B.B2.20409.99439976; Tue, 28
 Jan 2025 19:48:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25~e8wfQcIKM2013920139eucas1p2E;
 Tue, 28 Jan 2025 19:48:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194841eusmtrp2e5b356232f2d0c38d2b88856dfdb68e9~e8wfPr2Hp3008430084eusmtrp2i;
 Tue, 28 Jan 2025 19:48:41 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-1b-67993499002a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D9.BB.19654.89439976; Tue, 28
 Jan 2025 19:48:40 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194839eusmtip19d20134cba5b6585a804d844d29d5558~e8wd3qGat0756107561eusmtip1R;
 Tue, 28 Jan 2025 19:48:39 +0000 (GMT)
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
Subject: [PATCH v4 12/18] dt-bindings: gpu: Add support for T-HEAD TH1520 GPU
Date: Tue, 28 Jan 2025 20:48:10 +0100
Message-Id: <20250128194816.2185326-13-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRy+7/u+vO9YjV4GJ9+wrOiSgysg1PPbWVM6617zzLrKLo2Lnbw3
 yMFgAwnLS9tGohMMNGGMjYyTuZozYotxDE4E5g8cPzR+lCMkiYHYjp+CBDT2Yvnf83ye5/M8
 38/dl4cLrWQ4LzU9i5Wni6URJJ+wtc61v6RdXyqJ83yPocs9ZzBknddS6EeHC0OGZlcA6u+q
 wdDNaS+Jzg91UMjjOEygbmM5hZStFhKNaPtJNK7pD0A36nQkmjzeDJBtUkUic7ObQpZpA4a+
 G7cSqLK2DqC8/LMBqPPqG8jdf5lAIzc0OMrTPoGW6msptNj9E4HK/m6kUM3YNwHIaf4QqRpP
 ElvWMN5eNcWMjYwQzKUjUxTjmKkgGLvWTTEaextgqk35JHOru55k9FfeZf445sSYnyu/ZFTm
 VowpXIhjvA2/kkxBjQkwXcoe6h3hbv6ryaw0dT8rjxUl8VPydbKMypDPfimKOgR0QUdBIA/S
 62F9kRI/Cvg8IW0EsK3jGsaRKQAHO28SHJkEsGDMRTxcOXW1neSEKgBd160BHBkDsK9wGF92
 kXQ8HKgy+IVQWk1AdcthsExwehhA2x0duewKoXfCKb2DWsYE/QKcKb/g7xDQW6DRU0xxfc/A
 xovX/amBvnn1gnHFEwyvlN7xY9znUVrL/GdA2syHxQ+MvmWej2yFHZZ9XE4IHHXWrGQ+BZfs
 BozDMjhgncA5/AW0a5wreBO85XpALsfgdBS01MVy4wR48VgfwaUHwd57wdwLgmCR7TTOjQXw
 SJ6Qc6+FpzTH/yt1GW0rpQzsuz9HnADPaR+5RfvILdr/eysAbgJhbLYiTcIq4tPZnBiFOE2R
 nS6J2StLqwa+n31t0TlVC6pGx2OaAMYDTQDy8IhQQaKrRCIUJItzD7By2SfybCmraAKreURE
 mOBMo1oipCXiLHYfy2aw8ocqxgsMP4R9fPotZ/LGnlfYnTmFia97og+W8vNyxEkJzW9nLdxP
 Ek58TrUHK5fiz7aofjhguhDZ6zCtXhs/qJeKpiMn5tybvx4UdIp26GfVCfzfZW5Frid4+PYu
 yrAxbevsn5tEe+9lvLctVbNrsKNB9Fvzs9/Gecx2CeqMKikKmX1NoXfmDO2hVmVLu4rnw9YV
 EPslkYHm7aJh77nzmdufzggaBfyh8KnFNysea4qiY/vOvfjRuuilwsT6tMEK9eb3Z/7KlOw+
 2Mb2ZkqsGzDLPx+0PP/kfKRZ/ZW05NK2enW5TnY3ZUNuS9kOE1tu7F91smfgU5f37rTy8VBV
 6qyhDKwplO5pUN2OIBQp4pejcblC/C/4WXvaSAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xu7ozTGamG2zdbm1x4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEvo3NOfsES4YrtkzQbGOfwdTFyckgImEhMPXWerYuRi0NIYCmjxP9p35gh
 EjIS17pfskDYwhJ/rnVBFb1ilPjx+AhYgk3ASOLB8vmsILaIwGIWib37KkGKmAXeMkpcn7kR
 qIiDQ1jAV+LaHzGQGhYBVYlvczeA9fIKOEiseDGZHWKBvMT+g2fBFnMCxTf9XQFWIyRgL/Ho
 7Qw2iHpBiZMzn4DFmYHqm7fOZp7AKDALSWoWktQCRqZVjCKppcW56bnFRnrFibnFpXnpesn5
 uZsYgall27GfW3Ywrnz1Ue8QIxMH4yFGCQ5mJRHe2HMz0oV4UxIrq1KL8uOLSnNSiw8xmgLd
 PZFZSjQ5H5jc8kriDc0MTA1NzCwNTC3NjJXEedmunE8TEkhPLEnNTk0tSC2C6WPi4JRqYJLS
 XCL8oe9BY2S8aOCdDBnuyQK3GBQuV9+z/2m1+eyG3bd2+q84NCvwi+7FO9b6t7sTXjNOd9E0
 cOeaMeUR71sVu2D37w3THvXM9vqfyrYv4aXzk96yfL9PHBuqSoNW7zFcxpD0Vjhv56mz/LbR
 YRxW9nfNv/YfOaUp1rT98tMgnp9MElL/9y2M9nqck6XXP7d1bsz+7ytX+7w4vZVhJf/FSx/S
 ZLRv2Knse/u872dAgXnG89Ur+CYx7lldtlSbLZbZR91p/eIFrhwc/xcpPLii37Fo/wK2uVsv
 SKxWEN2X1BB74q3x7dDtKSsmNM2IbP3/zCmA7e3l0OxJt6T6Z771tDvbNUWvbNOSXSvCav8r
 sRRnJBpqMRcVJwIABgSGkLYDAAA=
X-CMS-MailID: 20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194841eucas1p29048dc05a26475d8323a7a318a8c7a25@eucas1p2.samsung.com>
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

Add bindings for the PowerVR BXM-4-64 GPU integrated in the T-HEAD
TH1520 SoC.  This GPU requires two clocks.

Document the integration details including clock, reset, power domain
and interrupt assignments. Add a dt-bindings example showing the proper
usage of the compatible string "thead,th1520-gpu" along with
"img,img-bxm".

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 39 +++++++++++++++++--
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index bb607d4b1e07..b0d9635704d8 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -12,10 +12,15 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - ti,am62-gpu
-      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+    oneOf:
+      - items:
+          - enum:
+              - ti,am62-gpu
+          - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+      - items:
+          - enum:
+              - thead,th1520-gpu
+          - const: img,img-bxm
 
   reg:
     maxItems: 1
@@ -60,6 +65,17 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-gpu
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -74,3 +90,18 @@ examples:
         interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
     };
+
+    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+    #include <dt-bindings/power/thead,th1520-power.h>
+    #include <dt-bindings/reset/thead,th1520-reset.h>
+
+    gpu: gpu@fff0000 {
+        compatible = "thead,th1520-gpu", "img,img-bxm";
+        reg = <0xfff0000 0x1000>;
+        interrupt-parent = <&plic>;
+        interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk CLK_GPU_CORE>, <&clk CLK_GPU_CFG_ACLK>;
+        clock-names = "core", "mem";
+        power-domains = <&pd TH1520_GPU_PD>;
+        resets = <&rst TH1520_RESET_ID_GPU>;
+    };
-- 
2.34.1

