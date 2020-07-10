Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BF21B988
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 17:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13656EC77;
	Fri, 10 Jul 2020 15:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FAE6EC7B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710153024euoutp01de1e5b38a5a6c436c58783ffce60468e~gbdPVPYVO2103421034euoutp01B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710153024euoutp01de1e5b38a5a6c436c58783ffce60468e~gbdPVPYVO2103421034euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594395024;
 bh=4k3syR3vVZUEDSCgdG8MlR8MpmUYKiOLq+S8hhYPLsQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=pizfweZq4SbiYLbHdwk7ceS71PN/olD1ordUbzFegpKyAz/uyV6IiJUD4Pk8+S5Tw
 ErY16mzxjvd8fXfxHvg3tqVFwTjUU+5pMd+sZIwmpuPVZFOgL+5CIp86IOQR11rSDc
 ct4166zB0NUUPGW9145fYxJ33h1W4qSATARd58XE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710153023eucas1p2352d04245efcdc922c73d37040f1656f~gbdOdgOJB1492614926eucas1p2w;
 Fri, 10 Jul 2020 15:30:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A5.0E.05997.F89880F5; Fri, 10
 Jul 2020 16:30:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153023eucas1p152c48e4208bff8c0ae9b8c734be45db2~gbdN6knUC2638126381eucas1p1B;
 Fri, 10 Jul 2020 15:30:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710153023eusmtrp182e34e950478e27221e42c2cbb11ba6d~gbdN5zoCh2243522435eusmtrp1p;
 Fri, 10 Jul 2020 15:30:23 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-82-5f08898f7118
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FF.C8.06314.E89880F5; Fri, 10
 Jul 2020 16:30:23 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153022eusmtip1206bd9fbb58e9db7894aa47da1c41f7c~gbdNGSqF70656006560eusmtip1n;
 Fri, 10 Jul 2020 15:30:22 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 0/5] driver core: add probe error check helper
Date: Fri, 10 Jul 2020 17:30:13 +0200
Message-Id: <20200710153018.12226-1-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeUhUURTGub437z0nx16j4EVDcSJIIzUNupFtKvQgo/6KqFye+VzIjRk1
 DVLbdLTcsslcEzUVc1zGpZSmZJK0xHFrREWTSAPFtBwXFMtmfGP99zv3+875zoFLYWKNwJYK
 j4rlpFFshIQQ4m0f1rWHstOpALfi6gNovF4rQLM57wFqetYgQIqv0wTaasvF0OeVRQLdq2gg
 kG5tFkMf53U4Ss+tJJHq24gADXcUE0ijUAOk7JokkSbrKipZVmCnaWZ4ZBBjFkcfkIx6tQxn
 2gsnSaZIXiBgVLXpBNOTM2TGvCupI5mph91mTHNlMpPVUguYzsw8nNGr7C+Krgg9g7mI8HhO
 6noyUBhWol8gY1Z3J6hWlYIUUGeRAcwpSB+BX0bm8QwgpMR0DYBrReMYXywDWKlYIPhCD+Dd
 NLXZTsugfsDkqgawc32J/NeS0dWKG10E7QR/N48RRramPWB2X+G2CaM3cKhLSxUYBSv6DGye
 kwMj4/R+WNlXThpZRCM4WJVuinOALxs7t+MgPUTC0swsnBd8YFH+E5PJCs51t5A874W9eY9M
 nmQ4VXPf1CwHsLWxHeOF43BCu2FYjzKs5AQbOlyNCA0L6ZviebSEoz/2GM2YAR+35WP8swjK
 U8X8DEc41ddqmmcDXwysEDwzsOXt1vZVYtoProwt4TnAvvB/VBkAtcCGi5NFhnIy9yjupouM
 jZTFRYW6XI+OVAHDz+r90738GnRsBmkATQGJhaiMpQLEAjZelhipAZDCJNYir75ef7EomE28
 xUmjA6RxEZxMA+woXGIj8iif9RPToWwsd4PjYjjpjmpGmdumAG8vZ51vUVLQpaP1ZxN2lxyE
 2qWWn4zj9HdLhwvNw0kh3svy2x6lM1pQIGaVSt+yGUVCgdpj34h0GM1MnSvvOdGvtnkqSs51
 TPGX5FHJwsvZn/SdPrbHuq/FO/dXhbzRpU48V7nPU75KufyXpx3nljgWeL4pdtcpmFCx+eoO
 LcFlYexhZ0wqY/8ChgwDdVUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7r9nRzxBivPMlrcWneO1eLlhMOM
 FhtnrGe1mPrwCZvF/20TmS2ufH3PZtG8eD2bxdXvL5ktTr65ymLROXEJu8Wmx9dYLS7vmsNm
 cWjqXkaLtUfuslsc6ou2mPtlKrODgMflaxeZPd7faGX32PttAYvHzll32T1md8xk9di0qpPN
 48SES0we++euYfe4332cyWPzknqPvi2rGD0O9E5m8fi8SS6AN0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY+7nd+wF3/grNn1by9rAuIani5GT
 Q0LAROLi5wvMXYxcHEICSxklLq6bxQqREJfYPf8tM4QtLPHnWhcbRNEnRok1q56AFbEJaEr8
 3XyTDcQWETCW6D87ix2kiFmgjVVi7vkn7CAJYQFHic2vOhhBbBYBVYklZxeBxXkFLCQuLutk
 gtggL7F6wwHmCYw8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRGy7ZjPzfvYLy0MfgQ
 owAHoxIP74JEjngh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BVo+kVlK
 NDkfGMl5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYFfdpV0/I
 EDm1YZ/IfO/4rH0frY6mznCO79mUf8ZacXqZg1h06cX5uWveh2d8eXbgSHV64Ou6y+EdN211
 UjqMbfW2/bfcmz99abr2Lwu7D06/mK5Z7cxZ0/Gt+MTiwtn/JvzUL/btW6eil9a2d62thZDU
 +7S37y/MUVsQvXZF0fzd84z/KDa2KLEUZyQaajEXFScCAEGA8nCsAgAA
X-CMS-MailID: 20200710153023eucas1p152c48e4208bff8c0ae9b8c734be45db2
X-Msg-Generator: CA
X-RootMTR: 20200710153023eucas1p152c48e4208bff8c0ae9b8c734be45db2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710153023eucas1p152c48e4208bff8c0ae9b8c734be45db2
References: <CGME20200710153023eucas1p152c48e4208bff8c0ae9b8c734be45db2@eucas1p1.samsung.com>
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

Changes since v7:
- improved commit message
- added R-Bs

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


Andrzej Hajda (5):
  driver core: add device probe log helper
  driver core: add deferring probe reason to devices_deferred property
  drm/bridge/sii8620: fix resource acquisition error handling
  drm/bridge: lvds-codec: simplify error handling
  coccinelle: add script looking for cases where probe__err can be used

 drivers/base/base.h                  |   3 +
 drivers/base/core.c                  |  46 +++++
 drivers/base/dd.c                    |  23 ++-
 drivers/gpu/drm/bridge/lvds-codec.c  |  10 +-
 drivers/gpu/drm/bridge/sil-sii8620.c |  21 +--
 include/linux/device.h               |   3 +
 probe_err.cocci                      | 247 +++++++++++++++++++++++++++
 7 files changed, 333 insertions(+), 20 deletions(-)
 create mode 100644 probe_err.cocci

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
