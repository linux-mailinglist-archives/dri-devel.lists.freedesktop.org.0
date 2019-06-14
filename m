Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1420E455E6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DE689760;
	Fri, 14 Jun 2019 07:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392F9892F6;
 Fri, 14 Jun 2019 00:54:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d02f02f0000>; Thu, 13 Jun 2019 17:54:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 13 Jun 2019 17:54:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 17:54:07 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 00:54:05 +0000
Subject: Re: [Nouveau] [PATCH 03/22] mm: remove hmm_devmem_add_resource
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-4-hch@lst.de>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b0136e6b-2262-ae4e-67ba-3d0b3895873b@nvidia.com>
Date: Thu, 13 Jun 2019 17:54:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613094326.24093-4-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560473647; bh=oaghaGhc6k9hrZ1Hrvf1WRHivvtYUvtzqZie9Kkvs/o=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=msD87jcA2rRG9Llyq0qt1WMB2QnQwlCA5FboAnD5ObAlNrd0UXGEduqhvkfygikiG
 X/FDHinicS3Efvg3d57Jm26shPNaEmayltJCp5yJQZZeY/XUAJ9yuE28dJLinUDmst
 hfPVk2mmuqjWbbXi5PN/lD+bEyQhTU2/HuxvXb4GSlidJB0FuUB3Qbw3dB7EXnopuS
 70ZHlcNhJG9lxipOFV1GdXLcilcLcloKtFVGyKtsgpsjI+nbjKdhxdsIHIGRCMwhfr
 h2Uc0N+TEc+StNM9rr5zvfJdDHOGWwk2wBBxonlsQTnl7Sy3RjDibSN0QnbqU2I3p2
 +mHNjmJsw2lrA==
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

