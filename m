Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F68BD995
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD1089803;
	Wed, 25 Sep 2019 08:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D276EB34
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:09:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190925080938euoutp02acc19efe474c7de6b251295273feb66c~HoA5g69iJ2896028960euoutp02A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:09:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190925080938euoutp02acc19efe474c7de6b251295273feb66c~HoA5g69iJ2896028960euoutp02A
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190925080938eucas1p2f852704ff9bfa6c14598d9b6a3d784a6~HoA5PyGmn0821508215eucas1p2v;
 Wed, 25 Sep 2019 08:09:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 98.94.04469.2C02B8D5; Wed, 25
 Sep 2019 09:09:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190925080938eucas1p137dd40d454d0d502efb5d8c04701f70a~HoA48swcA0500405004eucas1p1o;
 Wed, 25 Sep 2019 08:09:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190925080938eusmtrp1dbec5f9fd41ca67829c62c2973abee2e~HoA47XYC_0496404964eusmtrp1B;
 Wed, 25 Sep 2019 08:09:38 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-dd-5d8b20c2cf82
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 17.9F.04166.2C02B8D5; Wed, 25
 Sep 2019 09:09:38 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190925080937eusmtip2a02839a3701b1772c5f3873977ac4399~HoA4RBOLm1383813838eusmtip2t;
 Wed, 25 Sep 2019 08:09:37 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: Use
 devm_platform_ioremap_resource() in __dw_mipi_dsi_probe()
To: Yannick FERTRE <yannick.fertre@st.com>, Markus Elfring
 <Markus.Elfring@web.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@linux.ie>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Matt Redfearn
 <matt.redfearn@thinci.com>, Neil Armstrong <narmstrong@baylibre.com>, Nickey
 Yang <nickey.yang@rock-chips.com>, Philippe CORNU <philippe.cornu@st.com>,
 Sam Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <475b8bc5-b7da-bf20-c322-e15e74d19378@samsung.com>
