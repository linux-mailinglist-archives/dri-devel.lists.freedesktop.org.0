Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E7571224
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 08:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1E3113B60;
	Tue, 12 Jul 2022 06:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3095F10FA87
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 06:10:16 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220712061014epoutp02de00699f250585f42c6cce6fa63022b9~BABG_yF8x0971209712epoutp02r
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 06:10:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220712061014epoutp02de00699f250585f42c6cce6fa63022b9~BABG_yF8x0971209712epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1657606214;
 bh=N8GYedKNDSPz7Lc7caJu8nhqgbUnmR/8OXe/iACBxQk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=o5744k0uDB+DN94Y0iZk4RXPhBWUaZbWQ0tVW5N0opThg2mkxdYci9lnFs8utpSR2
 uetMs9I2atLRTRluRzpLJ3HV9C17esZVSaM9gB3RD79PRDLD2f55+I/874LUeIfMNr
 lIUGkrWkEzn2KCEQHT8kZnQB22OA09vvt9irpOHY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220712061013epcas1p4595bdb33e2fbf147c3b284ad694f9676~BABGqgFD-1418514185epcas1p40;
 Tue, 12 Jul 2022 06:10:13 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.236]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Lhr2X0VdVz4x9Pv; Tue, 12 Jul
 2022 06:10:12 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 93.E9.09657.1401DC26; Tue, 12 Jul 2022 15:10:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220712061009epcas1p2a58002c639023a32375700be9ee9dea5~BABCXZJJd0276502765epcas1p2w;
 Tue, 12 Jul 2022 06:10:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220712061009epsmtrp1d0fe57ad6e37c89811b93a3a6b6564d4~BABCWpwG80547905479epsmtrp1Q;
 Tue, 12 Jul 2022 06:10:09 +0000 (GMT)
X-AuditID: b6c32a35-733ff700000025b9-f2-62cd10414bc1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E6.6D.08905.0401DC26; Tue, 12 Jul 2022 15:10:09 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220712061008epsmtip2e4f9eac3c99db6a30f65bd82372efc82~BABCORCfj0846308463epsmtip2N;
 Tue, 12 Jul 2022 06:10:08 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 12 Jul 2022 15:10:08 +0900
Message-Id: <20220712061008.199961-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7bCmvq6jwNkkg65jYha9504yWfzfNpHZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITuj7eR55oLZghVTJv9ibGA8z9vF
 yMEhIWAisXKPWRcjJ4eQwA5GiZ4v6l2MXED2J0aJN7u/sEE43xglZs9oZYRp2N6nDRHfyyhx
 pPMxK4TzhVHi07l1rCCj2ARUJSauuM8GYosA2W8nPWYGsZkF3CT+LD3LAmILCyhL7L6+D6ye
 Bahm+sf3YAt4Bawkdm4XAAlLCMhLzLz0nR3E5hUQlDg58wkLxBh5ieats5lB9koIbGOX2LCq
 gw2iwUXi0Pf7LBC2sMSr41vYIWwpiZf9bewQDZMZJe5cX8EC4cxglDj88zojRJWxxP6lk5lA
 rmAW0JRYv0sfIqwosfP3XEaIzXwS7772sEJCgleio00IokRJ4tjFG1BTJCQuLJkIdY+HxK2V
 x9kgwRsr8XTVUdYJjPKzkPwzC8k/sxAWL2BkXsUollpQnJueWmxYYAiP0+T83E2M4ESnZbqD
 ceLbD3qHGJk4GA8xSnAwK4nw/jl7KkmINyWxsiq1KD++qDQntfgQoykwgCcyS4km5wNTbV5J
 vKGJpYGJmZGxiYWhmaGSOO+qaacThQTSE0tSs1NTC1KLYPqYODilGpia3QKznxmxJfYKbJ08
 JeDB1jsfnb7+5lW8NmfPoorGnv0O+t8ZJmqse+2++2dOwoQdTZaqSWGP1i0WqBVpjLLvKfj3
 +9Dh7/c/zmZLrWM2DeSy8S6r55kXvp59x8e9cfmh1+offdidcJ9jUlJ/sLzUgVt3tPOTc/4v
 1F25+NlXvj6GoLzfPvW6aaZyW22cheKyFVt8M7/oL0i+49aZt6Ay13V9yTyV4oVcc09c2jjN
 6Mfsu2bPFKUnrXVj6vEV1pq5YPf3Ilfr0Hv5VoITrhld7luXfpFjcuZLZqklbpcvlOtOLjj2
 KSG98dLtRuUL/7aH2ilWP7qncudtQ0aEd2yc7IXZO481HHhiX8ezmFmJpTgj0VCLuag4EQAP
 Paay/QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOLMWRmVeSWpSXmKPExsWy7bCSvK6jwNkkg58rmC16z51ksvi/bSKz
 xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV0bbyfPM
 BbMFK6ZM/sXYwHiet4uRg0NCwERie592FyMXh5DAbkaJg2vvsUHEJSS2bOWAMIUlDh8uhij5
 xCjx//g/li5GTg42AVWJiSvus4HYIgLqEg8uL2QEsZkFPCTe71nNDmILCyhL7L6+jxXEZgGq
 n/7xPSPITF4BK4md2wVAwhIC8hIzL30HK+cVEJQ4OfMJC8QYeYnmrbOZJzDyzUKSmoUktYCR
 aRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnDYaWnuYNy+6oPeIUYmDsZDjBIczEoi
 vH/OnkoS4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1OqgUnX
 oyY18qHHyXk+Hm0ahyVMOLV11XhvxS54f/ymweabnIKM52bVvIpjn++g/WGH612B9yaOf723
 h7jNm/Jax7hGSPbDx1ZbbeZnUm8MLv9M3fvrvkDB6hLOk8s4jZZ1yzzpc1JfprQm9eG/f893
 eV9ZsFTi3izxNfO5o4/NFs5La3d/ULvrV5F9QneOy82+A/V/lz5kn/TYQOznj00vNsu+NhWu
 mXvORup32/Yrma5/GLiUHr8oYVq53Lzk/7X9+7gfHJl9VunlVt5HZzOaL6Z0mZ99X7H7WMoW
 7yt8J+/O987k+RpTuU3TSvDJr31r818eq23YKHBwHovY4eTIXZdtl7ScWlGu9mX9k6kdpSFW
 SizFGYmGWsxFxYkA8dmylaoCAAA=
