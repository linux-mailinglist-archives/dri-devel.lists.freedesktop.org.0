Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65919986D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 16:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F168A89803;
	Tue, 31 Mar 2020 14:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5933A89803
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:29:15 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200331142913euoutp01af631ed20dfdea7ac67cd352733f6587~Bad-ApIiB1509215092euoutp01H
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:29:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200331142913euoutp01af631ed20dfdea7ac67cd352733f6587~Bad-ApIiB1509215092euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585664953;
 bh=FnH1CR4CGNjTs+LAgOkEqdqVWm7njDfaUNTNh3SNqOo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=QTcnjGv4bvcvG6odHq6dwGlgIdilwE1jXIP48rY+XAczGN9V9X9likECeVwqUCvNu
 2BeHLyLXSlLG6DP4k9Ic5SMtpMZUZol3D+KDjCgy8DHiduWZ4QQMTqnCwHfrFU9oKZ
 49bcCzG67Oo+ryuGvUFv24vm9Nok4G0To3acnlLQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200331142913eucas1p10dc37b994078cdb5ec78bf2576bef4d4~Bad_wxJHE0697206972eucas1p11;
 Tue, 31 Mar 2020 14:29:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 53.E4.61286.9B3538E5; Tue, 31
 Mar 2020 15:29:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200331142912eucas1p12b93673531fbe7536addaba15c785018~Bad_OQEWM0697206972eucas1p10;
 Tue, 31 Mar 2020 14:29:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331142912eusmtrp1832f46bf8074cca41460d778f02ca087~Bad_No6U11407014070eusmtrp1f;
 Tue, 31 Mar 2020 14:29:12 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-d6-5e8353b922dc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2B.03.08375.8B3538E5; Tue, 31
 Mar 2020 15:29:12 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200331142912eusmtip2d6111a98eb084b7dca94cf7793bd7efe~Bad9lbddt2905029050eusmtip2N;
 Tue, 31 Mar 2020 14:29:11 +0000 (GMT)
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: Alex Deucher <alexdeucher@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b65eddc1-e88a-cd64-86bb-5a9e99a7671d@samsung.com>
Date: Tue, 31 Mar 2020 16:29:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NEhfZwE6B0UBu0My7Sk5YNoDE=7Nj_CUYpPe9HOjpjqQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djP87o7g5vjDHZt57HoPXeSyWLand2s
 Fnf+zGK3WPfvJotF484+Jou394FiV76+Z7O4vGsOmwOHR+ulv2weO2fdZffY/u0Bq8f97uNM
 Hp83yQWwRnHZpKTmZJalFunbJXBlrNv7g7lgv1jF4TsPWBsYJwt1MXJySAiYSCw51MjYxcjF
 ISSwglHix5uPzCAJIYEvjBJtl+UgEp8ZJT7PXscE07Gibw1Ux3JGiU9XtzFBOO8ZJZpuTWUD
 qRIWcJXY2dQKVMXBISKgIbH+iw9IDbPAGSaJa4cms4PUsAkYSnS97QKr5xWwk/i5cyYrSD2L
 gKrEup5IkLCoQIzExcP9rBAlghInZz5hASnhFAiUaNohDRJmFpCXaN46mxnCFpe49WQ+1J27
 2CWmz9OEsF0k7n3azgJhC0u8Or6FHcKWkTg9uYcF5DQJgWZGiYfn1rJDOD2MEpebZjBCVFlL
 3Dn3iw1kMbOApsT6XfoQYUeJZ1dOMoOEJQT4JG68FYS4gU9i0rbpUGFeiY42aECrScw6vg5u
 7cELl5gnMCrNQvLYLCTfzELyzSyEvQsYWVYxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIE
 JqLT/45/2sH49VLSIUYBDkYlHt4Km+Y4IdbEsuLK3EOMEhzMSiK8bP4NcUK8KYmVValF+fFF
 pTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUw7l69Rf91vSDL2wPWx9z4Hr2J
 1n/ycgP7rpC7JdZ7XeW6udVneRa8yTpnOqfzxCle/1cLVV599dIPObreY0fo2XmPvbWeG6mz
 3DF8t3HZhG88tx+fetb38fUDXeurq7f6idT/yWVYzcCw8rXMqsOHNGe8jZ3O0D1jfoyw8pLO
 4NvSF5Rbrn1b916JpTgj0VCLuag4EQAlOTTJQAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7o7gpvjDDb8V7PoPXeSyWLand2s
 Fnf+zGK3WPfvJotF484+Jou394FiV76+Z7O4vGsOmwOHR+ulv2weO2fdZffY/u0Bq8f97uNM
 Hp83yQWwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
 JehlrNv7g7lgv1jF4TsPWBsYJwt1MXJySAiYSKzoW8PYxcjFISSwlFHi5PrfbBAJGYmT0xpY
 IWxhiT/Xutggit4ySlyZc5cZJCEs4Cqxs6kVqJuDQ0RAQ2L9Fx+QGmaBc0wS965tY4ZoWMgi
 sf/BKbBJbAKGEl1vu8A28ArYSfzcOZMVpJlFQFViXU8kSFhUIEbi554uFogSQYmTM5+wgJRw
 CgRKNO2QBgkzC5hJzNv8kBnClpdo3jobyhaXuPVkPtMERqFZSLpnIWmZhaRlFpKWBYwsqxhF
 UkuLc9Nziw31ihNzi0vz0vWS83M3MQKjb9uxn5t3MF7aGHyIUYCDUYmHt8KmOU6INbGsuDL3
 EKMEB7OSCC+bf0OcEG9KYmVValF+fFFpTmrxIUZToNcmMkuJJucDE0NeSbyhqaG5haWhubG5
 sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZGlhVd1pk+D7j3ci+oZ6wXTY//2nmt4F+h
 yI+PS29qC8ydNK2Qu0BxA0vcwrKP23g0ku6cV8p96pWx8ll9Ya3qxG0v7mxe5B8SdsOa413P
 YpP253M49fe8VNPf2yZ2oebaju0b3uxKL2uwLS2csmHt6SfLc0I6zITj2yc47IwX7bsv+tbp
 45G1SizFGYmGWsxFxYkA93X8A9QCAAA=
