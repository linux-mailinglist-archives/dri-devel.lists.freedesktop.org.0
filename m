Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B9F4E46B9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 20:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2E110E463;
	Tue, 22 Mar 2022 19:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E710E463
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:32:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 901F7210F0;
 Tue, 22 Mar 2022 19:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647977552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uV+QtAhzp1ow2zSaKjjnR77Lk1L0eaZc3j9Av3DP6Po=;
 b=asZKeRIl7D4L+B1GnUA1ujPIrAocx/6GFNpTIDtqx9ug0J2Y4cT5mXePJwRw5gliAWMDzl
 GVYRPeHOzuuefqqC6/58cSNXLjckTpHV7DHa4BOWP2rdMJS+FSRVp8ceKCgQy4CDAPhZfB
 gzh5Ke+SIwrS/LvFgwjKVZtQEEoLQf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647977552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uV+QtAhzp1ow2zSaKjjnR77Lk1L0eaZc3j9Av3DP6Po=;
 b=R61Psf1wnZ3kkBqqJNixo9zcD8jVradi1Xua4tD4746bCmIckrxbuIuvz2SB5KCcd87bEd
 /fz2e6jOHb0kx8AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7097A13419;
 Tue, 22 Mar 2022 19:32:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sTVFGlAkOmLXMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Mar 2022 19:32:32 +0000
Message-ID: <c3c00675-cb9b-277f-88a7-0b01455ef0f3@suse.de>
Date: Tue, 22 Mar 2022 20:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/7] drm/gma500: Use managed drmm_mode_config_init()
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
 <3186b184-fa62-9bc4-7531-8ad4eac139ef@suse.de>
In-Reply-To: <3186b184-fa62-9bc4-7531-8ad4eac139ef@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------D0FAkvd4WNBkhGaf3L6soy7N"
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
--------------D0FAkvd4WNBkhGaf3L6soy7N
Content-Type: multipart/mixed; boundary="------------koXB7sx2ojZvd4LChKFubr15";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, daniel.vetter@ffwll.ch
Message-ID: <c3c00675-cb9b-277f-88a7-0b01455ef0f3@suse.de>
Subject: Re: [PATCH 1/7] drm/gma500: Use managed drmm_mode_config_init()
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
 <3186b184-fa62-9bc4-7531-8ad4eac139ef@suse.de>
In-Reply-To: <3186b184-fa62-9bc4-7531-8ad4eac139ef@suse.de>

--------------koXB7sx2ojZvd4LChKFubr15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjAzLjIyIHVtIDIwOjMwIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpIFBhdHJpaw0KPiANCj4gQW0gMjIuMDMuMjIgdW0gMTQ6MTcgc2NocmllYiBQYXRyaWsg
SmFrb2Jzc29uOg0KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlr
LnIuamFrb2Jzc29uQGdtYWlsLmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJt
L2dtYTUwMC9mcmFtZWJ1ZmZlci5jIHwgNCArKy0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMgDQo+PiBiL2RyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYw0KPj4gaW5kZXggNDVkZjlkZTIyMDA3Li4yYjk5
Yzk5NmZkYzIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1l
YnVmZmVyLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIu
Yw0KPj4gQEAgLTUxNCw3ICs1MTQsOCBAQCB2b2lkIHBzYl9tb2Rlc2V0X2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldikNCj4+IMKgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXYg
PSB0b19wY2lfZGV2KGRldi0+ZGV2KTsNCj4+IMKgwqDCoMKgwqAgaW50IGk7DQo+PiAtwqDC
oMKgIGRybV9tb2RlX2NvbmZpZ19pbml0KGRldik7DQo+PiArwqDCoMKgIGlmIChkcm1tX21v
ZGVfY29uZmlnX2luaXQoZGV2KSkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+IA0K
PiBUaGlzIHdpbGwgZmFpbCB3aXRob3V0IGFueSBub3RpY2UuIEkgc3VnZ2VzdCB0byByZXR1
cm4gYW4gZXJyb3IgaGVyZSBvciANCj4gYXQgbGV0IHBzYl9kcml2ZXJfbG9hZCgpIGZhaWwu
DQoNCidhbmQgbGV0IHBzYl9kcml2ZXJfbG9hZCgpIGZhaWwnDQoNCj4gDQo+IEJlc3QgcmVn
YXJkcw0KPiBUaG9tYXMNCj4gDQo+PiDCoMKgwqDCoMKgIGRldi0+bW9kZV9jb25maWcubWlu
X3dpZHRoID0gMDsNCj4+IMKgwqDCoMKgwqAgZGV2LT5tb2RlX2NvbmZpZy5taW5faGVpZ2h0
ID0gMDsNCj4+IEBAIC01NDYsNiArNTQ3LDUgQEAgdm9pZCBwc2JfbW9kZXNldF9jbGVhbnVw
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiDCoMKgwqDCoMKgIGlmIChkZXZfcHJpdi0+
bW9kZXNldCkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9rbXNfaGVscGVyX3BvbGxf
ZmluaShkZXYpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBzYl9mYmRldl9maW5pKGRldik7
DQo+PiAtwqDCoMKgwqDCoMKgwqAgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsNCj4+
IMKgwqDCoMKgwqAgfQ0KPj4gwqAgfQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------koXB7sx2ojZvd4LChKFubr15--

--------------D0FAkvd4WNBkhGaf3L6soy7N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmI6JE8FAwAAAAAACgkQlh/E3EQov+Dv
FxAAvMExvhXM91kf2Asl6naF6lR4vNsZfDHhzqluSbwq4stX+TOdSeLweOfm3n41N7BNezTgOooB
SdeNxudtYmsWEMFZklqWfpMlkCtLj8jjkfykf+M2lUR1+30rc0kxGE96Pf+OeOdsfI68LWOKawBb
ANOwqFKyJXDXpnapX5KQjW/AFPrBfO9b3WTFRcWG+UChbHyR14U3koJjVnB14gfL2Mhvq5+aS215
KrMQhYhg/Zd0X1QGS+Hv7LyXYg98lH7O/AX16Ge9lEgOrl3K0se+PZAohgz3I5yxLdZ3xrQSlff7
ig2WOh8XDIaAG6ZZejiQVWapYb11xaGBHCL7Sc2D9Y95iq5AYdDEpMxypfbgNeFf/cj1rW+pNdVQ
pq2KXXTG9mZuDqnOzgO9xEBpVI9IxPtDb/XcIjv/HIJbd9HypbZIW4VgQkcEAhwWZGAtpmMkjk14
YKRSgQtksbzYjWNlwtg8unYDWfsWFoZ6nKDDlZMukUOszObFk83Y4YAQKTzagwHXER64rmJrP1Yc
TjQ9BU+6z4fCHJRZVGf6hx4lk9U6v7fKdxKKyGJ4/CcFnqtKmHolXew4IXWv6UbQQImMrRtKgUxJ
s2lLVWVer5QTrsKQex23lXtxxbJ8a+fvI49EJ1EEMKqyOxi49K+YkU2iD+YEJGaabKBSZb6nfYJb
r/Y=
=9TLH
-----END PGP SIGNATURE-----

--------------D0FAkvd4WNBkhGaf3L6soy7N--
