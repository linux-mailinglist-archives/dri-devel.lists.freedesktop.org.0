Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A22B8C87
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 10:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38186E81C;
	Fri, 20 Sep 2019 08:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCB86E81C;
 Fri, 20 Sep 2019 08:22:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9CC0410DCC9D;
 Fri, 20 Sep 2019 08:22:11 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43D14101E67D;
 Fri, 20 Sep 2019 08:21:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
 tiwei.bie@intel.com
Subject: [RFC PATCH V2 0/6] mdev based hardware virtio offloading support
Date: Fri, 20 Sep 2019 16:20:44 +0800
Message-Id: <20190920082050.19352-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 20 Sep 2019 08:22:12 +0000 (UTC)
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
Cc: sebott@linux.ibm.com, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 heiko.carstens@de.ibm.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, cunming.liang@intel.com, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, zhihong.wang@intel.com,
 akrowiak@linux.ibm.com, pmorel@linux.ibm.com, netdev@vger.kernel.org,
 cohuck@redhat.com, oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsOgoKVGhlcmUgYXJlIGhhcmR3YXJlIHRoYXQgY2FuIGRvIHZpcnRpbyBkYXRhcGF0aCBv
ZmZsb2FkaW5nIHdoaWxlIGhhdmluZwppdHMgb3duIGNvbnRyb2wgcGF0aC4gVGhpcyBwYXRoIHRy
aWVzIHRvIGltcGxlbWVudCBhIG1kZXYgYmFzZWQKdW5pZmllZCBBUEkgdG8gc3VwcG9ydCB1c2lu
ZyBrZXJuZWwgdmlydGlvIGRyaXZlciB0byBkcml2ZSB0aG9zZQpkZXZpY2VzLiBUaGlzIGlzIGRv
bmUgYnkgaW50cm9kdWNpbmcgYSBuZXcgbWRldiB0cmFuc3BvcnQgZm9yIHZpcnRpbwoodmlydGlv
X21kZXYpIGFuZCByZWdpc3RlciBpdHNlbGYgYXMgYSBuZXcga2luZCBvZiBtZGV2IGRyaXZlci4g
VGhlbgppdCBwcm92aWRlcyBhIHVuaWZpZWQgd2F5IGZvciBrZXJuZWwgdmlydGlvIGRyaXZlciB0
byB0YWxrIHdpdGggbWRldgpkZXZpY2UgaW1wbGVtZW50YXRpb24uCgpUaG91Z2ggdGhlIHNlcmll
cyBvbmx5IGNvbnRhaW4ga2VybmVsIGRyaXZlciBzdXBwb3J0LCB0aGUgZ29hbCBpcyB0bwptYWtl
IHRoZSB0cmFuc3BvcnQgZ2VuZXJpYyBlbm91Z2ggdG8gc3VwcG9ydCB1c2Vyc3BhY2UgZHJpdmVy
cy4gVGhpcwptZWFucyB2aG9zdC1tZGV2WzFdIGNvdWxkIGJlIGJ1aWx0IG9uIHRvcCBhcyB3ZWxs
IGJ5IHJlc3VpbmcgdGhlCnRyYW5zcG9ydC4KCkEgc2FtcGxlIGRyaXZlciBpcyBhbHNvIGltcGxl
bWVudGVkIHdoaWNoIHNpbXVsYXRlIGEgdmlyaXRvLW5ldApsb29wYmFjayBldGhlcm5ldCBkZXZp
Y2Ugb24gdG9wIG9mIHZyaW5naCArIHdvcmtxdWV1ZS4gVGhpcyBjb3VsZCBiZQp1c2VkIGFzIGEg
cmVmZXJlbmNlIGltcGxlbWVudGF0aW9uIGZvciByZWFsIGhhcmR3YXJlIGRyaXZlci4KCkNvbnNp
ZGVyIG1kZXYgZnJhbWV3b3JrIG9ubHkgc3VwcG9ydCBWRklPIGRldmljZSBhbmQgZHJpdmVyIHJp
Z2h0IG5vdywKdGhpcyBzZXJpZXMgYWxzbyBleHRlbmQgaXQgdG8gc3VwcG9ydCBvdGhlciB0eXBl
cy4gVGhpcyBpcyBkb25lCnRocm91Z2ggaW50cm9kdWNpbmcgY2xhc3MgaWQgdG8gdGhlIGRldmlj
ZSBhbmQgcGFpcmluZyBpdCB3aXRoCmlkX3RhbGJlIGNsYWltZWQgYnkgdGhlIGRyaXZlci4gT24g
dG9wLCB0aGlzIHNlcmlzIGFsc28gZGVjb3VwbGUKZGV2aWNlIHNwZWNpZmljIHBhcmVudHMgb3Bz
IG91dCBvZiB0aGUgY29tbW9uIG9uZXMuCgpQa3RnZW4gdGVzdCB3YXMgZG9uZSB3aXRoIHZpcml0
by1uZXQgKyBtdm5ldCBsb29wIGJhY2sgZGV2aWNlLgoKUGxlYXNlIHJldmlldy4KCkNoYW5nZXMg
ZnJvbSBWMToKCi0gcmVuYW1lIGRldmljZSBpZCB0byBjbGFzcyBpZAotIGFkZCBkb2NzIGZvciBj
bGFzcyBpZCBhbmQgZGV2aWNlIHNwZWNpZmljIG9wcyAoZGV2aWNlX29wcykKLSBzcGxpdCBkZXZp
Y2Vfb3BzIGludG8gc2VwZXJhdGUgaGVhZGVycwotIGRyb3AgdGhlIG1kZXZfc2V0X2RtYV9vcHMo
KQotIHVzZSBkZXZpY2Vfb3BzIHRvIGltcGxlbWVudCB0aGUgdHJhbnNwb3J0IEFQSSwgdGhlbiBp
dCdzIG5vdCBhIHBhcnQKICBvZiBVQVBJIGFueSBtb3JlCi0gdXNlIEdGUF9BVE9NSUMgaW4gbXZu
ZXQgc2FtcGxlIGRldmljZSBhbmQgb3RoZXIgdHdlYWtzCi0gc2V0X3ZyaW5nX2Jhc2UvZ2V0X3Zy
aW5nX2Jhc2Ugc3VwcG9ydCBmb3IgbXZuZXQgZGV2aWNlCgpKYXNvbiBXYW5nICg2KToKICBtZGV2
OiBjbGFzcyBpZCBzdXBwb3J0CiAgbWRldjogaW50cm9kdWNlIGRldmljZSBzcGVjaWZpYyBvcHMK
ICBtZGV2OiBpbnRyb2R1Y2UgdmlydGlvIGRldmljZSBhbmQgaXRzIGRldmljZSBvcHMKICB2aXJ0
aW86IGludHJvdWRjZSBhIG1kZXYgYmFzZWQgdHJhbnNwb3J0CiAgdnJpbmdoOiBmaXggY29weSBk
aXJlY3Rpb24gb2YgdnJpbmdoX2lvdl9wdXNoX2tlcm4oKQogIGRvY3M6IFNhbXBsZSBkcml2ZXIg
dG8gZGVtb25zdHJhdGUgaG93IHRvIGltcGxlbWVudCB2aXJ0aW8tbWRldgogICAgZnJhbWV3b3Jr
CgogLi4uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0ICAgICAgIHwgIDExICst
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgICAgICAgfCAgMTcgKy0K
IGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICAgICAgICAgICAgICB8ICAxNyArLQog
ZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgIDE0ICstCiBk
cml2ZXJzL3ZmaW8vbWRldi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKwogZHJp
dmVycy92ZmlvL21kZXYvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZl
cnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICAgICAgICAgICAgICB8ICAyMSArLQogZHJpdmVy
cy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyAgICAgICAgICAgICAgIHwgIDE0ICsKIGRyaXZlcnMv
dmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3Zm
aW8vbWRldi92ZmlvX21kZXYuYyAgICAgICAgICAgICAgICAgfCAgMzcgKy0KIGRyaXZlcnMvdmZp
by9tZGV2L3ZpcnRpb19tZGV2LmMgICAgICAgICAgICAgICB8IDQxOCArKysrKysrKysrKwogZHJp
dmVycy92aG9zdC92cmluZ2guYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICstCiBpbmNs
dWRlL2xpbnV4L21kZXYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDYgKy0KIGluY2x1
ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmggICAgICAgICAgICAgICB8ICAgOCArCiBpbmNsdWRl
L2xpbnV4L3ZmaW9fbWRldi5oICAgICAgICAgICAgICAgICAgICAgfCAgNTAgKysKIGluY2x1ZGUv
bGludXgvdmlydGlvX21kZXYuaCAgICAgICAgICAgICAgICAgICB8IDE0MSArKysrCiBzYW1wbGVz
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKwogc2FtcGxlcy92
ZmlvLW1kZXYvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIHNhbXBsZXMvdmZp
by1tZGV2L21ib2Nocy5jICAgICAgICAgICAgICAgICAgICB8ICAxOSArLQogc2FtcGxlcy92Zmlv
LW1kZXYvbWRweS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDE5ICstCiBzYW1wbGVzL3ZmaW8t
bWRldi9tdHR5LmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTcgKy0KIHNhbXBsZXMvdmZpby1t
ZGV2L212bmV0LmMgICAgICAgICAgICAgICAgICAgICB8IDY4OCArKysrKysrKysrKysrKysrKysK
IDIyIGZpbGVzIGNoYW5nZWQsIDE0NzMgaW5zZXJ0aW9ucygrKSwgODkgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92ZmlvL21kZXYvdmlydGlvX21kZXYuYwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvdmZpb19tZGV2LmgKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzYW1wbGVz
L3ZmaW8tbWRldi9tdm5ldC5jCgotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
