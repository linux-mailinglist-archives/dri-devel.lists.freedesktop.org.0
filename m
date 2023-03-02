Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3C06A84DC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 16:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0BB10E0C8;
	Thu,  2 Mar 2023 15:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABBE10E0C8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 15:05:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40B4021EE8;
 Thu,  2 Mar 2023 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677769532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZwmRex4xK1dCqSuNzN9ZVCEkKekW0lCl7z4iyG79S9k=;
 b=aVHLKpX63kY9E2yULC7Vslq4yhN/WOdJuDuJSMeszWSU5PzOyrxA1wpblO9718eFjEd0JP
 xbGGc3EVpMQnIOCck4OwokE+wEAC/ILcV/ik/8uuet4TQjAU2sc2xD1wZ28Y3ZEys0dRwJ
 o2yatIZuAdh6Gb4ncRoC0FxLBsgKnic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677769532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZwmRex4xK1dCqSuNzN9ZVCEkKekW0lCl7z4iyG79S9k=;
 b=NVkBQNiAv5h1kWCpfnT/ZTMLo9p49a+dTiAGJX4qEw/WqbdhU9iMaivFPkKg6+T9IfLPJl
 PEa63XGJuzPik8DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 170E513349;
 Thu,  2 Mar 2023 15:05:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iK1mBDy7AGQ2ewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Mar 2023 15:05:32 +0000
Message-ID: <4a81f331-91fe-690c-84ad-3bc98377f833@suse.de>
Date: Thu, 2 Mar 2023 16:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230302143502.500661-1-contact@emersion.fr>
 <fc65ed62-29d9-7630-6a5e-52612640bf9e@suse.de>
In-Reply-To: <fc65ed62-29d9-7630-6a5e-52612640bf9e@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0cuBqZgbBRfcMgxr2MoWz0hJ"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <maxime@cerno.tech>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0cuBqZgbBRfcMgxr2MoWz0hJ
Content-Type: multipart/mixed; boundary="------------nt7IWi4U7PHjTXQMXFZ6zRgy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Maxime Ripard <maxime@cerno.tech>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <4a81f331-91fe-690c-84ad-3bc98377f833@suse.de>
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
References: <20230302143502.500661-1-contact@emersion.fr>
 <fc65ed62-29d9-7630-6a5e-52612640bf9e@suse.de>
In-Reply-To: <fc65ed62-29d9-7630-6a5e-52612640bf9e@suse.de>

