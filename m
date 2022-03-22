Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B691C4E46C4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 20:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3B310E479;
	Tue, 22 Mar 2022 19:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B6610E479
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:36:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CBD5E1F388;
 Tue, 22 Mar 2022 19:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647977811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f1UTtzUj49ncRhlrDWMVXWMc6UvNl24FfSgIxI5p+rk=;
 b=hd3lAxjetyoCU3kuKhzdKEb92q87oFt472mASuFwlfdRhMemAGKenK8Br/PxK0kzohmwxM
 qsNJIcgudz7JTWXJyjLIe4qG3nNlGCM/VYtCtVR41dUWy/USUNiQYOnOgXEIijAUjFu7sr
 lI+B6+Z3tEDwyFaV2N6SmwvVBxPXvug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647977811;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f1UTtzUj49ncRhlrDWMVXWMc6UvNl24FfSgIxI5p+rk=;
 b=s1sfy6TCpimIn5Acnb3mWuPNzQr1l1eITlp4c6/b+Pu+WQBuhWnETsE4pUCuoy4gT34vif
 kPWUSdz+IUZQl9DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A629A13419;
 Tue, 22 Mar 2022 19:36:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZujLJlMlOmIbMwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Mar 2022 19:36:51 +0000
Message-ID: <66cc3cd8-e737-e032-9135-bed05db2f401@suse.de>
Date: Tue, 22 Mar 2022 20:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 7/7] drm/gma500: Add crtc prefix to vblank functions
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
 <20220322131742.11566-7-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220322131742.11566-7-patrik.r.jakobsson@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VwTtYzWaTpP6hJGcTxYrCIAS"
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VwTtYzWaTpP6hJGcTxYrCIAS
Content-Type: multipart/mixed; boundary="------------nBnNtGpoAN7uFwxGS5Dwu5Bw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Message-ID: <66cc3cd8-e737-e032-9135-bed05db2f401@suse.de>
Subject: Re: [PATCH 7/7] drm/gma500: Add crtc prefix to vblank functions
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
 <20220322131742.11566-7-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20220322131742.11566-7-patrik.r.jakobsson@gmail.com>

