Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D653BBC6AD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 13:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38D96EA0B;
	Tue, 24 Sep 2019 11:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778BB89316;
 Tue, 24 Sep 2019 11:23:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ABB5B308FBA9;
 Tue, 24 Sep 2019 11:23:41 +0000 (UTC)
Received: from [10.72.12.44] (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E04460C5D;
 Tue, 24 Sep 2019 11:23:17 +0000 (UTC)
Subject: Re: [PATCH 1/6] mdev: class id support
To: Parav Pandit <parav@mellanox.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "tiwei.bie@intel.com"
 <tiwei.bie@intel.com>
References: <20190923130331.29324-1-jasowang@redhat.com>
 <20190923130331.29324-2-jasowang@redhat.com>
 <AM0PR05MB486657BB8E48F744D219CF9BD1850@AM0PR05MB4866.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5b9340a9-35b0-aa97-bb5e-c99d7320b386@redhat.com>
Date: Tue, 24 Sep 2019 19:23:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR05MB486657BB8E48F744D219CF9BD1850@AM0PR05MB4866.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 24 Sep 2019 11:23:42 +0000 (UTC)
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
Cc: "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvOS8yNCDkuIrljYg1OjAyLCBQYXJhdiBQYW5kaXQgd3JvdGU6Cj4gSGkgSmFzb24s
Cj4KPgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPgo+PiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAyMywgMjAxOSA4
OjAzIEFNCj4+IFRvOiBrdm1Admdlci5rZXJuZWwub3JnOyBsaW51eC1zMzkwQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtCj4+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGludGVsLQo+PiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsKPj4ga3dhbmtoZWRlQG52aWRpYS5jb207
IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsKPj4gdGl3ZWkuYmll
QGludGVsLmNvbQo+PiBDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmc7IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7Cj4+IGNvaHVja0ByZWRoYXQuY29tOyBtYXhpbWUu
Y29xdWVsaW5AcmVkaGF0LmNvbTsKPj4gY3VubWluZy5saWFuZ0BpbnRlbC5jb207IHpoaWhvbmcu
d2FuZ0BpbnRlbC5jb207Cj4+IHJvYi5taWxsZXJAYnJvYWRjb20uY29tOyB4aWFvLncud2FuZ0Bp
bnRlbC5jb207Cj4+IGhhb3RpYW4ud2FuZ0BzaWZpdmUuY29tOyB6aGVueXV3QGxpbnV4LmludGVs
LmNvbTsgemhpLmEud2FuZ0BpbnRlbC5jb207Cj4+IGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNv
bTsgam9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbTsKPj4gcm9kcmlnby52aXZpQGludGVs
LmNvbTsgYWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOwo+PiBmYXJtYW5AbGludXgu
aWJtLmNvbTsgcGFzaWNAbGludXguaWJtLmNvbTsgc2Vib3R0QGxpbnV4LmlibS5jb207Cj4+IG9i
ZXJwYXJAbGludXguaWJtLmNvbTsgaGVpa28uY2Fyc3RlbnNAZGUuaWJtLmNvbTsgZ29yQGxpbnV4
LmlibS5jb207Cj4+IGJvcm50cmFlZ2VyQGRlLmlibS5jb207IGFrcm93aWFrQGxpbnV4LmlibS5j
b207IGZyZXVkZUBsaW51eC5pYm0uY29tOwo+PiBsaW5nc2hhbi56aHVAaW50ZWwuY29tOyBJZG8g
U2hhbWF5IDxpZG9zQG1lbGxhbm94LmNvbT47Cj4+IGVwZXJlem1hQHJlZGhhdC5jb207IGx1bHVA
cmVkaGF0LmNvbTsgUGFyYXYgUGFuZGl0Cj4+IDxwYXJhdkBtZWxsYW5veC5jb20+OyBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggMS82XSBtZGV2OiBj
bGFzcyBpZCBzdXBwb3J0Cj4+Cj4+IE1kZXYgYnVzIG9ubHkgc3VwcG9ydHMgdmZpbyBkcml2ZXIg
cmlnaHQgbm93LCBzbyBpdCBkb2Vzbid0IGltcGxlbWVudCBtYXRjaAo+PiBtZXRob2QuIEJ1dCBp
biB0aGUgZnV0dXJlLCB3ZSBtYXkgYWRkIGRyaXZlcnMgb3RoZXIgdGhhbiB2ZmlvLCBvbmUgZXhh
bXBsZSBpcwo+PiB2aXJ0aW8tbWRldlsxXSBkcml2ZXIuIFRoaXMgbWVhbnMgd2UgbmVlZCB0byBh
ZGQgZGV2aWNlIGNsYXNzIGlkIHN1cHBvcnQgaW4gYnVzCj4+IG1hdGNoIG1ldGhvZCB0byBwYWly
IHRoZSBtZGV2IGRldmljZSBhbmQgbWRldiBkcml2ZXIgY29ycmVjdGx5Lgo+Pgo+PiBTbyB0aGlz
IHBhdGNoIGFkZHMgaWRfdGFibGUgdG8gbWRldl9kcml2ZXIgYW5kIGNsYXNzX2lkIGZvciBtZGV2
IHBhcmVudCB3aXRoCj4+IHRoZSBtYXRjaCBtZXRob2QgZm9yIG1kZXYgYnVzLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiAtLS0KPj4gIERv
Y3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgfCAgNyArKysr
Ky0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPj4gIGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+PiAgZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAg
ICAgICAgICAgICB8ICAzICsrLQo+PiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMgICAg
ICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKy0tCj4+ICBkcml2ZXJzL3ZmaW8vbWRl
di9tZGV2X2RyaXZlci5jICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPj4g
IGRyaXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4+ICBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgICAgICAgICAgICAgICAgIHwg
IDYgKysrKysrCj4+ICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDcgKysrKysrLQo+PiAgaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaCAg
ICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrCj4+ICBzYW1wbGVzL3ZmaW8tbWRldi9tYm9j
aHMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gIHNhbXBsZXMvdmZpby1tZGV2
L21kcHkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAgc2FtcGxlcy92Zmlv
LW1kZXYvbXR0eS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4+ICAxMyBmaWxl
cyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPj4KPiBZb3UgYWRk
aXRpb25hbGx5IG5lZWQgbW9kcG9zdCBzdXBwb3J0IGZvciBpZCB0YWJsZSBpbnRlZ3JhdGlvbiB0
byBtb2RpZm8sIG1vZHByb2JlIGFuZCBvdGhlciB0b29scy4KPiBBIHNtYWxsIHBhdGNoIHNpbWls
YXIgdG8gdGhpcyBvbmUgWzFdIGlzIG5lZWRlZC4KPiBQbGVhc2UgaW5jbHVkZSBpbiB0aGUgc2Vy
aWVzLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMDQ2
OTkxLwoKCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhpcyBjb3VsZCBiZSBkb25lIG9uIHRvcCBhbmQg
bWF5IHJlcXVpcmUgdWV2ZW50CnN1cHBvcnQgZm9yIHRoZSBidXMuIEkgY2FuIHRyeSB0byBpbXBs
ZW1lbnQgdGhpcyBpbiBWMi4KClRoYW5rcwoKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
