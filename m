Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD6B180CDC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 01:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8986B6E8EE;
	Wed, 11 Mar 2020 00:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FDC6E8EE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 00:34:09 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200311003405epoutp03f75cb132851fa8c16d085a3515b3e077~7GLGgJkjn0365303653epoutp03O
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 00:34:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200311003405epoutp03f75cb132851fa8c16d085a3515b3e077~7GLGgJkjn0365303653epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583886845;
 bh=SJhHYdb4HD6muQ5skN/10+jz0ytLe+XplpCRuk1Tdeg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=q+cVZhIjSoRcExaS6K8hsu+Nwe7gA1oumbYqKzVOHuX9mfzPi65KT4OpvuntMr/DW
 6yaIjQ6jlNB2HKyh1HJdLSFZGUF6j/mkKgWzLmADV2B4OjuuAlMpCTQlxFSkkwcDNw
 cyCBzxaRq+4XPq8QIjQ9rnb/z+6oUANkf2CgVDUw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200311003404epcas1p377f17916d4820ebc89775ffaaac4863a~7GLGSSzqy0623306233epcas1p33;
 Wed, 11 Mar 2020 00:34:04 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48cXyL41fNzMqYkw; Wed, 11 Mar
 2020 00:34:02 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F1.E2.48498.9F1386E5; Wed, 11 Mar 2020 09:34:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200311003400epcas1p4abc726dd30ed24c85f0a7dba9f85caf5~7GLCi1kSC1438414384epcas1p4v;
 Wed, 11 Mar 2020 00:34:00 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200311003400epsmtrp17251a97e0c41b2b040a9454899dc4604~7GLCh9yKD2458824588epsmtrp1W;
 Wed, 11 Mar 2020 00:34:00 +0000 (GMT)
X-AuditID: b6c32a36-a55ff7000001bd72-1e-5e6831f9d39e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.BF.06569.8F1386E5; Wed, 11 Mar 2020 09:34:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200311003400epsmtip2d90f94e16a3272c2a6a1ea67af2aa563~7GLCY2X_B0196101961epsmtip21;
 Wed, 11 Mar 2020 00:34:00 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL v2] exynos-drm-fixes
Date: Wed, 11 Mar 2020 09:38:29 +0900
Message-Id: <1583887109-4148-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIKsWRmVeSWpSXmKPExsWy7bCmge5Pw4w4g493RC16z51ksrjy9T2b
 xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6
 hpYW5koKeYm5qbZKLj4Bum6ZOUCLlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF
 lgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGdMnr2QqeMZbMX/OGuYGxo3cXYycHBICJhLXLl1i
 7mLk4hAS2MEoce/6DCYI5xOjxN4z56Ey3xglXr17wQrTsnjze6jEXkaJZyenMEI4XxglNs5/
 AlbFJqAqMXHFfTYQW0RAROL4sr9gNrOAm8SfpWdZQGxhAXWJ2xf7wOpZgOr/TrgNFucVcJZY
 fu8bM8Q2OYmb5zrBtkkIXGWVOPO2ixEi4SKx/spJFghbWOLV8S3sELaUxMv+NnaIhmZGiYkz
 TjNBOB2MEncfX4fqMJbYv3QyUIID6CRNifW79CHCihI7f89lhLiUT+Ld1x5WkBIJAV6JjjYh
 iBIliWMXb0DdICFxYclENgjbQ+L4pkVgRwsJxErMXfqIfQKj7CyEBQsYGVcxiqUWFOempxYb
 Fhghx9MmRnDy0TLbwbjonM8hRgEORiUe3hd16XFCrIllxZW5hxglOJiVRHjj5YFCvCmJlVWp
 RfnxRaU5qcWHGE2BwTeRWUo0OR+YGPNK4g1NjYyNjS1MDM1MDQ2VxHkfRmrGCQmkJ5akZqem
 FqQWwfQxcXBKNTBaTTxUnF1pLdjPvuDSRvXVTQuMH2bfm5tyy2PO3vM/3D9UPtc15z2ctPv1
 5r9tLRGOkRo/omY8Wv+7JNL08w+2YtEAWek5V3/F/I6/vVuJYfcfVruyC/sjeDQWGxzqENB+
 8YDRTeacxs4tQeePntixfD+rvnCcW/kyNvUo60OaMu1hS4tYtO4psRRnJBpqMRcVJwIAIjar
 2VQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDJMWRmVeSWpSXmKPExsWy7bCSvO4Pw4w4g+5ZBha9504yWVz5+p7N
 Ysb5fUwOzB7bvz1g9bjffZzJ4/MmuQDmKC6blNSczLLUIn27BK6M6ZNXMhU8462YP2cNcwPj
 Ru4uRk4OCQETicWb3zN3MXJxCAnsZpT4t+kmkMMBlJCQ2LKVA8IUljh8uBii5BOjxIErK5lA
 etkEVCUmrrjPBmKLCIhIHF/2F8xmFvCQeL9nNTuILSygLnH7Yh8riM0CVP93wm0WEJtXwFli
 +b1vzBA3yEncPNfJPIGRZwEjwypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOAw0NLa
 wXjiRPwhRgEORiUe3hd16XFCrIllxZW5hxglOJiVRHjj5YFCvCmJlVWpRfnxRaU5qcWHGKU5
 WJTEeeXzj0UKCaQnlqRmp6YWpBbBZJk4OKUaGMPV6j9cefjz2d9jv8LmSjk/5fx0/pxgwDmL
 O61uMtGRH7evM1M6l6QybSKvwrKbM7ddF1HoeiOzvCi/aVmEUd/nL+2fDS9P0axWXMk1pWKP
 vZmLvJevUJ31mwUzv/zycP57g/O5QeXyIOlnmpmHbPss4kWP7bnrxGC7N6iidIrwBtPJV4UE
 y5VYijMSDbWYi4oTASUG8S3/AQAA
X-CMS-MailID: 20200311003400epcas1p4abc726dd30ed24c85f0a7dba9f85caf5
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200311003400epcas1p4abc726dd30ed24c85f0a7dba9f85caf5
References: <CGME20200311003400epcas1p4abc726dd30ed24c85f0a7dba9f85caf5@epcas1p4.samsung.com>
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

   Just one fixup to IOMMU initialization failure and memory leak
   detected by kmemleak detector.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 513dc792d6060d5ef572e43852683097a8420f56:

  vgacon: Fix a UAF in vgacon_invert_region (2020-03-06 21:06:34 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.6-rc5-v2

for you to fetch changes up to 07dc3678bacc2a75b1900febea7d996a31f178a2:

  drm/exynos: Fix cleanup of IOMMU related objects (2020-03-10 13:25:18 +0900)

----------------------------------------------------------------
Fix IOMMU initialization failure when Exynos DRM driver is rebound,
and also fix memory leak to iommu mapping object, which was
detected by kmemleak detector.

----------------------------------------------------------------
Marek Szyprowski (1):
      drm/exynos: Fix cleanup of IOMMU related objects

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_dma.c       | 28 ++++++++++++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 ++++--
 drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +++++--
 11 files changed, 53 insertions(+), 29 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
