Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E449C2C701
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 14:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38D26E204;
	Tue, 28 May 2019 12:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77316E204;
 Tue, 28 May 2019 12:51:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 05:51:37 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 28 May 2019 05:51:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 1/7] drm: make drm/drm_auth.h self contained
In-Reply-To: <20190526173535.32701-2-sam@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190526173535.32701-1-sam@ravnborg.org>
 <20190526173535.32701-2-sam@ravnborg.org>
Date: Tue, 28 May 2019 15:54:48 +0300
Message-ID: <87d0k268o7.fsf@intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyNiBNYXkgMjAxOSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90
ZToKPiBEbyBub3QgcmVxdWlyZSB1c2VycyBvZiBpbmNsdWRlL2RybS9kcm1fYXV0aC5oIHRvIGlu
Y2x1ZGUKPiBvdGhlciBmaWxlcyBqdXN0IHRvIGxldCBpdCBidWlsZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3Js
eS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fYXV0aC5o
IHwgMTEgKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYXV0aC5oIGIvaW5j
bHVkZS9kcm0vZHJtX2F1dGguaAo+IGluZGV4IDg3MTAwODExOGJhYi4uNmJmOGIyYjc4OTkxIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9hdXRoLmgKPiArKysgYi9pbmNsdWRlL2RybS9k
cm1fYXV0aC5oCj4gQEAgLTEsMyArMSw2IEBACj4gKyNpZm5kZWYgX0RSTV9BVVRIX0hfCj4gKyNk
ZWZpbmUgX0RSTV9BVVRIX0hfCj4gKwoKSXQncyBhIGJpdCBvZiBhIGJpa2VzaGVkIGFuZCB0aGlz
IGdvdCBhcHBsaWVkIGFscmVhZHksIGJ1dCBJIHRoaW5rIHRoZQpjb3B5cmlnaHQvbGljZW5zZSBj
b21tZW50IHNob3VsZCBiZSB0aGUgZmlyc3QgdGhpbmcgaW4gYW55IGZpbGUsIGFuZCB0aGUKaWZk
ZWZzIHNob3VsZCBjb21lIGFmdGVyIHRoYXQuIFVzaW5nIFNQRFggaGVhZGVycyBtYW5kYXRlIHRo
aXMgYW55d2F5LgoKQlIsCkphbmkuCgoKPiAgLyoKPiAgICogSW50ZXJuYWwgSGVhZGVyIGZvciB0
aGUgRGlyZWN0IFJlbmRlcmluZyBNYW5hZ2VyCj4gICAqCj4gQEAgLTI1LDggKzI4LDEyIEBACj4g
ICAqIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KPiAgICovCj4gIAo+IC0jaWZuZGVm
IF9EUk1fQVVUSF9IXwo+IC0jZGVmaW5lIF9EUk1fQVVUSF9IXwo+ICsjaW5jbHVkZSA8bGludXgv
aWRyLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rcmVmLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC93YWl0
Lmg+Cj4gKwo+ICtzdHJ1Y3QgZHJtX2ZpbGU7Cj4gK3N0cnVjdCBkcm1faHdfbG9jazsKPiAgCj4g
IC8qCj4gICAqIExlZ2FjeSBEUkkxIGxvY2tpbmcgZGF0YSBzdHJ1Y3R1cmUuIE9ubHkgaGVyZSBp
bnN0ZWFkIG9mIGluIGRybV9sZWdhY3kuaCBmb3IKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3Bl
biBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
