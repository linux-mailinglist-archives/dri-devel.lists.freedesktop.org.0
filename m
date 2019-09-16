Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0EFB39E3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 14:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667426E92A;
	Mon, 16 Sep 2019 12:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D486E938
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 12:02:09 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190916120207euoutp02a2b5aaf89bd1cccd7eddb8072e632cda~E6YUOX-8Q1460314603euoutp02d
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 12:02:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190916120207euoutp02a2b5aaf89bd1cccd7eddb8072e632cda~E6YUOX-8Q1460314603euoutp02d
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190916120207eucas1p2417bf77dc4584a6536dabfd2bfd8961b~E6YTg6mkk0283702837eucas1p2N;
 Mon, 16 Sep 2019 12:02:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.8D.04309.EB97F7D5; Mon, 16
 Sep 2019 13:02:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190916120206eucas1p25ac70e0190fdc206b2e92591975b600c~E6YSul0wJ1276912769eucas1p2P;
 Mon, 16 Sep 2019 12:02:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190916120206eusmtrp224e9a01be52972f60c3a882630c355eb~E6YSgJa2W3011030110eusmtrp2q;
 Mon, 16 Sep 2019 12:02:06 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-56-5d7f79be971a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A7.93.04166.DB97F7D5; Mon, 16
 Sep 2019 13:02:06 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190916120205eusmtip1f2cee14a919a4e50c9f029deeb1c139a~E6YRsijjh0319203192eusmtip1g;
 Mon, 16 Sep 2019 12:02:05 +0000 (GMT)
Subject: Re: [PATCH 00/11] ARM: dts: qcom: msm8974: add support for external
 display
To: Brian Masney <masneyb@onstation.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <53f18b9f-ad23-563c-dc18-be71f3ec2c49@samsung.com>
Date: Mon, 16 Sep 2019 14:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916090150.GA349@onstation.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUzMcRzHfe/32M3Zr6vWR57W0VbMQ9bmu4VlHva1GTbzMNY4+i1Rh/sp
 wpRxVB66ilnX5dQ6hTNE5VpPruZqKSU90spkRWKT0ES6fpn+e33e7/fn+/l8ti9Pqa2sDx+h
 OyrqddpIDaukC58Nv1hYFhsXuuRHbxCuf/eLxpfraxS4tvwzjUcLUyhsqapn8KuhLyy2vXYg
 bO6tQ7j5xwcK13xqpnFiSg6Hr47kKnD+uxYGp5TXcbip2Mxia2ujAidn9DPYcWUX7s36SWFD
 aRWHO9OqUIgXsd2wIfKlzcCRJ505iJR+v0kTu6mTIxkJ6QzJv5PIkmrjSwV501LCkqLv3Qzp
 uuhUkEc5ccTa5kGcxR0cqbicRpPB/NmbhZ3K5WFiZESMqF+8co9yf+ZQGXW4QnX8rHN1PHql
 TEJuPAhBYM+0oCSk5NVCHoKBhuesXHxDcGawlJGLQQTGht+Kfy3mxmecbOQiMKT3K+RiAEGR
 pYlypTyEbdDT9JRzsafgD0NZzeMhSkihIbnCSLsMVgiA34/aWRerhJVge581rtOCHwz22RkX
 ewk74Gt3JSNn3KEmvWc84yYEgvlpGnIxJcyBogEzJbM3dPRYxoeB0M3D8MXSib3XQM3tMk5m
 D/jofDzBM2HUbpnIxEFX3jlKbk5AUPDATslGMFQ6G8e24McmBMD94sWyvAoMw6nIJYMwDdoG
 3OUdpkFq4XVKllWQcF4tp32hq65g4kFvsDYMsUakMU26zDTpGtOka0z/595E9B3kLUZLUeGi
 tFQnHlskaaOkaF34on2HovLR2Oet/eP89gQVj+x1IIFHmqmqeMPpUDWjjZFioxwIeErjqdqe
 cDJUrQrTxp4Q9Yd266MjRcmBZvC0xlt1ckr3LrUQrj0qHhTFw6L+n6vg3Xzi0boVBXtDgkaN
 1RuWvbnw4G2RmHGwKjD7zCff1nWGTWHZTelvn6deqmwvvLF1Jgk5su+aV0jAa73/evZue+jG
 5JJYH9/pBxb0JdlOr4jpt4bNyvPU7SzI5ao99Q0m4pz68JZJsp6aF/PT6JXdei0xuG/ko19v
 BC6vLblnta313zI32Kihpf3awPmUXtL+BYA7zTu4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRiA+XbO2aY5+JyKX4IZi8yEpsfrp5lYEZ3qT1hkpGZHO6jkNtmZ
 kkkpiKSW5dB+OJeXdAWmhFpeunhZloloqWneVuaFslKJ8FKppVuB/5735Xk++OAVE9J6ykkc
 r9RwaiWbIBNak11rHaY9zSlpkZ753QD3TP4mcW5PpwB3tcyR+E+9lsAl7T0UfrswL8RVo0aA
 9Z/WvYGlGQJ3fhsgcba2QoQLVu4JcO3kIIW1Ld0i3P9YL8SGd70CfLPoK4WNN8Lxp7JlAmc+
 axdhU347CHFgqoqrADM/lCliGk0VgHm2WEoyTTqTiCnKKqSY2spsIfMqr0/AjA0+FTINi+MU
 8+Fah4Cpq0hjDEN2TMfjERHTmptPMj9qtx2HZ+RBalWShtsep+I1+2ThNPaS0wFY7uUTIKe9
 /SMDvXxlHsFB57mE+GRO7RF8Th53e6GZSGyVXMzoOJgO3lrnACsxgj5I3/tStMFSaACovnyv
 Ze+InpTMEha2QyuDOUKL8xWgzMaIDbaDp9BUf5u5tYduaKFsQJADrMUE1JLofvoD8yCFXwAy
 PcyiNiwh3I1W64bNL0lgMKqaLiM3mIQ70Y/PTWbHAZ5Gzxt1wOLYos7CKbNjBWmkb8s37wm4
 C60U9xEWdkENs/p/7IhGpkoEeUCq25TrNiW6TYluU1IKyEpgzyXxilgFT8t5VsEnKWPlMSpF
 LVi/mfqXP+saQV/NCSOAYiCzkaRnXomUUmwyn6IwAiQmZPaSsKzUSKnkPJtyiVOrotRJCRxv
 BL7rn9MSTg4xqvULVGqiaF/aHwfQ/t7+3n5Y5ijJgm0RUhjLargLHJfIqf93ArGVUzqI3VoK
 R5ecx6//ehVz6JTHmPB9PN/ieXjX/vGPqaHV5Y9W2Cb9Dv0EF+IelVHtUiidnXjdHfjdL9dO
 dyU4yKA5+znHWe8YvWVtCQ2POClP9h05cKeOuuy2/+6xGYNrze5bDjYF83MXukNto+2VNV6u
 q1enQ1O2Z493hcUMLb85yr6QkXwcS7sTap79C0qOT2xJAwAA
