Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B682D6DC4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 05:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532A86E5E1;
	Tue, 15 Oct 2019 03:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7746E16F;
 Tue, 15 Oct 2019 03:29:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C10D308624A;
 Tue, 15 Oct 2019 03:29:30 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76A635D6A9;
 Tue, 15 Oct 2019 03:29:09 +0000 (UTC)
Subject: Re: [PATCH V3 6/7] virtio: introduce a mdev based transport
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-7-jasowang@redhat.com>
 <20191014173942.GB5359@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cf8fa583-fb2c-67c3-15d1-64efa8d73121@redhat.com>
Date: Tue, 15 Oct 2019 11:29:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191014173942.GB5359@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 15 Oct 2019 03:29:30 +0000 (UTC)
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
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMTUg5LiK5Y2IMTozOSwgU3RlZmFuIEhham5vY3ppIHdyb3RlOgo+IE9uIEZy
aSwgT2N0IDExLCAyMDE5IGF0IDA0OjE1OjU2UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
ICtzdHJ1Y3QgdmlydGlvX21kZXZfZGV2aWNlIHsKPj4gKwlzdHJ1Y3QgdmlydGlvX2RldmljZSB2
ZGV2Owo+PiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldjsKPj4gKwl1bnNpZ25lZCBsb25nIHZl
cnNpb247Cj4+ICsKPj4gKwlzdHJ1Y3QgdmlydHF1ZXVlICoqdnFzOwo+PiArCS8qIFRoZSBsb2Nr
IHRvIHByb3RlY3QgdmlydHF1ZXVlIGxpc3QgKi8KPj4gKwlzcGlubG9ja190IGxvY2s7Cj4+ICsJ
c3RydWN0IGxpc3RfaGVhZCB2aXJ0cXVldWVzOwo+IElzIHRoaXMgYSBsaXN0IG9mIHN0cnVjdCB2
aXJ0aW9fbWRldl92cV9pbmZvPyAgUGxlYXNlIGRvY3VtZW50IHRoZQo+IGFjdHVhbCB0eXBlIGlu
IGEgY29tbWVudC4KCgpPay4KCgo+PiArc3RhdGljIGludCB2aXJ0aW9fbWRldl9maW5kX3Zxcyhz
dHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgbnZxcywKPj4gKwkJCQlzdHJ1Y3Qg
dmlydHF1ZXVlICp2cXNbXSwKPj4gKwkJCQl2cV9jYWxsYmFja190ICpjYWxsYmFja3NbXSwKPj4g
KwkJCQljb25zdCBjaGFyICogY29uc3QgbmFtZXNbXSwKPj4gKwkJCQljb25zdCBib29sICpjdHgs
Cj4+ICsJCQkJc3RydWN0IGlycV9hZmZpbml0eSAqZGVzYykKPj4gK3sKPj4gKwlzdHJ1Y3Qgdmly
dGlvX21kZXZfZGV2aWNlICp2bV9kZXYgPSB0b192aXJ0aW9fbWRldl9kZXZpY2UodmRldik7Cj4+
ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gdm1fZ2V0X21kZXYodmRldik7Cj4+ICsJY29u
c3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X2Rldl9vcHMo
bWRldik7Cj4+ICsJc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIGNiOwo+PiArCWludCBpLCBl
cnIsIHF1ZXVlX2lkeCA9IDA7Cj4+ICsKPj4gKwl2bV9kZXYtPnZxcyA9IGttYWxsb2NfYXJyYXko
cXVldWVfaWR4LCBzaXplb2YoKnZtX2Rldi0+dnFzKSwKPj4gKwkJCQkgICAgR0ZQX0tFUk5FTCk7
Cj4ga21hbGxvY19hcnJheSgwLCAuLi4pPyAgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIG52cXMgaW5z
dGVhZCBvZiBxdWV1ZV9pZHgKPiAoMCkuCj4KPiBXaGF0IGlzIHRoaXMgdGhlIHB1cnBvc2Ugb2Yg
dm1fZGV2LT52cXMgYW5kIGRvZXMgYW55dGhpbmcgZXZlciBhY2Nlc3MgaXQ/CgoKSXQncyB1c2Vs
ZXNzLCB3aWxsIHJlbW92ZSBpdC4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
