Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8821B288990
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 15:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529936ECD2;
	Fri,  9 Oct 2020 13:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3682F6ECD2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 13:05:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201009130532euoutp0210a75592e2b60a146a0916d226060083~8VLuoRBb_2256922569euoutp02M
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 13:05:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201009130532euoutp0210a75592e2b60a146a0916d226060083~8VLuoRBb_2256922569euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1602248732;
 bh=BMbyOgKgnhqWB0hHzkx3EdjifEKrLwNecg/HFM+MhEU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=tWiWfWpKXHxIAuoNHrtihNFaYBvalu0F9+6tEX+f7OusUdhuJk1u+wJqldVvPlBsV
 A01hdJ+9wnzVIWsQlaWTnfVlDQrvLkB97Vgb23OE1GQFkR8WxZ/awTk2v5uyf1L7wZ
 6ftmwDRfLVkdcCrFxLixZbIi7jKVOiDE1eyg29N8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201009130532eucas1p280b9de4691fefea512ce90a2a737638e~8VLueJ9Zg3177031770eucas1p2P;
 Fri,  9 Oct 2020 13:05:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C2.5F.06318.C10608F5; Fri,  9
 Oct 2020 14:05:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799~8VLuHvKdY2597425974eucas1p2z;
 Fri,  9 Oct 2020 13:05:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201009130531eusmtrp1baaf660e15d40f2818fff9d028ade697~8VLuHLOVa0217802178eusmtrp1W;
 Fri,  9 Oct 2020 13:05:31 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-6f-5f80601c1170
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 50.E1.06017.B10608F5; Fri,  9
 Oct 2020 14:05:31 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201009130531eusmtip13e11c335afcab17257691894fad251b2~8VLtswgww1454614546eusmtip1Z;
 Fri,  9 Oct 2020 13:05:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos/hdmi: add support for 1920x1200@60Hz mode
Date: Fri,  9 Oct 2020 15:05:24 +0200
Message-Id: <20201009130524.30828-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsWy7djPc7oyCQ3xBv+ucVncWneO1eLK1/ds
 FpPuT2CxmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdx2aSk5mSWpRbp2yVw
 ZWxb8YGp4DRHxeWp/1gaGJvZuxg5OSQETCTuTV3J1MXIxSEksIJR4v2fPnYI5wujxPRf69gg
 nM+MEt/W32OEaVl4ejULRGI5o8S+qVtZ4Fr6zq8CG8wmYCjR9baLDcQWEXCTaDo8kxWkiFlg
 IaPE/pY2JpCEsICrRO/JZWANLAKqEo82X2IGsXkFbCWmTNzGBLFOXmL1hgPMEPYBNon/G1gh
 bBeJzu3foOLCEq+Ob4H6SEbi9OQesIskBJoZJR6eW8sO4fQwSlxumgH1hLXEnXO/gM7jADpJ
 U2L9Ln2IsKNE0/K77CBhCQE+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIlqHM8
 JJZfOAe2SEggVmLSxMssExjlZiHsWsDIuIpRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMw
 4k//O/51B+O+P0mHGAU4GJV4eBmE6uOFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19U
 mpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVANj0vu1fRvuZe4Q2/buzLku5mJ1
 FcslWvc+Rn1nO5t6RtHrRALf/P9akbYn2eNjHEW98vaV9zIzzzGSWrH3GH9codm1p5Uik57+
 v7piid+t1owKgdblclE6835aHDugun7ygqawRwG2wT//+zqqlLYncR65xmjX+yGh597vD+cW
 /umTOKMawcGhxFKckWioxVxUnAgAYuzNH/QCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOLMWRmVeSWpSXmKPExsVy+t/xu7rSCQ3xBpcn6lncWneO1eLK1/ds
 FpPuT2CxmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEfp2RTll5akKmTkF5fY
 KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZWxb8YGp4DRHxeWp/1gaGJvZ
 uxg5OSQETCQWnl7N0sXIxSEksJRRYmPnBaiEjMTJaQ2sELawxJ9rXWwQRZ8YJdYde8AMkmAT
 MJToeguS4OQQEfCQaP52nB2kiFlgMaPEsz+XGEESwgKuEr0nl4FNZRFQlXi0+RJYM6+ArcSU
 iduYIDbIS6zecIB5AiPPAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIGBtu3Yzy07GLve
 BR9iFOBgVOLhXcFfHy/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQMsn
 MkuJJucDoyCvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAOj23Z9
 jTuMJ9zsOBVlfvj8/rlIQuhrtPePCy9uSAobBO5nis/xlG2df7k/4arz028L535K3tmsIFy3
 u3YV4+ptZ58KNOr+kzK9vVKyLNz/uoaur3+lOYeUf/PEzeu6un6JH0w9/a79xY3230L2hlv0
 3L7mJanPMefxr5m0+upJ4+hQn8zuWRZKLMUZiYZazEXFiQBVQIwhSgIAAA==
X-CMS-MailID: 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799
X-Msg-Generator: CA
X-RootMTR: 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799
References: <CGME20201009130531eucas1p25ba0c17803bd0647c65603feb3180799@eucas1p2.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add clock configuration for 154MHz pixelclock to Exynos542x HDMIPHY,
which is required for 1920x1200@60Hz mode. The PLL configuration data
has been taken from the vendor's kernel tree for the Odroid XU4 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index dc01c188c0e0..39fa5d3b01ef 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -522,6 +522,15 @@ static const struct hdmiphy_config hdmiphy_5420_configs[] = {
 			0x54, 0x4B, 0x25, 0x03, 0x00, 0x80, 0x01, 0x80,
 		},
 	},
+	{
+		.pixel_clock = 154000000,
+		.conf = {
+			0x01, 0xD1, 0x20, 0x01, 0x40, 0x30, 0x08, 0xCC,
+			0x8C, 0xE8, 0xC1, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0x3F, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
 };
 
 static const struct hdmiphy_config hdmiphy_5433_configs[] = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
