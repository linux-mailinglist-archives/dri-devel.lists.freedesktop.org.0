Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90E1E6211
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589C96E53E;
	Thu, 28 May 2020 13:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42E0B6E536
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:23:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB5B6D6E;
 Thu, 28 May 2020 06:23:00 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80D8E3F52E;
 Thu, 28 May 2020 06:22:59 -0700 (PDT)
Subject: Re: [PATCH 09/15] drm/panfrost: dynamically alloc regulators
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-10-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <1988db9d-6340-1e36-d567-21b2164fbeb2@arm.com>
Date: Thu, 28 May 2020 14:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510165538.19720-10-peron.clem@gmail.com>
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDUvMjAyMCAxNzo1NSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IFdlIHdpbGwgbGF0
ZXIgaW50cm9kdWNlIHJlZ3VsYXRvcnMgbWFuYWdlZCBieSBPUFAuCj4gCj4gT25seSBhbGxvYyBy
ZWd1bGF0b3JzIHdoZW4gaXQncyBuZWVkZWQuIFRoaXMgYWxzbyBoZWxwIHVzZQo+IHRvIHJlbGVh
c2UgdGhlIHJlZ3VsYXRvcnMgb25seSB3aGVuIHRoZXkgYXJlIGFsbG9jYXRlZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgoKTEdUTToK
ClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyB8IDE0ICsrKysr
KysrKy0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgg
fCAgMyArLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4g
aW5kZXggZjQ4MDEyNzIwNWQ2Li42N2VlZGY2NGU4MmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gQEAgLTkwLDkgKzkwLDExIEBAIHN0YXRpYyBp
bnQgcGFuZnJvc3RfcmVndWxhdG9yX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYp
Cj4gICB7Cj4gICAJaW50IHJldCwgaTsKPiAgIAo+IC0JaWYgKFdBUk4ocGZkZXYtPmNvbXAtPm51
bV9zdXBwbGllcyA+IEFSUkFZX1NJWkUocGZkZXYtPnJlZ3VsYXRvcnMpLAo+IC0JCQkiVG9vIG1h
bnkgc3VwcGxpZXMgaW4gY29tcGF0aWJsZSBzdHJ1Y3R1cmUuXG4iKSkKPiAtCQlyZXR1cm4gLUVJ
TlZBTDsKPiArCXBmZGV2LT5yZWd1bGF0b3JzID0gZGV2bV9rY2FsbG9jKHBmZGV2LT5kZXYsIHBm
ZGV2LT5jb21wLT5udW1fc3VwcGxpZXMsCj4gKwkJCQkJIHNpemVvZigqcGZkZXYtPnJlZ3VsYXRv
cnMpLAo+ICsJCQkJCSBHRlBfS0VSTkVMKTsKPiArCWlmICghcGZkZXYtPnJlZ3VsYXRvcnMpCj4g
KwkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgcGZkZXYtPmNvbXAt
Pm51bV9zdXBwbGllczsgaSsrKQo+ICAgCQlwZmRldi0+cmVndWxhdG9yc1tpXS5zdXBwbHkgPSBw
ZmRldi0+Y29tcC0+c3VwcGx5X25hbWVzW2ldOwo+IEBAIC0xMTcsOCArMTE5LDEwIEBAIHN0YXRp
YyBpbnQgcGFuZnJvc3RfcmVndWxhdG9yX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZk
ZXYpCj4gICAKPiAgIHN0YXRpYyB2b2lkIHBhbmZyb3N0X3JlZ3VsYXRvcl9maW5pKHN0cnVjdCBw
YW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAgewo+IC0JcmVndWxhdG9yX2J1bGtfZGlzYWJsZShw
ZmRldi0+Y29tcC0+bnVtX3N1cHBsaWVzLAo+IC0JCQlwZmRldi0+cmVndWxhdG9ycyk7Cj4gKwlp
ZiAoIXBmZGV2LT5yZWd1bGF0b3JzKQo+ICsJCXJldHVybjsKPiArCj4gKwlyZWd1bGF0b3JfYnVs
a19kaXNhYmxlKHBmZGV2LT5jb21wLT5udW1fc3VwcGxpZXMsIHBmZGV2LT5yZWd1bGF0b3JzKTsK
PiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgcGFuZnJvc3RfcG1fZG9tYWluX2Zpbmkoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kZXZpY2UuaAo+IGluZGV4IDJlZmE1OWM5ZDFjNS4uOTUzZjc1MzZhNzczIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAo+IEBAIC0yMiw3ICsy
Miw2IEBAIHN0cnVjdCBwYW5mcm9zdF9qb2I7Cj4gICBzdHJ1Y3QgcGFuZnJvc3RfcGVyZmNudDsK
PiAgIAo+ICAgI2RlZmluZSBOVU1fSk9CX1NMT1RTIDMKPiAtI2RlZmluZSBNQVhfUkVHVUxBVE9S
UyAyCj4gICAjZGVmaW5lIE1BWF9QTV9ET01BSU5TIDMKPiAgIAo+ICAgc3RydWN0IHBhbmZyb3N0
X2ZlYXR1cmVzIHsKPiBAQCAtODEsNyArODAsNyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlIHsK
PiAgIAl2b2lkIF9faW9tZW0gKmlvbWVtOwo+ICAgCXN0cnVjdCBjbGsgKmNsb2NrOwo+ICAgCXN0
cnVjdCBjbGsgKmJ1c19jbG9jazsKPiAtCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhIHJlZ3Vs
YXRvcnNbTUFYX1JFR1VMQVRPUlNdOwo+ICsJc3RydWN0IHJlZ3VsYXRvcl9idWxrX2RhdGEgKnJl
Z3VsYXRvcnM7Cj4gICAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGM7Cj4gICAJLyogcG1fZG9t
YWlucyBmb3IgZGV2aWNlcyB3aXRoIG1vcmUgdGhhbiBvbmUuICovCj4gICAJc3RydWN0IGRldmlj
ZSAqcG1fZG9tYWluX2RldnNbTUFYX1BNX0RPTUFJTlNdOwo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
