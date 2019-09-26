Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B391BF6A7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 18:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED856EDD4;
	Thu, 26 Sep 2019 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988706EDB2;
 Thu, 26 Sep 2019 16:26:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4A492315C027;
 Thu, 26 Sep 2019 16:26:16 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42F615D9D5;
 Thu, 26 Sep 2019 16:26:08 +0000 (UTC)
Date: Thu, 26 Sep 2019 10:26:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
Message-ID: <20190926102608.5ec81923@x1.home>
In-Reply-To: <20190926113958-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-6-jasowang@redhat.com>
 <20190924170638.064d85f7@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
 <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
 <20190925103028.1f2edf03@x1.home>
 <20190926113958-mutt-send-email-mst@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 26 Sep 2019 16:26:16 +0000 (UTC)
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 Rob Miller <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNiBTZXAgMjAxOSAxMTo0Njo1NSAtMDQwMAoiTWljaGFlbCBTLiBUc2lya2luIiA8
bXN0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBhdCAxMDozMDoy
OEFNIC0wNjAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gPiBPbiBXZWQsIDI1IFNlcCAyMDE5
IDEwOjExOjAwIC0wNDAwCj4gPiBSb2IgTWlsbGVyIDxyb2IubWlsbGVyQGJyb2FkY29tLmNvbT4g
d3JvdGU6ICAKPiA+ID4gPiA+IE9uIFR1ZSwgMjQgU2VwIDIwMTkgMjE6NTM6MjkgKzA4MDAKPiA+
ID4gPiA+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOiAgCj4gPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAKPiA+ID4g
PiA+IGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgCj4gPiA+ID4gPiA+IGluZGV4
IDg5MWNmODNhMmQ5YS4uOTVlZmEwNTQ0NDJmIDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZmaW8v
bWRldi92ZmlvX21kZXYuYwo+ID4gPiA+ID4gPiBAQCAtMTQsNiArMTQsNyBAQAo+ID4gPiA+ID4g
PiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC92
ZmlvLmg+Cj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvbWRldi5oPgo+ID4gPiA+ID4gPiAr
I2luY2x1ZGUgPGxpbnV4L3ZmaW9fbWRldi5oPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgI2lu
Y2x1ZGUgIm1kZXZfcHJpdmF0ZS5oIgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBAQCAtMjQsMTYg
KzI1LDE2IEBACj4gPiA+ID4gPiA+ICBzdGF0aWMgaW50IHZmaW9fbWRldl9vcGVuKHZvaWQgKmRl
dmljZV9kYXRhKQo+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPiAgICAgc3RydWN0IG1kZXZfZGV2
aWNlICptZGV2ID0gZGV2aWNlX2RhdGE7Cj4gPiA+ID4gPiA+IC0gICBzdHJ1Y3QgbWRldl9wYXJl
bnQgKnBhcmVudCA9IG1kZXYtPnBhcmVudDsKPiA+ID4gPiA+ID4gKyAgIGNvbnN0IHN0cnVjdCB2
ZmlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gICAgCj4gPiA+ID4gPiBtZGV2X2dldF9kZXZfb3Bz
KG1kZXYpOyAgICAKPiA+ID4gPiA+ID4gICAgIGludCByZXQ7Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IC0gICBpZiAodW5saWtlbHkoIXBhcmVudC0+b3BzLT5vcGVuKSkKPiA+ID4gPiA+ID4gKyAg
IGlmICh1bmxpa2VseSghb3BzLT5vcGVuKSkKPiA+ID4gPiA+ID4gICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICBpZiAoIXRyeV9tb2R1bGVfZ2V0
KFRISVNfTU9EVUxFKSkKPiA+ID4gPiA+ID4gICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7ICAg
IAo+ID4gPiA+ICAgIAo+ID4gPiAgIAo+ID4gPiBSSk0+XSBNeSB1bmRlcnN0YW5kaW5nIGxhdGVs
eSBpcyB0aGF0IHRoaXMgY2FsbCB0byAgICAKPiA+ID4gdHJ5X21vZHVsZV9nZXQoVEhJU19NT0RV
TEUpIGlzIG5vIGxvbmdlciBuZWVkZWQgYXMgaXMgY29uc2lkZXJlZCBhcyBhCj4gPiA+IGxhdGVu
dCBidWcuCj4gPiA+IFF1b3RlIGZyb20KPiA+ID4gaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9x
dWVzdGlvbnMvMTc0MTQxNS9saW51eC1rZXJuZWwtbW9kdWxlcy13aGVuLXRvLXVzZS10cnktbW9k
dWxlLWdldC1tb2R1bGUtcHV0Cj4gPiA+ICA6Cj4gPiA+IFRoZXJlIGFyZSBhIG51bWJlciBvZiB1
c2VzIG9mIHRyeV9tb2R1bGVfZ2V0KFRISVNfTU9EVUxFKSBpbiB0aGUga2VybmVsCj4gPiA+IHNv
dXJjZSBidXQgbW9zdCBpZiBub3QgYWxsIG9mIHRoZW0gYXJlIGxhdGVudCBidWdzIHRoYXQgc2hv
dWxkIGJlIGNsZWFuZWQKPiA+ID4gdXAuICAKPiA+IAo+ID4gVGhpcyB1c2Ugc2VlbXMgdG8gZmFs
bCBleGFjdGx5IGludG8gdGhlIGNhc2Ugd2hlcmUgaXQgaXMgbmVjZXNzYXJ5LCB0aGUKPiA+IG9w
ZW4gaGVyZSBpcyBub3QgYSBkaXJlY3QgVkZTIGNhbGwsIGl0J3MgYW4gaW50ZXJuYWwgaW50ZXJm
YWNlIGJldHdlZW4KPiA+IG1vZHVsZXMuICBUaGUgdXNlciBpcyBpbnRlcmFjdGluZyB3aXRoIGZp
bGVzeXN0ZW0gb2JqZWN0cyBmcm9tIHRoZSB2ZmlvCj4gPiBtb2R1bGUgYW5kIHRoZSBtb2R1bGUg
cmVmZXJlbmNlIHdlJ3JlIHRyeWluZyB0byBhY3F1aXJlIGhlcmUgaXMgdG8gdGhlCj4gPiB2Zmlv
LW1kZXYgbW9kdWxlLiAgVGhhbmtzLAo+ID4gCj4gPiBBbGV4ICAKPiAKPiAKPiBJIHRoaW5rIHRo
ZSBsYXRlbnQgYnVnIHJlZmVycyBub3QgdG8gbW9kdWxlIGdldCBwZXIgc2UsCj4gYnV0IHRvIHRo
ZSBtb2R1bGVfcHV0IHRpZWQgdG8gaXQuIEUuZy46Cj4gCj4gIHN0YXRpYyB2b2lkIHZmaW9fbWRl
dl9yZWxlYXNlKHZvaWQgKmRldmljZV9kYXRhKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbWRldl9k
ZXZpY2UgKm1kZXYgPSBkZXZpY2VfZGF0YTsKPiAgICAgICAgIHN0cnVjdCBtZGV2X3BhcmVudCAq
cGFyZW50ID0gbWRldi0+cGFyZW50Owo+IAo+ICAgICAgICAgaWYgKGxpa2VseShwYXJlbnQtPm9w
cy0+cmVsZWFzZSkpCj4gICAgICAgICAgICAgICAgIHBhcmVudC0+b3BzLT5yZWxlYXNlKG1kZXYp
Owo+IAo+ICAgICAgICAgbW9kdWxlX3B1dChUSElTX01PRFVMRSk7Cj4gCj4gRG9lcyBhbnl0aGlu
ZyBwcmV2ZW50IHRoZSBtb2R1bGUgZnJvbSB1bmxvYWRpbmcgYXQgdGhpcyBwb2ludD8KPiBpZiBu
b3QgdGhlbiAuLi4KPiAKPiAKPiAgfQo+IAo+IGl0IGxvb2tzIGxpa2UgdGhlIGltcGxpY2l0IHJl
dHVybiAod2l0aCBpbnN0cnVjdGlvbnMgZm9yIGFyZ3VtZW50IHBvcAo+IGFuZCBmdW5jdHVvbiBy
ZXR1cm4pIGhlcmUgY2FuIGdldCBvdmVyd3JpdHRlbiBvbiBtb2R1bGUKPiB1bmxvYWQsIGNhdXNp
bmcgYSBjcmFzaCB3aGVuIGV4ZWN1dGVkLgo+IAo+IElPVyB0aGVyZSdzIGdlbmVyYWxseSBubyB3
YXkgZm9yIG1vZHVsZSB0byBrZWVwIGEgcmVmZXJlbmNlCj4gdG8gaXRzZWxmOiBpdCBjYW4gdGFr
ZSBhIHJlZmVyZW5jZSBidXQgaXQgbmVlZHMgc29tZW9uZSBlbHNlCj4gdG8ga2VlcCBpdCBhbmQg
cHV0LgoKSSdkIGFsd2F5cyBhc3N1bWVkIHRoaXMgd291bGQgZXhpdCBjbGVhbmx5LCBidXQgcGVy
aGFwcyB0aGVyZSBpcyBhCmxhdGVudCByYWNlIHRoZXJlLiAgSW4gYW55IGNhc2UsIHRha2luZyBh
IG1vZHVsZSByZWZlcmVuY2Ugd2l0aGluIHRoZQptb2R1bGUgaW4gdGhpcyBjYXNlIGlzIGJldHRl
ciB0aGFuIG5vdCBkb2luZyBzbywgYXMgdGhlIGxhdHRlciB3b3VsZApwb3RlbnRpYWxseSBhbGxv
dyB0aGUgbW9kdWxlIHRvIGJlIHJlbW92ZWQgYXQgYW55IHBvaW50IGluIHRpbWUsIHdoaWxlCnRo
ZSBmb3JtZXIgb25seSBzZWVtcyB0byBleHBvc2UgYWNxdWlyZSBhbmQgcmVsZWFzZSBnYXBzLiAg
QWRkIGl0IHRvCnRoZSB0b2RvIGxpc3QuICBUaGFua3MsCgpBbGV4Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
