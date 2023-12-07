Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722E807F87
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 05:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E01110E16D;
	Thu,  7 Dec 2023 04:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D618A10E16D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 04:22:29 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20231207042227epoutp024d0095dadcd762d1ea97b71e88d6ccdb~ecedebMOK0137801378epoutp02g
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 04:22:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20231207042227epoutp024d0095dadcd762d1ea97b71e88d6ccdb~ecedebMOK0137801378epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701922947;
 bh=byDtsG8PKYdfs3puCh5RQJLatncS4hWBREGe2pDiuqM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=s8hMNCbpg0msgHn0Z2ArjppgnG94lQWAWD6gjoJLBpWROmKXojUwLSa56g0Obfuo+
 3SJ2MAt/aenbAVSQn/esuZBOoS655NVoMLIV3X+fVXdoJNBbZQLThKP1ptxeDB6eu/
 QyPR6YOAm/7wWIkaBILgGDow9stLVl1OePFbPPo8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231207042227epcas1p2669e392346d693a4e811dbbd9488dda0~ecedNY2Wx1375713757epcas1p2A;
 Thu,  7 Dec 2023 04:22:27 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.135]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Sm1MQ3v6wz4x9Q1; Thu,  7 Dec
 2023 04:22:26 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 99.BB.19104.F7841756; Thu,  7 Dec 2023 13:22:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20231207042223epcas1p1e413980d991fdc9d9b413a34ab71894d~eceZaeDR01740817408epcas1p1X;
 Thu,  7 Dec 2023 04:22:23 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231207042223epsmtrp21f5f1f415d6b52499162caa67973eace~eceZZ2DVo0939409394epsmtrp25;
 Thu,  7 Dec 2023 04:22:23 +0000 (GMT)
X-AuditID: b6c32a4c-80dff70000004aa0-d9-6571487faae4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EA.D4.08817.F7841756; Thu,  7 Dec 2023 13:22:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231207042223epsmtip1d4f9ddbddf6d395051b485fdce2d9d63~eceZQMtBy2871628716epsmtip1W;
 Thu,  7 Dec 2023 04:22:23 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel@ffwll.ch