X-CMS-MailID: 20220712061009epcas1p2a58002c639023a32375700be9ee9dea5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220712061009epcas1p2a58002c639023a32375700be9ee9dea5
References: <CGME20220712061009epcas1p2a58002c639023a32375700be9ee9dea5@epcas1p2.samsung.com>
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

   Just two cleanups which remove invalid maintainer info and one fixup
   for releasing resouce.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit c6a3d73592ae20f2f6306f823aa5121c83c88223:

  Merge tag 'drm-intel-gt-next-2022-06-29' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-07-01 14:14:52 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.20

for you to fetch changes up to 48b927770f8ad3f8cf4a024a552abf272af9f592:

  drm/exynos/exynos7_drm_decon: free resources when clk_set_parent() failed. (2022-07-12 13:56:54 +0900)

----------------------------------------------------------------
Two cleanups
- Remove Joonyoung Shim from MAINTAINERS and relevant yaml files.
  He left from Samsung so his email address isn't valid anymore.

Fixup
- Fix resume function issue of exynos decon driver by calling
  clk_disable_unprepare() properly if clk_prepare_enable() failed.

----------------------------------------------------------------
Jian Zhang (1):
      drm/exynos/exynos7_drm_decon: free resources when clk_set_parent() failed.

Krzysztof Kozlowski (2):
      drm/exynos: MAINTAINERS: move Joonyoung Shim to credits
      dt-bindings: remove Joonyoung Shim from maintainers

 CREDITS                                                 |  4 ++++
 .../display/samsung/samsung,exynos-hdmi-ddc.yaml        |  1 -
 .../bindings/display/samsung/samsung,exynos-hdmi.yaml   |  1 -
 .../bindings/display/samsung/samsung,exynos-mixer.yaml  |  1 -
 .../display/samsung/samsung,exynos5433-decon.yaml       |  1 -
 .../display/samsung/samsung,exynos5433-mic.yaml         |  1 -
 .../bindings/display/samsung/samsung,exynos7-decon.yaml |  1 -
 .../bindings/display/samsung/samsung,fimd.yaml          |  1 -
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml           |  1 -
 MAINTAINERS                                             |  1 -
 drivers/gpu/drm/exynos/exynos7_drm_decon.c              | 17 +++++++++++++----
 11 files changed, 17 insertions(+), 13 deletions(-)
