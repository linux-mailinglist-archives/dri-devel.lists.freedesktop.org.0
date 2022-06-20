Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179055245C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 21:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6E210E191;
	Mon, 20 Jun 2022 19:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E77310E105
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 19:04:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26FF521A11;
 Mon, 20 Jun 2022 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655751852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zUOMk2cr3QT5OvJESAUuKLLVN7+C2Uyq9be+TQqocjk=;
 b=HwvKYQL10i6wa1MulVRPyt0GCWmuOm/pGnAvcmv0l9nXEFP2jtVcBXIBcrA3FlqXWui1W+
 96VIEBeFnTCROLMH4m+llFZ1pSQFbApSLOvPaILWDdaHBxYfeNHvhBBA/ntrKkz4hOz5hI
 O3zo8HdeeY8/x8kt1VcIGErnusd9CXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655751852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zUOMk2cr3QT5OvJESAUuKLLVN7+C2Uyq9be+TQqocjk=;
 b=eHNtzb0Ygb/90SYqoEvft9aFXWhUf4GJOVf6ClGiYCf3IbDMdAf/BdI9wQA4sgiGxSlrXL
 F221Q1hd3At3VXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09038134CA;
 Mon, 20 Jun 2022 19:04:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PVE4AKzEsGKrWAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 19:04:12 +0000
Message-ID: <295ada80-6846-db1e-6e15-01e06ffe7d3d@suse.de>
Date: Mon, 20 Jun 2022 21:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
 <20220620134823.oqjrbnlsce3erhum@houat>
 <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
 <20220620143928.zbbaltwcah3rpkqh@houat>
 <1817bb52-268d-9ed9-b7b3-4bbb291b7925@suse.de>
In-Reply-To: <1817bb52-268d-9ed9-b7b3-4bbb291b7925@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VNHAe7hBe0f0vD5s4ykEMp6U"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VNHAe7hBe0f0vD5s4ykEMp6U
Content-Type: multipart/mixed; boundary="------------M6LDco0qi6VcPddeFEg10vI4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <295ada80-6846-db1e-6e15-01e06ffe7d3d@suse.de>
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
 <20220620134823.oqjrbnlsce3erhum@houat>
 <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
 <20220620143928.zbbaltwcah3rpkqh@houat>
 <1817bb52-268d-9ed9-b7b3-4bbb291b7925@suse.de>
In-Reply-To: <1817bb52-268d-9ed9-b7b3-4bbb291b7925@suse.de>

