Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FACA0304
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 15:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A25C89C6A;
	Wed, 28 Aug 2019 13:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1368E89C60
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 13:17:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C60AC28;
 Wed, 28 Aug 2019 06:17:32 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03EF23F246;
 Wed, 28 Aug 2019 06:17:31 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] drm/panfrost: Add cache/TLB flush before switching
 address space
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190826223317.28509-1-robh@kernel.org>
 <20190826223317.28509-7-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <30c345d6-ff44-4730-640e-13cca1e55689@arm.com>
Date: Wed, 28 Aug 2019 14:17:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826223317.28509-7-robh@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDgvMjAxOSAyMzozMywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gSXQncyBub3QgZW50aXJl
bHkgY2xlYXIgaWYgdGhpcyBpcyByZXF1aXJlZCwgYnV0IGFkZCBhIGZsdXNoIG9mIEdQVSBjYWNo
ZXMKPiBhbmQgVExCcyBiZWZvcmUgd2UgY2hhbmdlIGFuIGFkZHJlc3Mgc3BhY2UgdG8gbmV3IHBh
Z2UgdGFibGVzLgo+IAo+IEZpeGVzOiA3MjgyZjc2NDVkMDYgKCJkcm0vcGFuZnJvc3Q6IEltcGxl
bWVudCBwZXIgRkQgYWRkcmVzcyBzcGFjZXMiKQo+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZp
em9zb0Bjb2xsYWJvcmEuY29tPgo+IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0u
Y29tPgo+IENjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3Jh
LmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KCkVxdWFsbHkgSSdtIG5vdCBzdXJlIHRoaXMgaXMgcmVxdWlyZWQsIGJ1
dCBpdCBsb29rcyBsaWtlIHRoZXJlIG1pZ2h0IGJlCmEgcGF0aCB3aGVyZSBhIEFTIGlzIHJlY2xh
aW1lZCBhbmQgdGhlbiBpbW1lZGlhdGVseSBmcmVlZCAoY2xpZW50IGNsb3NlcwpmZCkgd2hpY2gg
d291bGQgbmVlZCBhIGZsdXNoICh3aXRoIHdhaXQpIHRvIGVuc3VyZSB0aGF0IHRyYW5zbGF0aW9u
cyBoYWQKZGVmaW5pdGVseSBmaW5pc2hlZC4gQW5kIGl0IHdvbid0IGRvIGFueSBoYXJtLCBzbzoK
ClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKU3RldmUK
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDIgKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IHYzOgo+ICAtIE5ldyBwYXRjaAo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiBpbmRleCAzNDA3YjAw
ZDBhM2EuLmQxZWJkZTMzMjdmZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfbW11LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfbW11LmMKPiBAQCAtMTE1LDYgKzExNSw4IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X21tdV9l
bmFibGUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIHN0cnVjdCBwYW5mcm9zdF9tCj4g
IAl1NjQgdHJhbnN0YWIgPSBjZmctPmFybV9tYWxpX2xwYWVfY2ZnLnRyYW5zdGFiOwo+ICAJdTY0
IG1lbWF0dHIgPSBjZmctPmFybV9tYWxpX2xwYWVfY2ZnLm1lbWF0dHI7Cj4gCj4gKwltbXVfaHdf
ZG9fb3BlcmF0aW9uX2xvY2tlZChwZmRldiwgYXNfbnIsIDAsIH4wVUwsIEFTX0NPTU1BTkRfRkxV
U0hfTUVNKTsKPiArCj4gIAltbXVfd3JpdGUocGZkZXYsIEFTX1RSQU5TVEFCX0xPKGFzX25yKSwg
dHJhbnN0YWIgJiAweGZmZmZmZmZmVUwpOwo+ICAJbW11X3dyaXRlKHBmZGV2LCBBU19UUkFOU1RB
Ql9ISShhc19uciksIHRyYW5zdGFiID4+IDMyKTsKPiAKPiAtLQo+IDIuMjAuMQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
