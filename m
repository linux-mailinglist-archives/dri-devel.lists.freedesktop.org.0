Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D6B3A39E7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 04:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2426E525;
	Fri, 11 Jun 2021 02:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD7E6E525
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 02:50:15 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210611025013epoutp01fbb7df9613d05e88c05206fcbf3d9312~HZ1bDqVnU2925329253epoutp01-
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 02:50:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210611025013epoutp01fbb7df9613d05e88c05206fcbf3d9312~HZ1bDqVnU2925329253epoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623379813;
 bh=76g/yp5nTxd62hNm4R1Rvvp7hkkQXghX9lgOEJeNmng=;
 h=From:To:Cc:Subject:Date:References:From;
 b=r30MhHmcniDV94ecXmggPZpc5E5xuvULQwAYVpKkweHfpjrJGhWtz06UrierObNvb
 QgifGB0qXDLnHUKHlS2SH7X81pFYohVnObShNNDox62yiL/IMza1tINzoLYyfOfKqb
 wDj26tESS4/bUlFpDLsZzzrEadVo+lcpDeWNZmsw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210611025012epcas1p3ee7617f510ae6c5060faccddfe5d6b45~HZ1a3Ak7y2092120921epcas1p3Q;
 Fri, 11 Jun 2021 02:50:12 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4G1QLT0nM1z4x9Q4; Fri, 11 Jun
 2021 02:50:09 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.AB.09701.55FC2C06; Fri, 11 Jun 2021 11:49:57 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210611024956epcas1p1c15767f446a585a62be9aec1482082c1~HZ1L8hyks2574525745epcas1p1c;
 Fri, 11 Jun 2021 02:49:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210611024956epsmtrp121a31882d7fd4524889a26617e1e0839~HZ1L72Jlx3125131251epsmtrp1S;
 Fri, 11 Jun 2021 02:49:56 +0000 (GMT)
X-AuditID: b6c32a36-647ff700000025e5-d2-60c2cf5549ca
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.8B.08163.45FC2C06; Fri, 11 Jun 2021 11:49:56 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210611024956epsmtip1bba7829aba57f707622d822070c8824f~HZ1LwLMSn2571825718epsmtip1I;
 Fri, 11 Jun 2021 02:49:56 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-next
