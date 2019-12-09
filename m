Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22697116E65
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091266E450;
	Mon,  9 Dec 2019 14:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5226E44D;
 Mon,  9 Dec 2019 14:00:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 05:59:59 -0800
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="206898784"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 05:59:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v3 09/12] HID: picoLCD: constify fb ops
In-Reply-To: <f415010cd52cce7d8a1250d4eca582ec64e67956.1575390741.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com>
 <f415010cd52cce7d8a1250d4eca582ec64e67956.1575390741.git.jani.nikula@intel.com>
Date: Mon, 09 Dec 2019 15:59:53 +0200
Message-ID: <87wob54n1i.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Jiri Kosina <jikos@kernel.org>,
 Bruno =?utf-8?Q?Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwMyBEZWMgMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4g
d3JvdGU6Cj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBj
b25zdCwgd2UgY2FuIHN0YXJ0Cj4gbWFraW5nIHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPgo+IHYy
OiBmaXgJdHlwbyAoQ2hyaXN0b3BoZSBkZSBEaW5lY2hpbikKPgo+IENjOiBCcnVubyBQcsOpbW9u
dCA8Ym9uYm9uc0BsaW51eC12c2VydmVyLm9yZz4KPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJu
ZWwub3JnCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gQWNrZWQtYnk6IEJydW5vIFByw6ltb250IDxib25ib25zQGxpbnV4LXZzZXJ2ZXIub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgpQ
dXNoZWQgdG8gZHJtLW1pc2MtbmV4dCwgd2l0aCBKaXJpJ3MgYWNrIGZyb20gdGhlIG90aGVyIHRo
cmVhZCBbMV0sCnRoYW5rcyBmb3IgdGhlIHJldmlld3MgYW5kIGFja3MuCgpCUiwKSmFuaS4KClsx
XSBodHRwOi8vbG9yZS5rZXJuZWwub3JnL3IvbnljdmFyLllGSC43Ljc2LjE5MTIwODAxMDYyNjAu
NDYwM0BjYm9iay5maGZyLnBtCgoKPiAtLS0KPiAgZHJpdmVycy9oaWQvaGlkLXBpY29sY2RfZmIu
YyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtcGljb2xjZF9mYi5jIGIvZHJpdmVy
cy9oaWQvaGlkLXBpY29sY2RfZmIuYwo+IGluZGV4IGUxNjJhNjY4ZmI3ZS4uYTU0OWM0MmU4Yzkw
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaGlkL2hpZC1waWNvbGNkX2ZiLmMKPiArKysgYi9kcml2
ZXJzL2hpZC9oaWQtcGljb2xjZF9mYi5jCj4gQEAgLTQxNyw4ICs0MTcsNyBAQCBzdGF0aWMgaW50
IHBpY29sY2Rfc2V0X3BhcihzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKPiAgCXJldHVybiAwOwo+ICB9
Cj4gIAo+IC0vKiBOb3RlIHRoaXMgY2FuJ3QgYmUgY29uc3QgYmVjYXVzZSBvZiBzdHJ1Y3QgZmJf
aW5mbyBkZWZpbml0aW9uICovCj4gLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIHBpY29sY2RmYl9vcHMg
PSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIHBpY29sY2RmYl9vcHMgPSB7Cj4gIAku
b3duZXIgICAgICAgID0gVEhJU19NT0RVTEUsCj4gIAkuZmJfZGVzdHJveSAgID0gcGljb2xjZF9m
Yl9kZXN0cm95LAo+ICAJLmZiX3JlYWQgICAgICA9IGZiX3N5c19yZWFkLAoKLS0gCkphbmkgTmlr
dWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