--------------M6LDco0qi6VcPddeFEg10vI4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjIgdW0gMTY6NDUgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDIwLjA2LjIyIHVtIDE2OjM5IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4+IE9uIE1vbiwgSnVuIDIwLCAyMDIyIGF0IDA0OjI1OjM4UE0gKzAyMDAsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+IEhpDQo+Pj4NCj4+PiBBbSAyMC4wNi4yMiB1bSAx
NTo0OCBzY2hyaWViIE1heGltZSBSaXBhcmQ6DQo+Pj4+IEhpLA0KPj4+Pg0KPj4+PiBPbiBN
b24sIEp1biAyMCwgMjAyMiBhdCAxMjo0NDoyNFBNICswMjAwLCBUaG9tYXMgWmltbWVybWFu
biB3cm90ZToNCj4+Pj4+IEFtIDEwLjA2LjIyIHVtIDExOjI4IHNjaHJpZWIgTWF4aW1lIFJp
cGFyZDoNCj4+Pj4+PiBUaGUgRFJNLW1hbmFnZWQgZnVuY3Rpb24gdG8gcmVnaXN0ZXIgYW4g
ZW5jb2RlciBpcw0KPj4+Pj4+IGRybW1fc2ltcGxlX2VuY29kZXJfYWxsb2MoKSBhbmQgaXRz
IHZhcmlhbnRzLCB3aGljaCB3aWxsIGFsbG9jYXRlIHRoZQ0KPj4+Pj4+IHVuZGVybHlpbmcg
c3RydWN0dXJlIGFuZCBpbml0aWFsaXNhdGlvbiB0aGUgZW5jb2Rlci4NCj4+Pj4+Pg0KPj4+
Pj4+IEhvd2V2ZXIsIHdlIG1pZ2h0IHdhbnQgdG8gc2VwYXJhdGUgdGhlIHN0cnVjdHVyZSBj
cmVhdGlvbiBhbmQgdGhlIA0KPj4+Pj4+IGVuY29kZXINCj4+Pj4+PiBpbml0aWFsaXNhdGlv
biwgZm9yIGV4YW1wbGUgaWYgdGhlIHN0cnVjdHVyZSBpcyBzaGFyZWQgYWNyb3NzIA0KPj4+
Pj4+IG11bHRpcGxlIERSTQ0KPj4+Pj4+IGVudGl0aWVzLCBmb3IgZXhhbXBsZSBhbiBlbmNv
ZGVyIGFuZCBhIGNvbm5lY3Rvci4NCj4+Pj4+Pg0KPj4+Pj4+IExldCdzIGNyZWF0ZSBhbiBo
ZWxwZXIgdG8gb25seSBpbml0aWFsaXNlIGFuIGVuY29kZXIgdGhhdCB3b3VsZCBiZSANCj4+
Pj4+PiBwYXNzZWQNCj4+Pj4+PiBhcyBhbiBhcmd1bWVudC4NCj4+Pj4+Pg0KPj4+Pj4NCj4+
Pj4+IFRoZXJlJ3Mgbm90aGluZyB3cm9uZyB3aXRoIHRoaXMgcGF0Y2gsIGJ1dCBJIGhhdmUg
dG8gYWRtaXQgdGhhdCBhZGRpbmcNCj4+Pj4+IGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KCkg
ZXQgYWwgd2FzIGEgbWlzdGFrZS4NCj4+Pj4NCj4+Pj4gV2h5IGRvIHlvdSB0aGluayBpdCB3
YXMgYSBtaXN0YWtlPw0KPj4+DQo+Pj4gVGhlIHNpbXBsZS1lbmNvZGVyIHN0dWZmIGlzIGFu
IGludGVyZmFjZSB0aGF0IG5vIG9uZSByZWFsbHkgbmVlZHMuIA0KPj4+IENvbXBhcmVkDQo+
Pj4gdG8gb3Blbi1jb2RpbmcgdGhlIGZ1bmN0aW9uLCBpdCdzIGJhcmVseSBhbiBpbXByb3Zl
bWVudCBpbiBMT0NzLCBidXQgDQo+Pj4gbm90aGluZw0KPj4+IGVsc2UuDQo+Pj4NCj4+PiBC
YWNrIHdoZW4gSSBhZGRlZCBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpLCBJIHdhbnRlZCB0
byBzaW1wbGlmeSB0aGUgDQo+Pj4gbWFueQ0KPj4+IGRyaXZlcnMgdGhhdCBpbml0aWFsaXpl
ZCB0aGUgZW5jb2RlciB3aXRoIGEgY2xlYW51cCBjYWxsYmFjayBhbmQgbm90aGluZw0KPj4+
IGVsc2UuwqAgSUlSQyBpdCB3YXMgYW4gaW1wcm92ZW1lbnQgYmFjayB0aGVuLsKgIEJ1dCBu
b3cgd2UgYWxyZWFkeSBoYXZlIGENCj4+PiByZWxhdGVkIGRybW1fIGhlbHBlciBhbmQgYSBk
cm1tX2FsbG9jXyBoZWxwZXIuIElmIEkgaGFkIG9ubHkgYWRkZWQgDQo+Pj4gdGhlIG1hY3Jv
DQo+Pj4gYmFjayB0aGVuLCB3ZSBjb3VsZCB1c2UgdGhlIHJlZ3VsYXIgZW5jb2RlciBoZWxw
ZXJzLg0KPj4+DQo+Pj4+DQo+Pj4+PiBJdCB3b3VsZCBoYXZlIGJlZW4gYmV0dGVyIHRvIGFk
ZCBhbiBpbml0aWFsaXplciBtYWNybyBsaWtlDQo+Pj4+Pg0KPj4+Pj4gI2RlZmluZSBEUk1f
U1RBVElDX0VOQ09ERVJfREVGQVVMVF9GVU5DUyBcDQo+Pj4+PiDCoMKgwqAgLmRlc3Ryb3kg
PSBkcm1fZW5jb2Rlcl9jbGVhbnVwDQo+Pj4+Pg0KPj4+Pj4gSXQncyB3YXkgbW9yZSBmbGV4
aWJsZSBhbmQgc2ltaWxhcmx5IGVhc3kgdG8gdXNlLiBBbnl3YXkuLi4NCj4+Pj4NCj4+Pj4g
V2UgY2FuIHN0aWxsIGhhdmUgdGhpcy4gSXQgd291bGQgc2ltcGxpZnkgdGhpcyBzZXJpZXMg
c28gSSBjb3VsZA0KPj4+PiBkZWZpbml0ZWx5IHNxdWVlemUgdGhhdCBwYXRjaCBpbiBhbmQg
YWRkIGEgVE9ETyBpdGVtIC8gZGVwcmVjYXRpb24NCj4+Pj4gbm90aWNlIGZvciBzaW1wbGUg
ZW5jb2RlcnMgaWYgeW91IHRoaW5rIGl0J3MgbmVlZGVkDQo+Pj4NCj4+PiBOb3QgbmVjZXNz
YXJ5LiBJdCdzIG5vdCBzdXBlciBpbXBvcnRhbnQuDQo+Pg0KPj4gVGhlIGNvcm9sbGFyeSBp
cyB0aG91Z2ggOikNCj4+DQo+PiBJZiBJIHVuZGVyc3RhbmQgeW91IHJpZ2h0LCBpdCBtZWFu
cyB0aGF0IHlvdSdkIHJhdGhlciBoYXZlIGEgZGVzdHJveQ0KPj4gY2FsbGJhY2sgZXZlcnl3
aGVyZSBpbnN0ZWFkIG9mIGNhbGxpbmcgdGhlIF9jbGVhbnVwIGZ1bmN0aW9uIHRocm91Z2gg
YQ0KPj4gZHJtLW1hbmFnZWQgY2FsbGJhY2ssIGFuZCBsZXQgZHJtX2Rldl91bnJlZ2lzdGVy
IGRvIGl0cyBqb2I/DQo+Pg0KPj4gSWYgc28sIGl0IG1lYW5zIHRoYXQgd2Ugc2hvdWxkbid0
IGJlIGZvbGxvd2luZyB0aGUgZHJtbV8uKl9hbGxvYw0KPj4gZnVuY3Rpb25zIGFuZCBzaG91
bGQgZHJvcCBhbGwgdGhlIG5ldyBvbmVzIGZyb20gdGhpcyBzZXJpZXMuDQo+IA0KPiBObywg
bm8uIFdoYXQgSSdtIHNheWluZyBpcyB0aGF0IHNpbXBsZS1lbmNvZGVyIGlzIGEgcG9pbnRs
ZXNzIG1pZC1sYXllci4gDQo+IFRoZXJlJ3Mgbm90aGluZyB0aGF0IGNvdWxkbid0IGVhc2ls
eSBiZSBhY2hpZXZlZCB3aXRoIHRoZSByZWd1bGFyIA0KPiBlbmNvZGVyIGZ1bmN0aW9ucy4N
Cg0KSSBndWVzcyB0aGF0IGlmIHlvdSB3YW50IHRvIGNoYW5nZSBzb21ldGhpbmcgaGVyZSwg
eW91IGNvdWxkIGFkZCANCmRybW1fZW5jb2Rlcl9pbml0KCkgaW5zdGVhZCBhbmQgY29udmVy
dCB2YzQuIFRoYXQgZnVuY3Rpb24gbWlnaHQgYmUgbW9yZSANCnVzZWZ1bCBmb3Igb3RoZXIg
ZHJpdmVycyBpbiB0aGUgbG9uZyBydW4uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+Pg0KPj4gTWF4aW1lDQo+IA0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------M6LDco0qi6VcPddeFEg10vI4--

