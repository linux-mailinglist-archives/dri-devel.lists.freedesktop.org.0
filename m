Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845D4AF232
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842C410E3D7;
	Wed,  9 Feb 2022 12:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CCC10E3D7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:58:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E73C210DB;
 Wed,  9 Feb 2022 12:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644411490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xnTnvdUT30zM/EYcpPYmeFofrkZIWszzK+3fLNUqsDo=;
 b=J1qMOH/u7q5JdndoxcdQIooUE5vLTXKZ+ZFOIb4JvcuvOC78uFMdCPwLauAH5wDQTMwDIV
 dWUsBBAHN2eoVjac5GB/Ce520kUdSrB94e0rJ3hOQ07ZpJQNpOwYy0cmbbRBGvP+KTn0hz
 l3xXYmNmlulsJTOzFq/HUnH+DvsZClc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644411490;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xnTnvdUT30zM/EYcpPYmeFofrkZIWszzK+3fLNUqsDo=;
 b=mqgiT8Fhsd611y9xnC2J0CzaimmtwRAIX3xt90DFpUB6DfmvAzram20xuaASjsrr6Edf5K
 pMpEThPVgrbzq4Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CD4C13D2F;
 Wed,  9 Feb 2022 12:58:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +q6LGWK6A2KvNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 12:58:10 +0000
Message-ID: <8867df52-a883-4a21-af63-954edbbe036f@suse.de>
Date: Wed, 9 Feb 2022 13:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] drm/fb-helper: Calculate damaged area in separate
 helper
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-4-tzimmermann@suse.de>
 <978298f5-3775-c19a-37b0-8eec2f3aa696@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <978298f5-3775-c19a-37b0-8eec2f3aa696@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WPQUwQjaAIullxViuYOSoWAt"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WPQUwQjaAIullxViuYOSoWAt
Content-Type: multipart/mixed; boundary="------------ai8F0UjIfg3Rngf1b7PYVoKL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <8867df52-a883-4a21-af63-954edbbe036f@suse.de>
Subject: Re: [PATCH 3/5] drm/fb-helper: Calculate damaged area in separate
 helper
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-4-tzimmermann@suse.de>
 <978298f5-3775-c19a-37b0-8eec2f3aa696@redhat.com>
In-Reply-To: <978298f5-3775-c19a-37b0-8eec2f3aa696@redhat.com>

