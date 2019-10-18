Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F82DC613
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 15:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FCC6EB45;
	Fri, 18 Oct 2019 13:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9076EB45;
 Fri, 18 Oct 2019 13:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE75D307D986;
 Fri, 18 Oct 2019 13:31:12 +0000 (UTC)
Received: from gondolin (dhcp-192-202.str.redhat.com [10.33.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 406EB60619;
 Fri, 18 Oct 2019 13:30:45 +0000 (UTC)
Date: Fri, 18 Oct 2019 15:30:42 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 4/6] mdev: introduce virtio device and its device ops
Message-ID: <20191018153042.3516cde1.cohuck@redhat.com>
In-Reply-To: <733c0cfe-064f-c8ba-6bf8-165db88d7e07@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-5-jasowang@redhat.com>
 <20191018114614.6f1e79dc.cohuck@redhat.com>
 <733c0cfe-064f-c8ba-6bf8-165db88d7e07@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 18 Oct 2019 13:31:13 +0000 (UTC)
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org, alex.williamson@redhat.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxOCBPY3QgMjAxOSAxODo1NTowMiArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMjAxOS8xMC8xOCDkuIvljYg1OjQ2LCBDb3JuZWxpYSBI
dWNrIHdyb3RlOgo+ID4gT24gVGh1LCAxNyBPY3QgMjAxOSAxODo0ODozNCArMDgwMAo+ID4gSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+ID4+ICsgKiBAZ2V0X3ZlbmRv
cl9pZDoJCUdldCB2aXJ0aW8gdmVuZG9yIGlkCj4gPj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBk
ZXZpY2UKPiA+PiArICoJCQkJUmV0dXJucyB1MzI6IHZpcnRpbyB2ZW5kb3IgaWQgIAo+ID4gSG93
IGlzIHRoZSB2ZW5kb3IgaWQgZGVmaW5lZD8gQXMgZm9yIG5vcm1hbCB2aXJ0aW8tcGNpIGRldmlj
ZXM/ICAKPiAKPiAKPiBUaGUgdmVuZG9yIHRoYXQgcHJvdmlkZXMgdGhpcyBkZXZpY2UuIFNvIHNv
bWV0aGluZyBsaWtlIHRoaXMKPiAKPiBJIG5vdGljZSB0aGF0IE1NSU8gYWxzbyBoYWQgdGhpcyBz
byBpdCBsb29rcyB0byBtZSBpdCdzIG5vdCBwY2kgc3BlY2lmaWMuCgpPay4gV291bGQgYmUgZ29v
ZCB0byBzcGVjaWZ5IHRoaXMgbW9yZSBleHBsaWNpdGx5LgoKPiAKPiAKPiA+ICAKPiA+PiArICog
QGdldF9zdGF0dXM6IAkJR2V0IHRoZSBkZXZpY2Ugc3RhdHVzCj4gPj4gKyAqCQkJCUBtZGV2OiBt
ZWRpYXRlZCBkZXZpY2UKPiA+PiArICoJCQkJUmV0dXJucyB1ODogdmlydGlvIGRldmljZSBzdGF0
dXMKPiA+PiArICogQHNldF9zdGF0dXM6IAkJU2V0IHRoZSBkZXZpY2Ugc3RhdHVzCj4gPj4gKyAq
CQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPiA+PiArICoJCQkJQHN0YXR1czogdmlydGlvIGRl
dmljZSBzdGF0dXMKPiA+PiArICogQGdldF9jb25maWc6IAkJUmVhZCBmcm9tIGRldmljZSBzcGVj
aWZpYyBjb25maWd1cmF0aW9uIHNwYWNlCj4gPj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZp
Y2UKPiA+PiArICoJCQkJQG9mZnNldDogb2Zmc2V0IGZyb20gdGhlIGJlZ2lubmluZyBvZgo+ID4+
ICsgKgkJCQljb25maWd1cmF0aW9uIHNwYWNlCj4gPj4gKyAqCQkJCUBidWY6IGJ1ZmZlciB1c2Vk
IHRvIHJlYWQgdG8KPiA+PiArICoJCQkJQGxlbjogdGhlIGxlbmd0aCB0byByZWFkIGZyb20KPiA+
PiArICoJCQkJY29uZmlncmF0aW9uIHNwYWNlCj4gPj4gKyAqIEBzZXRfY29uZmlnOiAJCVdyaXRl
IHRvIGRldmljZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uIHNwYWNlCj4gPj4gKyAqCQkJCUBtZGV2
OiBtZWRpYXRlZCBkZXZpY2UKPiA+PiArICoJCQkJQG9mZnNldDogb2Zmc2V0IGZyb20gdGhlIGJl
Z2lubmluZyBvZgo+ID4+ICsgKgkJCQljb25maWd1cmF0aW9uIHNwYWNlCj4gPj4gKyAqCQkJCUBi
dWY6IGJ1ZmZlciB1c2VkIHRvIHdyaXRlIGZyb20KPiA+PiArICoJCQkJQGxlbjogdGhlIGxlbmd0
aCB0byB3cml0ZSB0bwo+ID4+ICsgKgkJCQljb25maWdyYXRpb24gc3BhY2UKPiA+PiArICogQGdl
dF9tZGV2X2ZlYXR1cmVzOgkJR2V0IHRoZSBmZWF0dXJlIG9mIHZpcnRpbyBtZGV2IGRldmljZQo+
ID4+ICsgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4gPj4gKyAqCQkJCVJldHVybnMgdGhl
IG1kZXYgZmVhdHVyZXMgKEFQSSkgc3VwcG9ydCBieQo+ID4+ICsgKgkJCQl0aGUgZGV2aWNlLiAg
Cj4gPiBXaGF0IGtpbmQgb2YgJ2ZlYXR1cmVzJyBhcmUgc3VwcG9zZWQgdG8gZ28gaW4gdGhlcmU/
IEFyZSB0aGVzZSBiaXRzLAo+ID4gbGlrZSB5b3UgZGVmaW5lZCBmb3IgVklSVElPX01ERVZfRl9W
RVJTSU9OXzEgYWJvdmU/ICAKPiAKPiAKPiBJdCdzIHRoZSBBUEkgb3IgbWRldiBmZWF0dXJlcyBv
dGhlciB0aGFuIHZpcnRpbyBmZWF0dXJlcy4gSXQgY291bGQgYmUgCj4gdXNlZCBieSBkcml2ZXIg
dG8gZGV0ZXJtaW5lIHRoZSBjYXBhYmlsaXR5IG9mIHRoZSBtZGV2IGRldmljZS4gQmVzaWRlcyAK
PiBfRl9WRVJTSU9OXzEsIHdlIG1heSBhZGQgZGlydHkgcGFnZSB0cmFja2luZyBldGMgd2hpY2gg
bWVhbnMgd2UgbmVlZCBuZXcgCj4gZGV2aWNlIG9wcy4KCk9rLCBzbyB0aGF0J3Mgc3VwcG9zZWQg
dG8gYmUgZGlzdGluY3QgYml0cyB0aGF0IGNhbiBiZSBvcidlZCB0b2dldGhlcj8KTWFrZXMgc2Vu
c2UsIGJ1dCBwcm9iYWJseSBuZWVkcyBzb21lIG1vcmUgZG9jdW1lbnRhdGlvbiBzb21ld2hlcmUu
Cgo+IAo+IAo+ID4gIAo+ID4+ICsgKiBAZ2V0X2dlbmVyYXRpb246CQlHZXQgZGV2aWNlIGdlbmVy
YXRvbgo+ID4+ICsgKgkJCQlAbWRldjogbWVkaWF0ZWQgZGV2aWNlCj4gPj4gKyAqCQkJCVJldHVy
bnMgdTMyOiBkZXZpY2UgZ2VuZXJhdGlvbiAgCj4gPiBJcyB0aGF0IGNhbGxiYWNrIG1hbmRhdG9y
eT8gIAo+IAo+IAo+IEkgdGhpbmsgc28sIGl0J3MgaGFyZCB0byBlbXVsYXRlIHRoYXQgY29tcGxl
dGVseSBpbiB2aXJ0aW8tbWRldiB0cmFuc3BvcnQuCgpJSVJDLCB0aGUgZ2VuZXJhdGlvbiBzdHVm
ZiBpcyBub3QgbWFuZGF0b3J5IGluIHRoZSBjdXJyZW50IHZlcnNpb24gb2YKdmlydGlvLCBhcyBu
b3QgYWxsIHRyYW5zcG9ydHMgaGF2ZSB0aGF0IGNvbmNlcHQuCgpHZW5lcmFsbHksIGFyZSBhbnkg
b2YgdGhlIGNhbGxiYWNrcyBvcHRpb25hbCwgb3IgYXJlIGFsbCBvZiB0aGVtCm1hbmRhdG9yeT8g
RnJvbSB3aGF0IEkgdW5kZXJzdGFuZCwgeW91IHBsYW4gdG8gYWRkIG5ldyB0aGluZ3MgdGhhdApk
ZXBlbmQgb24gZmVhdHVyZXMuLi4gd291bGQgdGhhdCBtZWFuIG5vbi1tYW5kYXRvcnkgY2FsbGJh
Y2tzPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
