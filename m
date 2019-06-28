Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D566559856
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACED76E8CA;
	Fri, 28 Jun 2019 10:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EBD6E8CA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:26:48 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628102647euoutp02cc267a82e957f1df4eeae7f03b6c7f4f~sVeO01wws2448924489euoutp02O
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:26:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628102647euoutp02cc267a82e957f1df4eeae7f03b6c7f4f~sVeO01wws2448924489euoutp02O
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190628102646eucas1p25c1fe8590e2fc919c5df8626fdc103f0~sVeOdUYZ-0359603596eucas1p2y;
 Fri, 28 Jun 2019 10:26:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E3.DF.04325.66BE51D5; Fri, 28
 Jun 2019 11:26:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190628102646eucas1p1c600a3480975db9f6f194889a7154cb5~sVeNw6j512205922059eucas1p1N;
 Fri, 28 Jun 2019 10:26:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628102645eusmtrp1d7fb4c1884549d4bb25c5f04dd4d89db~sVeNhudMu1691316913eusmtrp1G;
 Fri, 28 Jun 2019 10:26:45 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-10-5d15eb666f58
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9B.53.04140.56BE51D5; Fri, 28
 Jun 2019 11:26:45 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628102645eusmtip26f4af43ea671e0dfe154a344c286a836~sVeNOSwxL0993109931eusmtip2-;
 Fri, 28 Jun 2019 10:26:45 +0000 (GMT)
Subject: Re: [PATCH 1/3] video: fbdev: s3c-fb: return -ENOMEM on
 framebuffer_alloc() failure
To: Jingoo Han <jingoohan1@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <4b4b8ce6-5398-9df2-9cd9-8b58ec769ad5@samsung.com>
Date: Fri, 28 Jun 2019 12:26:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <PSXP216MB066270BD6566CA5CDCEB1C7AAAEA0@PSXP216MB0662.KORP216.PROD.OUTLOOK.COM>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7ppr0VjDR5OV7O48vU9m8WKLzPZ
 LU70fWC1uLxrDpsDi8fOWXfZPe53H2fy+LxJLoA5issmJTUnsyy1SN8ugSujZ/cFtoKfTBU3
 Tpxha2DczNTFyMkhIWAiMWvvW7YuRi4OIYEVjBIXj59ghHC+MEp8XniSGcL5zCix71QPI0zL
 vOmroRLLGSXO/73DDuG8ZZRo6//IDlIlLBAnsb77CwuILSKgKtFw/iQrSBGzwHFGianPL4ON
 YhOwkpjYvgrM5hWwk1jUtokZxGYBavhxsBFskKhAhMT9YxtYIWoEJU7OfAI2lFMgRqJr0Smw
 OLOAuMStJ/OZIGx5ie1v54CdJyHQzy5x//o7Voi7XSTW/Olgg7CFJV4d38IOYctInJ7cwwLR
 sI5R4m/HC6ju7YwSyyf/g+qwljh8/CLQJA6gFZoS63fpQ4QdJd79u8sOEpYQ4JO48VYQ4gg+
 iUnbpjNDhHklOtqEIKrVJDYs28AGs7Zr50rmCYxKs5C8NgvJO7OQvDMLYe8CRpZVjOKppcW5
 6anFxnmp5XrFibnFpXnpesn5uZsYgWnl9L/jX3cw7vuTdIhRgINRiYdXYadIrBBrYllxZe4h
 RgkOZiURXslzQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTByc
 Ug2MYTs/dxl1cVZddvq15VuEqCW3yIXLafuWaM/JEj5U4hzlLPE71fM5052vXpGWEntTmIVb
 L91dK7xBPvHFI56IAw8seHMC2PSiv27iceHiy/sz+X7blCt3slb/Oed7vEak9PP/lp+aqwV/
 lD7aY/0y/qjOiqhIbSXlApX6rY9O9ob3l0jW//NUYinOSDTUYi4qTgQAXcyZyycDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xe7qpr0VjDWb80Le48vU9m8WKLzPZ
 LU70fWC1uLxrDpsDi8fOWXfZPe53H2fy+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
 yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS+jZ/cFtoKfTBU3Tpxha2DczNTFyMkhIWAiMW/6
 auYuRi4OIYGljBK7ZxwHSnAAJWQkjq8vg6gRlvhzrYsNouY1o8TsAxeYQRLCAnES67u/sIDY
 IgKqEg3nT7JCFD1hlPg/ZwoTiMMscJxRYsvleWDr2ASsJCa2r2IEsXkF7CQWtW0Cm8QC1P3j
 YCM7iC0qECFx5v0KFogaQYmTM5+A2ZwCMRJdi06xgtjMAuoSf+ZdYoawxSVuPZnPBGHLS2x/
 O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiBUbTt2M8t
 Oxi73gUfYhTgYFTi4VXYKRIrxJpYVlyZe4hRgoNZSYRX8hxQiDclsbIqtSg/vqg0J7X4EKMp
 0HMTmaVEk/OBEZ5XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoHR
 Os5pndFJ75evJwpUnX5WsXmm//rMxrp7kqn7e67vjjkpK8pdWFooXmHrxNrYuswl8aqrk7i2
 7MmyovMpPmk67v57u2yPzqsKuaqbmLokk7vk7qxn1ftbhcSVLvFxfblyRKN3mrqGdHHbGjXh
 OS/sm/3FzyZ8WDjz7uyt2eW/Z8rf6D7L7abEUpyRaKjFXFScCABIITkduAIAAA==
X-CMS-MailID: 20190628102646eucas1p1c600a3480975db9f6f194889a7154cb5
X-Msg-Generator: CA
X-RootMTR: 20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f
References: <CGME20190614144735eucas1p2f71313b752ae4ea841ddd4ea502fd79f@eucas1p2.samsung.com>
 <bbf32fbc-b4bc-39fc-e8dd-db9f0cd0d83f@samsung.com>
 <PSXP216MB066270BD6566CA5CDCEB1C7AAAEA0@PSXP216MB0662.KORP216.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561717607;
 bh=KjachvUjFuProN1ItZ8eavMlmBwNBunf1xPRCI20c5c=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=hlXFYFqzeToMR/nOQLo9DfKwDFfGomY0fE8vnLv37RaCfBL/UD7JEEXdiF/SIFZkM
 0RvpbvMhns6GAs/6Lj+DR8JhhEaWEb7KLZIstzElb0QYmttHLRCJIxaFVOzvo90W9w
 BhEAaDn1s6z9/YGvkA0GaIBWfmJmrwUJfIc14rV8=
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTgvMTkgODoxMyBBTSwgSmluZ29vIEhhbiB3cm90ZToKPiBPbiA2LzE0LzE5LCAxMTo0
NyBQTSwgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPj4KPj4gRml4IGVycm9yIGNv
ZGUgZnJvbSAtRU5PRU5UIHRvIC1FTk9NRU0uCj4+Cj4+IENjOiBKaW5nb28gSGFuIDxqaW5nb29o
YW4xQGdtYWlsLmNvbT4KPiBBY2tlZC1ieTogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5j
b20+CgpUaGFua3MsIEkgcXVldWVkIHRoZSBwYXRjaCBmb3IgdjUuMy4KCkJlc3QgcmVnYXJkcywK
LS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5k
ClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
