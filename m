Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC41048D1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 04:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EED6EABA;
	Thu, 21 Nov 2019 03:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD0E6E15E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 03:06:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-O5df_XTcMm-7vCzmtRbKgA-1; Wed, 20 Nov 2019 22:06:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 395E5107ACC9;
 Thu, 21 Nov 2019 03:06:25 +0000 (UTC)
Received: from [10.72.12.204] (ovpn-12-204.pek2.redhat.com [10.72.12.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0D9F5D72A;
 Thu, 21 Nov 2019 03:05:23 +0000 (UTC)
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
 <20191118152642-mutt-send-email-mst@kernel.org>
 <20191118202843.GN3873@mellanox.com>
 <a09f528f-cfca-69cf-4728-91ff33c5caa7@redhat.com>
 <20191119123803.GA26739@mellanox.com>
 <d38abc98-b828-64cd-50cd-cb0d239e1696@redhat.com>
 <20191119141429.GF26739@mellanox.com>
 <3c3f8e30-bb75-3304-46b0-10a066ce1f42@redhat.com>
 <20191120134946.GD22466@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <60927f27-9a09-c14e-700b-d8570e9f390f@redhat.com>
Date: Thu, 21 Nov 2019 11:05:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191120134946.GD22466@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: O5df_XTcMm-7vCzmtRbKgA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574305591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQPO/m4Ap9MOJwd4GYZcK/rPheF1znZlCMXosHetsjc=;
 b=RFoQjlPzxb0eiHLlb1GYkyzfVznRn8COBMXY0B3c/I4uMhiJmAXND9CKlwbws9rLh3K8ke
 lafcjqga+zJMYjcodjGHCzMc/00Erp2Ds9ukW5vF1ctVdZEH0n2NsJjW/CiTykNtMAtLmi
 ZO+8F/pACKGwy9GVOabY9jaWYdJ1nY0=
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
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

Ck9uIDIwMTkvMTEvMjAg5LiL5Y2IOTo0OSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFdl
ZCwgTm92IDIwLCAyMDE5IGF0IDEwOjE0OjI2QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4K
Pj4+PiBJIGRvbid0IHF1aXRlIGdldCB0aGUgcXVlc3Rpb24gaGVyZS4KPj4+IEluIHRoZSBkcml2
ZXIgbW9kZWwgdGhlIGJ1c190eXBlIGFuZCBmb29fZGV2aWNlIGFyZSBjbG9zZWx5Cj4+PiBsaW5r
ZWQuCj4+IEkgZG9uJ3QgZ2V0IHRoZSBkZWZpbml0aW9uIG9mICJjbG9zZWx5IGxpbmtlZCIgaGVy
ZS4gRG8geW91IHRoaW5rIHRoZSBidXMKPj4gYW5kIGRldmljZSBpbXBsZW1lbnQgdmlydHVhbCBi
dXMgc2VyaWVzIGFyZSBjbG9zZWx5IGxpbmtlZD8gSWYgeWVzLCBob3cgZGlkCj4+IHRoZXkgYWNo
aWV2ZSB0aGF0Pwo+IEkgbWVhbiBpZiB5b3UgaGF2ZSBhICdmb29fZGV2aWNlJyB0aGVuIGl0IHNo
b3VsZCBiZSBvbiBhICdmb29fYnVzJyBhbmQKPiBub3Qgb24gc29tZSAnYmFyX2J1cycsIGFzIHRo
YXQgaXMgaG93IHRoZSBkcml2ZXIgY29yZSBnZW5lcmFsbHkgd29ya3MuCgoKSSBmdWxseSBhZ3Jl
ZSB3aXRoIHlvdSBoZXJlLiBCdXQgaXNuJ3QgdGhhdCBqdXN0IHdoYXQgdGhpcyBwYXRjaCBkaWQ/
IFdlIApoYWQgIm1kZXZfdmlydGlvIiBkZXZpY2Ugb24gIm1kZXZfdmlydGlvIiBidXMgbm90ICJt
ZGV2X3ZmaW8iIGJ1cy4KCgo+ICAgCj4+PiAgICBDcmVhdGluZyAnbWRldl9kZXZpY2UnIGluc3Rh
bmNlcyBhbmQgb3ZlcnJpZGluZyB0aGUgYnVzX3R5cGUKPj4+IGlzIGEgdmVyeSBhYnVzaXZlIHRo
aW5nIHRvIGRvLgo+PiBPaywgbWRldl9kZXZpY2UgKHdpdGhvdXQgdGhpcyBzZXJpZXMpIGhhZDoK
Pj4KPj4gc3RydWN0IG1kZXZfZGV2aWNlIHsKPj4gIMKgwqDCoCBzdHJ1Y3QgZGV2aWNlIGRldjsK
Pj4gIMKgwqDCoCBzdHJ1Y3QgbWRldl9wYXJlbnQgKnBhcmVudDsKPj4gIMKgwqDCoCBndWlkX3Qg
dXVpZDsKPj4gIMKgwqDCoCB2b2lkICpkcml2ZXJfZGF0YTsKPj4gIMKgwqDCoCBzdHJ1Y3QgbGlz
dF9oZWFkIG5leHQ7Cj4+ICDCoMKgwqAgc3RydWN0IGtvYmplY3QgKnR5cGVfa29iajsKPj4gIMKg
wqDCoCBzdHJ1Y3QgZGV2aWNlICppb21tdV9kZXZpY2U7Cj4+ICDCoMKgwqAgYm9vbCBhY3RpdmU7
Cj4+IH07Cj4+Cj4+IFNvIGl0J3Mgbm90aGluZyBidXMgb3IgVkZJTyBzcGVjaWZpYy4gQW5kIHdo
YXQgdmlydHVhbCBidXMgaGFkIGlzOgo+IFdoYXQgZG8gbWVhbj8gJ3N0cnVjdCBtZGV2X3BhcmVu
dCAqcGFyZW50JyBpcyB0aGUgVkZJTyBzcGVjaWZpYwo+IHN0dWZmLiBJIGhhdmVuJ3QgZmlndXJl
ZCBvdXQgd2hhdCB0aGUgY29uZnVzaW5nIG1kZXZfcGFyZW50IGlzCj4gc3VwcG9zZWQgdG8gYmUs
CgoKc3RydWN0IG1kZXZfcGFyZW50X29wcyB7CiDCoMKgwqAgc3RydWN0IG1vZHVsZcKgwqAgKm93
bmVyOwogwqDCoMKgIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKipkZXZfYXR0cl9ncm91
cHM7CiDCoMKgwqAgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqKm1kZXZfYXR0cl9ncm91
cHM7CiDCoMKgwqAgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqKnN1cHBvcnRlZF90eXBlX2dyb3Vw
czsKCiDCoMKgwqAgaW50wqDCoMKgwqAgKCpjcmVhdGUpKHN0cnVjdCBrb2JqZWN0ICprb2JqLCBz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwogwqDCoMKgIGludMKgwqDCoMKgICgqcmVtb3ZlKShz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwogwqDCoMKgIGludMKgwqDCoMKgICgqb3Blbikoc3Ry
dWN0IG1kZXZfZGV2aWNlICptZGV2KTsKIMKgwqDCoCB2b2lkwqDCoMKgICgqcmVsZWFzZSkoc3Ry
dWN0IG1kZXZfZGV2aWNlICptZGV2KTsKIMKgwqDCoCBzc2l6ZV90ICgqcmVhZCkoc3RydWN0IG1k
ZXZfZGV2aWNlICptZGV2LCBjaGFyIF9fdXNlciAqYnVmLAogwqDCoMKgIMKgwqDCoCDCoMKgwqAg
c2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpOwogwqDCoMKgIHNzaXplX3QgKCp3cml0ZSkoc3Ry
dWN0IG1kZXZfZGV2aWNlICptZGV2LCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAogwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcyk7CiDCoMKgwqAgbG9uZ8Kg
wqDCoCAoKmlvY3RsKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHVuc2lnbmVkIGludCBjbWQs
CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoHVuc2lnbmVkIGxvbmcgYXJnKTsKIMKgwqDCoCBpbnTC
oMKgwqAgKCptbWFwKShzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKTsKfTsKCllvdSBjYW4gc2VlIHRoYXQgbm90aGluZyBpcyByZWFsbHkgVkZJTyBz
cGVjaWZpYyBoZXJlLi4KCgo+IG9yIHdoaHkgdGhlIFZGSU8gb3BzIGFyZSBsaW5rZWQgdG8gdGhl
IHBhcmVudCBvciBub3QKPiB0aGUgZGV2aWNlLi4KCgpJIGd1ZXNzIHRoZSBhbnN3ZXIgdGhlIG1k
ZXZfZGV2aWNlcyBiZWxvbmdzIHRvIHRoZSBzYW1lIHBhcmVudCBhcmUgCmV4cGVjdGVkIHRvIGhh
dmUgc2FtZSBvcHMuCgoKPiBIb25lc3RseSB0aGUgd2hvbGUgbWRldiB0aGluZyBoYXMgYSB2ZXJ5
IHN0cmFuZ2UgdGFrZSBvbgo+IGhvdyB0byB1c2UgdGhlIGRyaXZlciBjb3JlLgoKClN1Z2dlc3Rp
b25zIGFyZSB3ZWxjb21lZC4KCgo+Cj4+PiBBYnVzaW5nIGl0IGZvciBvdGhlciB0aGluZ3MgaXMg
bm90IGFwcHJvcHJpYXRlLiBpZSBjcmVhdGluZyBhbgo+Pj4gaW5zdGFuY2UgYW5kIG5vdCBmaWxs
aW5nIGluIG1vc3Qgb2YgdGhlIHZmaW8gZm9jdXNlZCBvcHMgaXMgYW4gYWJ1c2l2ZQo+Pj4gdGhp
bmcgdG8gZG8uCj4+IFdlbGwsIGl0J3Mgb25seSBoYWxmIG9mIHRoZSBtZGV2X3BhcmVudF9vcHMg
aW4gbWRldl9wYXJlbnQsIHZhcmlvdXMgbWV0aG9kcwo+PiBjb3VsZCBiZSBkb25lIGRvIGJlIG1v
cmUgZ2VuZXJpYyB0byBhdm9pZCBkdXBsaWNhdGlvbiBvZiBjb2Rlcy4gTm8/Cj4gVGhlcmUgYXJl
IG1hbnkgd2F5cyB0byBhdm9pZCBkdXBsaWNhdGluZyBjb2RlLgo+Cj4gVGFraW5nIHNvbWV0aGlu
ZyB3ZWxsIGRlZmluZWQsIGFuZCBib2x0aW5nIG9uIHNvbWV0aGluZyB1bnJlbGF0ZWQganVzdAo+
IHRvIHNoYXJlIGEgYml0IG9mIGNvZGUgaXMgYSB2ZXJ5IHBvb3Igd2F5IHRvIGF2b2lkIGNvZGUg
ZHVwbGljYXRpb24uCgoKV2UgY2FuIGhhdmUgbWFrZSB0aGUgY29kZSBiZXR0ZXIuLi4KCgo+PiBJ
J20gc3VyZSB5b3Ugd2lsbCBuZWVkIHRvIGhhbmRsZSBvdGhlciBpc3N1ZXMgYmVzaWRlcyBHVUlE
IHdoaWNoIGhhZCBiZWVuCj4+IHNldHRsZWQgYnkgbWRldiBlLmcgSU9NTVUgYW5kIHR5cGVzIHdo
ZW4gc3RhcnRpbmcgdG8gd3JpdGUgYSByZWFsIGhhcmR3YXJlCj4+IGRyaXZlci4KPiBUaGUgaW9t
bXUgZnJhbWV3b3JrIGFscmVhZHkgaGFuZGxlcyB0aGF0LCB0aGUgbWRldiBzdHVmZiBjb250cmli
dXRlcwo+IHZlcnkgbGl0dGxlIGZyb20gd2hhdCBJIGNhbiBzZWUuCgoKWWVzLCBidXQgaWYgd2Ug
c3RhcnQgZnJvbSBiZWdpbm5pbmcgdG8gaW52ZW50IGEgbmV3IGluZnJhc3RydWN0dXJlIGFuZCAK
d2Ugc3RpbGwgbmVlZCBHVUlELCBJT01NVSwgdHlwZXMuIFNvIGl0IHdpbGwgYmUgdmVyeSBzaW1p
bGFyIHRvIG1kZXYgCmxvb2tzIHJpZ2h0IG5vdy4gU28gd2h5IG5vdCBpbXByb3ZlIG1kZXY/CgoK
Pgo+Pj4gTW9zdCBsaWtlbHksIGF0IGxlYXN0IGZvciB2aXJ0aW8tbmV0LCBldmVyeW9uZSBlbHNl
IHdpbGwgYmUgYWJsZSB0bwo+Pj4gdXNlIGRldmxpbmsgYXMgd2VsbCwgbWFraW5nIGl0IG11Y2gg
bGVzcyBjbGVhciBpZiB0aGF0IEdVSUQgbGlmZWN5Y2xlCj4+PiBzdHVmZiBpcyBhIGdvb2QgaWRl
YSBvciBub3QuCj4+IFRoaXMgYXNzdW1wdGlvbiBpcyB3cm9uZywgd2UgaGFyZCBhbHJlYWR5IGhh
ZCBhdCBsZWFzdCB0d28gY29uY3JldGUgZXhhbXBsZXMKPj4gb2YgdkRQQSBkZXZpY2UgdGhhdCBk
b2Vzbid0IHVzZSBkZXZsaW5rOgo+Pgo+PiAtIEludGVsIElGQyB3aGVyZSB2aXJ0aW8gaXMgZG9u
ZSBhdCBWRiBsZXZlbAo+PiAtIEFsaSBDbG91ZCBFQ1MgaW5zdGFuY2Ugd2hlcmUgdmlydGlvIGlz
IGRvbmUgYXQgUEYgbGV2ZWwKPiBBZ2FpbiwgeW91IGRvbid0IGV4cGxhaW4gd2h5IHRoZXkgY291
bGRuJ3QgdXNlIGRldmxpbmsuCgoKWWVzLCB0aGV5IGNvdWxkLCBidXQgb2YgY291cnNlIGZvciBt
YW55IHJlYXNvbnMgdGhleSB3b24ndCB1c2UgZGV2bGluay4gCk5vdCBvbmx5IGRldmxpbmssIGV2
ZW4gbmV0bGluayBpcyBub3QgdXNlZCBvciBpbXBsZW1lbnRlZCBpbiBhbGwgdHlwZSBvZiAKbmV0
d29yayBkZXZpY2VzLgoKCj4KPiBPciwgd2h5IGRvIHdlIG5lZWQgR1VJRCBsaWZlY3ljbGUgc3R1
ZmYgd2hlbiB0aGVzZSBQQ0kgZGV2aWNlcyBjYW4KPiBvbmx5IGNyZWF0ZSBhIHNpbmdsZSB2aXJ0
aW8gYW5kIGNhbiBqdXN0IGdvIGFoZWFkIGFuZCBkbyB0aGF0IGFzIHNvb24KPiBhcyB0aGV5IGFy
ZSBwcm9iZWQuCj4KPiBUaGUgR1VJRCBzdHVmZiB3YXMgaW52ZW50ZWQgZm9yIHNsaWNpbmcsIHdo
aWNoIHlvdSBzYXkgaXMgbm90Cj4gaGFwcGVuaW5nIGluIHRoZXNlIGNhc2VzLgoKCkkgdGhpbmsg
dGhhdCdzIGFsbCBhYm91dCBhIGNvbnNpc3RlbnQgbWFuYWdlbWVudCBpbnRlcmZhY2UsICJzbGlj
aW5nIGJ5IApvbmUiIGlzIHN0aWxsIGNvbXBhdGlibGUuCgpUaGFua3MKCgo+Cj4gSmFzb24KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
