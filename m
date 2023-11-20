Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8117F211C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 00:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4046810E13E;
	Mon, 20 Nov 2023 23:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Mon, 20 Nov 2023 23:00:48 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35E610E13E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 23:00:48 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20231120225539epoutp0312465b9f17c7962e715b751656904463~Zdsj3YoHW1649716497epoutp03x
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 22:55:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20231120225539epoutp0312465b9f17c7962e715b751656904463~Zdsj3YoHW1649716497epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1700520939;
 bh=d5LVF16kgt+/0fV4sNYDC7CG9585GCuFuphQsqrUP0M=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vUPLxW6bb2voSFnDWDHaN47tIdo4w5/ioNH96ec1j13zDyRulRqK4pDFPPGwUv1cR
 XyrSBlE1Bzyde8Dspzhlgr3mdXWNVtXIYtEP3JDUGcQL0QWTJFv2W2n2cor2SXs99r
 KqP38np9i5vZZR/Vt+6zhoU0a0B6DQ6eXMVb2XnE=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20231120225539epcas1p131121a43edfe4f45a985a3a92ed9733d~ZdsjjpeJG1274512745epcas1p1Z;
 Mon, 20 Nov 2023 22:55:39 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.133]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4SZ2sk4Cxgz4x9Pp; Mon, 20 Nov
 2023 22:55:38 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 8A.05.09744.AE3EB556; Tue, 21 Nov 2023 07:55:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20231120225538epcas1p205a656dfe9771fc992ee1a6756ca67d3~ZdsiaCjzW2181121811epcas1p2h;
 Mon, 20 Nov 2023 22:55:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20231120225538epsmtrp153713febb39c8f0546ea606d3870bf90~ZdsiZeS0u2590125901epsmtrp1j;
 Mon, 20 Nov 2023 22:55:38 +0000 (GMT)
X-AuditID: b6c32a35-107fa70000002610-97-655be3ea718a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 30.15.08755.AE3EB556; Tue, 21 Nov 2023 07:55:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231120225538epsmtip1ef0e2cac93b796a319c04d5a16bef937~ZdsiPGymr1170711707epsmtip1G;
 Mon, 20 Nov 2023 22:55:38 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-fixes
