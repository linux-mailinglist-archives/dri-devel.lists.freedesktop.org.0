Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CADA21275
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F1110E6FF;
	Tue, 28 Jan 2025 19:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="OXg8bqbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7A510E701
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:49 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194847euoutp02fcdda5913390bf54f8c4f56138f212a4~e8wlqk7my0770307703euoutp02c
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194847euoutp02fcdda5913390bf54f8c4f56138f212a4~e8wlqk7my0770307703euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093728;
 bh=9nabN9iJZvUwD7sxNp21bZTKvCSIG1x1u8aDtrN7ge4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OXg8bqbicZ+vXegU77MZWBdm2CMCRcUCTTc3XGcEdLW04aMs+x7wHh7Cb5LJei/nh
 WaSjfeDYdR+HiVOe4Mw7VeMdU2+apsE+kbbNFqfouxFnvYNTy64jfXZdJe9hu8SGPf
 2YQreyKDu5zGQQ0udEMtjmICU8lEdJTV+33EOF0s=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250128194847eucas1p270da344ffe47f997f8a33e982f692c7e~e8wlEjSGz2013920139eucas1p2G;
 Tue, 28 Jan 2025 19:48:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 61.09.20821.F9439976; Tue, 28
 Jan 2025 19:48:47 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194846eucas1p1bb40288d32401ecd32410f05a811cc3b~e8wkQ5fPp1989019890eucas1p1w;
 Tue, 28 Jan 2025 19:48:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194846eusmtrp2cc9c276d1680e34cbefde474df342820~e8wkQIUbG0493804938eusmtrp2G;
 Tue, 28 Jan 2025 19:48:46 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-a5-6799349f0c0a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DE.E0.19920.E9439976; Tue, 28
 Jan 2025 19:48:46 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194845eusmtip1a7bc7335675f8939466f6dc6b8850098~e8wi6jhkR0819208192eusmtip1O;
 Tue, 28 Jan 2025 19:48:44 +0000 (GMT)
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
Subject: [PATCH v4 16/18] riscv: dts: thead: Introduce power domain nodes
 with aon firmware
