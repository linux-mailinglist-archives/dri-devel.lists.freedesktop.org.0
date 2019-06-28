Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC159C8A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 15:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5617A6E91B;
	Fri, 28 Jun 2019 13:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B096E91B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:05:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628130528euoutp02ebd54b30a042cb8ae7d2b7caad93974d~sXoyErYac1335513355euoutp02Q
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:05:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628130528euoutp02ebd54b30a042cb8ae7d2b7caad93974d~sXoyErYac1335513355euoutp02Q
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628130527eucas1p1b29f1b6f0c5e551d2bdd2a587f007d90~sXoxbp7q10066100661eucas1p1h;
 Fri, 28 Jun 2019 13:05:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D6.96.04298.790161D5; Fri, 28
 Jun 2019 14:05:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190628130526eucas1p148997ada085ac993a52e762731705bcf~sXowpVQqC1655616556eucas1p1-;
 Fri, 28 Jun 2019 13:05:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628130526eusmtrp1b77d1985ada884e62637836f7f110899~sXowosGgn2135421354eusmtrp1n;
 Fri, 28 Jun 2019 13:05:26 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-d6-5d161097c05a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E0.5C.04146.690161D5; Fri, 28
 Jun 2019 14:05:26 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190628130526eusmtip1c02cdefee6234ed3f9e46e109bd12d01~sXowApqw-1221012210eusmtip1z;
 Fri, 28 Jun 2019 13:05:26 +0000 (GMT)
Subject: Re: [PATCH 11/12] fbdev: da8xx-fb: drop a redundant if
To: Bartosz Golaszewski <brgl@bgdev.pl>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <9ee5e4f8-8f26-1f3e-cc16-8d10f17431e9@samsung.com>
Date: Fri, 28 Jun 2019 15:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-12-brgl@bgdev.pl>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH/e3e3V1Xt35N3Y5pRYOKgjRB4pI9LPzjQhRCQVGNWnVR0ans
 qqVBaWGPWVn5ymVmD7OsVGZp2sOa6arFtAyTUudjSkaW5MweJrndHv73OY/v+Z4DhyYUXdKZ
 dFRsAq+P1caoKTlZ1fi9aXEeVmqWFNtUrPP8c5Kt7aqi2BcfO2TspVQl+3rkM8Vec+bL2L7K
 XglrH2lAbPZYiYQ19bZK2acnh6RsS20BxdadqJCEMtzntnQZd7n1nZSrMXbIOFPpMYr7kvlM
 yrW33qc4e4ZFwlVeOcBZ2qol3LBpdrh8i3z5bj4mKonXB67cIY9sOn4OxaeRe7sKH6NUdJ0w
 IE8acDA4DqXJDEhOK/A1BLb+cokYOBE4bmaRYjCMoPiV/Z/kx5N60sUKXILgTAEjNg0iGBr5
 ilwFL7wKzDmFUhd74wVQVNbpHkvgBgIGWm5QrgKFl8HpI6VuAYNXwlBvultA4nlgNHW62Qdv
 BntjhVTsmQHP8h1uZ8+JLTorz7rzBFbBW8cFichzoHqwgHCZAU6j4Y61RyauHQa1P2+SInvB
 B8vtP3l/sGYdJ0VBGYJfR9//UVcjKMkap8SuEKi3vJywoycsFkJ5baALAa8G632NiNOgbXCG
 uMM0OFOVR4hpBo4eVogz5kPF1Qrqr6uh5jpxCqmNky4zTrrGOOka43/bIkSWIhWfKOgieCEo
 lt8TIGh1QmJsRMCuOJ0JTfydddzy5S4aebXTjDCN1FOZb1OVGoVUmyQk68wIaELtzfjavDUK
 Zrc2OYXXx23XJ8bwghn50aRaxezz6NqqwBHaBD6a5+N5/d+qhPacmYrqtvdvLaRvrf80Kzgj
 e8zj0v6N+CP0XCkuc0QXdT+892vteXs/RikHN959s+GkT1zwgtBRW156oK04Jbehz+5fmtPd
 MODXXvfgRUh5dr6z5oFS8Ps0XaPaZFg9ahk8YtZNCc8I22ZdOndNpfZDbiajVK5rfuTrXPGj
 uSOyPCzookFNCpHaoEWEXtD+Bgd0BIlzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsVy+t/xu7rTBMRiDe626Vl8mXuKxWLXg21s
 Fmfe3GW3WNQgZnHl63s2ixVfZrJbPN38mMni/tejjBZT/ixnstj0+BqrxYm+D6wWl3fNYbPY
 37uByYHX4/2NVnaPxddus3rsnHWX3WPTqk42j0/9J1k97lzbw+Zxv/s4k8fmJfUex29sZ/L4
 vEkugCtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5B
 L+N8z2zGgkaWigfzDjI2MK5k7mLk5JAQMJH4deQwSxcjF4eQwFJGiX1Xu4ASHEAJGYnj68sg
 aoQl/lzrYoOoec0osePJNVaQhLCAvcShqfPAbBEBdYkF6+4xgRQxCxxnllj4YgpUxwZGiXMv
 G9hBqtgErCQmtq9iBLF5BewkPjxuBetmEVCVmLXpHpgtKhAhceb9ChaIGkGJkzOfgNmcQKfe
 2zwDrIYZaNufeZeYIWxxiVtP5jNB2PIS29/OYZ7AKDQLSfssJC2zkLTMQtKygJFlFaNIamlx
 bnpusaFecWJucWleul5yfu4mRmCEbzv2c/MOxksbgw8xCnAwKvHwLuASixViTSwrrsw9xCjB
 wawkwit5TiRWiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBySevJN7Q1NDcwtLQ3Njc2MxC
 SZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAPjxJCcpL8r/HxW5wVu4hU4bPOtalXDj5shT6P2
 sjv2vDKdJxyy5sXdr+7mCXNPfLZZ8NXsgiiL3IKO0B3toi2r3ztI/a1YXCs+X/rJza+59gwf
 0l81H8iTiyll1J4qtjxn0oENGrsC96ccbe+YIGxzw1Zl0Y1Hkbck79XvOL5v0cewXLUVExft
 U2Ipzkg01GIuKk4EAK+9F4kGAwAA
