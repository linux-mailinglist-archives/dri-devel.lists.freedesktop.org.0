Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A58B706E05
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAF910E451;
	Wed, 17 May 2023 16:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A019C10E44D;
 Wed, 17 May 2023 16:21:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5927E1F854;
 Wed, 17 May 2023 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684340510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j/C+3/F0e+WLGrs2bEAIvYHMMsOeb6poQ7vW8exXr4A=;
 b=BWJYlLjnXK46wIgN8HoXvp2t+VIjv/3KjJqjlC3BcklFEBESfdj2ZyLRd15ScGo2Uo8VSK
 CfDuvmkJjsSgE/BdL1oyyH8TKfnWuYAUDagV3RNG0hgpPxT73B1uC1Q5NxNhdzDXz5VQcn
 lPTcXnpqs5f911aRwL4ypTJaS1GeKjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684340510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j/C+3/F0e+WLGrs2bEAIvYHMMsOeb6poQ7vW8exXr4A=;
 b=1wxlK0nXgxus7fq25xkfTAk/43YB0zjkIfLmbUe8ze7TYLpF4eWNMhllP9l5cHBRcfJTd7
 dKnrC6m474ihzNDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2662613478;
 Wed, 17 May 2023 16:21:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pkr8Bx7/ZGSrIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 17 May 2023 16:21:50 +0000
Message-ID: <ccc963ec-5328-d418-bb20-88d2776a5b07@suse.de>
Date: Wed, 17 May 2023 18:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230517152244.348171-1-matthew.auld@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230517152244.348171-1-matthew.auld@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QhJbSdhquHjdpYawmjA9V081"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QhJbSdhquHjdpYawmjA9V081
Content-Type: multipart/mixed; boundary="------------Crr0JJeib1iB0KKa1V48Eaf0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <ccc963ec-5328-d418-bb20-88d2776a5b07@suse.de>
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
References: <20230517152244.348171-1-matthew.auld@intel.com>
In-Reply-To: <20230517152244.348171-1-matthew.auld@intel.com>

