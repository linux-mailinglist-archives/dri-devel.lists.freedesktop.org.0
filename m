Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818536A84DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 16:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A718910E50F;
	Thu,  2 Mar 2023 15:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131EA10E508
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 15:05:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADDD51FE69;
 Thu,  2 Mar 2023 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677769556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vzjP/DOanbJHGyRxn1hkja9Gi8hFkwLGICLTz3pBFZA=;
 b=eDqOOjSlhgekGBUNc7/iF97fHBFYU1V1jFEhUZpvxRcMD6e3MNGRmvmlyO4yDKOu7eQvR6
 hItWf9lZteS/ZxcvhNJnw5C+01NqycoFjpsjCtdRxhOb8PhCtKrRvJNg6UMG7oY0IhUVje
 fYdcDkFWDxAG4Seo6wzCPrwcyjJOvkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677769556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vzjP/DOanbJHGyRxn1hkja9Gi8hFkwLGICLTz3pBFZA=;
 b=leJFzWbcSqgGQQiUV310/DDjbH8jqUvGULwt3fJcI25iFTTWZMS1l/zfUbCeK4gxHcfwL+
 CMUWLvW9CGVr4gDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8718713349;
 Thu,  2 Mar 2023 15:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3O4EIFS7AGRvewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Mar 2023 15:05:56 +0000
Message-ID: <0b1eef4e-d26f-3bd9-6177-b4a88a4d94f9@suse.de>
Date: Thu, 2 Mar 2023 16:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] drm/vram-helper: turn on PRIME import/export
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230302143502.500661-1-contact@emersion.fr>
 <20230302143502.500661-2-contact@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230302143502.500661-2-contact@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------30mqOE3CIs0Bme3scGt10sG5"
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
--------------30mqOE3CIs0Bme3scGt10sG5
Content-Type: multipart/mixed; boundary="------------CH5PYehvLQX39yCOfTA0kIuQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <0b1eef4e-d26f-3bd9-6177-b4a88a4d94f9@suse.de>
Subject: Re: [PATCH v2 2/2] drm/vram-helper: turn on PRIME import/export
References: <20230302143502.500661-1-contact@emersion.fr>
 <20230302143502.500661-2-contact@emersion.fr>
In-Reply-To: <20230302143502.500661-2-contact@emersion.fr>

