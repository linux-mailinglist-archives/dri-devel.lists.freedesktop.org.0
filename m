Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C95EA1BA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 12:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458BF10E2F3;
	Mon, 26 Sep 2022 10:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9FF10E2CE;
 Mon, 26 Sep 2022 10:55:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 220FF21EB6;
 Mon, 26 Sep 2022 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664189725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=awuoa00c/zFKYrk4TkkPEqL+aFMAJslAQCViiDFZeBw=;
 b=QA6dcXG+cDXz2zQxEUuwn9DPBFbTykhOd3xpEnu5fs8i6ST34mv2QGmnj3oaO/eKaCgibO
 HPgPqyabcyRfu2W8HcBYBQMBeoHe44+if91y4GeWmnM2bEnevL7R7q0H86ZVEyvnbsWEoe
 uDnPlQMrSUimLyXIKSd/9pQ06epaQj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664189725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=awuoa00c/zFKYrk4TkkPEqL+aFMAJslAQCViiDFZeBw=;
 b=l18A59Kc2oBBrw11GwZxl8oSDL+zn6/HgdixSomlVX7g9VsRFi9LUSOzdXq9IitDlOlljv
 X+HURmTI9pMFviBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC46813486;
 Mon, 26 Sep 2022 10:55:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OWsVKRyFMWMMIwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Sep 2022 10:55:24 +0000
Message-ID: <6d073586-0962-48b8-1ccf-ba9d8652be26@suse.de>
Date: Mon, 26 Sep 2022 12:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de> <87h70y4ffb.fsf@intel.com>
 <f17b239c-715a-7c9c-fb56-477daed28009@suse.de>
 <20220926101849.uiyc7zhgkgz4wy46@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220926101849.uiyc7zhgkgz4wy46@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Eh5fPpvnuSpDpm0VAZYIAG4S"
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Eh5fPpvnuSpDpm0VAZYIAG4S
Content-Type: multipart/mixed; boundary="------------nLRW0fdZeS13F20fT0F7VzGt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6d073586-0962-48b8-1ccf-ba9d8652be26@suse.de>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de> <87h70y4ffb.fsf@intel.com>
 <f17b239c-715a-7c9c-fb56-477daed28009@suse.de>
 <20220926101849.uiyc7zhgkgz4wy46@houat>
In-Reply-To: <20220926101849.uiyc7zhgkgz4wy46@houat>

