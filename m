Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C4729839
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 13:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88F210E10E;
	Fri,  9 Jun 2023 11:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013CC10E10E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 11:31:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7534E1FDF2;
 Fri,  9 Jun 2023 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686310300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ozH8d/xGlOAz+n1aKEMUEL0nmSUelafZ6CBmYJY7HCo=;
 b=S+O0HuerEky4D6s/49pt8/xyS0K1fz6OmW2k93vO0n7MzO0Q1aM2bnDFJwcKPiHPyOy3AN
 DO1Olc081lpbyFDjAR3OtDt5z0XC3ntFKlN21NUT36n75nnTS3oa1o3ELwm/XAMJDfIHR2
 QKM6tcPPaJbY+SikacISr1F5XK8o5iI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686310300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ozH8d/xGlOAz+n1aKEMUEL0nmSUelafZ6CBmYJY7HCo=;
 b=NC1k+FeTM/i1JRrTUWJny/moBNuoUUr1nIK01knTkWiqCn+NbyQ3+DzZKNb1HeFkhWHcJK
 KFlsrdFNLuxZU6AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D96D139C8;
 Fri,  9 Jun 2023 11:31:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 12TMEZwNg2ReKgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Jun 2023 11:31:40 +0000
Message-ID: <e5524875-1ea3-25b5-95d9-b66910e06d42@suse.de>
Date: Fri, 9 Jun 2023 13:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230302143502.500661-1-contact@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230302143502.500661-1-contact@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U0loRo9ZPWIB7hpyuTnwSjpt"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U0loRo9ZPWIB7hpyuTnwSjpt
Content-Type: multipart/mixed; boundary="------------jxXIXD913R2tvy3tRaURlCUm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Tian Tao
 <tiantao6@hisilicon.com>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <e5524875-1ea3-25b5-95d9-b66910e06d42@suse.de>
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
References: <20230302143502.500661-1-contact@emersion.fr>
In-Reply-To: <20230302143502.500661-1-contact@emersion.fr>

