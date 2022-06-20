Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CFF551627
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4299210F5BD;
	Mon, 20 Jun 2022 10:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2584C10F5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 10:44:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C94EC21BF0;
 Mon, 20 Jun 2022 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655721865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0GkViuk1BaE8I71paYJAtWWHTnBPIbMEUkY5ZoP/ieU=;
 b=YDFUzmyeM6vkYOds94YNI66xfYwEXKXoy9INcQkda13nXE9TisAu+xDSwRQgS24vLp24ur
 dWy3+PlXFhLNNJQ5zEBFfgazkg3E2G3yuMFzKBg3osKKt6BlRoaoLGxQKlRlQJITdm6+aU
 qnceWr49yXATa3h1sw+9U205YpsklFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655721865;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0GkViuk1BaE8I71paYJAtWWHTnBPIbMEUkY5ZoP/ieU=;
 b=muWDbWhSoTiI5KaNn6HH66/HA23wWEvE5fimKLpoddofJw6c2fWdWdm7w37+iRbyX1r1iv
 dKDz9mAtBvws68BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5ABE13638;
 Mon, 20 Jun 2022 10:44:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xn5QJ4lPsGJ1agAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 10:44:25 +0000
Message-ID: <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
Date: Mon, 20 Jun 2022 12:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220610092924.754942-10-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZQm0Q2PVKuIRCWt3MWPZ8o5T"
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
--------------ZQm0Q2PVKuIRCWt3MWPZ8o5T
Content-Type: multipart/mixed; boundary="------------ZBWtcKHy34JlTtFRsCRS0Q9x";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-10-maxime@cerno.tech>

