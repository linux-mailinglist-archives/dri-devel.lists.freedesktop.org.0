Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68AE6CB549
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 06:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D7F10E468;
	Tue, 28 Mar 2023 04:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E5810E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 04:05:30 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230328040527epoutp0182b82c3b1dd4fabbbd33e181f8615bf8~QeZG7AN-k0884608846epoutp01b
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 04:05:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230328040527epoutp0182b82c3b1dd4fabbbd33e181f8615bf8~QeZG7AN-k0884608846epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679976327;
 bh=Z3hs219xeHXy8g8q9KpnlgGaF4PmKmwcE1tTweN8LM8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=GuORUCEvQD9RM6fm2TyG2p/lJ8/J2IZzjCCixtpUJntJKYsF7pwpqhM+e2NtzYbfY
 /RZakdxm71wwajJnWZ+o9mXR3gFyDvMan4CL/Pnh+P9EJtzPY6Y1Kwfu7dR+wV/2gf
 P0iF5YCsoUwverlC46UjYSqbUJqhdHpqcb8i/jcg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230328040527epcas1p1d950746dfcb3351ac639e80251ee023c~QeZGvgpBT2950329503epcas1p1f;
 Tue, 28 Mar 2023 04:05:27 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.232]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Plx121K8Rz4x9QF; Tue, 28 Mar
 2023 04:05:26 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 91.2F.55531.48762246; Tue, 28 Mar 2023 13:05:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230328040524epcas1p270b050efedfe53d8e59c7e9103d5b84c~QeZD4-6uD0992909929epcas1p2q;
 Tue, 28 Mar 2023 04:05:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230328040524epsmtrp1465df52699d48602b3f86796add150a5~QeZD4YVmH1247312473epsmtrp1R;
 Tue, 28 Mar 2023 04:05:24 +0000 (GMT)
X-AuditID: b6c32a35-00ffd7000000d8eb-e8-6422678493b1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 5E.3B.31821.48762246; Tue, 28 Mar 2023 13:05:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230328040524epsmtip28bafa69e5660af30e53d107585765fb9~QeZDwtnzg0781807818epsmtip2p;
 Tue, 28 Mar 2023 04:05:24 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 28 Mar 2023 13:05:24 +0900
Message-Id: <20230328040524.49278-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7bCmnm5LulKKwYxPpha9504yWfzfNpHZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj4bNe1oIz8hWzJm1kamDcIdHF
 yMkhIWAiMfvKIaYuRi4OIYEdjBK77jSzQDifGCWmPH0LlfnMKLFhagcLTMv1p/+hErsYJT48
 OQPlfGGUeLV9AjNIFZuAqsTEFffZQGwRIPvtpMdgcWYBN4k/S8+CTRIWUJbYfX0fK4jNAlRz
 +XofWA2vgKXE7t2roLbJS8y89J0dIi4ocXLmExaIOfISzVtnM4MslhDYxC5xeOUSVogGF4mV
 D5qZIGxhiVfHt7BD2FISL/vb2CEaJjNK3Lm+ggXCmcEocfjndUaIKmOJ/UsnA3VzAK3QlFi/
 Sx8irCix8/dcRojNfBLvvvawgpRICPBKdLQJQZQoSRy7eANqioTEhSUT2SBsD4mbTVvAbhMS
 iJWY0rSLcQKj/Cwk/8xC8s8shMULGJlXMYqlFhTnpqcWGxYYwuM1OT93EyM44WmZ7mCc+PaD
 3iFGJg7GQ4wSHMxKIrybvRVThHhTEiurUovy44tKc1KLDzGaAkN4IrOUaHI+MOXmlcQbmlga
 mJgZGZtYGJoZKonzitueTBYSSE8sSc1OTS1ILYLpY+LglGpgunpnf3EsR6nHGv2rrKul5T/O
 L9j3utUhtuRjg0b6lmqTFdlisodFf+rvudrt4Zzyct2TvXzrJXnXRLhc9/Zuicif3GHdFK5x
 Qluxa+an1fnMzgsmr92344PZ6r4LB2QM2YRn3z2X+OMKo2qYWdwZjyeXfXIYXyz72erbtF0o
 KCWvSLlW993b/2lM8eHTNuUHmH07274vaIvg1nipfZdmCBmoci60UnXorNq3WWGy7tmI9x/a
 rJ71mp+L3P6w1uac2J6ChttXmjuWvE5JrJL601ozi8fn+E721oL4B1LJAhdm7imrYvKesG8t
 829D1uTzN1XvFBXnrDffdMnReW1/W9JJXbZVYhtzVvBqdM9SYinOSDTUYi4qTgQAZg0CIgEE
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsWy7bCSvG5LulKKwcMZCha9504yWfzfNpHZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCWKyyYlNSezLLVI3y6BK2Phs17W
 gjPyFbMmbWRqYNwh0cXIySEhYCJx/el/pi5GLg4hgR2MEiu/HmfuYuQASkhIbNnKAWEKSxw+
 XAxR8olRoufuU1aQXjYBVYmJK+6zgdgiAuoSDy4vZASxmQU8JN7vWc0OYgsLKEvsvr4PrJ4F
 qP7y9T5mEJtXwFJi9+5VLBA3yEvMvPSdHSIuKHFy5hMWiDnyEs1bZzNPYOSbhSQ1C0lqASPT
 KkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4NDT0trBuGfVB71DjEwcjIcYJTiYlUR4
 N3srpgjxpiRWVqUW5ccXleakFh9ilOZgURLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXApBQU
 zfH/fkii6Lmququc3XEXzY1txdi+ey7/z63ykYkz1fW44dFL5YfmbplVY16Rqvdc5TTfo8m+
 9i6x7nM/9GiHxZ1o0xVX6jwoocn49GmCoJ+n2/dbG83bC479Ui11bGX57xGhlP3aYMen84kx
 KfrFGw8EXz4zp/W32VpH7yUz4tTW/+Z7+V/lv9Osl9usq+IW7ZrIY/H32NqGbIEZMZxHHX3u
 a19d+VRIVVfMIe1WzlbNSWKaFzmPcXHlpunPcApjb/59tWTnzglsur/X7dufk39i01u9286N
 GosvWTkIvLRl0a/4PyFdwNppgbxJSd/1ZZPldvXyT5rilnfAJZHxuFaMera00NeDbCeVWIoz
 Eg21mIuKEwGjgmr0rAIAAA==
