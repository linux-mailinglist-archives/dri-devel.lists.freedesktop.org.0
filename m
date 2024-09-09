Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0638970AD8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 02:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C3D10E253;
	Mon,  9 Sep 2024 00:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="FNS8/4/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33BF10E249
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 00:46:45 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240909004643epoutp0297ff210b5635e26c38a88b07a99fd5eb~zbOLliwCI1271012710epoutp02O
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 00:46:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240909004643epoutp0297ff210b5635e26c38a88b07a99fd5eb~zbOLliwCI1271012710epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725842804;
 bh=3VVnHyYRvCtJ4gJTZWNhyOaT9J94FBZBPDqZvJPYXC8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=FNS8/4/UVFz6LCFNvvmIq/GcxiObgd4IpUw1Zw3SwCy7kh+DLwZrqD3mqQ7/fJL7P
 JZT9jXRWOctuca7plGj3/S2tq53X9rV1gztXHpjO+DMbbQW97Kp/dm6kS9hntHhTjg
 1M8QRcEcLd7w7H0WUflUcGEvqhZ5ixL83s+e9UGw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20240909004643epcas1p32569c05f39bbd85476bfe36125d81ec2~zbOLUrNKw3010030100epcas1p3P;
 Mon,  9 Sep 2024 00:46:43 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.237]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4X27Sf1ntpz4x9Q3; Mon,  9 Sep
 2024 00:46:42 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A3.9F.09623.2754ED66; Mon,  9 Sep 2024 09:46:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20240909004641epcas1p3a3879721c9f81a063209cf7a752b36c0~zbOJYZ7J90217302173epcas1p3j;
 Mon,  9 Sep 2024 00:46:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240909004641epsmtrp1feeb9b11e7746a436158709ac9d46e71~zbOJXukzS1914619146epsmtrp1d;
 Mon,  9 Sep 2024 00:46:41 +0000 (GMT)
X-AuditID: b6c32a36-ef9ff70000002597-0c-66de45727854
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 22.32.08964.1754ED66; Mon,  9 Sep 2024 09:46:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240909004641epsmtip2be86283fa81de34554794ad08f1c6736~zbOJJROvE2137621376epsmtip2I;
 Mon,  9 Sep 2024 00:46:41 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [RESEND GIT PULL] exynos-drm-next