--------------jxXIXD913R2tvy3tRaURlCUm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2ltb24NCg0KQW0gMDIuMDMuMjMgdW0gMTU6MzUgc2NocmllYiBTaW1vbiBTZXI6DQo+
IGRybV9nZW1fbWFwX2RtYV9idWYoKSByZXF1aXJlcyBkcm1fZ2VtX29iamVjdF9mdW5jcy5n
ZXRfc2dfdGFibGUNCj4gdG8gYmUgaW1wbGVtZW50ZWQsIG9yIGVsc2UgV0FSTnMuDQo+IA0K
PiBBbGxvdyBkcml2ZXJzIHRvIGxlYXZlIHRoaXMgaG9vayB1bmltcGxlbWVudGVkIHRvIGlt
cGxlbWVudCBwdXJlbHkNCj4gbG9jYWwgRE1BLUJVRnMgKGllLCBETUEtQlVGcyB3aGljaCBj
YW5ub3QgYmUgaW1wb3J0ZWQgYW55d2hlcmUNCj4gZWxzZSBidXQgdGhlIGRldmljZSB3aGlj
aCBhbGxvY2F0ZWQgdGhlbSkuIEluIHRoYXQgY2FzZSwgcmVqZWN0DQo+IGltcG9ydHMgdG8g
b3RoZXIgZGV2aWNlcyBpbiBkcm1fZ2VtX21hcF9hdHRhY2goKS4NCj4gDQo+IHYyOiBuZXcg
cGF0Y2gNCg0KSXMgdGhlcmUgYSB2MyBvZiB0aGlzIHBhdGNoc2V0PyAgSXQgd2FzIEFja2Vk
IHdpdGggdGhlIG9uZSBlcnJubyBjb2RlIA0KY2hhbmdlZC4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4N
Cj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzog
VGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+DQo+IENjOiBNYXhpbWUgUmlwYXJk
IDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDYgKysr
KystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYw0KPiBpbmRleCBmOTI0YjhiNGFiNmIuLmFiMWQy
MWQ2M2EwMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYw0KPiBAQCAtNTQ0LDcgKzU0NCw4
IEBAIGludCBkcm1fcHJpbWVfaGFuZGxlX3RvX2ZkX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgICogT3B0aW9uYWwgcGlubmluZyBvZiBidWZmZXJz
IGlzIGhhbmRsZWQgYXQgZG1hLWJ1ZiBhdHRhY2ggYW5kIGRldGFjaCB0aW1lIGluDQo+ICAg
ICogZHJtX2dlbV9tYXBfYXR0YWNoKCkgYW5kIGRybV9nZW1fbWFwX2RldGFjaCgpLiBCYWNr
aW5nIHN0b3JhZ2UgaXRzZWxmIGlzDQo+ICAgICogaGFuZGxlZCBieSBkcm1fZ2VtX21hcF9k
bWFfYnVmKCkgYW5kIGRybV9nZW1fdW5tYXBfZG1hX2J1ZigpLCB3aGljaCByZWxpZXMgb24N
Cj4gLSAqICZkcm1fZ2VtX29iamVjdF9mdW5jcy5nZXRfc2dfdGFibGUuDQo+ICsgKiAmZHJt
X2dlbV9vYmplY3RfZnVuY3MuZ2V0X3NnX3RhYmxlLiBJZiAmZHJtX2dlbV9vYmplY3RfZnVu
Y3MuZ2V0X3NnX3RhYmxlIGlzDQo+ICsgKiB1bmltcGxlbWVudGVkLCBleHBvcnRzIGludG8g
YW5vdGhlciBkZXZpY2UgYXJlIHJlamVjdGVkLg0KPiAgICAqDQo+ICAgICogRm9yIGtlcm5l
bC1pbnRlcm5hbCBhY2Nlc3MgdGhlcmUncyBkcm1fZ2VtX2RtYWJ1Zl92bWFwKCkgYW5kDQo+
ICAgICogZHJtX2dlbV9kbWFidWZfdnVubWFwKCkuIFVzZXJzcGFjZSBtbWFwIHN1cHBvcnQg
aXMgcHJvdmlkZWQgYnkNCj4gQEAgLTU4Myw2ICs1ODQsOSBAQCBpbnQgZHJtX2dlbV9tYXBf
YXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLA0KPiAgIHsNCj4gICAJc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmogPSBkbWFfYnVmLT5wcml2Ow0KPiAgIA0KPiArCWlmICghb2Jq
LT5mdW5jcy0+Z2V0X3NnX3RhYmxlKQ0KPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ICsN
Cj4gICAJcmV0dXJuIGRybV9nZW1fcGluKG9iaik7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1C
T0woZHJtX2dlbV9tYXBfYXR0YWNoKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------jxXIXD913R2tvy3tRaURlCUm--

--------------U0loRo9ZPWIB7hpyuTnwSjpt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSDDZsFAwAAAAAACgkQlh/E3EQov+Bt
WxAAwCQG+1GyuA9Lb49Km0tEBu50VMMbUhORGtLsJ75Z/co7gQh5/77dXM3H3hwxsXQ4k/lL37gU
pld46QI3UfHebVjMtl9ApavFv2WOttBMvop1wLtuYtoSAifZ01XUS5JuU2u+PwxYfyAZgzI3lF1O
PIXszJ7zSa+UbEqQ0j99uQV5MeTViL9jeERZpIx4ylZh5/HZ/8kILG7O+OM8/IY+dMytTOiYfuyr
TEnk5tcxWw7XO7HwqbqMN8DysNHRGFl37A2t6hqo5KNXhTZYMleUatl/ex0Fxi5PfInO/FNqMEdR
kItKUfVo2jQ29KxJQPpF2NZ8WhUJSdTZUgnq+29a6Zl2yamRi5HTgsCCfdpfFiGX6ewQHArCK57c
Azk5MyNqcCsqXozhnLId4FDOBXKtvXMcjcUUtUuM9cQRdh3VRlH1kp6bv3aMlJAUO7YnFWzETvqf
7Vx3QIzF1tTtL6r9tUdD7IHyhKnSsB1ZjgtypFvSF/teapGg3mpQwegW/yekcpGiqENJG0ZvKhxT
EurZ5lT+5UcXEwRhgtyhCb8yU/VlZ+usBfnQsyWN8LNCd7kFuBqQnkcX1vuv6eTpyqPQJ7s0BNIi
6mHV8qK0465Pg0gqhNKFjnWnwpvtQCr5Z15qy2R4X1yuuBN7xiqt67st8fg2aiXxGFCnt2AC8QLN
3kU=
=NFWM
-----END PGP SIGNATURE-----

--------------U0loRo9ZPWIB7hpyuTnwSjpt--
