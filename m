Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263E519CBE
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD0810E4AD;
	Wed,  4 May 2022 10:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409D410E4AD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:16:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1FE1210EB;
 Wed,  4 May 2022 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651659374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=USC45P9fraH77QA38JaUrM93f5/tYUqnYc0jlq6XQzg=;
 b=T0W0dDRemBs2aSWeHEaODS2QEKrjie4V6KKwr7qJrOdjQatIirodKFdQFyvtGdWq9QiKr8
 MHlE/GDQ46OLpGlR+W9cil9IEsfswW1mi2OfifGUQ2i7GuzAlRvemAUabl3iWE+kZJJ6ew
 N8C2iIq11kkfjaEILH92db9JW5M/DJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651659374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=USC45P9fraH77QA38JaUrM93f5/tYUqnYc0jlq6XQzg=;
 b=jOPYPOcIawq7UScUHNItWb/6Z843ONh1AMTgXy9HM/t0ll87onTWbemukdsifLZkewO5X3
 77xDo6BIUQuKSTBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3D2D131BD;
 Wed,  4 May 2022 10:16:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Vpf0Lm5ScmIBHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 10:16:14 +0000
Message-ID: <2229491c-cdfc-3409-3250-32c2878460e7@suse.de>
Date: Wed, 4 May 2022 12:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 4/4] mgag200: remove mgag200_probe_vram()
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-5-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220426164108.1051295-5-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ur6M0iDWXtA5LjafcIEg5U7H"
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ur6M0iDWXtA5LjafcIEg5U7H
Content-Type: multipart/mixed; boundary="------------Xzu0wCrX8cgfe9tJV7LO0Txr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Cc: michel@daenzer.net, lyude@redhat.com, jadahl@gmail.com
Message-ID: <2229491c-cdfc-3409-3250-32c2878460e7@suse.de>
Subject: Re: [PATCH 4/4] mgag200: remove mgag200_probe_vram()
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-5-jfalempe@redhat.com>
In-Reply-To: <20220426164108.1051295-5-jfalempe@redhat.com>

