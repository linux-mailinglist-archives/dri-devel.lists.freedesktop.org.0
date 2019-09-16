Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B817B37B2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 12:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB596E8D5;
	Mon, 16 Sep 2019 10:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB6D6E8D5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 10:02:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190916100213euoutp015b8004c4a97fb9f9e3bb16b2e51faa50~E4vnmShXh2109121091euoutp01E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 10:02:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190916100213euoutp015b8004c4a97fb9f9e3bb16b2e51faa50~E4vnmShXh2109121091euoutp01E
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190916100212eucas1p2dc1a33fd059e6f4ffe93c0c91cbc343f~E4vm1DCUj3032330323eucas1p2y;
 Mon, 16 Sep 2019 10:02:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AD.1C.04309.4AD5F7D5; Mon, 16
 Sep 2019 11:02:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190916100211eucas1p1df7bc2b986fbd1752d2ebf0c135842a8~E4vmEzuf80653906539eucas1p1z;
 Mon, 16 Sep 2019 10:02:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190916100211eusmtrp2ebafb7c27b57cfea68615df68b3c2dcf~E4vl2eCCw2596625966eusmtrp2M;
 Mon, 16 Sep 2019 10:02:11 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-26-5d7f5da468b9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 48.D2.04166.3AD5F7D5; Mon, 16
 Sep 2019 11:02:11 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190916100210eusmtip24d1c0bc3e1ad46f33aa5e6bcc7f95b75~E4vlDtGyY3147031470eusmtip2R;
 Mon, 16 Sep 2019 10:02:10 +0000 (GMT)
