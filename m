Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5706A443EBD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 09:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621716EA09;
	Wed,  3 Nov 2021 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7D76EA07
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 08:55:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78772218D5;
 Wed,  3 Nov 2021 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635929745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X/M+WU6XAoInWVlkNhlkgpzHIXdShifTTgybJ6Tg/QE=;
 b=pDoRiFQcYcqXYfF60MKnPAcqGf+cSS4lpS0z1b6qWdxy0xZ99Oze1H2EnppmSGUDPOtfIb
 Qs/LthlPq/eWKDByvKqN5Y5rjZIlZUp8qDeFXWt/7LtWapmwZjeTRYxXxwZt4KbUzIwjGp
 G6yaXg+dK9TlDyzkh1ARKZuRhYoM+Zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635929745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X/M+WU6XAoInWVlkNhlkgpzHIXdShifTTgybJ6Tg/QE=;
 b=RaaJyOhEaKyFh3vkwDaDHEZwuOzad/KjrUfDEG7F4m/S6J69VGFQp7szSm3ipMSnN5MzR8
 57iMNdj6P38e02AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AB01139AF;
 Wed,  3 Nov 2021 08:55:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2M9DEZFOgmHSYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Nov 2021 08:55:45 +0000
Message-ID: <d2d40c58-8b4e-a838-4987-e9e90bd4b4ff@suse.de>
Date: Wed, 3 Nov 2021 09:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/prime: Fix use after free in mmap with
 drm_gem_ttm_mmap
Content-Language: en-US
To: "Anand K. Mistry" <amistry@google.com>
References: <20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid>
 <17d63b06-d1bd-85ab-92d3-71fa236b9493@suse.de>
 <CAATStaMSFu=27LdxNOabtARGaRq7rm_k2BHSsZ9+M-fF+nnk7Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAATStaMSFu=27LdxNOabtARGaRq7rm_k2BHSsZ9+M-fF+nnk7Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------knxpC7BKUt7bFXevIgy20Z8S"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nartemiev@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------knxpC7BKUt7bFXevIgy20Z8S
Content-Type: multipart/mixed; boundary="------------75FxQ6XgSegJnjeYho63huM6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Anand K. Mistry" <amistry@google.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nartemiev@google.com
Message-ID: <d2d40c58-8b4e-a838-4987-e9e90bd4b4ff@suse.de>
Subject: Re: [PATCH] drm/prime: Fix use after free in mmap with
 drm_gem_ttm_mmap
References: <20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid>
 <17d63b06-d1bd-85ab-92d3-71fa236b9493@suse.de>
 <CAATStaMSFu=27LdxNOabtARGaRq7rm_k2BHSsZ9+M-fF+nnk7Q@mail.gmail.com>
In-Reply-To: <CAATStaMSFu=27LdxNOabtARGaRq7rm_k2BHSsZ9+M-fF+nnk7Q@mail.gmail.com>