--------------Xzu0wCrX8cgfe9tJV7LO0Txr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjIgdW0gMTg6NDEgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IFRoaXMgZnVuY3Rpb24gd3JpdGVzIHNvbWUgcGF0dGVybiB0byB2aWRlbyBtZW1vcnksIHRv
IGNoZWNrIGZvciBjb25mbGljdC4NCj4gSW4gY2FzZSBvZiBjb25mbGljdHMsIGl0IHJldHVy
bnMgYSByYW5kb20gbWVtb3J5IGNhcGFjaXR5IChvZmZzZXQgb2YgdGhlDQo+IGNvbmZsaWN0
KS4NCj4gVXNpbmcgZGV2bV9hcmNoX2lvX3Jlc2VydmVfbWVtdHlwZV93YygpIHNob3VsZCBn
YXJhbnRlZSB0aGF0IG5vIG90aGVyDQo+IGRyaXZlciBpcyB1c2luZyB0aGlzIG1lbW9yeSBy
ZWdpb24uDQo+IEluIGNhc2Ugb2YgcmVhbCBtZW1vcnkgY29uZmxpY3RzLCBhcyBpdCBpcyB2
aWRlbyBtZW1vcnksIHRoZSB1c2VyIHdpbGwNCj4gbm90aWNlIGl0IGVhc2lseS4gU28gdGhl
cmUgaXMgbm8gbmVlZCBmb3IgdGhpcyBmdW5jdGlvbi4NCg0KSSBkb24ndCB0aGluayB3ZSBj
YW4gcmVtb3ZlIHRoaXMgZnVuY3Rpb24uIEl0IGRvZXNuJ3QgdGVzdCBmb3IgDQpjb25jdXJy
ZW50IGFjY2VzcywgYnV0IGZvciBub24tZXhpc3RpbmcgdmlkZW8gbWVtb3J5LiBBcHBhcmVu
dGx5LCBzb21lIA0Kc3lzdGVtcyBoYXZlIGxhcmdlciBQQ0kgYXBlcnR1cmVzIHRoYW4gYWN0
dWFsIHZpZGVvIG1lbW9yeS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21tLmMgfCA1MCArKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tbS5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9tbS5jDQo+IGluZGV4IGZhOTk2ZDQ2ZmVlZC4uNjgyOTliNTYwYTk4IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21tLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tbS5jDQo+IEBAIC0zMiw0OCAr
MzIsNiBAQA0KPiAgIA0KPiAgICNpbmNsdWRlICJtZ2FnMjAwX2Rydi5oIg0KPiAgIA0KPiAt
c3RhdGljIHNpemVfdCBtZ2FnMjAwX3Byb2JlX3ZyYW0oc3RydWN0IG1nYV9kZXZpY2UgKm1k
ZXYsIHZvaWQgX19pb21lbSAqbWVtLA0KPiAtCQkJCSBzaXplX3Qgc2l6ZSkNCj4gLXsNCj4g
LQlpbnQgb2Zmc2V0Ow0KPiAtCWludCBvcmlnOw0KPiAtCWludCB0ZXN0MSwgdGVzdDI7DQo+
IC0JaW50IG9yaWcxLCBvcmlnMjsNCj4gLQlzaXplX3QgdnJhbV9zaXplOw0KPiAtDQo+IC0J
LyogUHJvYmUgKi8NCj4gLQlvcmlnID0gaW9yZWFkMTYobWVtKTsNCj4gLQlpb3dyaXRlMTYo
MCwgbWVtKTsNCj4gLQ0KPiAtCXZyYW1fc2l6ZSA9IHNpemU7DQo+IC0NCj4gLQlpZiAoKG1k
ZXYtPnR5cGUgPT0gRzIwMF9FVzMpICYmICh2cmFtX3NpemUgPj0gMHgxMDAwMDAwKSkNCj4g
LQkJdnJhbV9zaXplID0gdnJhbV9zaXplIC0gMHg0MDAwMDA7DQo+IC0NCj4gLQlmb3IgKG9m
ZnNldCA9IDB4MTAwMDAwOyBvZmZzZXQgPCB2cmFtX3NpemU7IG9mZnNldCArPSAweDQwMDAp
IHsNCj4gLQkJb3JpZzEgPSBpb3JlYWQ4KG1lbSArIG9mZnNldCk7DQo+IC0JCW9yaWcyID0g
aW9yZWFkOChtZW0gKyBvZmZzZXQgKyAweDEwMCk7DQo+IC0NCj4gLQkJaW93cml0ZTE2KDB4
YWE1NSwgbWVtICsgb2Zmc2V0KTsNCj4gLQkJaW93cml0ZTE2KDB4YWE1NSwgbWVtICsgb2Zm
c2V0ICsgMHgxMDApOw0KPiAtDQo+IC0JCXRlc3QxID0gaW9yZWFkMTYobWVtICsgb2Zmc2V0
KTsNCj4gLQkJdGVzdDIgPSBpb3JlYWQxNihtZW0pOw0KPiAtDQo+IC0JCWlvd3JpdGUxNihv
cmlnMSwgbWVtICsgb2Zmc2V0KTsNCj4gLQkJaW93cml0ZTE2KG9yaWcyLCBtZW0gKyBvZmZz
ZXQgKyAweDEwMCk7DQo+IC0NCj4gLQkJaWYgKHRlc3QxICE9IDB4YWE1NSkNCj4gLQkJCWJy
ZWFrOw0KPiAtDQo+IC0JCWlmICh0ZXN0MikNCj4gLQkJCWJyZWFrOw0KPiAtCX0NCj4gLQ0K
PiAtCWlvd3JpdGUxNihvcmlnLCBtZW0pOw0KPiAtDQo+IC0JcmV0dXJuIG9mZnNldCAtIDY1
NTM2Ow0KPiAtfQ0KPiAgIA0KPiAgIGludCBtZ2FnMjAwX21tX2luaXQoc3RydWN0IG1nYV9k
ZXZpY2UgKm1kZXYpDQo+ICAgew0KPiBAQCAtODEsNiArMzksNyBAQCBpbnQgbWdhZzIwMF9t
bV9pbml0KHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KQ0KPiAgIAlzdHJ1Y3QgcGNpX2RldiAq
cGRldiA9IHRvX3BjaV9kZXYoZGV2LT5kZXYpOw0KPiAgIAl1OCBtaXNjOw0KPiAgIAlyZXNv
dXJjZV9zaXplX3Qgc3RhcnQsIGxlbjsNCj4gKwlzaXplX3QgdnJhbV9zaXplOw0KPiAgIA0K
PiAgIAlXUkVHX0VDUlQoMHgwNCwgMHgwMCk7DQo+ICAgDQo+IEBAIC0xMDYsNyArNjUsMTIg
QEAgaW50IG1nYWcyMDBfbW1faW5pdChzdHJ1Y3QgbWdhX2RldmljZSAqbWRldikNCj4gICAJ
aWYgKCFtZGV2LT52cmFtKQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgDQo+IC0JbWRl
di0+bWMudnJhbV9zaXplID0gbWdhZzIwMF9wcm9iZV92cmFtKG1kZXYsIG1kZXYtPnZyYW0s
IGxlbik7DQo+ICsJdnJhbV9zaXplID0gbGVuOw0KPiArCS8qIEcyMDBfRVczIGhhcyBvbmx5
IDEyTUIgb2YgbWVtb3J5ICovDQo+ICsJaWYgKChtZGV2LT50eXBlID09IEcyMDBfRVczKSAm
JiAodnJhbV9zaXplID49IDB4MTAwMDAwMCkpDQo+ICsJCXZyYW1fc2l6ZSAtPSAweDQwMDAw
MDsNCj4gKw0KPiArCW1kZXYtPm1jLnZyYW1fc2l6ZSA9IHZyYW1fc2l6ZTsNCj4gICAJbWRl
di0+bWMudnJhbV9iYXNlID0gc3RhcnQ7DQo+ICAgCW1kZXYtPm1jLnZyYW1fd2luZG93ID0g
bGVuOw0KPiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Xzu0wCrX8cgfe9tJV7LO0Txr--

