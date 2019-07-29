Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1A79CFC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC0289F4F;
	Mon, 29 Jul 2019 23:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0903A89F4F;
 Mon, 29 Jul 2019 23:46:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91FA74627A;
 Mon, 29 Jul 2019 23:46:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-31.rdu2.redhat.com [10.10.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4798C19C58;
 Mon, 29 Jul 2019 23:46:14 +0000 (UTC)
Date: Mon, 29 Jul 2019 19:46:11 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
Message-ID: <20190729234611.GC7171@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-10-hch@lst.de>
 <1f0ef337-6ca5-54fa-e627-41a46be73f2b@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f0ef337-6ca5-54fa-e627-41a46be73f2b@nvidia.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 29 Jul 2019 23:46:18 +0000 (UTC)
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
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6NDI6MDFQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gNy8yOS8xOSA3OjI4IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
PiA+IFRoZSBNSUdSQVRFX1BGTl9XUklURSBpcyBvbmx5IHVzZWQgbG9jYWxseSBpbiBtaWdyYXRl
X3ZtYV9jb2xsZWN0X3BtZCwKPiA+IHdoZXJlIGl0IGNhbiBiZSByZXBsYWNlZCB3aXRoIGEgc2lt
cGxlIGJvb2xlYW4gbG9jYWwgdmFyaWFibGUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAo+IFJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVs
bCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4gCj4gPiAtLS0KPiA+ICAgaW5jbHVkZS9saW51eC9t
aWdyYXRlLmggfCAxIC0KPiA+ICAgbW0vbWlncmF0ZS5jICAgICAgICAgICAgfCA5ICsrKysrLS0t
LQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oIGIvaW5jbHVkZS9s
aW51eC9taWdyYXRlLmgKPiA+IGluZGV4IDhiNDZjZmRiMWEwZS4uYmE3NGVmNWE3NzAyIDEwMDY0
NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9taWdyYXRlLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvbWlncmF0ZS5oCj4gPiBAQCAtMTY1LDcgKzE2NSw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IG1p
Z3JhdGVfbWlzcGxhY2VkX3RyYW5zaHVnZV9wYWdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ID4g
ICAjZGVmaW5lIE1JR1JBVEVfUEZOX1ZBTElECSgxVUwgPDwgMCkKPiA+ICAgI2RlZmluZSBNSUdS
QVRFX1BGTl9NSUdSQVRFCSgxVUwgPDwgMSkKPiA+ICAgI2RlZmluZSBNSUdSQVRFX1BGTl9MT0NL
RUQJKDFVTCA8PCAyKQo+ID4gLSNkZWZpbmUgTUlHUkFURV9QRk5fV1JJVEUJKDFVTCA8PCAzKQo+
ID4gICAjZGVmaW5lIE1JR1JBVEVfUEZOX1NISUZUCTYKPiA+ICAgc3RhdGljIGlubGluZSBzdHJ1
Y3QgcGFnZSAqbWlncmF0ZV9wZm5fdG9fcGFnZSh1bnNpZ25lZCBsb25nIG1wZm4pCj4gPiBkaWZm
IC0tZ2l0IGEvbW0vbWlncmF0ZS5jIGIvbW0vbWlncmF0ZS5jCj4gPiBpbmRleCA3NDczNTI1NmUy
NjAuLjcyNGY5MmRjYzMxYiAxMDA2NDQKPiA+IC0tLSBhL21tL21pZ3JhdGUuYwo+ID4gKysrIGIv
bW0vbWlncmF0ZS5jCj4gPiBAQCAtMjIxMiw2ICsyMjEyLDcgQEAgc3RhdGljIGludCBtaWdyYXRl
X3ZtYV9jb2xsZWN0X3BtZChwbWRfdCAqcG1kcCwKPiA+ICAgCQl1bnNpZ25lZCBsb25nIG1wZm4s
IHBmbjsKPiA+ICAgCQlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiA+ICAgCQlzd3BfZW50cnlfdCBlbnRy
eTsKPiA+ICsJCWJvb2wgd3JpdGFibGUgPSBmYWxzZTsKPiA+ICAgCQlwdGVfdCBwdGU7Cj4gPiAg
IAkJcHRlID0gKnB0ZXA7Cj4gPiBAQCAtMjI0MCw3ICsyMjQxLDcgQEAgc3RhdGljIGludCBtaWdy
YXRlX3ZtYV9jb2xsZWN0X3BtZChwbWRfdCAqcG1kcCwKPiA+ICAgCQkJbXBmbiA9IG1pZ3JhdGVf
cGZuKHBhZ2VfdG9fcGZuKHBhZ2UpKSB8Cj4gPiAgIAkJCQkJTUlHUkFURV9QRk5fTUlHUkFURTsK
PiA+ICAgCQkJaWYgKGlzX3dyaXRlX2RldmljZV9wcml2YXRlX2VudHJ5KGVudHJ5KSkKPiA+IC0J
CQkJbXBmbiB8PSBNSUdSQVRFX1BGTl9XUklURTsKPiA+ICsJCQkJd3JpdGFibGUgPSB0cnVlOwo+
ID4gICAJCX0gZWxzZSB7Cj4gPiAgIAkJCWlmIChpc196ZXJvX3BmbihwZm4pKSB7Cj4gPiAgIAkJ
CQltcGZuID0gTUlHUkFURV9QRk5fTUlHUkFURTsKPiA+IEBAIC0yMjUwLDcgKzIyNTEsOCBAQCBz
dGF0aWMgaW50IG1pZ3JhdGVfdm1hX2NvbGxlY3RfcG1kKHBtZF90ICpwbWRwLAo+ID4gICAJCQl9
Cj4gPiAgIAkJCXBhZ2UgPSB2bV9ub3JtYWxfcGFnZShtaWdyYXRlLT52bWEsIGFkZHIsIHB0ZSk7
Cj4gPiAgIAkJCW1wZm4gPSBtaWdyYXRlX3BmbihwZm4pIHwgTUlHUkFURV9QRk5fTUlHUkFURTsK
PiA+IC0JCQltcGZuIHw9IHB0ZV93cml0ZShwdGUpID8gTUlHUkFURV9QRk5fV1JJVEUgOiAwOwo+
ID4gKwkJCWlmIChwdGVfd3JpdGUocHRlKSkKPiA+ICsJCQkJd3JpdGFibGUgPSB0cnVlOwo+ID4g
ICAJCX0KPiA+ICAgCQkvKiBGSVhNRSBzdXBwb3J0IFRIUCAqLwo+ID4gQEAgLTIyODQsOCArMjI4
Niw3IEBAIHN0YXRpYyBpbnQgbWlncmF0ZV92bWFfY29sbGVjdF9wbWQocG1kX3QgKnBtZHAsCj4g
PiAgIAkJCXB0ZXBfZ2V0X2FuZF9jbGVhcihtbSwgYWRkciwgcHRlcCk7Cj4gPiAgIAkJCS8qIFNl
dHVwIHNwZWNpYWwgbWlncmF0aW9uIHBhZ2UgdGFibGUgZW50cnkgKi8KPiA+IC0JCQllbnRyeSA9
IG1ha2VfbWlncmF0aW9uX2VudHJ5KHBhZ2UsIG1wZm4gJgo+ID4gLQkJCQkJCSAgICAgTUlHUkFU
RV9QRk5fV1JJVEUpOwo+ID4gKwkJCWVudHJ5ID0gbWFrZV9taWdyYXRpb25fZW50cnkocGFnZSwg
d3JpdGFibGUpOwo+ID4gICAJCQlzd3BfcHRlID0gc3dwX2VudHJ5X3RvX3B0ZShlbnRyeSk7Cj4g
PiAgIAkJCWlmIChwdGVfc29mdF9kaXJ0eShwdGUpKQo+ID4gICAJCQkJc3dwX3B0ZSA9IHB0ZV9z
d3BfbWtzb2Z0X2RpcnR5KHN3cF9wdGUpOwo+ID4gCj4gCj4gTUlHUkFURV9QRk5fV1JJVEUgbWF5
IG1vdCBiZWluZyB1c2VkIGJ1dCB0aGF0IHNlZW1zIGxpa2UgYSBidWcgdG8gbWUuCj4gSWYgYSBw
YWdlIGlzIG1pZ3JhdGVkIHRvIGRldmljZSBtZW1vcnksIGl0IGNvdWxkIGJlIG1hcHBlZCBhdCB0
aGUgc2FtZQo+IHRpbWUgdG8gYXZvaWQgYSBkZXZpY2UgcGFnZSBmYXVsdCBidXQgaXQgd291bGQg
bmVlZCB0aGUgZmxhZyB0byBrbm93Cj4gd2hldGhlciB0byBtYXAgaXQgUlcgb3IgUk8uIEJ1dCBJ
IHN1cHBvc2UgdGhhdCBjb3VsZCBiZSBpbmZlcnJlZCBmcm9tCj4gdGhlIHZtYS0+dm1fZmxhZ3Mu
CgpJdCBpcyBhIGJ1ZyB0aGF0IGl0IGlzIG5vdCBiZWluZyB1c2UgcmlnaHQgbm93LiBJIHdpbGwg
aGF2ZSB0byBkaWcgbXkKZ2l0IHJlcG8gdG8gc2VlIHdoZW4gdGhhdCBnb3Qga2lsbC4gV2lsbCBs
b29rIGludG8gaXQgb25jZSBpIGdldCBiYWNrLgoKVGhlIHZtYS0+dm1fZmxhZ3MgaXMgb2Ygbm8g
dXNlIGhlcmUuIEEgcGFnZSBjYW4gYmUgd3JpdGUgcHJvdGVjdGVkCmluc2lkZSBhIHdyaXRhYmxl
IHZtYSBmb3IgdmFyaW91cyByZWFzb25zLgoKQ2hlZXJzLApKw6lyw7RtZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
