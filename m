Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188B79CD5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2496E2C7;
	Mon, 29 Jul 2019 23:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D8F6E2CE;
 Mon, 29 Jul 2019 23:30:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 72E2E5AFF8;
 Mon, 29 Jul 2019 23:30:51 +0000 (UTC)
Received: from redhat.com (ovpn-112-31.rdu2.redhat.com [10.10.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58E1C19C58;
 Mon, 29 Jul 2019 23:30:48 +0000 (UTC)
Date: Mon, 29 Jul 2019 19:30:44 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
Message-ID: <20190729233044.GA7171@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729142843.22320-10-hch@lst.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 29 Jul 2019 23:30:51 +0000 (UTC)
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDU6Mjg6NDNQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIE1JR1JBVEVfUEZOX1dSSVRFIGlzIG9ubHkgdXNlZCBsb2NhbGx5IGlu
IG1pZ3JhdGVfdm1hX2NvbGxlY3RfcG1kLAo+IHdoZXJlIGl0IGNhbiBiZSByZXBsYWNlZCB3aXRo
IGEgc2ltcGxlIGJvb2xlYW4gbG9jYWwgdmFyaWFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpOQUsgdGhhdCBmbGFnIGlzIHVzZWZ1bCwgZm9y
IGluc3RhbmNlIGEgYW5vbnltb3VzIHZtYSBtaWdodCBoYXZlCnNvbWUgb2YgaXRzIHBhZ2UgcmVh
ZCBvbmx5IGV2ZW4gaWYgdGhlIHZtYSBoYXMgd3JpdGUgcGVybWlzc2lvbi4KCkl0IHNlZW1zIHRo
YXQgdGhlIGNvZGUgaW4gbm91dmVhdSBpcyB3cm9uZyAocHJvYmFibHkgbG9zdCB0aGF0CmluIHZh
cmlvdXMgcmViYXNlL3Jld29yaykgYXMgdGhpcyBmbGFnIHNob3VsZCBiZSB1c2UgdG8gZGVjaWRl
CndldGhlciB0byBtYXAgdGhlIGRldmljZSBtZW1vcnkgd2l0aCB3cml0ZSBwZXJtaXNzaW9uIG9y
IG5vdC4KCkkgYW0gdHJhdmVsaW5nIHJpZ2h0IG5vdywgaSB3aWxsIGludmVzdGlnYXRlIHdoYXQg
aGFwcGVuZWQgdG8Kbm91dmVhdSBjb2RlLgoKQ2hlZXJzLApKw6lyw7RtZQoKPiAtLS0KPiAgaW5j
bHVkZS9saW51eC9taWdyYXRlLmggfCAxIC0KPiAgbW0vbWlncmF0ZS5jICAgICAgICAgICAgfCA5
ICsrKysrLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9taWdyYXRlLmggYi9pbmNsdWRl
L2xpbnV4L21pZ3JhdGUuaAo+IGluZGV4IDhiNDZjZmRiMWEwZS4uYmE3NGVmNWE3NzAyIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9t
aWdyYXRlLmgKPiBAQCAtMTY1LDcgKzE2NSw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IG1pZ3JhdGVf
bWlzcGxhY2VkX3RyYW5zaHVnZV9wYWdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICAjZGVmaW5l
IE1JR1JBVEVfUEZOX1ZBTElECSgxVUwgPDwgMCkKPiAgI2RlZmluZSBNSUdSQVRFX1BGTl9NSUdS
QVRFCSgxVUwgPDwgMSkKPiAgI2RlZmluZSBNSUdSQVRFX1BGTl9MT0NLRUQJKDFVTCA8PCAyKQo+
IC0jZGVmaW5lIE1JR1JBVEVfUEZOX1dSSVRFCSgxVUwgPDwgMykKPiAgI2RlZmluZSBNSUdSQVRF
X1BGTl9TSElGVAk2Cj4gIAo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICptaWdyYXRlX3Bm
bl90b19wYWdlKHVuc2lnbmVkIGxvbmcgbXBmbikKPiBkaWZmIC0tZ2l0IGEvbW0vbWlncmF0ZS5j
IGIvbW0vbWlncmF0ZS5jCj4gaW5kZXggNzQ3MzUyNTZlMjYwLi43MjRmOTJkY2MzMWIgMTAwNjQ0
Cj4gLS0tIGEvbW0vbWlncmF0ZS5jCj4gKysrIGIvbW0vbWlncmF0ZS5jCj4gQEAgLTIyMTIsNiAr
MjIxMiw3IEBAIHN0YXRpYyBpbnQgbWlncmF0ZV92bWFfY29sbGVjdF9wbWQocG1kX3QgKnBtZHAs
Cj4gIAkJdW5zaWduZWQgbG9uZyBtcGZuLCBwZm47Cj4gIAkJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4g
IAkJc3dwX2VudHJ5X3QgZW50cnk7Cj4gKwkJYm9vbCB3cml0YWJsZSA9IGZhbHNlOwo+ICAJCXB0
ZV90IHB0ZTsKPiAgCj4gIAkJcHRlID0gKnB0ZXA7Cj4gQEAgLTIyNDAsNyArMjI0MSw3IEBAIHN0
YXRpYyBpbnQgbWlncmF0ZV92bWFfY29sbGVjdF9wbWQocG1kX3QgKnBtZHAsCj4gIAkJCW1wZm4g
PSBtaWdyYXRlX3BmbihwYWdlX3RvX3BmbihwYWdlKSkgfAo+ICAJCQkJCU1JR1JBVEVfUEZOX01J
R1JBVEU7Cj4gIAkJCWlmIChpc193cml0ZV9kZXZpY2VfcHJpdmF0ZV9lbnRyeShlbnRyeSkpCj4g
LQkJCQltcGZuIHw9IE1JR1JBVEVfUEZOX1dSSVRFOwo+ICsJCQkJd3JpdGFibGUgPSB0cnVlOwo+
ICAJCX0gZWxzZSB7Cj4gIAkJCWlmIChpc196ZXJvX3BmbihwZm4pKSB7Cj4gIAkJCQltcGZuID0g
TUlHUkFURV9QRk5fTUlHUkFURTsKPiBAQCAtMjI1MCw3ICsyMjUxLDggQEAgc3RhdGljIGludCBt
aWdyYXRlX3ZtYV9jb2xsZWN0X3BtZChwbWRfdCAqcG1kcCwKPiAgCQkJfQo+ICAJCQlwYWdlID0g
dm1fbm9ybWFsX3BhZ2UobWlncmF0ZS0+dm1hLCBhZGRyLCBwdGUpOwo+ICAJCQltcGZuID0gbWln
cmF0ZV9wZm4ocGZuKSB8IE1JR1JBVEVfUEZOX01JR1JBVEU7Cj4gLQkJCW1wZm4gfD0gcHRlX3dy
aXRlKHB0ZSkgPyBNSUdSQVRFX1BGTl9XUklURSA6IDA7Cj4gKwkJCWlmIChwdGVfd3JpdGUocHRl
KSkKPiArCQkJCXdyaXRhYmxlID0gdHJ1ZTsKPiAgCQl9Cj4gIAo+ICAJCS8qIEZJWE1FIHN1cHBv
cnQgVEhQICovCj4gQEAgLTIyODQsOCArMjI4Niw3IEBAIHN0YXRpYyBpbnQgbWlncmF0ZV92bWFf
Y29sbGVjdF9wbWQocG1kX3QgKnBtZHAsCj4gIAkJCXB0ZXBfZ2V0X2FuZF9jbGVhcihtbSwgYWRk
ciwgcHRlcCk7Cj4gIAo+ICAJCQkvKiBTZXR1cCBzcGVjaWFsIG1pZ3JhdGlvbiBwYWdlIHRhYmxl
IGVudHJ5ICovCj4gLQkJCWVudHJ5ID0gbWFrZV9taWdyYXRpb25fZW50cnkocGFnZSwgbXBmbiAm
Cj4gLQkJCQkJCSAgICAgTUlHUkFURV9QRk5fV1JJVEUpOwo+ICsJCQllbnRyeSA9IG1ha2VfbWln
cmF0aW9uX2VudHJ5KHBhZ2UsIHdyaXRhYmxlKTsKPiAgCQkJc3dwX3B0ZSA9IHN3cF9lbnRyeV90
b19wdGUoZW50cnkpOwo+ICAJCQlpZiAocHRlX3NvZnRfZGlydHkocHRlKSkKPiAgCQkJCXN3cF9w
dGUgPSBwdGVfc3dwX21rc29mdF9kaXJ0eShzd3BfcHRlKTsKPiAtLSAKPiAyLjIwLjEKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
