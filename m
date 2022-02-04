Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE714A9C49
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 16:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE59810EBD3;
	Fri,  4 Feb 2022 15:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9619710EBD3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 15:52:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D64041F382;
 Fri,  4 Feb 2022 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643989975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vUgYd4/d+/p6OH36Nj7N04clDus9+vNQS9D96mb7CBI=;
 b=Kg9Y1c88irAJBV1rKPvY/Ih0I9VkEFe/oNPNNgPBoltmkStWbFbsjjDLSm+eJNsIXseEpd
 QltpP4d5tPWAccXnQvAQW4lA1XQfZ9uul50BsXWtS7gdPdcZboL7r0IuD+ncNbBpVmbN/c
 /2TWQRHfKy9QPlKPOpBuS2c8d/W6+4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643989975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vUgYd4/d+/p6OH36Nj7N04clDus9+vNQS9D96mb7CBI=;
 b=vWZndw5T7meTpxAqi3qSKzjMsAdGtXlx/UpWr4Pqrx6yC192m4e3ytemmB7Piieihqq22Z
 AxzI6S4YCsdOhFCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90BC413B29;
 Fri,  4 Feb 2022 15:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 84dgItdL/WELNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Feb 2022 15:52:55 +0000
Message-ID: <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
Date: Fri, 4 Feb 2022 16:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add
 drm_fb_{xrgb8888,gray8}_to_mono_reversed()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220204134347.1187749-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cnRQyZpb1bvRM6Q8hsnbuR1K"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cnRQyZpb1bvRM6Q8hsnbuR1K
Content-Type: multipart/mixed; boundary="------------GzDANQ6HuGgccvj5HkcZZVu8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add
 drm_fb_{xrgb8888,gray8}_to_mono_reversed()
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
In-Reply-To: <20220204134347.1187749-2-javierm@redhat.com>

