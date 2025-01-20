Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D46A17152
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77C210E460;
	Mon, 20 Jan 2025 17:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ArDhOA2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1F10E455
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172144euoutp02d2a60ece56e8ce6ef012d05c91fed7a4~cdl6dcvw-1548115481euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250120172144euoutp02d2a60ece56e8ce6ef012d05c91fed7a4~cdl6dcvw-1548115481euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393705;
 bh=XKhPmeLKH+yLXKt3P/DhhZ3SB+vXe1FUxFn1/wfpcc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ArDhOA2jNxigztlIynWzlEllV3TMRPDpccqpZ1WLvbBCj1dJfupAOlTSby+2Wmf/C
 9sbuZBuZo/Blcc4cMaJUw7VdFR8DsImjtVN/jK3kjvTZDpOiBSIJ0AzR2fK63RhgTf
 RUH313cacurjVh2lKwMB0xlNOY1K2N3mMzdTtBMY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250120172144eucas1p26270f7be35cb2180814b25331ddea70d~cdl5jUEzA0618106181eucas1p2Q;
 Mon, 20 Jan 2025 17:21:44 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B3.76.20397.7268E876; Mon, 20
 Jan 2025 17:21:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250120172143eucas1p2cb4c77eee4833b4de668a2aadb5a2087~cdl5GdyJz1091210912eucas1p22;
 Mon, 20 Jan 2025 17:21:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172143eusmtrp28ce9edf96e9bc11e9382f54c1cc2f812~cdl5Fvwzx0513205132eusmtrp2B;
 Mon, 20 Jan 2025 17:21:43 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-73-678e862705f6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 22.B5.19654.7268E876; Mon, 20
 Jan 2025 17:21:43 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172142eusmtip1c497cda178b3d2f540bee966e89acc27~cdl31vwG70462804628eusmtip1w;
 Mon, 20 Jan 2025 17:21:42 +0000 (GMT)
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
Subject: [RFC v3 18/18] riscv: dts: thead: Add GPU node to TH1520 device tree
Date: Mon, 20 Jan 2025 18:21:11 +0100
Message-Id: <20250120172111.3492708-19-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTdxTmd+/tvZduxWtx4xfcIzRTokasssRf5kJcBHPnyKZu0WXZgt24
 KYQWTAtzshEotBVZAcfckII8jBGCIAFpeaSMDbBFWYs85JEVaJSNx6qAQBXIZJSLm/993znf
 +b5zkkPj4gYykI6NT+RU8TKFhBQSZuuSY3ewPkcu7XfsR52DVzBkWjFSqKrFgaGSDocAjfbW
 Y6h/cYZEN/68S6HJFg2BBiouUyjDWkOiKeMoieYMowLU11xEovnsDoDM81oSVXeMUKhmsQRD
 ZXMmAl1tbAZIf/6aAPXciUAjo50Emuoz4Ehv3IRWLY0UejZQS6DCR60Uqnf/IEC26pNI23qR
 OPgGOzOko1j31BTBtmcuUGyLp5Rgm4wjFGto+h2wdZXnSdY5YCHZ4tvH2LHvbRh782oqq622
 YmzuP1J25pd7JJtTXwnY3oxB6qj4M+G70Zwi9mtOtSfslDDm17IH4PSg8JsCfTlIA046C/jS
 kHkbprfbqCwgpMVMBYBDjzQ4TxYAXJq8jPFkHsDZznnq+cjIj5MCvlEOoPFp9saIG8A23R+4
 V0Uy+6CrvGRdtYXREVB3SwO8BGcmADSPF5FelT/zEVx2VAEvJpht0FX3ZB2LmIOwuawH4/Pe
 hK2/2dddfdfqT+61ULxmM7xdME54Mb6myTAVrq8BmWohNN2wrUXTayQcpg0j3scfTtvqN254
 Da42lWz4J0CX6THO4+9gk8G2gQ9Ap2OZ9NrgzA5Y07yHL78Ha7vGMN7dDw493Mxv4AfzzPk4
 XxbBTL2YV2+HPxmy/wt1VJg3QlmY7+ihLoAg4wu3GF+4xfh/binAK0EAl6RWyjl1aDx3JkQt
 U6qT4uUhXyUo68Dab3c9sy02gorpuZA2gNGgDUAal2wRvTJrkItF0bKzyZwqIUqVpODUbWAr
 TUgCRFdadXIxI5clcnEcd5pTPe9itG9gGpb7UpRnuao2rHj2wtFLGQ+Pby2qTclu/3KsYNgd
 aVDo73JLnpmJlb/Lzh7bNx6xP9W9be8JrUfgssYag0T3nQpLwkp3uCdLeiIFP/z6kfyPHd3h
 mdq5lF0H4iLzJsqm045HHPpkYbtPr/3M/R3yV3e1/Ky82ZDerlk5V3nJ0SDJ/yIoyfPXKbL2
 rZc/8LHPPI7+drkvMP3Qh0NPSxmrWVG55Cs852yWBfsXSAtnu4oSocUlYYcik7UnJ/P8THea
 lq3F0sNOVeOnF69HJg/gyZsCioZt14gjdL+SfD/lneLc1ethcQ92BltCQoNCfWK6unPCNPbd
 k1HzhnBVqp36/FZfgYRQx8j27sRVatm/RYXFSEoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7rqbX3pBm92SVucuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLOLDwMWPBda6KmW3LGRsY73B0MXJySAiYSNyd/IK1i5GLQ0hgKaPEyq/r
 2SESMhLXul+yQNjCEn+udbFBFL1ilDj+ex4rSIJNwEjiwfL5YLaIwGIWib37KkGKmAXeMkpc
 n7kRrFtYwFfi4pejbCA2i4CqxINN3xlBbF4BB4ldCy8yQWyQl9h/8CwziM0JFP9+dS/YFUIC
 9hJ3rnZD1QtKnJz5BGwmM1B989bZzBMYBWYhSc1CklrAyLSKUSS1tDg3PbfYSK84Mbe4NC9d
 Lzk/dxMjMMFsO/Zzyw7Gla8+6h1iZOJgPMQowcGsJMIr+qEnXYg3JbGyKrUoP76oNCe1+BCj
 KdDdE5mlRJPzgSkuryTe0MzA1NDEzNLA1NLMWEmcl+3K+TQhgfTEktTs1NSC1CKYPiYOTqkG
 JhY9oQdV2maRz9ZabOfU/sG/enpOKUva5Mx7+v+StKfXyIqw8k+u4Cnfc1F9auyUfbFqvbGM
 f/WmvnU4szYuukTk1Z1EB7PM+VGRlztiXnMxRq31KmaYsKt6dsTu9dwXY8uzmyQ0yoNb5gaJ
 uynbu5Xmnczt/TQtwWh3Y0i+gPZGbcWtbAdCH9UxPrae7LFv91Q1vlWG4nsDvoZcN3s97d3t
 FSkVu/wSj0iUXfwt9uS0f73KR6nQx/6ST8xu97psajlXHxkVuvp7ZPOOSW3lGjEzT7eEmK15
 MEfkcYZbAPvTTna9goJN8aXCbW+2rWmN26KiMZPNvezCnN1Orb9evtDe/DNwzevlV5lLeP4p
 sRRnJBpqMRcVJwIA2EHKMrkDAAA=
