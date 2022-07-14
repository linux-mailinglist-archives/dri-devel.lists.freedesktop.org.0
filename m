Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028C3574751
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C721A378F;
	Thu, 14 Jul 2022 08:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1388 seconds by postgrey-1.36 at gabe;
 Thu, 14 Jul 2022 08:40:25 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A49A378F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:40:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D762C1F90D;
 Thu, 14 Jul 2022 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657788023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMT+SlB8Ut70ivi8XSup3U4g2ZN+9QVsgWqieVMmRKw=;
 b=vHwFgVXXs/DvDsQFutHA5eSi6GXcYt5Y0Fg3WB5rN544RsGVN2+PJzXTFERAGJ1nVnSrgN
 AlIvjjBPG7kmzoPUFhVmZr9SeBzSJw/bICBgN5D0KtPZMev0HgSzeDdQc4dQGM5F0hXwAv
 HQXurHKUX/CL/AUzlyC47iZo/29knSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657788023;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMT+SlB8Ut70ivi8XSup3U4g2ZN+9QVsgWqieVMmRKw=;
 b=95a5ze+3dt9rqbkn1dPNHxPxHYS6qdVd6g4VyMAB0jUk/+dja9sDh5b1U6OwZBO5mpRNrf
 47A4xQpslmvopHCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF7FD13A61;
 Thu, 14 Jul 2022 08:40:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N9K1KXfWz2IrFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Jul 2022 08:40:23 +0000
Message-ID: <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
Date: Thu, 14 Jul 2022 10:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20220712102849.1562-1-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220712102849.1562-1-christian.koenig@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------D0ERVH3qnEPM40ls2zPMt6NI"
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------D0ERVH3qnEPM40ls2zPMt6NI
Content-Type: multipart/mixed; boundary="------------IP0LwrCgTyVa30mK2W6n4pF1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
References: <20220712102849.1562-1-christian.koenig@amd.com>
In-Reply-To: <20220712102849.1562-1-christian.koenig@amd.com>

