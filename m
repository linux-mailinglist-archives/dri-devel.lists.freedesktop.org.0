Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3E450F8F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785B89C54;
	Mon, 24 Jun 2019 15:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B58589C5E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:03:36 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190624150335euoutp023ee1b81a1dfee28d44785b8b590ac0ae~rKqxU_Nag2155521555euoutp02I
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:03:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190624150335euoutp023ee1b81a1dfee28d44785b8b590ac0ae~rKqxU_Nag2155521555euoutp02I
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190624150334eucas1p132fa34b63af3ea4044a94643ee251a46~rKqwqktSe0902209022eucas1p1O;
 Mon, 24 Jun 2019 15:03:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CC.97.04325.646E01D5; Mon, 24
 Jun 2019 16:03:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190624150333eucas1p1ccc9310b2d018948c7c6185087bdebd6~rKqvuhq1d1097710977eucas1p18;
 Mon, 24 Jun 2019 15:03:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190624150333eusmtrp24cf115b5b5b4274179d824f3eaea9010~rKqvgZcTw1169511695eusmtrp2e;
 Mon, 24 Jun 2019 15:03:33 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-5a-5d10e6469899
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0A.47.04146.546E01D5; Mon, 24
 Jun 2019 16:03:33 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190624150332eusmtip11a9f4cd4c213020104b8a72b63886e0c~rKquxfSIg2618826188eusmtip1O;
 Mon, 24 Jun 2019 15:03:32 +0000 (GMT)
Subject: Re: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
To: Jonas Karlman <jonas@kwiboo.se>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <baf95e6b-bfcf-27e7-1a00-ca877ae6f82d@samsung.com>
Date: Mon, 24 Jun 2019 17:03:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR03MB4206740285A775280063E303AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUgUYRjG+3Zmd2cX18bV2BcVo4GIArUTxgNJLBmzwIqgA8mtJjV1jR3P
 pBLUUssyS7I1VztEK00zrWxDZZU2j8oOK/MPrxK8Ulo1xWNzdoz87/c97/E9z8dHYMqvYkci
 XBPDajXqSEoix5+9nnnn6j9ABm/MvepMf54ck9CWvmExXZBzlu74M4jRzSMdOD1zsVpEZ1y7
 L6U/vbwtoXsG6xFtvHKEnjG+F9EVqe7bbZixb2lSRl+WxFT2PRIz+em3xMyb7I8ipvuSScTM
 6+pxpiHrOs48/6LHGHOVS5D8sNz7BBsZHsdq3X1C5GH9Xfew041kgqXFgJLRsCITyQggt4K5
 ohDnWUmWIkj/eSATyRd5AkFu3WUkHMwICj6nSTMRYZ0oqo4V9BIEWSU6qXAYRVCe0obxq+xJ
 f3jysFjKswOpgcJ5vZUxMhuHB1O7eZaQ62H+aaeEZwXpA8O/eq2Mk2sha95o7V9FHoSJ2iok
 9NhB860fVqsyMhi6M7LEws7VkFKTjwmsgu8/CkW8ISBnpKArv4sLOXdA6eNUJLA9DJmqpQI7
 g6WWH+D5PHSXpmLCcDqCmspaTCh4QaPpg5iPjy26rnjpLsi+8MHQv/QqtvBt1E7wYAs5z25i
 gqyA9AtKoXsNdL+tWVqoguL2SUk2onTLkumWpdEtS6P7f28Rwh8iFRvLRYWy3BYNG+/GqaO4
 WE2o2/HoqCq0+N1aF0yTL1Dd3DEjIglE2SiKmshgpVgdxyVGGREQGOWgKFYvSooT6sQzrDb6
 qDY2kuWMyInAKZUiaUXPESUZqo5hI1j2NKv9VxURMsdk5BlY/z1hz/5tEr8Ql70d06555/rq
 Fk62ebRqWp7k1vTnD8cPHBi1jBiGUntLZGNeC0QMZXEN8psL7Ly869Q7/NV0e8Eotdlj3MNz
 H0Q4deXdSLlTODueETAyZY6WxTRQqp3cykO9k271+rIgg/dFk8O632UQ0FuV622c9S1q0lM4
 F6betAHTcuq/1eAPEWoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsVy+t/xu7quzwRiDfbvkrS48vU9m8X/R69Z
 LeZOqrW4+v0ls8XJN1dZLH62b2Gy6Jy4hN3i8q45bBYPXu5ntDjUF23x89B5Jov1LfoOPB7v
 b7Sye8xbU+2x4dFqVo/ZHTNZPU5MuMTkcb/7OJPH31n7WTwO9E5m8dh+bR6zx+dNcgFcUXo2
 RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZj28vZi44
 LFDx/9RuxgbG17xdjBwcEgImEgu2lHYxcnEICSxllFi0ZiNrFyMnUFxcYvf8t8wQtrDEn2td
 bBBFrxklrmxeDFYkLOAmsXHVUnYQW0QgT2LW7TlgRcwCE1gk9u19wgaSEBJoZpL489MexGYT
 0JT4u/kmWJxXwE7i9buHYDaLgKpE799DYINEBSIkZu9qYIGoEZQ4OfMJmM0pECtxv7MXbDGz
 gLrEn3mXmCFseYnmrbOhbHGJW0/mM01gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCv
 ODG3uDQvXS85P3cTIzCitx37uXkH46WNwYcYBTgYlXh4FxwRiBViTSwrrsw9xCjBwawkwrs0
 ESjEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cBkk1cSb2hqaG5haWhubG5sZqEkztshcDBG
 SCA9sSQ1OzW1ILUIpo+Jg1OqgVE+7+6r7TteWLG0np/FkH+5wUyCLfbvtNrfC61v8QUv6/eX
 YPik5Oq3v2Fa8GJmgzWKU84bq4gdkHIL+Vb0MFNn7WTvONkDFyy1S03LVnh/ap1bdUNDdOkj
 nWXZZq+8P8/gDNjqPif3/On3DqoLvWObJdymx9ev2TLB12fJdft7h7rc403eWCmxFGckGmox
 FxUnAgAXHjmx/gIAAA==
