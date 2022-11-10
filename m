Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C34623E49
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 10:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5DF10E106;
	Thu, 10 Nov 2022 09:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D81E10E106
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 09:09:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 142EA3389E;
 Thu, 10 Nov 2022 09:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668071397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jlmp5tnzRQdpoqkiqp2GV5YZQZPpYHMe3YiRaVj2teU=;
 b=sm38mFGDRvnLCPLoCbiLXNeVJZSs1XGdripP0FPXDQPdEbTf6/o5IjW3ZifcTLuiM4cAew
 EnX6SodcxajUtph0azsbJPXHq/4KSsLoC5yLWWsJW8phd/p+V/1EapnAd5EJ2f9Gzvmf0I
 q6BtKvs3+7j4fedGnKxxCwCnVa5bPfY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668071397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jlmp5tnzRQdpoqkiqp2GV5YZQZPpYHMe3YiRaVj2teU=;
 b=dbgtA3T5Gf9bY6BDIjaStoUB4mz25EQiJc+HbwywzZi1L59rATMNiBTaHhIHfKIhbUpXsJ
 Qwr5gO2GwxHEDFBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01EEC1346E;
 Thu, 10 Nov 2022 09:09:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OKgzO+S/bGPRWQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Nov 2022 09:09:56 +0000
Message-ID: <36d0c28a-0ada-2d45-b740-8a19fbb9800e@suse.de>
Date: Thu, 10 Nov 2022 10:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
Content-Language: en-US
To: Chunyou Tang <tangchunyou@163.com>
References: <20221108020321.911-1-tangchunyou@163.com>
 <d4534f8e-d4b5-8484-dde5-34ce671972af@suse.de>
 <20221109170745.0000039b@163.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221109170745.0000039b@163.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7UAXQ2KwRLj8c33mvuEANB9h"
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
--------------7UAXQ2KwRLj8c33mvuEANB9h
Content-Type: multipart/mixed; boundary="------------e4B0cD2gxACUIaYrWm3Cuiui";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chunyou Tang <tangchunyou@163.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <36d0c28a-0ada-2d45-b740-8a19fbb9800e@suse.de>
Subject: Re: [PATCH] drm/gem-shmem: When drm_gem_object_init failed, should
 release object
References: <20221108020321.911-1-tangchunyou@163.com>
 <d4534f8e-d4b5-8484-dde5-34ce671972af@suse.de>
 <20221109170745.0000039b@163.com>
In-Reply-To: <20221109170745.0000039b@163.com>

