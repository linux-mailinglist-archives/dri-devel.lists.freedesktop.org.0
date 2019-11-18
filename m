Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DAB100895
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 16:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7AB6E5A9;
	Mon, 18 Nov 2019 15:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B84C89B45
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 15:45:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-CUpLGAmmNbCKwd_ow3c15Q-1; Mon, 18 Nov 2019 10:45:40 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F31A8FBB57;
 Mon, 18 Nov 2019 15:45:34 +0000 (UTC)
Received: from gondolin (ovpn-117-194.ams2.redhat.com [10.36.117.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87D6B1CD;
 Mon, 18 Nov 2019 15:45:13 +0000 (UTC)
Date: Mon, 18 Nov 2019 16:45:10 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V13 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191118164510.549c097b.cohuck@redhat.com>
In-Reply-To: <20191118105923.7991-7-jasowang@redhat.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-7-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: CUpLGAmmNbCKwd_ow3c15Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574091944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQqXtzuR5gTdo1f2yUDL09SryFyi+NfHrzjVbuoXnyc=;
 b=emNWkQJINdk83N0FDDDgSJ2YpIc0QUahtGzmbTUDUE35hy04hW8Fmu43Epj7ty6UbCe4EK
 7SwevyZ13PCPt3m6etR7UCxe8oIMwD7Krood+CwF79ii6sWbUyiTIRD2j0ni8AwHwiHFqo
 wCGb4Nq0hnjcQ9lGoGHx9dR6mrgvQ8Q=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxOCBOb3YgMjAxOSAxODo1OToyMyArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCltOb3RlOiBJIGhhdmUgbm90IGxvb2tlZCBpbnRvIHRoZSByZXdv
cmtlZCBhcmNoaXRlY3R1cmUgb2YgdGhpcyAqYXQgYWxsKgpzbyBmYXI7IGp1c3Qgc29tZXRoaW5n
IHRoYXQgSSBub3RlZC4uLl0KCj4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZp
Y2UgdGhhdCBzaW11bGF0ZSB2aXJ0aW8gbmV0IGRldmljZQo+IG92ZXIgdmlydGlvIG1kZXYgdHJh
bnNwb3J0LiBUaGUgZGV2aWNlIGlzIGltcGxlbWVudGVkIHRocm91Z2ggdnJpbmdoCj4gYW5kIHdv
cmtxdWV1ZS4gQSBkZXZpY2Ugc3BlY2lmaWMgZG1hIG9wcyBpcyB0byBtYWtlIHN1cmUgSFZBIGlz
IHVzZWQKPiBkaXJlY3RseSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBm
b3Iga2VybmVsIHZpcnRpbwo+IGRyaXZlciB0byB3b3JrLgo+IAo+IE9ubHkgJ3ZpcnRpbycgdHlw
ZSBpcyBzdXBwb3J0ZWQgcmlnaHQgbm93LiBJIHBsYW4gdG8gYWRkICd2aG9zdCcgdHlwZQo+IG9u
IHRvcCB3aGljaCByZXF1aXJlcyBzb21lIHZpcnR1YWwgSU9NTVUgaW1wbGVtZW50ZWQgaW4gdGhp
cyBzYW1wbGUKPiBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gIHNhbXBsZXMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgMTAgKwo+
ICBzYW1wbGVzL3ZmaW8tbWRldi9NYWtlZmlsZSAgICAgICAgIHwgICAxICsKPiAgc2FtcGxlcy92
ZmlvLW1kZXYvbXZuZXRfbG9vcGJhY2suYyB8IDY5MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDcwMiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzYW1wbGVzL3ZmaW8tbWRldi9tdm5ldF9sb29wYmFjay5jCj4gCgo+ICtzdGF0aWMg
c3RydWN0IG12bmV0X2RldiB7Cj4gKwlzdHJ1Y3QgY2xhc3MJKnZkX2NsYXNzOwo+ICsJc3RydWN0
IGlkcgl2ZF9pZHI7Cj4gKwlzdHJ1Y3QgZGV2aWNlCWRldjsKPiArfSBtdm5ldF9kZXY7CgpUaGlz
IHN0cnVjdHVyZSBlbWJlZHMgYSBzdHJ1Y3QgZGV2aWNlIChhIHJlZmVyZW5jZS1jb3VudGVkIHN0
cnVjdHVyZSksCnlldCBpdCBpcyBhIHN0YXRpYyB2YXJpYWJsZS4gVGhpcyBpcyBnaXZpbmcgYSBi
YWQgZXhhbXBsZSB0byBwb3RlbnRpYWwKaW1wbGVtZW50ZXJzOyBqdXN0IGFsbG9jYXRlIGl0IGR5
bmFtaWNhbGx5LgoKPiArc3RhdGljIHZvaWQgbXZuZXRfZGV2aWNlX3JlbGVhc2Uoc3RydWN0IGRl
dmljZSAqZGV2KQo+ICt7Cj4gKwlkZXZfZGJnKGRldiwgIm12bmV0OiByZWxlYXNlZFxuIik7CgpB
bmQgdGhhdCBhbHNvIG1lYW5zIHlvdSBuZWVkIGEgcHJvcGVyIHJlbGVhc2UgZnVuY3Rpb24gaGVy
ZSwgb2YKY291cnNlLgoKPiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
