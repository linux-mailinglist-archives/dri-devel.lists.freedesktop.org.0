Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A619BDDE9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 14:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BB789DA5;
	Wed, 25 Sep 2019 12:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3C489DA5;
 Wed, 25 Sep 2019 12:14:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 952791918644;
 Wed, 25 Sep 2019 12:14:44 +0000 (UTC)
Received: from [10.72.12.148] (ovpn-12-148.pek2.redhat.com [10.72.12.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E60E600C8;
 Wed, 25 Sep 2019 12:13:58 +0000 (UTC)
Subject: Re: [PATCH V2 2/8] mdev: class id support
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "Bie, Tiwei" <tiwei.bie@intel.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-3-jasowang@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F6AE@SHSMSX104.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c7e8a56a-d805-7cf4-2704-dc891dd23713@redhat.com>
Date: Wed, 25 Sep 2019 20:13:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D58F6AE@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 25 Sep 2019 12:14:45 +0000 (UTC)
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvOS8yNSDkuIvljYg0OjI4LCBUaWFuLCBLZXZpbiB3cm90ZToKPj4gRnJvbTogSmFz
b24gV2FuZwo+PiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjQsIDIwMTkgOTo1MyBQTQo+Pgo+
PiBNZGV2IGJ1cyBvbmx5IHN1cHBvcnRzIHZmaW8gZHJpdmVyIHJpZ2h0IG5vdywgc28gaXQgZG9l
c24ndCBpbXBsZW1lbnQKPj4gbWF0Y2ggbWV0aG9kLiBCdXQgaW4gdGhlIGZ1dHVyZSwgd2UgbWF5
IGFkZCBkcml2ZXJzIG90aGVyIHRoYW4gdmZpbywKPj4gdGhlIGZpcnN0IGRyaXZlciBjb3VsZCBi
ZSB2aXJ0aW8tbWRldi4gVGhpcyBtZWFucyB3ZSBuZWVkIHRvIGFkZAo+PiBkZXZpY2UgY2xhc3Mg
aWQgc3VwcG9ydCBpbiBidXMgbWF0Y2ggbWV0aG9kIHRvIHBhaXIgdGhlIG1kZXYgZGV2aWNlCj4+
IGFuZCBtZGV2IGRyaXZlciBjb3JyZWN0bHkuCj4+Cj4+IFNvIHRoaXMgcGF0Y2ggYWRkcyBpZF90
YWJsZSB0byBtZGV2X2RyaXZlciBhbmQgY2xhc3NfaWQgZm9yIG1kZXYKPj4gcGFyZW50IHdpdGgg
dGhlIG1hdGNoIG1ldGhvZCBmb3IgbWRldiBidXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlvbi9kcml2
ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdCB8ICAzICsrKwo+PiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAgICAgICB8ICAxICsKPj4gIGRyaXZlcnMv
czM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+ICBkcml2
ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMgICAgICAgICAgICAgICAgIHwgIDEgKwo+PiAg
ZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgICAgICAgICAgICAgICAgICAgICB8ICA3ICsr
KysrKysKPj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMgICAgICAgICAgICAgICAg
ICAgfCAxNCArKysrKysrKysrKysrKwo+PiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRl
LmggICAgICAgICAgICAgICAgICB8ICAxICsKPj4gIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRl
di5jICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPj4gIGluY2x1ZGUvbGludXgvbWRl
di5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwo+PiAgaW5jbHVk
ZS9saW51eC9tb2RfZGV2aWNldGFibGUuaCAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysr
Cj4+ICBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKwo+PiAgc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxICsKPj4gIHNhbXBsZXMvdmZpby1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMSArCj4+ICAxMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZp
Y2UucnN0Cj4+IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNl
LnJzdAo+PiBpbmRleCAyNWViN2Q1YjgzNGIuLmE1YmRjNjBkNjJhMSAxMDA2NDQKPj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4+IEBA
IC0xMDIsMTIgKzEwMiwxNCBAQCBzdHJ1Y3R1cmUgdG8gcmVwcmVzZW50IGEgbWVkaWF0ZWQgZGV2
aWNlJ3MKPj4gZHJpdmVyOjoKPj4gICAgICAgICogQHByb2JlOiBjYWxsZWQgd2hlbiBuZXcgZGV2
aWNlIGNyZWF0ZWQKPj4gICAgICAgICogQHJlbW92ZTogY2FsbGVkIHdoZW4gZGV2aWNlIHJlbW92
ZWQKPj4gICAgICAgICogQGRyaXZlcjogZGV2aWNlIGRyaXZlciBzdHJ1Y3R1cmUKPj4gKyAgICAg
ICogQGlkX3RhYmxlOiB0aGUgaWRzIHNlcnZpY2VkIGJ5IHRoaXMgZHJpdmVyCj4+ICAgICAgICAq
Lwo+PiAgICAgICBzdHJ1Y3QgbWRldl9kcml2ZXIgewo+PiAgCSAgICAgY29uc3QgY2hhciAqbmFt
ZTsKPj4gIAkgICAgIGludCAgKCpwcm9iZSkgIChzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+PiAgCSAg
ICAgdm9pZCAoKnJlbW92ZSkgKHN0cnVjdCBkZXZpY2UgKmRldik7Cj4+ICAJICAgICBzdHJ1Y3Qg
ZGV2aWNlX2RyaXZlciAgICBkcml2ZXI7Cj4+ICsJICAgICBjb25zdCBzdHJ1Y3QgbWRldl9jbGFz
c19pZCAqaWRfdGFibGU7Cj4+ICAgICAgIH07Cj4+Cj4+ICBBIG1lZGlhdGVkIGJ1cyBkcml2ZXIg
Zm9yIG1kZXYgc2hvdWxkIHVzZSB0aGlzIHN0cnVjdHVyZSBpbiB0aGUgZnVuY3Rpb24KPj4gY2Fs
bHMKPj4gQEAgLTE2NSw2ICsxNjcsNyBAQCByZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUgbWRldiBj
b3JlIGRyaXZlcjo6Cj4+ICAJZXh0ZXJuIGludCAgbWRldl9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0
IGRldmljZSAqZGV2LAo+PiAgCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMgKm9wcyk7Cj4+Cj4+ICsKPj4gIEhvd2V2ZXIsIHRoZSBt
ZGV2X3BhcmVudF9vcHMgc3RydWN0dXJlIGlzIG5vdCByZXF1aXJlZCBpbiB0aGUgZnVuY3Rpb24K
Pj4gY2FsbAo+PiAgdGhhdCBhIGRyaXZlciBzaG91bGQgdXNlIHRvIHVucmVnaXN0ZXIgaXRzZWxm
IHdpdGggdGhlIG1kZXYgY29yZSBkcml2ZXI6Ogo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3Zt
Z3QuYwo+PiBpbmRleCAyM2FhM2U1MGNiZjguLmY3OTMyNTJhM2QyYSAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2t2bWd0LmMKPj4gQEAgLTY3OCw2ICs2NzgsNyBAQCBzdGF0aWMgaW50IGludGVs
X3ZncHVfY3JlYXRlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAo+PiBzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYpCj4+ICAJCSAgICAgZGV2X25hbWUobWRldl9kZXYobWRldikpKTsKPj4gIAlyZXQgPSAw
Owo+Pgo+PiArCW1kZXZfc2V0X2NsYXNzX2lkKG1kZXYsIE1ERVZfSURfVkZJTyk7Cj4+ICBvdXQ6
Cj4+ICAJcmV0dXJuIHJldDsKPj4gIH0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC9jaW8v
dmZpb19jY3dfb3BzLmMKPj4gYi9kcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jCj4+IGlu
ZGV4IGYwZDcxYWI3N2M1MC4uZDI1OGVmMWZlZGI5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3Mz
OTAvY2lvL3ZmaW9fY2N3X29wcy5jCj4+ICsrKyBiL2RyaXZlcnMvczM5MC9jaW8vdmZpb19jY3df
b3BzLmMKPj4gQEAgLTEyOSw2ICsxMjksNyBAQCBzdGF0aWMgaW50IHZmaW9fY2N3X21kZXZfY3Jl
YXRlKHN0cnVjdCBrb2JqZWN0Cj4+ICprb2JqLCBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4+
ICAJCQkgICBwcml2YXRlLT5zY2gtPnNjaGlkLnNzaWQsCj4+ICAJCQkgICBwcml2YXRlLT5zY2gt
PnNjaGlkLnNjaF9ubyk7Cj4+Cj4+ICsJbWRldl9zZXRfY2xhc3NfaWQobWRldiwgTURFVl9JRF9W
RklPKTsKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5
MC9jcnlwdG8vdmZpb19hcF9vcHMuYwo+PiBiL2RyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9v
cHMuYwo+PiBpbmRleCA1YzBmNTNjNmRkZTcuLjJjZmQ5NjExMmFhMCAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jCj4+ICsrKyBiL2RyaXZlcnMvczM5MC9j
cnlwdG8vdmZpb19hcF9vcHMuYwo+PiBAQCAtMzQzLDYgKzM0Myw3IEBAIHN0YXRpYyBpbnQgdmZp
b19hcF9tZGV2X2NyZWF0ZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKPj4gc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2KQo+PiAgCWxpc3RfYWRkKCZtYXRyaXhfbWRldi0+bm9kZSwgJm1hdHJpeF9kZXYt
Pm1kZXZfbGlzdCk7Cj4+ICAJbXV0ZXhfdW5sb2NrKCZtYXRyaXhfZGV2LT5sb2NrKTsKPj4KPj4g
KwltZGV2X3NldF9jbGFzc19pZChtZGV2LCBNREVWX0lEX1ZGSU8pOwo+PiAgCXJldHVybiAwOwo+
PiAgfQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPj4g
Yi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+PiBpbmRleCBiNTU4ZDRjZmQwODIuLjg3
NjRjZjRhMjc2ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMK
Pj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPj4gQEAgLTQ1LDYgKzQ1LDEy
IEBAIHZvaWQgbWRldl9zZXRfZHJ2ZGF0YShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4+IHZv
aWQgKmRhdGEpCj4+ICB9Cj4+ICBFWFBPUlRfU1lNQk9MKG1kZXZfc2V0X2RydmRhdGEpOwo+Pgo+
PiArdm9pZCBtZGV2X3NldF9jbGFzc19pZChzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBp
ZCkKPj4gK3sKPj4gKwltZGV2LT5jbGFzc19pZCA9IGlkOwo+PiArfQo+PiArRVhQT1JUX1NZTUJP
TChtZGV2X3NldF9jbGFzc19pZCk7Cj4+ICsKPj4gIHN0cnVjdCBkZXZpY2UgKm1kZXZfZGV2KHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldikKPj4gIHsKPj4gIAlyZXR1cm4gJm1kZXYtPmRldjsKPj4g
QEAgLTEzNSw2ICsxNDEsNyBAQCBzdGF0aWMgaW50IG1kZXZfZGV2aWNlX3JlbW92ZV9jYihzdHJ1
Y3QgZGV2aWNlCj4+ICpkZXYsIHZvaWQgKmRhdGEpCj4+ICAgKiBtZGV2X3JlZ2lzdGVyX2Rldmlj
ZSA6IFJlZ2lzdGVyIGEgZGV2aWNlCj4+ICAgKiBAZGV2OiBkZXZpY2Ugc3RydWN0dXJlIHJlcHJl
c2VudGluZyBwYXJlbnQgZGV2aWNlLgo+PiAgICogQG9wczogUGFyZW50IGRldmljZSBvcGVyYXRp
b24gc3RydWN0dXJlIHRvIGJlIHJlZ2lzdGVyZWQuCj4+ICsgKiBAaWQ6IGRldmljZSBpZC4KPiBj
bGFzcyBpZC4KCgpSaWdodCwgd2lsbCBmaXguCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
