Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3D950D6F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B4610E3ED;
	Tue, 13 Aug 2024 19:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="uQuZwsWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 594 seconds by postgrey-1.36 at gabe;
 Tue, 13 Aug 2024 08:06:18 UTC
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B9610E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 08:06:18 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240813075622epoutp049d33b783db150084c36636558898e6b2~rOqmd8TY00962609626epoutp04J
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 07:56:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240813075622epoutp049d33b783db150084c36636558898e6b2~rOqmd8TY00962609626epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723535782;
 bh=Vo7rwKpkp6fdgQMuI2YGn3lntKeoO9zAaH61sSKSM1I=;
 h=From:Date:Subject:To:Cc:References:From;
 b=uQuZwsWM7a6IyJzHsxUjP8MK/wPgMEV/x8UhtyN7TRaASeLjFaG+piESrpYrg7pgA
 Dl0KdZN6CX8yQYwJ/M+uo4PwTapjCP8anbjt4MJU2EO/0Mh1jRYzKLKTofhiOaquBh
 wEEMmOmSl6mnkpFLKpEhApl+Gm8b9QU2ACBa1VJQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20240813075622epcas1p399a19ab9842de07be81a75d31bc0ee9b~rOqmIZZFP2806528065epcas1p3v;
 Tue, 13 Aug 2024 07:56:22 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.36.132]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4WjkGs4kGzz4x9QM; Tue, 13 Aug
 2024 07:56:21 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 AC.63.09725.5A11BB66; Tue, 13 Aug 2024 16:56:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240813075621epcas1p13a114c471fa953a5038d1897994edca5~rOqlNKNT62271322713epcas1p1B;
 Tue, 13 Aug 2024 07:56:21 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240813075621epsmtrp27fd6276860aedc2bc90320dbeba6fc30~rOqlL0G-P1577115771epsmtrp2G;
 Tue, 13 Aug 2024 07:56:21 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff700000025fd-50-66bb11a501ea
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CC.36.08964.4A11BB66; Tue, 13 Aug 2024 16:56:21 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240813075620epsmtip2aa5d4e472124f7bea6b70879e3aca5ee~rOqk4zd4o2760427604epsmtip2o;
 Tue, 13 Aug 2024 07:56:20 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Tue, 13 Aug 2024 16:55:47 +0900
