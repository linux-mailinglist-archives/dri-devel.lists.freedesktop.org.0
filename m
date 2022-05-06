Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733ED51D604
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1A210ED6F;
	Fri,  6 May 2022 10:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4608010E204
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 10:53:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF57D21A8C;
 Fri,  6 May 2022 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651834424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZIFdQIQ1wFzKrjxnRZE364ok+6jFx/WbkISFAFBS8zo=;
 b=Jd20zRuTwZq3MSd5XYzas02d038HqoWrX1SYqt2og9xo38msFraFhdNhZDKs2zIRC6dkC3
 wLFEpaJHQPs6pSzeJl0Tqrv6MQLmg1xbQU5IkwvPYFES/1YfD/snTDV0OJBL6hXvvA6+gF
 JAeAh4L7xkm3fRZ9zZt4+lejiuT/Ue0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651834424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZIFdQIQ1wFzKrjxnRZE364ok+6jFx/WbkISFAFBS8zo=;
 b=Vp9A2KQ/068v9EFnA2Peak4DOB9lXUrOQiYoMzk1pFQOy7uszjoSU0fh6hEQGs2FFG+R6D
 Bp9ZIsFTN9t4ZxBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B661113AA2;
 Fri,  6 May 2022 10:53:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7G6IKzj+dGJuBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 06 May 2022 10:53:44 +0000
Message-ID: <5679bcbe-790c-dcaf-c0d2-b9bba464a932@suse.de>
Date: Fri, 6 May 2022 12:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/mgag200: Fail on I2C initialization errors
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com, daniel@ffwll.ch
References: <20220505152244.413-1-tzimmermann@suse.de>
 <fe418b2e-10be-154c-59bc-e1870c37ef28@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <fe418b2e-10be-154c-59bc-e1870c37ef28@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MonE40RByB3EmmyQptmC6pxY"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MonE40RByB3EmmyQptmC6pxY
Content-Type: multipart/mixed; boundary="------------A03WH7fA3AevtkipDF2ZoO2j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <5679bcbe-790c-dcaf-c0d2-b9bba464a932@suse.de>
Subject: Re: [PATCH] drm/mgag200: Fail on I2C initialization errors
References: <20220505152244.413-1-tzimmermann@suse.de>
 <fe418b2e-10be-154c-59bc-e1870c37ef28@redhat.com>
In-Reply-To: <fe418b2e-10be-154c-59bc-e1870c37ef28@redhat.com>