--------------VNHAe7hBe0f0vD5s4ykEMp6U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwxKsFAwAAAAAACgkQlh/E3EQov+AC
ExAAgRGvK+HRYFxLaMOfjXCGrReoYf4tTMiDmjRdDX59v2J8tFpIZpK+aI/2qATaICnOl/LByiVM
pl4upsAj3Jd6GWBMXIHaNdm7lu9t4oFw//CfVePq66NCpjj7y9FjGLDIooe/ULnXWklBqE+/crHt
ZObrDmHKZ46If2g7A6MQN5ehWZN9T5SWm4GaAsMYef40gAvMXcAD3nklmiVWygkezLDev7m3Kibu
nqsROytpf+Fni/SQQ+S7X5/8/UNd+HWS5eoXI1YU8ysymKqfSMpxoX9SkoyWKgv6yCNYXPTCVlHL
EE4qrLyPsisytIFc4aug7/jxtQiDTN/0b+XRh07UIlS6/tMhc6Kn11xqwkgNBWboBaGV5Ha35UVz
6y7uLWIfDGaB4NHaZdCpVb2MYqhki2tATw8r+sIZAsofr6YvkAYd2lqcbZWnZq2ATzhVoubV6XYv
jSJP0vspn09T9cLh4UM2XePi69lwX1iJ8XDMfefQvs0HXikgvyCvhhr3uD/9dfn2pViSPdtPibHn
NIvXM5SFDdJlBaZcrIIurhEHxQ5tzlCZd9Po8Zri63gI2wCQ23t47oStjJ5253TEfxqGoYwL65zp
DTBpBrGiQb3x6WgI2q6jrv4oTO5uVJEtFdQWhl4pmx8hcpgtNbdILtZlILLoYMMamKuLjc7SED+o
PgA=
=yLtc
-----END PGP SIGNATURE-----

--------------VNHAe7hBe0f0vD5s4ykEMp6U--
