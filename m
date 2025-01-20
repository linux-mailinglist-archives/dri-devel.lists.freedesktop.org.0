Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B69A17150
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2A210E455;
	Mon, 20 Jan 2025 17:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="BkB8fCAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D410710E455
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172140euoutp024dbfdb467c8109e773d670f47e31ef45~cdl2Xzc3W2039620396euoutp02G
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250120172140euoutp024dbfdb467c8109e773d670f47e31ef45~cdl2Xzc3W2039620396euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393700;
 bh=5y2WS57XvuGg85wtk3n0PwH6VgkA14YRr/iJ0hV620s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BkB8fCAD5IQFQ+numO+1ZRKQlbfzcXK1DJTZAJ2BDV69PQzrcY6NPHQFrMRLVtEgJ
 u0RkbfHDobfFzAIM9vs3zzx5jOwuGuhy2thPxkf29wAXxlnRdbtx2jPgPbbq/LyMoY
 Heyb9kUp7Qdneeh4lQlqK+WD6eqH35uEwitlmCdw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250120172140eucas1p2248daf7b6136c63be00ad1c78dbd9702~cdl1_3tut3181531815eucas1p2k;
 Mon, 20 Jan 2025 17:21:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 81.76.20397.3268E876; Mon, 20
 Jan 2025 17:21:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250120172139eucas1p276872579d306da801c455630c0b5c8e5~cdl1dmlQi1089910899eucas1p26;
 Mon, 20 Jan 2025 17:21:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172139eusmtrp2a9e29dccc84e3cc19d866b890cd1d3b5~cdl1c0cK60490804908eusmtrp2K;
 Mon, 20 Jan 2025 17:21:39 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-6c-678e86236563
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3E.A5.19654.3268E876; Mon, 20
 Jan 2025 17:21:39 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172138eusmtip137e7f2a18d2217166b0002c0f86bb0b4~cdl0HKaKp1070610706eusmtip16;
 Mon, 20 Jan 2025 17:21:38 +0000 (GMT)
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
 <m.wilczynski@samsung.com>, Drew Fustini <dfustini@tenstorrent.com>