X-CMS-MailID: 20250120172143eucas1p2cb4c77eee4833b4de668a2aadb5a2087
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172143eucas1p2cb4c77eee4833b4de668a2aadb5a2087
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172143eucas1p2cb4c77eee4833b4de668a2aadb5a2087
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172143eucas1p2cb4c77eee4833b4de668a2aadb5a2087@eucas1p2.samsung.com>
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

Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
the GPU using the drm/imagination driver.

By adding this node, the kernel can recognize and initialize the GPU,
providing graphics acceleration capabilities on the Lichee Pi 4A and
other boards based on the TH1520 SoC.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index f2c6937341a5..cf2b1bb2ee96 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -497,6 +497,18 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@ffef400000 {
+			compatible = "thead,th1520-gpu", "img,img-bxm";
+			reg = <0xff 0xef400000 0x0 0x100000>;
+			interrupt-parent = <&plic>;
+			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_vo CLK_GPU_CORE>,
+				 <&clk_vo CLK_GPU_CFG_ACLK>;
+			clock-names = "core", "sys";
+			power-domains = <&aon TH1520_AON_GPU_PD>;
+			resets = <&rst>;
+		};
+
 		rst: reset-controller@ffef528000 {
 			compatible = "thead,th1520-reset";
 			reg = <0xff 0xef528000 0x0 0x4f>;
-- 
2.34.1

