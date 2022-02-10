Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF64B0B7C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73C110E7FC;
	Thu, 10 Feb 2022 10:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADBD10E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 10:55:37 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220210105535epoutp02d1a54f432586b7267dc5802ec8e696ae~SZ23wVz_P0770107701epoutp02S
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 10:55:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220210105535epoutp02d1a54f432586b7267dc5802ec8e696ae~SZ23wVz_P0770107701epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1644490535;
 bh=R7L8MKVkBoaq0s3DJCdA68+g2suhf8EBgyskpwWxmaI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=mPQGS1sAEHE65gCRItQaE7C4nI26ncCNdP91/foddI+bWK7i6z+50DsU5jQaBqds5
 iHiT/h8FarYEq2Ah2dfHIiC6hXLrJwrWr9n/4oVNC3SqEXHuzDopZEX8TaGv8s+Cvs
 7+lpcIPb+z0wSjHnp1NsYLIxd2a1vM2yanIQ2NZ4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220210105535epcas1p23d0882f7c125b3ad907b9993e2d14d12~SZ23liQlx1196311963epcas1p2q;
 Thu, 10 Feb 2022 10:55:35 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.233]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4JvYYv6pdrz4x9Q7; Thu, 10 Feb
 2022 10:55:31 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.55.08277.32FE4026; Thu, 10 Feb 2022 19:55:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220210105530epcas1p2a8812b767cecfc06c068bf8aba8b9cb5~SZ2yeBU6o0814508145epcas1p2x;
 Thu, 10 Feb 2022 10:55:30 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220210105530epsmtrp1e0635384650c0663d14a6ff74fe41c4e~SZ2ydLgnd1068010680epsmtrp1Z;
 Thu, 10 Feb 2022 10:55:30 +0000 (GMT)
X-AuditID: b6c32a36-1edff70000002055-f9-6204ef232f86
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 11.5B.29871.22FE4026; Thu, 10 Feb 2022 19:55:30 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220210105529epsmtip1376af2c6489122ab6c8b09011b408bfb~SZ2yL8dLj1126711267epsmtip1R;
 Thu, 10 Feb 2022 10:55:29 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel.vetter@ffwll.ch
