Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030A59C3A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 15:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B456E8F0;
	Fri, 28 Jun 2019 13:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1056E8F0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:59:59 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628125958euoutp0251f9c5d1da1b80c7ce239e900961cff5~sXj_tU74K0792907929euoutp02X
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:59:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628125958euoutp0251f9c5d1da1b80c7ce239e900961cff5~sXj_tU74K0792907929euoutp02X
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190628125957eucas1p27033429a12c8ea16f19ec34e72e83a78~sXj_FgENY0785107851eucas1p2N;
 Fri, 28 Jun 2019 12:59:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D9.B5.04298.D4F061D5; Fri, 28
 Jun 2019 13:59:57 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190628125956eucas1p11973850c636bc43d0208f4c4bab19d30~sXj9UJ0Yy2289622896eucas1p1i;
 Fri, 28 Jun 2019 12:59:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190628125956eusmtrp22d896bdd5128a321cc2e8677b1963048~sXj9F7-uJ0792407924eusmtrp2b;
 Fri, 28 Jun 2019 12:59:56 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-98-5d160f4d2074
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1C.7B.04146.C4F061D5; Fri, 28
 Jun 2019 13:59:56 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190628125956eusmtip10a728d1d09434b2484bc6b3dffc3dd51~sXj8gz6aU0865708657eusmtip1N;
 Fri, 28 Jun 2019 12:59:55 +0000 (GMT)
Subject: Re: [PATCH 03/12] backlight: gpio: pull the non-pdata device
 probing code into probe()
To: Bartosz Golaszewski <brgl@bgdev.pl>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <cb6b2f51-f1cb-74f9-2638-fa7becd0b2c4@samsung.com>
Date: Fri, 28 Jun 2019 14:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-4-brgl@bgdev.pl>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe8/ZOTuOtk5z6WNG5UC7QKXUh9NNEqQOkaRBoJXayoNZ3tpJ
 ywwyzLSFaSnIRqF4d4mNmZqmXWY5tUhyKXbRjTKyyDJvFWnl2VHy2/+5/N/n+T28FK50EEup
 mPhTnDZeE6smZZL6tl9d64IWuYX7frF6MuM3OyVMk6OeZJ596ZcyxWluzMuJbyRTOa6XMh9q
 32OMfeIJYvKnKjDG/L6XYNqvjhCMrekGyTzINmE75Oy3vgwpW9L7hmAbDf1S1my8TLKjOR0E
 +7a3mWTtV6wYW1t6nrX2NWDsmHl5sOyAbFsUFxuTzGk3+B+WHSuxjGKJJZIzF6uaURrqwHXI
 hQJ6E7wxv5XqkIxS0pUIRqwWXAzGEVTWF2JiMIag89mlmQrltOS3+Ir5CgTl3VOEGAwjmMyr
 w4QmV1oDRT1bhBEqehUU1Qw4H8LpJzh8st0ihQJJb4FrmUYkaDntDzk/fjt3ktDeUOQwEoJe
 QoeCvc1EiD2LoUM/KBG0C70RurImnV6cdofXg8Kmgl4BDcM3nAhAZ1DQZyghRdBAyLZVS0Xt
 Cp+td2b1MvjbKGICXYNgOmto1t2AoCLvz6x7K7RaXxACGk6vgdtNG8R0AOQP6UjxLAroG14s
 LqGA6/UFs9eSQ9YlpdjtA6ZyEzk3VtdYhecitWEemmEejmEejuH/3CIkMSJ3LomPi+Z4v3ju
 9HpeE8cnxUevP5oQZ0Yz/+7pH+voXTTRfcSCaAqpF8p/LnQLVxKaZD4lzoKAwtUqucdzVbhS
 HqVJOctpEyK1SbEcb0GelETtLk9d4DiopKM1p7gTHJfIaeeqGOWyNA2FeTwKUhXqUlM2Zger
 Qne0bg+u1bfYWturTWXp9wfM9t0N8sLS74qBi157e3zLQnayx6e8jPty39n6BzffK3B8PPRw
 KDij30c7EbF/ejxCEZlx4bQ+U+X5caUi5HOq7+C5ukA+X7UrOexk6avH6VOuD/Wr96TbiwOa
 7d5R9q+VWQq1hD+m8VuLa3nNPzn1rkxzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsVy+t/xu7o+/GKxBpOmKFp8mXuKxWLXg21s
 Fmfe3GW3WNQgZnHl63s2ixVfZrJbPN38mMni/tejjBZT/ixnstj0+BqrxYm+D6wWl3fNYbPY
 37uByYHX4/2NVnaPxddus3rsnHWX3WPTqk42j0/9J1k97lzbw+Zxv/s4k8fmJfUex29sZ/L4
 vEkugCtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5B
 L2PxoU9MBYtZKlpW7mFsYDzJ3MXIwSEhYCIxZa9BFyMXh5DAUkaJRy+3M0LEZSSOry/rYuQE
 MoUl/lzrYgOxhQReM0p0HRUBsYUFEiV6Xr5kAbFFBNQlFqy7xwQyh1ngOLPEwhdT2CCGrmeU
 uDNtJTNIFZuAlcTE9lWMIDavgJ1E//ffYHEWAVWJBQ9WsYLYogIREmfer2CBqBGUODnzCZjN
 KWAscb7jG1gvM9C2P/MuMUPY4hK3nsxngrDlJba/ncM8gVFoFpL2WUhaZiFpmYWkZQEjyypG
 kdTS4tz03GJDveLE3OLSvHS95PzcTYzA6N527OfmHYyXNgYfYhTgYFTi4V3AJRYrxJpYVlyZ
 e4hRgoNZSYRX8pxIrBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNPXkm8oamhuYWlobmx
 ubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRkeTzFUPuMrW9ur5/1jbX5FaulttboNI
 sOWh5fa/5z99JaRxI+l+AWeweHWQ0kfTDTeNWEWu35a/Wr+n0Nu9xy42p/PUzoYFO+TMXj/q
 SrvEw8LEmHC0u/RsW9BOw8X9O1kXHWU27WVbNfX11NVxOcn//MV2XrnRHvoktS1E37JPOy07
 cLu1EktxRqKhFnNRcSIAL20C+QQDAAA=