--------------ZBWtcKHy34JlTtFRsCRS0Q9x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDYuMjIgdW0gMTE6Mjggc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBU
aGUgRFJNLW1hbmFnZWQgZnVuY3Rpb24gdG8gcmVnaXN0ZXIgYW4gZW5jb2RlciBpcw0KPiBk
cm1tX3NpbXBsZV9lbmNvZGVyX2FsbG9jKCkgYW5kIGl0cyB2YXJpYW50cywgd2hpY2ggd2ls
bCBhbGxvY2F0ZSB0aGUNCj4gdW5kZXJseWluZyBzdHJ1Y3R1cmUgYW5kIGluaXRpYWxpc2F0
aW9uIHRoZSBlbmNvZGVyLg0KPiANCj4gSG93ZXZlciwgd2UgbWlnaHQgd2FudCB0byBzZXBh
cmF0ZSB0aGUgc3RydWN0dXJlIGNyZWF0aW9uIGFuZCB0aGUgZW5jb2Rlcg0KPiBpbml0aWFs
aXNhdGlvbiwgZm9yIGV4YW1wbGUgaWYgdGhlIHN0cnVjdHVyZSBpcyBzaGFyZWQgYWNyb3Nz
IG11bHRpcGxlIERSTQ0KPiBlbnRpdGllcywgZm9yIGV4YW1wbGUgYW4gZW5jb2RlciBhbmQg
YSBjb25uZWN0b3IuDQo+IA0KPiBMZXQncyBjcmVhdGUgYW4gaGVscGVyIHRvIG9ubHkgaW5p
dGlhbGlzZSBhbiBlbmNvZGVyIHRoYXQgd291bGQgYmUgcGFzc2VkDQo+IGFzIGFuIGFyZ3Vt
ZW50Lg0KPiANCg0KVGhlcmUncyBub3RoaW5nIHdyb25nIHdpdGggdGhpcyBwYXRjaCwgYnV0
IEkgaGF2ZSB0byBhZG1pdCB0aGF0IGFkZGluZyANCmRybV9zaW1wbGVfZW5jb2Rlcl9pbml0
KCkgZXQgYWwgd2FzIGEgbWlzdGFrZS4gSXQgd291bGQgaGF2ZSBiZWVuIGJldHRlciANCnRv
IGFkZCBhbiBpbml0aWFsaXplciBtYWNybyBsaWtlDQoNCiNkZWZpbmUgRFJNX1NUQVRJQ19F
TkNPREVSX0RFRkFVTFRfRlVOQ1MgXA0KICAgLmRlc3Ryb3kgPSBkcm1fZW5jb2Rlcl9jbGVh
bnVwDQoNCkl0J3Mgd2F5IG1vcmUgZmxleGlibGUgYW5kIHNpbWlsYXJseSBlYXN5IHRvIHVz
ZS4gQW55d2F5Li4uDQoNCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1l
QGNlcm5vLnRlY2g+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmMgfCA0NiArKysrKysrKysrKysr
KysrKysrKysrKy0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmgg
ICAgIHwgIDMgKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9z
aW1wbGVfa21zX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hl
bHBlci5jDQo+IGluZGV4IDcyOTg5ZWQxYmFiYS4uODc2ODcwZGQ5OGU1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jDQo+IEBAIC01OCw5ICs1
OCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIGRybV9zaW1w
bGVfZW5jb2Rlcl9mdW5jc19jbGVhbnVwID0gew0KPiAgICAqIHN0b3JlZCBpbiB0aGUgZGV2
aWNlIHN0cnVjdHVyZS4gRnJlZSB0aGUgZW5jb2RlcidzIG1lbW9yeSBhcyBwYXJ0IG9mDQo+
ICAgICogdGhlIGRldmljZSByZWxlYXNlIGZ1bmN0aW9uLg0KPiAgICAqDQo+IC0gKiBOb3Rl
OiBjb25zaWRlciB1c2luZyBkcm1tX3NpbXBsZV9lbmNvZGVyX2FsbG9jKCkgaW5zdGVhZCBv
Zg0KPiAtICogZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSB0byBsZXQgdGhlIERSTSBtYW5h
Z2VkIHJlc291cmNlIGluZnJhc3RydWN0dXJlDQo+IC0gKiB0YWtlIGNhcmUgb2YgY2xlYW51
cCBhbmQgZGVhbGxvY2F0aW9uLg0KPiArICogTm90ZTogY29uc2lkZXIgdXNpbmcgZHJtbV9z
aW1wbGVfZW5jb2Rlcl9hbGxvYygpIG9yDQo+ICsgKiBkcm1tX3NpbXBsZV9lbmNvZGVyX2lu
aXQoKSBpbnN0ZWFkIG9mIGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkgdG8NCj4gKyAqIGxl
dCB0aGUgRFJNIG1hbmFnZWQgcmVzb3VyY2UgaW5mcmFzdHJ1Y3R1cmUgdGFrZSBjYXJlIG9m
IGNsZWFudXAgYW5kDQo+ICsgKiBkZWFsbG9jYXRpb24uDQo+ICAgICoNCj4gICAgKiBSZXR1
cm5zOg0KPiAgICAqIFplcm8gb24gc3VjY2VzcywgZXJyb3IgY29kZSBvbiBmYWlsdXJlLg0K
PiBAQCAtNzUsNiArNzYsNDUgQEAgaW50IGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX3NpbXBs
ZV9lbmNvZGVyX2luaXQpOw0KPiAgIA0KPiArc3RhdGljIHZvaWQgZHJtbV9zaW1wbGVfZW5j
b2Rlcl9jbGVhbnVwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnB0cikNCj4gK3sN
Cj4gKwlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIgPSBwdHI7DQo+ICsNCj4gKwlkcm1f
ZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGRy
bW1fc2ltcGxlX2VuY29kZXJfaW5pdCAtIEluaXRpYWxpemUgYSBwcmVhbGxvY2F0ZWQgZW5j
b2RlciB3aXRoDQo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICBiYXNpYyBmdW5j
dGlvbmFsaXR5Lg0KPiArICogQGRldjogZHJtIGRldmljZQ0KPiArICogQGVuY29kZXI6IHRo
ZSBlbmNvZGVyIHRvIGluaXRpYWxpemUNCj4gKyAqIEBlbmNvZGVyX3R5cGU6IHVzZXIgdmlz
aWJsZSB0eXBlIG9mIHRoZSBlbmNvZGVyDQo+ICsgKg0KPiArICogSW5pdGlhbGlzZXMgYSBw
cmVhbGxvY2F0ZWQgZW5jb2RlciB0aGF0IGhhcyBubyBmdXJ0aGVyIGZ1bmN0aW9uYWxpdHku
DQo+ICsgKiBTZXR0aW5ncyBmb3IgcG9zc2libGUgQ1JUQyBhbmQgY2xvbmVzIGFyZSBsZWZ0
IHRvIHRoZWlyIGluaXRpYWwNCj4gKyAqIHZhbHVlcy4gVGhlIGVuY29kZXIgd2lsbCBiZSBj
bGVhbmVkIHVwIGF1dG9tYXRpY2FsbHkgdXNpbmcgYQ0KPiArICogRFJNLW1hbmFnZWQgYWN0
aW9uLg0KPiArICoNCj4gKyAqIFRoZSBzdHJ1Y3R1cmUgY29udGFpbmluZyB0aGUgZW5jb2Rl
cidzIG1lbW9yeSBzaG91bGQgYmUgYWxsb2NhdGVkDQo+ICsgKiB1c2luZyBkcm1tX2t6YWxs
b2MoKS4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOg0KPiArICogWmVybyBvbiBzdWNjZXNzLCBl
cnJvciBjb2RlIG9uIGZhaWx1cmUuDQo+ICsgKi8NCj4gK2ludCBkcm1tX3NpbXBsZV9lbmNv
ZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gKwkJCSAgICAgc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLA0KPiArCQkJICAgICBpbnQgZW5jb2Rlcl90eXBlKQ0KPiAr
ew0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KGRldiwg
ZW5jb2RlciwgTlVMTCwgZW5jb2Rlcl90eXBlLCBOVUxMKTsNCj4gKwlpZiAocmV0KQ0KPiAr
CQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0dXJuIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNl
dChkZXYsIGRybW1fc2ltcGxlX2VuY29kZXJfY2xlYW51cCwgZW5jb2Rlcik7DQo+ICt9DQo+
ICtFWFBPUlRfU1lNQk9MKGRybW1fc2ltcGxlX2VuY29kZXJfaW5pdCk7DQo+ICsNCj4gICB2
b2lkICpfX2RybW1fc2ltcGxlX2VuY29kZXJfYWxsb2Moc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgc2l6ZV90IHNpemUsDQo+ICAgCQkJCSAgc2l6ZV90IG9mZnNldCwgaW50IGVuY29kZXJf
dHlwZSkNCj4gICB7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fc2ltcGxlX2tt
c19oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oDQo+IGlu
ZGV4IDBiMzY0N2U2MTRkZC4uMjA0NTZmNDcxMmYwIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
c2ltcGxlX2ttc19oZWxwZXIuaA0KPiBAQCAtMjQxLDYgKzI0MSw5IEBAIGludCBkcm1fc2lt
cGxlX2Rpc3BsYXlfcGlwZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgaW50
IGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAg
CQkJICAgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwNCj4gICAJCQkgICAgaW50IGVu
Y29kZXJfdHlwZSk7DQo+ICtpbnQgZHJtbV9zaW1wbGVfZW5jb2Rlcl9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsDQo+ICsJCQkgICAgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
ciwNCj4gKwkJCSAgICAgaW50IGVuY29kZXJfdHlwZSk7DQo+ICAgDQo+ICAgdm9pZCAqX19k
cm1tX3NpbXBsZV9lbmNvZGVyX2FsbG9jKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHNpemVf
dCBzaXplLA0KPiAgIAkJCQkgIHNpemVfdCBvZmZzZXQsIGludCBlbmNvZGVyX3R5cGUpOw0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------ZBWtcKHy34JlTtFRsCRS0Q9x--

