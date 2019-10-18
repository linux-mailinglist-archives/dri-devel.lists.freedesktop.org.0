Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C98FDC731
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 16:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD036EB64;
	Fri, 18 Oct 2019 14:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F936EB64;
 Fri, 18 Oct 2019 14:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 778C7C057F2C;
 Fri, 18 Oct 2019 14:20:26 +0000 (UTC)
Received: from gondolin (dhcp-192-202.str.redhat.com [10.33.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45C8519D70;
 Fri, 18 Oct 2019 14:20:10 +0000 (UTC)
Date: Fri, 18 Oct 2019 16:20:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 5/6] virtio: introduce a mdev based transport
Message-ID: <20191018162007.31631039.cohuck@redhat.com>
In-Reply-To: <20191017104836.32464-6-jasowang@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-6-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 18 Oct 2019 14:20:27 +0000 (UTC)
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

T24gVGh1LCAxNyBPY3QgMjAxOSAxODo0ODozNSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IG1kZXYgdHJh
bnNwb3J0IGZvciB2aXJ0aW8uIFRoaXMgaXMgdXNlZCB0bwo+IHVzZSBrZXJuZWwgdmlydGlvIGRy
aXZlciB0byBkcml2ZSB0aGUgbWVkaWF0ZWQgZGV2aWNlIHRoYXQgaXMgY2FwYWJsZQo+IG9mIHBv
cHVsYXRpbmcgdmlydHF1ZXVlIGRpcmVjdGx5Lgo+IAo+IEEgbmV3IHZpcnRpby1tZGV2IGRyaXZl
ciB3aWxsIGJlIHJlZ2lzdGVyZWQgdG8gdGhlIG1kZXYgYnVzLCB3aGVuIGEKPiBuZXcgdmlydGlv
LW1kZXYgZGV2aWNlIGlzIHByb2JlZCwgaXQgd2lsbCByZWdpc3RlciB0aGUgZGV2aWNlIHdpdGgK
PiBtZGV2IGJhc2VkIGNvbmZpZyBvcHMuIFRoaXMgbWVhbnMgaXQgaXMgYSBzb2Z0d2FyZSB0cmFu
c3BvcnQgYmV0d2Vlbgo+IG1kZXYgZHJpdmVyIGFuZCBtZGV2IGRldmljZS4gVGhlIHRyYW5zcG9y
dCB3YXMgaW1wbGVtZW50ZWQgdGhyb3VnaAo+IGRldmljZSBzcGVjaWZpYyBvcHMgd2hpY2ggaXMg
YSBwYXJ0IG9mIG1kZXZfcGFyZW50X29wcyBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aXJ0aW8vS2NvbmZp
ZyAgICAgICB8ICAgNyArCj4gIGRyaXZlcnMvdmlydGlvL01ha2VmaWxlICAgICAgfCAgIDEgKwo+
ICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWRldi5jIHwgNDA5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDE3IGluc2VydGlvbnMoKykKCigu
Li4pCgo+ICtzdGF0aWMgaW50IHZpcnRpb19tZGV2X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldikK
PiArewo+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbWRldl9mcm9tX2RldihkZXYpOwo+
ICsJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X2Rl
dl9vcHMobWRldik7Cj4gKwlzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlICp2bV9kZXY7Cj4gKwlp
bnQgcmM7Cj4gKwo+ICsJdm1fZGV2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCp2bV9kZXYp
LCBHRlBfS0VSTkVMKTsKPiArCWlmICghdm1fZGV2KQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsK
PiArCXZtX2Rldi0+dmRldi5kZXYucGFyZW50ID0gZGV2Owo+ICsJdm1fZGV2LT52ZGV2LmRldi5y
ZWxlYXNlID0gdmlydGlvX21kZXZfcmVsZWFzZV9kZXY7Cj4gKwl2bV9kZXYtPnZkZXYuY29uZmln
ID0gJnZpcnRpb19tZGV2X2NvbmZpZ19vcHM7Cj4gKwl2bV9kZXYtPm1kZXYgPSBtZGV2Owo+ICsJ
SU5JVF9MSVNUX0hFQUQoJnZtX2Rldi0+dmlydHF1ZXVlcyk7Cj4gKwlzcGluX2xvY2tfaW5pdCgm
dm1fZGV2LT5sb2NrKTsKPiArCj4gKwl2bV9kZXYtPnZlcnNpb24gPSBvcHMtPmdldF9tZGV2X2Zl
YXR1cmVzKG1kZXYpOwo+ICsJaWYgKHZtX2Rldi0+dmVyc2lvbiAhPSBWSVJUSU9fTURFVl9GX1ZF
UlNJT05fMSkgewo+ICsJCWRldl9lcnIoZGV2LCAiVklSVElPX01ERVZfRl9WRVJTSU9OXzEgaXMg
bWFuZGF0b3J5XG4iKTsKPiArCQlyZXR1cm4gLUVOWElPOwo+ICsJfQoKSG0sIHNvIGhvdyBpcyB0
aGF0IG1kZXYgZmVhdHVyZXMgaW50ZXJmYWNlIHN1cHBvc2VkIHRvIHdvcms/IElmClZJUlRJT19N
REVWX0ZfVkVSU0lPTl8xIGlzIGEgYml0LCBJIHdvdWxkIGV4cGVjdCB0aGlzIGNvZGUgdG8gdGVz
dCBmb3IKaXRzIHByZXNlbmNlLCBhbmQgbm90IGZvciBpZGVudGl0eS4KCldoYXQgd2lsbCBoYXBw
ZW4gaWYgd2UgY29tZSB1cCB3aXRoIGEgdmVyc2lvbiAyPyBJZiB0aGlzIGlzIGJhY2t3YXJkcwpj
b21wYXRpYmxlLCB3aWxsIGJvdGggdmVyc2lvbiAyIGFuZCB2ZXJzaW9uIDEgYmUgc2V0PwoKPiAr
Cj4gKwl2bV9kZXYtPnZkZXYuaWQuZGV2aWNlID0gb3BzLT5nZXRfZGV2aWNlX2lkKG1kZXYpOwo+
ICsJaWYgKHZtX2Rldi0+dmRldi5pZC5kZXZpY2UgPT0gMCkKPiArCQlyZXR1cm4gLUVOT0RFVjsK
PiArCj4gKwl2bV9kZXYtPnZkZXYuaWQudmVuZG9yID0gb3BzLT5nZXRfdmVuZG9yX2lkKG1kZXYp
Owo+ICsJcmMgPSByZWdpc3Rlcl92aXJ0aW9fZGV2aWNlKCZ2bV9kZXYtPnZkZXYpOwo+ICsJaWYg
KHJjKQo+ICsJCXB1dF9kZXZpY2UoZGV2KTsKPiArCWVsc2UKPiArCQlkZXZfc2V0X2RydmRhdGEo
ZGV2LCB2bV9kZXYpOwo+ICsKPiArCXJldHVybiByYzsKPiArfQoKKC4uLikKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
