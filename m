Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E326355DE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7896C10E543;
	Wed, 23 Nov 2022 09:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EAA10E52E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:25:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA84A1F85D;
 Wed, 23 Nov 2022 09:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669195542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E4IC6q0fE/DbiQY6q8wMtpjbvFyqLaLWpWkQLqc/6cw=;
 b=HUj8c0hFN1rb9z2SQJhc4SXHCTlr4YI7doc7G9D1aX16FHE7zK9jadctLwrI4yqQ+zBJWI
 I30bXrnVvQduD7npkThtVMvgPemn/XGZFvieIpEyxQcX48h7GgSBlS05iUggKFtIzDive0
 usq7ZgS0uXbpvaiFa3ivsEwthRZIWt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669195542;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E4IC6q0fE/DbiQY6q8wMtpjbvFyqLaLWpWkQLqc/6cw=;
 b=hGTzqPmfMIsMrEch0fU8maEjOSJZvrh2y2aCOU1hoWoGgI1CeYjerATTrWGo9N8lSnEEEf
 WJw+fgBO7oP4lfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A314713A37;
 Wed, 23 Nov 2022 09:25:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8qvIJhbnfWMODwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 09:25:42 +0000
Message-ID: <5924ac51-9d02-4bcc-0150-c3aedef2054c@suse.de>
Date: Wed, 23 Nov 2022 10:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/6] drm/gud: Don't retry a failed framebuffer flush
Content-Language: en-US
To: noralf@tronnes.org, stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-3-9de3afa3383e@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221122-gud-shadow-plane-v1-3-9de3afa3383e@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UW8EGPOQeKMrL3GF0vTyYW19"
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
--------------UW8EGPOQeKMrL3GF0vTyYW19
Content-Type: multipart/mixed; boundary="------------tU57uLv2PBFAjFnSqWs9hjU9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <5924ac51-9d02-4bcc-0150-c3aedef2054c@suse.de>
Subject: Re: [PATCH 3/6] drm/gud: Don't retry a failed framebuffer flush
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-3-9de3afa3383e@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v1-3-9de3afa3383e@tronnes.org>