Date: Wed, 25 Sep 2019 10:09:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <59343c81-3dd8-023c-6440-d48c8d74e05e@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj2O7edDSfHVezTpHIhdrcbdbALChHnV4QQWCa58qSRTtnUsiAN
 s7wlLqFwThNSG2Uq6i4JK5nlcmYXzdKsttRaKy9UTpultu0Y+e95n+d93vd9Pj4SFeUQgeQp
 WRorl0mTJIQA03W4nm80rSqM3dzcEEBffdaJ0PM6JUq/ck4Q9PzQN5zum3agdOdoH0Zr3y6n
 85XVPLq3Ve0WVXacbrVWIbSpOIau+T0OaNulLzitcWkBfSU/l4igmIn+XB5jnKrCmPK8Mpx5
 UtKDMPopG85YC80IU329j2BmVQ8xpu1qKcboX1eizKdfRpQpLx3CmZ9NK5jBzzrsoN8Rwe54
 NulUBisP2xsnSCyyGdDUbuqs66MeyQYWYQHgk5DaDts7O3gFQECKKA2ABuc04IpJAK/MTCwU
 PwFsqba720iv5cMsxfG3AdTbTQRXjAHYk2NHPHOXUDJo6dBgHmEpNYzBR9pBzCOgbqFC/caL
 CWotnG0eIDxYSO2FjslCL8aoEKgevOvFy6ho+MPWjnM9/rCzbMTr5VPhcGbCiHMzV8IcbTnK
 YTF8O3IT8SyGVAsJHaNDKJd0H6xvaMQ5vAR+NbfwOBwEu0qLMA5nQavmEsqZ8wDUNt5fMO+C
 7eaXuCc/6r66oTWMoyPhQJsO4Z7FD/aP+XM3+MFruhsoRwth3mUR1x0Mrd3ahYFiWPPCSZQA
 iWpRMtWiNKpFaVT/91YB7A4Qs+mK5ARWsUXGntmkkCYr0mUJm06kJDcB99fsmjP/MABnz3ET
 oEgg8RVG4AWxIlyaochMNgFIopKlQlWQmxLGSzPPsfKUY/L0JFZhAstJTCIWnvexxYioBGka
 e5plU1n5PxUh+YHZoH4gIFYZMv4xfWj/xV+rJ8886YveExn1eCvWbdLjtVOW88Kdt9/7Bq/J
 P/DQmGAo8omrbBt5F/P6VtM2QWj4OP+itftCL7hXxT+tfhWFxReHHl1/93DFyewdT3XNjpq0
 LOX6P+vqIgLvP6jd5ZoxDmyYtoV8mYvM+S62fApPOTRct0yCKRKlW9ahcoX0L8P+WjyWAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsVy+t/xe7qHFLpjDW6fYLXoPXeSyeL/tonM
 Fle+vmez+P/oNavF1e8vmS1OvrnKYrH1lrRF58Ql7BaXd80BSs56zmqx6/4CJotDfdEWS3+/
 Y7R40PKC1WLFz62MFu2drWwOAh7vb7Sye+z9toDFY3bHTFaPExMuMXls//aA1eN+93EmjyXT
 rrJ5/J21n8XjQO9kFo/t1+Yxezz9sZfZY/bkR6wenzfJedx+to0lgC9Kz6Yov7QkVSEjv7jE
 Vina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL6PnwQ7mgrMCFT8fbmdqYDzF
 28XIwSEhYCJx769AFyMXh5DAUkaJM+9WM3UxcgLFxSV2z3/LDGELS/y51sUGUfSaUeLShn4W
 kISwQJ7EqWMrWEASIgLPWSQeTf7OCpJgBkqcvdTPDtGxl1Hi+o+TjCAJNgFNib+bb7KB2LwC
 dhIvv3SD2SwCqhJzbq8Gs0UFIiQO75jFCFEjKHFy5hOwbZwCVhK/3u+FWqAu8WfeJWYIW16i
 eetsKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/d
 xAhME9uO/dy8g/HSxuBDjAIcjEo8vA6sXbFCrIllxZW5hxglOJiVRHhnyQCFeFMSK6tSi/Lj
 i0pzUosPMZoCPTeRWUo0OR+YwvJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQW
 wfQxcXBKNTDa/9t8RMXG45G3D3+jh61FvPDU4ELuq21f1Wb9f92R/Ff/iK0qy/RVpplntbaV
 TZv7keMkc/uctQkctcvfykRWRHvOWrPNTVCwzE94H4/o8+n3+aZOYO9T02dw6srUV2lcrHBn
 Qeu/250fM1/anJs8K3bpk7TGwKefs7dLT5MSZw3YOS38c7ISS3FGoqEWc1FxIgC40rnJKQMA
 AA==
