Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD10DBE76
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 09:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7B36E13C;
	Fri, 18 Oct 2019 07:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38B46E13C;
 Fri, 18 Oct 2019 07:36:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 148FC3071D99;
 Fri, 18 Oct 2019 07:36:00 +0000 (UTC)
Received: from [10.72.12.183] (ovpn-12-183.pek2.redhat.com [10.72.12.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 249DB5D712;
 Fri, 18 Oct 2019 07:35:37 +0000 (UTC)
Subject: Re: [PATCH V4 4/6] mdev: introduce virtio device and its device ops
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
 <20191017104836.32464-5-jasowang@redhat.com>
 <20191017115329.47d4a165@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <24a96fca-926d-38ee-4dab-5f3715ef1433@redhat.com>
Date: Fri, 18 Oct 2019 15:35:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191017115329.47d4a165@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 18 Oct 2019 07:36:00 +0000 (UTC)
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
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMTgg5LiK5Y2IMTo1MywgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIFRo
dSwgMTcgT2N0IDIwMTkgMTg6NDg6MzQgKzA4MDAKPiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhh
dC5jb20+ICB3cm90ZToKPgo+PiBUaGlzIHBhdGNoIGltcGxlbWVudHMgYmFzaWMgc3VwcG9ydCBm
b3IgbWRldiBkcml2ZXIgdGhhdCBzdXBwb3J0cwo+PiB2aXJ0aW8gdHJhbnNwb3J0IGZvciBrZXJu
ZWwgdmlydGlvIGRyaXZlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2Fu
Z0ByZWRoYXQuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYyB8
ICAxMiArKysKPj4gICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICB8ICAgNCArCj4+ICAg
aW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5oICAgfCAxNTEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTY3IGluc2VydGlvbnMoKykKPj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC92aXJ0aW9fbWRldi5oCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYyBiL2RyaXZlcnMvdmZpby9t
ZGV2L21kZXZfY29yZS5jCj4+IGluZGV4IGQwZjMxMTNjODA3MS4uNTgzNGY2YjdjN2E1IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+PiArKysgYi9kcml2ZXJz
L3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+PiBAQCAtNTcsNiArNTcsMTggQEAgdm9pZCBtZGV2X3Nl
dF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4+ICAgfQo+PiAgIEVYUE9SVF9T
WU1CT0wobWRldl9zZXRfdmZpb19vcHMpOwo+PiAgIAo+PiArLyogU3BlY2lmeSB0aGUgdmlydGlv
IGRldmljZSBvcHMgZm9yIHRoZSBtZGV2IGRldmljZSwgdGhpcwo+PiArICogbXVzdCBiZSBjYWxs
ZWQgZHVyaW5nIGNyZWF0ZSgpIGNhbGxiYWNrIGZvciB2aXJ0aW8gbWRldiBkZXZpY2UuCj4+ICsg
Ki8KPj4gK3ZvaWQgbWRldl9zZXRfdmlydGlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYs
Cj4+ICsJCQkgY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKnZpcnRpb19vcHMp
Cj4+ICt7Cj4+ICsJQlVHX09OKG1kZXYtPmNsYXNzX2lkKTsKPiBOaXQsIHRoaXMgb25lIGlzIGEg
QlVHX09OLCBidXQgdGhlIHZmaW8gb25lIGlzIGEgV0FSTl9PTi4gIFRoYW5rcywKPgo+IEFsZXgK
CgpMZXQgbWUgZml4IGluIG5leHQgdmVyc2lvbi4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
