Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10918B3DAC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1216E9E6;
	Mon, 16 Sep 2019 15:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E4876E9E6;
 Mon, 16 Sep 2019 15:29:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 344BE28;
 Mon, 16 Sep 2019 08:29:21 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 470983F67D;
 Mon, 16 Sep 2019 08:29:20 -0700 (PDT)
Subject: Re: [PATCH 08/11] drm/nouveau: tegra: Skip IOMMU initialization if
 already attached
To: Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-9-thierry.reding@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <156993ea-ece6-9eb5-b664-a55c631e2600@arm.com>
Date: Mon, 16 Sep 2019 16:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190916150412.10025-9-thierry.reding@gmail.com>
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
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhpZXJyeSwKCk9uIDE2LzA5LzIwMTkgMTY6MDQsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+
IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gSWYgdGhlIEdQ
VSBpcyBhbHJlYWR5IGF0dGFjaGVkIHRvIGFuIElPTU1VLCBkb24ndCBkZXRhY2ggaXQgYW5kIHNl
dHVwIGFuCj4gZXhwbGljaXQgSU9NTVUgZG9tYWluLiBTaW5jZSBOb3V2ZWF1IGNhbiBub3cgcHJv
cGVybHkgaGFuZGxlIHRoZSBjYXNlIG9mCj4gdGhlIERNQSBBUEkgYmVpbmcgYmFja2VkIGJ5IGFu
IElPTU1VLCBqdXN0IGNvbnRpbnVlIHVzaW5nIHRoZSBETUEgQVBJLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gICAuLi4vZHJt
L25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgICAgfCAxOSArKysrKysrLS0tLS0t
LS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUv
ZGV2aWNlL3RlZ3JhLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZp
Y2UvdGVncmEuYwo+IGluZGV4IGQwZDUyYzFkNGFlZS4uZmM2NTJhYWE0MWM3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS90ZWdyYS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMK
PiBAQCAtMjMsMTAgKzIzLDYgQEAKPiAgICNpZmRlZiBDT05GSUdfTk9VVkVBVV9QTEFURk9STV9E
UklWRVIKPiAgICNpbmNsdWRlICJwcml2LmgiCj4gICAKPiAtI2lmIElTX0VOQUJMRUQoQ09ORklH
X0FSTV9ETUFfVVNFX0lPTU1VKQo+IC0jaW5jbHVkZSA8YXNtL2RtYS1pb21tdS5oPgo+IC0jZW5k
aWYKPiAtCj4gICBzdGF0aWMgaW50Cj4gICBudmttX2RldmljZV90ZWdyYV9wb3dlcl91cChzdHJ1
Y3QgbnZrbV9kZXZpY2VfdGVncmEgKnRkZXYpCj4gICB7Cj4gQEAgLTEwOSwxNCArMTA1LDEzIEBA
IG52a21fZGV2aWNlX3RlZ3JhX3Byb2JlX2lvbW11KHN0cnVjdCBudmttX2RldmljZV90ZWdyYSAq
dGRldikKPiAgIAl1bnNpZ25lZCBsb25nIHBnc2l6ZV9iaXRtYXA7Cj4gICAJaW50IHJldDsKPiAg
IAo+IC0jaWYgSVNfRU5BQkxFRChDT05GSUdfQVJNX0RNQV9VU0VfSU9NTVUpCj4gLQlpZiAoZGV2
LT5hcmNoZGF0YS5tYXBwaW5nKSB7Cj4gLQkJc3RydWN0IGRtYV9pb21tdV9tYXBwaW5nICptYXBw
aW5nID0gdG9fZG1hX2lvbW11X21hcHBpbmcoZGV2KTsKPiAtCj4gLQkJYXJtX2lvbW11X2RldGFj
aF9kZXZpY2UoZGV2KTsKPiAtCQlhcm1faW9tbXVfcmVsZWFzZV9tYXBwaW5nKG1hcHBpbmcpOwo+
IC0JfQo+IC0jZW5kaWYKPiArCS8qCj4gKwkgKiBTa2lwIGV4cGxpY2l0IElPTU1VIGluaXRpYWxp
emF0aW9uIGlmIHRoZSBHUFUgaXMgYWxyZWFkeSBhdHRhY2hlZAo+ICsJICogdG8gYW4gSU9NTVUg
ZG9tYWluLiBUaGlzIGNhbiBoYXBwZW4gaWYgdGhlIERNQSBBUEkgaXMgYmFja2VkIGJ5IGFuCj4g
KwkgKiBJT01NVS4KPiArCSAqLwo+ICsJaWYgKGlvbW11X2dldF9kb21haW5fZm9yX2RldihkZXYp
KQo+ICsJCXJldHVybjsKCkJld2FyZSBvZiAiaW9tbXUucGFzc3Rocm91Z2g9MSIgLSB5b3UgY291
bGQgZ2V0IGEgdmFsaWQgZGVmYXVsdCBkb21haW4gCmhlcmUgeWV0IHN0aWxsIGhhdmUgZGlyZWN0
L1NXSU9UTEIgRE1BIG9wcy4gSSBndWVzcyB5b3UgcHJvYmFibHkgd2FudCB0byAKZG91YmxlLWNo
ZWNrIHRoZSBkb21haW4gdHlwZSBhcyB3ZWxsLgoKUm9iaW4uCgo+ICAgCj4gICAJaWYgKCF0ZGV2
LT5mdW5jLT5pb21tdV9iaXQpCj4gICAJCXJldHVybjsKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
