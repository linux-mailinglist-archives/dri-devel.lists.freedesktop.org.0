Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0F21911A8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 14:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131A46E48C;
	Tue, 24 Mar 2020 13:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDA66E48C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:22 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200324134519euoutp026cbcbb806f9aa7f1323f580221ca5ea5~-QWphjeb83077430774euoutp02j
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200324134519euoutp026cbcbb806f9aa7f1323f580221ca5ea5~-QWphjeb83077430774euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585057519;
 bh=rhhrPM93CG0b8oKYRKwOJigfjSTatX4Tm1+HO5o6DnM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=byd8ohrNTW7n5MPLVVNMgJ5gjscE07GWSs4VtEhMln1q6C6RnDMxtdAA06+NNj2+j
 JQdMo7EqVKDhyXqW+3grgaCX4hrMOk/BP/T4I3Db8SlhPFru2nYJ4a8l3pAHGT+DQh
 7RkGhU6WSmXmYcZQaVFnErnoFxBObmUqddaDkxTg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200324134518eucas1p11bc8b62d77fe0f52777f46d2c2d603f1~-QWpTK8Ke1592815928eucas1p1M;
 Tue, 24 Mar 2020 13:45:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 06.48.60679.EEE0A7E5; Tue, 24
 Mar 2020 13:45:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200324134518eucas1p1440c92398ddcbe5ea72d6db3703d3f97~-QWo6xfPk0905409054eucas1p1j;
 Tue, 24 Mar 2020 13:45:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200324134518eusmtrp17752f05b21be98ec271b0054dcafead6~-QWo6I03L2619426194eusmtrp1n;
 Tue, 24 Mar 2020 13:45:18 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-c2-5e7a0eee4996
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4B.E6.08375.EEE0A7E5; Tue, 24
 Mar 2020 13:45:18 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200324134517eusmtip27d0ef96226851c80515eca3644966487~-QWojJSDK3226032260eusmtip2z;
 Tue, 24 Mar 2020 13:45:17 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] video: fbdev: controlfb: small cleanup
Date: Tue, 24 Mar 2020 14:45:02 +0100
Message-Id: <20200324134508.25120-1-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7rv+KriDM4v0bG4te4cq8XGGetZ
 La58fc9mcaLvA6vF5V1z2CxW/NzK6MDmcb/7OJPHkmlX2Tz6tqxi9Pi8SS6AJYrLJiU1J7Ms
 tUjfLoEro+3jVfaCiZwV77YdY2xgPMTexcjJISFgInFq+V6mLkYuDiGBFYwSB38dZoNwvjBK
 3H78gxHC+cwoceJfAzNMy7G+1+wQieWMEssvT2KBa5n5dDXYYDYBK4mJ7asYQWwRgQSJFdNn
 gNnMAikSH7b8B1rIwSEsYCdx9l4oSJhFQFVi/+dZYCW8ArYSV9cuZ4NYJi+x9dsnVoi4oMTJ
 mU9YIMbISzRvnc0MsldC4DGbxI+F66Guc5GYO3kZ1HPCEq+Ob4GyZSROT+5hgWhYxyjxt+MF
 VPd2oBcm/4NaZy1x59wvNpDrmAU0Jdbv0ocIO0qsmHAQ7GgJAT6JG28FIY7gk5i0bTozRJhX
 oqNNCKJaTWLDsg1sMGu7dq6EOs1D4uv8K2DlQgKxEu/Pu09gVJiF5LNZSD6bhXDCAkbmVYzi
 qaXFuempxUZ5qeV6xYm5xaV56XrJ+bmbGIFp5fS/4192MO76k3SIUYCDUYmHV+NhZZwQa2JZ
 cWXuIUYJDmYlEd7NqRVxQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgt
 gskycXBKNTBmxChcFptep/FPOfj7lcdcJczT565f+MlmxlIhR3XNH4aTp22UDmFd19ORzZC7
 vftCxvEVW9P+7L45icUlzaN/X+//LWtdOQXWmAgHhKSYforhW9192uBQz+uOResZnN+UL9P4
 EVxy5q3gVt9cv4O3yvyffPnsLBxxofTbyRtvvhaYbXib+OWYEktxRqKhFnNRcSIAKb4XCScD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsVy+t/xe7rv+KriDA6fELC4te4cq8XGGetZ
 La58fc9mcaLvA6vF5V1z2CxW/NzK6MDmcb/7OJPHkmlX2Tz6tqxi9Pi8SS6AJUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo+3jVfaCiZwV77Yd
 Y2xgPMTexcjJISFgInGs7zWYLSSwlFHi7Wu9LkYOoLiMxPH1ZRAlwhJ/rnWxQZR8YpRY9FsV
 xGYTsJKY2L6KEcQWEUiS6Gw4yQxiMwukSUw6e5cJZIywgJ3E2XuhIGEWAVWJ/Z9ngZXzCthK
 XF27nA1ivLzE1m+fWCHighInZz5hgRgjL9G8dTbzBEa+WUhSs5CkFjAyrWIUSS0tzk3PLTbU
 K07MLS7NS9dLzs/dxAgM5G3Hfm7ewXhpY/AhRgEORiUeXo2HlXFCrIllxZW5hxglOJiVRHg3
 p1bECfGmJFZWpRblxxeV5qQWH2I0BTp2IrOUaHI+MMrySuINTQ3NLSwNzY3Njc0slMR5OwQO
 xggJpCeWpGanphakFsH0MXFwSjUwCvy/tZC71+XOGmuzc/ulerRrvi2xXyyWJrT8X3jGcd5f
 nySeLXD9sLBw+8pgodqKKb6JSjovHkY//Xl+5uJHhyZUHfy9rEv1ke12RXElpfjvLuuuFFw0
 lFHzv3r55X3NnU4ue3vudb1Jj12gvSKgJt34dotq1yKJJyKKAvbmuzQe+gne6fjXq8RSnJFo
 qMVcVJwIANodE096AgAA
X-CMS-MailID: 20200324134518eucas1p1440c92398ddcbe5ea72d6db3703d3f97
X-Msg-Generator: CA
X-RootMTR: 20200324134518eucas1p1440c92398ddcbe5ea72d6db3703d3f97
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324134518eucas1p1440c92398ddcbe5ea72d6db3703d3f97
References: <CGME20200324134518eucas1p1440c92398ddcbe5ea72d6db3703d3f97@eucas1p1.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Small cleanup for controlfb driver:

- fix sparse warnings
- remove not working module support
- add COMPILE_TEST support
- remove redundant function prototypes

Changes since v1
(https://lore.kernel.org/lkml/20200116140900.26363-1-b.zolnierkie@samsung.com/):
- use in_le32() instead of le32_to_cpup()
- use eieio() and dcbf() helpers
- add invalid_vram_cache() helper
- add more dummy CONFIG_PPC_PMAC=n helpers to avoid ifdefs
- add ACKs from Sam

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


Bartlomiej Zolnierkiewicz (6):
  video: fbdev: controlfb: fix sparse warning about using incorrect type
  video: fbdev: controlfb: add COMPILE_TEST support
  video: fbdev: controlfb: remove obsolete module support
  video: fbdev: controlfb: remove function prototypes part #1
  video: fbdev: controlfb: remove function prototypes part #2
  video: fbdev: controlfb: remove function prototypes part #3

 drivers/video/fbdev/Kconfig     |   2 +-
 drivers/video/fbdev/controlfb.c | 828 +++++++++++++++-----------------
 2 files changed, 391 insertions(+), 439 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
