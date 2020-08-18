Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C77024956C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4C56E1B2;
	Wed, 19 Aug 2020 06:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBA389B01
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:55:48 +0000 (UTC)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200818074556epoutp0154a3e005e16629349a9e59b05ff4e76c~sTR2EVuXW1141311413epoutp01H
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:45:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200818074556epoutp0154a3e005e16629349a9e59b05ff4e76c~sTR2EVuXW1141311413epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597736757;
 bh=NYk4vyq4/Af59A9O7MoR71/hiPLvorK8FswSuJrxYj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AjkfkoJuNOTE90C4RP+PWEQApHAmmym/NgxeiJXkE5wXPBAQKz6sH67YU4blpc0lR
 stBa292lreWLA+Ln8I1wSB7AdVxYXo+dRyXeyGq2UsUMxsbN5KDKoWp3FPzo5pJ71/
 aGb/7dhLy88ZWuPBMR3QRzk3lfOGgaJ0SR4pa+n8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20200818074556epcas2p3e533cf487e0aedafeb49bf98bb3f95af~sTR1fFhvt3189631896epcas2p3O;
 Tue, 18 Aug 2020 07:45:56 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.190]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4BW2yq0g06zMqYkw; Tue, 18 Aug
 2020 07:45:55 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 B2.7B.27013.2378B3F5; Tue, 18 Aug 2020 16:45:54 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200818074554epcas2p2702e648ba975ea6fbe33c84396b152a9~sTRz60yJF2912929129epcas2p2P;
 Tue, 18 Aug 2020 07:45:54 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200818074554epsmtrp2a90715301aa5475ea0eb05387cb4b51a~sTRz5weJW3172931729epsmtrp2Y;
 Tue, 18 Aug 2020 07:45:54 +0000 (GMT)
