Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1C49E0BD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFC610E868;
	Thu, 27 Jan 2022 11:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C72310E868
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:25:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 196501F37C;
 Thu, 27 Jan 2022 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643282706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QiOO9D9MkhNbJYM/gqUyBETJ19BqepUsLOhh7GpQo7Y=;
 b=yVOChdEk7qXh1z64i8VWSWYwBQmx5UFlcZjXsSEVPb3kVZCvApPNUKUZgtVmBGzN4ilwPm
 hkPGYd0FVT6TRNm2hmMvH7feXo2ADlhKqmXUke5xMd20iBCRszX+Dw3l6bGNP9Dxv3fL46
 ZLnfJ3idgXjYwhyL7yo84NJDVkC4+R8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643282706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QiOO9D9MkhNbJYM/gqUyBETJ19BqepUsLOhh7GpQo7Y=;
 b=4OprGjZ0sg2k4jGasVs5IKP3Fweq7kRBnn/9q88dkjPPLSTqyHtEKa+/fOluxLf5w69dm6
 3t3hawNYGL4yPQBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D761313CFB;
 Thu, 27 Jan 2022 11:25:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rjKaMxGB8mHXXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 11:25:05 +0000
Message-ID: <ec124c3d-7989-b51b-178b-11399e7e0452@suse.de>
Date: Thu, 27 Jan 2022 12:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/vc4: hdmi: Simplify the connector state retrieval
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220127111404.221882-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220127111404.221882-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0weqLlFUyAO90XGAgH0cNKKJ"
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0weqLlFUyAO90XGAgH0cNKKJ
Content-Type: multipart/mixed; boundary="------------z0uSRnT3aFhArUXz0O90IgC1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Message-ID: <ec124c3d-7989-b51b-178b-11399e7e0452@suse.de>
Subject: Re: [PATCH] drm/vc4: hdmi: Simplify the connector state retrieval
References: <20220127111404.221882-1-maxime@cerno.tech>
In-Reply-To: <20220127111404.221882-1-maxime@cerno.tech>

