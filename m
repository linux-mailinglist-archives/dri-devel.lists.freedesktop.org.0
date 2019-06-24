Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3465179D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B3F89CAA;
	Mon, 24 Jun 2019 15:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A17789CAA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:49:55 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190624154953euoutp02958f3937a068715aa010b9855ebf2cbd~rLTM6-n7n1139111391euoutp02r
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:49:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190624154953euoutp02958f3937a068715aa010b9855ebf2cbd~rLTM6-n7n1139111391euoutp02r
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190624154952eucas1p25efcc84f1a486311863e4536eaf35a7c~rLTMC7YZz0417304173eucas1p2G;
 Mon, 24 Jun 2019 15:49:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B7.7F.04298.021F01D5; Mon, 24
 Jun 2019 16:49:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190624154952eucas1p28845763ad33d6c964169c257cfbeff3b~rLTLUOHsJ2657526575eucas1p2d;
 Mon, 24 Jun 2019 15:49:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190624154952eusmtrp1a3dbb974ea0ec250a82fe9bf893166b1~rLTLTnzD51668516685eusmtrp1I;
 Mon, 24 Jun 2019 15:49:52 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-6a-5d10f120d3d7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 77.D5.04140.021F01D5; Mon, 24
 Jun 2019 16:49:52 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190624154951eusmtip1a6ffc41fbe83da95dfa119fdf481022d~rLTKxuLsE2387023870eusmtip1u;
 Mon, 24 Jun 2019 15:49:51 +0000 (GMT)
Subject: Re: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <3f9e51d5-8ca5-a439-943c-26de92dd52fe@samsung.com>
Date: Mon, 24 Jun 2019 17:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6819050.kFKQ8T6p8H@jernej-laptop>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBKsWRmVeSWpSXmKPExsWy7djPc7oKHwViDQ7uV7O48vU9m8X/R69Z
 LeZOqrW4+v0ls8XJN1dZLH62b2Gy6Jy4hN3i8q45bBYPXu5ntDjUF23x89B5Jov1LfoOPB7v
 b7Sye8xbU+2x4dFqVo/ZHTNZPU5MuMTkcb/7OJPH31n7WTwO9E5m8dh+bR6zx+dNcgFcUVw2
 Kak5mWWpRfp2CVwZCx9eYSlYJVrxa5p2A+NOwS5GTg4JAROJg+8+s4HYQgIrGCXm307sYuQC
 sr8wSrzZ9ZYJwvnMKHH+7z8mmI57R7YwQySWM0osudnMAuG8ZZS4sqmbHaRKWMBNYuOqpWC2
 iICtxPdJc8CKmAWOskic2biXFSTBJqAp8XfzTbDlvAJ2Ek9Xv2IBsVkEVCX+7WtnBLFFBSIk
 vuzcxAhRIyhxcuYTsBpOAX2JH+dnMoPYzALyEs1bZ0PZ4hK3nswHu1tC4Cu7xOsJT1kg7naR
 mLZrIZQtLPHq+BZ2CFtG4vTkHqh4vcT9FS3MEM0djBJbN+xkhkhYSxw+fhHoag6gDZoS63fp
 Q4QdJVr+n2QCCUsI8EnceCsIcQOfxKRt05khwrwSHW1CENWKEvfPboUaKC6x9MJXtgmMSrOQ
 fDYLyTezkHwzC2HvAkaWVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIHp7fS/4592MH69
 lHSIUYCDUYmHd8ERgVgh1sSy4srcQ4wSHMxKIrxLE4FCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
 easZHkQLCaQnlqRmp6YWpBbBZJk4OKUaGNevfuVaOKHvzMumuWZ1cyxa9l4OsP4g9Dggh0v0
 92ensIMhBf6PnNnWfDupwDRbbYW0j5zD6sRI/c82HO2rt+peD5k0//r/ew+LhGqZF+5ZG/FN
 lmeL8UV7wy0LmI5GtraqzS5ya65tCldLu7NDbOVGv4tRxjO+vGzX90u5UpeymCvtgFCvsRJL
 cUaioRZzUXEiAKcrr8BrAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsVy+t/xu7oKHwViDba3s1hc+fqezeL/o9es
 FnMn1Vpc/f6S2eLkm6ssFj/btzBZdE5cwm5xedccNosHL/czWhzqi7b4eeg8k8X6Fn0HHo/3
 N1rZPeatqfbY8Gg1q8fsjpmsHicmXGLyuN99nMnj76z9LB4HeiezeGy/No/Z4/MmuQCuKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MhQ+vsBSs
 Eq34NU27gXGnYBcjJ4eEgInEvSNbmLsYuTiEBJYySuyYu5MJIiEusXv+W2YIW1jiz7UuNoii
 14wSe9oOsoIkhAXcJDauWsoOYosI2Ep8nzSHBaSIWeA4i8SdE2+gxt5lkmjav54NpIpNQFPi
 7+abYDavgJ3E09WvWEBsFgFViX/72hlBbFGBCInZuxpYIGoEJU7OfAJmcwroS/w4PxPsJGYB
 dYk/8y5B2fISzVtnQ9niEreezGeawCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFi
 bnFpXrpecn7uJkZgTG879nPLDsaud8GHGAU4GJV4eBccEYgVYk0sK67MPcQowcGsJMK7NBEo
 xJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAdJNXEm9oamhuYWlobmxubGahJM7bIXAwRkgg
 PbEkNTs1tSC1CKaPiYNTqoGxc8bdjfEl+Vfnp/EaXZMyfjVPSqzceoVLVp6E/9ZHnXuNHln+
 EdGuvlHiHu83u9/cz2rOgdfhm87dOybyZrLW/rQ/KYaHawT21rm9V5fX+BhzqIidv6XOyJav
 eNPey9NvJN15fmfZhlTto5eusuUKJp7e89daKdfAKmvWJOaQze7Mx1baqP5VYinOSDTUYi4q
 TgQAE1zP+v8CAAA=