T24gNi8xMy8xOSAyOjQzIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGlzIGZ1bmN0
aW9uIGhhcyBuZXZlciBiZWVuIHVzZWQgc2luY2UgaXQgd2FzIGZpcnN0IGFkZGVkIHRvIHRoZSBr
ZXJuZWwKPiBtb3JlIHRoYW4gYSB5ZWFyIGFuZCBhIGhhbGYgYWdvLCBhbmQgaWYgd2UgZXZlciBn
cm93IGEgY29uc3VtZXIgb2YgdGhlCj4gTUVNT1JZX0RFVklDRV9QVUJMSUMgaW5mcmFzdHJ1Y3R1
cmUgaXQgY2FuIGVhc2lseSB1c2UgZGV2bV9tZW1yZW1hcF9wYWdlcwo+IGRpcmVjdGx5IG5vdyB0
aGF0IHdlJ3ZlIHNpbXBsaWZpZWQgdGhlIEFQSSBmb3IgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvaG1t
LmggfCAgMyAtLS0KPiAgbW0vaG1tLmMgICAgICAgICAgICB8IDU0IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDU3IGRlbGV0
aW9ucygtKQo+IAoKTm8gb2JqZWN0aW9ucyBoZXJlLCBnb29kIGNsZWFudXAuCgpSZXZpZXdlZC1i
eTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPiAKCnRoYW5rcywKLS0gCkpvaG4g
SHViYmFyZApOVklESUEKCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNs
dWRlL2xpbnV4L2htbS5oCj4gaW5kZXggNDg2N2I5ZGExYjZjLi41NzYxYTM5MjIxYTYgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgK
PiBAQCAtNjg4LDkgKzY4OCw2IEBAIHN0cnVjdCBobW1fZGV2bWVtIHsKPiAgc3RydWN0IGhtbV9k
ZXZtZW0gKmhtbV9kZXZtZW1fYWRkKGNvbnN0IHN0cnVjdCBobW1fZGV2bWVtX29wcyAqb3BzLAo+
ICAJCQkJICBzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCj4gIAkJCQkgIHVuc2lnbmVkIGxvbmcgc2l6
ZSk7Cj4gLXN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2bWVtX2FkZF9yZXNvdXJjZShjb25zdCBz
dHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywKPiAtCQkJCQkgICBzdHJ1Y3QgZGV2aWNlICpkZXZp
Y2UsCj4gLQkJCQkJICAgc3RydWN0IHJlc291cmNlICpyZXMpOwo+ICAKPiAgLyoKPiAgICogaG1t
X2Rldm1lbV9wYWdlX3NldF9kcnZkYXRhIC0gc2V0IHBlci1wYWdlIGRyaXZlciBkYXRhIGZpZWxk
Cj4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCBmZjI1OThlYjczNzcu
LjBjNjI0MjZkMTI1NyAxMDA2NDQKPiAtLS0gYS9tbS9obW0uYwo+ICsrKyBiL21tL2htbS5jCj4g
QEAgLTE0NDUsNTggKzE0NDUsNCBAQCBzdHJ1Y3QgaG1tX2Rldm1lbSAqaG1tX2Rldm1lbV9hZGQo
Y29uc3Qgc3RydWN0IGhtbV9kZXZtZW1fb3BzICpvcHMsCj4gIAlyZXR1cm4gZGV2bWVtOwo+ICB9
Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKGhtbV9kZXZtZW1fYWRkKTsKPiAtCj4gLXN0cnVjdCBobW1f
ZGV2bWVtICpobW1fZGV2bWVtX2FkZF9yZXNvdXJjZShjb25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9v
cHMgKm9wcywKPiAtCQkJCQkgICBzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCj4gLQkJCQkJICAgc3Ry
dWN0IHJlc291cmNlICpyZXMpCj4gLXsKPiAtCXN0cnVjdCBobW1fZGV2bWVtICpkZXZtZW07Cj4g
LQl2b2lkICpyZXN1bHQ7Cj4gLQlpbnQgcmV0Owo+IC0KPiAtCWlmIChyZXMtPmRlc2MgIT0gSU9S
RVNfREVTQ19ERVZJQ0VfUFVCTElDX01FTU9SWSkKPiAtCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFM
KTsKPiAtCj4gLQlkZXZfcGFnZW1hcF9nZXRfb3BzKCk7Cj4gLQo+IC0JZGV2bWVtID0gZGV2bV9r
emFsbG9jKGRldmljZSwgc2l6ZW9mKCpkZXZtZW0pLCBHRlBfS0VSTkVMKTsKPiAtCWlmICghZGV2
bWVtKQo+IC0JCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+IC0KPiAtCWluaXRfY29tcGxldGlv
bigmZGV2bWVtLT5jb21wbGV0aW9uKTsKPiAtCWRldm1lbS0+cGZuX2ZpcnN0ID0gLTFVTDsKPiAt
CWRldm1lbS0+cGZuX2xhc3QgPSAtMVVMOwo+IC0JZGV2bWVtLT5yZXNvdXJjZSA9IHJlczsKPiAt
CWRldm1lbS0+ZGV2aWNlID0gZGV2aWNlOwo+IC0JZGV2bWVtLT5vcHMgPSBvcHM7Cj4gLQo+IC0J
cmV0ID0gcGVyY3B1X3JlZl9pbml0KCZkZXZtZW0tPnJlZiwgJmhtbV9kZXZtZW1fcmVmX3JlbGVh
c2UsCj4gLQkJCSAgICAgIDAsIEdGUF9LRVJORUwpOwo+IC0JaWYgKHJldCkKPiAtCQlyZXR1cm4g
RVJSX1BUUihyZXQpOwo+IC0KPiAtCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXZp
Y2UsIGhtbV9kZXZtZW1fcmVmX2V4aXQsCj4gLQkJCSZkZXZtZW0tPnJlZik7Cj4gLQlpZiAocmV0
KQo+IC0JCXJldHVybiBFUlJfUFRSKHJldCk7Cj4gLQo+IC0JZGV2bWVtLT5wZm5fZmlyc3QgPSBk
ZXZtZW0tPnJlc291cmNlLT5zdGFydCA+PiBQQUdFX1NISUZUOwo+IC0JZGV2bWVtLT5wZm5fbGFz
dCA9IGRldm1lbS0+cGZuX2ZpcnN0ICsKPiAtCQkJICAgKHJlc291cmNlX3NpemUoZGV2bWVtLT5y
ZXNvdXJjZSkgPj4gUEFHRV9TSElGVCk7Cj4gLQlkZXZtZW0tPnBhZ2VfZmF1bHQgPSBobW1fZGV2
bWVtX2ZhdWx0Owo+IC0KPiAtCWRldm1lbS0+cGFnZW1hcC50eXBlID0gTUVNT1JZX0RFVklDRV9Q
VUJMSUM7Cj4gLQlkZXZtZW0tPnBhZ2VtYXAucmVzID0gKmRldm1lbS0+cmVzb3VyY2U7Cj4gLQlk
ZXZtZW0tPnBhZ2VtYXAucGFnZV9mcmVlID0gaG1tX2Rldm1lbV9mcmVlOwo+IC0JZGV2bWVtLT5w
YWdlbWFwLmFsdG1hcF92YWxpZCA9IGZhbHNlOwo+IC0JZGV2bWVtLT5wYWdlbWFwLnJlZiA9ICZk
ZXZtZW0tPnJlZjsKPiAtCWRldm1lbS0+cGFnZW1hcC5kYXRhID0gZGV2bWVtOwo+IC0JZGV2bWVt
LT5wYWdlbWFwLmtpbGwgPSBobW1fZGV2bWVtX3JlZl9raWxsOwo+IC0KPiAtCXJlc3VsdCA9IGRl
dm1fbWVtcmVtYXBfcGFnZXMoZGV2bWVtLT5kZXZpY2UsICZkZXZtZW0tPnBhZ2VtYXApOwo+IC0J
aWYgKElTX0VSUihyZXN1bHQpKQo+IC0JCXJldHVybiByZXN1bHQ7Cj4gLQlyZXR1cm4gZGV2bWVt
Owo+IC19Cj4gLUVYUE9SVF9TWU1CT0xfR1BMKGhtbV9kZXZtZW1fYWRkX3Jlc291cmNlKTsKPiAg
I2VuZGlmIC8qIENPTkZJR19ERVZJQ0VfUFJJVkFURSB8fCBDT05GSUdfREVWSUNFX1BVQkxJQyAq
Lwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