Subject: Re: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of TX_P0
To: Brian Masney <masneyb@onstation.org>, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, agross@kernel.org, narmstrong@baylibre.com,
 robdclark@gmail.com, sean@poorly.run
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
Date: Mon, 16 Sep 2019 12:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815004854.19860-6-masneyb@onstation.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUxTURT09q0QSy5F7VFca/zQxBVNrkuM28eLuyZGoxIt+gIooGkB0UZL
 VJSCaOsSYyECWiJBQK1SWVywNFaCbQRlqyJVSNw1oriERXk8jPzNPTPnzkxyeEplY0fx0XHx
 oi5OG6NhA2nHw9/eqbZwY/gMRwdFvG1dNMnwVitIzf3PNPnjsFAk2+VlyLPOLywpfO5EJOuN
 B5H6n+8oUv2xniYmi40jZ7uvKIi9rYEhlvsejjwtz2JJXmOtgpzK/MAQ58kt5E3uL4qk3HVx
 pOWMCy0aLhReLETCl6YUTihtsSHh7o8cWiiztnBCZuoFRrAXmFjhkblOIbxouMMKt3/4GaE1
 3a0QbtqMQl5TiOAu93FCZcYZWvhmH7sWbw5csFOMiU4UddMXbg+MMvvzqb3FQUkVPjubjE4M
 TUMBPODZYMm8RKehQF6F8xH48m8wEqHC3xG0FCTKxDcEXYcLqX8bpnM2JBNXEOTeq1DIj08I
 jlTV0ZIqBK+Dx1YvK+FhuBiBq3e5JKJwOgWVjgxOIlg8GXpuNveLlHghPEjrQRKm8SRoO1bZ
 bzccb4IOfxUja4Kh+kJ7nwHPB+D5YO0ySmMKj4MjJZmUjNXga8/uDwS4nQfT5d+sHHsZWMwu
 TsYh8N59awCPhj9l0oKEjdCaf5SSl1MRlFwvG+g8H6rctYxkTPWFvlY+XR4vBnNNbX8ewEHQ
 9ClYzhAEpx3nKXmshNRjKlk9AVo9JQMfqiHvSSdrRhrroGLWQW2sg9pY//vmILoAqcUEfWyk
 qJ8VJ+6bptfG6hPiIqft2BNrR323W9Pr/l6KyrsjnAjzSDNUmZxyKFzFaBP1+2OdCHhKM0y5
 MdUQrlLu1O4/IOr2bNMlxIh6JwrlaY1aaRji36LCkdp4cbco7hV1/1gFHzAqGYXs8EdvN4z0
 3Ciaw51rfh6/fnV3p2HNKuZj/biXtmZr5+sPs0obRo/MKchtLbmUfdt/raxRNSPi67zxSVE9
 5Ph5U4curOvi3DxnXYWBj5i90rfr1GPNiIMBS949nJPyYmJSWBG5GtodippKN6Q3N6qDV/ne
 9savGPNqX9h1T/XSRuNWDa2P0s6cQun02r9kKhuntwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+d3XruLiNp3+MNMahBS1mo/8aSZGD+5fVkgY1bKhNx05V7tT
 stdGstKp5bAIZzUrJTETmmQ+MnVZatNJVssszZhoYU+ih6mVcwX+9znnez4cDhwaFzWSgbQy
 U8tpMhUZEsqbsP/uHF51Ta6TrzFWM8jhmiJQkaMbQ/bWjwT6U2/CkaXDQaKn3z5RqOalDaCL
 470APfvxDkfd758RKN9UIUDnpq9jyOpyksjU2itAT5ouUqjy+WMMnS2bIJHtzG40fuUnjgwt
 HQI0VNIB4sVszeUawH4aMAjYhqEKwLZ8LyfYRvOQgC3LKyVZa3U+xXYV92PsK+ddir3zfYRk
 Xxd0YmxdhY6tHPBlO5sGBWxbUQnBfrUGb2N2SWM16iwttyRdzWvXS3bLUJhUFo2kYRHRUll4
 lDwmLFKyOi42lctQZnOa1XH7pOnFI1X4wdoFh5sHrZQeFPoYgRcNmQiYf74CGIE3LWIqAbzh
 PI15ggDYbPmAe9gXTjuNlGdoAsD8xjukO/BltsMes2Mu8GNqARz+cmauwJkCHBY4rgo8SiuA
 LucM4VYoZjmcqXtBuVnIxMF24wxwM8Esg65TbXP7xMxOeL/BDDwzC2F36eisS9NezDpontK5
 2zgTCqcv9+MeDoG5t8v+cQAcHLVgxUBknmeb5ynmeYp5nlIOiGrgx2XxqjQVL5PyChWflZkm
 TVGrrGD2beofTtY1gP5biTbA0EDiI9QbTshFpCKbz1HZAKRxiZ8wKe+oXCRMVeQc4TTqZE1W
 BsfbQOTsbSY8UJyinn3CTG2yLFIWhaJlUeFR4WuRJECYx7TvETFpCi13gOMOcpr/HkZ7BeqB
 2NBy6NtkpI7ca7UnjWmt6/wXrby+s7TRUrJVF/TWVJRhv7dhpTKmbUvCWGihz6+uNUdW+Pdt
 VMdcWLx8h6D4ps/Sk/trHmwiLPoq2MaHhtBYsDj1856EWuWu+ONBzQ099Xnjtyy2N5eOb25x
 VeXGtnfGBD6yD23SKxOPDTb1GSIkBJ+ukK3ANbziLwnmEihMAwAA
X-CMS-MailID: 20190916100211eucas1p1df7bc2b986fbd1752d2ebf0c135842a8
X-Msg-Generator: CA
X-RootMTR: 20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97
References: <20190815004854.19860-1-masneyb@onstation.org>
 <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
 <20190815004854.19860-6-masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568628133;
 bh=2OVF5c5pYBq2SkS4w+n6GCe9wGg9kPVzYiKP+MDm7UU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LUxel2soKgf2QMWpSXvnfHYSNIOq/OaORBW2CjYWhg5TwQIuSlMneEVDrQk3mq6Fg
 L1KKH1w47LGAgEsyOEhjdd6iSam3d++zdTJtdklS2lTTv4GptuzWB8zfw858tfnVVs
 e94yKfhei6igjND+O5KUQLexdKM721X2O5E1h9Ks=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTUuMDguMjAxOSAwMjo0OCwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IFdoZW4gYXR0ZW1wdGlu