--------------A03WH7fA3AevtkipDF2ZoO2j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDUuMjIgdW0gMTc6NDkgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDA1LzA1LzIwMjIgMTc6MjIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSW5p
dGlhbGl6YXRpb24gb2YgdGhlIEkyQyBhZGFwdGVyIHdhcyBhbGxvd2VkIHRvIGZhaWwuIFRo
ZSBtZ2FnMjAwDQo+PiBkcml2ZXIgd291bGQgaGF2ZSBjb250aW51ZWQgd2l0aG91dCBEREMg
c3VwcG9ydC4gSGFkIHRoaXMgaGFwcGVuZWQgaW4NCj4+IHByYWN0aWNlLCBpdCB3b3VsZCBo
YXZlIGxlZCB0byBzZWdtZW50YXRpb24gZmF1bHRzIGluIHRoZSBjb25uZWN0b3INCj4+IGNv
ZGUuIFJlc29sdmUgdGhpcyBwcm9ibGVtIGJ5IGZhaWxpbmcgZHJpdmVyIGluaXRpYWxpemF0
aW9uIG9uIEkyQy0NCj4+IHJlbGF0ZWQgZXJyb3JzLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEpv
Y2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4NCg0KVGhhbmtzIGEgbG90LiBJ
J2xsIGZpeCB0aGUgcmVwb3J0cyBmcm9tIHRoZSBhdXRvbWF0ZWQgdGVzdHMgYW5kIHJlc3Vi
bWl0IA0KdGhpcyBwYXRjaCBhcyBwYXJ0IG9mIGEgbGFyZ2VyIHBhdGNoc2V0Lg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2kyYy5jwqAgfCAxMyArKysrKysrKy0tLS0tDQo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8wqAgNiArKysr
LS0NCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9pMmMuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9pMmMu
Yw0KPj4gaW5kZXggYWM4ZTM0ZWVmNTEzOC4uMzFlMmM2NDFhNzgxNCAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfaTJjLmMNCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfaTJjLmMNCj4+IEBAIC0xMjAsNyArMTIw
LDcgQEAgc3RydWN0IG1nYV9pMmNfY2hhbiAqbWdhZzIwMF9pMmNfY3JlYXRlKHN0cnVjdCAN
Cj4+IGRybV9kZXZpY2UgKmRldikNCj4+IMKgwqDCoMKgwqAgaTJjID0ga3phbGxvYyhzaXpl
b2Yoc3RydWN0IG1nYV9pMmNfY2hhbiksIEdGUF9LRVJORUwpOw0KPj4gwqDCoMKgwqDCoCBp
ZiAoIWkyYykNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4+IMKgwqDCoMKgwqAgaTJjLT5k
YXRhID0gZGF0YTsNCj4+IMKgwqDCoMKgwqAgaTJjLT5jbG9jayA9IGNsb2NrOw0KPj4gQEAg
LTE0MiwxMSArMTQyLDE0IEBAIHN0cnVjdCBtZ2FfaTJjX2NoYW4gKm1nYWcyMDBfaTJjX2Ny
ZWF0ZShzdHJ1Y3QgDQo+PiBkcm1fZGV2aWNlICpkZXYpDQo+PiDCoMKgwqDCoMKgIGkyYy0+
Yml0LmdldHNjbMKgwqDCoMKgwqDCoMKgID0gbWdhX2dwaW9fZ2V0c2NsOw0KPj4gwqDCoMKg
wqDCoCByZXQgPSBpMmNfYml0X2FkZF9idXMoJmkyYy0+YWRhcHRlcik7DQo+PiAtwqDCoMKg
IGlmIChyZXQpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBrZnJlZShpMmMpOw0KPj4gLcKgwqDC
oMKgwqDCoMKgIGkyYyA9IE5VTEw7DQo+PiAtwqDCoMKgIH0NCj4+ICvCoMKgwqAgaWYgKHJl
dCkNCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9rZnJlZTsNCj4+ICsNCj4+IMKgwqDC
oMKgwqAgcmV0dXJuIGkyYzsNCj4+ICsNCj4+ICtlcnJfa2ZyZWU6DQo+PiArwqDCoMKgIGtm
cmVlKGkyYyk7DQo+PiArwqDCoMKgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+PiDCoCB9DQo+
PiDCoCB2b2lkIG1nYWcyMDBfaTJjX2Rlc3Ryb3koc3RydWN0IG1nYV9pMmNfY2hhbiAqaTJj
KQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9k
ZS5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPj4g
aW5kZXggYWJkZTc2NTU0NzdkYi4uNzk1NTdjYTA1NmYwOCAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPj4gQEAgLTgxNSw4ICs4MTUsMTAg
QEAgc3RhdGljIGludCBtZ2FnMjAwX3ZnYV9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgDQo+PiBt
Z2FfZGV2aWNlICptZGV2KQ0KPj4gwqDCoMKgwqDCoCBpbnQgcmV0Ow0KPj4gwqDCoMKgwqDC
oCBpMmMgPSBtZ2FnMjAwX2kyY19jcmVhdGUoZGV2KTsNCj4+IC3CoMKgwqAgaWYgKCFpMmMp
DQo+PiAtwqDCoMKgwqDCoMKgwqAgZHJtX3dhcm4oZGV2LCAiZmFpbGVkIHRvIGFkZCBEREMg
YnVzXG4iKTsNCj4+ICvCoMKgwqAgaWYgKElTX0VSUihpMmMpKSB7DQo+PiArwqDCoMKgwqDC
oMKgwqAgZHJtX2VycihkZXYsICJmYWlsZWQgdG8gYWRkIEREQyBidXM6ICVkXG4iLCByZXQp
Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGkyYyk7DQo+PiArwqDCoMKg
IH0NCj4+IMKgwqDCoMKgwqAgcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRl
diwgY29ubmVjdG9yLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmbWdhX3ZnYV9jb25uZWN0b3JfZnVuY3MsDQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------A03WH7fA3AevtkipDF2ZoO2j--

--------------MonE40RByB3EmmyQptmC6pxY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ0/jgFAwAAAAAACgkQlh/E3EQov+Bl
2g/+PpfyDzql0sphzYx6OfHIQIZJRPMHxFmAC7/qiSD5uKWctfk9Gt//sktfoIdW+w4LrUI+KlTo
d/IuA5ps5tZAtdvV6nPfz03y+gmFDQXpyFpEaCnbDKRhFvdM46oVncOKjAmksKIB+JapwzrzHwHR
1imIYdQXdh1unzHAah+telSBDT3yzmsADlv5VBwuEhK9isfH9Srf6bnzOrdyA/Phmcd/angkR4su
T2Qo11lK6HMhcQ9fOBMZ4vIn7jD+h9yzmSEq08vHcZ/We5al6z6tJTxfDuFPZBDgjxko97fyYIPS
j+m3/KYnZ3Nl+pIgq3X4saQ8Ct9vJY1cK7lS0A+Kfr6ae/3bXP6nx6VZXJeRkhJy54EdM8taj5WA
GGv1Og98758hU+1dm4uNxN8XfFvEf/r3JvwVnqdfGkjykFlKvYu26dkxPPyC37YvKpEJ23vO74ik
8cEjjh1qQhWYIqYhKhlBtE6VRsHuhAbKrxAkISDUeCQgMzNq/IfjyhFX8GNf84rkpBBCm1n4P4DX
A8AND5VYvjYV8BNdJUgaoXPQxsUQ5lDaVcivbLRJgTlLVhUSDMc9rOkYB9wBGCB6c/osqGKHxtHM
GaT382e8bKrguJP38iUz1u1Q//tuWEYETHxrKEkQaMPIJQYdo0SRWS7dFdZ/31CFPQkVW0VZr46K
hSU=
=ogJT
-----END PGP SIGNATURE-----

--------------MonE40RByB3EmmyQptmC6pxY--
