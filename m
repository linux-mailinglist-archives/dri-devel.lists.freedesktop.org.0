Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B88122778
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 10:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D440989C1C;
	Tue, 17 Dec 2019 09:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8A5B89AAE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 09:18:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B9AF30E;
 Tue, 17 Dec 2019 01:18:36 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 388BF3F6CF;
 Tue, 17 Dec 2019 01:18:36 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id EE59568295D; Tue, 17 Dec 2019 09:18:34 +0000 (GMT)
Date: Tue, 17 Dec 2019 09:18:34 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv4 05/36] drm/gem-fb-helper: Add generic afbc size checks
Message-ID: <20191217091834.3fm2muurfcy4qfh3@e110455-lin.cambridge.arm.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
 <20191213155907.16581-6-andrzej.p@collabora.com>
 <20191216171903.fqujludojsyphodo@e110455-lin.cambridge.arm.com>
 <96f82e93-8595-1020-fb08-53a521dc535a@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96f82e93-8595-1020-fb08-53a521dc535a@collabora.com>
User-Agent: NeoMutt/20180716
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>, dri-devel@lists.freedesktop.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDc6NDE6MjNQTSArMDEwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEhpIExpdml1LAo+IAo+IFcgZG5pdSAxNi4xMi4yMDE5IG/CoDE4OjE5
LCBMaXZpdSBEdWRhdSBwaXN6ZToKPiA+IEhpIEFuZHJ6ZWosCj4gPiAKPiA+IE9uIEZyaSwgRGVj
IDEzLCAyMDE5IGF0IDA0OjU4OjM2UE0gKzAxMDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90
ZToKPiA+ID4gRXh0ZW5kIHRoZSBzaXplLWNoZWNraW5nIHNwZWNpYWwgZnVuY3Rpb24gdG8gaGFu
ZGxlIGFmYmMuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdp
Y3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+ID4gPiAtLS0KPiA+ID4gICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2ZvdXJjYy5jICAgICAgICAgICAgICAgICB8IDEwICsrKy0KPiA+ID4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgICAgICAgICAgICB8ICAzICsKPiA+ID4gICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYyB8IDYwICsrKysrKysr
KysrKysrKysrKy0tCj4gPiA+ICAgaW5jbHVkZS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxw
ZXIuaCAgICAgfCAxNiArKysrKysKPiA+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9mb3VyY2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPiA+ID4g
aW5kZXggZDE0ZGQ3Yzg2MDIwLi45YWMyMTc1YzViZWUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9m
b3VyY2MuYwo+ID4gPiBAQCAtMzIzLDggKzMyMywxNCBAQCBkcm1fZ2V0X2Zvcm1hdF9pbmZvKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiA+ICAgewo+ID4gPiAgIAljb25zdCBzdHJ1Y3QgZHJt
X2Zvcm1hdF9pbmZvICppbmZvID0gTlVMTDsKPiA+ID4gLQlpZiAoZGV2LT5tb2RlX2NvbmZpZy5m
dW5jcy0+Z2V0X2Zvcm1hdF9pbmZvKQo+ID4gPiAtCQlpbmZvID0gZGV2LT5tb2RlX2NvbmZpZy5m
dW5jcy0+Z2V0X2Zvcm1hdF9pbmZvKG1vZGVfY21kKTsKPiA+ID4gKwkvKiBieXBhc3MgZHJpdmVy
IGNhbGxiYWNrIGlmIGFmYmMgKi8KPiA+ID4gKwlpZiAoIWRybV9pc19hZmJjKG1vZGVfY21kLT5t
b2RpZmllclswXSkpCj4gPiA+ICsJCWlmIChkZXYtPm1vZGVfY29uZmlnLmZ1bmNzLT5nZXRfZm9y
bWF0X2luZm8pIHsKPiA+ID4gKwkJCWNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3Mg
KmZ1bmNzOwo+ID4gPiArCj4gPiA+ICsJCQlmdW5jcyA9IGRldi0+bW9kZV9jb25maWcuZnVuY3M7
Cj4gPiA+ICsJCQlpbmZvID0gZnVuY3MtPmdldF9mb3JtYXRfaW5mbyhtb2RlX2NtZCk7Cj4gPiA+
ICsJCX0KPiA+IAo+ID4gV2hhdCBoYXMgdGhpcyBjaGFuZ2UgdG8gZG8gd2l0aCB0aGUgcmVzdCBv
ZiB0aGUgcGF0Y2g/IEFsc28sIEkgdGhpbmsgdGhpcyBnb2VzCj4gPiBhZ2FpbnN0IHRoZSBpZGVh
IHRoYXQgYW4gQUZCQy1hd2FyZSBkcml2ZXIgbWlnaHQgcmV0dXJuIGJldHRlciBkYXRhIGFib3V0
IHRoZSBmb3JtYXQKPiA+IGluZm8gdGhhbiB0aGUgZHJtX2Zvcm1hdF9pbmZvKCkgY29kZS4KPiA+
IAo+IAo+IFRoZSByZWFzb24gaXMgdGhlIGNvbmNsdXNpb24gb2YgbXkgdGFsayB3aXRoIGRhbnZl
dCBvbiBpcmM6Cj4gCj4gaHR0cHM6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35jYnJpbGwvZHJp
LWxvZy8/Y2hhbm5lbD1kcmktZGV2ZWwmaGlnaGxpZ2h0X25hbWVzPSZkYXRlPTIwMTktMTEtMTMm
c2hvd19odG1sPXRydWUKPiAKPiBJIGZvbGxvd2VkIGhpcyBhZHZpY2UgLSBpZiBJIHVuZGVyc3Rv
b2QgaGltIGNvcnJlY3RseSwgdGhhdCBpcy4KClllYWgsIEkgZG9uJ3QgbmVjZXNzYXJpbHkgYWdy
ZWUgd2l0aCBkYW52ZXQgaGVyZS4gSSB0aGluayBhIGJldHRlciBhcHByb2FjaCBpcyB0bwpzdGls
bCBsZXQgdGhlIGRyaXZlciBoYXZlIGEgc2F5IGluIGdldHRpbmcgdGhlIGZvcm1hdCBpbmZvLCBi
dXQgaWYgdGhlIGhvb2sgaXMgbm90CnByZXNlbnQgb3IgaWYgaXQgcmV0dXJucyBOVUxMIHRoZW4g
YXBwbHkgdGhlIEFGQkMgY29kZSBiZWZvcmUgKG9yIGFzIGFuIGFsdGVybmF0aXZlIHRvKQp0aGUg
cmVzdCBvZiB0aGUgZ2VuZXJpYyBjb2RlLgoKPiAKPiA+IEFzIGEgYmlrZXNoZWQsIEkga25vdyBp
dCBpcyB1c2VmdWwgZm9yIGRlYnVnZ2luZyB0byB0dXJuIHRoZSBvbmVsaW5lciBpbnRvIDMsIGJ1
dCBpdAo+ID4gZmVlbHMgbGlrZSBub3QgbmVjZXNzYXJ5IGhlcmUuCj4gCj4gODAgY2hhcnMgcGVy
IGxpbmUuIElmIGtlcHQgaW4gb25lIGxpbmUsIHRoZSBsaW1pdCBpcyBleGNlZWRlZAo+IHdpdGgg
YW4gYWRkaXRpb25hbCBpbmRlbnRhdGlvbiBsZXZlbCBwcmVzZW50LgoKRFJNIHN1YnN5c3RlbSBo
YXMgbmV2ZXIgZW5mb3JjZWQgdGhhdCBhbmQgdGhlcmUgYXJlIHBsZW50eSBvZiBpbnN0YW5jZXMg
aW4gdGhlIGNvcmUgRFJNIApjb2RlIHdoZXJlIHRoYXQgcnVsZSBnZXRzIGlnbm9yZWQuIFdlIGtu
b3cgdGhhdCBtb2RlX2NvbmZpZy5mdW5jcyBpcyBuZXZlciBOVUxMIGFuZAp0aGF0IHRoZSBnZXRf
Zm9ybWF0X2luZm8oKSBob29rIGlzIGFsd2F5cyBwb3B1bGF0ZWQsIHNvIHdlIGRvbid0IHJlYWxs
eSBnYWluIGFueXRoaW5nCmZyb20gc3BsaXR0aW5nIGl0IGludG8gbXVsdGlwbGUgbGluZXMuCgpC
ZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IAo+IFJlZ2FyZHMsCj4gCj4gQW5kcnplagoKLS0gCj09PT09
PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8
IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAv
CiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
