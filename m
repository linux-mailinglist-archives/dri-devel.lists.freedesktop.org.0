Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A3168645A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 11:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E008210E3E6;
	Wed,  1 Feb 2023 10:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413E210E3E6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 10:35:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9FC43370C;
 Wed,  1 Feb 2023 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675247713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HE6LPCvk2HbeMV42NEF8mKiuXHkIefRo1yhHi2UV0Vk=;
 b=rr3Eocgk9l5Qn//wqYe0mMVxCutTgzIW/qF0TcMtXtedu7nLMLHt3ehRx7EWvFZQ0bWpZB
 geZhqhO6oTMmiFU+efS6qe0ob5cYR9VHKZYtW6466xKps8rhteIPGmUNnkNm55s/McNDry
 QIA6kbx0ssnfQrc+sLxhiHiKnYBToHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675247713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HE6LPCvk2HbeMV42NEF8mKiuXHkIefRo1yhHi2UV0Vk=;
 b=n9VBYG+Sb1XI/MJaE5ahrWMRmNKiLHLCoUpDelUZRb6Phvknx5Lg0SFLltXaZpxI5MPhNr
 FYTW/5ACMnydsNDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC50013A10;
 Wed,  1 Feb 2023 10:35:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zBbkMGFA2mN5BAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Feb 2023 10:35:13 +0000
Message-ID: <39dbbfa1-90bc-bea4-9b1c-f94cc6f2d8b7@suse.de>
Date: Wed, 1 Feb 2023 11:35:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230123154831.3191821-1-robdclark@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230123154831.3191821-1-robdclark@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Hch1rk5MHXD0unN33r0ICikz"
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Hch1rk5MHXD0unN33r0ICikz
Content-Type: multipart/mixed; boundary="------------srip3YX0lwXK04bt2gzYBMiO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Steven Price <steven.price@arm.com>
Message-ID: <39dbbfa1-90bc-bea4-9b1c-f94cc6f2d8b7@suse.de>
Subject: Re: [PATCH v3] drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
References: <20230123154831.3191821-1-robdclark@gmail.com>
In-Reply-To: <20230123154831.3191821-1-robdclark@gmail.com>

