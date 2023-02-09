Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4916903EA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AB810E97F;
	Thu,  9 Feb 2023 09:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE8510E975
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:35:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 88A5B20608;
 Thu,  9 Feb 2023 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675935329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=572xqWkY9J8TKX5MKmliGZPFMo/rwyEPc+ZMDZIRkFU=;
 b=mku5rn0cLBwa84lvhXvFL1NPfr1wG1TbhNUQg9OvmD15Q1ILXxklbUk6lqNo5msH9wH5lZ
 iU7OABQd13wWNxUEfhNmp3rjMF6qv4h3aaLeZ7LDhE4wFoTA6qwm46+7fAsBi/X0g/Suux
 +whImzajvFDGbeGYAyEzeKUy0EtEAbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675935329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=572xqWkY9J8TKX5MKmliGZPFMo/rwyEPc+ZMDZIRkFU=;
 b=pQ+yg04LECwxvvGlUu60Zcf8UoFPXoM5Azw5pwIpoA5LJhx4jl9EcNg055JsGRHjDLNK4U
 QFrBIYFgm1wIarBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BE15138E4;
 Thu,  9 Feb 2023 09:35:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JvePGWG+5GO/CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 09:35:29 +0000
Message-ID: <dc897487-9e17-036d-b0b3-6c15903dd009@suse.de>
Date: Thu, 9 Feb 2023 10:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/ast: Fix start address computation
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com
References: <20230209091254.15455-1-jfalempe@redhat.com>
 <65c4af68-3808-4021-ae4f-d0c07c908431@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <65c4af68-3808-4021-ae4f-d0c07c908431@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sJiQEQcOrtWA5jBNoc8meSGX"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sJiQEQcOrtWA5jBNoc8meSGX
Content-Type: multipart/mixed; boundary="------------k44L7xeM6G7wwKeskVlA114P";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com
Message-ID: <dc897487-9e17-036d-b0b3-6c15903dd009@suse.de>
Subject: Re: [PATCH v2] drm/ast: Fix start address computation
References: <20230209091254.15455-1-jfalempe@redhat.com>
 <65c4af68-3808-4021-ae4f-d0c07c908431@aspeedtech.com>
In-Reply-To: <65c4af68-3808-4021-ae4f-d0c07c908431@aspeedtech.com>