--------------ZQm0Q2PVKuIRCWt3MWPZ8o5T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwT4kFAwAAAAAACgkQlh/E3EQov+A2
NBAAxgl7toOFxEPabAWPuLZEBNMvQsyOOq8DKv8PrHj6dRSzggr5ngOOxrBXgESEhTP1HA8f89Qn
9Fn3Hh8YIDW9ujUECTcGVu8MRmH4WfPO/KpQfXbA9cbi+QYOG5w8oXKJjPPqi7D0fn3s+gWlTRkN
qXyVIy/97v2rpVgrqwMvOXZqCtmDuJolHLiknMy8U1HxYqTlJdlZWRc/qLk3yHwjjxpScAuuz4nH
b4v3kG5lsKDgaOJ0/e4HbF6F8r6K583v42cQx9Hc0hGjQddEPQ/kF3ADg/x2XxCDTTJVUjLGsNEC
uR4H/XS7VOCHvqTXYnSRjU1rS51/IG8uX5BHteFW6l0fZrNitjSlECXcj2qmnhQR+ulMsApBHh/D
nP0DnrHoqmVsRTQE1ZmZJfwE0X4XkDTL+1wysh20xepaMwqnRKQClzwG50AwcdPAI0biNLyQXUk3
QqbfWNsQeVTUk0JMVM2We2pKtxtAKXkF3Vubmsr04wdPHo504rCdRc8oxt/3X+Ib+shKODqyS38D
T1Sb8wvG9+rsGAh35evw6lncUPD6O/O0yshdTefbp3XERMw1bvVCzXCWLLWLMhKGh8AwPJoszuHD
hgyU+k/tm/vrTcZ8LukXPAeYgIunb2RToj1QI57Pr5On0EMZ6jibIXyTGwYoYD572k95AHRPhBFd
Q6s=
=+Iat
-----END PGP SIGNATURE-----

--------------ZQm0Q2PVKuIRCWt3MWPZ8o5T--
