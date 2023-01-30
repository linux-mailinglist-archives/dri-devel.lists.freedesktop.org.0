Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263268056E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 06:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDF510E060;
	Mon, 30 Jan 2023 05:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C00510E060
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 05:11:01 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230130051058epoutp0270056268a551feb487a4480b95df7ad2~_-hCrqH6V2118421184epoutp02L
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 05:10:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230130051058epoutp0270056268a551feb487a4480b95df7ad2~_-hCrqH6V2118421184epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1675055459;
 bh=eJa/ABef80sC4wWricjAmL+ZdecM7xhVEvWQf4JlA/k=;
 h=From:To:Cc:Subject:Date:References:From;
 b=D0a3Nvd7NaOhsjxqUMVzmCEIHV6c3rb4BlN1ZY5KEnGWMb5FmQoocix3IVvB0x8u9
 IbHdczYuYqPKdr9hqqNP6+VYEk9HzuPd5TPVI9xVvnaiV18VmQD8zU6/64quKBR/no
 nN99bjpsSDWUFuieGFJBa6bAaYLVua+edFDLK53w=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230130051058epcas1p230726f4ea2e43c048a43da2e404099fa~_-hCY-WHQ3098030980epcas1p2e;
 Mon, 30 Jan 2023 05:10:58 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.237]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4P4x8x1kLDz4x9QK; Mon, 30 Jan
 2023 05:10:57 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 22.41.55531.06157D36; Mon, 30 Jan 2023 14:10:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20230130051056epcas1p3864c816bfccf0c8a6e7f8601b240b11e~_-hACG1EJ0798207982epcas1p3a;
 Mon, 30 Jan 2023 05:10:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230130051056epsmtrp2c624e1c3680bdf79070af51bf00e3cf6~_-hABdhHy2600926009epsmtrp2R;
 Mon, 30 Jan 2023 05:10:56 +0000 (GMT)
X-AuditID: b6c32a35-d9fff7000000d8eb-70-63d7516062b1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 0D.27.17995.06157D36; Mon, 30 Jan 2023 14:10:56 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230130051055epsmtip1bb1f459e820e4d23e3c064944dd45066~_-g-4t2gG0503005030epsmtip1C;
 Mon, 30 Jan 2023 05:10:55 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-next
