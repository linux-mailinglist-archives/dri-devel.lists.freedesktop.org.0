Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7BA705339
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 18:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3183D10E25B;
	Tue, 16 May 2023 16:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E581310E086;
 Tue, 16 May 2023 16:08:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 038311FF77;
 Tue, 16 May 2023 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684253332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5zPscgIXFE62i014tFNvlGObfZ+Zc22FlJk7qe2yjo=;
 b=1kFrHtPwq/eOjBNPvC8yRsQDMlKbqVVALAYbJremA9BqrdDiKcplLE82kjJg31BN5YMMdV
 vfAYpGsreX2opYvZceEgnF1lHxQCmn1u9KRne36ymoRu0ZVNjspX96T/VjDpPKUejkcRgZ
 3WCG6cmUPYEIzIsB1igNnL3Ho1obTGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684253332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5zPscgIXFE62i014tFNvlGObfZ+Zc22FlJk7qe2yjo=;
 b=aKMV7cYBqz5v4MLueIZOgFi9XVA+LfoD8JGQTAjSNALId1xWwF6xKhoiA+6FvNSYoCH5sI
 uQKTgTXLpNLdFYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2DBC138F5;
 Tue, 16 May 2023 16:08:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ho9eMpOqY2S1GgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 May 2023 16:08:51 +0000
Message-ID: <05927999-389e-3a42-9b0d-3da9bc695d94@suse.de>
Date: Tue, 16 May 2023 18:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm/ttm: let struct ttm_device_funcs be placed in rodata
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20230309123700.528641-1-jani.nikula@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230309123700.528641-1-jani.nikula@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Erae4kpIS6O0hmJP2FbZwFAC"
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
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Erae4kpIS6O0hmJP2FbZwFAC
Content-Type: multipart/mixed; boundary="------------8f3oB6FWUtT7KSTY0hh0qw1O";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Message-ID: <05927999-389e-3a42-9b0d-3da9bc695d94@suse.de>
Subject: Re: [PATCH] drm/ttm: let struct ttm_device_funcs be placed in rodata
References: <20230309123700.528641-1-jani.nikula@intel.com>
In-Reply-To: <20230309123700.528641-1-jani.nikula@intel.com>