X-CMS-MailID: 20190628130526eucas1p148997ada085ac993a52e762731705bcf
X-Msg-Generator: CA
X-RootMTR: 20190625163508epcas2p1cb472d2ebee0023d5efd777feced0991
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190625163508epcas2p1cb472d2ebee0023d5efd777feced0991
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <CGME20190625163508epcas2p1cb472d2ebee0023d5efd777feced0991@epcas2p1.samsung.com>
 <20190625163434.13620-12-brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561727128;
 bh=rWxubnWiCrnKKpD3KuP7hRM5Nr2cC/zOuIm0vZ7Q72E=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ekyMNEE3qwH48oqMn3kkjdgCtSpQJkl/7JLHNkjwUkMYUA5TZBvw6OAg4EoiplkSo
 yvEaVvivaqoM60I2VKdwy6vVLhGXDEKjcQs3tJT0tZtzKFNN3UI6O7R4KdO3eFl09p
 RihX30ge6CKBqE9/fSFZNjTCuaY5d4KtOC/m7fts=
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
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IFRoZSBk
cml2ZXIgZGF0YSBpcyBhbHdheXMgc2V0IGluIHByb2JlLiBUaGUgcmVtb3ZlKCkgY2FsbGJhY2sg
d29uJ3QgYmUKPiBjYWxsZWQgaWYgcHJvYmUgZmFpbGVkIHdoaWNoIGlzIHRoZSBvbmx5IHdheSBm
b3IgaXQgdG8gYmUgTlVMTC4gUmVtb3ZlCj4gdGhlIHJlZHVuZGFudCBpZi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgoK
QWNrZWQtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5n
LmNvbT4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2ljegpTYW1zdW5n
IFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
