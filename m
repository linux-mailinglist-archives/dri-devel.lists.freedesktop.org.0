Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CB3A93675
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 13:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0145010EB8B;
	Fri, 18 Apr 2025 11:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Agx7h2pJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9FE10E10F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:23:01 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250418112259euoutp028d0965319d4d5de12b9468479238a3bc~3Zdy0ZyoS0864108641euoutp022
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:22:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250418112259euoutp028d0965319d4d5de12b9468479238a3bc~3Zdy0ZyoS0864108641euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744975379;
 bh=yzaBvKzzEWWyLTE1pyTYFM8f6ViBLwOiNdNueDjhZzg=;
 h=From:Subject:Date:To:Cc:References:From;
 b=Agx7h2pJRQjZPeRRRAb5stJUq58TRl+E6MIK+pVqgQZpqZ0xstoDmn7OiV5wpjac0
 HDWaCN3g3E57aKJan17328BYFgcAe09HbXT0W4DLN03TDxsUBiDg/W6asWn3E8G07N
 tBYD7PUU2GWBxcR52lU401cT72wQtjcyRD9gLKDI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250418112258eucas1p22468c70dfc2f1313fb1427ee76939b89~3ZdycMMLE1933319333eucas1p2D;
 Fri, 18 Apr 2025 11:22:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 9E.AE.20821.21632086; Fri, 18
 Apr 2025 12:22:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250418112258eucas1p28186b27890dbed4cbc05b2ddd8f94327~3ZdxtNRXh0304303043eucas1p2g;
 Fri, 18 Apr 2025 11:22:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250418112257eusmtrp1343528e483703d9339388d0e6e724f8a~3Zdxde5Rp2607526075eusmtrp1m;
 Fri, 18 Apr 2025 11:22:57 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-d7-6802361210da
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 41.98.19654.11632086; Fri, 18
 Apr 2025 12:22:57 +0100 (BST)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250418112256eusmtip237aa76492b51754773f723e760e428c2~3ZdwrNQwu3259732597eusmtip2V;
 Fri, 18 Apr 2025 11:22:56 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v6 0/2] Add optional reset for the drm/imagination driver
Date: Fri, 18 Apr 2025 13:22:47 +0200
Message-Id: <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAc2AmgC/x3MTQqAIBBA4avIrBNUMqyrREg/k82ikjEikO6et
 PwW72VIyIQJOpGB8aZE51HQVALmbTwCSlqKwShjVa2dHCN77TxjwsvTHuSklWmdU9YsCCWLjCs
 9/7If3vcDMSsFS2IAAAA=
