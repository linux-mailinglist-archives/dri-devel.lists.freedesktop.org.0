Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0F41ED4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 10:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942BE893CB;
	Wed, 12 Jun 2019 08:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0991D893CB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:16:42 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190612081640euoutp01930ca63d2a83e8cb01dfada23e28814c~nZYD7N4D02894328943euoutp01C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:16:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190612081640euoutp01930ca63d2a83e8cb01dfada23e28814c~nZYD7N4D02894328943euoutp01C
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190612081639eucas1p13c5abc807f9673acb6e5e6bcb9e0a729~nZYDQXeWy0358603586eucas1p1s;
 Wed, 12 Jun 2019 08:16:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 76.23.04377.7E4B00D5; Wed, 12
 Jun 2019 09:16:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190612081639eucas1p142d77338598e9f08936f2cd7cd789ec5~nZYChiO7s0358603586eucas1p1r;
 Wed, 12 Jun 2019 08:16:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190612081638eusmtrp163fe6b8fce83e69a682fce03661d98e8~nZYCSimvv0940709407eusmtrp1D;
 Wed, 12 Jun 2019 08:16:38 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-c2-5d00b4e7dccc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 54.CD.04140.6E4B00D5; Wed, 12
 Jun 2019 09:16:38 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190612081638eusmtip29b466797963a373670843704ae62f10e~nZYBjrKm01710717107eusmtip2i;
 Wed, 12 Jun 2019 08:16:37 +0000 (GMT)