Date: Tue, 28 Jan 2025 20:48:14 +0100
Message-Id: <20250128194816.2185326-17-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxjAc+69vbcF6i4VwxlMlpFIIhugjm1nGRLc2HKzaeKyGB/MaZFr
 IfJKC1v3iiKUZ3VCJYOCqxpUbHgEBg2FAhGQAs6yFkddoBU2GBaKBEpFdOAol23+9/u+8/te
 yeHjogYygJ+UmsFKU8XJwaQXoetdHgzTRJZLdnRPeqM+61UMNT9TU6im3YQhTY+Jh+yWJgzd
 c8+RqG7yVwo9bM8i0HD1JQpl99aTyKG2k2heaeehodZKErnO9QCkc+WQqLbHRqF6twZDV+ab
 CVTV0gpQbsF1HjIPfIhs9j4COYaUOMpVv4SeG1ootDrcQKCKR50UanIW85Cx9iDK6bxIxAQx
 c/cVFON0OAimO3+RYtofXyYYvdpGMUr9L4Bp1BaQzOiwgWR+6v+UeVBkxJifq04zObW9GPPD
 yg5mruM3kjnfpAWMJdtK7Rcd8YpKYJOTvmSlEdHHvRINA7dA+m2B/Jn6HnEGuKlCIOBDOhJm
 r/5BFAIvvoiuBvCirZvHBYsADufreB5LRLsALDNvKQTUekXDbk65AaC1zbmhOAFUnWc9TNK7
 4NgNzXofP1pBQMXtLOAJcHoKQN1EJemxNtNHYf6iGfMwQW+DpTrD+kpCOgbOPi0iufVehZ23
 7uIeFqzlG1eqCc7xhf3lE+uMrznZzRU45zd4wcGRtziOhTdXBgHHm+G0sWnj5Ffgc70G4zgN
 jjUvbNR+B/VK4wa/B0dNT9d24K/13w7rWyM8COk90DVzhMNN8P6sL7fAJlii+xHn0kKYnyvi
 eoTAUuW5/2aaqnUYpzDQcn3PBfCa+oVL1C9cov5/6mWAa4E/mylLkbCynansV+EycYosM1US
 fiItpRGs/eo7q8aFFnBpej68C2B80AUgHw/2Ex41lUlEwgTx19+w0rRj0sxkVtYFAvlEsL/w
 aqdCIqIl4gz2FMums9J/XzG+IOAMdiiuXhd1J3Z8oKdB+/rBtMdxU+acgMp3HIVXnNTZQ75R
 fSKXr3zRZ6x44a+S8Q/ch2OQsX/sUejUn1qVI/Bh/FZxpHpflWpv4r5vW/Lk79dF+32cpbCc
 bCvwj/ep4X2/FGwqmoyMSM6QfV77QHygsTlKFXpyqvQA2/FZHjuz1BYmWB6qUu4+bW2L9ft9
 S+AUEFRceLMEh4Y4mzhUm0AN1nzh3xpkTwrRbC0+9va44GzZ4RojPRLtfXzZEv+kZMh7dvYT
 TVCQdtf+iQ6gLw2vzLz2buzfWmt6qWpk4u6M5EnYtG2bvChBU2ZuVAlj3Et5e2+eKreeiBr1
 GQ75qO6Nl+XBhCxRvDMUl8rE/wD7onZJRAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xu7rzTGamG2x+KWxx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEvY8+pg4wFRzkrfs+6wtLA+JW9i5GdQ0LARGKjbRcjF4eQwFJGicbb11i7
 GDmBwjIS17pfskDYwhJ/rnWxgdhCAq8YJc5siAex2QSMJB4snw9WLyKwmEVi775KkEHMAm8Z
 Ja7P3AjWLCwQLbFi53SwZhYBVYmp2/awg9i8Ag4Sb391s0EskJfYf/AsM4jNCRTf9HcFC8Qy
 e4lHb2ewQdQLSpyc+QQszgxU37x1NvMERoFZSFKzkKQWMDKtYhRJLS3OTc8tNtQrTswtLs1L
 10vOz93ECEwt24793LyDcd6rj3qHGJk4GA8xSnAwK4nwxp6bkS7Em5JYWZValB9fVJqTWnyI
 0RTo7onMUqLJ+cDkllcSb2hmYGpoYmZpYGppZqwkzut2+XyakEB6YklqdmpqQWoRTB8TB6dU
 A1Ng0fol9yT/yRfvaXl+vUg7/62wwcR+iYo1V3Um/U38EBCwnE+R9fTUSTZdhX8i2jykeObd
 LeDcIPt6+7dXy87+8Kq/MGfBwZjw4neX21sYttT/vyY378oHr/n3Gf7osPPev/JE+KVNQqeL
 jKrVEgeOfWsXeiRd6z0hsbnT6Vf2zfi4Lp7sqdNO92vqbT31Z3r49BupeSJ55lnxG9X0JB58
 ZE3v8C5tO5/d1TlbUO9tKOvfNWs/cweVdN5Zbbp12mUPo6w5wppmltYLxP9ENL+dPq9/wVt+
 pmZ/46PLGc0X1FxPkv1/p4n507KiU4aq7srz9V6c+KNxuuV4jUbcFJdpbMxnDissrw0NWDu3
 5LISS3FGoqEWc1FxIgCyIjBltgMAAA==
X-CMS-MailID: 20250128194846eucas1p1bb40288d32401ecd32410f05a811cc3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194846eucas1p1bb40288d32401ecd32410f05a811cc3b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194846eucas1p1bb40288d32401ecd32410f05a811cc3b
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194846eucas1p1bb40288d32401ecd32410f05a811cc3b@eucas1p1.samsung.com>
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

The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
TH1520 SoC implements power management capabilities through the E902
core, which can be communicated with through the mailbox, using firmware
protocol.

Add AON node, which servers as a power-domain controller.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d4cba0713cab..2f5389579abc 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+#include <dt-bindings/power/thead,th1520-power.h>
 
 / {
 	compatible = "thead,th1520";
@@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
 		snps,blen = <0 0 64 32 0 0 0>;
 	};
 
+	aon: aon {
+		compatible = "thead,th1520-aon";
+		mboxes = <&mbox_910t 1>;
+		mbox-names = "aon";
+		#power-domain-cells = <1>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
-- 
2.34.1

