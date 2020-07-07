Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31395216B15
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 13:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4952D89D64;
	Tue,  7 Jul 2020 11:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A4389D64
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 11:09:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200707110912euoutp01a72f62bc157cc7ab4069e2ce9f1f1d28~fc9UmBvnk2636926369euoutp01q
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 11:09:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200707110912euoutp01a72f62bc157cc7ab4069e2ce9f1f1d28~fc9UmBvnk2636926369euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594120152;
 bh=ZMkEvaJNAdjnIUQSykqZ13TdaXgLLlmLzYW2nWTOa2Y=;
 h=From:To:Cc:Subject:Date:References:From;
 b=LRyVEGLMxzpPJBo22A55x2xwXZDUbeak50C/zSADqIjL6W+U6Tn7HGrx3czHIuA8d
 LKZRUpNpNm0gncZKAR3EdIrF6Xa5/a/w/yCX3MWjCMwsRQkmyTGGMXyQgOcAY5cWv3
 pwrTWceySwAt7ZdPsYEkjGNoqxB9oTkCt82o/R+M=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200707110912eucas1p165fa760920130bbfc979580b4a84fb36~fc9USwYCc0474204742eucas1p1_;
 Tue,  7 Jul 2020 11:09:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id D4.25.05997.8D7540F5; Tue,  7
 Jul 2020 12:09:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f~fc9Tsg9VY0474204742eucas1p19;
 Tue,  7 Jul 2020 11:09:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200707110911eusmtrp25305f326f8b94d9f8a36ca04de0b60d1~fc9Tr79gJ3052730527eusmtrp2a;
 Tue,  7 Jul 2020 11:09:11 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-0d-5f0457d81115
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DA.76.06314.7D7540F5; Tue,  7
 Jul 2020 12:09:11 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200707110910eusmtip29ae819d5e368c4389517d19fe2b3d76c~fc9TMgJ4J2655526555eusmtip2g;
 Tue,  7 Jul 2020 11:09:10 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: gem: Fix sparse warning
Date: Tue,  7 Jul 2020 13:08:59 +0200
Message-Id: <20200707110859.3822-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7djP87o3wlniDZ4sZrG4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAcxSXTUpqTmZZ
 apG+XQJXRsuy86wFN9krPl6ZwNTAeImti5GTQ0LAROLAryssXYxcHEICKxglTjx5B+V8YZRY
 uX0FE4TzmVFi+adPLDAtHU3noaqWM0psOn+cEa7l3MJl7CBVbAKGEl1vu8CWiAi4STQdnskK
 UsQscJ1R4tuPRWBFwkCj/uzYCFbEIqAqMePKEkYQm1fARmLKvgVMEOvkJVZvOMAM0iwhcIRN
 4tCEu8wQCReJLd9b2SFsYYlXx7dA2TIS/3fOZ4JoaGaUeHhuLTuE08MocblpBiNElbXEnXO/
 gFZzAN2kKbF+lz5E2FFi17ZdjCBhCQE+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t7
 8MIlqNM8JFZtPApWLiQQK/H7cd0ERrlZCKsWMDKuYhRPLS3OTU8tNspLLdcrTswtLs1L10vO
 z93ECIz90/+Of9nBuOtP0iFGAQ5GJR7eDjbmeCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlal
 FuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvEwSnVwNguufNki4Tyj/0Xr8u9
 WFh3PvZ3tN7cL5xpqdsjgtMY1RbadejPTC45FvNtM4v3lJJc//mnlX6EmSo/2dAiG2FQ7/B2
 ednqObtb2+a+2SPjKMWWYPrcpPd9QMKc/sMGGyYrnmCZf0Kl+m3mXpNt0elpHpkLA3ROiiy8
 e/KWY6zFkyn3o6/1RSuxFGckGmoxFxUnAgBEpi+i+QIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsVy+t/xe7rXw1niDf5vELW4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAc5SeTVF+aUmq
 QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRsuy86wFN9krPl6Z
 wNTAeImti5GTQ0LARKKj6TxLFyMXh5DAUkaJU7deMUEkZCROTmtghbCFJf5c62KDKPrEKPFm
 /xSwIjYBQ4mut11gk0QEPCSavx1nByliFrjNKLH0wzwWkIQw0Io/OzaCFbEIqErMuLKEEcTm
 FbCRmLJvAdQ2eYnVGw4wT2DkWcDIsIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMw5LYd+7l5
 B+OljcGHGAU4GJV4eBOOMMcLsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCj
 KdDyicxSosn5wHjIK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA
 KDTpkn125+aoZfyec/3W7zb4+ryLtd3jIP+ycrGIcLZTTL7/dRYsEpv+w9lmS/PjzW/uRbZ7
 1GpfziqzPvvqoertuYqmBVxvO60XCLQtXxMZt7mvXVhincpiF+emMuey7cd5BRpaI7+zf449
 mpfL25osfm/Vx9Z+8St2YYxf52znmH3Z8eNxJZbijERDLeai4kQAdQV8s08CAAA=
X-CMS-MailID: 20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f
X-Msg-Generator: CA
X-RootMTR: 20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f
References: <CGME20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f@eucas1p1.samsung.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a proper cast on the exynos_gem->kvaddr assignment to avoid a sparse warning.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 9940d9d93406 ("drm/exynos: gem: Get rid of the internal 'pages' array")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index efa476858db5..65d11784f29f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -59,7 +59,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	}
 
 	if (kvmap)
-		exynos_gem->kvaddr = exynos_gem->cookie;
+		exynos_gem->kvaddr = (void __iomem *)exynos_gem->cookie;
 
 	DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