Subject: [GIT PULL] exynos-drm-fixes
Date: Thu, 10 Feb 2022 20:07:22 +0900
Message-Id: <20220210110722.63523-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7bCmnq7ye5Ykg/aTAha9504yWSx8eJfZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITujZ+NnxoKlAhU9fS8YGxj38XYx
 cnJICJhIbGu/zwJiCwnsYJQ4ukSzi5ELyP7EKPHyxGMWCOcbo8SRT/tYYTrWHm5hh0jsZZSY
 un8RM4TzhVGiZ+JqZpAqNgFViYkr7rN1MXJwiAjoSLw4UwASZhZwk/iz9CwLSFhYQEXiwEQ+
 kDALUHXHgx9MIDavgKXE867/LBC75CVmXvrODhEXlDg58wkLxBh5ieats8HWSgisY5fo+r6W
 HaLBRWLj8s3MELawxKvjW6DiUhIv+9vYIRomM0rcub6CBcKZwShx+Od1RogqY4n9SyczgVzH
 LKApsX6XPkRYUWLn77mMEJv5JN597WEFKZEQ4JXoaBOCKFGSOHbxBtQUCYkLSyayQdgeEtf2
 tDFBgjdW4vGnVrYJjPKzkPwzC8k/sxAWL2BkXsUollpQnJueWmxYYASP1OT83E2M4FSnZbaD
 cdLbD3qHGJk4GA8xSnAwK4nwnqpnThLiTUmsrEotyo8vKs1JLT7EaAoM4YnMUqLJ+cBkm1cS
 b2hiaWBiZmRsYmFoZqgkzrtq2ulEIYH0xJLU7NTUgtQimD4mDk6pBiZtgyDHfVxHX7uu8JcU
 VAs9667kw5kUM1e61Cpw3nkOdwGf2WFT3AKT1bdd9DYJiX4jdCdoV5Pvy9OuBqcP+764EZC5
 97zccaGJwkslJCUcjc/rBr+vUJFSqJJ+ocP5zv1giNKp2PT2NsUwex6dKTqWyx78vN5jr9Ja
 pnRs84qLXy0v5LQ83B+wPGgO74e11SXd+Tzf4pdFy+1TWsD9TjH7pVsXw1sD/0mXTIrv3hc6
 NkeWwXu63UmXBT1y6266fjl/xMA7tbFWZ+n/Q51CIkmratf+TGmcrHb8tv1N9ayFR0467pgf
 ZK9VnFB4tFZPtCI59+qRRVrblicmu9xPM63TfBCauFbl59H5ak13lFiKMxINtZiLihMBrD3F
 Av4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWy7bCSnK7Se5Ykg9kT2C16z51kslj48C6z
 xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV0bPxs+M
 BUsFKnr6XjA2MO7j7WLk5JAQMJFYe7iFvYuRi0NIYDejxKmd25m7GDmAEhISW7ZyQJjCEocP
 F0OUfGKU2LRjKRtIL5uAqsTEFffBbBEBPYm2jlPsIDazgIfE+z2r2UF6hQVUJA5M5AMJswCV
 dzz4wQRi8wpYSjzv+s8CcYK8xMxL39kh4oISJ2c+YYEYIy/RvHU28wRGvllIUrOQpBYwMq1i
 lEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAgOPC3NHYzbV33QO8TIxMF4iFGCg1lJhPdU
 PXOSEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUwrb5Xc
 d+44Z9FpdMQlaJ3uGekW6fo3As99XFdcvWwv3RCvdUr+lYxrkVGwptuOL3aJCwza+UMYDh8T
 3H9J7aV6v3qj6t7ySY+653xSlyjS8u6+HCi0SkezdYa/ZnGQp8zcrfZuCbstj8hWMnuIis0v
 Cbsy8bTb4+Utv3tCeP8XXl6o5v4iOv3a3EufcxVO/2/L+17v2Wf0oV1/3X/rr17bdnzkCnqU
 slk5b0qpv7in5OObSZw7rSxXTvMMqT0fl7w5d6tB9aOdnyeEuBy8McvozqWwDZ2nrTvKlCMO
 MLuETnzsMn/XSb28N/GPlA5uL4gu5PgZzCW1vTtTU1iNofjUlQ6rvY+2VmStyI1VVmIpzkg0
 1GIuKk4EAJ7NQyurAgAA
X-CMS-MailID: 20220210105530epcas1p2a8812b767cecfc06c068bf8aba8b9cb5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220210105530epcas1p2a8812b767cecfc06c068bf8aba8b9cb5
References: <CGME20220210105530epcas1p2a8812b767cecfc06c068bf8aba8b9cb5@epcas1p2.samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just two fixup series - one is to fix irq chaining issue and other is
   regressions to TE-gpio handling.

Please let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  gitolite.kernel.org:/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.17-rc4

for you to fetch changes up to 38103fa72e0b70e3067fed489f8316dc5998f26c:

  drm/exynos: Search for TE-gpio in DSI panel's node (2022-02-10 19:17:22 +0900)

----------------------------------------------------------------
Fixups
- Make display controller drivers for Exynos series to use platform_get_irq
  and platform_get_irq_byname functions to get the interrupt, which prevents
  irq chaining from messed up when using hierarchical interrupt domains
  which use "interrupts" property in the node.
- Fix two regressions to TE-gpio handling.

----------------------------------------------------------------
Lad Prabhakar (5):
      drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to get the interrupt
      drm/exynos: mixer: Use platform_get_irq() to get the interrupt
      drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get the interrupt
      drm/exynos/fimc: Use platform_get_irq() to get the interrupt
      drm/exynos: gsc: Use platform_get_irq() to get the interrupt

Marek Szyprowski (2):
      drm/exynos: Don't fail if no TE-gpio is defined for DSI driver
      drm/exynos: Search for TE-gpio in DSI panel's node

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 12 +++---------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c    |  6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 13 +++++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 13 ++++---------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 10 +++-------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 14 ++++++--------
 6 files changed, 25 insertions(+), 43 deletions(-)
