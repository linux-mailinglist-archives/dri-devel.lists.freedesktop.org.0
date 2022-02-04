Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8804A9C98
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 17:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8811610EDDD;
	Fri,  4 Feb 2022 16:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BB310EDDD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 16:00:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 207B71F38F;
 Fri,  4 Feb 2022 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643990417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2M3BfZySCU3GhkOTg/qWB9negQk+U4Xuhd8ksmzvsyQ=;
 b=RWF8wAE6L9ydFCZaY5vKQn4h2s2cYS/5AOB5shlZVn5PByU5hPly8UB/YFdUljBSorr9iO
 Y8kosYrA1DJCMkpxmuu2ljsEqRxwnGEoMLA7m/2cb2JIL5eDIa0CiseVqhlYVn7ZVOr7Ai
 HSwUdV9khVJLJLHd9kHgB2megroPHgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643990417;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2M3BfZySCU3GhkOTg/qWB9negQk+U4Xuhd8ksmzvsyQ=;
 b=CAQluhTxJpv9o2O9L/ZGgyKGlXHGjyWOdAUl4eQ3JYMg4nAFaZ/2DyK4r9+Z0XnrYS9WJ6
 ojK7WjNRyRygvABw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D833613AE2;
 Fri,  4 Feb 2022 16:00:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yR7mM5BN/WFrOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Feb 2022 16:00:16 +0000
Message-ID: <22cf9951-dc85-18b1-94fb-8387f76a94ab@suse.de>
Date: Fri, 4 Feb 2022 17:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add
 drm_fb_{xrgb8888,gray8}_to_mono_reversed()
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
In-Reply-To: <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uKvC4ebQRAJ1axQI7V0U11rO"
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
--------------uKvC4ebQRAJ1axQI7V0U11rO
Content-Type: multipart/mixed; boundary="------------Fyl6dR7v07pMrP2NZSYgcqjU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <22cf9951-dc85-18b1-94fb-8387f76a94ab@suse.de>
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add
 drm_fb_{xrgb8888,gray8}_to_mono_reversed()
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
In-Reply-To: <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>

