Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BCB4D6E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B2A6EBEB;
	Tue, 17 Sep 2019 12:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29B86EBEB;
 Tue, 17 Sep 2019 12:07:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20D9A30820C9;
 Tue, 17 Sep 2019 12:07:36 +0000 (UTC)
Received: from gondolin (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F455100197A;
 Tue, 17 Sep 2019 12:07:22 +0000 (UTC)
Date: Tue, 17 Sep 2019 14:07:20 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 1/2] mdev: device id support
Message-ID: <20190917140720.3686e0cc.cohuck@redhat.com>
In-Reply-To: <20190912094012.29653-2-jasowang@redhat.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
 <20190912094012.29653-2-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 17 Sep 2019 12:07:36 +0000 (UTC)
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
Cc: sebott@linux.ibm.com, mst@redhat.com, airlied@linux.ie,
 heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
 oberpar@linux.ibm.com, kwankhede@nvidia.com, rob.miller@broadcom.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, cunming.liang@intel.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, alex.williamson@redhat.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, rodrigo.vivi@intel.com,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 lingshan.zhu@intel.com, akrowiak@linux.ibm.com, tiwei.bie@intel.com,
 pmorel@linux.ibm.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 zhihong.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMiBTZXAgMjAxOSAxNzo0MDoxMSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gTWRldiBidXMgb25seSBzdXBwb3J0IHZmaW8gZHJpdmVyIHJp
Z2h0IG5vdywgc28gaXQgZG9lc24ndCBpbXBsZW1lbnQKPiBtYXRjaCBtZXRob2QuIEJ1dCBpbiB0
aGUgZnV0dXJlLCB3ZSBtYXkgYWRkIGRyaXZlcnMgb3RoZXIgdGhhbiB2ZmlvLAo+IG9uZSBleGFt
cGxlIGlzIHZpcnRpby1tZGV2WzFdIGRyaXZlci4gVGhpcyBtZWFucyB3ZSBuZWVkIHRvIGFkZCBk
ZXZpY2UKPiBpZCBzdXBwb3J0IGluIGJ1cyBtYXRjaCBtZXRob2QgdG8gcGFpciB0aGUgbWRldiBk
ZXZpY2UgYW5kIG1kZXYgZHJpdmVyCj4gY29ycmVjdGx5LgoKU291bmRzIHJlYXNvbmFibGUuCgo+
IAo+IFNvIHRoaXMgcGF0Y2ggYWRkIGlkX3RhYmxlIHRvIG1kZXZfZHJpdmVyIGFuZCBpZCBmb3Ig
bWRldiBwYXJlbnQsIGFuZAo+IGltcGxlbWVudCB0aGUgbWF0Y2ggbWV0aG9kIGZvciBtZGV2IGJ1
cy4KPiAKPiBbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8xMC8xMzUKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgfCAgMiArLQo+ICBkcml2ZXJzL3MzOTAvY2lv
L3ZmaW9fY2N3X29wcy5jICAgfCAgMiArLQo+ICBkcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBf
b3BzLmMgfCAgMyArKy0KPiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgICAgIHwgMTQg
KysrKysrKysrKysrLS0KPiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyAgIHwgMTQg
KysrKysrKysrKysrKysKPiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmggIHwgIDEg
Kwo+ICBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgfCAgNiArKysrKysKPiAgaW5j
bHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgIHwgIDYgKysrKystCj4gIGluY2x1ZGUvbGlu
dXgvbW9kX2RldmljZXRhYmxlLmggICB8ICA2ICsrKysrKwo+ICBzYW1wbGVzL3ZmaW8tbWRldi9t
Ym9jaHMuYyAgICAgICAgfCAgMiArLQo+ICBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAg
ICAgfCAgMiArLQo+ICBzYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMgICAgICAgICAgfCAgMiArLQo+
ICAxMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKKC4u
LikKClRoZSB0cmFuc2Zvcm1hdGlvbnMgb2YgdGhlIHZlbmRvciBkcml2ZXJzIGFuZCB0aGUgbmV3
IGludGVyZmFjZSBsb29rCnNhbmUuCgooLi4uKQoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tb2RfZGV2aWNldGFibGUuaCBiL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgKPiBp
bmRleCA1NzE0ZmQzNWE4M2MuLmYxZmMxNDNkZjA0MiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L21vZF9kZXZpY2V0YWJsZS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFi
bGUuaAo+IEBAIC04MjEsNCArODIxLDEwIEBAIHN0cnVjdCB3bWlfZGV2aWNlX2lkIHsKPiAgCWNv
bnN0IHZvaWQgKmNvbnRleHQ7Cj4gIH07Cj4gIAo+ICsvKiBNREVWICovCj4gKwoKTWF5YmUgYWRk
IHNvbWUga2VybmVsZG9jIGFuZCBnaXZlIHZmaW8gYXMgYW4gZXhhbXBsZSBvZiB3aGF0IHdlJ3Jl
Cm1hdGNoaW5nIGhlcmU/Cgo+ICtzdHJ1Y3QgbWRldl9kZXZpY2VfaWQgewo+ICsJX191OCBpZDsK
CkkgYWdyZWUgd2l0aCB0aGUgc3VnZ2VzdGlvbiB0byByZW5hbWUgdGhpcyB0byAnY2xhc3NfaWQn
LgoKPiArfTsKPiArCj4gICNlbmRpZiAvKiBMSU5VWF9NT0RfREVWSUNFVEFCTEVfSCAqLwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
