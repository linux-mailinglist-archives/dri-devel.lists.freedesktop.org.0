Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B66B76260
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC746ECF8;
	Fri, 26 Jul 2019 09:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61D256ECC2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:15:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEB3C344;
 Fri, 26 Jul 2019 02:15:27 -0700 (PDT)
Received: from [10.1.35.37] (Hgb10.cambridge.arm.com [10.1.35.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B62653F71A;
 Fri, 26 Jul 2019 02:15:26 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <552e3ef7-7a2f-b4c1-69f2-3c1b9fea827d@arm.com>
 <CAL_JsqJZ-dBgAq45F_Q_BrKo4XhHXjUeALn0oqBr6yWd_kTK9A@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <15bdc38a-5f15-e333-7d91-724a283ef12a@arm.com>
Date: Fri, 26 Jul 2019 10:15:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJZ-dBgAq45F_Q_BrKo4XhHXjUeALn0oqBr6yWd_kTK9A@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDcvMjAxOSAyMjoxMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBKdWwgMjUs
IDIwMTkgYXQgNzowOCBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90
ZToKPj4KPj4gSGkgUm9iLAo+Pgo+PiBPbiAyNS8wNy8yMDE5IDAyOjEwLCBSb2IgSGVycmluZyB3
cm90ZToKPj4gWy4uLl0KPj4+IEBAIC0zMjgsNiArNDI3LDE4IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKPj4+ICAgICAg
ICAgICAgICAgIGFjY2Vzc190eXBlID0gKGZhdWx0X3N0YXR1cyA+PiA4KSAmIDB4MzsKPj4+ICAg
ICAgICAgICAgICAgIHNvdXJjZV9pZCA9IChmYXVsdF9zdGF0dXMgPj4gMTYpOwo+Pj4KPj4+ICsg
ICAgICAgICAgICAgLyogUGFnZSBmYXVsdCBvbmx5ICovCj4+PiArICAgICAgICAgICAgIGlmICgo
c3RhdHVzICYgbWFzaykgPT0gQklUKGkpKSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgV0FS
Tl9PTihleGNlcHRpb25fdHlwZSA8IDB4QzEgfHwgZXhjZXB0aW9uX3R5cGUgPiAweEM0KTsKPj4+
ICsKPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSBwYW5mcm9zdF9tbXVfbWFwX2ZhdWx0
X2FkZHIocGZkZXYsIGksIGFkZHIpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGlmICghcmV0
KSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtbXVfd3JpdGUocGZkZXYsIE1N
VV9JTlRfQ0xFQVIsIEJJVChpKSk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dGF0dXMgJj0gfm1hc2s7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4+PiArICAgICAgICAgICAgIH0KPj4+ICsK
Pj4+ICAgICAgICAgICAgICAgIC8qIHRlcm1pbmFsIGZhdWx0LCBwcmludCBpbmZvIGFib3V0IHRo
ZSBmYXVsdCAqLwo+Pj4gICAgICAgICAgICAgICAgZGV2X2VycihwZmRldi0+ZGV2LAo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAiVW5oYW5kbGVkIFBhZ2UgZmF1bHQgaW4gQVMlZCBhdCBWQSAw
eCUwMTZsbFhcbiIKPj4+IEBAIC0zNjgsOCArNDc5LDkgQEAgaW50IHBhbmZyb3N0X21tdV9pbml0
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+Pj4gICAgICAgIGlmIChpcnEgPD0gMCkK
Pj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+Pj4KPj4+IC0gICAgIGVyciA9IGRl
dm1fcmVxdWVzdF9pcnEocGZkZXYtPmRldiwgaXJxLCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXIs
Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUUZfU0hBUkVELCAibW11IiwgcGZk
ZXYpOwo+Pj4gKyAgICAgZXJyID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShwZmRldi0+ZGV2
LCBpcnEsIE5VTEwsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
bmZyb3N0X21tdV9pcnFfaGFuZGxlciwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgSVJRRl9PTkVTSE9ULCAibW11IiwgcGZkZXYpOwo+Pgo+PiBUaGUgY2hhbmdlIG9m
IGZsYWdzIGhlcmUgYnJlYWtzIHBsYXRmb3JtcyB1c2luZyBhIHNpbmdsZSBzaGFyZWQKPj4gaW50
ZXJydXB0IGxpbmUuCj4gCj4gRG8gdGhleSBleGlzdD8gSSB0aGluayB0aGlzIHdhcyBsYXJnZWx5
IGNvcHktbi1wYXN0ZSBsZWZ0b3ZlciBmcm9tIHRoZQoKR29vZCBxdWVzdGlvbiAtIG9mIHRoZSBw
bGF0Zm9ybXMgSSBrbm93IGFib3V0IHRoZXkgYWxsIGhhdmUgc2VwYXJhdGUgCklSUXMsIGJ1dCBr
YmFzZSBkb2VzIGV4cGxpY2l0bHkgYWxsb3cgc2hhcmVkIGludGVycnVwdHMgc28gaXQncyBxdWl0
ZSAKcG9zc2libGUgdGhlcmUgaXMgYSBwbGF0Zm9ybSBvdXQgdGhlcmUgd2hpY2ggZG9lcy4KCj4g
bGltYSBkcml2ZXIgd2hlcmUgdXRnYXJkIGhhcyBhIGJ1bmNoIG9mIGlycXMgYW5kIHNvIHRoZXkg
Z2V0IGNvbWJpbmVkLgo+IFdoaWxlIGl0J3MgcG9zc2libGUgY2VydGFpbmx5LCBJJ2QgbGlrZSB0
byBhdm9pZCBoYXZpbmcgdG8gZG8gZnVydGhlcgo+IHJld29yayBlaXRoZXIgdG8gdXNlIGEgd29y
a3F1ZXVlIG9yIHdlIG5lZWQgYSBzaW5nbGUgZHJpdmVyIGhhbmRsZXIKPiB3aGljaCB0aGVuIGRp
c3BhdGNoZXMgdGhlIHN1YiBoYW5kbGVycy4gVGhlIHByb2JsZW0gaXMgdGhyZWFkZWQgaXJxCj4g
aGFuZGxlcnMgZG9uJ3Qgd29yayB3aXRoIHNoYXJlZCBpcnFzLgoKSXQgc2VlbXMgcmVhc29uYWJs
ZSB0byBtZSB0byBhdCBsZWFzdCB3YWl0IHVudGlsIHNvbWVvbmUgaWRlbnRpZmllcyBhIApwbGF0
Zm9ybSB3aGljaCBuZWVkcyBzaGFyZWQgaW50ZXJydXB0cyBiZWZvcmUgZW1iYXJraW5nIG9uIHRo
ZSByZWZhY3RvcmluZy4KClN0ZXZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