Date: Mon, 30 Jan 2023 14:10:55 +0900
Message-Id: <20230130051055.15340-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDKsWRmVeSWpSXmKPExsWy7bCmvm5C4PVkg84roha9504yWfzfNpHZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvjwq/H7AX9ghVTuywbGBv4uhg5
 OSQETCRedZ5m7WLk4hAS2MEosWzdByjnE6PEp4/7WEGqhAQ+M0ps+ecM03Fk+1MmiKJdjBI/
 t31hgXC+MEr8eXiDEaSKTUBVYuKK+2wgtgiQ/XbSY2YQm1nATeLP0rMsILawgLLE7usQG1iA
 am73HgSzeQUsJdoP3GaE2CYvMfPSd3aIuKDEyZlPWCDmyEs0b53NDLJYQmAdu8S9zz/ZIBpc
 JLbfmgfVLCzx6vgWdghbSuLzu71sEA2TGSXuXF/BAuHMYJQ4/PM6VIexxP6lk4Ge4wBaoSmx
 fpc+RFhRYufvuYwQm/kk3n3tYQUpkRDglehoE4IoUZI4dvEG1BQJiQtLJkLd4yFxqPsvCyQY
 YyUOTvnDNIFRfhaSf2Yh+WcWwuIFjMyrGMVSC4pz01OLDQsM4bGanJ+7iRGc7LRMdzBOfPtB
 7xAjEwfjIUYJDmYlEd54s2vJQrwpiZVVqUX58UWlOanFhxhNgSE8kVlKNDkfmG7zSuINTSwN
 TMyMjE0sDM0MlcR5xW1PJgsJpCeWpGanphakFsH0MXFwSjUw8T00eJmyZtKuKQHzmYrEt0cv
 X7lazimgPvrSU6l5FxrT+MtDFplf/8K7+JL4z272d/V+Yn/fTX/gd9qX3c3pqI1a4JszThz6
 O1+dTc3bNlstTamyxOWggMN5x00JWyY615+pmPLiphTHwfI3yu4r7wuq6nzemMNQJWLNHyQ5
 fUbvOvb/VS+U72/1ORI3S7nSyXyq3+3NeUenOHs/FdGp/vSo+fxey9sLyuTum8gvfvxcX16n
 J2ixk87yhg0pPhem3FpmorzVbW3lEns3Jp5/vyz0MrW7kv6ofnm2o/SZm3He0t9et88Yz9me
 G2JWeKTc8dn6p188bm9fzbog0uWWY9KqH79erXf8Yx3NN0VxmhJLcUaioRZzUXEiAAX/oVP/
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWy7bCSnG5C4PVkg6U3WCx6z51ksvi/bSKz
 xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV8aFX4/Z
 C/oFK6Z2WTYwNvB1MXJySAiYSBzZ/pSpi5GLQ0hgB6PEgV+PmbsYOYASEhJbtnJAmMIShw8X
 Q5R8YpRYfeQVM0gvm4CqxMQV99lAbBEBdYkHlxcygtjMAh4S7/esZgexhQWUJXZf38cKYrMA
 1d/uPQhm8wpYSrQfuM0IcYO8xMxL39kh4oISJ2c+YYGYIy/RvHU28wRGvllIUrOQpBYwMq1i
 lEwtKM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAgOPC2tHYx7Vn3QO8TIxMF4iFGCg1lJhDfe
 7FqyEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUzRfRGe
 Z2pKUxPWPmyKmGl/SfKRY5whn+Nk13grttgaq81ZcxT0N+5m3vXrxYaEDbtZcvJD77oEndmz
 YZlC8Kp15/0vrT/Awzyh9ODpt8vbZDa7cb9vf5dsenJ/F4fVW8dVX7hNAi4fOCO2ICDV3dUy
 0zJ1+7El8t3hEpt1Xs//zR8tJnz11ve+XZ69ApZfve+sjfjjmD+xTJmdXfXDDY3UXLmzq512
 tUqbz39y//jWq58CwiXCbV/0VUv8ZF6UzrAp2j5dZKqZDK8FH+eDjpI8psstk2LMY5REuE2k
 ywKa+SxzTl/3PWpXmOD2hfVF4sVTum6Fj79VdyctWHZYt9Gted2aMhsJ5b9XX62vUmIpzkg0
 1GIuKk4EAE2QwfurAgAA
X-CMS-MailID: 20230130051056epcas1p3864c816bfccf0c8a6e7f8601b240b11e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230130051056epcas1p3864c816bfccf0c8a6e7f8601b240b11e
References: <CGME20230130051056epcas1p3864c816bfccf0c8a6e7f8601b240b11e@epcas1p3.samsung.com>
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

   Just one fixup series to restore proper bridge chain order of Exynos
   Display pipeline.
   This is also required by a patch series[1] which makes existing Exynos
   DSI driver to be common driver so that it can be used by Exynos and I.MX8MM
   SoC commonly - under the review yet.

   [1] https://lore.kernel.org/linux-arm-kernel/d4267645-448c-f702-fcc3-6c534d9ec2b7@denx.de/T/

Please let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 68de345e101ce9a24e5c8849e69dd0dba2e8c9b2:

  Merge tag 'drm-misc-next-2023-01-24' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-01-25 12:14:08 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.3

for you to fetch changes up to 1a1ce789e6c5da5a16d3d17bc228c6ab0b5863ed:

  drm: exynos: dsi: Restore proper bridge chain order (2023-01-26 15:11:24 +0900)

----------------------------------------------------------------
One fixup series
- Make sure to restore bridge chain order by enabling the drm panel
  prepare_prev_first flag of the bridge and panel drivers - tc358764 display
  bridge device and Samsung s6e3ha2/s6e63j0x03/s6e8aa0 panel devices.
  In case of any boards using Exynos5433 SoC, below Display pipeline could be
  configured.
      Decon -> MIC -> MIPI-DSI -> Panel
  So, this patch series makes sure to enable previous bridge device before
  enabling MIPI-DSI device.

----------------------------------------------------------------
Jagan Teki (2):
      drm: panel: Enable prepare_prev_first flag for samsung-s6e panels
      drm: exynos: dsi: Restore proper bridge chain order

Marek Szyprowski (1):
      drm/bridge: tc358764: Enable pre_enable_prev_first flag

 drivers/gpu/drm/bridge/tc358764.c                | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c          | 9 +++++++--
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 1 +
 5 files changed, 11 insertions(+), 2 deletions(-)