--------------Fyl6dR7v07pMrP2NZSYgcqjU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpBbSAwNC4wMi4yMiB1bSAxNjo1MiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KWy4u
Ll0NCj4+ICsvKioNCj4+ICsgKiBkcm1fZmJfeHJnYjg4ODhfdG9fbW9ub19yZXZlcnNlZCAt
IENvbnZlcnQgWFJHQjg4ODggdG8gcmV2ZXJzZWQgDQo+PiBtb25vY2hyb21lDQo+PiArICog
QGRzdDogcmV2ZXJzZWQgbW9ub2Nocm9tZSBkZXN0aW5hdGlvbiBidWZmZXINCj4+ICsgKiBA
ZHN0X3BpdGNoOiBOdW1iZXIgb2YgYnl0ZXMgYmV0d2VlbiB0d28gY29uc2VjdXRpdmUgc2Nh
bmxpbmVzIA0KPj4gd2l0aGluIGRzdA0KPj4gKyAqIEBzcmM6IFhSR0I4ODg4IHNvdXJjZSBi
dWZmZXINCj4+ICsgKiBAZmI6IERSTSBmcmFtZWJ1ZmZlcg0KPj4gKyAqIEBjbGlwOiBDbGlw
IHJlY3RhbmdsZSBhcmVhIHRvIGNvcHkNCj4+ICsgKg0KPj4gKyAqIERSTSBkb2Vzbid0IGhh
dmUgbmF0aXZlIG1vbm9jaHJvbWUgc3VwcG9ydC4NCj4+ICsgKiBTdWNoIGRyaXZlcnMgY2Fu
IGFubm91bmNlIHRoZSBjb21tb25seSBzdXBwb3J0ZWQgWFIyNCBmb3JtYXQgdG8gDQo+PiB1
c2Vyc3BhY2UNCj4+ICsgKiBhbmQgdXNlIHRoaXMgZnVuY3Rpb24gdG8gY29udmVydCB0byB0
aGUgbmF0aXZlIGZvcm1hdC4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgZnVuY3Rpb24gdXNlcyBk
cm1fZmJfeHJnYjg4ODhfdG9fZ3JheTgoKSB0byBjb252ZXJ0IHRvIA0KPj4gZ3JheXNjYWxl
IGFuZA0KPj4gKyAqIHRoZW4gdGhlIHJlc3VsdCBpcyBjb252ZXJ0ZWQgZnJvbSBncmF5c2Nh
bGUgdG8gcmV2ZXJzZWQgbW9ub2hyb21lLg0KPj4gKyAqLw0KPj4gK3ZvaWQgZHJtX2ZiX3hy
Z2I4ODg4X3RvX21vbm9fcmV2ZXJzZWQodm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQgDQo+PiBk
c3RfcGl0Y2gsIGNvbnN0IHZvaWQgKnNyYywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIs
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0
IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCkNCj4+ICt7DQo+PiArwqDCoMKgIGlmIChXQVJOX09O
KGZiLT5mb3JtYXQtPmZvcm1hdCAhPSBEUk1fRk9STUFUX1hSR0I4ODg4KSkNCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm47DQo+PiArDQo+PiArwqDCoMKgIGlmICghZHN0X3BpdGNoKQ0K
Pj4gK8KgwqDCoMKgwqDCoMKgIGRzdF9waXRjaCA9IGRybV9yZWN0X3dpZHRoKGNsaXApOw0K
Pj4gKw0KPj4gK8KgwqDCoCBkcm1fZmJfeHJnYjg4ODhfdG9fZ3JheTgoZHN0LCBkc3RfcGl0
Y2gsIHNyYywgZmIsIGNsaXApOw0KPj4gK8KgwqDCoCBkcm1fZmJfZ3JheThfdG9fbW9ub19y
ZXZlcnNlZChkc3QsIGRzdF9waXRjaCwgZHN0LCBmYiwgY2xpcCk7DQo+IA0KPiBDb252ZXJ0
aW5nIGZyb20gZHN0IGludG8gZHN0IGNhbiBnaXZlIGluY29ycmVjdCByZXN1bHRzLiBBdCBz
b21lIHBvaW50IA0KPiB3ZSBwcm9iYWJseSB3YW50IHRvIGFkZCByZXN0cmljdCBxdWFsaWZp
ZXJzIHRvIHRoZXNlIHBvaW50ZXJzLCB0byBoZWxwIA0KPiB0aGUgY29tcGlsZXIgd2l0aCBv
cHRpbWl6aW5nLg0KPiANCj4gQSBiZXR0ZXIgYXBwcm9hY2ggaGVyZSBpcyB0byBwdWxsIHRo
ZSBwZXItbGluZSBjb252ZXJzaW9uIGZyb20gDQo+IGRybV9mYl94cmdiODg4OF90b19ncmF5
OCgpIGludG8gYSBzZXBhcmF0ZSBoZWxwZXIgYW5kIGltcGxlbWVudCBhIA0KPiBsaW5lLWJ5
LWxpbmUgY29udmVyc2lvbiBoZXJlLiBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPiANCj4gIMKg
IGRybV9mYl94cmdiODg4OF90b19tb25vX3JldmVyc2VkKCkNCj4gIMKgIHsNCj4gIMKgwqDC
oCBjaGFyICp0bXAgPSBrbWFsbG9jKHNpemUgb2YgYSBzaW5nbGUgbGluZSBvZiBncmF5OCkN
Cj4gDQo+ICDCoMKgwqAgZm9yIChoZWlndGgpIHsNCj4gIMKgwqDCoMKgwqDCoCBkcm1fZmJf
eHJnYjg4ODhfdG9fZ3JheThfbGluZSh0bXAsIC4uLiwgc3JjLCAuLi4pOw0KPiAgwqDCoMKg
wqDCoMKgIGRybV9mYl9ncmF5OF90b19tb25vX3JldmVyc2VkKGRzdCwgLi4uLCB0bXAsIC4u
Lik7DQoNCkhlcmUsIEkgbWVhbnQgJ2RybV9mYl9ncmF5OF90b19tb25vX3JldmVyc2VkX2xp
bmUoKScNCg0KPiANCj4gIMKgwqDCoMKgwqDCoCBzcmMgKz0gZmItPnBpdGNoZXNbMF0NCj4g
IMKgwqDCoMKgwqDCoCBkc3QgKz0gZHN0X3BpdGNoOw0KPiAgwqDCoMKgIH0NCj4gDQo+ICDC
oMKgwqAga2ZyZWUodG1wKTsNCj4gIMKgIH0NCg0KVG8gZWxhYm9yYXRlLCB0aGlzIGlzIGFu
IGV4YW1wbGUgb2Ygd2hhdCBJIG1lYW50IGJ5IGNvbXBvc2FibGUuIEluIHRoZSANCmZ1dHVy
ZSwgd2UgY2FuIGdlbmVyYWxpemUgdGhpcyBmdW5jdGlvbiBhbmQgaGFuZC1pbiAyIGZ1bmN0
aW9uIHBvaW50ZXJzIA0KdGhlIGRvIHRoZSBjb252ZXJzaW9uIHdpdGggdG1wIGFzIGludGVy
bWVkaWF0ZSBidWZmZXIuIFRoYXQgd291bGQgd29yayANCmZvciBhbnkgY29tYmluYXRpb24g
b2YgZm9ybWF0cyB0aGF0IGhhdmUgYSBjb21tb24gaW50ZXJtZWRpYXRlIGZvcm1hdC4NCg0K
PiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4+ICt9DQo+PiArRVhQT1JUX1NZ
TUJPTChkcm1fZmJfeHJnYjg4ODhfdG9fbW9ub19yZXZlcnNlZCk7DQo+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCANCj4+IGIvaW5jbHVkZS9kcm0v
ZHJtX2Zvcm1hdF9oZWxwZXIuaA0KPj4gaW5kZXggYjMwZWQ1ZGUwYTMzLi44NWU1NTFhNWNi
ZTYgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+
PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+PiBAQCAtNDMsNCAr
NDMsMTEgQEAgaW50IGRybV9mYl9ibGl0X3RvaW8odm9pZCBfX2lvbWVtICpkc3QsIHVuc2ln
bmVkIA0KPj4gaW50IGRzdF9waXRjaCwgdWludDMyX3QgZHN0X2Zvcg0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCB2b2lkICp2bWFwLCBjb25zdCBzdHJ1Y3QgZHJt
X2ZyYW1lYnVmZmVyICpmYiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
c3Qgc3RydWN0IGRybV9yZWN0ICpyZWN0KTsNCj4+ICt2b2lkIGRybV9mYl9ncmF5OF90b19t
b25vX3JldmVyc2VkKHZvaWQgKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwgDQo+PiBj
b25zdCB2b2lkICpzcmMsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCk7DQo+PiArDQo+PiArdm9pZCBkcm1f
ZmJfeHJnYjg4ODhfdG9fbW9ub19yZXZlcnNlZCh2b2lkICpkc3QsIHVuc2lnbmVkIGludCAN
Cj4+IGRzdF9waXRjaCwgY29uc3Qgdm9pZCAqc3JjLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4+ICsNCj4+IMKgICNlbmRpZiAvKiBf
X0xJTlVYX0RSTV9GT1JNQVRfSEVMUEVSX0ggKi8NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------Fyl6dR7v07pMrP2NZSYgcqjU--

