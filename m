Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8B7A3C118
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB5610E80F;
	Wed, 19 Feb 2025 14:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="DQeWsjcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B652C10E80F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:12 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140311euoutp01b5eae7bcdc5e38878d1d4e7b3625ab3e~loPHPPToS1495814958euoutp01N
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140311euoutp01b5eae7bcdc5e38878d1d4e7b3625ab3e~loPHPPToS1495814958euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973791;
 bh=zVWGqQ/Us1vb0L8Nqr12EBbUqYTxiCOVfIHvuCCwVWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DQeWsjcWA08NQSnTBqt/mk3Zq9olNA2lwhHqZOtOCPQI1F0hjgUIomY68T2XeFPPG
 bJ6GcvJ23zV0X0f1WxiUcKPVDgJiV/wEI7et6Nm14LMrar0Rf7fM837vjUCeDQVlYc
 CuWtF3fmjXeTGe2RLsEUdcJQHtnC9qJjyDUW0vik=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140311eucas1p19bf166de2cd9bd9e8b60f2e0ce183b2b~loPG1ENL02256322563eucas1p1e;
 Wed, 19 Feb 2025 14:03:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FC.83.20821.E94E5B76; Wed, 19
 Feb 2025 14:03:10 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250219140310eucas1p1297441a3da276569cd86b6b9e4544242~loPGaVxzP1847218472eucas1p1l;
 Wed, 19 Feb 2025 14:03:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250219140310eusmtrp23afeb1a6ee652e5aeb4a79ce933a20fb~loPGZjLys2432224322eusmtrp2S;
 Wed, 19 Feb 2025 14:03:10 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-6d-67b5e49eb9f3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 02.62.19654.E94E5B76; Wed, 19
 Feb 2025 14:03:10 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140309eusmtip251472ade004dd5be738468c1ae6e60fb~loPFJXPpw0723207232eusmtip2I;
 Wed, 19 Feb 2025 14:03:09 +0000 (GMT)
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
Subject: [PATCH v5 15/21] dt-bindings: gpu: Add support for T-HEAD TH1520 GPU
Date: Wed, 19 Feb 2025 15:02:33 +0100
Message-Id: <20250219140239.1378758-16-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRy/533fve8YTV8GF8+R6TFOTCQQortH0qA7qzfvutSu6w4LXfoy
 qP3QDQqMU35thzhSFJoMBFQIWhAnsrHtgJ0LGD9kBdKglB/XAQkRCEipFMR6sfzv8+v7/Tzf
 u4ePi8xkAD9JkcyqFBKZmBQQ5o5HrhfLxk3SnQvOaNQ5eBVDpmUDhWpbXBgqb3Px0Eh/I4YG
 luZI9O3EDxS615JJIHfNZQpld9STaMowQqJ53QgP3baVkmgxvw0g82IOierahilUv1SOoSvz
 JgJVWmwAac98xUN93a+j4ZFOAk3d1uFIa9iIVpstFFpxXydQyaydQo0zBTzkrHsf5dgLidjN
 zNyQhmJmpqYI5rvcBxTT8kcFwVgNwxSjs94CTIPxDMncdTeTTFnXAWb0rBNjblSeZnLqOjDm
 3N87mbnWH0nmi0YjYPqzB6n9ojjB7mOsLOlTVhX+6hFB4kPnfd5xiyj1QvclXgZoFuYBLz6k
 o+C0NpfKAwK+iK4BsHbcgnHkAYCd5+wERxYBLJswkk9GhvQNJGdUA/i9Qb9OZgA8X2jjeVIk
 HQnHqst5HsOP1hBQ054JPASnfwXQPF767y5f+h14P6sNeDBBb4XfLA6uFfL5QjoWLtUkcXVb
 oP1mL+6Rvdbk1r4AjyykfWBX8TjhwfhaJNtUgnvWQ9okgFXuKYyb3Qsdq0bAYV847WykOLwJ
 rlrL1zNKOGZawDmcDq065zp+Bd51PSY9vTi9Hdbbwjn5NejscwKPDOkNcOh3H+4JG+AFsx7n
 ZCHM1Yq4dDAs0uX/V+qqMa+XMrBhthY7DwINTx1jeOoYw/+9FQA3An82RS2XsuoIBftZmFoi
 V6copGFHlfIGsPa1e1acCxZweXo+zAEwPnAAyMfFfkLt6UapSHhMknaSVSkPq1JkrNoBnuMT
 Yn/hVbtGKqKlkmT2E5Y9zqqeuBjfKyAD02uF0TFLO5TLH25vPXHtDeEdOQgNuHRgd9Z8VN+u
 IqMs8k1jiZc0QTwRl7dSvG9LpHcqLA1t7d60p3tSFx9U3eS6cSI2rv+QPvyln58NORtoV2xM
 S6B7Ht97d9vMex/7yg+OBVWMBJX8krq1VzB5ZNaYvu9WcZNAExEdcUrfZeo5JfM+mftncgUp
 /TogLWc0dECJHh1OD5YnuDXx/hdDu9/+8qNETUimw2eHZOKaX9VyRv6sdXCzT1XpC0g5eaXA
 e09gSX17cXBsYF3hrpffOtokrjx087eiZ2zumTvPD8QH6wp+yg5uz68Oa45yjH4uSph8qJDE
 fDC5Hxvo3etfHvNXVsx1MaFOlESE4Cq15B+pDEKGSQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7rznmxNN2j8K2dx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEv48fxD6wFO4QqJp2awdrAuIe3i5GTQ0LAROLG9E1sXYxcHEICSxklJjx6
 wwyRkJG41v2SBcIWlvhzrQuq6BWjxP0NL5hAEmwCRhIPls9nBbFFBBazSOzdVwlSxCzwllHi
 +syNYN3CAr4Sbz6cBGtgEVCVWP35OlCcg4NXwEHi64pMiAXyEvsPnmUGCXMChfddlAIJCwnY
 S5zruw82nldAUOLkzCdgE5mBypu3zmaewCgwC0lqFpLUAkamVYwiqaXFuem5xUZ6xYm5xaV5
 6XrJ+bmbGIHJZduxn1t2MK589VHvECMTB+MhRgkOZiUR3rb6LelCvCmJlVWpRfnxRaU5qcWH
 GE2Brp7ILCWanA9Mb3kl8YZmBqaGJmaWBqaWZsZK4rxsV86nCQmkJ5akZqemFqQWwfQxcXBK
 NTBp2117emvx5Gun7yQwXtZz3HVNpFfxV5zIsmibZx2TOlOXp0z/8sW4z+v6u1V+PdP/2lvr
 Pgjm++18+sBlXXaLPazWQe1n1u++ICNzI/MSz/l/V3eLB11SvXm6SGadecL2lo6iy3e6OTh1
 Npf8f82vUzFv3mH+Jc/feG+/t6pKOHiF7ELZtZIcrxIv2l74+L/IseWPv/ELPukLM7Yk9X//
 +7nimGD/Q8n5d6UWhD1ck3pj6/OrQfbcy+ZJ3MhytFz18eGlKX3vAp4yn/2q+E3aZ9HUwL2z
 VpfO4AjZMEdn8aaaZUwN2raZB2en3t7L8fMm8/K5fz95agfaXVHY/jzdq+X5+cecnBeOqT8U
 5/lYM0mJpTgj0VCLuag4EQCNO9AQtwMAAA==
X-CMS-MailID: 20250219140310eucas1p1297441a3da276569cd86b6b9e4544242
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140310eucas1p1297441a3da276569cd86b6b9e4544242
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140310eucas1p1297441a3da276569cd86b6b9e4544242
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140310eucas1p1297441a3da276569cd86b6b9e4544242@eucas1p1.samsung.com>
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
TH1520 SoC.

Add a dt-bindings example showing the proper usage of the compatible
string "thead,th1520-gpu" along with "img,img-bxm".

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 39 +++++++++++++++++--
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index bb607d4b1e07..2005dcefcaf9 100644
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
@@ -60,6 +65,16 @@ allOf:
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
+          minItems: 3
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -74,3 +89,19 @@ examples:
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
+        clocks = <&clk CLK_GPU_CORE>, <&clk CLK_GPU_MEM>,
+                 <&clk CLK_GPU_CFG_ACLK>;
+        clock-names = "core", "mem", "sys";
+        power-domains = <&pd TH1520_GPU_PD>;
+        resets = <&rst TH1520_RESET_ID_GPU>;
+    };
-- 
2.34.1