--------------e4B0cD2gxACUIaYrWm3Cuiui
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMTEuMjIgdW0gMTA6MDcgc2NocmllYiBDaHVueW91IFRhbmc6DQo+IEhp
LA0KPiANCj4gZHJtX2dlbV9vYmplY3RfaW5pdCgpIHdpbGwgZG8gdGhlc2UgYmVmb3JlIGZh
aWxlZDoNCj4gDQo+IHZvaWQgZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc2l6ZV90DQo+IHNpemUpIHsNCj4gICAgICAg
ICAgQlVHX09OKChzaXplICYgKFBBR0VfU0laRSAtIDEpKSAhPSAwKTsNCj4gDQo+ICAgICAg
ICAgIG9iai0+ZGV2ID0gZGV2Ow0KPiAgICAgICAgICBvYmotPmZpbHAgPSBOVUxMOw0KPiAN
Cj4gICAgICAgICAga3JlZl9pbml0KCZvYmotPnJlZmNvdW50KTsNCj4gICAgICAgICAgb2Jq
LT5oYW5kbGVfY291bnQgPSAwOw0KPiAgICAgICAgICBvYmotPnNpemUgPSBzaXplOw0KPiAg
ICAgICAgICBkbWFfcmVzdl9pbml0KCZvYmotPl9yZXN2KTsNCj4gICAgICAgICAgaWYgKCFv
YmotPnJlc3YpDQo+ICAgICAgICAgICAgICAgICAgb2JqLT5yZXN2ID0gJm9iai0+X3Jlc3Y7
DQo+IA0KPiAgICAgICAgICBkcm1fdm1hX25vZGVfcmVzZXQoJm9iai0+dm1hX25vZGUpOw0K
PiAgICAgICAgICBJTklUX0xJU1RfSEVBRCgmb2JqLT5scnVfbm9kZSk7DQo+IH0NCj4gDQo+
IHNvIEkgdGhpbmsgd2hlbiBpdCBmYWlsZWQsIHNob3VsZCB1c2UgZHJtX2dlbV9vYmplY3Rf
cmVsZWFzZSgpDQo+IHRvIGRvIGRtYV9yZXN2X2ZpbmkoKSBhbmQgb3RoZXJzLg0KDQpUaGFu
a3MgZm9yIGJyaW5naW5nIHRoaXMgdXAuIFdlIHNob3VsZCBpbmRlZWQgY2FsbCBkbWFfcmVz
dl9maW5pKCksIGJ1dCANCm5vdCB2aWEgZHJtX2dlbV9vYmplY3RfcmVsYWVzZSgpLiAgSWYg
dGhlIGJyYW5jaCBhdCBbMV0gaGFzIGFuIGVycm9yLCBpdCANCnNob3VsZCBjYWxsIGRtYV9y
ZXN2X2ZpbmkoKSBzbyB0aGF0IHRoZSBHRU0gb2JqZWN0IGlzIHN0aWxsIA0KdW5pbml0aWFs
aXplZCBhbmQgY2FuIGJlIGZyZWVkLg0KDQpJTUhPIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8g
aW50cm9kdWNlIGRybV9nZW1fcHJpdmF0ZV9vYmplY3RfZmluaSgpIHRvIA0KcmV2ZXJ0IHRo
ZSBlZmZlY3RzIG9mIGRybV9nZW1fcHJpdmF0ZV9vYmplY3RfaW5pdCgpLg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMjTDEzMw0KDQo+IA0K
PiBhbm90aGVyLCBpZiBkcm1fZ2VtX29iamVjdF9pbml0KCkgZmFpbHMsIHRoZSBkcm1fZ2Vt
X2hhbmRsZV9jcmVhdGUoKQ0KPiBjYW4gbm90IGJlIGNhbGxlZC4NCj4gDQo+IOS6jiBUdWUs
IDggTm92IDIwMjIgMDk6Mjg6MzQgKzAxMDANCj4gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IOWGmemBkzoNCj4gDQo+PiBIaQ0KPj4NCj4+IEFtIDA4LjExLjIy
IHVtIDAzOjAzIHNjaHJpZWIgQ2h1bnlvdVRhbmc6DQo+Pj4gd2hlbiBnb3RvIGVycl9mcmVl
LCB0aGUgb2JqZWN0IGhhZCBpbml0LCBzbyBpdCBzaG91bGQgYmUgcmVsZWFzZQ0KPj4+IHdo
ZW4gZmFpbC4NCj4+DQo+PiBJZiB0aGUgY2FsbCB0byBkcm1fZ2VtX29iamVjdF9pbml0KCkg
ZmFpbHMsIHRoZSBvYmplY3QgaXMgc3RpbGwNCj4+IHVuaW5pdGlhbGl6ZWQuIEFkbWl0dGVk
bHksIHRoZSBjYWxsIHRvIGdlbV9jcmVhdGVfb2JqZWN0IGNvdWxkIG5lZWQNCj4+IGFkZGl0
aW9uYWwgY2xlYW51cCwgYnV0IGl0IGFwcGVhcnMgYXMgaWYgbm8gb25lIGhhcyBoYWQgYSBu
ZWVkIGZvcg0KPj4gdGhpcyBzbyBmYXIuDQo+Pg0KPj4gSXMgdGhlcmUgYW55dGhpbmcgdGhh
dCBtaWdodCBsZWFrPw0KPj4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENodW55b3VUYW5n
IDx0YW5nY2h1bnlvdUAxNjMuY29tPg0KPj4+IC0tLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwgNCArKy0tDQo+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPj4+IGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgaW5kZXgNCj4+PiAzNTEzOGY4
YTM3NWMuLjJlNWUzMjA3MzU1ZiAxMDA2NDQgLS0tDQo+Pj4gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyArKysNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5jIEBAIC0xMDQsMTAgKzEwNCwxMCBAQA0KPj4+IF9fZHJtX2dl
bV9zaG1lbV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsIGJv
b2wNCj4+PiBwcml2YXRlKSByZXR1cm4gc2htZW07DQo+Pj4gICAgDQo+Pj4gLWVycl9yZWxl
YXNlOg0KPj4+IC0JZHJtX2dlbV9vYmplY3RfcmVsZWFzZShvYmopOw0KPj4+ICAgIGVycl9m
cmVlOg0KPj4+ICAgIAlrZnJlZShvYmopOw0KPj4+ICtlcnJfcmVsZWFzZToNCj4+PiArCWRy
bV9nZW1fb2JqZWN0X3JlbGVhc2Uob2JqKTsNCj4+DQo+PiBZb3UgaGF2ZSBub3cgZnJlZWQg
dGhlIG9iamVjdCdzIG1lbW9yeSBiZWZvcmUgcmVsZWFzaW5nIGl0LiBOb3QgZ29pbmcNCj4+
IHRvIHdvcmsuDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4gICAg
DQo+Pj4gICAgCXJldHVybiBFUlJfUFRSKHJldCk7DQo+Pj4gICAgfQ0KPj4NCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------e4B0cD2gxACUIaYrWm3Cuiui--

--------------7UAXQ2KwRLj8c33mvuEANB9h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNsv+QFAwAAAAAACgkQlh/E3EQov+Dn
8w//YbGBoQdhEr7EYmaPK7NgbiPu2eRQ509nADcHr3LVnw3Tp0v2lVoenPoJv05s8t+tMtN/Az4Q
NIBv9bQB3Z2ob10PbnMqcKTXxmEDirAb6+s5IFwQpkPpvc9GsZCBtTjm/Jz5V5Nf2qecnlq3XqdC
AeShi3SYR8PxIa06BJxh3yq9+CL2aXWy20UFXVj1iHx55aGpbGEyXwKAUP895/D6HRytau2z59i4
CdyQzfx5fULmYDgHRhAYX47mfrHyhRe+tVcAe1xuJSaOlbAKerWwZaLGSuaP7uXldUK4QFynlfOp
IJS+zyydaJiBvHzrYgRZTG/jbxVc/YWjfGqX2Ov30B1FiciEMaca+wLlwnX7wKbAvrhi1k5hFfUs
fVHr4ui3AXQmcjLPYCYFBaRhAiX45iVM76KdyvD3wJEu457X4E+k95W3W09jfGMAOcVT5BzDkWgi
BBjoieo1hkmZFAs3EdXvtzq6D/YsxtpWhHv7+zjbk2UkTsf+Y00m+q9XquT/Dqib4mV9Yy4+HZ86
UQt0iMRGWGPsZKlqGr1EE7Tt62jh9YoJu/e/qZsxnDNB9gFw5ssM2qFCrXFu8Q8pHIfOj1EAHNu0
q2L8EhbDyYrhyQsTJ62TGiuW49bE8Qb6YaU7hMtIC/m/Vb7QcHvSACmJFPK4ry7t95x62UIOiawK
QG8=
=L+S2
-----END PGP SIGNATURE-----

--------------7UAXQ2KwRLj8c33mvuEANB9h--
