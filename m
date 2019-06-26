Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC60573E2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 23:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E9B6E528;
	Wed, 26 Jun 2019 21:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868476E526;
 Wed, 26 Jun 2019 21:48:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 14:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; d="scan'208";a="183267604"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2019 14:48:23 -0700
Date: Wed, 26 Jun 2019 14:48:23 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
Message-ID: <20190626214823.GD8399@iweiny-DESK2.sc.intel.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626122724.13313-17-hch@lst.de>
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

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MTVQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIGZ1bmN0aW9uYWxpdHkgaXMgaWRlbnRpY2FsIHRvIHRoZSBvbmUgY3Vy
cmVudGx5IG9wZW4gY29kZWQgaW4KPiBkZXZpY2UtZGF4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJh
LndlaW55QGludGVsLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZGF4L2RheC1wcml2YXRlLmggfCAg
NCAtLS0tCj4gIGRyaXZlcnMvZGF4L2RldmljZS5jICAgICAgfCA0MyAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NyBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kYXgvZGF4LXByaXZhdGUuaCBiL2RyaXZlcnMv
ZGF4L2RheC1wcml2YXRlLmgKPiBpbmRleCBiNDE3N2FhZmJiZDEuLmM5MTU4ODlkMTc2OSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2RheC9kYXgtcHJpdmF0ZS5oCj4gKysrIGIvZHJpdmVycy9kYXgv
ZGF4LXByaXZhdGUuaAo+IEBAIC00Myw4ICs0Myw2IEBAIHN0cnVjdCBkYXhfcmVnaW9uIHsKPiAg
ICogQHRhcmdldF9ub2RlOiBlZmZlY3RpdmUgbnVtYSBub2RlIGlmIGRldl9kYXggbWVtb3J5IHJh
bmdlIGlzIG9ubGluZWQKPiAgICogQGRldiAtIGRldmljZSBjb3JlCj4gICAqIEBwZ21hcCAtIHBn
bWFwIGZvciBtZW1tYXAgc2V0dXAgLyBsaWZldGltZSAoZHJpdmVyIG93bmVkKQo+IC0gKiBAcmVm
OiBwZ21hcCByZWZlcmVuY2UgY291bnQgKGRyaXZlciBvd25lZCkKPiAtICogQGNtcDogQHJlZiBm
aW5hbCBwdXQgY29tcGxldGlvbiAoZHJpdmVyIG93bmVkKQo+ICAgKi8KPiAgc3RydWN0IGRldl9k
YXggewo+ICAJc3RydWN0IGRheF9yZWdpb24gKnJlZ2lvbjsKPiBAQCAtNTIsOCArNTAsNiBAQCBz
dHJ1Y3QgZGV2X2RheCB7Cj4gIAlpbnQgdGFyZ2V0X25vZGU7Cj4gIAlzdHJ1Y3QgZGV2aWNlIGRl
djsKPiAgCXN0cnVjdCBkZXZfcGFnZW1hcCBwZ21hcDsKPiAtCXN0cnVjdCBwZXJjcHVfcmVmIHJl
ZjsKPiAtCXN0cnVjdCBjb21wbGV0aW9uIGNtcDsKPiAgfTsKPiAgCj4gIHN0YXRpYyBpbmxpbmUg
c3RydWN0IGRldl9kYXggKnRvX2Rldl9kYXgoc3RydWN0IGRldmljZSAqZGV2KQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2RheC9kZXZpY2UuYyBiL2RyaXZlcnMvZGF4L2RldmljZS5jCj4gaW5kZXgg
YjUyNTcwMzhjMTg4Li4xYWY4MjNiMmZlNmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kYXgvZGV2
aWNlLmMKPiArKysgYi9kcml2ZXJzL2RheC9kZXZpY2UuYwo+IEBAIC0xNCwzNiArMTQsNiBAQAo+
ICAjaW5jbHVkZSAiZGF4LXByaXZhdGUuaCIKPiAgI2luY2x1ZGUgImJ1cy5oIgo+ICAKPiAtc3Rh
dGljIHN0cnVjdCBkZXZfZGF4ICpyZWZfdG9fZGV2X2RheChzdHJ1Y3QgcGVyY3B1X3JlZiAqcmVm
KQo+IC17Cj4gLQlyZXR1cm4gY29udGFpbmVyX29mKHJlZiwgc3RydWN0IGRldl9kYXgsIHJlZik7
Cj4gLX0KPiAtCj4gLXN0YXRpYyB2b2lkIGRldl9kYXhfcGVyY3B1X3JlbGVhc2Uoc3RydWN0IHBl
cmNwdV9yZWYgKnJlZikKPiAtewo+IC0Jc3RydWN0IGRldl9kYXggKmRldl9kYXggPSByZWZfdG9f
ZGV2X2RheChyZWYpOwo+IC0KPiAtCWRldl9kYmcoJmRldl9kYXgtPmRldiwgIiVzXG4iLCBfX2Z1
bmNfXyk7Cj4gLQljb21wbGV0ZSgmZGV2X2RheC0+Y21wKTsKPiAtfQo+IC0KPiAtc3RhdGljIHZv
aWQgZGV2X2RheF9wZXJjcHVfZXhpdChzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwKQo+IC17Cj4g
LQlzdHJ1Y3QgZGV2X2RheCAqZGV2X2RheCA9IGNvbnRhaW5lcl9vZihwZ21hcCwgc3RydWN0IGRl
dl9kYXgsIHBnbWFwKTsKPiAtCj4gLQlkZXZfZGJnKCZkZXZfZGF4LT5kZXYsICIlc1xuIiwgX19m
dW5jX18pOwo+IC0Jd2FpdF9mb3JfY29tcGxldGlvbigmZGV2X2RheC0+Y21wKTsKPiAtCXBlcmNw
dV9yZWZfZXhpdChwZ21hcC0+cmVmKTsKPiAtfQo+IC0KPiAtc3RhdGljIHZvaWQgZGV2X2RheF9w
ZXJjcHVfa2lsbChzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwKQo+IC17Cj4gLQlzdHJ1Y3QgZGV2
X2RheCAqZGV2X2RheCA9IGNvbnRhaW5lcl9vZihwZ21hcCwgc3RydWN0IGRldl9kYXgsIHBnbWFw
KTsKPiAtCj4gLQlkZXZfZGJnKCZkZXZfZGF4LT5kZXYsICIlc1xuIiwgX19mdW5jX18pOwo+IC0J
cGVyY3B1X3JlZl9raWxsKHBnbWFwLT5yZWYpOwo+IC19Cj4gLQo+ICBzdGF0aWMgaW50IGNoZWNr
X3ZtYShzdHJ1Y3QgZGV2X2RheCAqZGV2X2RheCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
Cj4gIAkJY29uc3QgY2hhciAqZnVuYykKPiAgewo+IEBAIC00NDEsMTEgKzQxMSw2IEBAIHN0YXRp
YyB2b2lkIGRldl9kYXhfa2lsbCh2b2lkICpkZXZfZGF4KQo+ICAJa2lsbF9kZXZfZGF4KGRldl9k
YXgpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wYWdlbWFwX29wcyBkZXZf
ZGF4X3BhZ2VtYXBfb3BzID0gewo+IC0JLmtpbGwJCT0gZGV2X2RheF9wZXJjcHVfa2lsbCwKPiAt
CS5jbGVhbnVwCT0gZGV2X2RheF9wZXJjcHVfZXhpdCwKPiAtfTsKPiAtCj4gIGludCBkZXZfZGF4
X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+ICAJc3RydWN0IGRldl9kYXggKmRldl9k
YXggPSB0b19kZXZfZGF4KGRldik7Cj4gQEAgLTQ2MywxNSArNDI4LDcgQEAgaW50IGRldl9kYXhf
cHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJCXJldHVybiAtRUJVU1k7Cj4gIAl9Cj4gIAo+
IC0JaW5pdF9jb21wbGV0aW9uKCZkZXZfZGF4LT5jbXApOwo+IC0JcmMgPSBwZXJjcHVfcmVmX2lu
aXQoJmRldl9kYXgtPnJlZiwgZGV2X2RheF9wZXJjcHVfcmVsZWFzZSwgMCwKPiAtCQkJR0ZQX0tF
Uk5FTCk7Cj4gLQlpZiAocmMpCj4gLQkJcmV0dXJuIHJjOwo+IC0KPiAtCWRldl9kYXgtPnBnbWFw
LnJlZiA9ICZkZXZfZGF4LT5yZWY7Cj4gIAlkZXZfZGF4LT5wZ21hcC50eXBlID0gTUVNT1JZX0RF
VklDRV9ERVZEQVg7Cj4gLQlkZXZfZGF4LT5wZ21hcC5vcHMgPSAmZGV2X2RheF9wYWdlbWFwX29w
czsKPiAgCWFkZHIgPSBkZXZtX21lbXJlbWFwX3BhZ2VzKGRldiwgJmRldl9kYXgtPnBnbWFwKTsK
PiAgCWlmIChJU19FUlIoYWRkcikpCj4gIAkJcmV0dXJuIFBUUl9FUlIoYWRkcik7Cj4gLS0gCj4g
Mi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1udmRpbW0gbWFpbGluZyBsaXN0Cj4gTGludXgtbnZkaW1tQGxpc3RzLjAxLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbnZkaW1tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
