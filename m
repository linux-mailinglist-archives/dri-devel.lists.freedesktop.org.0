Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24608B363F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 10:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1BF6E87D;
	Mon, 16 Sep 2019 08:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805C66E87D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 08:14:04 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190916081402euoutp02869bdf8a32661a2034d82fb1c0f9b38a~E3RLA5ed71197311973euoutp02d
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 08:14:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190916081402euoutp02869bdf8a32661a2034d82fb1c0f9b38a~E3RLA5ed71197311973euoutp02d
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190916081401eucas1p13fe025e6e0b8694f4756a952364ffb81~E3RKLodI91353413534eucas1p1S;
 Mon, 16 Sep 2019 08:14:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 01.CB.04469.9444F7D5; Mon, 16
 Sep 2019 09:14:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190916081401eucas1p2df3fb141562109b5ab03c9b2a202c8d4~E3RJXoxzS2893928939eucas1p2c;
 Mon, 16 Sep 2019 08:14:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190916081400eusmtrp29ea4a2bdc243f57c295eeadc475586db~E3RJJM2Nu2860128601eusmtrp2l;
 Mon, 16 Sep 2019 08:14:00 +0000 (GMT)
X-AuditID: cbfec7f2-994db9c000001175-c0-5d7f4449f450
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 36.A5.04117.8444F7D5; Mon, 16
 Sep 2019 09:14:00 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190916081359eusmtip23f382bca99376ac62914202d4bdb2951~E3RITpPYF3138731387eusmtip28;
 Mon, 16 Sep 2019 08:13:59 +0000 (GMT)
Subject: Re: [PATCH 00/11] ARM: dts: qcom: msm8974: add support for external
 display
