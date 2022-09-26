Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F25EA63B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC6A10E694;
	Mon, 26 Sep 2022 12:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4F210E694;
 Mon, 26 Sep 2022 12:34:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20D151F38A;
 Mon, 26 Sep 2022 12:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664195677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pZfEVr0F+eDUbTKMwdgidKtFX7VuirmYGY1O7jfs79E=;
 b=ZJt6LzVTk7uUgNb/3+RfQS4n9gNmyE/Ndw3OtVGcUh3bb79rZhzJBODRYZZZq2QquYCc6L
 RGqHr/EYJ6i3xOcwjiqpcU2ER9d6O9MRZgcYPOxOy1WDZXKyxVglBUKF4Mb4Afa7xVLS+Y
 cqOAvXYCKS7IIiST8MsIPbwyJBZwvu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664195677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pZfEVr0F+eDUbTKMwdgidKtFX7VuirmYGY1O7jfs79E=;
 b=mJY48elw8wJdWrhw2pCkaIypPsM43sG83ftl2OiftxYeqqyzno2SX0o3lzuEzQ12eeEVcO
 NDbVNGZjP0yMZ3DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA48A13486;
 Mon, 26 Sep 2022 12:34:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E1ijKFycMWOWUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Sep 2022 12:34:36 +0000
Message-ID: <d50ed519-ba89-70e2-0f0c-b58593a3c060@suse.de>
Date: Mon, 26 Sep 2022 14:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 06/33] drm/connector: Rename legacy TV property
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-6-f733a0ed9f90@cerno.tech>
 <fa71ae1c-f9ca-167c-7993-b698ea3473a0@suse.de>
 <20220926095031.vlwsw7willi36yd4@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220926095031.vlwsw7willi36yd4@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mwjZHgn1Ll4ReHR00ksHLHNN"
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
--------------mwjZHgn1Ll4ReHR00ksHLHNN
Content-Type: multipart/mixed; boundary="------------4FsZ219AqM5Fd5bD304l2D0A";
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
Message-ID: <d50ed519-ba89-70e2-0f0c-b58593a3c060@suse.de>
Subject: Re: [PATCH v2 06/33] drm/connector: Rename legacy TV property
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-6-f733a0ed9f90@cerno.tech>
 <fa71ae1c-f9ca-167c-7993-b698ea3473a0@suse.de>
 <20220926095031.vlwsw7willi36yd4@houat>
In-Reply-To: <20220926095031.vlwsw7willi36yd4@houat>

--------------4FsZ219AqM5Fd5bD304l2D0A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDkuMjIgdW0gMTE6NTAgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIFNlcCAyMywgMjAyMiBhdCAxMDoxOTowOEFNICsw
MjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjIuMDku
MjIgdW0gMTY6MjUgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPj4+IFRoZSBjdXJyZW50IHR2
X21vZGUgaGFzIGRyaXZlci1zcGVjaWZpYyB2YWx1ZXMgdGhhdCBkb24ndCBhbGxvdyB0bw0K
Pj4+IGVhc2lseSBzaGFyZSBjb2RlIHVzaW5nIGl0LCBlaXRoZXIgYXQgdGhlIHVzZXJzcGFj
ZSBvciBrZXJuZWwgbGV2ZWwuDQo+Pj4NCj4+PiBTaW5jZSB3ZSdyZSBnb2luZyB0byBpbnRy
b2R1Y2UgYSBuZXcsIGdlbmVyaWMsIHByb3BlcnR5IHRoYXQgZml0IHRoZQ0KPj4+IHNhbWUg
cHVycG9zZSwgbGV0J3MgcmVuYW1lIHRoaXMgb25lIHRvIGxlZ2FjeV90dl9tb2RlIHRvIG1h
a2UgaXQNCj4+PiBvYnZpb3VzIHdlIHNob3VsZCBtb3ZlIGF3YXkgZnJvbSBpdC4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0K
Pj4NCj4+IEl0J3Mgbm90IHdyb25nLCBidXQgJ2xlZ2FjeScgaXMgYWxyZWFkeSBvdmVybG9h
ZGVkIHdpdGggbWVhbmluZy4gSWYgeW91IGNhbiwNCj4+IG1heWJlIG5hbWUgaXQgJ2RyaXZl
cl90dl9tb2RlX3Byb3BlcnR5JyBvciAnY3VzdG9tX3R2X21vZGVfcHJvcGVydHknDQo+PiBp
bnN0ZWFkLg0KPj4NCj4+IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4gDQo+IEknZCByZWFsbHkgbGlrZSB0byBwb2ludCBvdXQgdGhhdCBu
ZXcgZHJpdmVycyBzaG91bGRuJ3QgYmUgdXNpbmcgdGhpcy4NCj4gSWYgd2UncmUgdXNpbmcg
ZWl0aGVyIG9mIHlvdXIgcHJvcG9zYWxzIHRoZW4gd3JpdGVycyBtaWdodCBnZXQgdGhlDQo+
IGltcHJlc3Npb24gdGhhdCB0aGlzIGlzIG9rIHRvIHVzLg0KPiANCj4gV291bGQgeW91IHBy
ZWZlciBkZXByZWNhdGVkIHRvIGxlZ2FjeT8NCg0KSSdtIG1lcmVseSBzdWdnZXN0aW5nLiBD
YWxsIGl0IGxlZ2FjeSB0aGVuLCBzbyB5b3UgZG9uJ3QgaGF2ZSB0byByZXdvcmsgDQphbGwg
b2YgdGhlIHBhdGNoZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IE1heGlt
ZQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------4FsZ219AqM5Fd5bD304l2D0A--

--------------mwjZHgn1Ll4ReHR00ksHLHNN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMxnFwFAwAAAAAACgkQlh/E3EQov+D5
zxAApQncNTLl8QQvDR6j0KdUkawbSYKn0KSQRRJLEGBKoyje7U6mn4lVguZtodiDY7fz6EhuTR2S
XPEbpcZaFmf1Y8hKEV8/zGry8ocN8Jy8cgF2frUr58KgkmDj0UUaD3m77Ee8NIs+r5oHtxSGbMI6
8UoBjUIg+Q2gDNiBADBKQgo4D7pNXHLCT7KzKPs2tANKpUKegg4y6yUhBJ53G9LITKhHnkzlHiF8
GjYfshimY0ockScV2lY3nFyPLLV3nrwGjgUM+B6owo76gHffD/qpMxZ+r3+Pd40hZAFwjlSypXe5
XNtmKlDHbfXxlnR1td+sX3pqXAV42B8KHy3alsOji/DR2UGkXQrwWH/uXlr/K1iO+weuaK6ouX/5
jXOnf1LCurNu/vLyt8fyWZqHmTcUwEGxXT6kQ7sNMoEMJk7v5rsjpa8Fvvyw9KHioil5bbj/wR4J
MtiXhb/DRWMvUg0X95fYwgp55C++EGarVtwa7cPsFLYZLAdt2J8BmxFa8o3i1tvtpuVo44mMZ6EG
7NiR1AQO7HA45dYWqlA/Z7PunFdaR0RfKrOyJFNTyG5EpZFCWWJDKMqBLP0mPWvfWr813jABNf+H
RG4HrDn4MN3a9t5TZWt70qWeq7gGoIrJ0rKrPOf8hF00DPnWqN2UDGerPXOvHdSWqpbhULvcspRc
amE=
=qscO
-----END PGP SIGNATURE-----

--------------mwjZHgn1Ll4ReHR00ksHLHNN--
