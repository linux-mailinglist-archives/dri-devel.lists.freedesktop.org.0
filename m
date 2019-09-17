Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA24B5446
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 19:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3B56ED18;
	Tue, 17 Sep 2019 17:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850656ED18;
 Tue, 17 Sep 2019 17:31:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 88C9E10C0932;
 Tue, 17 Sep 2019 17:31:34 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ABBC60852;
 Tue, 17 Sep 2019 17:31:26 +0000 (UTC)
Date: Tue, 17 Sep 2019 11:31:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Message-ID: <20190917113125.6b2970e5@x1.home>
In-Reply-To: <20190912094012.29653-1-jasowang@redhat.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Tue, 17 Sep 2019 17:31:35 +0000 (UTC)
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
Cc: sebott@linux.ibm.com, mst@redhat.com, airlied@linux.ie,
 heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
 oberpar@linux.ibm.com, kwankhede@nvidia.com, rob.miller@broadcom.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, cunming.liang@intel.com, zhi.a.wang@intel.com,
 farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, xiao.w.wang@intel.com, freude@linux.ibm.com,
 Parav Pandit <parav@mellanox.com>, rodrigo.vivi@intel.com,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 lingshan.zhu@intel.com, akrowiak@linux.ibm.com, tiwei.bie@intel.com,
 pmorel@linux.ibm.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, zhihong.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W2NjICtQYXJhdl0KCk9uIFRodSwgMTIgU2VwIDIwMTkgMTc6NDA6MTAgKzA4MDAKSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IEhpIGFsbDoKPiAKPiBEdXJpbmcgdGhl
IGRldmVsb3BtZW50IG9mIHZpcnRpby1tZGV2WzFdLiBJIGZpbmQgdGhhdCBtZGV2IG5lZWRzIHRv
IGJlCj4gZXh0ZW5kZWQgdG8gc3VwcG9ydCBkZXZpY2VzIG90aGVyIHRoYW4gdmZpbyBtZGV2IGRl
dmljZS4gU28gdGhpcwo+IHNlcmllcyB0cmllcyB0byBleHRlbmQgdGhlIG1kZXYgdG8gYmUgYWJs
ZSB0byBkaWZmZXIgZnJvbSBkaWZmZXJlbnQKPiBkZXZpY2VzIGJ5Ogo+IAo+IC0gZGV2aWNlIGlk
IGFuZCBtYXRjaGluZyBmb3IgbWRldiBidXMKPiAtIGRldmljZSBzcGVpY2ZpYyBjYWxsYmFja3Mg
YW5kIG1vdmUgdmZpbyBjYWxsYmFja3MgdGhlcmUKPiAKPiBTZW50IGZvciBlYXJseSByZWl2ZXcs
IGNvbXBpbGUgdGVzdCBvbmx5IQo+IAo+IFRoYW5rcwo+IAo+IFsxXSBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAxOS85LzEwLzEzNQoKSSBleHBlY3QgUGFyYXYgbXVzdCBoYXZlIHNvbWV0aGluZyBz
aW1pbGFyIGluIHRoZSB3b3JrcyBmb3IgdGhlaXIKaW4ta2VybmVsIG5ldHdvcmtpbmcgbWRldiBz
dXBwb3J0LiAgTGluayB0byBkaXNjdXNzaW9uIHNvIGZhcjoKCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2t2bS8yMDE5MDkxMjA5NDAxMi4yOTY1My0xLWphc293YW5nQHJlZGhhdC5jb20vVC8jdAoK
VGhhbmtzLApBbGV4CgoKPiBKYXNvbiBXYW5nICgyKToKPiAgIG1kZXY6IGRldmljZSBpZCBzdXBw
b3J0Cj4gICBtZGV2OiBpbnRyb2R1Y2UgZGV2aWNlIHNwZWNpZmljIG9wcwo+IAo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgfCAxNiArKysrLS0tCj4gIGRyaXZlcnMvczM5MC9j
aW8vdmZpb19jY3dfb3BzLmMgICB8IDE2ICsrKystLS0KPiAgZHJpdmVycy9zMzkwL2NyeXB0by92
ZmlvX2FwX29wcy5jIHwgMTMgKysrKy0tCj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5j
ICAgICB8IDE0ICsrKysrLQo+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAgfCAx
NCArKysrKysKPiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmggIHwgIDEgKwo+ICBk
cml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgfCAzNiArKysrKysrKysrLS0tLS0KPiAg
aW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgIHwgNzYgKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgfCAgNiAr
KysKPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAgICAgIHwgMTggKysrKystLS0KPiAg
c2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jICAgICAgICAgIHwgMTggKysrKystLS0KPiAgc2FtcGxl
cy92ZmlvLW1kZXYvbXR0eS5jICAgICAgICAgIHwgMTYgKysrKy0tLQo+ICAxMiBmaWxlcyBjaGFu
Z2VkLCAxNjMgaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
