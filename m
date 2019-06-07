Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAC638487
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E898999C;
	Fri,  7 Jun 2019 06:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42A78999C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:41:30 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607064129euoutp014a0c78deb95c3c563a367181df3bd7ac~l12hip9nk1080110801euoutp01G
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:41:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607064129euoutp014a0c78deb95c3c563a367181df3bd7ac~l12hip9nk1080110801euoutp01G
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607064128eucas1p299dc8c1ac78f8ec9b41f1bdd66a0df79~l12hM9b7G0356303563eucas1p2l;
 Fri,  7 Jun 2019 06:41:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B3.C7.04325.8170AFC5; Fri,  7
 Jun 2019 07:41:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607064127eucas1p2d170e0a8df77d5385beadf5cd79a6869~l12gUzWI90152201522eucas1p2y;
 Fri,  7 Jun 2019 06:41:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607064127eusmtrp2a71e31dcb22996583f8be1ea81a1fcc5~l12gFGCnY0254702547eusmtrp2k;
 Fri,  7 Jun 2019 06:41:27 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-bc-5cfa0718cafa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 57.AC.04146.7170AFC5; Fri,  7
 Jun 2019 07:41:27 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607064126eusmtip1cc7d169d7ca14470ccf7d036d20bd6a6~l12fUDf171602416024eusmtip1Q;
 Fri,  7 Jun 2019 06:41:26 +0000 (GMT)
Subject: Re: [PATCH v4 14/15] drm/bridge: tc358767: Drop unnecessary 8 byte
 buffer
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <34b09b98-0770-dec0-94cf-33138c3fb9ec@samsung.com>
Date: Fri, 7 Jun 2019 08:41:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607044550.13361-15-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeyyVcRjH+7238zrr1OsgT0XNydaSa0rvVtHtj7d/zNRak8WR12Uc7Lwo
 1ZbRXGqRxppTjQ11hIjQwbKOzalEbuFoOph0NZYUjeR4Wf77PM/3+/yey340LjeQW+jImHhe
 HaOMVlBSoq517q0LSP4Eun8f3sGmZhxiU/TJJDvb20KwL5oMGNs7M0mxw/eNGJuZUyxhexru
 UezQh5cEW1kwSB2WcsN5ixin0wxJuLsZ+SRnumHAuOwFd84wUI9x09XbuI68dsyPDpAeDOWj
 IxN5tZt3sDRitOYeHvfb6qKuthglIwNzHdE0MHvhXWnAdSSl5YwWwc30IiQGPxHkmKZIMZhG
 8Kmsb0mxWK7Qfn694nqIoMNYSYjBBIK+/i6J2WXFnIIRYwVmZmvGD36k6CizCWfaMEhveI+b
 BYrZBQs1RsrMMsYbcsf1yy0IxhG0mc3LxTbMGTC1VpGixxJe5Y8RZrZgfKDwS8My48x2SK29
 i4tsC4NjBZi5GTCDEhiZeioR5z4Ojd9KSZGt4KthNW8Hi7oCTOSrYNJew8XiDAS1VTpcFA5A
 i6GLNJ8MX5q6ssFNTB+BX93lEvGSG2BgwlKcYQPcrruDi2kZZKTJRbcDmNprVx60hZLOGeoW
 UmjWbKZZs41mzTaa/30LEfEI2fIJgiqcFzxj+AuuglIlJMSEu56PVVWjpe/V9tcw8ww9nw/R
 I4ZGivUyTjIXKCeViUKSSo+AxhXWssTO2UC5LFSZdIlXxwapE6J5QY+20oTCVnZ53fBZOROu
 jOejeD6OV6+qGG2xJRnJoyZM8/7eXlk+abfs8tXlp1WyYz7hg46LqeVOPUfV8/zuPN8rbecy
 nZ9UhPWHtHbe2OMf3ayl6IrHZQvdo9lverqdHYiZ+vFNk9uLHpCUx8E0Ksxo31glbFSSlt42
 o/Xl6ONJh6bQHK96+b7coNDNwSdcfLMKxsBz/06VvWuJghAilB5OuFpQ/gMcL9cDWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsVy+t/xu7ri7L9iDCY1aVg0d9haNB1qYLX4
 ceUwi8XBPceZLK58fc9m8WDuTSaLzolL2C0u75rDZnH33gkWi/Xzb7E5cHk8mPqfyWPnrLvs
 HrM7ZrJ63O8+zuTR/9fA4/iN7UwenzfJeZybepYpgCNKz6Yov7QkVSEjv7jEVina0MJIz9DS
 Qs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+PR5jnMBd+FK3ZuXcLYwHhcoIuRk0NCwERi
 xYtTjF2MXBxCAksZJaaeOs4EkRCX2D3/LTOELSzx51oXG4gtJPCaUeLoa7C4sECIxMOba8Hq
 RQT8JLrmHWACGcQscJZJ4vfunWwQU48xSrzoXMsIUsUmoCnxd/NNsEm8AnYSU54dAouzCKhI
 rOjcDzZJVCBC4sz7FSwQNYISJ2c+AbM5BewlFrzcBWYzC6hL/Jl3iRnClpdo3jobyhaXuPVk
 PtMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjdduxn5t3
 MF7aGHyIUYCDUYmH14HhZ4wQa2JZcWXuIUYJDmYlEd6yCz9ihHhTEiurUovy44tKc1KLDzGa
 Aj03kVlKNDkfmErySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUw
 GsdvKdi+MXBWpeUJleQdU5PyHlp0fXAN1mBew2ih61PF026tu3WN8J5HE+PFD1n2XmNM6zAO
 i73mdPPQXyuFPj7/eK2++gXHitf49ltEfFhgaNvN+9HhxKmVk+defJq4LsN18o9zs4tePNyt
 Jl56f+EUnjd9STKPmjaumv9lVuCFPb+5DgqkKbEUZyQaajEXFScCAGcw1F7tAgAA
