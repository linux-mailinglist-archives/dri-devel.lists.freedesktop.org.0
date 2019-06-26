Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC8957037
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 20:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2126E4CB;
	Wed, 26 Jun 2019 18:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1275F6E4B5;
 Wed, 26 Jun 2019 18:01:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 11:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="164032950"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jun 2019 11:01:22 -0700
Date: Wed, 26 Jun 2019 11:01:22 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/25] memremap: validate the pagemap type passed to
 devm_memremap_pages
Message-ID: <20190626180122.GB4605@iweiny-DESK2.sc.intel.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626122724.13313-9-hch@lst.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MDdQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gTW9zdCBwZ21hcCB0eXBlcyBhcmUgb25seSBzdXBwb3J0ZWQgd2hlbiBjZXJ0
YWluIGNvbmZpZyBvcHRpb25zIGFyZQo+IGVuYWJsZWQuICBDaGVjayBmb3IgYSB0eXBlIHRoYXQg
aXMgdmFsaWQgZm9yIHRoZSBjdXJyZW50IGNvbmZpZ3VyYXRpb24KPiBiZWZvcmUgc2V0dGluZyB1
cCB0aGUgcGFnZW1hcC4gIEZvciB0aGlzIHRoZSB1c2FnZSBvZiB0aGUgMCB0eXBlIGZvcgo+IGRl
dmljZSBkYXggZ2V0cyByZXBsYWNlZCB3aXRoIGFuIGV4cGxpY2l0IE1FTU9SWV9ERVZJQ0VfREVW
REFYIHR5cGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+CgpSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKPiAtLS0K
PiAgZHJpdmVycy9kYXgvZGV2aWNlLmMgICAgIHwgIDEgKwo+ICBpbmNsdWRlL2xpbnV4L21lbXJl
bWFwLmggfCAgOCArKysrKysrKwo+ICBrZXJuZWwvbWVtcmVtYXAuYyAgICAgICAgfCAyMiArKysr
KysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RheC9kZXZpY2UuYyBiL2RyaXZlcnMvZGF4L2Rldmlj
ZS5jCj4gaW5kZXggODQ2NWQxMmZlY2JhLi43OTAxNGJhYTc4MmQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9kYXgvZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2RheC9kZXZpY2UuYwo+IEBAIC00Njgs
NiArNDY4LDcgQEAgaW50IGRldl9kYXhfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJZGV2
X2RheC0+cGdtYXAucmVmID0gJmRldl9kYXgtPnJlZjsKPiAgCWRldl9kYXgtPnBnbWFwLmtpbGwg
PSBkZXZfZGF4X3BlcmNwdV9raWxsOwo+ICAJZGV2X2RheC0+cGdtYXAuY2xlYW51cCA9IGRldl9k
YXhfcGVyY3B1X2V4aXQ7Cj4gKwlkZXZfZGF4LT5wZ21hcC50eXBlID0gTUVNT1JZX0RFVklDRV9E
RVZEQVg7Cj4gIAlhZGRyID0gZGV2bV9tZW1yZW1hcF9wYWdlcyhkZXYsICZkZXZfZGF4LT5wZ21h
cCk7Cj4gIAlpZiAoSVNfRVJSKGFkZHIpKQo+ICAJCXJldHVybiBQVFJfRVJSKGFkZHIpOwo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggYi9pbmNsdWRlL2xpbnV4L21lbXJl
bWFwLmgKPiBpbmRleCA5OTVjNjJjNWE0OGIuLjBjODZmMmM1YWM5YyAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L21lbXJlbWFwLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21lbXJlbWFwLmgK
PiBAQCAtNDUsMTMgKzQ1LDIxIEBAIHN0cnVjdCB2bWVtX2FsdG1hcCB7Cj4gICAqIHdha2V1cCBp
cyB1c2VkIHRvIGNvb3JkaW5hdGUgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSBtYW5hZ2VtZW50IChl
eDoKPiAgICogZnMgdHJ1bmNhdGUvaG9sZSBwdW5jaCkgdnMgcGlubmVkIHBhZ2VzIChleDogZGV2
aWNlIGRtYSkuCj4gICAqCj4gKyAqIE1FTU9SWV9ERVZJQ0VfREVWREFYOgo+ICsgKiBIb3N0IG1l
bW9yeSB0aGF0IGhhcyBzaW1pbGFyIGFjY2VzcyBzZW1hbnRpY3MgYXMgU3lzdGVtIFJBTSBpLmUu
IERNQQo+ICsgKiBjb2hlcmVudCBhbmQgc3VwcG9ydHMgcGFnZSBwaW5uaW5nLiBJbiBjb250cmFz
dCB0bwo+ICsgKiBNRU1PUllfREVWSUNFX0ZTX0RBWCwgdGhpcyBtZW1vcnkgaXMgYWNjZXNzIHZp
YSBhIGRldmljZS1kYXgKPiArICogY2hhcmFjdGVyIGRldmljZS4KPiArICoKPiAgICogTUVNT1JZ
X0RFVklDRV9QQ0lfUDJQRE1BOgo+ICAgKiBEZXZpY2UgbWVtb3J5IHJlc2lkaW5nIGluIGEgUENJ
IEJBUiBpbnRlbmRlZCBmb3IgdXNlIHdpdGggUGVlci10by1QZWVyCj4gICAqIHRyYW5zYWN0aW9u
cy4KPiAgICovCj4gIGVudW0gbWVtb3J5X3R5cGUgewo+ICsJLyogMCBpcyByZXNlcnZlZCB0byBj
YXRjaCB1bmluaXRpYWxpemVkIHR5cGUgZmllbGRzICovCj4gIAlNRU1PUllfREVWSUNFX1BSSVZB
VEUgPSAxLAo+ICAJTUVNT1JZX0RFVklDRV9GU19EQVgsCj4gKwlNRU1PUllfREVWSUNFX0RFVkRB
WCwKPiAgCU1FTU9SWV9ERVZJQ0VfUENJX1AyUERNQSwKPiAgfTsKPiAgCj4gZGlmZiAtLWdpdCBh
L2tlcm5lbC9tZW1yZW1hcC5jIGIva2VybmVsL21lbXJlbWFwLmMKPiBpbmRleCA2ZTE5NzA3MTlk
YzIuLmFiZGE2MmQxZTVhMyAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvbWVtcmVtYXAuYwo+ICsrKyBi
L2tlcm5lbC9tZW1yZW1hcC5jCj4gQEAgLTE1Nyw2ICsxNTcsMjggQEAgdm9pZCAqZGV2bV9tZW1y
ZW1hcF9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAp
Cj4gIAlwZ3Byb3RfdCBwZ3Byb3QgPSBQQUdFX0tFUk5FTDsKPiAgCWludCBlcnJvciwgbmlkLCBp
c19yYW07Cj4gIAo+ICsJc3dpdGNoIChwZ21hcC0+dHlwZSkgewo+ICsJY2FzZSBNRU1PUllfREVW
SUNFX1BSSVZBVEU6Cj4gKwkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19ERVZJQ0VfUFJJVkFURSkp
IHsKPiArCQkJV0FSTigxLCAiRGV2aWNlIHByaXZhdGUgbWVtb3J5IG5vdCBzdXBwb3J0ZWRcbiIp
Owo+ICsJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiArCQl9Cj4gKwkJYnJlYWs7Cj4gKwlj
YXNlIE1FTU9SWV9ERVZJQ0VfRlNfREFYOgo+ICsJCWlmICghSVNfRU5BQkxFRChDT05GSUdfWk9O
RV9ERVZJQ0UpIHx8Cj4gKwkJICAgIElTX0VOQUJMRUQoQ09ORklHX0ZTX0RBWF9MSU1JVEVEKSkg
ewo+ICsJCQlXQVJOKDEsICJGaWxlIHN5c3RlbSBEQVggbm90IHN1cHBvcnRlZFxuIik7Cj4gKwkJ
CXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ICsJCX0KPiArCQlicmVhazsKPiArCWNhc2UgTUVN
T1JZX0RFVklDRV9ERVZEQVg6Cj4gKwljYXNlIE1FTU9SWV9ERVZJQ0VfUENJX1AyUERNQToKPiAr
CQlicmVhazsKPiArCWRlZmF1bHQ6Cj4gKwkJV0FSTigxLCAiSW52YWxpZCBwZ21hcCB0eXBlICVk
XG4iLCBwZ21hcC0+dHlwZSk7Cj4gKwkJYnJlYWs7Cj4gKwl9Cj4gKwo+ICAJaWYgKCFwZ21hcC0+
cmVmIHx8ICFwZ21hcC0+a2lsbCB8fCAhcGdtYXAtPmNsZWFudXApIHsKPiAgCQlXQVJOKDEsICJN
aXNzaW5nIHJlZmVyZW5jZSBjb3VudCB0ZWFyZG93biBkZWZpbml0aW9uXG4iKTsKPiAgCQlyZXR1
cm4gRVJSX1BUUigtRUlOVkFMKTsKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW52ZGltbSBtYWlsaW5nIGxp
c3QKPiBMaW51eC1udmRpbW1AbGlzdHMuMDEub3JnCj4gaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1udmRpbW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