--------------nBnNtGpoAN7uFwxGS5Dwu5Bw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDMuMjIgdW0gMTQ6MTcgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
PiBUaGVzZSBmdW5jdGlvbnMgb3BlcmF0ZSBvbiBhIGNydGMgYW5kIHNob3VsZCBiZSBwcmVm
aXhlZCBwcm9wZXJseS4NCj4gDQo+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpayBKYWtvYnNz
b24gPHBhdHJpay5yLmpha29ic3NvbkBnbWFpbC5jb20+DQoNCkZvciB0aGUgd2hvbGUgcGF0
Y2hzZXQ6DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCg0KSWYgeW91IGxpa2UsIHBsZWFzZSBjb25zaWRlciB0aGUgZmV3IGNvbW1l
bnRzIEkgaGFkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCj4gLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jIHwgNiArKystLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9pcnEuYyAgICAgfCA2ICsrKy0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvcHNiX2lycS5oICAgICB8IDYgKysrLS0tDQo+ICAgMyBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jDQo+IGluZGV4IDM2OWJjMWY3NTFjYi4u
MzRlYzNmY2EwOWJhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dt
YV9kaXNwbGF5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxh
eS5jDQo+IEBAIC01NzUsOSArNTc1LDkgQEAgY29uc3Qgc3RydWN0IGRybV9jcnRjX2Z1bmNz
IGdtYV9jcnRjX2Z1bmNzID0gew0KPiAgIAkuc2V0X2NvbmZpZyA9IGdtYV9jcnRjX3NldF9j
b25maWcsDQo+ICAgCS5kZXN0cm95ID0gZ21hX2NydGNfZGVzdHJveSwNCj4gICAJLnBhZ2Vf
ZmxpcCA9IGdtYV9jcnRjX3BhZ2VfZmxpcCwNCj4gLQkuZW5hYmxlX3ZibGFuayA9IGdtYV9l
bmFibGVfdmJsYW5rLA0KPiAtCS5kaXNhYmxlX3ZibGFuayA9IGdtYV9kaXNhYmxlX3ZibGFu
aywNCj4gLQkuZ2V0X3ZibGFua19jb3VudGVyID0gZ21hX2dldF92YmxhbmtfY291bnRlciwN
Cj4gKwkuZW5hYmxlX3ZibGFuayA9IGdtYV9jcnRjX2VuYWJsZV92YmxhbmssDQo+ICsJLmRp
c2FibGVfdmJsYW5rID0gZ21hX2NydGNfZGlzYWJsZV92YmxhbmssDQo+ICsJLmdldF92Ymxh
bmtfY291bnRlciA9IGdtYV9jcnRjX2dldF92YmxhbmtfY291bnRlciwNCj4gICB9Ow0KPiAg
IA0KPiAgIC8qDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9p
cnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2lycS5jDQo+IGluZGV4IDJlOGRl
ZDUzMjkzMC4uZTZlNmQ2MWJiZWFiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL3BzYl9pcnEuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9p
cnEuYw0KPiBAQCAtMzcxLDcgKzM3MSw3IEBAIHZvaWQgZ21hX2lycV91bmluc3RhbGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikNCj4gICAJZnJlZV9pcnEocGRldi0+aXJxLCBkZXYpOw0K
PiAgIH0NCj4gICANCj4gLWludCBnbWFfZW5hYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2NydGMg
KmNydGMpDQo+ICtpbnQgZ21hX2NydGNfZW5hYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2NydGMg
KmNydGMpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2
Ow0KPiAgIAl1bnNpZ25lZCBpbnQgcGlwZSA9IGNydGMtPmluZGV4Ow0KPiBAQCAtNDA0LDcg
KzQwNCw3IEBAIGludCBnbWFfZW5hYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMp
DQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gLXZvaWQgZ21hX2Rpc2FibGVfdmJs
YW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4gK3ZvaWQgZ21hX2NydGNfZGlzYWJsZV92
Ymxhbmsoc3RydWN0IGRybV9jcnRjICpjcnRjKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9k
ZXZpY2UgKmRldiA9IGNydGMtPmRldjsNCj4gICAJdW5zaWduZWQgaW50IHBpcGUgPSBjcnRj
LT5pbmRleDsNCj4gQEAgLTQyOCw3ICs0MjgsNyBAQCB2b2lkIGdtYV9kaXNhYmxlX3ZibGFu
ayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpDQo+ICAgLyogQ2FsbGVkIGZyb20gZHJtIGdlbmVy
aWMgY29kZSwgcGFzc2VkIGEgJ2NydGMnLCB3aGljaA0KPiAgICAqIHdlIHVzZSBhcyBhIHBp
cGUgaW5kZXgNCj4gICAgKi8NCj4gLXUzMiBnbWFfZ2V0X3ZibGFua19jb3VudGVyKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YykNCj4gK3UzMiBnbWFfY3J0Y19nZXRfdmJsYW5rX2NvdW50ZXIo
c3RydWN0IGRybV9jcnRjICpjcnRjKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9kZXZpY2Ug
KmRldiA9IGNydGMtPmRldjsNCj4gICAJdW5zaWduZWQgaW50IHBpcGUgPSBjcnRjLT5pbmRl
eDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2lycS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfaXJxLmgNCj4gaW5kZXggYzIyODc4OTE0ZjVi
Li5iNTFlMzk1MTk0ZmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAv
cHNiX2lycS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2lycS5oDQo+
IEBAIC0yMCw5ICsyMCw5IEBAIHZvaWQgZ21hX2lycV9wb3N0aW5zdGFsbChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KTsNCj4gICBpbnQgIGdtYV9pcnFfaW5zdGFsbChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaXJxKTsNCj4gICB2b2lkIGdtYV9pcnFfdW5pbnN0
YWxsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0KPiAgIA0KPiAtaW50ICBnbWFfZW5hYmxl
X3ZibGFuayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOw0KPiAtdm9pZCBnbWFfZGlzYWJsZV92
Ymxhbmsoc3RydWN0IGRybV9jcnRjICpjcnRjKTsNCj4gLXUzMiAgZ21hX2dldF92Ymxhbmtf
Y291bnRlcihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOw0KPiAraW50ICBnbWFfY3J0Y19lbmFi
bGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7DQo+ICt2b2lkIGdtYV9jcnRjX2Rp
c2FibGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7DQo+ICt1MzIgIGdtYV9jcnRj
X2dldF92YmxhbmtfY291bnRlcihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOw0KPiAgIHZvaWQg
Z21hX2VuYWJsZV9waXBlc3RhdChzdHJ1Y3QgZHJtX3BzYl9wcml2YXRlICpkZXZfcHJpdiwg
aW50IHBpcGUsIHUzMiBtYXNrKTsNCj4gICB2b2lkIGdtYV9kaXNhYmxlX3BpcGVzdGF0KHN0
cnVjdCBkcm1fcHNiX3ByaXZhdGUgKmRldl9wcml2LCBpbnQgcGlwZSwgdTMyIG1hc2spOw0K
PiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------nBnNtGpoAN7uFwxGS5Dwu5Bw--

--------------VwTtYzWaTpP6hJGcTxYrCIAS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmI6JVMFAwAAAAAACgkQlh/E3EQov+D5
9g//Q9UaxF3X1g3cUiDYnJ913PqbeesSNxguMGPKvEsIcSChwaMsyqARxvmsm/bZV9lHWkN7cyfg
oAgq+4yyUTo6L7xgFWaDJ/HpP7lcAMVbBaVBzTZyNV9DBC77SvI2uPv1vzcY5nKXPwxJXa5yz9I9
ie46v2W8WHP34y+n3i5BpBA53hDJ917HKb9E9/zDICEmm1Tq5hLYMzjV2CSGJ3t686juKRYRvGmK
ZGaN/M3zMoeBv+KMezri1QlLGTboCiIsWvCs5OYyt28PHUeY593eX65JU81anOXzs4/PKBieGpbZ
4/+cxYG6XlgzkEmQBMq6FrYKAuc1BJnwtR/EtTKy+E244Yp2SlcagfcfUZGxQuao6vVEIlDgYhf1
ZfKjeDt8EysewiH/EkXvKV0W8Z1jANDRfmX6mFHpUTlrhoGXoDKpBWl2Y8d6SQexOEpVm6/S2ntY
BJpxcP3I9Cis4QvwLZpcZiaQvB4BMIMpye+WvbeDPlaoyuYwN7b+fhx0KjJ3ARxYyA5fFdWPAIbG
Db0dxcfRnnIQUdloAM8b3DhVqcNuT1Kk2kC7dl3KEs04+bZ6Q1GoKnpMwlwyK3Hea9iXEqySqdw4
DCLH5QDZUjLmnFTLDYmamgM5BXIg0OytzxaqPhbDEnujYRyAKcPFY2eDlgh3fAAYP9au1mKdvbw9
6JU=
=cyoH
-----END PGP SIGNATURE-----

--------------VwTtYzWaTpP6hJGcTxYrCIAS--