--------------CH5PYehvLQX39yCOfTA0kIuQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDAyLjAzLjIzIHVtIDE1OjM1IHNjaHJpZWIgU2ltb24gU2VyOg0KPiBXZSBkb24n
dCBwb3B1bGF0ZSBkcm1fZHJpdmVyLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgc28gb25s
eQ0KPiBETUEtQlVGcyBleHBvcnRlZCBmcm9tIG91ciBvd24gZGV2aWNlIGNhbiBiZSBpbXBv
cnRlZC4gV2UgZG9uJ3QNCj4gcG9wdWxhdGUgZHJtX2dlbV9vYmplY3RfZnVuY3MuZ2V0X3Nn
X3RhYmxlIHNvIERNQS1CVUZzIGNhbm5vdCBiZQ0KPiBpbXBvcnRlZCBpbnRvIGFub3RoZXIg
ZGV2aWNlLiBTdGlsbCwgdGhpcyBpcyB1c2VmdWwgdG8gdXNlci1zcGFjZQ0KPiB0byBzaGFy
ZSBidWZmZXJzIGJldHdlZW4gcHJvY2Vzc2VzIGFuZCBiZXR3ZWVuIEFQSSBib3VuZGFyaWVz
DQo+IChlLmcuIHdscm9vdHMgaGFyZC1yZXF1aXJlcyBQUklNRSBpbXBvcnQvZXhwb3J0IHN1
cHBvcnQpLg0KPiANCj4gdjI6IGV4cGFuZCBjb21taXQgbWVzc2FnZQ0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPg0KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4gQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogVGlhbiBUYW8gPHRpYW50YW82QGhp
c2lsaWNvbi5jb20+DQo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4N
Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4g
Q2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgIGlu
Y2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCB8IDQgKysrLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmgNCj4gaW5kZXggZDNlODkyMGMwYjY0Li5mNGFhYjY0NDEx
ZDggMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaA0K
PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgNCj4gQEAgLTE2MCw3
ICsxNjAsOSBAQCB2b2lkIGRybV9nZW1fdnJhbV9zaW1wbGVfZGlzcGxheV9waXBlX2NsZWFu
dXBfZmIoDQo+ICAgCS5kZWJ1Z2ZzX2luaXQgICAgICAgICAgICAgPSBkcm1fdnJhbV9tbV9k
ZWJ1Z2ZzX2luaXQsIFwNCj4gICAJLmR1bWJfY3JlYXRlCQkgID0gZHJtX2dlbV92cmFtX2Ry
aXZlcl9kdW1iX2NyZWF0ZSwgXA0KPiAgIAkuZHVtYl9tYXBfb2Zmc2V0CSAgPSBkcm1fZ2Vt
X3R0bV9kdW1iX21hcF9vZmZzZXQsIFwNCj4gLQkuZ2VtX3ByaW1lX21tYXAJCSAgPSBkcm1f
Z2VtX3ByaW1lX21tYXANCj4gKwkuZ2VtX3ByaW1lX21tYXAJCSAgPSBkcm1fZ2VtX3ByaW1l
X21tYXAsIFwNCj4gKwkucHJpbWVfaGFuZGxlX3RvX2ZkCSAgPSBkcm1fZ2VtX3ByaW1lX2hh
bmRsZV90b19mZCwgXA0KPiArCS5wcmltZV9mZF90b19oYW5kbGUJICA9IGRybV9nZW1fcHJp
bWVfZmRfdG9faGFuZGxlDQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCg0KPiAgIA0KPiAgIC8qDQo+ICAgICogIFZSQU0gbWVtb3J5IG1h
bmFnZXINCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------CH5PYehvLQX39yCOfTA0kIuQ--

--------------30mqOE3CIs0Bme3scGt10sG5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQAu1QFAwAAAAAACgkQlh/E3EQov+BX
nRAAzNRpXkmlJ7Ncl04btTFq63KfR2QSjm7FJAQd8zEMfpZFNTT7eEhJs+X71xwMdXGKUa9YgH2f
vUBWnCfOGDYMhjElMKCYTMl1Igi4BSlVq5gfEIB9SAO1wYbf5q8OsqL33QcJV25XkQno2hYLON/4
DI89YXu+I0QVlDLIn+vS7iG/U54YZDJ2y/D/QcqM3nKVt6fZVWyFKmsMhPFQqPNZtwlh/hk/KCyI
TeK8p3wgExCb+TAL1dni19OC9U6dBr0+pfv7QA2nAf0YOwwgCBrGnq1h2qEpJCx8pd0tY1OLM4hV
3USCg9E9cxfPv/jX1pUibVSCddH/on9Xq4bx7oZp+tGoVZrncmbnVbByv5Qp6ogiJH0xgz6LYbc4
XlUBZ7Ep7oA/a0d17h3DhWxm2MM2IF2s5IrArv9ECcssWc2fAX17VSE2d+uNzn8dFazm+386oVCs
m6JmSxu0cjfofYm/SXE2Y8w8djj37CFB4wYRixdHYAm0Dx/hbQtYeo2TkH4bw4/cBz2zd52j3eu/
Km59Kf/hCjqeXh/y0AU4j0PZyarmnx8rWmqThkPyxmuVwKSITn5c1imrhQU3zfbwx+NV4c8GJHCN
amiS2CA9Vd8d3RfFIA6QW7cLkpXvy8keWi7A96zR9jjCWB1+JmQAUXAX7WYK6F+t69ppzEGN3KQe
cuA=
=WJ00
-----END PGP SIGNATURE-----

--------------30mqOE3CIs0Bme3scGt10sG5--
