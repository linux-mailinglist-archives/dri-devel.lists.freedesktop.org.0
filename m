Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7135E7563
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACE010E4C9;
	Fri, 23 Sep 2022 08:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D49010E4C9;
 Fri, 23 Sep 2022 08:06:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8075219EA;
 Fri, 23 Sep 2022 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663920368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W32O2yVRih3gwoLv5jL3J0R/1OnRljKFS2FDN0VocOE=;
 b=Pl+SdTc+QcZJWIEU7QfsDd9fWk+tzpEKp98gH4KLelmFYEfxGSkZDcpoW93NPCiQEEZlRA
 1/U+svWsV7gEff7FfI+aU0ZK3lquksmd+Ub4khv76ZN+gNsorAqcgk9Fm61CGQm67HM4gW
 7yVWAAJIOCnqk4Gn3Ot22Qei23yZeEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663920368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W32O2yVRih3gwoLv5jL3J0R/1OnRljKFS2FDN0VocOE=;
 b=NEpLtuMet7hLasS4xxYkCmyMQfFFoYvb6ECDUGdet0SLgusoImC7tJ/mUOcja0Sxt59rAE
 jJ3Ap0C7aW+8EYDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56F2E13AA5;
 Fri, 23 Sep 2022 08:06:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MOJIFPBoLWNLfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 08:06:08 +0000
Message-ID: <73cd87f9-655a-5510-f3f7-e552dcefdf0d@suse.de>
Date: Fri, 23 Sep 2022 10:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 01/33] drm/tests: Order Kunit tests in Makefile
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-1-f733a0ed9f90@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-1-f733a0ed9f90@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------009tUO10dHwudn8iU0mykD8M"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------009tUO10dHwudn8iU0mykD8M
Content-Type: multipart/mixed; boundary="------------c3qicYVAnU4Lh99nFLW5qyTI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <73cd87f9-655a-5510-f3f7-e552dcefdf0d@suse.de>
Subject: Re: [PATCH v2 01/33] drm/tests: Order Kunit tests in Makefile
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-1-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-1-f733a0ed9f90@cerno.tech>

--------------c3qicYVAnU4Lh99nFLW5qyTI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjA5LjIyIHVtIDE2OjI1IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gU2lu
Y2Ugd2UndmUgcmVjZW50bHkgYWRkZWQgYSB0b24gb2YgdGVzdHMsIHRoZSBsaXN0IHN0YXJ0
cyB0byBiZSBhIGJpdA0KPiBvZiBhIG1lc3MgYW5kIGNyZWF0ZXMgdW5uZWVkZWQgY29uZmxp
Y3RzLg0KPiANCj4gTGV0J3Mgb3JkZXIgaXQgYWxwaGFiZXRpY2FsbHkuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCg0KQWNrZWQt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL01ha2VmaWxlIGIvZHJpdmVycy9n
cHUvZHJtL3Rlc3RzL01ha2VmaWxlDQo+IGluZGV4IDkxYjcwZjdkMjc2OS4uMmQ5ZjQ5YjYy
ZWNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvTWFrZWZpbGUNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL01ha2VmaWxlDQo+IEBAIC0xLDUgKzEsMTMg
QEANCj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICAgDQo+IC1v
YmotJChDT05GSUdfRFJNX0tVTklUX1RFU1QpICs9IGRybV9mb3JtYXRfaGVscGVyX3Rlc3Qu
byBkcm1fZGFtYWdlX2hlbHBlcl90ZXN0Lm8gXA0KPiAtCWRybV9jbWRsaW5lX3BhcnNlcl90
ZXN0Lm8gZHJtX3JlY3RfdGVzdC5vIGRybV9mb3JtYXRfdGVzdC5vIGRybV9wbGFuZV9oZWxw
ZXJfdGVzdC5vIFwNCj4gLQlkcm1fZHBfbXN0X2hlbHBlcl90ZXN0Lm8gZHJtX2ZyYW1lYnVm
ZmVyX3Rlc3QubyBkcm1fYnVkZHlfdGVzdC5vIGRybV9tbV90ZXN0Lm8NCj4gK29iai0kKENP
TkZJR19EUk1fS1VOSVRfVEVTVCkgKz0gXA0KPiArCWRybV9idWRkeV90ZXN0Lm8gXA0KPiAr
CWRybV9jbWRsaW5lX3BhcnNlcl90ZXN0Lm8gXA0KPiArCWRybV9kYW1hZ2VfaGVscGVyX3Rl
c3QubyBcDQo+ICsJZHJtX2RwX21zdF9oZWxwZXJfdGVzdC5vIFwNCj4gKwlkcm1fZm9ybWF0
X2hlbHBlcl90ZXN0Lm8gXA0KPiArCWRybV9mb3JtYXRfdGVzdC5vIFwNCj4gKwlkcm1fZnJh
bWVidWZmZXJfdGVzdC5vIFwNCj4gKwlkcm1fbW1fdGVzdC5vIFwNCj4gKwlkcm1fcGxhbmVf
aGVscGVyX3Rlc3QubyBcDQo+ICsJZHJtX3JlY3RfdGVzdC5vDQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------c3qicYVAnU4Lh99nFLW5qyTI--

--------------009tUO10dHwudn8iU0mykD8M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtaO8FAwAAAAAACgkQlh/E3EQov+B0
hw/+LQ747nt5mB/33pcmDcLYpCscgMBYQNTV/Sz4gO0OeWb5p2GydGSx3oBbGoigBcPktrGYfbQ7
ZOIMPQNHdVeUy73nL5nCvyVjiLM1YkwrD8JtwgS8YxBzTkiv6noQz3RgQJECkMFJToW+sjEZOofR
cm9NVEiN6uvC3746K+O8/Tk4vQjqgWjUWmcjliRuao7r8SbLvPHDz3HaB3DajOw9kltJqiOw6QNq
mbxSz2+ovZbk1Pt51M/PZnMBLhI0T/K0Haz8A6voMM6xj1ROGWF4svTDiXJj7bWjZ+s3orvKmNl2
lkSDGXSQWD1tAzkkNGE+hiRD0chELIFyx53L8n49cIkGq3GvN/04cMDpRdNFTTYdgSqibjx+0Sd3
nBCcThQ4O0ONL4HQ/yIHdz9eZy6zLAuSU0XgtFwfSeLvayhTOnukJPKXsUpOJ7RrnUDhmZkCpgnz
P4U2lIzrnum0eNvk1LQuUIfcurPAeHj5uwhq8gGraWv2r0IOqlaAzM9TXiCfBnqgvzLORbx7o3w/
pEZp8kX9deCUF2H1EQ5XIJFqQNtwI/lyfXNL9q18zb0AvfR8uxOVselZE+3H6igyDYEOAty6XrTb
Fc/23cwmvW3diIDAL6z4+hAKVLKR8UOc+OjB1DUfBF1FbOFfjGAkp+F4R2aWq017QCQwphE31vX/
Xvw=
=fZ0n
-----END PGP SIGNATURE-----

--------------009tUO10dHwudn8iU0mykD8M--
