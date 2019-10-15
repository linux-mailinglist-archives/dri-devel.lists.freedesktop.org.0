Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BFDD7332
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 12:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F60A89D9B;
	Tue, 15 Oct 2019 10:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B581989D9B;
 Tue, 15 Oct 2019 10:27:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D882A882EF;
 Tue, 15 Oct 2019 10:27:22 +0000 (UTC)
Received: from gondolin (dhcp-192-233.str.redhat.com [10.33.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 888895DA8C;
 Tue, 15 Oct 2019 10:27:09 +0000 (UTC)
Date: Tue, 15 Oct 2019 12:27:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 2/7] mdev: bus uevent support
Message-ID: <20191015122707.1fd52240.cohuck@redhat.com>
In-Reply-To: <20191011081557.28302-3-jasowang@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-3-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 15 Oct 2019 10:27:23 +0000 (UTC)
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

T24gRnJpLCAxMSBPY3QgMjAxOSAxNjoxNTo1MiArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBhZGRzIGJ1cyB1ZXZlbnQgc3VwcG9ydCBm
b3IgbWRldiBidXMgaW4gb3JkZXIgdG8gYWxsb3cKPiBjb29wZXJhdGlvbiB3aXRoIHVzZXJzcGFj
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jIHwgOCArKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmZpby9tZGV2L21kZXZfZHJpdmVyLmMgYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5j
Cj4gaW5kZXggYjdjNDBjZTg2ZWUzLi4zMTlkODg2ZmZhZjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYwo+ICsrKyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZf
ZHJpdmVyLmMKPiBAQCAtODIsOSArODIsMTcgQEAgc3RhdGljIGludCBtZGV2X21hdGNoKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKPiAgCXJldHVybiAwOwo+
ICB9Cj4gIAo+ICtzdGF0aWMgaW50IG1kZXZfdWV2ZW50KHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGtvYmpfdWV2ZW50X2VudiAqZW52KQo+ICt7Cj4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYgPSB0b19tZGV2X2RldmljZShkZXYpOwo+ICsKPiArCXJldHVybiBhZGRfdWV2ZW50X3Zhcihl
bnYsICJNT0RBTElBUz1tZGV2OmMlMDJYIiwgbWRldi0+Y2xhc3NfaWQpOwo+ICt9Cj4gKwo+ICBz
dHJ1Y3QgYnVzX3R5cGUgbWRldl9idXNfdHlwZSA9IHsKPiAgCS5uYW1lCQk9ICJtZGV2IiwKPiAg
CS5tYXRjaAkJPSBtZGV2X21hdGNoLAo+ICsJLnVldmVudAkJPSBtZGV2X3VldmVudCwKPiAgCS5w
cm9iZQkJPSBtZGV2X3Byb2JlLAo+ICAJLnJlbW92ZQkJPSBtZGV2X3JlbW92ZSwKPiAgfTsKCkkn
ZCBtZXJnZSB0aGF0IGludG8gdGhlIHByZXZpb3VzIHBhdGNoLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
