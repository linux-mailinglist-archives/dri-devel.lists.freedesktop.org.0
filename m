Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A0775276
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 08:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCCC10E23A;
	Wed,  9 Aug 2023 06:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10C610E23A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 06:02:21 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230809060219epoutp03214426a766aed07ce4f571d68f40bd02~5obZD0DiK1893418934epoutp036
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 06:02:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230809060219epoutp03214426a766aed07ce4f571d68f40bd02~5obZD0DiK1893418934epoutp036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1691560939;
 bh=Hqwh95qbZ9slU4yEMhbAKqRtPtKBpjOVFp4ZT1NMtzo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Hf6XVqcEJD1yJ6hXEKjiYMpz8gh67rHLP3pQuWUwoJAKzzUd3+EuhFLULlZJk+KrL
 h9tlZFDHJkLcQsVKDrBSwVs1UFS6ynSY8giO7acE1fFdMG+bEswe9pELyQpbuA0E5c
 91iSxb26WfWeUhe5zXDgAygLpB2Pd9Dj0Wb65kyM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230809060218epcas1p2536588d541cc094582d2d55437b631be~5obYxYdcm3079830798epcas1p2w;
 Wed,  9 Aug 2023 06:02:18 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.236]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4RLKG12SfQz4x9Q5; Wed,  9 Aug
 2023 06:02:17 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A6.CE.33652.9EB23D46; Wed,  9 Aug 2023 15:02:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20230809060216epcas1p31ee8f5adc0b079b3bf347369c04f2dfe~5obW8dVcX0035300353epcas1p3J;
 Wed,  9 Aug 2023 06:02:16 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230809060216epsmtrp2a3b013e3aa3e3a22ea4d67505afd09ad~5obW7zVGV1266612666epsmtrp2X;
 Wed,  9 Aug 2023 06:02:16 +0000 (GMT)
X-AuditID: b6c32a35-1fffd70000008374-f0-64d32be933e0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 75.81.14748.8EB23D46; Wed,  9 Aug 2023 15:02:16 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230809060216epsmtip21c1f92719306775b24c6f11a3306bca2~5obWyPi6v1829218292epsmtip2W;
 Wed,  9 Aug 2023 06:02:16 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-next
