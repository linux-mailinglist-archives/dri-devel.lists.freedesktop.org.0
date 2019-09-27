Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF62C014C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 10:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72706EE95;
	Fri, 27 Sep 2019 08:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138F46EE58;
 Fri, 27 Sep 2019 08:37:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 38C8EC05AA52;
 Fri, 27 Sep 2019 08:37:36 +0000 (UTC)
Received: from [10.72.12.30] (ovpn-12-30.pek2.redhat.com [10.72.12.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18629600C6;
 Fri, 27 Sep 2019 08:37:08 +0000 (UTC)
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
To: Alex Williamson <alex.williamson@redhat.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-7-jasowang@redhat.com>
 <20190924170640.1da03bae@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <baa742f5-8d4e-f1f1-1194-f362cdf51fea@redhat.com>
Date: Fri, 27 Sep 2019 16:37:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924170640.1da03bae@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 27 Sep 2019 08:37:36 +0000 (UTC)
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
 rodrigo.vivi@intel.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvOS8yNSDkuIrljYg3OjA2LCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gVHVl
LCAyNCBTZXAgMjAxOSAyMTo1MzozMCArMDgwMAo+IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0
LmNvbT4gIHdyb3RlOgo+Cj4+IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBiYXNpYyBzdXBwb3J0IGZv
ciBtZGV2IGRyaXZlciB0aGF0IHN1cHBvcnRzCj4+IHZpcnRpbyB0cmFuc3BvcnQgZm9yIGtlcm5l
bCB2aXJ0aW8gZHJpdmVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5n
QHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICB8ICAg
MiArCj4+ICAgaW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5oIHwgMTQ1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQ3IGluc2VydGlv
bnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5o
Cj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21kZXYuaCBiL2luY2x1ZGUvbGludXgv
bWRldi5oCj4+IGluZGV4IDM0MTQzMDczMTFmMS4uNzNhYzI3YjNiODY4IDEwMDY0NAo+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L21kZXYuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L21kZXYuaAo+PiBA
QCAtMTI2LDYgKzEyNiw4IEBAIHN0cnVjdCBtZGV2X2RldmljZSAqbWRldl9mcm9tX2RldihzdHJ1
Y3QgZGV2aWNlICpkZXYpOwo+PiAgIAo+PiAgIGVudW0gewo+PiAgIAlNREVWX0lEX1ZGSU8gPSAx
LAo+PiArCU1ERVZfSURfVklSVElPID0gMiwKPj4gKwlNREVWX0lEX1ZIT1NUID0gMywKPiBNREVW
X0lEX1ZIT1NUIGlzbid0IHVzZWQgeWV0IGhlcmUuICBBbHNvLCBnaXZlbiB0aGUgc3Ryb25nCj4g
aW50ZXJkZXBlbmRlbmNlIGJldHdlZW4gdGhlIGNsYXNzX2lkIGFuZCB0aGUgb3BzIHN0cnVjdHVy
ZSwgd2UgbWlnaHQKPiB3YW5kIHRvIGRlZmluZSB0aGVtIGluIHRoZSBzYW1lIHBsYWNlLiAgVGhh
bmtzLAo+Cj4gQWxleAo+CgpSZXRoaW5rIGFib3V0IHRoaXMswqAgSSBiZWxpZXZlIGl0J3MgYmV0
dGVyIHRvIGRlZmluZSB0aGUgZGV2aWNlIG9wcyBpbiAKdGhlaXIgb3duIGhlYWRlcnMsIGFuZCBv
bmUgc2V0IG9mIGRldmljZSBvcHMgY291bGQgYmUgdXNlZCBmb3IgdHdvIApjbGFzc2VzIChlLmcg
Ym90aCB2aXJ0aW8gYW5kIHZob3N0KS4gQW5kIHRvIGF2b2lkIGEgZHVwbGljYXRlZCBJRCAKZGVm
aW5pdGlvbi4gSSB0ZW5kIHRvIGtlZXAgdGhpcyBpbiB0aGUgY29tbW9uIG1kZXYuaCBoZWFkZXIu
CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