To: Brian Masney <masneyb@onstation.org>, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, agross@kernel.org, narmstrong@baylibre.com,
 robdclark@gmail.com, sean@poorly.run
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2da29e80-73fb-8620-532e-0b5f54b00841@samsung.com>
Date: Mon, 16 Sep 2019 10:13:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUzMcRzH+97vsbj27ar1WYy5sNg8jT++hjxvP8xmbJ5a4+in0uPupzwk
 tXEkKyKa6+Y8XEOrtKNTYeXEOdZNURKtto48lBYuGhW/+zH99/58Pq/39/t5f/flKY2FDeXj
 kvaI+iRdgpb1o22PBl0zVq3IjJp9yTiFuLp+0iTX5VSRp7WfaTJiy6eIud7FkBeePpaUvrYj
 YupuQKT5+weKOHuaaXI838KRgl9XVcTa1cKQ/NoGjjyvMbGk+GWjipws+sQQe14k6b70gyKG
 e/UcaT9Tj5YEC6UXSpHQ12rghKp2CxLuDVykhWpjOycUZZ9nBGvJcVZ4fKpJJbxpucsKtwc6
 GaHjhEMl3LRkCsWtgYKjpo0T6nLP0MJX64R1eKvfwmgxIS5N1M+K2O4Xm1fhZlKcQfsenWvj
 stAFnIN8ecDz4KGnR5WD/HgNvoagqvk6oxTfEPwwljEypcFfEdi71uYg3uuoaExRmKsIzJ/P
 skrRi6D82RMkGwLxRnA/v8/JOgiXI6gfXi1DFD5BQZ0t1ztg8TQYuvmKlbUaR0CP4bLXTOMp
 0DR0xcsE483wpfMBozAB4DzvpmXtixfA0FCRl6fwRLjda6IUHQJtbrM3D+D3PPS5LZwSdAWY
 X75iFB0IHx23/vbHw0i1bJB1JnRcO0Ip5mwElRXVlDJYAA8cjYycn/qz9Y2aWUp7KRgGTyPl
 WfyhtTdA2cEfTtsKKaWthuyjGoWeBB0NlX8PDIHiZx72FNIaRyUzjkpjHJXG+P/ei4guQSFi
 qpQYI0pzksS9MyVdopSaFDNzZ3KiFf35u0+HHV+qkKdphx1hHmnHqrMMh6I0jC5N2p9oR8BT
 2iD1puz0KI06Wrf/gKhP3qZPTRAlOxrH09oQdbpPZ6QGx+j2iPGimCLq/01VvG9oFqpdvjlv
 wsCdRd29JeaIwUVTY9veTV5csGFVxkhAwzFnRHS6KWz5Q+0yn+LD/S09/p7KMQ7X1Plvu8M7
 d7mCCsMPxm8LD7UjU3/a99kZhrj7dW+Z6uSw9bu3hJWvtvmY5pXVfRqOjDcHr5UaC82Xr/dn
 vPdd887K/iwon1u2cpNjZXualpZidXOmU3pJ9xuinIgKtwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXfO2Tlaq7ep+GJ0YRBh0Wxe2muZGPThFboIYuWNWnbQyjnb
 2SwLyi8D3XK57IJTvJQWmqRoFzVFXaM1TSEtS8tuji7ouhBZmaucFvjtx/P8fw888OcoaQsT
 xB3M0vHaLFWmTOxL9/52vFhHtp5KXf9mOAT3j/2icWG/U4R7Oz/S+M8tC4Ur7P0MfvTtkxjX
 P7MBXPauD+DH3z9Q2DnxmMYFlmoWn5u+KsJNY0MMtnT2sXiwrUyMa548FOEzpeMMtpmT8buq
 HxQ2dNhZPFpsBzEBpL68HpBPTw0saRmtBqRjspImrdZRlpTmlzCkqa5ATO4XDYjI86F2Mbk9
 +YohL00OEWmuPkVqnvoRR9sIS7oKi2nytWl5HEySR2k1eh2/MkMj6DbLkhU4VK6IxPLQ8Ei5
 IkyZujE0QhYSHXWAzzyYw2tDovfJM8yNLibb6X/s3oURNg+UQyPgOATDUePDbCPw4aSwBqAP
 b9VeRjAQ3alwU3Psh6aHjGIj8J3JjAM06S5hvQs/uAu5BrtZ78IfXgfoxRfzbIqCJgqZ+i+x
 c4oZoPPmAuBVxDAYeZqHxV6WwGg0Ybg0O6fhKjTguTx7NgDuQXdbrGAuswQ5S1y0l33gJuTx
 lM7OKbgaTZcPUHO8At12l/3jQDTiqhAVAal1nm6dp1jnKdZ5SiWg64A/rxfU6WohVC6o1II+
 K12eplE3gZnW3Lr380YLMH6MtwHIAdlCSZ7hZKqUUeUIuWobQBwl85fszj+RKpUcUOUe57Wa
 vVp9Ji/YQMTMcxYqKCBNM9PBLN1eRYRCiSMVyjBl2AYsC5Tkw+4UKUxX6fjDPJ/Na/97Is4n
 KA90LWIWxJyxm9uv9SkvVjm44kOdSTLJ2JEHPSjxXJppW0Pn0rOXk7fcTKnpiSWJXQufVy0w
 J+bufBAXq++tLR1wR+1PKDttWNYu+lwk9Zn6tj1h6n1crLt6MdOw6ErP8Nqco3c94fEXqnT6
 1tqGqEclzovasdzC7/bXMQ6Xel3w1A4ZLWSoFGsoraD6C6VaZdtLAwAA
X-CMS-MailID: 20190916081401eucas1p2df3fb141562109b5ab03c9b2a202c8d4
X-Msg-Generator: CA
X-RootMTR: 20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3
References: <CGME20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3@epcas3p4.samsung.com>
 <20190815004854.19860-1-masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568621642;
 bh=owkzwat6GBg23nSFlj4wgYY6tYKk4F6M9w00IZ1dGEI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=sprOwA7JYtVkzxRZCT9oShcuLB0jarL5d+s+TQffr5uJtdMEpDSJsuzaTjU6o4rz5
 qGwhO715v8EjDRbxLD46MI0gD1wXGQ2sUvxlp7th3/xRKM/lVfMLUbm1F4C8Mr24+N
 SQDKfK+DmFlt9RjbOtUpd/eqFK0T/jGbjjkf6ytE=
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

