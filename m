Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F361434DE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 01:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CB36E0F7;
	Tue, 21 Jan 2020 00:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB97C6E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 00:49:04 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200121004902epoutp01e4ad42682c8a31af10fae8cb62aa9876~rwH4eQQlJ0653906539epoutp01K
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 00:49:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200121004902epoutp01e4ad42682c8a31af10fae8cb62aa9876~rwH4eQQlJ0653906539epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579567742;
 bh=xDXirZi71j2USEdN4Z0On11YlJpSJ1ExCRLmiB+2qQk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=iqZx8B5I9wxlyTw9nk8ljPtqJg4qjgvNcCd9WAoOVgN8YXqbypKTe5SsEJqM2rqjg
 i03o41o3YM27henssZFNaqEooge57jrDrbPK2wM6tK7eAt/I47prmJxOwNylKfl+Qc
 XpV9x3XA7iCVkuSlcOMenXXVenub5DAQS0pFgj6w=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200121004901epcas1p2a5ca0ae15d8974eaa278af5cfd1e44a5~rwH4Dm6n10243902439epcas1p2B;
 Tue, 21 Jan 2020 00:49:01 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.152]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 481qff4KZdzMqYm1; Tue, 21 Jan
 2020 00:48:58 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 AB.B2.48498.77A462E5; Tue, 21 Jan 2020 09:48:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200121004854epcas1p19ef322f1b88ce31f28a17bde2bacc3fc~rwHxnYU5A0113901139epcas1p1F;
 Tue, 21 Jan 2020 00:48:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200121004854epsmtrp2b5e67598a6b3fdb5166571db7eb766c7~rwHxlzS7P2736427364epsmtrp2F;
 Tue, 21 Jan 2020 00:48:54 +0000 (GMT)
X-AuditID: b6c32a36-a55ff7000001bd72-e4-5e264a770628
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.CF.10238.67A462E5; Tue, 21 Jan 2020 09:48:54 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200121004854epsmtip246406b56d3f7f1a08f500b9d0d99adff~rwHxXxD8f1207212072epsmtip20;
 Tue, 21 Jan 2020 00:48:54 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 21 Jan 2020 09:52:50 +0900
