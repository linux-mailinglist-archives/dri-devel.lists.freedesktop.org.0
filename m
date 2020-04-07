Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340C1A0E95
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 15:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA5A6E87E;
	Tue,  7 Apr 2020 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8BD6E0CF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 13:43:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200407134314euoutp0234fda9757b31e72f3aeccec681801a1b~DjW08AW3T1136211362euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200407134314euoutp0234fda9757b31e72f3aeccec681801a1b~DjW08AW3T1136211362euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1586266994;
 bh=sZhEvnyjn1LLj7ChRwT2XLrexvdgfcq+CTsOxSFK1Ko=;
 h=From:To:Cc:Subject:Date:References:From;
 b=L5RM/cPWOqJHjGxAVUWEcChkF4lsYcjzWKgn5bDD+2D95EU1vPuGSvlKpmS8148Pe
 b2KwWjs4l83vVSfdEFTKLN58IT8zK+SImEhmNCCUuCTMMZ5oJ3YpVxxSoCBRvPjR6O
 gptTVzTZ2sOvWCg4Typ5nNq4BgdqVDY7/U24doyg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200407134313eucas1p2eac497eabe8c7345a52ec50e03c90e7d~DjW0pTy3e0299802998eucas1p2N;
 Tue,  7 Apr 2020 13:43:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5A.7D.61286.1738C8E5; Tue,  7
 Apr 2020 14:43:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200407134313eucas1p1d55cc16cb66b11ee5e1e5fd94cf25473~DjW0WDLf-0333503335eucas1p1u;
 Tue,  7 Apr 2020 13:43:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200407134313eusmtrp14e553aafc5171090e82581d380ffbd22~DjW0VZoq32789027890eusmtrp1L;
 Tue,  7 Apr 2020 13:43:13 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-39-5e8c83713b0e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.1F.08375.1738C8E5; Tue,  7
 Apr 2020 14:43:13 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200407134313eusmtip1856272ac566a2b65054279b837a16272~DjWz9D5Ht0251902519eusmtip1n;
 Tue,  7 Apr 2020 13:43:12 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/3] ExynosDRM - rework GEM internals
Date: Tue,  7 Apr 2020 15:42:53 +0200
Message-Id: <20200407134256.9129-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djP87qFzT1xBlfv6VjcWneO1WLjjPWs
 Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOYrLJiU1J7Ms
 tUjfLoErY+U7voKN7BXrnh1gaWBsZOti5OCQEDCRWD1HrIuRi0NIYAWjxPdLhxghnC+MEr9W
 foZyPjNK7P36mqmLkROs4+C3vVCJ5YwSCy53s8K1/DvWzgZSxSZgKNH1tgvMFhFwk2g6PBOs
 iFngOqPEtx+L2EESwgKmEp3bt4CNZRFQlTjzdBcziM0rYCNxfnYXI8Q6eYnVGw5AxQUlTs58
 wgJiMwPFm7fOZgYZKiHwm03iwtYtUA0uEneW/2GDsIUlXh3fwg5hy0icntzDAtHQzCjx8Nxa
 dginh1HictMMqG5riTvnfoHDhllAU2L9Ln2IsKPElk29zJAg45O48VYQ4gg+iUnbpkOFeSU6
 2oQgqtUkZh1fB7f24IVLzBC2h8Smpy/AbCGBWInz3x6yTWBUmIXktVlIXpuFcMMCRuZVjOKp
 pcW56anFhnmp5XrFibnFpXnpesn5uZsYgYnl9L/jn3Ywfr2UdIhRgINRiYf3QWJPnBBrYllx
 Ze4hRgkOZiURXqnezjgh3pTEyqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQnlqRmp6YWpBbB
 ZJk4OKUaGEv4FE+9n3WqUcm+Lf1W/NnMjoJah7T6kwWPv23L0lWPK+af1Sj/qV9xpcoG03lm
 Vpr5r1h62ya+Cb4lnFvONMvrjaqM18fXj5+4Vky7Mof5yO/Ca269CY7bn0l/kvZp/Haihscr
 f4MvZ99s3rVzfH0L7k3jeZz7vPRqEPvpvRdvR2jFJJq2KLEUZyQaajEXFScCADsBX3UoAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42I5/e/4Xd3C5p44g43vxS1urTvHarFxxnpW
 iytf37NZTLo/gcVixvl9TBZrj9xlt5gx+SWbA7vH/e7jTB59W1YxenzeJBfAHKVnU5RfWpKq
 kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsfIdX8FG9op1zw6w
 NDA2snUxcnJICJhIHPy2l7GLkYtDSGApo0TfkYssEAkZiZPTGlghbGGJP9e62CCKPjFKbP7S
 zQiSYBMwlOh62wU2SUTAQ6L523F2kCJmgduMEks/zAObJCxgKtG5fQsTiM0ioCpx5ukuZhCb
 V8BG4vzsLkaIDfISqzccgIoLSpyc+QSolwNokLrE+nlCIGFmoJLmrbOZJzDyz0JSNQuhahaS
 qgWMzKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECg3/bsZ+bdzBe2hh8iFGAg1GJh/dBYk+c
 EGtiWXFl7iFGCQ5mJRFeqd7OOCHelMTKqtSi/Pii0pzU4kOMpkAvTGSWEk3OB0ZmXkm8oamh
 uYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRo7lMbfPH54j9PGH+eFC0/lP
 Z3Ttu9HR9mtDsU/w70+/bveKJv662Ldevb+vLdm/V2VmBPN+zt+9M7fwPN+oFz/71pXOvZa5
 M66oHJi7bMkPlRMxXgE9XNvarAuVE15UPX23pj7/3apXETn2p76bs7Pn1W+9yOWwqlDhluuv
 YIejx4r5lJf5KymxFGckGmoxFxUnAgABgoE2lAIAAA==
X-CMS-MailID: 20200407134313eucas1p1d55cc16cb66b11ee5e1e5fd94cf25473
X-Msg-Generator: CA
X-RootMTR: 20200407134313eucas1p1d55cc16cb66b11ee5e1e5fd94cf25473
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407134313eucas1p1d55cc16cb66b11ee5e1e5fd94cf25473
References: <CGME20200407134313eucas1p1d55cc16cb66b11ee5e1e5fd94cf25473@eucas1p1.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

The recent discussion under the 'drm/prime: fix extracting of the DMA
addresses from a scatterlist' [1] patch inspired me to take a look again
into the Exynos DRM GEM internals. I've made a little cleanup and
reworked some parts to make them more error proof for the various
corner-cases.

[1] https://patchwork.freedesktop.org/patch/359081/ patch 

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (3):
  drm/exynos: gem: Remove dead-code
  drm/exynos: gem: Rework scatter-list contiguity check on Prime import
  drm/exynos: gem: Get rid of the internal 'pages' array

 drivers/gpu/drm/exynos/exynos_drm_drv.c   |   1 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  28 +---
 drivers/gpu/drm/exynos/exynos_drm_gem.c   | 178 ++++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |  16 +-
 4 files changed, 66 insertions(+), 157 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