--------------uKvC4ebQRAJ1axQI7V0U11rO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH9TZAFAwAAAAAACgkQlh/E3EQov+DD
EA//XW1T5dlPdP+FgnzNjCMeveK9sg+O/IhpF0REJ6TZu/ksWP8nElDjulwxrEl2mg2wdrRJiaD5
aT5fZ8oAUfbEu3KM+q1hEoQHVTCt4yDPHEReZHXC3xvMRGO4/8bNgCrTonvVnL1RjKIbqtJDy7C+
2IokNfG7CmPkDOjzPD6fegEOfw+XyDQd5lTo4APyBryCXDurlSf/GMsvFzvuRQ1BFdfHspxcqZSY
GtQJ2v4u5VfXiVyST/0/uWQ3HJJ3WQwnuLoEbVs+ugvq6A/TvgIe6pQz+PkL1yRKhpptn2siiMSI
UqMH+5e8hoiFltGG1tjSfJaep7X7xW/bNQxp+0M46o21OowKUEE+8nS3SoX497VZhj3j6XezZNZf
aI+LCyk60sVbCPHDW8IvYu/ziRco+W4yK137xME5T+/V07fFv6BqccpB6ZbrNah1NVjI9yDOXKcT
iMG+tYN4IkavtWraOmRpOryYnsxXTllfZWGRkMfjIJIUaeHaK34DacgHjpUl2txhpy0QFSmj2U4I
kgUbkL6ilDbeEmOos2zqRjhepGjarqvZxGa0aiaHlt9SaDW4GY/LA7obZtVtS8v1rVvoHT2T2WcA
/8DbTV/wqFa9aDuvOjvYwdT+EYO5Xy+cn+OLHlxVjaAEKdox36J2gt4AUE2aG7XCLfB+uNdCK77T
Xs8=
=yBos
-----END PGP SIGNATURE-----

--------------uKvC4ebQRAJ1axQI7V0U11rO--
