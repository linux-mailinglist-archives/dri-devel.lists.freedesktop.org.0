Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D69DA35E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 03:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5688C6E9EB;
	Thu, 17 Oct 2019 01:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F006E9ED;
 Thu, 17 Oct 2019 01:43:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ACAAB51EF3;
 Thu, 17 Oct 2019 01:43:16 +0000 (UTC)
Received: from [10.72.12.185] (ovpn-12-185.pek2.redhat.com [10.72.12.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F04551001B36;
 Thu, 17 Oct 2019 01:42:54 +0000 (UTC)
Subject: Re: [PATCH V3 0/7] mdev based hardware virtio offloading support
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191014174946.GC5359@stefanha-x1.localdomain>
 <6d12ad8f-8137-e07d-d735-da59a326e8ed@redhat.com>
 <20191015143720.GA13108@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ba81e603-cb7d-b152-8fae-97f070a7e460@redhat.com>
Date: Thu, 17 Oct 2019 09:42:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015143720.GA13108@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 17 Oct 2019 01:43:17 +0000 (UTC)
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

Ck9uIDIwMTkvMTAvMTUg5LiL5Y2IMTA6MzcsIFN0ZWZhbiBIYWpub2N6aSB3cm90ZToKPiBPbiBU
dWUsIE9jdCAxNSwgMjAxOSBhdCAxMTozNzoxN0FNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDE5LzEwLzE1IOS4iuWNiDE6NDksIFN0ZWZhbiBIYWpub2N6aSB3cm90ZToKPj4+IE9u
IEZyaSwgT2N0IDExLCAyMDE5IGF0IDA0OjE1OjUwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+Pj4gVGhlcmUgYXJlIGhhcmR3YXJlIHRoYXQgY2FuIGRvIHZpcnRpbyBkYXRhcGF0aCBvZmZs
b2FkaW5nIHdoaWxlIGhhdmluZwo+Pj4+IGl0cyBvd24gY29udHJvbCBwYXRoLiBUaGlzIHBhdGgg
dHJpZXMgdG8gaW1wbGVtZW50IGEgbWRldiBiYXNlZAo+Pj4+IHVuaWZpZWQgQVBJIHRvIHN1cHBv
cnQgdXNpbmcga2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gZHJpdmUgdGhvc2UKPj4+PiBkZXZpY2Vz
LiBUaGlzIGlzIGRvbmUgYnkgaW50cm9kdWNpbmcgYSBuZXcgbWRldiB0cmFuc3BvcnQgZm9yIHZp
cnRpbwo+Pj4+ICh2aXJ0aW9fbWRldikgYW5kIHJlZ2lzdGVyIGl0c2VsZiBhcyBhIG5ldyBraW5k
IG9mIG1kZXYgZHJpdmVyLiBUaGVuCj4+Pj4gaXQgcHJvdmlkZXMgYSB1bmlmaWVkIHdheSBmb3Ig
a2VybmVsIHZpcnRpbyBkcml2ZXIgdG8gdGFsayB3aXRoIG1kZXYKPj4+PiBkZXZpY2UgaW1wbGVt
ZW50YXRpb24uCj4+Pj4KPj4+PiBUaG91Z2ggdGhlIHNlcmllcyBvbmx5IGNvbnRhaW5zIGtlcm5l
bCBkcml2ZXIgc3VwcG9ydCwgdGhlIGdvYWwgaXMgdG8KPj4+PiBtYWtlIHRoZSB0cmFuc3BvcnQg
Z2VuZXJpYyBlbm91Z2ggdG8gc3VwcG9ydCB1c2Vyc3BhY2UgZHJpdmVycy4gVGhpcwo+Pj4+IG1l
YW5zIHZob3N0LW1kZXZbMV0gY291bGQgYmUgYnVpbHQgb24gdG9wIGFzIHdlbGwgYnkgcmVzdWlu
ZyB0aGUKPj4+PiB0cmFuc3BvcnQuCj4+Pj4KPj4+PiBBIHNhbXBsZSBkcml2ZXIgaXMgYWxzbyBp
bXBsZW1lbnRlZCB3aGljaCBzaW11bGF0ZSBhIHZpcml0by1uZXQKPj4+PiBsb29wYmFjayBldGhl
cm5ldCBkZXZpY2Ugb24gdG9wIG9mIHZyaW5naCArIHdvcmtxdWV1ZS4gVGhpcyBjb3VsZCBiZQo+
Pj4+IHVzZWQgYXMgYSByZWZlcmVuY2UgaW1wbGVtZW50YXRpb24gZm9yIHJlYWwgaGFyZHdhcmUg
ZHJpdmVyLgo+Pj4+Cj4+Pj4gQ29uc2lkZXIgbWRldiBmcmFtZXdvcmsgb25seSBzdXBwb3J0IFZG
SU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAo+Pj4+IHRoaXMgc2VyaWVzIGFsc28gZXh0
ZW5kIGl0IHRvIHN1cHBvcnQgb3RoZXIgdHlwZXMuIFRoaXMgaXMgZG9uZQo+Pj4+IHRocm91Z2gg
aW50cm9kdWNpbmcgY2xhc3MgaWQgdG8gdGhlIGRldmljZSBhbmQgcGFpcmluZyBpdCB3aXRoCj4+
Pj4gaWRfdGFsYmUgY2xhaW1lZCBieSB0aGUgZHJpdmVyLiBPbiB0b3AsIHRoaXMgc2VyaXMgYWxz
byBkZWNvdXBsZQo+Pj4+IGRldmljZSBzcGVjaWZpYyBwYXJlbnRzIG9wcyBvdXQgb2YgdGhlIGNv
bW1vbiBvbmVzLgo+Pj4gSSB3YXMgY3VyaW91cyBzbyBJIHRvb2sgYSBxdWljayBsb29rIGFuZCBw
b3N0ZWQgY29tbWVudHMuCj4+Pgo+Pj4gSSBndWVzcyB0aGlzIGRyaXZlciBydW5zIGluc2lkZSB0
aGUgZ3Vlc3Qgc2luY2UgaXQgcmVnaXN0ZXJzIHZpcnRpbwo+Pj4gZGV2aWNlcz8KPj4KPj4gSXQg
Y291bGQgcnVuIGluIGVpdGhlciBndWVzdCBvciBob3N0LiBCdXQgdGhlIG1haW4gZm9jdXMgaXMg
dG8gcnVuIGluIHRoZQo+PiBob3N0IHRoZW4gd2UgY2FuIHVzZSB2aXJ0aW8gZHJpdmVycyBpbiBj
b250YWluZXJzLgo+Pgo+Pgo+Pj4gSWYgdGhpcyBpcyB1c2VkIHdpdGggcGh5c2ljYWwgUENJIGRl
dmljZXMgdGhhdCBzdXBwb3J0IGRhdGFwYXRoCj4+PiBvZmZsb2FkaW5nIHRoZW4gaG93IGFyZSBw
aHlzaWNhbCBkZXZpY2VzIHByZXNlbnRlZCB0byB0aGUgZ3Vlc3Qgd2l0aG91dAo+Pj4gU1ItSU9W
Pwo+Pgo+PiBXZSB3aWxsIGRvIGNvbnRyb2wgcGF0aCBtZWRpdGF0aW9uIHRocm91Z2ggdmhvc3Qt
bWRldlsxXSBhbmQgdmhvc3QtdmZpb1syXS4KPj4gVGhlbiB3ZSB3aWxsIHByZXNlbnQgYSBmdWxs
IHZpcnRpbyBjb21wYXRpYmxlIGV0aGVybmV0IGRldmljZSBmb3IgZ3Vlc3QuCj4+Cj4+IFNSLUlP
ViBpcyBub3QgYSBtdXN0LCBhbnkgbWRldiBkZXZpY2UgdGhhdCBpbXBsZW1lbnRzIHRoZSBBUEkg
ZGVmaW5lZCBpbgo+PiBwYXRjaCA1IGNhbiBiZSB1c2VkIGJ5IHRoaXMgZnJhbWV3b3JrLgo+IFdo
YXQgSSdtIHRyeWluZyB0byB1bmRlcnN0YW5kIGlzOiBpZiB5b3Ugd2FudCB0byBwcmVzZW50IGEg
dmlydGlvLXBjaQo+IGRldmljZSB0byB0aGUgZ3Vlc3QgKGUuZy4gdXNpbmcgdmhvc3QtbWRldiBv
ciB2aG9zdC12ZmlvKSwgdGhlbiBob3cgaXMKPiB0aGF0IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCBz
ZXJpZXM/CgoKVGhpcyBzZXJpZXMgaW50cm9kdWNlIHNvbWUgaW5mcmFzdHJ1Y3R1cmUgdGhhdCB3
b3VsZCBiZSB1c2VkIGJ5IHZob3N0LW1kZXY6CgoxKSBhbGxvdyBuZXcgdHlwZSBvZiBtZGV2IGRl
dmljZXMvZHJpdmVycyBvdGhlciB0aGFuIHZmaW8gKHRocm91Z2ggCmNsYXNzX2lkIGFuZCBkZXZp
Y2Ugb3BzKQoKMikgYSBzZXQgb2YgdmlydGlvIHNwZWNpZmljIGNhbGxiYWNrcyB0aGF0IHdpbGwg
YmUgdXNlZCBieSBib3RoIAp2aG9zdC1tZGV2IGFuZCB2aXJ0aW8tbWRldiBkZWZpbmVkIGluIHBh
dGNoIDUKClRoZW4gdmhvc3QtbWRldiBjYW4gYmUgaW1wbGVtZW50ZWQgb24gdG9wOiBhIG5ldyBt
ZGV2IGNsYXNzIGlkIGJ1dCByZXVzZSAKdGhlIGNhbGxiYWNrIGRlZmluZWQgaW4gMi4gVGhyb3Vn
aCB0aGlzIHdheSB0aGUgcGFyZW50IGNhbiBwcm92aWRlcyBhIApzaW5nbGUgc2V0IG9mIGNhbGxi
YWNrcyAoZGV2aWNlIG9wcykgZm9yIGJvdGgga2VybmVsIHZpcnRpbyBkcml2ZXIgCih0aHJvdWdo
IHZpcnRpby1tZGV2KSBvciB1c2Vyc3BhY2UgdmlydGlvIGRyaXZlciAodGhyb3VnaCB2aG9zdC1t
ZGV2KS4KCgo+Cj4gRG9lcyB0aGlzIG1lYW4gdGhpcyBwYXRjaCBzZXJpZXMgaXMgdXNlZnVsIG1v
c3RseSBmb3IgcHJlc2VudGluZyB2aXJ0aW8KPiBkZXZpY2VzIHRvIGNvbnRhaW5lcnMgb3IgdGhl
IGhvc3Q/CgoKUGF0Y2ggNiBpcyBtYWlubHkgZm9yIGJhcmUgbWV0YWwgb3IgY29udGFpbmVyIHVz
ZSBjYXNlLCB0aHJvdWdoIGl0IGNvdWxkIApiZSB1c2VkIGluIGd1ZXN0IGFzIHdlbGwuIFBhdGNo
IDcgaXMgYSBzYW1wbGUgdmlydGlvIG1kZXYgZGV2aWNlIAppbXBsZW1lbnRhdGlvbi4gUGF0Y2gg
MSAtIDUgd2FzIHRoZSBpbmZyYXN0cnVjdHVyZSBmb3IgaW1wbGVtZW50aW5nIAp0eXBlcyBvdGhl
ciB0aGFuIHZmaW8sIHRoZSBmaXJzdCB1c2VyIGlzIHZpcml0by1tZGV2LCB0aGVuIFRpd2VpJ3Mg
CnZob3N0LW1kZXYgYW5kIFBhcmF2J3MgbWx4NSBtZGV2LgoKVGhhbmtzCgoKPgo+IFN0ZWZhbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
