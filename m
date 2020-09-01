Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F725869D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 06:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E396E57A;
	Tue,  1 Sep 2020 04:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3F16E578
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:08:56 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200901040854epoutp010859b92bb2c0c6e9c44f152a3abc5b77~wjWVgFB_J0623306233epoutp01c
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:08:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200901040854epoutp010859b92bb2c0c6e9c44f152a3abc5b77~wjWVgFB_J0623306233epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598933334;
 bh=WExuTwPYkapG2SXJhxW+OhQE+hDZ5ydXARug+Z0VSb4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Nv62K3KFqZoT3UUUCNmBREMOIbYF2171+m0NDwX+brxV7EC7aZQ60MlMNQFgwGLhk
 qLmHHTAiSRFQIwVeYkD5L4rkQRbSs/l/i04Dp3og233/x5H2cR3Ui/6kIQYivFOHKD
 IDVD1gTa3UJjAldZMkwxvtAlXa1yGeMhdgv1s5qY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200901040853epcas1p1b0dff5806037df1d0e429a7804bd3506~wjWU6gNSI1138411384epcas1p1N;
 Tue,  1 Sep 2020 04:08:53 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.153]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4BgYTv267QzMqYkk; Tue,  1 Sep
 2020 04:08:51 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 F1.75.18978.359CD4F5; Tue,  1 Sep 2020 13:08:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200901040850epcas1p2150ea195dfb20b46d6421af63b1f5129~wjWSPcyAU0064000640epcas1p2_;
 Tue,  1 Sep 2020 04:08:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901040850epsmtrp100d80fa9760de5402200175b55f8a5f7~wjWSOkwgt3200232002epsmtrp1-;
 Tue,  1 Sep 2020 04:08:50 +0000 (GMT)
X-AuditID: b6c32a35-5edff70000004a22-a6-5f4dc953b37a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 6C.9F.08303.259CD4F5; Tue,  1 Sep 2020 13:08:50 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200901040850epsmtip16e6b0306a7440b7e3e4209ce230f06ac~wjWRx5E280395603956epsmtip1z;
 Tue,  1 Sep 2020 04:08:50 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: nsaenzjulienne@suse.de, eric@anholt.net, maxime@cerno.tech,
 stefan.wahren@i2se.com, dave.stevenson@raspberrypi.com
