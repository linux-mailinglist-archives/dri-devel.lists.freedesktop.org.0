Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8975717113F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 08:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253386EBF4;
	Thu, 27 Feb 2020 07:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B3E6EBF4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 07:06:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200227070650euoutp02a0b314a5fae0a9fa73ab10e2f9219f83~3MJT5H4Tv2313623136euoutp027
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 07:06:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200227070650euoutp02a0b314a5fae0a9fa73ab10e2f9219f83~3MJT5H4Tv2313623136euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582787210;
 bh=TJmaPby/SK5iUef1kmGVJ3ZKmyzeMQArHD4PSzu1Wco=;
 h=From:To:Cc:Subject:Date:References:From;
 b=dATCsxDupzKKQEypPsfP2ANnEIFiK7b4Iqz+Kfj7ysNU/kjW0yU5gVchATLTia52c
 W6rHqN+3p3gwbxax22UwCVp2fNbDM0BYVKbXBWR4kYQJlkFj/6rD53el0py/p6GDWX
 xCnLwVt3jpgXJc6+cp7EE1Yf89DCOFwH6qyRLcck=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200227070650eucas1p261b305dfc605373b2a8c228f5523edb2~3MJTnh-Th2017720177eucas1p2e;
 Thu, 27 Feb 2020 07:06:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EB.F1.60698.A8A675E5; Thu, 27
 Feb 2020 07:06:50 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200227070649eucas1p15dcf4847b369fc20bd2a96f697b1173b~3MJTCLjEs0193901939eucas1p1D;
 Thu, 27 Feb 2020 07:06:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200227070649eusmtrp230042b11ad8e8b56b6eb90399c4b9ad6~3MJTBkbO71480014800eusmtrp2P;
 Thu, 27 Feb 2020 07:06:49 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-15-5e576a8a4fd4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9F.97.07950.98A675E5; Thu, 27
 Feb 2020 07:06:49 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200227070649eusmtip218aa6e750e4e1b6e0e4767a4d0a74eec~3MJSlYiN02145521455eusmtip2u;
 Thu, 27 Feb 2020 07:06:48 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] drm/exynos: dsi: propagate error value and silence
 meaningless warning
Date: Thu, 27 Feb 2020 08:06:37 +0100
Message-Id: <20200227070637.4115-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRjm27nsuJwdj5IvWmrrauEtDQ5kURCxosA/GUVetjx43Rybd6iG
 hdkWMhV0SpmUkSy2qYldtGFqDTGm5TCzxJa/tLyUGhhlbTua/54rz/vBR2HMAh5MZSnzObVS
 lishRXjn6xVHpC77XErMxB2CHbc4CLbNaCVY5/I8yVZPGnB2aKhVyBqHbALW3D/hRjXT5FFK
 2m66SUon9XaBtLLDhKSL7aGJ+AVRQjqXm1XIqaOPpIkyV3p8VbVUsdnZRGrRHKlDPhTQ8VC5
 Wo7pkIhi6BYEhtVZgidLCEbrX62RRQSmgTrBemX48dJa5SECs1O/UXlQ+5XwpEg6FnSzOu9I
 IH0CyvrqvSGM1gpAXz7uNQLoi2CdKxN6ME7vgi8jfEFMJ4Dp9gzBz4XBo9Ye7xzQIyS0VDTi
 vHEcPs+Mrj0jAGbsHUIeb4W/z+4K+MI1BC6HWciTWwhGyoyITx2CT45f7jblvikCrM+jefkY
 9Ex3I48MtB+Mzfp7ZMwNqzvrMF4WQ0U5w6d3Q4Pd8n/25fA7jMdSMDp+eE9j6GSosY/hBhTa
 sLHVhJAJBXEFGkUGp4lTckVRGplCU6DMiLqUp2hH7n8wuGpffopsv+W9iKaQxFeskielMISs
 UFOi6EVAYZJAcdvy2RRGnC4rKeXUeanqglxO04tCKFwSJI67N53M0BmyfC6H41Scet0VUD7B
 WnQyUbtd1K/DmiKSDI1dafuVkvcKuzny+9SU7VvJ9vi9XdnhVa62J64pzjq/fN21cFDYXWVh
 BadOR/unvjGcvxI+uSUYNn/c2fzTkpye3Rz2drDKnuMjvhxSumeAKx7T39h0P4Yh6ncoOs40
 qF70yYuW+g8fcF79YNu28sdPDhMSXJMpi92HqTWyfwLnQggDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsVy+t/xe7qdWeFxBpduS1vcWneO1WLjjPWs
 Fle+vmezmHR/AovF+fMb2C1mnN/HZLH2yF0ga/JLNgcOj02rOtk87ncfZ/Lo27KK0ePzJrkA
 lig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jJ8H
 eAqmcVSsvbKArYHxHVsXIyeHhICJxIXNX5i7GLk4hASWMkq8/XuRBSIhI3FyWgMrhC0s8eda
 FxtE0SdGiT0rlrCDJNgEDCW63naBTRIR8JBo/nacHaSIWaCFSeL/mg/MIAlhgSiJTRcegtks
 AqoSjy5DNPAK2EismvMKaoO8xOoNB5gnMPIsYGRYxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJ
 ERiE24793LKDsetd8CFGAQ5GJR7egqSwOCHWxLLiytxDjBIczEoivBu/hsYJ8aYkVlalFuXH
 F5XmpBYfYjQFWj6RWUo0OR8YIXkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KL
 YPqYODilGhi39h1Z2zAvoIlpT1rotfC87xMj1x0y7chm0Furd/D0j+dfU8uaf+r/XOnW/3VR
 g7vh7blHNa4l/BH8I9R4+Y90I7/LmZVhVlPq78lIVzrv3C+ormKsaK0q90ukq7hJb0H415ay
 3bcSzSdJK9/gWnLBsmjWz/6m6inth3tDavvbyuKrWybfkFRiKc5INNRiLipOBADJjRFJWAIA
 AA==
X-CMS-MailID: 20200227070649eucas1p15dcf4847b369fc20bd2a96f697b1173b
X-Msg-Generator: CA
X-RootMTR: 20200227070649eucas1p15dcf4847b369fc20bd2a96f697b1173b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200227070649eucas1p15dcf4847b369fc20bd2a96f697b1173b
References: <CGME20200227070649eucas1p15dcf4847b369fc20bd2a96f697b1173b@eucas1p1.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Properly propagate error value from devm_regulator_bulk_get() and don't
confuse user with meaningless warning about failure in getting regulators
in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2: rephrased commit message
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 33628d85edad..3f6fcd453d33 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1773,8 +1773,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dsi->supplies),
 				      dsi->supplies);
 	if (ret) {
-		dev_info(dev, "failed to get regulators: %d\n", ret);
-		return -EPROBE_DEFER;
+		if (ret != -EPROBE_DEFER)
+			dev_info(dev, "failed to get regulators: %d\n", ret);
+		return ret;
 	}
 
 	dsi->clks = devm_kcalloc(dev,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
