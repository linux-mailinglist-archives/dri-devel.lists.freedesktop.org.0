Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918759C78
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 15:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0796E8F6;
	Fri, 28 Jun 2019 13:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FF46E8F6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:04:20 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628130418euoutp0267f94ad653e82058d15159bbde60aa9a~sXnxCc6aM1230212302euoutp02p
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 13:04:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190628130418euoutp0267f94ad653e82058d15159bbde60aa9a~sXnxCc6aM1230212302euoutp02p
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190628130417eucas1p25da61a012bd9cfd3806cba3b9af433d1~sXnwT-Ny00985109851eucas1p2K;
 Fri, 28 Jun 2019 13:04:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 4B.66.04298.150161D5; Fri, 28
 Jun 2019 14:04:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190628130416eucas1p2bf6968e95e821111066b0cf8e3e89148~sXnvco8Lm0991009910eucas1p2z;
 Fri, 28 Jun 2019 13:04:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628130416eusmtrp1392196ef73b0d9bc4527c3c4c364a177~sXnvOgcZn2032020320eusmtrp17;
 Fri, 28 Jun 2019 13:04:16 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-f7-5d16105152a0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 26.2C.04146.050161D5; Fri, 28
 Jun 2019 14:04:16 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628130416eusmtip25a53d17dc929e9a7d69aebea0a2dfd4a~sXnup95d51124511245eusmtip2t;
 Fri, 28 Jun 2019 13:04:15 +0000 (GMT)
Subject: Re: [PATCH 09/12] fbdev: da8xx: remove panel_power_ctrl() callback
 from platform data
To: Bartosz Golaszewski <brgl@bgdev.pl>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <4ce97f34-0328-2708-f8d8-33c045014348@samsung.com>
Date: Fri, 28 Jun 2019 15:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-10-brgl@bgdev.pl>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djPc7qBAmKxBrNb5Sy+zD3FYrHrwTY2
 izNv7rJbLGoQs7jy9T2bxYovM9ktnm5+zGRx/+tRRospf5YzWWx6fI3V4kTfB1aLy7vmsFns
 793A5MDr8f5GK7vH4mu3WT12zrrL7rFpVSebx6f+k6wed67tYfO4332cyWPzknqP4ze2M3l8
 3iQXwBXFZZOSmpNZllqkb5fAldH1ait7wQrmihe/57M1MD5l6mLk5JAQMJF49nEjkM3FISSw
 glHiy7EFUM4XRomtnZtYIJzPjBLzNuyGa9n2rZ0VIrGcUeLd7JdQVW8ZJdYc6mAFqRIWSJA4
 2DGLEcQWEVCXWLDuHthcZoGjzBIvL69mA0mwCVhJTGxfBVbEK2AnMWXpVjCbRUBV4tbSy2Dr
 RAUiJO4f28AKUSMocXLmExYQmxPojGVPW5hBbGYBcYlbT+YzQdjyEtvfzmEGWSYh0MohcbDh
 PzvE3S4Sb88/h7KFJV4d3wJly0icntzDAtGwjlHib8cLqO7tjBLLJ/9jg6iyljh8/CLQGRxA
 KzQl1u/Shwg7Sjy/0MgCEpYQ4JO48VYQ4gg+iUnbpjNDhHklOtqEIKrVJDYs28AGs7Zr50rm
 CYxKs5C8NgvJO7OQvDMLYe8CRpZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYgSnv9L/j
 n3Ywfr2UdIhRgINRiYf3B49YrBBrYllxZe4hRgkOZiURXslzIrFCvCmJlVWpRfnxRaU5qcWH
 GKU5WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUaGAW3h++vf9tm7PNw8p6TFtt0q9/zHPxz
 /eVUxzsTbXPWc+ouvOvly3cmZ3VaqtQ1i3PPJi5qfpm7q28vm3iIGVvDpUCdw2e0Z7J0bn6a
 ZDI/NOi94+FJBfzprFl1si7HmZfP79uocPAv68GDAXNdtJbzsGv3y6+b7zWlZuu8vvvlb800
 6greP1ZiKc5INNRiLipOBADYz1FwdQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsVy+t/xe7oBAmKxBivmK1p8mXuKxWLXg21s
 Fmfe3GW3WNQgZnHl63s2ixVfZrJbPN38mMni/tejjBZT/ixnstj0+BqrxYm+D6wWl3fNYbPY
 37uByYHX4/2NVnaPxddus3rsnHWX3WPTqk42j0/9J1k97lzbw+Zxv/s4k8fmJfUex29sZ/L4
 vEkugCtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5B
 L6Pr1Vb2ghXMFS9+z2drYHzK1MXIySEhYCKx7Vs7axcjF4eQwFJGibd/9zB3MXIAJWQkjq8v
 g6gRlvhzrYsNxBYSeM0osWUbWFxYIEHiYMcsRhBbREBdYsG6e0wgc5gFjjNLLHwxhQ1i6AZG
 ib6Pf1lAqtgErCQmtq8C6+AVsJOYsnQrmM0ioCpxa+llsItEBSIkzrxfwQJRIyhxcuYTMJsT
 6NJlT1uYQWxmoG1/5l2CssUlbj2ZzwRhy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKp
 pcW56bnFhnrFibnFpXnpesn5uZsYgfG97djPzTsYL20MPsQowMGoxMO7gEssVog1say4MvcQ
 owQHs5IIr+Q5kVgh3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgemnrySeENTQ3MLS0NzY3Nj
 Mwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxe1vE+N/oNZp6OOubzL8487cRk74J/E4MX
 RpTZ2Z38mnAqbO7hdX8XiywWKYi6MftRAEtCq0/JexPdkD8NPmuF7HlClAt5DD7/0rtop/A4
 7LjS/wnRqrH31jEq57448OCzfZBG0toD4jdnK6xiqN9Sa/l+/nIxFseTQlFhW/c4Olafk5uw
 ep4SS3FGoqEWc1FxIgCAwQ2iBQMAAA==
X-CMS-MailID: 20190628130416eucas1p2bf6968e95e821111066b0cf8e3e89148
X-Msg-Generator: CA
X-RootMTR: 20190625163506epcas1p17f7af1c7debde2cf892b3f1caf261460
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190625163506epcas1p17f7af1c7debde2cf892b3f1caf261460
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <CGME20190625163506epcas1p17f7af1c7debde2cf892b3f1caf261460@epcas1p1.samsung.com>
 <20190625163434.13620-10-brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561727058;
 bh=yyrN8XRVd80IqFK+hkiq7tC80Q9N+J4sVRhFbFfL/Ig=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=TukiLzc2+FZ6WrxF/Ehuze1u5JM2FcGL/dpqM5g5j5s1A+AWLGTbkYIIdQcK1R4B/
 ek5GWh0Jt9k8Dh2sBC2H4ppWGbSbaQHUmG/dxjyDt83NHlAR3fvqtLA6O3UeT2ijpd
 XeYkmRP7VhJK6/YL9p2ChD61ovVcCiL0fa2QpM54=
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
IGFyZSBubyBtb3JlIHVzZXJzIG9mIHBhbmVsX3Bvd2VyX2N0cmwoKS4gUmVtb3ZlIGl0IGZyb20g
dGhlCj4gZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJn
b2xhc3pld3NraUBiYXlsaWJyZS5jb20+CgpBY2tlZC1ieTogQmFydGxvbWllaiBab2xuaWVya2ll
d2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBF
bGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