--------------k44L7xeM6G7wwKeskVlA114P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDIuMjMgdW0gMTA6MjIgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gSGVs
bG8sDQo+IA0KPiBUaGUgb2Zmc2V0IGdpdmVuIHRvIGFzdF9zZXRfc3RhcnRfYWRkcmVzc19j
cnQxKCkgc2hvdWxkIGJlIG9mZnNldCBpbiANCj4gdnJhbS4gSXQgc2hvdWxkIDAgbm93IGFz
IHlvdXIgcGF0Y2guDQo+IA0KPiBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBjb3JyZWN0IGl0
IGluIGFzdF9wcmltYXJ5X3BsYW5lX2luaXQoKSBhbmQgDQo+IGFzdF9jdXJzb3JfcGxhbmVf
aW5pdCgpIGFzIGJlbG93Lg0KDQpJIHdhcyBhYm91dCB0byB3cml0ZSB0aGUgc2FtZS4gVGhh
bmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+
IEBAIC03MTQsNyArNzE0LDcgQEAgc3RhdGljIGludCBhc3RfcHJpbWFyeV9wbGFuZV9pbml0
KHN0cnVjdCBhc3RfcHJpdmF0ZSANCj4gKmFzdCkNCj4gIMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBhc3RfcGxhbmUgKmFzdF9wcmltYXJ5X3BsYW5lID0gJmFzdC0+cHJpbWFyeV9wbGFuZTsN
Cj4gIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmUgKnByaW1hcnlfcGxhbmUgPSAm
YXN0X3ByaW1hcnlfcGxhbmUtPmJhc2U7DQo+ICDCoMKgwqDCoMKgwqDCoCB2b2lkIF9faW9t
ZW0gKnZhZGRyID0gYXN0LT52cmFtOw0KPiAtwqDCoMKgwqDCoMKgIHU2NCBvZmZzZXQgPSBh
c3QtPnZyYW1fYmFzZTsNCj4gK8KgwqDCoMKgwqDCoCB1NjQgb2Zmc2V0ID0gMDsNCj4gIMKg
wqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgY3Vyc29yX3NpemUgPSByb3VuZHVwKEFTVF9I
V0NfU0laRSArIA0KPiBBU1RfSFdDX1NJR05BVFVSRV9TSVpFLCBQQUdFX1NJWkUpOw0KPiAg
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBzaXplID0gYXN0LT52cmFtX2ZiX2F2YWls
YWJsZSAtIGN1cnNvcl9zaXplOw0KPiAgwqDCoMKgwqDCoMKgwqAgaW50IHJldDsNCj4gQEAg
LTk3Miw3ICs5NzIsNyBAQCBzdGF0aWMgaW50IGFzdF9jdXJzb3JfcGxhbmVfaW5pdChzdHJ1
Y3QgYXN0X3ByaXZhdGUgDQo+ICphc3QpDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FTk9NRU07DQo+IA0KPiAgwqDCoMKgwqDCoMKgwqAgdmFkZHIgPSBh
c3QtPnZyYW0gKyBhc3QtPnZyYW1fZmJfYXZhaWxhYmxlIC0gc2l6ZTsNCj4gLcKgwqDCoMKg
wqDCoCBvZmZzZXQgPSBhc3QtPnZyYW1fYmFzZSArIGFzdC0+dnJhbV9mYl9hdmFpbGFibGUg
LSBzaXplOw0KPiArwqDCoMKgwqDCoMKgIG9mZnNldCA9IHN0LT52cmFtX2ZiX2F2YWlsYWJs
ZSAtIHNpemU7DQoNClRoaXMgaXMgY29uZnVzaW5nIG1lLCBiZWNhdXNlIGluIG15IHRlc3Rz
IEkgc3RpbGwgc2F3IGEgY3Vyc29yLCBldmVuIA0KdGhvdWdoIHRoZSBhZGRyZXNzIGlzIGN1
cnJlbnRseSB3cm9uZy4NCg0KQmVzdCByZWdhcmQNClRob21hcw0KDQo+IA0KPiBPbiAyMDIz
LzIvOSDkuIvljYggMDU6MTIsIEpvY2VseW4gRmFsZW1wZSB3cm90ZToNCj4+IER1cmluZyB0
aGUgZHJpdmVyIGNvbnZlcnNpb24gdG8gc2htZW0sIHRoZSBzdGFydCBhZGRyZXNzIGZvciB0
aGUNCj4+IHNjYW5vdXQgYnVmZmVyIHdhcyBzZXQgdG8gdGhlIGJhc2UgUENJIGFkZHJlc3Mu
DQo+PiBJbiBtb3N0IGNhc2VzIGl0IHdvcmtzIGJlY2F1c2Ugb25seSB0aGUgbG93ZXIgMjRi
aXRzIGFyZSB1c2VkLCBhbmQNCj4+IGR1ZSB0byBhbGlnbm1lbnQgaXQgd2FzIGFsbW9zdCBh
bHdheXMgMC4NCj4+IEJ1dCBvbiBzb21lIHVubHVja3kgaGFyZHdhcmUsIGl0J3Mgbm90IHRo
ZSBjYXNlLCBhbmQgc29tZSB1bml0aWxpemVkDQo+PiBtZW1vcnkgaXMgZGlzcGxheWVkIG9u
IHRoZSBCTUMuDQo+PiBXaXRoIHNobWVtLCB0aGUgcHJpbWFyeSBwbGFuZSBpcyBhbHdheXMg
YXQgb2Zmc2V0IDAgaW4gR1BVIG1lbW9yeS4NCj4+DQo+PiBUZXN0ZWQgb24gYSBzcjY0NSBh
ZmZlY3RlZCBieSB0aGlzIGJ1Zy4NCj4+DQo+PiBGaXhlczogZjJmYTVhOTljYTgxICgiZHJt
L2FzdDogQ29udmVydCBhc3QgdG8gU0hNRU0iKQ0KPj4gU2lnbmVkLW9mZi1ieTogSm9jZWx5
biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAzICsrLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYw0KPj4gaW5kZXggYzc0NDMzMTdjNzQ3Li41NGRlYjI5YmZlYjMgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPj4gQEAgLTY4MSw3ICs2ODEsOCBA
QCBzdGF0aWMgdm9pZCANCj4+IGFzdF9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBk
YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPj4gwqDCoMKgwqDCoCBpZiAoIW9sZF9m
YiB8fCBvbGRfZmItPnBpdGNoZXNbMF0gIT0gZmItPnBpdGNoZXNbMF0pDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgYXN0X3NldF9vZmZzZXRfcmVnKGFzdCwgZmIpOw0KPj4gwqDCoMKgwqDC
oCBpZiAoIW9sZF9mYikgew0KPj4gLcKgwqDCoMKgwqDCoMKgIGFzdF9zZXRfc3RhcnRfYWRk
cmVzc19jcnQxKGFzdCwgKHUzMilhc3RfcGxhbmUtPm9mZnNldCk7DQo+PiArwqDCoMKgwqDC
oMKgwqAgLyogd2l0aCBzaG1lbSwgdGhlIHByaW1hcnkgcGxhbmUgaXMgYWx3YXlzIGF0IG9m
ZnNldCAwICovDQo+PiArwqDCoMKgwqDCoMKgwqAgYXN0X3NldF9zdGFydF9hZGRyZXNzX2Ny
dDEoYXN0LCAwKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBhc3Rfc2V0X2luZGV4X3JlZ19t
YXNrKGFzdCwgQVNUX0lPX1NFUV9QT1JULCAweDEsIDB4ZGYsIDB4MDApOw0KPj4gwqDCoMKg
wqDCoCB9DQo+PiDCoCB9DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------k44L7xeM6G7wwKeskVlA114P--