X-Change-ID: 20250418-apr_18_reset_img-b102988052de
To: Frank Binns <frank.binns@imgtec.com>,  Matt Coster
 <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>,  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Michal Wilczynski
 <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHKsWRmVeSWpSXmKPExsWy7djPc7pCZkwZBp8valicuL6IyWLN3nNM
 FvOPnGO1uPL1PZvFuqcX2C1ezrrHZrH39VZ2i8u75rBZrD1yl91i/df5TBYLP25lsViyYxej
 RVvnMlaLu/dOsFj837OD3WL2u/3sFlveTGR1EPTY+20Bi8fOWXfZPXp2nmH02LSqk83jzrU9
 bB7zTgZ63O8+zuTR/9fAo2/LKkaPzaerPT5vkgvgjuKySUnNySxLLdK3S+DK+P/TsmCacMXW
 r23MDYx3+bsYOTkkBEwk1j39ytTFyMUhJLCCUeL++bOsEM4XRonZMx6yglQJCXxmlLjxVRqm
 4+LnTSwQRcsZJV5uuQjltDFJ3Dk/jRmkik3ASOLB8vlg3cICnhKH1u8Bsjk4WARUJea/0gUJ
 8wq4SuydfZ0RwhaUODnzCQuIzSwgL7H97RxmkJkSAhsYJZbemMQOsdlYYkfjU7DzRAReMktc
 WLeEEcRhFjjJKLGw6zAjRJWoxO/Ju1gg2g9zSnxYcIsZIuEiseLxJ6hRwhKvjm+BsmUkTk/u
 YYGw8yUebP0EVV8jsbPnOJRtLXHn3C82kBeYBTQl1u/Shwg7Suz5voUFJCwhwCdx460gxAd8
 EpO2TWeGCPNKdLQJQVSrSUzt6YVbem7FNqYJjEqzkPw/C8n/sxB2LWBkXsUonlpanJueWmyY
 l1quV5yYW1yal66XnJ+7iRGYBE//O/5pB+PcVx/1DjEycTAeYpTgYFYS4Z2uw5QhxJuSWFmV
 WpQfX1Sak1p8iFGag0VJnHfR/tZ0IYH0xJLU7NTUgtQimCwTB6dUA5Or4mI1RQ8dwaWF/Qvz
 dxvZtr79uGTui+6TWU/DpyRN3xEfX5kZffYk041bO3fd//VnwXvBp6uWeiwODVz0psPkzjr3
 E79ST8dI/LM5d6Qv8pTu2/y5WVvM5uq8fHZD/Lrew56tnKG/F7s/kn7DGHNgTx+n6zw3vcPB
 ywTW7VnU6ZKW6K4w19fDpWSi1qKWlJUCV2sszCbueadtnbDreM2yYI0EBrWW4657udi2bZ7P
 4fBTVLFk747Hk6SlnfO4qt6eUbk6a/7fpp+ZkTYcVn/f3Jdn9zqVeH/BsmtNf5ULUhl+v84L
 ez7DeId0HttU7xvheeW/K5f6B03xOnTy3hzt17o10yaGv9uY/vzzvKAwJZbijERDLeai4kQA
 wR8/zfEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7qCZkwZBgtna1qcuL6IyWLN3nNM
 FvOPnGO1uPL1PZvFuqcX2C1ezrrHZrH39VZ2i8u75rBZrD1yl91i/df5TBYLP25lsViyYxej
 RVvnMlaLu/dOsFj837OD3WL2u/3sFlveTGR1EPTY+20Bi8fOWXfZPXp2nmH02LSqk83jzrU9
 bB7zTgZ63O8+zuTR/9fAo2/LKkaPzaerPT5vkgvgjtKzKcovLUlVyMgvLrFVija0MNIztLTQ
 MzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL+P/TsmCacMXWr23MDYx3+bsYOTkkBEwkLn7e
 xNLFyMUhJLCUUWJ/z3oWiISMxLXul1C2sMSfa11sILaQQAuTRP85bxCbTcBI4sHy+awgtrCA
 p8Sh9XuAbA4OFgFVifmvdEHCvAKuEntnX2eEsAUlTs58wgJSwiygKbF+lz5ImFlAXmL72znM
 ICdICGxglNiy/h4zxFpjiR2NT1lBEiICb5glVj74xgjiMAucYpSYMPUqO0SVqMTvybtYJjAK
 zkKyZBbCkllIlixgZF7FKJJaWpybnltspFecmFtcmpeul5yfu4kRGNvbjv3csoNx5auPeocY
 mTgYDzFKcDArifBO12HKEOJNSaysSi3Kjy8qzUktPsRoCvTnRGYp0eR8YHLJK4k3NDMwNTQx
 szQwtTQzVhLnZbtyPk1IID2xJDU7NbUgtQimj4mDU6qBqeNc3oHF33R0N+hYczO5WYRUGDEo
 3nr2b4m0o3XDot+cLQ6H2A6v33eJ+2ud8/fwiKYdjB8WdymJuLlf01KJ2/LhXK5VUPHp37zv
 rFmufW1hnNa14MwE5guTn05oOH7BrOy1/oafC0rUb6gdO2635Nfzh58rHNmeCT+2V3PUdSi5
 F66ZdNTc+XD8uvdnwic9lCloCdeJa/ZJNChYsS6x79Ntk4k9dhb9WUXB6rY+0llzLOz39kSV
 cljtKpWZ9UevMKL3E+eRDScal2ZZK5Srn7NIj2tWtRG73NDzfNr1yEUHFx3IZJx1/ljpWyep
 y9M/C9v4s79puxn8jLHdU3BvzBXRGY7XJ/xZlXiwdTa/EktxRqKhFnNRcSIAMWuHpXYDAAA=
X-CMS-MailID: 20250418112258eucas1p28186b27890dbed4cbc05b2ddd8f94327
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250418112258eucas1p28186b27890dbed4cbc05b2ddd8f94327
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250418112258eucas1p28186b27890dbed4cbc05b2ddd8f94327
References: <CGME20250418112258eucas1p28186b27890dbed4cbc05b2ddd8f94327@eucas1p2.samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces and documents optional reset support for
the drm/imagination driver. While developed as part of a larger effort
to enable the Imagination BXM-4-64 GPU upstream, these patches can merge
independently.

During the upstreaming process, we discovered that the T-HEAD TH1520 SoC
requires custom code to manage resets and clocks from the power-domain
driver [1]. Nevertheless, adding this reset capability is necessary, as
the GPU Device Tree node would own the reset control and would manage it
for boards like BPI-F3 that don't have custom requirements for handling
clocks and resets during their startup sequence.

For more context, please see the cover letter for the larger series [2].

[1] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com/
[2] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/

This series is versioned to maintain continuity with the bigger patchset
it is a subseries of. Please find below changelog for the
drm/imagination reset part:

v6:
 - no changes, just a re-send, bumping version to avoid confusion

v5:
 - moved the recommended 1 microsecond delay after de-asserting GPU
   reset to the Imagination driver itself 

v4:
 - reverted reset-cells configuration to single cell as in v2
 - addressed minor implementation issues in the DRM/Imagination reset driver

v3:
 - refactored reset driver to use zero cells

v2:
 - updated the drm/imagination driver to act as a reset controller
   consumer. While this patchset is focused on the LPI4A board, the
   reset controller is designed to be useful for other boards, such as the
   BPI-3F, which also require a reset sequence after power-up.

---
Michal Wilczynski (2):
      dt-bindings: gpu: Add 'resets' property for GPU initialization
      drm/imagination: Add reset controller support for GPU initialization

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |  3 +++
 drivers/gpu/drm/imagination/pvr_device.c           | 21 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h           |  9 +++++++++
 drivers/gpu/drm/imagination/pvr_power.c            | 22 +++++++++++++++++++++-
 4 files changed, 54 insertions(+), 1 deletion(-)
---
base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
change-id: 20250418-apr_18_reset_img-b102988052de

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

