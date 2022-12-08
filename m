Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66C646A40
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 09:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDBF10E46E;
	Thu,  8 Dec 2022 08:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CFE10E1B0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 08:15:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 039882076A;
 Thu,  8 Dec 2022 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670487319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6gekPT27rlfRj+Y5dIlmyOGBIt/bS6JGzZSYpWxyIck=;
 b=mepqkz5W9D5ai2n/86YUgmVLe+70Be66AYNTzcjVJJYdmmupjlWd1eASbFzQMDfU8CRnPZ
 2YE0hqceDzuH6VaUYeIdKpMTS2M2aFEcNfnph1GtmP35oG0j9aCqGLssqhIwb6V+LuQExR
 mC++E8+d8xOwRwbFv1qAqQQaG1xZFU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670487319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6gekPT27rlfRj+Y5dIlmyOGBIt/bS6JGzZSYpWxyIck=;
 b=OxocUXawdAaMuoHdpCuE1ItKfT39kWLzxWHvtZPehJZ+oYfUWay7n022WJes4M/oXrAREo
 aBRSrdqy7UpYvMDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF323138E0;
 Thu,  8 Dec 2022 08:15:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id G0p9NRadkWPSHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Dec 2022 08:15:18 +0000
Message-ID: <fcb98c52-a8d4-2cca-da68-f3f714cde3bc@suse.de>
Date: Thu, 8 Dec 2022 09:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/gud: Fix missing include
To: noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
References: <20221207-gud-missing-include-v1-0-c5b32c9c59da@tronnes.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221207-gud-missing-include-v1-0-c5b32c9c59da@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CI7sMeuzYG60OJF31ff64rtk"
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
--------------CI7sMeuzYG60OJF31ff64rtk
Content-Type: multipart/mixed; boundary="------------0tpjneRz1EIFqap9TPeJSUnj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Message-ID: <fcb98c52-a8d4-2cca-da68-f3f714cde3bc@suse.de>
Subject: Re: [PATCH] drm/gud: Fix missing include
References: <20221207-gud-missing-include-v1-0-c5b32c9c59da@tronnes.org>
In-Reply-To: <20221207-gud-missing-include-v1-0-c5b32c9c59da@tronnes.org>

--------------0tpjneRz1EIFqap9TPeJSUnj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjIgdW0gMjA6NTEgc2NocmllYiBOb3JhbGYgVHLDuG5uZXMgdmlh
IEI0IFN1Ym1pc3Npb24gRW5kcG9pbnQ6DQo+IEZyb206IE5vcmFsZiBUcsO4bm5lcyA8bm9y
YWxmQHRyb25uZXMub3JnPg0KPiANCj4gQWRkIG1pc3Npbmcgdm1hbGxvYy5oIGluY2x1ZGUu
DQo+IA0KPiBGaXhlczogYzE3ZDA0ODYwOWJmICgiZHJtL2d1ZDogVXNlIHRoZSBzaGFkb3cg
cGxhbmUgaGVscGVyIikNCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KDQpUaGUgbWlzc2luZy12bWFsbG9jKCkgZXJyb3IgaXMgYSByZWFs
IGNsYXNzaWMuIDooIFNvbWUgYXJjaGl0ZWN0dXJlcyANCmRlY2xhcmUgdGhlIGZ1bmN0aW9u
IGFuZCBzb21lIGRvbid0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ndWQvZ3VkX3BpcGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYw0KPiBp
bmRleCA2MmM0M2QzNjMyZDQuLmRjMTZhOTI2MjVkNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ndWQv
Z3VkX3BpcGUuYw0KPiBAQCAtNSw2ICs1LDcgQEANCj4gICANCj4gICAjaW5jbHVkZSA8bGlu
dXgvbHo0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3VzYi5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L3ZtYWxsb2MuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+DQo+ICAg
DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+DQo+IA0KPiAtLS0NCj4gYmFzZS1j
b21taXQ6IDVhZDhlNjNlYmJhM2Q1YTA3MzBiNDMxODBiMjAwZTQxZWViOTQwOWMNCj4gY2hh
bmdlLWlkOiAyMDIyMTIwNy1ndWQtbWlzc2luZy1pbmNsdWRlLTljY2Y1NjM4MmY4YQ0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------0tpjneRz1EIFqap9TPeJSUnj--

--------------CI7sMeuzYG60OJF31ff64rtk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmORnRYFAwAAAAAACgkQlh/E3EQov+Cs
nQ/+JPTb7qe3htG2EALj21X8xIQZRof9xYuH4O70jABL9O/Eu1rLK2N6uv/zEI/6dTHNUHhB3BRD
6zjMgT820VLgZJpmZohI/SpgZYoWAeU1Okk+hZ6esnOXAlZUVZ3SCJKYxGdLx3S3eRgfkzcXRFb4
vUKU9aG7rk8lJGDGXEk9MRNk9l98lzl4s+tQ01wBebXJn4/EfzQGZjT5KIuWeSgMPCrqLSbYujO8
bh3VU++Dk9WzcvoxM59sk9SgXtiaVUSTFWH8SmNJ3s3HXZ6kEZzA/eL6Pks4n3RlgUr3j8krjnJ5
hNTBbNod6Pw5iqJ+px+oe0rvuzyS7D1Ad2Lgrjc6jpmTNYGx0eB4q18gvkdpVO9ccfVzARxU0LEE
oYqd5dBWtB6TDKTDcaunm4l+dBoHehpO3xCuNHHI5XKIwGM/6wN5bdnvG++g+qo0U1uumKtk0du9
voZZAAdAx/s1Pvjrl1m+4T+hC8IGzT9wlLp3+926D9cKOSDiM/H++7TOnnfZl1JW6bMb/fnw8Xms
8kKrAgI9fQx4YFKntLqlXZ5BOasHHXg7s6cPee8nwbCUqkU4DzqTKIUx2Nn8tITmVfuV5kOqf2Pe
U0YqQ89XoOzc6e4hwoDl9qZM5XPNdFBygn14qNK84khSQVYjUynzHUkWmu/aLsGcwmFf2Slmb61f
MEc=
=ZETV
-----END PGP SIGNATURE-----

--------------CI7sMeuzYG60OJF31ff64rtk--