Subject: [PATCH] drm/exynos: cleanup header include
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-clean_header-v1-1-6f950d09b877@samsung.com>
X-B4-Tracking: v=1; b=H4sIAIIRu2YC/x3MTQqAIBBA4avIrBP8ibCuEhGiYw6EhUIE4t2Tl
 t/ivQoFM2GBhVXI+FChK3XIgYGLNh3IyXeDEmoURmruTrRpj2g9Zm4mPWthTTAqQE/ujIHef7d
 urX1FtpSaXgAAAA==
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,  Kwanghoon
 Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEJsWRmVeSWpSXmKPExsWy7bCmnu5Swd1pBhtfKFicuL6IyeLBvG1s
 Fv+3TWS2uPL1PZvFpPsTWCx611xlsjh/fgO7xdmmN+wWmx5fY7W4vGsOm8WM8/uYLGZMfsnm
 wOOx99sCFo+ds+6ye2xa1cnmcb/7OJPH5iX1Hn1bVjF6fN4kF8AelW2TkZqYklqkkJqXnJ+S
 mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
 tCRVISO/uMRWKbUgJafAtECvODG3uDQvXS8vtcTK0MDAyBSoMCE748y/DuaCkxwV5z8fYWpg
 3MnexcjJISFgIvHn6RumLkYuDiGBHYwS59/vYIRwPjFKPHr3AaxKSOAbo8Ti9zUwHV+Xv2OH
 KNrLKHF3/2SojleMEv9u9jCCVLEJqEssaVsLVMXBwSKgKvHidz1IWFjAWOJg7ycWEJtXQFDi
 5MwnYDazgLzE9rdzmCHijhKdDzezgMyUEFjDKPGhbQIziCMi0MckMf/Ya7AMs8AmRolzF9ex
 QNwkLPF59xo2iJaVHBIHtm9ngki4SPy4eYAdpujV8S1QtpTE53d72SDsbImjH2HsEonrsxax
 QtjGEvuXTmYCeYFZQFNi/S59iFP5JN597WEFCUsI8Ep0tAlBmPIStzrLIRpFJc48/Qg10EPi
 /94rzJBQjJW4v/Ez+wRG+VlI/p+F5P9ZCLsWMDKvYhRLLSjOTU8tNiwwhsdqcn7uJkZwYtUy
 38E47e0HvUOMTByMhxglOJiVRHgDTXalCfGmJFZWpRblxxeV5qQWH2I0BUbCRGYp0eR8YGrP
 K4k3NLE0MDEzMjaxMDQzVBLnPXOlLFVIID2xJDU7NbUgtQimj4mDU6qB6ZbFDJZ7rdIL3URv
 9d2x8IpUWH7LunxmqOCWmCUmng9ELhr+/jDh6jXuWe7uQRdYj2W6izxS/RH3yqnp6IT6V5xJ
 G7YXv2xMKZ4s7KKscL5l2v1XO3dovevI2mCgEmP6MHhP6PTbWgZ3nQ44zpymNu2St+7VkPYN
 S+V/f55+/8dkPS5DuxZ2w5khKUzyi35Ip3JlTjgb+VSo4+yLik++hieTjh9rOMm1Qz1VQDxD
 NU7N4ELkV6u559/esvBvD+Su9pNQmlnN1KY0f0Gs7w3+9u7O1N8WX2JPaDZHzvZmCXilYBEY
 OOfQ79C3236Vro5fmxmS+GN/XSB3I3vbzd5V06dMF5Ba626wJNHb6twPJZbijERDLeai4kQA
 J+hOeDUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsWy7bCSvO5Swd1pBl+XMlmcuL6IyeLBvG1s
 Fv+3TWS2uPL1PZvFpPsTWCx611xlsjh/fgO7xdmmN+wWmx5fY7W4vGsOm8WM8/uYLGZMfsnm
 wOOx99sCFo+ds+6ye2xa1cnmcb/7OJPH5iX1Hn1bVjF6fN4kF8AexWWTkpqTWZZapG+XwJVx
 5l8Hc8FJjorzn48wNTDuZO9i5OSQEDCR+Lr8HZDNxSEksJtRomf2OVaIhKhEx+VGxi5GDiBb
 WOLw4WKImheMEhO+dzOD1LAJqEssaVvLDlLDIqAq8eJ3PUhYWMBY4mDvJxYQm1dAUOLkzCcs
 ICXMApoS63fpg4SZBeQltr+dwwxR4ijR+XAzC8h4CYE1jBLzv7YxgzgiAhOYJNpmPmMFcZgF
 NjNKLJ69nQniOGGJz7vXsE1gFJiFZMkshCWzkCxZwMi8ilEytaA4Nz232LDAMC+1XK84Mbe4
 NC9dLzk/dxMjOGK0NHcwbl/1Qe8QIxMH4yFGCQ5mJRHeQJNdaUK8KYmVValF+fFFpTmpxYcY
 pTlYlMR5xV/0pggJpCeWpGanphakFsFkmTg4pRqYFqyuk4uzuvlRuF77Zttb5aan5TNOvqie
 3VDB/MtYdJKtS0Himk7bdy6H0p5ITb6ptfPg63cB7F9SDNJPM8y/bCkzzfDBNJaEbp9VyxQd
 N/6+IvJv6cU7buse7zM5Vr91spykwo20Fw7KbQ3TvdYKL/xuuKdsHsNkxjuVT3e/U2zY+8X9
 l8+eScerUrb8NfzwNKei58X1zFNzZprtDqm+8erLy29CUq8LeSxO1P1Izn6XGy+8di2L8pVt
 e/R+LLTdZ8ihOEft5LbTnuwhOfOaTqx2iH9et7rJnk999oqdskVsH4+uteec2OuqXCnrfURE
 rDNC/HBx0/mHygHreLuls+UdnkYYhW8R3F2ioTrfW4mlOCPRUIu5qDgRADhTciEHAwAA
X-CMS-MailID: 20240813075621epcas1p13a114c471fa953a5038d1897994edca5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240813075621epcas1p13a114c471fa953a5038d1897994edca5
References: <CGME20240813075621epcas1p13a114c471fa953a5038d1897994edca5@epcas1p1.samsung.com>
X-Mailman-Approved-At: Tue, 13 Aug 2024 19:55:46 +0000
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

Cleanup header include

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index fc1c5608db96..b6139e179aa9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -10,17 +10,12 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_probe_helper.h>
 #include <drm/exynos_drm.h>
 
-#include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
 #include "exynos_drm_fb.h"
-#include "exynos_drm_fbdev.h"
 
 static int check_fb_gem_memory_type(struct drm_device *drm_dev,
 				    struct exynos_drm_gem *exynos_gem)

---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240813-clean_header-863930a8f82f

Best regards,
-- 
Kwanghoon Son <k.son@samsung.com>

