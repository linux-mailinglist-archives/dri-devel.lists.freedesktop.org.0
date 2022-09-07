Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7995AFD5E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3A810E3B8;
	Wed,  7 Sep 2022 07:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CF310E3B8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:23:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB9211F74D;
 Wed,  7 Sep 2022 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662535381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gjFw12KvmQSF1doWK4jaUF8mYC9o7QYE1t9inUlqxeY=;
 b=ZvrRGaCa42+JNWxQqxjF5c73UYZDD62oIOw6CqnLy0pa6IFC+fgtG+juJ+FKFUNPBee21+
 uO0UB7uGXaS2ytfjy9OdDlZFtlK8P0u2NNaTPpDtH89d9IMJEyaWEkOM1tbtBJphqPwH5E
 YB/6/LBgtsGkJHgOhiHTT7rBVVK0azQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662535381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gjFw12KvmQSF1doWK4jaUF8mYC9o7QYE1t9inUlqxeY=;
 b=rsEKJeWxTIAP9CsHPfQbkcHbfo0BVFbe/4xaChiGyUA2iTbhHbtItUbAfzBPyav7RS9A0O
 roACMhaxJsxAn/AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB67A13486;
 Wed,  7 Sep 2022 07:23:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iwfwKNVGGGMkeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:23:01 +0000
Message-ID: <d4e76fbc-bb75-4b1a-c345-5dc7670d6a14@suse.de>
Date: Wed, 7 Sep 2022 09:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 4/6] drm/format-helper: Support the AB24 format
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-5-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220905163300.391692-5-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Z3dG0WXrUkJk2WjXK0rh69p"
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Z3dG0WXrUkJk2WjXK0rh69p
Content-Type: multipart/mixed; boundary="------------E0UX0xqj6X9nUqJbrtUlgVHU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d4e76fbc-bb75-4b1a-c345-5dc7670d6a14@suse.de>
Subject: Re: [PATCH 4/6] drm/format-helper: Support the AB24 format
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-5-thierry.reding@gmail.com>
In-Reply-To: <20220905163300.391692-5-thierry.reding@gmail.com>

