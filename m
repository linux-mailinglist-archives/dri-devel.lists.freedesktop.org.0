Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FFF717D69
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 12:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25A510E1BF;
	Wed, 31 May 2023 10:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C9410E1BF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 10:51:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C130B218E0;
 Wed, 31 May 2023 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685530307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uGlrXdScy+uQ/dFYb1kgYb+EfH5nNgJO7w5uHyZerhE=;
 b=YzHkaBjGoO/rgvm7EzcjG2lw97hJgSM6S51v5Mp8H+MjgGRcWnOd7w94tNCuRFsAT2m9tk
 0zL+tsWdMfQ9q0bQjz5Po+vSCFQcrpDEM7MxOlJ8uazYANLN+zCQsIGZlwRKsfcEyT3fWT
 8GwUDEVLKC6fhlUIoXvQbKVA5LtbQWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685530307;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uGlrXdScy+uQ/dFYb1kgYb+EfH5nNgJO7w5uHyZerhE=;
 b=Ob2hTF7PIFB0LQ3Kw5JOwggaMKS4A5h/JjZWqF73aPF5mzsZNKxI24/YVLCUr8BUBwHaAe
 rZJQ8puebMTQK2DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BF6D13488;
 Wed, 31 May 2023 10:51:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k+KvH8Mmd2SQLgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 31 May 2023 10:51:47 +0000
Message-ID: <01973671-55e0-d701-ca38-a583d441a4fc@suse.de>
Date: Wed, 31 May 2023 12:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] drm/ast: Fix modeset failed on DisplayPort
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230525012918.11918-1-jammy_huang@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230525012918.11918-1-jammy_huang@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bWGn0bHpltOcnfUMiQYxRtWn"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bWGn0bHpltOcnfUMiQYxRtWn
Content-Type: multipart/mixed; boundary="------------g9zM0e2qrVQ4lm8aYK00AO00";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <01973671-55e0-d701-ca38-a583d441a4fc@suse.de>
Subject: Re: [PATCH v2] drm/ast: Fix modeset failed on DisplayPort
References: <20230525012918.11918-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20230525012918.11918-1-jammy_huang@aspeedtech.com>

