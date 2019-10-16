Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A78D8BBE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612AB89D7C;
	Wed, 16 Oct 2019 08:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5730E89D7C;
 Wed, 16 Oct 2019 08:52:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E06430607E2;
 Wed, 16 Oct 2019 08:52:50 +0000 (UTC)
Received: from gondolin (dhcp-192-233.str.redhat.com [10.33.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCAB15DAAD;
 Wed, 16 Oct 2019 08:52:34 +0000 (UTC)
Date: Wed, 16 Oct 2019 10:52:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@mellanox.com>
Subject: Re: [PATCH V3 4/7] mdev: introduce device specific ops
Message-ID: <20191016105232.663dd3c9.cohuck@redhat.com>
In-Reply-To: <AM0PR05MB4866954855AF080639ED2384D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-5-jasowang@redhat.com>
 <20191015124137.4f948bd2.cohuck@redhat.com>
 <eb7ecd99-7465-6be4-7ecd-84c11f66e0ac@redhat.com>
 <20191015112646.3776dc29@x1.home>
 <AM0PR05MB4866954855AF080639ED2384D1920@AM0PR05MB4866.eurprd05.prod.outlook.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 16 Oct 2019 08:52:50 +0000 (UTC)
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNiBPY3QgMjAxOSAwNTo1MDowOCArMDAwMApQYXJhdiBQYW5kaXQgPHBhcmF2QG1l
bGxhbm94LmNvbT4gd3JvdGU6Cgo+IEhpIEFsZXgsCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+ID4gRnJvbTogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0
LmNvbT4KPiA+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTUsIDIwMTkgMTI6MjcgUE0KPiA+IFRv
OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gQ2M6IENvcm5lbGlhIEh1Y2sg
PGNvaHVja0ByZWRoYXQuY29tPjsga3ZtQHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4gPiBzMzkw
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLQo+ID4g
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBpbnRlbC1ndnQtCj4gPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBrd2Fua2hlZGVA
bnZpZGlhLmNvbTsgbXN0QHJlZGhhdC5jb207Cj4gPiB0aXdlaS5iaWVAaW50ZWwuY29tOyB2aXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsKPiA+IG5ldGRldkB2Z2VyLmtl
cm5lbC5vcmc7IG1heGltZS5jb3F1ZWxpbkByZWRoYXQuY29tOwo+ID4gY3VubWluZy5saWFuZ0Bp
bnRlbC5jb207IHpoaWhvbmcud2FuZ0BpbnRlbC5jb207Cj4gPiByb2IubWlsbGVyQGJyb2FkY29t
LmNvbTsgeGlhby53LndhbmdAaW50ZWwuY29tOwo+ID4gaGFvdGlhbi53YW5nQHNpZml2ZS5jb207
IHpoZW55dXdAbGludXguaW50ZWwuY29tOyB6aGkuYS53YW5nQGludGVsLmNvbTsKPiA+IGphbmku
bmlrdWxhQGxpbnV4LmludGVsLmNvbTsgam9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbTsK
PiA+IHJvZHJpZ28udml2aUBpbnRlbC5jb207IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZnds
bC5jaDsKPiA+IGZhcm1hbkBsaW51eC5pYm0uY29tOyBwYXNpY0BsaW51eC5pYm0uY29tOyBzZWJv
dHRAbGludXguaWJtLmNvbTsKPiA+IG9iZXJwYXJAbGludXguaWJtLmNvbTsgaGVpa28uY2Fyc3Rl
bnNAZGUuaWJtLmNvbTsgZ29yQGxpbnV4LmlibS5jb207Cj4gPiBib3JudHJhZWdlckBkZS5pYm0u
Y29tOyBha3Jvd2lha0BsaW51eC5pYm0uY29tOyBmcmV1ZGVAbGludXguaWJtLmNvbTsKPiA+IGxp
bmdzaGFuLnpodUBpbnRlbC5jb207IElkbyBTaGFtYXkgPGlkb3NAbWVsbGFub3guY29tPjsKPiA+
IGVwZXJlem1hQHJlZGhhdC5jb207IGx1bHVAcmVkaGF0LmNvbTsgUGFyYXYgUGFuZGl0Cj4gPiA8
cGFyYXZAbWVsbGFub3guY29tPjsgY2hyaXN0b3BoZS5kZS5kaW5lY2hpbkBnbWFpbC5jb207Cj4g
PiBrZXZpbi50aWFuQGludGVsLmNvbQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBWMyA0LzddIG1k
ZXY6IGludHJvZHVjZSBkZXZpY2Ugc3BlY2lmaWMgb3BzCj4gPiAKPiA+IE9uIFR1ZSwgMTUgT2N0
IDIwMTkgMjA6MTc6MDEgKzA4MDAKPiA+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
IHdyb3RlOgo+ID4gICAKPiA+ID4gT24gMjAxOS8xMC8xNSDkuIvljYg2OjQxLCBDb3JuZWxpYSBI
dWNrIHdyb3RlOiAgCj4gPiA+ID4gT24gRnJpLCAxMSBPY3QgMjAxOSAxNjoxNTo1NCArMDgwMAo+
ID4gPiA+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgoKPiA+ID4gPj4g
QEAgLTE2Nyw5ICsxNzYsMTAgQEAgcmVnaXN0ZXIgaXRzZWxmIHdpdGggdGhlIG1kZXYgY29yZSBk
cml2ZXI6Ogo+ID4gPiA+PiAgIAlleHRlcm4gaW50ICBtZGV2X3JlZ2lzdGVyX2RldmljZShzdHJ1
Y3QgZGV2aWNlICpkZXYsCj4gPiA+ID4+ICAgCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCBtZGV2X3BhcmVudF9vcHMKPiA+ID4gPj4gKm9wcyk7Cj4gPiA+ID4+
Cj4gPiA+ID4+IC1JdCBpcyBhbHNvIHJlcXVpcmVkIHRvIHNwZWNpZnkgdGhlIGNsYXNzX2lkIHRo
cm91Z2g6Ogo+ID4gPiA+PiArSXQgaXMgYWxzbyByZXF1aXJlZCB0byBzcGVjaWZ5IHRoZSBjbGFz
c19pZCBhbmQgZGV2aWNlIHNwZWNpZmljIG9wcyAgCj4gPiB0aHJvdWdoOjogIAo+ID4gPiA+Pgo+
ID4gPiA+PiAtCWV4dGVybiBpbnQgbWRldl9zZXRfY2xhc3Moc3RydWN0IGRldmljZSAqZGV2LCB1
MTYgaWQpOwo+ID4gPiA+PiArCWV4dGVybiBpbnQgbWRldl9zZXRfY2xhc3Moc3RydWN0IGRldmlj
ZSAqZGV2LCB1MTYgaWQsCj4gPiA+ID4+ICsJICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCB2b2lkICpvcHMpOyAgCj4gPiA+ID4gQXBvbG9naWVzIGlmIHRoYXQgaGFzIGFscmVhZHkgYmVl
biBkaXNjdXNzZWQsIGJ1dCBkbyB3ZSB3YW50IGEgMToxCj4gPiA+ID4gcmVsYXRpb25zaGlwIGJl
dHdlZW4gaWQgYW5kIG9wcywgb3IgY2FuIGRpZmZlcmVudCBkZXZpY2VzIHdpdGggdGhlCj4gPiA+
ID4gc2FtZSBpZCByZWdpc3RlciBkaWZmZXJlbnQgb3BzPyAgCj4gPiA+Cj4gPiA+Cj4gPiA+IEkg
dGhpbmsgd2UgaGF2ZSBhIE46MSBtYXBwaW5nIGJldHdlZW4gaWQgYW5kIG9wcywgZS5nIHdlIHdh
bnQgYm90aAo+ID4gPiB2aXJ0aW8tbWRldiBhbmQgdmhvc3QtbWRldiB1c2UgYSBzaW5nbGUgc2V0
IG9mIGRldmljZSBvcHMuICAKPiA+IAo+ID4gVGhlIGNvbnRlbnRzIG9mIHRoZSBvcHMgc3RydWN0
dXJlIGlzIGVzc2VudGlhbGx5IGRlZmluZWQgYnkgdGhlIGlkLCB3aGljaCBpcwo+ID4gd2h5IEkg
d2FzIGxlYW5pbmcgdG93YXJkcyB0aGVtIGJlaW5nIGRlZmluZWQgdG9nZXRoZXIuICBUaGV5IGFy
ZSBlZmZlY3RpdmVseQo+ID4gaW50ZXJsb2NrZWQsIHRoZSBpZCBkZWZpbmVzIHdoaWNoIG1kZXYg
ImVuZHBvaW50Igo+ID4gZHJpdmVyIGlzIGxvYWRlZCBhbmQgdGhhdCBkcml2ZXIgcmVxdWlyZXMg
bWRldl9nZXRfZGV2X29wcygpIHRvIHJldHVybiB0aGUKPiA+IHN0cnVjdHVyZSByZXF1aXJlZCBi
eSB0aGUgZHJpdmVyLiAgSSB3aXNoIHRoZXJlIHdhcyBhIHdheSB3ZSBjb3VsZAo+ID4gaW5jb3Jw
b3JhdGUgdHlwZSBjaGVja2luZyBoZXJlLiAgV2UgdG95ZWQgd2l0aCB0aGUgaWRlYSBvZiBoYXZp
bmcgdGhlIGNsYXNzCj4gPiBpbiB0aGUgc2FtZSBzdHJ1Y3R1cmUgYXMgdGhlIG9wcywgYnV0IEkg
dGhpbmsgdGhpcyBhcHByb2FjaCB3YXMgY2hvc2VuIGZvcgo+ID4gc2ltcGxpY2l0eS4gIFdlIGNv
dWxkIHN0aWxsIGRvIHNvbWV0aGluZyBsaWtlOgo+ID4gCj4gPiBpbnQgbWRldl9zZXRfY2xhc3Nf
c3RydWN0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IG1kZXZfY2xhc3Nfc3RydWN0
Cj4gPiAqY2xhc3MpOwo+ID4gCj4gPiBzdHJ1Y3QgbWRldl9jbGFzc19zdHJ1Y3Qgewo+ID4gCXUx
NglpZDsKPiA+IAl1bmlvbiB7Cj4gPiAJCXN0cnVjdCB2ZmlvX21kZXZfb3BzIHZmaW9fb3BzOwo+
ID4gCQlzdHJ1Y3QgdmlydGlvX21kZXZfb3BzIHZpcnRpb19vcHM7Cj4gPiAJfTsKPiA+IH07Cj4g
PiAKPiA+IE1heWJlIGV2ZW46Cj4gPiAKPiA+IHN0cnVjdCB2ZmlvX21kZXZfb3BzICptZGV2X2dl
dF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpIHsKPiA+IAlCVUdfT04obWRldi0+
Y2xhc3MuaWQgIT0gTURFVl9JRF9WRklPKTsKPiA+IAlyZXR1cm4gJm1kZXYtPmNsYXNzLnZmaW9f
b3BzOwo+ID4gfQo+ID4gCj4gPiBUaGUgbWF0Y2ggY2FsbGJhY2sgd291bGQgb2YgY291cnNlIGp1
c3QgdXNlIHRoZSBtZGV2LT5jbGFzcy5pZCB2YWx1ZS4KPiA+IEZ1bmN0aW9uYWxseSBlcXVpdmFs
ZW50LCBidXQgbWF5YmUgYmV0dGVyIHR5cGUgY2hhcmFjdGVyaXN0aWNzLiAgVGhhbmtzLAo+ID4g
Cj4gPiBBbGV4ICAKPiAKPiBXZSBoYXZlIDMgdXNlIGNhc2VzIG9mIG1kZXYuCj4gMS4gY3VycmVu
dCBtZGV2IGJpbmRpbmcgdG8gdmZpb19tZGV2Cj4gMi4gbWRldiBiaW5kaW5nIHRvIHZpcnRpbwo+
IDMuIG1kZXYgYmluZGluZyB0byBtbHg1X2NvcmUgd2l0aG91dCBkZXZfb3BzCj4gCj4gQWxzbyAK
PiAoYSkgYSBnaXZlbiBwYXJlbnQgbWF5IHNlcnZlIG11bHRpcGxlIHR5cGVzIG9mIGNsYXNzZXMg
aW4gZnV0dXJlLgo+IChiKSBudW1iZXIgb2YgY2xhc3NlcyBtYXkgbm90IGxpa2VseSBleHBsb2Rl
LCB0aGV5IHdpbGwgYmUgaGFuZGZ1bCBvZiB0aGVtLiAodmZpb19tZGV2LCB2aXJ0aW8pCj4gCj4g
U28sIGluc3RlYWQgb2YgbWFraW5nIGNvcGllcyBvZiB0aGlzIGRldl9vcHMgcG9pbnRlciBpbiBl
YWNoIG1kZXYsIGl0IGlzIGJldHRlciB0byBrZWVwIGNvbnN0IG11bHRpcGxlIG9wcyBpbiB0aGVp
ciBwYXJlbnQgZGV2aWNlLgo+IFNvbWV0aGluZyBsaWtlIGJlbG93LAo+IAo+IHN0cnVjdCBtZGV2
X3BhcmVudCB7Cj4gCVsuLl0KPiAJc3RydWN0IG1kZXZfcGFyZW50X29wcyAqcGFyZW50X29wczsg
LyogY3JlYXRlLCByZW1vdmUgKi8KPiAJc3RydWN0IHZmaW9fbWRldl9vcHMgKnZmaW9fb3BzOyAv
KiByZWFkLHdyaXRlLCBpb2N0bCBldGMgKi8KPiAJc3RydWN0IHZpcnRpb19tZGV2X29wcyAqdmly
dGlvX29wczsgLyogdmlydGlvIG9wcyAqLwo+IH07CgpUaGF0IGZlZWxzIGEgYml0IG9kZC4gV2h5
IHNob3VsZCB0aGUgcGFyZW50IGNhcnJ5IHBvaW50ZXJzIHRvIGV2ZXJ5CnBvc3NpYmxlIHZlcnNp
b24gb2Ygb3BzPwoKPiAKPiBjb25zdCBzdHJ1Y3QgdmZpb19tZGV2X29wcyAqbWRldl9nZXRfdmZp
b19vcHMoc3RydWN0IG1kZXZfcGFyZW50ICpwYXJlbnQpOwo+IGNvbnN0IHN0cnVjdCB2aXJ0aW9f
bWRldl9vcHMgKm1kZXZfZ2V0X3ZpcnRpb19vcHMoc3RydWN0IG1kZXZfcGFyZW50ICpwYXJlbnQp
Owo+IAo+IFRoaXMgd2F5LCAKPiAoYSkgd2UgaGF2ZSBzdHJvbmcgdHlwZSBjaGVjayBzdXBwb3J0
Cj4gKGIpIG9wcyBwb2ludGVyIGlzIG5vdCBkdXBsaWNhdGVkIGFjcm9zcyBzZXZlcmFsIGh1bmRy
ZWQgbWRldiBkZXZpY2VzLCBhbmQgZG9uJ3QgaGF2ZSB0byBzZXQgb24gZXZlcnkgbWRldiBjcmVh
dGlvbgo+IChjKSBhbGwgMyBjbGFzc2VzIG9mIG1kZXYgYXJlIHN1cHBvcnRlZAo+IChkKSBvbmUg
ZXh0cmEgc3ltYm9sIHRhYmxlIGVudHJ5IHVzZWQgcGVyIG9wcyB0eXBlLCBidXQgdGhlcmUgYXJl
IG5vdCBleHBlY3RlZCB0byBncm93IGEgbG90Lgo+IChlKSBtdWx0aXBsZSBjbGFzc2VzIHBlciBz
aW5nbGUgcGFyZW50IGlzIHN0aWxsIHN1cHBvcnRlZAo+IChmKSBzdGlsbCBleHRlbmRpYmxlIGZv
ciBtdWx0aXBsZSBjbGFzc2VzICh3ZWxsIGRlZmluZWQgY2xhc3NlcyA9IHZmaW8sIHZpcnRpbywg
YW5kIHZlbmRvciBjbGFzcykKCllldCBhbm90aGVyIHN1Z2dlc3Rpb246IGhhdmUgdGhlIGNsYXNz
IGlkIGRlcml2ZSBmcm9tIHRoZSBmdW5jdGlvbiB5b3UKdXNlIHRvIHNldCB1cCB0aGUgb3BzLgoK
dm9pZCBtZGV2X3NldF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIGNvbnN0IHN0
cnVjdCB2ZmlvX21kZXZfb3BzICp2ZmlvX29wcykKewoJbWRldi0+ZGV2aWNlX29wcyA9IHZmaW9f
b3BzOwoJbWRldi0+Y2xhc3NfaWQgPSBNREVWX0lEX1ZGSU87Cn0KCnZvaWQgbWRldl9zZXRfdmly
dGlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIGNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRl
dl9vcHMgKnZpcnRpb19vcHMpCnsKCW1kZXYtPmRldmljZV9vcHMgPSB2aXJ0aW9fb3BzOwoJbWRl
di0+Y2xhc3NfaWQgPSBNREVWX0lEX1ZJUlRJTzsKfQoKdm9pZCBtZGV2X3NldF92aG9zdF9vcHMo
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCBjb25zdCBzdHJ1Y3QgdmlydGlvX21kZXZfb3BzICp2
aXJ0aW9fb3BzKQp7CgltZGV2LT5kZXZpY2Vfb3BzID0gdmlydGlvX29wczsKCW1kZXYtPmNsYXNz
X2lkID0gTURFVl9JRF9WSE9TVDsKfQoKdm9pZCBtZGV2X3NldF92ZW5kb3Jfb3BzKHN0cnVjdCBt
ZGV2X2RldmljZSAqbWRldikgLyogbm8gb3BzICovCnsKCW1kZXYtPmNsYXNzX2lkID0gTURFVl9J
RF9WRU5ET1I7Cn0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
