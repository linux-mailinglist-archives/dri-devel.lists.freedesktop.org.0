Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8E6273D57
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 10:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C43389930;
	Tue, 22 Sep 2020 08:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DD989930
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 08:32:23 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200922083221epoutp04a0014a5c3bbbe25e6d3b6307a184f8b8~3DfWh-ydU2867628676epoutp04w
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 08:32:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200922083221epoutp04a0014a5c3bbbe25e6d3b6307a184f8b8~3DfWh-ydU2867628676epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600763541;
 bh=fGPi3yuodYVA3M593PyFWDwnUuFC9Z4QYIo5H1/3txs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=kv8yRsauO1mcYiKUgJMhygbd5EzItGdXBsqHmVKkFzVM9QZvJwLBqZKNPks6ATeYo
 k4qTinPvXYK6f0HlWFCTlFntF4IB8aip6zFSUNKqg1GDUxnOQEDNsB+oE9lrTPZImo
 6tntSbvCsgNnpqUCI+UIVbrlma21nDZBLfzDZO48=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200922083220epcas1p21630dcfe30dbfdd5fbce896401e71b37~3DfV4BLG92356023560epcas1p2s;
 Tue, 22 Sep 2020 08:32:20 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.154]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4BwZL85KllzMqYkt; Tue, 22 Sep
 2020 08:32:16 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 5B.E9.09582.C86B96F5; Tue, 22 Sep 2020 17:32:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200922083212epcas1p3874ca74fbb2d46214b69bc0dd757aaaf~3DfOfJVCG0436704367epcas1p3T;
 Tue, 22 Sep 2020 08:32:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200922083212epsmtrp11df77360deae260fd90eb229e9f529d7~3DfOeivM_0032600326epsmtrp1u;
 Tue, 22 Sep 2020 08:32:12 +0000 (GMT)
X-AuditID: b6c32a37-8afff7000000256e-44-5f69b68c7b59
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 17.3C.08604.C86B96F5; Tue, 22 Sep 2020 17:32:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200922083212epsmtip11955315706774bcded1db345e9d0b4bd~3DfOQy9Dz2032420324epsmtip1n;
 Tue, 22 Sep 2020 08:32:12 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 22 Sep 2020 17:38:59 +0900