Subject: Re: [PATCH v2 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
To: Torsten Duwe <duwe@lst.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean
 Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald
 Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <354de37d-57bb-6b06-c81a-a2081ea4f222@samsung.com>
Date: Wed, 12 Jun 2019 10:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604122305.07B9068B05@newverein.lst.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0iTYRj1/W77lGbvZuWDJdXKHxlpRcEbWST140O6WNGFTGrlh0rbik3t
 TnaxvFKaYc40UyOxhTYvy3VXaZk5s+xiUa6yOxalCQtzOb9J/jvnPOd5n3Pg5WllIRfAx+sS
 RL1OrVFxPkzdPWfbrE81XtGzL9+YQrLszRRJufcREVddNk3ON9lZ0vH7B0f6Ox5Q5GhpJUdq
 rK0s6b3whiJp2WUyYn7/jCVPrOc4cvF5O0UcX24jknKzSUZeV7UiUm0+QxOntYghzoY2aomf
 UOocpARTkQkJRab9wofGbzKhILmdEareXWaFm/3FjFBvfD2kpeazgrkijRO+2+0ywdLvYIXb
 hSaZ0JVho4TqskPC9c5kLlKxyScsRtTEJ4n60MVbfeIcV0uoXXfH7znsLGKTkQunI28e8Dxw
 lvyk0pEPr8TlCJpKXUgifQgGMjM8pBeB69cHemQl/e4Xz8olBPnNaZxEehBkPWxBbpcfXg2X
 mh/K3INxuJGB3JMPWDehcQqC4upexu3i8Az4W93JubEcLwbTjyvDOoODoOD+s2F9PN4IffVm
 JHkU0JzfPeTheW+8AJ6+i3fLNJ4Mlp5ztIT94WX3eUqK+oKH2s+hEl4GFw5f9+h+8NVWI5Pw
 JGg5nclI+BB0lR+j3TkBpyKorar3dF4IjbZ21n2XHspcafW8GQ6vjj4dlgH7wosehRTBF3Lq
 8mhJlkPqcaXkngpdrbWeB/3h4qPf3CmkMo7qZRxVxjiqjPH/3WLEVCB/MdGgjRUNc3Xi7hCD
 WmtI1MWGbN+pNaOhT9syaOu7hqwD2xoQ5pFqjPxOnmuzklUnGfZqGxDwtGqcfO4Or2ilPEa9
 d5+o37lFn6gRDQ1oIs+o/OX7vRxRShyrThB3iOIuUT8ypXjvgGTEz1oYsihMV1VesZw6lbQ8
 qjIwMxfHjO1ozOl20XGbEsM73h4ZiJy/0vKnUNFtiyh5daJpzczggNC3RxzR675Pt6YGzvDK
 nR3U+mTJHkuepfjs2qUHxQ1lN/hV2LjlsSai62WJvS0jWHFrdVZdUEqU5vOB6WGftCvWTHCt
 T28rLcuZpmIMceo5wbTeoP4H7/wXZbADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHfc9tR3N22rS9CGGMwhI6tpn5LtSiqA4ZZfSh8oId9ORE52pn
 WhbhVIRcBu1DVLPmncAWmVqWUuYUTfOSZZZdzEqDISpRSQPTNlfgtx//5/d/4IGHxmX1ZDCd
 kW0UDNl8lpLyI54vdI9t+tbkk7x54SeLLg30YKi46xtAiw8sOCrvHCDR8K9ZCs0N92KoqPou
 hZpa+kn0o3IMQyWWGglq+DpColctNyhU+2YIQ+PONoCKH3dK0Mf6foAaG67gyNViI5DLMYjt
 kHPVrgWMs9vsgLPZz3GTHVMSrsw0RHD1X26T3OO5CoJ7ZP3ozi5cJ7mGuhKKmxkYkHDNc+Mk
 13bTLuE+XezGuMaafK511ETFr0pgow36HKOwVqsXjTHKRBVSsyoNYtVbNKwqIip5mzpSGR4b
 nSZkZeQKhvDY46x2/F4VdrI96EyBy0aawCJjBr40ZLZAc7sTMwM/WsbUAlhY30V6BwrYWj6N
 e1kO50fMlFeacks225IkZw7BWz19Es8gkOkmoHn22tIqnCkGcL7UKfFYMqYVwNHfcg9TzEb4
 p3GU8rCUiYX22TuEhwlmPSx7NrKUBzFHYVmLifA6q2DP9Qk307Qvo4Gvv2R4YpwJhfO2l7iX
 Q2Dz9I1/rIDvJsqxy0BmXda2LqtYl1WsyyoVgKgDgUKOqEvXiWpW5HViTnY6m6rXNQD3tzzo
 cjU9BOaZww7A0EDpL316dTFJRvK5Yp7OASCNKwOl6kyfZJk0jc87Kxj0KYacLEF0gEj3bRY8
 OChV7/69bGOKKlIVhTSqqIioiK1IqZBeYNqTZEw6bxQyBeGkYPjfw2jfYBNA06OJhvgD6vt3
 via0rwwrUCjWvE1zZn439xXGTuvlyvNxbMJqq84nxLz9YBEfohFPmfYeLn7fu1Pe2vFi39bq
 ibix0tAT+9bdjrF8lj+5ix1TTxY5pTv4Pb2stk4+6O93xLHhTfjusfDodysWayabqq4EnNr/
 odKxK+CQ4J9/2qIkRC2vCsMNIv8X4rr5UkMDAAA=
X-CMS-MailID: 20190612081639eucas1p142d77338598e9f08936f2cd7cd789ec5
X-Msg-Generator: CA
X-RootMTR: 20190604122333epcas2p2f2c750e19a363901c83abb83354f55d4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190604122333epcas2p2f2c750e19a363901c83abb83354f55d4
References: <20190604122150.29D6468B05@newverein.lst.de>
 <CGME20190604122333epcas2p2f2c750e19a363901c83abb83354f55d4@epcas2p2.samsung.com>
 <20190604122305.07B9068B05@newverein.lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560327400;
 bh=PWdb377o0rER7E11sck9S6AwPDJeCROTCX+Ce5iaBhg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=rqqV6hwRtsZr3pMKSHZLKMOzb69tEi2HDVq0T/SileIHlwTTeaxoILHgNsK5t5AhC
 sPh25ynt/cAcLHl6zwbf/5kN1PeO8jQxODkA4GoDejvKd7FSwyVBaWvy/m0vU7R0aS
 SJLwbFDpH5BWS4xFjZIIk4aaRjmC4ah/kRGzuqms=
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQuMDYuMjAxOSAxNDoyMywgVG9yc3RlbiBEdXdlIHdyb3RlOgo+IFRoZSBhbng2MzQ1IGlz
IGFuIHVsdHJhLWxvdyBwb3dlciBEaXNwbGF5UG9ydC9lRFAgdHJhbnNtaXR0ZXIgZGVzaWduZWQK
PiBmb3IgcG9ydGFibGUgZGV2aWNlcy4KPgo+IEFkZCBhIGJpbmRpbmcgZG9jdW1lbnQgZm9yIGl0
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgo+IFNp
Z25lZC1vZmYtYnk6IFZhc2lseSBLaG9ydXpoaWNrIDxhbmFyc291bEBnbWFpbC5jb20+Cj4gUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTog
VG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS50eHQgfCA1NyArKysrKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvYW54NjM0NS50eHQKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS50eHQKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYmQ2M2Y2YWMxMDdlCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9hbng2MzQ1LnR4dAo+IEBAIC0wLDAgKzEsNTcgQEAKPiArQW5hbG9naXggQU5YNjM0NSBl
RFAgVHJhbnNtaXR0ZXIKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4g
K1RoZSBBTlg2MzQ1IGlzIGFuIHVsdHJhLWxvdyBwb3dlciBGdWxsLUhEIGVEUCB0cmFuc21pdHRl
ciBkZXNpZ25lZCBmb3IKPiArcG9ydGFibGUgZGV2aWNlcy4KPiArCj4gK1JlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4gKwo+ICsgLSBjb21wYXRpYmxlCQk6ICJhbmFsb2dpeCxhbng2MzQ1Igo+ICsgLSBy
ZWcJCQk6IEkyQyBhZGRyZXNzIG9mIHRoZSBkZXZpY2UKPiArIC0gcmVzZXQtZ3Bpb3MJCTogV2hp
Y2ggR1BJTyB0byB1c2UgZm9yIHJlc2V0CgoKWW91IGhhdmUgbm90IHNwZWNpZmllZCBpdCdzIGFj
dGl2ZSBzdGF0ZSwgc2luY2UgaW4gZHJpdmVyJ3MgY29kZSB5b3UKbmFtZWQgaXQgUkVTRVROIEkg
Z3Vlc3MgaXQgc2hvdWxkIGJlIGFjdGl2ZSBsb3cuCgoKPiArIC0gZHZkZDEyLXN1cHBseQk6IFJl
Z3VsYXRvciBmb3IgMS4yViBkaWdpdGFsIGNvcmUgcG93ZXIuCj4gKyAtIGR2ZGQyNS1zdXBwbHkJ
OiBSZWd1bGF0b3IgZm9yIDIuNVYgZGlnaXRhbCBjb3JlIHBvd2VyLgo+ICsgLSBWaWRlbyBwb3J0
IGZvciBMVlRUTCBpbnB1dCwgdXNpbmcgdGhlIERUIGJpbmRpbmdzIGRlZmluZWQgaW4gWzFdLgoK
ClBsZWFzZSBhc3NpZ24gcG9ydCBudW1iZXIgZm9yIGlucHV0IChJIGd1ZXNzIDApLgoKCj4gKwo+
ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICsKPiArIC0gVmlkZW8gcG9ydCBmb3IgZURQIG91dHB1
dCAocGFuZWwgb3IgY29ubmVjdG9yKSB1c2luZyB0aGUgRFQgYmluZGluZ3MKPiArICAgZGVmaW5l
ZCBpbiBbMV0uCgoKU2hvdWxkbid0IGl0IGJlIGFsc28gcmVxdWlyZWQ/CgoKUmVnYXJkcwoKQW5k
cnplagoKCj4gKwo+ICtbMV06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS92aWRlby1pbnRlcmZhY2VzLnR4dAo+ICsKPiArRXhhbXBsZToKPiArCj4gK2FueDYzNDU6IGFu
eDYzNDVAMzggewo+ICsJY29tcGF0aWJsZSA9ICJhbmFsb2dpeCxhbng2MzQ1IjsKPiArCXJlZyA9
IDwweDM4PjsKPiArCXJlc2V0LWdwaW9zID0gPCZwaW8gMyAyNCBHUElPX0FDVElWRV9MT1c+OyAv
KiBQRDI0ICovCj4gKwlkdmRkMjUtc3VwcGx5ID0gPCZyZWdfZGxkbzI+Owo+ICsJZHZkZDEyLXN1
cHBseSA9IDwmcmVnX2ZsZG8xPjsKPiArCj4gKwlwb3J0cyB7Cj4gKwkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4gKwkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsJCWFueDYzNDVfaW46IHBvcnRA
MCB7Cj4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
PiArCQkJcmVnID0gPDA+Owo+ICsJCQlhbng2MzQ1X2luX3Rjb24wOiBlbmRwb2ludEAwIHsKPiAr
CQkJCXJlZyA9IDwwPjsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGNvbjBfb3V0X2FueDYz
NDU+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwo+ICsJCWFueDYzNDVfb3V0OiBwb3J0QDEgewo+ICsJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwkJCXJl
ZyA9IDwxPjsKPiArCj4gKwkJCWFueDYzNDVfb3V0X3BhbmVsOiBlbmRwb2ludEAwIHsKPiArCQkJ
CXJlZyA9IDwwPjsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW5fZWRwPjsKPiAr
CQkJfTsKPiArCQl9Owo+ICsJfTsKPiArfTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
