Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04875D732A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 12:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055F689CAA;
	Tue, 15 Oct 2019 10:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D837C89CAA;
 Tue, 15 Oct 2019 10:26:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C3DBA306F4AB;
 Tue, 15 Oct 2019 10:26:22 +0000 (UTC)
Received: from gondolin (dhcp-192-233.str.redhat.com [10.33.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ACB65DA8C;
 Tue, 15 Oct 2019 10:26:09 +0000 (UTC)
Date: Tue, 15 Oct 2019 12:26:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 1/7] mdev: class id support
Message-ID: <20191015122607.126e3960.cohuck@redhat.com>
In-Reply-To: <20191011081557.28302-2-jasowang@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-2-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 15 Oct 2019 10:26:26 +0000 (UTC)
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
 airlied@linux.ie, heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 alex.williamson@redhat.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMSBPY3QgMjAxOSAxNjoxNTo1MSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gTWRldiBidXMgb25seSBzdXBwb3J0cyB2ZmlvIGRyaXZlciBy
aWdodCBub3csIHNvIGl0IGRvZXNuJ3QgaW1wbGVtZW50Cj4gbWF0Y2ggbWV0aG9kLiBCdXQgaW4g
dGhlIGZ1dHVyZSwgd2UgbWF5IGFkZCBkcml2ZXJzIG90aGVyIHRoYW4gdmZpbywKPiB0aGUgZmly
c3QgZHJpdmVyIGNvdWxkIGJlIHZpcnRpby1tZGV2LiBUaGlzIG1lYW5zIHdlIG5lZWQgdG8gYWRk
Cj4gZGV2aWNlIGNsYXNzIGlkIHN1cHBvcnQgaW4gYnVzIG1hdGNoIG1ldGhvZCB0byBwYWlyIHRo
ZSBtZGV2IGRldmljZQo+IGFuZCBtZGV2IGRyaXZlciBjb3JyZWN0bHkuCj4gCj4gU28gdGhpcyBw
YXRjaCBhZGRzIGlkX3RhYmxlIHRvIG1kZXZfZHJpdmVyIGFuZCBjbGFzc19pZCBmb3IgbWRldgo+
IGRldmljZSB3aXRoIHRoZSBtYXRjaCBtZXRob2QgZm9yIG1kZXYgYnVzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gLS0tCj4gIERvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgfCAgNyArKysrKystCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4gIGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICAgICAgICAgICAgICAgICAgfCAg
MSArCj4gIGRyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYyAgICAgICAgICAgICAgICAg
fCAgMSArCj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICAgICAgICAgICAgICAg
ICAgfCAxMSArKysrKysrKysrKwo+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAg
ICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPiAgZHJpdmVycy92ZmlvL21kZXYv
bWRldl9wcml2YXRlLmggICAgICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy92ZmlvL21k
ZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKysrKwo+ICBpbmNsdWRl
L2xpbnV4L21kZXYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrKysrKysK
PiAgaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaCAgICAgICAgICAgICAgICAgICB8ICA4
ICsrKysrKysrCj4gIHNhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMSArCj4gIHNhbXBsZXMvdmZpby1tZGV2L21kcHkuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gIHNhbXBsZXMvdmZpby1tZGV2L210dHkuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCj4gIDEzIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBp
L3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92Zmlv
LW1lZGlhdGVkLWRldmljZS5yc3QKPiBpbmRleCAyNWViN2Q1YjgzNGIuLjIwMzVlNDhkYTdiMiAx
MDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZp
Y2UucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2
aWNlLnJzdAo+IEBAIC0xMDIsMTIgKzEwMiwxNCBAQCBzdHJ1Y3R1cmUgdG8gcmVwcmVzZW50IGEg
bWVkaWF0ZWQgZGV2aWNlJ3MgZHJpdmVyOjoKPiAgICAgICAgKiBAcHJvYmU6IGNhbGxlZCB3aGVu
IG5ldyBkZXZpY2UgY3JlYXRlZAo+ICAgICAgICAqIEByZW1vdmU6IGNhbGxlZCB3aGVuIGRldmlj
ZSByZW1vdmVkCj4gICAgICAgICogQGRyaXZlcjogZGV2aWNlIGRyaXZlciBzdHJ1Y3R1cmUKPiAr
ICAgICAgKiBAaWRfdGFibGU6IHRoZSBpZHMgc2VydmljZWQgYnkgdGhpcyBkcml2ZXIKPiAgICAg
ICAgKi8KPiAgICAgICBzdHJ1Y3QgbWRldl9kcml2ZXIgewo+ICAJICAgICBjb25zdCBjaGFyICpu
YW1lOwo+ICAJICAgICBpbnQgICgqcHJvYmUpICAoc3RydWN0IGRldmljZSAqZGV2KTsKPiAgCSAg
ICAgdm9pZCAoKnJlbW92ZSkgKHN0cnVjdCBkZXZpY2UgKmRldik7Cj4gIAkgICAgIHN0cnVjdCBk
ZXZpY2VfZHJpdmVyICAgIGRyaXZlcjsKPiArCSAgICAgY29uc3Qgc3RydWN0IG1kZXZfY2xhc3Nf
aWQgKmlkX3RhYmxlOwo+ICAgICAgIH07Cj4gIAo+ICBBIG1lZGlhdGVkIGJ1cyBkcml2ZXIgZm9y
IG1kZXYgc2hvdWxkIHVzZSB0aGlzIHN0cnVjdHVyZSBpbiB0aGUgZnVuY3Rpb24gY2FsbHMKPiBA
QCAtMTY1LDEyICsxNjcsMTUgQEAgcmVnaXN0ZXIgaXRzZWxmIHdpdGggdGhlIG1kZXYgY29yZSBk
cml2ZXI6Ogo+ICAJZXh0ZXJuIGludCAgbWRldl9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRldmlj
ZSAqZGV2LAo+ICAJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IG1kZXZfcGFyZW50X29wcyAqb3BzKTsKPiAgCj4gK0l0IGlzIGFsc28gcmVxdWlyZWQgdG8gc3Bl
Y2lmeSB0aGUgY2xhc3NfaWQgdGhyb3VnaDo6Cj4gKwo+ICsJZXh0ZXJuIGludCBtZGV2X3NldF9j
bGFzcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHUxNiBpZCk7CgpTaG91bGQgdGhlIGRvY3VtZW50IHN0
YXRlIGV4cGxpY2l0bHkgdGhhdCB0aGlzIHNob3VsZCBiZSBkb25lIGluIHRoZQotPmNyZWF0ZSgp
IGNhbGxiYWNrPyBBbHNvLCBJIHRoaW5rIHRoYXQgdGhlIGNsYXNzX2lkIG1pZ2h0IGJlIGRpZmZl
cmVudApmb3IgZGlmZmVyZW50IG1kZXZzIChldmVuIGlmIHRoZSBwYXJlbnQgaXMgdGhlIHNhbWUp
IC0tIHNob3VsZCB0aGF0IGJlCm1lbnRpb25lZCBleHBsaWNpdGx5PwoKPiArCj4gIEhvd2V2ZXIs
IHRoZSBtZGV2X3BhcmVudF9vcHMgc3RydWN0dXJlIGlzIG5vdCByZXF1aXJlZCBpbiB0aGUgZnVu
Y3Rpb24gY2FsbAo+ICB0aGF0IGEgZHJpdmVyIHNob3VsZCB1c2UgdG8gdW5yZWdpc3RlciBpdHNl
bGYgd2l0aCB0aGUgbWRldiBjb3JlIGRyaXZlcjo6Cj4gIAo+ICAJZXh0ZXJuIHZvaWQgbWRldl91
bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICAKPiAtCj4gIE1lZGlhdGVk
IERldmljZSBNYW5hZ2VtZW50IEludGVyZmFjZSBUaHJvdWdoIHN5c2ZzCj4gID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gIAooLi4uKQoKTG9va3Mg
cmVhc29uYWJsZSB0byBtZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