X-CMS-MailID: 20190916120206eucas1p25ac70e0190fdc206b2e92591975b600c
X-Msg-Generator: CA
X-RootMTR: 20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3
References: <CGME20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3@epcas3p4.samsung.com>
 <20190815004854.19860-1-masneyb@onstation.org>
 <2da29e80-73fb-8620-532e-0b5f54b00841@samsung.com>
 <20190916090150.GA349@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568635327;
 bh=65UEnVxKP+D2QkDRxOOBUdJYe96zkmylUP4t9e8ZLEU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=LyXvBccfe8G6Ag71lwuI5oyRxVciPcN/YWZCvYvkVm0rLVcRXEhje2aC8lSOE4R6q
 j/SFuL+WS+4GnX7kv4nHzAAWv0lAHkgWu501Uctyztczos1LKE/nrJ8zBFESN6xnoy
 wCIH6bqTGdS1+OyWA2Z+mejhGa/OI33NovPF4gY8=
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
 narmstrong@baylibre.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 jonas@kwiboo.se, agross@kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 enric.balletbo@collabora.com, freedreno@lists.freedesktop.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYuMDkuMjAxOSAxMTowMSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IEhpIEFuZHJ6ZWosCj4K
PiBPbiBNb24sIFNlcCAxNiwgMjAxOSBhdCAxMDoxMzo1OEFNICswMjAwLCBBbmRyemVqIEhhamRh
IHdyb3RlOgo+PiBIaSBCcmlhbiwKPj4KPj4gT24gMTUuMDguMjAxOSAwMjo0OCwgQnJpYW4gTWFz
bmV5IHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgYmVnaW5zIHRvIGFkZCBzdXBwb3J0IGZv
ciB0aGUgZXh0ZXJuYWwgZGlzcGxheSBvdmVyCj4+PiBIRE1JIHRoYXQgaXMgc3VwcG9ydGVkIG9u
IG1zbTg5NzQgU29Dcy4gSSdtIHRlc3RpbmcgdGhpcyBzZXJpZXMgb24gdGhlCj4+PiBOZXh1cyA1
LCBhbmQgSSdtIGFibGUgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgSERNSSBicmlkZ2UgdmlhIHRo
ZQo+Pj4gYW5hbG9naXgtYW54Nzh4eCBkcml2ZXIsIGhvd2V2ZXIgdGhlIGV4dGVybmFsIGRpc3Bs
YXkgaXMgbm90IHdvcmtpbmcKPj4+IHlldC4KPj4+Cj4+PiBXaGVuIEkgcGx1ZyBpbiB0aGUgSERN
SSBjYWJsZSwgdGhlIG1vbml0b3IgZGV0ZWN0cyB0aGF0IGEgZGV2aWNlIGlzCj4+PiBob29rZWQg
dXAsIGJ1dCBub3RoaW5nIGlzIHNob3duIG9uIHRoZSBleHRlcm5hbCBtb25pdG9yLiBUaGUgaG90
IHBsdWcKPj4+IGRldGVjdCBHUElPIChocGQtZ3Bpb3MpIG9uIHRoZSBhbmFsb2dpeC1hbng3OHh4
IGJyaWRnZSBhbmQgTVNNIEhETUkKPj4+IGRyaXZlcnMgZG8gbm90IGNoYW5nZSBzdGF0ZSB3aGVu
IHRoZSBzbGltcG9ydCBhZGFwdGVyIG9yIEhETUkgY2FibGUgaXMKPj4+IHBsdWdnZWQgaW4gb3Ig
cmVtb3ZlZC4gSSB3b25kZXIgaWYgYSByZWd1bGF0b3IgaXMgbm90IGVuYWJsZWQgc29tZXdoZXJl
Pwo+Pj4gSSBoYXZlIGEgY29tbWVudCBpbiBwYXRjaCAxMCByZWdhcmRpbmcgJ2hwZC1nZHNjLXN1
cHBseScgdGhhdCBtYXkKPj4+IHBvdGVudGlhbGx5IGJlIGFuIGlzc3VlLgo+Pj4KPj4+IEknbSBz
dGlsbCBkaWdnaW5nIGluIG9uIHRoaXMsIGhvd2V2ZXIgSSdkIGFwcHJlY2lhdGUgYW55IGZlZWRi
YWNrIGlmCj4+PiBhbnlvbmUgaGFzIHRpbWUuIE1vc3Qgb2YgdGhlc2UgcGF0Y2hlcyBhcmUgcmVh
ZHkgbm93LCBzbyBJIG1hcmtlZCB0aGUKPj4+IG9uZXMgdGhhdCBhcmVuJ3QgcmVhZHkgd2l0aCAn
UEFUQ0ggUkZDJy4KPj4+Cj4+PiBJJ20gdXNpbmcgYW4gQW5hbG9naXggU2VtaWNvbmR1Y3RvciBT
UDYwMDEgU2xpbVBvcnQgTWljcm8tVVNCIHRvIDRLIEhETUkKPj4+IEFkYXB0ZXIgdG8gY29ubmVj
dCBteSBwaG9uZSB0byBhbiBleHRlcm5hbCBkaXNwbGF5IHZpYSBhIHN0YW5kYXJkIEhETUkKPj4+
IGNhYmxlLiBUaGlzIHdvcmtzIGp1c3QgZmluZSB3aXRoIHRoZSBkb3duc3RyZWFtIE1TTSBrZXJu
ZWwgdXNpbmcKPj4+IEFuZHJvaWQuCj4+Cj4+IFRoaXMgcGF0Y2hzZXQgcmlza3MgdG8gYmUgZm9y
Z290dGVuLiBUbyBhdm9pZCBpdCwgYXQgbGVhc3QgcGFydGlhbGx5LCBJCj4+IGNhbiBtZXJnZSBw
YXRjaGVzIDEtNSwgaXMgaXQgT0sgZm9yIHlvdT8KPiBUaGF0IHdvdWxkIGJlIGdyZWF0IGlmIHlv
dSBjb3VsZCBkbyB0aGF0LgoKCkkgaGF2ZSBxdWV1ZWQgMS00IHRvIGRybS1taXNjLW5leHQuIDV0
aCBwYXRjaCByZXF1aXJlcyBzb21lIGRpc2N1c3Npb24uCgoKUmVnYXJkcwoKQW5kcnplagoKCj4K
PiBUaGFua3MsCj4KPiBCcmlhbgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
