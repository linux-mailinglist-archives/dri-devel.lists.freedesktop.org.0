Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76585F3146
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 15:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4746F6AD;
	Thu,  7 Nov 2019 14:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309B16EA2B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 14:21:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-J1OMK1x0NCiU9HfU4rkiww-1; Thu, 07 Nov 2019 09:21:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DEFA1005500;
 Thu,  7 Nov 2019 14:21:38 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C818C608B6;
 Thu,  7 Nov 2019 14:20:45 +0000 (UTC)
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
 <20191107061942-mutt-send-email-mst@kernel.org>
 <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
 <20191107080834-mutt-send-email-mst@kernel.org>
 <b2265e3a-6f86-c21a-2ebd-d0e4eea2886f@redhat.com>
 <20191107085013-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3440c55b-bbb9-fd4d-7c06-f45860fb4bd3@redhat.com>
Date: Thu, 7 Nov 2019 22:20:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107085013-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: J1OMK1x0NCiU9HfU4rkiww-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573136505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrmPAze8Ac5FFece7lozmX/b+JhD3npiUhbXA+xlp7o=;
 b=F38MnjzJMtKn5UUaMAKqCJX7HmlRIV6jh4/ETG4k76uGASUAN5UMZBJHzeC4ZXcYb5t8T4
 VUpOK6wLbteMugv+ZYidrmeCoBZz3+FB43BhJrnyr+GeogzM/tZCuudjfimrYxQDna3RFB
 YF2MP+bBHc8nnx18FlouSISWZoAVIEs=
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

Ck9uIDIwMTkvMTEvNyDkuIvljYg5OjUwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBOb3YgMDcsIDIwMTkgYXQgMDk6MzI6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS8xMS83IOS4i+WNiDk6MDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0IDA4OjQzOjI5UE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAxOS8xMS83IOS4i+WNiDc6MjEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+Pj4gT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MTg6NDVQTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+IE9uIDIwMTkvMTEvNyDkuIvljYg1OjA4LCBNaWNoYWVsIFMuIFRz
aXJraW4gd3JvdGU6Cj4+Pj4+Pj4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSAr
MDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4+Pj4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0
ZXMgbWRldiBkZXZpY2UgdGhhdCBzaW11bGF0ZSB2aXJ0aW8gbmV0IGRldmljZQo+Pj4+Pj4+PiBv
dmVyIHZpcnRpbyBtZGV2IHRyYW5zcG9ydC4gVGhlIGRldmljZSBpcyBpbXBsZW1lbnRlZCB0aHJv
dWdoIHZyaW5naAo+Pj4+Pj4+PiBhbmQgd29ya3F1ZXVlLiBBIGRldmljZSBzcGVjaWZpYyBkbWEg
b3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMgdXNlZAo+Pj4+Pj4+PiBkaXJlY3RseSBhcyB0aGUg
SU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBmb3Iga2VybmVsIHZpcnRpbwo+Pj4+Pj4+
PiBkcml2ZXIgdG8gd29yay4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gT25seSAndmlydGlvJyB0eXBlIGlz
IHN1cHBvcnRlZCByaWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4+Pj4+Pj4+
IG9uIHRvcCB3aGljaCByZXF1aXJlcyBzb21lIHZpcnR1YWwgSU9NTVUgaW1wbGVtZW50ZWQgaW4g
dGhpcyBzYW1wbGUKPj4+Pj4+Pj4gZHJpdmVyLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBY2tlZC1ieTog
Q29ybmVsaWEgSHVjazxjb2h1Y2tAcmVkaGF0LmNvbT4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
SmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4+Pj4+IEknZCBwcmVmZXIgaXQgdGhh
dCB3ZSBjYWxsIHRoaXMgc29tZXRoaW5nIGVsc2UsIGUuZy4KPj4+Pj4+PiBtdm5ldC1sb29wYmFj
ay4gSnVzdCBzbyBwZW9wbGUgZG9uJ3QgZXhwZWN0IGEgZnVsbHkKPj4+Pj4+PiBmdW5jdGlvbmFs
IGRldmljZSBzb21laG93LiBDYW4gYmUgcmVuYW1lZCB3aGVuIGFwcGx5aW5nPwo+Pj4+Pj4gQWN0
dWFsbHksIEkgcGxhbiB0byBleHRlbmQgaXQgYXMgYW5vdGhlciBzdGFuZGFyZCBuZXR3b3JrIGlu
dGVyZmFjZSBmb3IKPj4+Pj4+IGtlcm5lbC4gSXQgY291bGQgYmUgZWl0aGVyIGEgc3RhbmRhbG9u
ZSBwc2V1ZG8gZGV2aWNlIG9yIGEgc3RhY2sgZGV2aWNlLgo+Pj4+Pj4gRG9lcyB0aGlzIHNvdW5k
cyBnb29kIHRvIHlvdT8KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MKPj4+Pj4gVGhhdCdzIGEgYmlnIGNo
YW5nZSBpbiBhbiBpbnRlcmZhY2Ugc28gaXQncyBhIGdvb2QgcmVhc29uCj4+Pj4+IHRvIHJlbmFt
ZSB0aGUgZHJpdmVyIGF0IHRoYXQgcG9pbnQgcmlnaHQ/Cj4+Pj4+IE9oZXJ3aXNlIHVzZXJzIG9m
IGFuIG9sZCBrZXJuZWwgd291bGQgZXhwZWN0IGEgc3RhY2tlZCBkcml2ZXIKPj4+Pj4gYW5kIGdl
dCBhIGxvb3BiYWNrIGluc3RlYWQuCj4+Pj4+Cj4+Pj4+IE9yIGRpZCBJIG1pc3Mgc29tZXRoaW5n
Pwo+Pj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBpdCB3YXMgYSBzYW1wbGUgZHJpdmVyIGlu
IC9kb2MuIEl0IHNob3VsZCBub3QgYmUKPj4+PiB1c2VkIGluIHByb2R1Y3Rpb24gZW52aXJvbm1l
bnQuIE90aGVyd2lzZSB3ZSBuZWVkIHRvIG1vdmUgaXQgdG8KPj4+PiBkcml2ZXIvdmlydGlvLgo+
Pj4+Cj4+Pj4gQnV0IGlmIHlvdSBpbnNpc3QsIEkgY2FuIHBvc3QgYSBWMTEuCj4+Pj4KPj4+PiBU
aGFua3MKPj4+IHRoaXMgY2FuIGJlIGEgcGF0Y2ggb24gdG9wLgo+PiBUaGVuIG1heWJlIGl0J3Mg
YmV0dGVyIGp1c3QgZXh0ZW5kIGl0IHRvIHdvcmsgYXMgYSBub3JtYWwgbmV0d29ya2luZyBkZXZp
Y2UKPj4gb24gdG9wPwo+Pgo+PiBUaGFua3MKPiBUaGF0IHdvdWxkIGJlIGEgc3Vic3RhbnRpYWwg
Y2hhbmdlLiBNYXliZSBkcm9wIDYvNiBmb3Igbm93IHVudGlsCj4gd2UgaGF2ZSBhIGJldHRlciBo
YW5kbGUgb24gdGhpcz8KPgoKT2ssIGNvbnNpZGVyIHRoZSBjaGFuZ2Ugc2hvdWxkIGJlIHNtYWxs
LCBJIHdpbGwgcG9zdCBWMTEgd2hlcmUgSSBjYW4gZml4IAp0aGUgdHlwb3Mgc3BvdHRlZC4KClRo
YW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