--------------E0UX0xqj6X9nUqJbrtUlgVHU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDkuMjIgdW0gMTg6MzIgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IEFkZCBh
IGNvbnZlcnNpb24gaGVscGVyIGZvciB0aGUgQUIyNCBmb3JtYXQgdG8gdXNlIGluIGRybV9m
Yl9ibGl0KCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGlu
Z0BudmlkaWEuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9o
ZWxwZXIuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9y
bWF0X2hlbHBlci5jDQo+IGluZGV4IDU2NjQyODE2ZmRmZi4uZDU2NDQxMmE4MTZiIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiBAQCAtNTAzLDYgKzUw
MywzNiBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfcmdiODg4X3RvX3hyZ2I4ODg4KHN0cnVjdCBp
b3N5c19tYXAgKmRzdCwgY29uc3QgdW5zaWduZWQgaW50DQo+ICAgCQkgICAgZHJtX2ZiX3Jn
Yjg4OF90b194cmdiODg4OF9saW5lKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBk
cm1fZmJfeHJnYjg4ODhfdG9fYWJncjg4ODhfbGluZSh2b2lkICpkYnVmLCBjb25zdCB2b2lk
ICpzYnVmLCB1bnNpZ25lZCBpbnQgcGl4ZWxzKQ0KPiArew0KPiArCV9fbGUzMiAqZGJ1ZjMy
ID0gZGJ1ZjsNCj4gKwljb25zdCBfX2xlMzIgKnNidWYzMiA9IHNidWY7DQo+ICsJdW5zaWdu
ZWQgaW50IHg7DQo+ICsJdTMyIHBpeDsNCj4gKw0KPiArCWZvciAoeCA9IDA7IHggPCBwaXhl
bHM7IHgrKykgew0KPiArCQlwaXggPSBsZTMyX3RvX2NwdShzYnVmMzJbeF0pOw0KPiArCQlw
aXggPSAoKHBpeCAmIDB4ZmYwMDAwMDApID4+IDI0KSA8PCAyNCB8DQo+ICsJCSAgICAgICgo
cGl4ICYgMHgwMGZmMDAwMCkgPj4gMTYpIDw8ICAwIHwNCj4gKwkJICAgICAgKChwaXggJiAw
eDAwMDBmZjAwKSA+PiAgOCkgPDwgIDggfA0KPiArCQkgICAgICAoKHBpeCAmIDB4MDAwMDAw
ZmYpID4+ICAwKSA8PCAxNjsNCj4gKwkJKmRidWYzMisrID0gY3B1X3RvX2xlMzIocGl4KTsN
Cj4gKwl9DQo+ICt9DQoNCldoYXQgZG9lcyB0aGUgSmV0c29uIGRldmljZSBkbyB3aXRoIHRo
ZXNlIGFscGhhIGJpdHM/DQoNCkFGQUlLIHRoZSBYIGNoYW5uZWwncyBjb250ZW50IGlzIHVu
ZGVmaW5lZC4gU2hpZnRpbmcgdGhlIGJpdHMgaW50byB0aGUgQSANCmNoYW5uZWwgbWlnaHQg
cmVzdWx0IGluIHdyb25nIHJlc3VsdHMgaW4gdGhlIGdlbmVyYWwgY2FzZS4gQmV0dGVyIGp1
c3QgDQpzZXQgdGhlIGFscGhhIHRvIDB4ZmYgdW5jb25kaXRpb25hbGx5Lg0KDQo+ICsNCj4g
K3N0YXRpYyB2b2lkIGRybV9mYl94cmdiODg4OF90b19hYmdyODg4OChzdHJ1Y3QgaW9zeXNf
bWFwICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0X3BpdGNoLA0KPiArCQkJCQljb25z
dCBzdHJ1Y3QgaW9zeXNfbWFwICpzcmMsDQo+ICsJCQkJCWNvbnN0IHN0cnVjdCBkcm1fZnJh
bWVidWZmZXIgKmZiLA0KPiArCQkJCQljb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApDQo+
ICt7DQo+ICsJc3RhdGljIGNvbnN0IHU4IGRzdF9waXhzaXplW0RSTV9GT1JNQVRfTUFYX1BM
QU5FU10gPSB7DQo+ICsJCTQsDQo+ICsJfTsNCj4gKw0KPiArCWRybV9mYl94ZnJtKGRzdCwg
ZHN0X3BpdGNoLCBkc3RfcGl4c2l6ZSwgc3JjLCBmYiwgY2xpcCwgZmFsc2UsDQo+ICsJCSAg
ICBkcm1fZmJfeHJnYjg4ODhfdG9fYWJncjg4ODhfbGluZSk7DQo+ICt9DQo+ICsNCj4gICBz
dGF0aWMgdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTBfbGluZSh2b2lkICpk
YnVmLCBjb25zdCB2b2lkICpzYnVmLCB1bnNpZ25lZCBpbnQgcGl4ZWxzKQ0KPiAgIHsNCj4g
ICAJX19sZTMyICpkYnVmMzIgPSBkYnVmOw0KPiBAQCAtNjcyLDYgKzcwMiwxMSBAQCBpbnQg
ZHJtX2ZiX2JsaXQoc3RydWN0IGlvc3lzX21hcCAqZHN0LCBjb25zdCB1bnNpZ25lZCBpbnQg
KmRzdF9waXRjaCwgdWludDMyX3QgZA0KPiAgIAkJCWRybV9mYl9yZ2I1NjVfdG9feHJnYjg4
ODgoZHN0LCBkc3RfcGl0Y2gsIHNyYywgZmIsIGNsaXApOw0KPiAgIAkJCXJldHVybiAwOw0K
PiAgIAkJfQ0KPiArCX0gZWxzZSBpZiAoZHN0X2Zvcm1hdCA9PSBEUk1fRk9STUFUX0FCR1I4
ODg4KSB7DQo+ICsJCWlmIChmYl9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YUkdCODg4OCkgew0K
PiArCQkJZHJtX2ZiX3hyZ2I4ODg4X3RvX2FiZ3I4ODg4KGRzdCwgZHN0X3BpdGNoLCBzcmMs
IGZiLCBjbGlwKTsNCj4gKwkJCXJldHVybiAwOw0KPiArCQl9DQoNCkZvciB0aGUgb3RoZXIg
YWxwaGEtY29udGFpbmluZyBmb3JtYXRzLCB3ZSB0cmVhdCB0aGVtIGxpa2Ugbm9uLWFscGhh
IA0KZm9ybWF0cyAoc2VlIHRoZSB0b3Agb2YgdGhpcyBmdW5jdGlvbikuIE1heWJlIGp1c3Qg
ZG8gdGhlIHNhbWUgaGVyZSBhbmQgDQp0aGVuIGltcGxlbWVudCB0aGUgY29udmVyc2lvbiBh
cyBkcm1fZmJfeHJnYjg4ODhfdG9feGJncjg4ODgoKSBoZWxwZXJzPw0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+ICAgCX0gZWxzZSBpZiAoZHN0X2Zvcm1hdCA9PSBEUk1fRk9STUFU
X1hSR0IyMTAxMDEwKSB7DQo+ICAgCQlpZiAoZmJfZm9ybWF0ID09IERSTV9GT1JNQVRfWFJH
Qjg4ODgpIHsNCj4gICAJCQlkcm1fZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTAoZHN0LCBk
c3RfcGl0Y2gsIHNyYywgZmIsIGNsaXApOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------E0UX0xqj6X9nUqJbrtUlgVHU--

