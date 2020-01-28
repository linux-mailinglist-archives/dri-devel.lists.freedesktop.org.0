Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7AD14C730
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDBC6F47F;
	Wed, 29 Jan 2020 08:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7AA6F3CF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 19:58:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 330A2293EA9
Message-ID: <f15ac21ab733e094fff4ed5f129a519113b75cc8.camel@collabora.com>
Subject: Re: [PATCH] drm: shrinker: Add a prefix on purging logs
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 28 Jan 2020 16:58:07 -0300
In-Reply-To: <20200122080413.GL43062@phenom.ffwll.local>
References: <20191214162049.10997-1-ezequiel@collabora.com>
 <20200122080413.GL43062@phenom.ffwll.local>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Jan 2020 08:06:22 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTAxLTIyIGF0IDA5OjA0ICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIFNhdCwgRGVjIDE0LCAyMDE5IGF0IDAxOjIwOjQ5UE0gLTAzMDAsIEV6ZXF1aWVsIEdhcmNp
YSB3cm90ZToKPiA+IEl0J3Mgbm90IGVudGlyZWx5IG9idmlvdXMgd2h5IHRoZXNlIG1lc3NhZ2Vz
IGhhdmUKPiA+ICJpbmZvIiBzZXZlcml0eS4gSW4gYW55IGNhc2UsIGFkZCBhIHByb3BlciBkcml2
ZXIgcHJlZml4Cj4gPiB0byBnaXZlIHRoZSB1c2VyIGEgYml0IG9mIGNvbnRleHQgb2Ygd2hlcmUg
dGhleSBhcmUgY29taW5nIGZyb20uCj4gCj4gU28gdGhlIGk5MTUgb25lIG1ha2VzIHNvbWUgc2Vu
c2UsIGl0J3MgZm9yIG9vbS4gV2hpY2ggc2hvdWxkbid0IGhhcHBlbgo+IG9mdGVuLiBUaGVuIHBh
bmZyb3N0L21zbSBvbmVzIGFyZSBpbW8gZHViaW91cyBhbmQgc2hvdWxkIGJlIGNoYW5nZWQgdG8g
b25lCj4gb2YgdGhlIGRybSBkZWJ1ZyBvbmVzLiBMb29rcyBsaWtlIGNvcHlwYXN0YSBmYWlsLCB3
ZSBtaWdodCB3YW50IHRvIGNoYW5nZQo+IGFsbCBvZiB0aGVtIHRvIGRybSBkZWJ1Z2dpbmcgb25l
cyAod2VsbCBtYXliZSBrZWVwIHRoZSBpOTE1IG9uZSBhcyBhIGRybQo+IGluZm8gb3V0cHV0KS4K
ClNvdW5kcyBnb29kLiBJIGNhbiBzdWJtaXQgZm9sbG93IHVwIHBhdGNoZXMgZm9yIHRoYXQuCk1l
YW53aGlsZSwgdGhpcyBwYXRjaCBzZWVtcyBnb29kIHRvIGdvLCByaWdodD8KClRoYW5rcywKRXpl
cXVpZWwKCj4gLURhbmllbAo+IAo+ID4gU2lnbmVkLW9mZi1ieTogRXplcXVpZWwgR2FyY2lhIDxl
emVxdWllbEBjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX3Nocmlua2VyLmMgICAgIHwgMiArKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbV9zaHJpbmtlci5jICAgICAgICAgICB8IDIgKysKPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMgfCAyICsrCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaHJpbmtlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX3Nocmlua2VyLmMKPiA+IGluZGV4IDNhOTI2YTg3NTVjNi4uY2QwMzcyYTFk
OTM2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3No
cmlua2VyLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaHJp
bmtlci5jCj4gPiBAQCAtNCw2ICs0LDggQEAKPiA+ICAgKiBDb3B5cmlnaHQgwqkgMjAwOC0yMDE1
IEludGVsIENvcnBvcmF0aW9uCj4gPiAgICovCj4gPiAgCj4gPiArI2RlZmluZSBwcl9mbXQoZm10
KSBLQlVJTERfTU9ETkFNRSAiOiAiIGZtdAo+ID4gKwo+ID4gICNpbmNsdWRlIDxsaW51eC9vb20u
aD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4KPiA+ICAjaW5jbHVkZSA8bGludXgv
c2htZW1fZnMuaD4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1f
c2hyaW5rZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zaHJpbmtlci5jCj4gPiBp
bmRleCA3MjJkNjE2NjhhOTcuLjA2MjBkNDQxYTJjYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2dlbV9zaHJpbmtlci5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9nZW1fc2hyaW5rZXIuYwo+ID4gQEAgLTQsNiArNCw4IEBACj4gPiAgICogQXV0aG9y
OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gPiAgICovCj4gPiAgCj4gPiArI2Rl
ZmluZSBwcl9mbXQoZm10KSBLQlVJTERfTU9ETkFNRSAiOiAiIGZtdAo+ID4gKwo+ID4gICNpbmNs
dWRlICJtc21fZHJ2LmgiCj4gPiAgI2luY2x1ZGUgIm1zbV9nZW0uaCIKPiA+ICAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMKPiA+IGlu
ZGV4IDQ1OGYwZmE2ODExMS4uYjlkMGU4MjFjM2Y2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMKPiA+IEBAIC02LDYgKzYs
OCBAQAo+ID4gICAqIEF1dGhvcjogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+ID4g
ICAqLwo+ID4gIAo+ID4gKyNkZWZpbmUgcHJfZm10KGZtdCkgS0JVSUxEX01PRE5BTUUgIjogIiBm
bXQKPiA+ICsKPiA+ICAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgo+ID4gIAo+ID4gICNpbmNsdWRl
IDxkcm0vZHJtX2RldmljZS5oPgo+ID4gLS0gCj4gPiAyLjIyLjAKPiA+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
