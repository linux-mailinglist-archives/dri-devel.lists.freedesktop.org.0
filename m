Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFDC4A5988
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2057D10E8E8;
	Tue,  1 Feb 2022 09:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF5F10E8F2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:59:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E229A210FD;
 Tue,  1 Feb 2022 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643709584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AWVMTKwpBvNkP4x+vpwGKvTDQlGoJ5efseO1EXwFiYs=;
 b=wuNAVfqysCupPrBG9MnqT3pK7WYv6T1JS3UBkytso/oHyoURJFeoFgypkFpQT5jZI8obbu
 Fl7/Lg3wKWHcOFCWp8jNsEnRDL4Q56SzUZvKhjnCQUroNhqOlFwher3yElAuOBVgVxC7xh
 hNmxSwFka24pLWW1oO8s5Lx1Dj/zDEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643709584;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AWVMTKwpBvNkP4x+vpwGKvTDQlGoJ5efseO1EXwFiYs=;
 b=uJaaeJdby6mlwS8ODeaoTHbamXYQo1WUTGdkoLWLm42MSSfuK2/s/X8d+BSaKVPtQrYrJO
 CeBJOpKMhruvGJCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9ABE413D3C;
 Tue,  1 Feb 2022 09:59:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EMxLJJAE+WGFfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Feb 2022 09:59:44 +0000
Message-ID: <e52560f0-bd0c-b51b-af1b-bd4be2df8702@suse.de>
Date: Tue, 1 Feb 2022 10:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] drm/format-helper: Add drm_fb_gray8_to_mono_reversed()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-3-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220131201225.2324984-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qSy9ZyMQcR6YyrgAX3KXLO4R"
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qSy9ZyMQcR6YyrgAX3KXLO4R
Content-Type: multipart/mixed; boundary="------------et6SNU6Ma5wh3NwfKwTsjkTR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <e52560f0-bd0c-b51b-af1b-bd4be2df8702@suse.de>
Subject: Re: [PATCH 2/4] drm/format-helper: Add
 drm_fb_gray8_to_mono_reversed()
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-3-javierm@redhat.com>
In-Reply-To: <20220131201225.2324984-3-javierm@redhat.com>

