Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E23079CF2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44436E2D2;
	Mon, 29 Jul 2019 23:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23C86E2D0;
 Mon, 29 Jul 2019 23:42:07 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3f844f0000>; Mon, 29 Jul 2019 16:42:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 29 Jul 2019 16:42:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 29 Jul 2019 16:42:07 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jul
 2019 23:42:02 +0000
Subject: Re: [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-10-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <1f0ef337-6ca5-54fa-e627-41a46be73f2b@nvidia.com>
Date: Mon, 29 Jul 2019 16:42:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190729142843.22320-10-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564443727; bh=mEZj3q5EnGdFR96z4O+Iz+WRmNblkDEHHCZr6fLsRoI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=dkCF/sqUubSJ16D0gzxWuIiRNyylExBkjSHrf+wBYiOEClAdNIcs4OLHo2fvbGIoX
 1HoTvy5tiILWD6dBrPFwdRF2JWe6qCogaekLOh7Q9mzfJygH45h8qJ5PLN8swqY07T
 H1AJG4slDbp8zFXaoA4gVYQpxo9dk3Ja5/reP1N0iQzGM2uEGVxa5oPVE2ahLha6XU
 XU7vinMQxUun59ktKiGlAoPT5x2NslQA58ySa1FgSzuEL5AR9P4hKjpvOH9Ww28B4H
 /6XKbzh2v/KF3c26Bvn4BAaIQuv9vhITJ4xA1s6tfjdxhUZXgaQvU2ZRaV1RuodxD0
 NRxR0aABTDx7Q==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjkvMTkgNzoyOCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVGhlIE1JR1JB
VEVfUEZOX1dSSVRFIGlzIG9ubHkgdXNlZCBsb2NhbGx5IGluIG1pZ3JhdGVfdm1hX2NvbGxlY3Rf
cG1kLAo+IHdoZXJlIGl0IGNhbiBiZSByZXBsYWNlZCB3aXRoIGEgc2ltcGxlIGJvb2xlYW4gbG9j
YWwgdmFyaWFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+CgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29t
PgoKPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvbWlncmF0ZS5oIHwgMSAtCj4gICBtbS9taWdyYXRl
LmMgICAgICAgICAgICB8IDkgKysrKystLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
aWdyYXRlLmggYi9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaAo+IGluZGV4IDhiNDZjZmRiMWEwZS4u
YmE3NGVmNWE3NzAyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9taWdyYXRlLmgKPiBAQCAtMTY1LDcgKzE2NSw2IEBAIHN0YXRpYyBp
bmxpbmUgaW50IG1pZ3JhdGVfbWlzcGxhY2VkX3RyYW5zaHVnZV9wYWdlKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLAo+ICAgI2RlZmluZSBNSUdSQVRFX1BGTl9WQUxJRAkoMVVMIDw8IDApCj4gICAjZGVm
aW5lIE1JR1JBVEVfUEZOX01JR1JBVEUJKDFVTCA8PCAxKQo+ICAgI2RlZmluZSBNSUdSQVRFX1BG
Tl9MT0NLRUQJKDFVTCA8PCAyKQo+IC0jZGVmaW5lIE1JR1JBVEVfUEZOX1dSSVRFCSgxVUwgPDwg
MykKPiAgICNkZWZpbmUgTUlHUkFURV9QRk5fU0hJRlQJNgo+ICAgCj4gICBzdGF0aWMgaW5saW5l
IHN0cnVjdCBwYWdlICptaWdyYXRlX3Bmbl90b19wYWdlKHVuc2lnbmVkIGxvbmcgbXBmbikKPiBk
aWZmIC0tZ2l0IGEvbW0vbWlncmF0ZS5jIGIvbW0vbWlncmF0ZS5jCj4gaW5kZXggNzQ3MzUyNTZl
MjYwLi43MjRmOTJkY2MzMWIgMTAwNjQ0Cj4gLS0tIGEvbW0vbWlncmF0ZS5jCj4gKysrIGIvbW0v
bWlncmF0ZS5jCj4gQEAgLTIyMTIsNiArMjIxMiw3IEBAIHN0YXRpYyBpbnQgbWlncmF0ZV92bWFf
Y29sbGVjdF9wbWQocG1kX3QgKnBtZHAsCj4gICAJCXVuc2lnbmVkIGxvbmcgbXBmbiwgcGZuOwo+
ICAgCQlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiAgIAkJc3dwX2VudHJ5X3QgZW50cnk7Cj4gKwkJYm9v
bCB3cml0YWJsZSA9IGZhbHNlOwo+ICAgCQlwdGVfdCBwdGU7Cj4gICAKPiAgIAkJcHRlID0gKnB0
ZXA7Cj4gQEAgLTIyNDAsNyArMjI0MSw3IEBAIHN0YXRpYyBpbnQgbWlncmF0ZV92bWFfY29sbGVj
dF9wbWQocG1kX3QgKnBtZHAsCj4gICAJCQltcGZuID0gbWlncmF0ZV9wZm4ocGFnZV90b19wZm4o
cGFnZSkpIHwKPiAgIAkJCQkJTUlHUkFURV9QRk5fTUlHUkFURTsKPiAgIAkJCWlmIChpc193cml0
ZV9kZXZpY2VfcHJpdmF0ZV9lbnRyeShlbnRyeSkpCj4gLQkJCQltcGZuIHw9IE1JR1JBVEVfUEZO
X1dSSVRFOwo+ICsJCQkJd3JpdGFibGUgPSB0cnVlOwo+ICAgCQl9IGVsc2Ugewo+ICAgCQkJaWYg
KGlzX3plcm9fcGZuKHBmbikpIHsKPiAgIAkJCQltcGZuID0gTUlHUkFURV9QRk5fTUlHUkFURTsK
PiBAQCAtMjI1MCw3ICsyMjUxLDggQEAgc3RhdGljIGludCBtaWdyYXRlX3ZtYV9jb2xsZWN0X3Bt
ZChwbWRfdCAqcG1kcCwKPiAgIAkJCX0KPiAgIAkJCXBhZ2UgPSB2bV9ub3JtYWxfcGFnZShtaWdy
YXRlLT52bWEsIGFkZHIsIHB0ZSk7Cj4gICAJCQltcGZuID0gbWlncmF0ZV9wZm4ocGZuKSB8IE1J
R1JBVEVfUEZOX01JR1JBVEU7Cj4gLQkJCW1wZm4gfD0gcHRlX3dyaXRlKHB0ZSkgPyBNSUdSQVRF
X1BGTl9XUklURSA6IDA7Cj4gKwkJCWlmIChwdGVfd3JpdGUocHRlKSkKPiArCQkJCXdyaXRhYmxl
ID0gdHJ1ZTsKPiAgIAkJfQo+ICAgCj4gICAJCS8qIEZJWE1FIHN1cHBvcnQgVEhQICovCj4gQEAg
LTIyODQsOCArMjI4Niw3IEBAIHN0YXRpYyBpbnQgbWlncmF0ZV92bWFfY29sbGVjdF9wbWQocG1k
X3QgKnBtZHAsCj4gICAJCQlwdGVwX2dldF9hbmRfY2xlYXIobW0sIGFkZHIsIHB0ZXApOwo+ICAg
Cj4gICAJCQkvKiBTZXR1cCBzcGVjaWFsIG1pZ3JhdGlvbiBwYWdlIHRhYmxlIGVudHJ5ICovCj4g
LQkJCWVudHJ5ID0gbWFrZV9taWdyYXRpb25fZW50cnkocGFnZSwgbXBmbiAmCj4gLQkJCQkJCSAg
ICAgTUlHUkFURV9QRk5fV1JJVEUpOwo+ICsJCQllbnRyeSA9IG1ha2VfbWlncmF0aW9uX2VudHJ5
KHBhZ2UsIHdyaXRhYmxlKTsKPiAgIAkJCXN3cF9wdGUgPSBzd3BfZW50cnlfdG9fcHRlKGVudHJ5
KTsKPiAgIAkJCWlmIChwdGVfc29mdF9kaXJ0eShwdGUpKQo+ICAgCQkJCXN3cF9wdGUgPSBwdGVf
c3dwX21rc29mdF9kaXJ0eShzd3BfcHRlKTsKPiAKCk1JR1JBVEVfUEZOX1dSSVRFIG1heSBtb3Qg
YmVpbmcgdXNlZCBidXQgdGhhdCBzZWVtcyBsaWtlIGEgYnVnIHRvIG1lLgpJZiBhIHBhZ2UgaXMg
bWlncmF0ZWQgdG8gZGV2aWNlIG1lbW9yeSwgaXQgY291bGQgYmUgbWFwcGVkIGF0IHRoZSBzYW1l
CnRpbWUgdG8gYXZvaWQgYSBkZXZpY2UgcGFnZSBmYXVsdCBidXQgaXQgd291bGQgbmVlZCB0aGUg
ZmxhZyB0byBrbm93CndoZXRoZXIgdG8gbWFwIGl0IFJXIG9yIFJPLiBCdXQgSSBzdXBwb3NlIHRo
YXQgY291bGQgYmUgaW5mZXJyZWQgZnJvbQp0aGUgdm1hLT52bV9mbGFncy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
