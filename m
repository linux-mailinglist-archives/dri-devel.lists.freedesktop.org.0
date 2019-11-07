Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38895F335B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDB06F71F;
	Thu,  7 Nov 2019 15:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE05E6F70E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 15:35:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-TZdOIwyWM0aw-ZFtUujj9Q-1; Thu, 07 Nov 2019 10:35:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 000FF477;
 Thu,  7 Nov 2019 15:35:00 +0000 (UTC)
Received: from gondolin (ovpn-117-222.ams2.redhat.com [10.36.117.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCE1260BEC;
 Thu,  7 Nov 2019 15:34:51 +0000 (UTC)
Date: Thu, 7 Nov 2019 16:34:48 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V11 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191107163448.4d20b75b.cohuck@redhat.com>
In-Reply-To: <20191107151109.23261-7-jasowang@redhat.com>
References: <20191107151109.23261-1-jasowang@redhat.com>
 <20191107151109.23261-7-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TZdOIwyWM0aw-ZFtUujj9Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573140909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BzEyez2H23edMWUzeroDzzDUe6EbJTfa2zTwff9g92s=;
 b=iytoKoHykz8YhCd5O48nU5ObA9o3jLo8P15TM0U2VcVQPg/x6e7Hr5Qa3j4gO0uSqttAOY
 OgwLfTp0x5ODyLzDUyK9cBN58lQJI3x2Gl4CSaSsetY0I49gmlFVL4x9U2Ft2tcqirL7Kp
 vnva7uDFSHOsVxHnhV4DEiFhMMeqIfo=
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
 parav@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 alex.williamson@redhat.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAgNyBOb3YgMjAxOSAyMzoxMTowOSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZp
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
ZmlvLW1kZXYvbXZuZXRfbG9vcGJhY2suYyB8IDY4NyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDY5OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzYW1wbGVzL3ZmaW8tbWRldi9tdm5ldF9sb29wYmFjay5jCgpBY2tlZC1ieTogQ29y
bmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
