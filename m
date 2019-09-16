Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD663B3E9A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 18:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569BC6E2C4;
	Mon, 16 Sep 2019 16:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1268E6E2C4;
 Mon, 16 Sep 2019 16:15:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31DA928;
 Mon, 16 Sep 2019 09:15:28 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50B6A3F67D;
 Mon, 16 Sep 2019 09:15:27 -0700 (PDT)
Subject: Re: [PATCH 08/11] drm/nouveau: tegra: Skip IOMMU initialization if
 already attached
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-9-thierry.reding@gmail.com>
 <156993ea-ece6-9eb5-b664-a55c631e2600@arm.com> <20190916155724.GG7488@ulmo>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ee285d4f-e5ff-e043-35cd-1338b1bb238f@arm.com>
Date: Mon, 16 Sep 2019 17:15:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190916155724.GG7488@ulmo>
Content-Language: en-GB
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDkvMjAxOSAxNjo1NywgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gT24gTW9uLCBTZXAg
MTYsIDIwMTkgYXQgMDQ6Mjk6MThQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+PiBIaSBU
aGllcnJ5LAo+Pgo+PiBPbiAxNi8wOS8yMDE5IDE2OjA0LCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
Pj4+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4+Pgo+Pj4gSWYg
dGhlIEdQVSBpcyBhbHJlYWR5IGF0dGFjaGVkIHRvIGFuIElPTU1VLCBkb24ndCBkZXRhY2ggaXQg
YW5kIHNldHVwIGFuCj4+PiBleHBsaWNpdCBJT01NVSBkb21haW4uIFNpbmNlIE5vdXZlYXUgY2Fu
IG5vdyBwcm9wZXJseSBoYW5kbGUgdGhlIGNhc2Ugb2YKPj4+IHRoZSBETUEgQVBJIGJlaW5nIGJh
Y2tlZCBieSBhbiBJT01NVSwganVzdCBjb250aW51ZSB1c2luZyB0aGUgRE1BIEFQSS4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+Pj4g
LS0tCj4+PiAgICAuLi4vZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgICAg
fCAxOSArKysrKysrLS0tLS0tLS0tLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYwo+Pj4gaW5kZXggZDBkNTJjMWQ0YWVl
Li5mYzY1MmFhYTQxYzcgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMKPj4+IEBAIC0yMywxMCArMjMsNiBAQAo+Pj4g
ICAgI2lmZGVmIENPTkZJR19OT1VWRUFVX1BMQVRGT1JNX0RSSVZFUgo+Pj4gICAgI2luY2x1ZGUg
InByaXYuaCIKPj4+IC0jaWYgSVNfRU5BQkxFRChDT05GSUdfQVJNX0RNQV9VU0VfSU9NTVUpCj4+
PiAtI2luY2x1ZGUgPGFzbS9kbWEtaW9tbXUuaD4KPj4+IC0jZW5kaWYKPj4+IC0KPj4+ICAgIHN0
YXRpYyBpbnQKPj4+ICAgIG52a21fZGV2aWNlX3RlZ3JhX3Bvd2VyX3VwKHN0cnVjdCBudmttX2Rl
dmljZV90ZWdyYSAqdGRldikKPj4+ICAgIHsKPj4+IEBAIC0xMDksMTQgKzEwNSwxMyBAQCBudmtt
X2RldmljZV90ZWdyYV9wcm9iZV9pb21tdShzdHJ1Y3QgbnZrbV9kZXZpY2VfdGVncmEgKnRkZXYp
Cj4+PiAgICAJdW5zaWduZWQgbG9uZyBwZ3NpemVfYml0bWFwOwo+Pj4gICAgCWludCByZXQ7Cj4+
PiAtI2lmIElTX0VOQUJMRUQoQ09ORklHX0FSTV9ETUFfVVNFX0lPTU1VKQo+Pj4gLQlpZiAoZGV2
LT5hcmNoZGF0YS5tYXBwaW5nKSB7Cj4+PiAtCQlzdHJ1Y3QgZG1hX2lvbW11X21hcHBpbmcgKm1h
cHBpbmcgPSB0b19kbWFfaW9tbXVfbWFwcGluZyhkZXYpOwo+Pj4gLQo+Pj4gLQkJYXJtX2lvbW11
X2RldGFjaF9kZXZpY2UoZGV2KTsKPj4+IC0JCWFybV9pb21tdV9yZWxlYXNlX21hcHBpbmcobWFw
cGluZyk7Cj4+PiAtCX0KPj4+IC0jZW5kaWYKPj4+ICsJLyoKPj4+ICsJICogU2tpcCBleHBsaWNp
dCBJT01NVSBpbml0aWFsaXphdGlvbiBpZiB0aGUgR1BVIGlzIGFscmVhZHkgYXR0YWNoZWQKPj4+
ICsJICogdG8gYW4gSU9NTVUgZG9tYWluLiBUaGlzIGNhbiBoYXBwZW4gaWYgdGhlIERNQSBBUEkg
aXMgYmFja2VkIGJ5IGFuCj4+PiArCSAqIElPTU1VLgo+Pj4gKwkgKi8KPj4+ICsJaWYgKGlvbW11
X2dldF9kb21haW5fZm9yX2RldihkZXYpKQo+Pj4gKwkJcmV0dXJuOwo+Pgo+PiBCZXdhcmUgb2Yg
ImlvbW11LnBhc3N0aHJvdWdoPTEiIC0geW91IGNvdWxkIGdldCBhIHZhbGlkIGRlZmF1bHQgZG9t
YWluIGhlcmUKPj4geWV0IHN0aWxsIGhhdmUgZGlyZWN0L1NXSU9UTEIgRE1BIG9wcy4gSSBndWVz
cyB5b3UgcHJvYmFibHkgd2FudCB0bwo+PiBkb3VibGUtY2hlY2sgdGhlIGRvbWFpbiB0eXBlIGFz
IHdlbGwuCj4gCj4gR29vZCBwb2ludC4gQW4gZWFybGllciB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2gg
aGFkIGFuIGFkZGl0aW9uYWwgY2hlY2sgZm9yCj4gSU9NTVVfRE9NQUlOX0RNQSwgYnV0IHRoZW4g
dGhhdCBmYWlsZWQgb24gMzItYml0IEFSTSBiZWNhdXNlIHRoZXJlIHRoZQo+IERNQSBBUEkgY2Fu
IGFsc28gdXNlIElPTU1VX0RPTUFJTl9VTk1BTkFHRUQgdHlwZSBkb21haW5zLiBDaGVja2luZyBm
b3IKPiBJT01NVV9ET01BSU5fSURFTlRJRlkgc2hvdWxkIGJlIHNhZmUsIHRob3VnaC4gVGhhdCBk
b2Vzbid0IHNlZW0gdG8KPiBhcHBlYXIgaW4gYXJjaC9hcm0sIGFyY2gvYXJtNjQgb3IgZHJpdmVy
cy9pb21tdS9kbWEtaW9tbXUuYy4KClJpZ2h0LCAiZG9tYWluICYmIGRvbWFpbi0+dHlwZSAhPSBJ
T01NVV9ET01BSU5fSURFTlRJVFkiIHNob3VsZCBiZSAKc3VmZmljaWVudCB0byBhbnN3ZXIgImlz
IHRoZSBETUEgbGF5ZXIgbWFuYWdpbmcgbXkgYWRkcmVzcyBzcGFjZSBmb3IgCm1lPyIgdW5sZXNz
IGFuZCB1bnRpbCBzb21lIG1hc3NpdmUgQVBJIGNoYW5nZSBoYXBwZW5zICh3aGljaCBJIGNlcnRh
aW5seSAKZG9uJ3QgZm9yZXNlZSkuCgpSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
