Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E03101164
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 03:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C926D6E86E;
	Tue, 19 Nov 2019 02:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D435B6E86C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 02:40:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-TGeSw6mcOLCpsluhFSyNGg-1; Mon, 18 Nov 2019 21:40:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8183188354C;
 Tue, 19 Nov 2019 02:40:41 +0000 (UTC)
Received: from [10.72.12.132] (ovpn-12-132.pek2.redhat.com [10.72.12.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4964946469;
 Tue, 19 Nov 2019 02:40:08 +0000 (UTC)
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f20d69d7-d621-b309-4a7d-1ba0ff22ee09@redhat.com>
Date: Tue, 19 Nov 2019 10:40:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191118134056.GJ3873@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: TGeSw6mcOLCpsluhFSyNGg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574131250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4bIEI9OIMY9XtqmKXYZqIX2w+FaQsPYyofdz3oJ1dk=;
 b=LcF4VZp0Y4UVnaButL9gJCx/dgQtxxFR5+Ih0LB513qMUJhFdrHpOs8l8XzpoBFsas/Aiz
 GqtQxR4NQPup6BzD45zUyUWKlzCDaRns8btyAXXORZVJhNSCPcVAoFlrLnV4gpiFRLbFiG
 Qj6L9jxNTnTNBb5TTFc4XfS2WhiF6IA=
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvMTgg5LiL5Y2IOTo0MSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIE1v
biwgTm92IDE4LCAyMDE5IGF0IDA2OjU5OjIxUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
ICtzdHJ1Y3QgYnVzX3R5cGUgbWRldl92aXJ0aW9fYnVzX3R5cGU7Cj4+ICsKPj4gK3N0cnVjdCBt
ZGV2X3ZpcnRpb19kZXZpY2Ugewo+PiArCXN0cnVjdCBtZGV2X2RldmljZSBtZGV2Owo+PiArCWNv
bnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19vcHMgKm9wczsKPj4gKwl1MTYgY2xhc3NfaWQ7Cj4+ICt9
Owo+IFRoaXMgc2VlbXMgdG8gc2hhcmUgbm90aGluZyB3aXRoIG1kZXYgKGllIG1kZXYtdmZpbyks
IHdoeSBpcyBpdCBvbiB0aGUKPiBzYW1lIGJ1cz8KPgo+IFdlIHdlbnQgb3ZlciB0aGlzIHJlY2Vu
dGx5IHdpdGggR3JlZyBhbmQgaGUgc2VlbWVkIHByZXR0eSBjbGVhciBvbgo+IHRoaXMuLgoKCk1k
ZXYtdmZpbyBpcyBub3Qgb24gdGhpcyBidXMuIFRoZSBjbGFzc19pZCBoZXJlIGlzIHVzZWQgZm9y
IGRpc3Rpbmd1aXNoIAp1c2Vyc3BhY2UgdmlydGlvIGRyaXZlciAodmhvc3QtbWRldikgYW5kIGtl
cm5lbCB2aXJ0aW8gZHJpdmVyICh2aXJ0aW8tbWRldikuCgpQYXJlbnQgY2FuIGNob29zZSB0byBj
cmVhdGUgYSB0eXBlIG9mICJ2aG9zdCIgZGV2aWNlIHRoZW4gdmhvc3QtbWRldiAKZHJpdmVyIGlz
IG1hdGNoZWQsIG9yICJ2aXJ0aW8iIGRldmljZSB0aGVuIHZpcnRpby1tZGV2IGRyaXZlciBpcyBt
YXRjaGVkLgoKCj4KPj4gK3N0cnVjdCBtZGV2X3ZpcnRpb19vcHMgewo+PiArCS8qIFZpcnRxdWV1
ZSBvcHMgKi8KPj4gKwlpbnQgKCpzZXRfdnFfYWRkcmVzcykoc3RydWN0IG1kZXZfZGV2aWNlICpt
ZGV2LAo+PiArCQkJICAgICAgdTE2IGlkeCwgdTY0IGRlc2NfYXJlYSwgdTY0IGRyaXZlcl9hcmVh
LAo+PiArCQkJICAgICAgdTY0IGRldmljZV9hcmVhKTsKPj4gKwl2b2lkICgqc2V0X3ZxX251bSko
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4LCB1MzIgbnVtKTsKPj4gKwl2b2lkICgq
a2lja192cSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4KTsKPj4gKwl2b2lkICgq
c2V0X3ZxX2NiKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZHgsCj4+ICsJCQkgIHN0
cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFjayAqY2IpOwo+PiArCXZvaWQgKCpzZXRfdnFfcmVhZHkp
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCwgYm9vbCByZWFkeSk7Cj4+ICsJYm9v
bCAoKmdldF92cV9yZWFkeSkoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCB1MTYgaWR4KTsKPj4g
KwlpbnQgKCpzZXRfdnFfc3RhdGUpKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IGlkeCwg
dTY0IHN0YXRlKTsKPj4gKwl1NjQgKCpnZXRfdnFfc3RhdGUpKHN0cnVjdCBtZGV2X2RldmljZSAq
bWRldiwgdTE2IGlkeCk7Cj4+ICsKPj4gKwkvKiBEZXZpY2Ugb3BzICovCj4+ICsJdTE2ICgqZ2V0
X3ZxX2FsaWduKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+PiArCXU2NCAoKmdldF9mZWF0
dXJlcykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KTsKPj4gKwlpbnQgKCpzZXRfZmVhdHVyZXMp
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTY0IGZlYXR1cmVzKTsKPj4gKwl2b2lkICgqc2V0
X2NvbmZpZ19jYikoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LAo+PiArCQkJICAgICAgc3RydWN0
IHZpcnRpb19tZGV2X2NhbGxiYWNrICpjYik7Cj4+ICsJdTE2ICgqZ2V0X3ZxX251bV9tYXgpKHN0
cnVjdCBtZGV2X2RldmljZSAqbWRldik7Cj4+ICsJdTMyICgqZ2V0X2RldmljZV9pZCkoc3RydWN0
IG1kZXZfZGV2aWNlICptZGV2KTsKPj4gKwl1MzIgKCpnZXRfdmVuZG9yX2lkKShzdHJ1Y3QgbWRl
dl9kZXZpY2UgKm1kZXYpOwo+PiArCXU4ICgqZ2V0X3N0YXR1cykoc3RydWN0IG1kZXZfZGV2aWNl
ICptZGV2KTsKPj4gKwl2b2lkICgqc2V0X3N0YXR1cykoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
LCB1OCBzdGF0dXMpOwo+PiArCXZvaWQgKCpnZXRfY29uZmlnKShzdHJ1Y3QgbWRldl9kZXZpY2Ug
Km1kZXYsIHVuc2lnbmVkIGludCBvZmZzZXQsCj4+ICsJCQkgICB2b2lkICpidWYsIHVuc2lnbmVk
IGludCBsZW4pOwo+PiArCXZvaWQgKCpzZXRfY29uZmlnKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYsIHVuc2lnbmVkIGludCBvZmZzZXQsCj4+ICsJCQkgICBjb25zdCB2b2lkICpidWYsIHVuc2ln
bmVkIGludCBsZW4pOwo+PiArCXUzMiAoKmdldF9nZW5lcmF0aW9uKShzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYpOwo+PiArfTsKPiBXaHkgYXJlbid0IGFsbCBvZiB0aGVzZSAnc3RydWN0IG1kZXZf
ZGV2aWNlX3ZpcnRpbyAqJyA/Cj4KPiBKYXNvbgoKCkl0IGNhbiBzaW1wbGlmeSB0aGUgYXNzaWdu
bWVudCBvZiB0aG9zZSBvcHMgaW4gbWRldiBkZXZpY2UgaW1wbGVtZW50YXRpb24uCgpUaGFua3MK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