SGkgQnJpYW4sCgpPbiAxNS4wOC4yMDE5IDAyOjQ4LCBCcmlhbiBNYXNuZXkgd3JvdGU6Cj4gVGhp
cyBwYXRjaCBzZXJpZXMgYmVnaW5zIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgZXh0ZXJuYWwgZGlz
cGxheSBvdmVyCj4gSERNSSB0aGF0IGlzIHN1cHBvcnRlZCBvbiBtc204OTc0IFNvQ3MuIEknbSB0
ZXN0aW5nIHRoaXMgc2VyaWVzIG9uIHRoZQo+IE5leHVzIDUsIGFuZCBJJ20gYWJsZSB0byBjb21t
dW5pY2F0ZSB3aXRoIHRoZSBIRE1JIGJyaWRnZSB2aWEgdGhlCj4gYW5hbG9naXgtYW54Nzh4eCBk
cml2ZXIsIGhvd2V2ZXIgdGhlIGV4dGVybmFsIGRpc3BsYXkgaXMgbm90IHdvcmtpbmcKPiB5ZXQu
Cj4KPiBXaGVuIEkgcGx1ZyBpbiB0aGUgSERNSSBjYWJsZSwgdGhlIG1vbml0b3IgZGV0ZWN0cyB0
aGF0IGEgZGV2aWNlIGlzCj4gaG9va2VkIHVwLCBidXQgbm90aGluZyBpcyBzaG93biBvbiB0aGUg
ZXh0ZXJuYWwgbW9uaXRvci4gVGhlIGhvdCBwbHVnCj4gZGV0ZWN0IEdQSU8gKGhwZC1ncGlvcykg
b24gdGhlIGFuYWxvZ2l4LWFueDc4eHggYnJpZGdlIGFuZCBNU00gSERNSQo+IGRyaXZlcnMgZG8g
bm90IGNoYW5nZSBzdGF0ZSB3aGVuIHRoZSBzbGltcG9ydCBhZGFwdGVyIG9yIEhETUkgY2FibGUg
aXMKPiBwbHVnZ2VkIGluIG9yIHJlbW92ZWQuIEkgd29uZGVyIGlmIGEgcmVndWxhdG9yIGlzIG5v
dCBlbmFibGVkIHNvbWV3aGVyZT8KPiBJIGhhdmUgYSBjb21tZW50IGluIHBhdGNoIDEwIHJlZ2Fy
ZGluZyAnaHBkLWdkc2Mtc3VwcGx5JyB0aGF0IG1heQo+IHBvdGVudGlhbGx5IGJlIGFuIGlzc3Vl
Lgo+Cj4gSSdtIHN0aWxsIGRpZ2dpbmcgaW4gb24gdGhpcywgaG93ZXZlciBJJ2QgYXBwcmVjaWF0
ZSBhbnkgZmVlZGJhY2sgaWYKPiBhbnlvbmUgaGFzIHRpbWUuIE1vc3Qgb2YgdGhlc2UgcGF0Y2hl
cyBhcmUgcmVhZHkgbm93LCBzbyBJIG1hcmtlZCB0aGUKPiBvbmVzIHRoYXQgYXJlbid0IHJlYWR5
IHdpdGggJ1BBVENIIFJGQycuCj4KPiBJJ20gdXNpbmcgYW4gQW5hbG9naXggU2VtaWNvbmR1Y3Rv
ciBTUDYwMDEgU2xpbVBvcnQgTWljcm8tVVNCIHRvIDRLIEhETUkKPiBBZGFwdGVyIHRvIGNvbm5l
Y3QgbXkgcGhvbmUgdG8gYW4gZXh0ZXJuYWwgZGlzcGxheSB2aWEgYSBzdGFuZGFyZCBIRE1JCj4g
Y2FibGUuIFRoaXMgd29ya3MganVzdCBmaW5lIHdpdGggdGhlIGRvd25zdHJlYW0gTVNNIGtlcm5l
bCB1c2luZwo+IEFuZHJvaWQuCgoKVGhpcyBwYXRjaHNldCByaXNrcyB0byBiZSBmb3Jnb3R0ZW4u
IFRvIGF2b2lkIGl0LCBhdCBsZWFzdCBwYXJ0aWFsbHksIEkKY2FuIG1lcmdlIHBhdGNoZXMgMS01
LCBpcyBpdCBPSyBmb3IgeW91PwoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+Cj4gQnJpYW4gTWFzbmV5
ICgxMSk6Cj4gICBkdC1iaW5kaW5nczogZHJtL2JyaWRnZTogYW5hbG9naXgtYW54Nzh4eDogYWRk
IG5ldyB2YXJpYW50cwo+ICAgZHJtL2JyaWRnZTogYW5hbG9naXgtYW54Nzh4eDogYWRkIG5ldyB2
YXJpYW50cwo+ICAgZHJtL2JyaWRnZTogYW5hbG9naXgtYW54Nzh4eDogc2lsZW5jZSAtRVBST0JF
X0RFRkVSIHdhcm5pbmdzCj4gICBkcm0vYnJpZGdlOiBhbmFsb2dpeC1hbng3OHh4OiBjb252ZXJ0
IHRvIGkyY19uZXdfZHVtbXlfZGV2aWNlCj4gICBkcm0vYnJpZGdlOiBhbmFsb2dpeC1hbng3OHh4
OiBjb3JyZWN0IHZhbHVlIG9mIFRYX1AwCj4gICBkcm0vYnJpZGdlOiBhbmFsb2dpeC1hbng3OHh4
OiBhZGQgc3VwcG9ydCBmb3IgYXZkZDMzIHJlZ3VsYXRvcgo+ICAgQVJNOiBxY29tX2RlZmNvbmZp
ZzogYWRkIENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzhYWAo+ICAgZHJtL21zbS9oZG1pOiBzaWxl
bmNlIC1FUFJPQkVfREVGRVIgd2FybmluZwo+ICAgQVJNOiBkdHM6IHFjb206IHBtODk0MTogYWRk
IDV2czIgcmVndWxhdG9yIG5vZGUKPiAgIEFSTTogZHRzOiBxY29tOiBtc204OTc0OiBhZGQgSERN
SSBub2Rlcwo+ICAgQVJNOiBkdHM6IHFjb206IG1zbTg5NzQtaGFtbWVyaGVhZDogYWRkIHN1cHBv
cnQgZm9yIGV4dGVybmFsIGRpc3BsYXkKPgo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
YW54NzgxNC50eHQgICAgICAgfCAgIDYgKy0KPiAgLi4uL3Fjb20tbXNtODk3NC1sZ2UtbmV4dXM1
LWhhbW1lcmhlYWQuZHRzICAgIHwgMTQwICsrKysrKysrKysrKysrKysrKwo+ICBhcmNoL2FybS9i
b290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSAgICAgICAgICAgfCAgODAgKysrKysrKysrKwo+ICBh
cmNoL2FybS9ib290L2R0cy9xY29tLXBtODk0MS5kdHNpICAgICAgICAgICAgfCAgMTAgKysKPiAg
YXJjaC9hcm0vY29uZmlncy9xY29tX2RlZmNvbmZpZyAgICAgICAgICAgICAgIHwgICAxICsKPiAg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMgICAgIHwgIDYwICsrKysr
KystCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5oICAgICB8ICAg
MiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9waHkuYyAgICAgICAgICAgfCAg
IDggKy0KPiAgOCBmaWxlcyBjaGFuZ2VkLCAyOTUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