X-CMS-MailID: 20190925080938eucas1p137dd40d454d0d502efb5d8c04701f70a
X-Msg-Generator: CA
X-RootMTR: 20190923090614epcas5p215731e8359c634f7ed76759f68622e4f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190923090614epcas5p215731e8359c634f7ed76759f68622e4f
References: <e0d7b7d7-3e89-8b3f-04ed-0b14806e66f7@web.de>
 <CGME20190923090614epcas5p215731e8359c634f7ed76759f68622e4f@epcas5p2.samsung.com>
 <59343c81-3dd8-023c-6440-d48c8d74e05e@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1569398978;
 bh=lpAo3uu4Dyg/OQ5zC5Dglqf5pwQWN26o/2EDT3w2wuw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=hmyPH1l+FoJgzs2L2RuEnGzZzCBDyqDI6+UxrLBIXQXTvFk9lYziiZfwY4iFVqvMg
 ZoW3ugGtCBNf7HyczynUUgWAxTthJxEVH8FBbTkNamj07TL6wxCivTgzELGQJ1GAdH
 I9NfkZDk6QQ6+/3bxWUGX8F9MWGkkNbUMEJLma04=
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWWFubmljaywgTWFya3VzLgoKT24gMjMuMDkuMjAxOSAxMTowNSwgWWFubmljayBGRVJUUkUg
d3JvdGU6Cj4gUmV2aWV3ZWQtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3Qu
Y29tPiAKPiBUZXN0ZWQtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29t
PiAKCgpZYW5uaWNrLCBuZXh0IHRpbWUgY291bGQgeW91IHB1dCB5b3VyIHRhZ3MgYWZ0ZXIgdGFn
cyBvZiB0aGUgcGF0Y2gsCm90aGVyd2lzZSBwYXRjaHdvcmsgaXMgY29uZnVzZWQgYW5kIGNyZWF0
ZXMgaW5jb3JyZWN0IHBhdGNoZXMgWzFdLgoKWzFdOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvMzMyMzYwLwoKCj4gQmVzdCByZWdhcmRzCj4KPiAtLSAKPiBZYW5uaWNr
IEZlcnRyw6kgfCBUSU5BOiAxNjYgNzE1MiB8IFRlbDogKzMzIDI0NDAyNzE1MiB8IE1vYmlsZTog
KzMzCj4gNjIwNjAwMjcwCj4gTWljcm9jb250cm9sbGVycyBhbmQgRGlnaXRhbCBJQ3MgR3JvdXAg
fCBNaWNyb2NvbnRyb2xsZXVycyBEaXZpc2lvbgo+Cj4KPiBPbiA5LzIxLzE5IDg6MjAgUE0sIE1h
cmt1cyBFbGZyaW5nIHdyb3RlOgo+PiBGcm9tOiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vy
cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4+IERhdGU6IFNhdCwgMjEgU2VwIDIwMTkgMjA6MDQ6MDggKzAy
MDAKPj4KPj4gU2ltcGxpZnkgdGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbiBieSB1c2luZyBh
IGtub3duIHdyYXBwZXIgZnVuY3Rpb24uCj4+Cj4+IFRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5
IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJr
dXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+CgoKSSBtZWFudCBoZXJl
IDopCgoKQW55d2F5LCBwYXRjaCBxdWV1ZWQuCgoKUmVnYXJkcwoKQW5kcnplagoKCgo+PiAtLS0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDcgKy0t
LS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBp
LWRzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCj4+
IGluZGV4IDY3NTQ0MmJmYzFiZC4uNmFkYTE0OWFmOWVmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCj4+IEBAIC05ODEsNyArOTgxLDYg
QEAgX19kd19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+PiAg
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+ICAJc3RydWN0IHJlc2V0X2NvbnRy
b2wgKmFwYl9yc3Q7Cj4+ICAJc3RydWN0IGR3X21pcGlfZHNpICpkc2k7Cj4+IC0Jc3RydWN0IHJl
c291cmNlICpyZXM7Cj4+ICAJaW50IHJldDsKPj4KPj4gIAlkc2kgPSBkZXZtX2t6YWxsb2MoZGV2
LCBzaXplb2YoKmRzaSksIEdGUF9LRVJORUwpOwo+PiBAQCAtOTk3LDExICs5OTYsNyBAQCBfX2R3
X21pcGlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4+ICAJfQo+Pgo+
PiAgCWlmICghcGxhdF9kYXRhLT5iYXNlKSB7Cj4+IC0JCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4+IC0JCWlmICghcmVzKQo+PiAtCQkJcmV0
dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4+IC0KPj4gLQkJZHNpLT5iYXNlID0gZGV2bV9pb3JlbWFw
X3Jlc291cmNlKGRldiwgcmVzKTsKPj4gKwkJZHNpLT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlKHBkZXYsIDApOwo+PiAgCQlpZiAoSVNfRVJSKGRzaS0+YmFzZSkpCj4+ICAJ
CQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPj4KPj4gLS0KPj4gMi4yMy4wCj4+Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
