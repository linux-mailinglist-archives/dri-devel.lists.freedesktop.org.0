Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D9888AB9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 12:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D246E2AB;
	Sat, 10 Aug 2019 10:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8AE6E2AB;
 Sat, 10 Aug 2019 10:22:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17952097-1500050 for multiple; Sat, 10 Aug 2019 11:22:03 +0100
MIME-Version: 1.0
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809222643.23142-5-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <20190809222643.23142-5-matthew.auld@intel.com>
Message-ID: <156543252089.2301.17839055537113067772@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v3 04/37] drm/i915/region: support continuous allocations
Date: Sat, 10 Aug 2019 11:22:00 +0100
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMTktMDgtMDkgMjM6MjY6MTApCj4gU29tZSBvYmplY3Rz
IG1heSBuZWVkIHRvIGJlIGFsbG9jYXRlZCBhcyBhIGNvbnRpbnVvdXMgYmxvY2ssIHRoaW5raW5n
Cj4gYWhlYWQgdGhlIHZhcmlvdXMga2VybmVsIGlvX21hcHBpbmcgaW50ZXJmYWNlcyBzZWVtIHRv
IGV4cGVjdCBpdC4KCkJ1dCB3ZSBjb3VsZCBhbHdheXMgdXNlIHNjYXR0ZXJnYXRoZXIgb3ZlciB0
b3AuLi4KCj4gQEAgLTk4LDEwICsxMDEsMTIgQEAgaTkxNV9nZW1fb2JqZWN0X2dldF9wYWdlc19i
dWRkeShzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQo+ICB9Cj4gIAo+ICB2b2lkIGk5
MTVfZ2VtX29iamVjdF9pbml0X21lbW9yeV9yZWdpb24oc3RydWN0IGRybV9pOTE1X2dlbV9vYmpl
Y3QgKm9iaiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGludGVsX21lbW9yeV9yZWdpb24gKm1lbSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGludGVsX21lbW9yeV9yZWdpb24gKm1lbSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFncykKPiAgewo+
ICAgICAgICAgSU5JVF9MSVNUX0hFQUQoJm9iai0+bW0uYmxvY2tzKTsKPiAgICAgICAgIG9iai0+
bW0ucmVnaW9uPSBtZW07Cj4gKyAgICAgICBvYmotPmZsYWdzID0gZmxhZ3M7Cj4gIAo+ICAgICAg
ICAgbXV0ZXhfbG9jaygmbWVtLT5vYmpfbG9jayk7Cj4gICAgICAgICBsaXN0X2FkZCgmb2JqLT5t
bS5yZWdpb25fbGluaywgJm1lbS0+b2JqZWN0cyk7Cj4gQEAgLTEyNSw2ICsxMzAsOSBAQCBpOTE1
X2dlbV9vYmplY3RfY3JlYXRlX3JlZ2lvbihzdHJ1Y3QgaW50ZWxfbWVtb3J5X3JlZ2lvbiAqbWVt
LAo+ICAgICAgICAgaWYgKCFtZW0pCj4gICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1F
Tk9ERVYpOwo+ICAKPiArICAgICAgIGlmIChmbGFncyAmIH5JOTE1X0JPX0FMTE9DX0ZMQUdTKQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKClRoaXMgaXMgYSBwcm9n
cmFtbWVyIGVycm9yIG5vdCBhIHVzZXIuCgo+ICsKPiAgICAgICAgIHNpemUgPSByb3VuZF91cChz
aXplLCBtZW0tPm1pbl9wYWdlX3NpemUpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
