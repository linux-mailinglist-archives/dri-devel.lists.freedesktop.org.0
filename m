Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB124CEC2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058CB6EAB1;
	Fri, 21 Aug 2020 07:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BB96EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:17:10 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200821071125epoutp04d59193131850d44d735acfeab49a74b1~tNvjfFKn42178821788epoutp048
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:11:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200821071125epoutp04d59193131850d44d735acfeab49a74b1~tNvjfFKn42178821788epoutp048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597993885;
 bh=pWhxRBBhpPL/FNckZSjtofTkWnWYHR8ValDZxMZ2xws=;
 h=From:To:Cc:Subject:Date:References:From;
 b=T+HNDBE9prfmOQSbCSY7oyTj/GB/L2AG4xQPCHRMFWMXClkvggw4HfsgMdhNZmzf8
 T5gJrGH2e8gSDYq6Brl3lBeOm8D/fFepE5gaKwYpoEcRryp16FmSStRdH/ZFNInky4
 gvP791B8BgO3frWj5MXAP8q8Pyt2MpwtwcMTRJdo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200821071124epcas1p2cb22caadc80637b59cddfbc4bf0c31c1~tNvjBv6L63015030150epcas1p2D;
 Fri, 21 Aug 2020 07:11:24 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4BXt3Z1Nn6zMqYkg; Fri, 21 Aug
 2020 07:11:22 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A4.8D.18978.A937F3F5; Fri, 21 Aug 2020 16:11:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200821071121epcas1p12225cf2891c2bbe22b90ac65e826dcaa~tNvgI2I6P1342713427epcas1p1R;
 Fri, 21 Aug 2020 07:11:21 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200821071121epsmtrp27ec11fa305d199e8343a20e4abe67d12~tNvgHZR4u2513725137epsmtrp2N;
 Fri, 21 Aug 2020 07:11:21 +0000 (GMT)
X-AuditID: b6c32a35-603ff70000004a22-5b-5f3f739a9010
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.20.08303.9937F3F5; Fri, 21 Aug 2020 16:11:21 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200821071121epsmtip2cc62b0a65d5e107ca3d3e67eeee637b5~tNvf0yzxj2425024250epsmtip2f;
 Fri, 21 Aug 2020 07:11:21 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: nsaenzjulienne@suse.de, eric@anholt.net, maxime@cerno.tech
