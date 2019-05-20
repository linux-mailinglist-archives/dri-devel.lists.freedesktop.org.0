Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 308ED265EB
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8647889B0C;
	Wed, 22 May 2019 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id BACE6892FA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:21:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73538374;
 Mon, 20 May 2019 02:21:14 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB4DF3F575;
 Mon, 20 May 2019 02:21:11 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] drm: shmem: Add drm_gem_shmem_map_offset() wrapper
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Chris Wilson <chris@chris-wilson.co.uk>, David Airlie <airlied@linux.ie>,
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20190516141447.46839-1-steven.price@arm.com>
 <20190516141447.46839-3-steven.price@arm.com>
 <20190516202644.GE3851@phenom.ffwll.local>
From: Steven Price <steven.price@arm.com>
Message-ID: <b4d04dfd-3f45-e456-e944-9c337a6538a5@arm.com>
Date: Mon, 20 May 2019 10:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516202644.GE3851@phenom.ffwll.local>
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDUvMjAxOSAyMToyNiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIE1heSAx
NiwgMjAxOSBhdCAwMzoxNDo0NlBNICswMTAwLCBTdGV2ZW4gUHJpY2Ugd3JvdGU6Cj4+IFByb3Zp
ZGUgYSB3cmFwcGVyIGZvciBkcm1fZ2VtX21hcF9vZmZzZXQoKSBmb3IgY2xpZW50cyBvZiBzaG1l
bS4gVGhpcwo+PiB3cmFwcGVyIHByb3ZpZGVzIHRoZSBjb3JyZWN0IHNlbWFudGljcyBmb3IgdGhl
IGRybV9nZW1fc2htZW1fbW1hcCgpCj4+IGNhbGxiYWNrLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBT
dGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPj4g
IGluY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmggICAgIHwgIDIgKysKPj4gIDIgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9z
aG1lbV9oZWxwZXIuYwo+PiBpbmRleCAxZWUyMDhjMmM4NWUuLjlkYmViYzQ4OTdkMSAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPj4gQEAgLTQwMCw2ICs0MDAs
MjYgQEAgaW50IGRybV9nZW1fc2htZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxl
LCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+PiAgfQo+PiAgRVhQT1JUX1NZTUJPTF9HUEwoZHJt
X2dlbV9zaG1lbV9kdW1iX2NyZWF0ZSk7Cj4+ICAKPj4gKy8qKgo+PiArICogZHJtX2dlbV9tYXBf
b2Zmc2V0IC0gcmV0dXJuIHRoZSBmYWtlIG1tYXAgb2Zmc2V0IGZvciBhIGdlbSBvYmplY3QKPj4g
KyAqIEBmaWxlOiBkcm0gZmlsZS1wcml2YXRlIHN0cnVjdHVyZSBjb250YWluaW5nIHRoZSBnZW0g
b2JqZWN0Cj4+ICsgKiBAZGV2OiBjb3JyZXNwb25kaW5nIGRybV9kZXZpY2UKPj4gKyAqIEBoYW5k
bGU6IGdlbSBvYmplY3QgaGFuZGxlCj4+ICsgKiBAb2Zmc2V0OiByZXR1cm4gbG9jYXRpb24gZm9y
IHRoZSBmYWtlIG1tYXAgb2Zmc2V0Cj4+ICsgKgo+PiArICogVGhpcyBwcm92aWRlcyBhbiBvZmZz
ZXQgc3VpdGFibGUgZm9yIHVzZXIgc3BhY2UgdG8gcmV0dXJuIHRvIHRoZQo+PiArICogZHJtX2dl
bV9zaG1lbV9tbWFwKCkgY2FsbGJhY2sgdmlhIGFuIG1tYXAoKSBjYWxsLgo+PiArICoKPj4gKyAq
IFJldHVybnM6Cj4+ICsgKiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9u
IGZhaWx1cmUuCj4+ICsgKi8KPj4gK2ludCBkcm1fZ2VtX3NobWVtX21hcF9vZmZzZXQoc3RydWN0
IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+PiArCQkJICAgICB1MzIg
aGFuZGxlLCB1NjQgKm9mZnNldCkKPj4gK3sKPj4gKwlyZXR1cm4gZHJtX2dlbV9tYXBfb2Zmc2V0
KGZpbGUsIGRldiwgaGFuZGxlLCBvZmZzZXQpOwo+PiArfQo+PiArRVhQT1JUX1NZTUJPTF9HUEwo
ZHJtX2dlbV9zaG1lbV9tYXBfb2Zmc2V0KTsKPiAKPiBOb3Qgc2VlaW5nIHRoZSBwb2ludCBvZiB0
aGlzIG1hcHBlciwgc2luY2UgZHJtX2dlbV9zaG1lbV9tYXBfb2Zmc2V0IGlzbid0Cj4gc3BlZmlj
aWMgYXQgYWxsLiBJdCB3b3JrcyBmb3IgZHVtYiwgc2htZW0sIGNtYSBhbmQgcHJpdmF0ZSBvYmpl
Y3RzIGFsbAo+IGVxdWFsbHkgd2VsbC4gSSdkIGRyb3AgdGhpcyBhbmQganVzdCBkaXJlY3RseSBj
YWxsIHRoZSB1bmRlcmx5aW5nIHRoaW5nLAo+IG5vIG5lZWQgdG8gbGF5ZXIgaGVscGVycy4KPiAt
RGFuaWVsCgpPaywgSSdsbCBkcm9wIGl0LiBJIG1heSBoYXZlIG1pc3VuZGVyc3Rvb2QsIGJ1dCBJ
IHRoaW5rIENocmlzIFdpbHNvbiB3YXMKYXNraW5nIGZvciBpdCBiZWNhdXNlIHNobWVtIGlzIHRo
ZSBzb3VyY2Ugb2YgdGhlIHBhcnRpY3VsYXIgcmVxdWlyZW1lbnRzCm9mIHdoYXQgY2FuIGJlIG1t
YXAoKWQuIEJ1dCBJIHRoaW5rIGEgaGVscGVyIGNhbiBiZSBhZGRlZCB2ZXJ5IGVhc2lseSBpZgph
bnl0aGluZyBjaGFuZ2VzLCBzbyB0aGlzIHBhdGNoIGlzIHByb2JhYmx5IHByZW1hdHVyZS4KCkkn
bGwgcmVzZW5kIHRoZSBzZXJpZXMgd2l0aCB0aGlzIHBhdGNoIGRyb3BwZWQuCgpUaGFua3MsClN0
ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