X-CMS-MailID: 20190624154952eucas1p28845763ad33d6c964169c257cfbeff3b
X-Msg-Generator: CA
X-RootMTR: 20190624150546epcas1p1da19043e13dd3604a546f7983fc089b9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624150546epcas1p1da19043e13dd3604a546f7983fc089b9
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <VI1PR03MB4206740285A775280063E303AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <baf95e6b-bfcf-27e7-1a00-ca877ae6f82d@samsung.com>
 <CGME20190624150546epcas1p1da19043e13dd3604a546f7983fc089b9@epcas1p1.samsung.com>
 <6819050.kFKQ8T6p8H@jernej-laptop>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561391393;
 bh=HorVpcJ3wRcGowxW+uhZShsnFi7Zo7uF0JvdeCNFwKI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=vNCRzsifSosG0nTKTPgrhWm8EXbW+KvcJh32M0Vx0S6xK+nohua+rHbNR4aQ6FPdO
 gF7h6mR6g9Bh+mapk8+nme0OIUZZ3YwtU8jX0GAumOOyymhWGLE/mZPlBDVNO930Pz
 kzQPk1b80OZlqPbxAKp7JMBlXVauP8eaxyvcRJCI=
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDYuMjAxOSAxNzowNSwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IERuZSBwb25lZGVs
amVrLCAyNC4ganVuaWogMjAxOSBvYiAxNzowMzozMSBDRVNUIGplIEFuZHJ6ZWogSGFqZGEgbmFw
aXNhbChhKToKPj4gT24gMjYuMDUuMjAxOSAyMzoyMCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPj4+
IFRoaXMgcGF0Y2ggZW5hYmxlcyBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgSW5mb0ZyYW1l
IG9uIEg2Lgo+Pj4KPj4+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgo+Pj4gQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KPj4+
IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPj4+IC0tLQo+
Pj4KPj4+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jIHwgMiArKwo+Pj4g
IGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmggfCAxICsKPj4+ICAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW44aV9kd19oZG1pLmMgaW5kZXggMzlkODUwOWQ5NmEwLi5iODAxNjRkZDhhZDgKPj4+IDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+Pj4gQEAgLTE4OSw2ICsx
ODksNyBAQCBzdGF0aWMgaW50IHN1bjhpX2R3X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4+PiBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsPiAKPj4+ICAJc3VuOGlfaGRtaV9waHlfaW5pdCho
ZG1pLT5waHkpOwo+Pj4gIAkKPj4+ICAJcGxhdF9kYXRhLT5tb2RlX3ZhbGlkID0gaGRtaS0+cXVp
cmtzLT5tb2RlX3ZhbGlkOwo+Pj4KPj4+ICsJcGxhdF9kYXRhLT5kcm1faW5mb2ZyYW1lID0gaGRt
aS0+cXVpcmtzLT5kcm1faW5mb2ZyYW1lOwo+Pj4KPj4+ICAJc3VuOGlfaGRtaV9waHlfc2V0X29w
cyhoZG1pLT5waHksIHBsYXRfZGF0YSk7Cj4+PiAgCQo+Pj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0
YShwZGV2LCBoZG1pKTsKPj4+Cj4+PiBAQCAtMjU1LDYgKzI1Niw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc3VuOGlfZHdfaGRtaV9xdWlya3MKPj4+IHN1bjhpX2E4M3RfcXVpcmtzID0gez4gCj4+
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW44aV9kd19oZG1pX3F1aXJrcyBzdW41MGlfaDZfcXVp
cmtzID0gewo+Pj4gIAo+Pj4gIAkubW9kZV92YWxpZCA9IHN1bjhpX2R3X2hkbWlfbW9kZV92YWxp
ZF9oNiwKPj4+Cj4+PiArCS5kcm1faW5mb2ZyYW1lID0gdHJ1ZSwKPj4+Cj4+PiAgfTsKPj4+ICAK
Pj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdW44aV9kd19oZG1pX2R0X2lk
c1tdID0gewo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlf
ZHdfaGRtaS5oCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmggaW5k
ZXggNzIwYzVhYThhZGMxLi4yYTBlYzA4ZWUyMzYKPj4+IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+Pj4gQEAgLTE3OCw2ICsxNzgsNyBAQCBzdHJ1Y3Qgc3Vu
OGlfZHdfaGRtaV9xdWlya3Mgewo+Pj4KPj4+ICAJZW51bSBkcm1fbW9kZV9zdGF0dXMgKCptb2Rl
X3ZhbGlkKShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAKPiAqY29ubmVjdG9yLAo+Pj4gIAkKPj4+ICAJ
CQkJCSAgIGNvbnN0IHN0cnVjdCAKPiBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsKPj4+ICAJCj4+
PiAgCXVuc2lnbmVkIGludCBzZXRfcmF0ZSA6IDE7Cj4+Pgo+Pj4gKwl1bnNpZ25lZCBpbnQgZHJt
X2luZm9mcmFtZSA6IDE7Cj4+IEFnYWluLCBkcm1faW5mb2ZyYW1lIHN1Z2dlc3RzIGl0IGNvbnRh
aW5zIGluZm9yZnJhbWUsIGJ1dCBpbiBmYWN0IGl0Cj4+IGp1c3QgaW5mb3JtcyBpbmZvZnJhbWUg
Y2FuIGJlIHVzZWQsIHNvIGFnYWluIG15IHN1Z2dlc3Rpb24KPj4gdXNlX2RybV9pbmZvZnJhbWUu
Cj4+Cj4+IE1vcmVvdmVyIGJvb2wgdHlwZSBzZWVtcyBtb3JlIGFwcHJvcHJpYXRlIGhlcmUuCj4g
Y2hlY2twYXRjaCB3aWxsIGdpdmUgd2FybmluZyBpZiBib29sIGlzIHVzZWQuCgoKVGhlbiBJIHdv
dWxkIHNheSAiZml4L2lnbm9yZSBjaGVja3BhdGNoIiA6KQoKQnV0IG1heWJlIHRoZXJlIGlzIGEg
cmVhc29uLgoKQW55d2F5IEkndmUgdGVzdGVkIGFuZCBJIGRvIG5vdCBzZWUgdGhlIHdhcm5pbmcs
IGNvdWxkIHlvdSBlbGFib3JhdGUgaXQuCgoKUmVnYXJkcwoKQW5kcnplagoKCgo+Cj4gQmVzdCBy
ZWdhcmRzLAo+IEplcm5lago+Cj4+IEJlc2lkZSB0aGlzOgo+Pgo+PiBSZXZpZXdlZC1ieTogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPj4KPj4gIC0tCj4+IFJlZ2FyZHMKPj4g
QW5kcnplago+Pgo+Pj4gIH07Cj4+PiAgCj4+PiAgc3RydWN0IHN1bjhpX2R3X2hkbWkgewo+Cj4K
Pgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
