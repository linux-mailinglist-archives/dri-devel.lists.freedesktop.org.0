Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2E5F392
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F406E291;
	Thu,  4 Jul 2019 07:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9AD6E175;
 Wed,  3 Jul 2019 17:22:28 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d1ce44f0000>; Wed, 03 Jul 2019 10:22:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 03 Jul 2019 10:22:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 03 Jul 2019 10:22:27 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Jul
 2019 17:22:23 +0000
Subject: Re: [PATCH 18/22] mm: return valid info from hmm_range_unregister
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-19-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <0cc37cca-4f3a-40bb-0059-bf3880c171b8@nvidia.com>
Date: Wed, 3 Jul 2019 10:22:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701062020.19239-19-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562174544; bh=t4iv+JkVQXMDn9U21ZE8onfcueQ7442WkhT3/Dcpa4M=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=o4SEJPOOrRcVRLndEm7Zo7kTSy5FZf0UU7cSYb6tblR8H1EUMVX5E/0FjYzJrSpko
 wz/tUydScQzFM1TJuHIP9tIFH+twnUQBk37KA0HVngw9EftV5QqHG2Tqfjp2J8EPuI
 cOTG6KhoZMk2Kh1KQh0nP3AEh0uE4jVMnBYCBTkXTdSVmN+wIcMvLmh+GM9psOeZBs
 3aY56IDBUR2I0RSrHwqu9wiz9+2bNfCk3CTpCrQB/Pq2QpA4D4k/ASPiYqwdt5SsHr
 E0w4jAe1UNn6ayNyaW96+0ynvEfH+IEp7CDyfnUEVKIhxGZ7F5A0JKPp7wK4+C0AuG
 0J+QqvUEgD4RQ==
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMzAvMTkgMTE6MjAgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IENoZWNraW5n
IHJhbmdlLT52YWxpZCBpcyB0cml2aWFsIGFuZCBoYXMgbm8gbWVhbmluZ2Z1bCBjb3N0LCBidXQK
PiBuaWNlbHkgc2ltcGxpZmllcyB0aGUgZmFzdHBhdGggaW4gdHlwaWNhbCBjYWxsZXJzLiAgQWxz
byByZW1vdmUgdGhlCj4gaG1tX3ZtYV9yYW5nZV9kb25lIGZ1bmN0aW9uLCB3aGljaCBub3cgaXMg
YSB0cml2aWFsIHdyYXBwZXIgYXJvdW5kCj4gaG1tX3JhbmdlX3VucmVnaXN0ZXIuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpSZXZpZXdlZC1ieTog
UmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgfCAgMiArLQo+ICAgaW5jbHVkZS9saW51eC9o
bW0uaCAgICAgICAgICAgICAgICAgICB8IDExICstLS0tLS0tLS0tCj4gICBtbS9obW0uYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrKystCj4gICAzIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3N2bS5jCj4gaW5kZXggOGM5MjM3NGFmY2YyLi45ZDQwMTE0ZDc5NDkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKPiBAQCAtNjUyLDcgKzY1Miw3IEBA
IG5vdXZlYXVfc3ZtX2ZhdWx0KHN0cnVjdCBudmlmX25vdGlmeSAqbm90aWZ5KQo+ICAgCQlyZXQg
PSBobW1fdm1hX2ZhdWx0KCZzdm1tLT5taXJyb3IsICZyYW5nZSwgdHJ1ZSk7Cj4gICAJCWlmIChy
ZXQgPT0gMCkgewo+ICAgCQkJbXV0ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwo+IC0JCQlpZiAoIWht
bV92bWFfcmFuZ2VfZG9uZSgmcmFuZ2UpKSB7Cj4gKwkJCWlmICghaG1tX3JhbmdlX3VucmVnaXN0
ZXIoJnJhbmdlKSkgewo+ICAgCQkJCW11dGV4X3VubG9jaygmc3ZtbS0+bXV0ZXgpOwo+ICAgCQkJ
CWdvdG8gYWdhaW47Cj4gICAJCQl9Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmgg
Yi9pbmNsdWRlL2xpbnV4L2htbS5oCj4gaW5kZXggMGZhOGVhMzRjY2VmLi40YjE4NWQyODZjM2Ig
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgv
aG1tLmgKPiBAQCAtNDY1LDcgKzQ2NSw3IEBAIGludCBobW1fcmFuZ2VfcmVnaXN0ZXIoc3RydWN0
IGhtbV9yYW5nZSAqcmFuZ2UsCj4gICAJCSAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAg
CQkgICAgICAgdW5zaWduZWQgbG9uZyBlbmQsCj4gICAJCSAgICAgICB1bnNpZ25lZCBwYWdlX3No
aWZ0KTsKPiAtdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5n
ZSk7Cj4gK2Jvb2wgaG1tX3JhbmdlX3VucmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2Up
Owo+ICAgbG9uZyBobW1fcmFuZ2Vfc25hcHNob3Qoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpOwo+
ICAgbG9uZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIGJvb2wgYmxv
Y2spOwo+ICAgbG9uZyBobW1fcmFuZ2VfZG1hX21hcChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwK
PiBAQCAtNDg3LDE1ICs0ODcsNiBAQCBsb25nIGhtbV9yYW5nZV9kbWFfdW5tYXAoc3RydWN0IGht
bV9yYW5nZSAqcmFuZ2UsCj4gICAgKi8KPiAgICNkZWZpbmUgSE1NX1JBTkdFX0RFRkFVTFRfVElN
RU9VVCAxMDAwCj4gICAKPiAtLyogVGhpcyBpcyBhIHRlbXBvcmFyeSBoZWxwZXIgdG8gYXZvaWQg
bWVyZ2UgY29uZmxpY3QgYmV0d2VlbiB0cmVlcy4gKi8KPiAtc3RhdGljIGlubGluZSBib29sIGht
bV92bWFfcmFuZ2VfZG9uZShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiAtewo+IC0JYm9vbCBy
ZXQgPSBobW1fcmFuZ2VfdmFsaWQocmFuZ2UpOwo+IC0KPiAtCWhtbV9yYW5nZV91bnJlZ2lzdGVy
KHJhbmdlKTsKPiAtCXJldHVybiByZXQ7Cj4gLX0KPiAtCj4gICAvKiBUaGlzIGlzIGEgdGVtcG9y
YXJ5IGhlbHBlciB0byBhdm9pZCBtZXJnZSBjb25mbGljdCBiZXR3ZWVuIHRyZWVzLiAqLwo+ICAg
c3RhdGljIGlubGluZSBpbnQgaG1tX3ZtYV9mYXVsdChzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9y
LAo+ICAgCQkJCXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCBib29sIGJsb2NrKQo+IGRpZmYgLS1n
aXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggZGUzNTI4OWRmMjBkLi5jODVlZDdkNGUy
Y2UgMTAwNjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBAIC05MjAsMTEg
KzkyMCwxNCBAQCBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV9yZWdpc3Rlcik7Cj4gICAgKgo+ICAg
ICogUmFuZ2Ugc3RydWN0IGlzIHVzZWQgdG8gdHJhY2sgdXBkYXRlcyB0byB0aGUgQ1BVIHBhZ2Ug
dGFibGUgYWZ0ZXIgYSBjYWxsIHRvCj4gICAgKiBobW1fcmFuZ2VfcmVnaXN0ZXIoKS4gU2VlIGlu
Y2x1ZGUvbGludXgvaG1tLmggZm9yIGhvdyB0byB1c2UgaXQuCj4gKyAqCj4gKyAqIFJldHVybnMg
aWYgdGhlIHJhbmdlIHdhcyBzdGlsbCB2YWxpZCBhdCB0aGUgdGltZSBvZiB1bnJlZ2lzdGVyaW5n
LgoKU2luY2UgdGhpcyBpcyBhbiBleHBvcnRlZCBmdW5jdGlvbiwgd2Ugc2hvdWxkIGhhdmUga2Vy
bmVsLWRvYyBjb21tZW50cy4KVGhhdCBpcyBwcm9iYWJseSBhIHNlcGFyYXRlIHBhdGNoIGJ1dCBh
dCBsZWFzdCB0aGlzIGxpbmUgY291bGQgYmU6ClJldHVybjogVHJ1ZSBpZiB0aGUgcmFuZ2Ugd2Fz
IHN0aWxsIHZhbGlkIGF0IHRoZSB0aW1lIG9mIHVucmVnaXN0ZXJpbmcuCgo+ICAgICovCj4gLXZv
aWQgaG1tX3JhbmdlX3VucmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gK2Jvb2wg
aG1tX3JhbmdlX3VucmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gICB7Cj4gICAJ
c3RydWN0IGhtbSAqaG1tID0gcmFuZ2UtPmhtbTsKPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+
ICsJYm9vbCByZXQgPSByYW5nZS0+dmFsaWQ7Cj4gICAKPiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgm
aG1tLT5yYW5nZXNfbG9jaywgZmxhZ3MpOwo+ICAgCWxpc3RfZGVsX2luaXQoJnJhbmdlLT5saXN0
KTsKPiBAQCAtOTQxLDYgKzk0NCw3IEBAIHZvaWQgaG1tX3JhbmdlX3VucmVnaXN0ZXIoc3RydWN0
IGhtbV9yYW5nZSAqcmFuZ2UpCj4gICAJICovCj4gICAJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Cj4g
ICAJbWVtc2V0KCZyYW5nZS0+aG1tLCBQT0lTT05fSU5VU0UsIHNpemVvZihyYW5nZS0+aG1tKSk7
Cj4gKwlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChobW1fcmFuZ2VfdW5yZWdp
c3Rlcik7Cj4gICAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
