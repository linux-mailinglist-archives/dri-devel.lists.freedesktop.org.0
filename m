Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935AE6775EF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 08:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8563810E311;
	Mon, 23 Jan 2023 07:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF3610E311
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:59:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 602ED22CCC;
 Mon, 23 Jan 2023 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674460783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBfYgCVrQbSdszMWkdWWndkr6prC6UUStQAFClUVzwU=;
 b=p3HLQXkehcc9fRiLjFZbaUY5bPnkbxlcRiYhs6icVJBpe5/vvaGv3wENVYntmxqjDbax7R
 liR5prHaEbHGQhiG6dQIRNpIpdMaDdkASlfZy7mHo+a3dNcLevdw1ADEEmRWvrg5iUohL9
 WTtPEqYJji5s2xG3y3edHUt8JaZEWN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674460783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBfYgCVrQbSdszMWkdWWndkr6prC6UUStQAFClUVzwU=;
 b=bWtvqSUbfjF9q61XFYOY9Y5+nnxb1L+ENIxabWtY32oxIH39EaC8mnAh0ttFpKR46mFyrp
 MJ/KUARIY+8LxjBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E54D134F5;
 Mon, 23 Jan 2023 07:59:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6MRIEm8+zmOSRAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 07:59:43 +0000
Message-ID: <a3a6714c-0cba-5f5c-afa0-86383be96f59@suse.de>
Date: Mon, 23 Jan 2023 08:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 84/86] drm/drm_atomic_helper: Minimize include footprint
Content-Language: en-US
To: sam@ravnborg.org, dri-devel@lists.freedesktop.org
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
 <20230113-drm-include-v1-v1-84-c5cf72d8a5a2@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230113-drm-include-v1-v1-84-c5cf72d8a5a2@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JW9lGDerE4EcIDuAngvRnB0z"
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
--------------JW9lGDerE4EcIDuAngvRnB0z
Content-Type: multipart/mixed; boundary="------------bvre3Wxuo6qFPu2FaUhWovLw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, dri-devel@lists.freedesktop.org
Message-ID: <a3a6714c-0cba-5f5c-afa0-86383be96f59@suse.de>
Subject: Re: [PATCH 84/86] drm/drm_atomic_helper: Minimize include footprint
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
 <20230113-drm-include-v1-v1-84-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-84-c5cf72d8a5a2@ravnborg.org>

