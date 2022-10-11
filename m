Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CE05FB169
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B055F10E27F;
	Tue, 11 Oct 2022 11:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513AB10E27F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:27:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E33820124;
 Tue, 11 Oct 2022 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665487622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+1o2b0y8FPjY5Ave/q39USDlPpUujGBx6UtfxjYm8Tk=;
 b=NxtvIVnJMiaA0uvm6LY5G5G5st49M1hmOMwgYBziBp931wOcSv+YG0O5TpCWcNgkW4QnVJ
 8TjKAhPp+F07kAvIXiIbrvBwsLDw26Ujgu9vrarDDWT3kbQEYOo7QMQiJdAH+WH6h2EDbj
 6aoUNw2YYb2q8U/JHkVMx+vxc/0MxFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665487622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+1o2b0y8FPjY5Ave/q39USDlPpUujGBx6UtfxjYm8Tk=;
 b=Mcy0zXW9j1bgj6dnk3NDemxSgiKnhkyPNyNedojNbXG5c55ATmPxrISMCl1J8I9/m+1lgg
 g6UUC4LlOIycSeDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4667F13AAC;
 Tue, 11 Oct 2022 11:27:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jGMJEAZTRWNqMwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Oct 2022 11:27:02 +0000
Message-ID: <83005961-f45d-37ea-4c5a-71b1895eca16@suse.de>
Date: Tue, 11 Oct 2022 13:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] drm: add DRIVER_RENDER_ONLY
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@linux.ie
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <20221011110437.15258-3-christian.koenig@amd.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221011110437.15258-3-christian.koenig@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XW3klEUXRTg8HHicYterabeW"
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XW3klEUXRTg8HHicYterabeW
Content-Type: multipart/mixed; boundary="------------5QPwOK9FeuOEoqXuTOq07xWl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@linux.ie
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <83005961-f45d-37ea-4c5a-71b1895eca16@suse.de>
Subject: Re: [PATCH 2/2] drm: add DRIVER_RENDER_ONLY
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <20221011110437.15258-3-christian.koenig@amd.com>
In-Reply-To: <20221011110437.15258-3-christian.koenig@amd.com>

