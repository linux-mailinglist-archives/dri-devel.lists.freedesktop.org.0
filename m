Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F834CE86
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 13:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEAB89192;
	Mon, 29 Mar 2021 11:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28089192
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 11:12:06 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210329111204epoutp022e5e9f50e183a840a42fa1b922411934~wy8el5nps3134931349epoutp02E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 11:12:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210329111204epoutp022e5e9f50e183a840a42fa1b922411934~wy8el5nps3134931349epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617016324;
 bh=0QTRaLezXnErvFBx021G+5f/kXn5UVUw2raon7KYOq8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=HEW20b/pOvVNUOOITgcXJWod8zlSFYK1lTXUSz3zK9OMgubM6ookydFZSuTM1bXy2
 uzRAXrzWUri6fhiqXH++j/8UFu9uyiBbP31suFm314LKAcSreJ2ciWD3d1t29zBHsi
 ZAM1HYis1Djr8ZMy7tMwRkIcUmG6MhwmhrydI6bQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210329111204epcas1p2095e3d7c9cfbe584a7e2ec4a1250b4f2~wy8eV6qKk2188721887epcas1p21;
 Mon, 29 Mar 2021 11:12:04 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.153]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4F88zl0hZ1z4x9Py; Mon, 29 Mar
 2021 11:12:03 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 D5.35.22618.206B1606; Mon, 29 Mar 2021 20:12:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210329111202epcas1p265fd87320ede9688b4d80b408159a8ce~wy8cQvGIF2151921519epcas1p2s;
 Mon, 29 Mar 2021 11:12:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210329111202epsmtrp2040a89a88c989872a0fd16383f6e817a~wy8cP66-U0304303043epsmtrp2B;
 Mon, 29 Mar 2021 11:12:02 +0000 (GMT)
X-AuditID: b6c32a38-e63ff7000001585a-f2-6061b6021d9e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4D.C4.33967.106B1606; Mon, 29 Mar 2021 20:12:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210329111201epsmtip240fce3b6a93a898271cffa1593e24b11~wy8cA7YUN0769107691epsmtip2g;
 Mon, 29 Mar 2021 11:12:01 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 29 Mar 2021 20:20:58 +0900
Message-Id: <1617016858-14081-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7bCmri7TtsQEg1dLrS16z51ksrjy9T2b
 xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6
 hpYW5koKeYm5qbZKLj4Bum6ZOUCLlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF
 lgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGS/Pb2Av2MxRcbdrIlMDYx97FyMnh4SAicSkXQuY
 uxi5OIQEdjBKvHx0nh3C+cQo0bJwBSOE841R4sWBjcwwLefnL4ZK7GWU+PbnJ1T/F0aJL/+X
 gQ1mE1CVmLjiPhuILSIgInF82V8wm1nATeLP0rMsXYwcHMICKhIHJvKBhFlAym+8ZQWxeQVc
 JO492cECsUxO4ua5TrD5EgL/2SRu3+lghEi4SExtfQplC0u8Or4F6iEpic/v9rJBNDQzSkyc
 cZoJwulglLj7+DrUWGOJ/UsnM4FcwSygKbF+lz5EWFFi5++5jBCH8km8+9rDClIiIcAr0dEm
 BFGiJHHs4g2ovRISF5ZMZIOwPSTWnPnABGILCcRK3O+/xDSBUXYWwoIFjIyrGMVSC4pz01OL
 DQtMkKNpEyM49WhZ7GCc+/aD3iFGJg7GQ4wSHMxKIrysp2MThHhTEiurUovy44tKc1KLDzGa
 AkNsIrOUaHI+MPnllcQbmhoZGxtbmBiamRoaKonzJhk8iBcSSE8sSc1OTS1ILYLpY+LglGpg
 4vPWC1ic2MoaVaqSon736awEZffi2Larby8qNz//3zNhYvr+g/F8zU4r1828JLVK/MKsDWfb
 9hnVvXq1c9K7y6qsLdIrWSTeXszndprwXObJ8bOdu2RWivtZy/zmEf77bZIT/+PcN5snCGr8
 cW2+LTt/6ty793Offbs6d+6lmSUdtsLXnGOmCIYfDlh9+UiPe6jV6l393+c+Klu5tdCqn/NI
 4mX9Rae3VkZ4OGTFLdj87bhBRttRm+D7dYdMr5znvvMjZU0xy0Ndvpa6278Ff17onfR2ZeL2
 /zH+a+ZuvPXCqufdE+f3DgdvXcrqvWfgruf6aYGIbHpxa3FZ1zJf9oAly7mOxha19stLm9lm
 LlBiKc5INNRiLipOBAA/zyRpxgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHJMWRmVeSWpSXmKPExsWy7bCSvC7jtsQEg4MfLCx6z51ksrjy9T2b
 xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZL89vYC/YzFFxt2siUwNj
 H3sXIyeHhICJxPn5ixm7GLk4hAR2M0r8PXkVyOEASkhIbNnKAWEKSxw+XAxR8olRYmfTUmaQ
 XjYBVYmJK+6zgdgiAiISx5f9BbOZBTwk3u9ZzQ7SKyygInFgIh9ImAWk/MZbVhCbV8BF4t6T
 HSwQJ8hJ3DzXyTyBkWcBI8MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgINDS3MG4
 fdUHvUOMTByMhxglOJiVRHhZT8cmCPGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEk
 NTs1tSC1CCbLxMEp1cDEdWcO76W2G2UMCk47nG58n3Th4a+e4Cmndz1T6Qy7veTzpe61v73T
 /2fYnu2bwLPtmsSV98zHp2/emtNxi6Wi414hq/xO/gnW1ya3r3/Vwda2+2yDu8XxuAWyGX26
 zz4+6Odty+8QbbjhVnD3ldXGh189vgU0Tp24ss63uOnIoTtrL+hE/KtiOWUryL64YM2iT//i
 rrWbum/q1Hn9wkm0UqLBnzvCvPDvGSlT1q09K98J/W69l6WhUVR90Ml4wekT/fMX8zsfWcpb
 /EpQx8+amV/yQIyfqU7bHN6JelsWczsevLVLzU6h4vxeN6YLonL3Xq0T+f+SpZCnUsrk2WOv
 m90cswMKBJelvbtqI+egxFKckWioxVxUnAgA9jbjanECAAA=
X-CMS-MailID: 20210329111202epcas1p265fd87320ede9688b4d80b408159a8ce
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210329111202epcas1p265fd87320ede9688b4d80b408159a8ce
References: <CGME20210329111202epcas1p265fd87320ede9688b4d80b408159a8ce@epcas1p2.samsung.com>
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

   Just one cleanup to drop unused header inclusion.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 09d78dde88ef95a27b54a6e450ee700ccabdf39d:

  Merge tag 'drm-msm-fixes-2021-02-25' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2021-03-26 13:04:17 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.12-rc6

for you to fetch changes up to 6161a435c1910d07ee00cc25af010889010e1f08:

  drm/exynos/decon5433: Remove the unused include statements (2021-03-29 19:53:23 +0900)

----------------------------------------------------------------
Just one cleanup which drops of_gpio.h inclusion.
- This header file isn't used anymore so drop it.

----------------------------------------------------------------
Tian Tao (1):
      drm/exynos/decon5433: Remove the unused include statements

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 1 -
 1 file changed, 1 deletion(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
