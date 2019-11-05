Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986DDEF3E8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 04:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D136E8DD;
	Tue,  5 Nov 2019 03:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FC16E8DD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 03:18:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-lTxSoeIcNKuLlLIrabzbhg-1; Mon, 04 Nov 2019 22:18:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B7DD1800D56;
 Tue,  5 Nov 2019 03:18:04 +0000 (UTC)
Received: from [10.72.12.252] (ovpn-12-252.pek2.redhat.com [10.72.12.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7792C60E1C;
 Tue,  5 Nov 2019 03:16:24 +0000 (UTC)
Subject: Re: [PATCH V7 1/6] mdev: class id support
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191104123952.17276-1-jasowang@redhat.com>
 <20191104123952.17276-2-jasowang@redhat.com>
 <20191104145002.4dfed0c4@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <faaa43d8-662e-9b1e-a25a-5f242341a974@redhat.com>
Date: Tue, 5 Nov 2019 11:16:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104145002.4dfed0c4@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: lTxSoeIcNKuLlLIrabzbhg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572923892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kWoXCWgC74qwKyM0/t+PNexMRUtw6/VHE8jdEP5dslk=;
 b=KDsXTxgbgoC9VEQIGtDVyoAx6PuVs3GPeaAa8SqI0MI1wHfNcGjyvQqaCEB886n/k7iZhO
 WHJqK1R0mQuVXljcQ9EJhJ3hlL7fURFUx2JdE2u4lkxbqXMTpQIqIH6qvTx1AUoluHh8a/
 UP+QDWuO/M+fQOOaHvz0BqiFpD1qvrM=
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

Ck9uIDIwMTkvMTEvNSDkuIrljYg1OjUwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gTW9u
LCAgNCBOb3YgMjAxOSAyMDozOTo0NyArMDgwMAo+IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0
LmNvbT4gIHdyb3RlOgo+Cj4+IE1kZXYgYnVzIG9ubHkgc3VwcG9ydHMgdmZpbyBkcml2ZXIgcmln
aHQgbm93LCBzbyBpdCBkb2Vzbid0IGltcGxlbWVudAo+PiBtYXRjaCBtZXRob2QuIEJ1dCBpbiB0
aGUgZnV0dXJlLCB3ZSBtYXkgYWRkIGRyaXZlcnMgb3RoZXIgdGhhbiB2ZmlvLAo+PiB0aGUgZmly
c3QgZHJpdmVyIGNvdWxkIGJlIHZpcnRpby1tZGV2LiBUaGlzIG1lYW5zIHdlIG5lZWQgdG8gYWRk
Cj4+IGRldmljZSBjbGFzcyBpZCBzdXBwb3J0IGluIGJ1cyBtYXRjaCBtZXRob2QgdG8gcGFpciB0
aGUgbWRldiBkZXZpY2UKPj4gYW5kIG1kZXYgZHJpdmVyIGNvcnJlY3RseS4KPj4KPj4gU28gdGhp
cyBwYXRjaCBhZGRzIGlkX3RhYmxlIHRvIG1kZXZfZHJpdmVyIGFuZCBjbGFzc19pZCBmb3IgbWRl
dgo+PiBkZXZpY2Ugd2l0aCB0aGUgbWF0Y2ggbWV0aG9kIGZvciBtZGV2IGJ1cy4KPj4KPj4gUmV2
aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdDxwYXJhdkBtZWxsYW5veC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgLi4uL2RyaXZl
ci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0ICAgICAgIHwgIDUgKysrKwo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICAgICAgICAgICB8ICAxICsKPj4gICBkcml2
ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jICAgICAgICAgICAgICAgfCAgMSArCj4+ICAgZHJp
dmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgIDEgKwo+PiAgIGRy
aXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysr
KysrKwo+PiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMgICAgICAgICAgICAgICB8
IDI1ICsrKysrKysrKysrKysrKysrKysKPj4gICBkcml2ZXJzL3ZmaW8vbWRldi9tZGV2X3ByaXZh
dGUuaCAgICAgICAgICAgICAgfCAgMSArCj4+ICAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2
LmMgICAgICAgICAgICAgICAgIHwgIDYgKysrKysKPj4gICBpbmNsdWRlL2xpbnV4L21kZXYuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysKPj4gICBpbmNsdWRlL2xpbnV4L21v
ZF9kZXZpY2V0YWJsZS5oICAgICAgICAgICAgICAgfCAgOCArKysrKysKPj4gICBzYW1wbGVzL3Zm
aW8tbWRldi9tYm9jaHMuYyAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+ICAgc2FtcGxlcy92
ZmlvLW1kZXYvbWRweS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+PiAgIHNhbXBsZXMv
dmZpby1tZGV2L210dHkuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPj4gICAxMyBmaWxl
cyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0IGIvRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+PiBpbmRleCAyNWViN2Q1YjgzNGIu
LjY3MDk0MTNiZWUyOSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3Zm
aW8tbWVkaWF0ZWQtZGV2aWNlLnJzdAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
dmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4+IEBAIC0xMDIsMTIgKzEwMiwxNCBAQCBzdHJ1Y3R1
cmUgdG8gcmVwcmVzZW50IGEgbWVkaWF0ZWQgZGV2aWNlJ3MgZHJpdmVyOjoKPj4gICAgICAgICAq
IEBwcm9iZTogY2FsbGVkIHdoZW4gbmV3IGRldmljZSBjcmVhdGVkCj4+ICAgICAgICAgKiBAcmVt
b3ZlOiBjYWxsZWQgd2hlbiBkZXZpY2UgcmVtb3ZlZAo+PiAgICAgICAgICogQGRyaXZlcjogZGV2
aWNlIGRyaXZlciBzdHJ1Y3R1cmUKPj4gKyAgICAgICogQGlkX3RhYmxlOiB0aGUgaWRzIHNlcnZp
Y2VkIGJ5IHRoaXMgZHJpdmVyCj4+ICAgICAgICAgKi8KPj4gICAgICAgIHN0cnVjdCBtZGV2X2Ry
aXZlciB7Cj4+ICAgCSAgICAgY29uc3QgY2hhciAqbmFtZTsKPj4gICAJICAgICBpbnQgICgqcHJv
YmUpICAoc3RydWN0IGRldmljZSAqZGV2KTsKPj4gICAJICAgICB2b2lkICgqcmVtb3ZlKSAoc3Ry
dWN0IGRldmljZSAqZGV2KTsKPj4gICAJICAgICBzdHJ1Y3QgZGV2aWNlX2RyaXZlciAgICBkcml2
ZXI7Cj4+ICsJICAgICBjb25zdCBzdHJ1Y3QgbWRldl9jbGFzc19pZCAqaWRfdGFibGU7Cj4+ICAg
ICAgICB9Owo+PiAgIAo+PiAgIEEgbWVkaWF0ZWQgYnVzIGRyaXZlciBmb3IgbWRldiBzaG91bGQg
dXNlIHRoaXMgc3RydWN0dXJlIGluIHRoZSBmdW5jdGlvbiBjYWxscwo+PiBAQCAtMTcwLDYgKzE3
Miw5IEBAIHRoYXQgYSBkcml2ZXIgc2hvdWxkIHVzZSB0byB1bnJlZ2lzdGVyIGl0c2VsZiB3aXRo
IHRoZSBtZGV2IGNvcmUgZHJpdmVyOjoKPj4gICAKPj4gICAJZXh0ZXJuIHZvaWQgbWRldl91bnJl
Z2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+PiAgIAo+PiArSXQgaXMgYWxzbyBy
ZXF1aXJlZCB0byBzcGVjaWZ5IHRoZSBjbGFzc19pZCBpbiBjcmVhdGUoKSBjYWxsYmFjayB0aHJv
dWdoOjoKPj4gKwo+PiArCWludCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYsIHUxNiBpZCk7Cj4+ICAgCj4+ICAgTWVkaWF0ZWQgRGV2aWNlIE1hbmFnZW1lbnQgSW50ZXJm
YWNlIFRocm91Z2ggc3lzZnMKPj4gICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2t2bWd0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwo+PiBpbmRleCAzNDNk
NzljMWNiN2UuLjY0MjBmMGRiZDMxYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2t2bWd0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMK
Pj4gQEAgLTY3OCw2ICs2NzgsNyBAQCBzdGF0aWMgaW50IGludGVsX3ZncHVfY3JlYXRlKHN0cnVj
dCBrb2JqZWN0ICprb2JqLCBzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpCj4+ICAgCQkgICAgIGRl
dl9uYW1lKG1kZXZfZGV2KG1kZXYpKSk7Cj4+ICAgCXJldCA9IDA7Cj4+ICAgCj4+ICsJbWRldl9z
ZXRfY2xhc3MobWRldiwgTURFVl9DTEFTU19JRF9WRklPKTsKPj4gICBvdXQ6Cj4+ICAgCXJldHVy
biByZXQ7Cj4+ICAgfQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19v
cHMuYyBiL2RyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMKPj4gaW5kZXggZjBkNzFhYjc3
YzUwLi5jZjJjMDEzYWUzMmYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvczM5MC9jaW8vdmZpb19j
Y3dfb3BzLmMKPj4gKysrIGIvZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19vcHMuYwo+PiBAQCAt
MTI5LDYgKzEyOSw3IEBAIHN0YXRpYyBpbnQgdmZpb19jY3dfbWRldl9jcmVhdGUoc3RydWN0IGtv
YmplY3QgKmtvYmosIHN0cnVjdCBtZGV2X2RldmljZSAqbWRldikKPj4gICAJCQkgICBwcml2YXRl
LT5zY2gtPnNjaGlkLnNzaWQsCj4+ICAgCQkJICAgcHJpdmF0ZS0+c2NoLT5zY2hpZC5zY2hfbm8p
Owo+PiAgIAo+PiArCW1kZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZfQ0xBU1NfSURfVkZJTyk7Cj4+
ICAgCXJldHVybiAwOwo+PiAgIH0KPj4gICAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC9j
cnlwdG8vdmZpb19hcF9vcHMuYyBiL2RyaXZlcnMvczM5MC9jcnlwdG8vdmZpb19hcF9vcHMuYwo+
PiBpbmRleCA1YzBmNTNjNmRkZTcuLjA3YzMxMDcwYWZlYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jCj4+ICsrKyBiL2RyaXZlcnMvczM5MC9jcnlwdG8v
dmZpb19hcF9vcHMuYwo+PiBAQCAtMzQzLDYgKzM0Myw3IEBAIHN0YXRpYyBpbnQgdmZpb19hcF9t
ZGV2X2NyZWF0ZShzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
KQo+PiAgIAlsaXN0X2FkZCgmbWF0cml4X21kZXYtPm5vZGUsICZtYXRyaXhfZGV2LT5tZGV2X2xp
c3QpOwo+PiAgIAltdXRleF91bmxvY2soJm1hdHJpeF9kZXYtPmxvY2spOwo+PiAgIAo+PiArCW1k
ZXZfc2V0X2NsYXNzKG1kZXYsIE1ERVZfQ0xBU1NfSURfVkZJTyk7Cj4+ICAgCXJldHVybiAwOwo+
PiAgIH0KPj4gICAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5j
IGIvZHJpdmVycy92ZmlvL21kZXYvbWRldl9jb3JlLmMKPj4gaW5kZXggYjU1OGQ0Y2ZkMDgyLi5k
MjNjYTM5ZTNiZTYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5j
Cj4+ICsrKyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jCj4+IEBAIC00NSw2ICs0NSwx
NiBAQCB2b2lkIG1kZXZfc2V0X2RydmRhdGEoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB2b2lk
ICpkYXRhKQo+PiAgIH0KPj4gICBFWFBPUlRfU1lNQk9MKG1kZXZfc2V0X2RydmRhdGEpOwo+PiAg
IAo+PiArLyogU3BlY2lmeSB0aGUgY2xhc3MgZm9yIHRoZSBtZGV2IGRldmljZSwgdGhpcyBtdXN0
IGJlIGNhbGxlZCBkdXJpbmcKPj4gKyAqIGNyZWF0ZSgpIGNhbGxiYWNrLgo+PiArICovCj4gU3Rh
bmRhcmQgbm9uLW5ldHdvcmtpbmcgbXVsdGktbGluZSBjb21tZW50IHN0eWxlIHBsZWFzZSwgaWUu
Cj4KPiAvKgo+ICAgKiBNdWx0aS0KPiAgICogbGluZQo+ICAgKiBjb21tZW50Cj4gICAqLwo+Cj4g
VGhhbmtzLAo+IEFsZXgKPgoKV2lsbCBmaXguCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
