Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356A0499FA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DED66E0E7;
	Tue, 18 Jun 2019 07:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2662488BBA;
 Mon, 17 Jun 2019 20:10:18 +0000 (UTC)
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1hcxxI-0004rl-Iq; Mon, 17 Jun 2019 14:10:17 -0600
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-17-hch@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <e404fb0b-4ed8-34bb-7df8-9b59cb760f53@deltatee.com>
Date: Mon, 17 Jun 2019 14:10:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617122733.22432-17-hch@lst.de>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: nouveau@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-nvdimm@lists.01.org, bskeggs@redhat.com,
 jgg@mellanox.com, jglisse@redhat.com, dan.j.williams@intel.com, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE,MYRULES_FREE autolearn=ham autolearn_force=no
 version=3.4.2
Subject: Re: [PATCH 16/25] PCI/P2PDMA: use the dev_pagemap internal refcount
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
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
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA2LTE3IDY6MjcgYS5tLiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVGhl
IGZ1bmN0aW9uYWxpdHkgaXMgaWRlbnRpY2FsIHRvIHRoZSBvbmUgY3VycmVudGx5IG9wZW4gY29k
ZWQgaW4KPiBwMnBkbWEuYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4KClJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRl
ZS5jb20+CgpJIGFsc28gZGlkIGEgcXVpY2sgdGVzdCB3aXRoIHRoZSBmdWxsIHBhdGNoLXNldCB0
byBlbnN1cmUgdGhhdCB0aGUgc2V0dXAKYW5kIHRlYXIgZG93biBwYXRocyBmb3IgcDJwZG1hIHN0
aWxsIHdvcmsgY29ycmVjdGx5IGFuZCBpdCBhbGwgZG9lcy4KClRoYW5rcywKCkxvZ2FuCgo+IC0t
LQo+ICBkcml2ZXJzL3BjaS9wMnBkbWEuYyB8IDU2ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wMnBkbWEuYyBiL2Ry
aXZlcnMvcGNpL3AycGRtYS5jCj4gaW5kZXggNDhhODgxNThlNDZhLi42MDhmODRkZjYwNGEgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9wY2kvcDJwZG1hLmMKPiArKysgYi9kcml2ZXJzL3BjaS9wMnBk
bWEuYwo+IEBAIC0yNCwxMiArMjQsNiBAQCBzdHJ1Y3QgcGNpX3AycGRtYSB7Cj4gIAlib29sIHAy
cG1lbV9wdWJsaXNoZWQ7Cj4gIH07Cj4gIAo+IC1zdHJ1Y3QgcDJwZG1hX3BhZ2VtYXAgewo+IC0J
c3RydWN0IGRldl9wYWdlbWFwIHBnbWFwOwo+IC0Jc3RydWN0IHBlcmNwdV9yZWYgcmVmOwo+IC0J
c3RydWN0IGNvbXBsZXRpb24gcmVmX2RvbmU7Cj4gLX07Cj4gLQo+ICBzdGF0aWMgc3NpemVfdCBz
aXplX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwKPiAgCQkJIGNoYXIgKmJ1ZikKPiAgewo+IEBAIC03OCwzMiArNzIsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBwMnBtZW1fZ3JvdXAgPSB7Cj4gIAkubmFtZSA9ICJw
MnBtZW0iLAo+ICB9Owo+ICAKPiAtc3RhdGljIHN0cnVjdCBwMnBkbWFfcGFnZW1hcCAqdG9fcDJw
X3BnbWFwKHN0cnVjdCBwZXJjcHVfcmVmICpyZWYpCj4gLXsKPiAtCXJldHVybiBjb250YWluZXJf
b2YocmVmLCBzdHJ1Y3QgcDJwZG1hX3BhZ2VtYXAsIHJlZik7Cj4gLX0KPiAtCj4gLXN0YXRpYyB2
b2lkIHBjaV9wMnBkbWFfcGVyY3B1X3JlbGVhc2Uoc3RydWN0IHBlcmNwdV9yZWYgKnJlZikKPiAt
ewo+IC0Jc3RydWN0IHAycGRtYV9wYWdlbWFwICpwMnBfcGdtYXAgPSB0b19wMnBfcGdtYXAocmVm
KTsKPiAtCj4gLQljb21wbGV0ZSgmcDJwX3BnbWFwLT5yZWZfZG9uZSk7Cj4gLX0KPiAtCj4gLXN0
YXRpYyB2b2lkIHBjaV9wMnBkbWFfcGVyY3B1X2tpbGwoc3RydWN0IGRldl9wYWdlbWFwICpwZ21h
cCkKPiAtewo+IC0JcGVyY3B1X3JlZl9raWxsKHBnbWFwLT5yZWYpOwo+IC19Cj4gLQo+IC1zdGF0
aWMgdm9pZCBwY2lfcDJwZG1hX3BlcmNwdV9jbGVhbnVwKHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdt
YXApCj4gLXsKPiAtCXN0cnVjdCBwMnBkbWFfcGFnZW1hcCAqcDJwX3BnbWFwID0KPiAtCQljb250
YWluZXJfb2YocGdtYXAsIHN0cnVjdCBwMnBkbWFfcGFnZW1hcCwgcGdtYXApOwo+IC0KPiAtCXdh
aXRfZm9yX2NvbXBsZXRpb24oJnAycF9wZ21hcC0+cmVmX2RvbmUpOwo+IC0JcGVyY3B1X3JlZl9l
eGl0KCZwMnBfcGdtYXAtPnJlZik7Cj4gLX0KPiAtCj4gIHN0YXRpYyB2b2lkIHBjaV9wMnBkbWFf
cmVsZWFzZSh2b2lkICpkYXRhKQo+ICB7Cj4gIAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGRhdGE7
Cj4gQEAgLTE1MywxMSArMTIxLDYgQEAgc3RhdGljIGludCBwY2lfcDJwZG1hX3NldHVwKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQo+ICAJcmV0dXJuIGVycm9yOwo+ICB9Cj4gIAo+IC1zdGF0aWMgY29u
c3Qgc3RydWN0IGRldl9wYWdlbWFwX29wcyBwY2lfcDJwZG1hX3BhZ2VtYXBfb3BzID0gewo+IC0J
LmtpbGwJCT0gcGNpX3AycGRtYV9wZXJjcHVfa2lsbCwKPiAtCS5jbGVhbnVwCT0gcGNpX3AycGRt
YV9wZXJjcHVfY2xlYW51cCwKPiAtfTsKPiAtCj4gIC8qKgo+ICAgKiBwY2lfcDJwZG1hX2FkZF9y
ZXNvdXJjZSAtIGFkZCBtZW1vcnkgZm9yIHVzZSBhcyBwMnAgbWVtb3J5Cj4gICAqIEBwZGV2OiB0
aGUgZGV2aWNlIHRvIGFkZCB0aGUgbWVtb3J5IHRvCj4gQEAgLTE3MSw3ICsxMzQsNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRldl9wYWdlbWFwX29wcyBwY2lfcDJwZG1hX3BhZ2VtYXBfb3BzID0g
ewo+ICBpbnQgcGNpX3AycGRtYV9hZGRfcmVzb3VyY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGlu
dCBiYXIsIHNpemVfdCBzaXplLAo+ICAJCQkgICAgdTY0IG9mZnNldCkKPiAgewo+IC0Jc3RydWN0
IHAycGRtYV9wYWdlbWFwICpwMnBfcGdtYXA7Cj4gIAlzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFw
Owo+ICAJdm9pZCAqYWRkcjsKPiAgCWludCBlcnJvcjsKPiBAQCAtMTk0LDIyICsxNTYsMTIgQEAg
aW50IHBjaV9wMnBkbWFfYWRkX3Jlc291cmNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBpbnQgYmFy
LCBzaXplX3Qgc2l6ZSwKPiAgCQkJcmV0dXJuIGVycm9yOwo+ICAJfQo+ICAKPiAtCXAycF9wZ21h
cCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnAycF9wZ21hcCksIEdGUF9LRVJO
RUwpOwo+IC0JaWYgKCFwMnBfcGdtYXApCj4gKwlwZ21hcCA9IGRldm1fa3phbGxvYygmcGRldi0+
ZGV2LCBzaXplb2YoKnBnbWFwKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIXBnbWFwKQo+ICAJCXJl
dHVybiAtRU5PTUVNOwo+IC0KPiAtCWluaXRfY29tcGxldGlvbigmcDJwX3BnbWFwLT5yZWZfZG9u
ZSk7Cj4gLQllcnJvciA9IHBlcmNwdV9yZWZfaW5pdCgmcDJwX3BnbWFwLT5yZWYsCj4gLQkJCXBj
aV9wMnBkbWFfcGVyY3B1X3JlbGVhc2UsIDAsIEdGUF9LRVJORUwpOwo+IC0JaWYgKGVycm9yKQo+
IC0JCWdvdG8gcGdtYXBfZnJlZTsKPiAtCj4gLQlwZ21hcCA9ICZwMnBfcGdtYXAtPnBnbWFwOwo+
IC0KPiAgCXBnbWFwLT5yZXMuc3RhcnQgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgYmFyKSAr
IG9mZnNldDsKPiAgCXBnbWFwLT5yZXMuZW5kID0gcGdtYXAtPnJlcy5zdGFydCArIHNpemUgLSAx
Owo+ICAJcGdtYXAtPnJlcy5mbGFncyA9IHBjaV9yZXNvdXJjZV9mbGFncyhwZGV2LCBiYXIpOwo+
IC0JcGdtYXAtPnJlZiA9ICZwMnBfcGdtYXAtPnJlZjsKPiAgCXBnbWFwLT50eXBlID0gTUVNT1JZ
X0RFVklDRV9QQ0lfUDJQRE1BOwo+ICAJcGdtYXAtPnBjaV9wMnBkbWFfYnVzX29mZnNldCA9IHBj
aV9idXNfYWRkcmVzcyhwZGV2LCBiYXIpIC0KPiAgCQlwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwg
YmFyKTsKPiBAQCAtMjIzLDcgKzE3NSw3IEBAIGludCBwY2lfcDJwZG1hX2FkZF9yZXNvdXJjZShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgaW50IGJhciwgc2l6ZV90IHNpemUsCj4gIAllcnJvciA9IGdl
bl9wb29sX2FkZF9vd25lcihwZGV2LT5wMnBkbWEtPnBvb2wsICh1bnNpZ25lZCBsb25nKWFkZHIs
Cj4gIAkJCXBjaV9idXNfYWRkcmVzcyhwZGV2LCBiYXIpICsgb2Zmc2V0LAo+ICAJCQlyZXNvdXJj
ZV9zaXplKCZwZ21hcC0+cmVzKSwgZGV2X3RvX25vZGUoJnBkZXYtPmRldiksCj4gLQkJCSZwMnBf
cGdtYXAtPnJlZik7Cj4gKwkJCXBnbWFwLT5yZWYpOwo+ICAJaWYgKGVycm9yKQo+ICAJCWdvdG8g
cGFnZXNfZnJlZTsKPiAgCj4gQEAgLTIzNSw3ICsxODcsNyBAQCBpbnQgcGNpX3AycGRtYV9hZGRf
cmVzb3VyY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGludCBiYXIsIHNpemVfdCBzaXplLAo+ICBw
YWdlc19mcmVlOgo+ICAJZGV2bV9tZW11bm1hcF9wYWdlcygmcGRldi0+ZGV2LCBwZ21hcCk7Cj4g
IHBnbWFwX2ZyZWU6Cj4gLQlkZXZtX2tmcmVlKCZwZGV2LT5kZXYsIHAycF9wZ21hcCk7Cj4gKwlk
ZXZtX2tmcmVlKCZwZGV2LT5kZXYsIHBnbWFwKTsKPiAgCXJldHVybiBlcnJvcjsKPiAgfQo+ICBF
WFBPUlRfU1lNQk9MX0dQTChwY2lfcDJwZG1hX2FkZF9yZXNvdXJjZSk7Cj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