--------------bvre3Wxuo6qFPu2FaUhWovLw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCmluIHRoZSBzdWJqZWN0IGxpbmUsIEknZCB1c2UgJ2RlcGVuZGVuY2llcycgaW5z
dGVhZCBvZiAnZm9vdHByaW50Jy4gWW91ciANCmNob2ljZS4NCg0KQW0gMjEuMDEuMjMgdW0g
MjE6MDkgc2NocmllYiBTYW0gUmF2bmJvcmcgdmlhIEI0IFN1Ym1pc3Npb24gRW5kcG9pbnQ6
DQo+IEZyb206IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gDQo+IFJlZHVj
ZSBkcm1fYXRvbWljX2hlbHBlci5oIHRvIGluY2x1ZGUgb3IgZm9yd2FyZCB0aGUgbWluaW1h
bCBzZXQgb2YNCj4gZmlsZXMvc3ltYm9scyAtIHRvIG1pbmltaXplIHRoZSBpbXBhY3Qgb2Yg
dGhlIGZpbGVzIHRoYXQgaW5jbHVkZXMgdGhpcw0KPiBoZWFkZXIgZmlsZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gLS0tDQo+
ICAgaW5jbHVkZS9kcm0vZHJtX2F0b21pY19oZWxwZXIuaCB8IDIxICsrKysrKysrKysrKysr
LS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9hdG9taWNfaGVs
cGVyLmggYi9pbmNsdWRlL2RybS9kcm1fYXRvbWljX2hlbHBlci5oDQo+IGluZGV4IDMzZjk4
MmNkMWEyNy4uYzdmMmJjNDZiZDI0IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1f
YXRvbWljX2hlbHBlci5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWNfaGVscGVy
LmgNCj4gQEAgLTI4LDExICsyOCw5IEBADQo+ICAgI2lmbmRlZiBEUk1fQVRPTUlDX0hFTFBF
Ul9IXw0KPiAgICNkZWZpbmUgRFJNX0FUT01JQ19IRUxQRVJfSF8NCj4gICANCj4gLSNpbmNs
dWRlIDxkcm0vZHJtX2NydGMuaD4NCj4gLSNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVs
cGVyX3Z0YWJsZXMuaD4NCj4gLSNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyLmg+
DQo+IC0jaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmg+DQo+IC0jaW5j
bHVkZSA8ZHJtL2RybV91dGlsLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4g
Kw0KPiArI2luY2x1ZGUgPGRybS9kcm1fcGxhbmUuaD4NCj4gICANCj4gICAvKg0KPiAgICAq
IERyaXZlcnMgdGhhdCBkb24ndCBhbGxvdyBwcmltYXJ5IHBsYW5lIHNjYWxpbmcgbWF5IHBh
c3MgdGhpcyBtYWNybyBpbiBwbGFjZQ0KPiBAQCAtNDQsOCArNDIsMTcgQEANCj4gICAjZGVm
aW5lIERSTV9QTEFORV9OT19TQ0FMSU5HICgxPDwxNikNCj4gICANCj4gICBzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZTsNCj4gLXN0cnVjdCBkcm1fcHJpdmF0ZV9vYmo7DQo+IC1zdHJ1Y3Qg
ZHJtX3ByaXZhdGVfc3RhdGU7DQo+ICtzdHJ1Y3QgZHJtX2JyaWRnZTsNCj4gK3N0cnVjdCBk
cm1fYnJpZGdlX3N0YXRlOw0KPiArc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGU7DQo+ICtz
dHJ1Y3QgZHJtX2NydGNfc3RhdGU7DQo+ICtzdHJ1Y3QgZHJtX2RldmljZTsNCj4gK3N0cnVj
dCBkcm1fZW5jb2RlcjsNCj4gK3N0cnVjdCBkcm1fZnJhbWVidWZmZXI7DQo+ICtzdHJ1Y3Qg
ZHJtX21vZGVfc2V0Ow0KPiArc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4Ow0KPiAr
c3RydWN0IGRybV9wZW5kaW5nX3ZibGFua19ldmVudDsNCj4gKw0KDQpObyBleHRyYSBuZXds
aW5lIGhlcmUuDQoNCj4gICANCj4gICBpbnQgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfbW9k
ZXNldChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIAkJCQlzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUpOw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------bvre3Wxuo6qFPu2FaUhWovLw--

--------------JW9lGDerE4EcIDuAngvRnB0z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPOPm4FAwAAAAAACgkQlh/E3EQov+Dh
URAAzWDwmmSqmmRZDGYkCMef44ilRhrWYQPdWDzsGDTBHhJCRlhjulpn+e/bAcS3rjUdBkAhf49g
va/A0bf2gAvLzEqM41bKZawsMbyp2YESp8uUx/3KpNOU4uRmjM38iWjYMKNb3u9+NNWUDZwC2UMU
PJjJOWvc6NUSr8AqFbhxpXLrtfjQGCt24kS5je4tz9Da7bpuniN7Q75G8G7L2GQkJ4XYZwccxWfu
kpTyd/xfE8ny4sKenqc+QJCT2q7irPst0JVvYAG7QiMWJHSTMWUbwFy+j9zv85tmGHT3Hh9Cx6Me
jJtO6zxXFd4F4HYusDqPcX5o76/f0P4ZQ7ac7kdC9Rc/HIo2t7ZMenND/m5x1c5EfZs6xz3Hlf43
pwomL5F9Hx28WDBlEt3epDO30cneHU3F/V9kTTj+pV3uOOVC3S1nGQo8DyylnepFQ1SoY4aim1l0
RhhHvqCsWeh49L99komer8wdwcnLPmtPaasUTv/2ivEp9pFysUNTMfJiL7um2saGtAiMy168fXbK
BKtgBxqJVw9K+e8t62t+M1lTHgm6ARU/TASqvNwPiZCibqSzQUynAmSU4j6xkZhpmk29thlYUxiv
89aGliFEZybYti3NPh/wBel4FyGSSmt6Et9lD+crW8R+bCEv1jHCYqSC/aIY+g03ABARv0Pyv1sg
XMQ=
=/Lyt
-----END PGP SIGNATURE-----

--------------JW9lGDerE4EcIDuAngvRnB0z--