--------------tU57uLv2PBFAjFnSqWs9hjU9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjExLjIyIHVtIDIxOjU4IHNjaHJpZWIgTm9yYWxmIFRyw7hubmVzIHZpYSBC
NCBTdWJtaXNzaW9uIEVuZHBvaW50Og0KPiBGcm9tOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4NCj4gDQo+IElmIGEgZnJhbWVidWZmZXIgZmx1c2ggZmFpbHMgdGhl
IGRyaXZlciB3aWxsIGRvIG9uZSByZXRyeSBieSByZXF1ZWluZyB0aGUNCj4gd29ya2VyLiBD
dXJyZW50bHkgdGhlIHdvcmtlciBpcyB1c2VkIGV2ZW4gZm9yIHN5bmNocm9ub3VzIGZsdXNo
aW5nLCBidXQgYQ0KPiBsYXRlciBwYXRjaCB3aWxsIGlubGluZSBpdCwgc28gdGhpcyBuZWVk
cyB0byBjaGFuZ2UuIFRoaW5raW5nIGFib3V0IGhvdyB0bw0KPiBzb2x2ZSB0aGlzIEkgY2Ft
ZSB0byB0aGUgY29uY2x1c2lvbiB0aGF0IHRoaXMgcmV0cnkgbWVjaGFuaXNtIHdhcyBhIGZp
eA0KPiBmb3IgYSBwcm9ibGVtIHRoYXQgd2FzIG9ubHkgaW4gdGhlIG1pbmQgb2YgdGhlIGRl
dmVsb3BlciAobWUpIGFuZCBub3QNCj4gc29tZXRoaW5nIHRoYXQgc29sdmVkIGEgcmVhbCBw
cm9ibGVtLg0KPiANCj4gU28gbGV0J3MgcmVtb3ZlIHRoaXMgZm9yIG5vdyBhbmQgcmV2aXNp
dCBsYXRlciBzaG91bGQgaXQgYmVjb21lIG5lY2Vzc2FyeS4NCj4gZ3VkX2FkZF9kYW1hZ2Uo
KSBoYXMgbm93IG9ubHkgb25lIGNhbGxlciBzbyBpdCBjYW4gYmUgaW5saW5lZC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPg0K
DQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jIHwgNDggKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2d1ZC9ndWRfcGlwZS5jDQo+IGluZGV4IDYxZjRhYmFmMTgxMS4uZmYxMzU4ODE1YWY1IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jDQo+IEBAIC0zMzMsMzcgKzMzMyw2IEBA
IHZvaWQgZ3VkX2NsZWFyX2RhbWFnZShzdHJ1Y3QgZ3VkX2RldmljZSAqZ2RybSkNCj4gICAJ
Z2RybS0+ZGFtYWdlLnkyID0gMDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCBndWRf
YWRkX2RhbWFnZShzdHJ1Y3QgZ3VkX2RldmljZSAqZ2RybSwgc3RydWN0IGRybV9yZWN0ICpk
YW1hZ2UpDQo+IC17DQo+IC0JZ2RybS0+ZGFtYWdlLngxID0gbWluKGdkcm0tPmRhbWFnZS54
MSwgZGFtYWdlLT54MSk7DQo+IC0JZ2RybS0+ZGFtYWdlLnkxID0gbWluKGdkcm0tPmRhbWFn
ZS55MSwgZGFtYWdlLT55MSk7DQo+IC0JZ2RybS0+ZGFtYWdlLngyID0gbWF4KGdkcm0tPmRh
bWFnZS54MiwgZGFtYWdlLT54Mik7DQo+IC0JZ2RybS0+ZGFtYWdlLnkyID0gbWF4KGdkcm0t
PmRhbWFnZS55MiwgZGFtYWdlLT55Mik7DQo+IC19DQo+IC0NCj4gLXN0YXRpYyB2b2lkIGd1
ZF9yZXRyeV9mYWlsZWRfZmx1c2goc3RydWN0IGd1ZF9kZXZpY2UgKmdkcm0sIHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiLA0KPiAtCQkJCSAgIHN0cnVjdCBkcm1fcmVjdCAqZGFtYWdl
KQ0KPiAtew0KPiAtCS8qDQo+IC0JICogcGlwZV91cGRhdGUgd2FpdHMgZm9yIHRoZSB3b3Jr
ZXIgd2hlbiB0aGUgZGlzcGxheSBtb2RlIGlzIGdvaW5nIHRvIGNoYW5nZS4NCj4gLQkgKiBU
aGlzIGVuc3VyZXMgdGhhdCB0aGUgd2lkdGggYW5kIGhlaWdodCBpcyBzdGlsbCB0aGUgc2Ft
ZSBtYWtpbmcgaXQgc2FmZSB0bw0KPiAtCSAqIGFkZCBiYWNrIHRoZSBkYW1hZ2UuDQo+IC0J
ICovDQo+IC0NCj4gLQltdXRleF9sb2NrKCZnZHJtLT5kYW1hZ2VfbG9jayk7DQo+IC0JaWYg
KCFnZHJtLT5mYikgew0KPiAtCQlkcm1fZnJhbWVidWZmZXJfZ2V0KGZiKTsNCj4gLQkJZ2Ry
bS0+ZmIgPSBmYjsNCj4gLQl9DQo+IC0JZ3VkX2FkZF9kYW1hZ2UoZ2RybSwgZGFtYWdlKTsN
Cj4gLQltdXRleF91bmxvY2soJmdkcm0tPmRhbWFnZV9sb2NrKTsNCj4gLQ0KPiAtCS8qIFJl
dHJ5IG9ubHkgb25jZSB0byBhdm9pZCBhIHBvc3NpYmxlIHN0b3JtIGluIGNhc2Ugb2YgY29u
dGludWVzIGVycm9ycy4gKi8NCj4gLQlpZiAoIWdkcm0tPnByZXZfZmx1c2hfZmFpbGVkKQ0K
PiAtCQlxdWV1ZV93b3JrKHN5c3RlbV9sb25nX3dxLCAmZ2RybS0+d29yayk7DQo+IC0JZ2Ry
bS0+cHJldl9mbHVzaF9mYWlsZWQgPSB0cnVlOw0KPiAtfQ0KPiAtDQo+ICAgdm9pZCBndWRf
Zmx1c2hfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ICAgew0KPiAgIAlzdHJ1
Y3QgZ3VkX2RldmljZSAqZ2RybSA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgZ3VkX2Rl
dmljZSwgd29yayk7DQo+IEBAIC00MDcsMTQgKzM3NiwxMCBAQCB2b2lkIGd1ZF9mbHVzaF93
b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gICAJCXJldCA9IGd1ZF9mbHVzaF9y
ZWN0KGdkcm0sIGZiLCBmb3JtYXQsICZyZWN0KTsNCj4gICAJCWlmIChyZXQpIHsNCj4gICAJ
CQlpZiAocmV0ICE9IC1FTk9ERVYgJiYgcmV0ICE9IC1FQ09OTlJFU0VUICYmDQo+IC0JCQkg
ICAgcmV0ICE9IC1FU0hVVERPV04gJiYgcmV0ICE9IC1FUFJPVE8pIHsNCj4gLQkJCQlib29s
IHByZXZfZmx1c2hfZmFpbGVkID0gZ2RybS0+cHJldl9mbHVzaF9mYWlsZWQ7DQo+IC0NCj4g
LQkJCQlndWRfcmV0cnlfZmFpbGVkX2ZsdXNoKGdkcm0sIGZiLCAmZGFtYWdlKTsNCj4gLQkJ
CQlpZiAoIXByZXZfZmx1c2hfZmFpbGVkKQ0KPiAtCQkJCQlkZXZfZXJyX3JhdGVsaW1pdGVk
KGZiLT5kZXYtPmRldiwNCj4gLQkJCQkJCQkgICAgIkZhaWxlZCB0byBmbHVzaCBmcmFtZWJ1
ZmZlcjogZXJyb3I9JWRcbiIsIHJldCk7DQo+IC0JCQl9DQo+ICsJCQkgICAgcmV0ICE9IC1F
U0hVVERPV04gJiYgcmV0ICE9IC1FUFJPVE8pDQo+ICsJCQkJZGV2X2Vycl9yYXRlbGltaXRl
ZChmYi0+ZGV2LT5kZXYsDQo+ICsJCQkJCQkgICAgIkZhaWxlZCB0byBmbHVzaCBmcmFtZWJ1
ZmZlcjogZXJyb3I9JWRcbiIsIHJldCk7DQo+ICsJCQlnZHJtLT5wcmV2X2ZsdXNoX2ZhaWxl
ZCA9IHRydWU7DQo+ICAgCQkJYnJlYWs7DQo+ICAgCQl9DQo+ICAgDQo+IEBAIC00MzksNyAr
NDA0LDEwIEBAIHN0YXRpYyB2b2lkIGd1ZF9mYl9xdWV1ZV9kYW1hZ2Uoc3RydWN0IGd1ZF9k
ZXZpY2UgKmdkcm0sIHN0cnVjdCBkcm1fZnJhbWVidWZmZXINCj4gICAJCWdkcm0tPmZiID0g
ZmI7DQo+ICAgCX0NCj4gICANCj4gLQlndWRfYWRkX2RhbWFnZShnZHJtLCBkYW1hZ2UpOw0K
PiArCWdkcm0tPmRhbWFnZS54MSA9IG1pbihnZHJtLT5kYW1hZ2UueDEsIGRhbWFnZS0+eDEp
Ow0KPiArCWdkcm0tPmRhbWFnZS55MSA9IG1pbihnZHJtLT5kYW1hZ2UueTEsIGRhbWFnZS0+
eTEpOw0KPiArCWdkcm0tPmRhbWFnZS54MiA9IG1heChnZHJtLT5kYW1hZ2UueDIsIGRhbWFn
ZS0+eDIpOw0KPiArCWdkcm0tPmRhbWFnZS55MiA9IG1heChnZHJtLT5kYW1hZ2UueTIsIGRh
bWFnZS0+eTIpOw0KPiAgIA0KPiAgIAltdXRleF91bmxvY2soJmdkcm0tPmRhbWFnZV9sb2Nr
KTsNCj4gICANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------tU57uLv2PBFAjFnSqWs9hjU9--