--------------et6SNU6Ma5wh3NwfKwTsjkTR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzEuMDEuMjIgdW0gMjE6MTIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEFkZCBzdXBwb3J0IHRvIGNvbnZlcnQgOC1iaXQgZ3JheXNjYWxlIHRvIHJl
dmVyc2VkIG1vbm9jaHJvbWUgZm9yIGRyaXZlcnMNCj4gdGhhdCBjb250cm9sIG1vbm9jaHJv
bWF0aWMgZGlzcGxheXMsIHRoYXQgb25seSBoYXZlIDEgYml0IHBlciBwaXhlbCBkZXB0aC4N
Cj4gDQo+IFRoaXMgaGVscGVyIGZ1bmN0aW9uIHdhcyBiYXNlZCBvbiByZXBhcGVyX2dyYXk4
X3RvX21vbm9fcmV2ZXJzZWQoKSBmcm9tDQo+IHRoZSBkcml2ZXJzL2dwdS9kcm0vdGlueS9y
ZXBhcGVyLmMgZHJpdmVyLg0KDQpZb3UgY291bGQgY29udmVydCByZXBhcGVyIHRvIHRoZSBu
ZXcgaGVscGVyLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gLS0tDQo+IA0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gICBpbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oICAgICB8ICAyICsr
DQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiBpbmRleCAwZjI4ZGQyYmRkNzIuLmJmNDc3
YzEzNjA4MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMNCj4g
QEAgLTU4NCwzICs1ODQsMzggQEAgaW50IGRybV9mYl9ibGl0X3RvaW8odm9pZCBfX2lvbWVt
ICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIHVpbnQzMl90IGRzdF9mb3INCj4gICAJ
cmV0dXJuIC1FSU5WQUw7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2ZiX2JsaXRf
dG9pbyk7DQo+ICsNCj4gKy8qKg0KPiArICogZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJz
ZWQgLSBDb252ZXJ0IGdyYXlzY2FsZSB0byByZXZlcnNlZCBtb25vY2hyb21lDQo+ICsgKiBA
ZHN0OiByZXZlcnNlZCBtb25vY2hyb21lIGRlc3RpbmF0aW9uIGJ1ZmZlcg0KPiArICogQHNy
YzogOC1iaXQgZ3JheXNjYWxlIHNvdXJjZSBidWZmZXINCj4gKyAqIEBjbGlwOiBDbGlwIHJl
Y3RhbmdsZSBhcmVhIHRvIGNvcHkNCj4gKyAqDQo+ICsgKiBEUk0gZG9lc24ndCBoYXZlIG5h
dGl2ZSBtb25vY2hyb21lIG9yIGdyYXlzY2FsZSBzdXBwb3J0Lg0KPiArICogU3VjaCBkcml2
ZXJzIGNhbiBhbm5vdW5jZSB0aGUgY29tbW9ubHkgc3VwcG9ydGVkIFhSMjQgZm9ybWF0IHRv
IHVzZXJzcGFjZQ0KPiArICogYW5kIHVzZSBkcm1fZmJfeHJnYjg4ODhfdG9fZ3JheTgoKSB0
byBjb252ZXJ0IHRvIGdyYXlzY2FsZSBhbmQgdGhlbiB0aGlzDQo+ICsgKiBoZWxwZXIgZnVu
Y3Rpb24gdG8gY29udmVydCB0byB0aGUgbmF0aXZlIGZvcm1hdC4NCj4gKyAqLw0KPiArdm9p
ZCBkcm1fZmJfZ3JheThfdG9fbW9ub19yZXZlcnNlZCh2b2lkICpkc3QsIHZvaWQgKnNyYywg
Y29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KDQpJTUhPIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBoYXZlIGEgZnVuY3Rpb24gdGhhdCBjb252ZXJ0cyB4cmdiODg4OCB0byANCm1vbm8g
YW5kIGxldCBpdCBoYW5kbGUgdGhlIGludGVybWVkaWF0ZSBzdGVwIG9mIGdyYXk4Lg0KDQo+
ICt7DQo+ICsJc2l6ZV90IHdpZHRoID0gZHJtX3JlY3Rfd2lkdGgoY2xpcCk7DQo+ICsJc2l6
ZV90IGhlaWdodCA9IGRybV9yZWN0X3dpZHRoKGNsaXApOw0KPiArDQo+ICsJdTggKm1vbm8g
PSBkc3QsICpncmF5OCA9IHNyYzsNCj4gKwl1bnNpZ25lZCBpbnQgeSwgeGIsIGk7DQo+ICsN
Cj4gKwlmb3IgKHkgPSAwOyB5IDwgaGVpZ2h0OyB5KyspDQo+ICsJCWZvciAoeGIgPSAwOyB4
YiA8IHdpZHRoIC8gODsgeGIrKykgew0KDQpUaGUgaW5uZXIgbG9vcCBzaG91bGQgcHJvYmFi
bHkgZ28gaW50byBhIHNlcGFyYXRlIGhlbHBlciBmdW5jdGlvbi4gU2VlIA0KdGhlIGRybV9m
Yl8qX2xpbmUoKSBoZWxwZXJzIGluIHRoaXMgZmlsZQ0KDQpBdCBzb21lIHBvaW50LCB3ZSdz
IHdhbnQgdG8gaGF2ZSBhIHNpbmdsZSBibGl0IGhlbHBlciB0aGF0IHRha2VzIHNvdXJjZSAN
CmFuZCBkZXN0aW5hdGlvbiBmb3JtYXRzL2J1ZmZlcnMuIEl0IHdvdWxkIHRoZW4gcGljayB0
aGUgY29ycmVjdCBwZXItbGluZSANCmhlbHBlciBmb3IgdGhlIGNvbnZlcnNpb24uIFNvIHll
YWgsIHdlJ2Qgd2FudCBzb21ldGhpbmcgY29tcG9zYWJsZS4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiArCQkJdTggYnl0ZSA9IDB4MDA7DQo+ICsNCj4gKwkJCWZvciAoaSA9IDA7
IGkgPCA4OyBpKyspIHsNCj4gKwkJCQlpbnQgeCA9IHhiICogOCArIGk7DQo+ICsNCj4gKwkJ
CQlieXRlID4+PSAxOw0KPiArCQkJCWlmIChncmF5OFt5ICogd2lkdGggKyB4XSA+PiA3KQ0K
PiArCQkJCQlieXRlIHw9IEJJVCg3KTsNCj4gKwkJCX0NCj4gKwkJCSptb25vKysgPSBieXRl
Ow0KPiArCQl9DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9mYl9ncmF5OF90b19tb25v
X3JldmVyc2VkKTsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+IGluZGV4IGIzMGVk
NWRlMGEzMy4uY2Q0YzhiN2M3OGRlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1f
Zm9ybWF0X2hlbHBlci5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVy
LmgNCj4gQEAgLTQzLDQgKzQzLDYgQEAgaW50IGRybV9mYl9ibGl0X3RvaW8odm9pZCBfX2lv
bWVtICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIHVpbnQzMl90IGRzdF9mb3INCj4g
ICAJCSAgICAgY29uc3Qgdm9pZCAqdm1hcCwgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsDQo+ICAgCQkgICAgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqcmVjdCk7DQo+ICAg
DQo+ICt2b2lkIGRybV9mYl9ncmF5OF90b19tb25vX3JldmVyc2VkKHZvaWQgKmRzdCwgdm9p
ZCAqdmFkZHIsIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCk7DQo+ICsNCj4gICAjZW5k
aWYgLyogX19MSU5VWF9EUk1fRk9STUFUX0hFTFBFUl9IICovDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------et6SNU6Ma5wh3NwfKwTsjkTR--