--------------5QPwOK9FeuOEoqXuTOq07xWl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTAuMjIgdW0gMTM6MDQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBUaGlzIGFsbG93cyB0byBzdXBwcmVzcyBjcmVhdGluZyB0aGUgcHJpbWFyeSBub2RlLiBV
c2VmdWwgZm9yIGRyaXZlcnMNCj4gd2hpY2ggZG9uJ3QgZXhwb3NlIGFueSBkaXNwbGF5IGZ1
bmN0aW9uYWxpdHksIGJ1dCBhcmUgcmVuZGVyIG9ubHkgYnkNCj4gZGVzaWduLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jICAgfCAxMCArKysr
KystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgIDIgKy0NCj4gICBp
bmNsdWRlL2RybS9kcm1fZHJ2LmggICAgICAgfCAgNyArKysrKysrDQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2Rydi5jDQo+IGluZGV4IGQ4MTc4M2Y0MzQ1Mi4uNGE1MjVmNzhhOTMyIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHJ2LmMNCj4gQEAgLTYzNCw5ICs2MzQsMTEgQEAgc3RhdGljIGludCBkcm1fZGV2
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAJCQlnb3RvIGVycjsNCj4gICAJ
fQ0KPiAgIA0KPiAtCXJldCA9IGRybV9taW5vcl9hbGxvYyhkZXYsIERSTV9NSU5PUl9QUklN
QVJZKTsNCj4gLQlpZiAocmV0KQ0KPiAtCQlnb3RvIGVycjsNCj4gKwlpZiAoIWRybV9jb3Jl
X2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfUkVOREVSX09OTFkpKSB7DQo+ICsJCXJldCA9
IGRybV9taW5vcl9hbGxvYyhkZXYsIERSTV9NSU5PUl9QUklNQVJZKTsNCj4gKwkJaWYgKHJl
dCkNCj4gKwkJCWdvdG8gZXJyOw0KPiArCX0NCj4gICANCj4gICAJcmV0ID0gZHJtX2xlZ2Fj
eV9jcmVhdGVfbWFwX2hhc2goZGV2KTsNCj4gICAJaWYgKHJldCkNCj4gQEAgLTkwMiw3ICs5
MDQsNyBAQCBpbnQgZHJtX2Rldl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1
bnNpZ25lZCBsb25nIGZsYWdzKQ0KPiAgIAkJIGRyaXZlci0+bmFtZSwgZHJpdmVyLT5tYWpv
ciwgZHJpdmVyLT5taW5vciwNCj4gICAJCSBkcml2ZXItPnBhdGNobGV2ZWwsIGRyaXZlci0+
ZGF0ZSwNCj4gICAJCSBkZXYtPmRldiA/IGRldl9uYW1lKGRldi0+ZGV2KSA6ICJ2aXJ0dWFs
IGRldmljZSIsDQo+IC0JCSBkZXYtPnByaW1hcnktPmluZGV4KTsNCj4gKwkJIChkZXYtPnBy
aW1hcnkgPzogZGV2LT5yZW5kZXIpLT5pbmRleCk7DQo+ICAgDQo+ICAgCWdvdG8gb3V0X3Vu
bG9jazsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYw0KPiBpbmRleCBhM2YxODA2NTNiOGIu
LjRhZmQzZjE1YjEzNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmlt
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYw0KPiBAQCAtNzQwLDcg
Kzc0MCw3IEBAIGludCBkcm1fZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPiAgIAl9DQo+ICAgDQo+ICAg
CS8qIFVzZWQgYnkgZHJtX2dlbV9tbWFwKCkgdG8gbG9va3VwIHRoZSBHRU0gb2JqZWN0ICov
DQo+IC0JcHJpdi0+bWlub3IgPSBvYmotPmRldi0+cHJpbWFyeTsNCj4gKwlwcml2LT5taW5v
ciA9IG9iai0+ZGV2LT5wcmltYXJ5ID86IG9iai0+ZGV2LT5yZW5kZXI7DQo+ICAgCWZpbC0+
cHJpdmF0ZV9kYXRhID0gcHJpdjsNCj4gICANCj4gICAJcmV0ID0gZHJtX3ZtYV9ub2RlX2Fs
bG93KCZvYmotPnZtYV9ub2RlLCBwcml2KTsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9kcnYuaCBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPiBpbmRleCBmNjE1OWFjYjg4
NTYuLjBhMTQ1MGQ0N2NhMiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Rydi5o
DQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPiBAQCAtOTQsNiArOTQsMTMgQEAg
ZW51bSBkcm1fZHJpdmVyX2ZlYXR1cmUgew0KPiAgIAkgKiBzeW5jaHJvbml6YXRpb24gb2Yg
Y29tbWFuZCBzdWJtaXNzaW9uLg0KPiAgIAkgKi8NCj4gICAJRFJJVkVSX1NZTkNPQkpfVElN
RUxJTkUgICAgICAgICA9IEJJVCg2KSwNCj4gKwkvKioNCj4gKwkgKiBARFJJVkVSX1JFTkRF
Ul9PTkxZDQo+ICsJICoNCj4gKwkgKiBEcml2ZXIgaXMgYSByZW5kZXIgbm9kZSBvbmx5IGRy
aXZlciBhbmQgZG9uJ3Qgd2FudCB0byBzdXBwb3J0IHRoZQ0KPiArCSAqIHByaW1hcnkgaW50
ZXJmYWNlLg0KPiArCSAqLw0KPiArCURSSVZFUl9SRU5ERVJfT05MWQkJPSBCSVQoNyksDQoN
CklzIGl0IHJlYWxseSBuZWNlc3NhcnkgdG8gYWRkIGEgbmV3IGZsYWc/ICBJZiBhIGRyaXZl
ciBzZXRzIERSSVZFUl9HRU0gDQphbmQgb21pdHMgRFJJVkVSX01PREVTRVQgd291bGRuJ3Qg
dGhpcyBoYXZlIHRoZSBzYW1lIG1lYW5pbmc/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gICANCj4gICAJLyogSU1QT1JUQU5UOiBCZWxvdyBhcmUgYWxsIHRoZSBsZWdhY3kgZmxh
Z3MsIGFkZCBuZXcgb25lcyBhYm92ZS4gKi8NCj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------5QPwOK9FeuOEoqXuTOq07xWl--

--------------XW3klEUXRTg8HHicYterabeW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNFUwUFAwAAAAAACgkQlh/E3EQov+Ao
zg/9Fw3Eixq/wjvmpPj0Jt3CHB3n77rrwwgAIB9NaBQ3bQBXY61Eov9JTZzRj9TcC8oZ3krcg8HF
My91opS0z5xDBE5dIzAg8Ae4ha7aLnZbnMWp/FppImjFAW4Q/ITUAUdyb0ScwWABfEqbPqYOq/qw
wTJ0gFWaiJnaipGwooPkHc3TEjcC2MhfsPnCDZel69Lgq8uaNsUNE0QN8P+J6O+ksChKGrTYc5WU
3S6ORv2TSDIOM7l45bzVLg7hsiND8rz4todqy7NSBm4LqWAHCfCjQtNMb2+7wr7qNayk5a0+j8v+
g2oMr7aRBkO+h41k9ZT7da1oi2ZUYMa6m6CE3ley3KZvHahn+8VV/6Ena5tJy03Tq1e5/cxv5yR3
i91HhSWBdRX/hZU2DHIvwiD6fFmrBVgqSShcLmASUO4/S+gQbvaZqV4d1nRI7JReLnBz1kMFDNG3
rfmlT+U14OdvV8PG8WHa0yxXso5/DXDxTvziy9Yk5v2pJkzy0njRYR/NbJnujBke2y+Cl0YP5JFH
K4p1qy+hZp+gQWdICHQdVt+3YDhEP7tF6Cx7UTadiTnHmP3RYs7TzitYPfWqogzn+2S1Duo25ObE
XfxcYco4vwdj6LtsUpkdIdE2VJsbmXfglYLSgebjHQmJGkr8dWpn9yHBPqKPv2LE3N2m+vySU/Ks
JlM=
=6yfM
-----END PGP SIGNATURE-----

--------------XW3klEUXRTg8HHicYterabeW--
