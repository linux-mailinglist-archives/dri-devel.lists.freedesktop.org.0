Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D0F5F394
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0176E294;
	Thu,  4 Jul 2019 07:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B8B6E1C4;
 Wed,  3 Jul 2019 20:26:39 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d1d0f7d0000>; Wed, 03 Jul 2019 13:26:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 03 Jul 2019 13:26:38 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 03 Jul 2019 13:26:38 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Jul
 2019 20:26:34 +0000
Subject: Re: [PATCH 5/5] mm: remove the legacy hmm_pfn_* APIs
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-6-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <d234738d-92ee-a841-5d9b-22881f2ac545@nvidia.com>
Date: Wed, 3 Jul 2019 13:26:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190703184502.16234-6-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562185597; bh=rm6vHnMn1NjJ83H8wZDmyjFoYuZQHy+fENvMn/j452Q=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=YGnNDsOJPDkrHnZlPSB55fjBHjofdZ1pqmg5mfa3pGUujmhe6o4wkL5zQFrut+fQL
 EmRJT13nJsodHkdgKjpZR4k/NVQ+p2haLqoN51ApjjBfdxsQu37mRCZGfnn6ihTByE
 RqPRggRXqjKi+TPrFy0qX8AWs4E/HIO1hxx+f7X5zz0G3WndR2YJOusT3+PpWP3WqJ
 GC1OQ7RZna/YgqfIZhbnEszK6cBofosZXX+Adtv7Nj+x4Kwh931vt2y8xYJ1ObEqrj
 DN+gXSpIZpsebWAzOqem2frFsJh0Yzu9UH1ZaH7KUfDvQlih8aYWqZh7VPKCTVXycB
 sw34ttIzrFWiQ==
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMy8xOSAxMTo0NSBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gU3dpdGNoIHRo
ZSBvbmUgcmVtYWluaW5nIHVzZXIgaW4gbm91dmVhdSBvdmVyIHRvIGl0cyByZXBsYWNlbWVudCwK
PiBhbmQgcmVtb3ZlIGFsbCB0aGUgd3JhcHBlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxs
QG52aWRpYS5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
bWVtLmMgfCAgMiArLQo+ICAgaW5jbHVkZS9saW51eC9obW0uaCAgICAgICAgICAgICAgICAgICAg
fCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMzUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kbWVtLmMKPiBpbmRleCA0MmMwMjYwMTA5MzguLmI5Y2VkMmU2MTY2NyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCj4gQEAgLTg0NCw3ICs4NDQsNyBAQCBu
b3V2ZWF1X2RtZW1fY29udmVydF9wZm4oc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gICAJCXN0
cnVjdCBwYWdlICpwYWdlOwo+ICAgCQl1aW50NjRfdCBhZGRyOwo+ICAgCj4gLQkJcGFnZSA9IGht
bV9wZm5fdG9fcGFnZShyYW5nZSwgcmFuZ2UtPnBmbnNbaV0pOwo+ICsJCXBhZ2UgPSBobW1fZGV2
aWNlX2VudHJ5X3RvX3BhZ2UocmFuZ2UsIHJhbmdlLT5wZm5zW2ldKTsKPiAgIAkJaWYgKHBhZ2Ug
PT0gTlVMTCkKPiAgIAkJCWNvbnRpbnVlOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCj4gaW5kZXggNjU3NjA2ZjQ4Nzk2Li5jZGNk
Nzg2MjczOTMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvaG1tLmgKPiBAQCAtMjkwLDQwICsyOTAsNiBAQCBzdGF0aWMgaW5saW5lIHVpbnQ2
NF90IGhtbV9kZXZpY2VfZW50cnlfZnJvbV9wZm4oY29uc3Qgc3RydWN0IGhtbV9yYW5nZSAqcmFu
Z2UsCj4gICAJCXJhbmdlLT5mbGFnc1tITU1fUEZOX1ZBTElEXTsKPiAgIH0KPiAgIAo+IC0vKgo+
IC0gKiBPbGQgQVBJOgo+IC0gKiBobW1fcGZuX3RvX3BhZ2UoKQo+IC0gKiBobW1fcGZuX3RvX3Bm
bigpCj4gLSAqIGhtbV9wZm5fZnJvbV9wYWdlKCkKPiAtICogaG1tX3Bmbl9mcm9tX3BmbigpCj4g
LSAqCj4gLSAqIFRoaXMgYXJlIHRoZSBPTEQgQVBJIHBsZWFzZSB1c2UgbmV3IEFQSSwgaXQgaXMg
aGVyZSB0byBhdm9pZCBjcm9zcy10cmVlCj4gLSAqIG1lcmdlIHBhaW5mdWxsbmVzcyBpZSB3ZSBj
b252ZXJ0IHRoaW5ncyB0byBuZXcgQVBJIGluIHN0YWdlcy4KPiAtICovCj4gLXN0YXRpYyBpbmxp
bmUgc3RydWN0IHBhZ2UgKmhtbV9wZm5fdG9fcGFnZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZSwKPiAtCQkJCQkgICB1aW50NjRfdCBwZm4pCj4gLXsKPiAtCXJldHVybiBobW1fZGV2aWNl
X2VudHJ5X3RvX3BhZ2UocmFuZ2UsIHBmbik7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyBobW1fcGZuX3RvX3Bmbihjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwK
PiAtCQkJCQkgICB1aW50NjRfdCBwZm4pCj4gLXsKPiAtCXJldHVybiBobW1fZGV2aWNlX2VudHJ5
X3RvX3BmbihyYW5nZSwgcGZuKTsKPiAtfQo+IC0KPiAtc3RhdGljIGlubGluZSB1aW50NjRfdCBo
bW1fcGZuX2Zyb21fcGFnZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKPiAtCQkJCQkg
c3RydWN0IHBhZ2UgKnBhZ2UpCj4gLXsKPiAtCXJldHVybiBobW1fZGV2aWNlX2VudHJ5X2Zyb21f
cGFnZShyYW5nZSwgcGFnZSk7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbmxpbmUgdWludDY0X3QgaG1t
X3Bmbl9mcm9tX3Bmbihjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKPiAtCQkJCQl1bnNp
Z25lZCBsb25nIHBmbikKPiAtewo+IC0JcmV0dXJuIGhtbV9kZXZpY2VfZW50cnlfZnJvbV9wZm4o
cmFuZ2UsIHBmbik7Cj4gLX0KPiAtCj4gICAvKgo+ICAgICogTWlycm9yaW5nOiBob3cgdG8gc3lu
Y2hyb25pemUgZGV2aWNlIHBhZ2UgdGFibGUgd2l0aCBDUFUgcGFnZSB0YWJsZS4KPiAgICAqCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