Date: Tue, 21 Nov 2023 07:55:37 +0900
Message-Id: <20231120225537.1270358-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDKsWRmVeSWpSXmKPExsWy7bCmvu6rx9GpBtduSFv0njvJZPF/20Rm
 iytf37NZzDi/j8mBxWPvtwUsHtu/PWD1uN99nMnj8ya5AJaobJuM1MSU1CKF1Lzk/JTMvHRb
 Je/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoJVKCmWJOaVAoYDE4mIlfTubovzSklSF
 jPziElul1IKUnALTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMi09bmQrW8VR8Xt/M2MA4n6uL
 kZNDQsBE4tXfV4xdjFwcQgI7GCUOzz3HCuF8YpR4c/M1E4TzjVFiz8O5zDAth29tZQOxhQT2
 MkpsbpWEKPrCKHFn4iUmkASbgKrExBX3wYpEgOy3kx6DNTMLuEn8WXqWpYuRg0NYQEXiwEQ+
 kDALUMmyr5sZQWxeAWuJXTtes0HskpeYeek7O0RcUOLkzCcsEGPkJZq3zmYG2SshsIldYt6X
 WVDHuUisaWuEahaWeHV8CzuELSXxsr+NHaJhMtCh11ewQDgzgJ7+eZ0RospYYv/SyUwg1zEL
 aEqs36UPEVaU2Pl7LiPEZj6Jd197WEFKJAR4JTrahCBKlCSOXbwBNUVC4sKSiVA3eEhs+NrJ
 AgmsWIkVp3pYJzDKz0Lyzywk/8xCWLyAkXkVo1hqQXFuemqxYYEhPFaT83M3MYKTnZbpDsaJ
 bz/oHWJk4mA8xCjBwawkwvtNKCJViDclsbIqtSg/vqg0J7X4EKMpMIQnMkuJJucD021eSbyh
 iaWBiZmRsYmFoZmhkjgv86PeFCGB9MSS1OzU1ILUIpg+Jg5OqQamU7vuPrCx2PtUm33FzaX1
 8w3b5vwJKj6exeSzemnLt6dX3u2cNiNtd/HPf7ZKy59vX3r3zmKRBReSr/x2P3b0iHjZzx3X
 FM1frucpqFQSPdnpoPM5densU2YK164L8Dqycv9gXmI3y8mvW2qbbaNt7/3YytDdX4OdZ9xL
 O6HU/bCfR/WolvzZJfEqTAYBc/lTT/lvb2f09UhRaY9yNgwMdTle25PH1Dyze/fh9eUvu/fu
 uW5vWXnIumXuT0Ydxor+6bo3WRg5DzVkxH0TNf7MWGZZk/d4cgv7gZfhoYWfrvYKr794y+K6
 qHvg7Lfmrhlt5UZ3ZXsu1y5ZMrck3Mt3ir2FYHaDsLlHE9si5hwlluKMREMt5qLiRAB2pwAV
 /wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOLMWRmVeSWpSXmKPExsWy7bCSnO6rx9GpBlOauC16z51ksvi/bSKz
 xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV8bFp61M
 Bet4Kj6vb2ZsYJzP1cXIySEhYCJx+NZWti5GLg4hgd2MEjuu72XsYuQASkhIbNnKAWEKSxw+
 XAxSLiTwiVHixf4iEJtNQFVi4or7bCC2iIC6xIPLCxlBbGYBD4n3e1azg7QKC6hIHJjIBxJm
 ASpf9nUzWAmvgLXErh2v2SAukJeYeek7O0RcUOLkzCcsEGPkJZq3zmaewMg3C0lqFpLUAkam
 VYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwWGnpbmDcfuqD3qHGJk4GA8xSnAwK4nw
 fhOKSBXiTUmsrEotyo8vKs1JLT7EKM3BoiTOK/6iN0VIID2xJDU7NbUgtQgmy8TBKdXAZLNr
 +dWg28ynPP9Fn2zceMlm5kxWM6FZk29dlc0zYZBOFvpl/KYl6dEuoZ9J/6qKWDd+cvYx+uRy
 JLe+ssMwZmZcurLCl8TV1oZVbk3ME2ae/5V5Kr7Q9bTqL45DJkp622an5DiWSvDaCr//k/vY
 S2jfNdu0Bc73a75c+T9hl5riP8+5/yQW/3vy8/71Vda1DDztE812LBMPbN/YsEhAqTJexfCa
 XHkwd/McyVmdF0QX3/5UN/tCvK9Jx0v/OX8kNnxarL4voTXkM9ecVV95nLNitwZcmHUu6GWc
 McfkvK6fR4Leawio5XJseVj8RtxF81DiXmbH4PvLp4ff1j8u4+H2Xb5PY8Pca3rejRXTlViK
 MxINtZiLihMBMlSWzqoCAAA=
X-CMS-MailID: 20231120225538epcas1p205a656dfe9771fc992ee1a6756ca67d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231120225538epcas1p205a656dfe9771fc992ee1a6756ca67d3
References: <CGME20231120225538epcas1p205a656dfe9771fc992ee1a6756ca67d3@epcas1p2.samsung.com>
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

   Two fixups - fixing a potential error pointer dereference and wrong
   error checking.

   Ps. regarding the first patch, I had sent a GIT-PULL[1] but it seems
       you missed.
   [1] https://lore.kernel.org/dri-devel/20231006040950.4397-1-inki.dae@samsung.com/T/#u

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.7-rc3

for you to fetch changes up to a30ba4bd7cdb5726d86a557c5df8df71c7bc7fad:

  drm/exynos: fix a wrong error checking (2023-11-21 07:41:11 +0900)

----------------------------------------------------------------
Two fixups
- Fix a potential error pointer dereference by checking the return value
  of exynos_drm_crtc_get_by_type() function before accessing to crtc
  object.
- Fix a wrong error checking in exynos_drm_dma.c modules, which was reported
  by Dan[1]

[1] https://lore.kernel.org/all/33e52277-1349-472b-a55b-ab5c3462bfcf@moroto.mountain/

----------------------------------------------------------------
Inki Dae (1):
      drm/exynos: fix a wrong error checking

Xiang Yang (1):
      drm/exynos: fix a potential error pointer dereference

 drivers/gpu/drm/exynos/exynos_drm_dma.c | 8 +++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c    | 2 ++
 2 files changed, 5 insertions(+), 5 deletions(-)
