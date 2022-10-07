Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F765F7508
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 10:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3C210E06E;
	Fri,  7 Oct 2022 08:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EFB10E06E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 08:06:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 450D321898;
 Fri,  7 Oct 2022 08:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665129987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+plFcqhzxAuYDCsC3MNYXR9/lOAr0AmkVzvWXp2aqU8=;
 b=l5zCV+YhXBaNEwTUBmHzkcO90JkoANVZG9UIYkrpgEIuZtsbbxT7T7MROdHaVWeIBHPHlZ
 il7JEauUJle+YnN7cPuUXz7wWNrgJlqUYBGGpccqfbV0Hm4dSkNKZP4fLw+ok/SF1DYrD7
 r1MUTHee2QOye29NPqSEq8EBtLzxjw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665129987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+plFcqhzxAuYDCsC3MNYXR9/lOAr0AmkVzvWXp2aqU8=;
 b=z2E5Ms+/oKNS+UhyqlKEo1wu+Zufey1ZhzS1dcyY41Hmf6e2jSGVGJlxfDow5rH4AyXJVG
 pWCgbce+KoHGnmAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A0A513A9A;
 Fri,  7 Oct 2022 08:06:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +kozCQPeP2PebAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Oct 2022 08:06:27 +0000
Message-ID: <cd7f1488-2e9b-11fb-a33f-bef861d31a2a@suse.de>
Date: Fri, 7 Oct 2022 10:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 2/2] drm/atomic-helper: Replace
 drm_atomic_helper_check_crtc_state()
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-3-tzimmermann@suse.de>
 <7bea011f-f1d0-4375-ee1c-f97e12cd3f0a@redhat.com>
 <Yz/QICUIu25XjZGX@intel.com>
 <890f79b7-4c6b-0f99-f9c7-ba16bb9367a9@redhat.com>
 <Yz/VZqQN33gvk1Ab@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yz/VZqQN33gvk1Ab@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XKL2rFLNsTc96lErW0EfNqjI"
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
Cc: jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XKL2rFLNsTc96lErW0EfNqjI
Content-Type: multipart/mixed; boundary="------------ybMTC0YdJ0awDlfDDQOXBIjl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <cd7f1488-2e9b-11fb-a33f-bef861d31a2a@suse.de>
Subject: Re: [PATCH v4 2/2] drm/atomic-helper: Replace
 drm_atomic_helper_check_crtc_state()
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-3-tzimmermann@suse.de>
 <7bea011f-f1d0-4375-ee1c-f97e12cd3f0a@redhat.com>
 <Yz/QICUIu25XjZGX@intel.com>
 <890f79b7-4c6b-0f99-f9c7-ba16bb9367a9@redhat.com>
 <Yz/VZqQN33gvk1Ab@intel.com>
In-Reply-To: <Yz/VZqQN33gvk1Ab@intel.com>