ZyB0byBjb25maWd1cmUgdGhpcyBkcml2ZXIgb24gYSBOZXh1cyA1IHBob25lIChtc204OTc0KSwK
PiBzZXR0aW5nIHVwIHRoZSBkdW1teSBpMmMgYnVzIGZvciBUWF9QMCB3b3VsZCBmYWlsIGR1ZSB0
byBhbiAtRUJVU1kKPiBlcnJvci4gVGhlIGRvd25zdHJlYW0gTVNNIGtlcm5lbCBzb3VyY2VzIFsx
XSBzaG93cyB0aGF0IHRoZSBwcm9wZXIgdmFsdWUKPiBmb3IgVFhfUDAgaXMgMHg3OCwgbm90IDB4
NzAsIHNvIGNvcnJlY3QgdGhlIHZhbHVlIHRvIGFsbG93IGRldmljZQo+IHByb2JpbmcgdG8gc3Vj
Y2VlZC4KPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vQUlDUC9rZXJuZWxfbGdlX2hhbW1lcmhl
YWQvYmxvYi9uNy4xL2RyaXZlcnMvdmlkZW8vc2xpbXBvcnQvc2xpbXBvcnRfdHhfcmVnLmgKPgo+
IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaCB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmggYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaAo+IGluZGV4IDI1ZTA2M2JjZWNiYy4u
YmM1MTFmYzYwNWM5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgtYW54Nzh4eC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3
OHh4LmgKPiBAQCAtNiw3ICs2LDcgQEAKPiAgI2lmbmRlZiBfX0FOWDc4eHhfSAo+ICAjZGVmaW5l
IF9fQU5YNzh4eF9ICj4gIAo+IC0jZGVmaW5lIFRYX1AwCQkJCTB4NzAKPiArI2RlZmluZSBUWF9Q
MAkJCQkweDc4CgoKVGhpcyBib3RoZXJzIG1lIGxpdHRsZS4gVGhlcmUgYXJlIG5vIHVwc3RyZWFt
IHVzZXJzLCBncmVwcGluZyBhbmRyb2lkCnNvdXJjZXMgc3VnZ2VzdHMgdGhhdCBib3RoIHZhbHVl
cyBjYW4gYmUgdXNlZCBbMV1bMl3CoCAoZ3JlcCBmb3IgIiNkZWZpbmUKVFhfUDAiKSwgbW9yZW92
ZXIgdGhlcmUgaXMgY29kZSBzdWdnZXN0aW5nIGJvdGggdmFsdWVzIGNhbiBiZSB2YWxpZCBbM10u
CgpDb3VsZCB5b3UgdmVyaWZ5IGRhdGFzaGVldCB3aGljaCBpMmMgc2xhdmUgYWRkcmVzc2VzIGFy
ZSB2YWxpZCBmb3IgdGhpcwpjaGlwLCBpZiBib3RoIEkgZ3Vlc3MgdGhpcyBwYXRjaCBzaG91bGQg
YmUgcmV3b3JrZWQuCgoKWzFdOgpodHRwczovL2FuZHJvaWQuZ29vZ2xlc291cmNlLmNvbS9rZXJu
ZWwvbXNtLysvYW5kcm9pZC1tc20tZmxvLTMuNC1qYi1tcjIvZHJpdmVycy9taXNjL3NsaW1wb3J0
X2FueDc4MDgvc2xpbXBvcnRfdHhfcmVnLmgKClsyXToKaHR0cHM6Ly9naXRodWIuY29tL0FuZHJv
aWRHWC9TaW1wbGVHWC1NTS02LjBfSDgxNV8yMGQvYmxvYi9tYXN0ZXIvZHJpdmVycy92aWRlby9z
bGltcG9ydC9hbng3ODEyL3NsaW1wb3J0NzgxMl90eF9yZWcuaAoKWzNdOgpodHRwczovL2dpdGh1
Yi5jb20vY29tbWFhaS9hbmRyb2lkX2tlcm5lbF9sZWVjb19tc204OTk2L2Jsb2IvbWFzdGVyL2Ry
aXZlcnMvdmlkZW8vbXNtL21kc3MvZHAvc2xpbXBvcnRfY3VzdG9tX2RlY2xhcmUuaCNMNzMKCgpS
ZWdhcmRzCgpBbmRyemVqCgoKPiAgI2RlZmluZSBUWF9QMQkJCQkweDdhCj4gICNkZWZpbmUgVFhf
UDIJCQkJMHg3Mgo+ICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
