Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 403972306D
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1B888CBF;
	Mon, 20 May 2019 09:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0288CBF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:35:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190520093506euoutp0136852387f6cff45ad5c8a3afb6ca84ae~gWm_TLCFp0721407214euoutp01M
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:35:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190520093506euoutp0136852387f6cff45ad5c8a3afb6ca84ae~gWm_TLCFp0721407214euoutp01M
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190520093505eucas1p1f780d9ea4cfa4263c2d0db1796cf0b8b~gWm9m7xee1916919169eucas1p1Z;
 Mon, 20 May 2019 09:35:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 8B.CF.04325.9C472EC5; Mon, 20
 May 2019 10:35:05 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190520093504eucas1p1837a08f2b141a0c3cf9769971bc71dcc~gWm81xMHl0131801318eucas1p1v;
 Mon, 20 May 2019 09:35:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190520093504eusmtrp27f18af2bbd1a07f36fae9167a83b5b91~gWm8npVVp2728227282eusmtrp2l;
 Mon, 20 May 2019 09:35:04 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-13-5ce274c9a0c9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 65.D8.04146.8C472EC5; Mon, 20
 May 2019 10:35:04 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190520093504eusmtip192970a0e9c9a604634531ffa0fa620f7~gWm8Jhf0p0412204122eusmtip1F;
 Mon, 20 May 2019 09:35:03 +0000 (GMT)
Subject: Re: [PATCHv3 08/23] drm/bridge: tc358767: split stream enable/disable
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <68ca2fd9-03dd-20b6-3bb2-6381a01d2dbf@samsung.com>
Date: Mon, 20 May 2019 11:35:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503122949.12266-9-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djP87onSx7FGLzdKmzR3GFr0XSogdXi
 W38ri8WVr+/ZLLo7O1gtHsy9yWTROXEJu8XdeydYLGZ9/MFqsX7+LTYHLo8HU/8zeeycdZfd
 Y3bHTFaP+93HmTz6/xp4HL+xnSmALYrLJiU1J7MstUjfLoErY96aGywFD5gqfux6zdjAuJKp
 i5GTQ0LARKJt+k12EFtIYAWjxNZz0l2MXED2F0aJfXN2skE4nxklDt99DNTBAdbxcpo/RHw5
 o8Sp082sEM5bRontvavBRgkLBEhMn3uGGSQhIjCHWeLf5HZmkASbgKbE38032UBsXgE7iV9/
 doLZLAKqEj/vzmUBsUUFIiTuH9vAClEjKHFy5hOwOKeAtcTLKX/B4swC8hLNW2czQ9jiEree
 zIf65xi7xMf/bBC2i8TDLw8YIWxhiVfHt7BD2DIS/3fC1NdL3F/RAnaohEAH0P8bdjJDJKwl
 Dh+/yAryMjPQ0et36UOEHSU27jgBDQk+iRtvBSFO4JOYtG06M0SYV6KjTQiiWlHi/tmtUAPF
 JZZe+Ap1mYfEicUNjBMYFWcheXIWksdmIXlsFsINCxhZVjGKp5YW56anFhvnpZbrFSfmFpfm
 pesl5+duYgSmqdP/jn/dwbjvT9IhRgEORiUeXo/pD2OEWBPLiitzDzFKcDArifAaq9+PEeJN
 SaysSi3Kjy8qzUktPsQozcGiJM5bzfAgWkggPbEkNTs1tSC1CCbLxMEp1cB4zOuOyc4z7MK1
 OSI887I8P0w9771WL2JSQ3m1wqaCvJiK+QpNJZXzXhfFMG058O61M/9cxoJzs8y2MFzZdOj9
 EkanA1J7/A7+vXCv/4DG3PsTA0LfZqpHvrOctqh4U5PZiu9NzfYRZ4SiO+7bi9sHG9np7P9h
 K7rjZMxhud7qj3wazf8zUpcosRRnJBpqMRcVJwIATVnYN08DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xu7onSh7FGPxaI23R3GFr0XSogdXi
 W38ri8WVr+/ZLLo7O1gtHsy9yWTROXEJu8XdeydYLGZ9/MFqsX7+LTYHLo8HU/8zeeycdZfd
 Y3bHTFaP+93HmTz6/xp4HL+xnSmALUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzW
 yshUSd/OJiU1J7MstUjfLkEvY96aGywFD5gqfux6zdjAuJKpi5GDQ0LAROLlNP8uRk4OIYGl
 jBIrmm1AbAkBcYnd898yQ9jCEn+udbF1MXIB1bxmlFg6ZSojSEJYwE9ix4M+sISIwAJmie4r
 l9khqvYzSqzpmMECUsUmoCnxd/NNNhCbV8BO4tefnWA2i4CqxM+7c8FqRAUiJM68X8ECUSMo
 cXLmEzCbU8Ba4uWUv6wgNrOAusSfeZeYIWx5ieats6FscYlbT+YzTWAUnIWkfRaSlllIWmYh
 aVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMAa3Hfu5eQfjpY3BhxgFOBiVeHg/THkY
 I8SaWFZcmXuIUYKDWUmE11j9fowQb0piZVVqUX58UWlOavEhRlOg5yYyS4km5wPTQ15JvKGp
 obmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkZewZnmuqur/wTs1mUJ4X/y
 RGT5zXiVVQ3v7ux8+MvT7Jzcs9K39yR4io4Y/830jk3cujNVJ6N76dVW0YwPD9OOtpW1H9wk
 dVN0XWgWQ7rzxNaQs7NVvSdJRrxYsUij4dXmsNbfC57bpc1dZP/pmvTz6+FRizdd+v9J92Mu
 E2Oe6Qvm8xu90q8osRRnJBpqMRcVJwIAf1URvdcCAAA=
X-CMS-MailID: 20190520093504eucas1p1837a08f2b141a0c3cf9769971bc71dcc
X-Msg-Generator: CA
X-RootMTR: 20190503123113epcas2p224de31ff32cefc4e988282d053f2c6ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190503123113epcas2p224de31ff32cefc4e988282d053f2c6ad
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
 <CGME20190503123113epcas2p224de31ff32cefc4e988282d053f2c6ad@epcas2p2.samsung.com>
 <20190503122949.12266-9-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558344906;
 bh=7rBwlpXm19bws6Kb+Cz5+6v52gJQ5+q3zpDozdZtqPI=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=QtoLdNj6LasZkgXWrSB0TTc9DW9nOSvnLuTKn+JnyUDKsW+YmuPokM5PS+jiH7/ZP
 2Y1wmtdiWIFVJkqDBlC2QNDZjTRVivoG64t/3waNLhKQZ3gMxhvZ1j2lra6hQFyHqq
 s5JnnKyPvwBrDxW0NZnZrP/bnlnGeUYVhjbz2BYk=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMuMDUuMjAxOSAxNDoyOSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gSXQgaXMgbmljZXIg
dG8gaGF2ZSBlbmFibGUvZGlzYWJsZSBmdW5jdGlvbnMgaW5zdGVhZCBvZiBzZXQoYm9vbCBlbmFi
bGUpCj4gc3R5bGUgZnVuY3Rpb24uCj4KPiBTcGxpdCB0Y19tYWluX2xpbmtfc3RyZWFtIGludG8g
dGNfc3RyZWFtX2VuYWJsZSBhbmQgdGNfc3RyZWFtX2Rpc2FibGUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpSZXZpZXdlZC1ieTogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