X-CMS-MailID: 20200331142912eucas1p12b93673531fbe7536addaba15c785018
X-Msg-Generator: CA
X-RootMTR: 20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
 <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
 <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
 <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
 <CADnq5_O6pwxJsYdfJO0xZtmER05GtO+2-4uHTeexKNeHyUq8_Q@mail.gmail.com>
 <3a0cb2bc-84be-6f9f-a0e8-ecb653026301@samsung.com>
 <CADnq5_NEhfZwE6B0UBu0My7Sk5YNoDE=7Nj_CUYpPe9HOjpjqQ@mail.gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Shane Francis <bigbeeshane@gmail.com>, amd-gfx-request@lists.freedesktop.org,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleCwKCk9uIDIwMjAtMDMtMzEgMTY6MTAsIEFsZXggRGV1Y2hlciB3cm90ZToKPiBPbiBU
dWUsIE1hciAzMSwgMjAyMCBhdCAxOjI1IEFNIE1hcmVrIFN6eXByb3dza2kKPiA8bS5zenlwcm93
c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPj4gSGkgQWxleCwKPj4KPj4gT24gMjAyMC0wMy0zMCAx
NToyMywgQWxleCBEZXVjaGVyIHdyb3RlOgo+Pj4gT24gTW9uLCBNYXIgMzAsIDIwMjAgYXQgNDox
OCBBTSBNYXJlayBTenlwcm93c2tpCj4+PiA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPiB3cm90
ZToKPj4+PiBIaQo+Pj4+Cj4+Pj4gT24gMjAyMC0wMy0yNyAxMDoxMCwgTWFyZWsgU3p5cHJvd3Nr
aSB3cm90ZToKPj4+Pj4gSGkgQ2hyaXN0aWFuLAo+Pj4+Pgo+Pj4+PiBPbiAyMDIwLTAzLTI3IDA5
OjExLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gQW0gMjcuMDMuMjAgdW0gMDg6NTQg
c2NocmllYiBNYXJlayBTenlwcm93c2tpOgo+Pj4+Pj4+IE9uIDIwMjAtMDMtMjUgMTA6MDcsIFNo
YW5lIEZyYW5jaXMgd3JvdGU6Cj4+Pj4+Pj4+IEFzIGRtYV9tYXBfc2cgY2FuIHJlb3JnYW5pemUg
c2NhdHRlci1nYXRoZXIgbGlzdHMgaW4gYQo+Pj4+Pj4+PiB3YXkgdGhhdCBjYW4gY2F1c2Ugc29t
ZSBsYXRlciBzZWdtZW50cyB0byBiZSBlbXB0eSB3ZSBzaG91bGQKPj4+Pj4+Pj4gYWx3YXlzIHVz
ZSB0aGUgc2dfZG1hX2xlbiBtYWNybyB0byBmZXRjaCB0aGUgYWN0dWFsIGxlbmd0aC4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gVGhpcyBjb3VsZCBub3cgYmUgMCBhbmQgbm90IG5lZWQgdG8gYmUgbWFwcGVk
IHRvIGEgcGFnZSBvcgo+Pj4+Pj4+PiBhZGRyZXNzIGFycmF5Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IFNoYW5lIEZyYW5jaXMgPGJpZ2JlZXNoYW5lQGdtYWlsLmNvbT4KPj4+Pj4+
Pj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29t
Pgo+Pj4+Pj4+IFRoaXMgcGF0Y2ggbGFuZGVkIGluIGxpbnV4LW5leHQgMjAyMDAzMjYgYW5kIGl0
IGNhdXNlcyBhIGtlcm5lbAo+Pj4+Pj4+IHBhbmljIG9uCj4+Pj4+Pj4gdmFyaW91cyBFeHlub3Mg
U29DIGJhc2VkIGJvYXJkcy4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+ICAgICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jIHwgMiArLQo+Pj4+Pj4+PiAgICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5j
Cj4+Pj4+Pj4+IGluZGV4IDg2ZDliMGU0NWM4Yy4uMWRlMmNkZTIyNzdjIDEwMDY0NAo+Pj4+Pj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcmltZS5jCj4+Pj4+Pj4+IEBAIC05NjcsNyArOTY3LDcgQEAgaW50IGRy
bV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHN0cnVjdAo+Pj4+Pj4+PiBzZ190YWJsZSAq
c2d0LCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAo+Pj4+Pj4+PiAgICAgICAgICAgICBpbmRleCA9IDA7
Cj4+Pj4+Pj4+ICAgICAgICAgIGZvcl9lYWNoX3NnKHNndC0+c2dsLCBzZywgc2d0LT5uZW50cywg
Y291bnQpIHsKPj4+Pj4+Pj4gLSAgICAgICAgbGVuID0gc2ctPmxlbmd0aDsKPj4+Pj4+Pj4gKyAg
ICAgICAgbGVuID0gc2dfZG1hX2xlbihzZyk7Cj4+Pj4+Pj4+ICAgICAgICAgICAgICBwYWdlID0g
c2dfcGFnZShzZyk7Cj4+Pj4+Pj4+ICAgICAgICAgICAgICBhZGRyID0gc2dfZG1hX2FkZHJlc3Mo
c2cpOwo+Pj4+Pj4+IFNvcnJ5LCBidXQgdGhpcyBjb2RlIGlzIHdyb25nIDooCj4+Pj4+PiBXZWxs
IGl0IGlzIGF0IGxlYXN0IGJldHRlciB0aGFuIGJlZm9yZSBiZWNhdXNlIGl0IG1ha2VzIG1vc3Qg
ZHJpdmVycwo+Pj4+Pj4gd29yayBjb3JyZWN0bHkgYWdhaW4uCj4+Pj4+IFdlbGwsIEknbSBub3Qg
c3VyZSB0aGF0IGEgaGFsZi1icm9rZW4gZml4IHNob3VsZCBiZSBjb25zaWRlcmVkIGFzIGEKPj4+
Pj4gZml4IDspCj4+Pj4+Cj4+Pj4+IEFueXdheSwgSSBqdXN0IGdvdCB0aGUgY29tbWVudCBmcm9t
IFNoYW5lLCB0aGF0IG15IHBhdGNoIGlzIGZpeGluZyB0aGUKPj4+Pj4gaXNzdWVzIHdpdGggYW1k
Z3B1IGFuZCByYWRlb24sIHdoaWxlIHN0aWxsIHdvcmtpbmcgZmluZSBmb3IgZXh5bm9zLCBzbwo+
Pj4+PiBpdCBpcyBpbmRlZWQgYSBwcm9wZXIgZml4Lgo+Pj4+IFRvZGF5IEkndmUgbm90aWNlZCB0
aGF0IHRoaXMgcGF0Y2ggd2VudCB0byBmaW5hbCB2NS42IHdpdGhvdXQgZXZlbiBhIGRheQo+Pj4+
IG9mIHRlc3RpbmcgaW4gbGludXgtbmV4dCwgc28gdjUuNiBpcyBicm9rZW4gb24gRXh5bm9zIGFu
ZCBwcm9iYWJseSBhIGZldwo+Pj4+IG90aGVyIEFSTSBhcmNocywgd2hpY2ggcmVseSBvbiB0aGUg
ZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXMKPj4+PiBmdW5jdGlvbi4KPj4+IFBsZWFz
ZSBjb21taXQgeW91ciBwYXRjaCBhbmQgY2Mgc3RhYmxlLgo+PiBJJ3ZlIGFscmVhZHkgZGlkIHRo
YXQ6IGh0dHBzJTNBJTJGJTJGbGttbC5vcmclMkZsa21sJTJGMjAyMCUyRjMlMkYyNyUyRjU1NQo+
IERvIHlvdSBoYXZlIGRybS1taXNjIGNvbW1pdCByaWdodHMgb3IgZG8geW91IG5lZWQgc29tZW9u
ZSB0byBjb21taXQKPiB0aGlzIGZvciB5b3U/CgpJIGhhdmUgbm8gYWNjZXNzIHRvIGRybS1taXNj
LgoKQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5z
dGl0dXRlIFBvbGFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