Date: Fri, 11 Jun 2021 11:59:39 +0900
Message-Id: <20210611025939.393282-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7bCmgW7o+UMJBksWC1r0njvJZHHl63s2
 ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
 DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
 LAv0ihNzi0vz0vWS83OtDA0MjEyBChOyMz6cm8NSME+wYlXTAvYGxtV8XYycHBICJhKbDs1l
 6WLk4hAS2MEocebBQVYI5xOjxM4jB6Aynxklvu75wgzT0tDdzA6R2MUocXX/YyYI5wujxJTZ
 S1lBqtgEVCUmrrjPBmKLCIhIHF/2F8xmFnCT+LP0LAuILSygLLH7+j6wehag+iVtTxlBbF4B
 K4mzLfvZIbbJS8y89J0dIi4ocXLmExaIOfISzVtnM4MslhCYxy4xa9oDqPNcJD7PeA9lC0u8
 Or4FapCUxMv+NnaIhmZGiYkzTjNBOB2MEncfX2eBqDKW2L90MlCCA2iFpsT6XfoQYUWJnb/n
 MkJs5pN497WHFaREQoBXoqNNCKJESeLYxRuMELaExIUlE9kgSjwk2j+BA1tIIFaiefUGxgmM
 8rOQvDMLyTuzEPYuYGRexSiWWlCcm55abFhghBytmxjBqU3LbAfjpLcf9A4xMnEwHmKU4GBW
 EuHdufJQghBvSmJlVWpRfnxRaU5q8SFGU2AAT2SWEk3OBybXvJJ4Q1MjY2NjCxNDM1NDQyVx
 3p1sQE0C6YklqdmpqQWpRTB9TBycUg1MMbyPpna08k49I34vc3OT5q9yh9TnksKf2Kb9fdEn
 33D475llh9rWfBHfwZKo+eN2skrZL6d9D1l106JWhsR9FGUznfK06B6TcfckExUpoRPuDOu5
 bzLl2WVEc0o9Vjn008fsE6/R8Zj3Ol4pM0KSFt7/++uj2WzdN1WVUc4nt51b911gcYySTRPj
 ivR7kScutdoLXdv2M6YzfF7Ck6cyNcwuKXJ3BEVrzhZ93WD5fNuRy4v79q7j1diz3cfjysuQ
 pYsL5h92ULyw7BCbVtpc1lP72rlOXV7OLWlbyvT6sOsS1p+LDF3konWXbth6/iD/rjsXZHwk
 Lq030d/x69CsX76Hu/0/ut4+JbHmmdJjMSWW4oxEQy3mouJEAPWX6pD2AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJTjfk/KEEgwmPtCx6z51ksrjy9T2b
 xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZH87NYSmYJ1ixqmkBewPj
 ar4uRk4OCQETiYbuZnYQW0hgB6PEluV5XYwcQHEJiS1bOSBMYYnDh4shKj4xShydaQViswmo
 SkxccZ8NxBYREJE4vuwvmM0s4CHxfs9qsInCAsoSu6/vYwWxWYDql7Q9ZQSxeQWsJM627GeH
 uEBeYual7+wQcUGJkzOfsEDMkZdo3jqbeQIj3ywkqVlIUgsYmVYxSqYWFOem5xYbFhjlpZbr
 FSfmFpfmpesl5+duYgSHmJbWDsY9qz7oHWJk4mA8xCjBwawkwrtz5aEEId6UxMqq1KL8+KLS
 nNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGphiuq9+Z9u5vXzyFMHKFZek389d
 svOB79XC5e/dzq1d+yovmKt87ub3wZt+3qsK4NyzeZLWx4MqCQ97dDYy5XH/+HnkNf+UnD3Z
 28x+bN53t+Rhe2LOMcvomstbIubvcOvznx0sFvQ04Fzbr8V3J+7z5ey9rqgwZ1OuNJeerKJr
 cf4WrZmZ987b1Dgs7Mvaa7fs5LyD0959PWJ3+Pbe826bthpf7HY9f7elPT1K6Ql39sziSLU8
 ++21DVGfDnHz7c450nDIYueSX66/rrC92lz8MS7ja7dtQu2TzSI7uCfZXnS+vDqZ8VaCs9Fp
 82eTDjr4cogy/b7rfvdV9gSDpjWVTBJtOlKdzjvOJ1Q/0lN7oMRSnJFoqMVcVJwIAHxlz6ig
 AgAA
X-CMS-MailID: 20210611024956epcas1p1c15767f446a585a62be9aec1482082c1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210611024956epcas1p1c15767f446a585a62be9aec1482082c1
References: <CGME20210611024956epcas1p1c15767f446a585a62be9aec1482082c1@epcas1p1.samsung.com>
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

Hi Dave,

   Just two cleanups to replace pm_runtime_get_sync() with
   pm_runtime_resume_and_get().

   Please kinkdly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit c707b73f0cfb1acc94a20389aecde65e6385349b:

  Merge tag 'amd-drm-next-5.14-2021-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-06-10 13:47:13 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.14

for you to fetch changes up to 445d3bed75de4082c7c7794030ac9a5b8bfde886:

  drm/exynos: use pm_runtime_resume_and_get() (2021-06-11 10:56:38 +0900)

----------------------------------------------------------------
Two cleanups
- These patches make Exynos DRM driver to use pm_runtime_resume_and_get()
  function instead of m_runtime_get_sync() to deal with usage counter.
  pm_runtime_get_sync() increases the usage counter even when it failed,
  which could make callers to forget to decrease the usage counter.
  pm_runtime_resume_and_get() decreases the usage counter regardless of
  whether it failed or not.

----------------------------------------------------------------
Inki Dae (1):
      drm/exynos: use pm_runtime_resume_and_get()

Tian Tao (1):
      drm/exynos: Use pm_runtime_resume_and_get() to replace open coding

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  7 ++++++-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  7 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  7 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  8 +++++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 25 ++++++++++++++++++++-----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  9 ++++++++-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  7 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_mic.c       |  6 ++----
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  7 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 10 ++++++----
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  8 +++++++-
 drivers/gpu/drm/exynos/exynos_mixer.c         |  7 ++++++-
 12 files changed, 86 insertions(+), 22 deletions(-)
