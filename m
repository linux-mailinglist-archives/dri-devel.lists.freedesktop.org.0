Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611E2E072
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 17:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B956E33F;
	Wed, 29 May 2019 15:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762E36E33C;
 Wed, 29 May 2019 15:01:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 08:01:26 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 May 2019 08:01:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin King <colin.king@canonical.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/i915: fix uninitialized variable 'subslice_mask'
In-Reply-To: <20190529144325.17235-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190529144325.17235-1-colin.king@canonical.com>
Date: Wed, 29 May 2019 18:04:35 +0300
Message-ID: <87lfyp47zw.fsf@intel.com>
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
Pgo+Cj4gQ3VycmVudGx5IHN1YnNsaWNlX21hc2sgaXMgbm90IGluaXRpYWxpemVkIGFuZCBzbyBk
YXRhIGlzIGJlaW5nCj4gYml0LXdpc2Ugb3InZCBpbnRvIGEgZ2FyYmFnZSB2YWx1ZS4gRml4IHRo
aXMgYnkgaW5pbnRpYWxpemluZwo+IHN1YnNsaWNlX21hc2sgdG8gemVyby4KPgo+IEFkZHJlc3Nl
cy1Db3Zlcml0eTogKCJVbmluaXRpYWxpemVkIHNjYWxhciB2YXJpYWJsZSIpCj4gRml4ZXM6IDFh
YzE1OWUyM2MyYyAoImRybS9pOTE1OiBFeHBhbmQgc3Vic2xpY2UgbWFzayIpCgpUaGlzIHdhcyBh
bHJlYWR5IHJldmVydGVkIGZvciBvdGhlciByZWFzb25zLiBOZWVkIHRvIGJlIGZpeGVkIG9uIHRo
ZQpuZXh0IHJvdW5kLiBGb3IgZnV0dXJlIHJlZmVyZW5jZSwgcGxlYXNlIENjOiBhdXRob3IgYW5k
IHJldmlld2VycyBvZiB0aGUKcmVmZXJlbmNlZCBjb21taXQuCgpCUiwKSmFuaS4KCgo+IFNpZ25l
ZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RldmljZV9pbmZvLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RldmljZV9pbmZvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9kZXZpY2VfaW5mby5jCj4gaW5kZXggMzYyNWY3NzdmM2EzLi5kMzk1
YTA5Yjk5NGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGV2aWNl
X2luZm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RldmljZV9pbmZvLmMK
PiBAQCAtMjk4LDcgKzI5OCw3IEBAIHN0YXRpYyB2b2lkIGNoZXJyeXZpZXdfc3NldV9pbmZvX2lu
aXQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQo+ICB7Cj4gIAlzdHJ1Y3Qgc3Nl
dV9kZXZfaW5mbyAqc3NldSA9ICZSVU5USU1FX0lORk8oZGV2X3ByaXYpLT5zc2V1Owo+ICAJdTMy
IGZ1c2U7Cj4gLQl1OCBzdWJzbGljZV9tYXNrOwo+ICsJdTggc3Vic2xpY2VfbWFzayA9IDA7Cj4g
IAo+ICAJZnVzZSA9IEk5MTVfUkVBRChDSFZfRlVTRV9HVCk7CgotLSAKSmFuaSBOaWt1bGEsIElu
dGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
