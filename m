Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E820CB94
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 03:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC49E6E3EC;
	Mon, 29 Jun 2020 01:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4066E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 01:54:08 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200629015405epoutp01cf1c031bc021694a3e0f69d5293c17a0~c4OW-xHN30932609326epoutp01o
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 01:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200629015405epoutp01cf1c031bc021694a3e0f69d5293c17a0~c4OW-xHN30932609326epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593395645;
 bh=F5wMqotweUPi0fA9ud39EPwhp1R9YVyhnQ08XUVHxkA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vR1uHPzgloqGG6tt+9YLwWO/RR/Mv+bJrvEegx4MwtiBS6q1WQdkt8wzXRhlV+ZEi
 J7sR4WcA93EF5OSjXBl97SXN8bzz60xndKnaACkBFnjdrP6zdGW7IuSnN2xmZya2UA
 /Dpq2FuHlIH0r6+qyteT+f35v3k4bGW69qMfkIUw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200629015405epcas1p3b55696aa0f82e10052a18d2c996913cc~c4OWrpCmC1112111121epcas1p3D;
 Mon, 29 Jun 2020 01:54:05 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.158]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 49w9Wv6yFfzMqYkb; Mon, 29 Jun
 2020 01:54:03 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 19.6B.28581.8B949FE5; Mon, 29 Jun 2020 10:54:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200629015359epcas1p23157f5c5c4468ed2c09ce894bcd6d932~c4ORbRsdR2599925999epcas1p2-;
 Mon, 29 Jun 2020 01:53:59 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200629015359epsmtrp2dd7f3b018d2ed5112aeb7d29c1e4d8c7~c4ORas3571671316713epsmtrp2H;
 Mon, 29 Jun 2020 01:53:59 +0000 (GMT)
X-AuditID: b6c32a38-2cdff70000006fa5-f7-5ef949b8179b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 52.CD.08382.7B949FE5; Mon, 29 Jun 2020 10:53:59 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200629015359epsmtip1caa5f1f18fc968e18170ea1ca2f1dacb~c4ORRRmzg1657016570epsmtip1H;
 Mon, 29 Jun 2020 01:53:59 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 29 Jun 2020 10:59:48 +0900
