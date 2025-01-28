Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8FFA21266
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99BB10E705;
	Tue, 28 Jan 2025 19:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="UC7EwqUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CA510E6F8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194832euoutp02b93587c65e1d428c10d9634b0353eaa1~e8wXX48qw0278302783euoutp02r
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194832euoutp02b93587c65e1d428c10d9634b0353eaa1~e8wXX48qw0278302783euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093712;
 bh=X0GeOqAcfKSNQETfogg6Y6n6vVY+VqvT5dghKGxN1vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UC7EwqUtR6GV1ISfGV4zCVq2D9gLFDW7mRzSPH3iUTZHG59aC8y47RLFT8D0DuHsj
 +6pXvIUgwn3C/dRlokU9qj2MOza4P/tjLbr5FvBskuMOto8c2kwR5Ug5QLg5VLGGSz
 rjBk14Re6xjsKrIu3wzYBrDCklydZh4OxB3xwsbw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194832eucas1p11616f434ee4a8b3ed8ac7a54b0d2590b~e8wW67NUI1601016010eucas1p1s;
 Tue, 28 Jan 2025 19:48:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E7.A2.20397.F8439976; Tue, 28
 Jan 2025 19:48:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250128194831eucas1p258522118b2f21abd8f6d4cdde277fe07~e8wWegYAA2013920139eucas1p2-;
 Tue, 28 Jan 2025 19:48:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194831eusmtrp2e7cfa255e0d831c0badb4d95367df6b1~e8wWdBWKY3008430084eusmtrp2Y;
 Tue, 28 Jan 2025 19:48:31 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-ce-6799348ff178
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 44.E0.19920.F8439976; Tue, 28
 Jan 2025 19:48:31 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194830eusmtip11e2dfb80d53bccb3e4f0336ee46abcac~e8wVMJkHL0819608196eusmtip1K;
 Tue, 28 Jan 2025 19:48:30 +0000 (GMT)
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
Subject: [PATCH v4 05/18] dt-bindings: power: Add TH1520 SoC power domains
Date: Tue, 28 Jan 2025 20:48:03 +0100
Message-Id: <20250128194816.2185326-6-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzved937/uyY/gyuHxCi9u8UisQZdmTmSgH9Z5nd9If6RUeTH1v
 EGPYNkoR0wXjAAcRFsEQZ0SyI5CgbQfIRGgy0BiJhFSMwB/Hz+QQRpcBxn5Y/vf5fn48n+/3
 7qFxoYUMoZMVak6pkMrFJJ+wdP7dG1YkKZNFTItQ161KDJn/0VOo1urAkMHm4KHhPhOG+l0z
 JLp472cKjVs1BBowVlAoq7OeRBP6YRLN6oZ56GbLWRLNFdgAssxlk6jO5qRQvcuAoa9nzQSq
 amoBKCfvAg/duBaLnMNdBJq4qcNRjn4VetTaRKHlgQYCld9vo5Bp+nMestftQ9ltXxA7n2Nn
 BrUUOz0xQbA/5s5TrHXhPME2650Uq2v+CbCNNXkkOzTQSrLnuuPYP07bMfaHqpNsdl0nxn62
 FMHOXP6FZAtNNYDty7pF7RW+x99+mJMnf8QpN+1I5CdprpmII73+R8uc9cQp0MfPB340ZCSw
 vtSM5wM+LWSMAF5sMBBuQcjMA7iQ/65XmANwqqkaf5xoXxzzJaoBNJoqSe8wDeCZv0o9cZLZ
 AkeqDTy3EMxoCai9qgHuAWfGALTcPUu6XUHMbjhWa/BggnkeNoy7gBsLmCioGTkDvH2hsK29
 x9Ptx+yEjUtGwusJhN1ldz0YX/Fkmcs9O0Gmjg+vf/uA8oZjYEP5976HguCk3eTj18JHzQbM
 i9PgiPmB77hM2Kyz+/DrcMjxcGU5eqVgI6xv2eSld8GK5UKem4ZMABz8M9C7QgAstnyFe2kB
 zM0Ret0vwC91Bf+VOowWXykLR6/0kEVApH/iGP0Tx+j/7z0P8BqwmktXpco4VaSC+zhcJU1V
 pStk4YfSUhvByte+vmx3NQHj5Gx4B8Bo0AEgjYuDBQccpTKh4LD0WAanTEtQpss5VQdYQxPi
 1YLKNq1MyMikai6F445wyscqRvuFnMKCk07n5Z4LtT2sTvluw51gszE2frCopPgNxWVXr2X/
 olb1VGJAyY1KvDH+nR3jnWu6Q/oPahGjiNJv64lMWx8bkXdFjR//RuuP31Eztow9yqnjV7cW
 5MWMmuP8M8ujqa6yl0d5WZe2vrKrdX1YoV1Msy3tG3b3r+2P3vvMvROXakuqgEKrSMgMOVkd
 uuql9yuCrNFDSy57jzwsp/iAKkr9yQXNFHFbFJbcvKV3fPmQI8f+28H5jO2LPXG6pNLJsYi3
 I1NeG9l37INXJUq+QPL0WzOTm3lvBiwoxJJPf78t2v+hXL/xV+eAbE9J4jprzLPxQwkuf3pi
 24n7tGjhqF9j4DqemFAlSTe/iCtV0n8BHlCRmEkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7r9JjPTDa7cUbQ4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CX0XhqC0vBeZ6KmXfXszQwXuLqYuTkkBAwkTj45zkziC0ksJRR4uzqVIi4
 jMS17pcsELawxJ9rXWxdjFxANa8YJX6tOMQGkmATMJJ4sHw+K4gtIrCYRWLvvkqQImaBt4wS
 12duBOsWFvCSeL5mPlgDi4CqxMYXXxlBbF4Be4nGB5MZITbIS+w/eBbsCk4BB4lNf1ewQFxk
 L/Ho7Qw2iHpBiZMzn4DFmYHqm7fOZp7AKDALSWoWktQCRqZVjCKppcW56bnFhnrFibnFpXnp
 esn5uZsYgell27Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRHe2HMz0oV4UxIrq1KL8uOLSnNSiw8x
 mgLdPZFZSjQ5H5jg8kriDc0MTA1NzCwNTC3NjJXEed0un08TEkhPLEnNTk0tSC2C6WPi4JRq
 YJLNq/kWw+XnYNho9nO+ZO6/LME10luu7nauOHNNwEzz6mll6zVv475NiIuVeVWR+Dy6ZOFr
 VYW3hTdeLA/c5nj4SWHNwVkfFxV2qAsyLtNMnGVXrev9qvChXOm856unc298++hmaFiheSxD
 CN/MhP+/O9mzYk3LOOa7VH8JnCvl/rppt9gNxyj3HYesbDIlJC4oKFxZlpzC670q8VKhverR
 OduutjAte7zBpEEoWe4mt1iscvZHl63n2ELNTBrkb7KaCn5PO16urResmsGX9fl/zq/qV/+u
 7OVk89v4OL7+/EnJpWI/Au5werW1MKeaC7hc4zK2iuRumRSW6fey1su6orzz9PZTPMJu+5uU
 WIozEg21mIuKEwGyxImtuAMAAA==
