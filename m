Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302C47EF12
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3C26ED56;
	Fri,  2 Aug 2019 08:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Fri, 02 Aug 2019 08:20:39 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D016ED4D;
 Fri,  2 Aug 2019 08:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 9324AFB06;
 Fri,  2 Aug 2019 10:20:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGZ3zavp97Ex; Fri,  2 Aug 2019 10:20:37 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id D11E347246; Fri,  2 Aug 2019 10:20:36 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:20:36 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: remove unused function
 etnaviv_gem_mapping_reference
Message-ID: <20190802082036.GC6331@bogon.m.sigxcpu.org>
References: <20190705171536.26727-1-l.stach@pengutronix.de>
 <20190705171536.26727-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705171536.26727-2-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3OjE1OjM2UE0gKzAyMDAsIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+IEhhc24ndCBiZWVuIHVzZWQgZm9yIHF1aXRlIGEgd2hpbGUuIFRoZXJlIGlzIG5v
IHBvaW50IGluIGtlZXBpbmcKPiB1bnVzZWQgY29kZSBhcm91bmQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMgfCAxMiAtLS0tLS0tLS0tLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uaCB8ICAxIC0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMK
PiBpbmRleCA3MjdiYjNmNWNlYjIuLmUxOTlhNjgzM2ZmMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9nZW0uYwo+IEBAIC0yMzUsMTggKzIzNSw2IEBAIGV0bmF2aXZfZ2VtX2dl
dF92cmFtX21hcHBpbmcoc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqb2JqLAo+ICAJcmV0dXJu
IE5VTEw7Cj4gIH0KPiAgCj4gLXZvaWQgZXRuYXZpdl9nZW1fbWFwcGluZ19yZWZlcmVuY2Uoc3Ry
dWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICptYXBwaW5nKQo+IC17Cj4gLQlzdHJ1Y3QgZXRuYXZp
dl9nZW1fb2JqZWN0ICpldG5hdml2X29iaiA9IG1hcHBpbmctPm9iamVjdDsKPiAtCj4gLQlkcm1f
Z2VtX29iamVjdF9nZXQoJmV0bmF2aXZfb2JqLT5iYXNlKTsKPiAtCj4gLQltdXRleF9sb2NrKCZl
dG5hdml2X29iai0+bG9jayk7Cj4gLQlXQVJOX09OKG1hcHBpbmctPnVzZSA9PSAwKTsKPiAtCW1h
cHBpbmctPnVzZSArPSAxOwo+IC0JbXV0ZXhfdW5sb2NrKCZldG5hdml2X29iai0+bG9jayk7Cj4g
LX0KPiAtCj4gIHZvaWQgZXRuYXZpdl9nZW1fbWFwcGluZ191bnJlZmVyZW5jZShzdHJ1Y3QgZXRu
YXZpdl92cmFtX21hcHBpbmcgKm1hcHBpbmcpCj4gIHsKPiAgCXN0cnVjdCBldG5hdml2X2dlbV9v
YmplY3QgKmV0bmF2aXZfb2JqID0gbWFwcGluZy0+b2JqZWN0Owo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5oIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9nZW0uaAo+IGluZGV4IDc1M2M0NTg0OTdkMC4uZDdkOGE4MzVmMzc5IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5oCj4gQEAgLTEyMCw3ICsxMjAsNiBA
QCB2b2lkIGV0bmF2aXZfZ2VtX3B1dF9wYWdlcyhzdHJ1Y3QgZXRuYXZpdl9nZW1fb2JqZWN0ICpv
YmopOwo+ICAKPiAgc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICpldG5hdml2X2dlbV9tYXBw
aW5nX2dldCgKPiAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZXRuYXZpdl9n
cHUgKmdwdSk7Cj4gLXZvaWQgZXRuYXZpdl9nZW1fbWFwcGluZ19yZWZlcmVuY2Uoc3RydWN0IGV0
bmF2aXZfdnJhbV9tYXBwaW5nICptYXBwaW5nKTsKPiAgdm9pZCBldG5hdml2X2dlbV9tYXBwaW5n
X3VucmVmZXJlbmNlKHN0cnVjdCBldG5hdml2X3ZyYW1fbWFwcGluZyAqbWFwcGluZyk7Cj4gIAo+
ICAjZW5kaWYgLyogX19FVE5BVklWX0dFTV9IX18gKi8KClJldmlld2VkLWJ5OiBHdWlkbyBHw7xu
dGhlciA8YWd4QHNpZ3hjcHUub3JnPiAKY2hlZXJzLAogLS0gR3VpZG8KCj4gLS0gCj4gMi4yMC4x
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBl
dG5hdml2IG1haWxpbmcgbGlzdAo+IGV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
