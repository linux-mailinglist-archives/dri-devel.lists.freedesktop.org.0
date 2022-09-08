Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878585B1E0F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE5F10EAE0;
	Thu,  8 Sep 2022 13:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6195310EAE0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:09:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A5A01F6E6;
 Thu,  8 Sep 2022 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662642580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Glt01fhhBiInCemVJTFH1Q3SgFnPEnb7uXFFpbCqSgU=;
 b=Aax4HLErkhUIN1Jmh16YF6v+1Pg97tgukDraGwiQUd2kc9SVJztA7hoO5bNeamX6m7u8yc
 eYVAtxO6JMe+reYvnG+JX48pA4AwEt8T2jlNQpOHHwDMS4NWl9yPIzVcpHsAy5zR+RGze2
 rcqm8wnS9hbQHu3akwuuoAwVsSmrxOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662642580;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Glt01fhhBiInCemVJTFH1Q3SgFnPEnb7uXFFpbCqSgU=;
 b=CtEW8X0yIJllB2/rxH1vviiI5ODoTbnI2Dc3i86ds0IdN9B75y5x9q3qYJQLIvycGpeya3
 DkzpbQl8m1lZ57Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E63D61322C;
 Thu,  8 Sep 2022 13:09:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9ZBuN5PpGWO2NAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Sep 2022 13:09:39 +0000
Message-ID: <4bdcfc5a-f5e3-75ef-574d-517bc4ec5d5f@suse.de>
Date: Thu, 8 Sep 2022 15:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 03/12] drm/udl: Enable damage clipping
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220908095115.23396-1-tiwai@suse.de>
 <20220908095115.23396-4-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220908095115.23396-4-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jEaCdjfRZr3S35JtJeElhhai"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jEaCdjfRZr3S35JtJeElhhai
Content-Type: multipart/mixed; boundary="------------tGuDAxuVrSgYPBrbfE8SHJMU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <4bdcfc5a-f5e3-75ef-574d-517bc4ec5d5f@suse.de>
Subject: Re: [PATCH v3 03/12] drm/udl: Enable damage clipping
References: <20220908095115.23396-1-tiwai@suse.de>
 <20220908095115.23396-4-tiwai@suse.de>
In-Reply-To: <20220908095115.23396-4-tiwai@suse.de>

--------------tGuDAxuVrSgYPBrbfE8SHJMU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDkuMjIgdW0gMTE6NTEgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IEZy
b206IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gQ2Fs
bCBkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygpIGFuZCBnaXZlIHVzZXJzcGFj
ZSBhIGNoYW5jZQ0KPiBvZiBtaW5pbWl6aW5nIHRoZSB1cGRhdGVkIGRpc3BsYXkgYXJlYS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+
DQoNCkRhbmllbCBhbHJlYWR5IGdhdmUgYW4gUi1CIGhlcmU6DQoNCiAgIGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80OTU4MTIvP3Nlcmllcz0xMDY4MDAmcmV2
PTENCg0KSSB0aGluayB0aGUgd2hvbGUgc2VyaWVzIHNob3VsZCBoYXZlIGJlZW4gcmV2aWV3
ZWQgbm93LiBJZiBub3RoaW5nIGVsc2UgDQpjb21lcyBpbiwgd2UgY2FuIG1lcmdlIGl0IHRv
bW9ycm93IG9yIE1vbmRheS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgfCAxICsNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rl
c2V0LmMNCj4gaW5kZXggMzRjZTViNDNjNWRiLi5iMjM3N2I3MDY0ODIgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4gQEAgLTQ4MCw2ICs0ODAsNyBAQCBpbnQg
dWRsX21vZGVzZXRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIAkJCQkJICAg
Zm9ybWF0X2NvdW50LCBOVUxMLCBjb25uZWN0b3IpOw0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJ
cmV0dXJuIHJldDsNCj4gKwlkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygmdWRs
LT5kaXNwbGF5X3BpcGUucGxhbmUpOw0KPiAgIA0KPiAgIAlkcm1fbW9kZV9jb25maWdfcmVz
ZXQoZGV2KTsNCj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------tGuDAxuVrSgYPBrbfE8SHJMU--

--------------jEaCdjfRZr3S35JtJeElhhai
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMZ6ZMFAwAAAAAACgkQlh/E3EQov+BZ
OxAAg9wHwrkTk9hJDRM5QugCl6j7jdvbfsujglwfy/cN4Bdpa13bxCF0quqJPLYVieT2mEEmQEmZ
NBHMz/6BbYorFPJLtyj7FKnueroOVGFrGXN4KStf73ZeS9AqQSP/28m/bHXn3M0dMaK5rfmTk0hf
2c1JEeDQWg+RAE+GDsR1Sj5TZFBTR8jqMHPKNQTlnxPH2L12tS+1av9xc/7BkH57RLhL0VMNbXzG
ko7532ABCLM0of5ffn1Krljfw/2NHxUewZr8XY+vyCbdcf//qumfebRook0nLcWpHiXiQ+HqQkE9
yTY2mj8GAyfNNdPutW2QSrM/xs+f4E7z0HYmyPzvN0PQt3T/ds893TwjbyvOWFJBJJo1w2mAA3N+
1mwjGBMr/GPLNtFt7r6xaFN2iB5uIUrkL0rp+pOdvB6oClUNOzsFutNGQd0T8sNc4GeJKUBiuqnt
SPatwgfw8yxkP8CojziVTbM9af57l5/FBn3hwTVyc+g/TMVGVBUFWYX5cDtFDxG/5Y/6URi4Dl9Q
oxlIA1f8Uhruflm+7SpSO9GCzLzjeCRZpUcSLTqvSpE9Cb9JgwZw+mQZPI7ps0ZjXcuu33sXGWtw
8V9SLwqiWT7Iwiku1/ruqIsr4fGbHLLpbod/OG+iEHyF76u6AiTSPAQ4P9tIQj9x/gy0LSOrN4xg
ECM=
=MUQr
-----END PGP SIGNATURE-----

--------------jEaCdjfRZr3S35JtJeElhhai--
