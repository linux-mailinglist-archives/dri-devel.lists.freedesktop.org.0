Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5971751F1F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE32910E671;
	Thu, 13 Jul 2023 10:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556B810E66F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:41:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0509822190;
 Thu, 13 Jul 2023 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689244877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yh+Q8HMic5XOStgIOf9m7TWn1BQ+Icr2RMJb9qOMSmc=;
 b=KExhCAG0179BddMF1YO4ClfOFQekt84WP9hicq7SdIZ/rObFztlukCDaXOLrYbtEZBZNjz
 1PGrwQzCjO3FPBygQyHVXy+AGV2VlLSn9UhS5oO56VfSNHfZBGwNo0XweKTFVb48nZyuif
 iJ2PyiRUCkh+1EvapMXDnZZseJDbrZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689244877;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yh+Q8HMic5XOStgIOf9m7TWn1BQ+Icr2RMJb9qOMSmc=;
 b=cTV5Odxy7LFcSDYbenlFzCmuPwGa59kS9NjFaJwFrz/Pp+8jD7/k3MDEg8fIZjYXY0hCrW
 aA9H0YbTyQ3InEAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D175133D6;
 Thu, 13 Jul 2023 10:41:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6I9iJczUr2QocgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 10:41:16 +0000
Message-ID: <a58b24d4-c02e-68cd-8e90-1674f6f5740b@suse.de>
Date: Thu, 13 Jul 2023 12:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <61999156-ab1b-d2ec-d7a4-7d957d5adab1@suse.de>
 <20230713102253.72pbt5t4dlvtexpj@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230713102253.72pbt5t4dlvtexpj@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NgbUp7lPRrU2raGl0HjCBZsG"
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 kernel@pengutronix.de, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NgbUp7lPRrU2raGl0HjCBZsG
Content-Type: multipart/mixed; boundary="------------4BjcmN94tJFPnbew80t3HmZ1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sean Paul <seanpaul@chromium.org>, Julia Lawall <julia.lawall@inria.fr>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a58b24d4-c02e-68cd-8e90-1674f6f5740b@suse.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <61999156-ab1b-d2ec-d7a4-7d957d5adab1@suse.de>
 <20230713102253.72pbt5t4dlvtexpj@pengutronix.de>
In-Reply-To: <20230713102253.72pbt5t4dlvtexpj@pengutronix.de>

