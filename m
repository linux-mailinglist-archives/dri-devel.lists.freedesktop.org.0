Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB41BB3B
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 18:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8431C6E7A0;
	Mon, 13 May 2019 16:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93BB6E7A0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 16:46:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16543216-1500050 for multiple; Mon, 13 May 2019 17:46:32 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>, Steven Price <steven.price@arm.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <0b7f0b7f-3e14-f5bb-368a-08037c2a8529@arm.com>
References: <20190513143244.16478-1-steven.price@arm.com>
 <20190513143921.GP17751@phenom.ffwll.local>
 <155775884217.2165.11223399053598674062@skylake-alporthouse-com>
 <0b7f0b7f-3e14-f5bb-368a-08037c2a8529@arm.com>
Message-ID: <155776599144.2165.15056323416635154840@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/panfrost: Use drm_gem_dump_map_offset()
Date: Mon, 13 May 2019 17:46:31 +0100
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
Cc: David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTdGV2ZW4gUHJpY2UgKDIwMTktMDUtMTMgMTY6MTQ6MDEpCj4gT24gMTMvMDUvMjAx
OSAxNTo0NywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgy
MDE5LTA1LTEzIDE1OjM5OjIxKQo+ID4+IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDAzOjMyOjQ0
UE0gKzAxMDAsIFN0ZXZlbiBQcmljZSB3cm90ZToKPiA+Pj4gcGFuZnJvc3RfaW9jdGxfbW1hcF9i
bygpIGNvbnRhaW5zIGEgcmVpbXBsZW1lbnRhdGlvbiBvZgo+ID4+PiBkcm1fZ2VtX2R1bXBfbWFw
X29mZnNldCgpIGJ1dCB3aXRoIGEgYnVnIC0gaXQgYWxsb3dzIG1hcHBpbmcgaW1wb3J0ZWQKPiA+
Pj4gb2JqZWN0cyAod2l0aG91dCBnb2luZyB0aHJvdWdoIHRoZSBleHBvcnRlcikuIEZpeCB0aGlz
IGJ5IHN3aXRjaGluZyB0bwo+ID4+PiB1c2UgdGhlIGdlbmVyaWMgZHJtX2dlbV9kdW1wX21hcF9v
ZmZzZXQoKSBmdW5jdGlvbiBpbnN0ZWFkIHdoaWNoIGhhcyB0aGUKPiA+Pj4gYm9udXMgb2Ygc2lt
cGxpZnlpbmcgdGhlIGNvZGUuCj4gPj4KPiA+PiBnZW1fZHVtYiBzdHVmZiBpcyBmb3Iga21zIGRy
aXZlcnMsIHBhbmZyb3N0IGlzIGEgcmVuZGVyIGRyaXZlci4gV2UncmUKPiA+PiBnZW5lcmFsbHkg
dHJ5aW5nIHRvIHNlcGFyYXRlIHRoZXNlIHR3byB3b3JsZHMgc29tZXdoYXQgY2xlYW5seS4KPiA+
Pgo+ID4+IEkgdGhpbmsgaXQnZCBiZSBnb29kIHRvIGhhdmUgYSBub24tZHVtYiB2ZXJzaW9uIG9m
IHRoaXMgaW4gdGhlIGNvcmUsIGFuZAo+ID4+IHVzZSB0aGF0LiBPciB1cGdyYWRlIHRoZSBkdW1i
IHZlcnNpb24gdG8gYmUgdGhhdCBoZWxwZXIgZm9yIGV2ZXJ5b25lIChhbmQKPiA+PiBkcm9wIHRo
ZSBfZHVtYikuCj4gCj4gSSdtIHNsaWdodGx5IGNvbmZ1c2VkIGJ5IHdoYXQgeW91IHRoaW5rIGlz
IHRoZSBiZXN0IGNvdXJzZSBvZiBhY3Rpb24gaGVyZS4KPiAKPiBJIGNhbiBjcmVhdGUgYSBwYXRj
aCBkcm9wcGluZyB0aGUgJ19kdW1iJyBmcm9tIGRybV9nZW1fZHVtcF9tYXBfb2Zmc2V0KCkKPiBp
ZiB0aGF0J3MgdGhlIG9iamVjdGlvbi4gT3IgZG8geW91IHdhbnQgYSBoZWxwZXIgZnVuY3Rpb24g
d2l0aCB0d28KPiBjYWxsZXJzICh0aGUgJ2R1bXAnIGFuZCB0aGUgJ3NobWVtJyB2ZXJzaW9ucyk/
Cj4gCj4gPiBNb3JlIHNwZWNpZmljYWxseSwgc2luY2UgcGFuZnJvc3QgaXMgdXNpbmcgdGhlIGRy
bV9nZW1fc2htZW0gaGVscGVyIGFuZAo+ID4gdm1fb3BzLCBpdCB0b28gY2FuIHByb3ZpZGUgdGhl
IHdyYXBwZXIgYXMgaXQgaXMgdGhlIGRybV9nZW1fc2htZW0gbGF5ZXIKPiA+IHRoYXQgaW1wbGll
cyB0aGF0IHRyeWluZyB0byBtbWFwIGFuIGltcG9ydGVkIG9iamVjdCBpcyBhbiBpc3N1ZSBhcyB0
aGF0Cj4gPiBpcyBub3QgYSB1bml2ZXJzYWwgcHJvYmxlbS4KPiBtbWFwJ2luZyBhbiBpbXBvcnRl
ZCBvYmplY3QgaXNuJ3QgYSBwcm9ibGVtIGFzIHN1Y2guIEJ1dCByYXRoZXIgdGhhbgo+IGdvaW5n
IGJlaGluZCB0aGUgZXhwb3J0ZXIncyBiYWNrIHdlIHdvdWxkIG5lZWQgdG8gY2FsbCBkbWFfYnVm
X21tYXAoKSB0bwo+IGVuc3VyZSB0aGF0IHRoZSBleHBvcnRlciBjYW4gZG8gd2hhdGV2ZXIgaXMg
bmVjZXNzYXJ5Lgo+IAo+IEkgY291bGQgYWRkIGEgd3JhcHBlciBpbiBkcm1fZ2VtX3NobWVtX2hl
bHBlciwgYnV0IEknbSBub3Qgc3VyZSB3aGF0IHRoZQo+IGJlbmVmaXQgb2YgYSB3cmFwcGVyIGhl
cmUgaXM/CgpObywgbXkgcG9pbnQgaXMgdGhhdCB0aGUgcGFnZWZhdWx0aW5nIGlzIGJlaW5nIHBy
b3ZpZGVkIGJ5IGRybV9nZW1fc2htZW0KYW5kIHRoYXQgaXMgcmVseWluZyBvbiBkaXJlY3QgYWNj
ZXNzIHRvIHN0cnVjdCBwYWdlLCBoZW5jZSB0aGF0IGlzCmltcG9zaW5nIHRoZSByZXN0cmljdGlv
biB0aGF0IGl0IGNhbiBvbmx5IGhhbmRsZSBpdHMgb3duIHNobWVtIG9iamVjdHMuClRoZSBkcml2
ZXIgc2hvdWxkIG5vdCBndWVzcyB0aGUgaGVscGVyLCBidXQgYXNrIHRoZSBoZWxwZXIgaWYgaXQg
Y2FuCnBlcmZvcm0gYW4gbW1hcCBvZiB0aGlzIG9iamVjdCwgYW5kIHNpbmNlIHRoaXMgb2JqZWN0
IGlzIG5vdCBhbiBzaG1lbQpvYmplY3QgaXQgd2lsbCBzYXkgbm8uCgpEaWZmZXJlbnQgZHJpdmVy
cyBjYW4gdXNlIHRoZWlyIEhXIHRvIGZhdWx0IGluIGluZGlyZWN0IGFjY2VzcyB0byBkbWFidWYK
KHRyZWF0aW5nIHRoZSBkbWFidWYgYXMgYSBjb252ZXlhbmNlIG9mIGEgc2dsaXN0IGFuZCBub3Qg
c3RydWN0IHBhZ2UpCmFuZCBzbyBkbyBub3QgbmVlZCB0byBkaWZmZXJlbnQvcmVqZWN0IGZvcmVp
Z24gb2JqZWN0cyBmcm9tIHRoZWlyCnNwZWNpYWxpc2VkIG1tYXAgcm91dGluZXMgYW5kIGFyZSBv
YmxpdmlvdXMgdG8gdGhlbS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