Date: Wed,  9 Aug 2023 15:02:16 +0900
Message-Id: <20230809060216.374042-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7bCmru5L7cspBv9b+Sx6z51ksvi/bSKz
 xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEtUtk1GamJKapFCal5yfkpmXrqt
 kndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0EolhbLEnFKgUEBicbGSvp1NUX5pSapC
 Rn5xia1SakFKToFpgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGwiWzGAt6uSu2P9nD3sC4hrOL
 kZNDQsBE4tLb/2xdjFwcQgI7GCWO39rGDOF8YpR4fKmNBcL5xihx4PQjRpiWlwu2QLXsZZTY
 cWULVMsXRomZq14wg1SxCahKTFxxnw3EFgGy3056DBZnFnCT+LP0LAuILSygLLH7+j5WEJsF
 qObIlH6wGl4BK4kfD15CbZOXmHnpOztEXFDi5MwnLBBz5CWat84GWywhsIld4sW+h2wQDS4S
 1/4dYYWwhSVeHd/CDmFLSXx+t5cNomEyo8Sd6ytYIJwZjBKHf16HWmcssX/pZKYuRg6gFZoS
 63fpQ4QVJXb+nssIsZlP4t3XHlaQEgkBXomONiGIEiWJYxdvQE2RkLiwZCLUPR4SM599A7tB
 SCBWYvfsLawTGOVnIflnFpJ/ZiEsXsDIvIpRLLWgODc9tdiwwBAer8n5uZsYwQlPy3QH48S3
 H/QOMTJxMB5ilOBgVhLhtQ2+lCLEm5JYWZValB9fVJqTWnyI0RQYwhOZpUST84EpN68k3tDE
 0sDEzMjYxMLQzFBJnJf5UW+KkEB6YklqdmpqQWoRTB8TB6dUA5Pu/u1uFnPe9d7QF5VwvvJg
 x9oNk2/GqMhueJz14eyKGu/1Cesd7ug9qHin5qAb4P+Su33Ni88nfiaJGHWIFUdcOSXt4bWl
 mi/4cWFQpMGVPbvCrtnm6j+dcf5W3KfuP0Zy99NSL3rznGEQiVnvcvnY/5fzTnK9Xu3F/uKa
 kor19aInN7W+BUon/xBV114if3LahHWXz4tk/1o39bpxhEzmUg2XNed7vQK+PS88c3mZCJsA
 h9al+rPGFgc3nNhs+9mX4dULFvPiX6yz+INSJC4c3XL4RUTUNOu9B4+occQySch3+3Kk/Zqw
 j7ljYaaU/g/b81MctzFUmsmsq7g8L8fvT9eU+cWbdJ/sPxms37RMiaU4I9FQi7moOBEAdPVC
 bgEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWy7bCSvO4L7cspBievmVv0njvJZPF/20Rm
 iytf37NZzDi/j8mBxWPvtwUsHtu/PWD1uN99nMnj8ya5AJYoLpuU1JzMstQifbsEroyFS2Yx
 FvRyV2x/soe9gXENZxcjJ4eEgInEywVb2EBsIYHdjBKHb8p1MXIAxSUktmzlgDCFJQ4fLu5i
 5AKq+MQo8e3yE1aQcjYBVYmJK+6DtYoIqEs8uLyQEcRmFvCQeL9nNTuILSygLLH7+j6wehag
 +iNT+plBbF4BK4kfD14yQpwgLzHz0nd2iLigxMmZT1gg5shLNG+dzTyBkW8WktQsJKkFjEyr
 GCVTC4pz03OTDQsM81LL9YoTc4tL89L1kvNzNzGCA09LYwfjvfn/9A4xMnEwHmKU4GBWEuG1
 Db6UIsSbklhZlVqUH19UmpNafIhRmoNFSZzXcMbsFCGB9MSS1OzU1ILUIpgsEwenVAOTQLvf
 jrdHpz/dYf67iWndznxh6xNJSe7XVeSOuiqyfbqjJtWi1tIR8eXnrwvHG771WN2fOsd38Yzg
 5zMqmhfITb7qvVR6yeN1Hu+Crnsx3uy8yFo0MXsmPyvz95+Hf36cmHSufdnN+rpOn3VHo4Pn
 pLAbnNzIKybsHT5tvWk3o696etyK1OM6Lh1lR/YbOu38ZzAty3KHU5mtiUhjYLSY8tS/cjlr
 4r2+5y9iuCvxc8W2nplfO+Ks2J7xLb9haKSteqfA1OOKRaPl6fvv1ynNZAlWqbY6YXk9YmaC
 ocTkCk8h+3NfNhh7vd726qad/+JbVRVXCstztl5uz5usXVRxTM7mut2SIq5g6U8zj7xWYinO
 SDTUYi4qTgQAMswliasCAAA=
X-CMS-MailID: 20230809060216epcas1p31ee8f5adc0b079b3bf347369c04f2dfe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230809060216epcas1p31ee8f5adc0b079b3bf347369c04f2dfe
References: <CGME20230809060216epcas1p31ee8f5adc0b079b3bf347369c04f2dfe@epcas1p3.samsung.com>
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

   Just one fixup and cleanup.
   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d9aa1da9a8cfb0387eb5703c15bd1f54421460ac:

  Merge tag 'drm-intel-gt-next-2023-08-04' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-07 13:49:25 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.6

for you to fetch changes up to 6b83c85b64078ff49b4d3d0b2cd2c2bf6f1b6a85:

  drm/exynos: remove redundant of_match_ptr (2023-08-08 09:35:19 +0900)

----------------------------------------------------------------
Fixup
- fix a possible null pointer dereference issue in
  exynos_drm_crtc_atomic_disable(), which was reported by
  the automatic static analysis tool. And below is a relevant link,
  https://sites.google.com/view/basscheck/home

Cleanup
- drop the use of of_match_ptr which is redundant.

----------------------------------------------------------------
Tuo Li (1):
      drm/exynos: fix a possible null-pointer dereference due to data race in exynos_drm_crtc_atomic_disable()

Zhu Wang (1):
      drm/exynos: remove redundant of_match_ptr

 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 5 ++---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c  | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)
