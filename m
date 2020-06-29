Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEC20CE29
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 13:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1F56E14F;
	Mon, 29 Jun 2020 11:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD016E140
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:22:49 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200629112248euoutp0208ff83aad350b488d15b6207df6c3b53~c-_6SKZYq1862518625euoutp02b
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:22:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200629112248euoutp0208ff83aad350b488d15b6207df6c3b53~c-_6SKZYq1862518625euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593429768;
 bh=egNq6XIWhS8LBJ6syi2DRN8QJ6iMhA7JYnFew+U+M1Q=;
 h=From:To:Cc:Subject:Date:References:From;
 b=V+43EhJcTlf2n+B7+0Zjr+VtkDIECKWi1wOeO4Od8RwrlJNl0wO0BzTnFMHnxfsiD
 LRskZOAC3aFVmQ7HZTGJGAZI0l5UwOpsjwSOz/kfjKDGTZiy3HxgVHELgu43eFZjVi
 YfrzlSo5Qp3V/HOKOwcALK0lMZgIWdI7a75W4FCs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200629112247eucas1p25116a18f7ec152d9e0f408477cb90094~c-_59B8Sf2255522555eucas1p2Q;
 Mon, 29 Jun 2020 11:22:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 6B.A7.06456.70FC9FE5; Mon, 29
 Jun 2020 12:22:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200629112247eucas1p2f5a1c0a4ffe3a2571658646a7b369cfd~c-_5iquFu2471224712eucas1p2S;
 Mon, 29 Jun 2020 11:22:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200629112247eusmtrp20c0757f41e1b475d92adc62eb3a5679e~c-_5h01f01939019390eusmtrp2Z;
 Mon, 29 Jun 2020 11:22:47 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-be-5ef9cf075662
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.EC.06017.70FC9FE5; Mon, 29
 Jun 2020 12:22:47 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200629112246eusmtip187e11c51d342934a9ff5e5ffedcd484f~c-_4w3dQM2169621696eusmtip1D;
 Mon, 29 Jun 2020 11:22:46 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 0/4] driver core: add probe error check helper
Date: Mon, 29 Jun 2020 13:22:38 +0200
Message-Id: <20200629112242.18380-1-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0gUYRSG+XZmZ2bNlWlV9sPCcLEfRmlq4AdFpRRMEOiPoCg1txwvpKvt
 6nqh0krNC66XsNRaM9O8bpo3UrJkLM3EdfOeKF5KYSOVvKJR5u5Y/XvOe8573vPjUJiEE9pR
 oYooVqmQh8kIC7y5c0N/iOzb8D88l+aBxl7ohciY3QHQy/xaIcqb/kqgreYcDA2uLhLo7rNa
 Ag2tGzHU/X0IR2k5pSSq/zIsRAOtjwnE5bUBpHs3QSJOcwlpV/KwkzQzMPwJYxZHk0mmba0Y
 Z1oKJ0jmUWqBkKmvSiOYD9n9AuattoZkJjO6BExDaQKjaawCTHvmfZxZrrf3EV+0OBbIhoWq
 WaXL8QCLEH3+azyyxipWY1Qkgue70oGIgvQRmKx5SqQDC0pCVwCYOW4Q8MUKgCX9WpIvlgFs
 z6jF/1p0U8sY3ygHsHitFfyz3OZShaYpgnaCvxo+Eya2od1hVm+heRVGb+Jw6F6Kecia9oRa
 XaeZcXo/NJjDRZSYRnBqYVDIx+2D1XXt5jhI60k427+F8Y1TMLdyZucma/itq5HkeS/canki
 4DkBTlYk7ZhTAWyqa9kxH4Xj+s3t86jtk5xgbasLL3vC8REOmGRIW8HR+d0mGdvG3OaHGC+L
 YWqKhJ92gJO9TTsLpbDMsErwzMDs+Y/AxBLaD05Xt5HZwL7wf1YxAFVAykarwoNZlauCjXFW
 ycNV0Ypg56sR4fVg+7N6fnctvQKr/Vc4QFNAZikO0G/4S4RytSounAOQwmQ2Yq/eHn+JOFAe
 F88qIy4ro8NYFQf2ULhMKnYvMfpJ6GB5FHuNZSNZ5d+ugBLZJYKCByOlcp9l1ke0FAMGHdcN
 Y1mdnvFvMi+wOsvg87Co1cFQKu1YmbrxfmhB1KdX95zzkHZ3bnGzat8Rt/Ict8jrp/3V83dm
 Oce88h+6uAqvQIOxyNu2cuCnb9+Z6LKzM96MrfZmLDFQ4zaiCQ0avVWpDnKem/R2nK7RLh5M
 OiHDVSFy1wOYUiX/A7Dx0xRVAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xu7rs53/GGbx7LGlxa905VouXEw4z
 WmycsZ7VYurDJ2wW/7dNZLa48vU9m0Xz4vVsFle/v2S2OPnmKotF58Ql7BabHl9jtbi8aw6b
 xaGpexkt1h65y25xqC/aYu6XqcwOAh6Xr11k9nh/o5XdY++3BSweO2fdZfeY3TGT1WPTqk42
 jxMTLjF57J+7ht3jfvdxJo/NS+o9+rasYvQ40DuZxePzJrkA3ig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jHMz9rAUrOGr6HuZ18C4jLuLkZND
 QsBEYu2Dz8wgtpDAUkaJF78zIeLiErvnv2WGsIUl/lzrYoOo+cQocaFZDcRmE9CU+Lv5Jlhc
 RMBYov/sLPYuRi4OZoE2Vom555+wgySEBRwl5q49xgpiswioSly4c4EJxOYVsJB48O4KK8QC
 eYnVGw4wT2DkWcDIsIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwTrYd+7llB2PXu+BDjAIc
 jEo8vAnnfsYJsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdDyicxSosn5
 wBjOK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAGHHLrXhKwY2U
 ki1+9w4XKGquCts5j21GaMU+w8sys6IamCRtKzJ+LnnBI3tKTfD1/TnBmwJvT+q2CPucHnJg
 RbRvv03OwqeGbaoOHHsZJWOWPl37/NSfJLsl8To1HhLzrQ6bH5nK47U94Nu7j0nrmkJesk5e
 lpZ9Icpw57pXK/VX7hNfcvTYdCWW4oxEQy3mouJEADzs2u+pAgAA