X-CMS-MailID: 20190607064127eucas1p2d170e0a8df77d5385beadf5cd79a6869
X-Msg-Generator: CA
X-RootMTR: 20190607044652epcas1p1b357013f14ae5bebe6300d35c0abe891
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607044652epcas1p1b357013f14ae5bebe6300d35c0abe891
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
 <CGME20190607044652epcas1p1b357013f14ae5bebe6300d35c0abe891@epcas1p1.samsung.com>
 <20190607044550.13361-15-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559889689;
 bh=Hlws9M7BqFCoD+GZJisbwaAGPzTVT29fKD3S29duRF0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FDCrKwTk9+cODhpdJvj0IqfnYz1BEXyHjSM7p5/zZVlSgJyCfFXJdLtmTftxNb5Io
 pDJUxcZDjb7msFOl2hPAVo8BP8keTBKWrltbpoe834+UCDcsredbxhCbODEDCvLZOO
 tCyaC4eFmCRhzEZwnYv0NysKN1v3D2Z0v0GEqy74=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDYuMjAxOSAwNjo0NSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gdGNfZ2V0X2Rpc3Bs
YXlfcHJvcHMoKSBuZXZlciByZWFkcyBtb3JlIHRoYW4gYSBieXRlIHZpYSBBVVgsIHNvCj4gdGhl
cmUncyBubyBuZWVkIHRvIHJlc2VydmUgOCBmb3IgdGhhdCBwdXJwb3NlLiBObyBmdW5jdGlvbiBj
aGFuZ2UKPiBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRy
ZXcuc21pcm5vdkBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKPiBDYzogQW5kcnplaiBIYWpkYSA8
YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWlu
ZW5AdGkuY29tPgo+IENjOiBBbmRyZXkgR3VzYWtvdiA8YW5kcmV5Lmd1c2Frb3ZAY29nZW50ZW1i
ZWRkZWQuY29tPgo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+
IENjOiBDb3J5IFR1c2FyIDxjb3J5LnR1c2FyQHppaS5hZXJvPgo+IENjOiBDaHJpcyBIZWFseSA8
Y3BoZWFseUBnbWFpbC5jb20+Cj4gQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4
LmRlPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1
ODc2Ny5jIHwgMTMgKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+IGluZGV4
IGU3NDdmMTAwMjFlMy4uNGEyNDUxNDRhYTgzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGMzNTg3NjcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3
NjcuYwo+IEBAIC02NjEsOCArNjYxLDcgQEAgc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1cChz
dHJ1Y3QgdGNfZGF0YSAqdGMpCj4gIHN0YXRpYyBpbnQgdGNfZ2V0X2Rpc3BsYXlfcHJvcHMoc3Ry
dWN0IHRjX2RhdGEgKnRjKQo+ICB7Cj4gIAlpbnQgcmV0Owo+IC0JLyogdGVtcCBidWZmZXIgKi8K
PiAtCXU4IHRtcFs4XTsKPiArCXU4IHJlZzsKPiAgCj4gIAkvKiBSZWFkIERQIFJ4IExpbmsgQ2Fw
YWJpbGl0eSAqLwo+ICAJcmV0ID0gZHJtX2RwX2xpbmtfcHJvYmUoJnRjLT5hdXgsICZ0Yy0+bGlu
ay5iYXNlKTsKPiBAQCAtNjc4LDIxICs2NzcsMjEgQEAgc3RhdGljIGludCB0Y19nZXRfZGlzcGxh
eV9wcm9wcyhzdHJ1Y3QgdGNfZGF0YSAqdGMpCj4gIAkJdGMtPmxpbmsuYmFzZS5udW1fbGFuZXMg
PSAyOwo+ICAJfQo+ICAKPiAtCXJldCA9IGRybV9kcF9kcGNkX3JlYWRiKCZ0Yy0+YXV4LCBEUF9N
QVhfRE9XTlNQUkVBRCwgdG1wKTsKPiArCXJldCA9IGRybV9kcF9kcGNkX3JlYWRiKCZ0Yy0+YXV4
LCBEUF9NQVhfRE9XTlNQUkVBRCwgJnJlZyk7Cj4gIAlpZiAocmV0IDwgMCkKPiAgCQlnb3RvIGVy
cl9kcGNkX3JlYWQ7Cj4gLQl0Yy0+bGluay5zcHJlYWQgPSB0bXBbMF0gJiBEUF9NQVhfRE9XTlNQ
UkVBRF8wXzU7Cj4gKwl0Yy0+bGluay5zcHJlYWQgPSByZWcgJiBEUF9NQVhfRE9XTlNQUkVBRF8w
XzU7Cj4gIAo+IC0JcmV0ID0gZHJtX2RwX2RwY2RfcmVhZGIoJnRjLT5hdXgsIERQX01BSU5fTElO
S19DSEFOTkVMX0NPRElORywgdG1wKTsKPiArCXJldCA9IGRybV9kcF9kcGNkX3JlYWRiKCZ0Yy0+
YXV4LCBEUF9NQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkcsICZyZWcpOwo+ICAJaWYgKHJldCA8IDAp
Cj4gIAkJZ290byBlcnJfZHBjZF9yZWFkOwo+ICAKPiAgCXRjLT5saW5rLnNjcmFtYmxlcl9kaXMg
PSBmYWxzZTsKPiAgCS8qIHJlYWQgYXNzciAqLwo+IC0JcmV0ID0gZHJtX2RwX2RwY2RfcmVhZGIo
JnRjLT5hdXgsIERQX0VEUF9DT05GSUdVUkFUSU9OX1NFVCwgdG1wKTsKPiArCXJldCA9IGRybV9k
cF9kcGNkX3JlYWRiKCZ0Yy0+YXV4LCBEUF9FRFBfQ09ORklHVVJBVElPTl9TRVQsICZyZWcpOwo+
ICAJaWYgKHJldCA8IDApCj4gIAkJZ290byBlcnJfZHBjZF9yZWFkOwo+IC0JdGMtPmxpbmsuYXNz
ciA9IHRtcFswXSAmIERQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVTRVRfRU5BQkxFOwo+ICsJdGMt
PmxpbmsuYXNzciA9IHJlZyAmIERQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVTRVRfRU5BQkxFOwo+
ICAKPiAgCWRldl9kYmcodGMtPmRldiwgIkRQQ0QgcmV2OiAlZC4lZCwgcmF0ZTogJXMsIGxhbmVz
OiAlZCwgZnJhbWluZzogJXNcbiIsCj4gIAkJdGMtPmxpbmsuYmFzZS5yZXZpc2lvbiA+PiA0LCB0
Yy0+bGluay5iYXNlLnJldmlzaW9uICYgMHgwZiwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
