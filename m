Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E233BE27A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 18:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9D46EC0D;
	Wed, 25 Sep 2019 16:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7C36EC08;
 Wed, 25 Sep 2019 16:30:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A8681DCD;
 Wed, 25 Sep 2019 16:30:36 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F421E45C8;
 Wed, 25 Sep 2019 16:30:28 +0000 (UTC)
Date: Wed, 25 Sep 2019 10:30:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Rob Miller <rob.miller@broadcom.com>
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
Message-ID: <20190925103028.1f2edf03@x1.home>
In-Reply-To: <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-6-jasowang@redhat.com>
 <20190924170638.064d85f7@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
 <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 25 Sep 2019 16:30:36 +0000 (UTC)
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
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "Vivi, 
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

T24gV2VkLCAyNSBTZXAgMjAxOSAxMDoxMTowMCAtMDQwMApSb2IgTWlsbGVyIDxyb2IubWlsbGVy
QGJyb2FkY29tLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgMjQgU2VwIDIwMTkgMjE6NTM6Mjkg
KzA4MDAKPiA+ID4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAKPiA+ID4gYi9k
cml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgCj4gPiA+ID4gaW5kZXggODkxY2Y4M2EyZDlh
Li45NWVmYTA1NDQ0MmYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvdmZp
b19tZGV2LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+ID4g
PiA+IEBAIC0xNCw2ICsxNCw3IEBACj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4g
PiA+ID4gICNpbmNsdWRlIDxsaW51eC92ZmlvLmg+Cj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9t
ZGV2Lmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC92ZmlvX21kZXYuaD4KPiA+ID4gPgo+ID4g
PiA+ICAjaW5jbHVkZSAibWRldl9wcml2YXRlLmgiCj4gPiA+ID4KPiA+ID4gPiBAQCAtMjQsMTYg
KzI1LDE2IEBACj4gPiA+ID4gIHN0YXRpYyBpbnQgdmZpb19tZGV2X29wZW4odm9pZCAqZGV2aWNl
X2RhdGEpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0g
ZGV2aWNlX2RhdGE7Cj4gPiA+ID4gLSAgIHN0cnVjdCBtZGV2X3BhcmVudCAqcGFyZW50ID0gbWRl
di0+cGFyZW50Owo+ID4gPiA+ICsgICBjb25zdCBzdHJ1Y3QgdmZpb19tZGV2X2RldmljZV9vcHMg
Km9wcyA9ICAKPiA+ID4gbWRldl9nZXRfZGV2X29wcyhtZGV2KTsgIAo+ID4gPiA+ICAgICBpbnQg
cmV0Owo+ID4gPiA+Cj4gPiA+ID4gLSAgIGlmICh1bmxpa2VseSghcGFyZW50LT5vcHMtPm9wZW4p
KQo+ID4gPiA+ICsgICBpZiAodW5saWtlbHkoIW9wcy0+b3BlbikpCj4gPiA+ID4gICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4KPiA+ID4gPiAgICAgaWYgKCF0cnlfbW9kdWxlX2dl
dChUSElTX01PRFVMRSkpCj4gPiA+ID4gICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7ICAKPiA+
ICAKPiAKPiBSSk0+XSBNeSB1bmRlcnN0YW5kaW5nIGxhdGVseSBpcyB0aGF0IHRoaXMgY2FsbCB0
byAgCj4gdHJ5X21vZHVsZV9nZXQoVEhJU19NT0RVTEUpIGlzIG5vIGxvbmdlciBuZWVkZWQgYXMg
aXMgY29uc2lkZXJlZCBhcyBhCj4gbGF0ZW50IGJ1Zy4KPiBRdW90ZSBmcm9tCj4gaHR0cHM6Ly9z
dGFja292ZXJmbG93LmNvbS9xdWVzdGlvbnMvMTc0MTQxNS9saW51eC1rZXJuZWwtbW9kdWxlcy13
aGVuLXRvLXVzZS10cnktbW9kdWxlLWdldC1tb2R1bGUtcHV0Cj4gIDoKPiBUaGVyZSBhcmUgYSBu
dW1iZXIgb2YgdXNlcyBvZiB0cnlfbW9kdWxlX2dldChUSElTX01PRFVMRSkgaW4gdGhlIGtlcm5l
bAo+IHNvdXJjZSBidXQgbW9zdCBpZiBub3QgYWxsIG9mIHRoZW0gYXJlIGxhdGVudCBidWdzIHRo
YXQgc2hvdWxkIGJlIGNsZWFuZWQKPiB1cC4KClRoaXMgdXNlIHNlZW1zIHRvIGZhbGwgZXhhY3Rs
eSBpbnRvIHRoZSBjYXNlIHdoZXJlIGl0IGlzIG5lY2Vzc2FyeSwgdGhlCm9wZW4gaGVyZSBpcyBu
b3QgYSBkaXJlY3QgVkZTIGNhbGwsIGl0J3MgYW4gaW50ZXJuYWwgaW50ZXJmYWNlIGJldHdlZW4K
bW9kdWxlcy4gIFRoZSB1c2VyIGlzIGludGVyYWN0aW5nIHdpdGggZmlsZXN5c3RlbSBvYmplY3Rz
IGZyb20gdGhlIHZmaW8KbW9kdWxlIGFuZCB0aGUgbW9kdWxlIHJlZmVyZW5jZSB3ZSdyZSB0cnlp
bmcgdG8gYWNxdWlyZSBoZXJlIGlzIHRvIHRoZQp2ZmlvLW1kZXYgbW9kdWxlLiAgVGhhbmtzLAoK
QWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