--------------4BjcmN94tJFPnbew80t3HmZ1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVXdlDQoNCkFtIDEzLjA3LjIzIHVtIDEyOjIyIHNjaHJpZWIgVXdlIEtsZWluZS1Lw7Zu
aWc6DQpbLi4uXQ0KPiANCj4gSWYgdGhhdCBoZWxwcyB5b3U6IEkgcGxhbiB0byB0YWNrbGUg
dGhlc2UgaW4gYSBmb2xsb3d1cC4gSSBhZ3JlZSB0aGF0J3MNCj4gdWdseSwgYnV0IGZpeGlu
ZyB0aGVzZSBpbiB0aGUgc2FtZSBzZXJpZXMgaXMgdG9vIG11Y2ggYW5kIGlmIHdlIGFncmVl
DQo+IHRoYXQNCj4gDQo+IAlkZXYgPSBjcnRjLT5kZXY7DQo+IA0KPiBpcyB1Z2x5LCB0aGVy
ZSBpcyB0aGVuIGFuIGludGVybWVkaWF0ZSBzdGF0ZSB0aGF0IGVpdGhlciB1c2VkDQo+IA0K
PiAJZHJtID0gY3J0Yy0+ZGV2Ow0KPiANCj4gb3INCj4gDQo+IAlkZXYgPSBjcnRjLT5kcm07
DQo+IA0KPiB0byBmaW5hbHkgcmVhY2gNCj4gDQo+IAlkcm0gPSBjcnRjLT5kcm07DQo+IA0K
PiBJZiB5b3Ugc2VlIGEgYmV0dGVyIHdheSwgcGxlYXNlIGxldCBtZSBrbm93LiBJIGRvbid0
IHNlZSBhbnkuDQoNCklGIHRoaXMgcmVuYW1pbmcgZ2V0cyBhY2NlcHRlZCwgeW91IGNvdWxk
IG1ha2UgYSBzaW5nbGUgcGF0Y2gNCnRoYXQgYWRkcyBhIHVuaW9uIHdpdGggYm90aCBuYW1l
cyB0byBhbGwgYWZmZWN0ZWQgRFJNIGRhdGEgc3RydWN0dXJlcy4NCg0Kc3RydWN0IGRybV9m
b28gew0KICAgdW5pb24gew0KICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOyAvLyB1c2Ug
dGhpcw0KICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2OyAvLyBkb24ndCB1c2UgdGhpcw0K
ICAgfTsNCn0NCg0KVGhhdCBwYXRjaCBwcmVwYXJlcyBhbGwgb2YgRFJNIGZvciB0aGUgcmVu
YW1pbmcuIEFuZCB0aGVuIHlvdSBjYW4gZ28gDQp0aHJvdWdoIGRyaXZlcnMgb25lLWJ5LW9u
ZSB3aXRoIGEgcGF0Y2ggb3IgYSBwYXRjaHNldCBmb3IgZWFjaCB0byBkbyBhbGwgDQp0aGUg
cmVuYW1pbmcgdGhlcmUuIEZpbmFsbHkgeW91IHNlbmQgYW5vdGhlciBEUk0td2lkZSBwYXRj
aCB0byByZW1vdmUgDQp0aGF0IHVuaW9uLg0KDQpUaGF0IHdvdWxkIHNwbGl0IHRoZSBjaGFu
Z2VzIGludG8gc21hbGxlciBwaWVjZXMgd2l0aG91dCB1Z2x5IA0KaW50ZXJtZWRpYXRlIHN0
YXRlLiBJdCBhbHNvIGVhc2VzIHRoZSBwcm9ibGVtIGZvciBiYWNrcG9ydGVycyBhbmQgc3Rh
YmxlIA0KbWFpbnRhaW5lcnMgdGhhdCBoYXZlIHRvIGRlYWwgd2l0aCB0aGUgbmFtZSBjaGFu
Z2VzLg0KDQpJSVJDIHlvdSBhbHJlYWR5IGRpZCBzb21ldGhpbmcgc2ltaWxhciBmb3IgcmVt
b3ZlIG9yIHByb2JlIGNhbGxiYWNrcz8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gQmVzdCByZWdhcmRzDQo+IFV3ZQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFu
eQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRp
ZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------4BjcmN94tJFPnbew80t3HmZ1--

--------------NgbUp7lPRrU2raGl0HjCBZsG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSv1MsFAwAAAAAACgkQlh/E3EQov+Bj
sQ/9Eoan8G/kn4iht+wh0RcXjkmet+CW9MLEruY1lqMpbTM4+KLhPgFk9Kcu4W9mYsR8cYDXAqK8
dqvQbq6AebjjDL0C5/JtooMKiruR0xZl2QTYeuX9eeyChK9THkiKqVMTZhnaMb+2QOP1MJB8VM9V
FbZq2tZoG8NRIenF7e+j5svLmsAeXgmO5xheNvXs4vy0XNA3ukzN4cvNbai0hcQHJiwgbONgzE1U
KSTxIqOVLk+JQSacLX++6Zk7cuUOt9RDP3eVaxI3hkGx8R2Lhc2yvmowjko1usbt9Cixc758duZP
iPwskGiJ+BUrrEjnGUB2xVByXVhG8jnhQsNifO+KA64Ny4Dl7ektpy3ap/CV9y87DxJ1Mm+4p2kw
ss9t1Qb0XmLmGOY9pfwvH3InMHx3mjweuqh1jNrXxiF2TpUpkByyf1KFtWNCuA1zYGzxPLlPIbXA
gS/Gu65yj0kZQnteGMXK6Zw6r7LKopxYlH57g3gEq1NyXSHjCffi8WtW33SY4B7t0tfLwYQPdwx+
vap+iYToMN++m8hjgXOT8rJqRrSwZYFO+5soyu3F1ayjxoXf3v+rmePc+N+pFvb6bvGT0i8MBbJY
y3FhA4jllj3NF2IUAKCdP+rNjhjuTcBrHdsV01wpBO73r7+ezBo8zQIE3fLbYlKHB0xjMG6zBrhE
vTM=
=jloF
-----END PGP SIGNATURE-----

--------------NgbUp7lPRrU2raGl0HjCBZsG--