--------------srip3YX0lwXK04bt2gzYBMiO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSBoYXZlIGNoZXJyeS1waWNrZWQgdGhlIHBhdGNoIGludG8gZHJtLW1pc2MtbmV4dC1maXhl
cy4NCg0KQW0gMjMuMDEuMjMgdW0gMTY6NDggc2NocmllYiBSb2IgQ2xhcms6DQo+IEZyb206
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4gDQo+IE9uY2Ugd2UgY3Jl
YXRlIHRoZSBoYW5kbGUsIHRoZSBoYW5kbGUgb3ducyB0aGUgcmVmZXJlbmNlLiAgQ3VycmVu
dGx5DQo+IG5vdGhpbmcgd2FzIGRvaW5nIGFueXRoaW5nIHdpdGggdGhlIHNobWVtIHB0ciBh
ZnRlciB0aGUgaGFuZGxlIHdhcw0KPiBjcmVhdGVkLCBidXQgbGV0J3MgY2hhbmdlIGRybV9n
ZW1fc2htZW1fY3JlYXRlX3dpdGhfaGFuZGxlKCkgdG8gbm90DQo+IHJldHVybiB0aGUgcG9p
bnRlciwgc28tYXMgdG8gbm90IGVuY291cmFnZSBwcm9ibGVtYXRpYyB1c2Ugb2YgdGhpcw0K
PiBmdW5jdGlvbiBpbiB0aGUgZnV0dXJlLiAgQXMgYSBib251cywgaXQgbWFrZXMgdGhlIGNv
ZGUgYSBiaXQgY2xlYW5lci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9i
ZGNsYXJrQGNocm9taXVtLm9yZz4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fc2htZW1faGVscGVyLmMgfCAxMyArKysrLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jDQo+IGluZGV4IGYyMWY0NzczNzgxNy4uNDJj
NDk2YzVmOTJjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1l
bV9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxw
ZXIuYw0KPiBAQCAtNDE1LDcgKzQxNSw3IEBAIHZvaWQgZHJtX2dlbV9zaG1lbV92dW5tYXAo
c3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0ICpzaG1lbSwNCj4gICB9DQo+ICAgRVhQT1JU
X1NZTUJPTChkcm1fZ2VtX3NobWVtX3Z1bm1hcCk7DQo+ICAgDQo+IC1zdGF0aWMgc3RydWN0
IGRybV9nZW1fc2htZW1fb2JqZWN0ICoNCj4gK3N0YXRpYyBpbnQNCj4gICBkcm1fZ2VtX3No
bWVtX2NyZWF0ZV93aXRoX2hhbmRsZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwNCj4g
ICAJCQkJIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLA0KPiAgIAkJCQkg
dWludDMyX3QgKmhhbmRsZSkNCj4gQEAgLTQyNSw3ICs0MjUsNyBAQCBkcm1fZ2VtX3NobWVt
X2NyZWF0ZV93aXRoX2hhbmRsZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwNCj4gICAN
Cj4gICAJc2htZW0gPSBkcm1fZ2VtX3NobWVtX2NyZWF0ZShkZXYsIHNpemUpOw0KPiAgIAlp
ZiAoSVNfRVJSKHNobWVtKSkNCj4gLQkJcmV0dXJuIHNobWVtOw0KPiArCQlyZXR1cm4gUFRS
X0VSUihzaG1lbSk7DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAqIEFsbG9jYXRlIGFuIGlkIG9m
IGlkciB0YWJsZSB3aGVyZSB0aGUgb2JqIGlzIHJlZ2lzdGVyZWQNCj4gQEAgLTQzNCwxMCAr
NDM0LDggQEAgZHJtX2dlbV9zaG1lbV9jcmVhdGVfd2l0aF9oYW5kbGUoc3RydWN0IGRybV9m
aWxlICpmaWxlX3ByaXYsDQo+ICAgCXJldCA9IGRybV9nZW1faGFuZGxlX2NyZWF0ZShmaWxl
X3ByaXYsICZzaG1lbS0+YmFzZSwgaGFuZGxlKTsNCj4gICAJLyogZHJvcCByZWZlcmVuY2Ug
ZnJvbSBhbGxvY2F0ZSAtIGhhbmRsZSBob2xkcyBpdCBub3cuICovDQo+ICAgCWRybV9nZW1f
b2JqZWN0X3B1dCgmc2htZW0tPmJhc2UpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiBF
UlJfUFRSKHJldCk7DQo+ICAgDQo+IC0JcmV0dXJuIHNobWVtOw0KPiArCXJldHVybiByZXQ7
DQo+ICAgfQ0KPiAgIA0KPiAgIC8qIFVwZGF0ZSBtYWR2aXNlIHN0YXR1cywgcmV0dXJucyB0
cnVlIGlmIG5vdCBwdXJnZWQsIGVsc2UNCj4gQEAgLTUyMCw3ICs1MTgsNiBAQCBpbnQgZHJt
X2dlbV9zaG1lbV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsDQo+ICAgCQkJICAgICAgc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9k
dW1iICphcmdzKQ0KPiAgIHsNCj4gICAJdTMyIG1pbl9waXRjaCA9IERJVl9ST1VORF9VUChh
cmdzLT53aWR0aCAqIGFyZ3MtPmJwcCwgOCk7DQo+IC0Jc3RydWN0IGRybV9nZW1fc2htZW1f
b2JqZWN0ICpzaG1lbTsNCj4gICANCj4gICAJaWYgKCFhcmdzLT5waXRjaCB8fCAhYXJncy0+
c2l6ZSkgew0KPiAgIAkJYXJncy0+cGl0Y2ggPSBtaW5fcGl0Y2g7DQo+IEBAIC01MzMsOSAr
NTMwLDcgQEAgaW50IGRybV9nZW1fc2htZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxl
ICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIAkJCWFyZ3MtPnNpemUgPSBQ
QUdFX0FMSUdOKGFyZ3MtPnBpdGNoICogYXJncy0+aGVpZ2h0KTsNCj4gICAJfQ0KPiAgIA0K
PiAtCXNobWVtID0gZHJtX2dlbV9zaG1lbV9jcmVhdGVfd2l0aF9oYW5kbGUoZmlsZSwgZGV2
LCBhcmdzLT5zaXplLCAmYXJncy0+aGFuZGxlKTsNCj4gLQ0KPiAtCXJldHVybiBQVFJfRVJS
X09SX1pFUk8oc2htZW0pOw0KPiArCXJldHVybiBkcm1fZ2VtX3NobWVtX2NyZWF0ZV93aXRo
X2hhbmRsZShmaWxlLCBkZXYsIGFyZ3MtPnNpemUsICZhcmdzLT5oYW5kbGUpOw0KPiAgIH0N
Cj4gICBFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX3NobWVtX2R1bWJfY3JlYXRlKTsNCj4g
ICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------srip3YX0lwXK04bt2gzYBMiO--

--------------Hch1rk5MHXD0unN33r0ICikz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPaQGEFAwAAAAAACgkQlh/E3EQov+B2
cg//YASft9OLePFd/IUOkVr/P5QXC22vo4gtBnQWj5vV0RNSVjBytXmRKcdReWWaeBK7J9Uaz8Iq
UjekkptbVRyXpXlW2ctQasXt/PHeAQ+YvmYuhXXPdVla9MIqn0m1OJM1GmYrg5geXJgu5Sne9fJ3
JsC4tyyWr+fxZaoW5itQxMqNwTkua8DsThbaccAegSfvH7jH6pWLyJi2NH6afaD0Eoyh4MBCP5qN
mEvB6zbRpx6nOEWJqT4ammZQff0xZkmTiH2uNafUdedu6mt9lIndQKzk305El2O/+Ds2MWHZIerT
55mwZeRHSWnfFY6eCedwqQzP64VH5FvkigCqhdmfiawDzBbN41nUACDQ2wBmYLJSfiSU+TZziZVX
0O79Y9xMppf56j2PvI8o3XcEuDtw9BeaHfDPpmv97jaAHIbYjvgF+nFtsbKXNfl3Lji8wiZ22yPr
UPisTWNSfCfWGJMRuCi5j2ElvbIV9INnq2IMYN1bTSzE5RGzZ7ZvqaPF5Waaa9ljzj6KrURXIYfI
hz1mp1nbIleicwMrMzbHAqUM7RexHvafBLRHN8cTxgxmCewWrX1b4N8DDfbxgIxveYg/G0Rvnh9v
IQTo0y4PNWJvcGS2vOdClN1qJZbScc1/L2eFd/8xW7toO9T3z3Odl7FXjj05rVL+MfKQIV7tsZ4s
oXg=
=1Nq0
-----END PGP SIGNATURE-----

--------------Hch1rk5MHXD0unN33r0ICikz--