--------------UW8EGPOQeKMrL3GF0vTyYW19
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN95xYFAwAAAAAACgkQlh/E3EQov+BD
EBAAuXMU6MIl3VB1Q6vaY3zHTvOirMbs9LUGxwXBT7mF0RQzA+z31yGjutrUp4TAL8PbvLeVRRt6
CEdaPWe3WM0Czjlv+dY35m4btlvTrnQYFYhZ/3HUYRjYt+HMA8+6JykcG8sgNQyQI5mDitqE5WVV
NEcAkvgvO9yTzFd8VgD/Ubj9qyiUAu8h8aKvBUOMVfQnpWcWR1cGePdggWE4UFMIo+JUQHaDQVRc
bYOTiBtrpAvEUFjsHKQ67TPbrc+8zaOi9DTxtGgDzi/+Fae+ek7ZTCv2Ze+xwQXDxNxH5ZnMkVtW
Cs5ZCJ9M+0EcTCxtygaPE9yD7a2qocTZqeE1QS8n6yRqCrdEusLfrn5kDC+gOnZ7tyll2txAmfCT
I9WjO2Yfzyajmp1Ou6eXernU92hir+OuYAk64xtHG3/7aLCm3yHsXNu345VviGxjhgmhGdGUWfXD
Ge05Yrt0w72SeAgje7XZBqSvHs9mWKXZHVBO6zhB4a7LGg+kJbZjfgeMB4+XDT8I8NdaOguiDd3+
An6GqkjmlMdpdYj9detQPVYwsiPyNireNzy01eZSci2/Xpd8IHJmVVl8TtHCtNLvxVVOhet9fkGU
tjh/QU95BvlaUUZd6NBOkl3ALQ+sV5D+y3XP9vNmIURzSKTZeJPwoO1hXS6r/NAWxIfJWyCAW/81
w+M=
=eoJ1
-----END PGP SIGNATURE-----

--------------UW8EGPOQeKMrL3GF0vTyYW19--