Subject: [RFC v3 15/18] riscv: dts: thead: Add mailbox node
Date: Mon, 20 Jan 2025 18:21:08 +0100
Message-Id: <20250120172111.3492708-16-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxjG851zes5pZ/VQYHzBTTOm08lEN3b5MgxxU5djGm/sFjW7VD0p
 bFyatkx0TiGUDrAgLjBjqxYZU8ZAArSMIqyl1FZ0IxNGYcwWdsENBlagnRlgHeUw53/P+3uf
 93veN/loXNJCRtMp6WpOmS5LjSFFRJPzn661K7TF8vXDNhJd7avAkHlGT6Gati4MGR1dAmRr
 VSNvtwlDPwZ8JLo0/AOF/mzLIZC76iyFcp11JBrRe0k0ofMKUE/LGRJNFTkAaprSkKjW4aFQ
 XcCIofMTZgJVNrcApC24IEA3rm1BHu9VAo306HCk1S9B91ubKRR01xPIcNtKIdPYSQFy1b6N
 NNZSYuNy1tefR7FjIyME25Hvp9i2v8sJ1qL3UKzO8h1gG6oLSPamu5Vkz3XuYgePuzC2sfIY
 q6l1YuyJe+tZ37e9JFtsqgZsd24ftTN8j2jDAS415SNOuS7xfVFyU3+2QHFHlNXnd4Bs8Add
 CIQ0ZJ6Hs4YRQSEQ0RKmCkBz6yweakgYP4CeX4S8ngJQ+8WDgQLPEMUPXASwseMGwRdjAGab
 nCDkIpnn4NBF4/yzEUweAfOu5IBQgTMlGKxwn5vPCGcSYHvJp4KQJpiVMPe37nkuZjbCgaFe
 wOcth9b27+e5cI7f7W2jeE8Y7Dz9OxHS+Jwn12zAQwGQsYigWz+D8cOb4WRz2YIOh6MuE8Xr
 x+B9i3GBZ8Ah8yTO6yPQonMt6AR4s2uaLAT0XMDTsK5lHY9fgbrgCSqEIbMY9o+H8Ssshp81
 ncJ5LIb5WgnvfgqW6YoehHZVNS2EstBmLAUl4An9Q8foHzpG/39uOcCrQRSXqUqTc6r4dO5g
 nEqWpspMl8ftz0hrAHPf+3rQFWgGVaMTcXaA0cAOII3HRIgj7+jkEvEB2aHDnDLjPWVmKqey
 g6U0ERMlrrDmySWMXKbmPuQ4Baf8r4vRwuhs7J22nL0ax71etauIirDG2nUvPCr3zyiXeqXs
 a78a2t8aLIt85k3F1qK7t/yC+p8ZuaMssn/cJ57s+DKx3jhr2L3tg6R9u2If+bw24kps9V8V
 2/ZJzzgHapJOu7cedq89aT91K0yhkCZ81VBZfn2HaUX2nuLkLGY6cMhqqg9EXx79aTxqw7L8
 5k2dl7FYs/Bs8fCLWkPa5h3xPtXApb3jsdLtjw/0Rqqn4ruX0Ee9a/zLnhybFlmG+mZ9bwQT
 v1706oXAUenMQdT4kvNamXm3Zn9YygT+7subEo8fOZZlK12kjOtZ9YktyR7+Tc2g5HZtzMrV
 2z8OilNXd74+YaKrmUodmb8qhlAly55dgytVsn8BA0Xh000EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsVy+t/xu7rKbX3pBh0X5SxOXF/EZLH19yx2
 izV7zzFZzD9yjtXiwJ4Si3uXtjBZXPn6ns1i3dML7BYv9jayWFxbMZfdovnYejaLl7PusVl8
 7LnHanF51xw2i8+9Rxgttn1uYbNYe+Quu8X6r/OZLBZ+3MpisWTHLkaLts5lrBYXT7la3L13
 gsXi5eUeZou2WfwW//fsYLf4d20ji8Xsd/vZLba8mchqcXxtuEXL/iksDvIe72+0snu8efmS
 xeNwxxd2j73fFrB47Jx1l92jZ+cZRo9NqzrZPO5c28PmMe9koMf97uNMHpuX1Hu0rD3G5NH/
 18Dj/b6rbB59W1Yxelxqvs4eIBylZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2Vk
 qqRvZ5OSmpNZllqkb5egl7HtRgNrwQeuiutfjjA2MD7n6GLk5JAQMJHovPuAvYuRi0NIYCmj
 xIT5j5ggEjIS17pfskDYwhJ/rnWxgdhCAq8YJdpvJILYbAJGEg+Wz2cFsUUEFrNI7N1XCTKI
 WWAGk8Se51cYQRLCAtYSBye0gxWxCKhKND++xAxi8wo4SNx6cJURYoG8xP6DZ8HinEDx71f3
 skMss5e4c7WbEaJeUOLkzCdgBzED1Tdvnc08gVFgFpLULCSpBYxMqxhFUkuLc9Nzi430ihNz
 i0vz0vWS83M3MQLTzLZjP7fsYFz56qPeIUYmDsZDjBIczEoivKIfetKFeFMSK6tSi/Lji0pz
 UosPMZoC3T2RWUo0OR+Y6PJK4g3NDEwNTcwsDUwtzYyVxHnZrpxPExJITyxJzU5NLUgtgulj
 4uCUamDK1Xzdmz11VrtNT+Na9p0Xj10onPA97+a7gwUffjH4si+vWKhyU+n+zIzUVec3bTbf
 MHW51DZ22Yu1Nv8OiE94IVvCV6rwa7nbfa+HMxf7txy7vmoua/uOvhf/di1Yc+t8Ml/mlSeT
 t314e6vCP7PFXyiebwubUsqkK8++njwpsmRC/o1ZHeqmUdfy/lWFHQt+/rrlaNnRpW53jwuy
 tOQcfdte0XCwvfFmjnd38SpPiZ3f9745UcEymXHG9Dxr01kXazedemrDW7fPoMn1SvbTDQsv
 2P3VrL4Xojztpc/OH8JCS3XYLf8++sYVWX42xndbVcOc36Yq33zl1ybVHsi1cc36f+QKXx2r
 5P8VW1o/flJiKc5INNRiLipOBADuLq8nvAMAAA==
X-CMS-MailID: 20250120172139eucas1p276872579d306da801c455630c0b5c8e5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172139eucas1p276872579d306da801c455630c0b5c8e5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172139eucas1p276872579d306da801c455630c0b5c8e5
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172139eucas1p276872579d306da801c455630c0b5c8e5@eucas1p2.samsung.com>
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

Add mailbox device tree node. This work is based on the vendor kernel [1].

Link: https://github.com/revyos/thead-kernel.git [1]

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 5e515a9d69b2..d4cba0713cab 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -606,6 +606,22 @@ timer7: timer@ffffc3303c {
 			status = "disabled";
 		};
 
+		mbox_910t: mailbox@ffffc38000 {
+			compatible = "thead,th1520-mbox";
+			reg = <0xff 0xffc38000 0x0 0x6000>,
+			      <0xff 0xffc40000 0x0 0x6000>,
+			      <0xff 0xffc4c000 0x0 0x2000>,
+			      <0xff 0xffc54000 0x0 0x2000>;
+			reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
+			clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
+				 <&clk CLK_MBOX3>;
+			clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
+				      "clk-remote-icu2";
+			interrupt-parent = <&plic>;
+			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		gpio@fffff41000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff41000 0x0 0x1000>;
-- 
2.34.1