--------------GzDANQ6HuGgccvj5HkcZZVu8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDIuMjIgdW0gMTQ6NDMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEFkZCBzdXBwb3J0IHRvIGNvbnZlcnQgWFIyNCBhbmQgOC1iaXQgZ3JheXNj
YWxlIHRvIHJldmVyc2VkIG1vbm9jaHJvbWUgZm9yDQo+IGRyaXZlcnMgdGhhdCBjb250cm9s
IG1vbm9jaHJvbWF0aWMgcGFuZWxzLCB0aGF0IG9ubHkgaGF2ZSAxIGJpdCBwZXIgcGl4ZWwu
DQo+IA0KPiBUaGUgZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWQoKSBoZWxwZXIgd2Fz
IGJhc2VkIG9uIHRoZSBmdW5jdGlvbiB0aGF0DQo+IGRvZXMgdGhlIHNhbWUgaW4gdGhlIGRy
aXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYyBkcml2ZXIuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4g
LS0tDQo+IA0KPiAobm8gY2hhbmdlcyBzaW5jZSB2MSkNCj4gDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggICAgIHwgIDcgKysr
DQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiBpbmRleCAwZjI4ZGQyYmRkNzIuLmNkY2U0
YjdjMjVkOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMNCj4g
QEAgLTU4NCwzICs1ODQsODMgQEAgaW50IGRybV9mYl9ibGl0X3RvaW8odm9pZCBfX2lvbWVt
ICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIHVpbnQzMl90IGRzdF9mb3INCj4gICAJ
cmV0dXJuIC1FSU5WQUw7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2ZiX2JsaXRf
dG9pbyk7DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGRybV9mYl9ncmF5OF90b19tb25vX3JldmVy
c2VkX2xpbmUodTggKmRzdCwgY29uc3QgdTggKnNyYywgc2l6ZV90IHBpeGVscykNCj4gK3sN
Cj4gKwl1bnNpZ25lZCBpbnQgeGIsIGk7DQo+ICsNCj4gKwlmb3IgKHhiID0gMDsgeGIgPCBw
aXhlbHMgLyA4OyB4YisrKSB7DQoNCkluIHByYWN0aWNlLCBhbGwgbW9kZSB3aWR0aHMgYXJl
IG11bHRpcGxlcyBvZiA4IGJlY2F1c2UgVkdBIG1hbmRhdGVkIGl0LiANClNvIGl0J3Mgb2st
aXNoIHRvIGFzc3VtZSB0aGlzIGhlcmUuIFlvdSBzaG91bGQgcHJvYmFibHkgYXQgbGVhc3Qg
cHJpbnQgYSANCndhcm5pbmcgc29tZXdoZXJlIGlmIChwaXhlbHMgJSA4ICE9IDApDQoNCg0K
PiArCQl1OCBieXRlID0gMHgwMDsNCj4gKw0KPiArCQlmb3IgKGkgPSAwOyBpIDwgODsgaSsr
KSB7DQo+ICsJCQlpbnQgeCA9IHhiICogOCArIGk7DQo+ICsNCj4gKwkJCWJ5dGUgPj49IDE7
DQo+ICsJCQlpZiAoc3JjW3hdID4+IDcpDQo+ICsJCQkJYnl0ZSB8PSBCSVQoNyk7DQo+ICsJ
CX0NCj4gKwkJKmRzdCsrID0gYnl0ZTsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiAr
ICogZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWQgLSBDb252ZXJ0IGdyYXlzY2FsZSB0
byByZXZlcnNlZCBtb25vY2hyb21lDQo+ICsgKiBAZHN0OiByZXZlcnNlZCBtb25vY2hyb21l
IGRlc3RpbmF0aW9uIGJ1ZmZlcg0KPiArICogQGRzdF9waXRjaDogTnVtYmVyIG9mIGJ5dGVz
IGJldHdlZW4gdHdvIGNvbnNlY3V0aXZlIHNjYW5saW5lcyB3aXRoaW4gZHN0DQo+ICsgKiBA
c3JjOiA4LWJpdCBncmF5c2NhbGUgc291cmNlIGJ1ZmZlcg0KPiArICogQGNsaXA6IENsaXAg
cmVjdGFuZ2xlIGFyZWEgdG8gY29weQ0KPiArICoNCj4gKyAqIERSTSBkb2Vzbid0IGhhdmUg
bmF0aXZlIG1vbm9jaHJvbWUgb3IgZ3JheXNjYWxlIHN1cHBvcnQuDQo+ICsgKiBTdWNoIGRy
aXZlcnMgY2FuIGFubm91bmNlIHRoZSBjb21tb25seSBzdXBwb3J0ZWQgWFIyNCBmb3JtYXQg
dG8gdXNlcnNwYWNlDQo+ICsgKiBhbmQgdXNlIGRybV9mYl94cmdiODg4OF90b19ncmF5OCgp
IHRvIGNvbnZlcnQgdG8gZ3JheXNjYWxlIGFuZCB0aGVuIHRoaXMNCj4gKyAqIGhlbHBlciBm
dW5jdGlvbiB0byBjb252ZXJ0IHRvIHRoZSBuYXRpdmUgZm9ybWF0Lg0KPiArICovDQo+ICt2
b2lkIGRybV9mYl9ncmF5OF90b19tb25vX3JldmVyc2VkKHZvaWQgKmRzdCwgdW5zaWduZWQg
aW50IGRzdF9waXRjaCwgY29uc3Qgdm9pZCAqc3JjLA0KPiArCQkJCSAgIGNvbnN0IHN0cnVj
dCBkcm1fcmVjdCAqY2xpcCkNCg0KVGhlcmUncyBhIGJ1ZyBoZXJlLiBZb3Ugd2FudCB0byBw
YXNzIGluIGEgZHJtX2ZyYW1lYnVmZmVyIGFzIGZvdXJ0aCANCmFyZ3VtZW50Lg0KDQo+ICt7
DQo+ICsNCj4gKwlzaXplX3QgaGVpZ2h0ID0gZHJtX3JlY3RfaGVpZ2h0KGNsaXApOw0KPiAr
CXNpemVfdCB3aWR0aCA9IGRybV9yZWN0X3dpZHRoKGNsaXApOw0KPiArCXVuc2lnbmVkIGlu
dCB5Ow0KPiArCWNvbnN0IHU4ICpncmF5OCA9IHNyYzsNCj4gKwl1OCAqbW9ubyA9IGRzdDsN
Cj4gKw0KPiArCWlmICghZHN0X3BpdGNoKQ0KPiArCQlkc3RfcGl0Y2ggPSB3aWR0aDsNCg0K
VGhlIGRzdF9waXRjaCBpcyBnaXZlbiBpbiBieXRlcy4gWW91IGhhdmUgdG8gZGV2aWNlIGJ5
IDguIEhlcmUgd291bGQgYmUgDQphIGdvb2QgcGxhY2UgdG8gd2FybiBpZiAod2lkdGggJSA4
ICE9IDApLg0KDQo+ICsNCj4gKwlmb3IgKHkgPSAwOyB5IDwgaGVpZ2h0OyB5KyspIHsNCj4g
KwkJZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJzZWRfbGluZShtb25vLCBncmF5OCwgZHN0
X3BpdGNoKTsNCj4gKwkJbW9ubyArPSAoZHN0X3BpdGNoIC8gOCk7DQoNClRoZSBkc3RfcGl0
Y2ggaXMgYWxyZWFkeSBnaXZlbiBpbiBieXRlcy4NCg0KPiArCQlncmF5OCArPSBkc3RfcGl0
Y2g7DQoNCidncmF5OCArPSBmYi0+cGl0Y2hlc1swXScgd291bGQgYmUgY29ycmVjdC4NCg0K
PiArCX0NCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBkcm1fZmJfeHJnYjg4ODhfdG9fbW9u
b19yZXZlcnNlZCAtIENvbnZlcnQgWFJHQjg4ODggdG8gcmV2ZXJzZWQgbW9ub2Nocm9tZQ0K
PiArICogQGRzdDogcmV2ZXJzZWQgbW9ub2Nocm9tZSBkZXN0aW5hdGlvbiBidWZmZXINCj4g
KyAqIEBkc3RfcGl0Y2g6IE51bWJlciBvZiBieXRlcyBiZXR3ZWVuIHR3byBjb25zZWN1dGl2
ZSBzY2FubGluZXMgd2l0aGluIGRzdA0KPiArICogQHNyYzogWFJHQjg4ODggc291cmNlIGJ1
ZmZlcg0KPiArICogQGZiOiBEUk0gZnJhbWVidWZmZXINCj4gKyAqIEBjbGlwOiBDbGlwIHJl
Y3RhbmdsZSBhcmVhIHRvIGNvcHkNCj4gKyAqDQo+ICsgKiBEUk0gZG9lc24ndCBoYXZlIG5h
dGl2ZSBtb25vY2hyb21lIHN1cHBvcnQuDQo+ICsgKiBTdWNoIGRyaXZlcnMgY2FuIGFubm91
bmNlIHRoZSBjb21tb25seSBzdXBwb3J0ZWQgWFIyNCBmb3JtYXQgdG8gdXNlcnNwYWNlDQo+
ICsgKiBhbmQgdXNlIHRoaXMgZnVuY3Rpb24gdG8gY29udmVydCB0byB0aGUgbmF0aXZlIGZv
cm1hdC4NCj4gKyAqDQo+ICsgKiBUaGlzIGZ1bmN0aW9uIHVzZXMgZHJtX2ZiX3hyZ2I4ODg4
X3RvX2dyYXk4KCkgdG8gY29udmVydCB0byBncmF5c2NhbGUgYW5kDQo+ICsgKiB0aGVuIHRo
ZSByZXN1bHQgaXMgY29udmVydGVkIGZyb20gZ3JheXNjYWxlIHRvIHJldmVyc2VkIG1vbm9o
cm9tZS4NCj4gKyAqLw0KPiArdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fbW9ub19yZXZlcnNl
ZCh2b2lkICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIGNvbnN0IHZvaWQgKnNyYywN
Cj4gKwkJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJ
CQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApDQo+ICt7DQo+ICsJaWYgKFdB
Uk5fT04oZmItPmZvcm1hdC0+Zm9ybWF0ICE9IERSTV9GT1JNQVRfWFJHQjg4ODgpKQ0KPiAr
CQlyZXR1cm47DQo+ICsNCj4gKwlpZiAoIWRzdF9waXRjaCkNCj4gKwkJZHN0X3BpdGNoID0g
ZHJtX3JlY3Rfd2lkdGgoY2xpcCk7DQo+ICsNCj4gKwlkcm1fZmJfeHJnYjg4ODhfdG9fZ3Jh
eTgoZHN0LCBkc3RfcGl0Y2gsIHNyYywgZmIsIGNsaXApOw0KPiArCWRybV9mYl9ncmF5OF90
b19tb25vX3JldmVyc2VkKGRzdCwgZHN0X3BpdGNoLCBkc3QsIGZiLCBjbGlwKTsNCg0KQ29u
dmVydGluZyBmcm9tIGRzdCBpbnRvIGRzdCBjYW4gZ2l2ZSBpbmNvcnJlY3QgcmVzdWx0cy4g
QXQgc29tZSBwb2ludCANCndlIHByb2JhYmx5IHdhbnQgdG8gYWRkIHJlc3RyaWN0IHF1YWxp
ZmllcnMgdG8gdGhlc2UgcG9pbnRlcnMsIHRvIGhlbHAgDQp0aGUgY29tcGlsZXIgd2l0aCBv
cHRpbWl6aW5nLg0KDQpBIGJldHRlciBhcHByb2FjaCBoZXJlIGlzIHRvIHB1bGwgdGhlIHBl
ci1saW5lIGNvbnZlcnNpb24gZnJvbSANCmRybV9mYl94cmdiODg4OF90b19ncmF5OCgpIGlu
dG8gYSBzZXBhcmF0ZSBoZWxwZXIgYW5kIGltcGxlbWVudCBhIA0KbGluZS1ieS1saW5lIGNv
bnZlcnNpb24gaGVyZS4gc29tZXRoaW5nIGxpa2UgdGhpczoNCg0KICAgZHJtX2ZiX3hyZ2I4
ODg4X3RvX21vbm9fcmV2ZXJzZWQoKQ0KICAgew0KICAgICBjaGFyICp0bXAgPSBrbWFsbG9j
KHNpemUgb2YgYSBzaW5nbGUgbGluZSBvZiBncmF5OCkNCg0KICAgICBmb3IgKGhlaWd0aCkg
ew0KICAgICAgICBkcm1fZmJfeHJnYjg4ODhfdG9fZ3JheThfbGluZSh0bXAsIC4uLiwgc3Jj
LCAuLi4pOw0KICAgICAgICBkcm1fZmJfZ3JheThfdG9fbW9ub19yZXZlcnNlZChkc3QsIC4u
LiwgdG1wLCAuLi4pOw0KDQogICAgICAgIHNyYyArPSBmYi0+cGl0Y2hlc1swXQ0KICAgICAg
ICBkc3QgKz0gZHN0X3BpdGNoOw0KICAgICB9DQoNCiAgICAga2ZyZWUodG1wKTsNCiAgIH0N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1f
ZmJfeHJnYjg4ODhfdG9fbW9ub19yZXZlcnNlZCk7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fZm9ybWF0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxw
ZXIuaA0KPiBpbmRleCBiMzBlZDVkZTBhMzMuLjg1ZTU1MWE1Y2JlNiAxMDA2NDQNCj4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+IEBAIC00Myw0ICs0MywxMSBAQCBpbnQgZHJtX2Zi
X2JsaXRfdG9pbyh2b2lkIF9faW9tZW0gKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwg
dWludDMyX3QgZHN0X2Zvcg0KPiAgIAkJICAgICBjb25zdCB2b2lkICp2bWFwLCBjb25zdCBz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gICAJCSAgICAgY29uc3Qgc3RydWN0IGRy
bV9yZWN0ICpyZWN0KTsNCj4gICANCj4gK3ZvaWQgZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2
ZXJzZWQodm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCBjb25zdCB2b2lkICpz
cmMsDQo+ICsJCQkJICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4gKw0KPiAr
dm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fbW9ub19yZXZlcnNlZCh2b2lkICpkc3QsIHVuc2ln
bmVkIGludCBkc3RfcGl0Y2gsIGNvbnN0IHZvaWQgKnNyYywNCj4gKwkJCQkgICAgICBjb25z
dCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCQkgICAgICBjb25zdCBzdHJ1
Y3QgZHJtX3JlY3QgKmNsaXApOw0KPiArDQo+ICAgI2VuZGlmIC8qIF9fTElOVVhfRFJNX0ZP
Uk1BVF9IRUxQRVJfSCAqLw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------GzDANQ6HuGgccvj5HkcZZVu8--