--------------75FxQ6XgSegJnjeYho63huM6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTEuMjEgdW0gMDE6MTIgc2NocmllYiBBbmFuZCBLLiBNaXN0cnk6DQo+
IEFueSBtb3ZlbWVudCBvbiBtZXJnaW5nIHRoaXMgcGF0Y2g/IE5vdCB1cmdlbnQgb24gbXkg
ZW5kICh3ZSBoYXZlIHRoaXMNCj4gcGF0Y2ggaW4gb3VyIHRyZWUpLCBidXQgSSB0aGluayBv
dGhlciBhbWQgdXNlcnMgbWlnaHQgcnVuIGludG8gdGhpcw0KPiBVQUYuDQoNClRoYW5rcyBm
b3IgcmVtaW5kaW5nLiBJJ3ZlIG1lcmdlZCB5b3VyIHBhdGNoIGludG8gZHJtLW1pc2MtZml4
ZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IE9uIFRodSwgMzAgU2VwdCAy
MDIxIGF0IDE3OjIxLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4g
d3JvdGU6DQo+Pg0KPj4gSGkNCj4+DQo+PiBBbSAzMC4wOS4yMSB1bSAwMTowMCBzY2hyaWVi
IEFuYW5kIEsgTWlzdHJ5Og0KPj4+IGRybV9nZW1fdHRtX21tYXAoKSBkcm9wcyBhIHJlZmVy
ZW5jZSB0byB0aGUgZ2VtIG9iamVjdCBvbiBzdWNjZXNzLiBJZg0KPj4+IHRoZSBnZW0gb2Jq
ZWN0J3MgcmVmY291bnQgPT0gMSBvbiBlbnRyeSB0byBkcm1fZ2VtX3ByaW1lX21tYXAoKSwg
dGhhdA0KPj4+IGRyb3Agd2lsbCBmcmVlIHRoZSBnZW0gb2JqZWN0LCBhbmQgdGhlIHN1YnNl
cXVlbnQgZHJtX2dlbV9vYmplY3RfZ2V0KCkNCj4+PiB3aWxsIGJlIGEgVUFGLiBGaXggYnkg
Z3JhYmJpbmcgYSByZWZlcmVuY2UgYmVmb3JlIGNhbGxpbmcgdGhlIG1tYXANCj4+PiBoZWxw
ZXIuDQo+Pj4NCj4+PiBUaGlzIGlzc3VlIHdhcyBmb3JzZWVuIHdoZW4gdGhlIHJlZmVyZW5j
ZSBkcm9wcGluZyB3YXMgYWRkaW5nIGluDQo+Pj4gY29tbWl0IDk3ODZiNjViYzYxYWMgKCJk
cm0vdHRtOiBmaXggbW1hcCByZWZjb3VudGluZyIpOg0KPj4+ICAgICAiRm9yIHRoYXQgdG8g
d29yayBwcm9wZXJseSB0aGUgZHJtX2dlbV9vYmplY3RfZ2V0KCkgY2FsbCBpbg0KPj4+ICAg
ICBkcm1fZ2VtX3R0bV9tbWFwKCkgbXVzdCBiZSBtb3ZlZCBzbyBpdCBoYXBwZW5zIGJlZm9y
ZSBjYWxsaW5nDQo+Pj4gICAgIG9iai0+ZnVuY3MtPm1tYXAoKSwgb3RoZXJ3aXNlIHRoZSBn
ZW0gcmVmY291bnQgd291bGQgZ28gZG93bg0KPj4+ICAgICB0byB6ZXJvLiINCj4+Pg0KPj4+
IFNpZ25lZC1vZmYtYnk6IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5jb20+DQo+
Pg0KPj4gQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KPj4NCj4+IFRoaXMgbG9va3MgZmluZSB0byBtZSwgYnV0IGl0IGFmZmVjdHMgbWFueSBk
cml2ZXJzLiBMZXQncyBtYXliZSB3YWl0IGENCj4+IGJpdCBpZiBtb3JlIHJldmlld3MgY29t
ZSBpdC4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+PiAtLS0NCj4+
Pg0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDYgKysrKy0tDQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+
Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4+PiBpbmRleCAyYTU0Zjg2ODU2YWYuLmUxODU0
ZmQyNGJiMCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMN
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4+PiBAQCAtNzE5LDEx
ICs3MTksMTMgQEAgaW50IGRybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKm9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpDQo+Pj4gICAgICAgIGlmIChv
YmotPmZ1bmNzICYmIG9iai0+ZnVuY3MtPm1tYXApIHsNCj4+PiAgICAgICAgICAgICAgICB2
bWEtPnZtX29wcyA9IG9iai0+ZnVuY3MtPnZtX29wczsNCj4+Pg0KPj4+ICsgICAgICAgICAg
ICAgZHJtX2dlbV9vYmplY3RfZ2V0KG9iaik7DQo+Pj4gICAgICAgICAgICAgICAgcmV0ID0g
b2JqLT5mdW5jcy0+bW1hcChvYmosIHZtYSk7DQo+Pj4gLSAgICAgICAgICAgICBpZiAocmV0
KQ0KPj4+ICsgICAgICAgICAgICAgaWYgKHJldCkgew0KPj4+ICsgICAgICAgICAgICAgICAg
ICAgICBkcm1fZ2VtX29iamVjdF9wdXQob2JqKTsNCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQo+Pj4gKyAgICAgICAgICAgICB9DQo+Pj4gICAgICAgICAgICAg
ICAgdm1hLT52bV9wcml2YXRlX2RhdGEgPSBvYmo7DQo+Pj4gLSAgICAgICAgICAgICBkcm1f
Z2VtX29iamVjdF9nZXQob2JqKTsNCj4+PiAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4+
PiAgICAgICAgfQ0KPj4+DQo+Pj4NCj4+DQo+PiAtLQ0KPj4gVGhvbWFzIFppbW1lcm1hbm4N
Cj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+IFNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQo+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+PiBHZXNjaMOkZnRzZsO8
aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------75FxQ6XgSegJnjeYho63huM6--

--------------knxpC7BKUt7bFXevIgy20Z8S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGCTpAFAwAAAAAACgkQlh/E3EQov+B5
LA/8D2ovPyBNKNEXN+Lsnzffz/x8VrPyXSYlpDwWgMHP4+0MpvIAVFhdHtyNrTIpYVkVBe56KtTv
SPgNMy7ev5gE9SdLTHZorke3PWFtOXnzt6ud/ppS4M1OJGnpsgD4afaYSdDMuIumY9pVvvQ3GwXK
PuKu6iWzZnxKbLmsrPBiTpNCUC/oC2MMKjofK+36KpUYx7xpLSf/Lw8Y1bl9Qgcctd/ehz9rF0yQ
9QPaIGt4Y7VNDsdEIER3kGctgxFrGpJRMzZ+NbsR0Q2fbmpaJ0/LuqK5S8m50LRll/LM3Uo8T9Z7
yQIqoB3ARKmhOaEoYUeIS69uLKIq0N6ruWtIm1XCZs+cHwxA20++qNnwUk+w70p93ncj4xd2//2g
Dh/ZBoP4gtji01BvB8Nig7T8OrtqrA6XHB7ffb982HLrq7cyMZrFJORNpUIQh10i9ADAMqqt475w
0PrAkAcFTs2fcSetCRK0Upki5VKlVQdOF4/ztxIh+jq48K+KE3BKaAnu4mpfVrVdl2jYMmvxlUdn
6hT+2h0FS3dkmyRzzhDd8QosmtRD9G/aqC9CBsHTgvbwKGjabr8Fuvf7bHt3ummjW13BfISHYAoG
mFCzu4nq9NsdoTa1eCI+9fRhql9jE+gaq8MPP8DKjevnjDEpePA0JhvVZmAgOXqlr7CUWCfIUswi
Q0o=
=hR8u
-----END PGP SIGNATURE-----

--------------knxpC7BKUt7bFXevIgy20Z8S--