--------------0Z3dG0WXrUkJk2WjXK0rh69p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYRtUFAwAAAAAACgkQlh/E3EQov+D3
TRAAuZc6fwqp8XhiVcEilyoud+cWleTBo26Qbu/Ov2TeVx30rPCNcMlJ4TAMH7B9PuyqhPgELfRV
aWMaMUn36r09EciALTgpW78LH/gFBZw6QaNL8Lfn1fs8FD+rklPOFcyX146qH4rwLW/C1mKjW3iB
oA3BGfRiAlGNWB/kELfXvRzjCRsKvVpABvja9YDygXHfcJHsmRO1Pqg6rCE65LFFKobYLBrIliG/
8hJ7RVhqYqtCIE8HVU7X9UGx44huxqvN23SwYX63GGUPqrhrACqH4x0BZ0lgocb9Xx0/DKraG/QG
2HD30Ntz3ejhSlEb6ypMKHcX3gqVShTi/KDpzOmwLpLXas4rSJ6DYTBJME5nw+6iCgobaYR3Xybi
UdiwsFFfMkg7RdVzbrxQQyc8ZIp9prSXuY1yMnLwKKyQF93E1GqzMJx3vttbd+M8TCmM0f/R1+aD
tM235xtFE+QEC8g5HLkqmzC97DGgOZ7dF/VXXr2KA0p0qxPNr7lNjqTITroX2oXLEjlslpsRWsd9
H1MBUv4oOlXmS3z7lGwqQXfu6p2ORfrx55RB4Yj8SXBdKNc1iTIt0dL1G3rVP1N5gPoySVbM9fz4
+pUwnx/hbIq30Mie5lf+L9wkW8MX/BMaXnQj0C/EvmTLIP6FfiBdqplMwoyrEwnmvfu5lFeQuIJt
1gs=
=63wj
-----END PGP SIGNATURE-----

--------------0Z3dG0WXrUkJk2WjXK0rh69p--
