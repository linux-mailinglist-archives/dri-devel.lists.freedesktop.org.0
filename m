Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F17626A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F90B6ECD8;
	Fri, 26 Jul 2019 09:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 434D26ECC2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:20:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9A38344;
 Fri, 26 Jul 2019 02:20:36 -0700 (PDT)
Received: from [10.1.35.37] (Hgb10.cambridge.arm.com [10.1.35.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD24C3F71A;
 Fri, 26 Jul 2019 02:20:35 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Rob Herring <robh@kernel.org>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
 <CAL_Jsq+C1wLYg8_OWL9vUWU2HRcMUuHcL53MjbUAm0fXcO9Mkg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <efe2667d-ec3d-b1f5-c4d7-6a784e90c5e8@arm.com>
Date: Fri, 26 Jul 2019 10:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+C1wLYg8_OWL9vUWU2HRcMUuHcL53MjbUAm0fXcO9Mkg@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDcvMjAxOSAyMjoyOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBKdWwgMjUs
IDIwMTkgYXQgOTozNSBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPiB3cm90
ZToKPj4KPj4gT24gMjUvMDcvMjAxOSAxNTo1OSwgU3RldmVuIFByaWNlIHdyb3RlOgo+PiBbLi4u
XQo+Pj4gSXQgd291bGQgYXBwZWFyIHRoYXQgaW4gdGhlIGZvbGxvd2luZyBjYWxsIHNndD09TlVM
TDoKPj4+PiAgICAgICByZXQgPSBzZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKHNndCwgcGFnZXMg
KyBwYWdlX29mZnNldCwKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE5VTV9GQVVMVF9QQUdFUywgMCwgU1pfMk0sIEdGUF9LRVJORUwpOwo+Pj4KPj4+IFdoaWNoIG1l
YW5zIHdlJ3ZlIGVuZGVkIHVwIHdpdGggYSBCTyB3aXRoIGJvLT5zZ3Q9PU5VTEwsIGJvLT5wYWdl
cyBzZXQKPj4+IGFuZCBiby0+aXNfaGVhcD10cnVlLiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoaXMg
c2hvdWxkIGJlIGltcG9zc2libGUuCj4+Pgo+Pj4gSSBoYXZlbid0IHlldCBmaWd1cmVkIG91dCBo
b3cgdGhpcyBoYXBwZW5zIC0gaXQgc2VlbXMgdG8gYmUganVzdCBiZWZvcmUKPj4+IHRlcm1pbmF0
aW9uLCBzbyBpdCBtaWdodCBiZSBhIHJhY2Ugd2l0aCBjbGVhbnVwPwo+Pgo+PiBUaGF0IHdhcyBh
IHJlZCBoZXJyaW5nIC0gaXQncyBwYXJ0bHkgbXkgdGVzdCBjYXNlIGRvaW5nIHNvbWV0aGluZyBh
IGJpdAo+PiB3ZWlyZC4gVGhpcyBjcmFzaCBpcyBjYXVzZWQgYnkgZG9pbmcgYW4gbW1hcCBvZiBh
IEhFQVAgb2JqZWN0IGJlZm9yZSBhbnkKPj4gZmF1bHQgaGFzIG9jY3VycmVkLgo+IAo+IE15IGJy
b3RoZXIgUmVkIGlzIGFsd2F5cyBjYXVzaW5nIHByb2JsZW1zLiA7KQo+IAo+IEJ1dCB5b3Ugd2Vy
ZSByaWdodCB0aGF0IEkgbmVlZCB0byBrZnJlZSBiby0+c2d0cy4gQWRkaXRpb25hbGx5LCBJIGFs
c28KPiBuZWVkIHRvIGNhbGwgc2dfZnJlZV90YWJsZSBvbiBlYWNoIHRhYmxlLgo+IAo+PiBkcm1f
Z2VtX3NobWVtX21tYXAoKSBjYWxscyBkcm1fZ2VtX3NobWVtX2dldF9wYWdlcygpIHdoaWNoIHdp
bGwgcG9wdWxhdGUKPj4gYm8tPmJhc2UucGFnZXMgKGV2ZW4gaWYgYm8tPmlzX2hlYXApLgo+Pgo+
PiBFaXRoZXIgd2Ugc2hvdWxkIHByZXZlbnQgbWFwcGluZyBvZiBIRUFQIG9iamVjdHMsIG9yIGFs
dGVybmF0aXZlbHkKPj4gYm8tPmJhc2UucGFnZXMgY291bGQgYmUgYWxsb2NhdGVkIHVwZnJvbnQg
aW5zdGVhZCBvZiBkdXJpbmcgdGhlIGZpcnN0Cj4+IGZhdWx0LiBNeSBwcmVmZXJlbmNlIHdvdWxk
IGJlIGFsbG9jYXRpbmcgaXQgdXBmcm9udCBiZWNhdXNlIG9wdGltaXNpbmcKPj4gZm9yIHRoZSBj
YXNlIG9mIGEgSEVBUCBCTyB3aGljaCBpc24ndCB1c2VkIHNlZW1zIGEgYml0IHdlaXJkLiBBbHRo
b3VnaAo+PiB0aGVyZSdzIHN0aWxsIHRoZSBxdWVzdGlvbiBvZiBleGFjdGx5IHdoYXQgdGhlIGJl
aGF2aW91ciBzaG91bGQgYmUgb2YKPj4gYWNjZXNzaW5nIHRocm91Z2ggdGhlIENQVSBwYWdlcyB3
aGljaCBoYXZlbid0IGJlZW4gYWxsb2NhdGVkIHlldC4KPj4KPj4gQWxzbyBzaG1lbS0+cGFnZXNf
dXNlX2NvdW50IG5lZWRzIGluY3JlbWVudGluZyB0byBzdG9wCj4+IGRybV9nZW1fc2htZW1fZ2V0
X3BhZ2VzKCkgcmVwbGFjaW5nIGJvLT5iYXNlLnBhZ2VzLiBJIGhhdmVuJ3QgdGVzdGVkCj4+IHdo
YXQgaGFwcGVucyBpZiB5b3UgbW1hcCAqYWZ0ZXIqIHRoZSBmaXJzdCBmYXVsdC4KPiAKPiBJIGRp
ZCBzYXkgbW1hcCBoYWQgdW5kZWZpbmVkL3Vua25vd24gYmVoYXZpb3IuCgpUcnVlIC0gYW5kIEkg
d2FzIHN1cnByaXNlZCB0byBmaW5kIG91dCBteSB0ZXN0IHdhcyBhY3R1YWxseSBkb2luZyB0aGF0
ISAKQnV0IGNyYXNoaW5nIHRoZSBrZXJuZWwgaXMgcGVyaGFwcyBhIGJpdCBleGNlc3NpdmUhCgpB
dm9pZGluZyB0aGUgbW1hcCBvZiBIRUFQIG9iamVjdHMgZXZlcnl0aGluZyBydW5zIGZpbmUgLSBh
bmQgdGhlIG1lbW9yeSAKbGVha3MgYXJlIG11Y2ggc21hbGxlciB0aGFuIHRoZXkgdXNlZCB0byBi
ZSA6KQoKU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
