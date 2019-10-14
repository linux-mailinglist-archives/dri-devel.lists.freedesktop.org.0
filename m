Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F11D6671
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 17:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC07B6E52D;
	Mon, 14 Oct 2019 15:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2FEFC6E513
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 15:46:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCF6C28;
 Mon, 14 Oct 2019 08:46:40 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C04823F718;
 Mon, 14 Oct 2019 08:46:39 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: DMA map all pages shared with the GPU
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20191014151616.14099-1-steven.price@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <99f279c5-e93d-ade6-cd97-56b3078da755@arm.com>
Date: Mon, 14 Oct 2019 16:46:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191014151616.14099-1-steven.price@arm.com>
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMTAvMjAxOSAxNjoxNiwgU3RldmVuIFByaWNlIHdyb3RlOgo+IFBhZ2VzIHNoYXJlZCB3
aXRoIHRoZSBHUFUgYXJlIChvZnRlbikgbm90IGNhY2hlIGNvaGVyZW50IHdpdGggdGhlIENQVSBz
bwo+IGNhY2hlIG1haW50ZW5hbmNlIGlzIHJlcXVpcmVkIHRvIGZsdXNoIHRoZSBDUFUncyBjYWNo
ZXMuIFRoaXMgd2FzCj4gYWxyZWFkeSBkb25lIHdoZW4gbWFwcGluZyBwYWdlcyBvbiBmYXVsdCwg
YnV0IHdhc24ndCBwcmV2aW91c2x5IGRvbmUKPiB3aGVuIG1hcHBpbmcgYSBmcmVzaGx5IGFsbG9j
YXRlZCBwYWdlLgo+IAo+IEZpeCB0aGlzIGJ5IG1vdmluZyB0aGUgY2FsbCB0byBkbWFfbWFwX3Nn
KCkgaW50byBtbXVfbWFwX3NnKCkgZW5zdXJpbmcKPiB0aGF0IGl0IGlzIGFsd2F5cyBjYWxsZWQg
d2hlbiBwYWdlcyBhcmUgbWFwcGVkIG9udG8gdGhlIEdQVS4gU2luY2UKPiBtbXVfbWFwX3NnKCkg
Y2FuIG5vdyBmYWlsIHRoZSBjb2RlIGFsc28gbm93IGhhcyB0byBoYW5kbGUgYW4gZXJyb3IKPiBy
ZXR1cm4uCj4gCj4gTm90IHBlcmZvcm1pbmcgdGhpcyBjYWNoZSBtYWludGVuYW5jZSBjYW4gY2F1
c2UgZXJyb3JzIGluIHRoZSBHUFUgb3V0cHV0Cj4gKENQVSBjYWNoZXMgYXJlIGxhdGVyIGZsdXNo
ZWQgYW5kIG92ZXJ3cml0ZSB0aGUgR1BVIG91dHB1dCkuIEluIHRoZW9yeQo+IGl0IGFsc28gYWxs
b3dzIHRoZSBHUFUgKGFuZCBieSBleHRlbnNpb24gdXNlciBzcGFjZSkgdG8gb2JzZXJ2ZSB0aGUK
PiBtZW1vcnkgY29udGVudHMgcHJpb3IgdG8gc2FuaXRpemF0aW9uLgoKRm9yIHRoZSBub24taGVh
cCBjYXNlLCBhcmVuJ3QgdGhlIHBhZ2VzIGFscmVhZHkgc3VwcG9zZWQgdG8gYmUgbWFwcGVkIGJ5
IApkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3QoKT8KCihIbW0sIG1heWJlIEkgc2hvdWxkIHRy
eSBob29raW5nIHVwIHRoZSBHUFUgU01NVSBvbiBteSBKdW5vIHRvIHNlcnZlIGFzIAphIGNoZWVr
eSBETUEtQVBJLW1pc2hhcCBkZXRlY3Rvci4uLikKClJvYmluLgoKPiBGaXhlczogZjNiYTkxMjI4
ZThlICgiZHJtL3BhbmZyb3N0OiBBZGQgaW5pdGlhbCBwYW5mcm9zdCBkcml2ZXIiKQo+IFNpZ25l
ZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAyMCArKysrKysrKysrKyst
LS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9t
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+IGluZGV4IGJk
ZDk5MDU2ODQ3Ni4uMDQ5NWU0OGMyMzhkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9tbXUuYwo+IEBAIC0yNDgsNiArMjQ4LDkgQEAgc3RhdGljIGludCBtbXVfbWFwX3Nn
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBzdHJ1Y3QgcGFuZnJvc3RfbW11ICptbXUs
Cj4gICAJc3RydWN0IGlvX3BndGFibGVfb3BzICpvcHMgPSBtbXUtPnBndGJsX29wczsKPiAgIAl1
NjQgc3RhcnRfaW92YSA9IGlvdmE7Cj4gICAKPiArCWlmICghZG1hX21hcF9zZyhwZmRldi0+ZGV2
LCBzZ3QtPnNnbCwgc2d0LT5uZW50cywgRE1BX0JJRElSRUNUSU9OQUwpKQo+ICsJCXJldHVybiAt
RUlOVkFMOwo+ICsKPiAgIAlmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgc2dsLCBzZ3QtPm5lbnRzLCBj
b3VudCkgewo+ICAgCQl1bnNpZ25lZCBsb25nIHBhZGRyID0gc2dfZG1hX2FkZHJlc3Moc2dsKTsK
PiAgIAkJc2l6ZV90IGxlbiA9IHNnX2RtYV9sZW4oc2dsKTsKPiBAQCAtMjc1LDYgKzI3OCw3IEBA
IGludCBwYW5mcm9zdF9tbXVfbWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKPiAg
IAlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IHRvX3BhbmZyb3N0X2RldmljZShvYmot
PmRldik7Cj4gICAJc3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4gICAJaW50IHByb3QgPSBJT01NVV9S
RUFEIHwgSU9NTVVfV1JJVEU7Cj4gKwlpbnQgcmV0Owo+ICAgCj4gICAJaWYgKFdBUk5fT04oYm8t
PmlzX21hcHBlZCkpCj4gICAJCXJldHVybiAwOwo+IEBAIC0yODYsMTAgKzI5MCwxMiBAQCBpbnQg
cGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCj4gICAJaWYg
KFdBUk5fT04oSVNfRVJSKHNndCkpKQo+ICAgCQlyZXR1cm4gUFRSX0VSUihzZ3QpOwo+ICAgCj4g
LQltbXVfbWFwX3NnKHBmZGV2LCBiby0+bW11LCBiby0+bm9kZS5zdGFydCA8PCBQQUdFX1NISUZU
LCBwcm90LCBzZ3QpOwo+IC0JYm8tPmlzX21hcHBlZCA9IHRydWU7Cj4gKwlyZXQgPSBtbXVfbWFw
X3NnKHBmZGV2LCBiby0+bW11LCBiby0+bm9kZS5zdGFydCA8PCBQQUdFX1NISUZULAo+ICsJCQkg
cHJvdCwgc2d0KTsKPiArCWlmIChyZXQgPT0gMCkKPiArCQliby0+aXNfbWFwcGVkID0gdHJ1ZTsK
PiAgIAo+IC0JcmV0dXJuIDA7Cj4gKwlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4gICB2b2lkIHBh
bmZyb3N0X21tdV91bm1hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCj4gQEAgLTUw
MywxMiArNTA5LDEwIEBAIGludCBwYW5mcm9zdF9tbXVfbWFwX2ZhdWx0X2FkZHIoc3RydWN0IHBh
bmZyb3N0X2RldmljZSAqcGZkZXYsIGludCBhcywgdTY0IGFkZHIpCj4gICAJaWYgKHJldCkKPiAg
IAkJZ290byBlcnJfcGFnZXM7Cj4gICAKPiAtCWlmICghZG1hX21hcF9zZyhwZmRldi0+ZGV2LCBz
Z3QtPnNnbCwgc2d0LT5uZW50cywgRE1BX0JJRElSRUNUSU9OQUwpKSB7Cj4gLQkJcmV0ID0gLUVJ
TlZBTDsKPiArCXJldCA9IG1tdV9tYXBfc2cocGZkZXYsIGJvLT5tbXUsIGFkZHIsCj4gKwkJCSBJ
T01NVV9XUklURSB8IElPTU1VX1JFQUQgfCBJT01NVV9OT0VYRUMsIHNndCk7Cj4gKwlpZiAocmV0
KQo+ICAgCQlnb3RvIGVycl9tYXA7Cj4gLQl9Cj4gLQo+IC0JbW11X21hcF9zZyhwZmRldiwgYm8t
Pm1tdSwgYWRkciwgSU9NTVVfV1JJVEUgfCBJT01NVV9SRUFEIHwgSU9NTVVfTk9FWEVDLCBzZ3Qp
Owo+ICAgCj4gICAJYm8tPmlzX21hcHBlZCA9IHRydWU7Cj4gICAKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