--------------nLRW0fdZeS13F20fT0F7VzGt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDkuMjIgdW0gMTI6MTggc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBGcmksIFNlcCAyMywgMjAyMiBhdCAxMjoxNjoxM1BNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjMuMDkuMjIgdW0gMTE6MTggc2Nocmll
YiBKYW5pIE5pa3VsYToNCj4+PiBPbiBGcmksIDIzIFNlcCAyMDIyLCBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pj4+IEFtIDIyLjA5LjIyIHVt
IDE2OjI1IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4+Pj4+ICsJZHJtX2RiZ19rbXMoZGV2
LA0KPj4+Pj4gKwkJICAgICJHZW5lcmF0aW5nIGEgJXV4JXUlYywgJXUtbGluZSBtb2RlIHdp
dGggYSAlbHUga0h6IGNsb2NrXG4iLA0KPj4+Pj4gKwkJICAgIGhhY3RpdmUsIHZhY3RpdmUs
DQo+Pj4+PiArCQkgICAgaW50ZXJsYWNlID8gJ2knIDogJ3AnLA0KPj4+Pj4gKwkJICAgIHBh
cmFtcy0+bnVtX2xpbmVzLA0KPj4+Pj4gKwkJICAgIHBpeGVsX2Nsb2NrX2h6IC8gMTAwMCk7
DQo+Pj4+DQo+Pj4+IERpdmlkZSBieSBIWl9QRVJfS0haIGhlcmUgYW5kIGluIG90aGVyIHBs
YWNlcy4NCj4+Pj4NCj4+Pj4gICAgICBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2luY2x1ZGUvbGludXgvdW5pdHMuaCNMMjMNCj4+Pg0KPj4+ICAg
RnJvbSB0aGUgRGVwYXJ0bWVudCBvZiBCaWtlc2hlZGRpbmc6DQo+Pj4NCj4+PiBJIGZpbmQg
InBpeGVsX2Nsb2NrX2h6IC8gMTAwMCIgaGFzIG11Y2ggbW9yZSBjbGFyaXR5IHRoYW4NCj4+
PiAicGl4ZWxfY2xvY2tfaHogLyBIWl9QRVJfS0haIi4NCj4+DQo+PiBUaGlzIG9uZSdzIGVh
c3kgdG8gc2VlIGJlY2F1c2UgaXQgdGVsbHMgeW91IHdpdGggdGhlIF9oeiBwb3N0Zml4LiBN
YW55DQo+PiBwbGFjZXMgZG9uJ3QgYW5kIHRoZW4gaXQgcXVpY2tseSBnZXRzIGNvbmZ1c2lu
ZyB3aGF0IHVuaXRzIHRoZSBjb2RlJ3MNCj4+IGNvbnZlcnRpbmcuDQo+IA0KPiBTbyBpZiBJ
IGFkZCBpdCB0byBwbGFjZXMgdGhhdCBkb24ndCBoYXZlIGl0IGV4cGxpY2l0bHkgKGllLCB0
ZXN0cykgd291bGQNCj4gdGhhdCBiZSBhY2NlcHRhYmxlIHRvIGJvdGggb2YgeW91Pw0KDQpJ
J20gT0sgd2l0aCBlaXRoZXIuIE9yIGp1c3QgbGVhdmUgaXQgYXMtaXMuDQoNCkEgSFpfVE9f
S0haIG1hY3JvIHdvdWxkIGJlIG5pY2UsIGJ1dCB0aGF0J3MgYmV5b25kIHRoaXMgcGF0Y2hz
ZXQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IE1heGltZQ0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------nLRW0fdZeS13F20fT0F7VzGt--

--------------Eh5fPpvnuSpDpm0VAZYIAG4S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMxhRwFAwAAAAAACgkQlh/E3EQov+CC
LhAAueruhpwqOuABLNSgIxssP4CHA5YeIPHJtcgQsVCJ/YkZMWYogfGLQ5LvjmRKP7zOmj0eh097
Jl+Mhu65w5/8Kvc2xPuGJK7QnemQ4pIBwgR8T7EP4lo7Qc2juh4jew9eUqZx55RyUHixvouyhgqn
BzgGTsyoYwd1+9qRBhIDWDCtxENHGwO0JGWPFgF7Uwlqgwt+T7BWO8givua8hE6kOuQujT96ovBg
dOZ1AsqeGASwTjr1g9TB5WOnVeLpg+mqf+ZZRwWKGqQy9zVb3Wn8bmrBW53vPKwCkKpDLJ1FBRKc
O2ug8SeIsHBrZ16iz6bexm2E+MlkVeLrtd72ZqcI2/DhzgUV1ibVq0cFEn/kk2gYS6oINTQHHMN1
rA6wmftGfJ7iBDoRZmO++gTtrWzIzXbjB8vn7kZBdL9899qMWlCyCFVa1KL7nLqyruYf+KfqlKLU
wHoLu9JI/8pfAlk21Pa46ICmwGHKxq0THKuX7cJPzPFwGd14NnLWe2gvpUf52fk3Rclbh6KQO+FI
9Tb7FqXeRRLhkN1qJWHlFNZQH3dFW0Oi6K+iH7XMypQfqGvwoYaaBAtyDXVwC3ZbyluU/CcZdvhR
T9ONl6Lvq0qYg5hOT1DKKf//OoahDG12LqTY+2lmZ4J2zIFAlL92nE7PwWGwfXEB8lkluttN1f6r
oHs=
=u9by
-----END PGP SIGNATURE-----

--------------Eh5fPpvnuSpDpm0VAZYIAG4S--