--------------Crr0JJeib1iB0KKa1V48Eaf0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDUuMjMgdW0gMTc6MjIgc2NocmllYiBNYXR0aGV3IEF1bGQ6DQo+IElu
IG11dGV4X2luaXQoKSBsb2NrZGVwIHNlZW1zIHRvIGlkZW50aWZ5IGEgbG9jayBieSBkZWZp
bmluZyBhIHN0YXRpYw0KPiBrZXkgZm9yIGVhY2ggbG9jayBjbGFzcy4gSG93ZXZlciBpZiB3
ZSB3cmFwIHRoZSB3aG9sZSB0aGluZyBpbiBhDQo+IGZ1bmN0aW9uIHRoZSBzdGF0aWMga2V5
IHdpbGwgYmUgdGhlIHNhbWUgZm9yIGV2ZXJ5dGhpbmcgY2FsbGluZyB0aGF0DQo+IGZ1bmN0
aW9uLCB3aGljaCBsb29rcyB0byBiZSB0aGUgY2FzZSBmb3IgZHJtbV9tdXRleF9pbml0KCku
IFRoaXMgdGhlbg0KPiByZXN1bHRzIGluIGltcG9zc2libGUgbG9ja2RlcCBzcGxhdHMgc2lu
Y2UgbG9ja2RlcCB0aGlua3MgY29tcGxldGVseQ0KPiB1bnJlbGF0ZWQgbG9ja3MgYXJlIHRo
ZSBzYW1lIGxvY2sgY2xhc3MuIFRoZSBvdGhlciBpc3N1ZSBpcyB0aGF0IHdoZW4NCj4gbG9v
a2luZyBhdCBzcGxhdHMgd2UgbG9zZSB0aGUgYWN0dWFsIGxvY2sgbmFtZSwgd2hlcmUgaW5z
dGVhZCBvZiBzZWVpbmcNCj4gc29tZXRoaW5nIGxpa2UgeGUtPm1lbV9hY2Nlc3MubG9jayBm
b3IgdGhlIG5hbWUsIHdlIGp1c3Qgc2VlIHNvbWV0aGluZw0KPiBnZW5lcmljIGxpa2UgbG9j
ayM4Lg0KPiANCj4gQXR0ZW1wdCB0byBmaXggdGhpcyBieSBjb252ZXJ0aW5nIGRybW1fbXV0
ZXhfaW5pdCgpIGludG8gYSBtYWNybywgd2hpY2gNCj4gc2hvdWxkIGVuc3VyZSB0aGF0IG11
dGV4X2luaXQoKSBiZWhhdmVzIGFzIGV4cGVjdGVkLg0KDQpJZiB0aGF0J3Mgd2hhdCBpcyBy
ZXF1aXJlZCwgdGhlbiBPSy4gQnV0IGV2ZW4gd2l0aCB5b3VyIGNvbW1pdCBtZXNhZ2UsIEkg
DQpmaW5kIGl0IGVudGlyZWx5IG5vbi1vYnZpb3VzIHdoYXQgdGhlIHByb2JsZW0gaXMuIElz
bid0IHRoZXJlIGEgd2F5IHRvIA0KYW5ub3RhdGUgZHJtbV9tdXRleF9pbml0KCkgc28gdGhh
dCBsb2NrZGVwIHRyZWF0cyBpdCBsaWtlIGEgcmVndWxhciANCm11dGV4X2luaXQoKT8NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmVwb3J0ZWQtYnk6IFRob21hcyBIZWxs
c3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gRml4ZXM6IGUx
M2YxM2UwMzlkYyAoImRybTogQWRkIERSTS1tYW5hZ2VkIG11dGV4X2luaXQoKSIpDQo+IENj
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IEpvY2Vs
eW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxk
QGludGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMg
fCAyNiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9t
YW5hZ2VkLmggICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0NCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tYW5hZ2VkLmMNCj4gaW5kZXggNGNmMjE0ZGU1MGM0Li43MWM0OTgxOWE3YTIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jDQo+IEBAIC0yNjMsMjkgKzI2MywzIEBA
IHZvaWQgZHJtbV9rZnJlZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhKQ0K
PiAgIAlmcmVlX2RyKGRyX21hdGNoKTsNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChkcm1t
X2tmcmVlKTsNCj4gLQ0KPiAtc3RhdGljIHZvaWQgZHJtbV9tdXRleF9yZWxlYXNlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnJlcykNCj4gLXsNCj4gLQlzdHJ1Y3QgbXV0ZXgg
KmxvY2sgPSByZXM7DQo+IC0NCj4gLQltdXRleF9kZXN0cm95KGxvY2spOw0KPiAtfQ0KPiAt
DQo+IC0vKioNCj4gLSAqIGRybW1fbXV0ZXhfaW5pdCAtICZkcm1fZGV2aWNlLW1hbmFnZWQg
bXV0ZXhfaW5pdCgpDQo+IC0gKiBAZGV2OiBEUk0gZGV2aWNlDQo+IC0gKiBAbG9jazogbG9j
ayB0byBiZSBpbml0aWFsaXplZA0KPiAtICoNCj4gLSAqIFJldHVybnM6DQo+IC0gKiAwIG9u
IHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJybm8gY29kZSBvdGhlcndpc2UuDQo+IC0gKg0K
PiAtICogVGhpcyBpcyBhICZkcm1fZGV2aWNlLW1hbmFnZWQgdmVyc2lvbiBvZiBtdXRleF9p
bml0KCkuIFRoZSBpbml0aWFsaXplZA0KPiAtICogbG9jayBpcyBhdXRvbWF0aWNhbGx5IGRl
c3Ryb3llZCBvbiB0aGUgZmluYWwgZHJtX2Rldl9wdXQoKS4NCj4gLSAqLw0KPiAtaW50IGRy
bW1fbXV0ZXhfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggKmxv
Y2spDQo+IC17DQo+IC0JbXV0ZXhfaW5pdChsb2NrKTsNCj4gLQ0KPiAtCXJldHVybiBkcm1t
X2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBkcm1tX211dGV4X3JlbGVhc2UsIGxvY2spOw0K
PiAtfQ0KPiAtRVhQT1JUX1NZTUJPTChkcm1tX211dGV4X2luaXQpOw0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX21hbmFnZWQuaCBiL2luY2x1ZGUvZHJtL2RybV9tYW5hZ2Vk
LmgNCj4gaW5kZXggMzU5ODgzOTQyNjEyLi4wMWY5NzdlOTE5MzMgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvZHJtL2RybV9tYW5hZ2VkLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX21h
bmFnZWQuaA0KPiBAQCAtMTA1LDYgKzEwNSwyNyBAQCBjaGFyICpkcm1tX2tzdHJkdXAoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgY29uc3QgY2hhciAqcywgZ2ZwX3QgZ2ZwKTsNCj4gICAN
Cj4gICB2b2lkIGRybW1fa2ZyZWUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSk7DQo+ICAgDQo+IC1pbnQgZHJtbV9tdXRleF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHN0cnVjdCBtdXRleCAqbG9jayk7DQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19kcm1t
X211dGV4X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqcmVzKQ0KPiAr
ew0KPiArCXN0cnVjdCBtdXRleCAqbG9jayA9IHJlczsNCj4gKw0KPiArCW11dGV4X2Rlc3Ry
b3kobG9jayk7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogZHJtbV9tdXRleF9pbml0IC0g
JmRybV9kZXZpY2UtbWFuYWdlZCBtdXRleF9pbml0KCkNCj4gKyAqIEBkZXY6IERSTSBkZXZp
Y2UNCj4gKyAqIEBsb2NrOiBsb2NrIHRvIGJlIGluaXRpYWxpemVkDQo+ICsgKg0KPiArICog
UmV0dXJuczoNCj4gKyAqIDAgb24gc3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBlcnJubyBjb2Rl
IG90aGVyd2lzZS4NCj4gKyAqDQo+ICsgKiBUaGlzIGlzIGEgJmRybV9kZXZpY2UtbWFuYWdl
ZCB2ZXJzaW9uIG9mIG11dGV4X2luaXQoKS4gVGhlIGluaXRpYWxpemVkDQo+ICsgKiBsb2Nr
IGlzIGF1dG9tYXRpY2FsbHkgZGVzdHJveWVkIG9uIHRoZSBmaW5hbCBkcm1fZGV2X3B1dCgp
Lg0KPiArICovDQo+ICsjZGVmaW5lIGRybW1fbXV0ZXhfaW5pdChkZXYsIGxvY2spICh7CQkJ
CQkgICAgIFwNCj4gKwltdXRleF9pbml0KGxvY2spOwkJCQkJCSAgICAgXA0KPiArCWRybW1f
YWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIF9fZHJtbV9tdXRleF9yZWxlYXNlLCBsb2NrKTsJ
ICAgICBcDQo+ICt9KQkJCQkJCQkJCSAgICAgXA0KPiAgIA0KPiAgICNlbmRpZg0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0
NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFu
ZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVy
ZykNCg==