--------------ai8F0UjIfg3Rngf1b7PYVoKL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDIuMjIgdW0gMTI6MDIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDIvNi8yMiAyMDoyOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBBZGQgZHJtX2ZiX2hlbHBlcl9jbGlwX3RvX21lbW9yeV9yYW5nZSgpLCBhIGhlbHBlciBm
dW5jdGlvbiB0aGF0DQo+PiBhY2NlcHRzIGFuIGxpbmVhciByYW5nZSBvZiB2aWRlbyBtZW1v
cnkgYW5kIGNvbnZlcnRzIGl0IGludG8gYQ0KPj4gcmVjdGFuZ2xlLiBUaGUgY29tcHV0ZWQg
cmVjdGFuZ2xlIGRlc2NyaWJlcyB0aGUgZGFtYWdlZCBhcmVhIGluDQo+PiB0ZXJtcyBvZiBz
Y2FubGluZXMgYW5kIHBpeGVscyBwZXIgc2NhbmxpbmUuDQo+Pg0KPj4gV2hpbGUgYXQgaXQs
IG1ha2UgdGhlIGNvZGUgbW9yZSByZWFkYWJsZSBieSB1c2luZyBzdHJ1Y3QgZHJtX3JlY3QN
Cj4+IGFuZCByZWxhdGVkIGhlbHBlcnMuDQo+Pg0KPj4gVGhlIGNvZGUgd2FzIHByZXZpb3Vz
bHkgcGFydCBvZiB0aGUgZGVmZXJyZWQgSS9PIGhlbHBlcnMsIGJ1dCBpcw0KPj4gYWxzbyB1
c2VmdWwgZm9yIGRhbWFnZSBoYW5kbGluZyBvZiByZWd1bGFyIHdyaXRlIG9wZXJhdGlvbnMu
IFVwZGF0ZQ0KPj4gdGhlIGRlZmVycmVkIEkvTyBjb2RlIHRvIHVzZSB0aGUgbmV3IGZ1bmN0
aW9uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVs
cGVyLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJfaGVscGVyLmMNCj4+IGluZGV4IDg3YzQ3MDkzYzNhMi4uYWU5ODk5MGM3YjY2
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4gQEAgLTY4MCw2ICs2
ODAsMTkgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kYW1hZ2Uoc3RydWN0IGZiX2lu
Zm8gKmluZm8sIHUzMiB4LCB1MzIgeSwNCj4+ICAgCXNjaGVkdWxlX3dvcmsoJmhlbHBlci0+
ZGFtYWdlX3dvcmspOw0KPj4gICB9DQo+PiAgIA0KPj4gKy8qIENvbnZlcnQgbWVtb3J5IHJl
Z2lvbiBpbnRvIGFyZWEgb2Ygc2NhbmxpbmVzIGFuZCBwaXhlbHMgcGVyIHNjYW5saW5lICov
DQo+PiArc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9jbGlwX3RvX21lbW9yeV9yYW5nZShz
dHJ1Y3QgZmJfaW5mbyAqaW5mbywgb2ZmX3Qgb2ZmLCBzaXplX3QgbGVuLA0KPj4gKwkJCQkJ
ICAgICAgIHN0cnVjdCBkcm1fcmVjdCAqY2xpcCkNCj4+ICt7DQo+IA0KPiBTaG91bGRuJ3Qg
YmUgY2FsbGVkIGRybV9mYl9oZWxwZXJfY2xpcF9mcm9tX21lbW9yeV9yYW5nZSgpIG9yDQo+
IGRybV9mYl9oZWxwZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKSBpbnN0ZWFkID8NCg0KSSB0
aG91Z2h0IHRoYXQgaXQgbWVhbnMgdG8gbWFrZSBhIGNsaXAgcmVjdGFuZ2xlIGZyb20gdGhl
IG1lbW9yeSByYW5nZS4gDQpCdXQgSSB0aGluayB5b3VyIG5hbWUgaXMgYmV0dGVyIGFuZCBt
b3JlIGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVzdCBvZiB0aGUgDQpjb2RlLiBJJ2xsIHVzZSBp
dCBpbnN0ZWFkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBPdGhlcndpc2Ug
aXQgbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------ai8F0UjIfg3Rngf1b7PYVoKL--

--------------WPQUwQjaAIullxViuYOSoWAt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIDumEFAwAAAAAACgkQlh/E3EQov+An
lRAAhh28JQ0Lsx/dHoOl4dZ7e2r0JoZ6lMO5Y8jgPCt3V6YxZapH9//j2CFVFbazQ6TXjqQHdZj2
uozzc74cDU6QyxVjdkNjpRYbdXJOZCeyqYh2l72qc2TB1qkzgUQ8Qi36FtPhYQ9PFeMp0RxdKAlc
f5GjD2sWjZ1UfqMUHfaIMqVXA64pZ5qMWoWV3cjoiPRAZcSNvBSBgRFikuwDxmqaqmhluBT5q6zR
61q0BgGPcdCN8fhWxaGKgmavEQQzGh8OvNgRHdZ8tlawcw+sjB6Pas3YRSi8MVOCPPMJbp9RMk+x
KNui6AO8X71CXQexVle0B96333DpL9d7wm7ps3Ll8oscZtodXpTDhWzPhnFA1nGmT8v10sY4Y2Td
GXfMJ9uwAsJAbUAYPXcLcwa59HVa0pMM0LRlADBeRYCpyzvcuvQJEqVnhydaOn6VAKqq3/kO7bUg
OSPH1m4NhIswNqIls0CpLTZoGD0heQwU0xI9V4Tb7VXEDL923sSPM3IaV2rx9CbEjNQJFB1oks1n
OTvX/eNil6kCeV6xRnDMaDaiAsYTnLeO+XHW4indDx/daPo/b52DypdiJBA1C5P/Tyc9hx36Nc9r
CwoZLAnM+1h+yhADToKBrbBSXBW8tHOk1kg1S+RwQ2qfYs2z+9c6cEUkWatNVrp9o7Twc8nqxUgD
Hng=
=Tk/d
-----END PGP SIGNATURE-----

--------------WPQUwQjaAIullxViuYOSoWAt--
