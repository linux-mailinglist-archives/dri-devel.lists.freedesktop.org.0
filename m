Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB76A7C40
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 09:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0F810E387;
	Thu,  2 Mar 2023 08:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0ED10E387
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 08:07:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 89B4421AFD;
 Thu,  2 Mar 2023 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677744478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5+bqNn0NQNCZFdOiiIuba3O8j9bSIWs/diy2l3e0Wo=;
 b=xVZPMT5Zh4s/LrpRPW7U8+MtBAsZb7AusJbWGIEpT3cgMq3d3tmlUvs6y/uVTF7U5omXBn
 EF5SEByaRfa5TnjoBXG4MhO1yGVTb89MVMHDQ1KPHx/ARmcY92ZA+beoISGkX7cwrF4ZzJ
 ruYByTzT7iS6hwHFl9z4ZivuqzvoawE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677744478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5+bqNn0NQNCZFdOiiIuba3O8j9bSIWs/diy2l3e0Wo=;
 b=Cc1sYg+cMeN/Fc9rJBOH6fO/Cp4S55QryNDQnA1Hr13GlvqPsVqgirvxdSwCr3sAzt2sce
 wma5s6fm7Z8QiUAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 462AF13A7D;
 Thu,  2 Mar 2023 08:07:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Zud4D15ZAGS7EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Mar 2023 08:07:58 +0000
Message-ID: <810b28dc-a0d1-0cd5-7b79-7f2a282b44b6@suse.de>
Date: Thu, 2 Mar 2023 09:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230301222903.458692-1-contact@emersion.fr>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230301222903.458692-1-contact@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SGVaEK0gr0OtOippNZNTS7h2"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Maxime Ripard <maxime@cerno.tech>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SGVaEK0gr0OtOippNZNTS7h2
Content-Type: multipart/mixed; boundary="------------5JRGerOvCwan4rKUGkz94cVN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <810b28dc-a0d1-0cd5-7b79-7f2a282b44b6@suse.de>
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
References: <20230301222903.458692-1-contact@emersion.fr>
In-Reply-To: <20230301222903.458692-1-contact@emersion.fr>