--------------Crr0JJeib1iB0KKa1V48Eaf0--

--------------QhJbSdhquHjdpYawmjA9V081
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRk/x0FAwAAAAAACgkQlh/E3EQov+Ak
aBAArJBDtE13heBa+8ACjCbNw5yssEm+HeNIwywCN0WrFrbfBn9mBgSOVPESfUiDN//eZMZVTZxz
wfhQr+2N8UDKtVL6aw/6/MJvvBBEGaKrTenzKG6FiA19+Z4K9G2S8t4wLUW86NgFi5v+dR9TTmjl
UV3FUOySsQwUs2HsVwkF8wXhwO7GUvFCB/ckVAlJgZRzeOb4X9T0Q6BN8nHSJ6Da6LlMdMgZN92o
kljaqEAdUdIlpCkmVaoMNjAUgWMnprQXV+bYD6DVTDMBhOsKCrLjuUQwGV2aevT338/ER0ytB+U5
AlX8A1IwRZyVFOeFi9dtTXsG4YDBwL7UKVD9PvVdmaaHE095GccjqpHTZ9t2f7E1/ND+BNtOpYPf
obuFKzQBKExJLzv6wJ3d3HyJezEeqPfS5zFvO8XRnckz1eJmimFPPOPEXpMeIm9tU97eG0jSS30G
04OgCSUWb5Fhtot4mZzG/AtbddWyNvFmRTzpd3rNj1h5hi+EwpMd6KRVd1cjKns4GjqbV/v0QnZ+
d58Eax3gPXvj6ntoaXeYn3ylj7GY28f1Trz1w1y6XrxoMTHQ7lm9ZL16FULKkfcnUZiA0sic1pTN
DWOTLTKqXIyM0B5pZHvYF4Eg3dXqHRBjF0FD5UXwoW9ZKaJzE1zRSvVIPTyaEOd3445jrH6+ALFV
rMc=
=1NI0
-----END PGP SIGNATURE-----

--------------QhJbSdhquHjdpYawmjA9V081--
