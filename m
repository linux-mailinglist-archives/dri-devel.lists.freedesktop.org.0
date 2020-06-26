Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C717820AF52
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 12:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6293A6EC54;
	Fri, 26 Jun 2020 10:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF4C6EC54
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 10:01:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200626100109euoutp016f54681050190d50e5f4c5fa371780d6~cD7xEFrTe0663006630euoutp014
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 10:01:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200626100109euoutp016f54681050190d50e5f4c5fa371780d6~cD7xEFrTe0663006630euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593165669;
 bh=SO77Bw5gQrFl8Eds3Cwku8UwfysQkGoodk10PGmyeSA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=eI6Sw+09CqvyL3pbqIRbrKyxO0/Ewh8OyfGztNsXNvLcbfL3kQ+eBTncmbul0SFuF
 XKo0ye+HMQXRMi+TXFEpp5ukhay7RoDFoBgk4l1UyLZ4CkxBLwbyRXzFmo7sQRFcBl
 zit3RbQMksLa4HDbw5XFkBpYPtYA2ENMFj/pXJow=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200626100109eucas1p22b7e037fceafce87d59d5ffc646840f8~cD7wunfv41855318553eucas1p2C;
 Fri, 26 Jun 2020 10:01:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 6B.EC.06318.467C5FE5; Fri, 26
 Jun 2020 11:01:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200626100108eucas1p2c6d68625f3755a467d7316dd27704f7c~cD7wKTlte1860318603eucas1p21;
 Fri, 26 Jun 2020 10:01:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200626100108eusmtrp2cdb3d4cda515199cc5f31c600b03056a~cD7wJhzv61306813068eusmtrp28;
 Fri, 26 Jun 2020 10:01:08 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-5c-5ef5c7644b38
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E0.86.06017.467C5FE5; Fri, 26
 Jun 2020 11:01:08 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200626100107eusmtip1f190a300a9e6c6eb437b040ab6d0d09b~cD7vXc_jP1665516655eusmtip1O;
 Fri, 26 Jun 2020 10:01:07 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 0/4] driver core: add probe error check helper
Date: Fri, 26 Jun 2020 12:00:59 +0200
Message-Id: <20200626100103.18879-1-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeUhUURTGufPmLU6+eI2SNw2jAZGEXFLoQiUpBg8kkSCoTGvK51JuzEvT
 QHJ3VNIZU1JT3NPUcl/DpdEcTcfK0lQ0ieqPkcJwaTHLfL2p/vud79zvO+deLoXJ+3BrKjTi
 GqeKUIYpCJm0Y/j7xEFOvx7g/MgTzT2cwJFRMwhQc0EjjvLfvifQVocWQ6/WlwmUXNlIoKmv
 RgyNfpySogxtFYla3k3j6GVPMYF0+b0APRhaIJEu2w+VrOVjxxn25fQLjF2eSSXZ3i9lUra7
 aIFk76oLcbalLoNgRzSTEra/pIFkF7P0Era16iab3VYH2IFbt6XsaoutL31OdjSQCwuN4VRO
 7hdlIT/ypsmoCTo2Nb0LTwDzskxgRkHGDSYO5kkygYySM7UAdgy3EmKxBuDIUgEpFqsAVrYa
 QCag/liatLzgljM1AHYnO/wzrC6oJUKDYA7An62zhMCWjCvMMRT9CcKYDSmcSk/DhSALxgPm
 Vh0WUMrYwc5BF+E4zSD4uLwUE7fbB+ubBjDBCplJEhrSV3Cx4QWX9PUSkS22uY0UeS/c6i41
 6TfhYm2KyawGsL2p25R6BM5PbBDCYGx70cYeJ1H2gGXlFaY77oQzn3YJMraNuR13MFGmoTpN
 Lp7eDxcN7aZAK1j9fJ0QmYX1SVm4+Dz+sGFUTWqAbdH/WWUA1AErLpoPD+Z41wjuuiOvDOej
 I4IdL0eGt4DtXzX2S7/eBfo2L+kAQwGFOT2gXQuQ48oYPi5cByCFKSxpT8NYgJwOVMbd4FSR
 F1TRYRyvAzaUVGFFu1YY/eVMsPIad5XjojjV366EMrNOAFfskz6ElJ+a250R73tiNCou8JtT
 f/le5uwzVdKxIH2XtrnwKapx7kz+rHmy+9D4ZmLx+MkNjV/8itF75PSHnB5Y6H0/KN6QoplZ
 9ALRfvd83V2afWIbr7rtqHytHzYWJA6ZNyztsbKZXQ07Y0+XZPuY2+Czy45vzk/O2FUPxp2T
 KKR8iNLFAVPxyt8OmsjvUQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xu7opx7/GGfQel7C4te4cq8XLCYcZ
 LTbOWM9qMfXhEzaL/9smMltc+fqezaJ58Xo2i6vfXzJbnHxzlcWic+ISdotNj6+xWlzeNYfN
 4tDUvYwWa4/cZbc41BdtMffLVGYHAY/L1y4ye7y/0crusffbAhaPnbPusnvM7pjJ6rFpVSeb
 x4kJl5g89s9dw+5xv/s4k8fmJfUefVtWMXoc6J3M4vF5k1wAb5SeTVF+aUmqQkZ+cYmtUrSh
 hZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexu8p19gLzvFWtLbvYG1gvMPVxcjB
 ISFgIrFhYnEXIxeHkMBSRomH058wdjFyAsXFJXbPf8sMYQtL/LnWxQZR9IlR4veEHWBFbAKa
 En8332QDsUUEjCX6z85iByliFmhjlZh7/gk7yAZhAUeJSUvMQUwWAVWJ7YcNQcp5BSwkDi6c
 DzVfXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMk23Hfm4BWv0u+BCj
 AAejEg/vgYlf4oRYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEUaPdEZinR
 5HxgDOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamBcNadt4vzm
 CLcXjybaOF7687Zu0yez7VV/df2PJt9YpDq7R98mboq/is/Xfycl7+/nMv3sY3losulssV03
 Jxxf3CqwIHSt+RqlTQIWj9UYDx/8sujhLtOOOzXuXA9f7XpS628W7hx0fHtjyVvF+7XvDjZp
 GTCcKlgz/eHFw3dZXj54M9mz0Ce7XImlOCPRUIu5qDgRAEwdlFepAgAA
X-CMS-MailID: 20200626100108eucas1p2c6d68625f3755a467d7316dd27704f7c
X-Msg-Generator: CA
X-RootMTR: 20200626100108eucas1p2c6d68625f3755a467d7316dd27704f7c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200626100108eucas1p2c6d68625f3755a467d7316dd27704f7c
References: <CGME20200626100108eucas1p2c6d68625f3755a467d7316dd27704f7c@eucas1p2.samsung.com>
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

Thanks for multiple comments.

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