Subject: [PATCH 0/3] drm/vc4: Support HDMI QHD or higher output
Date: Fri, 21 Aug 2020 16:10:42 +0900
Message-Id: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxTAvX2vr5Ws5KWycgMM8JFtouGjlNon4yvOsZfgB4mJf7DM+qAv
 LVLapg8WN1DBCVOgQjeWjSq6TUwXFhxfqZSkoaOwKoqNApWBQCYZW1As0CCImVs/WNh/v3Pu
 7+Tcc+/hI0IzFsEv0pQyeg2tJrAQ1OKIT0gwsVny5JUXPLLdMISSiy3XUfLa4H0uObbqwUh7
 1SggPeZajLSOtaNk15ybSy7Xz3DJ0b4rGGmc6uCR366/BuSD4Q9Ii8mMkTcnn2JktW2QR752
 d6Lkk69nQbaQOuf5FaM8E9U8yjQ7glGP77swymqa5lFdbRcxarbOyaG6W89S1UMbKHWppw1Q
 3XfLKW9XdN4b+cXpKoZWMPpYRlOoVRRplBlE7lH5+3Lp3mRxgngfKSNiNXQJk0EcOJiXkFOk
 9k1HxH5Cq8t8qTyaZYmkzHS9tqyUiVVp2dIMgtEp1Lp9ukSWLmHLNMrEQm1Jmjg5OUXqE08U
 qxx3bajuc+yUpTGyEkyhtWA7H+KpcKPfhdSCEL4Q7wXw5sj3aDBYAdA13sALBl4AGxxbJaah
 x5slfQCOWy1blmmmk+O3MDwBrtY/CnAYnglr6n8BfgnBbyHw0Rd1PP/BDjwLPp0eCkgo/jas
 WnNhfhbgGfBe1Teb7WLgTx12JMjtfDhVlxnkA/Dag2ZekHfABWfPJkdA73MbFmQWjjUvBAaC
 eKVvBuPlTUkC+2985WvM990oHv7clxRM74TWVy3AzwgeCp+v1nP9CsQF8EKNMKi8A+cr7dwg
 R8Fhg5kTZApOev8OtBXiH8NG+zyvEbxl2mrwHQBtQMTo2BIlw4p14v//UhcIbOxuaS8wLi4l
 DgAOHwwAyEeIMIHB9p5cKFDQn37G6LVyfZmaYQeA1PdeRiTizUKtb+U1pXKxNEUikZCp4r1S
 sZgIF/w+GSsX4kq6lClmGB2j/6+Ow98eUckp2JPSULFo0WdY8B+MNVXbJlbylfCY40vqfM8/
 h8/OrUrWOyKyRX9yc8ult7Y5x6SnNUve1NDa8D8+ar36bNEuOnr4hWzdcKjbLXo4JzmTHaXK
 q8k/XnDkykzFjRNh8679ztDpnJAi4mL/uSfcrJGoZVd4xSGnMfFDJyPb34RUPHzV+EztFnha
 046479Ry4ueHTwm6w/mnFWvLO086Wi7odpWPnkd3RecMVjtp5R3CeDmmw+BM+62yKWYjTi3J
 H2lq2RPtEtyOycppdi79GFl/+6+C3HFR5PHed6fp3DOynkveOLBQbgYTtrmk2TjqevpJKs4j
 m3jZFLlm7bx37CWBsipavBvRs/S/1GhtTDoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSvO7MYvt4g4crVC3W9h5lsXg7dzGL
 xfwj51gtrnx9z2ZxoPEyo8X75V1sFjuvrGWx2PT4GqvFx557rBaXd81hs5h4ewO7xYwf/xgt
 Lp5ytdg2azmbxbpbr9ksWvceYbf4d20ji8WjqfcZHYQ8mt4fY/N4f6OV3WPW/bNsHnfOnWfz
 2DnrLrvHplWdbB73u48zeWxeUu/RevQXi0ffllWMHptPV3t83iQXwBPFZZOSmpNZllqkb5fA
 lXH49F6Wgma2im0TpBsYb7N0MXJySAiYSMw6eoe5i5GLQ0hgB6PEhv55zBAJGYlV/VtYuxg5
 gGxhicOHiyFqPjJK/GtpZwKpYRPQlfjacx3MFhFwknjwdx/YIGaB48wS0/sPsIIkhAXsJV7f
 PQpWxCKgKtH4/TwbiM0rYCtxpnE61BXyEqs3HGCewMizgJFhFaNkakFxbnpusWGBUV5quV5x
 Ym5xaV66XnJ+7iZGcMhrae1g3LPqg94hRiYOxkOMEhzMSiK8vXut44V4UxIrq1KL8uOLSnNS
 iw8xSnOwKInzfp21ME5IID2xJDU7NbUgtQgmy8TBKdXAdOTg17vvGL6nKoXdYdx8sD7EzfnU
 RPGfF672r3OTSxXkzzrUsGxDi+A+t6p8n3Pt4nv+Rp56Mu34dz2hbM/TyR87WdXl9j2TdNom
 Fdf47dVjkZudoQ9Ujn/aeTo5gTuf+6fpLdnAg73e59WNg3l3VrM0bRe94dSyRpt5XeEyfccu
 yRCn4FBXv0iBlp0K6w8qmn428eU4Kt4dtvTy6lPbRNYe8px2pc+3MKA+MJ4n6t7N5weyE15f
 /i6/nXMvm/HcR39mZi+o0IyeVjBre17tUWl9o27TT7YlF+RuqLm4rmmx/X2zYsX5WtavjXM2
 Kpv0JAvOsvi8f9uSN1GvX/Hum/55DfulrPLSz37ctdXxSizFGYmGWsxFxYkAvX5QCOgCAAA=
X-CMS-MailID: 20200821071121epcas1p12225cf2891c2bbe22b90ac65e826dcaa
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200821071121epcas1p12225cf2891c2bbe22b90ac65e826dcaa
References: <CGME20200821071121epcas1p12225cf2891c2bbe22b90ac65e826dcaa@epcas1p1.samsung.com>
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
 sboyd@kernel.org, mturquette@baylibre.com, dave.stevenson@raspberrypi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phil@raspberrypi.com, robh+dt@kernel.org,
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

Hoegeun Kwon (3):
  clk: bcm: rpi: Add register to control pixel bvb clk
  ARM: dts: bcm2711: Add bvb clock for hdmi-pixel
  drm/vc4: hdmi: Add pixel bvb clock control

 arch/arm/boot/dts/bcm2711-rpi-4-b.dts |  6 ++++--
 drivers/clk/bcm/clk-raspberrypi.c     |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c        | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h        |  1 +
 4 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