--------------nt7IWi4U7PHjTXQMXFZ6zRgy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDMuMjMgdW0gMTY6MDMgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDAyLjAzLjIzIHVtIDE1OjM1IHNjaHJpZWIgU2ltb24gU2VyOg0K
Pj4gZHJtX2dlbV9tYXBfZG1hX2J1ZigpIHJlcXVpcmVzIGRybV9nZW1fb2JqZWN0X2Z1bmNz
LmdldF9zZ190YWJsZQ0KPj4gdG8gYmUgaW1wbGVtZW50ZWQsIG9yIGVsc2UgV0FSTnMuDQo+
Pg0KPj4gQWxsb3cgZHJpdmVycyB0byBsZWF2ZSB0aGlzIGhvb2sgdW5pbXBsZW1lbnRlZCB0
byBpbXBsZW1lbnQgcHVyZWx5DQo+PiBsb2NhbCBETUEtQlVGcyAoaWUsIERNQS1CVUZzIHdo
aWNoIGNhbm5vdCBiZSBpbXBvcnRlZCBhbnl3aGVyZQ0KPj4gZWxzZSBidXQgdGhlIGRldmlj
ZSB3aGljaCBhbGxvY2F0ZWQgdGhlbSkuIEluIHRoYXQgY2FzZSwgcmVqZWN0DQo+PiBpbXBv
cnRzIHRvIG90aGVyIGRldmljZXMgaW4gZHJtX2dlbV9tYXBfYXR0YWNoKCkuDQo+Pg0KPj4g
djI6IG5ldyBwYXRjaA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFj
dEBlbWVyc2lvbi5mcj4NCj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPg0KPj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KPj4gQ2M6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPg0KPj4gQ2M6IE1h
eGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0KPj4gQ2M6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+IENjOiBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJt
X3ByaW1lLmMgfCA2ICsrKysrLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4+IGluZGV4
IGY5MjRiOGI0YWI2Yi4uYWIxZDIxZDYzYTAzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wcmltZS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMNCj4+IEBAIC01NDQsNyArNTQ0LDggQEAgaW50IGRybV9wcmltZV9oYW5kbGVfdG9fZmRf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgDQo+PiAqZGV2LCB2b2lkICpkYXRhLA0KPj4gwqDC
oCAqIE9wdGlvbmFsIHBpbm5pbmcgb2YgYnVmZmVycyBpcyBoYW5kbGVkIGF0IGRtYS1idWYg
YXR0YWNoIGFuZCANCj4+IGRldGFjaCB0aW1lIGluDQo+PiDCoMKgICogZHJtX2dlbV9tYXBf
YXR0YWNoKCkgYW5kIGRybV9nZW1fbWFwX2RldGFjaCgpLiBCYWNraW5nIHN0b3JhZ2UgDQo+
PiBpdHNlbGYgaXMNCj4+IMKgwqAgKiBoYW5kbGVkIGJ5IGRybV9nZW1fbWFwX2RtYV9idWYo
KSBhbmQgZHJtX2dlbV91bm1hcF9kbWFfYnVmKCksIA0KPj4gd2hpY2ggcmVsaWVzIG9uDQo+
PiAtICogJmRybV9nZW1fb2JqZWN0X2Z1bmNzLmdldF9zZ190YWJsZS4NCj4+ICsgKiAmZHJt
X2dlbV9vYmplY3RfZnVuY3MuZ2V0X3NnX3RhYmxlLiBJZiANCj4+ICZkcm1fZ2VtX29iamVj
dF9mdW5jcy5nZXRfc2dfdGFibGUgaXMNCj4+ICsgKiB1bmltcGxlbWVudGVkLCBleHBvcnRz
IGludG8gYW5vdGhlciBkZXZpY2UgYXJlIHJlamVjdGVkLg0KPj4gwqDCoCAqDQo+PiDCoMKg
ICogRm9yIGtlcm5lbC1pbnRlcm5hbCBhY2Nlc3MgdGhlcmUncyBkcm1fZ2VtX2RtYWJ1Zl92
bWFwKCkgYW5kDQo+PiDCoMKgICogZHJtX2dlbV9kbWFidWZfdnVubWFwKCkuIFVzZXJzcGFj
ZSBtbWFwIHN1cHBvcnQgaXMgcHJvdmlkZWQgYnkNCj4+IEBAIC01ODMsNiArNTg0LDkgQEAg
aW50IGRybV9nZW1fbWFwX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwNCj4+IMKg
IHsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBkbWFfYnVm
LT5wcml2Ow0KPj4gK8KgwqDCoCBpZiAoIW9iai0+ZnVuY3MtPmdldF9zZ190YWJsZSkNCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7DQo+IA0KPiAtRU5PU1lTIHBs
ZWFzZS4NCg0KV2l0aCB0aGlzIGNoYW5nZWQ6DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRo
b21hcw0KPiANCj4+ICsNCj4+IMKgwqDCoMKgwqAgcmV0dXJuIGRybV9nZW1fcGluKG9iaik7
DQo+PiDCoCB9DQo+PiDCoCBFWFBPUlRfU1lNQk9MKGRybV9nZW1fbWFwX2F0dGFjaCk7DQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------nt7IWi4U7PHjTXQMXFZ6zRgy--

--------------0cuBqZgbBRfcMgxr2MoWz0hJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQAuzsFAwAAAAAACgkQlh/E3EQov+Bv
ig//Xg9SbhHn91jr9/lQ6uJJTIBaAFn7o+VSmGfK54uuDzli2caFjJSU5vRVcCEbA8iS8/a23zfH
PEYNAdIhLIFOXBHBTbYsgPUqdsb++tx5XUm+De7DqH7KzPWA8aXOIE2h8NqG9VdMhasHEMcdpnig
7ryD6d/n9HCctzUmU9KPYMNkL6cdA3JZm4Ujz8tnhDUnhvBzmfPPNXoHDYDY0nn8s9SKbKC7PCrx
Hs3pFKbDzzuhAspFwA8kORFp3KFrVJ8HGz+YsJvVhATQH/QMBfgJBxP5vSFcxNDwjP3P4dVrNEnF
r4uDG2MPGsV55P5nuUwvTbZKRJX2u0G96QNH7sfrFbrpW0K6C7GJI18+5AWz9kTCFal976tJ/j2R
LTAdf0y5g3o4qH3rXNEIuoMPdJ6WbxOTo1O84f4nO+zgWx/LMnJA/MCrEqLlZZBiKnQEGZ+2MmwV
dLCS89d3YBQZtMfD5Fqdnfjsn6UrQ2X9eO/VbxUzRntsoClwobXk1QQL88U/WaujNQ6H7WCEznm/
0dVNU6r4ry5MRL9AQ0pk2G/YBcVVJqSoG38rPykRzkiiaTTuSeUxwXnz/Havny37X07FarlPoBSk
Bwex8QBXqVEYZAfNg76Jcjquj/nTCVr8gqDqEOt1GzcncRnJlqIGrLPu87WJxxqqwSO6WIQ3gPpr
cBg=
=LMzP
-----END PGP SIGNATURE-----

--------------0cuBqZgbBRfcMgxr2MoWz0hJ--