X-CMS-MailID: 20200629112247eucas1p2f5a1c0a4ffe3a2571658646a7b369cfd
X-Msg-Generator: CA
X-RootMTR: 20200629112247eucas1p2f5a1c0a4ffe3a2571658646a7b369cfd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200629112247eucas1p2f5a1c0a4ffe3a2571658646a7b369cfd
References: <CGME20200629112247eucas1p2f5a1c0a4ffe3a2571658646a7b369cfd@eucas1p2.samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Thanks for comments.

Changes since v6:
- removed leftovers from old naming scheme in commit descritions,
- added R-Bs.

Changes since v5:
- removed patch adding macro, dev_err_probe(dev, PTR_ERR(ptr), ...) should be used instead,
- added dev_dbg logging in case of -EPROBE_DEFER,
- renamed functions and vars according to comments,
- extended docs,
- cosmetics.

Original message (with small adjustments):

Recently I took some time to re-check error handling in drivers probe code,
and I have noticed that number of incorrect resource acquisition error handling
increased and there are no other propositions which can cure the situation.

So I have decided to resend my old proposition of probe_err helper which should
simplify resource acquisition error handling, it also extend it with adding defer
probe reason to devices_deferred debugfs property, which should improve debugging
experience for developers/testers.

I have also added two patches showing usage and benefits of the helper.

My dirty/ad-hoc cocci scripts shows that this helper can be used in at least 2700 places
saving about 3500 lines of code.

Regards
Andrzej


Andrzej Hajda (4):
  driver core: add device probe log helper
  driver core: add deferring probe reason to devices_deferred property
  drm/bridge/sii8620: fix resource acquisition error handling
  drm/bridge: lvds-codec: simplify error handling

 drivers/base/base.h                  |  3 ++
 drivers/base/core.c                  | 46 ++++++++++++++++++++++++++++
 drivers/base/dd.c                    | 23 +++++++++++++-
 drivers/gpu/drm/bridge/lvds-codec.c  | 10 ++----
 drivers/gpu/drm/bridge/sil-sii8620.c | 21 ++++++-------
 include/linux/device.h               |  3 ++
 6 files changed, 86 insertions(+), 20 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
