Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF51C3029
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 11:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3A6E02D;
	Tue,  1 Oct 2019 09:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A32896E4;
 Tue,  1 Oct 2019 09:26:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 02:26:55 -0700
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="197806783"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 02:26:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/rect: Add drm_rect_translate_to()
In-Reply-To: <20190930134214.24702-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190930134214.24702-1-ville.syrjala@linux.intel.com>
Date: Tue, 01 Oct 2019 12:26:52 +0300
Message-ID: <87h84sdder.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAzMCBTZXAgMjAxOSwgVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+IHdyb3RlOgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+Cj4KPiBBZGQgYSBoZWxwZXIgdG8gdHJhbnNsYXRlIGEgcmVjdGFuZ2xl
IHRvIGFuIGFic29sdXRlIHBvc2l0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRoZSBzZXJpZXMgaXMKClJldmll
d2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKCgo+IC0tLQo+ICBp
bmNsdWRlL2RybS9kcm1fcmVjdC5oIHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcmVj
dC5oIGIvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaAo+IGluZGV4IDYxOTU4MjBhYTVjNS4uZmM3YzE0
NjI3ZWUyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9yZWN0LmgKPiArKysgYi9pbmNs
dWRlL2RybS9kcm1fcmVjdC5oCj4gQEAgLTEwNiw2ICsxMDYsMjAgQEAgc3RhdGljIGlubGluZSB2
b2lkIGRybV9yZWN0X3RyYW5zbGF0ZShzdHJ1Y3QgZHJtX3JlY3QgKnIsIGludCBkeCwgaW50IGR5
KQo+ICAJci0+eTIgKz0gZHk7Cj4gIH0KPiAgCj4gKy8qKgo+ICsgKiBkcm1fcmVjdF90cmFuc2xh
dGVfdG8gLSB0cmFuc2xhdGUgdGhlIHJlY3RhbmdsZSB0byBhbiBhYnNvbHV0ZSBwb3NpdGlvbgo+
ICsgKiBAcjogcmVjdGFuZ2xlIHRvIGJlIHRyYW5sYXRlZAo+ICsgKiBAeDogaG9yaXpvbnRhbCBw
b3NpdGlvbgo+ICsgKiBAeTogdmVydGljYWwgcG9zaXRpb24KPiArICoKPiArICogTW92ZSByZWN0
YW5nbGUgQHIgdG8gQHggaW4gdGhlIGhvcml6b250YWwgZGlyZWN0aW9uLAo+ICsgKiBhbmQgdG8g
QHkgaW4gdGhlIHZlcnRpY2FsIGRpcmVjdGlvbi4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBkcm1fcmVjdF90cmFuc2xhdGVfdG8oc3RydWN0IGRybV9yZWN0ICpyLCBpbnQgeCwgaW50IHkp
Cj4gK3sKPiArCWRybV9yZWN0X3RyYW5zbGF0ZShyLCB4IC0gci0+eDEsIHkgLSByLT55MSk7Cj4g
K30KPiArCj4gIC8qKgo+ICAgKiBkcm1fcmVjdF9kb3duc2NhbGUgLSBkb3duc2NhbGUgYSByZWN0
YW5nbGUKPiAgICogQHI6IHJlY3RhbmdsZSB0byBiZSBkb3duc2NhbGVkCgotLSAKSmFuaSBOaWt1
bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