Message-Id: <1593395988-4612-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7bCmge4Oz59xBn0LeSx6z51ksrjy9T2b
 xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6
 hpYW5koKeYm5qbZKLj4Bum6ZOUCLlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF
 lgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGT17l7AUNPBU/Dy4l72BsYWri5GDQ0LAROL8X8su
 Ri4OIYEdjBLNC5axdTFyAjmfGCUmNYRAJL4xSuzeeJQZJAHSML/3JTNEYi+jxNS9a6CcL4wS
 i3/uZQSpYhNQlZi44j7YKBEBEYnjy/6C2cwCbhJ/lp5lAVktLKAicWAiH0iYBaj8eMNuJhCb
 V8BZ4vn5k6wQy+Qkbp7rhFr8n01i6qxqCNtF4tjLFVA1whKvjm9hh7ClJD6/28sGco+EQDOj
 xMQZp5kgnA5GibuPr7NAVBlL7F86mQnkCGYBTYn1u/QhwooSO3/PZYS4k0/i3dceVkgQ8Up0
 tAlBlChJHLt4gxHClpC4sGQiG4TtIdH46y4zJORiJV7M2M8+gVF2FsKCBYyMqxjFUguKc9NT
 iw0LTJDjaBMjOOloWexgnPv2g94hRiYOxkOMEhzMSiK8n62/xQnxpiRWVqUW5ccXleakFh9i
 NAUG2ERmKdHkfGDayyuJNzQ1MjY2tjAxNDM1NFQS5z1pdSFOSCA9sSQ1OzW1ILUIpo+Jg1Oq
 gWnW3WDP3Qe2x11bu/zR1a+T96r2dqa1S/oePhi7PGnh7Opk54AZH9v07QMuN0lpGC/Z47m/
 b/cdxZQbqi+etYtMWvt0Xfc787rdK//PqrPteiuWax8llHdsOvMXpq+L7T68cy50XlC5mEF1
 Uebx0El2QdWrVmRvsLc8WXtX/8MVtnfWzctMLfcq7isJ1D5er8931/D0hESLyHOep4+s9unm
 PyV5f2rOKhb+Tx9iqjlaVfwcfb4sMOA6c/r33Yfyt26yPFyW5DJRK7l8r69fgqnQDvd5Dd73
 pvevn8nk9qVPT2q7z5ErK/1+PHq96ZTqhwm7fjKensV23HdRgnuW24QLabVhT6avuLwucNHV
 6al2SizFGYmGWsxFxYkA2obI4cMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHJMWRmVeSWpSXmKPExsWy7bCSnO52z59xBtOmyln0njvJZHHl63s2
 ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7hsUlJzMstSi/TtErgyevYuYSlo4Kn4eXAvewNj
 C1cXIyeHhICJxPzel8xdjFwcQgK7GSX+ru0CcjiAEhISW7ZyQJjCEocPF0OUfGKUONj4hx2k
 l01AVWLiivtsILaIgIjE8WV/wWxmAQ+J93tWs4P0CguoSByYyAcSZgEqP96wmwnE5hVwlnh+
 /iQrxAlyEjfPdTJPYORZwMiwilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOAi0NHcw
 bl/1Qe8QIxMH4yFGCQ5mJRHez9bf4oR4UxIrq1KL8uOLSnNSiw8xSnOwKInz3ihcGCckkJ5Y
 kpqdmlqQWgSTZeLglGpgynFv6eJ5ucFf+bdSntfTiVce3t/t/jV1jW+z0ZzsWeYsVzQm291v
 LdasFBDoUm3j9NZ5bv2gbdYDQ93nyzbOaeY8t/u117Ow25YsIZ5fZ59Vb8t95HhkZaNO2R7D
 +G8bXl+YqxunWdTnG8h4fGptyGvJi7MTDp58/KlgwxqV7PxFBf/OPez7bC6pt5Dn5oa96ydE
 lSyoOfPvvpOS1Lol+o43pYIqfxYbfAw+xh9naX/yV47p1/T/rAcLTduePVF7XCt4c5+fCc+L
 17MF/y0W9JoquMF84q6IrSUHBZ6oSJ06HF918ZpGWf31qjj5BQWbQx/ZM2ma2fBs32jdWOM/
 64PrwvjH/8QzNj43PrKJUYmlOCPRUIu5qDgRAAFjiNdxAgAA
X-CMS-MailID: 20200629015359epcas1p23157f5c5c4468ed2c09ce894bcd6d932
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200629015359epcas1p23157f5c5c4468ed2c09ce894bcd6d932
References: <CGME20200629015359epcas1p23157f5c5c4468ed2c09ce894bcd6d932@epcas1p2.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

   Just one cleanup and two fixups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 687a0ed337367be5267652af5f6dbcfc954b8732:

  Merge tag 'drm-misc-fixes-2020-06-25' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-06-26 13:49:17 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.8-rc4

for you to fetch changes up to d4f5a095daf0d25f0b385e1ef26338608433a4c5:

  drm/exynos: fix ref count leak in mic_pre_enable (2020-06-29 09:38:41 +0900)

----------------------------------------------------------------
Two fixups
- It fixes wrong return value by returing proper error value instead of
  fixed one.
- It fixes ref count leak in mic_pre_enable.
One cleanup
- It removes dev_err() call on platform_get_irq() failure because
  platform_get_irq() call dev_err() itself on failure.

----------------------------------------------------------------
Marek Szyprowski (1):
      drm/exynos: Properly propagate return value in drm_iommu_attach_device()

Navid Emamdoost (1):
      drm/exynos: fix ref count leak in mic_pre_enable

Tamseel Shams (1):
      drm/exynos: Remove dev_err() on platform_get_irq() failure

 drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 1 -
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 4 +++-
 3 files changed, 5 insertions(+), 4 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