Subject: [GIT PULL RESEND] exynos-drm-fixes
Date: Thu,  7 Dec 2023 13:22:23 +0900
Message-Id: <20231207042223.2473706-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAKsWRmVeSWpSXmKPExsWy7bCmgW69R2GqwYQGNYvecyeZLP5vm8hs
 ceXrezaLGef3MTmweOz9toDFY/u3B6we97uPM3l83iQXwBKVbZORmpiSWqSQmpecn5KZl26r
 5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDtFJJoSwxpxQoFJBYXKykb2dTlF9akqqQ
 kV9cYquUWpCSU2BaoFecmFtcmpeul5daYmVoYGBkClSYkJ3xe2Mze8FKnorNJ38wNzCu5+pi
 5OCQEDCR6P4j0cXIxSEksIdRouvYPRYI5xOjRNuVJijnG6NE55VprF2MnGAdJ+6cY4ZI7GWU
 2DCvnxHC+cIocWvKNWaQKjYBVYmJK+6zgdgiQPbbSY/B4swCbhJ/lp5lAbGFBbQldj9+DxZn
 Aao5vesp2AZeAWuJ6fdPM0Nsk5eYeek7O0RcUOLkzCcsEHPkJZq3zga7QkJgG7vE9fX72SAa
 XCRWP1nPBGELS7w6voUdwpaS+PxuLxtEw2RGiTvXV7BAODMYJQ7/vM4IUWUssX/pZCZQ0DAL
 aEqs36UPEVaU2Pl7LiPEZj6Jd197WCGhxyvR0SYEUaIkceziDagpEhIXlkxkgyjxkDg+XRck
 LCQQK3Hh/WPWCYzys5C8MwvJO7MQ9i5gZF7FKJVaUJybnppsWGCom5daDo/Z5PzcTYzgpKfl
 s4Px+/q/eocYmTgYDzFKcDArifDmnM9PFeJNSaysSi3Kjy8qzUktPsRoCgzkicxSosn5wLSb
 VxJvaGJpYGJmZGxiYWhmqCTOG/OpPUVIID2xJDU7NbUgtQimj4mDU6qBSfnOyU+Z26b9PH7S
 2Ck/MnvBkvcTauVbT+uol+w+XPv8mrTRk5ddDb2fhI4+Pzjn3/JH9q5++TYicjVy7jmH3zFf
 ccz2nPV0QvWG/DkPW/8UFArPXXf21l7NtfWyCg9LkjzzN8ctnTrjlb3Utlc9zw++n7Tt19N7
 yz+1JU1QV9B6zLC4IVv94Zbmte6PQjYkvZNnbdu06bfy4i3n5bS45upc5ZUvXc7MKaLInGNT
 +FrwidDuo5/8cmrm5C0TORaUHZvt+W4Og7/RuhLvL41bD6mt7F+5fu+lnQzvy9LeSz392vZd
 L+uH92cpf/nczHnnkxe0m/XKHrH88W6H3PN7l+YfPhb5VvSL+97tFz1XWt5VYinOSDTUYi4q
 TgQAQPpLTwMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsWy7bCSnG69R2GqwbcLQha9504yWfzfNpHZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCWKyyYlNSezLLVI3y6BK+P3xmb2
 gpU8FZtP/mBuYFzP1cXIySEhYCJx4s455i5GLg4hgd2MElcab7N3MXIAJSQktmzlgDCFJQ4f
 LoYo+cQo8f7rYWaQXjYBVYmJK+6zgdgiAuoSDy4vZASxmQU8JN7vWc0OYgsLaEvsfvwerJ4F
 qP70rqesIDavgLXE9PunmSFukJeYeek7O0RcUOLkzCcsEHPkJZq3zmaewMg3C0lqFpLUAkam
 VYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwaGnpbWDcc+qD3qHGJk4GA8xSnAwK4nw
 5pzPTxXiTUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2ampBahFMlomDU6qBaXtG
 0N+gA4XW55gb1rzQTdt9/oLGJZOSgqZ/b1+nWzXtOFFybnmhs+n2nH/Tkv0b83Implz6L/54
 3cbN4vt96/+uUF/sWNrz/fzL9G8n3n9mWfz6756KrwvzGmbsNwtxf97uF+gfN1HQL/2C2DWz
 ieeX5bxa8eNXfkP/Kv4rH/9P9rzw7sXsOds903xyVqnp3b+QWXahS2mRqqrbnKD7Qa8j+w8l
 eIiufvyj1Zzbb8VXy88HuMNjL+nOi+7cOo9X+urRmYt00z7O2qi+pPOuVdj9G9N1Di3ltMia
 dWJZY6exm/nFf8I1t3ZOLvr3LiH8WZOgY/Eexc/T9zE9OPbpwtFfbRUZ51+c2VTo5LVXjPmV
 EktxRqKhFnNRcSIA2q5CDKwCAAA=
X-CMS-MailID: 20231207042223epcas1p1e413980d991fdc9d9b413a34ab71894d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231207042223epcas1p1e413980d991fdc9d9b413a34ab71894d
References: <CGME20231207042223epcas1p1e413980d991fdc9d9b413a34ab71894d@epcas1p1.samsung.com>
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

   Just resending you the previous pull request[1] after resolving the build
   warning.

   [1] https://lore.kernel.org/dri-devel/20231120225537.1270358-1-inki.dae@samsung.com/

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 33924328498e903bea74727353e5012d29653aff:

  Merge tag 'drm-intel-fixes-2023-12-01-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-12-05 12:19:22 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.7-rc5

for you to fetch changes up to 8d1b7809684c688005706125b804e1f9792d2b1b:

  drm/exynos: fix a wrong error checking (2023-12-07 11:51:43 +0900)

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