X-CMS-MailID: 20190628125956eucas1p11973850c636bc43d0208f4c4bab19d30
X-Msg-Generator: CA
X-RootMTR: 20190625163459epcas3p1331f76cb55291f41c5a4c3e37e0713fe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190625163459epcas3p1331f76cb55291f41c5a4c3e37e0713fe
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <CGME20190625163459epcas3p1331f76cb55291f41c5a4c3e37e0713fe@epcas3p1.samsung.com>
 <20190625163434.13620-4-brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561726798;
 bh=OUDwoCQGsl9WTT2taNQCoc/tSY0rgy7kUD5RRoWSEP0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=lpN08RJkHhMm8gvjKXXe9mEQuSVd64G/vr7yuIEOkO2FKNFG3Me+yhCRXRdGKhotQ
 Ujbhs4dqHWw1B/8QV3lnvIf42GAtkBsOrGVmACOat4v8YMzvGPauVIVUe3D7VtIrph
 8EsB5CLs63fuTJt+m8+b3/Xo1ofFLhde1+tJjT5E=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjUvMTkgNjozNCBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IFRoZXJl
J3Mgbm8gZ29vZCByZWFzb24gdG8gaGF2ZSB0aGUgZ2VuZXJpYyBwcm9iaW5nIGNvZGUgaW4gYSBz
ZXBhcmF0ZQo+IHJvdXRpbmUuIFRoaXMgZnVuY3Rpb24gaXMgc2hvcnQgYW5kIGlzIGlubGluZWQg
YnkgdGhlIGNvbXBpbGVyIGFueXdheS4KPiBNb3ZlIGl0IGludG8gcHJvYmUgdW5kZXIgdGhlIHBk
YXRhLXNwZWNpZmljIHBhcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2FyZHMsCi0t
CkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApT
YW1zdW5nIEVsZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
