Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D240A66AE9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 12:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA286E33D;
	Fri, 12 Jul 2019 10:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399B76E33D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:31:08 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190712103106euoutp01f5b87fefba1c6898caad257aeff87239~wokAUPd2n1984519845euoutp01v
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:31:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190712103106euoutp01f5b87fefba1c6898caad257aeff87239~wokAUPd2n1984519845euoutp01v
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190712103106eucas1p234a7723ba3e494ac099879c9d89a8efd~woj-lQhsn0791607916eucas1p2G;
 Fri, 12 Jul 2019 10:31:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id FA.D1.04325.961682D5; Fri, 12
 Jul 2019 11:31:05 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190712103105eucas1p27d737c1a20ee65be2c8523f46bc9914e~woj_1Vi1x1832918329eucas1p2E;
 Fri, 12 Jul 2019 10:31:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190712103104eusmtrp21847deb6947e25f75ae89567012a4fad~woj_nE0vW1384213842eusmtrp2k;
 Fri, 12 Jul 2019 10:31:04 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-7e-5d28616992a3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 94.FB.04146.861682D5; Fri, 12
 Jul 2019 11:31:04 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190712103104eusmtip23ed1f1601b70625ec1883bddcaa62231~woj961cqx1128711287eusmtip2J;
 Fri, 12 Jul 2019 10:31:04 +0000 (GMT)
