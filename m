Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F1A2E06C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 17:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27986E032;
	Wed, 29 May 2019 15:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E73D6E032;
 Wed, 29 May 2019 15:00:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 08:00:48 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 May 2019 08:00:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin King <colin.king@canonical.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/i915: fix uninitialized variable 'mask'
In-Reply-To: <20190529142927.16699-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190529142927.16699-1-colin.king@canonical.com>
Date: Wed, 29 May 2019 18:03:56 +0300
Message-ID: <87o93l480z.fsf@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOSBNYXkgMjAxOSwgQ29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
PiB3cm90ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
Pgo+Cj4gQ3VycmVudGx5IG1hc2sgaXMgbm90IGluaXRpYWxpemVkIGFuZCBzbyBkYXRhIGlzIGJl
aW5nIGJpdC13aXNlIG9yJ2QgaW50bwo+IGEgZ2FyYmFnZSB2YWx1ZS4gRml4IHRoaXMgYnkgaW5p
bnRpYWxpemluZyBtYXNrIHRvIHplcm8uCj4KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW5pbml0
aWFsaXplZCBzY2FsYXIgdmFyaWFibGUiKQo+IEZpeGVzOiAxYWMxNTllMjNjMmMgKCJkcm0vaTkx
NTogRXhwYW5kIHN1YnNsaWNlIG1hc2siKQoKVGhpcyB3YXMgYWxyZWFkeSByZXZlcnRlZCBmb3Ig
b3RoZXIgcmVhc29ucy4gTmVlZCB0byBiZSBmaXhlZCBvbiB0aGUKbmV4dCByb3VuZC4gRm9yIGZ1
dHVyZSByZWZlcmVuY2UsIHBsZWFzZSBDYzogYXV0aG9yIGFuZCByZXZpZXdlcnMgb2YgdGhlCnJl
ZmVyZW5jZWQgY29tbWl0LgoKQlIsCkphbmkuCgo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBL
aW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L2ludGVsX3NzZXUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfc3NldS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfc3NldS5jCj4g
aW5kZXggNzYzYjgxMWYyYzlkLi41YTg5NjcyZDk4YTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvaW50ZWxfc3NldS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfc3NldS5jCj4gQEAgLTQxLDcgKzQxLDcgQEAgdm9pZCBpbnRlbF9zc2V1X2NvcHlf
c3Vic2xpY2VzKGNvbnN0IHN0cnVjdCBzc2V1X2Rldl9pbmZvICpzc2V1LCBpbnQgc2xpY2UsCj4g
IHUzMiBpbnRlbF9zc2V1X2dldF9zdWJzbGljZXMoY29uc3Qgc3RydWN0IHNzZXVfZGV2X2luZm8g
KnNzZXUsIHU4IHNsaWNlKQo+ICB7Cj4gIAlpbnQgaSwgb2Zmc2V0ID0gc2xpY2UgKiBzc2V1LT5z
c19zdHJpZGU7Cj4gLQl1MzIgbWFzazsKPiArCXUzMiBtYXNrID0gMDsKPiAgCj4gIAlHRU1fQlVH
X09OKHNsaWNlID49IHNzZXUtPm1heF9zbGljZXMpOwoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBP
cGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
