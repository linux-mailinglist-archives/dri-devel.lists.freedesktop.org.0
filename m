Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E3103178
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 03:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419FA6E3F0;
	Wed, 20 Nov 2019 02:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743E16E9AD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 02:17:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-GWr3DZc4NcGn1c519_Le9w-1; Tue, 19 Nov 2019 21:16:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 317FA800686;
 Wed, 20 Nov 2019 02:16:53 +0000 (UTC)
Received: from [10.72.12.82] (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BE5151C41;
 Wed, 20 Nov 2019 02:14:31 +0000 (UTC)
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
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3c3f8e30-bb75-3304-46b0-10a066ce1f42@redhat.com>
Date: Wed, 20 Nov 2019 10:14:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191119141429.GF26739@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: GWr3DZc4NcGn1c519_Le9w-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574216219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6N7O5gzugUyB0PYRZBH0eKX7ZSutWYqfBx0jxHvwXdo=;
 b=XDIsH4qKk3fLdElqRHAz7M0QZhESFvT0R+N0Ep8xc6aLXe+EzrVt7EbZVo715kI+EwODPp
 WBh4lTKPwZ0NFLG6SDTE/DI1jjtdl5W1xfB1+KJLha8stvhlw+kA64DuzO6m9VxZY7oaYR
 wCtriTuQcCWWcL6b4ndDLTNMASQfztA=
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

Ck9uIDIwMTkvMTEvMTkg5LiL5Y2IMTA6MTQsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBU
dWUsIE5vdiAxOSwgMjAxOSBhdCAxMDowMjowOFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDE5LzExLzE5IOS4i+WNiDg6MzgsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+IE9u
IFR1ZSwgTm92IDE5LCAyMDE5IGF0IDEwOjQxOjMxQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+Pj4gT24gMjAxOS8xMS8xOSDkuIrljYg0OjI4LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+
Pj4+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAzOjI3OjEzUE0gLTA1MDAsIE1pY2hhZWwgUy4g
VHNpcmtpbiB3cm90ZToKPj4+Pj4+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAxOjQxOjAwUE0g
KzAwMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+Pj4+PiBPbiBNb24sIE5vdiAxOCwgMjAx
OSBhdCAwNjo1OToyMVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4+PiArc3RydWN0
IGJ1c190eXBlIG1kZXZfdmlydGlvX2J1c190eXBlOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICtzdHJ1
Y3QgbWRldl92aXJ0aW9fZGV2aWNlIHsKPj4+Pj4+Pj4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgbWRl
djsKPj4+Pj4+Pj4gKwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fb3BzICpvcHM7Cj4+Pj4+Pj4+
ICsJdTE2IGNsYXNzX2lkOwo+Pj4+Pj4+PiArfTsKPj4+Pj4+PiBUaGlzIHNlZW1zIHRvIHNoYXJl
IG5vdGhpbmcgd2l0aCBtZGV2IChpZSBtZGV2LXZmaW8pLCB3aHkgaXMgaXQgb24gdGhlCj4+Pj4+
Pj4gc2FtZSBidXM/Cj4+Pj4+PiBJIG11c3QgYmUgbWlzc2luZyBzb21ldGhpbmcgLSB3aGljaCBi
dXMgZG8gdGhleSBzaGFyZT8KPj4+Pj4gbWRldl9idXNfdHlwZSA/Cj4+Pj4+Cj4+Pj4+IEphc29u
Cj4+Pj4gTm90ZTogdmlydGlvIGhhcyBpdHMgb3duIGJ1czogbWRldl92aXJ0aW9fYnVzX3R5cGUu
IFNvIHRoZXkgYXJlIG5vdCB0aGUgc2FtZQo+Pj4+IGJ1cy4KPj4+IFRoYXQgaXMgZXZlbiB3b3Jz
ZSwgd2h5IGludm9sdmUgc3RydWN0IG1kZXZfZGV2aWNlIGF0IGFsbCB0aGVuPwo+Pj4KPj4+IEph
c29uCj4+Cj4+IEkgZG9uJ3QgcXVpdGUgZ2V0IHRoZSBxdWVzdGlvbiBoZXJlLgo+IEluIHRoZSBk
cml2ZXIgbW9kZWwgdGhlIGJ1c190eXBlIGFuZCBmb29fZGV2aWNlIGFyZSBjbG9zZWx5Cj4gbGlu
a2VkLgoKCkkgZG9uJ3QgZ2V0IHRoZSBkZWZpbml0aW9uIG9mICJjbG9zZWx5IGxpbmtlZCIgaGVy
ZS4gRG8geW91IHRoaW5rIHRoZSAKYnVzIGFuZCBkZXZpY2UgaW1wbGVtZW50IHZpcnR1YWwgYnVz
IHNlcmllcyBhcmUgY2xvc2VseSBsaW5rZWQ/IElmIHllcywgCmhvdyBkaWQgdGhleSBhY2hpZXZl
IHRoYXQ/CgoKPiAgIENyZWF0aW5nICdtZGV2X2RldmljZScgaW5zdGFuY2VzIGFuZCBvdmVycmlk
aW5nIHRoZSBidXNfdHlwZQo+IGlzIGEgdmVyeSBhYnVzaXZlIHRoaW5nIHRvIGRvLgoKCk9rLCBt
ZGV2X2RldmljZSAod2l0aG91dCB0aGlzIHNlcmllcykgaGFkOgoKc3RydWN0IG1kZXZfZGV2aWNl
IHsKIMKgwqDCoCBzdHJ1Y3QgZGV2aWNlIGRldjsKIMKgwqDCoCBzdHJ1Y3QgbWRldl9wYXJlbnQg
KnBhcmVudDsKIMKgwqDCoCBndWlkX3QgdXVpZDsKIMKgwqDCoCB2b2lkICpkcml2ZXJfZGF0YTsK
IMKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIG5leHQ7CiDCoMKgwqAgc3RydWN0IGtvYmplY3QgKnR5
cGVfa29iajsKIMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICppb21tdV9kZXZpY2U7CiDCoMKgwqAgYm9v
bCBhY3RpdmU7Cn07CgpTbyBpdCdzIG5vdGhpbmcgYnVzIG9yIFZGSU8gc3BlY2lmaWMuIEFuZCB3
aGF0IHZpcnR1YWwgYnVzIGhhZCBpczoKCnN0cnVjdCB2aXJ0YnVzX2RldmljZSB7CiDCoMKgwqAg
Y29uc3QgY2hhcsKgwqDCoCDCoMKgwqAgwqDCoMKgICpuYW1lOwogwqDCoMKgIGludMKgwqDCoCDC
oMKgwqAgwqDCoMKgIMKgwqDCoCBpZDsKIMKgwqDCoCBjb25zdCBzdHJ1Y3QgdmlydGJ1c19kZXZf
aWTCoMKgwqAgKmRldl9pZDsKIMKgwqDCoCBzdHJ1Y3QgZGV2aWNlwqDCoMKgIMKgwqDCoCDCoMKg
wqAgZGV2OwogwqDCoMKgwqDCoMKgwqAgdm9pZMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAq
ZGF0YTsKfTsKCkFyZSB0aGVyZSBhbnkgZnVuZGFtZW50YWwgaXNzdWVzIHRoYXQgeW91IHRoaW5r
IG1kZXZfZGV2aWNlIGlzIGFidXNlZD8gSSAKd29uJ3QgZXhwZWN0IHRoZSBhbnN3ZXJzIGFyZSBn
ZW5lcmljIG9iamVjdHMgbGlrZSBrb2JqLCBpb21tdSBkZXZpY2UgCnBvaW50ZXIgZXRjLgoKCj4K
Pj4gTXkgdW5kZXJzdGFuZGluZyBmb3IgbWRldiBpcyB0aGF0IGl0IHdhcyBhIG1lZGlhdG9yIGJl
dHdlZW4gdGhlIGRyaXZlciBhbmQKPj4gcGh5c2ljYWwgZGV2aWNlIHdoZW4gaXQncyBoYXJkIHRv
IGxldCB0aGVtIHRhbGsgZGlyZWN0bHkgZHVlIHRvIHRoZQo+PiBjb21wbGV4aXR5IG9mIHJlZmFj
dG9yaW5nIGFuZCBtYWludGVuYW5jZS4KPiBSZWFsbHksIG1kZXYgaXMgdG8gc3VwcG9ydCB2Zmlv
IHdpdGggYSBiYWNrZW5kIG90aGVyIHRoYW4gUENJLCBub3RoaW5nCj4gbW9yZS4KCgpUaGF0IHBh
cnRpYWxseSBleHBsYWluIHdoeSBpdCB3YXMgY2FsbGVkIG1kZXYuIFNvIGZvciB2aXJpdG8sIHdl
IHdhbnQgCnN0YW5kYXJkIHZpcnRpbyBkcml2ZXIgdG8gdGFsayB3aXRoIGEgYmFja2VuZCBvdGhl
ciB0aGFuIHZpcnRpby4KCkZvciB0aGUgaXNzdWUgb2YgUENJLCBhY3R1YWxseSB0aGUgQVBJIGlz
IGdlbmVyaWMgZW5vdWdoIHRvIHN1cHBvcnQgCmRldmljZSBvdGhlciB0aGFuIFBDSSwgZS5nIEFQ
IGJ1cy4KCgo+Cj4gQWJ1c2luZyBpdCBmb3Igb3RoZXIgdGhpbmdzIGlzIG5vdCBhcHByb3ByaWF0
ZS4gaWUgY3JlYXRpbmcgYW4KPiBpbnN0YW5jZSBhbmQgbm90IGZpbGxpbmcgaW4gbW9zdCBvZiB0
aGUgdmZpbyBmb2N1c2VkIG9wcyBpcyBhbiBhYnVzaXZlCj4gdGhpbmcgdG8gZG8uCgoKV2VsbCwg
aXQncyBvbmx5IGhhbGYgb2YgdGhlIG1kZXZfcGFyZW50X29wcyBpbiBtZGV2X3BhcmVudCwgdmFy
aW91cyAKbWV0aG9kcyBjb3VsZCBiZSBkb25lIGRvIGJlIG1vcmUgZ2VuZXJpYyB0byBhdm9pZCBk
dXBsaWNhdGlvbiBvZiBjb2Rlcy4gTm8/CgoKPgo+PiBoYXJkd2FyZSB0aGF0IGNhbiBvZmZsb2Fk
IHZpcnRpbyBkYXRhcGF0aCBidXQgbm90IGNvbnRyb2wgcGF0aC4gV2Ugd2FudCB0bwo+PiBwcmVz
ZW50IGEgdW5pZmllZCBpbnRlcmZhY2UgKHN0YW5kYXJkIHZpcnRpbykgaW5zdGVhZCBvZiBhIHZl
bmRvciBzcGVjaWZpYwo+PiBpbnRlcmZhY2UsIHNvIGEgbWVkaWF0b3IgbGV2ZWwgaW4gdGhlIG1p
ZGRsZSBpcyBhIG11c3QuIEZvciB2aXJ0aW8gZHJpdmVyLAo+PiBtZWRpYXRvciBwcmVzZW50IGEg
ZnVsbCB2aXJ0aW8gY29tcGF0aWJsZSBkZXZpY2UuIEZvciBoYXJkd2FyZSwgbWVkaWF0b3IKPj4g
d2lsbCBtZWRpYXRlIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIGJlaGF2aW9yIGRlZmluZWQg
YnkgdmlydGlvIHNwZWMgYW5kCj4+IHJlYWwgaGFyZHdhcmUuCj4gSWYgeW91IG5lZWQgdG8gYmlu
ZCB0byB0aGUgVkZJTyBkcml2ZXIgdGhlbiBtZGV2IGlzIHRoZSByaWdodCB0aGluZyB0bwo+IHVz
ZSwgb3RoZXJ3aXNlIGl0IGlzIG5vdC4KPgo+IEl0IGNlcnRhaW5seSBzaG91bGQgbm90IGJlIHVz
ZWQgdG8gYmluZCB0byByYW5kb20ga2VybmVsIGRyaXZlcnMuIFRoaXMKPiBwcm9ibGVtIGlzIHdo
YXQgdGhpcyB2aXJ0dWFsIGJ1cyBpZGVhIEludGVsIGlzIHdvcmtpbmcgb24gbWlnaHQgc29sdmUu
CgoKV2hhdCBkbyB5b3UgbWVhbiBieSByYW5kb20gaGVyZT8gV2l0aCB0aGlzIHNlcmllcywgd2Ug
aGF2ZSBkZWRpY2F0ZWQgYnVzIAphbmQgZGVkaWNhdGVkIGRyaXZlciB3aXRoIG1hdGNoaW5nIG1l
dGhvZCB0byBtYWtlIHN1cmUgdGhlIGJpbmRpbmcgaXMgCmNvcnJlY3QuCgoKPgo+IEl0IHNlZW1z
IHRoZSBvbmx5IHRoaW5nIHBlb3BsZSBjYXJlIGFib3V0IHdpdGggbWRldiBpcyB0aGUgR1VJRAo+
IGxpZmVjeWNsZSBzdHVmZiwgYnV0IGF0IHRoZSBzYW1lIHRpbWUgZm9sa3MgbGlrZSBQYXJhdiBh
cmUgc2F5aW5nIHRoZXkKPiBkb24ndCB3YW50IHRvIHVzZSB0aGF0IGxpZmVjeWNsZSBzdHVmZiBh
bmQgcHJlZmVyIGRldmxpbmsKPiBpbnN0ZWFkLgoKCkknbSBzdXJlIHlvdSB3aWxsIG5lZWQgdG8g
aGFuZGxlIG90aGVyIGlzc3VlcyBiZXNpZGVzIEdVSUQgd2hpY2ggaGFkIApiZWVuIHNldHRsZWQg
YnkgbWRldiBlLmcgSU9NTVUgYW5kIHR5cGVzIHdoZW4gc3RhcnRpbmcgdG8gd3JpdGUgYSByZWFs
IApoYXJkd2FyZSBkcml2ZXIuCgoKPgo+IE1vc3QgbGlrZWx5LCBhdCBsZWFzdCBmb3IgdmlydGlv
LW5ldCwgZXZlcnlvbmUgZWxzZSB3aWxsIGJlIGFibGUgdG8KPiB1c2UgZGV2bGluayBhcyB3ZWxs
LCBtYWtpbmcgaXQgbXVjaCBsZXNzIGNsZWFyIGlmIHRoYXQgR1VJRCBsaWZlY3ljbGUKPiBzdHVm
ZiBpcyBhIGdvb2QgaWRlYSBvciBub3QuCgoKVGhpcyBhc3N1bXB0aW9uIGlzIHdyb25nLCB3ZSBo
YXJkIGFscmVhZHkgaGFkIGF0IGxlYXN0IHR3byBjb25jcmV0ZSAKZXhhbXBsZXMgb2YgdkRQQSBk
ZXZpY2UgdGhhdCBkb2Vzbid0IHVzZSBkZXZsaW5rOgoKLSBJbnRlbCBJRkMgd2hlcmUgdmlydGlv
IGlzIGRvbmUgYXQgVkYgbGV2ZWwKLSBBbGkgQ2xvdWQgRUNTIGluc3RhbmNlIHdoZXJlIHZpcnRp
byBpcyBkb25lIGF0IFBGIGxldmVsCgpBZ2FpbiwgdGhlIGRldmljZSBzbGljaW5nIGlzIG9ubHkg
cGFydCBvZiBvdXIgZ29hbC4gVGhlIG1ham9yIGdvYWwgaXMgdG8gCmhhdmUgYSBtZWRpYXRvciBs
ZXZlbCB0aGF0IGNhbiB0YWtlIG92ZXIgdGhlIHZpcnRpbyBjb250cm9sIHBhdGggYmV0d2VlbiAK
YSBzdGFuZGFyZCB2aXJ0aW8gZHJpdmVyIGFuZCBhIGhhcmR3YXJlIHdobyBkYXRhcGF0aCBpcyB2
aXJ0aW8gCmNvbXBhdGlibGUgYnV0IG5vdCBjb250cm9sIHBhdGguCgpUaGFua3MKCgo+Cj4gSmFz
b24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