Message-Id: <1579567970-4467-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7bCmrm65l1qcweWVyha9504yWVz5+p7N
 Ysb5fUwOzB7bvz1g9bjffZzJ4/MmuQDmqGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0Nd
 Q0sLcyWFvMTcVFslF58AXbfMHKBFSgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC
 ywK94sTc4tK8dL3k/FwrQwMDI1OgwoTsjD/HfrEX7OSvOLvsJlsD41meLkZODgkBE4nX93Yz
 dTFycQgJ7GCUWHd7MzOE84lR4uzexawQzjdGidurJwM5HGAtN16wQcT3Mko0Ln0F1f6FUaLn
 01ZGkLlsAqoSE1fcZwOxRQREJI4v+wtmMwu4SfxZepYFxBYWUJbYfX0fK4jNAlR/t/MbWJxX
 wFli88+nbBD3yUncPNcJdpKEwFVWiW1LvjNDJFwkTi97DGULS7w6voUdwpaS+PxuL1RztcSE
 g/9ZIJobGCW6j3ZCFRlL7F86mQnkHWYBTYn1u/QhwooSO3/PZYQ4lE/i3dceqI95JTrahCBK
 lCSOXbzBCGFLSFxYMhFqlYfE10trwX4REoiVePTzOdMERtlZCAsWMDKuYhRLLSjOTU8tNiww
 Qo6lTYzgxKNltoNx0TmfQ4wCHIxKPLwO01TjhFgTy4orcw8xSnAwK4nwLmgCCvGmJFZWpRbl
 xxeV5qQWH2I0BYbeRGYp0eR8YFLMK4k3NDUyNja2MDE0MzU0VBLnne6iECckkJ5YkpqdmlqQ
 WgTTx8TBKdXA6LNgg75wYPeD7d/yt3lGyZrtE83vv5K01p972pZY26zj2yey/fwleuia0rv/
 P9b9rTtecFpFc2/iRYc3fx4+nP3vMtNzf6EwlurLpw53xRaXR3R4Wh7V62CLt+LeLD7FtpO/
 //mTI//DNEs3vHzsfsTn/Pr7HhMKrN5kp/PJfrm/c/2v0KI5RUosxRmJhlrMRcWJAHfvHk1S
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFJMWRmVeSWpSXmKPExsWy7bCSvG6Zl1qcwb/NWha9504yWVz5+p7N
 Ysb5fUwOzB7bvz1g9bjffZzJ4/MmuQDmKC6blNSczLLUIn27BK6MP8d+sRfs5K84u+wmWwPj
 WZ4uRg4OCQETiRsv2LoYuTiEBHYzSrzb/oUNIi4hsWUrB4QpLHH4cHEXIydQySdGiavLxEBs
 NgFViYkr7rOB2CICIhLHl/0Fs5kFPCTe71nNDmILCyhL7L6+jxXEZgGqv9v5jQXE5hVwltj8
 8ylYvYSAnMTNc53MExh5FjAyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECA4BLc0d
 jJeXxB9iFOBgVOLhdZimGifEmlhWXJl7iFGCg1lJhHdBE1CINyWxsiq1KD++qDQntfgQozQH
 i5I479O8Y5FCAumJJanZqakFqUUwWSYOTqkGRq3TmU4Pe4P8zBT22POVs/L3O/6y3jI5w9lP
 IHr1Cf0dPskqpxzzXyrtvzZV9lnO+TkpXcV3atav3PbKqX6HbY/tpwdCzHOftCWEpV0PmjMn
 4N2/MwUc6sK6PS/c37hNUFGRPcaln25wYp/MbP9pbmqdjo+MmW0euco0N8S/2Ge7joVlE8dG
 JZbijERDLeai4kQAvhVQiv0BAAA=
X-CMS-MailID: 20200121004854epcas1p19ef322f1b88ce31f28a17bde2bacc3fc
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200121004854epcas1p19ef322f1b88ce31f28a17bde2bacc3fc
References: <CGME20200121004854epcas1p19ef322f1b88ce31f28a17bde2bacc3fc@epcas1p1.samsung.com>
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

   Just two changes - one changes Exynos drm specfic callback names
   for consistency, and other corrects the use of Exynos prefix.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d7ca2d19c751b6715e9cb899a6b94f47b3499d02:

  Merge tag 'drm-msm-next-2020-01-14' of https://gitlab.freedesktop.org/drm/msm into drm-next (2020-01-20 14:09:43 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.6

for you to fetch changes up to c0bf499f6f84634c14cdec0afd1f17ff4121afa2:

  drm/exynos: Rename Exynos to lowercase (2020-01-21 09:09:42 +0900)

----------------------------------------------------------------
Change Exynos DRM specific callback function names
- it changes enable and disable callback functions names of
  struct exynos_drm_crtc_ops to atomic_enable and atomic_disable
  for consistency.
Modify "EXYNOS" prefix to "Exynos"
- "Exynos" name is a regular trademarked name promoted by its
  manufacturer, Samsung Electronics Co., Ltd.. This patch
  corrects the name.

----------------------------------------------------------------
Inki Dae (1):
      drm/exynos: change callback names

Krzysztof Kozlowski (1):
      drm/exynos: Rename Exynos to lowercase

 drivers/gpu/drm/exynos/Kconfig                |  6 +++---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 10 +++++-----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  8 ++++----
 drivers/gpu/drm/exynos/exynos_mixer.c         |  8 ++++----
 include/uapi/drm/exynos_drm.h                 |  2 +-
 9 files changed, 35 insertions(+), 35 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