X-AuditID: b6c32a48-d1fff70000006985-f0-5f3b8732f518
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 79.78.08303.2378B3F5; Tue, 18 Aug 2020 16:45:54 +0900 (KST)
Received: from Dabang.dsn.sec.samsung.com (unknown [12.36.155.59]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200818074554epsmtip2c2421d264027b33b380a1078e7784644~sTRzmy3cy2522425224epsmtip2U;
 Tue, 18 Aug 2020 07:45:54 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: sumit.semwal@linaro.org
Subject: [PATCH 3/3] dma-heap: Devicetree binding for chunk heap
Date: Tue, 18 Aug 2020 17:04:15 +0900
Message-Id: <20200818080415.7531-4-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818080415.7531-1-hyesoo.yu@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxze6e29LWrNteg4wh7dZUYhFlqk5YAwcBBzI86RYJzbEruO3hVm
 abu2sMmEuclDKiU8ssEKatkcUh5jIDgG4gRJCgQV5ZG6DRUQkjEBlTEmL9dSzPjv+32/7zvf
 +f1ODhfj53I8uQlqA6NTy1UUsY596ZqPVLgra7dMNPsmmu7O56DS2moCfdXeTaCR7l6AJu+1
 4Ohcxw0c9c9OE2gpuxdH1tMnCTRnGcFQz4IQWS//y0J/9w+zUF9zKYFyfmrE0d3qZzgydw2y
 UPnsNActm9oAymjt4KDuoRkOKrxtIVDJl7kgwoPOuL1E0NVnqwHdl2ti0Zb6JLq+Mpug658U
 cGjjZD+L/mPwMkF3Fi+w6XunbSz69+VRjJ6+MkDQuQ2VgO6xdHBom/1nFj1T/0oM+Z4qNJ6R
 KxidgFHHaRQJamUYFR0ri5RJpCKxUByMgiiBWp7IhFFR+2OEexNUjlVQgmS5KslBxcj1esr/
 jVCdJsnACOI1ekMYxWgVKq1YrPXTyxP1SWqlX5wmMUQsEgVIHMoPVPEFV8O1eRs/W776PfsE
 yFtvBG5cSAbCB8sXWUawjssnmwC8k58NXMUTADMvWVY7MwDWlJ7Cn1tMtYurqmYAax/XEK5i
 DsAm2wLHqSLI7bCzoRw48WbSCxZVVOBOEUZa2XCw0L7ScCcjYPv9h2wj4HLZ5DY4akt1Qh4Z
 DIe+/sIV9irMLxkCTtqNDIFjVcFOmkdugl3fPmA7MeaQnGwswZynQ7LKDbbUtaxeNApW5AwA
 F3aHE7YGjgt7wpmpVsKFP4XX00dwlzkdwFvfDKw2dkHzeNZKMEb6wNpmfyeEpDfs+G01dyM8
 dW2J46J58FQm32X0hr+Wn2W78FY4UpOFuyQ0zJ70dy3KBGBXRhWWBwTmNdOY10xj/j/XArBK
 8CKj1ScqGX2ANnDt89aDlY/hSzeBkslHfu2AxQXtAHIxajPvw84gGZ+nkB9LYXQamS5Jxejb
 gcSx6HzMc0ucxvGz1AaZWBIglYqCJUgiDUCUB28qpPcIn1TKDcxRhtEyuuc+FtfN8wQrIl8+
 cShNYU/2k2YyNcepp4e/i8x522vfeVP0P1l9qj1CJqPI2ndQFX1G1LZ+aNR7UzR2N3Ouqm6n
 8HxverjGOvURMQ/rqi+Is8cvVPi8cC61xdB2J6YTN1jHFjvD8al3cuy4Rf4wsNbQf2yWt4Qd
 5aT88HhCp5p/ahN0vJb15yfvfvzWbpPUGJuRXur1etGPCv/5lNjQA/tv/mKXFbwv9A1IbeR6
 e8zt3R5VtjSbrdySWsNJ9q3bs4Ha4X7r4pD3dW3xjcWgm1X8fQepwjM7hw+VbU0ua7zyqLg1
 5eUjw2Xbij3/SnjWO55WQeyg7CNpn98/EIibm186bB87HslWGns2UGx9vFzsi+n08v8A7LoL
 oKEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Rf1CLcRzHfZ89e/YsNx4z16MusTtilErOlxyO476hi7+cSGY9CtvqtiKc
 XyUlmpQVG1rnRLVTJtplkZVr23XdbOlQ6bc4sqj8OIq2zp3/3vd+ve59n7sPyeJbcR/ygDyZ
 UcjFUiHhhT+qF/oHhmaGxwZnpc2BLttlDrxeoSdgmtlGwB6bHcDBzsdsWNTQzIYtoy4Cjp23
 s2HphXQCftf1sGDTr0BYavqBwZGWbgw6a64T8GLlQzZ8q//DhhprKwZLRl0cOJ7zDMCM2gYO
 tHUMc2C+Q0dA7RkVWOeNMhxjBNLf1APkVOVgSGdIQYay8wQyfM3joOzBFgy1t5oIZLn6C0ed
 Fxox1Dbey0KuJy8JpKoqA6hJ18BBja+qMTRsmLONivZaHcdIDxxmFEvX7PVKyKtbm5Q7LXW8
 7hZ+GuROzQZckqbC6JyK3yAbeJF8ygjojos/8Ekwm9YMW7HJPJPuPNvAnpRGAf210A7cgKAC
 aEtViScLKF+68O5dj8Si6nG6/t4rwg1mUutoc9eniVWSxKn5dG/jCXfkUSvpDvWpyX1/+rK2
 A7hrLrWK7i9f6a75E4bRZPScwKNm0NZrfZ7TWBN6+kMtKxdQmv+Q5j+kA1gZmM0kKWXxMmVI
 UqicORKkFMuUKfL4IEmizAA83xaJjMBUNhRkBhgJzIAmWUIBb59lRSyfFyc+eoxRJMYqUqSM
 0gx8SVzozRvVFO/hU/HiZOYQwyQxin8UI7k+p7FI+8ai2hL1o2W84N5v3WHjY9LjNznbi1cv
 9+2P2NI1EusnjDqm2hHTXCMO97M6mdShrIH+Tcuf3pckcCK/tSnm7uYGU9LsnV/uaKPvH66y
 3k4V7+/DZqkOvkdhi0UVix6MiLCM5JP7vSOW5Duu+aUVHIxOd0yb1Vf90izbOlD5dkqyrTRQ
 ov7JOztw43awZZeDWz03Kr92MOr5gvINn0NKTO/aT62qFmQp1JIrqd51QR9XnJsyvWcJg32o
 ZJoEXSkBgs3lkp3GcP2lQJAnfV1kjMgEP+O+L3SdccllFUPtMSKLITLzg7T7jX+cz4JmuH6t
 0/60a15BZs2yF9qYd9ApxJUJ4hARS6EU/wVwY7QAXAMAAA==
X-CMS-MailID: 20200818074554epcas2p2702e648ba975ea6fbe33c84396b152a9
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200818074554epcas2p2702e648ba975ea6fbe33c84396b152a9
References: <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <CGME20200818074554epcas2p2702e648ba975ea6fbe33c84396b152a9@epcas2p2.samsung.com>
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Hyesoo Yu <hyesoo.yu@samsung.com>, labbott@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, pullip.cho@samsung.com,
 surenb@google.com, iamjoonsoo.kim@lge.com, vbabka@suse.cz,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, afd@ti.com,
 minchan@kernel.org, joaodias@google.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document devicetree binding for chunk heap on dma heap framework

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 .../devicetree/bindings/dma-buf/chunk_heap.yaml    | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml

diff --git a/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml b/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
new file mode 100644
index 0000000..1ee8fad
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma-buf/chunk_heap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device tree binding for chunk heap on DMA HEAP FRAMEWORK
+
+maintainers:
+  - Sumit Semwal <sumit.semwal@linaro.org>
+
+description: |
+  The chunk heap is backed by the Contiguous Memory Allocator (CMA) and
+  allocates the buffers that are made up to a list of fixed size chunks
+  taken from CMA. Chunk sizes are configurated when the heaps are created.
+
+properties:
+  compatible:
+    enum:
+      - dma_heap,chunk
+
+required:
+  - compatible
+  - memory-region
+  - alignment
+
+additionalProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        chunk_memory: chunk_memory {
+            compatible = "shared-dma-pool";
+            reusable;
+            size = <0x10000000>;
+        };
+    };
+
+    chunk_default_heap: chunk_default_heap {
+        compatible = "dma_heap,chunk";
+        memory-region = <&chunk_memory>;
+        alignment = <0x10000>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