X-CMS-MailID: 20230328040524epcas1p270b050efedfe53d8e59c7e9103d5b84c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230328040524epcas1p270b050efedfe53d8e59c7e9103d5b84c
References: <CGME20230328040524epcas1p270b050efedfe53d8e59c7e9103d5b84c@epcas1p2.samsung.com>
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

   Just one patch series that moves the existing Exynos DSI driver
   to drm/bridge directory to support both SoCs family - Exynos
   and I.MX - because same Exynos MIPI DSI ip can be used by the two
   different SoC family.

   Of course, there are some concerns about this patch series because Exynos
   and I.MX SoCs have different HW characteristic but use the same HW driver.
   However, I believe that there should be no problem as Exynos and I.MX
   developers have conducted tests and reviews enough for about a year
   since last April.

   This would be the first case that we allow different vendor SoCs to use
   same device driver at least in DRM world so we anticipate experiencing
   and resolving new issues through ongoing maintenance, and ultimately,
   the experiences gained here will undoubtedly be able to contribute
   the development of the community as well.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 46f28427f6f824b6cff06fa025a55350b7de454a:

  Merge tag 'drm-rcar-next-20230325' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into drm-next (2023-03-27 18:20:20 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.4

for you to fetch changes up to b2cfec52feb3bb737c4b65018ef4bfe9789e4be8:

  drm: bridge: samsung-dsim: Add i.MX8M Plus support (2023-03-28 09:05:41 +0900)

----------------------------------------------------------------
A patch series for moving MIPI-DSI driver for Exynos DRM to drm/bridge
directory so that I.MX SoC family can also share the same device driver.
Samsung MIPI DSIM device is a common IP that can be used by Exynos and I.MX8M
Mini/Nano/Plus SoC. Regarding this, this patch series has added several
things below to existing MIPI DSI driver,
	- Add exynos_dsi_type enum type to provide controller data from different
	  platforms.
	- Add two pipeline detection ways support - existing Exynos DSI child node
	  and I.MX family of-graph port or ports.
	- Consider component and bridged based DRM drivers.
	- Add device tree binding support of I.MX family.

----------------------------------------------------------------
Jagan Teki (14):
      drm: exynos: dsi: Drop explicit call to bridge detach
      drm: exynos: dsi: Lookup OF-graph or Child node devices
      drm: exynos: dsi: Mark PHY as optional
      drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
      drm: exynos: dsi: Introduce hw_type platform data
      drm: exynos: dsi: Add atomic check
      drm: exynos: dsi: Add input_bus_flags
      drm: exynos: dsi: Add atomic_get_input_bus_fmts
      drm: exynos: dsi: Consolidate component and bridge
      drm: exynos: dsi: Add host helper for te_irq_handler
      drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
      dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
      drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
      dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support

Marek Szyprowski (1):
      drm: exynos: dsi: Handle proper host initialization

Marek Vasut (1):
      drm: bridge: samsung-dsim: Add i.MX8M Plus support

 .../bindings/display/exynos/exynos_dsim.txt        |    2 +
 MAINTAINERS                                        |    9 +
 drivers/gpu/drm/bridge/Kconfig                     |   12 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c              | 1967 ++++++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 1813 +-----------------
 include/drm/bridge/samsung-dsim.h                  |  115 ++
 8 files changed, 2191 insertions(+), 1729 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h
