Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A29221D8CF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5512E89FDB;
	Mon, 13 Jul 2020 14:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C45289F6F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200713144332euoutp015bf0b26e9ec27266e61b5970151b867f~hVwK9gasD3242832428euoutp01e
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200713144332euoutp015bf0b26e9ec27266e61b5970151b867f~hVwK9gasD3242832428euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594651412;
 bh=pGtxLhf3D/I7exmkosULiTrSasKk7Et803J5a7lKHWQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=dRFHLhlWd8x7rNCzp22pRQ66M7CvO7xyJxKoI35zAzcNhccsoKf6dP5245U5NpeZE
 I0gIdT9digqFGrIgMqcREOgUmLrXYLtav26YBenMRBtp9/YrifRhSKI4MIZjGL0+HX
 bmglo1fcBx5uGZNFYtcXJcEx9NvElJtuCCw5fMwc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200713144331eucas1p2eab7cb0246c95111fdc37b9a8fcc8c5f~hVwKXfhQY0713507135eucas1p2l;
 Mon, 13 Jul 2020 14:43:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 90.69.06318.3137C0F5; Mon, 13
 Jul 2020 15:43:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981~hVwJuU8YP0294302943eucas1p2N;
 Mon, 13 Jul 2020 14:43:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200713144331eusmtrp1e152860e9a3934e08996b37ca9052f6c~hVwJtg29y0993509935eusmtrp1X;
 Mon, 13 Jul 2020 14:43:31 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-f3-5f0c7313e449
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 62.5A.06017.2137C0F5; Mon, 13
 Jul 2020 15:43:30 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200713144330eusmtip1330a0b9f23242ed312f9f7a2f63ed02b~hVwI-MLT71900919009eusmtip1t;
 Mon, 13 Jul 2020 14:43:30 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v9 0/4] driver core: add probe error check helper
Date: Mon, 13 Jul 2020 16:43:20 +0200
Message-Id: <20200713144324.23654-1-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSfUyMcRzf757Xbnc8XdFvsUs3Ni95W/74zdscyjP/MGM2LTl6VNNduadS
 NqutJFFKEiWSzIlTXdel29LtSLg6KeWUdrNYMgrXi/J65zn89/l9Xn6fzx9fGpNZiUA6TpPE
 aTWqeAUpxk0Pp+xL/XhJ1Ipzd+ajvjt2Ag0X3Aeo7kINgYpfvyHRL1Mhhp6Pj5Io81oNiXom
 hzH0+EMPjk4WVlHIMNhLoG7zJRJZi5sB0j8YoJA1PwKVjxVjGxi2u/cZxo46jlNs80QFzjaV
 DlBsWc5FgjVUnyTZRwVdIral/DbFOk+1idj6qnQ231gNWEteEc66DPLt0j3itdFcfFwKp12+
 fp841jx6hUp8MjP1U2sfyAAVklzgQ0NmFfzQ9RXPBWJaxugA/P7lMyE8xgBsbZ/2Ki4AXSNv
 qL+R99Ysr3ADQLtzSPQvohuaID0uklkEf9S//IP9mVB4pqOU8pgwZhqHPSey3SU07ccood4k
 93hwZgHUdxZjHixlEGw3OAmhLQjeqrVgnixk7BQsc2WQgrAZtpjHgYD94Ps2o3feXGgrOo0L
 OB06dVnecA6ADbVNmCCsga/s06RnBOZeWmNeLtBKOHF5CPPQkJkBHR99PTTmhmdNJV5aCnOy
 ZYI7GDo7GrwfBsDrnePeZSysq5z+g2VMJDw7cgkrAPLS/10VAFSDAC6ZV8dwfKiGO7KMV6n5
 ZE3MsgMJagNwX5btZ9v4XXDv+34rYGigkEjhNkmUjFCl8GlqK4A0pvCXbuyw7ZVJo1VpRzlt
 QpQ2OZ7jrWAOjSsCpKGVw5EyJkaVxB3iuERO+1cV0T6BGWDLLNdUY/oYlpG3xxIWFLgktuHo
 25LzNyaJFTqp7eY7/7XyhHnKiFR9+GGZr/EtmPkxc9fW4G+52VO7JSd+LXxaqXP0G1dvDwnR
 dzXv3LRjpDqs3EzeHPwZ3h/ckR+z8Bh99et9eSNd8DlsUYM8XIErZzheXFtXZMmbnXWw3sZ1
 ShQ4H6tauRjT8qrf3EBpP1UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xu7pCxTzxBie+mVncWneO1eLlhMOM
 FhtnrGe1mPrwCZvF/20TmS2ufH3PZtG8eD2bxdXvL5ktTr65ymLROXEJu8Wmx9dYLS7vmsNm
 cWjqXkaLtUfuslsc6ou2mPtlKrODgMflaxeZPd7faGX32PttAYvHzll32T1md8xk9di0qpPN
 48SES0we++euYfe4332cyWPzknqPvi2rGD0O9E5m8fi8SS6AN0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY9f7+ewFp/grPhy9xdjAuICni5GT
 Q0LAROLVoRaWLkYuDiGBpYwSJ2ccY4VIiEvsnv+WGcIWlvhzrYsNougTUNHUW0wgCTYBTYm/
 m2+ygdgiAsYS/WdnsYMUMQu0sUrMPf8EyOHgEBZwlFi7TQ6khkVAVWLthalgQ3kFLCTObLoP
 tUxeYvWGA8wTGHkWMDKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIyVbcd+btnB2PUu+BCj
 AAejEg+vhD9PvBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMZoCLZ/ILCWa
 nA+M47ySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYzJ6SfeKTR/
 ur9yc0RMRsKRPqW481K9lQftJpcy1ZVeleA76zgvN2P2u9aOINNFb65eV043Ou7U90LVxyJU
 sqixPDW0aEr2AoM1QZ+i9bMt6leW77/vuF/fVK7sxrnc2i1JuZVnDptZlD5/05co/VZ2+dk8
 C+kibp6tr2fqzUjZWWi8vcDEXImlOCPRUIu5qDgRAG53aYyrAgAA
X-CMS-MailID: 20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981
X-Msg-Generator: CA
X-RootMTR: 20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981
References: <CGME20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981@eucas1p2.samsung.com>
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

Changes since v8:
- fixed typo in function name,
- removed cocci script (added by mistake)

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
