Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E3A2126F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05DD10E707;
	Tue, 28 Jan 2025 19:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="SnxOy01i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E75410E70C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194836euoutp01fd60f91c2b779cd3d8f07ba8629699c3~e8watyMH-0285702857euoutp01K
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250128194836euoutp01fd60f91c2b779cd3d8f07ba8629699c3~e8watyMH-0285702857euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093716;
 bh=GvH+KGxOLMWPvCT3kvkzzW6sq/iRIHCpZUQmHgtdxxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SnxOy01idwZCQxjeXu7oZRZ7JQAMpImZaVmqn9sOcpKPuE8Mb8ngRrGctAQ5dukqQ
 vAfRN/uPLIuHSHprhDunijGzTJB2ywljUHH5eXQH9XTpDzkE+LGny+UjZsbdmLF53s
 lTnXvnbRhZqjO9bLSBCqUkhLl6M/h8ZpZkfwNiiA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194835eucas1p1706e00ae514b5bd95ce262b8a094ea95~e8wZoHDCE1601116011eucas1p1v;
 Tue, 28 Jan 2025 19:48:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 4A.A2.20397.29439976; Tue, 28
 Jan 2025 19:48:34 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250128194834eucas1p2f7581075b9f238c84e83c5fa210bc3ea~e8wY5FQXD2210922109eucas1p28;
 Tue, 28 Jan 2025 19:48:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194834eusmtrp20cde8efdfd5ef2c18bb7078830b7e71c~e8wY4VdD23008430084eusmtrp2a;
 Tue, 28 Jan 2025 19:48:34 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-d5-67993492d94c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 36.E0.19920.29439976; Tue, 28
 Jan 2025 19:48:34 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194832eusmtip167a13b0c44d313dc80857f97a9e2a371~e8wXlE_jb0756107561eusmtip1P;
 Tue, 28 Jan 2025 19:48:32 +0000 (GMT)
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
Subject: [PATCH v4 07/18] riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
Date: Tue, 28 Jan 2025 20:48:05 +0100
Message-Id: <20250128194816.2185326-8-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTVxjHc+69vfe2irtUFo5u2QJRiS68qR9OguJL3Hb34sL8gA7YpBmX
 wqAFWsDh2AShiFA2ZCxqYRYdgwZBoEKlCHYitBWx4Z1uA8YGysoYjFGMgwCjtG5++53/eZ7z
 e57k0LhQR26lY6XJnEwqivcmBYTO+I/Ft2jvZXFApTYImYeuYahxSUWh6lYLhtTtFh4a7W3A
 UP/CLIluPOqm0O+tmQQa1HxLoSxjLYlsqlESzSlHeaivuZRE8wXtAOnms0lU0z5CodoFNYau
 zjUSqLypGaCc8xU81NP5OhoZNRPI1qfEUY7qBbTa0kShlcF6ApXMGCjUMH2Bh0w1x1G2oZg4
 +Ao7a1VQ7LTNRrD3cu0U2/qkjGD1qhGKVeq7AKutOk+yw4MtJHvl/vvsL/kmjL1ZfobNrjFi
 7FfLAezsnQGS/bKhCrC9WUNUiDBMsC+Ki49N5WT+wZGCmJKaLiyxmP+p8nY3mQEeUHmAT0Nm
 L6xQn8XygIAWMhoAzyluAOfBDuBS05DrMA+g9soM71nL6k8a0sFCphJAdZWvk6cB1PzxmoNJ
 Zjccq1TzHM0ejIKAio7M9ZdwZhJA3UTpevdm5m1oHn+KO5hgtsOicj1wsBtzALbkqXCn7VVo
 uPtwnfnMQahd1hDOGnd4//LEOuNrNVmNJbhDAJkaAexSDri2OwJ7hjMxJ2+GU6YGV/4yXNWr
 XXkCHGv82yVLh3qlycVBcNiyuDYovSbYCWub/Z3xITjQVIA7YshsgtY/3Z0jbIJFuouu2A3m
 5gid1TvgN8qC/6QWjc4lZeF0tY1XCLxUzy2jem4Z1f/eMoBXAU8uRS4Rc/I9Uu6Un1wkkadI
 xX4fJ0i0YO1rP1gxLTQBzdScXxvAaNAGII17e7h9aLkkFrpFidJOc7KEk7KUeE7eBl6iCW9P
 t2sGhVjIiEXJXBzHJXKyZ7cYzd+agXmNn4v1ayO8L0Qv/9Wx+11ayJYvhayEfNSvL46+VGst
 Hqh/x55U8ES68bA9hjt5avG01DPp64sH8O6wrp5K02SRwB5+yxCwz+rrM7njRL2pL+NWp7ni
 i6XryIcOjPtxZUyTNBif9uLGMUPoYVFmWeJURODots+5laPcrmiyk+91PGJmIKrNf3wu7Q6z
 4ZPC5WMPk0O7fMKrfSMm76lvA2vdZ28FbK/79aw9/Y069oMOw6HFUFi4IcNmjezwcG/RbMv/
 XiYx9Dc/nYiN/CHuveuB+9ONN+35Yd89ku1/M2hLakyuR/dvfElw75GRE0cfW86E73wMkHEL
 2vPzXT1RmmoODvcm5DGiwF24TC76F71bPNJJBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7qTTGamG/xew2Fx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEvY/baM0wFUzgrenZfYGtgPM3excjJISFgIvH/1gq2LkYuDiGBpYwSn76t
 gUrISFzrfskCYQtL/LnWBVX0ilHi7oMfbCAJNgEjiQfL57OC2CICi1kk9u6rBCliFnjLKHF9
 5kawbmEBL4kTj38wg9gsAqoSk5bsZASxeQXsJfZ0zWKG2CAvsf/gWTCbU8BBYtPfFWC9QkA1
 j97OYIOoF5Q4OfMJWJwZqL5562zmCYwCs5CkZiFJLWBkWsUoklpanJueW2yoV5yYW1yal66X
 nJ+7iRGYYLYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4Y09NyNdiDclsbIqtSg/vqg0J7X4EKMp
 0N0TmaVEk/OBKS6vJN7QzMDU0MTM0sDU0sxYSZzX7fL5NCGB9MSS1OzU1ILUIpg+Jg5OqQam
 jFeKB1Wv1AilM2jsDtYP/NBQtV9o4e0cvdApQesdDxRzvBd8devrkn3/G0p2Tfr7K3yDVGFl
 H+OOI7rGniceFTdtW/FISu0Re87Ts7Nb+mYZZjMZTwwrX/w62/hL+BT1ZWmTHn49uINrY+Kk
 cLGFzTY/DWtklmyrurvDavKU30EezEfvfD+yZb0xW/1U1V+7WlUlYyf9eXYoeC7XCd3+XcLT
 TN835i0+XC9kYPTmaOPefbve/Z3OySL7Rfjhe5GFz+PYcq5v0O/j9TMUED+z8YpH9OLftg3N
 ZueTGc+sOmVRcv5R8ZesIGbhsg/6p55N3vEy9PnGV2sWS60VaE3j0Tz+4XD9DhfXGqEo/xcX
 pZRYijMSDbWYi4oTAWPpytO5AwAA
X-CMS-MailID: 20250128194834eucas1p2f7581075b9f238c84e83c5fa210bc3ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194834eucas1p2f7581075b9f238c84e83c5fa210bc3ea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194834eucas1p2f7581075b9f238c84e83c5fa210bc3ea
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194834eucas1p2f7581075b9f238c84e83c5fa210bc3ea@eucas1p2.samsung.com>
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

T-Head SoCs feature separate power domains (power islands) for major
components like the GPU, Audio, and NPU. To manage the power states of
these components effectively, the kernel requires generic power domain
support.

This commit enables `CONFIG_PM_GENERIC_DOMAINS` for T-Head SoCs,
allowing the power domain driver for these components to be compiled and
integrated. This ensures proper power management and energy efficiency
on T-Head platforms.

By selecting `PM_GENERIC_DOMAINS`, we provide the necessary framework
for the power domain drivers to function correctly on RISC-V
architecture with T-Head SoCs.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450..83833ded8908 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -53,6 +53,7 @@ config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
 	depends on MMU && !XIP_KERNEL
 	select ERRATA_THEAD
+	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
 
-- 
2.34.1

