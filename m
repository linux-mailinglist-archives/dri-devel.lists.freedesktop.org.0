Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BFE10118A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 04:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B377E6E06E;
	Tue, 19 Nov 2019 03:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BD36E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 03:05:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-rUB0BZtSNwuf6b0UF2q_tQ-1; Mon, 18 Nov 2019 22:05:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9829A802680;
 Tue, 19 Nov 2019 03:05:22 +0000 (UTC)
Received: from [10.72.12.132] (ovpn-12-132.pek2.redhat.com [10.72.12.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F095828D3A;
 Tue, 19 Nov 2019 03:04:52 +0000 (UTC)
Subject: Re: [PATCH V13 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: Cornelia Huck <cohuck@redhat.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-7-jasowang@redhat.com>
 <20191118164510.549c097b.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8a4e504d-abb9-44f1-73ea-e337f596bf75@redhat.com>
Date: Tue, 19 Nov 2019 11:04:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191118164510.549c097b.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: rUB0BZtSNwuf6b0UF2q_tQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574132729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGZRPhYF1Y/dzL7KaRw06TGUBnCFB2IvLddTdnFImp8=;
 b=P2mHl9QueDhK4WsLIXtyBGju7tbXTlYuEJ2vJM28TH0Dav+oOgR5Mqqy1BwZG+eHNI9IX6
 B51Jl5kgMZh355vgbLC35TDTuMWN2y1RX9SrZKbzUe0EWkSB2U0QmPoE2PrnrHJF8RmdCY
 lXHZHwqT3U+qF77hKoJ2Ne3MxfpWQxs=
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
Cc: jakub.kicinski@netronome.com, christophe.de.dinechin@gmail.com,
 kvm@vger.kernel.org, mst@redhat.com, airlied@linux.ie,
 heiko.carstens@de.ibm.com, haotian.wang@sifive.com,
 dri-devel@lists.freedesktop.org, oberpar@linux.ibm.com, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, jgg@mellanox.com, jeffrey.t.kirsher@intel.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 parav@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 kevin.tian@intel.com, alex.williamson@redhat.com, xiao.w.wang@intel.com,
 freude@linux.ibm.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org, hch@infradead.org,
 akrowiak@linux.ibm.com, aadam@redhat.com, jiri@mellanox.com,
 tiwei.bie@intel.com, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 netdev@vger.kernel.org, lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvMTgg5LiL5Y2IMTE6NDUsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cj4gT24gTW9u
LCAxOCBOb3YgMjAxOSAxODo1OToyMyArMDgwMAo+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4gW05vdGU6IEkgaGF2ZSBub3QgbG9va2VkIGludG8gdGhlIHJld29y
a2VkIGFyY2hpdGVjdHVyZSBvZiB0aGlzICphdCBhbGwqCj4gc28gZmFyOyBqdXN0IHNvbWV0aGlu
ZyB0aGF0IEkgbm90ZWQuLi5dCj4KPj4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBk
ZXZpY2UgdGhhdCBzaW11bGF0ZSB2aXJ0aW8gbmV0IGRldmljZQo+PiBvdmVyIHZpcnRpbyBtZGV2
IHRyYW5zcG9ydC4gVGhlIGRldmljZSBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+PiBh
bmQgd29ya3F1ZXVlLiBBIGRldmljZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBI
VkEgaXMgdXNlZAo+PiBkaXJlY3RseSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmlj
aWVudCBmb3Iga2VybmVsIHZpcnRpbwo+PiBkcml2ZXIgdG8gd29yay4KPj4KPj4gT25seSAndmly
dGlvJyB0eXBlIGlzIHN1cHBvcnRlZCByaWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0
eXBlCj4+IG9uIHRvcCB3aGljaCByZXF1aXJlcyBzb21lIHZpcnR1YWwgSU9NTVUgaW1wbGVtZW50
ZWQgaW4gdGhpcyBzYW1wbGUKPj4gZHJpdmVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiAtLS0KPj4gICBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKPj4gICBzYW1wbGVzL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgIHwgIDEwICsKPj4gICBzYW1wbGVzL3ZmaW8tbWRldi9NYWtlZmlsZSAgICAgICAgIHwg
ICAxICsKPj4gICBzYW1wbGVzL3ZmaW8tbWRldi9tdm5ldF9sb29wYmFjay5jIHwgNjkwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCA3MDIgaW5zZXJ0
aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzYW1wbGVzL3ZmaW8tbWRldi9tdm5ldF9s
b29wYmFjay5jCj4+Cj4+ICtzdGF0aWMgc3RydWN0IG12bmV0X2RldiB7Cj4+ICsJc3RydWN0IGNs
YXNzCSp2ZF9jbGFzczsKPj4gKwlzdHJ1Y3QgaWRyCXZkX2lkcjsKPj4gKwlzdHJ1Y3QgZGV2aWNl
CWRldjsKPj4gK30gbXZuZXRfZGV2Owo+IFRoaXMgc3RydWN0dXJlIGVtYmVkcyBhIHN0cnVjdCBk
ZXZpY2UgKGEgcmVmZXJlbmNlLWNvdW50ZWQgc3RydWN0dXJlKSwKPiB5ZXQgaXQgaXMgYSBzdGF0
aWMgdmFyaWFibGUuIFRoaXMgaXMgZ2l2aW5nIGEgYmFkIGV4YW1wbGUgdG8gcG90ZW50aWFsCj4g
aW1wbGVtZW50ZXJzOyBqdXN0IGFsbG9jYXRlIGl0IGR5bmFtaWNhbGx5LgoKClllcywgYXMgc3Bv
dHRlZCBieSBHcmVnLgoKCj4KPj4gK3N0YXRpYyB2b2lkIG12bmV0X2RldmljZV9yZWxlYXNlKHN0
cnVjdCBkZXZpY2UgKmRldikKPj4gK3sKPj4gKwlkZXZfZGJnKGRldiwgIm12bmV0OiByZWxlYXNl
ZFxuIik7Cj4gQW5kIHRoYXQgYWxzbyBtZWFucyB5b3UgbmVlZCBhIHByb3BlciByZWxlYXNlIGZ1
bmN0aW9uIGhlcmUsIG9mCj4gY291cnNlLgoKClJpZ2h0LgoKVGhhbmtzCgoKPgo+PiArfQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