--------------8f3oB6FWUtT7KSTY0hh0qw1O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA5LjAzLjIzIHVtIDEzOjM3IHNjaHJpZWIgSmFuaSBOaWt1bGE6DQo+IE1ha2Ug
dGhlIHN0cnVjdCB0dG1fZGV2aWNlX2Z1bmNzIHBvaW50ZXJzIGNvbnN0IHNvIHRoZSBkYXRh
IGNhbiBiZSBwbGFjZWQgaW4gcm9kYXRhLg0KPiANCj4gQ2M6IENocmlzdGlhbiBLb2VuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5n
QGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9kZXZp
Y2UuYyB8IDIgKy0NCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oICAgICB8IDQg
KystLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMNCj4gaW5kZXggYWUyZjE5
ZGM5ZjgxLi5hNzFiYjEzNjJkZTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Rldmlj
ZS5jDQo+IEBAIC0xOTAsNyArMTkwLDcgQEAgRVhQT1JUX1NZTUJPTCh0dG1fZGV2aWNlX3N3
YXBvdXQpOw0KPiAgICAqIFJldHVybnM6DQo+ICAgICogITA6IEZhaWx1cmUuDQo+ICAgICov
DQo+IC1pbnQgdHRtX2RldmljZV9pbml0KHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LCBzdHJ1
Y3QgdHRtX2RldmljZV9mdW5jcyAqZnVuY3MsDQo+ICtpbnQgdHRtX2RldmljZV9pbml0KHN0
cnVjdCB0dG1fZGV2aWNlICpiZGV2LCBjb25zdCBzdHJ1Y3QgdHRtX2RldmljZV9mdW5jcyAq
ZnVuY3MsDQo+ICAgCQkgICAgc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgYWRkcmVzc19z
cGFjZSAqbWFwcGluZywNCj4gICAJCSAgICBzdHJ1Y3QgZHJtX3ZtYV9vZmZzZXRfbWFuYWdl
ciAqdm1hX21hbmFnZXIsDQo+ICAgCQkgICAgYm9vbCB1c2VfZG1hX2FsbG9jLCBib29sIHVz
ZV9kbWEzMikNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgg
Yi9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oDQo+IGluZGV4IDU2ZTgyYmEyZDA0Ni4u
YzIyZjMwNTM1Yzg0IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2Rldmlj
ZS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgNCj4gQEAgLTIyMyw3
ICsyMjMsNyBAQCBzdHJ1Y3QgdHRtX2RldmljZSB7DQo+ICAgCSAqIEBmdW5jczogRnVuY3Rp
b24gdGFibGUgZm9yIHRoZSBkZXZpY2UuDQo+ICAgCSAqIENvbnN0YW50IGFmdGVyIGJvIGRl
dmljZSBpbml0DQo+ICAgCSAqLw0KPiAtCXN0cnVjdCB0dG1fZGV2aWNlX2Z1bmNzICpmdW5j
czsNCj4gKwljb25zdCBzdHJ1Y3QgdHRtX2RldmljZV9mdW5jcyAqZnVuY3M7DQo+ICAgDQo+
ICAgCS8qKg0KPiAgIAkgKiBAc3lzbWFuOiBSZXNvdXJjZSBtYW5hZ2VyIGZvciB0aGUgc3lz
dGVtIGRvbWFpbi4NCj4gQEAgLTI4Nyw3ICsyODcsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
dHRtX3NldF9kcml2ZXJfbWFuYWdlcihzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwgaW50IHR5
cGUsDQo+ICAgCWJkZXYtPm1hbl9kcnZbdHlwZV0gPSBtYW5hZ2VyOw0KPiAgIH0NCj4gICAN
Cj4gLWludCB0dG1fZGV2aWNlX2luaXQoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsIHN0cnVj
dCB0dG1fZGV2aWNlX2Z1bmNzICpmdW5jcywNCj4gK2ludCB0dG1fZGV2aWNlX2luaXQoc3Ry
dWN0IHR0bV9kZXZpY2UgKmJkZXYsIGNvbnN0IHN0cnVjdCB0dG1fZGV2aWNlX2Z1bmNzICpm
dW5jcywNCj4gICAJCSAgICBzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBhZGRyZXNzX3Nw
YWNlICptYXBwaW5nLA0KPiAgIAkJICAgIHN0cnVjdCBkcm1fdm1hX29mZnNldF9tYW5hZ2Vy
ICp2bWFfbWFuYWdlciwNCj4gICAJCSAgICBib29sIHVzZV9kbWFfYWxsb2MsIGJvb2wgdXNl
X2RtYTMyKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------8f3oB6FWUtT7KSTY0hh0qw1O--

--------------Erae4kpIS6O0hmJP2FbZwFAC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRjqpMFAwAAAAAACgkQlh/E3EQov+AZ
cA/9GQsrHyuhAwqtqcnaHe3zUgemDtpOaxNzmMERYTk5EdGbHcq2eVG5IOe17OzfUcS9m/fXxSa6
tD9GGPGrl8mEWUfLK4Zm21OX5W60K+E9lyk99lyJFjFz0QDyHDRBH9Gk4OF05cJTZwyGSpMCA9rY
f3GRuFmxkACAkSMVmzDHVOI4bbNtfj+GsY3bkJimSLlexfMkK/OgIKyOJoE1G4TPHEwKeokfu9lW
hc0/RnUf155fz8jOS4Lt/w4HiFPhSA5O90EbjUePGtavcKeGC/hg6kbo79l72nS1cU+uiD9PucUK
Fmn0+nK2ZAufz68TylE+0/yPyMmVSpXG8xR4ruRX43QPR2ML1fGNjdmSc2XbP8ZUhpnTuu4tH+gp
X+140NcBnWwmtsTLYpYbmptpxA0VPayI5N7xR4gVlya1MvWJhg3e+ZTY6HWzhp1LrazDrY2EdL06
RB01aC62VGNYPznwo27ssjHTBbhbDqAg4lOodgUW0XghZzXJ4b8pifq6oZjzok5iBO+nXq0oEXUP
urxAIMjfBm4lIX6SzIqJQjeKTIeeZe2kKYecZoRi36Ef2iQ4yHvGOTF8WIknlcM0xZpT9VfoRT6L
wx09gWNHBTacAD+Nz+N1KfQzKSFip7ZTDdBVpq8EpWSDgo/+BN8ULN8P9Sk5isBxWwj/l2hG1IHE
p6s=
=xn6A
-----END PGP SIGNATURE-----

--------------Erae4kpIS6O0hmJP2FbZwFAC--