--------------g9zM0e2qrVQ4lm8aYK00AO00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmFtbXkNCg0KQW0gMjUuMDUuMjMgdW0gMDM6Mjkgc2NocmllYiBKYW1teSBIdWFuZzoN
Cj4gSWYgd2Ugc3dpdGNoIGRpc3BsYXkgYW5kIHVwZGF0ZSBjdXJzb3IgdG9nZXRoZXIsIGl0
IGNvdWxkIGxlYWQgdG8NCj4gbW9kZXNldCBmYWlsZWQgYmVjYXVzZSBvZiBjb25jdXJyZW50
IGFjY2VzcyB0byBJTyByZWdpc3RlcnMuDQo+IA0KPiBBZGQgbG9jayBwcm90ZWN0aW9uIGlu
IERQJ3MgZWRpZCBhY2Nlc3MgdG8gYXZvaWQgdGhpcyBwcm9ibGVtLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSmFtbXkgSHVhbmcgPGphbW15X2h1YW5nQGFzcGVlZHRlY2guY29tPg0KPiAt
LS0NCj4gICB2MiBjaGFuZ2VzOg0KPiAgICAtIEZpeCBidWlsZCBlcnJvciBzaW5jZSBuZXcg
c3RydWN0IGFzdF9kZXZpY2UgaXMgdXNlZC4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfbW9kZS5jIHwgMTEgKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiBpbmRl
eCAzNjM3NDgyOGY2YzguLjlmY2JmNTQwZDZmYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYw0KPiBAQCAtMTY0Nyw2ICsxNjQ3LDggQEAgc3RhdGljIGludCBhc3RfZHA1MDFf
b3V0cHV0X2luaXQoc3RydWN0IGFzdF9kZXZpY2UgKmFzdCkNCj4gICBzdGF0aWMgaW50IGFz
dF9hc3RkcF9jb25uZWN0b3JfaGVscGVyX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQ0KPiAgIHsNCj4gICAJdm9pZCAqZWRpZDsNCj4gKwlzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2ID0gY29ubmVjdG9yLT5kZXY7DQo+ICsJc3RydWN0IGFzdF9kZXZpY2Ug
KmFzdCA9IHRvX2FzdF9kZXZpY2UoZGV2KTsNCj4gICANCj4gICAJaW50IHN1Y2M7DQo+ICAg
CWludCBjb3VudDsNCj4gQEAgLTE2NTUsMTAgKzE2NTcsMTggQEAgc3RhdGljIGludCBhc3Rf
YXN0ZHBfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvcikNCj4gICAJaWYgKCFlZGlkKQ0KPiAgIAkJZ290byBlcnJfZHJtX2Nvbm5l
Y3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eTsNCj4gICANCj4gKwkvKg0KPiArCSAqIFByb3Rl
Y3QgYWNjZXNzIHRvIEkvTyByZWdpc3RlcnMgZnJvbSBjb25jdXJyZW50IG1vZGVzZXR0aW5n
DQo+ICsJICogYnkgYWNxdWlyaW5nIHRoZSBJL08tcmVnaXN0ZXIgbG9jay4NCj4gKwkgKi8N
Cj4gKwltdXRleF9sb2NrKCZhc3QtPmlvcmVnc19sb2NrKTsNCj4gKw0KPiAgIAlzdWNjID0g
YXN0X2FzdGRwX3JlYWRfZWRpZChjb25uZWN0b3ItPmRldiwgZWRpZCk7DQo+ICAgCWlmIChz
dWNjIDwgMCkNCj4gICAJCWdvdG8gZXJyX2tmcmVlOw0KPiAgIA0KPiArCW11dGV4X3VubG9j
aygmYXN0LT5pb3JlZ3NfbG9jayk7DQo+ICsNCj4gICAJZHJtX2Nvbm5lY3Rvcl91cGRhdGVf
ZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIGVkaWQpOw0KPiAgIAljb3VudCA9IGRybV9hZGRf
ZWRpZF9tb2Rlcyhjb25uZWN0b3IsIGVkaWQpOw0KPiAgIAlrZnJlZShlZGlkKTsNCj4gQEAg
LTE2NjYsNiArMTY3Niw3IEBAIHN0YXRpYyBpbnQgYXN0X2FzdGRwX2Nvbm5lY3Rvcl9oZWxw
ZXJfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICAgCXJl
dHVybiBjb3VudDsNCj4gICANCj4gICBlcnJfa2ZyZWU6DQoNClRoaXMgbGFiZWwgbmVlZHMg
dG8gYmUgbmFtZWQgJ2Vycl9tdXRleF91bmxvY2snIHBsZWFzZS4gV2l0aCB0aGF0IGZpeGVk
LCANCnlvdSBjYW4gYWRkDQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiArCW11dGV4
X3VubG9jaygmYXN0LT5pb3JlZ3NfbG9jayk7DQo+ICAgCWtmcmVlKGVkaWQpOw0KPiAgIGVy
cl9kcm1fY29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5Og0KPiAgIAlkcm1fY29ubmVj
dG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KGNvbm5lY3RvciwgTlVMTCk7DQo+IA0KPiBiYXNl
LWNvbW1pdDogOTMzMTc0YWUyOGJhNzJhYjhkZTViMzVjYjdjOThmYzIxMTIzNTA5Ng0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0Niwg
OTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMs
IEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJu
YmVyZykNCg==

--------------g9zM0e2qrVQ4lm8aYK00AO00--

--------------bWGn0bHpltOcnfUMiQYxRtWn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR3JsEFAwAAAAAACgkQlh/E3EQov+Az
kw/+MD9iFo6IaQbmiQraMWv4C8bb0Ku2tpruYx9AiaFS4AM/UIw1G45JiApJoZsRp3K9itbyDrra
VmYigZ/Znt2c/svJk2eUeeMz3PCM1ypWTHov7MVvN6Hs6nMOIrjDHHf9Y9klzY/1jvV90nsvTCu3
6vcsU4BQDVArgmknwvEyw4pz8wiv9Drdll+zQIWCeUmYBVeaLma+GsXL0yRIPYbMOjVihNRqr0wr
RCNuMVtGCk0GgZ3LjtxKZm7rwo5V82OOU13DufmIDxZqF6BOMMcSzph75RyEzu4Ko2XkTpnH3Poh
koQKMn60ko0eU+27rlo6HcMjljkYbz3KMEfI4f3CcjDDCSGFVpCR00WPekwTUoyPAluMO7JwX7UD
+qUhNS6xlmOm42DTeDUHAe+h22TUBZVkkyFyYWbbsUaolQn12AHkC7tkfxlYWY9nQVZsZv2BUkcu
MmEGBT13clckqlsTFgTMkavv9Iu73bIlM6Tl1a2JX6x/zwNt3n2MPa9JtzB4jBLqFsTIoZuNrkPJ
Otd34WnapE76yo4LO7hsM0F0ku9JJgf2+qfQqPW2AIuqmOCm+I24oyQ8TuFs2wScVWK7MNxLtA/u
oe+1Ofb0Ijka/PL+zut1hb8yVF2cf21xOq+JeNC3q5pYRGMtVinm5fB/FR50uLyhdR6vHzydc1OV
2+4=
=PHol
-----END PGP SIGNATURE-----

--------------bWGn0bHpltOcnfUMiQYxRtWn--