--------------cnRQyZpb1bvRM6Q8hsnbuR1K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH9S9cFAwAAAAAACgkQlh/E3EQov+Ct
Kw/+L/fX7QIUwPNkc5LLnT66GVChReTV+QwSFzr10TWoa6JbWi9bfz/RaleiVpCUUjtRPg1M/BHB
bsZYZy81aUEAHQL/C6zJ4TreC6dMMsqTE/tUBCGTep0ctzzV4ou4Rjf0iDxGvdH5peisTQ6ltMlt
MW2YIg7BkEcwoXjRPDYjbZBDwv7JKTDQboDZ42M8kcQwk73zULbncPCQVjm368pAL3CdTPzAU6Cv
MZMozHtfgrTW+s0oiSx6fvg11UCo5wDf3fH+GkBnWKwkYnfQ6Ztm0RWNZTzIEsa+8xXCkub3f0ln
aT+Fw6fH3RZy8F2/6yszqnOJmZHKfxtyOD5Y0XnMtGYtlsiKMxBOtrKxrTcGDwpJc9L5NY6QATB7
q9fJFod37BQ+m0pcqLsrYa1DnX7/u/brbjU5f9gt6ghrR3q1wZ1Fkt8NZ4Bqwo5bgAVVa9eXxU6R
kO62Ff1eBJ/KzgPR7ArXewBY6nz5EgOU54OhqX3eojFd3/q07TqeA86bvn/XS4guJf9zDE83TRKE
N3IgIPj3kCjqO1o+vfsZQT+a7gqnFY656E9BIHzpMWIrOpdOh5oCDutuB8F8H/hXag9Sx7af0ZSn
DIbpIqx5BDofw0/e6rD/EeWPIxkYcgoir5RWe5vjuGWl1zRtmtfHBKtZjWhFZKEJgL/e2cMNiTXG
5J4=
=L/jW
-----END PGP SIGNATURE-----

--------------cnRQyZpb1bvRM6Q8hsnbuR1K--