Subject: Re: [PATCH 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
To: Olivier Moysan <olivier.moysan@st.com>, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@st.com,
 alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, jsarha@ti.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <5d87caa7-faac-4461-4184-aff5b8af04b5@samsung.com>
Date: Fri, 12 Jul 2019 12:31:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUyMcRz3e97uKa49nayvWHRjZEhj9hgaZvbgD+RlpkVHj7S60+7pRaxp
 FHel9yV1rWvJqFW4U4lqhE56UdGrWWcdlqRNijY5d/ec6b/P9/P9fn7fz+e7H43LrlJedLgq
 mlerFJFyypWoaZ5+vSZcsTJ43dTkajatowVj71taEZuut5CstSYLZ/XPO0j27eQ4xfb8HMHZ
 lq89BJuq1ZCsNqtUwhqGe0n2zaNCik3ptSlu9XVhbFN6EJtTr6PY5Ibnkm3uXEVRBeLG+5Ml
 XMNUMcHpNPkkZyjXUtzLzG6Mq50yk9xQqgnjjKUXuSdpOQT3tNGf+/irAedM/bUYN2Hw3u92
 zHVLKB8ZHsur/QJCXM98vGYmojLpc8UjJVgi+kalIBcamA1wVXcdS0GutIy5g6DqRTMhFj8Q
 6ArfSMRiAkHJVK7kn+SS6QYlNm4jGB1OdOrHbMVMM2afms8chJdpGscSD6YXh7wxzo4pxhdm
 jAMOXsoEwGDSb9KOCWY5dA6WIjtewByB6WKtc8YdWvIthB27MLvga2G5wwXOLIHL1TpcxJ4w
 aNE7TABTRoO+rAoTre6E65dHnXg+fDE9cEZYDNY6vZO/CEN3knBRrEFQfa8OFxub4Zmpy+aO
 tm3whbuP/ER6O/waznLQwLhB/5i76MENsmvycJGWguaKTJz2gaH2aueDnnCrc9J5dw4GBg1k
 JvIpmJWyYFayglnJCv57KEZEOfLkYwRlGC+sV/FxawWFUohRha09dVZpQLbv2frHNPkQNf4+
 2YQYGsnnSfs3rQiWkYpYIV7ZhIDG5R7ScquNkoYq4s/z6rMn1DGRvNCEFtGE3FN6YY45SMaE
 KaL5CJ6P4tX/uhjt4pWIGka3K9vajCNWfeeTDOjrDN57oOtz8M09Nd/Hda++VO74sabkko85
 yfs0kuY2WjZu1W5KWLGw3bdWVX/Mo0JZWhm6O3A64hDEDZVZlaaQHUsPz9QHfVqZGhYVKLTu
 eRfiPZBgzL3ZnfF+btzJ8Ox9dXn+ZmPf0eiMhA8v0pcdjy96LCeEMwr/VbhaUPwFRmOOvpoD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42I5/e/4Pd2MRI1Yg5cHzC16z51kstj45DSj
 Rd/8J6wW/7dNZLaYf+Qcq8WVr+/ZLK5+f8lscfLNVRaL7s4OVovOiUvYLTY9vsZqcXnXHDaL
 rmtAHUuvX2SyONQXbTF5z2w2i9a9R9gdBD3WzFvD6PH+Riu7x95vC1g8ZnfMZPXYtKqTzePE
 hEtMHtu/PWD1uN99nMlj85J6jwO9k1k8Du4z9Hj6Yy+zx/Eb25k8Pm+SC+CL0rMpyi8tSVXI
 yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt42vOApWACR8WCl4uY
 GhjfsXUxcnJICJhINB2fAWYLCSxllDh/WAYiLi6xe/5bZghbWOLPtS6gGi6gmteMEldOXQFL
 CAsES5zo7QBLiAhcY5b4tbOLBaLqKqPEvLvf2EGq2AQ0Jf5uvgm2glfATuJWyx9WEJtFQFXi
 wq0ljF2MHByiAmESR0/kQZQISpyc+YQFxOYUcJN4M2cV2BhmAXWJP/MuMUPY8hLNW2dD2eIS
 t57MZ5rAKDgLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmBS2Hbs
 5+YdjJc2Bh9iFOBgVOLhvWGpHivEmlhWXJl7iFGCg1lJhHfVf6AQb0piZVVqUX58UWlOavEh
 RlOg3yYyS4km5wMTVl5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6p
 BkadqPnrl1iePpf6bU1XR1PBhh095iv5vZSu8S9WuX/dMpPBS2Xzeq8yYT/XW1O77At1e9ZK
 iD06ePm4kvABhfLFpx+5FmlPWbvkrXhCbcUTk4RC/jWnckTv8/9uMzuSzXOq8kwbQ772OtXZ
 7PNLLx2bs6g2T+5SlP69+4VWWxTPBYXYJtruXqzEUpyRaKjFXFScCAAENZ72IAMAAA==
X-CMS-MailID: 20190712103105eucas1p27d737c1a20ee65be2c8523f46bc9914e
X-Msg-Generator: CA
X-RootMTR: 20190702154805epcas2p2f95d733d2f0df9d311ab5ed37f452d34
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702154805epcas2p2f95d733d2f0df9d311ab5ed37f452d34
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <CGME20190702154805epcas2p2f95d733d2f0df9d311ab5ed37f452d34@epcas2p2.samsung.com>
 <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562927466;
 bh=L9nTEdffmmppnQXXzaoMqKQFM3A683O7RSLnY9V3vuQ=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=PaWrcOXjV2yUxxeWi5/aj2AsjuGCourN0N3y6vuPUSFVVI3otBT4bT9dij0U7jA98
 fpsnKW0LeafYXi98gkp3DpcMqJ2PO1J5VkPsQAHyDGnK+YYwbD9IZmiRWzOe8aTmee
 vzXCq9Hk2xGuZDuD2KT2hbe+fX1TBkyBoHi0oTGs=
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

T24gMDIuMDcuMjAxOSAxNzo0NywgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4gQWRkIGRldm1fY2xr
X2dldCBjYWxsIHRvIHJldHJpZXZlIHJlZmVyZW5jZSB0byBtYXN0ZXIgY2xvY2suCj4KPiBGaXhl
czogZmY1NzgxNjM0YzQxICgiZHJtL2JyaWRnZTogc2lpOTAyeDogSW1wbGVtZW50IEhETUkgYXVk
aW8gc3VwcG9ydCIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5t
b3lzYW5Ac3QuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2lpOTAyeC5jCj4gaW5kZXggZGQ3YWE0NjZiMjgwLi4zNmFjYzI1NmU2N2UgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkwMnguYwo+IEBAIC03NTAsNiArNzUwLDcgQEAgc3RhdGljIGludCBzaWk5
MDJ4X2F1ZGlvX2NvZGVjX2luaXQoc3RydWN0IHNpaTkwMnggKnNpaTkwMngsCj4gIAkJc2lpOTAy
eC0+YXVkaW8uaTJzX2ZpZm9fc2VxdWVuY2VbaV0gfD0gYXVkaW9fZmlmb19pZFtpXSB8Cj4gIAkJ
CWkyc19sYW5lX2lkW2xhbmVzW2ldXSB8CVNJSTkwMlhfVFBJX0kyU19GSUZPX0VOQUJMRTsKPiAg
Cj4gKwlzaWk5MDJ4LT5hdWRpby5tY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgIm1jbGsiKTsKPiAg
CWlmIChJU19FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpIHsKPiAgCQlkZXZfZXJyKGRldiwgIiVz
OiBObyBjbG9jayAoYXVkaW8gbWNsaykgZm91bmQ6ICVsZFxuIiwKPiAgCQkJX19mdW5jX18sIFBU
Ul9FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpOwoKQWNrZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEu
aGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplagoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