--------------Ur6M0iDWXtA5LjafcIEg5U7H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJyUm4FAwAAAAAACgkQlh/E3EQov+B9
bBAAiIVCethLxHVlH4696Ozv5Q5+xBIKcBn0cXdYoEyzxNpDIfJIj7iNDhoibYYhJuU1Hmkm6LYS
4CkkoaTxJP1/zhUDEyVuMIeIMh6denz8XOWuq2RDaT71k6vOfIjCmWDY1vrCc24K09nG7AKkQLvT
D6FBTD9k1xmtBXFol7oyFtDn2+XshePFNqi2O847Qv+UcuQ1zEkKLaIywLz2tII59KSV5lUgGOwA
gCsa0nrdpd6wAmPYk+kiYAxP8TsPEGR1HYn4a3bRxuv1Qe0m1b4zdKoA7lqGY4sIvWmixrMaQFPw
RaIAueuZWNvBqz+xrA5AzYKQESG3ANa88wsfn0dYx9hkpTIhkBJS8pkcFPb6qSp1c/GF5NIby2FY
b1u1URMSspTq9PN3eoqMMii8vVimfj6Fa0z0bBbviXcFSADK7/qVr8GYLB507VvT7ExWaXWjx4JH
4Yh1pFa1N6sm6gUBpR7nNwRg6CzW+O2jYgymVfEZjEADEE2VvjLhY0vj324ABIMOerf4KZzN/Fz6
1o5xA10XR/f329fQKtKMy0kqOwfsZ7nhLg2hgNaY3Yi2iapNZ42s9skklF8+ApLrZqWD1tDaDskB
zdgQljxElEeerNQVtlmanoT4eMSCbw/LjJ66PfCl4vVH6UC6IV9kbjEGD1rHT7MPll3zRJ9OuXZg
E6E=
=JizH
-----END PGP SIGNATURE-----

--------------Ur6M0iDWXtA5LjafcIEg5U7H--