--------------IP0LwrCgTyVa30mK2W6n4pF1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuDQoNCkFtIDEyLjA3LjIyIHVtIDEyOjI4IHNjaHJpZWIgQ2hyaXN0aWFu
IEvDtm5pZzoNCj4gVGhpcyByZXZlcnRzIGNvbW1pdCA4ZjYxOTczNzE4NDg1ZjNlODliYzRm
NDA4ZjkyOTA0OGI3YjQ3YzgzLg0KDQpJIG9ubHkgZm91bmQgdGhpcyBjb21taXQgaW4gZHJt
LW1pc2MtbmV4dC4gU2hvdWxkIHRoZSByZXZlcnQgYmUgDQpjaGVycnktcGlja2VkIGludG8g
ZHJtLW1pc2MtbmV4dC1maXhlcz8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4g
SXQgdHVybmVkIG91dCB0aGF0IHRoaXMgaXMgbm90IGNvcnJlY3QuIEVzcGVjaWFsbHkgdGhl
IHN5bmNfZmlsZSBpbmZvDQo+IElPQ1RMIG5lZWRzIHRvIHNlZSBldmVuIHNpZ25hbGVkIGZl
bmNlcyB0byBjb3JyZWN0bHkgcmVwb3J0IGJhY2sgdGhlaXINCj4gc3RhdHVzIHRvIHVzZXJz
cGFjZS4NCj4gDQo+IEluc3RlYWQgYWRkIHRoZSBmaWx0ZXIgaW4gdGhlIG1lcmdlIGZ1bmN0
aW9uIGFnYWluIHdoZXJlIGl0IG1ha2VzIHNlbnNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLXVud3JhcC5jIHwgMyArKy0NCj4gICBpbmNs
dWRlL2xpbnV4L2RtYS1mZW5jZS11bndyYXAuaCAgIHwgNiArLS0tLS0NCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLXVud3JhcC5jIGIvZHJpdmVycy9k
bWEtYnVmL2RtYS1mZW5jZS11bndyYXAuYw0KPiBpbmRleCA1MDJhNjVlYTZkNDQuLjcwMDJi
Y2E3OTJmZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS11bndy
YXAuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLXVud3JhcC5jDQo+IEBA
IC03Miw3ICs3Miw4IEBAIHN0cnVjdCBkbWFfZmVuY2UgKl9fZG1hX2ZlbmNlX3Vud3JhcF9t
ZXJnZSh1bnNpZ25lZCBpbnQgbnVtX2ZlbmNlcywNCj4gICAJY291bnQgPSAwOw0KPiAgIAlm
b3IgKGkgPSAwOyBpIDwgbnVtX2ZlbmNlczsgKytpKSB7DQo+ICAgCQlkbWFfZmVuY2VfdW53
cmFwX2Zvcl9lYWNoKHRtcCwgJml0ZXJbaV0sIGZlbmNlc1tpXSkNCj4gLQkJCSsrY291bnQ7
DQo+ICsJCQlpZiAoIWRtYV9mZW5jZV9pc19zaWduYWxlZCh0bXApKQ0KPiArCQkJCSsrY291
bnQ7DQo+ICAgCX0NCj4gICANCj4gICAJaWYgKGNvdW50ID09IDApDQo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS11bndyYXAuaCBiL2luY2x1ZGUvbGludXgvZG1h
LWZlbmNlLXVud3JhcC5oDQo+IGluZGV4IDM5MGRlMWVlOWQzNS4uNjZiMWU1NmZiYjgxIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS11bndyYXAuaA0KPiArKysg
Yi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS11bndyYXAuaA0KPiBAQCAtNDMsMTQgKzQzLDEw
IEBAIHN0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV91bndyYXBfbmV4dChzdHJ1Y3QgZG1h
X2ZlbmNlX3Vud3JhcCAqY3Vyc29yKTsNCj4gICAgKiBVbndyYXAgZG1hX2ZlbmNlX2NoYWlu
IGFuZCBkbWFfZmVuY2VfYXJyYXkgY29udGFpbmVycyBhbmQgZGVlcCBkaXZlIGludG8gYWxs
DQo+ICAgICogcG90ZW50aWFsIGZlbmNlcyBpbiB0aGVtLiBJZiBAaGVhZCBpcyBqdXN0IGEg
bm9ybWFsIGZlbmNlIG9ubHkgdGhhdCBvbmUgaXMNCj4gICAgKiByZXR1cm5lZC4NCj4gLSAq
DQo+IC0gKiBOb3RlIHRoYXQgc2lnbmFsbGVkIGZlbmNlcyBhcmUgb3Bwb3J0dW5pc3RpY2Fs
bHkgZmlsdGVyZWQgb3V0LCB3aGljaA0KPiAtICogbWVhbnMgdGhlIGl0ZXJhdGlvbiBpcyBw
b3RlbnRpYWxseSBvdmVyIG5vIGZlbmNlIGF0IGFsbC4NCj4gICAgKi8NCj4gICAjZGVmaW5l
IGRtYV9mZW5jZV91bndyYXBfZm9yX2VhY2goZmVuY2UsIGN1cnNvciwgaGVhZCkJCQlcDQo+
ICAgCWZvciAoZmVuY2UgPSBkbWFfZmVuY2VfdW53cmFwX2ZpcnN0KGhlYWQsIGN1cnNvcik7
IGZlbmNlOwlcDQo+IC0JICAgICBmZW5jZSA9IGRtYV9mZW5jZV91bndyYXBfbmV4dChjdXJz
b3IpKQkJCVwNCj4gLQkJaWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoZmVuY2UpKQ0KPiAr
CSAgICAgZmVuY2UgPSBkbWFfZmVuY2VfdW53cmFwX25leHQoY3Vyc29yKSkNCj4gICANCj4g
ICBzdHJ1Y3QgZG1hX2ZlbmNlICpfX2RtYV9mZW5jZV91bndyYXBfbWVyZ2UodW5zaWduZWQg
aW50IG51bV9mZW5jZXMsDQo+ICAgCQkJCQkgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2Vz
LA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------IP0LwrCgTyVa30mK2W6n4pF1--

--------------D0ERVH3qnEPM40ls2zPMt6NI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLP1ncFAwAAAAAACgkQlh/E3EQov+CU
DQ/+Pzf5WiJKT0aKmC6Z1BTwyhfQ2x5FfBH6DmKEJ06AUK5qNonl2WPUJYsafmagXxDEFyH/qxQ4
4k94QFImtj5wN1+sOjTn/PqNvxHKaN/yyR4zilgdAt0G5ayUPgzUz3arkWaa0V6C3AyRQ0Bl3lyt
hizplf4YbbnyMwQHrMhcEDtY8D3rVQeyx4vn2+CJBoupVxqrtNLjjEIvMP85dbFgADJjsZlSEmv7
5nyt09nLsKd4SCNNXRWOSuqEYh/E682wsf8oU8VYZq3aYD/ksM58cOgOCeGveszlLYTIXP0lC4K7
EEggqX6ZKIUM4LhQoYHhmaFQFuReXx6Fquaq6OppWEDfq9IXQPtER/RxUEfppmQYysxUiZdkCK3M
ZOyyGEpn/AEB+lyFIxgW0LJXC4J5aLHYitjGvqhSCP+msBsmIhkRv1fdDjg3TpXr6g6irj0l2KRr
NlEVm+xENHKqvQXypaSrd1JOSou18u2wsPjBjbF0YF30pnoFMOIqdqtGyeG8/alWj+i9JQzccFqh
I90hJGTQAghTw7ry+yhtxdINXf08dY5dHr1k/jRzKAgTWQm5FBQfT5OAt3bMza+BCj9Eoicenit0
X36FIaa8MF2D3AJsABP9WK4z4bDEQPylGSo6GAljf7mZvATYdRnC7nl+PsYDS8FBedZ+0SVw8eKa
STc=
=lvcz
-----END PGP SIGNATURE-----

--------------D0ERVH3qnEPM40ls2zPMt6NI--
