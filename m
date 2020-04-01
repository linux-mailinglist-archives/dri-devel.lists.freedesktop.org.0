Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4F19A7DD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 10:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E355E89E98;
	Wed,  1 Apr 2020 08:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171289E98
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 08:53:26 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20761132-1500050 for multiple; Wed, 01 Apr 2020 09:53:14 +0100
MIME-Version: 1.0
In-Reply-To: <547dca13-bd62-9319-ee44-6894ee1b60af@gmail.com>
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
 <20200331091618.GM2363188@phenom.ffwll.local>
 <158564641293.18289.1145145659054294433@build.alporthouse.com>
 <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
 <158566075049.18289.17918401274396829066@build.alporthouse.com>
 <547dca13-bd62-9319-ee44-6894ee1b60af@gmail.com>
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Christian König <ckoenig.leichtzumerken@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
Message-ID: <158573119432.5852.5430250256131238311@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 01 Apr 2020 09:53:14 +0100
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 Andi Shyti <andi.shyti@intel.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDIwLTA0LTAxIDA4OjI5OjM0KQo+IEFtIDMxLjAz
LjIwIHVtIDE1OjE5IHNjaHJpZWIgQ2hyaXMgV2lsc29uOgo+ID4gUXVvdGluZyBEYW5pZWwgVmV0
dGVyICgyMDIwLTAzLTMxIDExOjM4OjUwKQo+ID4+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDEx
OjIwIEFNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToKPiA+
Pj4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDIwLTAzLTMxIDEwOjE2OjE4KQo+ID4+Pj4gT24g
VHVlLCBNYXIgMzEsIDIwMjAgYXQgMTA6NTk6NDVBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3
cm90ZToKPiA+Pj4+PiBBIG5vdCBzbyBnZW50bGUgcGluZywgc2luY2UgdGhpcyBwcmV0dHkgbXVj
aCBicm9rZSBhbGwgVFRNIGJhc2VkIGRyaXZlcnMuCj4gPj4+Pj4KPiA+Pj4+PiBDb3VsZCB3ZSBy
ZXZlcnQgdGhpcyBmb3Igbm93Pwo+ID4+Pj4gQWx3YXlzIGFjayBmb3IgcmV2ZXJ0Lgo+ID4+Pj4K
PiA+Pj4+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+
ID4+PiBTbyB5b3UgZGlkbid0IGNoZWNrIHRoZSBlYXJsaWVyIHBhdGNoIGVpdGhlcj8KPiA+PiBJ
IGRpZCwgYnV0IHdhc24ndCBzdXBlciBzb2xkIG9uIHRoZSBpZGVhIG9mIG1vcmUgZmxhZ3MgdG8g
c21hY2sgYW4gci1iCj4gPj4gb250byBpdCwgc28gZmlndXJlZCBJJ2xsIHRocm93IHRoZSBkZWZh
dWx0IGFjay1mb3ItcmV2ZXJ0IG9uIHRoaXMKPiA+PiBtZWFud2hpbGUuCj4gPiBXZSBhbGxvdyB1
c2Vyc3BhY2UgdG8gcG9pc29uIHRoZSBkcm1fbW0gYXQgcm91Z2hseSA4SyBpbnRlcnZhbHMsIGEK
PiA+IHNlYXJjaCBzcGFjZSBvZiAzNWIgd2l0aCB0eXBpY2FsbHkgTyhOXjIpIGJlaGF2aW91ciBh
bmQgZWFjaCBub2RlCj4gPiB0cmF2ZXJzYWwgKHJiX25leHQvcmJfcHJldikgd2lsbCBpdHNlbGYg
YmUgY29zdGx5LiBFdmVuIG91ciBzaW1wbGUgdGVzdHMKPiA+IGNhbiBnZW5lcmF0ZSBhIHNlYXJj
aCBvZiBzZXZlcmFsIG1pbnV0ZXMgYmVmb3JlIG91ciBwYXRpZW5jZSBydW5zIG91dC5vCj4gPiBB
bnkgZHJtX21tIHRoYXQgYWxsb3dzIGZvciB1c2Vyc3BhY2UgdG8gY29udHJvbCBhbGlnbm1lbnQg
Y2FuIGJlCj4gPiBhcmJpdHJhcmlseSBmcmFnbWVudGVkLCBoZW5jZSBhIHJhaXNlZCBleWVicm93
IHRoYXQgdGhpcyBzZWFyY2ggd291bGQgYmUKPiA+IGFsbG93ZWQgaW4gYXRvbWljIGNvbnRleHQu
Cj4gCj4gV293LCB0aGF0IGlzIGluZGVlZCBxdWl0ZSBhIGxvdC4KPiAKPiBXaGF0IGlzIHRoZSBj
cml0ZXJpYSB1c2UgZm9yIG9yZGVyaW5nIHRoZSB0cmVlPyBKdXN0IHRoZSBzaXplIG9yIGlzIHRo
YXQgCj4gc2l6ZSthbGlnbm1lbnQ/CgpUaGUgdHJlZSBpcyBqdXN0IHNpemUuIEFsaWdubWVudCBp
cyBhIGxpdHRsZSB1c2VkIHBhcmFtZXRlciwgYnV0IHRoZXJlJ3MKYSByZXF1aXJlbWVudCBmb3Ig
dXNlcnNwYWNlIHRvIGJlIGFibGUgdG8gY29udHJvbCBpdCAtLSBhbHRob3VnaCBpdCBpcwpzdHJp
Y3RseSB0aGUgb2xkZXIgaW50ZXJmYWNlLCBpdCBpcyBzdGlsbCBvcGVuIHRvIGFidXNlLgoKQ29u
dmVydGluZyB0aGUgdHJlZSB0byBbc2l6ZSwgZmZzKGFkZHIpXSB3b3VsZCBoZWxwIGZvciBtYW55
LCBidXQgb24gdG9wCm9mIHRoYXQgd2UgaGF2ZSB6b25lcyBpbiB0aGUgZHJtX21tLCBzbyBzZWFy
Y2gtaW4tcmFuZ2UgY2FuIGJlIGFidXNlZCBvbgp0b3Agb2Ygc2VhcmNoLWZvci1hbGlnbm1lbnQu
CiAKPiBOZXZlciBsb29rZWQgaW50byB0aGlzLCBidXQgbWF5YmUgd2UgaGF2ZSBhIGxvdyBoYW5n
aW5nIGZydWl0IGZvciBhbiAKPiBpbXByb3ZlbWVudCBoZXJlPwoKQSBiaXQgLS0gYWxpZ25tZW50
IGlzIHNvIHJhcmVseSB1c2VkIGluIHByYWN0aWNlLCBvcHRpbWlzaW5nIGl0IHdhcyBub3QKYSBj
b25jZXJuLCBqdXN0IHNvbWVvbmUgZWxzZSBoYXMgbm93IG5vdGljZWQgdGhlIHBvdGVudGlhbCBm
b3IgYWJ1c2UuClRoZXkgcmFuIGEgdGVzdCwgZ2V0IGJvcmVkIGFuZCBjb21wbGFpbmVkIHRoYXQg
aXQgZGlkbid0IHJlc3BvbmQgdG8gXkMKZm9yIGEgbG9uZyBwZXJpb2Qgb2YgdGltZSBhbmQgZnJv
bSB0aGF0IGRlcml2ZSBhIHByb29mLW9mLWNvbmNlcHQgdGVzdCB0bwpzaG93IGhvdyBpdCBjYW4g
YmUgdXNlZCBieSBvbmUgY2xpZW50IHRvIHVwc2V0IGFub3RoZXIgOnwKIAo+IEknbSBub3QgMTAw
JSBzdXJlLCBidXQgbW92aW5nIGF3YXkgZnJvbSBhdG9taWMgY29udGV4dCB3b3VsZG4ndCBiZSB0
aGF0IAo+IGVhc3kuCgpGYWlyIGVub3VnaC4gSSB3b3VsZCBub3Qgd29ycnkgdW5sZXNzIHRoZSBs
YXlvdXQgaXMgY29udHJvbGxhYmxlIGJ5IHRoZQp1c2VyIC0tIGJ1dCB3ZSBwcm9iYWJseSB3YW50
IHNvbWUgb3RoZXIgbWVhbnMgb2YgYm91bmRpbmcgdGhlIHNlYXJjaC4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