--------------5JRGerOvCwan4rKUGkz94cVN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDMuMjMgdW0gMjM6Mjkgc2NocmllYiBTaW1vbiBTZXI6DQo+IFdlIGRv
bid0IHBvcHVsYXRlIGdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgc28gb25seSBETUEtQlVG
cw0KPiBleHBvcnRlZCBmcm9tIG91ciBvd24gZGV2aWNlIGNhbiBiZSBpbXBvcnRlZC4gU3Rp
bGwsIHRoaXMgaXMgdXNlZnVsDQo+IHRvIHVzZXItc3BhY2UuDQoNClZSQU0gaGVscGVycyBk
b24ndCByZWFsbHkgb2ZmZXIgbXVjaCBmbGV4aWJpbGl0eSBvciBjb250cm9sIGluIHdoZXJl
IHRvIA0KcGxhY2UgYSBCTy4gV2hhdCBoYXBwZW5zIGlmIHRoZSBCTyBpcyBsb2NhdGVkIGlu
IGRldmljZSB2aWRlbyByYW0gYW5kIA0KY2Fubm90IGJlIHVzZWQgYnkgdGhlIG90aGVyIHBh
cnRpY2lwYW50PyBBIGJsYW5rIHNjcmVlbj8NCg0KSSdkIGFsc28gY29uc2lkZXIgVlJBTSBo
ZWxwZXJzIGFzIGRlcHJlY2F0ZWQuIFRoZSByZW1haW5pbmcgZmV3IGRyaXZlcnMgDQpjYW4g
YmUgY29udmVydGVkIHRvIFNITUVNIGhlbHBlcnM7IGV4Y2VwdCBtYXliZSBib2NocyBjb3Vs
ZCBnZXQgaXRzIG93biANClRUTS1iYXNlZCBtZW1vcnkgbWFuYWdlbWVudC4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxjb250
YWN0QGVtZXJzaW9uLmZyPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KPiBDYzogVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+DQo+IENjOiBNYXhp
bWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuaCB8IDQgKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2Vt
X3ZyYW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgNCj4g
aW5kZXggZDNlODkyMGMwYjY0Li5mNGFhYjY0NDExZDggMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmgNCj4gQEAgLTE2MCw3ICsxNjAsOSBAQCB2b2lkIGRybV9nZW1f
dnJhbV9zaW1wbGVfZGlzcGxheV9waXBlX2NsZWFudXBfZmIoDQo+ICAgCS5kZWJ1Z2ZzX2lu
aXQgICAgICAgICAgICAgPSBkcm1fdnJhbV9tbV9kZWJ1Z2ZzX2luaXQsIFwNCj4gICAJLmR1
bWJfY3JlYXRlCQkgID0gZHJtX2dlbV92cmFtX2RyaXZlcl9kdW1iX2NyZWF0ZSwgXA0KPiAg
IAkuZHVtYl9tYXBfb2Zmc2V0CSAgPSBkcm1fZ2VtX3R0bV9kdW1iX21hcF9vZmZzZXQsIFwN
Cj4gLQkuZ2VtX3ByaW1lX21tYXAJCSAgPSBkcm1fZ2VtX3ByaW1lX21tYXANCj4gKwkuZ2Vt
X3ByaW1lX21tYXAJCSAgPSBkcm1fZ2VtX3ByaW1lX21tYXAsIFwNCj4gKwkucHJpbWVfaGFu
ZGxlX3RvX2ZkCSAgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwgXA0KPiArCS5wcmlt
ZV9mZF90b19oYW5kbGUJICA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlDQo+ICAgDQo+
ICAgLyoNCj4gICAgKiAgVlJBTSBtZW1vcnkgbWFuYWdlcg0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------5JRGerOvCwan4rKUGkz94cVN--

--------------SGVaEK0gr0OtOippNZNTS7h2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQAWV0FAwAAAAAACgkQlh/E3EQov+D5
xxAAv7VLANBc3QY+LQ76WZSYp/wqsEpiJRBHvSIDS9GcVen/smUWycEfeOaoKCdPJ5OVkDlXHG4v
scBVywy1IS7enzlZOYZtfzYAn9ogMxTzFdpM/L+5SZ8LxLjK3k5uVnJ3/3gvaewPS6bNeHl73d1w
59o7t8Duu7I4hZHmifw9h+18irLKzNeptYCL4bTPZ21c5ZFct21BFtr89Tc3SJ+A7Z33iMICjXF3
PMf25mgPar7n9HbSghL3LAAySIjtCk5udVuFXTpXqwyJKJvuSKHaezd8K9eGsVhvPv0kQ7Yf04a7
NRXh927DAHXhZBBPY63Epoy7WttzT2g7eAqdq2tPMLVyGWpyKLi1N6C3TelqzhgO3s9sCt6ujxVk
0F29kl/Kuq+ddUQKh2G5mk737Mp8mZtxINvqV5QtanugqHTCzDjZyBojMGwMN4oYlB9ybSN3Smml
1uPb/JcYrSCqxC73S5554ZoCnmd/t1T8vdXoEJtEfw+xgBwns9KJmroNV/cBhpXQuo09jMrBOW1I
ouKyf2R4QSPEsH6c6HH2EBExNOUeoOCGwIuHiEOsn+B7GEEHiqMRua5FwkAKa7fmzxE1q+EZgjQw
cJbdZvmmTUb3KCwz9iuQ9J3a9Ckn6KF6J+3RUshI5o4h3kAJXA0S5AOHaIZ52yx7yzEod6+ek+AY
l1I=
=m289
-----END PGP SIGNATURE-----

--------------SGVaEK0gr0OtOippNZNTS7h2--