Date: Mon,  9 Sep 2024 09:46:41 +0900
Message-Id: <20240909004641.406858-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIKsWRmVeSWpSXmKPExsWy7bCmrm6R6700g/utLBa9504yWfzfNpHZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITuj98x+toKtQhXzXi5kbGD8xdfF
 yMkhIWAicfH8ReYuRi4OIYEdjBKXXt9ngXA+MUocfLESyvnGKHHv0j1WuJYv+1ghEnsZJeZd
 7GOEcL4wSlz8+pERpIpNQFVi4or7bCC2CJD9dtJjZhCbWcBN4s/SsywgtrCAlsTNhVeBJnFw
 sADVPJ6qBhLmFbCSOHnrMjvEMnmJmZe+s0PEBSVOznzCAjFGXqJ562ywuyUEtrFLTD6wmxmi
 wUVi5o7vTBC2sMSr41ugBklJvOxvY4domMwocef6ChYIZwajxOGf1xkhqowl9i+dzARyEbOA
 psT6XfoQ2/gk3n3tATtUQoBXoqNNCKJaSeLYxRtQnRISF5ZMZIOwPSSWbGgDu0FIIFZi3+YW
 lgmMcrOQ/DALyQ+zEJYtYGRexSiWWlCcm55abFhgBI/K5PzcTYzgtKZltoNx0tsPeocYmTgY
 DzFKcDArifD2291LE+JNSaysSi3Kjy8qzUktPsRoCgzUicxSosn5wMSaVxJvaGJpYGJmZGxi
 YWhmqCTOe+ZKWaqQQHpiSWp2ampBahFMHxMHp1QDk4vvvdexsiHhX+7OVjE69TS17ug+/R9T
 qrbtvbrwvOfDEtXlZcFRNS0KarqXywVNV89fbbQkht9+/7kp7Wt7ZkvpqYcGezqu+rHlVPar
 Osv/2R1qF9/bX+Wx9TlUtEXnb4qbhW1b8tGG03Jdh358ZFy/q4y168ql37et/pg8ilqrl7bn
 xOvcb4YPTue+qTOc9D99auvWsLBU5chzqhzyezjyd3W3zNZgvLSq3EDh9ErT9Cf7p2rtiDwx
 /ftKTvGfh9VPespt3rJpo+kN8V/r7i7qLmA7Z/jF6tXuukSxbPP3WvrPlR9MO1s7a112+6TI
 jdc7DK8dTzUw0py+YFrKv2+hOsfz4lymHX3E2RP2NlmJpTgj0VCLuag4EQD7JXMk9AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWy7bCSvG6h6700g7dLZSx6z51ksvi/bSKz
 xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV0bvmf1s
 BVuFKua9XMjYwPiLr4uRk0NCwETi4pd9rF2MXBxCArsZJeat28HexcgBlJCQ2LKVA8IUljh8
 uBii5BOjxLs3c5lBetkEVCUmrrjPBmKLCKhLPLi8kBHEZhbwkHi/ZzU7iC0soCVxc+FVVpA5
 LED1j6eqgYR5BawkTt66zA5xgrzEzEvf2SHighInZz5hgRgjL9G8dTbzBEa+WUhSs5CkFjAy
 rWKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECA48Lc0djNtXfdA7xMjEwXiIUYKDWUmE
 t9/uXpoQb0piZVVqUX58UWlOavEhRmkOFiVxXvEXvSlCAumJJanZqakFqUUwWSYOTqkGJqOf
 uYabxMuDmY8pF90TnqE15ebpOpfb237LVB2/cDP445LYt8nKnT4MCu/KpFwmGCz49tM/78+V
 lsr49B+yYpdNp2g4VMdYvhQ7cKtli3jMBHvx0JWzjbsFjfT3bJ5T8zbL6OaxBS7SvvWfFWyb
 LCTe7jBse8pjduzZqZ8i5/n8bsSost9ZG1VS/vbgRFGd0E9c3dM0tvTJHYy/P/Vl4MLpE2Z+
 nNG5kj139VVxUf8slhMJK47nPXTonjvhl1LCn0mzP39zn3wheO626gPdk066JLF5mbM0zjPw
 kmqKr6jT2X1On6+G487xIpHmgAN3/I3m73xSc/P7Z/lYL/l1FxYyfb2l/efdF33lCUslFimx
 FGckGmoxFxUnAgBs5e/4qwIAAA==
X-CMS-MailID: 20240909004641epcas1p3a3879721c9f81a063209cf7a752b36c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240909004641epcas1p3a3879721c9f81a063209cf7a752b36c0
References: <CGME20240909004641epcas1p3a3879721c9f81a063209cf7a752b36c0@epcas1p3.samsung.com>
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

Hi Dave and Daniel,

   Just three cleanups and one fixup.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit e066e9aa4d9c869c92d1d03647472e4ce96c0919:

  MAINATINERS: update drm maintainer contacts (2024-09-03 20:07:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.12

for you to fetch changes up to 94ebc3d3235c5c516f67315059ce657e5090e94b:

  drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind() (2024-09-06 16:08:30 +0900)

----------------------------------------------------------------
Three cleanups
- Drop stale exynos file pattern from MAINTAINERS file
  The old "exynos" directory is removed from MAINTAINERS as Samsung Exynos
  display bindings have been relocated. This resolves a warning
  from get_maintainers.pl about no files matching the outdated directory.

- Constify struct exynos_drm_ipp_funcs
  By making struct exynos_drm_ipp_funcs constant, the patch enhances
  security by moving the structure to a read-only section of memory.
  This change results in a slight reduction in the data section size.

- Remove unnecessary code
  The function exynos_atomic_commit is removed as it became redundant
  after a previous update. This cleans up the code and eliminates
  unused function declarations.

One fixup
- Fix wrong assignment in gsc_bind()
  A double assignment in gsc_bind() was flagged by the cocci tool and
  corrected to fix an incorrect assignment, addressing a potential issue
  introduced in a prior commit.

----------------------------------------------------------------
Christophe JAILLET (1):
      drm/exynos: Constify struct exynos_drm_ipp_funcs

Krzysztof Kozlowski (1):
      dt-bindings: MAINTAINERS: drop stale exynos file pattern

Kwanghoon Son (1):
      drm/exynos: Remove unnecessary code

Yuesong Li (1):
      drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()

 MAINTAINERS                                | 1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h    | 4 ----
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 2 +-
 5 files changed, 4 insertions(+), 9 deletions(-)
