Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C348BDDDB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 14:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEB16E02B;
	Wed, 25 Sep 2019 12:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C046E02B;
 Wed, 25 Sep 2019 12:14:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 552FF796EB;
 Wed, 25 Sep 2019 12:14:05 +0000 (UTC)
Received: from [10.72.12.148] (ovpn-12-148.pek2.redhat.com [10.72.12.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AADA91001938;
 Wed, 25 Sep 2019 12:13:35 +0000 (UTC)
Subject: Re: [PATCH V2 0/8] mdev based hardware virtio offloading support
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
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F68D@SHSMSX104.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a0466f84-0b45-a3d3-dc1d-83c9d07d6d9a@redhat.com>
Date: Wed, 25 Sep 2019 20:13:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D58F68D@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 25 Sep 2019 12:14:05 +0000 (UTC)
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

Ck9uIDIwMTkvOS8yNSDkuIvljYg0OjI0LCBUaWFuLCBLZXZpbiB3cm90ZToKPj4gRnJvbTogSmFz
b24gV2FuZyBbbWFpbHRvOmphc293YW5nQHJlZGhhdC5jb21dCj4+IFNlbnQ6IFR1ZXNkYXksIFNl
cHRlbWJlciAyNCwgMjAxOSA5OjUzIFBNCj4+Cj4+IEhpIGFsbDoKPj4KPj4gVGhlcmUgYXJlIGhh
cmR3YXJlIHRoYXQgY2FuIGRvIHZpcnRpbyBkYXRhcGF0aCBvZmZsb2FkaW5nIHdoaWxlIGhhdmlu
Zwo+PiBpdHMgb3duIGNvbnRyb2wgcGF0aC4gVGhpcyBwYXRoIHRyaWVzIHRvIGltcGxlbWVudCBh
IG1kZXYgYmFzZWQKPj4gdW5pZmllZCBBUEkgdG8gc3VwcG9ydCB1c2luZyBrZXJuZWwgdmlydGlv
IGRyaXZlciB0byBkcml2ZSB0aG9zZQo+PiBkZXZpY2VzLiBUaGlzIGlzIGRvbmUgYnkgaW50cm9k
dWNpbmcgYSBuZXcgbWRldiB0cmFuc3BvcnQgZm9yIHZpcnRpbwo+PiAodmlydGlvX21kZXYpIGFu
ZCByZWdpc3RlciBpdHNlbGYgYXMgYSBuZXcga2luZCBvZiBtZGV2IGRyaXZlci4gVGhlbgo+PiBp
dCBwcm92aWRlcyBhIHVuaWZpZWQgd2F5IGZvciBrZXJuZWwgdmlydGlvIGRyaXZlciB0byB0YWxr
IHdpdGggbWRldgo+PiBkZXZpY2UgaW1wbGVtZW50YXRpb24uCj4+Cj4+IFRob3VnaCB0aGUgc2Vy
aWVzIG9ubHkgY29udGFpbnMga2VybmVsIGRyaXZlciBzdXBwb3J0LCB0aGUgZ29hbCBpcyB0bwo+
PiBtYWtlIHRoZSB0cmFuc3BvcnQgZ2VuZXJpYyBlbm91Z2ggdG8gc3VwcG9ydCB1c2Vyc3BhY2Ug
ZHJpdmVycy4gVGhpcwo+PiBtZWFucyB2aG9zdC1tZGV2WzFdIGNvdWxkIGJlIGJ1aWx0IG9uIHRv
cCBhcyB3ZWxsIGJ5IHJlc3VpbmcgdGhlCj4+IHRyYW5zcG9ydC4KPj4KPj4gQSBzYW1wbGUgZHJp
dmVyIGlzIGFsc28gaW1wbGVtZW50ZWQgd2hpY2ggc2ltdWxhdGUgYSB2aXJpdG8tbmV0Cj4+IGxv
b3BiYWNrIGV0aGVybmV0IGRldmljZSBvbiB0b3Agb2YgdnJpbmdoICsgd29ya3F1ZXVlLiBUaGlz
IGNvdWxkIGJlCj4+IHVzZWQgYXMgYSByZWZlcmVuY2UgaW1wbGVtZW50YXRpb24gZm9yIHJlYWwg
aGFyZHdhcmUgZHJpdmVyLgo+Pgo+PiBDb25zaWRlciBtZGV2IGZyYW1ld29yayBvbmx5IHN1cHBv
cnQgVkZJTyBkZXZpY2UgYW5kIGRyaXZlciByaWdodCBub3csCj4+IHRoaXMgc2VyaWVzIGFsc28g
ZXh0ZW5kIGl0IHRvIHN1cHBvcnQgb3RoZXIgdHlwZXMuIFRoaXMgaXMgZG9uZQo+PiB0aHJvdWdo
IGludHJvZHVjaW5nIGNsYXNzIGlkIHRvIHRoZSBkZXZpY2UgYW5kIHBhaXJpbmcgaXQgd2l0aAo+
PiBpZF90YWxiZSBjbGFpbWVkIGJ5IHRoZSBkcml2ZXIuIE9uIHRvcCwgdGhpcyBzZXJpcyBhbHNv
IGRlY291cGxlCj4gaWRfdGFibGUgY2xhaW1lZCAuLi4gdGhpcyBzZXJpZXMgLi4uCgoKTGV0IG1l
IGZpeCBpbiBWMy4KClRoYW5rcwoKCj4KPj4gZGV2aWNlIHNwZWNpZmljIHBhcmVudHMgb3BzIG91
dCBvZiB0aGUgY29tbW9uIG9uZXMuCj4+Cj4+IFBrdGdlbiB0ZXN0IHdhcyBkb25lIHdpdGggdmly
aXRvLW5ldCArIG12bmV0IGxvb3AgYmFjayBkZXZpY2UuCj4+Cj4+IFBsZWFzZSByZXZpZXcuCj4+
Cj4+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS85LzE2Lzg2OQo+Pgo+PiBDaGFuZ2Vz
IGZyb20gVjE6Cj4+Cj4+IC0gbW92ZSB2aXJ0aW9fbWRldi5jIHRvIGRyaXZlcnMvdmlydGlvCj4+
IC0gc3RvcmUgY2xhc3NfaWQgaW4gbWRldl9kZXZpY2UgaW5zdGVhZCBvZiBtZGV2X3BhcmVudAo+
PiAtIHN0b3JlIGRldmljZV9vcHMgaW4gbWRldl9kZXZpY2UgaW5zdGVhZCBvZiBtZGV2X3BhcmVu
dAo+PiAtIHJlb3JkZXIgdGhlIHBhdGNoLCB2cmluZ2ggZml4IGNvbWVzIGZpcnN0Cj4+IC0gcmVh
bGx5IHNpbGVudCBjb21waWxpbmcgd2FybmluZ3MKPj4gLSByZWFsbHkgc3dpdGNoIHRvIHVzZSB1
MTYgZm9yIGNsYXNzX2lkCj4+IC0gdWV2ZW50IGFuZCBtb2Rwb3N0IHN1cHBvcnQgZm9yIG1kZXYg
Y2xhc3NfaWQKPj4gLSB2cmFpb3VzIHR3ZWFrcyBwZXIgY29tbWVudHMgZnJvbSBQYXJhdgo+Pgo+
PiBDaGFuZ2VzIGZyb20gUkZDLVYyOgo+Pgo+PiAtIHNpbGVudCBjb21waWxlIHdhcm5pbmdzIG9u
IHNvbWUgc3BlY2lmaWMgY29uZmlndXJhdGlvbgo+PiAtIHVzZSB1MTYgaW5zdGVhZCB1OCBmb3Ig
Y2xhc3MgaWQKPj4gLSByZXNldmUgTURFVl9JRF9WSE9TVCBmb3IgZnV0dXJlIHZob3N0LW1kZXYg
d29yawo+PiAtIGludHJvZHVjZSAidmlydGlvIiB0eXBlIGZvciBtdm5ldCBhbmQgbWFrZSAidmhv
c3QiIHR5cGUgZm9yIGZ1dHVyZQo+PiAgIHdvcmsKPj4gLSBhZGQgZW50cmllcyBpbiBNQUlOVEFJ
TkVSCj4+IC0gdHdlYWsgYW5kIHR5cG9zIGZpeGVzIGluIGNvbW1pdCBsb2cKPj4KPj4gQ2hhbmdl
cyBmcm9tIFJGQy1WMToKPj4KPj4gLSByZW5hbWUgZGV2aWNlIGlkIHRvIGNsYXNzIGlkCj4+IC0g
YWRkIGRvY3MgZm9yIGNsYXNzIGlkIGFuZCBkZXZpY2Ugc3BlY2lmaWMgb3BzIChkZXZpY2Vfb3Bz
KQo+PiAtIHNwbGl0IGRldmljZV9vcHMgaW50byBzZXBlcmF0ZSBoZWFkZXJzCj4+IC0gZHJvcCB0
aGUgbWRldl9zZXRfZG1hX29wcygpCj4+IC0gdXNlIGRldmljZV9vcHMgdG8gaW1wbGVtZW50IHRo
ZSB0cmFuc3BvcnQgQVBJLCB0aGVuIGl0J3Mgbm90IGEgcGFydAo+PiAgIG9mIFVBUEkgYW55IG1v
cmUKPj4gLSB1c2UgR0ZQX0FUT01JQyBpbiBtdm5ldCBzYW1wbGUgZGV2aWNlIGFuZCBvdGhlciB0
d2Vha3MKPj4gLSBzZXRfdnJpbmdfYmFzZS9nZXRfdnJpbmdfYmFzZSBzdXBwb3J0IGZvciBtdm5l
dCBkZXZpY2UKPj4KPj4gSmFzb24gV2FuZyAoOCk6Cj4+ICAgdnJpbmdoOiBmaXggY29weSBkaXJl
Y3Rpb24gb2YgdnJpbmdoX2lvdl9wdXNoX2tlcm4oKQo+PiAgIG1kZXY6IGNsYXNzIGlkIHN1cHBv
cnQKPj4gICBtZGV2OiBidXMgdWV2ZW50IHN1cHBvcnQKPj4gICBtb2Rwb3N0OiBhZGQgc3VwcG9y
dCBmb3IgbWRldiBjbGFzcyBpZAo+PiAgIG1kZXY6IGludHJvZHVjZSBkZXZpY2Ugc3BlY2lmaWMg
b3BzCj4+ICAgbWRldjogaW50cm9kdWNlIHZpcnRpbyBkZXZpY2UgYW5kIGl0cyBkZXZpY2Ugb3Bz
Cj4+ICAgdmlydGlvOiBpbnRyb2R1Y2UgYSBtZGV2IGJhc2VkIHRyYW5zcG9ydAo+PiAgIGRvY3M6
IHNhbXBsZSBkcml2ZXIgdG8gZGVtb25zdHJhdGUgaG93IHRvIGltcGxlbWVudCB2aXJ0aW8tbWRl
dgo+PiAgICAgZnJhbWV3b3JrCj4+Cj4+ICAuLi4vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRl
dmljZS5yc3QgICAgICAgfCAgIDcgKy0KPj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3Zt
Z3QuYyAgICAgICAgICAgICAgfCAgMTggKy0KPj4gIGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3df
b3BzLmMgICAgICAgICAgICAgICB8ICAxOCArLQo+PiAgZHJpdmVycy9zMzkwL2NyeXB0by92Zmlv
X2FwX29wcy5jICAgICAgICAgICAgIHwgIDE0ICstCj4+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2
X2NvcmUuYyAgICAgICAgICAgICAgICAgfCAgMTkgKwo+PiAgZHJpdmVycy92ZmlvL21kZXYvbWRl
dl9kcml2ZXIuYyAgICAgICAgICAgICAgIHwgIDIyICsKPj4gIGRyaXZlcnMvdmZpby9tZGV2L21k
ZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICB8ICAgMiArCj4+ICBkcml2ZXJzL3ZmaW8vbWRldi92
ZmlvX21kZXYuYyAgICAgICAgICAgICAgICAgfCAgNDUgKy0KPj4gIGRyaXZlcnMvdmhvc3QvdnJp
bmdoLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQo+PiAgZHJpdmVycy92aXJ0aW8v
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKPj4gIGRyaXZlcnMvdmlydGlv
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4+ICBkcml2ZXJzL3ZpcnRp
by92aXJ0aW9fbWRldi5jICAgICAgICAgICAgICAgICAgfCA0MTcgKysrKysrKysrKysKPj4gIGlu
Y2x1ZGUvbGludXgvbWRldi5oICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1MiArLQo+PiAg
aW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaCAgICAgICAgICAgICAgIHwgICA4ICsKPj4g
IGluY2x1ZGUvbGludXgvdmZpb19tZGV2LmggICAgICAgICAgICAgICAgICAgICB8ICA1MiArKwo+
PiAgaW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5oICAgICAgICAgICAgICAgICAgIHwgMTQ1ICsr
KysKPj4gIHNhbXBsZXMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
NyArCj4+ICBzYW1wbGVzL3ZmaW8tbWRldi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwo+PiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAgICAgICAgICAgICAgICAgIHwg
IDIwICstCj4+ICBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAgICAgICAgICAgICAg
fCAgMjAgKy0KPj4gIHNhbXBsZXMvdmZpby1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICAxOCArLQo+PiAgc2FtcGxlcy92ZmlvLW1kZXYvbXZuZXQuYyAgICAgICAgICAgICAgICAg
ICAgIHwgNjkyICsrKysrKysrKysrKysrKysrKwo+PiAgc2NyaXB0cy9tb2QvZGV2aWNldGFibGUt
b2Zmc2V0cy5jICAgICAgICAgICAgIHwgICAzICsKPj4gIHNjcmlwdHMvbW9kL2ZpbGUyYWxpYXMu
YyAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArCj4+ICAyNSBmaWxlcyBjaGFuZ2VkLCAxNTI0
IGluc2VydGlvbnMoKyksIDg0IGRlbGV0aW9ucygtKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvdmlydGlvL3ZpcnRpb19tZGV2LmMKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2xpbnV4L3ZmaW9fbWRldi5oCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC92
aXJ0aW9fbWRldi5oCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2FtcGxlcy92ZmlvLW1kZXYvbXZu
ZXQuYwo+Pgo+PiAtLQo+PiAyLjE5LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
