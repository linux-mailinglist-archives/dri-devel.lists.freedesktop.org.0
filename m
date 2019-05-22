Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142032664F
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FEF89A59;
	Wed, 22 May 2019 14:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73A9899E8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 14:52:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 07:52:18 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2019 07:52:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gen Zhang <blackgod016574@gmail.com>, sean@poorly.run
Subject: Re: [PATCH] drm_edid-load: Fix a missing-check bug in
 drivers/gpu/drm/drm_edid_load.c
In-Reply-To: <20190522123920.GB6772@zhanggen-UX430UQ>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190522123920.GB6772@zhanggen-UX430UQ>
Date: Wed, 22 May 2019 17:55:35 +0300
Message-ID: <87o93u7d3s.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMiBNYXkgMjAxOSwgR2VuIFpoYW5nIDxibGFja2dvZDAxNjU3NEBnbWFpbC5jb20+
IHdyb3RlOgo+IEluIGRybV9sb2FkX2VkaWRfZmlybXdhcmUoKSwgZndzdHIgaXMgYWxsb2NhdGVk
IGJ5IGtzdHJkdXAoKS4gQW5kIGZ3c3RyCj4gaXMgZGVyZWZlcmVuY2VkIGluIHRoZSBmb2xsb3dp
bmcgY29kZXMuIEhvd2V2ZXIsIG1lbW9yeSBhbGxvY2F0aW9uIAo+IGZ1bmN0aW9ucyBzdWNoIGFz
IGtzdHJkdXAoKSBtYXkgZmFpbCBhbmQgcmV0dXJucyBOVUxMLiBEZXJlZmVyZW5jaW5nIAo+IHRo
aXMgbnVsbCBwb2ludGVyIG1heSBjYXVzZSB0aGUga2VybmVsIGdvIHdyb25nLiBUaHVzIHdlIHNo
b3VsZCBjaGVjayAKPiB0aGlzIGtzdHJkdXAoKSBvcGVyYXRpb24uCj4gRnVydGhlciwgaWYga3N0
cmR1cCgpIHJldHVybnMgTlVMTCwgd2Ugc2hvdWxkIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pIHRv
Cj4gdGhlIGNhbGxlciBzaXRlLgoKc3Ryc2VwKCkgaGFuZGxlcyB0aGUgTlVMTCBwb2ludGVyIGp1
c3QgZmluZSwgc28gdGhlcmUgd29uJ3QgYmUgYSBOVUxMCmRlcmVmZXJlbmNlLiBIb3dldmVyIHRo
aXMgcGF0Y2ggc2VlbXMgbGlrZSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gYW55d2F5LgoKUmV2aWV3
ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cgo+Cj4gU2lnbmVkLW9m
Zi1ieTogR2VuIFpoYW5nIDxibGFja2dvZDAxNjU3NEBnbWFpbC5jb20+Cj4KPiAtLS0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZF9sb2FkLmMKPiBpbmRleCBhNDkxNTA5Li5hMGUxMDdhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWRfbG9hZC5jCj4gQEAgLTI5MCw2ICsyOTAsOCBAQCBzdHJ1Y3QgZWRpZCAqZHJtX2xv
YWRfZWRpZF9maXJtd2FyZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAJICog
dGhlIGxhc3Qgb25lIGZvdW5kIG9uZSBhcyBhIGZhbGxiYWNrLgo+ICAJICovCj4gIAlmd3N0ciA9
IGtzdHJkdXAoZWRpZF9maXJtd2FyZSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIWZ3c3RyKQo+ICsJ
CXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+ICAJZWRpZHN0ciA9IGZ3c3RyOwo+ICAKPiAgCXdo
aWxlICgoZWRpZG5hbWUgPSBzdHJzZXAoJmVkaWRzdHIsICIsIikpKSB7Cj4gLS0tCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKSmFuaSBO
aWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