Subject: [PATCH v2 0/4] drm/vc4: Support HDMI QHD or higher output
Date: Tue,  1 Sep 2020 13:07:55 +0900
Message-Id: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxjeaW9vC7PupoCekE3KDTBwAXotleMijkzGbua2sLH9wMR0N3BX
 CPSD3rKh+yFDcIgwREFZhbAJysfA8SXSxs4OhCoyl1lGsUOYWyaTr4JaJJrJWorb/j3v+zzP
 Oc97ziviSzrwYFGWxsDqNUwOiftjvQNRsujUa+8oZQ7XBtRePoih+boGDNVfuSFAo24Xjqyf
 2wFyNZXiyDTajqGuP8YEaKlsUoDs5locVf7aIUQ1K08B+nn4DdRrbMLReecsjootV4To6Vin
 x9A8jqPfq6dAYgBd6BrCadd4sZA2Tv2I0xM3fsJpk/G2kL7gVNBdrUdweuqojUd3Nx6kiwcf
 Y/SXPa2A7r7+Gf2ga0uKeG/2zkyWyWD1UlaTrs3I0qgSyD2pyt1KxXYZFU3tQPGkVMOo2QQy
 6e2U6OSsHM+YpPQTJifP00phOI6M3bVTr80zsNJMLWdIIFldRo5uhy6GY9RcnkYVk65Vv0rJ
 ZNsUHuFH2ZkNI0NC3TFRvt22ghUAI14K/ESQiIMrtxc82F8kIfoAfLxi4vuK+wCeuloh8BUP
 APxi9ZDwmcVy3IclhBnAwrYP/xXZnozxvQROREN3mYPnxYFEPvx+2gG8Ij5RzYd/1p5bIwKI
 12FT+RnMizEiHJrOT62FEhMJ8M6gc/22EPhth3UtEySsIrjQUMX3EUlwyV23PkUAnLH1rBuC
 4b2Kw+uYg6NfzWA+cwGAFZWn1wk5vHz2hCeFyBMpCn5njvW1Q6HpSR3wYj6xES64ywReCSTE
 sOSwxCeJgHcLrAIffhEOlzfxfJiGQ2dOY165hNgHj87GHwMvGf87/2sAWsEmVsepVSxH6aj/
 /1IXWFvdrYo+UDm/GNMPeCLQD6CITwaKreY9Sok4g9l/gNVrlfq8HJbrBwrPe1Xyg4PStZ7d
 1xiUlGKbXC5HcdR2BUWRm8V3nFKlhFAxBjabZXWs/pmPJ/ILLuAVHn/fTRrnrLR6d1xbWvuj
 hHi/mpTUzqgTuS9sFrb/fbbYMKIK7kmjsz5eUL9lHxirEquNxNx0+MwrdqqXKnwOU8qbz23Y
 d28+sT8kxBH4zcPcopZL9Rc3BcmT22y3Ikqnl+sGxJfnkk65QspK7BeXhiYmqn9YNrlGVmpl
 t06WxASFRI/XTdZfcx0pmv8tfFLeW7F/8eWoIuaSf+h71/Off3P2gsvpSLQMN2o/2Lv6aVzH
 /WRL2KhxBpn1yCJplNzEagfcW8ruNleFLS81VEon+vLePfRLx8GNseaayIjc0O7FuMiWjL/I
 lp5e6+QqHnYgMm3XzdHOR+EPXxurGEq6Wk1iXCZDbeXrOeYfx2yR5EMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWy7bCSnG7QSd94g/lv1C3W9h5lsXg7dzGL
 xfwj51gtrnx9z2ZxoPEyo8X75V1sFjuvrGWx2PT4GqvFx557rBaXd81hs5h4ewO7xYwf/xgt
 Lp5ytdg2azmbxbpbr9ksWvceYbf4d20jUMOKG2wWj6beZ3QQ9mh6f4zN4/2NVnaPWffPsnnc
 OXeezWPnrLvsHltvmXpsWtXJ5nG/+ziTx+Yl9R6tR3+xePRtWcXosfl0tcfnTXIBvFFcNimp
 OZllqUX6dglcGYvPHGMvmMBRcfn4D5YGxllsXYycHBICJhJ7JzWzdzFycQgJ7GCUeLPiCBNE
 QkZiVf8W1i5GDiBbWOLw4WKImo+MEh+uXWUFqWET0JX42nMdrF5EoE7iSUcjC4jNLLCUWaJl
 kgKILSzgJLG8dxFYnEVAVWLnuvtgi3kFbCUeHr3FDrFLXmL1hgPMExh5FjAyrGKUTC0ozk3P
 LTYsMMpLLdcrTswtLs1L10vOz93ECI4CLa0djHtWfdA7xMjEwXiIUYKDWUmE98Au73gh3pTE
 yqrUovz4otKc1OJDjNIcLErivF9nLYwTEkhPLEnNTk0tSC2CyTJxcEo1MC1atUUn6N3ROX/P
 cR9Mm7tnb9LPyLMum1oOTlryyZyN9WyP5fxldnXXH+cX7s9cPv+niG9UkGLy7OgC93tr73dL
 2P3ucQxUWMsU3FKuMX3q58k1E3l5J70XnujcJGnM5v42YX96af/uf3Ntdgi9bvGYsKyM1+XK
 /x6hZe+Pb72w53OE0+/DN03dp4iyB6koca19tDwxb+WNay86NPeuvm6kOzPVP3pnKtepYoWV
 j7X+5E9nz7P/+zUvcPvr0mUR8vY7wp7tNJWsMY9aJlw4x+bo69P1PL7t6omlH3KPi+5+lJr5
 h637TYf2q/2dxoGMZ2fOUfi3O+j20UMvZxq8mifE9MWRMbPHcZ4N16JYcQclluKMREMt5qLi
 RADgZUCF8QIAAA==
X-CMS-MailID: 20200901040850epcas1p2150ea195dfb20b46d6421af63b1f5129
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200901040850epcas1p2150ea195dfb20b46d6421af63b1f5129
References: <CGME20200901040850epcas1p2150ea195dfb20b46d6421af63b1f5129@epcas1p2.samsung.com>
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com, kdasu.kdev@gmail.com,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 hoegeun.kwon@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

There is a problem that the output does not work at a resolution
exceeding FHD. To solve this, we need to adjust the bvb clock at a
resolution exceeding FHD.

Rebased on top of next-20200708 and [1].

[1] : [PATCH v4 00/78] drm/vc4: Support BCM2711 Display Pipeline (Maxime's patchset)

Changes from v1:
  - Added dt-bindings documents
  - Change patch order, first fix driver and then device tree

Hoegeun Kwon (4):
  clk: bcm: rpi: Add register to control pixel bvb clk
  drm/vc4: hdmi: Add pixel bvb clock control
  dt-bindings: display: vc4: hdmi: Add bvb clock-names property
  ARM: dts: bcm2711: Add bvb clock for hdmi-pixel

 .../bindings/display/brcm,bcm2711-hdmi.yaml   | 12 ++++++---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts         |  6 +++--
 drivers/clk/bcm/clk-raspberrypi.c             |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 25 +++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h                |  1 +
 5 files changed, 39 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