X-CMS-MailID: 20250128194831eucas1p258522118b2f21abd8f6d4cdde277fe07
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194831eucas1p258522118b2f21abd8f6d4cdde277fe07
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194831eucas1p258522118b2f21abd8f6d4cdde277fe07
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194831eucas1p258522118b2f21abd8f6d4cdde277fe07@eucas1p2.samsung.com>
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

Add power domain ID's for the TH1520 SoC power domains.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                   |  1 +
 .../dt-bindings/power/thead,th1520-power.h    | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/power/thead,th1520-power.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a98b52fffdc..4106b0e26589 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20351,6 +20351,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
+F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
 RNBD BLOCK DRIVERS
diff --git a/include/dt-bindings/power/thead,th1520-power.h b/include/dt-bindings/power/thead,th1520-power.h
new file mode 100644
index 000000000000..8395bd1459f3
--- /dev/null
+++ b/include/dt-bindings/power/thead,th1520-power.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#ifndef __DT_BINDINGS_POWER_TH1520_H
+#define __DT_BINDINGS_POWER_TH1520_H
+
+#define TH1520_AUDIO_PD		0
+#define TH1520_VDEC_PD		1
+#define TH1520_NPU_PD		2
+#define TH1520_VENC_PD		3
+#define TH1520_GPU_PD		4
+#define TH1520_DSP0_PD		5
+#define TH1520_DSP1_PD		6
+
+#endif
-- 
2.34.1