--------------sJiQEQcOrtWA5jBNoc8meSGX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPkvmEFAwAAAAAACgkQlh/E3EQov+D4
ng//TynFG7bbBMOKmCI+HMCsukmpPAoxVqfCMfzwxzFCHP0nyMhCXEwQynjd3/Qq9EXEWo17eVP1
FPw1RfUZUQ5hYXvXdAnQxKJ5JRsoYopIqgV1oAQKTr3HGCfKCETzR2xQnhAut8an4hFw97RRvdyQ
uKwZFBsAL9hwMblCUPsmdBLVtXT9v0SqP2nyVn3wsmeoeCwfEHYYGtx93o7HkNDTbJLsk5ELBMh8
O1yoaCVqIlDvx4o7VxZtf6bmDaQ3dU1ltmBs5iZnGWoOU0QqyxZHsBYZCcjtA/4xSrWPsNVnb4ZC
p9K5jqyWrgRissYU0O9GrJU6LEN4V62r6j0+4tBCuBEfmj7mwzcPhsvjv4EZR4t9JzL54IlEIhHk
fZqu84bXIAEhmMO6V+xtW7nKW1dwJpHThipVqN4Yv2tX2IocavtbDUV7HVSV/w2lJ9AS9xNTBKA1
SvcaomPvntZxESZPu0XtAStoc5q2SV8y1GmmwRqDY+aOIcJEZgWtQUWz7/xG7Zt2WhiJntay7H5O
27htjcPYRMxJnWMdufCBf1z2WEkglcasL+HXbmcTuxn/6u6uTVw5Ho3AsSkEVkYpcWkJoqqgyAzV
/WbEAbAA1zCpOCu3JR8JJqH3A/1KgDZu8qg06wmH6b5adnXUpu3c/zxyp/Ej2yejJVZ7rrCTmrKj
Teg=
=+iUi
-----END PGP SIGNATURE-----

--------------sJiQEQcOrtWA5jBNoc8meSGX--