--------------ybMTC0YdJ0awDlfDDQOXBIjl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTAuMjIgdW0gMDk6Mjkgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IE9uIEZyaSwgT2N0IDA3LCAyMDIyIGF0IDA5OjE3OjUwQU0gKzAyMDAsIEphdmllciBNYXJ0
aW5leiBDYW5pbGxhcyB3cm90ZToNCj4+IE9uIDEwLzcvMjIgMDk6MDcsIFZpbGxlIFN5cmrD
pGzDpCB3cm90ZToNCj4+PiBPbiBUaHUsIE9jdCAwNiwgMjAyMiBhdCAxMDoyODoxMlBNICsw
MjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgd3JvdGU6DQo+Pj4+IE9uIDEwLzUvMjIg
MTM6NDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+Pj4gUmVuYW1lIHRoZSBhdG9t
aWMgaGVscGVyIGZ1bmN0aW9uIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX2NydGNfc3RhdGUo
KQ0KPj4+Pj4gdG8gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfY3J0Y19wcmltYXJ5X3BsYW5l
KCkgYW5kIG9ubHkgY2hlY2sgZm9yIGFuDQo+Pj4+PiBhdHRhY2hlZCBwcmltYXJ5IHBsYW5l
LiBBZGFwdCBjYWxsZXJzLg0KPj4+Pj4NCj4+Pj4+IEluc3RlYWQgb2YgaGF2aW5nIG9uZSBi
aWcgZnVuY3Rpb24gdG8gY2hlY2sgZm9yIHZhcmlvdXMgQ1JUQyBzdGF0ZQ0KPj4+Pj4gY29u
ZGl0aW9ucywgd2UgcmF0aGVyIHdhbnQgc21hbGxlciBmdW5jdGlvbnMgdGhhdCBkcml2ZXJz
IGNhbiBwaWNrDQo+Pj4+PiBpbmRpdmlkdWFsbHkuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pj4+PiAt
LS0NCj4+Pj4NCj4+Pj4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8
amF2aWVybUByZWRoYXQuY29tPg0KPj4+Pg0KPj4+PiBbLi4uXQ0KPj4+Pg0KPj4+Pj4gKwlk
cm1fZm9yX2VhY2hfcGxhbmVfbWFzayhwbGFuZSwgZGV2LCBjcnRjX3N0YXRlLT5wbGFuZV9t
YXNrKSB7DQo+Pj4+PiArCQlpZiAocGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVfUFJJ
TUFSWSkNCj4+Pj4+ICsJCQlyZXR1cm4gMDsNCj4+Pj4+ICAgCX0NCj4+Pj4NCj4+Pj4gSSBi
ZWxpZXZlIHRoZSBjb2RlIGNvbnZlbnRpb24gaXMgdG8gZHJvcCB0aGUgY3VybHkgYnJhY2Vz
IHdoZW4geW91DQo+Pj4+IGhhdmUgYSBzaW5nbGUgc3RhdGVtZW50IGluc2lkZSB0aGUgYSBs
b29wID8NCj4+Pg0KPj4+IFRoaXMgaGFzIHR3by4NCj4+Pg0KPj4NCj4+IE5vLCBpdCBoYXMg
b25seSBvbmUgdGhhdCBpcyB0aGUgaWYgc3RhdGVtZW50LiBTbyBhY2NvcmRpbmcgdG8gdGhl
IExpbnV4DQo+PiBrZXJuZWwgY29kaW5nIHN0eWxlIEFGQUlVIGl0IHNob3VsZCBiZSB3cml0
dGVuIGFzOg0KPj4NCj4+IAlkcm1fZm9yX2VhY2hfcGxhbmVfbWFzayhwbGFuZSwgZGV2LCBj
cnRjX3N0YXRlLT5wbGFuZV9tYXNrKQ0KPj4gCQlpZiAocGxhbmUtPnR5cGUgPT0gRFJNX1BM
QU5FX1RZUEVfUFJJTUFSWSkNCj4+IAkJCXJldHVybiAwOw0KPiANCj4gVGhhdCBpcyBleGFj
dGx5IHdoYXQgaXQgc2F5cyBub3QgdG8gZG8uDQoNCkhleSwgbm8gbmVlZCB0byBiZSBzbyB1
cGZyb250IGFib3V0IGl0LiBXaXRob3V0IHRoZSBvdXRlciBicmFjZXMsIEknZCANCmZpbmQg
aXQgaGFyZCB0byBwYXJzZSBhbnl3YXkuDQoNCkJlc3QgcmVnYXJkDQpUaG9tYXMNCg0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------ybMTC0YdJ0awDlfDDQOXBIjl--

--------------XKL2rFLNsTc96lErW0EfNqjI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM/3gIFAwAAAAAACgkQlh/E3EQov+C/
Og//fuXj8bx4eWblW2vby0+94W7TJTi0ZdNX10x1+AaSiIszWkAe0ShIgNPECgEeSxK5w/5xHalD
ucTfHTzKnU/wtVeyaTAEiZQqNKRn3I6h8YrJ14P1ViQ78nHxWAhAUqCYPx62WJsY9ScRFoJbu+mU
hnxfvbniorAZE/fVLqxnG7qyaUXoNgPLaefttY7xCXIWW34Z6mkjaXn0/kojQoRf1j1w3mgcUP7M
k84Q0nhyH5N+kGutAvH6t0REnVk4GdccnvfHWSr2j4NMyqpqLCZg/3BpSJPzZmTLntS3hp85NJ6h
hdYmvPcQmA9ia4V8XwRM8duK24tOmukcVgMb8ZEtm8m1bs8m4Xdjz1tFP8iC/PGpwWKIy5FAN5ft
HYfc7iP2PydQFQ3VC9ybvFuW6m15iorlp7E5/HqpfQ9NhlYlcPlk5d0I91E/TWzA+mQ4PYtpzGsJ
ZAiu5VhrKc8p1V1NTFefhzxf+KJ5z33s4GwWVLkjyn3bZUQZRj3lNx1SV7iWyC74Luv/w6bmzPPi
suHeH13olBZ2BqNk0oNrykY528SeeEThNSfvVYz2LjEJEFVLQv+kTbl/GjaO5P8Hd+fDxX/dAGTc
kzGwfePFXDRtZ3fi7WuPG7jv/8V/LON/qEvXyW0Oe9rHEeX5Kv+GWKmX/OepxcrqU3Adq74l7WhW
q1s=
=deAb
-----END PGP SIGNATURE-----

--------------XKL2rFLNsTc96lErW0EfNqjI--