Message-Id: <1600763939-20032-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7bCmvm7Ptsx4g2udlha9504yWVz5+p7N
 Ysb5fUwOzB7bvz1g9bjffZzJ4/MmuQDmqGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0Nd
 Q0sLcyWFvMTcVFslF58AXbfMHKBFSgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC
 ywK94sTc4tK8dL3k/FwrQwMDI1OgwoTsjPfT5zMXbOSqWHJ9K3MD4wOOLkZODgkBE4mNx98z
 dTFycQgJ7GCUmLrtASuE84lR4t3SfWwQzjdGifVveplgWvZtOcgOkdjLKNF2/TyU84VR4uec
 NWBVbAKqEhNX3GcDsUUETCU6Ji1lAbGZgeL/1v9hBrGFBZQldl/fxwpiswDFH+2+AdbLK+Ai
 cf/cChaIbXISN891MoMskBBoZpc40vOFDSLhInHv0FxWCFtY4tXxLewQtpTEy/42dqgGRomJ
 M04zQTgdjBJ3H1+HGmsssX/pZKAEB9BJmhLrd+lDhBUldv6eywhxKZ/Eu689rCAlEgK8Eh1t
 QhAlShLHLt5ghLAlJC4smQh1j4fExo/PwOJCArESX76sZZ7AKDsLYcECRsZVjGKpBcW56anF
 hgXGyPG0iRGcfLTMdzBOe/tB7xAjEwfjIUYJDmYlEV41o/R4Id6UxMqq1KL8+KLSnNTiQ4ym
 wBCbyCwlmpwPTH95JfGGpkbGxsYWJoZmpoaGSuK8D28pxAsJpCeWpGanphakFsH0MXFwSjUw
 xf7eeqBJ/1Sc/NUP3qqBk5X6T5XpMm/6GBGSybtOsy3+E+f3RW8S99xO3lIS8EpEWFg0wP0f
 l4Xu2ao/YT+kNkscq/m+8mzWq3Pi/dwzPQwibr50+xHtqJj4y3hR9/Pg4NMOjrOqBf/lTH9U
 6LvVJ1d5dWQ6D3vzhbxw1bozSSeEuQ5+9Z/7NTmkbeJKuTVLD6y7x/6AK6GfT0ZfQ3vL92mK
 eze/X50v7rBM4PeReLs+sQ4z5z9nIq4Itjd8fy/5d0NMxD7vKobHmQL13NueR6vVsU3Uddml
 3zR7q96RC8zRTt7+G32mThMV38+eolP5p8L3QeufhnP7I98b7Pt0roenV22ht77Cbamve/qV
 WIozEg21mIuKEwHR4HpoxwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPJMWRmVeSWpSXmKPExsWy7bCSnG7Ptsx4g+YGSYvecyeZLK58fc9m
 MeP8PiYHZo/t3x6wetzvPs7k8XmTXABzFJdNSmpOZllqkb5dAlfG++nzmQs2clUsub6VuYHx
 AUcXIyeHhICJxL4tB9m7GLk4hAR2M0p8PDuHsYuRAyghIbFlKweEKSxx+HAxRMknRomlfz+x
 gPSyCahKTFxxnw3EFhEwlzhx8TYjiM0MFP+3/g8ziC0soCyx+/o+VhCbBSj+aPcNJhCbV8BF
 4v65FSwQN8hJ3DzXyTyBkWcBI8MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgMNDS
 3MG4fdUHvUOMTByMhxglOJiVRHjVjNLjhXhTEiurUovy44tKc1KLDzFKc7AoifPeKFwYJySQ
 nliSmp2aWpBaBJNl4uCUamC6cmn7rL8381WSfv1kePOviW2+ppv4/rXNZ45fOeGz8uGUyw98
 G/84TgsWK05YYrhdoGTF/+qJWu2J58puSaxmeXib46X96y1dy3917RRJyk+reLg+St7CU+XY
 toit2oemrnQR19g3Kbt7yeEjd7mFX5u0bDI75d+6PHaP1A6l/mtnyiM92T+Hytwwtd7P8DKo
 L9qY5amaW4bma/Vk1991MhYuh+d+yvOvKF9c0/Fz554otsyYdRbpcx/5KLrErcrce/lJVoLe
 n71zm5b9Cvq1omL39dBnP4yXfE6Qu/bBm+erzJaHP5mT/LjiJ6bK3ig29bgjYPRZaW329QeK
 h85e38xevP2BEseOiTzMiZnZSizFGYmGWsxFxYkA5Hoc6nICAAA=
X-CMS-MailID: 20200922083212epcas1p3874ca74fbb2d46214b69bc0dd757aaaf
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200922083212epcas1p3874ca74fbb2d46214b69bc0dd757aaaf
References: <CGME20200922083212epcas1p3874ca74fbb2d46214b69bc0dd757aaaf@epcas1p3.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

   Just two cleanups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit b40be05ed255d9a0257fb66ab2728ecca2c9d597:

  Merge branch 'for-5.10-drm-sg-fix' of https://github.com/mszyprow/linux into drm-next (2020-09-17 16:07:11 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-v5.10

for you to fetch changes up to ddfd4ab6bb08832e1261d7c8c4ae11e5568485af:

  drm/exynos: Fix dma_parms allocation (2020-09-22 13:49:09 +0900)

----------------------------------------------------------------
Two cleanups
- Simply use dev_err_probe() instead of returning -EPROBE_DEFER.
- Drop drm_parms allocation and deallocation code which aren't needed.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      drm/exynos: dsi: Simplify with dev_err_probe()
      drm/exynos: hdmi: Simplify with dev_err_probe()

Marek Szyprowski (1):
      drm/exynos: Fix dma_parms allocation

 drivers/gpu/drm/exynos/exynos_drm_dma.c | 27 +--------------------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |  7 ++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c    |  7 ++-----
 3 files changed, 5 insertions(+), 36 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