--------------qSy9ZyMQcR6YyrgAX3KXLO4R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH5BJAFAwAAAAAACgkQlh/E3EQov+Al
GA//aZsOpU/IbLLjxohUzQKhSfvxVAfcI4beI+X4ExNEGJpT7/PD9x8pEwdc1f8xe3ckErt0c3hE
HX8CXRo3g9QHvSqZDUjghqKFK2yrZwWa2pFhHsNBs6/ceqsyueOX7Z9yrs+Pw/UNWD9mj9jdV0m5
fkNgMDijSfEcfPrZLstkniYkRQH5vT7en1gYwZDmwCrKG1F2Dwhhwa9g902OMAJYcdkCuxIHwOL2
iUR94kIGzoqbCSoqd5Lal7v69zMRdkDVoVUxM7/941dRoxLH0towmeLJbiV0d+tCoCXyIS/VTQlF
MruOZSdJzYjRsHTLp8iKi1idIyf8PXBujbJc40xZ8T2EbKu/wq263rA45pvJD2Hz+d/CeS5NHJSM
7r4S4/BKUZ9URTNEGfilNSLsjiTuTDEHNsbI3boAKueFzPbYD5A4rsaYZ2B3paQu5hDq+TDVCqfk
KFcV7eYfVsB2fHHJx7rzutUReMPX6xLQeQmr9QrJ/hImmGdYfM/17bklmykOXU61cSIcC6kfGTXE
x7QW3IMPHGclodh7EVKFdpATg4xdzeh8HHwC6dtq9XdZ1GbgMGv9GykXl82gYy3pJSjbeISZ9ylH
TTpK4IYiQqqndjLWCf8Rtaue5R7TLIsb4XiaGzDjEc/W1gK54zGy0ujI1eNrFSlzxdohV8kYciyv
c8U=
=FKrc
-----END PGP SIGNATURE-----

--------------qSy9ZyMQcR6YyrgAX3KXLO4R--