X-CMS-MailID: 20190624150333eucas1p1ccc9310b2d018948c7c6185087bdebd6
X-Msg-Generator: CA
X-RootMTR: 20190526212047epcas3p10101ea244192dd106f55002bb66d79b0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190526212047epcas3p10101ea244192dd106f55002bb66d79b0
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <CGME20190526212047epcas3p10101ea244192dd106f55002bb66d79b0@epcas3p1.samsung.com>
 <VI1PR03MB4206740285A775280063E303AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561388615;
 bh=2+pLevGrACjiUH04K+YKyfHiLgCyj4l8NbaFNMUoUWM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=TNri982ph4RzHQGwnQMJvuX8PoXmhjTN3i61wAmVJGR9TDgmqrtRW1kcfUwJ7Nhsg
 QhBxXKdyIaufSIjfUMNWdvZP+mgSZ7L2bB9XylWFzg1SY7B8B38vf/FvKDd1UA1wpg
 Rs0HMTthRLMr/X2gUTWVPUWYxqGekbCD80YWcQCs=
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYuMDUuMjAxOSAyMzoyMCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBUaGlzIHBhdGNoIGVu
YWJsZXMgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBvbiBINi4KPgo+IENj
OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBKZXJuZWog
U2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4gU2lnbmVkLW9mZi1ieTogSm9uYXMg
S2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuOGlfZHdfaGRtaS5jIHwgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdf
aGRtaS5oIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmMKPiBpbmRleCAzOWQ4NTA5ZDk2YTAuLmI4MDE2
NGRkOGFkOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRt
aS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+IEBAIC0x
ODksNiArMTg5LDcgQEAgc3RhdGljIGludCBzdW44aV9kd19oZG1pX2JpbmQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gIAlzdW44aV9oZG1pX3BoeV9pbml0KGhk
bWktPnBoeSk7Cj4gIAo+ICAJcGxhdF9kYXRhLT5tb2RlX3ZhbGlkID0gaGRtaS0+cXVpcmtzLT5t
b2RlX3ZhbGlkOwo+ICsJcGxhdF9kYXRhLT5kcm1faW5mb2ZyYW1lID0gaGRtaS0+cXVpcmtzLT5k
cm1faW5mb2ZyYW1lOwo+ICAJc3VuOGlfaGRtaV9waHlfc2V0X29wcyhoZG1pLT5waHksIHBsYXRf
ZGF0YSk7Cj4gIAo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaGRtaSk7Cj4gQEAgLTI1
NSw2ICsyNTYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bjhpX2R3X2hkbWlfcXVpcmtzIHN1
bjhpX2E4M3RfcXVpcmtzID0gewo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW44aV9kd19o
ZG1pX3F1aXJrcyBzdW41MGlfaDZfcXVpcmtzID0gewo+ICAJLm1vZGVfdmFsaWQgPSBzdW44aV9k
d19oZG1pX21vZGVfdmFsaWRfaDYsCj4gKwkuZHJtX2luZm9mcmFtZSA9IHRydWUsCj4gIH07Cj4g
IAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdW44aV9kd19oZG1pX2R0X2lk
c1tdID0gewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRt
aS5oIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+IGluZGV4IDcyMGM1
YWE4YWRjMS4uMmEwZWMwOGVlMjM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW44aV9kd19oZG1pLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdf
aGRtaS5oCj4gQEAgLTE3OCw2ICsxNzgsNyBAQCBzdHJ1Y3Qgc3VuOGlfZHdfaGRtaV9xdWlya3Mg
ewo+ICAJZW51bSBkcm1fbW9kZV9zdGF0dXMgKCptb2RlX3ZhbGlkKShzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yLAo+ICAJCQkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlKTsKPiAgCXVuc2lnbmVkIGludCBzZXRfcmF0ZSA6IDE7Cj4gKwl1bnNpZ25lZCBpbnQg
ZHJtX2luZm9mcmFtZSA6IDE7CgoKQWdhaW4sIGRybV9pbmZvZnJhbWUgc3VnZ2VzdHMgaXQgY29u
dGFpbnMgaW5mb3JmcmFtZSwgYnV0IGluIGZhY3QgaXQKanVzdCBpbmZvcm1zIGluZm9mcmFtZSBj
YW4gYmUgdXNlZCwgc28gYWdhaW4gbXkgc3VnZ2VzdGlvbgp1c2VfZHJtX2luZm9mcmFtZS4KCk1v
cmVvdmVyIGJvb2wgdHlwZSBzZWVtcyBtb3JlIGFwcHJvcHJpYXRlIGhlcmUuCgpCZXNpZGUgdGhp
czoKClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKwqAt
LQpSZWdhcmRzCkFuZHJ6ZWoKCgo+ICB9Owo+ICAKPiAgc3RydWN0IHN1bjhpX2R3X2hkbWkgewoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
