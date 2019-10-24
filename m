Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271AE31DC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080FC6E323;
	Thu, 24 Oct 2019 12:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9100B6E323;
 Thu, 24 Oct 2019 12:09:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 05:09:53 -0700
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; d="scan'208";a="192166779"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 05:09:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/property: Enforce more lifetime rules
In-Reply-To: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
Date: Thu, 24 Oct 2019 15:09:47 +0300
Message-ID: <87eez2cpkk.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rajat Jain <rajatja@google.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMyBPY3QgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4gd3JvdGU6Cj4gUHJvcGVydGllcyBjYW4ndCBiZSBhdHRhY2hlZCBhZnRlciByZWdpc3Rlcmlu
ZywgdXNlcnNwYWNlIHdvdWxkIGdldAo+IGNvbmZ1c2VkIChubyBvbmUgYm90aGVycyB0byByZXBy
b2JlIHJlYWxseSkuCj4KPiAtIEFkZCBrZXJuZWxkb2MKPiAtIEVuZm9yY2UgdGhpcyB3aXRoIHNv
bWUgY2hlY2tzLiBUaGlzIG5lZWRzIGEgc29tZXdoYXQgdWdseSBjaGVjawo+ICAgc2luY2UgY29u
bmVjdG9ycyBjYW4gYmUgYWRkZWQgbGF0ZXIgb24sIGJ1dCB3ZSBzdGlsbCBuZWVkIHRvIGF0dGFj
aAo+ICAgYWxsIHByb3BlcnRpZXMgYmVmb3JlIHRoZXkgZ28gcHVibGljLgo+Cj4gTm90ZSB0aGF0
IHdlIGFscmVhZHkgZW5mb3JjZSB0aGF0IHByb3BlcnRpZXMgdGhlbXNlbHZlcyBhcmUgY3JlYXRl
ZAo+IGJlZm9yZSB0aGUgZW50aXJlIGRldmljZSBpcyByZWdpc3RlcmVkLgo+Cj4gQ2M6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFJhamF0IEphaW4gPHJh
amF0amFAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX29iamVj
dC5jIHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmMKPiBpbmRleCA2YTIzZTM2ZWQ0ZmUuLjM1
YzI3MTk0MDdhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmMKPiBAQCAtMjI0LDEy
ICsyMjQsMjYgQEAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9vYmplY3RfZ2V0KTsKPiAgICogVGhp
cyBhdHRhY2hlcyB0aGUgZ2l2ZW4gcHJvcGVydHkgdG8gdGhlIG1vZGVzZXQgb2JqZWN0IHdpdGgg
dGhlIGdpdmVuIGluaXRpYWwKPiAgICogdmFsdWUuIEN1cnJlbnRseSB0aGlzIGZ1bmN0aW9uIGNh
bm5vdCBmYWlsIHNpbmNlIHRoZSBwcm9wZXJ0aWVzIGFyZSBzdG9yZWQgaW4KPiAgICogYSBzdGF0
aWNhbGx5IHNpemVkIGFycmF5Lgo+ICsgKgo+ICsgKiBOb3RlIHRoYXQgYWxsIHByb3BlcnRpZXMg
bXVzdCBiZSBhdHRhY2hlZCBiZWZvcmUgdGhlIG9iamVjdCBpdHNlbGYgaXMKPiArICogcmVnaXN0
ZXJlZCBhbmQgYWNjZXNzaWJsZSBmcm9tIHVzZXJzcGFjZS4KPiAgICovCj4gIHZvaWQgZHJtX29i
amVjdF9hdHRhY2hfcHJvcGVydHkoc3RydWN0IGRybV9tb2RlX29iamVjdCAqb2JqLAo+ICAJCQkJ
c3RydWN0IGRybV9wcm9wZXJ0eSAqcHJvcGVydHksCj4gIAkJCQl1aW50NjRfdCBpbml0X3ZhbCkK
PiAgewo+ICAJaW50IGNvdW50ID0gb2JqLT5wcm9wZXJ0aWVzLT5jb3VudDsKPiArCXN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBwcm9wZXJ0eS0+ZGV2Owo+ICsKPiArCgpTdXBlcmZsdW91cyBuZXds
aW5lLCB3aXRoIHRoYXQgZml4ZWQsCgpSZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4KCj4gKwlpZiAob2JqLT50eXBlID09IERSTV9NT0RFX09CSkVDVF9DT05O
RUNUT1IpIHsKPiArCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gb2JqX3RvX2Nv
bm5lY3RvcihvYmopOwo+ICsKPiArCQlXQVJOX09OKCFkZXYtPmRyaXZlci0+bG9hZCAmJgo+ICsJ
CQljb25uZWN0b3ItPnJlZ2lzdHJhdGlvbl9zdGF0ZSA9PSBEUk1fQ09OTkVDVE9SX1JFR0lTVEVS
RUQpOwo+ICsJfSBlbHNlIHsKPiArCQlXQVJOX09OKCFkZXYtPmRyaXZlci0+bG9hZCAmJiBkZXYt
PnJlZ2lzdGVyZWQpOwo+ICsJfQo+ICAKPiAgCWlmIChjb3VudCA9PSBEUk1fT0JKRUNUX01BWF9Q
Uk9QRVJUWSkgewo+ICAJCVdBUk4oMSwgIkZhaWxlZCB0byBhdHRhY2ggb2JqZWN0IHByb3BlcnR5
ICh0eXBlOiAweCV4KS4gUGxlYXNlICIKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3Vy
Y2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