--------------z0uSRnT3aFhArUXz0O90IgC1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjAxLjIyIHVtIDEyOjE0IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gV2hl
biB3ZSBoYXZlIHRoZSBlbnRpcmUgRFJNIHN0YXRlLCByZXRyaWV2aW5nIHRoZSBjb25uZWN0
b3Igc3RhdGUgb25seQ0KPiByZXF1aXJlcyB0aGUgZHJtX2Nvbm5lY3RvciBwb2ludGVyLiBG
b3J0dW5hdGVseSBmb3IgdXMsIHdlIGhhdmUNCj4gYWxsb2NhdGVkIGl0IGFzIGEgcGFydCBv
ZiB0aGUgdmM0X2hkbWkgc3RydWN0dXJlLCBzbyB3ZSBjYW4gcmV0cmlldmUgZ2V0DQo+IGEg
cG9pbnRlciBieSBzaW1wbHkgYWNjZXNzaW5nIG91ciBmaWVsZCBpbiB0aGF0IHN0cnVjdHVy
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50
ZWNoPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgMjEg
KysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jDQo+
IGluZGV4IDJjODMyNTI4MTllOS4uZWZmZmUyMWQyZTczIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zj
NC92YzRfaGRtaS5jDQo+IEBAIC0xMDAyLDMwICsxMDAyLDE1IEBAIHN0YXRpYyB2b2lkIHZj
NF9oZG1pX3JlY2VudGVyX2ZpZm8oc3RydWN0IHZjNF9oZG1pICp2YzRfaGRtaSkNCj4gICAJ
CSAgIlZDNF9IRE1JX0ZJRk9fQ1RMX1JFQ0VOVEVSX0RPTkUiKTsNCj4gICB9DQo+ICAgDQo+
IC1zdGF0aWMgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKg0KPiAtdmM0X2hkbWlfZW5j
b2Rlcl9nZXRfY29ubmVjdG9yX3N0YXRlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwN
Cj4gLQkJCQkgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gLXsNCj4g
LQlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZTsNCj4gLQlzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOw0KPiAtCXVuc2lnbmVkIGludCBpOw0KPiAtDQo+
IC0JZm9yX2VhY2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yLCBj
b25uX3N0YXRlLCBpKSB7DQo+IC0JCWlmIChjb25uX3N0YXRlLT5iZXN0X2VuY29kZXIgPT0g
ZW5jb2RlcikNCj4gLQkJCXJldHVybiBjb25uX3N0YXRlOw0KPiAtCX0NCj4gLQ0KPiAtCXJl
dHVybiBOVUxMOw0KPiAtfQ0KPiAtDQo+ICAgc3RhdGljIHZvaWQgdmM0X2hkbWlfZW5jb2Rl
cl9wcmVfY3J0Y19jb25maWd1cmUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLA0KPiAg
IAkJCQkJCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gICB7DQo+ICsJc3Ry
dWN0IHZjNF9oZG1pICp2YzRfaGRtaSA9IGVuY29kZXJfdG9fdmM0X2hkbWkoZW5jb2Rlcik7
DQo+ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9ICZ2YzRfaGRtaS0+Y29u
bmVjdG9yOw0KPiAgIAlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSA9
DQo+IC0JCXZjNF9oZG1pX2VuY29kZXJfZ2V0X2Nvbm5lY3Rvcl9zdGF0ZShlbmNvZGVyLCBz
dGF0ZSk7DQo+ICsJCWRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jfc3RhdGUoc3RhdGUs
IGNvbm5lY3Rvcik7DQo+ICAgCXN0cnVjdCB2YzRfaGRtaV9jb25uZWN0b3Jfc3RhdGUgKnZj
NF9jb25uX3N0YXRlID0NCj4gICAJCWNvbm5fc3RhdGVfdG9fdmM0X2hkbWlfY29ubl9zdGF0
ZShjb25uX3N0YXRlKTsNCj4gLQlzdHJ1Y3QgdmM0X2hkbWkgKnZjNF9oZG1pID0gZW5jb2Rl
cl90b192YzRfaGRtaShlbmNvZGVyKTsNCj4gICAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGUgPSAmdmM0X2hkbWktPnNhdmVkX2FkanVzdGVkX21vZGU7DQo+ICAgCXVuc2lnbmVk
IGxvbmcgcGl4ZWxfcmF0ZSA9IHZjNF9jb25uX3N0YXRlLT5waXhlbF9yYXRlOw0KPiAgIAl1
bnNpZ25lZCBsb25nIGJ2Yl9yYXRlLCBoc21fcmF0ZTsNCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------z0uSRnT3aFhArUXz0O90IgC1--

--------------0weqLlFUyAO90XGAgH0cNKKJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHygREFAwAAAAAACgkQlh/E3EQov+AV
ag//dpKJvdCEdlgqRscfoVgOeHeQbymBwI6FjofsTaIjQzwVuQk/nFyoWnZbcLZY0SALQEuCi0vn
O4+sdTjdT1oYYwOYmQZZyNTUigYda5R3dbxh0b/Zd2DvuAB+zvGwfBJX3bzWJVbYyF19hkxKEbv7
xtHLGOL4IP8ioZr95LvJ8hR/vYoUJm43e85NXyBJWDhzfCh647zIPhGYrFyWAOfTLIv7/vBkwE4i
lp+z4nMx6f0BMlRNIvFrUiMV0KdcJimvVp3DmkfPLKwLQ8OoYduR7l9nLd90+WQWXDU9NKwDr3wx
G6wn4VC2m/KXxOAbW7vj+bAkzovk+QZ8E9kqn29+3pCwAlER6NinwmrlFlkrbRTYBkdtmvu9YxUP
MgC0BiPZh2BFkuWOkCUG2CPV8L7N+mjRp+dqTNtrc3UnfHHIOoHbiHv40vG31WRGcB60NnRy0zSt
Q9UhsvlvxCNYOKRJ4TE7GY6Xk2jsEevmLTddiHcZJkki1NNAt1+o9++6/0fg9CMmIu+zO2e+PQNl
Tx0JfqBOGyQxrGmoP4GR/Hk1XcOKBQapsRXkOL9ewP6SIwebvBbDlbxmqEg7pi1/FnsiFit/9w4f
5tkPI+03hnTVPrsqaVY40RecLbIxVz0ApYgpxw8SBmA08BSW2IKQ83CPXD7T9Pl//3V0JuD4Kx3D
iZU=
=Mnid
-----END PGP SIGNATURE-----

--------------0weqLlFUyAO90XGAgH0cNKKJ--
